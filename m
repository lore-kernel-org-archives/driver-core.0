Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0BF332634
	for <driver-core@lists.linux.dev>; Sat, 28 Mar 2026 01:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774661753; cv=none; b=QV9GJ2wmBii3rJ7r4U3+3nM7s4QC/I8teSKyNinYJZ1Z8jU2LUFQfIaQOGyYI4o/8RsjfmAEq5C5ehY81OLf5W5+EmKqfP3YmLJErnYXonHTLFFkJubE9jGALZ0vEnSaGfI3mQgt1BUKOaAB1qUz+1GUDV1Mk6UJcOuKK7Kzxk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774661753; c=relaxed/simple;
	bh=z2MmL3nP8mfs2Zlt0iAPU0Fg5DUKl/mAWaoCQ1T6W1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxjlHI1Ra8UON2T+5R6IxpnU7J8ITHwVWRPTqNGQbG4JtHP5jvr1tRASTZH4zAJpw0DBQsMb+A1BiXqhg/ta1GWtmH0c7tE+WnX5l2fhtDKJ0owpHJnc2u9TG3QCOhbTveBudtvzlerSAzJbcWsWd172Fxylf/UhqwP8/yFQdJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tRlUC5Pw; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tRlUC5Pw"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cd8c6e365eso304848885a.0
        for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 18:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774661751; x=1775266551; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f5hK4EUCCI1OM5acjvsX5vMrWb1ZWj9bGqsM2AP+IJ0=;
        b=tRlUC5PwoCJOnu9c9yIXk8zyUdqf7RKY4ExY0h4XB+gMuQBy+YZ97TOjIkKENHoipL
         lrGX3J/ReQLA6QQOtHjP36n0qJ1YpZ7eIfg/V9nAWrtqkile4ZNSvVQjcCQiLjFIK+Ln
         xzd/mLHSmV69YCrjeZRcBTHVAx2dktFAZWAGBcl+XBFKXrJCQzSwmIX2xGxdZgtVwDP4
         1daSu62yTzSraQIOFa4XTKHaY6Dvx1yzvu20SPHprbT5MvcWN3N0h19tv1BKlIonJx4q
         l4pkUsUDfv5z5Hjqm49xmwi2L+9xmQA9VTPZEK8XzYcFkAQprROOuPTQHuYdAZ65wt98
         o14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774661751; x=1775266551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5hK4EUCCI1OM5acjvsX5vMrWb1ZWj9bGqsM2AP+IJ0=;
        b=WqRjMkw1NPSbAlZHAvF6FICHbaVQnbW7Wcw7sTgk5Vr1Lps4FHF9Ol2wlPLsalhtyE
         X4btl3+f/81DlmB9ZsPQuDJQ+lGjLCSXonFarG2IM+SCvYj4c960YEih0creTanyWHyV
         Hg0MBOLU7Xxtfql3+f9S2RNCtjefMcfgBDWTapRcsALmiP5RlGMHswqdAyfRGfcAiiv6
         KH0prt9HpAx8z7UcGktaIgYVq3DL8R9EwqdXauMAUWZFeWEX1bHCfn/s50/q4qMn53Wh
         XqezZJSkyp8uXWhQ4628yYQgLASuAm8ndhS6wrkTts3hOxBxvR4kvdnG6OPfwO7HdqzP
         prOw==
X-Forwarded-Encrypted: i=1; AJvYcCVSoYMx0sOTL1vZcM3hTCrAr+V3VAmoeWlWEgdKAKH4w+TSb9G4BKLzC63MqrDmSeLpwCbM23LGqzziPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRkzUKrOgWI/TyrXo+0bAQl7kECx+6tvgb9TqUjvGpkaqULr+e
	wjJsrSALyayn1QN8vje6VTdqB0SahRvdjir6zjb+ghwTd0G+uJ+Zf/6U1S7BUyHwzA==
X-Gm-Gg: ATEYQzyvN6YuH+AWxzu6QPhtZzEPUIckBT/O9BGgjlnxfo7aUeh1ic5Gx6ba+qNeMbM
	wJAqM71QBy8DqO7vYSrFPHUTtqA6tTyXqtWxCB/f5hv6Ifib11w8MsFUUfluQ+bXvYNwK32Dcq7
	N33cgm1PEvm8ICqOqt2GboQk4VYr2vFyDFK4M8IaMQp+JkapKuTTBJNHFIhjs/UYibMXLUHEUpY
	ZA7JVhF14K290oZS2ZHneWPu237x70vGk99cGnkb3V5pFc4MgAZRHQ0y09SShDqU9b+JUK8xg5l
	6WAzt+jYGGwLsrMG4o467fDvrDzb47i6v811PrG7sPggyBen3E0468K4EWqB/7mgcqYihSRBi1f
	tI+uvHL9RryQNorRQi5VPTXLpBZn+C8jlAsME2ZKgMC6pILFOS+aAMTUcHqe2Y+TjDXqreGLj5c
	/HdXYSEoXRXvA9w+GyVY3Wv6vWp1mkJn3MCjE=
X-Received: by 2002:a05:620a:448b:b0:8cf:f215:24c6 with SMTP id af79cd13be357-8d01c648eb3mr589502785a.21.1774661750722;
        Fri, 27 Mar 2026 18:35:50 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02803f2c9sm61518685a.23.2026.03.27.18.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:35:50 -0700 (PDT)
Date: Fri, 27 Mar 2026 21:35:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
Message-ID: <5ea67deb-e669-4faa-be47-b1b225f1194a@rowland.harvard.edu>
References: <2026032114-unlocked-unmoving-091b@gregkh>
 <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>
 <6ff1444b-f83e-47f6-ab0d-6745738523ba@rowland.harvard.edu>
 <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com>
 <6511a5b9-ac67-49a1-8336-3d2afaaab593@rowland.harvard.edu>
 <CAD=FV=WBgKN2MNO-xBHZ3tRN91M82vk3h1AEAXtpBQ-nQocKCQ@mail.gmail.com>
 <bfd4e1f5-7bc5-448d-aa33-1a977bf00733@rowland.harvard.edu>
 <CAD=FV=WeeBoQAoPgNq+5ocZas+mOn1RuNto3k57ag4ODo2vOLw@mail.gmail.com>
 <852cd509-4ce1-4b22-ab1f-b9b9bbf6a52e@rowland.harvard.edu>
 <CAD=FV=UroO1vQYJDkrp86D475F8b-RStUXYejWwTQ0NqP1a_ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UroO1vQYJDkrp86D475F8b-RStUXYejWwTQ0NqP1a_ew@mail.gmail.com>

On Fri, Mar 27, 2026 at 12:30:47PM -0700, Doug Anderson wrote:
> > But why just in that one case?  That's what I don't understand.  If it's
> > not okay to bind at this time on the driver-load path, why is it okay to
> > bind on other pathways (such as bus.c:bind_store())?
> 
> Ah, I see!
> 
> Yeah, OK. I spent more time, and I think I've a patch that will
> address things. I still like adding the "ready_to_probe" flag and
> setting it in device_add() right before bus_probe_device(). ...but
> I've changed where I'm testing this flag. Now I've got the test in
> __driver_probe_device(), where I simply do:
> 
>   /*
>    * In device_add(), the "struct device" gets linked into the subsystem's
>    * list of devices and broadcast to userspace (via uevent) before we're
>    * quite ready to probe. Those open pathways to driver probe before
>    * we've finished enough of device_add() to reliably support probe.
>    * Detect this and tell other pathways to try again later. device_add()
>    * itself will also try to probe immediately after setting
>    * "ready_to_probe".
>    */
>   if (!dev->ready_to_probe)
>     return dev_err_probe(dev, -EPROBE_DEFER, "Device not ready_to_probe");
> 
> I think that is more inline with your intuition that we should return
> some sort of "try again" code when we end up with this situation. This
> should also block _all_ probe paths safely by adding to the deferral
> list (just in case) or returning -EAGAIN (in the case of
> device_driver_attach()).
> 
> Does that sound like what you're looking for?

Yes, that's exactly what I was asking about.  Let's see the complete 
patch!

Alan Stern
