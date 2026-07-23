Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E69374A18
	for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824737; cv=none; b=IkhgHT29DQxSg1qtSlW17tIEs+IRroIvb2hdiGHtEopegQKzWr0MmJeRXYrdr1X0u1z6L+PU5JGKG8TEYg3Vlwntu/h42S97Kbjz19opGjgizUnm+2vYCstY05gLa39GppAJvVNv+4mw32XdzzpLAqgiWaK7eFFJ44WPUIRpBqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824737; c=relaxed/simple;
	bh=OAHPvY4BE23yFOBedjwhdqbEYvsiJ2oMhLDpRTUAQy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifyZPNas563iqr1NIFyg81b2+NxJI660STZbXkrkMlZA/32DMPrRnZANGokbIM5mHDxZ0MxuAQxYx9JssBDXpoJtWBg9Vp1wf+u253R2BxfAAtFnihLzbqP66odifhiaMkTs52SqTG7Co5B+0iAZ4r22lruvc5FjT3yuQ438GGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I6uSSXoo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I6uSSXoo"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9366819C;
	Thu, 23 Jul 2026 18:37:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784824663;
	bh=OAHPvY4BE23yFOBedjwhdqbEYvsiJ2oMhLDpRTUAQy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I6uSSXoobNdpJx3Lvye2UNhET54EydTgPBer27uc949K/tqM5zBoqFiL4gzJTFBol
	 o8+5s/2dQjhL3+OrvlPM6QEhnWT9SmyKfTqXrqsPWndmL173D+0YZ9wrvWipZBGhOv
	 l/ySM3dKVPcb9Cmx5LejaJR4wr6t9CoWBjvf9h7Y=
Date: Thu, 23 Jul 2026 19:38:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Conor Dooley <conor@kernel.org>
Cc: Richard Leitner <richard.leitner@linux.dev>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] dt-bindings: regmap: add common schema for
 no-sequential-read
Message-ID: <20260723163843.GD767247@killaraus.ideasonboard.com>
References: <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
 <amD_vkMOrtKq5NvX@bombadil>
 <20260722201622.GD648629@killaraus.ideasonboard.com>
 <amEvJBOE3Ja014Ap@bombadil>
 <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
 <amHznORUaOnUFyS4@bombadil>
 <20260723154541.GA764516@killaraus.ideasonboard.com>
 <20260723-hamster-juniper-5697cacade96@spud>
 <20260723161048.GC767247@killaraus.ideasonboard.com>
 <20260723-empathy-seventh-b4aecf8f1b18@spud>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-empathy-seventh-b4aecf8f1b18@spud>

On Thu, Jul 23, 2026 at 05:31:25PM +0100, Conor Dooley wrote:
> On Thu, Jul 23, 2026 at 07:10:48PM +0300, Laurent Pinchart wrote:
> > On Thu, Jul 23, 2026 at 05:02:42PM +0100, Conor Dooley wrote:
> > > On Thu, Jul 23, 2026 at 06:45:41PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Jul 23, 2026 at 01:01:11PM +0200, Richard Leitner wrote:
> > > > > On Wed, Jul 22, 2026 at 11:03:09PM +0100, Mark Brown wrote:
> > > > > > On Wed, Jul 22, 2026 at 11:58:46PM +0200, Richard Leitner wrote:
> > > > > > 
> > > > > > > @Mark: I understood that if the fpga really intercepts the I2C bus, it
> > > > > > > should be modelled accordingly in device tree. But what would be the
> > > > > > > preferred implementation if both devices sit on the same I2C bus, but
> > > > > > > one is messing up some register reads on purpose?
> > > > > > 
> > > > > > I think we would need to have a coherent understanding and description
> > > > > > of the actual issue to know how to describe it.
> > > > > 
> > > > > Understood. I will try to figure out how the hardware is really wired
> > > > > and come back to you.
> > > > 
> > > > Based on the information I have received so far, the FPGA is interposed
> > > > between the host and sensor. It could therefore be modelled in DT as
> > > > child of the I2C bus and a parent of the sensor.
> > > > 
> > > > New version of some of the Vision Components modules have fixed the
> > > > multi-read bug, so we will still need a property in the FPGA DT node to
> > > > indicate if the quirk should be activated.
> > > 
> > > Or come up with a compatible for the FPGA DT node that uniquely
> > > identifies the revision of the RTL in use.
> > > That's my preference for things that use some custom RTL that aren't
> > > configuration parameters.
> > 
> > I'm afraid we won't be able to get that information. We have limited
> > visibility on the ecosystem of modules and what the FPGA does in each of
> > them.
> 
> Oh well, I tried..

Let's look at the bright side: the vendor has fixed the issue after we
reported them, so DT for newer modules will be better :-)

-- 
Regards,

Laurent Pinchart
