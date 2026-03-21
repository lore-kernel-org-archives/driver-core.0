Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4183313527
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774078550; cv=none; b=Dkuyzg8BCxROKTGlE+EOClusxrvEi0FzNzBEQu3+lmsQm7bv9lUDGxut8uT/Fd1JCSneq4dsL3OyoUuqokCCHGTc1QUQEYS7wHsgNz7MGSTTnqI7T4tgXWNRBRRaWTqe+AHPIQT87tMr+7SVPscRk+hYECk6PcMt8glDfzzLSKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774078550; c=relaxed/simple;
	bh=0kfRGZVCR2radla1OyEeVDoEeTXAXSdO//I39xjPpcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCcYYAQ3Pvt2MTp+tU8aI7RIVOWdEXr7bpEdgGvBOA5tPNBWyky15vCss9V8LKnftsafa3SSwtRqTzAi/h8SSMCgDvQnoFUnLEA7EU6hNXJ2xsHAFFKUXpDM1Oc1Usxo9qlS4sQswt5vlOGDAnDZPZEV9IdCsHUTOh5Hh2HfNIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EgvICiz1; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EgvICiz1"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b97905516faso322528266b.1
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 00:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774078545; x=1774683345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACkMXGUasnKboN1EbrjjGxUNRQtGrlOWqhf8xARdNug=;
        b=EgvICiz1sIAuezYS3c7ZvMS3hLahoAVTtRgyZxgSXEYO8fayj+3K38oqkchZ6nOnua
         kZr1dQzwyKj3B2bjBeE4Ht3dSe94dj15DNRt0EeOueHvaftRJ7Kj/I/rriDFYMluoAW7
         kSbVfC148HykzNcdzVexgPJGH+e84J0nRaYlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774078545; x=1774683345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ACkMXGUasnKboN1EbrjjGxUNRQtGrlOWqhf8xARdNug=;
        b=ixtXO1m2kCHoX6Wy+GPfBTT3mM3C4LtmiFUYosnkJUymowjB/6V+dRt60be59iq5Sd
         ELuyXTRjFwLZgj6ER5drZ2GwzcNkAR2Rh/i1tKGK26ZVjZiLgOtk3FsZX8XiQTdDpN8E
         IoyO5kOkK4vNCwPoPZwPA9muGGUGE4jHtE30CELQoeQGmFIzVVqGkfkpOO27KVlJpvrq
         +jgBifPAT7ijtmmBJ/ieXITc7SAIcNfpm4ezIQo8TvRfMHOZZwrx5F7pUmsYQk//uZ9r
         WV2AU50NFaB6jhbqtpcENIiavGGs1ueM/ZyCcRF+kBCVhCMBPBGdECajBzko+ZhBcuui
         i4HA==
X-Forwarded-Encrypted: i=1; AJvYcCV9BdfBPjolZCFroTc4GTGAgwd7Q+HThjLlpP6Em+GyEL+wF2fSw1ION4+qlxEPn7C1rVhBn11EzNrI9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxV/O6CuAKFbGwiF2be9jSYouIA0Y0fqN81zhNjOFHppY9x3MCA
	u8U2OToFXVa4YC92IXC8/+VtK6GAbQsn5hWKgc6MU/8QbGoIEOEMeL+XlGl5cIhezPOCkHk8jRF
	t6hl0P/nO
X-Gm-Gg: ATEYQzxPV8dytV+DhP8D1VzxOtRU6Xf7K+PSxRTwVw2F7Ckmht//YqFUL+sH4Ji8pS8
	0ZxSTIxzdXOu+XDflMccb/zVzbkq/xBNrtNFotjKPcpfegiRNh/axVDl77Zn26zmpNvsgk2dXnR
	9ksQNxdGLIr1zG1OcQomSut3/aa0LesRRdtEn52xGv9qSO/LU7aV1sFLMCJEAAWbeLAe9flCt12
	olHypY99Fh3fhaoAqWGGA0YFvL+mQEdqJnVuj69AawFoVvU6Uy4pVBCD99r6oTjYoj5Fr1FvUau
	3NmAMOnqgoOFvzs0dgWFG6P54NY10MawexJexfjyjaIPCmx2b/n08KyePsUfNVuZxh0TcmXlWw4
	0xOMdjfQ15s7aioTYT9aH4kOk9B09j3QVZxyXQtItrbJq9Vdad8lIykNIEA0JVS37C4LOZ7R7j0
	kT3jwKCe0OvmU3+YYK1NM35X3Dhhtnjac+LJnpWYOpasRrflEMArvFfmHBRvR+fg==
X-Received: by 2002:a17:906:782:b0:b96:e11e:97c4 with SMTP id a640c23a62f3a-b982f273958mr327318166b.20.1774078545428;
        Sat, 21 Mar 2026 00:35:45 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43b5csm243169466b.1.2026.03.21.00.35.44
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 00:35:45 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b9b190easo1979279f8f.2
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 00:35:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiPOJTHC/lfYj5nGa8TRJQ/qlsI8wp5AQMdy8hCm6DKpKlaz5eCLXj8EnSWd488iMi8Y9vJYBhfT8BEQ==@lists.linux.dev
X-Received: by 2002:a05:6000:220b:b0:439:a958:4342 with SMTP id
 ffacd0b85a97d-43b6427d9c2mr8600460f8f.34.1774078543454; Sat, 21 Mar 2026
 00:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <2026032152-getting-carmaker-29d5@gregkh>
In-Reply-To: <2026032152-getting-carmaker-29d5@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 21 Mar 2026 00:35:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wag5qx9RXkAHrf+zbwtQgVQW1UUc6DRhUzudBtjbD8ug@mail.gmail.com>
X-Gm-Features: AaiRm51BmC3o8HV2Y1InLkH4yrHdWTPi4-FQK8nvRqkR1RYKzTpEt6W1De7LA08
Message-ID: <CAD=FV=Wag5qx9RXkAHrf+zbwtQgVQW1UUc6DRhUzudBtjbD8ug@mail.gmail.com>
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 20, 2026 at 10:41=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 20, 2026 at 08:06:58PM -0700, Douglas Anderson wrote:
> > The moment we link a "struct device" into the list of devices for the
> > bus, it's possible probe can happen. This is because another thread
> > can load the driver at any time and that can cause the device to
> > probe. This has been seen in practice with a stack crawl that looks
> > like this [1]:
> >
> >   really_probe()
> >   __driver_probe_device()
> >   driver_probe_device()
> >   __driver_attach()
> >   bus_for_each_dev()
> >   driver_attach()
> >   bus_add_driver()
> >   driver_register()
> >   __platform_driver_register()
> >   init_module() [some module]
> >   do_one_initcall()
> >   do_init_module()
> >   load_module()
> >   __arm64_sys_finit_module()
> >   invoke_syscall()
>
> Are you sure this isn't just a platform bus issue?  A bus should NOT be
> allowing a driver to be added at the same time a device is being added
> for that bus, ideally there should be a bus-specific lock somewhere for
> this.

Sure, if the right fix for this is somewhere in the platform bus code
then I'd be happy with a patch there to fix it. ...but from my quick
glance (admittedly, it's Friday night and I'm tired), it seems like
the problem is just with driver_register() being called at the same
time as device_add().

Certainly adding some sort of locking could be a solution (happy for
someone to tell me where to place them), but we'd have to make sure we
aren't regressing performance for the normal case...


> When a device is added to the bus, yes, a probe can happen, and is
> expected to happen, for that device, so this feels odd.
>
> that being said, your patch does seem sane, and I don't see anything
> obviously wrong with it.  But it feels odd that this is just now showing
> up for something that has been this way for a few decades...

I suspect it's a latent bug that was triggered by a new Android
feature. It's showing up on phones that have
"ro.boot.load_modules_parallel" set. I think you can get to the
relevant source code at:

https://cs.android.com/android/platform/superproject/main/+/main:system/cor=
e/libmodprobe/libmodprobe.cpp?q=3DLoadModulesParallel

I suspect the bug is never triggered with more normal module loading
schemes. Indeed, one phone that has nearly the same set of drivers but
has parallel module loading turned off has no reports of this
problem...

I'd also note that the only actual symptom we're seeing is with
fw_devlink misbehaving (because dev->fwnode->dev wasn't set early
enough). fw_devlink is a "new" (ish) feature, is officially optional,
and isn't used on all hardware.

...so I think there are enough reasons to explain why we're seeing
this now even though it seems like it's been wrong for a few decades.

-Doug
