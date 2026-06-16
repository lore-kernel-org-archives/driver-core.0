Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB2135AC28
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 09:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602741; cv=none; b=iPGyEJpbNmvdkFnVWxzTmJx3CyWzvJUnwCkJ2/wWF2FoFGbQ/3MJi/LhEctSTe7275rH0YrL4M47wf7ONy+tp6dgR9B56hPwWTEnCKJAiNTvFxkOq+g5wV1LHUxjFTE+SfbjXt6R1CiLEA0dTtaWFK/zSGdxVe6pnHjVy/hPg5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602741; c=relaxed/simple;
	bh=NuPggMjggCwnf/atk4cLroQYMMiv5zt6lnN2OsPlXec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfUYwbaLIs0nFCqAwwUTR6fE7MZ0gJCw8meKDrOoUfaHU3dB3nSH8sDJJXOZ6leVK7VQsC95zfoqrDC1xGpvz8FvTjuGo1zjzHbc1X1UCm3v3n/0640gEgWS8KgHwm4rnKqq3mxf4mCaUd20iXpbF/Ifz+JTYizvZBCIozu1aG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kba8e1m0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kba8e1m0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FA71F000E9;
	Tue, 16 Jun 2026 09:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781602739;
	bh=/eBoWMtngjxpKHsqvaMcjISMKIfHZYaCTn503UfnAvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kba8e1m0u4/vaADwz/aFC9kTzqiWJ0TEBv2kek/U/S8HvdvMoCRBxPmBL74uQ5qXZ
	 P+CNumJj+OYW0sT+fOg8DF4feE7vfMmm6ArL1PXtD1RLtS7OP4Z/j/54b8OXwn51+8
	 ictNcReO+PED55ruqEIUaZbslvmNbyM/k+zJHLnY=
Date: Tue, 16 Jun 2026 15:07:55 +0530
From: Greg KH <gregkh@linuxfoundation.org>
To: Li Jun <lijun01@kylinos.cn>
Cc: rafael@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] driver core: Add error handling in
 virtual_device_parent()
Message-ID: <2026061658-grandpa-repulsion-f752@gregkh>
References: <20260616082528.1220652-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616082528.1220652-1-lijun01@kylinos.cn>

On Tue, Jun 16, 2026 at 04:25:28PM +0800, Li Jun wrote:
> The virtual_device_parent() function calls kobject_create_and_add()
> without checking its return value. If memory allocation fails,
> kobject_create_and_add() returns NULL, which would be propagated
> to the caller without any error indication.in get_device_parent
> call virtual_device_parent, if return NULL for parent_kobj,
> 'k->parent == parent_kobj'in list_for_each_entry, will always false.
> 
> Add proper error handling to return -ENOMEM when
> kobject_create_and_add() fails, so callers can detect and handle
> the error appropriately.
> 
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  drivers/base/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 4d026682944f..50c3131b7106 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3249,9 +3249,10 @@ struct kobject *virtual_device_parent(void)
>  {
>  	static struct kobject *virtual_dir = NULL;
>  
> -	if (!virtual_dir)
> -		virtual_dir = kobject_create_and_add("virtual",
> +	virtual_dir = kobject_create_and_add("virtual",
>  						     &devices_kset->kobj);
> +	if (!virtual_dir)
> +		return -ENOMEM;

Are you sure this is correct?  I think you just broke the callers of
this function, how did you test this?

How was this "found"?

thanks,

greg k-h
