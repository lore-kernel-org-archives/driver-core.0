Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF2A3FE655
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539593; cv=none; b=hyj+bnCMOKcZXt3V59ssR9siHml/X4aOQJao/zneKP+lUIvZixLf15CEOrXb5tGKqofthImSAtVzG68JQ1qzZ3lCx1uImn8qfyGE5HhFHQG924fvj6ccIMLO6fxjUdfotZKS4TvjdaQ/w7hPbFgZpt2mpng0ish2miNGmn+g85c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539593; c=relaxed/simple;
	bh=jp/hUMChxA1VSSMiat+e3i7CMZl6lcNiNtA23ddcB0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=od/eYXtwXWOpDkBmykAmLZz+0GNqanz4Gx2TFvKS8woqz7ktlmVMGR3ckXMD1RL0CvunHvZkfZMno5I1/OEY2BDruj9J3QDjQqghzySWifFEQVVhQYwqzrzD0WRYVo3VPld8ci7FlAAtrrvAEzXILlkGy6eI8eDMzO/L3PGn6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bf0pl2/x; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bf0pl2/x"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43efc93e4f6so419216f8f.3
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777539586; x=1778144386; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mEMfx8leu6g7NgiHRZ9yJ+jKk4ymcYL2rSstPz5qTo=;
        b=bf0pl2/xCPoS6RoRFXa68g6jSN+UNTD0qaMpjzyOPxUBmMFfMesp3mlk9pdklbXWDo
         11fL1LNgwM7Dm8oBT1Nl6EEzHn3V2LGWNoo3OZrnL9U3mUV/qFh64A99gj/WqHqVbLOe
         hBTB+WyFl8EeNDPE+9mLtOBGBKGiGuaqfxTweYOUtMSnNuJVBAj04DyHMg0mI6oBttB8
         RaBo0jDtH9i/uMcoerCFhgQM6oeLCMylefZxDzjfCzKS7I21X8dfcJYTAVOZwfWZ9NzJ
         BmGPC6Fs0S2hwoWL0xMXVFOdXmoWi4H9uNC8qv2ZvcPzsuO99SBvICnox8E40cA6uh0o
         L8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539586; x=1778144386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mEMfx8leu6g7NgiHRZ9yJ+jKk4ymcYL2rSstPz5qTo=;
        b=UzrWQ0yjJeVA86b3VEWiXNooimzmB5unqsLcIxCXqBe5AxRqyfBAq8USuvOY+EKmzS
         BeNQYkOc1S90O7NRX62gST7oyH1msBkY2ZBVJDmDiSZng1i+dQoVwRt6X2jlYHow208j
         SOJWTMdc7a1RcZnk7QBLjBFaRCGNdUIEWqrcROKO/hZQpWtuVw3/cUleaZVCWHiE6L6g
         hs/KgaD96e3bpB3th2TVxCUVPjkPL8bnqGyYKmvGPgs44xySQNrLeMx1U9M06d+lHK1q
         rk1CWVknxDQUYX+2T/VALiQR162I3Q4MG3Cw+ojojsKgz9Y6tzYl5cYFFO8V264srKYh
         WaTw==
X-Forwarded-Encrypted: i=1; AFNElJ+gtT6M8VdiLzTKOY5UtlWy/mP3nncrqFppOeAg8cDSjWXf+Ux5TUDBDSR0mejGD5G3J2mSb2Lx/tjSUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUOQPIGkKC3k6cvzLaLtp7sjCanWClqlqChG9GJPe4WiFPy7vy
	1KhmmB4wSnWPvRVmbkL0X21m3iHOFzf/uZAbPETq2359xB+3H6/3O0gZVPjtWWi5gm7yDcs93WB
	XNpWjFdUs8SJBRgp5qA==
X-Received: from wmbb16.prod.google.com ([2002:a05:600c:5890:b0:48a:65a5:c693])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8206:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-48a83d6c224mr34454735e9.10.1777539585931;
 Thu, 30 Apr 2026 01:59:45 -0700 (PDT)
Date: Thu, 30 Apr 2026 08:59:45 +0000
In-Reply-To: <20260427221002.2143861-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260427221002.2143861-1-dakr@kernel.org> <20260427221002.2143861-2-dakr@kernel.org>
Message-ID: <afMaAfcxpDR3xIE1@google.com>
Subject: Re: [PATCH 1/2] rust: auxiliary: add registration data to auxiliary devices
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 28, 2026 at 12:09:40AM +0200, Danilo Krummrich wrote:
> Add a registration_data pointer to struct auxiliary_device, allowing the
> registering (parent) driver to attach private data to the device at
> registration time and retrieve it later when called back by the
> auxiliary (child) driver.
> 
> By tying the data to the device's registration, Rust drivers can bind
> the lifetime of device resources to it, since the auxiliary bus
> guarantees that the parent driver remains bound while the auxiliary
> device is bound.
> 
> On the Rust side, Registration<T> takes ownership of the data via
> ForeignOwnable. A TypeId is stored alongside the data for runtime type
> checking, making Device::registration_data<T>() a safe method.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

So overall I think this patch makes sense. A few comments below.

> diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
> index bc09b55e3682..4e1ad8ccbcdd 100644
> --- a/include/linux/auxiliary_bus.h
> +++ b/include/linux/auxiliary_bus.h
> @@ -62,6 +62,9 @@
>   * @sysfs.irqs: irqs xarray contains irq indices which are used by the device,
>   * @sysfs.lock: Synchronize irq sysfs creation,
>   * @sysfs.irq_dir_exists: whether "irqs" directory exists,
> + * @registration_data_rust: private data owned by the registering (parent)
> + *                          driver; valid for as long as the device is
> + *                          registered with the driver core,
>   *
>   * An auxiliary_device represents a part of its parent device's functionality.
>   * It is given a name that, combined with the registering drivers
> @@ -148,6 +151,7 @@ struct auxiliary_device {
>  		struct mutex lock; /* Synchronize irq sysfs creation */
>  		bool irq_dir_exists;
>  	} sysfs;
> +	void *registration_data_rust;

Is this really Rust-specific? Would you not want C drivers with the same
pattern to do the same thing?

> +        // SAFETY: `ptr` is non-null and was set via `into_foreign()` in `Registration::new()`;
> +        // `RegistrationData` is `#[repr(C)]` with `type_id` at offset 0, so reading a `TypeId`
> +        // at the start of the allocation is valid regardless of `T`.
> +        let type_id = unsafe { ptr.cast::<TypeId>().read() };
> +        if type_id != TypeId::of::<T>() {
> +            return Err(EINVAL);
> +        }

Right, okay, so if you put C stuff there, we need the layout to be
compatible with Rust type ids.

Still, we could have Rust expose a couple methods to allow C code to use
the same field with a null type id.

But I guess this is all future work.

> +        let data = KBox::pin_init::<Error>(
> +            try_pin_init!(RegistrationData {
> +                type_id: TypeId::of::<T>(),
> +                data <- data,
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        let boxed = KBox::new(Opaque::<bindings::auxiliary_device>::zeroed(), GFP_KERNEL)?;

Use __GFP_ZERO here instead?

> +        // SAFETY:
> +        // - `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`, which
> +        //   has been initialized,
> +        // - `modname.as_char_ptr()` is a NULL terminated string.
> +        let ret = unsafe { bindings::__auxiliary_device_add(adev, modname.as_char_ptr()) };
> +        if ret != 0 {
> +            // SAFETY: `registration_data` was set above via `into_foreign()`.
> +            let _ = unsafe {
> +                Pin::<KBox<RegistrationData<T>>>::from_foreign((*adev).registration_data_rust)
> +            };

Nit: Please use `drop(unsafe { ... })` to explicitly drop.

Alice
