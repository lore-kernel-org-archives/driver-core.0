Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC95147A868
	for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821548; cv=none; b=brBNa7iRdaM1bhw0adP5ymcFyTaveL+3p8x2nNFkeXRijY0ZgB2YyR1k0aQEo21F19Fv/BSKV2Q1AYcUAsRHtnlWGESc5wQx/Ru64GJfCOVVfxGCZKaS8m765ERrnA2e44R5OQsarOHK/I3w+lLdMRieH9yUk6ho+3bVUATN80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821548; c=relaxed/simple;
	bh=oEFMkryztdztgbBqD7MgtEgSQl2lfC96WXOHlm0qYHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paf9SJS9uUCX2H39ehJJH0E+O1Qy9mJb6hgka9yZ/mIhwXtsA2nO2iImsgtf/MH2YmK9lqgoNGsIwp5GsS+gZI+NkqtYt1ASEDp9juM45NF6Y5FIGEjiEY0vY3GNR90Gw0DCTwdRiqGbtpFpZdo+/+KDt+AFbIuLc/9gHYiu8nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iqpy1YHZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iqpy1YHZ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 772121C37;
	Thu, 23 Jul 2026 17:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784821481;
	bh=oEFMkryztdztgbBqD7MgtEgSQl2lfC96WXOHlm0qYHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqpy1YHZDiapYnRDDS2LE5QiD7/DDXnO3UNnS/a4Z0iDtuEHzlTY5Ns8fuGP7xZP0
	 VMw8x4TdQlLToBjYHPuzBnCBl0+XkJsJz6x1Nw4UQP5obcgIotvc2DKcbLdZlJPBkO
	 NkCPkwjUmpTue/zlRNxkuuesa70Wcit9OnJie04g=
Date: Thu, 23 Jul 2026 18:45:41 +0300
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
Message-ID: <20260723154541.GA764516@killaraus.ideasonboard.com>
References: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
 <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
 <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
 <amD_vkMOrtKq5NvX@bombadil>
 <20260722201622.GD648629@killaraus.ideasonboard.com>
 <amEvJBOE3Ja014Ap@bombadil>
 <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
 <amHznORUaOnUFyS4@bombadil>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amHznORUaOnUFyS4@bombadil>

On Thu, Jul 23, 2026 at 01:01:11PM +0200, Richard Leitner wrote:
> On Wed, Jul 22, 2026 at 11:03:09PM +0100, Mark Brown wrote:
> > On Wed, Jul 22, 2026 at 11:58:46PM +0200, Richard Leitner wrote:
> > 
> > > @Mark: I understood that if the fpga really intercepts the I2C bus, it
> > > should be modelled accordingly in device tree. But what would be the
> > > preferred implementation if both devices sit on the same I2C bus, but
> > > one is messing up some register reads on purpose?
> > 
> > I think we would need to have a coherent understanding and description
> > of the actual issue to know how to describe it.
> 
> Understood. I will try to figure out how the hardware is really wired
> and come back to you.

Based on the information I have received so far, the FPGA is interposed
between the host and sensor. It could therefore be modelled in DT as
child of the I2C bus and a parent of the sensor.

New version of some of the Vision Components modules have fixed the
multi-read bug, so we will still need a property in the FPGA DT node to
indicate if the quirk should be activated.

> > Please do not add random characters to my name.
> 
> Sorry, I didn’t mean any harm.

-- 
Regards,

Laurent Pinchart
