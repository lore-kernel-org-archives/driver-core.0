Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3C437FF4D
	for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 19:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639870; cv=none; b=jTQxVwB7e6ssD5DUiLhXtbtioFbseDtD2bdEYTxaaVjtRuYi+S5ZI9JKuASnqkWAIdwJeG/J5yN2LVNzXcJv5nRe0ulPrIEpWIyAfmtGtCUdlnfwo+Rj3j1o687LBsMCc2XskArx34CEJVMPwgjHGfG58YAJVDpozsV7/ioQ6e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639870; c=relaxed/simple;
	bh=UdbT8M+h+T/8FIRyzyUEwSC00Y3Lxmg3ItzAi+c/6HQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqJu+lvG1epV2z6BC7aBifm0f2KQu0dmMXPgiE/CCzJGnXM9/P8lJxTuzRz0R6nzBsdXKmSAOfgvgZZFjk7VvbXBlqR5nS+uOOKjlVmF3HzyOJ5QGDHPV6v/OSyhnv0Ff9ZvEFbmBu8lFgq+JT4DnGyOiQ2mlLpOl5QyUMeULAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j/MJdhts; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j/MJdhts"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b982d56dac4so409560066b.3
        for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 12:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774639862; x=1775244662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99gWaYSzjnyq01Amp2SCb6AR3PTrEPRcQ1jAAPcG8L8=;
        b=j/MJdhtsFOX1T7lrw4Wp4DZZdHZFiNe0KYXz853NXbHEWWCBnVhGKFrhaPenSIQyWL
         MpWM1ijsrienwvGwaSdQkS9tMnI3hRL1LwOCx8Z56/VtQQ0dLbzQbDA3GnT5s3HIQvj/
         70zKaWG9KqR7MAoqtyM1I4VrSdbMZsXSHnY3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639862; x=1775244662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99gWaYSzjnyq01Amp2SCb6AR3PTrEPRcQ1jAAPcG8L8=;
        b=Es1cJYeUCSQ2FTJyArZSgWpCG46R53KmD0TZCvYhtu+bUdNZ/wY/8SjbEC2GNF8km9
         3ZIzpX22CgoxU8X5zyNR4vXmER2oa0R85rtjZ/YlNSBaBmRra7uDWsCY+fBNqdsCZ7fQ
         qMJdMO9wKU7mvBGPdScrlYEO36R466aCFsLGkN3go7PTVEGAb8FIXY6qXy3E/soL6dJL
         2fWnAY4VLkHb2cLcsIMZGn6ng3kcvXHMOYiaAQEEVhAhfskXIT3vrEWdIbOiCToCEpT8
         CHYhwryFMI8UkGbX41FBncFdOncc60Hykg2Gtyo+0H1S06TBnEfHriRSPVULy216PPTk
         ndGw==
X-Forwarded-Encrypted: i=1; AJvYcCWz5pMB5P2KjuP7x4OyZnkb1s4gaw0R0sPIaeynN8pT+Z+IjuKH4JKDxzVqjkF5H6clpmQWp9ta5IG6gA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy93pBYjxbpF73yHdA/x0Mw2ery+640MJxJ6Ile1FyDpRG5Gm94
	SLtn6unZh5UbBPkkdxjYoc0/NKmeK1eGJhwA6A3vLYDACzX8C0DQxi7IiFp0GPQCobbdjHADJjZ
	zJXEwUA==
X-Gm-Gg: ATEYQzytYzVn3xl3R9GFQWQA/alyqNF4evnjXnoNhZA0x+4pnUM4OB6yKUU41ARbGDz
	vltFa3Z47PqgSaQ7w8i1SEOCDz3IIV+/npisWyOmqRBzY2NuW8O1z698sBok46vbzr1jkSPleK5
	vjXfjUCBUbJv2Sab93rrfKf7Z6A6gkQZK6ZMd6j1lgGsjT8yoJE24qmUQt26GMb8bsZdJJR256N
	a5Z3M3JY+UtvzuybW7ArcUFGZxw1a7G7FiBlEIaxBLF9HLLR5aS7/gcK0Op36CYi9FVz+09/TcY
	TSfjGBbZFdyjRNMZPxpBIbAZ8rJdcM3R8KZLulZyEhtkjdMG8Cv9cces67LraqslHjSJ53acgmr
	17kugkuqQXm4DwH4+FQczH4gq2bPbQCS+8HM5qkBnAqIpKEwYfOAS71cODUj+VKCj1/Lfu/wHrs
	W2eYP+oVzyz8bOZsAo+oLs4KNhmIOMFzEyP6Mwttq0n19FezH3ayydOOUwJvD17A==
X-Received: by 2002:a17:907:9621:b0:b98:13a:c92e with SMTP id a640c23a62f3a-b9b502b5aa6mr271355066b.2.1774639862380;
        Fri, 27 Mar 2026 12:31:02 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae269ddsm6216566b.5.2026.03.27.12.31.00
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 12:31:02 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b9b190easo1737087f8f.2
        for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 12:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5RTTaumsHKa0yl90CkBSbkgxEO7+rtq3pCLu3EfB5lWyxKt6GoFT4MPIFu0c/EYiiE4VG2wTHsoJZHQ==@lists.linux.dev
X-Received: by 2002:adf:f5d0:0:b0:43c:f1da:488b with SMTP id
 ffacd0b85a97d-43cf1da494emr250211f8f.30.1774639859273; Fri, 27 Mar 2026
 12:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026032152-getting-carmaker-29d5@gregkh> <CAD=FV=Wag5qx9RXkAHrf+zbwtQgVQW1UUc6DRhUzudBtjbD8ug@mail.gmail.com>
 <2026032114-unlocked-unmoving-091b@gregkh> <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>
 <6ff1444b-f83e-47f6-ab0d-6745738523ba@rowland.harvard.edu>
 <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com>
 <6511a5b9-ac67-49a1-8336-3d2afaaab593@rowland.harvard.edu>
 <CAD=FV=WBgKN2MNO-xBHZ3tRN91M82vk3h1AEAXtpBQ-nQocKCQ@mail.gmail.com>
 <bfd4e1f5-7bc5-448d-aa33-1a977bf00733@rowland.harvard.edu>
 <CAD=FV=WeeBoQAoPgNq+5ocZas+mOn1RuNto3k57ag4ODo2vOLw@mail.gmail.com> <852cd509-4ce1-4b22-ab1f-b9b9bbf6a52e@rowland.harvard.edu>
In-Reply-To: <852cd509-4ce1-4b22-ab1f-b9b9bbf6a52e@rowland.harvard.edu>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Mar 2026 12:30:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UroO1vQYJDkrp86D475F8b-RStUXYejWwTQ0NqP1a_ew@mail.gmail.com>
X-Gm-Features: AQROBzB1FKb3rh0thX0FLzEGHt2HXFbkx3ukymP0tbJUZxNnXoTJGwjGT2c25ZE
Message-ID: <CAD=FV=UroO1vQYJDkrp86D475F8b-RStUXYejWwTQ0NqP1a_ew@mail.gmail.com>
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 27, 2026 at 11:46=E2=80=AFAM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Thu, Mar 26, 2026 at 02:49:33PM -0700, Doug Anderson wrote:
> > > > Right. ...and I think that's what my proposed "ready_to_probe" does=
.
> > > > It really does seem like quite a safe change. It _just_ prevents th=
e
> > > > driver load path from initiating a probe too early.
> > >
> > > Any such consideration should apply to all the probe paths, not just
> > > driver loading.  (Also, if it's too early to probe the device, perhap=
s
> > > the return code should be -EAGAIN instead of 0.)
> >
> > In my proposed solution, I was returning 0 from __driver_attach(). The
> > only place that's called from is driver_attach(), which calls it with
> > bus_for_each_dev(). I don't think returning -EAGAIN is a good idea
> > there since it stops bus_for_each_dev(). In general __driver_attach()
> > always returns 0.
> >
> > In general, the goal of my new proposed patch is to add the device to
> > the subsystem's "klist_devices" exactly where we do it today for
> > maximum compatibility. This means that if any code was relying on
> > being able to find the device, they can still find it. The _only_
> > exception is that I don't want to be able to find the device in
> > driver_attach(). So my proposed solution just hides the device in that
> > one case.
>
> But why just in that one case?  That's what I don't understand.  If it's
> not okay to bind at this time on the driver-load path, why is it okay to
> bind on other pathways (such as bus.c:bind_store())?

Ah, I see!

Yeah, OK. I spent more time, and I think I've a patch that will
address things. I still like adding the "ready_to_probe" flag and
setting it in device_add() right before bus_probe_device(). ...but
I've changed where I'm testing this flag. Now I've got the test in
__driver_probe_device(), where I simply do:

  /*
   * In device_add(), the "struct device" gets linked into the subsystem's
   * list of devices and broadcast to userspace (via uevent) before we're
   * quite ready to probe. Those open pathways to driver probe before
   * we've finished enough of device_add() to reliably support probe.
   * Detect this and tell other pathways to try again later. device_add()
   * itself will also try to probe immediately after setting
   * "ready_to_probe".
   */
  if (!dev->ready_to_probe)
    return dev_err_probe(dev, -EPROBE_DEFER, "Device not ready_to_probe");

I think that is more inline with your intuition that we should return
some sort of "try again" code when we end up with this situation. This
should also block _all_ probe paths safely by adding to the deferral
list (just in case) or returning -EAGAIN (in the case of
device_driver_attach()).

Does that sound like what you're looking for?

-Doug
