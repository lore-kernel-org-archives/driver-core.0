Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1335C35028C
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 06:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958299; cv=none; b=WJ/UgrcsApBcmpPokNnI9Blgssg54Dz82kYVizP68fwvYiG8f5okJMbr38NCgfmp77P1CR4IwVt7bRuFEdTXGCwYSybjFEoZN+SiPoDPsZcHtLaBa3TM93asD73aEujuWvhx5/7vVKs0Dk26y5E1lpR5C4Wi+zFogtD7sPOir0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958299; c=relaxed/simple;
	bh=t1YRdeswWvqlBzieA3h2TG0wvtuBGH0lC1Eh/0VBSKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agsO9074/jHp9V/7385P9HKWW0e617R1no31gvoAgMKSvv86EgcvRpnf7s/FHoTVCEinmyX0qbKRTFVJvmQsv6sJ/d6VSBBOArn1Zp2emyE9Em4GnZTXN28bVnrccwmjgUuVkJhcbq4ShGv87AfIx1CD/sAm5/mOvQhUvmnW7xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6bEGdnb; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6bEGdnb"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so1070024eec.1
        for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 23:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791958297; x=1792563097; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZm/vIlfQJTUqTZZrMVb2/qO3rbKTGj4bQH8tA6ISMs=;
        b=o6bEGdnb/qeCKc3+CiDL0qwW6xrWyQewYLkcnVOWCO89yNFLxx+3J3593OlVuDZXgF
         HsaXz+VVE6f63RMHxWmm6xVpN22zYhIU11Rdtv4q3t1koOyXWwytdf2eUUDs27ZhBsOy
         SxU4t6OWxxEFfAiEo0QCwEWcyvcDCLMNsDFC6VocX9+s29juesdEDAtyVUk0W4Z+EUeP
         LWoQNnPrIEvSUCohVBEDuRJy8HUJChfvsba//SGIUmR6F9ohrGXzRN+3Oexi+d5c/Nlq
         hAIrpb7on0iW2TH6unxZzPRI9BStBE/NS8SAkfBetmA+FwXiHdViMVog8B0Uh4/Si80t
         gVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958297; x=1792563097;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZm/vIlfQJTUqTZZrMVb2/qO3rbKTGj4bQH8tA6ISMs=;
        b=dl4pw1MFiCBpYXQT4aUVN3XQ/ZBDA/MNaHR2Qzz+5Osu6vkWA8ASID9G2MxoKGiPFH
         i4QRMAYK7xaF9iyHARfEGA4v2zCki+gFNZnIRdhGceYfc77W+7aaGgV9kMp7zjfH0DjF
         93cDlbE94Z+gOSzg4J5eJMRr89JeAbkUcA7XipikUFKvpzK8Q+GmyULpEgJU8JmRrN7U
         xbvHGs5UkXYrmOvrC0/df0DPibnL/lCI8QCjYCJtCYWKwf3G/dka7b/+4An3NrjShjss
         uou/p/QytDFIf1pZFLakR9dnOQ+6mKwA6WJ8PtYcBsyESDy3SlXCyTa15C0QRZCLAPFb
         meRw==
X-Forwarded-Encrypted: i=1; AKwUvByCNEpi1wQi3MbEbL2rId5lmJgF77bLlIA+sSGuBhuoUDyvnh3eMVwLrxMw4D79ecHtb2qJSoI8ZE6HNg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLoZXyJ5s72tnJg7Elhay64kVk8KoDMFogXwfizSv1M3Sg28CnI
	Pp/WSU80+qODvQsgZJMSvySsDVnFrtPsi/hJedD/jGcWMAb+D9O+/D67
X-Gm-Gg: AYBFou1dDvfjDvQlydoxc6NbV9OqnzvFm3Cwftpah4ijR+Fy1e3rAX4LMYn3oMGKynj
	yX3SR1o+4WZOTjsqtXvpIjH9QrpOKMmx2zj8pwxWFXmdNJCwHeMBeSrVqimJlSlbyRZArgaez7q
	fHNuErA3Wz3EYtZO1JW90X1XUbUDeSsn1CWvQNhGqEC3eH7fPRVklS3zqhDvDaksCzh8Q5/WXzn
	hm0859Xwy0mLrKoGG2lQaGcjjZPcCu9KcaaCQm3fDXfzs7xITgzJT2UqiJ8j4tBrXcnc8N0NbPL
	4sEvCHD1AzJ9hf3bl/65DExn0/NoVGt1SSxSN0spYNwWFh6Cv+p9cCH9rEXt2cbyNHXEynED2PT
	ijUrn2UTNz3oRf2h7QvdmPRkgf74pBaB0pvwZgssnc3NqEEbpcaghGChC2rcZlDzoEXjtvaiupX
	Tu6on0+qZZJj8mfvSRX7W7c7qb1WVEzQEtd+If8PwZ3XcCXmmKM4lzT9undQU2huttGhMmp1b/N
	qS+PwYlnp5r6EDyoz3iuKYU6jYDIfi/G9fxh/cK
X-Received: by 2002:a05:7300:de48:b0:353:82b2:205f with SMTP id 5a478bee46e88-35382b220a7mr18363369eec.16.1791958296806;
        Tue, 13 Oct 2026 23:11:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm39504600eec.15.2026.10.13.23.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:11:36 -0700 (PDT)
Date: Tue, 13 Oct 2026 23:11:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: fix race between bus_remove_driver() and
 dev_driver_uevent()
Message-ID: <as8dAu4R99pP1GHD@google.com>
References: <as71DkwHeLGNDsPv@google.com>
 <2026101444-unnoticed-caliber-21d5@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026101444-unnoticed-caliber-21d5@gregkh>

On Wed, Oct 14, 2026 at 07:31:19AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 13, 2026 at 08:24:20PM -0700, Dmitry Torokhov wrote:
> > When a device driver is being removed, bus_remove_driver() removes the
> > driver from the bus klist before detaching it from bound devices. If
> > dev_driver_uevent() runs concurrently on another CPU, it may acquire the
> > bus klist lock after the driver has been removed from the list, read the
> > still-valid driver pointer from the device, and access the driver's name
> > while bus_remove_driver() proceeds to free the driver structure.
> > 
> > To close this race window, acquire and immediately release the bus
> > drivers klist lock after all devices have been detached. This ensures
> > that any in-flight uevent generation that observed the driver pointer
> > before device detachment completed finishes reading the driver name
> > before the driver structure is destroyed.
> > 
> > Fixes: 18daa52418e7 ("driver core: fix potential NULL pointer dereference in dev_uevent()")
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> > 
> > Extremely unlikely to hit so I would not worry about backporting to
> > stable.
> > 
> >  drivers/base/bus.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> > index d17bd91490ee..8b3aaf451e4f 100644
> > --- a/drivers/base/bus.c
> > +++ b/drivers/base/bus.c
> > @@ -830,6 +830,15 @@ void bus_remove_driver(struct device_driver *drv)
> >  	driver_remove_file(drv, &driver_attr_uevent);
> >  	klist_remove(&drv->p->knode_bus);
> >  	driver_detach(drv);
> > +
> > +	/*
> > +	 * Ensure that any concurrent dev_driver_uevent() that observed
> > +	 * dev->driver before driver_detach() cleared it, finishes
> > +	 * accessing drv->name.
> > +	 */
> > +	scoped_guard(spinlock, &sp->klist_drivers.k_lock) {
> > +	}
> 
> Shouldn't the compiler just no-op this away into nothing?

It better not. Why would it?

Thanks.

-- 
Dmitry
