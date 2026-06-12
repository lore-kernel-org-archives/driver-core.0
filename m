Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699243E3D85
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250690; cv=pass; b=BjqsID7/ds/YeWUKfA5BCWqEN8NIVEdk+5Qqi2RSLM7kkgQMz1rSN0IuhfELvZbGKCM/DvBIIKuDO/k8LcYZ9p88xnpwRALRMfsNbysOyarpgee6DcwKJ/X3I6ms2rEh4mB3WlxEE1nAaG0cxiuFo8L+cjWBdpJpBPlTAI5UGEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250690; c=relaxed/simple;
	bh=AAW7Bc+70pQhpUTfJT214lM/e5AbzwxyHZSFmCFPS7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mz0VKZzQYtNq1EiP6kDlkoDVxvCZufiyoBjgnfB+Ii57FwYZOmDPKD5w1GsgdXKuWAkMMGTXATkloyofEJkutMiw3ZU7hPGjHoSP5LaJxAQpoyf7TrGZIQQDPPcteTvz8Rv0L227KAW9BfVkBCimwz3ui/5N+8GTxohkt28yVwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Enjqm6Dq; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Enjqm6Dq"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7dc6fbf3e86so8162747b3.3
        for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 00:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781250684; cv=none;
        d=google.com; s=arc-20240605;
        b=MvhogQ38fYP78PUboVKzgx0sJb3R+1/G0lEX5hRE5K74EBBqz20D6qfrAPaXatLkg8
         bGyUeLbC1ypdbkzCGywxL7jLHGvRSdw13Gl+j70sE8th7k28X99+IWFoborni6tnzQW8
         AYMLkdtGxCdddV2tWCUTDErG2JsrYHleQ9c1Qr7kT+9m2myKpxo9DnSBIMJ57yfX/vIa
         um8CI6Z+AhbqnjEpUk+EfS0aHr6D55JydHNvIg9RyDD7FW5SfF98mX3bnyCxYI5F7bKJ
         3nn5fH3Axf9f1CN9rDG9YmVqwniurV1wlBLMrKgGbj0EKwDu55uLcp+Y+WFyJbwREQPj
         HjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        fh=itmyx2HDcYf+OlShqpSh0C12ocFenBvtK752kpqUbFU=;
        b=f31S6j68M45uP+nZNBp54kTeENc6duD8b7j4svMBgTwC50r2qC9ezP8kTHwbqvmgvm
         yjj5Ltep0W7XaHh/Ll7l08E1ChHcfgsde/leGX3uYSJIJdPIXrH2jOLTug8nONCN8ftc
         L9bGNLP3drkN8kHSyZBB8fVtMr+GvBtw3wKOyxGCDPdDXVWYWpxA2/1iDaSF/oAhCW7T
         C0bt/NMhFbllHpLdpU4JbE89bzQc8RnxycLA8X5G7VYpJ3v/qy4Mh/WT+Fpvb0SRXqGM
         ARIuEDIcTnkg8V6Lt+n7eYVPSj/JXpsNgANIJt5lxQKZnZZn+xALmRoZqzaighDdebrt
         oejA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781250684; x=1781855484; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        b=Enjqm6Dq2Boh0KKZveRcCic5k0NWQF2pnyyjCHKHTX2SRaoE/g0z2nhD1O/2bWWVTO
         6R05K05KxqfG7tKSpABtzm88GcqFNVDuP8NCIFWq7I/33CWWtsRMPD+BTClmLv2rqwkt
         3644AEKT7Lzs5VbhkduBTq3lFhuFyhhq9TM18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250684; x=1781855484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        b=rAdirTAeknuE/0hYu3VbfjKH9M+bSSpWDeZUjvIy7bpoW1AFb4Vo3CxT1t3K8NUeX3
         FgobSiN4TuwdYc09paM1GB/hj6coOK0DoDCkUJulPCFVfyWf7/BmosHBx93OJOFSLF9n
         gwf7f3qJZ1z8AlGi4MXqw7WPIPHRARDxAk0do23sxas10zs9mHmXoBUmP0YnEDcCsja6
         jTLlk1Cls44bOgZCz1d/z78BeXVUczyKLRvrneJP1ajCuLSR1uM4KY+Hnwj8jjEZCb0J
         qT0/tCUthDQ1S8fjtZVnnRaLXzdivpa1riuOeHrSqmfM1SU/yhTss79hT85XmIJ41Zry
         WWaw==
X-Forwarded-Encrypted: i=1; AFNElJ8DJbCeh/5qyV/ESkIXmyWOyn1YUFXuxNGkGjN7xpAIr/22kR5cmSemxVy1ilxSKBKUNU4jtCfHdAMcIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBdMlfewCroXzNza3JPr2zzAuXMV6R2C+IU+PUENOCpVdFDZ+i
	Jl7PStO3zIwREmMfsRsjvVkFAIhrymz009vPevywZQql9BgaIL5uXtw+BdV5P0Jgk/l51VCM6Zm
	cxWj4dCsrFWe5w4gm4fgQlEO3h3FkwuJ85ZNUGssv
X-Gm-Gg: Acq92OGA7Wb83djSoi0fwbqPFyQto48I/jMq4T7e7KN+eCk/JgwOh/ijnJJmkAtvWdt
	7FlmKBpuxqFIt4aPkkaZeULBBGM6hNTLH2iQEJvQ7m7UKVGCPuIxwCAsAm/aDLSZEoFCYOYRzNQ
	hKIvV54aizxcGnOEtn+y8FmBOmEhc3gY7s9+8nWXknUDqyvDZnzXssrPYJ05ysGAKc/e6ifn+FL
	VxS1afwrgA4gRDhR1h7/cnc3O75PlR51mFF2APVK89tEojOwrz5LihXbhGv0+5NqjVNXu+Yd3VC
	1aiZOTOv
X-Received: by 2002:a05:690c:ec7:b0:7bd:73f3:7a70 with SMTP id
 00721157ae682-7f7b8523999mr14898787b3.32.1781250684397; Fri, 12 Jun 2026
 00:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-5-wenst@chromium.org>
 <ailytpKQcvYTUH7j@ashevche-desk.local>
In-Reply-To: <ailytpKQcvYTUH7j@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:51:13 +0900
X-Gm-Features: AVVi8CeA8ndBvqsmj_bBdEg4mr2h2E0R3_zPJJzKBFEx0mTdugBDzHIodwmMGm4
Message-ID: <CAGXv+5FrD7abUvw5JgZECcGBvtOOpezDtmUrCRmVAbDx0ApxhA@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] usb: hub: Return actual error from
 hub_configure() in hub_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:38PM +0800, Chen-Yu Tsai wrote:
> > The addition of power sequencing descriptor handling in the USB hub cod=
e
> > requires dealing with deferred probing from pwrseq_get(). The power
> > sequencing provider may not yet be available when the USB hub probes.
> >
> > Return the actual error code from hub_configure() when it fails, so tha=
t
> > the driver core can notice the deferred probe request.
>
> Makes sense to me.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> One nit-pick, though.
>
> ...
>
> > -     if (hub_configure(hub, &desc->endpoint[0].desc) >=3D 0) {
> > +     ret =3D hub_configure(hub, &desc->endpoint[0].desc);
> > +     if (ret >=3D 0) {
> >               onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
> >
> >               return 0;
> >       }
> >
> >       hub_disconnect(intf);
> > -     return -ENODEV;
> > +     return ret;
>
> Can we convert to regular pattern, id est checking for errors first?

Sure. Will do it together in the next version.


ChenYu

>         ret =3D hub_configure(hub, &desc->endpoint[0].desc);
>         if (ret < 0) {
>                 hub_disconnect(intf);
>                 return ret;
>         }
>
>         onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
>
>         return 0;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
