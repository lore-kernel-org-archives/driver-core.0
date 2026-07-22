Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B4221F2F
	for <driver-core@lists.linux.dev>; Wed, 22 Jul 2026 20:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751386; cv=none; b=k8szvZFYLM90R4ALTGyijDH4HTvEPjzyHBx8dYiw1YAM8v8HbtiukljIpTPhzqxPjKXIrecJaNbKIesep6ACPfjCgejcT0diCahPgxRIyhobdjasSdl/2LGzqcaWi5o06kKaZ8ouQsd4TjMQajep7xmF95WOUxAufgIu5PTnqAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751386; c=relaxed/simple;
	bh=kw1QOlFvCqZDAjrZFeVrNS97i/mTm2S0GaQwYAJUaE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTaig0CJZ/TBcDYYA7/pKOc/8gprnUtVxQ0C4OXXA0lPzDseaFmOq6LFAbz+yQUl84GLg5yk2ACHvzKNI1ZuTqRQWfUNvjP1yjM6RLyRZF3rpED0sdsPKPdw0es4E+6MAYup+qnYaH3ilppaA+414DwBnQNgK8ANiJStkbRz5fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m7zT07r1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m7zT07r1"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49DFF594;
	Wed, 22 Jul 2026 22:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784751323;
	bh=kw1QOlFvCqZDAjrZFeVrNS97i/mTm2S0GaQwYAJUaE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7zT07r1h3HNQ+JitZo09hvoyckOg4UUiHjlBaWEXMmwR1/5WtGBqaNr0lH5DjWXU
	 FR6fCTTuoekZwH5lQJsJj96BrEY8cyXEar4Zdp/9RmXlNocYk/pJRExEerX01e6F0l
	 JkWIH8/W/2fXtQ3PLSvakYycuaMx02O/e79GEHZk=
Date: Wed, 22 Jul 2026 23:16:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <20260722201622.GD648629@killaraus.ideasonboard.com>
References: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
 <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
 <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
 <amD_vkMOrtKq5NvX@bombadil>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amD_vkMOrtKq5NvX@bombadil>

On Wed, Jul 22, 2026 at 08:24:37PM +0200, Richard Leitner wrote:
> On Wed, Jul 22, 2026 at 02:59:12PM +0100, Mark Brown wrote:
> > On Wed, Jul 22, 2026 at 10:42:46AM +0200, Richard Leitner wrote:
> > > Introduce a common regmap dt-binding schema with an optional boolean
> > > property no-sequential-read to describe hardware integrations where
> > > reading multiple consecutive registers in a single operation is not
> > > reliable and registers must be read individually.
> > 
> > > A typical case are imaging sensors used on vendor-provided camera
> > > modules whose bus integration does not support reads that advance across
> > > consecutive register addresses. In such cases, single-register reads
> > > work, but bulk reads do not. This restriction is a property of the
> > > concrete hardware integration, not of the chip itself. It therefore
> > > cannot be identified from the device driver and duplicating firmware
> > > parsing in each affected driver does not scale.
> > 
> > No, this should not be a DT property.  We should discover this through
> > the bus, just like we do currently for the various I2C quirks that are
> > advertied by the I2C subsystem.
> 
> What do you mean "discover this through the bus"? As mentioned in the
> commit message there is no possibility to detect that within the affected
> I2C device drivers.
> 
> Or do you mean that it should be "discovered" by modelling the MCU which
> "proxies" the I2C traffic between the host and the sensor/device as some
> kind of "parent" device of the sensor?

Mark's comment wasn't totally clear to me. I think this is what he
meant.

Richard, do you know if the MCU (which is actually an FPGA if I'm not
mistaken) intercepts the I2C signals (i.e. is interposed between the
host and the image sensor), or is "just" connected on the same I2C bus
and messes up the I2C transfer when it detects a condition it dislikes
(for instance by pulling the SDA line down when it detects a read from a
protected register) ?

> Or something other?
> 
> Sorry, if I don't get it, but currently I see no other option than
> providing this information somehow via device-tree. No matter if it's in
> regmap or I2C.

-- 
Regards,

Laurent Pinchart
