Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F44030AAB8;
	Tue, 28 Jul 2026 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252887; cv=none; b=mwKmIyaakp3ERorkkQ0IA+M5m0Wso2XbQX5gkqEHnz/kFYfU6oW1qtI8PVLVWay0tCcDMHrUgd6cmNnA95a6KG3QnT0NNdDJC96uhpTxHoV798Iot/Li1F2e3HLE9Flphx+ZVJGdT5fyDXlgBZaVz8aNCGpW5lPzNLXV7cGM2hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252887; c=relaxed/simple;
	bh=j81u/hQQo6ANafFDLONrqlIdb0978uF9MpOeJKSzhmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJGQjc5TlL8Qu81re3nZRo7WDFfulxg4sSY50Ws4ggI8uWaIHzQ1alPbZlYJP4pabFZmJtHpzsuCKcqu225OuXrlZOwrISqWhkzGocwPrJiB6+C46/Bzf0jFp28oII/chcil0gjv5qWE5Q1NuICPOsmF/GrcpeZD/Yg09lYlbTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDygX1Vx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDygX1Vx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51DF1F000E9;
	Tue, 28 Jul 2026 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785252885;
	bh=M4QyIJcIHjHUvIg8Dvz58XFmWJWYeAXQ8pVG5vYYwtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dDygX1VxZrVdRpzUUbfmeJXdC14jEc6LpMOD08yHapurRZgG/oPuR030eqS7nt+U5
	 WsnJBnN22toZw5BcPfwvkiGkwBPGpgqH/rsVRFF6Hnzrqby7S/7s9L7HGvwVVg9max
	 X1mOliStE5p+ff+Wdc4m5UN5kHepok3ZsAdgOVEPJKPMXbGVZAzJDl3Co9wi5BqFxu
	 lC4AcWa5ZIaR+OOixfOdoeq+agieRuDcw1BCjuWYQQ3ysSPNaxh94YqMMW10uLbmz9
	 HGwxxdqwRja9R4sWc0klVlIbTcNMSDdDHSNhvaegL1NOZm8DNJBqP8n1C9jmj4Wwtl
	 a8SkjfyiQOVyw==
Date: Tue, 28 Jul 2026 16:34:40 +0100
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
Message-ID: <20260728-pointy-habitual-b46592dec7ba@spud>
References: <amEvJBOE3Ja014Ap@bombadil>
 <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
 <amHznORUaOnUFyS4@bombadil>
 <20260723154541.GA764516@killaraus.ideasonboard.com>
 <20260723-hamster-juniper-5697cacade96@spud>
 <20260723161048.GC767247@killaraus.ideasonboard.com>
 <amJiqHd6I45w_e0-@bombadil>
 <20260724092812.GD712773@killaraus.ideasonboard.com>
 <amhUDOnhoj4tk4vN@bombadil>
 <20260728092856.GB1494774@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DvHlGod0MHqfPKhz"
Content-Disposition: inline
In-Reply-To: <20260728092856.GB1494774@killaraus.ideasonboard.com>

--DvHlGod0MHqfPKhz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 12:28:56PM +0300, Laurent Pinchart wrote:
> On Tue, Jul 28, 2026 at 09:13:09AM +0200, Richard Leitner wrote:
> > On Fri, Jul 24, 2026 at 12:28:12PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jul 23, 2026 at 08:55:18PM +0200, Richard Leitner wrote:
> > > > On Thu, Jul 23, 2026 at 07:10:48PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Jul 23, 2026 at 05:02:42PM +0100, Conor Dooley wrote:
> > > > > > On Thu, Jul 23, 2026 at 06:45:41PM +0300, Laurent Pinchart wrot=
e:
> > > > > > > On Thu, Jul 23, 2026 at 01:01:11PM +0200, Richard Leitner wro=
te:
> > > > > > > > On Wed, Jul 22, 2026 at 11:03:09PM +0100, Mark Brown wrote:
> > > > > > > > > On Wed, Jul 22, 2026 at 11:58:46PM +0200, Richard Leitner=
 wrote:
> > > > > > > > >=20
> > > > > > > > > > @Mark: I understood that if the fpga really intercepts =
the I2C bus, it
> > > > > > > > > > should be modelled accordingly in device tree. But what=
 would be the
> > > > > > > > > > preferred implementation if both devices sit on the sam=
e I2C bus, but
> > > > > > > > > > one is messing up some register reads on purpose?
> > > > > > > > >=20
> > > > > > > > > I think we would need to have a coherent understanding an=
d description
> > > > > > > > > of the actual issue to know how to describe it.
> > > > > > > >=20
> > > > > > > > Understood. I will try to figure out how the hardware is re=
ally wired
> > > > > > > > and come back to you.
> > > > > > >=20
> > > > > > > Based on the information I have received so far, the FPGA is =
interposed
> > > > > > > between the host and sensor. It could therefore be modelled i=
n DT as
> > > > > > > child of the I2C bus and a parent of the sensor.
> > > > > > >=20
> > > > > > > New version of some of the Vision Components modules have fix=
ed the
> > > > > > > multi-read bug, so we will still need a property in the FPGA =
DT node to
> > > > > > > indicate if the quirk should be activated.
> > > > > >=20
> > > > > > Or come up with a compatible for the FPGA DT node that uniquely
> > > > > > identifies the revision of the RTL in use.
> > > > > > That's my preference for things that use some custom RTL that a=
ren't
> > > > > > configuration parameters.
> > > > >=20
> > > > > I'm afraid we won't be able to get that information. We have limi=
ted
> > > > > visibility on the ecosystem of modules and what the FPGA does in =
each of
> > > > > them.
> > > >=20
> > > > Thanks for the clarification. Should I continue working on this top=
ic
> > > > (i.e. modelling the FPGA as I2C controller with the sensor as a
> > > > "subdevice")? Or do you want to take over Laurent? Do you have any =
other
> > > > downstream work on the vc-mipi stuff, except the patches in your gi=
tlab
> > > > repo?
> > >=20
> > > I'm afraid I won't have time for the time being, as I will soon start=
 my
> > > summer holidays. The patches in the git tree you mentioned are all I
> > > have.
> >=20
> > Ok. Thanks. Then I will give it a try.
> >=20
> > I did some more research on that module and it features a Lattice FPGA
> > (LCMXO3LF-1300E) which to all of my measurement intercepts the I2C bus
> > as expected.
> >=20
> > As it additionally manages the regulators my approach would be to
> > implement a Multi-Function Devices (MFD) driver for it.
> >=20
> > The resulting DTS layout would then be something like:
> >=20
> > &i2c1 {
> > 	fpga@10 {
> > 		compatible =3D "visioncomponents,vc-mipi-controller";
> > 		reg =3D <0x10>;
> >=20
> > 		i2c-mux {
> > 			compatible =3D "visioncomponents,vc-mipi-i2c-mux";
> >=20
> > 			i2c@0 {
> > 				reg =3D <0>;
> >=20
> > 				ov9282: camera-sensor@60 {
> > 					compatible =3D "ovti,ov9282";
> > 					reg =3D <0x60>;
> > 					...
> > 				};
> > 			};
> > 		};
> >=20
> > 		vc_mipi_reg: regulator {
> > 			compatible =3D "visioncomponents,vc-mipi-regulator";
> > 		};
> > 	};
> > };
> >=20
> > Mark, Laurent, if that's incorrect or otherwise not acceptable,
> > please reach out. Thanks a lot!
>=20
> You could also simplify it to
>=20
> &i2c1 {
> 	fpga@10 {
> 		compatible =3D "visioncomponents,vc-mipi-controller";
> 		reg =3D <0x10>;
>=20
> 		i2c@0 {
> 			reg =3D <0>;
>=20
> 			ov9282: camera-sensor@60 {
> 				compatible =3D "ovti,ov9282";
> 				reg =3D <0x60>;
> 				...
> 			};
> 		};
> 	};
> };
>=20
> and use a single driver that registers an I2C mux (and instantiate I2C
> child devices) as well as a regulator, without using the MFD framework.
> That could reduce the runtime complexity, which would be nice. If you
> prefer using the MFD framework with more complex bindings I'm not
> opposed to it though.

I prefer this version, however I think it becomes problematic because
there are different types of child nodes, Richard mentioned regulators
plural and even a single regulator I think should have a dedicated node.


>=20
> > > > I've additionally wrote "my Vision Components contact" an email ask=
ing
> > > > for clarification of the I2C bus layout on the modules yesterday. I=
f I
> > > > get any new information from that path I will of course take it int=
o account.
> > > >=20
> > > > Thanks a lot, Laurent!
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--DvHlGod0MHqfPKhz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamjMDAAKCRB4tDGHoIJi
0og7AQD0oXvgnBKpQbWoVMlVtwgV7DMGcVjs/tva27Zn09J+7QEA915Vc8IqxrjK
0atKgRnmdqMfQaAgz+hq/twdCxKsYA8=
=cKYs
-----END PGP SIGNATURE-----

--DvHlGod0MHqfPKhz--
