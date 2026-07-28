Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC1C3B960B
	for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222801; cv=none; b=jDhohf63rbIJpvpkHNzROo5eAtWn8OdyWlDbs1Wk8M3QWvPxpdvPXX34Bz6TaRLoJWzVNXMcu7GFnaqBnIxSjO2yCmwLbtsdjfm4RWQ2b2sqPPVBL6MfXopcMSl42UH4Q+d6ELPuWQWAaSZ/XDmdRAyDqxffRb5b3/5Ai/Yb4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222801; c=relaxed/simple;
	bh=mjKK88DT1Rk+iIX8hOsyWczc26G4O8r4eaKiEyE3SM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKB+IFL+Xs5VrIcBkyR2H8lZchCXKegVJCLRKdZVoECKyLtXhNzwDWIRy5cwawWezwiyPJq712Wfa8X0XIMx28V8x8f28aecmIw3JFtaBS6RTuNk1hqVip7oxrDCu+XX/X8DAMtUpsJLAB+dfDMQ2LQU2J0VHoppvuIxQw6UC0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mn9I/k6G; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mn9I/k6G"
Date: Tue, 28 Jul 2026 09:13:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785222795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNJfnJCVGrisL2Q9GMR3UZa22fIREltooVK55uzyj4g=;
	b=mn9I/k6GlRH2HbTTrFSrjNw8RIgbs/VZ5oIbcBdsqrA1tPYm5Xmmzu35TT7Ap4TAkgSA7Y
	tLcBqyxcQ4v+eTXhmUCr7VssVj4xAPVOFuI9+cgaLmPYk0NmvSoJX/ZjkRUkKwHfVMnJ27
	O1eQlRcCKvLpFij/c0SXv1+JUhOqFfw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] dt-bindings: regmap: add common schema for
 no-sequential-read
Message-ID: <amhUDOnhoj4tk4vN@bombadil>
References: <amD_vkMOrtKq5NvX@bombadil>
 <20260722201622.GD648629@killaraus.ideasonboard.com>
 <amEvJBOE3Ja014Ap@bombadil>
 <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
 <amHznORUaOnUFyS4@bombadil>
 <20260723154541.GA764516@killaraus.ideasonboard.com>
 <20260723-hamster-juniper-5697cacade96@spud>
 <20260723161048.GC767247@killaraus.ideasonboard.com>
 <amJiqHd6I45w_e0-@bombadil>
 <20260724092812.GD712773@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724092812.GD712773@killaraus.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 24, 2026 at 12:28:12PM +0300, Laurent Pinchart wrote:
> On Thu, Jul 23, 2026 at 08:55:18PM +0200, Richard Leitner wrote:
> > On Thu, Jul 23, 2026 at 07:10:48PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jul 23, 2026 at 05:02:42PM +0100, Conor Dooley wrote:
> > > > On Thu, Jul 23, 2026 at 06:45:41PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Jul 23, 2026 at 01:01:11PM +0200, Richard Leitner wrote:
> > > > > > On Wed, Jul 22, 2026 at 11:03:09PM +0100, Mark Brown wrote:
> > > > > > > On Wed, Jul 22, 2026 at 11:58:46PM +0200, Richard Leitner wrote:
> > > > > > > 
> > > > > > > > @Mark: I understood that if the fpga really intercepts the I2C bus, it
> > > > > > > > should be modelled accordingly in device tree. But what would be the
> > > > > > > > preferred implementation if both devices sit on the same I2C bus, but
> > > > > > > > one is messing up some register reads on purpose?
> > > > > > > 
> > > > > > > I think we would need to have a coherent understanding and description
> > > > > > > of the actual issue to know how to describe it.
> > > > > > 
> > > > > > Understood. I will try to figure out how the hardware is really wired
> > > > > > and come back to you.
> > > > > 
> > > > > Based on the information I have received so far, the FPGA is interposed
> > > > > between the host and sensor. It could therefore be modelled in DT as
> > > > > child of the I2C bus and a parent of the sensor.
> > > > > 
> > > > > New version of some of the Vision Components modules have fixed the
> > > > > multi-read bug, so we will still need a property in the FPGA DT node to
> > > > > indicate if the quirk should be activated.
> > > > 
> > > > Or come up with a compatible for the FPGA DT node that uniquely
> > > > identifies the revision of the RTL in use.
> > > > That's my preference for things that use some custom RTL that aren't
> > > > configuration parameters.
> > > 
> > > I'm afraid we won't be able to get that information. We have limited
> > > visibility on the ecosystem of modules and what the FPGA does in each of
> > > them.
> > 
> > Thanks for the clarification. Should I continue working on this topic
> > (i.e. modelling the FPGA as I2C controller with the sensor as a
> > "subdevice")? Or do you want to take over Laurent? Do you have any other
> > downstream work on the vc-mipi stuff, except the patches in your gitlab
> > repo?
> 
> I'm afraid I won't have time for the time being, as I will soon start my
> summer holidays. The patches in the git tree you mentioned are all I
> have.

Ok. Thanks. Then I will give it a try.

I did some more research on that module and it features a Lattice FPGA
(LCMXO3LF-1300E) which to all of my measurement intercepts the I2C bus
as expected.

As it additionally manages the regulators my approach would be to
implement a Multi-Function Devices (MFD) driver for it.

The resulting DTS layout would then be something like:

&i2c1 {
	fpga@10 {
		compatible = "visioncomponents,vc-mipi-controller";
		reg = <0x10>;

		i2c-mux {
			compatible = "visioncomponents,vc-mipi-i2c-mux";

			i2c@0 {
				reg = <0>;

				ov9282: camera-sensor@60 {
					compatible = "ovti,ov9282";
					reg = <0x60>;
					...
				};
			};
		};

		vc_mipi_reg: regulator {
			compatible = "visioncomponents,vc-mipi-regulator";
		};
	};
};

Mark, Laurent, if that's incorrect or otherwise not acceptable,
please reach out. Thanks a lot!

regards;rl

> 
> > I've additionally wrote "my Vision Components contact" an email asking
> > for clarification of the I2C bus layout on the modules yesterday. If I
> > get any new information from that path I will of course take it into account.
> > 
> > Thanks a lot, Laurent!
> 
> -- 
> Regards,
> 
> Laurent Pinchart
