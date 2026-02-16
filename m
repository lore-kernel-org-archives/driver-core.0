Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA3A35949
	for <driver-core@lists.linux.dev>; Mon, 16 Feb 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771259269; cv=none; b=hYbms06q3Ftc73mY7jRxcBm4t19/Vq2AxoRIhESo56uxp+OsdPH6u4TV+aRGzkQBltjvOyOaxm00tlYjXHWmyvoUswiG0yFnqLXDSpMClVSpmIyyJskLkbzm15RSJVWNKJomb25KTiX/2oErOXlR+Mx+OutYX1ktZAPyPCDSvnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771259269; c=relaxed/simple;
	bh=uK0yhrheAWp+1HFKdzB6+HC7KQxXpCfeyD8TYNIEf8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8Du4J7eEPKxTOftcwSDcIZZHe4ZYwYxptU8U2fMyaOEp9Ed02lBZH2qNIdX+LeUEr1LbT02XLBBWXwDRMOVNySZtd9ibpvG5QX+Gnfc518IZSveuLt2r2rrEh96tc5jncsNcgo63Wn5PVRAtCi1aTlfIsMBaR0Wi8bhGYADTO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUxANhJe; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUxANhJe"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso28757475e9.3
        for <driver-core@lists.linux.dev>; Mon, 16 Feb 2026 08:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259267; x=1771864067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=psgHVJWvQ0vhmy9UM6Py2oOFm9j9yzqcdlkiRgF10nA=;
        b=eUxANhJe3UCvZB9ENHQV+4c1I4B4tOMHTh0USR++7lSs3nCcDzQ1hMRMusazI/EFtz
         nwPOsdretpzTjgOkRQhcLgQBDCSUknGkrryTmk0h4Lm/1v5XYZpvEc+UDFV1yfC3NMKD
         NhtitBZ5X4wzxayhA+eouRGBJzAZlbevAESyEkIJ8PvcxF76JWnMQ7d3kinQ6z3cT9PO
         JJrNMs2A+gzUc+wz37LuAuj1x0KbA+CzGoBik+xiqHDbzVTsbQd6ByLNd5YFeF/12PHO
         NH3IwvDdZeklfqDERgjs1uNsI0qxdyouV1f6qRisKN6PrItzhURrHpPcgwDew5yPgD6/
         hS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259267; x=1771864067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psgHVJWvQ0vhmy9UM6Py2oOFm9j9yzqcdlkiRgF10nA=;
        b=DLu+YsAwIuLhcJoZmDN4xu6aYc1+ZUi7ZYsEckI84ieAxbQG5whlNYEm/o+HvZshYy
         qf1ho/HwtSq57Dxwr5SllYlND+zmpht6wuYuAA3ymM86x4ZfzWPrXXqDS+iUWqYbc2Tz
         xD2C39JoZuKg6l/2Fu6Qx317McAvrtuxk4jrFK2hMFi5uxQoj76m+xG5SB0L1m6plUFL
         3aSMnbVWBK3yuS+ZDnAHOE+en+Zh+YWtPamYKEBuT08KaJ81pXWPUq9GfDc7cah8a9MH
         4yCTUg9EKkr/r0rA7LNf09jaJBTSkTDpi6hpSRe/x8nRzykXXTGiEnyxlTnkGffZcOIm
         MNdA==
X-Forwarded-Encrypted: i=1; AJvYcCUBnKhC/TVGl+35QhAX9Zx25j+9yooNzIDzp4wLw5YnD5pMC06eAdJbHRV1n9xuYr0Wo0ANTVmo+Le6Bg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlesfL0W9C1dnPGgyHFdsU+dwxLj2qCGLJIcbkl62NOzmfparQ
	6NRYwfcVrPvkcbPOSSeATuHrkzNv/fm2ntZjnbcBvgh0+bA4CSRZjHZn
X-Gm-Gg: AZuq6aKzpSDpM4KDr6PRd2ONHs99gozt+dIp+TvPNoLVJS8CzWzrh/Pocx8p+fOdcf8
	KbnN42KBvwE5Cy5cw+SVwVHtYhXeMX1xMr7iIlwJJ7WyQQ8LLkFxge20h9XoLgmXGo7mCmAMjuT
	SiipPJpLIRTd3ji/qUaeGJYjz8QyT9VPxBkFaQC9Dw0tzqoQdhGpAZ5bSKgaGiq4BlmJHrMpXy2
	lbtpfehgSUa6bFe/ok6XZvzYP5NJhuZTZUWrZJUiYi6WyirZVVoDZU5VeptfooqSPMoLloQDbab
	3YvX17d05QPiMD0Z7CVQWFgolde74HXWSQrP2hU6fFezllM0zVC4/hzDWTepkBix7Zw0yHHrd8S
	jmQyr2bMn2MsWllOUt98vA7CzC3C9oBH2+GBR3HAUe9QF+xSd/jV47C8QnmFXPPo4/H1L0Qgz6D
	5OCztjKRlDdmPJhpUExowDT6fmFTLEBYn87xyBMmah5bjPzqclc5huodJZ
X-Received: by 2002:a05:600c:1f92:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-48379bfd727mr142402445e9.17.1771259266651;
        Mon, 16 Feb 2026 08:27:46 -0800 (PST)
Received: from localhost (bzq-166-168-31-253.red.bezeqint.net. [31.168.166.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e327sm441915175e9.14.2026.02.16.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:27:46 -0800 (PST)
Date: Mon, 16 Feb 2026 18:27:45 +0200
From: Amir Goldstein <amir73il@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, jack@suse.cz
Subject: Re: [PATCH v2 1/3] kernfs: allow passing fsnotify event types
Message-ID: <aZNFTR_gc6j116rw@amir-ThinkPad-T480>
References: <20260212215814.629709-1-tjmercier@google.com>
 <20260212215814.629709-2-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212215814.629709-2-tjmercier@google.com>

On Thu, Feb 12, 2026 at 01:58:12PM -0800, T.J. Mercier wrote:
> The kernfs_notify function is hardcoded to only issue FS_MODIFY events
> since that is the only current use case. Allow for supporting other
> events by adding a notify_event field to kernfs_elem_attr. The
> limitation of only one queued event per kernfs_node continues to exist
> as a consequence of the design of the kernfs_notify_list. The new
> notify_event field is protected by the same kernfs_notify_lock as the
> existing notify_next field.
> 
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Looks fine
Feel free to add
Acked-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/kernfs/file.c       | 8 ++++++--
>  include/linux/kernfs.h | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
> index 9adf36e6364b..e978284ff983 100644
> --- a/fs/kernfs/file.c
> +++ b/fs/kernfs/file.c
> @@ -914,6 +914,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
>  	struct kernfs_node *kn;
>  	struct kernfs_super_info *info;
>  	struct kernfs_root *root;
> +	u32 notify_event;
>  repeat:
>  	/* pop one off the notify_list */
>  	spin_lock_irq(&kernfs_notify_lock);
> @@ -924,6 +925,8 @@ static void kernfs_notify_workfn(struct work_struct *work)
>  	}
>  	kernfs_notify_list = kn->attr.notify_next;
>  	kn->attr.notify_next = NULL;
> +	notify_event = kn->attr.notify_event;
> +	kn->attr.notify_event = 0;
>  	spin_unlock_irq(&kernfs_notify_lock);
>  
>  	root = kernfs_root(kn);
> @@ -954,7 +957,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
>  		if (parent) {
>  			p_inode = ilookup(info->sb, kernfs_ino(parent));
>  			if (p_inode) {
> -				fsnotify(FS_MODIFY | FS_EVENT_ON_CHILD,
> +				fsnotify(notify_event | FS_EVENT_ON_CHILD,
>  					 inode, FSNOTIFY_EVENT_INODE,
>  					 p_inode, &name, inode, 0);
>  				iput(p_inode);
> @@ -964,7 +967,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
>  		}
>  
>  		if (!p_inode)
> -			fsnotify_inode(inode, FS_MODIFY);
> +			fsnotify_inode(inode, notify_event);
>  
>  		iput(inode);
>  	}
> @@ -1005,6 +1008,7 @@ void kernfs_notify(struct kernfs_node *kn)
>  	if (!kn->attr.notify_next) {
>  		kernfs_get(kn);
>  		kn->attr.notify_next = kernfs_notify_list;
> +		kn->attr.notify_event = FS_MODIFY;
>  		kernfs_notify_list = kn;
>  		schedule_work(&kernfs_notify_work);
>  	}
> diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
> index b5a5f32fdfd1..1762b32c1a8e 100644
> --- a/include/linux/kernfs.h
> +++ b/include/linux/kernfs.h
> @@ -181,6 +181,7 @@ struct kernfs_elem_attr {
>  	struct kernfs_open_node __rcu	*open;
>  	loff_t			size;
>  	struct kernfs_node	*notify_next;	/* for kernfs_notify() */
> +	u32			notify_event;   /* for kernfs_notify() */
>  };
>  
>  /*
> -- 
> 2.53.0.273.g2a3d683680-goog
> 
