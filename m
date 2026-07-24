Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9213ED3B3
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784885305; cv=none; b=CMxOYfbSIdFLQHWBbMmo9Q8O0KwAESxjJ0jY4W6BfXcPJB/n3Ktzn9WGpkELDPlHHXXBD4fHnRMKbAqIamN+qi2TThmPQs6eD+ppnzE5txerdXHdslRVa4wWbKohtH2JOYfarH/pM3uoojhMaDt6TGIZiTO0UoSlrWKu5pxVBGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784885305; c=relaxed/simple;
	bh=nhLFan2ihvZzmyzJSMHZkWevh4Nk25HPvpyVLxcXLMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0tZqg6w1fhZQHfBYFFkgzMpDqYTuvXPS8fT4SReBDq2YoGJxEceV8Mv0IXZ9XGJinAxa/dVVIqiECTRJpw7fxkQuRW4BZCTf8Oc8aHnFEulCB0DPyTn4SCw8a6Bk3Au8SVAXTaO8p2SPRlMsdQuvkGnsuJGn4UeiJkTZvXtHQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bjhSETa0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bjhSETa0"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EABB524;
	Fri, 24 Jul 2026 11:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784885233;
	bh=nhLFan2ihvZzmyzJSMHZkWevh4Nk25HPvpyVLxcXLMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bjhSETa0gNjVCr4kSoV5cKZkcIW67f3XMtzL4aed5rk2Vi3tNDM6xsQqDJcG/Gpzz
	 3uUTNgDqL7nyxjFtKqvxaRsceICvOWGO+zlLvVLPD2+ADm57KHrV1OJrw5EIyt+wad
	 FcGHQPGMKx+ealxlWfV/0xfoXXbJEmzflKcfnQn4=
Date: Fri, 24 Jul 2026 12:28:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <20260724092812.GD712773@killaraus.ideasonboard.com>
References: <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
 <amD_vkMOrtKq5NvX@bombadil>
 <20260722201622.GD648629@killaraus.ideasonboard.com>
 <amEvJBOE3Ja014Ap@bombadil>
 <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
 <amHznORUaOnUFyS4@bombadil>
 <20260723154541.GA764516@killaraus.ideasonboard.com>
 <20260723-hamster-juniper-5697cacade96@spud>
 <20260723161048.GC767247@killaraus.ideasonboard.com>
 <amJiqHd6I45w_e0-@bombadil>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amJiqHd6I45w_e0-@bombadil>

On Thu, Jul 23, 2026 at 08:55:18PM +0200, Richard Leitner wrote:
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
> Thanks for the clarification. Should I continue working on this topic
> (i.e. modelling the FPGA as I2C controller with the sensor as a
> "subdevice")? Or do you want to take over Laurent? Do you have any other
> downstream work on the vc-mipi stuff, except the patches in your gitlab
> repo?

I'm afraid I won't have time for the time being, as I will soon start my
summer holidays. The patches in the git tree you mentioned are all I
have.

> I've additionally wrote "my Vision Components contact" an email asking
> for clarification of the I2C bus layout on the modules yesterday. If I
> get any new information from that path I will of course take it into account.
> 
> Thanks a lot, Laurent!

-- 
Regards,

Laurent Pinchart
