Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F0A42BC38
	for <driver-core@lists.linux.dev>; Tue,  4 Aug 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830537; cv=none; b=t/dFipNE+e74HpK2642QokHWtjk8ifoY2XTF7RBcNz89xuxjk+E6Wfy2A0y8hL0zuCNFViJ05kdWqCZHuIXKYsQ51lFFsqTmn+1ZTW3XuvSjKmyCjvk/qbWCy82svTKUgo91ecqFL4bsR1FOMU1IAligB3rJRgP6NJpsCoSy1A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830537; c=relaxed/simple;
	bh=CB5SYoKg/5ZxEr5pPhwxBoe4hMu1CcWGN7cso8dfp4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qja0pNvV0kG3FHOVcXmvxC5yfPe+RC6FezCDxr5BGjb4XOIMIEJu299U4TIvolmgDmsB6s7PWLgCQHqfEZ9fjEbE0MR1jaNDoIIpBrNMuMjvGmx7IG60kiR7ehO4FNaMNrWbsUJWt0zEOfuAkgGEx6VMrbe6papS5T/2YgSadEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vGX233ew; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vGX233ew"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4954a93c565so16978675e9.2
        for <driver-core@lists.linux.dev>; Tue, 04 Aug 2026 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785830533; x=1786435333; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEJITv1WcGLvr9b4sfSYJz2GZb00MTzVJtJ1pz53UrA=;
        b=vGX233ewfKtTE4NHgql+RNNkOOAVOuVraEFgoacc8lzjfWDh9EH85Ktn93but41eQI
         wNYs7SBdDXrZYMlR6h06gdXX60FTLVOtd9PiVSKZOYSP/gDDRl5CJ1XSxXqBE9jc1EnH
         x+i/vzQTXV3XkoLzPxwYqwz7yan5UakCL5bDj0S1ozYI676HDAzPn7Omt5rfRxH8LynU
         +ybMyPcZRpxXfMRL/7SEWyuerqGEW9Uh/PNm8zVSl23aeBK+oFXfebGTDf+yIjEq1YQX
         F7Ci+7cL61f7W3DuD6SUx+n6mp7U8YTIX6kTwoYNcp2FFo+R46qI+rPMCZoooVs8fDsU
         W8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785830533; x=1786435333;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEJITv1WcGLvr9b4sfSYJz2GZb00MTzVJtJ1pz53UrA=;
        b=hYdzKW9DNyvtMiO26pZG30HCRTkfZdUUYB5TfNbEWjG5w1JhlaWYcbDRCsccTkCIRM
         WyYDGq1zhEdyVHDYBqcT6KzdiRmWwJ1tpd85/LdL//5iySinN2XINcq7ocW7IMEc1hBR
         ghXe8IeyuC2ySx18QkQeWb76KInC/qJVOd4nOowOZjRn45cD75EWaldketMDpq+e6kxq
         tAITSkhnWZggKgweSfk76nUf/orKaIGFkuZERRDJf9dGD3xMPv4qhJUS6Nk2SUCGlB6u
         kff7q0LVLRKBHVrwfoKuHbkSLnhcPx9cvNnkEpmPcUWDi9YhdZIvl2pA3c5fjc0YIBPz
         lPnw==
X-Forwarded-Encrypted: i=1; AHgh+RrIkCvKASsYoGSr3Q+4rxbzIpmVVR4p1OKtvxKl/PGrU8lQo+RcAlC4DGTYqTNXGbmK5yOfa3Yxy2hsSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxWCmeqM+T8ijWh+GEvq7pCcu4CZpyKDMneFHh361Q2NbRCmoa
	Nyf4PEWRndFwb2fE5Lps7hjJwpRZFg6xuQz4d6kzFQIK0+79amFqerHA1Y4STY1RRcxz05eehkn
	6JQAIUuOaM6Kg1DS2tA==
X-Received: from wmpx38.prod.google.com ([2002:a05:600c:18a6:b0:495:49a0:9476])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f84:b0:496:bbcb:b0bb with SMTP id 5b1f17b1804b1-4980c674e31mr299591655e9.18.1785830532277;
 Tue, 04 Aug 2026 01:02:12 -0700 (PDT)
Date: Tue, 4 Aug 2026 08:02:11 +0000
In-Reply-To: <20260721153617.869933-3-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260721153617.869933-1-beata.michalska@arm.com> <20260721153617.869933-3-beata.michalska@arm.com>
Message-ID: <anGcgxwNXz5_RzD1@google.com>
Subject: Re: [PATCH v2 2/3] rust: platform: wire runtime PM callbacks
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 21, 2026 at 05:34:03PM +0200, Beata Michalska wrote:
> Allow Rust platform drivers to expose runtime PM callbacks to the driver core.
> 
> The runtime PM abstraction builds a dev_pm_ops table for the concrete driver
> implementation, but the platform bus still needs to receive that table through
> struct platform_driver. Add an optional PM_OPS associated constant to
> platform::Driver and initialize the coresponding C device_driver struct
> accordingly during registration. The platform glue only wires the callback
> table into the C driver model; ownership of the callback payload and
> runtime PM teardown remain with the pm module.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  rust/kernel/platform.rs | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
> index d8d48f60b0b9..b7e422388634 100644
> --- a/rust/kernel/platform.rs
> +++ b/rust/kernel/platform.rs
> @@ -72,6 +72,11 @@ unsafe fn register(
>              None => core::ptr::null(),
>          };
>  
> +        let pm_ops = match T::PM_OPS {
> +            Some(ops) => ops,
> +            None => core::ptr::null(),
> +        };

This value is just any user-provided &bindings::pm_ops, which I think is
too lax. There is no guarantee that the Registration and the PM_OPS
table agree on what the type T is, which can lead to type confusion.

Most likely, you must instead give `trait Driver` an associated type
saying "the PmOps type is this particular type", and then here you can
do `Some(T::PM_OPS)` to actually get the associated table.

And then in the registration, you can further require that the types
also match there. E.g., maybe make the registration generic over the
Driver type and then the inner type T is just D::PmData or similar.

Alice

>          // SAFETY: It's safe to set the fields of `struct platform_driver` on initialization.
>          unsafe {
>              (*pdrv.get()).driver.name = name.as_char_ptr();
> @@ -79,6 +84,7 @@ unsafe fn register(
>              (*pdrv.get()).remove = Some(Self::remove_callback);
>              (*pdrv.get()).driver.of_match_table = of_table;
>              (*pdrv.get()).driver.acpi_match_table = acpi_table;
> +            (*pdrv.get()).driver.pm = pm_ops;
>          }
>  
>          // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
> @@ -222,6 +228,9 @@ pub trait Driver {
>      /// The table of ACPI device ids supported by the driver.
>      const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
>  
> +    /// Runtime PM callbacks
> +    const PM_OPS: Option<&'static bindings::dev_pm_ops> = None;
> +
>      /// Platform driver probe.
>      ///
>      /// Called when a new platform device is added or discovered.
> -- 
> 2.43.0
> 
