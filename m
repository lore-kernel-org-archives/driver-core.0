Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D4831C567
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 22:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774304709; cv=none; b=mhXFrITlu3RplE0oBhJXc/JdILGSOG/lvakt/+G34HNfIJuNW4rlyTSGFJ2dNUBjo/rcRTCFBRGKiAjOi7a7tdg624y4DBSDd/GyoVm0lzKCIiXIIjzoRSxwFZyQaMfhEGsgPWPrpXo14/IatwrKvaVszZau3XwHcYSujqr3fpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774304709; c=relaxed/simple;
	bh=bFLBqMlrMNlVvEDThGQzA+HP25jQiPecsDKqaKht8zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/kS98IS/EPNwfXJdC44dVZ/e7nQcUbNb8HXPG7LQE7itRAneyMv3LxEREvgR+Dnc54Y6h4rHAl+UV9IDaEqcyf8w0sS+1wWf/H5YC6zK5KYuF6wmwTT4F/3VCieiWRiAsmRsY+/XcMMNtlk/8CwRD0/5TytRN3JBNeRohJzmZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hUOqiVI1; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hUOqiVI1"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso5987664a12.2
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 15:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774304705; x=1774909505; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXpAwZ8YruU3sawAVevICPn8RHXhLzDURBOvuvjye5I=;
        b=hUOqiVI1nyetKN2Yc4BtMdDDJeyfypd0VNkxmS9uCfh8N0dQmENr5BMWCTsImaU5F7
         WX5vswYFfPDdi9Frd9D3ZTcoIbbnBDywdg7WsmRS2D1qSkeUAIEGgxcXNKyWusXafwqC
         uJIPQZbGoa/sHllyGm+mtwM/IkdeLKOFkMdSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774304705; x=1774909505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXpAwZ8YruU3sawAVevICPn8RHXhLzDURBOvuvjye5I=;
        b=BzY5sWY4v5VUVazft4fwq3rtO1OBgieN54dQTepEERfXBMEtntiw4m49bWk01cG/YU
         5OoGVD+WMt19TUBS7tH24Ti1f/Qivg0oDJpN9MhHgLRIny8QIXRuE5MOkKV5BI5wXr4W
         +IBKrw+PEDMk8e0S0Hqg98T+LGVEQfA2J4EDlZ4QQHwdeEoMT+2tooRDPdq5PXgyvCBz
         f2ytzWZVsJNQsKcEQsdmwXAvfLD/BE7Z4XmJB4TtGP24iOYcbFFd33SFOfSsOEMhNdZ0
         xT4kRWLf3yffpwKQUQsKDXL7CpO8NOui/uPUQwE9ofVKLX3bSlW6En0qgDsrO0ZQcgjN
         kj3g==
X-Forwarded-Encrypted: i=1; AJvYcCVBRBPKokiR6h5S8Go1JMsXj01OTC7kyMquUYgZx3gwscbS87kCqS/5nvVDWs1VCvRw3FJqOwqqARtOIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZiuLKn3blRUtOS0IHx7X6ds5GSxWOZNcIxgrue4U+Rfoy0fqZ
	8njeTf0nVOq6hulqZT/cdnAmuHkF/RfiX6vcGvshP52z84hq+/ySEK8LH7Ul/+/Lex/dMxnou3d
	eIP/nQ/e5
X-Gm-Gg: ATEYQzysiTuOISOof+qsklmIQyix4awiSj7UnC6/COqt8bSOUCcH0O4EDtjTTvjaIrA
	hrSesOw6qoaZrDUhoBBpPH76nwo+GlY4oys7rpvhzKnsX/oe2m5q4LJ02JkDwWSBTaO3kHjX9F5
	+Bu9PSPyarW/sAeBmREFCg4KV1SRMKOBmI6Jo1BIGgYLMqsSRuW8IJ2VS7/ne67PdTBur4GeLyZ
	MpHKjTq441kDpEUwh/J5DYZdR/Glu5Elcf8VPyvR1OXrt/tlttGlLO7yzM/cg+62cwQYa/icMuj
	UX/oj7P5naBECF2yXIiVTY49ZmJPlyx/978nkOFVQgXIQeVV5HvOnoJapWan+IRSHum2/tl9p7X
	WYPXFwW+ILX0zrul3mnncKxk8eY0kmLL1AN/z43+gKi75SH3yo9C2pxnpym6aBA5m649vFNXmlB
	FZUPONe14Sr0JSG01duqS+Cms32Rmdw2pKFUVCQ8xkY7BVXto4Fe+iICvIhKapzQ==
X-Received: by 2002:a17:906:f593:b0:b98:458e:2b99 with SMTP id a640c23a62f3a-b98458e42a5mr846437866b.38.1774304705189;
        Mon, 23 Mar 2026 15:25:05 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871003sm556788566b.54.2026.03.23.15.25.04
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:25:04 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so4103641f8f.2
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 15:25:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8ZK3mid1TG6rwgHk1FK68S8848K951NpjFC6RRDU33MeLi/9pzOO9gpwlh5FRRgSAoHju9eMPq7gz8Q==@lists.linux.dev
X-Received: by 2002:a05:6000:420a:b0:43b:498f:dcec with SMTP id
 ffacd0b85a97d-43b6423287dmr21077499f8f.3.1774304703536; Mon, 23 Mar 2026
 15:25:03 -0700 (PDT)
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
 <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com> <6511a5b9-ac67-49a1-8336-3d2afaaab593@rowland.harvard.edu>
In-Reply-To: <6511a5b9-ac67-49a1-8336-3d2afaaab593@rowland.harvard.edu>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Mar 2026 15:24:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBgKN2MNO-xBHZ3tRN91M82vk3h1AEAXtpBQ-nQocKCQ@mail.gmail.com>
X-Gm-Features: AQROBzDRoysFzvcPUTGmT6MRxrhQA35lr81_ptAKZ8zLO5ZaZ49Cvz0mD_9klew
Message-ID: <CAD=FV=WBgKN2MNO-xBHZ3tRN91M82vk3h1AEAXtpBQ-nQocKCQ@mail.gmail.com>
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 23, 2026 at 10:47=E2=80=AFAM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Mon, Mar 23, 2026 at 10:07:01AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Sat, Mar 21, 2026 at 8:54=E2=80=AFAM Alan Stern <stern@rowland.harva=
rd.edu> wrote:
> > >
> > > > > > I'd also note that the only actual symptom we're seeing is with
> > > > > > fw_devlink misbehaving (because dev->fwnode->dev wasn't set ear=
ly
> > > > > > enough). fw_devlink is a "new" (ish) feature, is officially opt=
ional,
> > > > > > and isn't used on all hardware.
> > > > >
> > > > > That's true too, can we set that earlier?
> > > >
> > > > Yes, I can post a patch that _just_ moves the set of dev->fwnode->d=
ev
> > > > earlier, and that will probably fix my symptoms (I'll need to test)=
.
> > > > This patch already moves it a bit earlier, but if we don't break th=
e
> > > > linking out as a separate step it would need to move even higher up=
 in
> > > > the function.
> > > >
> > > > Originally, I was going to just propose that, but then I realized t=
hat
> > > > some of the other code in device_add() probably also ought to run
> > > > before we let the driver probe, and hence I ended up with this patc=
h.
> > >
> > > This sounds like a more generic problem.  A bunch of things happen af=
ter
> > > bus_add_device() that should be completed before probing can start; t=
he
> > > firmware node stuff is just one of them.
>
> You know, I wrote this but I'm not so sure that it's accurate.  We've
> gone many years with no big changes to this code; most likely it doesn't
> need alterations now.

That's fair, but I'm really just worried that the Android parallel
module loading code, which is only ~1 year old (and needs to be opted
in for each device) is stressing things in a way that nobody else is.
In most distros, I think modules are loaded "on-demand". A device gets
added first, and then we figure out which module has the driver that's
needed and load the module. Nice and sequential. Android seems to have
a different approach. As far as I understand it just has a list of
modules to load and slams through loading all of them even as devices
are still being added.

I don't think that what Android is doing is technically "wrong", but
it's certainly odd compared to all other distros.

Unless we say that what Android is doing is wrong (and decide what to
do about it), it seems like we need to make sure it's robust.


> > > Splitting bus_add_device() in two sounds reasonable, although I would
> > > rename the old routine to bus_link_device, since all it does it add s=
ome
> > > groups and symlinks.  The new routine can be called bus_add_device().
> >
> > LOL, so basically you want them named exactly opposite I did? That's
> > OK with me, though maybe:
> >
> > bus_prep_device()
> > bus_add_device()
>
> Nothing wrong with those names.  But instead of making these fairly
> intrusive changes it might be better just to move the firmware stuff to
> a different place in the code (you mentioned this possibility in your
> first email).  It would be a smaller change, that's for sure.

I'll do that if that's what everyone wants, but the more I think about
it the more worried I am that we'll end up with a hidden / harder to
debug problem where some driver gets unhappy when its probe is called
before dpm_sysfs_add(), device_pm_add(), device_create_file(),
device_create_sys_dev_entry(), BUS_NOTIFY_ADD_DEVICE, ...


> > > The real question is whether any of the other stuff that happens befo=
re
> > > bus_probe_device() needs to come after the device is added to the bus=
's
> > > list.  The bus_notify() and kobject_uevent() calls are good examples;=
 I
> > > don't know what their requirements are.  Should they be moved down,
> > > between the new bus_add_device() and bus_probe_device()?
> >
> > Yes, this is my question too. The question is, what's worse:
> >
> > 1. Potentially the device getting probed before the calls to
> > "bus_notify(dev, BUS_NOTIFY_ADD_DEVICE)" and
> > "kobject_uevent(&dev->kobj, KOBJ_ADD)"
> >
> > 2. Calling "bus_notify(dev, BUS_NOTIFY_ADD_DEVICE)" and
> > "kobject_uevent(&dev->kobj, KOBJ_ADD)" without first adding to the
> > subsystem's list of devices.
> >
> > As it is, my patch says #2 is worse and thus allows for #1. ...but I
> > don't actually know the answer. The main reason I chose to allow for
> > #1 is that it makes the behavior less different than it was before my
> > patch, but that doesn't mean it's correct.
> >
> > Reading  through a handful of "BUS_NOTIFY_ADD_DEVICE" calls, my guess
> > is that they expect to be called before probe... That would imply that
> > my patch made the wrong choice...
>
> I don't know about other subsystems, only USB.  As far as I remember,
> USB doesn't really care about the order of probing vs. notifications.
> In general, since probing can be asynchronous with registration, the
> kernel always has to work with probing after bus_notify().  It's
> best to preserve that order unless there's a very good reason not to.
>
> uevents may be different, since they go to userspace.  It could be
> weird for a user program to be told about a new device and then not be
> able to find it on the bus.
>
> > I think another option here might be to just add a new bitfield flag
> > to "struct device", like "ready_to_probe". Right before the call to
> > bus_probe_device(dev), we could do something like:
> >
> > device_lock(dev);
> > dev->ready_to_probe =3D true;
> > device_unlcok(dev);
> >
> > Then in __driver_attach() I can have:
> >
> > device_lock(dev);
> > ready_to_probe =3D dev->ready_to_probe;
> > device_unlock(dev);
> > if (!ready_to_probe)
> >   return 0;
> >
> > If I do that, I don't think I'll even need to re-order anything, and I
> > think it's all safe. Basically, it just the device hidden from the
> > __driver_attach() logic until probe is ready.
> >
> > What do you think?
>
> There should not be any difference between probing caused by the device
> being added to the bus, vs. caused by a new driver being registered, vs.
> caused by anything else (such as sysfs).  None of these should be
> allowed until all of them can be handled properly.

Right. ...and I think that's what my proposed "ready_to_probe" does.
It really does seem like quite a safe change. It _just_ prevents the
driver load path from initiating a probe too early.


> And linking the device into the bus's list of devices should be the
> event that makes probing possible.

Sure, but moving the linking into the bus's list of devices all the
way to the end is definitely a bigger change. If nothing else,
"bus_for_each_dev()" starts to be able to find the device once it's
linked into the list. If any of the ~50 drivers who register for
BUS_NOTIFY_ADD_DEVICE are relying on the device to show up in
"bus_for_each_dev()", it would be bad...

-Doug
