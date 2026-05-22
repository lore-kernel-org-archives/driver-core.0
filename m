Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D8E3D9691
	for <driver-core@lists.linux.dev>; Fri, 22 May 2026 11:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449198; cv=none; b=sBBVUh57YjY+n8n5iN2QiCkTlLirsqzVkCumDptnVTBSjYYCdTPp9f+9z2MwsE7bah4iRRfDQK38YVWDwLNhzPxqptuue6cxpNtk7kOqlzwfIejHxnXlQLDtrO3Yznsdf/HyM460g7jNxJ3RuaBH5zgJiXkcEu8kz0aCQCR3ETo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449198; c=relaxed/simple;
	bh=doqFlSt1GBqo2oDq9NCkGxsOchO3nblsukvKhQjS2CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAsDpGupzqnk3TvHtNoo6pneehsrYyeXkBDy3iFpjX2hA4LNntLF+oki98XcNqPTQtN6y5TdyukEK5oqX2bqeaW4co79kjDWB5v2IEjbBNNoLf57/JlVOEvfpU6qSRaGQFcB5ZK6HJ2EESN9jmMZ5UDembz3Ju4Fsj37i6ZFYt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nPNr3BR6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nPNr3BR6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B691F000E9;
	Fri, 22 May 2026 11:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779449196;
	bh=cTNNXVK2GH2zBAXMT0+w0BQeroG40nDAYeK9PJoX1m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nPNr3BR6BAXi7WgIL1jfxZqiZw86/5XOm6rOwQGZ285gw9VpYvj9sesRRhYoQHP+J
	 qnz3FfAP92KD1fKrADAGMkaQUIXWGqVbJIoakWE4+pTu0c8p0P20UpVjKNZAq8yf5q
	 BTAcDYiNXlDXo3CVNg/RHnOytQqRfW4BKN9YzKYg=
Date: Fri, 22 May 2026 13:26:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paul Martin <paul.martin@codethink.co.uk>
Cc: driver-core@lists.linux.dev, rafael@kernel.org, dakr@kernel.org
Subject: Re: [PATCH] Fix debugfs error returns to match documentation and
 vice versa
Message-ID: <2026052214-dime-drudge-479c@gregkh>
References: <20260506165819.58974-1-paul.martin@codethink.co.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506165819.58974-1-paul.martin@codethink.co.uk>

On Wed, May 06, 2026 at 05:58:19PM +0100, Paul Martin wrote:
> Many of debugfs's exported functions call `debugfs_start_creating()`
> and return the errors it returns.  These differ from the documentation
> in that:
> 
> - `ERR_PTR(-EPERM)` is returned if debugfs is present in the kernel
>   but has been disabled by configuration or boot option.
> 
> - `ERR_PTR(-ENOENT)` is returned if debugfs is not registered in the
>   kernel.
> 
> At no point does it return `ERR_PTR(-ENODEV)`.
> 
> This patch fixes the returned error in the second scenario to match
> the documentation and also the documentation to mention the returned
> error for the first scenario.
> 
> The comment block above `debugfs_lookup()` says it returns
> `ERR_PTR(-ENODEV)` if debugfs is not enabled, but instead it returns
> NULL.  This patch fixes the code to match the documentation.
> ---
>  Documentation/filesystems/debugfs.rst |  4 +++-
>  fs/debugfs/inode.c                    | 13 +++++++++++--
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/debugfs.rst b/Documentation/filesystems/debugfs.rst
> index 55f807293924..b092b0015b98 100644
> --- a/Documentation/filesystems/debugfs.rst
> +++ b/Documentation/filesystems/debugfs.rst
> @@ -41,7 +41,9 @@ dentry pointer which can be used to create files in the directory (and to
>  clean it up at the end).  An ERR_PTR(-ERROR) return value indicates that
>  something went wrong.  If ERR_PTR(-ENODEV) is returned, that is an
>  indication that the kernel has been built without debugfs support and none
> -of the functions described below will work.
> +of the functions described below will work.  If ERR_PTR(-EPERM) is returned
> +debugfs support was compiled in but has been disabled by default in the
> +kernel configuration or by passing ``debugfs=off`` on the kernel commandline.
>  
>  The most general way to create a file within a debugfs directory is with::
>  
> diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
> index 4598142355b9..fc521bf9f191 100644
> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c
> @@ -346,7 +346,10 @@ struct dentry *debugfs_lookup(const char *name, struct dentry *parent)
>  {
>  	struct dentry *dentry;
>  
> -	if (!debugfs_initialized() || IS_ERR_OR_NULL(name) || IS_ERR(parent))
> +	if (!debugfs_initialized() || !debugfs_enabled)
> +		return ERR_PTR(-ENODEV);
> +
> +	if (IS_ERR_OR_NULL(name) || IS_ERR(parent))
>  		return NULL;
>  
>  	if (!parent)
> @@ -369,7 +372,7 @@ static struct dentry *debugfs_start_creating(const char *name,
>  		return ERR_PTR(-EPERM);
>  
>  	if (!debugfs_initialized())
> -		return ERR_PTR(-ENOENT);
> +		return ERR_PTR(-ENODEV);
>  
>  	pr_debug("creating file '%s'\n", name);
>  
> @@ -562,6 +565,9 @@ EXPORT_SYMBOL_GPL(debugfs_create_file_size);
>   * If debugfs is not enabled in the kernel, the value -%ENODEV will be
>   * returned.
>   *
> + * If debugfs is enabled in the kernel but disabled by configuration,
> + * the value -%EPERM will be returned.
> + *
>   * NOTE: it's expected that most callers should _ignore_ the errors returned
>   * by this function. Other debugfs functions handle the fact that the "dentry"
>   * passed to them could be an error and they don't crash in that case.
> @@ -659,6 +665,9 @@ EXPORT_SYMBOL(debugfs_create_automount);
>   *
>   * If debugfs is not enabled in the kernel, the value -%ENODEV will be
>   * returned.
> + *
> + * If debugfs is enabled in the kernel but disabled by configuration,
> + * the value -%EPERM will be returned.
>   */
>  struct dentry *debugfs_create_symlink(const char *name, struct dentry *parent,
>  				      const char *target)
> -- 
> 2.53.0
> 
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
