Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2F93C0635;
	Fri, 31 Jul 2026 11:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785496441; cv=none; b=cb9ZuXqPPdUer/HkOyLXSCvIeGxSesHYS97XHT44Nwlv+1z8MJGUwtlBtNeIpcN5RXJuiXM8/OLn54pJVbtNKdlF61NeUz0a3ATLAH5UAwT27XWV3vCqRLtrwaDhj7s9pAXbhfdeNVKzwp7molaQnRDMSsppHgMKpq9r1RQFC98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785496441; c=relaxed/simple;
	bh=aKmlAzsjVCqcqUrIFE8Tjbl8uY935NRG2okKbodDIwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfqELBgB2u/hNctN/2sP9O+xWpEsCbCPrI93Ythslx/4o6gK1dxwBcat/yNzD5GfyNSkrDd30C4Mr2ZZ7PGE/sl1gQZbQnn54ljXzPxUgCbwLys5Dx9tuhCTrEYcV1YyZYMyyAG6KX0SWbeGnJn+7VuMUYQUB4chk8GDnGCG8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hb4CWDBc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hb4CWDBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E001F00A3A;
	Fri, 31 Jul 2026 11:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785496439;
	bh=ZZd2wFsI0vlTOOBAoX8RxjCDRXUNV2ld6JlcnZHaHTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hb4CWDBc0hvvu5doj0wMk16qo745TFHJLIfxLAAyK2jTKxSIji92eGQWP5GP4iKv7
	 Bd6VEZA8E1XBINFIbLzxcAFihIiIukpRy1GtMtlFEDTXQ6AxX0Ur4t8E0g1azham7q
	 6bQvzlVcMRiUsvV1T1Foh+j0nY+64j+N1kBMexqo=
Date: Fri, 31 Jul 2026 13:13:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kevin Mitchell <kevmitch@arista.com>
Cc: Tejun Heo <tj@kernel.org>, Chengming Zhou <zhouchengming@bytedance.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kernfs: fix race to increment for nr_mmapped in
 kernfs_fop_mmap()
Message-ID: <2026073129-tarmac-causation-98a9@gregkh>
References: <20260731010914.233067-2-kevmitch@arista.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731010914.233067-2-kevmitch@arista.com>

On Thu, Jul 30, 2026 at 06:09:12PM -0700, Kevin Mitchell wrote:
> Counts of files to be released (nr_to_release) and mmapped (nr_mmapped)
> files were added to kernfs_open_node in commit bdb2fd7fc56e ("kernfs:
> Skip kernfs_drain_open_files() more aggressively") to optimize
> kernfs_drain_open_files(). A WARN_ON_ONCE sanity check was also added in
> kernfs_drain_open_files() to ensure that these counters were brought to
> zero once all files had been drained.
> 
> Modifications to these counters were protected by kernfs_open_file_mutex
> everywhere except for in kernfs_fop_mmap(). This caused a race condition
> where some nr_mmapped increments could get overwritten even while the
> correct number of kernfs_open_files with mmapped == true were present in
> the kernfs_open_node's files list. Consequently, the iteration in
> kernfs_drain_open_files() would underflow nr_mmapped and the WARNING
> would fire.
> 
> To fix this, acquire kernfs_open_file_mutex around nr_mmapped updates in
> kernfs_fop_mmap.
> 
> The nesting of->mutex -> kernfs_open_file_mutex is safe as
> kernfs_open_file_mutex is acquired last avoiding the possible cycles
> highlighted in commit f83f3c515654 ("kernfs: fix locking around
> kernfs_ops->release() callback").
> 
> Fixes: bdb2fd7fc56e ("kernfs: Skip kernfs_drain_open_files() more aggressively")
> Signed-off-by: Kevin Mitchell <kevmitch@arista.com>
> ---
> Changes in v2:
> - Rework the approach to use kernfs_open_file_mutex_lock instead of
>   atomics based on feedback from Greg KH.
> - Link to v1: https://lore.kernel.org/all/20251119191758.612694-2-kevmitch@arista.com
> 
>  fs/kernfs/file.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
> index 8e0e90c93372..6f63eb6be1cd 100644
> --- a/fs/kernfs/file.c
> +++ b/fs/kernfs/file.c
> @@ -495,8 +495,12 @@ static int kernfs_fop_mmap(struct file *file, struct vm_area_struct *vma)
>  
>  	rc = 0;
>  	if (!of->mmapped) {
> -		of->mmapped = true;
> +		struct mutex *mutex = kernfs_open_file_mutex_lock(of->kn);
> +
>  		of_on(of)->nr_mmapped++;
> +		mutex_unlock(mutex)
> +;
> +		of->mmapped = true;
>  		of->vm_ops = vma->vm_ops;
>  	}
>  	vma->vm_ops = &kernfs_vm_ops;
> -- 
> 2.51.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
