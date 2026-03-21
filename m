Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF42396589
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 15:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774108446; cv=none; b=iuFhbxN2d9xuuZZ5YqlN4ssQr3uaqDwA2D10F0Q8ekCQQQP/wfqdX6DMe6r60xs358diyQ8Hcr2jBF6Y/m/vLU7viAL+Qv71w55xoflsUfC9mFuMw+BJzIY1Ftpe2u3r6ijWkJOJwZFoQTc5M5sMXw0QhULsfAl1KRDXfu28qM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774108446; c=relaxed/simple;
	bh=lThbFxLQM35GPCAzqXWnZ0lGAfqN2/K8/Rfkj2JsO4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5NafelyDMB1R00MHfiZnsKRy+8jlX6cdljfoS4GOEXq2ul6WZ0hzSEKVsc3p6cZzoe150F2LEMl3XWUu7Ew6nzcNdJprx0R2nPcSAikGZ8X8V1COoicoH1X4D7BYVA0sDol94YNTYY2lykX8g145xEyBnsS70UbotCyp7XjjPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=B5tLzVEs; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="B5tLzVEs"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c70b5594f4so336678185a.1
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774108444; x=1774713244; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PjkElUreCSm3Pff79vFh1ZyOTyQLwaGB7r9je7XctHE=;
        b=B5tLzVEsjn4+0tHL41zfBUjhu2eW8un5jiOJigVOiImFq0GK+3xjsj+Ah31I8duRxY
         foSXQcJjXMgGcalR1JJ3oVvvcW6ZohVLKSnsRpMoVkrnty0m6HyH5FhcX91NzFeNnSGw
         cA3pLHPCuEBO7KQY7TRA17q65bN7d6g8UGYmXUksp/fZcUu1b3OV0bRuhvoRW2tPotVw
         BRlEm0FhcxrqJFrUv9CzQ8IjfF6PXPyXNxb0OblbloY1C5e4rJNtR7v2NLt0DCb8oM8A
         ZOsjeZLnMccqc+NgEeSqUAUz62p6j54i4Ihlz/TLa579Acad8+NZVnwD3/2KH23lF+gQ
         rWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774108444; x=1774713244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PjkElUreCSm3Pff79vFh1ZyOTyQLwaGB7r9je7XctHE=;
        b=j4/YD5nH3Ns3cAXIV+ZHDS6TI1Nx/CetQK58srIW5C0a+x+BW8W2IpWkhO+XWd2TDX
         lbH/o+MYAo30lzRsOR20910F0uNs6HR2n+u5SMRia6rebxa1nddTV3n2jAmtWHoWORZc
         m8kM0/iTEfUV/iLC12JXsS8rHkgwR8ktigZy1Yk3moaiO3V53TDlWzgG7x9JQKY1bOW+
         rMeeLSvDeodCmMwycHJ8XOfkT6FzZY18nH+ZXh6DtCBY7vu+Ks+q1HXsVh+AQtQXt834
         lz8RK53ebyyQA/BVL/6ADN0w+D2k4ujkeKZwiZBpY37Un1PXfG9FDelvSHBYuoG/bKJe
         AnvA==
X-Forwarded-Encrypted: i=1; AJvYcCXxIZDTRb7OmtPEmrCeedv7sUXd4X4X/nmSgdjhqGskYxszJpQT84/xt7ERbfkptINovuaV1dr62Etwxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnnNb4aky6opx3FxAaPitUe9U5l/2vNnlKP01Y0rxU6frajG2M
	jmsuZtJyd+wVIpZ7SJtjI449yYy1hs2To9UpSBjCOwNlyjAqHm3+GlGhCebjYbAjQg==
X-Gm-Gg: ATEYQzw7EjTimZVkT0sSgodbtfZ8SUj+UwKPQWoQmof/4xZtheDaQVpEUtlvz4HpbMq
	09YZRLbWfzxCKeslsRkB3hqhuvYVXSMcDiqMMy2fhMQPmijwXkgPAPH9MrPHuTcJj1Iu3WmwtuT
	GS5JGQGg1X8DeBIcCo7J3xWP8msXeuUUwz2O7j+v6uKr8X3jdSllMrIl+gcNQdSZqLYXQ/o86ME
	B2Ey48p5QFsWGUfq9SpFbUvci1d6p6k3afwECa8Qpnslktij+yXRERKqmOCSqOWUQOpSCJqTy3Y
	6HWr7+gXRpKdWj+PlUzAN2l9F+cY3bFyCPv0Cbog+a0sHzOe/CGvE+mJigr6fomyyndZOGWOHDj
	DDdJqUd3bEYJKdgymtl7l/TpRqjAtdiciw7cbaeKHNfm70ZmSvKnF1v35pssVq4md56RP6aFdGV
	8fsG67fXBjtlnMHaHswxd0gx0=
X-Received: by 2002:a05:620a:4694:b0:8cf:d1fa:7b41 with SMTP id af79cd13be357-8cfd1fa7dfdmr652813185a.34.1774108443943;
        Sat, 21 Mar 2026 08:54:03 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::b00])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f94b04sm423144585a.17.2026.03.21.08.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:54:03 -0700 (PDT)
Date: Sat, 21 Mar 2026 11:54:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
Message-ID: <6ff1444b-f83e-47f6-ab0d-6745738523ba@rowland.harvard.edu>
References: <20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <2026032152-getting-carmaker-29d5@gregkh>
 <CAD=FV=Wag5qx9RXkAHrf+zbwtQgVQW1UUc6DRhUzudBtjbD8ug@mail.gmail.com>
 <2026032114-unlocked-unmoving-091b@gregkh>
 <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>

On Sat, Mar 21, 2026 at 01:05:48AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Sat, Mar 21, 2026 at 12:42 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Mar 21, 2026 at 12:35:32AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Fri, Mar 20, 2026 at 10:41 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Mar 20, 2026 at 08:06:58PM -0700, Douglas Anderson wrote:
> > > > > The moment we link a "struct device" into the list of devices for the
> > > > > bus, it's possible probe can happen. This is because another thread
> > > > > can load the driver at any time and that can cause the device to
> > > > > probe. This has been seen in practice with a stack crawl that looks
> > > > > like this [1]:
> > > > >
> > > > >   really_probe()
> > > > >   __driver_probe_device()
> > > > >   driver_probe_device()
> > > > >   __driver_attach()
> > > > >   bus_for_each_dev()
> > > > >   driver_attach()
> > > > >   bus_add_driver()
> > > > >   driver_register()
> > > > >   __platform_driver_register()
> > > > >   init_module() [some module]
> > > > >   do_one_initcall()
> > > > >   do_init_module()
> > > > >   load_module()
> > > > >   __arm64_sys_finit_module()
> > > > >   invoke_syscall()
> > > >
> > > > Are you sure this isn't just a platform bus issue?  A bus should NOT be
> > > > allowing a driver to be added at the same time a device is being added
> > > > for that bus, ideally there should be a bus-specific lock somewhere for
> > > > this.
> > >
> > > Sure, if the right fix for this is somewhere in the platform bus code
> > > then I'd be happy with a patch there to fix it. ...but from my quick
> > > glance (admittedly, it's Friday night and I'm tired), it seems like
> > > the problem is just with driver_register() being called at the same
> > > time as device_add().
> > >
> > > Certainly adding some sort of locking could be a solution (happy for
> > > someone to tell me where to place them), but we'd have to make sure we
> > > aren't regressing performance for the normal case...
> > >
> > >
> > > > When a device is added to the bus, yes, a probe can happen, and is
> > > > expected to happen, for that device, so this feels odd.
> > > >
> > > > that being said, your patch does seem sane, and I don't see anything
> > > > obviously wrong with it.  But it feels odd that this is just now showing
> > > > up for something that has been this way for a few decades...
> > >
> > > I suspect it's a latent bug that was triggered by a new Android
> > > feature. It's showing up on phones that have
> > > "ro.boot.load_modules_parallel" set. I think you can get to the
> > > relevant source code at:
> > >
> > > https://cs.android.com/android/platform/superproject/main/+/main:system/core/libmodprobe/libmodprobe.cpp?q=LoadModulesParallel
> > >
> > > I suspect the bug is never triggered with more normal module loading
> > > schemes. Indeed, one phone that has nearly the same set of drivers but
> > > has parallel module loading turned off has no reports of this
> > > problem...
> >
> > Ah, I think we always assumed that modules can NOT be loaded in
> > parallel, isn't there an internal module lock that prevents this from
> > happening?
> >
> > So yes, that might be the root problem here.
> 
> It's late Friday night for me (technically Saturday morning), so I'm
> not going to dig now. ...but I'm fairly certain that Android isn't
> using any downstream kernel patches to accomplish its "parallel module
> loading". It's just userspace jamming modules in as fast as it can.
> Userspace loading modules quickly shouldn't cause the kernel to behave
> badly.
> 
> If the right solution is to add more locking to the kernel to slow
> userspace down, that is also something I could try. It will likely end
> up impacting boot speed, but of course correctness comes first. Let me
> know if this is a direction I should dig (or someone is free to post a
> patch and I can test it).

As far as I know, there's no particular reason why modules shouldn't be 
loaded in parallel, or at least, in very quick succession.  Locking 
shouldn't matter either -- that is, the existing locks ought to be 
adequate.

> > > I'd also note that the only actual symptom we're seeing is with
> > > fw_devlink misbehaving (because dev->fwnode->dev wasn't set early
> > > enough). fw_devlink is a "new" (ish) feature, is officially optional,
> > > and isn't used on all hardware.
> >
> > That's true too, can we set that earlier?
> 
> Yes, I can post a patch that _just_ moves the set of dev->fwnode->dev
> earlier, and that will probably fix my symptoms (I'll need to test).
> This patch already moves it a bit earlier, but if we don't break the
> linking out as a separate step it would need to move even higher up in
> the function.
> 
> Originally, I was going to just propose that, but then I realized that
> some of the other code in device_add() probably also ought to run
> before we let the driver probe, and hence I ended up with this patch.

This sounds like a more generic problem.  A bunch of things happen after 
bus_add_device() that should be completed before probing can start; the 
firmware node stuff is just one of them.

Splitting bus_add_device() in two sounds reasonable, although I would 
rename the old routine to bus_link_device, since all it does it add some 
groups and symlinks.  The new routine can be called bus_add_device().

The real question is whether any of the other stuff that happens before 
bus_probe_device() needs to come after the device is added to the bus's 
list.  The bus_notify() and kobject_uevent() calls are good examples; I 
don't know what their requirements are.  Should they be moved down, 
between the new bus_add_device() and bus_probe_device()?

Alan Stern
