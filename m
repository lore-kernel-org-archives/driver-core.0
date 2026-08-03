Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A69323C503;
	Mon,  3 Aug 2026 06:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738036; cv=none; b=hhL7Gymz0VS2QSj1zSULW6jnH3cyFJd/hHP3vWHb5c1h2wzTzBk1HOCr4/teSFrScczpXT4Aes3ZytRA4mHL6KDES66dJ3K/2iWxoLkVKyDa+Y7mJ3QeWeJbVA9zV5/PjtyVnMv7LSNjOnpCztgL9GBHTizfEdp42yGJUOOvyOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738036; c=relaxed/simple;
	bh=mX5r+8RLxU20ExSXT37abjeQRAa0c9gRKUJGRVH+Gnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCRj35rBppnbm0leVWf3BTPvEC7cxCiIXzEilhw+om8Hv//n9xiw3oIX1/QGyz+pzoqZgESc9beQZ4u982sbyDD/KsgBcAtpDq+QoNZg4SZcptTgZmg6SxBQ+MC0v70Gut/tyPqsa0aNahyFfjOJGrPFEWVg1pbQhpjji1vQ5Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pD1YzYxE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pD1YzYxE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8691A1F000E9;
	Mon,  3 Aug 2026 06:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785738035;
	bh=3gRTQEw8E3D44gqM1kO+HFRK4IrU8dlADJ8lS52EBt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pD1YzYxEMIgOccouPoHFI7bGA7ZIyRtUdd31Ss1A9YzE9GjhcxF/lqGZkzd/TjgML
	 EAqDtUVbYg6VU4H15yhwjg+M3Pv3CiCn/n9LgpYrNTxoacfSlSGBtVVs5KIRDTPTme
	 3/yStXPFDkDTewWv3Qk39SgeZhlxrjB3wg7Zoot0=
Date: Mon, 3 Aug 2026 08:19:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yichong Chen <chenyichong@uniontech.com>
Cc: rafael@kernel.org, dakr@kernel.org, djakov@kernel.org,
	quic_mdtipton@quicinc.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] debugfs: serialize debugfs_create_str() writers
Message-ID: <2026080345-bucked-debunk-5b57@gregkh>
References: <20260803060920.812228-1-chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803060920.812228-1-chenyichong@uniontech.com>

On Mon, Aug 03, 2026 at 02:09:20PM +0800, Yichong Chen wrote:
> debugfs_write_file_str() replaces the string pointer backing a
> debugfs_create_str() file and frees the old string after
> synchronize_rcu().
> 
> Concurrent writers can observe the same old pointer before either
> replacement is published. They can then both replace the pointer and
> both free the same old string, which KASAN reports as a double-free.
> 
> Serialize writers with a mutex so only one writer can replace and free
> the old string at a time. Also make readers use rcu_read_lock() and
> rcu_dereference(), matching the existing RCU grace period before the old
> string is freed.
> 
> Fixes: 86b5488121db ("debugfs: Add write support to debugfs_create_str()")
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
> ---
>  fs/debugfs/file.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
> index 08de6652a4f3..566f9ce976b0 100644
> --- a/fs/debugfs/file.c
> +++ b/fs/debugfs/file.c
> @@ -18,6 +18,7 @@
>  #include <linux/slab.h>
>  #include <linux/atomic.h>
>  #include <linux/device.h>
> +#include <linux/mutex.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/poll.h>
>  #include <linux/security.h>
> @@ -1014,6 +1015,8 @@ void debugfs_create_bool(const char *name, umode_t mode, struct dentry *parent,
>  }
>  EXPORT_SYMBOL_GPL(debugfs_create_bool);
>  
> +static DEFINE_MUTEX(debugfs_str_write_mutex);

Ouch, you are doing to serialize _all_ debugfs strings on one lock?

> +
>  ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
>  			      size_t count, loff_t *ppos)
>  {
> @@ -1026,15 +1029,18 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
>  	if (unlikely(ret))
>  		return ret;
>  
> -	str = *(char **)file->private_data;
> +	rcu_read_lock();
> +	str = rcu_dereference(*(char __rcu **)file->private_data);
>  	len = strlen(str) + 1;
> -	copy = kmalloc(len, GFP_KERNEL);
> +	copy = kmalloc(len, GFP_ATOMIC);

This feels wrong :(

>  	if (!copy) {
> +		rcu_read_unlock();
>  		debugfs_file_put(dentry);
>  		return -ENOMEM;
>  	}
>  
>  	copy_len = strscpy(copy, str, len);
> +	rcu_read_unlock();

Wait, why rcu if you have a lock?

>  	debugfs_file_put(dentry);
>  	if (copy_len < 0) {
>  		kfree(copy);
> @@ -1061,7 +1067,9 @@ static ssize_t debugfs_write_file_str(struct file *file, const char __user *user
>  	if (unlikely(r))
>  		return r;
>  
> -	old = *(char **)file->private_data;
> +	mutex_lock(&debugfs_str_write_mutex);

guard() is nicer.

My larger question is, what code is broken because of this?  What
debugfs string replacements are happening?  I hate the string debugfs
code as it has had lots of issues like this over the years so maybe we
should just drop it and force users to "roll their own" implementation
that would be much simpler without the rcu/locking mess at all?

thanks,

greg k-h
