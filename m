Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F202D1914
	for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 18:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637174; cv=none; b=TnhLs9HgkjRH5OkOdT0CXzWKiv7v71Seei2h6Fqe6+vyaVaUp9kSjXpvawNo3swiLqkoLJgt5uPd9zGYhOcGIuNkzbuzTYEpAZdJFwOAG2cNNcqbIdxnA8QgeZxlcw6jNignrs6QUfP8XTWJ8TqmCT/g8YLgFpANYVFVqeFYDKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637174; c=relaxed/simple;
	bh=FxGFWtPB/Wa8nrg43ruQmSyCzn7U9NtJDFZ15sUGTC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL4L1lLGTiKXg7guvYQVECeem7atHWrepZNVGtI/Sx6KV6exnyGuS6WAX/hwCDrkSIaj+1y96+KTMyFFE5zCptuBDwbIzp1AgVBjwlXPbfOaXMPhj/04Zsm9uf+L60Xdke2UgSol9QyhuD2hOH63BpFrS2PtArJE8d+dJrYH6a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=DiuX/txT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="DiuX/txT"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cfd122d78fso379327685a.3
        for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 11:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774637172; x=1775241972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAj2+JxeyzxCHPSTp7NdDKje1P1OmazWp5C7XTFQEIg=;
        b=DiuX/txT2IUx39nHJ3pDlQUO/1n0j1a8VZ/RyU/N0ITNkUt/D44XjEOrZhIqDXgZ29
         edLspJlZOOp+/CnfOjOIYCebvRuG33f/2Czft5VzUbNTcq9BS1SPLBHE3LqLg4L8RJlF
         3p9pc00AdJf+G1zH3j1i6dbMFbq9/kbt+1sKMnvbySityWd2Kdz6ECJrcmPjMaikvEG7
         QZSWUrA7fOKRvGoCpE0EZ2JpNl5UN3AZaz8O93oyaHiozX7adb9b7vfQTg4nSuIOpVZJ
         AMQ4Ae2lGaeyEaj1tf48h0lVR4JdtSyTGXNdkC/AXnf9vnHaA6ssYa+POBVuP1CfgoLY
         YzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774637172; x=1775241972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAj2+JxeyzxCHPSTp7NdDKje1P1OmazWp5C7XTFQEIg=;
        b=bRjYKIJgNbR/EurtC+IIEpBba9fSmJ9I99V1DrECQuUmcd4Pg2v9dVnhX1LpOzhE1N
         zqjYyib/DYZASLQTzXcEZQQKz24PqHu/JG3GeOVZSMpPhfykGIu+pDplbvrTMStekkB+
         hjC5cpLR4G0C0oMPOWCVQlga3hTXqO4V95l03S2LkwUNG7W6wntX8wNupDQiCny3dEnl
         bZZVVAjXrsSK6sXANl9OB2q+0ldA1v05InB7fGvEN6ZnbMINIPp4EWHq9t2yCvbpa0iD
         qYG8cqjjjqRw0HqbK/EGcs548DuAFGKyXvcn5cJ6k4IcFYumrRvz7EGd4BpYTbz8SW2V
         qZVg==
X-Forwarded-Encrypted: i=1; AJvYcCXFe07FsYSMHD3+d9MgulUVhvHWfd+Kmy0Wv39MNH7cWmi7EYqswVUfUscJw0c+QZ1FJugeP/lFHv3SCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZaynEV211EaqWKc04z1WWmGwdSSzSNFpDRweyeZxqbg3tyoST
	vR/VR3O+qbtAItCd20mXaxFJahZmeyQeuoSXCfIkiVXAE9bQYMQmhTDpP/jhbPgFdw==
X-Gm-Gg: ATEYQzz/d7a2M1Q1XZuR3Irbx3Cf3y+gE12QX0nVNj4Y3tNrEdYwJSk3tGaT3cD32Am
	ZBCI4Yz8qavaxhtefw3TZ8CQoxIFWE4kuxFKo///CiwwgOALDwtCAhGSfLcP0wi/WycDytP3PyK
	C7u+PwExuyobSflY2fGAaVx3jB31xJhO48UiRLvmi478nF8W61+Zkwjl5R+jnvRwPVv4Wtey0aX
	gHMgThql290yPw3t0DRIbwebddu+Cj30dvgKex3ItH07dawsF1yrKFN4jPu8J72BddpZvHTGhQX
	J9Pzm9fWykdikoluRhQFlyvbapxDXRFRSANL+fDBGt2dzJ0s+7BDTCeR3HKvSN2WvV/zLTXNwYr
	BLs8MvOr08Nj6KzXKA4PikQFkO9b7B+oXx2zh0dk+8uwpVx7BiX3KqAQBfa1/jXOBoF8JZicirr
	JcfBV+vQfnacKu3A/axvbAldK6
X-Received: by 2002:a05:620a:2944:b0:8cf:d37d:99e1 with SMTP id af79cd13be357-8d01c63a043mr441700785a.32.1774637171947;
        Fri, 27 Mar 2026 11:46:11 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e3ca491sm563371285a.14.2026.03.27.11.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 11:46:11 -0700 (PDT)
Date: Fri, 27 Mar 2026 14:46:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
Message-ID: <852cd509-4ce1-4b22-ab1f-b9b9bbf6a52e@rowland.harvard.edu>
References: <2026032152-getting-carmaker-29d5@gregkh>
 <CAD=FV=Wag5qx9RXkAHrf+zbwtQgVQW1UUc6DRhUzudBtjbD8ug@mail.gmail.com>
 <2026032114-unlocked-unmoving-091b@gregkh>
 <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>
 <6ff1444b-f83e-47f6-ab0d-6745738523ba@rowland.harvard.edu>
 <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com>
 <6511a5b9-ac67-49a1-8336-3d2afaaab593@rowland.harvard.edu>
 <CAD=FV=WBgKN2MNO-xBHZ3tRN91M82vk3h1AEAXtpBQ-nQocKCQ@mail.gmail.com>
 <bfd4e1f5-7bc5-448d-aa33-1a977bf00733@rowland.harvard.edu>
 <CAD=FV=WeeBoQAoPgNq+5ocZas+mOn1RuNto3k57ag4ODo2vOLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WeeBoQAoPgNq+5ocZas+mOn1RuNto3k57ag4ODo2vOLw@mail.gmail.com>

On Thu, Mar 26, 2026 at 02:49:33PM -0700, Doug Anderson wrote:
> > > Right. ...and I think that's what my proposed "ready_to_probe" does.
> > > It really does seem like quite a safe change. It _just_ prevents the
> > > driver load path from initiating a probe too early.
> >
> > Any such consideration should apply to all the probe paths, not just
> > driver loading.  (Also, if it's too early to probe the device, perhaps
> > the return code should be -EAGAIN instead of 0.)
> 
> In my proposed solution, I was returning 0 from __driver_attach(). The
> only place that's called from is driver_attach(), which calls it with
> bus_for_each_dev(). I don't think returning -EAGAIN is a good idea
> there since it stops bus_for_each_dev(). In general __driver_attach()
> always returns 0.
> 
> In general, the goal of my new proposed patch is to add the device to
> the subsystem's "klist_devices" exactly where we do it today for
> maximum compatibility. This means that if any code was relying on
> being able to find the device, they can still find it. The _only_
> exception is that I don't want to be able to find the device in
> driver_attach(). So my proposed solution just hides the device in that
> one case.

But why just in that one case?  That's what I don't understand.  If it's 
not okay to bind at this time on the driver-load path, why is it okay to 
bind on other pathways (such as bus.c:bind_store())?

> I believe this should be fine. Specifically, driver_attach() could
> have been called (in another thread) immediately before
> bus_add_device() and everything would have been fine. driver_attach()
> wouldn't have found the device (because it wasn't linked in) but the
> probe would still happen.

That's not in question.

> > I don't know the answer to this.  That is, I don't know if there are any
> > notification handlers depending on the device showing up in the bus's
> > list.  The safest thing to do is issue the notification after adding the
> > device to the list -- which may mean after probing has potentially
> > started.  Is there any reason why that would be a problem?  I'm not
> > aware of any.
> 
> I'm not completely sure I follow what you're suggesting here...

I'm saying that the BUS_NOTIFY_ADD_DEVICE message probably should go out 
after the device has been linked into the bus's list, as it does now.

> I still believe adding a flag that just hides the device from
> driver_attach() is a safe and correct approach. In general I don't
> want to fragment the discussoin, but I think it might be useful to
> send a v2 that shows what that looks like. Any objections?

I just would like an answer to the question above.

Alan Stern
