Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39D53EC686
	for <driver-core@lists.linux.dev>; Wed, 22 Jul 2026 21:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757542; cv=none; b=aBpCdSuwUGoekrTQz/RmyCOY0P/aETV4WFF+emGQPLpV0tU0o3QKi0Dfa9Zsq5PKSt/b7fNN5AAEN1bskjPfTW4R/iqKnFPldx6b+mdH7azhFzMna+a1bqSsjCTBas6IeyxNxSu3zWV9YTgFwB/+BYMsD2RA/D724svvHDwrtRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757542; c=relaxed/simple;
	bh=ycEiIIcCT5yVjX3Nt8+2A2w4QM8LWfMkFITbvsAX9BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sax1B/0Al5QR8ITvQOEOZt1m91GOajpDNW7ZnyY3PcQza9RLLXvGJedIEXj8gxf+McFsn1oMub4MH7M4TfgE7n+n/Tg+UAWXiGLohn2iP5V0LmIsNbgQtVELo2wXSS5DJxLkiEdDc7Holf9iinox5HocjtVOCS/MpELmGJihLic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EYuPraTj; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EYuPraTj"
Date: Wed, 22 Jul 2026 23:58:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784757537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QgzAIpdd+j+xpJQn78Dbh3kor0P0pw/C6gIhbXHEbfw=;
	b=EYuPraTjsHbh70ukYCwtP1dOLP/KbFoa7gaXgzlxWjZbsfoIOGKTzMiHvBNst0cuATAWTz
	CpWmm9eSeZeJB0/XtqvcOgb0opfp+S4woqOILNoFyZq5yPFt9/EcL7S5oHG0cx2MHsoweP
	hL8YxpgUWXJjYkieg1WmOXp6gs4Bcv4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] dt-bindings: regmap: add common schema for
 no-sequential-read
Message-ID: <amEvJBOE3Ja014Ap@bombadil>
References: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
 <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
 <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
 <amD_vkMOrtKq5NvX@bombadil>
 <20260722201622.GD648629@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722201622.GD648629@killaraus.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 11:16:22PM +0300, Laurent Pinchart wrote:
> On Wed, Jul 22, 2026 at 08:24:37PM +0200, Richard Leitner wrote:
> > On Wed, Jul 22, 2026 at 02:59:12PM +0100, Mark Brown wrote:
> > > On Wed, Jul 22, 2026 at 10:42:46AM +0200, Richard Leitner wrote:
> > > > Introduce a common regmap dt-binding schema with an optional boolean
> > > > property no-sequential-read to describe hardware integrations where
> > > > reading multiple consecutive registers in a single operation is not
> > > > reliable and registers must be read individually.
> > > 
> > > > A typical case are imaging sensors used on vendor-provided camera
> > > > modules whose bus integration does not support reads that advance across
> > > > consecutive register addresses. In such cases, single-register reads
> > > > work, but bulk reads do not. This restriction is a property of the
> > > > concrete hardware integration, not of the chip itself. It therefore
> > > > cannot be identified from the device driver and duplicating firmware
> > > > parsing in each affected driver does not scale.
> > > 
> > > No, this should not be a DT property.  We should discover this through
> > > the bus, just like we do currently for the various I2C quirks that are
> > > advertied by the I2C subsystem.
> > 
> > What do you mean "discover this through the bus"? As mentioned in the
> > commit message there is no possibility to detect that within the affected
> > I2C device drivers.
> > 
> > Or do you mean that it should be "discovered" by modelling the MCU which
> > "proxies" the I2C traffic between the host and the sensor/device as some
> > kind of "parent" device of the sensor?
> 
> Mark's comment wasn't totally clear to me. I think this is what he
> meant.
> 
> Richard, do you know if the MCU (which is actually an FPGA if I'm not
> mistaken) intercepts the I2C signals (i.e. is interposed between the
> host and the image sensor), or is "just" connected on the same I2C bus
> and messes up the I2C transfer when it detects a condition it dislikes
> (for instance by pulling the SDA line down when it detects a read from a
> protected register) ?

Tbh. I don't know. The VC MIPI Camera Module Hardware Operating manual
suggests both, the controller and the sensor sit on the same I2C bus:

https://www.mipi-modules.com/fileadmin/external/documentation/hardware/VC_MIPI_Camera_Module/index.html#mipi-sensor-module-circuit

But that's just a block diagram and nothing is written down really.

I tried some reverse-engineering and probed most of the accessible pads
of the camera module with my scope. I found no evidence that there is "a
second I2C bus" with "delayed" signals as I would suspect if the FPGA
really intercepts the I2C traffic.

Nonetheless this is by far no proof that this isn't the case, as the I2C
lanes of the imaging sensor are not accessible without destroying the PCB
:-(

So any help/feedback/information is greatly appreciated.


@Mark: I understood that if the fpga really intercepts the I2C bus, it
should be modelled accordingly in device tree. But what would be the
preferred implementation if both devices sit on the same I2C bus, but
one is messing up some register reads on purpose?

thanks & regards;rl

> 
> > Or something other?
> > 
> > Sorry, if I don't get it, but currently I see no other option than
> > providing this information somehow via device-tree. No matter if it's in
> > regmap or I2C.
> 
> -- 
> Regards,
> 
> Laurent Pinchart
