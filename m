Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4121146588
	for <driver-core@lists.linux.dev>; Mon,  4 May 2026 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777907799; cv=none; b=rkstQqj2/OZ42+A6dXZz4MossBXFaaqB+lB0r1WgLzKKTi70szt21QF55mEDSmFAyGFwYRm2anOQmeQITg+wpyULGXs4IddY0psaUNqUTJFDRCBqBpQQK/WWLrTEpQom9kncKVl6FHBCpE0mxthYIeWqoiOaDdv17Xk3I41EwTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777907799; c=relaxed/simple;
	bh=i/4hYMFf//svTflcq9f9gKFs+2rGtotqjH1ofCdpbP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoFvPtPifM+25lCk5inTFqwVQWZ5cZiP0wNUdVs4ekNptmwxCCex3rG/aBWcOEG7wbY21UYQZMYe6DjTsXGs1GiqKFrzMS2LNfVuvJKtv6iO6KGkYfn/z/rTB3MhIjxOvY4i9skVW3pyFNsTUAzjRBvyDbpEukt7HA1R8k3TyiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HhnBy3Pv; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HhnBy3Pv"
Date: Mon, 4 May 2026 09:16:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777907795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bfwD5Irdem1njLTO4qcSxhBNtYSz/64bwE1nCVFo0kM=;
	b=HhnBy3Pvznh/jfbaqwnrS3Sr1LgnK9907GuwDqCeA7BJiUuV/C0L53j3p0tPlo2ceNmbOF
	kxH+qVW8EopVYJkr5PxfSFnV3aRpW2P9sW+dFuliPm9WaXEAoX1UsueOSw55Y5a72fTn4c
	UGUggb9SGS78EM+UNMJVtFXt8DL+BY4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] firmware_loader: fix device reference leak in
 firmware_upload_register()
Message-ID: <lmyvhhsg5f6cwkjuyt3ugvch2beahrau43sz66bkrzyuwpbqtn@ts3oawaepou3>
References: <20260418070220.64542-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418070220.64542-1-lgs201920130244@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Apr 18, 2026 at 03:02:20PM +0800, Guangshuo Li wrote:
> firmware_upload_register()
>   -> fw_create_instance()
>      -> device_initialize()
> 
> After fw_create_instance() succeeds, the lifetime of the embedded struct
> device is expected to be managed through the device core reference
> counting, since fw_create_instance() has already called
> device_initialize().
> 
> In firmware_upload_register(), if alloc_lookup_fw_priv() fails after
> fw_create_instance() succeeds, the code reaches free_fw_sysfs and frees
> fw_sysfs directly instead of releasing the device reference with
> put_device(). This may leave the reference count of the embedded struct
> device unbalanced, resulting in a refcount leak.
> 
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review. Fix this by using put_device(fw_dev) in the
> failure path and letting fw_dev_release() handle the final cleanup,
> instead of freeing the instance directly from the error path.
> 
> Fixes: 97730bbb242c ("firmware_loader: Add firmware-upload support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Russ Weight <russ.weight@linux.dev>

> ---
>  drivers/base/firmware_loader/sysfs_upload.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
> index f59a7856934c..a6dab34b22d8 100644
> --- a/drivers/base/firmware_loader/sysfs_upload.c
> +++ b/drivers/base/firmware_loader/sysfs_upload.c
> @@ -351,7 +351,8 @@ firmware_upload_register(struct module *module, struct device *parent,
>  	if (ret != 0) {
>  		if (ret > 0)
>  			ret = -EINVAL;
> -		goto free_fw_sysfs;
> +		put_device(fw_dev);
> +		goto exit_module_put;
>  	}
>  	fw_priv->is_paged_buf = true;
>  	fw_sysfs->fw_priv = fw_priv;
> @@ -365,9 +366,6 @@ firmware_upload_register(struct module *module, struct device *parent,
>  
>  	return fw_upload;
>  
> -free_fw_sysfs:
> -	kfree(fw_sysfs);
> -
>  free_fw_upload_priv:
>  	kfree(fw_upload_priv);
>  
> -- 
> 2.43.0
> 
