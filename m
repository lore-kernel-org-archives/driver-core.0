Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8029F37C911
	for <driver-core@lists.linux.dev>; Mon, 13 Apr 2026 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776052720; cv=none; b=O3BVJicxMDE/EzcNJZ/HpMGq35bz2qIVRsddvZa8ynYsa4iTr1usCkVzVh02C5QOtD3jcrXAHPweWRTOS2fmCj3U0dT0tJT63jnFPDdFFmM7MIRy0SgnN1oayDtW7FJ8fTaJFvvPrHlkPXTiE8KPUeLpiPn7j6pOHMSBS2SKM6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776052720; c=relaxed/simple;
	bh=q6Fg8aFIwSBBkrdIbWDYN2Qg/+XFIv/XYOlevHI46mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q70nKGsVZ3a8JhRxYtdr45Du61WxDSDjOOOYu3LyaaKmwiqABbL/K4OONTVw1eIEC66oCAPfnTZ+HM7Ch8HenNy3EWyVdonrM/f4n5/1bvCs6iapjSImavnvTwWVx0dvPOeSsFahw3hZbW/BMsVIg5B6vQThqOMx5n5RPvzSrOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h7bLJOPC; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h7bLJOPC"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c648bc907ebso2804529a12.3
        for <driver-core@lists.linux.dev>; Sun, 12 Apr 2026 20:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776052719; x=1776657519; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fr/lzenYvIspGVOBd9qA8LexXmTvhf6tDNuKiRhUvmY=;
        b=h7bLJOPCHpyHwHAm8TdVujh1CH3bxvVJycwuVyLGAtmIqcnIxCmZwkMDrINA91v2WT
         K5rZ/jGCX1Qi3GXbUNy/NzHWQhJEpWb9pdm9E7VSWn88SQDuAvhqiH6VDJgj794oUCHa
         n1Uq0ibhJXUdv6G7FZzxEqWgI4a4hYhs7rFNjpTBQP1Sk5r8OaLIdsn4nFbIqpFYZ7L+
         ChqPJBHBXRzsnNo0vor7Mo2sHuASLne815qipedjYh/5xMQ9WurPN6zvrKfSEAHXS1H8
         fHAPLJyNpnBH55YgPk3IryHpB9yxdQ5hFY/YQsLZ/L8QU8GqpNGIvuQIJxv9E11PEWj2
         aG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776052719; x=1776657519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fr/lzenYvIspGVOBd9qA8LexXmTvhf6tDNuKiRhUvmY=;
        b=jQGT1j0sgTizR5d8VyhQdRNqx6A3cLLQwmGJRKVJRE1ATijs2LzAOKXcedaQHTmlip
         8wWnU0LMfr7w7Xo1DF8NdCs7N+hiXX+b6QHYhNtWNfngZwwnu+h3LZ6Yc/JMHtoNA4Ye
         ZW4J/U5lcXUfD6DxCIOeJZTo1pYnKUEcjJWv0P/RBBZ6BVNKlGVHcGK1rHWdEezzvADG
         6oFu40Z7goSHtrU0AibfJyURmDGsYeQHRuCj0elK4QEXgWyjnYCFLGlHSVKmYWFLJ7p/
         xGiCHUiaVFH6cMrv7cCGHavzaB95RjM+MfJrVNv2U8cLbfgb/S61nEZ8FutVE99s4z6K
         Pgwg==
X-Forwarded-Encrypted: i=1; AFNElJ8dTK/BFWXHvLWenhyutKpc9YK9paosUTXANK/JiOpJeW85Hc08a0pVmY8eE24ZvwgPl2FJZ79/RgaImw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwiDQCrF1xeeL3pvKj9bYYkr0t5o14GfyjWY03eB/HKjbc9sxxb
	YWUGMbpfbRIBzAVozSjeGiaR1Jt63jt8dT2VbtXETpCDglbA2DXtvSKMvxPGbWUF6gY=
X-Gm-Gg: AeBDieutDkGiuvlQZS6/kJnV1DdLVv+aD7RYZTVixoQ4SJCgVNK+ilTgN+9RXtnT9FD
	ZplNU1eg7k9GMPi3IKCf4wg5F9ecwgoYaVG0BoF4ZOKnm7Qxhje9j++3OViQD+ejK+vWQ8xcrqD
	vUAnA5JS0/PNPT9psCmnJGP/THNu3GuyCxeYhhsdZGswIfeZrnuhyIcm4kov8yUob1r7OtSbpoK
	I0MUXY0M5z6yMTXU8kFvNXwBWWZWAmkKHpEGb/NjE7E7tSgcJozjo2XSQdp6/CIi/kS5o9I7zws
	tW4wssBhVneF39fXUdq7eSPPDNSWy8+PPiaNNsKLMeT/0kxqdnOWPzzcdPBsmWdKWGASYB3vi+n
	34e56VXylWmFHQKbC42YvIfHexgeP1b1Ddym01bows0XUudJU+iWwShyXk/VgjoGNYocnSys3KL
	ezFhtgG1Gwb5Y3u297pl2aQfeJ
X-Received: by 2002:a05:6a20:3ca2:b0:39b:e138:e230 with SMTP id adf61e73a8af0-39fe3cf7579mr12869459637.13.1776052718668;
        Sun, 12 Apr 2026 20:58:38 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0f8a7501sm9627799b3a.50.2026.04.12.20.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 20:58:37 -0700 (PDT)
Date: Mon, 13 Apr 2026 09:28:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: markus.probst@posteo.de
Cc: Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Kari Argillander <kari.argillander@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/4] rust: devres: return reference in
 `devres::register`
Message-ID: <gm76z4ngcpgbi4f7xym25n423wmvdac3meou4lefd26hgqqp2p@aziculojtqan>
References: <20260411-rust_serdev-v4-0-845e960c6627@posteo.de>
 <20260411-rust_serdev-v4-1-845e960c6627@posteo.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-rust_serdev-v4-1-845e960c6627@posteo.de>

On 11-04-26, 17:10, Markus Probst via B4 Relay wrote:
> From: Markus Probst <markus.probst@posteo.de>
> 
> Return the reference to the initialized data in the `devres::register`
> function.
> 
> This is needed in a following commit (rust: add basic serial device bus
> abstractions).
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  rust/kernel/cpufreq.rs    |  3 ++-
>  rust/kernel/devres.rs     | 15 +++++++++++++--
>  rust/kernel/drm/driver.rs |  3 ++-
>  3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index f5adee48d40c..31bf7e685097 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1052,7 +1052,8 @@ pub fn new_foreign_owned(dev: &Device<Bound>) -> Result
>      where
>          T: 'static,
>      {
> -        devres::register(dev, Self::new()?, GFP_KERNEL)
> +        devres::register(dev, Self::new()?, GFP_KERNEL)?;
> +        Ok(())
>      }
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
