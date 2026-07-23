Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD0364933;
	Thu, 23 Jul 2026 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822590; cv=none; b=ikFnyClMwW7oz6ZA1LAwlaNsndb0bmuGeFw5SAOONgkjfXI+HaY+mYc+oSRPmAeW7xhl93bKZF1CbEgIw+LaR6jHmGmfk6JYlPMhP1zt+hu8g1pHsVFfBCM7N7BBeSEo+x8Ca6V2q+21ZbcyZlmcwt14FbksPmKwC4vEz72ks7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822590; c=relaxed/simple;
	bh=VX40IOg2m9R6OtmuKe98ovEWZ8IBRZC5MbBvpVgZasI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLDlrfGDG8yly82btnRe0YSaKgmh4l5qGhsbCV6suvBE+h4KENFbcw//MmFM04yrB2rUhVXu41XNDBvvarEuyHuUEo52bP9XDm0hx/ixs+Z2Xs4mSP5zQ9+GJBpnNmxxqcJQGB0K1pkrffnoIOqRkqIw9SyZyiRqTd9Rm8iq2+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dz7A4txv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dz7A4txv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9741D1F000E9;
	Thu, 23 Jul 2026 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822585;
	bh=VX40IOg2m9R6OtmuKe98ovEWZ8IBRZC5MbBvpVgZasI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dz7A4txvtz95r11j8oExGjEEvtX+SCb6dus1NYolYEItFL4Cb9Rbz2koL5LnbSnaA
	 UqTCaqhVbmKCG1h3EMPXMx59EISHhQ0QnIUvF/eD+UBjNsP7gcOcg7txVxay7H0Bof
	 F1Ko+/RVAevfyLO7r5sgSjU9YW7g7+eAaQYxqb6SUflYq3Z7/7PC416MqFsJctUhak
	 jBu90oCh2LF0toC+wwVJ7cjNgXZAZL/E/BB6sHJgWtSvWl0F6pJX364sxDQp3Lk0qv
	 P8j5xcjN8wfR/0XGxveqC3P/8FkETtjJU91nnZAELkcjan//A3IPkUCAA+cfgzPmGt
	 ecrJcgd746oiw==
Date: Thu, 23 Jul 2026 17:02:42 +0100
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
Message-ID: <20260723-hamster-juniper-5697cacade96@spud>
References: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
 <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
 <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
 <amD_vkMOrtKq5NvX@bombadil>
 <20260722201622.GD648629@killaraus.ideasonboard.com>
 <amEvJBOE3Ja014Ap@bombadil>
 <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
 <amHznORUaOnUFyS4@bombadil>
 <20260723154541.GA764516@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XY5rrJ73sw2k5tIT"
Content-Disposition: inline
In-Reply-To: <20260723154541.GA764516@killaraus.ideasonboard.com>

--XY5rrJ73sw2k5tIT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 06:45:41PM +0300, Laurent Pinchart wrote:
> On Thu, Jul 23, 2026 at 01:01:11PM +0200, Richard Leitner wrote:
> > On Wed, Jul 22, 2026 at 11:03:09PM +0100, Mark Brown wrote:
> > > On Wed, Jul 22, 2026 at 11:58:46PM +0200, Richard Leitner wrote:
> > >=20
> > > > @Mark: I understood that if the fpga really intercepts the I2C bus,=
 it
> > > > should be modelled accordingly in device tree. But what would be the
> > > > preferred implementation if both devices sit on the same I2C bus, b=
ut
> > > > one is messing up some register reads on purpose?
> > >=20
> > > I think we would need to have a coherent understanding and description
> > > of the actual issue to know how to describe it.
> >=20
> > Understood. I will try to figure out how the hardware is really wired
> > and come back to you.
>=20
> Based on the information I have received so far, the FPGA is interposed
> between the host and sensor. It could therefore be modelled in DT as
> child of the I2C bus and a parent of the sensor.
>=20
> New version of some of the Vision Components modules have fixed the
> multi-read bug, so we will still need a property in the FPGA DT node to
> indicate if the quirk should be activated.

Or come up with a compatible for the FPGA DT node that uniquely
identifies the revision of the RTL in use.
That's my preference for things that use some custom RTL that aren't
configuration parameters.

>=20
> > > Please do not add random characters to my name.
> >=20
> > Sorry, I didn=E2=80=99t mean any harm.
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--XY5rrJ73sw2k5tIT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamI7IQAKCRB4tDGHoIJi
0pDjAQCCkxMHtYm0qaav7zMioSvLLMQb9aX8A5aBIFfQ0YnkJwEA96ezgJWQxhQ9
dHDDsCd7WMlhBZHxaOkLxA4g0TN34w0=
=cFk7
-----END PGP SIGNATURE-----

--XY5rrJ73sw2k5tIT--
