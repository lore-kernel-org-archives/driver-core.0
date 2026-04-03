Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91DE3CEB87
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775239672; cv=none; b=Kzl6IXJaz2SxG43NygQrW9tZ4QA2BGGgh537VyarAJj4w+CsbZIrUFFbC6Q4Yo8cK33FXzToSh1zGfyor27xpW/08WqrBAnsYFkW/KvlB7zvxHFZWd7ZNQz2Wi1I9XVAPiN/ZVcjbvZlILhqQIs9GSaWxQVeh0gnBkTN+DH+N9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775239672; c=relaxed/simple;
	bh=UFPWSEdBYNvmgOvcN99SS0anBY+f8Mv9diH3OxTcOTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRZxujByMZfhgIwpBz6uZ6AmRVFf7Cb8F1vXYVY6oOkRLEFSZA0j48RVdfRl9P/K2w1a65eCHJ5CdPSLNSqoOSNZ1nomH8QIj5VWVDukF+DQm+Vq3iKyZQjfdsecj0RW/6iVrqllxmMpYvBLZ0hyQfLbsFEROsOIHo6IIA49o70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SX9+7TM4; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SX9+7TM4"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1273349c56bso2653038c88.0
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775239670; x=1775844470; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XYS8rrk/W9xmmpVLtPf6SPDq6V5JZhKXUApyjYv6jfU=;
        b=SX9+7TM4575vkF0EWP39UA0q6R0ZhuzxdykmtJd7UqoVTCmOJjGCCrcCeNAfTFRMtO
         8AR9GDMFZl+T+Y8ugEzW6aAbP/CPKvWUIYvt5IR2OWMJ9HmN2ujD6A4hHTKXNnriSWEi
         GXY708q7l486MOPTApSmR5q42o6XDzxa2SqfZlXT8HU3fl3WkMfoLWR9SCkkJ5YgJ0aI
         JkQnSMiJ44yaRzvcJzhXRrXnj4zsTDp3u9xconfHlimycRap7P1gqUQaz+P3evm3CDBN
         EczXxV6PmHDqq4pMVLCI/Lhqf91N9xuHQX2kFXVwPDuxDtHzqy3CpOf4eG8eqDsCEAxG
         uh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775239670; x=1775844470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYS8rrk/W9xmmpVLtPf6SPDq6V5JZhKXUApyjYv6jfU=;
        b=ZeDf23umPB64n4HRizIoogVSEhV19LKZooxfjeOxyj8iojlbVnGSrT80qpaNGPzmS4
         FLprMi8oWDfTgVLznnnk+XG3lmqaq91xI39thEiJMk4YA+AkqArPQ2g2bupuCGqUxwQZ
         m/2EOiLqxCrxUSVfhmk8t3/aZZ2NVxkoGYsKfc6ACw1lZxCOvLu+8dIBxDmxpGKqxRzO
         EGF1rLJQXHC/Z2l/nUH77vG+cPSdIYIlgrEFQCOZ5t+fD3p6ZCvDk5ygM49C0P2AC2V0
         6/AKhzMU3gZSWfM2JHL0wKaTHcEFw9KNqZdz2EHys/31RoICq2CRLGvlmJRdtI7zPjrV
         +MQA==
X-Forwarded-Encrypted: i=1; AJvYcCWIUlxhCjl55tY9i5PsHNi/cBy9ifnuUcJN7pAULklLmXP7InGg1kOMLXU3xwbiCAQp9WH1CRpnvUAguQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrwWhS18kwc1an4CK4PBw1ihANaEYwq4M/vHXK4wrhyfd7EFJk
	7ErAwZn032ur9qWHTsDECpM3QlERRYGRt94QhXubJF2Lko6N0SvThwRT
X-Gm-Gg: ATEYQzwFxDfamHDGPxH9CnZqh6xO+5A28HfliKn/Nzd6rkCHj/S9EQDWjx1qmmXXXSy
	MVo57lx+E3Qk7AqmZ9SQ9EdLITwUOd+taeZVveNG9OO30OYsdBlsnnBqMMsrI29Hz/gNWNLCbZK
	G9j5ur9EhuPy85LyrFGblMKjRuRr5BTvEfr2TuFv5AmjxUQPYx9gVh/AK3fwY1cZuzs/PNBN93x
	x/sYhOp5yIbU2tdwSqVz3xLgwupzz/pVBQS6SHQIEEtDmcP1Ln6cn5jpj8iH3EOdx8pa51AoBCY
	6BfTnanvr2bP0j+XnXyJWLTe1cDPNiOs3JCZkwCfcdUD3vBe/iFJce+SaW4wnU0SVAUdyPF9epf
	VV3C/7u4pSCAh1CQh8JUUkbW3eHC0//UETUh5UfeUt8jO2R8Bxltt8CfLcF0mVMIoLRUznPkOEn
	+O6npIT4xshS4dzqHhi6de0ck79th7SRCvVReGmRJk7ct3uVrTjNe+9rvOBdP41IHI
X-Received: by 2002:a05:7022:43a8:b0:119:e569:f609 with SMTP id a92af1059eb24-12bfb6ecd57mr1666933c88.2.1775239669720;
        Fri, 03 Apr 2026 11:07:49 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2357:9278:e4dd:85f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede7f004sm5079641c88.13.2026.04.03.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:07:49 -0700 (PDT)
Date: Fri, 3 Apr 2026 11:07:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/4] software node: return -ENXIO when referenced
 swnode is not registered yet
Message-ID: <ac_9EV3C0I1WXQz2@google.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
 <ac5wprh9vfTU5pGa@ashevche-desk.local>
 <ac7UqTsPC8yUooAR@google.com>
 <CAMRc=Mcq-T=4fnGTWXzEBjfiPaZLGw4HVAuOm48v-5Uf++K5xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcq-T=4fnGTWXzEBjfiPaZLGw4HVAuOm48v-5Uf++K5xg@mail.gmail.com>

On Fri, Apr 03, 2026 at 09:29:38AM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 2, 2026 at 10:43 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Thu, Apr 02, 2026 at 04:35:34PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 02, 2026 at 02:54:26PM +0200, Bartosz Golaszewski wrote:
> > > > It's possible that at the time of resolving a reference to a remote
> > > > software node, the node we know exists is not yet registered as a full
> > > > firmware node. We currently return -ENOENT in this case but the same
> > > > error code is also returned in some other cases, like the reference
> > > > property with given name not existing in the property list of the local
> > > > software node.
> > > >
> > > > It makes sense to let users know that we're dealing with an unregistered
> > > > software node so that they can defer probe - the situation is somewhat
> > > > similar to there existing a firmware node to which no device is bound
> > > > yet - which is valid grounds for probe deferral. To that end: use -ENXIO
> > > > which stands for "No such device or address".
> > >
> > > This error code is also too generic to my taste. What about alternative(s)?
> > > EADDRNOTAVAIL
> > > ENOTCONN
> > >
> > > (The brief grep shows that the second one might suit slightly better than the
> > >  first one by existing use cases.)
> >
> > We are in the core of the driver core. Why not simply use -EPROBE_DEFER
> > to which all users will resolve this error to and call it a day?
> >
> 
> Because -EPROBE_DEFER only makes sense in probe() context, while
> fwnode_get_reference_args() may be called in many other situations.

Exactly same argument applies to your follow-up change: gpiod_get()
returning -EPROBE_DEFER only makes sense in probe context but it may be
called in many other situations. Are you planning to change all places
where gpiolib returns -EPROBE_DEFER to something else just in case it
might be called outside of probe context? 

-EPROBE_DEFER should have been called -ENOTREADY from the beginning and
then we would not have this argument. Or, even better, we should have
used -EAGAIN. But it is just a name, semantics does not really change.
We want to signal that something is not ready and the operation needs be
repeated. Currently we contorting ourselves by using yet another error
code that everyone will either convert to -EPORBE_DEFER or will handle
like -EAGAIN.

> I think ENOTCONN as "not connected" makes sense, though the string

Why is it better? Most of users of -ENOTCONN are in networking code so
it is somewhat unexpected to have other APIs return it. 

> representation says: "Transport endpoint is not connected" which
> doesn't spell out quite the same thing.

Yes, because it is really for networking/sockets handling.

Thanks.

-- 
Dmitryp
