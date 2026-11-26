Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655573;
	b=tQmKoAV8h5cu9EcLKh9bIpnR87lSnfooncgxhiQKuwQc8bk95IK4yo78zVDMCE22Y+Ao
	 aU5RACuG/zL3058xgW2PNOmA574s9tqF/IbkYEoxnDfBIRYqnkC3+sY5XJDQu9k7Z9dmF
	 WWviJOiYbSEjBSDvbqVjmIIuVeKEJsXwadWaItM9Z812Wpaj9U73gbVsw912c+NJqqz2S
	 s2aCWCfiFBBJ+P4DXIrg27AtUlfe7w6MP2ociWAvKiPxvlYGRDBPfoe6fUpl+xX3x70by
	 7HimDuBcgcFvmu64Nt0HSROVjlandwmh8SWvnLam2ZzChCAkNsOkr/hP+FldDvHbdfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=2pA3VHlw07C80DtGhf3Wk+ni9onBDYYv/Wt986Zz2Ew=;
	b=iDMgI1ky33iZZOHcZm0kzjCbSQbN8krn3WP47QF4Irw7QtEEdGFqUCr1ttXsa9NssAwF
	 nhWvg98VadCC9GSb1AIGupTtxz8fOaZT0PfSHQMNH6YoUhl3NAC1sLVzAKJ0U75nDZrNa
	 EjXgx9G5QhEZBmnRiN3rhByoSdodSgi512YOCpgZ2eE9usgqMESkLECy6u+Yuo+j1La0E
	 wfQLcdCzKP+HAW/bL4hMCxGC7QZi+6r7ezTua6mwRq12Wxw4XYFsgyB7Y/6PmnEVmakv5
	 9voqYh/ENMR81pe5TJ9l2SIXiQygsJZ2P+qCDTSCOYgKjAJUk719fvQHlKQWce8HhKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Eo9NpgvW;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F99606A327
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F99606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Eo9NpgvW
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38190551625so12689263eec.1
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 17:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795655571; x=1796260371; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pA3VHlw07C80DtGhf3Wk+ni9onBDYYv/Wt986Zz2Ew=;
        b=Eo9NpgvWfcQBeepe68tfpsduPxb7Kv0fqQGdptDvfw0t7lTAShdMe0xMtZsnREL5vL
         WTVo/3aJjZKrU8UM9nuMTgnRm5vjMCR6M7Cytut2NH6gv6ZJizDwgGAXTmLS9xyVSlz4
         XeN/oZ+9AltRkQ7SR/hUh2AWGVRls9Jbulz+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655571; x=1796260371;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2pA3VHlw07C80DtGhf3Wk+ni9onBDYYv/Wt986Zz2Ew=;
        b=PFktFOiCdb9F51yLh2otQ4zFScg6OClEUIS5FPRIpP3GkI07wjS5fT5n31q5+YEl8D
         xDTThpNTqihnyTuAAWoB4UXqboZ2MNsiP9JZY4uj+wtZSOi+6VYjIemul75p2zCSFWIm
         dk0OFPlFSTebCYr30Awdv6/wGKTMSGkSC30MqZ15A/UXRvy42qoJ5A8bc5/kOEDmjIvN
         LLA7JL/g8FRkGmM1/mBIks2MSZ75jMt+NpbRGxKiTunjiYVNvOOOlQ5kxbSFC7VjEo6d
         b7igUqn9YEKJKNinfEjcMYPXujOc9aTSS/XCkqOk8BN0EyhAvYkzh+XWg/ONeDQSwlte
         5jXw==
X-Forwarded-Encrypted: i=1; AL+hErErwmn8uWpgvnztKco534SJ1IRTzQ8CCUyBp5hgMLKP44WiYy7DQ9zOBaftRZGxh41oq2oDgsocH/kI9A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8gcyvTxLTmrTdMBNSMzIxs2VvoEpBxoF5v6V2yaAzQbZcRMGuI
	Bkz5gfaY3VPE27Laq6LsFQ+144nmQbir5XJ164eknPV+yPpvZWj1YxBuPaO5ITHv7Q==
X-Gm-Gg: AZFdTZca5csWHtUQeWdAljCsth9BQmD4JTHAxnuLADnU5vRl5w6eYgQYrPXrJ1ODbS+
	0JIKL9k9/gDaHSAxpARM2MZenMSooMRWg70O3IbNhWri46+jZAURCiEdp/yRr5qLFD3DgEZiGQn
	y1RnBZyqgKFFbxnB84XV3CDIPFl/dKTUSmTGpgXmeJTIsEi+LydeRg1ZDtK1n1wQwyYNggPnnud
	qWdKd0y/CYF0altO2wpnxz8FVWnm+fKiHqlWwlyIbqvDDsO9qTXdpwrXsIMnKMi9SryhBY5EDBa
	+L+00DQDkD2gaAPbt+K/5J4JhYTQe2qwa+55ubFv0lzP1phnIU08lWQCdN1rxZSSQbbZ+0nIk3x
	pVSz+1pyEg+zhstkEtfpwfe2aXu0H3lLYXa+sMDcZMbGTZPm3fJuCJPulkov9XA3QJ1aNKB3n+p
	65bSjnH3ifPSfN9vs48K20pbca1nO1fdlj7O80GHyTmbd8bRJq0Tc67farr+vUDlxYrHs4/FDa3
	EWUDjoAWHlfAqCNOWVjfOdIg7RuBws9EBolRH7D/91ohKvWaBYVPXKoj80TRuWpMwuOoAX6PQG0
	O9NqsMVN2mGq/1oyYAa/BZbH5GSdXuIHwylhT/0O09imKPVMyauE5D9nPNUBVCpn4e4m
X-Received: by 2002:a05:693c:880e:20b0:386:b54a:7f6e with SMTP id 5a478bee46e88-386b54a8032mr10146885eec.6.1795655571381;
        Wed, 25 Nov 2026 17:12:51 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:dda6:7575:bbfe:db80])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-386aaae4960sm30443084eec.18.2026.11.25.17.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:12:50 -0800 (PST)
Date: Wed, 25 Nov 2026 17:12:48 -0800
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Linux Driver Core Development <driver-core@lists.linux.dev>
Subject: Re: [PATCH v1 3/4] PM: runtime: Let devices suspend after an
 attempted resume
Message-ID: <aweHkBnEGG5f8veE@google.com>
References: <1978814.tdWV9SEqCh@rafael.j.wysocki>
 <10954171.nUPlyArG6x@rafael.j.wysocki>
 <awC1xx1Wi2BYo5rb@google.com>
 <CAJZ5v0jgBeJkeKfzaMnSx3c7HV6EpXrUoKJCyAZNHwfkvh=PZQ@mail.gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jgBeJkeKfzaMnSx3c7HV6EpXrUoKJCyAZNHwfkvh=PZQ@mail.gmail.com>

On Tue, Nov 24, 2026 at 05:23:52PM +0100, Rafael J. Wysocki (Intel) wrote:
> On Fri, Nov 20, 2026 at 10:04 PM Brian Norris <briannorris@chromium.org> wrote:
> >
> > On Thu, Nov 19, 2026 at 09:17:51PM +0100, Rafael J. Wysocki wrote:
> > > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> > >
> > > On a successful runtime resume of a device, rpm_idle() is called by
> > > rpm_resume(), but only if the runtime PM status of the device was not
> > > RPM_ACTIVE when rpm_resume() was called, which is inconsistent.  For
> > > instance, if the given device uses autosuspend, an autosuspend timer
> > > will most likely be started for it after it has been actually resumed
> > > by rpm_resume(), which will not happen if it is already active when it
> > > is passed to that function.  This may lead to observable differences in
> > > behavior going forward.
> > >
> > > Address it by rearranging rpm_resume() to call rpm_idle() also if the
> > > device has been active to start with.
> > >
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > ---
> > >  drivers/base/power/runtime.c | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> > > index 5a0b4600c244..1a3b32e299d8 100644
> > > --- a/drivers/base/power/runtime.c
> > > +++ b/drivers/base/power/runtime.c
> > > @@ -794,7 +794,8 @@ static int rpm_suspend(struct device *dev, int rpmflags)
> > >   * suspending (deferred_resume) or wait for it to finish.  If the RPM_ASYNC
> > >   * flag is set then queue a resume request; otherwise run the
> > >   * ->runtime_resume() callback directly.  Queue an idle notification for the
> > > - * device if the resume succeeded.
> > > + * device if the resume succeeded or the device's runtime PM status was
> > > + * RPM_ACTIVE to start with.
> > >   *
> > >   * This function must be called under dev->power.lock with interrupts disabled.
> > >   */
> > > @@ -840,7 +841,7 @@ static int rpm_resume(struct device *dev, int rpmflags)
> > >                */
> > >               pm_runtime_mark_last_busy(dev);
> > >               retval = 1;
> > > -             goto out;
> > > +             goto success;
> > >       }
> > >
> > >       if (dev->power.runtime_status == RPM_RESUMING ||
> > > @@ -971,8 +972,11 @@ static int rpm_resume(struct device *dev, int rpmflags)
> > >       }
> > >       wake_up_all(&dev->power.wait_queue);
> > >
> > > -     if (retval >= 0)
> > > -             rpm_idle(dev, RPM_ASYNC);
> > > +     if (retval < 0)
> > > +             goto out;
> > > +
> > > +success:
> > > +     rpm_idle(dev, RPM_ASYNC);
> >
> > It's super common for rpm_resume() to be called with a non-zero
> > usage_count (e.g., all pm_runtime_get*(), pm_runtime_forbid()). Do we
> > really want them all to turn into rpm_idle() (and predictably fail)? For
> > one, it adds a lot more trace_event noise.
> >
> > Maybe we could check RPM_GET_PUT before doing this? Or check
> > usage_count? I wouldn't want to go too far on re-implementing all the
> > rpm_idle() pre-conditions though...
> 
> I'm not sure why this is an issue if the device is already active when
> rpm_resume() is called and not when the device is resumed by
> rpm_resume().  It doesn't look like this should be an issue only in
> one of those cases.
> 

You're right, it's a bit spammy in existing cases too. (It's honestly
pretty hard to read rpm trace_event logs without being an expert.)

This comment was made by inspection; I think I'd have to get a feel for
how this looks on a real run to be sure. Feel free to ignore this if you
don't think it's concerning (and I don't come back with anything more
solid).

> > drivers/net/ethernet/intel/e1000e/netdev.c (no autosuspend; they use
> > .runtime_idle() to re-implement autosuspend, more or less) might see a
> > change in behavior.
> 
> Everybody may see a change in behavior, but it only applies to one of
> the two cases which are handled differently now.
> 
> > For example, see its watchdog, which does:
> >
> >         /* Cancel scheduled suspend requests. */
> >         pm_runtime_resume(netdev->dev.parent);
> >
> > For cases where the device stayed RPM_ACTIVE but usage_count == 0 (very
> > common, I think), this does indeed cancel any pending suspend timers,
> 
> No, it doesn't cancel running autosuspend timers, for example.

Well, this driver doesn't use autosuspend (yet).

> > but then it immediately queues another idle request. (That idle request
> > will end up failing anyway, so no functional issue. It just means the
> > comments are a little confusing.)
> 
> So the comment is confusing regardless of the $subject patch.

No, my point was that your patch changes that behavior from:

 "cancel scheduled [non-auto]suspend requests" (an accurate comment)

to

 "cancel scheduled [non-auto]suspend requests" and immediately run
 .runtime_idle() again (and fail)
 --> a somewhat misleading comment

Or perhaps I'm misunderstanding the before/after behavior here.

> > Do we really want that? Or maybe these drivers are just outliers, and
> > should be rewritten anyway.
> 
> Probably.
> 
> If the device is RPM_ACTIVE to start with, all of the rpm_resume()
> actions related to resuming it may be skipped, quite obviously, but
> I'm not sure why any other rpm_resume() handling of the device should
> be different in that case.  This only causes the behavior to be less
> consistent and less predictable IMV.  In particular, if the device
> uses autosuspend, an autosuspend timer should be started for it
> regardless of whether or not it is RPM_ACTIVE to start with.  Failing
> to do so may cause it to never suspend going forward in theory.

Makes sense. Really, I was only pointing out changes (not necessarily
problems) with a few quirky non-autosuspend drivers [1], and if these
are expected, perhaps it's worth following up with the drivers in
question that were describing (if not fully depending on) corner cases
of behavior that we're changing here.

But on second look, maybe there's not much to fix for these drivers.
It's not really a "bug" to perform excess .runtime_idle() checks, even
if it's wasteful, and I don't see great alternatives.

Brian

[1] drivers/net/ethernet/intel/e1000e/netdev.c
    drivers/net/ethernet/intel/igb/igb_main.c
    drivers/net/ethernet/intel/igc/igc_main.c
