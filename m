Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EF72C17B3
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 21:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774561794; cv=none; b=DtRfS3rc0Z6lcTZsYHKUt6wnmht1ANLD+lol1kEV9rUnm+lqoz9T6/L1yWakP8+xy9w8SJIW1Z1Ojj77qX5E7Q8RAIUK/3nq99hD2KStWuf/1HU0cYm1BoLkx7p6fJOJ09fyrOqGJyGZIFO/nyKK4Amx9IVm1vXS7lxqgGAHtdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774561794; c=relaxed/simple;
	bh=aKLX+hNPaI0XlfoPJagBu5mZrf265cU668okNsNseKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZoe+icQBdQ0zfGSK2MHjhMEWYy9jP13FQdP5Yk5hiLtGYD6Hvg16z2k46ztN1evFBV8JGLvGHfByHFhACphOp2lutwxPrx5RoU9OdC22m16HVbry6+csLrN+LwSETM6TnUNGQyle3pUT0ylOSmmggXeYUEWcPVmsSQcWVhIDUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bRKMIAI0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bRKMIAI0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b941762394aso202944766b.1
        for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 14:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774561787; x=1775166587; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAKkSou4roERMDhHrtw7MaZZUWuXxGKKeAc/MZ02tbA=;
        b=bRKMIAI0cr/fBtQjmQJ+belDcKQRKif0QjbdvDO/1XXRqAR5MNl+s6zIHp6gVs7Lfe
         bnmuSRBeC26e6tRY0l3iXTl0WhZM8aoroLo2zXcozOaG9W1BSMvR5TLz+kcq7TGt9RLa
         pUBLH2qrRaeB5wHfUjdGEaToqW4s3yo9Jk1uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774561787; x=1775166587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VAKkSou4roERMDhHrtw7MaZZUWuXxGKKeAc/MZ02tbA=;
        b=TZ7dArIax1z9H5qzmbPotzvGG41RZSkbeAxXL4JbX1hk8N1ko+2u3vyijYGxuI7h3F
         sdO5YdA0gYGDo6tZ6/vw6jCgy1twf8rchDqJk/KlsbX020YzxAzs4HAMwa5HKqaUSAdQ
         lfbqaSpMCgKCf/I++oiW13gAKy2pTfPdWmpw7sEfICuIlwP6hP1P+OYzZDbC+TSxZNmY
         /pyGn2LFTwWO8yLATbbyUBQ5OLMsBhFgLalOC0D32J+pUT7WyjmaV7fOj1CSjcL/1war
         WBlX4/wN9e8gufnZ7pmBH1ZTPImHm4A5sqgqcfgcxkknZy3vxsqa4LkPyLeXyOkqPIXB
         NHKg==
X-Forwarded-Encrypted: i=1; AJvYcCVIrNEhh9Fs3mvO2qCxhbmh3I4/pb80uffL5bJl+pheV9Zp0yC58IeZuwBVknxQ/8ZiCptCgxQ//2UGSA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6cW70FlQFPWFODxXohBGrEFExMwf1rbVWB3tMvqUvazTTmlRg
	mCzRgRTh3/mMkvsiTGFVHsswDiij3+Aer8FizFk7V759BIYxnxlsUT0hxKwvfdFDzY07TEonk+l
	5k87Amg==
X-Gm-Gg: ATEYQzzNZHUf4ZLnChcAwy9hlaJ6FTQETUgprqOHlgKDAvJvRDhMQwSHQ1CkAZbpFHN
	edhk5DbaxaoCIQZA0zeCOppxkPcxDMJlAi8yMYGDa2R4LFrLGWDXobooyeuB2TWINbSwf1QYG+L
	D8H0UozT1G+YqG5OBTQePtj+vVZVLip4Ea0javhf55YTI2wVxpbB6eIsTgK3+8lxv8FuGMnhSqc
	Efom9WYSGWtNC6WEzuA50/VD5VlhLe8vZpOQm5hTPkslqUY/X6usajeNBreG8FBtrEYb8P1EKmt
	X6FhYKnqCbbvleIcmix6+2ozjnBSmeJ8XoKb7w8/MiNyaZq2dphqnInxWDVmxkMIyqOBPcsPHF1
	HIWp5kZHySAC4t3/5sHWtMAWuGZOAvR8uYFks0gA0Lp4Tg/1XwTCT4jPpEoqGfAWoOCOPYlegE0
	g8Ei3zZiBCa9U7YaSmV8U87ARUXxLau/67KiHIsghNPeQ6n1lwjHBJEwhEWy9sqQ==
X-Received: by 2002:a17:907:971e:b0:b8e:796a:fd5c with SMTP id a640c23a62f3a-b9b507b20camr4303866b.27.1774561787378;
        Thu, 26 Mar 2026 14:49:47 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20218736sm170114366b.12.2026.03.26.14.49.45
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 14:49:45 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so1340508f8f.2
        for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 14:49:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiiQ01PhXMATGNcwmKRNcu0dx/XBSUSpQAk4reWN2Hki3mg+Dqxtq0gXSPgfdhgFa1SiUuVyHKVLDEuQ==@lists.linux.dev
X-Received: by 2002:a05:6000:18a5:b0:439:d755:a895 with SMTP id
 ffacd0b85a97d-43b889f5a83mr15702276f8f.42.1774561785162; Thu, 26 Mar 2026
 14:49:45 -0700 (PDT)
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
 <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com>
 <6511a5b9-ac67-49a1-8336-3d2afaaab593@rowland.harvard.edu>
 <CAD=FV=WBgKN2MNO-xBHZ3tRN91M82vk3h1AEAXtpBQ-nQocKCQ@mail.gmail.com> <bfd4e1f5-7bc5-448d-aa33-1a977bf00733@rowland.harvard.edu>
In-Reply-To: <bfd4e1f5-7bc5-448d-aa33-1a977bf00733@rowland.harvard.edu>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Mar 2026 14:49:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WeeBoQAoPgNq+5ocZas+mOn1RuNto3k57ag4ODo2vOLw@mail.gmail.com>
X-Gm-Features: AQROBzCCSDGRZbt8Tt1gAypD9l0-fhRzQjRInpIAEQRFJCJSpoBx2KceRxCnDFw
Message-ID: <CAD=FV=WeeBoQAoPgNq+5ocZas+mOn1RuNto3k57ag4ODo2vOLw@mail.gmail.com>
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 24, 2026 at 8:21=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> > I'll do that if that's what everyone wants, but the more I think about
> > it the more worried I am that we'll end up with a hidden / harder to
> > debug problem where some driver gets unhappy when its probe is called
> > before dpm_sysfs_add(), device_pm_add(), device_create_file(),
> > device_create_sys_dev_entry(), BUS_NOTIFY_ADD_DEVICE, ...
>
> It's hard to know for all of them.  However, it seems pretty clear that
> device_pm_add() should come before probing, since a probe routine will
> generally want to affect the device's runtime PM state.

Yup, that seems right to me, too. It's why I was trying to avoid just
moving fixing the fwdevlink assignment. I didn't want to run into more
hard-to-debug issues later.


> > > There should not be any difference between probing caused by the devi=
ce
> > > being added to the bus, vs. caused by a new driver being registered, =
vs.
> > > caused by anything else (such as sysfs).  None of these should be
> > > allowed until all of them can be handled properly.
> >
> > Right. ...and I think that's what my proposed "ready_to_probe" does.
> > It really does seem like quite a safe change. It _just_ prevents the
> > driver load path from initiating a probe too early.
>
> Any such consideration should apply to all the probe paths, not just
> driver loading.  (Also, if it's too early to probe the device, perhaps
> the return code should be -EAGAIN instead of 0.)

In my proposed solution, I was returning 0 from __driver_attach(). The
only place that's called from is driver_attach(), which calls it with
bus_for_each_dev(). I don't think returning -EAGAIN is a good idea
there since it stops bus_for_each_dev(). In general __driver_attach()
always returns 0.

In general, the goal of my new proposed patch is to add the device to
the subsystem's "klist_devices" exactly where we do it today for
maximum compatibility. This means that if any code was relying on
being able to find the device, they can still find it. The _only_
exception is that I don't want to be able to find the device in
driver_attach(). So my proposed solution just hides the device in that
one case.

I believe this should be fine. Specifically, driver_attach() could
have been called (in another thread) immediately before
bus_add_device() and everything would have been fine. driver_attach()
wouldn't have found the device (because it wasn't linked in) but the
probe would still happen.


> I'm not at all sure whether the constraints we've got will need to force
> some events to happen after adding the device to the bus list and before
> allowing probing to start.
>
> > > And linking the device into the bus's list of devices should be the
> > > event that makes probing possible.
> >
> > Sure, but moving the linking into the bus's list of devices all the
> > way to the end is definitely a bigger change. If nothing else,
> > "bus_for_each_dev()" starts to be able to find the device once it's
> > linked into the list. If any of the ~50 drivers who register for
> > BUS_NOTIFY_ADD_DEVICE are relying on the device to show up in
> > "bus_for_each_dev()", it would be bad...
>
> I don't know the answer to this.  That is, I don't know if there are any
> notification handlers depending on the device showing up in the bus's
> list.  The safest thing to do is issue the notification after adding the
> device to the list -- which may mean after probing has potentially
> started.  Is there any reason why that would be a problem?  I'm not
> aware of any.

I'm not completely sure I follow what you're suggesting here...


> The order constraints should be commented explicitly in device_add(),
> not just implicitly implied by the code.  Otherwise people won't know
> what changes are allowed and what changes are forbidden.

Yup! I added comments about ordering constraints in this RFC patch,
and will continue to do so as it evolves.

I still believe adding a flag that just hides the device from
driver_attach() is a safe and correct approach. In general I don't
want to fragment the discussoin, but I think it might be useful to
send a v2 that shows what that looks like. Any objections?

-Doug
