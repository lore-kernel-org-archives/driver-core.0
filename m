Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098073DFC74
	for <driver-core@lists.linux.dev>; Mon,  4 May 2026 18:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920238; cv=pass; b=G54w7cXpdxcMowna8oclcDxzeZx7VbG/ixbnQNB/cuK7f9eruruQyAEXrDR7dPCYVPDP6e6x/rvot7SvtS1eCX5xYJvQBhPGfaL9heu1clZtKxzjxJNEJph7PM/2xw1L1EVhFnJwPSHwkinUuPKlXCoUQfbq+w3zF0/AUalp3K4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920238; c=relaxed/simple;
	bh=lSynTiYI8CS+Dz8+cJPut2vQT9F9qIWMrxO2xn7wBcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0bIxy6WdWNw3VAVesLFEi3OGVNqVRyjZrJALeNpsd91K/I1i3DI1J8KDaA1blCb7nrwc5wngl7JjGN13Rbgw8acEgJ+TgdADWSfnUDz063TmORNaCbIe4sDTnQZMatgGkzUcfcN4+BHSEqy8pHOAnQpiIGBcYY9ToMWXJTMRdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IAZ7fztw; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAZ7fztw"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so12593161fa.1
        for <driver-core@lists.linux.dev>; Mon, 04 May 2026 11:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777920235; cv=none;
        d=google.com; s=arc-20240605;
        b=KBRZwfOGK97Qtnm3OrJy6TeP8fP8Xk2cGko/VF8N/8Fr5l4DzfgOeW8MjpM3n2CHb7
         phtPamgWIhH1FkKtlNHyMi9uBY2+Hcy7n05/2fLJcT7Js3gFtfTyloOccnhXjUuSdjtr
         NbpX/imA5HXpZ20wiwqO0edsWbXjp4eW51SYx9pJZJvZzpzjX5HLKji/Vullhhoy6s9N
         46HguEHmnNgeCLFcNyOawc+Wko+81OAXOgaIXjVbLFQyWALCa6p/Of32b2qBPsaCP+Ab
         1OXUqoc22bMkVW8yonzAaQPIiB2D2o5ghuY0fy/hvD9JZLVjD9JqXGr8IizO2Ae1trw2
         ZlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lSynTiYI8CS+Dz8+cJPut2vQT9F9qIWMrxO2xn7wBcI=;
        fh=bOKh/XdTpEGwGf/q+kevak80DtK79GsI0f+o1lZVMtc=;
        b=VllaS2hlvThWBNVM8Nujt7lWzD/F5UPN5BgjyO8uW27aw2ND99L20Jhi7In9EjBg7a
         Vpw84kS/YsdMTWt9VMGGE07g2Igx8uMaUoH58B7xwmiw6WwVReVJOjqoO4XVyC1jseb9
         U3Zjn+gBMY0QOGKu2UUayxS/tOyNOeJ150Kt+/u8Bdf4jfOzXdoKe4pn49NKyEyR0YkH
         F69XTXReggasQypJIaQkw6GONb48w7xfvTyQ3LWFWgEuMQa38sqm+4k3tUrqiKs8q4/7
         vsNvmSNf6veodWsFbC4AOMmkG8GjUOnIXMOx1h3Utv+Sh1UIL50PCsK2f8/dbTPmZQql
         EMIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777920235; x=1778525035; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lSynTiYI8CS+Dz8+cJPut2vQT9F9qIWMrxO2xn7wBcI=;
        b=IAZ7fztwqIThuU+LLa+NCuh9KOedH0E2Cz7k4KLGcKgYOwfs03+EpY8rViB3nWbJU2
         +YUbulNfzhw7iYQcnJwf16+09RUSCvfZ+vte4tltKpb/wC34R2ubYAbrOYkGVkkDXzV8
         kkdLbPENl0DtUD3Ew9A/9PjFRY4jogXpwYo5JN+DAeGhRA4hwhZSzlA4IYRZ14xwlt8J
         DN+rXxem4Dcwg9KY4We8lZdCqVv1KuhBiw0nAN3KfvdIftvP1nxz732cBMleJ/2CnX2f
         OBcrARycjq3xOpi6ntaKpww4yCUvkTqJ/Stfbic6SvIRMUQWiABfWFYQ5vvUA1aSiqtC
         39fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777920235; x=1778525035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSynTiYI8CS+Dz8+cJPut2vQT9F9qIWMrxO2xn7wBcI=;
        b=YVN6XKCo86tReUNYVTasa0nwMcRI1WYP3DcuDqXhhfzIFw8et1ctgAyc0mJsnJqClB
         TleT71xID7+3/y9Ep0rsrfVWBGo2tbJ2GT6CZqRBN+Q9PqYeaMH82NG/9faEqeIXpHil
         9dTRbyu/Ji5u0RJHx6GDFOcN7T3BRuRcrTG3LkJ3387zweiu0RxSaT9Yd2V8Lq+hWtkY
         W/TCNOSNIQr63Nh05rensu2j7e9qUxpr2HO3eDyxL3YoriyPgX+X5wPZTxmSNmDymKwk
         XYViuRvZLodSlMW67mx5AgHQxEUp6gkCgGZmRDSIaljJTOsEp4hUO9KjaAaIGG4Yu3/A
         KH9A==
X-Forwarded-Encrypted: i=1; AFNElJ9AamL5Or3mcW31oSVMO2mAsYOr7ksCu06asc3I7/cVwJxLRDbi82PC38BQPc2P6jiDM/GElLIlCWplMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgt/W9ckGKcpUE3Fm1f4aeLWznMa/1BrO3bF6eUUGf09Gf7QEw
	Pok2ynaoSypIsoyoLns9KKMlyGkQXkvVVA8X45h2/AALYNybwR8vESFOmocNbgNKPmDoC5Mj7bG
	bTmX/ukd/SrrBeXmzZuF+JWLpfb5Hu4p/FrK+3V4SnQ==
X-Gm-Gg: AeBDiesu4Ze5O5BHWcfYP1JKV8D5oiJi1QUDHaue7x3BfbXw49aElLgL889wH7ZCr4l
	pkZ1uMhK+2e6nzmFVSOk2Q7uuEhB7D/9GzTEtJ6IXtgibUmMAp5sE+/TIcykxK5Kavz0CdJ3oYl
	RlBnqvTlIg4CUbPLOs6IFfl1Oc6iI5xR1vv+VWxWai8ak/1eWkeL72cJ3gasyHcWBO/G/Inwrn1
	I3JHfokYYbY0cUjZLFRo6u0OHfAe6/Vahs6Aj60s7xRmUxYAmgPMRf6HPmvGhm8wZ9kedLqscPi
	VURnIX5uYXNSEIbu1ek=
X-Received: by 2002:a05:651c:4196:b0:38e:2de3:f8ad with SMTP id
 38308e7fff4ca-393783a5dbdmr34262471fa.4.1777920235089; Mon, 04 May 2026
 11:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418162221.1121873-1-dakr@kernel.org> <CAJZ5v0jkm9K9=-U_51FMsyxN2msdouRnz4sEjmxG0Btd6Hmw0w@mail.gmail.com>
 <CAPDyKFo9wcxLnCdykwE9J_vevBtjq7UVL4Yq3M=MOZ8M=j6LCA@mail.gmail.com> <DI9TMWIP69JZ.3LTL282WBVCOT@kernel.org>
In-Reply-To: <DI9TMWIP69JZ.3LTL282WBVCOT@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 4 May 2026 20:43:17 +0200
X-Gm-Features: AVHnY4KHnQBSBeOtislk924mA0MWE7UtS3xIbcfOQK00sWTok9rFGrcRZnMWyp0
Message-ID: <CAPDyKFo6Jyq+VTVvrX=DkQoxbGVi4cunvsNYya6oyz7=OZY6BA@mail.gmail.com>
Subject: Re: [PATCH] driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org, saravanak@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 12:30, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Mon May 4, 2026 at 11:49 AM CEST, Ulf Hansson wrote:
> > Apologize for the delay. Genpd needs the function [1] when it tries to
> > assign a common ->sync_state() callback for its providers.
>
> Can you add a revert of [1] to your patch series, so it gets (re-)exported with
> a user?

Yes!

I was trying to avoid dependent changes to the driver core to funnel
my series entirely through my pmdomain tree. Anyway, perhaps you can
host an immutable branch for me to pull in, in this case.

Let's see, I will suggest something for the merge path in the cover
letter when I post my new version.

Kind regards
Uffe

>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/commit/?h=driver-core-next&id=9db268212e0d7c7e3c4aef3494e55afbc1695b1f
