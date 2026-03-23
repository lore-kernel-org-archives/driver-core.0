Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E923C554F
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 17:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285641; cv=none; b=dGZ9gYinh7jfD2x4sYn7AJ/WhaBaxv3vx7Kz8M1rb/c6m+aq8eA2yLAWKp6xgMWViKO4ArfE2CkmW8Ch/x0XtEH4a1QGL6zvxoY30YiXPr5Esbf4cY/urKOJRS0h0chcTZczdKAqsIE6uMsSiO+8LodGX4fzYzfBVhdrJ4hs5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285641; c=relaxed/simple;
	bh=NXHdFcMsCZ9zeiG0neWEIh44GOUy5j6PRRxlB62eKCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvUcsB/bfAMf4MzrRISnh/RKUbhvl5ZPS2BmnSLIziHMoBU3/Z/BoF0D+YMwVsVH+FAq+3CJOrex37Ozx/ZKVdvXmtmhiu30i0w7k7tqQx4xb5x9AjrQuseuQVBtW1avt+y3X+cPN1NW3M1PIgpVtCRfQsmzjpkHotl5xaH1xuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CafbyhOc; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CafbyhOc"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so1009000a12.1
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 10:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774285636; x=1774890436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wP0O2YEaaZh2jzplFE2HN0DYzURZaOx4Bx6nnpcvKg=;
        b=CafbyhOcvySqLvA43e80uDwWrMzSLv7KFefDlKNWgOewYtVfSEpV0/KPlIgrWqmsXn
         t9EnQV38O+DLBs0P3SGdYFD/Rjoy3+C9V+a3AB80MwwwWSKKdxnmkYaro79eG7UKRdnC
         oWIJXIxOw6kYH3PN92MDIhQUBOHUeEDnTPn7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285636; x=1774890436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wP0O2YEaaZh2jzplFE2HN0DYzURZaOx4Bx6nnpcvKg=;
        b=izCxmBSWmwxv7LgQRXgOnCpikMgs42S5t+tr00tvchIbZGxn+qMgcIFVuPlfTyGD89
         mlmXsINvLyQuoATQPkzjXicriJviQdD9jZ91XqjaihVrvl9qJ27WhPZDpB+Ps23YSIzl
         xuSn0oaR7QFhdX3OXy3Csi3bPvdnUOu0iHyviGumG0MMtJOQeyojKiD1CHFUehnK10LB
         tbIWdffUnxUI5t1I5vF+NAUM9SlACLYmUcRnshFAvGJX/CfeQJFD4Qd6mcKrz86Ls9tm
         3Te5RCR5Hv5+iNEmPp+AlHmisVNFspp4/vZjY+omYedvRyF4myXC8tMUh+6S0RkOdZ6F
         MmRw==
X-Forwarded-Encrypted: i=1; AJvYcCUKZoUMpRwvtUk4KKEa70SIA4eR+9hOfKV7HLRBQrHi0PFbLs/EwqpvTqqXy1Uasmb5BBDe93445wHurw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxvw7QXPhGzrmi/1lHECnB83I8OkMFalcYspkzFEYuh0/TXhD7p
	vP9tPwmHg8HSaDvBhHoDxsQqA3+/BlnDlC4QeDSUe+ebHZRx26NFHgT2nbVnRAJjBS7FlNFflhE
	WcsA0P/QR
X-Gm-Gg: ATEYQzxUINUnYJigU0JztQMTuyD3afGuK12PdcM/UMMSPALse+Sjx8qMzJeactLe8DP
	jov5eyMg5+5/oDUCfGf/FzSekIlf+visqEeuzVWAda4ZyGsnlbQzzIY3ovVJvAYM20vFbvBJJ0f
	Hk3YZ0SqWfY+0o1LcjWWixAsZiStCEs9ukjbKSeSHAR0hjhPsBHPTlRsQmtkduTwVeHnRCvPYgI
	M1JnykEy2UFNmxTsoxN0AHGrMSYwvPUzaDwqHGv85pssi+WFTAvawHbFwegWhQPcmFBL/sz7sKb
	+ngMqPA62ag2do65t98q4WgEuViA527CwZkqztfvuFDZE9inqWcRgoczQ5C+lYxqPe6w9x66V2X
	TUIfGNVdkGnLwr4MTSWOdywnmRx6yUleIGC4/fsPctvLWh0o5k6e3EL3CQJDl6tMnrurcZ79ypn
	kXlnKSi2tkxBExZvnM2ocBw1Y4+Dzgh539eUpoepsSMvImbJp4v67Ih034MiXD1g==
X-Received: by 2002:a05:6402:2549:b0:667:9545:18b4 with SMTP id 4fb4d7f45d1cf-668c9323cbdmr9226004a12.12.1774285635646;
        Mon, 23 Mar 2026 10:07:15 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cd050c4esm3922500a12.0.2026.03.23.10.07.13
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:07:15 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so26614405e9.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 10:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnvC/PX1cWWSMr84UflFIqvcd8jA52/61L2ucWMUtB8cSo0ibm+d0rSqo1fhC2uvFNG04GBm/nIL1KqQ==@lists.linux.dev
X-Received: by 2002:a05:600c:a4a:b0:485:5c6e:8a38 with SMTP id
 5b1f17b1804b1-486fee0fbabmr171857425e9.17.1774285632783; Mon, 23 Mar 2026
 10:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <2026032152-getting-carmaker-29d5@gregkh> <CAD=FV=Wag5qx9RXkAHrf+zbwtQgVQW1UUc6DRhUzudBtjbD8ug@mail.gmail.com>
 <2026032114-unlocked-unmoving-091b@gregkh> <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>
 <6ff1444b-f83e-47f6-ab0d-6745738523ba@rowland.harvard.edu>
In-Reply-To: <6ff1444b-f83e-47f6-ab0d-6745738523ba@rowland.harvard.edu>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Mar 2026 10:07:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com>
X-Gm-Features: AQROBzD1wQwwLkQqFLAaWiaEUc38lElDQKStGZ6mOr6tab1Sq5qFqqIwOw8EX6M
Message-ID: <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com>
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 21, 2026 at 8:54=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> > > > I'd also note that the only actual symptom we're seeing is with
> > > > fw_devlink misbehaving (because dev->fwnode->dev wasn't set early
> > > > enough). fw_devlink is a "new" (ish) feature, is officially optiona=
l,
> > > > and isn't used on all hardware.
> > >
> > > That's true too, can we set that earlier?
> >
> > Yes, I can post a patch that _just_ moves the set of dev->fwnode->dev
> > earlier, and that will probably fix my symptoms (I'll need to test).
> > This patch already moves it a bit earlier, but if we don't break the
> > linking out as a separate step it would need to move even higher up in
> > the function.
> >
> > Originally, I was going to just propose that, but then I realized that
> > some of the other code in device_add() probably also ought to run
> > before we let the driver probe, and hence I ended up with this patch.
>
> This sounds like a more generic problem.  A bunch of things happen after
> bus_add_device() that should be completed before probing can start; the
> firmware node stuff is just one of them.
>
> Splitting bus_add_device() in two sounds reasonable, although I would
> rename the old routine to bus_link_device, since all it does it add some
> groups and symlinks.  The new routine can be called bus_add_device().

LOL, so basically you want them named exactly opposite I did? That's
OK with me, though maybe:

bus_prep_device()
bus_add_device()


> The real question is whether any of the other stuff that happens before
> bus_probe_device() needs to come after the device is added to the bus's
> list.  The bus_notify() and kobject_uevent() calls are good examples; I
> don't know what their requirements are.  Should they be moved down,
> between the new bus_add_device() and bus_probe_device()?

Yes, this is my question too. The question is, what's worse:

1. Potentially the device getting probed before the calls to
"bus_notify(dev, BUS_NOTIFY_ADD_DEVICE)" and
"kobject_uevent(&dev->kobj, KOBJ_ADD)"

2. Calling "bus_notify(dev, BUS_NOTIFY_ADD_DEVICE)" and
"kobject_uevent(&dev->kobj, KOBJ_ADD)" without first adding to the
subsystem's list of devices.

As it is, my patch says #2 is worse and thus allows for #1. ...but I
don't actually know the answer. The main reason I chose to allow for
#1 is that it makes the behavior less different than it was before my
patch, but that doesn't mean it's correct.

Reading  through a handful of "BUS_NOTIFY_ADD_DEVICE" calls, my guess
is that they expect to be called before probe... That would imply that
my patch made the wrong choice...


I think another option here might be to just add a new bitfield flag
to "struct device", like "ready_to_probe". Right before the call to
bus_probe_device(dev), we could do something like:

device_lock(dev);
dev->ready_to_probe =3D true;
device_unlcok(dev);

Then in __driver_attach() I can have:

device_lock(dev);
ready_to_probe =3D dev->ready_to_probe;
device_unlock(dev);
if (!ready_to_probe)
  return 0;

If I do that, I don't think I'll even need to re-order anything, and I
think it's all safe. Basically, it just the device hidden from the
__driver_attach() logic until probe is ready.

What do you think?

-Doug
