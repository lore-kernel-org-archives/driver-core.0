Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85755D893
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 15:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967034; cv=none; b=nE9idljO8z235q8A7wnpvgLpsNVL6GUj5YqTo6DIh0jHCCMWaf8SpLikDc4DrRGPARRGN823MAratRw+IvZI/hT2fc6nMirBmynRKHUzr0ElMPrKMg3mNBHXoVzPLnZCPzkC9nb5Wfpw5XBFiO/KVIvBZCS+SpnyD/BFUA6icGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967034; c=relaxed/simple;
	bh=50PWHOPz89VAgzShHbqe1+05LKceXOJguW/0waoh4rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNC3RiUQTU3CL6oL09aO6SXdQV0r/mXG6v+CK30fBz9+O/RKtDiPFe9VeS6GfN2hpr2vfFlmVqNPGrcrVjVOBCcI9fRakaPFPvMFAUInLyMszBG/M6yI8R4o7wyO9KZh5g8g0ZPHjuocPCoYDExN27NGdfoZ7ozxJvv1swZS538=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d9197so237610e0c.0
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 08:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967032; x=1789571832;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xngvRGlem5QBe9w72ZS3ISg4Zt8dZwRC6gUDQpCph0s=;
        b=YOtf0HuEKERjRd2ygTP3FtCZUycskNbh/MB6M8Fu8jpSrGdS03I8MO4jZuQVcHRgia
         Ffdni5VysJD1Pl5zUMy10Pxz42B5EaXA9NA19WcLMuzWk8UVj/Nm3S/TORQsbKkUxaJk
         +F54HpcMDisTE/HuLJiIZnOpTw3dQAZ8l8SpWFhjzS8QcPWbBd2Pdo8qHJki4KCE9Uc5
         djNVpMa8zLxRX10eJzOAMo3G9n34gWT5lDh0DKjmx6n3Y11pbblgyUhB2ebBIAywu2sd
         Z6H2ZPk0LU1ewNK+YuM2BzHCiVUXIPoXwHFe3PfjA3lVxEdfJh2Jc0oPMDYox9jYBQp4
         +7qg==
X-Forwarded-Encrypted: i=1; AKwUvBwMfUxFn+/P6u5z7QceHKkxxM0Wwe6cjCDRfblSSWhFi9tq6sY0u9my9ntOK8AkI7hIbB5fd/LRwPDcmw==@lists.linux.dev
X-Gm-Message-State: AFuF++mfbkUHSzvBmgDADiVH3rZ4tvsptl2092LFBSWQU6YRhONK5wG2
	PhO9hW5VfIouFcD+5nqsVe1DP6yg8X717duOb9zthzIeR03nX0qoYoj+1Q08CCRczJyIHw==
X-Gm-Gg: AYBFou2zH7wlQrlo0MM36/h2ybtn68xkTLFF7ZHj4YYH9UwNfTzeLavWLDtWxjn6T0W
	gPSITsEE7jqLDLit0DPmwLKjFiJL9hm83jDFSmZW0dN6MgCwTwFUyNiuwPhalT8SaVsqHNrp+iz
	Yt2kn+OJMThj3TOCC9GNyd3WXQTjw4RVcnvsjXnxanhdOO1d0kz/xhiR1TcslrHfbAcO1IJA1M3
	RuzNLtbuQ0bsIoA5yRlwkEX3EjgfEyTFNYvifdqxVsOoXA3Y+oJCEWuOatsdyUNmQM70a8BH2Yj
	I4vbte6boqXjGOv4XhYjYUNsjgr+OXYnvk43OsYbMoa6JoV/QXRjc5HMJi0LXn8K8q632K3iYjo
	eepu4g5NdbhDI39QgNDd+RUlNsf13ymOxuZilozIxbIrEN7Ht5yZr7DsTtNTn5Wl18fh9AjPotk
	+z8n+iQM64NXi8QHUmcFIj2iLW7BJnPER3mfic88EWFBbnrAzqR/M/nnRzu+psaq4NAVW8GFEiO
	7MYdhMnkUf4tBWSYWempaYelqzAxDfJVFzAFYHenO9X/7n0Lg==
X-Received: by 2002:a05:6122:21a8:b0:5c7:fb4e:2cee with SMTP id 71dfb90a1353d-5c83343f7d2mr1023916e0c.1.1788967031911;
        Wed, 09 Sep 2026 08:17:11 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec23d459sm12498052e0c.9.2026.09.09.08.17.10
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:17:11 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so169350241.1
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 08:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByzrAZ7UC/b5M5LQOyrMT3BFxke9jlVClLWtcBP6Tw/ls5g2ciXqGdKGcKcs/Eof0JKWjZUi7Bt+I1etA==@lists.linux.dev
X-Received: by 2002:a05:6102:159f:b0:77d:e064:2dc1 with SMTP id
 ada2fe7eead31-79072bd65e5mr1021149137.0.1788967030503; Wed, 09 Sep 2026
 08:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:16:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYJ-XSe22QnBREpxJH_hDVfV1CwkVjBqPK9AXTGJE1Aw@mail.gmail.com>
X-Gm-Features: AcwNN1VLF1S9VM_rAd4lsusMxTGZ8B-oUTaocc800YUq_Bw4xg9-nPCuVEjF4tk
Message-ID: <CAMuHMdUYJ-XSe22QnBREpxJH_hDVfV1CwkVjBqPK9AXTGJE1Aw@mail.gmail.com>
Subject: Re: [PATCH 2/4] driver: core: platform: add subsys_platform_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Add a new macro subsys_platform_driver() to eliminate some boilerplate
> code in drivers that need to register earlier in the boot at the
> subsys_initcall level.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -376,6 +389,23 @@ static int __init __platform_driver##_init(void) \
>  } \
>  device_initcall(__platform_driver##_init); \
>
> +/*
> + * subsys_platform_driver_probe() - Helper macro for drivers that don't do
> + * anything special in device init and have no exit, but need to register
> + * earlier, at subsys_initcall level.  This eliminates some boilerplate.  Each
> + * driver may only use this macro once, and using it replaces subsys_initcall.
> + * This is meant to be a parallel of builtin_platform_driver_probe above, but
> + * with the init call promoted to subsys_initcall so the provider is available
> + * earlier during boot.
> + */
> +#define subsys_platform_driver_probe(__platform_driver, __platform_probe) \
> +static int __init __platform_driver##_init(void) \
> +{ \
> +       return platform_driver_probe(&(__platform_driver), \
> +                                    __platform_probe);    \
> +} \
> +subsys_initcall(__platform_driver##_init) \

Nit: The backslash is not needed.
Yeah, builtin_platform_driver_probe() has it, too...

> +
>  #define platform_create_bundle(driver, probe, res, n_res, data, size) \
>         __platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE, KBUILD_MODNAME)
>  extern struct platform_device *__platform_create_bundle(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
