Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794301961;
	b=N6tgTybab7fVuKS9Eh0CljQk9Mo60nFjN+MN5usKfsss4mm3pPMx3UNvEJ7Q5Y2XB3Tc
	 QM4W8Un5nj5D8v5Rlj5nrKCDJ+P/Elx5ms1KshwYMe4UfmAf7CjvK8VICyLbvRFLspCHS
	 NPmdHb5b5Nds11izTT9XI3kuamLcBAhobwlBFh9MRkajeSbIXXZ11CJRRR4zVWHIJcFd/
	 q4ExRkRL2AZwtjBLT8TkSLwPr48JW9gPFykUup5z40u0GLjQp8zVJ2NjlBZSeFzkrDirV
	 hftzCiOEjNkDILWCCYVVSMNNtFwxDzQ6YKBLlPULORTitVbjjFtFQNfEeJJmQDdGJzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
	b=ohC++vW5UpDEGTozjgCrootVgqBkZ5+cWJMT++bM23PP29W5B4uJ5Dd7nyS1xGxaYaia
	 NuhXIcQPDQWYulH4nElR7C42X5Y7tmZqPrjI2O73ABfS3hr1Xkt1JSY3edP3triVfCHEh
	 E+aejPTruOBjqUsplLNn4O1ClPsftZmcDDhYgbyzvGPI+WqTVcwT1HvucY8QSQRNwNirx
	 VHnPorzG8Tvr+eb2w2BUl9yiWiCHyUEnX7CgsyHPswGGurS0GeX43ZtMpPCfkDpL2O86O
	 NG6UsRyJvE0o8n3RSpGUPbCrbVsH1QiyRZf7QgrJkZ5bn6fsDETIRvN6BULDEjvLuuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSlRZ6RD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6717606A325
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 09:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6717606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSlRZ6RD
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b335ef6441so14912747b3.3
        for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 01:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794301960; cv=none;
        d=google.com; s=arc-20260327;
        b=TmL6EVOd4xKLVHLF26gY3sRe1tSYSAE87OkP7jPDS5dJkXjG9mC5z4fxPpXLhS8cv7
         sPoBKYZgiqJop1cIiCgbYeiGntmkEqwdc5dCnGJp7F0X37VHFviPoveAQkjkIAKj9LZM
         AGRWoFF0n4a3ghFhzralb6lR7yZ/WlrDLaQulBTkLb0FRd1fnm7NOeyOwD+t3z6TOKLT
         nQgKUw9UE2xU2rvNlwmgtEaqCnCSbHClb+QMhuG86ory/KRDAsKM/gEaLh2UYct8Ot7g
         rPbEtfhriWKN0lUGebApgY8I1wH8xH+qUF3sj3IJ4mMAG3hBl2fwZzhWbup3qSinNlGj
         qzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        fh=ajkZpLTfQO9f8PmGDExuRoG8T55w0POMh+kLF9yUArY=;
        b=GfRrLJqJHJssBknmwr9Zsj0EOquySe1fga1P00Ff0hNQcMSsbUj5LEsC1Yxr428JdP
         Nh+dA+7X2DxpQPEjnK54lmeLKrE3B5JKaSwlqFZi8qRziexwDPEMi8XpbjQha9zIijSx
         U5NoW7BhptBRYTXTh6IYnDCuqqDkE8HDWc42fZDTQ9OGyq99MXyj80MzHv3LZfFMClxn
         W5ryoh5H3l95hgpIBMLimyA63l//yW022iatDyLEOsYqjlYXJ/c3wGN860YatUIbkSH2
         hicJ3af9JLPdMhqcR5XV5cHjKTaUrHOVThA6HAIlI3uPx1eNNWs4ZsSP+WcNR+aFYdfe
         4cRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794301960; x=1794906760; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        b=KSlRZ6RDEXQ3s9JJc8nzpU61OkGqpbobMlH0NI1wJWdK0RAayS+sgeGgOaR8DzJiVV
         f6ZSezpJe2QxaXrytmJTxMc01Ghdh3YIe8qk0azqvEHnitgQiTue62gxUFiJnF+OKMrP
         XTx/W/BFKxVrBxCLHsCw+1KH7m5V2FfGu1gMW8SH3mXYfXd4ysc5De10UM1RLe2uMJ2v
         DyeYIiS4BLBBiPGfayUqWyp/tiL8yCMIBPsCV3tY059L1FglqTIP00vpWtG49JquRAji
         TCwPkKNsy/B77IovKX+PFd3+UVu9GXMKJu2tz4fKNOY17busu8vPBMjNR3aTHotR5KjK
         JUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301960; x=1794906760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        b=zg8IUQejl7yv/mBwKtvsXcSHKTbZo4stK5MdSorFAM7Cf+DYLcBDU5YpzrdhbPcJpa
         gY2T68o7PFgx1ocntoS+iujG+o5MZ4sSmxvagD/v8Fgzcq0OxDjc2ZG6335yGb9fHKKD
         lcX30feDtCVQcQdB2wH1TkeYuiH4qAJeGpeMAEjIDA7HAQr1Qa2AE9CSlx21ioCCfIM/
         jwl11BBsuGSme26JsQ6Gm/LdbZtK+u0SYfogmuh6VF2BM2Y53eVHTRhEDmIK2lKetvHc
         0EIeQBNJsnHTkSYVc4fsgYe9G/cDm8T0ugS9VUAY6lSWHYWbyM/aN13e4jPzgbcaTZYQ
         B/8Q==
X-Forwarded-Encrypted: i=1; AL+hErGChX28atQD+SOD5kgKiF0oQPgewTU/8ghd2gFJt8VRyKmtPuJ0zAibOLLijJna2IrYLMUeIz5NBIM12A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/DJhunzUMf/jyMses3ZSmxVUdzJ7kAo/DCgXoSMSKEwS1Pamr5
	eopLGJmi2ngQFhqdL0bSaQ6LMbaSrs3AsYAr2lQ1KtGtLDqwrrxq4rN5RuEXTSsI06NH0rSclJA
	17LtvE/Q+nWkaN8DgVw0bQbzWj848cS8=
X-Gm-Gg: AYBFou0UnmzuZpTHXdqq0w5A6T6nFwwDCe2dDp9Z5uVVFJNwZElREXruwjPBcxWAsIs
	XfcUCph9h45zcbePwAI6GqEhd/zA8OvfNQ3QQzADbdWJEiuV2YL0dtjr4HSGDk6SSiGeuPlhOJH
	CCoAqiAkXysq3zSs5jQxclDD8t4mf2O3LzC1TaragL+RUxK4KmIYhMaJ+ezYkCLSM9GMVkG7V/H
	AOkm4FHp800ryzU18z36nL/Lf6lbN4Awproidjez3x+CRlC72Z9PxUqtvjS8ADiGs6tOVA7YFzm
	Z4i5nmdFTas9vAi8truH4z+Wa2Wx8KZGIk77wo0wXmQEzTrgJZIngZcDKxvVH9VKs1SHzn7C55N
	ZuHfNgCnv8/bOxvONoAjBHg110zbpkL76Zhhwwtd/MLBHUyIYTmsl0lN5d1CU/E6f0HFN1g3Kg8
	JfPUrWgQUIo0YQNfENr2cErG7NaJxKTAPsPp2MutPOdC5F4Wa/IgfnyH95ocxZbveZn6EMkFu2r
	PztxWAvgD+o5cCgY6oqec23h1UVnI5yskZTGXZpdclEYsd5v6HQjMg8efBsKkw=
X-Received: by 2002:a05:690c:1c:b0:8b0:a01e:2cc1 with SMTP id
 00721157ae682-8b392bd3a6bmr12222497b3.53.1794301959730; Tue, 10 Nov 2026
 01:12:39 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
 <auuhy40x1BMoW96-@ashevche-desk.local> <7sfr4ljlwbehal3or4dmy5jxbjz6ya2lf3dq3yptr54wym5tea@eqaexflmocih>
 <avICwdxyi-W1Y3PD@ashevche-desk.local> <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
In-Reply-To: <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 11:12:02 +0200
X-Gm-Features: AclHuK-j7UjC7_2X91Fl0h3tqgy10rRsGsXGtMX-1tGj0PKndsOn6ITWu7Xe30s
Message-ID: <CAHp75VcwiGHB73ny8iSvXeFdjbTKUpnXZPS5iD7NwaMcJ6q-7A@mail.gmail.com>
Subject: Re: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Mon, Nov 09, 2026 at 07:28:33PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 09, 2026 at 02:07:46PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Nov 04, 2026 at 11:21:15PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 04, 2026 at 03:03:47PM +0100, Bartosz Golaszewski wrote=
:

...

> > > > > +               names[i] =3D kstrdup(prop->name, GFP_KERNEL);
> > > >
> > > > Can property be statically defined somewhere? We might want to also=
 optimize
> > > > these duplications with const variant (here or elsewhere, for fwnod=
e generic
> > > > path, I believe).
> > >
> > > Please rephrase because I'm not quite following what you're saying.
> >
> > Can prop->name come from something that is declared as
> >
> > static const ... foo =3D {
> >       ... .name =3D "bar";
> > };
>
> You can't know it for every instance of struct fwnode_handle, so the
> answer is: no.

I believe I misput my question. If there is any potential that *some*
of fwnodes use statically defined string literals for the property
name? If so, kstrdup_const() and friends may be a better choice here
to save some memory (which is getting more and more expensive these
days :-).

> PS: is there a way of using match_string() with non-const data?

Why? It's an input parameter, it returns an index. Whatever you
provide will be not modified.


--=20
With Best Regards,
Andy Shevchenko
