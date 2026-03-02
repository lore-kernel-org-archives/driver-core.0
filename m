Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6E435F60A
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449325; cv=none; b=MnubqaZ/XEm2eNIAfv/6FWO7W1nbkqH8/NpzGDaW2EW+K1CTYh+RcDinnXqO2yIZViOf1RTnHAZDJSSD3irHTco6wHULqMsfMeWcG9flAd0MeHTp7DYhTICZk5q2Caz+ldfJYPFz1AVRYaTg9Si1XfUv9GeRvtMSVL52MtY2d98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449325; c=relaxed/simple;
	bh=FPUUwSTSnHifTg1q09fFBxiGrVRvJtWxYMGk/Hf/oPM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rmBzPUXgEUVHURdw7DdKKXyOfPSVtQliyEFEfj8asiRhZDtxFScWKgILDzycW7PzUuWDqx3P0i3yOKzlSN8HehQGSVZz/gllfPwODh0OCS/xHmsVRWT5gBID13v+bzDJnTbYr8xy15m1vp0yDBN78Y3E1cA5xilzvk1BCuEJW8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQKSpBts; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQKSpBts"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439bcec8613so232459f8f.3
        for <driver-core@lists.linux.dev>; Mon, 02 Mar 2026 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449322; x=1773054122; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l+QuPdQBDjcL4VBMNAL4KvWg4+YAGNXrbh3ohkf1cXU=;
        b=eQKSpBts/fW6Za3sbwjaUl97hidHx01aBSGbh1bG55KdMGiuOlsTgLFj8PzMYW7uDg
         Ce0EB4a0BAGvtJprAyAhv5FKNPUh1jjQNQacvAsECX2l143pJ2qY7aj5U2QpoOJS79lk
         4e61ieIcFteyiaxBxKrfVRFSAb1hZtbvph6b2HpZGagP+BHJjVgWbAeMF1YP+HM5xwNn
         0zSj/MMDfn+414UcE+wl2z4tz4s7cYk18hFlV1sYypFwCxeM9UrB0X5T/EiyGRNvuHIJ
         Jk1LSKHa61H2EJzLhvMXk3XqAkWTlQp7ndqODKE9ZD367AWrMG0EI3NMPeI1wc3cqMHF
         xrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449322; x=1773054122;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+QuPdQBDjcL4VBMNAL4KvWg4+YAGNXrbh3ohkf1cXU=;
        b=i0aVFWn7W0fOp77mdGneFDgvC6c3i15gR5PEmI7ConC0CUactdWQ8iisjHfmQQTMrN
         Js6lB+ABlU32VZ8wY9ezEBvSv8nxvbTQmdFJrOcXoHqgrg22USYMBblioWQJ9t9NJXRa
         +k3RPKfjFZrpZQStYDJXT6bGlZlErsO+PSc2Y6e+kK0LFlRAooT8G78XPtGiO208YNzc
         yBf2tZ+N3peaTkQOBFv/T+qQUoTX9a9t1StnCwpz0clpS/QeSvwXsaIlFFHGignCW5sH
         WeGDUWnKGPc8tbfKeRYzwQyr0cMqVoZf/jFUVm9QLVjmvuylaSwK+oXyKpRt0nuTv7Du
         UloQ==
X-Gm-Message-State: AOJu0YxYb5jWuM+n0dMG4vp1Qe3nDD3241yUlwfegHpDdaLohwb3cTEX
	8Fury41ZkVDZ/u+1CEOxxhoXP1oz7UxZ4sEwKgj6nurzZ5UGVGs7socf
X-Gm-Gg: ATEYQzwV0regFpEIU8nWIB4Lw8SBxB4sbVTKPQv+mHhLexKr3Zwxu2LPVDKzvMkMYlw
	VlAWHZXW5iHqjg6+Gu6C/EJSGZYOCLYUp8+KzGhVtZS9eBBI9ThqH3MNLsEU+dX8fK0NyB/EA6f
	QsicuWziRd0AOmU9EaQNIDf52+7jNsrXtJJFoabHeKxb7pP2r0s0u9QCx55DVM/+dtUe0yvnWI1
	NTyb6dGGQHc4mbn/7XWPWWus4l2Bi9yKYJm7+Hyo7tjalykxbzRM4l06pLFpKjwvwyCL4s0Vhkz
	d37ozMPk5wnwWQJV8aoIp26H7iGrUAqrU1Omv6JRtqF3ZI80HVd52Kz8rkyYFhU4Rrha536abuh
	xhUJ8U5hL0O/dO85CfZZHKag+5dlCnxwzvOcPBpRBMttdEjAsbwzPxX6lzlbAFtpfVeF+65nTmU
	mIqkWOr1YJLIs702L/xPXa7gB/vIlKNe8=
X-Received: by 2002:a05:6000:2483:b0:439:ac53:a94d with SMTP id ffacd0b85a97d-439ac53aa50mr10380328f8f.29.1772449321007;
        Mon, 02 Mar 2026 03:02:01 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm26841661f8f.7.2026.03.02.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:02:00 -0800 (PST)
Message-ID: <de48f967a50b8f780dbadc562833ae6626be5268.camel@gmail.com>
Subject: Re: [PATCH 2/3] hwmon: axi-fan: don't use driver_override as IRQ
 name
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Danilo Krummrich <dakr@kernel.org>, 
	gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com,
 nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
Date: Mon, 02 Mar 2026 11:02:44 +0000
In-Reply-To: <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
References: <20260302002729.19438-1-dakr@kernel.org>
	 <20260302002729.19438-3-dakr@kernel.org>
	 <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2026-03-01 at 16:51 -0800, Guenter Roeck wrote:
> On 3/1/26 16:25, Danilo Krummrich wrote:
> > Do not use driver_override as IRQ name, as it is not guaranteed to poin=
t
> > to a valid string; use dev_name() instead.
> >=20
> > Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> > =C2=A0 drivers/hwmon/axi-fan-control.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-co=
ntrol.c
> > index b7bb325c3ad9..ec4bbb104449 100644
> > --- a/drivers/hwmon/axi-fan-control.c
> > +++ b/drivers/hwmon/axi-fan-control.c
> > @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_de=
vice *pdev)
> > =C2=A0=C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, ctl->irq, NU=
LL,
> > =C2=A0=C2=A0					axi_fan_control_irq_handler,
> > =C2=A0=C2=A0					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > -					pdev->driver_override, ctl);
> > +					dev_name(&pdev->dev), ctl);
>=20
> The devm_request_threaded_irq() API documentation says:
>=20
> @devname:=C2=A0=C2=A0=C2=A0 An ascii name for the claiming device, dev_na=
me(dev) if NULL
>=20
> So NULL should be sufficient.
>=20
> Nuno, was there a special reason to use driver_override ?
>=20
>=20

Not really. That driver was one of my first patches so most likely it was j=
ust some
copy pasting. NULL should be fine.

- Nuno S=C3=A1
