Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7959933BBAD;
	Thu, 23 Jul 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824294; cv=none; b=Wz1x+ZE/+LlEgHZF1Q4/MI4z3tR8zGlO+hp62A1I3fZlZ07kP9jCtzMNrpdgOWSmO6RGNitkE6OA8WnYaDQJ27R2FIxqQBqUokQEyRwa/n2CDwMAB1LK3TFoYne6CJqTu7WxstISR5iM2yb9Mj83i79DlSOPv9T/LUfRtsuYlJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824294; c=relaxed/simple;
	bh=/MQgrGNIcC7vdXpJvaJdRFI9SoTgCHG4tz2LBIaZu18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otsCu173dOdcykCz02VX72HvaQRcB6mwCOgHDUtFCwqLFRATgi5gApj+O6sZNp2+xoax2uKpcQ+ALcdn+nLwesmzcV8zBfNc/44HX9q5sBCEMLMewXRcT9SOe2AbprEqR85nzQ2NsvVoOBzk7vsba6bCbg2HqONePasx8w6aoBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIWjAk0R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIWjAk0R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6511F000E9;
	Thu, 23 Jul 2026 16:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784824293;
	bh=/MQgrGNIcC7vdXpJvaJdRFI9SoTgCHG4tz2LBIaZu18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kIWjAk0RoFxHYHN1bsyLoj4ED6QLvOi17u0rgMl1DdV8HWvmj6fQCDC7nYQptNt4U
	 5CFHlsRbGr1Sommb2Qi+IZ+/MDgklvO+ujktMS8gACespUBbM/pJxLeEJ/UduG8eVw
	 U7O+yWUF2eKYJmohNwARM9sh5EEacct+Kh/eB6zbUgS05B/tgiD9vI0fCFh0mFwb2Z
	 Azrag0ZZW1Ph8NhVh0Mie8WHSye1tBQwKYSeFghX09J2qxIf5nHqoHMx+TUdLzv6Wm
	 uL1Z1Lhuo0PATb3FBwTZL04X4dAQ2MjKkIQfFH3pddy6qrZy69wmlc2Iwm+z/o6OoL
	 C4a1A8BOY3aRA==
Date: Thu, 23 Jul 2026 17:31:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20260723-empathy-seventh-b4aecf8f1b18@spud>
References: <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
 <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
 <amD_vkMOrtKq5NvX@bombadil>
 <20260722201622.GD648629@killaraus.ideasonboard.com>
 <amEvJBOE3Ja014Ap@bombadil>
 <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
 <amHznORUaOnUFyS4@bombadil>
 <20260723154541.GA764516@killaraus.ideasonboard.com>
 <20260723-hamster-juniper-5697cacade96@spud>
 <20260723161048.GC767247@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JD/Lr18SyWRnWAQ8"
Content-Disposition: inline
In-Reply-To: <20260723161048.GC767247@killaraus.ideasonboard.com>

--JD/Lr18SyWRnWAQ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 07:10:48PM +0300, Laurent Pinchart wrote:
> On Thu, Jul 23, 2026 at 05:02:42PM +0100, Conor Dooley wrote:
> > On Thu, Jul 23, 2026 at 06:45:41PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jul 23, 2026 at 01:01:11PM +0200, Richard Leitner wrote:
> > > > On Wed, Jul 22, 2026 at 11:03:09PM +0100, Mark Brown wrote:
> > > > > On Wed, Jul 22, 2026 at 11:58:46PM +0200, Richard Leitner wrote:
> > > > >=20
> > > > > > @Mark: I understood that if the fpga really intercepts the I2C =
bus, it
> > > > > > should be modelled accordingly in device tree. But what would b=
e the
> > > > > > preferred implementation if both devices sit on the same I2C bu=
s, but
> > > > > > one is messing up some register reads on purpose?
> > > > >=20
> > > > > I think we would need to have a coherent understanding and descri=
ption
> > > > > of the actual issue to know how to describe it.
> > > >=20
> > > > Understood. I will try to figure out how the hardware is really wir=
ed
> > > > and come back to you.
> > >=20
> > > Based on the information I have received so far, the FPGA is interpos=
ed
> > > between the host and sensor. It could therefore be modelled in DT as
> > > child of the I2C bus and a parent of the sensor.
> > >=20
> > > New version of some of the Vision Components modules have fixed the
> > > multi-read bug, so we will still need a property in the FPGA DT node =
to
> > > indicate if the quirk should be activated.
> >=20
> > Or come up with a compatible for the FPGA DT node that uniquely
> > identifies the revision of the RTL in use.
> > That's my preference for things that use some custom RTL that aren't
> > configuration parameters.
>=20
> I'm afraid we won't be able to get that information. We have limited
> visibility on the ecosystem of modules and what the FPGA does in each of
> them.

Oh well, I tried..

--JD/Lr18SyWRnWAQ8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamJB3QAKCRB4tDGHoIJi
0sOdAQDvIK6d5+JUBJmuaIHp0wLQIMs5tg3BMmXHB4gMqZuhogD/RdA9d7FPksN4
OVc4od1eNjQJiFGk03OrPkosIcZFGQI=
=gzQu
-----END PGP SIGNATURE-----

--JD/Lr18SyWRnWAQ8--
