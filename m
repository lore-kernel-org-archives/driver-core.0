Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4EE32D7C7
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444475; cv=pass; b=gMeo9odwMPpzEcwuVamde01LV5X+mLKkcUxXCzM7dzqOO7/bA2/CCMrS7dt/afOWDeYqNm+g3MdbBaGjcCz+lpxsmoVer3+y2A0x7CHxdDElXa83uB6lHHmQ1cCY1Ngy86R2SfA2eaa82HIBBVmkmysng6IgrBk2CHwbpAgyukA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444475; c=relaxed/simple;
	bh=TBJ1yrzYQ1NnCqjl7xWYSvAiw/tj2uso2ls5/23iYEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JkZGw/B0IGH50EWIdljTNUCW4wStUabTl6NnzYcxxw1tlBYEpJdvHqBw7jNL+sRTnQ1HxQDCdH1lS2EBHAXJTmKm0RuvZ6DbXfiP8yO5zkPkr1rs1UMA722lFobXIRKqPQzJx4FVJnlKrBqA94MuWrnDBsxFvUc5OauEtJMBJ50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVortVfz; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVortVfz"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d4c85307b2so3046933a34.0
        for <driver-core@lists.linux.dev>; Mon, 02 Mar 2026 01:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772444473; cv=none;
        d=google.com; s=arc-20240605;
        b=XoEJXKN12zUlwvG6plfFvEiWc6PiTi38vvPltva5ASFlEvBeVm8brCiTMNomT/EvVR
         1wTtY9aAo2xFM0OCLJCr0eZp3XnkGJFY9HiLKAa4aNl3Uf/v9YGZKuFq/qXcyCIuOBrA
         34BkNR5dzLTVNjvBqdwUGlPXKswZqM/dIdPLzvVb4SQw+Ku82X1qC3Feh+ZocwbrGnCX
         ktrJUzNJMwRxAcwmMq3KZWXkfvmA8EZMSkVh5oSRB51ygKVndjLT90wNRJ1bDEyRr2Oz
         2DkwSCex/SQf1XIxx+rJEX+AHyXkeqFspUcvNJGbL7mbDPQLkAj6XBtHgSDMrgnEMbd5
         etbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WMS7e/VtXgxxHiT5+aAGAuDmBujfavKZuiOoKfzvjp4=;
        fh=btYm1X9w+qRcWR8DAjuQUMb8ZSGBabK4kbXryAjb+E8=;
        b=fy7Jvw13ScOb0tzXlfI/2tEblNxedMKnxuv6kDQvpCcuP+L5cqt4aMuE1RiSPDyNpn
         pbIx230JT7km6epAUg2I/nPfKNY2DKxwD3e2IZDwQNJCz21QPtbI+JRPWNNkOEfvZyUr
         KwHt0UGw/lveymIK6RnMWMttR84BGWb91KooAjCccWB7ai8uCfeUpsgrYkaUL6X+S+o1
         U+1m96ld4eWYi+Z3iUGxa7FWs4GoTXibqJ6vTGd7w4HhrEaTzKP9f5Z+QKY2JwPnynj0
         WDQA9Ud26qiwCHPymKcsNGLq8ZEWhXtI5P8VN5DK24Qd6yMppaBXVdRogdaQ/Q5Ez5sa
         maVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772444473; x=1773049273; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMS7e/VtXgxxHiT5+aAGAuDmBujfavKZuiOoKfzvjp4=;
        b=HVortVfzWo5jYKjjQahoNFY599X+nPmrDPNM6w4c59Z4daVgEAgNDDZfpy3WsVt9EO
         WpE8L9FtRRVhZ5ycYFPsOwOgGpGFpvpHdDFknul2o99oVKzXsxClzKmRJNxLSXCcVWaT
         CSVwmSLfy/0EUihRUahlQaAWYmYeLoUck8T+rs6XhDzCxlZlRPG8mmxNHlaraBOllaBC
         rK29dYA9v5c+ATUe9e21ax04v1+xvu+gfsjcZ24S+XEfGGtumfVS8gMsQ7rLCLGUJT3F
         8LYTVQzqNzcn4MnmkwnCDqyYLojkr/LyftV/nefiWa5JcyJUXdDjRmbSYNE8ZwD+y2b5
         DSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444473; x=1773049273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WMS7e/VtXgxxHiT5+aAGAuDmBujfavKZuiOoKfzvjp4=;
        b=mH9c6FF6NOUbRtKBt65iG4XwhEe7pSy7m4WXOK+s8PS0S/uiDXrNLL3nsjNAXsf5V3
         CzGsypX8WqLlyeVUP7EY+w1fIhq0l0VUmNCBFMs0IDNjHTW1YxpTMpt4l2SWbfR+MXFn
         6x3iQnpARROcEvfQ68VsdiNnbl93qY0cWCCuVuIbqc9y8my6uK7N40Co31n1uT/65yao
         yFg16My42mdE9M955iSwRYd/5U0NeoE2nQW4/ng/S4g4p8Ew4Hmat3cGlj1GloriPnnR
         CxgSkFONOJ85usMbqSDtghYVJpxbujSFw3aUac2Y1IoX+m3CxeDVdjndsgJngojkglUP
         0Rhw==
X-Forwarded-Encrypted: i=1; AJvYcCVM0NkesL3K0iNXHUOfo73zMk6icPGWSPQ4mDJrwD1VYXX+N2XUHs8aYLFDVDRVxEQMOzlTh2iEb8IMYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5TtIyi4eidDSkiHlSLYgZ2yI6bFxzdyMZ9VN9BCgksjgcVBip
	JmytNbbhkLBUoaelGcXatRgoD/17fRmB/58MZcA9kQGM8MwSqPO1kvpg2jOI9ywslBlbos+ICik
	Bqralp9cfcEjjjsNEG2VVxd20yVr6iMsIMIrj
X-Gm-Gg: ATEYQzyRVWUyrq1TjmjFXQGUdfYaCWFYq7LC7593Qov945fZoGL94f2D5aXSNuzX1Wf
	f9p+WS/PatN34pNrb0YoQYNL+UWV+ytQMLbL/70ovwOtI4gHrK4foWa6t0ERwAEl0UEGP/710NI
	Cr7HRzqGVHi85ddThfybLVN7MUhZm5n5NlGR6/xFgTkwe0p7HLMdruFc9YoLgQnLjI3xvWWyKSn
	p35W9DD6kioyFgjiFm5GjkqSZDjTpKoZKALlQ7eHydpNV+CyCTrnICpb3MwMo6D18qDv/ef+dvj
	92/hf07/uMB87IND8NXbu8w8VxaJ9dpcCyBA7TVLkB8JsoFfNCwpRatHQvZlnYNVe+RZ1Oq/JBY
	=
X-Received: by 2002:a05:6870:5ba3:b0:40e:e5c4:a4b2 with SMTP id
 586e51a60fabf-41626e7efd7mr6527665fac.14.1772444473484; Mon, 02 Mar 2026
 01:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-1-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 17:41:03 +0800
X-Gm-Features: AaiRm52ksdTFNUhtDCiLRoaU2IvMaCTzMMj20OxNJCH2RxR4-dFP_MGc6WdRh8I
Message-ID: <CALbr=LYYUH_yQL1PO7mXzK6Oubt0LvKb0714iZCx_eEXScVdyQ@mail.gmail.com>
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

On Mon, Mar 2, 2026 at 8:27=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, there are 12 busses (including platform and PCI) that duplicat=
e the
> driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate lo=
ck,
> solving this in the driver-core generically results in less (and cleaner)
> changes overall.
>
> Thus, move driver_override to struct device, provide corresponding access=
ors for
> busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(), device_has_driver_overri=
de(),
> device_match_driver_override() and a helper, DEVICE_ATTR_DRIVER_OVERRIDE(=
), to
> declare the corresponding sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> This patch series includes the migration of the platform bus; patches for=
 all
> other affected busses still need to be extracted as a follow-up of the WI=
P
> treewide patch in [3].
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> [2] https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel=
.org/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Ddriver_override
>
> Danilo Krummrich (3):
>   driver core: generalize driver_override in struct device
>   hwmon: axi-fan: don't use driver_override as IRQ name
>   driver core: platform: use generic driver_override infrastructure

Hi Danilo,

It looks like some usages of platform_device->driver_override were
missed. I found them here:
- drivers/bus/simple-pm-bus.c
- drivers/clk/imx/clk-scu.c
- drivers/slimbus/qcom-ngd-ctrl.c
- sound/soc/samsung/i2s.c

The good news is these can be easily updated to use the new APIs. This
is required to avoid breaking the build, since the field is removed
from struct platform_device. The previous build likely passed because
these weren't enabled. I will use allyesconfig for testing going
forward.

I scanned for similar cases and most fit the new APIs perfectly. One
exception is drivers/xen/xen-pciback/pci_stub.c. It does
strcmp(dev->driver_override, PCISTUB_DRIVER_NAME) instead of using
drv->name. We might want to change device_match_driver_override() to
take a const char * instead to handle this.

Besides axi-fan, I didn't find any other drivers that need to read
driver_override. This is great, as it means we hopefully won't need to
expose a read API at all.

Thanks.

>
>  arch/sh/drivers/platform_early.c |  6 ++-
>  drivers/base/core.c              |  2 +
>  drivers/base/dd.c                | 60 +++++++++++++++++++++++
>  drivers/base/platform.c          | 35 ++------------
>  drivers/bus/simple-pm-bus.c      |  4 +-
>  drivers/clk/imx/clk-scu.c        |  3 +-
>  drivers/hwmon/axi-fan-control.c  |  2 +-
>  drivers/slimbus/qcom-ngd-ctrl.c  |  6 +--
>  include/linux/device.h           | 81 ++++++++++++++++++++++++++++++++
>  include/linux/platform_device.h  |  5 --
>  sound/soc/samsung/i2s.c          |  6 +--
>  11 files changed, 161 insertions(+), 49 deletions(-)
>
>
> base-commit: 78437ab3b769f80526416570f60173c89858dd84
> --
> 2.53.0
>
