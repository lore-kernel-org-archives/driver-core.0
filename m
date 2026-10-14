Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961BC51EDED;
	Wed, 14 Oct 2026 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985085; cv=none; b=SuUFa+DxJ2kTyS3UJQVkQTvxI3pEt687IdzgtcpsWG3CJmlsoxxPF67/J45K41f/DB3dPfDTjXtViEFRWWCl2/QrAw96y9TiPXa45v7Jas9yCeFS5X1iDc6kLbQJiy+Zh9OPfK00rzeKjeV1x6Y8Zg/FYfnacRC3BQn2oMv4SLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985085; c=relaxed/simple;
	bh=lsLgCFxLmomxMTZ7taP21AHXZ2tRz3Rk2n/Urrr7EjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKCCKmLzl1MyJFw+BFAsXrD8tmKtAN6OgcKy8heIpQiwxTay2fm+nmfKvKW9IYDJq4HA6K25mMMYUCG3kWJhyuHB1zcmnwzjVKNIPkKM3/N/N2D4h4DyjA9kgFAGLTeNziohIAbVicQKybESVdD7TVnhaKf2sv4T0uOFsEMD3JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jT74RIkY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jT74RIkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352A61F000FF;
	Wed, 14 Oct 2026 13:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791985084;
	bh=WVbTgdcg4XcQxdZoauWuBZS9YbZkaCVeEj9rq8u1Bi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jT74RIkYDUlgpNbv5Zkm4TgJ/LtDz4TmX0BY5jQ5TUafYEUTfJ3dmIJvTlEMhMnZj
	 94yU7Lfu2LULvRVWij++3Jl8Iu7yMLv193H7nLrAC/nSvRVluKwWDhlZ5mwz8xKo8F
	 NLeWf6b476abexFPFbT312U8Ib2r1jkQGonueRGrZip8F6itVGGx8PIkSDd/1oHKWW
	 UBylMh59lAMja6xJrOi4iSOgo6d+iuhpLMzZyMwlRb6yJL3CthObC0Y7EP7D4t85du
	 aUSDbeSU6KOxLeyOipPAOWj5B2zp9FGCge/e5/0OM2TJFKRuV2j9B7Fcc2rnJFpBMS
	 qKHnPkd0nDu/w==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xGzBC-00000005qIS-0nwh;
	Wed, 14 Oct 2026 15:38:02 +0200
Date: Wed, 14 Oct 2026 15:38:02 +0200
From: Johan Hovold <johan@kernel.org>
To: PETER Mario <mario.peter@leica-geosystems.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] driver core: take parent lock in async device attach
Message-ID: <as-FumLy7e1BedqS@hovoldconsulting.com>
References: <20261013140408.1226841-1-johan@kernel.org>
 <c465c6a3-d189-4304-a7ea-feb3eea33674@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c465c6a3-d189-4304-a7ea-feb3eea33674@leica-geosystems.com>

On Tue, Oct 13, 2026 at 03:41:28PM +0000, PETER Mario wrote:
> On 10/13/26 16:04, Johan Hovold wrote:

> > @@ -1038,7 +1070,7 @@ static void __device_attach_async_helper(void *_dev, async_cookie_t cookie)
> >                 .want_async     = true,
> >         };
> > 
> > -       device_lock(dev);
> > +       __device_driver_lock(dev, dev->parent);
> 
> Thanks for picking this up and for fixing the deadlock.
> 
> The use-after-free that the AI review flags here is real, I can
> trigger it in QEMU. With a debug delay before this line,
> driver_async_probe=usb,hub, and dummy_hcd unbound while the probe of
> the emulated hub's usb_device waited, KASAN reports a
> slab-use-after-free in __mutex_lock() called from
> __device_attach_async_helper(), on the root hub. An interface pins its
> usb_device, but a usb_device doesn't pin its parent hub, and dev drops
> its reference to the parent in device_del(). v2 has the same problem.

Thanks for checking. I can also trigger a UAF through some existing
paths when disconnecting a hub (with some instrumentation to increase
the race window).

I've just sent a v2 series for the deferred probe fix that also
addresses the UAF issue and includes your fix:

	https://lore.kernel.org/all/20261014133109.1392265-1-johan@kernel.org/

Johan
