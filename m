Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B4135DA59
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449179; cv=pass; b=lCMRQoFhTwYCmeHAyOTPEKGrOFTb3sNaikq294Ot3wT/77NrcUA90pS/CLVRHch1YrHy7P8hf/nGNHTKgM1Z6Dulogr4L1AoaddWfADlX+l6qWTYLmGptaR5fFlsQvRopgfbtvsFtgJX0Gm3iTAoZBUGFD2w0FmqUnSJ2uNW9vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449179; c=relaxed/simple;
	bh=DOlMsHbMVLndF4FYMYvBm7QWT7c+r+O4d0gh3fB6Nu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SigQ5Ew+w4jxbZHcZdb2sMyFRfEit9RvMHik7rDxXuB8Jd+e8m8jECV33t/jA5FjWFkLA2J4BkBmLAbq0vTkhHKhfSYpJZ4YlscIglm4GTO5F15P3GM4KRBxgwfx2SvOU4vDzXYm4UUwsZm3GKLnr0PjJfMlya7MAn1hDJN7jhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2FHB9l4; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2FHB9l4"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d55b97f358so3785125a34.3
        for <driver-core@lists.linux.dev>; Mon, 02 Mar 2026 02:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772449177; cv=none;
        d=google.com; s=arc-20240605;
        b=MwqdBPaqklCbQ+DXMv/WjLcTC4Gbu6msNIDgb9mLiJOtuC3hgLv2K6kz6Fde2iqbU9
         wzDw6vyMbPpKlDLxUdSFKG+vlqortzs6TYlRiMXA+wMyLkjhhMVf05I/J0tEBy4NKcWQ
         BfZenfsySizy1eppV8YFTODwDuHYRNtuhjfmn+IwTwtkgEbwQ+qvZRVo6/8S4QGz8uUr
         h/nRPuUaTKIN/46DsFTVqZhLJTNhC0Eo9VKyOa8u4Wfl6v1GhE0v+LgsQmEiVtge59mb
         bF43QaKMXd/WO/1eb9RJn3vD/t4cgOD60kVYF6qnHMFuDsPrZF/3aZfuObNLL/KuCUtP
         4W9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        fh=S9g2Psnf1DDNOU7Tfhn8Zw5MryuIsMhQFwHXfdzDqSI=;
        b=bs5IaUcEuhNRd6s2/mGdaY2qtYa32JbLo8BizHBzRdIYcqPuOscbknnN0FjhKlKAI0
         zTAz5f04zm6D5F7+WmZqoTDtaH9WY9Z+NDOwwDKoee3im8BkMXom/OpF3qIx05aXOCv1
         Zu5yqo0VS+iHwihyWv9Uqei6i3BB+A6RbRB1qW1MyrwUMLxpM7sxk72TM4Om3VAp29e+
         0Rgy4asUTUuk7oUurjvJMPQRXwk4rrTf4S8Ha+XNfFhH6PQtAfaPV8Y9UM3fpERbxMzY
         RixcKCIq36aBJhlFVcusqpkg86Vn26b2lL3X4JYKFwfspjQ6TKXByHqY9LDGQMl9yW8X
         OD+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449177; x=1773053977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        b=V2FHB9l4bvBQvsjjZd8Tw4yRcI0Ze0SzZGgm+4NCtqNpYGsTUzJSIz22eufXzgFfMF
         TLNM/vcG9gy6CeOD8tX/7k0yOP/ASGI9j3/zDkqqL4hNkSPDpDRAlnL+wG4u89yT8SfS
         92peNirPYqxWLS67rnX3NnucV4asFDK+iqfw3dk4+kSuZ3HN68cXm5VLC0xWJQhaKs5e
         3rvWteVGM4aYTZ7DZxdG5nOL3KD5IZoHZuhTWvr7pVMlek1j77e+CzxkzDtrpmXOyk8L
         QoywcpLJJ8KuNPXSwxuglKxNuJb6+m9btS+ZTpeBG0/JBEeV02iYagP6qw3bLxGgQqVd
         9qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449177; x=1773053977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        b=nms94RtdHQnVMpKdfOvcfe1++zKtAe9IDbmmqUaNStphx2xbYCP3sKWZugzoTaBjeu
         qnhTGdmO+1S6Ml/moLI8Ypl/ZQmuSxx4jMBGErkLzbwnRypif+icUYCW4m9Om0b6KSZl
         ziLjKjw/HxLsaTK5WPxXzc8Hzr8hFwiT+HzYw8nq9gbC8u8C8ZjLew9G4qJIw0Wvkz23
         E3g98lEF0EVpgVckIeGla8q/2DQzqXUZyHq14d/r+As2GSzyQvfX185RG22/M1mHLHqG
         Dc2PO9i2OguBJ/1mtpHU2DA06TBXZUfbG/mwg2dSGKcDYdsKewO8LplG8+NrgDLxWbie
         wxFA==
X-Forwarded-Encrypted: i=1; AJvYcCWxrQWIyo2464xFAVB/WttMoy9+56xEc2yPGSeukpNcqbKOTwzyN6iyDsA+WNXIr/eKYMQyvmZHDcQjsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZORiALimRUHBM+dvuVO3hTDbw6XjA+06WnxMKz7gTJP1FSAod
	FK2MZ2T5/mv+62iCjKsZ+jytnrZnI/GclRo/AcLjxQKdtUQXGQfLSZ02ozlacLbl+LSuCpkl5Tt
	rhtFCkNsWfK0CQreRKJ0nAOwnNWNfLCrH6R6C
X-Gm-Gg: ATEYQzxjXyiI6GfZNx8jAbH32spVDLxMJliTCZfIZmaTxNX8IxEResgVgQuN9785tZc
	FD1Z+jbIyi8iObs137lZHYNWINy3H1C82+AwDSYvbNGRVTUsEullkXSHne1YtL3aN+/yveNw/wJ
	F7gxPxFm9g5WIfjiFg0kNXDtoiB4CRdUrn/d+HayZ24Pf4cuZuBIHpEcH1cMEosQbgUgqqwjosE
	Ugrb5X13B1vJ+EmJ4BCLRfLDCHuC3FZtjwqEkMfDViQaGS2qTmf1mz872iodPjh2wG8jWsbYPYs
	q1I34KQSU1NWt0gV66VyLNhhClwlaTg9eiJwwbHu3yP/qRk+JJd3W1O6q7jFQ+mGkS3rEJ3d/sI
	=
X-Received: by 2002:a05:6870:3234:b0:36e:8381:db00 with SMTP id
 586e51a60fabf-41626d6496dmr5836181fac.9.1772449176906; Mon, 02 Mar 2026
 02:59:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <CALbr=LYYUH_yQL1PO7mXzK6Oubt0LvKb0714iZCx_eEXScVdyQ@mail.gmail.com>
 <DGS7SQHM3V5U.2DNQV68AMSITF@kernel.org>
In-Reply-To: <DGS7SQHM3V5U.2DNQV68AMSITF@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 18:59:26 +0800
X-Gm-Features: AaiRm50vW8aIhDL5VGmJOu5lxfmc5lcpsegRPt5hsmjpSbqi9ltnncK92dntUuc
Message-ID: <CALbr=LYMgWXcj0QkQYv-68gX2mkzyKrE2BJFeXbnoVXKW=F85g@mail.gmail.com>
Subject: Re: [PATCH 0/3] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon Mar 2, 2026 at 10:41 AM CET, Gui-Dong Han wrote:
> >> Danilo Krummrich (3):
> >>   driver core: generalize driver_override in struct device
> >>   hwmon: axi-fan: don't use driver_override as IRQ name
> >>   driver core: platform: use generic driver_override infrastructure
> >
> > Hi Danilo,
> >
> > It looks like some usages of platform_device->driver_override were
> > missed. I found them here:
> > - drivers/bus/simple-pm-bus.c
> > - drivers/clk/imx/clk-scu.c
> > - drivers/slimbus/qcom-ngd-ctrl.c
> > - sound/soc/samsung/i2s.c
>
> They should all be covered by patch 3, no?

My apologies, I got a bit confused here.

>
> > The good news is these can be easily updated to use the new APIs. This
> > is required to avoid breaking the build, since the field is removed
> > from struct platform_device. The previous build likely passed because
> > these weren't enabled. I will use allyesconfig for testing going
> > forward.
> >
> > I scanned for similar cases and most fit the new APIs perfectly. One
> > exception is drivers/xen/xen-pciback/pci_stub.c. It does
> > strcmp(dev->driver_override, PCISTUB_DRIVER_NAME) instead of using
> > drv->name. We might want to change device_match_driver_override() to
> > take a const char * instead to handle this.
>
> xen_pcibk_pci_driver should use the exact same define, so we can just con=
vert
> this to:
>
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback=
/pci_stub.c
> index e4b27aecbf0591..301207b4a30dac 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -609,9 +609,9 @@ static int pcistub_probe(struct pci_dev *dev, const s=
truct pci_device_id *id)
>
>         match =3D pcistub_match(dev);
>
> -       if ((dev->driver_override &&
> -            !strcmp(dev->driver_override, PCISTUB_DRIVER_NAME)) ||
> -           match) {
> +       if (device_match_driver_override(&dev->dev,
> +                                        &xen_pcibk_pci_driver.driver) > =
0 ||
> +                                        match) {
>
>                 if (dev->hdr_type !=3D PCI_HEADER_TYPE_NORMAL
>                     && dev->hdr_type !=3D PCI_HEADER_TYPE_BRIDGE) {
>
> I.e. no separate API needed.

Thanks for the explanation, you are absolutely right.

>
> > Besides axi-fan, I didn't find any other drivers that need to read
> > driver_override. This is great, as it means we hopefully won't need to
> > expose a read API at all.
>
> Great, thanks for checking.
