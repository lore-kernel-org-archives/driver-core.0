Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3122D9787
	for <driver-core@lists.linux.dev>; Fri, 17 Apr 2026 23:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468132; cv=none; b=E2avj+Y3PMCBe0127XekfDUBSTcEROX5UctxfhZ/dntzKlWRWH8mth5ZTCaQc3fSJKKSK7wOnaJTvHql0aV0Z9l6jxQX/qCF6NYXfglxNhkfUmhZn9dS29eWF4Bk4tAS/rBgkwTZjzeP/BxyzFA4fxoAieiqT3h+Hmk+LJfTfNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468132; c=relaxed/simple;
	bh=Hsc7iuHeJPybBTZwDnnuXYIlD+9wmrLJ9iyjFMp0zcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BslawQ+vf8Xlylq+ht9DbHQmr+Ji7a8nYCdgiRlG1Qy2lQV405qgPUUwQWP+uSSiax+AcDunPwm3cchNn8R8HB8/Lh/giAvK2e5Tu50SfmsAY7VxR1JEEHAYHEHIX4EnZrxbp5wunD/9NdfuXGHufQ2A5VGfGOqMoMuCS7kH9/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nANWeg8a; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nANWeg8a"
Date: Fri, 17 Apr 2026 17:22:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776468127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GouYhYP+Vg/V5xduMEG9471OG89qh2jPe2ZlHrxDMlk=;
	b=nANWeg8aKPXdPm1qfRXMyp0DgIGtKY3GYnbFImYzHIrt57kxcPMDuYiqL/SzWA9EFsncST
	65HAwa0y9QjrZvoUk8rjJG6JJxQomuyNeQTym1A8OG6+bAz8mPbpcwvTBZYlwuTINPxhP7
	fawTbn45umMzEbQW5cdERESWqyaxc2c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] firmware_loader: fix device reference leak in
 firmware_upload_register()
Message-ID: <mmcqvvqqq2yj65adm2prscpnxtbp5tljaxtbiqrwlfwpwd3slg@xniqactlghfc>
References: <20260415085109.3267323-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415085109.3267323-1-lgs201920130244@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 15, 2026 at 04:51:09PM +0800, Guangshuo Li wrote:
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
> ---
>  drivers/base/firmware_loader/sysfs_upload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
> index f59a7856934c..6b701185dcb6 100644
> --- a/drivers/base/firmware_loader/sysfs_upload.c
> +++ b/drivers/base/firmware_loader/sysfs_upload.c
> @@ -366,7 +366,8 @@ firmware_upload_register(struct module *module, struct device *parent,
>  	return fw_upload;
>  
>  free_fw_sysfs:
> -	kfree(fw_sysfs);
> +	put_device(fw_dev);
> +	goto exit_module_put;

Thanks for the patch!

Given that the free_fw_sysfs target is used only once and no longer
falls through, I suggest we remove the free_fw_sysfs target
altogether.

Instead of:
        goto free_fw_sysfs;

Do:
        put_device(fw_dev);
        goto exit_module_put;

- Russ

>  
>  free_fw_upload_priv:
>  	kfree(fw_upload_priv);
> -- 
> 2.43.0
> 
