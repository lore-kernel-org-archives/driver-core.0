Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6C53491DB
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774080368; cv=none; b=Pva4e92xOGJcgBPT5e8OFnH9N9xgTj5LWNYKxBnYmovNTNKRX2GJGl53B0dh+qoMhIeS7Lt2oLzY5XDV1qcJuBeCgVCLtL0DT77zgSomzStIaTJusmjIex/NavL3xkbn5yV6QwR6KZwTW7yQO7xGsgbt7yxIjfzAp6NcuwV08PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774080368; c=relaxed/simple;
	bh=2s68hzYNGh4mCdQSBcdofjVj6JnV9wGLi01EF10aUdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNo7HvpY6HGYHnYaxjcqSoh6vupieFCPTgz+hY+bMwXnCpP4A0rEz+QFS27YDqrXiaMZP+qkf8g8+VPzAX8Cni4Ij999Gb0/K1VNJM7STkHsf2FzzTWjeHeTGUINEQ0zfN5jMst6Z41HcZq4UnGZwHX6I3Zs2V4oEaOpgaEFaqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PQgPvTTE; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PQgPvTTE"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-666f646f5cfso5640567a12.1
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 01:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774080363; x=1774685163; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPwatB8nwbheTC/o1xIGXmmqpvBr+XI1waV3gj8TSWU=;
        b=PQgPvTTEuT4TCS8VZRi3/yOosBR5d05bu8ZdDhSpLqs+1vKijhne0F14H+ottMZDpP
         9nXzsX3TqjX/mEQSPFw60NNQ8sMKSJ8BPzDWbwMKHktFpCZMlkZVL0iFnxEuQw7ofrMV
         OCq1tHMU/kEBL9vVReUq161bdYEmKlIJGMQso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774080363; x=1774685163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GPwatB8nwbheTC/o1xIGXmmqpvBr+XI1waV3gj8TSWU=;
        b=gaMI71hijFpODh3a3yZUY8nWtGZeB5q/BXqGS4rgLHMX6BtZd3OIXTp7HkBLrlk6X9
         UZtSgVKUIz9dE4LLEuy6xsnsrMnRLV5kVSrpA5FmsSPDdxu4U97id0cYQvYVrui4Fpdt
         22LPCsZLtQ5MVQiZvA50Zj4/6emb3iwY3wjAUhhj1runAasCST4nA9J4glcBeVP2H6cD
         FpoulVWHY+1F9wmBpOw+7Su6I/Z1bkymJrCVXnafvU3OHDPxri3Dk1fLjRPKS+Kygtwm
         JqkM0t0YOmhdGoilj3lLz8xqH5b/3Sb3t/HxNPPomWDKZaZDO8cwfIwYPGE0Ucz1bWG6
         dzwg==
X-Forwarded-Encrypted: i=1; AJvYcCXk6a6u12ztv/qpOGXVSc6rHHwXjxIgwRALbpXNXUogfRvzn4fxCp0W3JmN7seVGqzOqnLJEgjp00MdHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzW14wRTY2daV0lqgtFlBkERpLOtevUr/nGi/ipNIbgEmhrv23j
	hKGqDU66OU1qyvih6ieXTo9OTWeFsc/JfbP4Cg1Z+xWMGs5aA3QtjYdtmBwmpRAoJq/AeFN2/rI
	qTg5uRsdc
X-Gm-Gg: ATEYQzwYds2eW4lAzoF96vuww14EtezoBNyyf+Z3l2BwW5L/ajNZxZWWu7gYSBkUK5t
	dz9VXBnVkFkqQgcgB5VFRZaRq8F+VFTuka+oelLK0ndYHFqANqc2zrLgL0383YFPtO8o/oloQRN
	sGzRklvDX9fbi1aJiEDop6q78OBH3GQK9542yQaRKPGnxKMx2/bUTzLbq8lwsY/YcBlCAhor0R2
	W3ogLwK0dcv9ljKJ8mGP/8NnABfhMHmq4fnkfSt9F2A8cFgQ8EHj10/H8JXl9/X9zy5spY3esmK
	TpWMT+MkmokO65i9+XsuNevO5g0iyNalg5h5v4m2hAEl1s0Sw6yZbvYmv3vGdXD1KPl9l9e1yjK
	yIpxmiHNnXr8p42c9d2KTCxUwDe76Lpza2VbHmgluwHqkgb+mihfKs8W7CAB1zadzuEvfKGd0mc
	K5z1heFxemszYGlik4T0Q8kPA4lTQ6DGD9RWUTrPw4WU7zZ5i7965SITJLmn4bJQ==
X-Received: by 2002:a17:906:c102:b0:b96:f4f6:2a02 with SMTP id a640c23a62f3a-b980faad336mr672976066b.25.1774080363074;
        Sat, 21 Mar 2026 01:06:03 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832fdcd36sm235288266b.28.2026.03.21.01.06.01
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 01:06:02 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2532261f8f.1
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 01:06:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZZ4NTrhvgUVEOZkeNqyZbb7b/I5VZWdbm8gYIeLzlEnutofaSHHtWtsmGfI/GOfBn1YBumE1YSbheVA==@lists.linux.dev
X-Received: by 2002:a05:6000:2409:b0:439:c078:9a57 with SMTP id
 ffacd0b85a97d-43b6428769cmr10495014f8f.25.1774080360308; Sat, 21 Mar 2026
 01:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <2026032152-getting-carmaker-29d5@gregkh> <CAD=FV=Wag5qx9RXkAHrf+zbwtQgVQW1UUc6DRhUzudBtjbD8ug@mail.gmail.com>
 <2026032114-unlocked-unmoving-091b@gregkh>
In-Reply-To: <2026032114-unlocked-unmoving-091b@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 21 Mar 2026 01:05:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>
X-Gm-Features: AaiRm52s-9URaw6TU84sMrns19yrErBQbts8yoJ0kNLkR9r4G1S7vxdHuEDDBiQ
Message-ID: <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 21, 2026 at 12:42=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Mar 21, 2026 at 12:35:32AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Mar 20, 2026 at 10:41=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Mar 20, 2026 at 08:06:58PM -0700, Douglas Anderson wrote:
> > > > The moment we link a "struct device" into the list of devices for t=
he
> > > > bus, it's possible probe can happen. This is because another thread
> > > > can load the driver at any time and that can cause the device to
> > > > probe. This has been seen in practice with a stack crawl that looks
> > > > like this [1]:
> > > >
> > > >   really_probe()
> > > >   __driver_probe_device()
> > > >   driver_probe_device()
> > > >   __driver_attach()
> > > >   bus_for_each_dev()
> > > >   driver_attach()
> > > >   bus_add_driver()
> > > >   driver_register()
> > > >   __platform_driver_register()
> > > >   init_module() [some module]
> > > >   do_one_initcall()
> > > >   do_init_module()
> > > >   load_module()
> > > >   __arm64_sys_finit_module()
> > > >   invoke_syscall()
> > >
> > > Are you sure this isn't just a platform bus issue?  A bus should NOT =
be
> > > allowing a driver to be added at the same time a device is being adde=
d
> > > for that bus, ideally there should be a bus-specific lock somewhere f=
or
> > > this.
> >
> > Sure, if the right fix for this is somewhere in the platform bus code
> > then I'd be happy with a patch there to fix it. ...but from my quick
> > glance (admittedly, it's Friday night and I'm tired), it seems like
> > the problem is just with driver_register() being called at the same
> > time as device_add().
> >
> > Certainly adding some sort of locking could be a solution (happy for
> > someone to tell me where to place them), but we'd have to make sure we
> > aren't regressing performance for the normal case...
> >
> >
> > > When a device is added to the bus, yes, a probe can happen, and is
> > > expected to happen, for that device, so this feels odd.
> > >
> > > that being said, your patch does seem sane, and I don't see anything
> > > obviously wrong with it.  But it feels odd that this is just now show=
ing
> > > up for something that has been this way for a few decades...
> >
> > I suspect it's a latent bug that was triggered by a new Android
> > feature. It's showing up on phones that have
> > "ro.boot.load_modules_parallel" set. I think you can get to the
> > relevant source code at:
> >
> > https://cs.android.com/android/platform/superproject/main/+/main:system=
/core/libmodprobe/libmodprobe.cpp?q=3DLoadModulesParallel
> >
> > I suspect the bug is never triggered with more normal module loading
> > schemes. Indeed, one phone that has nearly the same set of drivers but
> > has parallel module loading turned off has no reports of this
> > problem...
>
> Ah, I think we always assumed that modules can NOT be loaded in
> parallel, isn't there an internal module lock that prevents this from
> happening?
>
> So yes, that might be the root problem here.

It's late Friday night for me (technically Saturday morning), so I'm
not going to dig now. ...but I'm fairly certain that Android isn't
using any downstream kernel patches to accomplish its "parallel module
loading". It's just userspace jamming modules in as fast as it can.
Userspace loading modules quickly shouldn't cause the kernel to behave
badly.

If the right solution is to add more locking to the kernel to slow
userspace down, that is also something I could try. It will likely end
up impacting boot speed, but of course correctness comes first. Let me
know if this is a direction I should dig (or someone is free to post a
patch and I can test it).


> > I'd also note that the only actual symptom we're seeing is with
> > fw_devlink misbehaving (because dev->fwnode->dev wasn't set early
> > enough). fw_devlink is a "new" (ish) feature, is officially optional,
> > and isn't used on all hardware.
>
> That's true too, can we set that earlier?

Yes, I can post a patch that _just_ moves the set of dev->fwnode->dev
earlier, and that will probably fix my symptoms (I'll need to test).
This patch already moves it a bit earlier, but if we don't break the
linking out as a separate step it would need to move even higher up in
the function.

Originally, I was going to just propose that, but then I realized that
some of the other code in device_add() probably also ought to run
before we let the driver probe, and hence I ended up with this patch.

-Doug
