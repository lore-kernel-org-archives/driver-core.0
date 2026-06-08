Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8043378833;
	Mon,  8 Jun 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921619; cv=none; b=o7yjWvDe2RrHYMVqaQdkZ/0c1/PQXlIGrii1qMTmkXKWPQQpxWZgsWnzLIch5F9nvZqmYOtFmD67WpxVzoPNNQLYJkb3BKu758yopauVFPoosNDWjdzSj0TNn0emVmgoU00xCnPNDDc/9tvsDtQhFWxD2JteucOVUtkD7OJYJZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921619; c=relaxed/simple;
	bh=2Ie67ptNkmui2tO8GQcK+SeQ0S2VuMXcmKX1tNifmoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTPDVnwpOuDFfv2nA42S4wvfTWnoXN7iRf+fCNRl1Vh0mVl6OcIHdKxhK39qED5yVW9met+lTvk9ZUluRBEJmeIu8oVJEuwwsJwWsbrpuf6BLSimscj2GSffnZriVy6pcBYvJADhjELJEUiGTewJYQ5dXFpsYc8hDXwOvWmgdy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NAKNCu3o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NAKNCu3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7DE1F00893;
	Mon,  8 Jun 2026 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780921618;
	bh=zGiAVbaQ3Q9FaFqxQTB/hNL2mfhDYc5aS0FFWxnPr1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NAKNCu3ofNXw71XGt6Rt8F2NDxVbcdJ+tXsRo3TBF0sDDMRaNqw0qWX4EzNz8K4XR
	 C87m0yu6qtcklgQAchu/WNdZnHJk9TYQQ4bOWoB7/3294XyzJBMLREyVRybshQ7G2p
	 vJVfA+MsQY7e3MWYzka2sC6a8e0Gj0VcA/SHgKEo=
Date: Mon, 8 Jun 2026 14:25:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernfs: use nofail allocation for global locks
Message-ID: <2026060819-harvest-sterility-ad7f@gregkh>
References: <20260608063655.69-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608063655.69-1-ruoyuw560@gmail.com>

On Mon, Jun 08, 2026 at 02:36:55PM +0800, Ruoyu Wang wrote:
> kernfs_lock_init() allocates the global kernfs lock storage during init
> and then calls kernfs_mutex_init(), which initializes mutexes through the
> allocated pointer. A WARN_ON() does not stop execution, so allocation
> failure would still dereference NULL.

Yes, but as this never has failed, perhaps it's not a real issue?  :)

> The lock storage is required for kernfs to operate. Use a nofail
> GFP_KERNEL allocation so the init path does not continue without the
> required object.

Have you ever triggered this code path?  If so, how?

> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  fs/kernfs/mount.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
> index 6e3217b6e4811..6cf8e71e5bd08 100644
> --- a/fs/kernfs/mount.c
> +++ b/fs/kernfs/mount.c
> @@ -451,8 +451,8 @@ static void __init kernfs_mutex_init(void)
>  
>  static void __init kernfs_lock_init(void)
>  {
> -	kernfs_locks = kmalloc_obj(struct kernfs_global_locks);
> -	WARN_ON(!kernfs_locks);

As this is at boot time, if this fails, and triggers and oops, the
system has much worse problems.  I do not think that:

> +	kernfs_locks = kmalloc_obj(struct kernfs_global_locks,
> +				   GFP_KERNEL | __GFP_NOFAIL);

Will help out any, do you?

thanks,

greg k-h
