Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEB03BE62B
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196385; cv=pass; b=qNdJ2zpzk6s4AnkdsmYJSaEWA8NiW2IHDQ/afV/WIi8ThgsTMhIyqVx4MJXzevywTcD+bQvGk39G+SdiBK6apeoWuLLBEKd+ecXETNyG0rsLRHByW4vkOCncpdeaDf9+C8nwFdulILfzM8HcPsAyfsZzBt5BuI+4exrsOXNFE+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196385; c=relaxed/simple;
	bh=dqGtg+mnG8PDzjEBYN0xjpinHAPPQz0T2s5ZOkF+58M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtI0Ej/7sEm8ngNx4j2Be4UYLtqODeHKnqXera04Wnmh30mm8H0oTwd9eMsf6XBuCLmDF5Ru0ziKQfwRaGf2YZWQ/oyimasFnL2Ld+zUEpw6cclMWu3jkGZZfyApl7ljuzdhZmT4pnsHWOeobUuUy331Xz8cH8gJ4KKdJCsYRM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbAaeLDz; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbAaeLDz"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc73e322dbso78448775ad.1
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 03:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784196383; cv=none;
        d=google.com; s=arc-20260327;
        b=cF3MoIl058xid/KjV2PW9h5HK7QUfPBm13VO01wqLltGpIb8FmsnfSo1wZhgqKP1O7
         dqbAlmev7pAHLLwoX1EPZch91r872jAo02vIn3+ho9jCpZr5oNaQmtZgBR2xTox/sPkj
         NYx4XkhCqZ29ege0B4zi5OlvnwWZOFKKQSlcjpE8PDA8yXneFw1M/w95nuKX3Kkvt1g9
         dqyu0TlUkLa1KFKsyXC1W9L/FCehG7ls6Ey4KHod0iWL8HAUF9gwGB3iSpqg8OpjsXrl
         IC623Q08dNKG/TTyBdPvu/jlfUatbILCWnnDxlVQaG9WharNIjDrkNVlhnKTsbTq14tR
         S/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dqGtg+mnG8PDzjEBYN0xjpinHAPPQz0T2s5ZOkF+58M=;
        fh=DwYrR26p9V6CuqjWll0bAgh/f1dW8UjH3RTonltsg0A=;
        b=SsYRl5g0B5s+00mRVVyHLjVQrINvVkuhnsRVsZD2O29Nm0CgVKwql+H95MFqupNADy
         HMixhAa94xHYfGWKHsD3gm6itFvunTtMKOM4NpJIES7ca/GXb3xyhfRj5zFMZ+Pf1XIZ
         /X9cdCHfLQLccwPqutQWgeUTQ7F5rd3/HKLmZQRHm3rWRnqaj6McPBkQtXulb+Ckqhio
         gEp64x5QodlgFBUPdmwzB+zaXhCElLNPqVA68fnTcZ0kUhBU91eKvHjxrAYxjUoxHqFF
         qUD5EoLpL6aImvxunyxRG3yfJWRTBvPkmFN60CizmtRVAgDx1LSq1HX3YDxEnG6dH3gn
         Z1rQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784196383; x=1784801183; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqGtg+mnG8PDzjEBYN0xjpinHAPPQz0T2s5ZOkF+58M=;
        b=JbAaeLDzEXceX2zqrMW4y9ze1OQsNAefAkK5BRwrYAlDpJUSdedHRs39WjGOBxlMrq
         zXMeMnm9sXz0gUBCwNcwjr7y5nM+Ye2MdBr+kcHZplf55HHFCdOVkcOsN0ZY6+GVPU8i
         oaDWBRGl2Lio3ov8Or3eD0TVbaiEGzShhn1Lxz8NpJkB+eRM5DrV2r1SVpkA59/NZoCk
         kC9XGw53lNDmh4e/ztCzXG5zMds28xrJ5w+vbn8s7bkxsxqnnRTrCrN3YHEjC7dS76e4
         EPGGAhAKEemq3Dq4DY13MH2aI43xUMKDzPMkNZS8Ji+/k+oVtvYITj/Qr7sem6lUd3lm
         zuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196383; x=1784801183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dqGtg+mnG8PDzjEBYN0xjpinHAPPQz0T2s5ZOkF+58M=;
        b=XQv9s9KAgOAV2ZBZNLMQb32r9D62+KfguERVQ8AT/3AKZrTeEBVrNDtLD0sfkVhz/C
         F9ZuC7qfo4KQLxwWP2JwpvaPZP6pWutJwwLk71yL5XivFOQCdJICOJ5ATbnxGRNCNHEh
         RFeCiy0z3azh8Lkr3zwy3VzDeDRQkkXIZT/GUirOCvhYCq5Vv11f89x0X22DqVGolHFl
         ELaNdNqVkxGAI2H7VW+hgZNvPv2ly/9NjQ6xkaMK152Sl0fg4eA5FDq/RTKbYnZZDDnN
         99/ys5iHxvlGbnkC8ZlhcmI/DMgQq5PdzMOUHHJqZ/A+9GQTw4EnbmuRB/cenwDao8Zb
         r4Qw==
X-Forwarded-Encrypted: i=1; AHgh+RpQXB2QJcRyLwmLK4WQVZgSUYF8AvnksF4+wAcrvd48QnNButF2dvnSEqjE6jDV4OSCAL8mtAs4LeX/9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHTdqgd4WPK0on3xpOD2E7bViPgJmkxFMp22NvTZpDF6UZrO5A
	2RwqdDEAKINLybkh0YQdL39S6PjLfbO8eBk2JCerd2yTfh9rIJQHd4OYHzKJuKRHPpJaAP1juN1
	X5H1FoxugDXwySLkMoW6Iz8FyTTpcrpMEJW8K
X-Gm-Gg: AfdE7ckOIrmE6HxKTuN92ZbcjTlDSvdUPg/7TaBgEOFANqkM6ILB+r65zibMNODNkv4
	0w5tFkaqUs7v9v8Wl6iUxp1jUZdFu6HYndC8+uZnk1s5NjFz1VKGsDB7+QudYHtiXqC1lOjw0Ov
	L+ct6Yk2NuMXD46pVFHunEBPDUxCNbDb9J0fn/ig9qp8OpuE0FQm5W8PLiM7LjWaVAJKFX6LVTb
	fLFp/fUizvJFNKVPYjckLBKtsW+lg/fmVedcoj9w5dmXJrhlcPhZYQMo+VYO9dsE43y4yT9j1t+
	r9fqAAFKqMWSVSFWH3selqHBBs4=
X-Received: by 2002:a17:903:3201:b0:2ca:d975:5bbd with SMTP id
 d9443c01a7336-2cf03cde9c8mr64272125ad.20.1784196383407; Thu, 16 Jul 2026
 03:06:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715052100.24983-1-phucduc.bui@gmail.com> <4e43250d-85eb-4019-b092-039e10e84ae1@sirena.org.uk>
In-Reply-To: <4e43250d-85eb-4019-b092-039e10e84ae1@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 16 Jul 2026 17:06:12 +0700
X-Gm-Features: AUfX_mzO927vZvuZ9FK8seb9ojWBWoAV9djWSoBVhydBIQTrteruMtfHlTVESSk
Message-ID: <CAABR9nE=eYDfd8rJpOGyhC3d5E1tteUW+7vgHBBWKpU4sN8PUw@mail.gmail.com>
Subject: Re: [PATCH] regcache: Warn if regcache_sync() is called in cache_only mode
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

>
> The check needs to be done under lock otherwise some other thread could
> come in and put the regmap into cache only mode between the check and
> when we take the lock.
>
> We also need a similar check in regcache_sync_region().

I'll move the check under the lock for v2, and add the same check to
regcache_sync_region() as well.

On top of that, I'd like to ask about a design question:
Should regcache_sync() set map->cache_only = true again if it fails
partway through,
or should we leave it to the caller to call regcache_cache_only() themselves?

If we leave it to the caller, should we also update the function's
documentation
to make clear that after a failed sync, the state of the registers is no longer
guaranteed to match the cache, and that further register access should be
done carefully , and that calling regcache_cache_only() is recommended to
keep the device in a safe/consistent state?

Best regards,
Phuc
