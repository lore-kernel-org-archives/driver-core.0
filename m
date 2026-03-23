Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5A426ED28
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 17:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288029; cv=none; b=T7C5tj61+sFewSAUuvEELVvz/yeP8Isr/6YCGKbtYMOa+9QIefa74VFkL6BcYrrx1hqI10cqZ/Ay9VV35B3gzEVw0ud+KH9Y6PXNriTQqH6c3w666uuo4xs88gpast/4fBNBB+Sw5qmPp9poApxP22YhcmRVXLQM2izn1QUqFGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288029; c=relaxed/simple;
	bh=+GV9mEbjh2KEDYk0Ckp6jh8V/RmZayWw9Oe5F0SFdCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7c+FDk/Rwdb0BsmKh/hxh+F6tuL3r9TFe8r/fZeEtTzVXRnL5UozQxD8WFal/VodxVvaBMBLt16pAuvm//ctrmIysL6ysBrDmjJKa/9UIOgGLO+s5teJHC+QaIIAr7+11pov6hmOaUBMGk8nfbn2Xtc7jNBNkm+KIG1VOBSnfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JsNBzmAj; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JsNBzmAj"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899eabc5292so44697416d6.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 10:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774288026; x=1774892826; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zt+MMdT6pvPJKfJL2D/x4ENtbBSrsY+G3nmKWRVjgjI=;
        b=JsNBzmAjrxOvI+2AkZhYeSViHgAicwlY72vjdSVa/2ux0tSYnlSrOiWrNduYm9diyN
         WNlmsZbRoYQ99f8Ere9b6CO6W9Dl6/htSzujtIgkMcOQnoHFEitjuzpiCV2Y2dAsHJNs
         y6g3TfQaAdORQ7MOKEdTgno6nqdzL+7zQLa3JzrycDLXLUeMcp1qUROhnzG7fxa5hoVZ
         cqY6jVlPX/qO1/CuI3PE71XGLmqD0OaL6EIItnQWFr1joeCkNtpl8ZpclD0ksiLW99i3
         LA44Ay9c0UgnWMctsrcxGRgkgXbIVaNsLohbTXGXHqiJu0sWviOkIVT1g7UDZK3byslL
         C7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288026; x=1774892826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt+MMdT6pvPJKfJL2D/x4ENtbBSrsY+G3nmKWRVjgjI=;
        b=QyFX5j7TZLqqjCFOx/J/JhIHo8ILeik79b+iJ4mVVx1O7S0bP/BiJm9J8GT0WCJtXr
         e0Nb0uZ5ODVScvebydYY2xFJOaPMuuACpHDDLyrMTau8KgtOAnzwsk8lL5t1VOVo4Jwv
         EVefj/yhsAi4ZQ0aVbS/LIliLMdp0Z5ck7Booj1jOtQEA7hMnKU4sD/TJ9iQn8hR24TD
         u550UU2Cut834iQQaQ9gx6LZNnG812BIGgwmOO0QMc/ReaGVeJL5ptU+rYjVw4lWQgEB
         tW//fLvNUcA8j2oEOfps2V0qtMkkbPS9HMO2VXnKRKMsviKJrcWuVqLJ7eaUDfWCczfM
         /DFg==
X-Forwarded-Encrypted: i=1; AJvYcCXmfq/L6QxARxXutPuTsPzZj+FXza2B7Vo40d2VLn22fw5S8ETGrm2sW2WG4x97Fm16zr8Z6dQ9CDy00Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ9PIk/2dx+/80YJM/SLWhMyFS1AMdRda8dvv8u+uSv0gCy54s
	HRgmYOpMCmXXHhDkAag/7/gajomJhsm8J2STo8fholkdCTFLLBb8a8nXcixUIweg0A==
X-Gm-Gg: ATEYQzxt+/ZnSWfahuc8a79SPDDZ663vPqwY6gUx8S8uPIVqD5/kQqLXlY3zH5vSCtl
	p4FARwsPY66PQF4Vvjmgd6simy6Ek1+2N2UTBhjWnwiU+0xRDfqSPADht7LUqJy48hPm4TnyVy6
	hc3mWYAWVLeZEsYUfOuqIcy16YGKQzUL3kzo4tARO3RmN8g08iKg7Vlnu0ovgLfWAJa3QOsQ330
	zH34ud0oNpRwAUhxvOV/WVXwB+boJmCAOnUmGST0H3nB6FcBqjDCV732IHB/8Usd2/SNGa2DjPX
	LHBia1v6kpyaN0oXYozDydzRO/JKwqhvcdDJTDOE1rc6C/cIKRKgQ41j+x+9SjIf2iT3GfxzwEm
	bTbertzNIlr858S5gsuUyiXP/27cqUYnjeI6f3ozO39LHuFrNwx+9XFtb4XHWvSevgApNExjoBl
	Msm6M2f0xaAxDHX02qEOec/L2wuuug8b8FkiBdBHe3yN6Sg7Q6Jr2B6kdy6Ih1VYxJKGY=
X-Received: by 2002:a05:6214:27c5:b0:899:fd64:1b72 with SMTP id 6a1803df08f44-89c85a5bebbmr215431466d6.41.1774288026237;
        Mon, 23 Mar 2026 10:47:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85335745sm93354426d6.32.2026.03.23.10.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:47:05 -0700 (PDT)
Date: Mon, 23 Mar 2026 13:47:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
Message-ID: <6511a5b9-ac67-49a1-8336-3d2afaaab593@rowland.harvard.edu>
References: <20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <2026032152-getting-carmaker-29d5@gregkh>
 <CAD=FV=Wag5qx9RXkAHrf+zbwtQgVQW1UUc6DRhUzudBtjbD8ug@mail.gmail.com>
 <2026032114-unlocked-unmoving-091b@gregkh>
 <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>
 <6ff1444b-f83e-47f6-ab0d-6745738523ba@rowland.harvard.edu>
 <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com>

On Mon, Mar 23, 2026 at 10:07:01AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Sat, Mar 21, 2026 at 8:54 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > > > > I'd also note that the only actual symptom we're seeing is with
> > > > > fw_devlink misbehaving (because dev->fwnode->dev wasn't set early
> > > > > enough). fw_devlink is a "new" (ish) feature, is officially optional,
> > > > > and isn't used on all hardware.
> > > >
> > > > That's true too, can we set that earlier?
> > >
> > > Yes, I can post a patch that _just_ moves the set of dev->fwnode->dev
> > > earlier, and that will probably fix my symptoms (I'll need to test).
> > > This patch already moves it a bit earlier, but if we don't break the
> > > linking out as a separate step it would need to move even higher up in
> > > the function.
> > >
> > > Originally, I was going to just propose that, but then I realized that
> > > some of the other code in device_add() probably also ought to run
> > > before we let the driver probe, and hence I ended up with this patch.
> >
> > This sounds like a more generic problem.  A bunch of things happen after
> > bus_add_device() that should be completed before probing can start; the
> > firmware node stuff is just one of them.

You know, I wrote this but I'm not so sure that it's accurate.  We've 
gone many years with no big changes to this code; most likely it doesn't 
need alterations now.

> > Splitting bus_add_device() in two sounds reasonable, although I would
> > rename the old routine to bus_link_device, since all it does it add some
> > groups and symlinks.  The new routine can be called bus_add_device().
> 
> LOL, so basically you want them named exactly opposite I did? That's
> OK with me, though maybe:
> 
> bus_prep_device()
> bus_add_device()

Nothing wrong with those names.  But instead of making these fairly 
intrusive changes it might be better just to move the firmware stuff to 
a different place in the code (you mentioned this possibility in your 
first email).  It would be a smaller change, that's for sure.

> > The real question is whether any of the other stuff that happens before
> > bus_probe_device() needs to come after the device is added to the bus's
> > list.  The bus_notify() and kobject_uevent() calls are good examples; I
> > don't know what their requirements are.  Should they be moved down,
> > between the new bus_add_device() and bus_probe_device()?
> 
> Yes, this is my question too. The question is, what's worse:
> 
> 1. Potentially the device getting probed before the calls to
> "bus_notify(dev, BUS_NOTIFY_ADD_DEVICE)" and
> "kobject_uevent(&dev->kobj, KOBJ_ADD)"
> 
> 2. Calling "bus_notify(dev, BUS_NOTIFY_ADD_DEVICE)" and
> "kobject_uevent(&dev->kobj, KOBJ_ADD)" without first adding to the
> subsystem's list of devices.
> 
> As it is, my patch says #2 is worse and thus allows for #1. ...but I
> don't actually know the answer. The main reason I chose to allow for
> #1 is that it makes the behavior less different than it was before my
> patch, but that doesn't mean it's correct.
> 
> Reading  through a handful of "BUS_NOTIFY_ADD_DEVICE" calls, my guess
> is that they expect to be called before probe... That would imply that
> my patch made the wrong choice...

I don't know about other subsystems, only USB.  As far as I remember, 
USB doesn't really care about the order of probing vs. notifications.  
In general, since probing can be asynchronous with registration, the 
kernel always has to work with probing after bus_notify().  It's 
best to preserve that order unless there's a very good reason not to.

uevents may be different, since they go to userspace.  It could be 
weird for a user program to be told about a new device and then not be 
able to find it on the bus.

> I think another option here might be to just add a new bitfield flag
> to "struct device", like "ready_to_probe". Right before the call to
> bus_probe_device(dev), we could do something like:
> 
> device_lock(dev);
> dev->ready_to_probe = true;
> device_unlcok(dev);
> 
> Then in __driver_attach() I can have:
> 
> device_lock(dev);
> ready_to_probe = dev->ready_to_probe;
> device_unlock(dev);
> if (!ready_to_probe)
>   return 0;
> 
> If I do that, I don't think I'll even need to re-order anything, and I
> think it's all safe. Basically, it just the device hidden from the
> __driver_attach() logic until probe is ready.
> 
> What do you think?

There should not be any difference between probing caused by the device 
being added to the bus, vs. caused by a new driver being registered, vs. 
caused by anything else (such as sysfs).  None of these should be 
allowed until all of them can be handled properly.

And linking the device into the bus's list of devices should be the 
event that makes probing possible.

Alan Stern
