Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2A3F7876
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365701; cv=none; b=M1nDOutfDKBtfozUecmIuibeDCL2tKhjG4lAfB5ORy5HtcG0GVi82ezwlpEL8eiZt5ou5ysn62JL8/TtrQoSifQwY48qi0/18+H64zhFVIEzzVygS4slVEH5ihXBTa77A429ykE5dgzY592TT4aaut5GiWlcm4Ggi7df2Mw7GKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365701; c=relaxed/simple;
	bh=NJo5NdzOjtwBWX7+M/YjO+ycHqysL7+cmpjOt2K5IaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svpN75OrooLLDJVHtrYqaDG1b79JW+1qUFSlKY96DeSFLnZzWr4oqeqDCuQNwscwAppJn/V2NUrXARuf4OC/qMaxxD6AXwk3ONCfCuo0dHBH5T4k1UD/BgxGk5qynu1znP3Z4TAg7dQmpYcWr2PXV5QwKSRDKyQ5NBrd18jmJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=eBwDyuSS; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="eBwDyuSS"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb4136d865so523178885a.1
        for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774365699; x=1774970499; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tiLKmr/C5OTHsK7h85BV4WJ+HRj+xEBrHGkLJfB0mtU=;
        b=eBwDyuSS92yxrvWDgyIxZvt/Cg6PEQmM9Y8mVsFvqZgun4/z2Ns8uZqOaxQOAgBAGb
         wRZirjhchA4bGVi/yUnUfI3JBvlcF1JSjq4s2jU3IEuiLkNjs5j0DpBJla+bvssqaO07
         Os2sO9bEmr+gnOeQysTzG8bgxtKAvmJjgckyCX6dZOgC9i3Rv97iVtdK/xIiBs3pzoV5
         Pxo94qOs8TvaR4pgVrWmEqERDGugVtHMTZxEX0dfqAiv1vC3B18QvwMhJAb+rNobp8O2
         ulIK0OlbIqtG4drG89Pk4v3EmF/mYYCwBOINw19UwaqRmUEzHq3FDWnEpPSXnqBc3ffb
         LKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365699; x=1774970499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiLKmr/C5OTHsK7h85BV4WJ+HRj+xEBrHGkLJfB0mtU=;
        b=dvQS7uf1lU8pqVSsuu4cAvWCEKXuCbKaiGAguJByJ/NO5h5HkRVA+WvFXTOBomjQGT
         HRRWQIY0aezVNn52JgKbYoNq0AKnqxt3Icwj9Ht0Cj7FlZisOXy4Kc6ZCHaJJmpOqhGS
         hpsX5cY0hauvDVN2bU7K7BeS2apFQtjkZQMmTyrNDqEpdjBk7b0LR906yxvq7rzKPuAM
         GX1tYCd2Cs2r/eeoLiJqWUYglDoTp8XeaGTfINHyUd09dG7p/aNnV/YbqCEzlng/PgUN
         NftlZegTlZ3vGe+HkAApJ7ucKi2Zb4hMAiWBwSkiJNOY19sDR73ZZ82d9JQuKOCQOhfp
         IJMw==
X-Forwarded-Encrypted: i=1; AJvYcCWbZDCoB1NBMilxEYnQoaudeGcX29tc3YP1bVbkGKDyK6vaa4rgRKA/yhTZclbhjyDrrNBoavYws+x0/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9C1gr+bFJAWQsHFBp4A5d5vyHe4Pc1psdHrOFmhoJj7KYLNgT
	I77FHV8Ebxxpr/VAJWbQqdSHPULtta6HQUw0hAvVtum77Vi6dj/ncE17MwSgPUTklw==
X-Gm-Gg: ATEYQzyscHuCXpK0YaXBVfI27T9PqGZFwn/tgyQrELW6hwNjXlFnCi/w1bE3cz9WiSK
	lKgPO4KmBD51aLsliCGQ1R60+DePM/h7Xw89UL+/Ncz26oyz652LN2rsViuszt+F3NZ7FUtt8A9
	Y7YMoIURmdQtPN8D5fyGiVTskBSTagYlr7H3AEkV9d65wURbNdwCj2y+F+1jRQpiVAiVvJfqyPf
	3IHvk0sTrBaU2LFvok+wOwiO83GgCeHwgNTBneCT8FddtIE6tey5X34FA7XxwhEEfxb18sYCJI3
	sFuhbURtp8dvCuKL0dG/+r9IO4bTg/7GCx5jLDgfcdTnyb0s0na6rC5uESBC/uS49yYoA1ppea7
	mPvwkcmR2cK/k1mW6hOrJnCvl1rKOq0Kg9Ll/ohuSid3RPGpRimZ6vb5N5+mLLB3PqQ7kCxlpiM
	KTri78LDQC4gAzN2Z0VdjLuZ8l
X-Received: by 2002:a05:620a:408b:b0:8cf:de1c:ede4 with SMTP id af79cd13be357-8cfde1cf987mr1729724985a.26.1774365697099;
        Tue, 24 Mar 2026 08:21:37 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::9c76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90b4a7fsm1015857885a.32.2026.03.24.08.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:21:36 -0700 (PDT)
Date: Tue, 24 Mar 2026 11:21:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
Message-ID: <bfd4e1f5-7bc5-448d-aa33-1a977bf00733@rowland.harvard.edu>
References: <20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <2026032152-getting-carmaker-29d5@gregkh>
 <CAD=FV=Wag5qx9RXkAHrf+zbwtQgVQW1UUc6DRhUzudBtjbD8ug@mail.gmail.com>
 <2026032114-unlocked-unmoving-091b@gregkh>
 <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>
 <6ff1444b-f83e-47f6-ab0d-6745738523ba@rowland.harvard.edu>
 <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com>
 <6511a5b9-ac67-49a1-8336-3d2afaaab593@rowland.harvard.edu>
 <CAD=FV=WBgKN2MNO-xBHZ3tRN91M82vk3h1AEAXtpBQ-nQocKCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WBgKN2MNO-xBHZ3tRN91M82vk3h1AEAXtpBQ-nQocKCQ@mail.gmail.com>

On Mon, Mar 23, 2026 at 03:24:52PM -0700, Doug Anderson wrote:
> > You know, I wrote this but I'm not so sure that it's accurate.  We've
> > gone many years with no big changes to this code; most likely it doesn't
> > need alterations now.
> 
> That's fair, but I'm really just worried that the Android parallel
> module loading code, which is only ~1 year old (and needs to be opted
> in for each device) is stressing things in a way that nobody else is.
> In most distros, I think modules are loaded "on-demand". A device gets
> added first, and then we figure out which module has the driver that's
> needed and load the module. Nice and sequential. Android seems to have
> a different approach. As far as I understand it just has a list of
> modules to load and slams through loading all of them even as devices
> are still being added.
> 
> I don't think that what Android is doing is technically "wrong", but
> it's certainly odd compared to all other distros.
> 
> Unless we say that what Android is doing is wrong (and decide what to
> do about it), it seems like we need to make sure it's robust.

Loading a bunch of modules as fast as possible should not be wrong.  The 
kernel certainly ought to be able to handle it.

> > Nothing wrong with those names.  But instead of making these fairly
> > intrusive changes it might be better just to move the firmware stuff to
> > a different place in the code (you mentioned this possibility in your
> > first email).  It would be a smaller change, that's for sure.
> 
> I'll do that if that's what everyone wants, but the more I think about
> it the more worried I am that we'll end up with a hidden / harder to
> debug problem where some driver gets unhappy when its probe is called
> before dpm_sysfs_add(), device_pm_add(), device_create_file(),
> device_create_sys_dev_entry(), BUS_NOTIFY_ADD_DEVICE, ...

It's hard to know for all of them.  However, it seems pretty clear that 
device_pm_add() should come before probing, since a probe routine will 
generally want to affect the device's runtime PM state.

> > There should not be any difference between probing caused by the device
> > being added to the bus, vs. caused by a new driver being registered, vs.
> > caused by anything else (such as sysfs).  None of these should be
> > allowed until all of them can be handled properly.
> 
> Right. ...and I think that's what my proposed "ready_to_probe" does.
> It really does seem like quite a safe change. It _just_ prevents the
> driver load path from initiating a probe too early.

Any such consideration should apply to all the probe paths, not just 
driver loading.  (Also, if it's too early to probe the device, perhaps 
the return code should be -EAGAIN instead of 0.)

I'm not at all sure whether the constraints we've got will need to force 
some events to happen after adding the device to the bus list and before 
allowing probing to start.

> > And linking the device into the bus's list of devices should be the
> > event that makes probing possible.
> 
> Sure, but moving the linking into the bus's list of devices all the
> way to the end is definitely a bigger change. If nothing else,
> "bus_for_each_dev()" starts to be able to find the device once it's
> linked into the list. If any of the ~50 drivers who register for
> BUS_NOTIFY_ADD_DEVICE are relying on the device to show up in
> "bus_for_each_dev()", it would be bad...

I don't know the answer to this.  That is, I don't know if there are any 
notification handlers depending on the device showing up in the bus's 
list.  The safest thing to do is issue the notification after adding the 
device to the list -- which may mean after probing has potentially 
started.  Is there any reason why that would be a problem?  I'm not 
aware of any.

The order constraints should be commented explicitly in device_add(), 
not just implicitly implied by the code.  Otherwise people won't know 
what changes are allowed and what changes are forbidden.

Alan Stern
