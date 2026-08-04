Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D5A413790
	for <driver-core@lists.linux.dev>; Tue,  4 Aug 2026 08:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830772; cv=none; b=Gwc/zHYRk/iArw2KdB1IJZE6Jmn5mIyQw7lMRpsnadHFexit0l6+tr8qZOHy/s727Hn+kIC1BL57i/NWNVl7QexgC3IHhdIPISLQIrndfZ1VcTxF877x/C6gEZgbQPhzkTCw0wWt6pMhwzd86lXX60I0ekKw6mhDzHiMNmGFLic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830772; c=relaxed/simple;
	bh=MVVKP78YlyvBivjm/FAklbGYYY8cS4jJQzm2/4HHWug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=swVRxVm5cp9pMiVO88nXXlAju5TKnD/xvSlKDGQTWNOgBZwkYnSw+22vgr1ElnQT/rnBifgkb0EIbr5Dhpi9VHfBEd9tyJ+V25UDT4q/NkcNs+10mqyGBHG3+0KO/QFgMulrlNDvixg74XiMpQpncnQgQtq+Sc+kjCNLq8byxt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AwqY4Tou; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AwqY4Tou"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47485fde05aso2767503f8f.0
        for <driver-core@lists.linux.dev>; Tue, 04 Aug 2026 01:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785830769; x=1786435569; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teTYxUWmHQCyWrHWF5GYbye4/UxtKhpRLE5s5SK2UzI=;
        b=AwqY4TouCosTqcvv5Vv9866Xi2I0iCVo1W2I4/CdutMMVxN21JJRlBQ7EqWTLaFNFw
         ohsV5s1IuWAolnEvyMN3XwNtvbvJi/12fhzS/eWLNq79l5sgDyxjgXD3k/VgJ/ybOPy1
         dTm5K3odwcabrb2g8wvTopoJxySqfsZBgbZqDjyuSQXv4wh3hsswBhOXgqgFMI4um8LL
         fQk8WtURhNGkaV8LZlKjHEAXYYytHGaPVC9Q0rk2omj3E8lq9ZGe3i3+v1ZkPi98UmDv
         /K1kvgWd3qiLWG4nRh+X5MVFXpvQascLedzMT7Sn9kBG7TeQm4kuadsnV6E2zPTP9LGU
         QvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785830769; x=1786435569;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teTYxUWmHQCyWrHWF5GYbye4/UxtKhpRLE5s5SK2UzI=;
        b=EeqX8rfQHUVUxuEYQIXMM9otq2ujOIQqAwB289V1IrvLo3mGblKLMMOOyHBoghi0UM
         N+GV+3fNqydn5Ef8uyy1HEzkHsMHEoxFU18r1FpIk9WlAbOWCbjK49bY86+wXD8Q4C9d
         WzaFOUkwbK7vOBC+hKjtWB+NWodkoMShjNb4VJenBgtZGBhNGyYBxBqpDE+OZejLBR9U
         TAi+lPiARO0JI8j/COqI8wFLiYC77YyHGjp+MQAelDXT9FkGIS9ZU8QU/8S0s7+TLpxj
         GQMyHMEs11wQCURW2S1QoDxM9YmYXZPGN58agcfSM/miMVhi2jw8SkIzYzuer6RJcvIj
         SsmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3EYMFf6zW/+ygLA1Uor93Ny+CuQfEADwxjdWCoHK8br25ArzEpwNmnBhsIQD0U4nR230vnKk4sdTWAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBrER8+pgbHz6GP8y+UM/FYLu2PINt5Z9BPeGsgWDpW7/7qCrY
	qm8YLJcMaoUe5V1tF+Z4+BQEHc5AW6QQ3BOFCv5h5DYXftSyOuQDpC2OOJaelKfiAmcUWCGG8c2
	ZEUirB1ZgaL/3VSBzdQ==
X-Received: from wrwz3.prod.google.com ([2002:a05:6000:1103:b0:47f:2943:2f1f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2282:b0:47f:e76a:e8cc with SMTP id ffacd0b85a97d-47fe76ae95emr8683087f8f.22.1785830768095;
 Tue, 04 Aug 2026 01:06:08 -0700 (PDT)
Date: Tue, 4 Aug 2026 08:06:07 +0000
In-Reply-To: <20260721153617.869933-2-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260721153617.869933-1-beata.michalska@arm.com> <20260721153617.869933-2-beata.michalska@arm.com>
Message-ID: <anGdb0C_j-OUsDVJ@google.com>
Subject: Re: [PATCH v2 1/3] rust: add runtime PM support
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

On Tue, Jul 21, 2026 at 05:34:02PM +0200, Beata Michalska wrote:
> diff --git a/rust/helpers/pm_runtime.c b/rust/helpers/pm_runtime.c
> new file mode 100644
> index 000000000000..d0d71fcb0097
> --- /dev/null
> +++ b/rust/helpers/pm_runtime.c
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/pm_runtime.h>
> +
> +__rust_helper void rust_helper_pm_runtime_get_noresume(struct device *dev)
> +{
> +	pm_runtime_get_noresume(dev);
> +}
> +
> +__rust_helper void rust_helper_pm_runtime_put_noidle(struct device *dev)
> +{
> +	pm_runtime_put_noidle(dev);
> +}

Should this file be wrapped in `#ifdef !CONFIG_PM` or similar?

> +/// Runtime Power Management modes that determine how a particular PM
> +/// transition is to be carried out.
> +/// Corresponds to C Runtime PM flag argument bits:
> +/// - `RPM_ASYNC`
> +/// - `RPM_NOWAIT`
> +/// - `RPM_GET_PUT`
> +/// - `RPM_AUTO`
> +#[derive(Clone, Copy, PartialEq, Eq, Debug)]
> +struct Mode(u32);

Nit: we have a macro for bit flags.

See for example:
https://lore.kernel.org/rust-for-linux/20260719-b4-rust_binder_impl_flags-v3-0-f8d0b3ea1b87@google.com/

> +#[cfg(CONFIG_PM)]
> +impl Request {
> +    ...
> +}
> +
> +#[cfg(not(CONFIG_PM))]
> +impl Request {
> +    ...
> +}

Doesn't your rust/helpers file already handle these for you? The methods
exist as stubs in the C header on not(CONFIG_PM), I think?

Alice
