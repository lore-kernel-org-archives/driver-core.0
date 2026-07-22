Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E795438033;
	Wed, 22 Jul 2026 20:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751655; cv=none; b=jBgh2+eTGZBoo/AVVTlQ3xCHcB+nXHTLMsJ0GSQJW6rqMxMUKnhUQKmB0MKiqXHU7AJntnviosqchh1fKgKt7O8BaxVOklVCs1an1ESIUmRTwanTMxrfa3qYHLdd44m3zCt+Sei2jfnwRfy9ZBWanX4yzVAAU/Z6Dz9vTapj4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751655; c=relaxed/simple;
	bh=cmdSt0UgHGiSCejIDXrrv6LekC2QAQ26Sc19rLyrcHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amp87dlgT2V+5Wnd4mcWq2IWrvWhM85URE6jYKXzngrfDgRWyDyiLbzXiZh9NQdLmvaPmr5jaBY4K+2nto3kzOzm0dQ6J2aJg/4T3rlvPKuoWx/ebNbBDiHgxCDm9D4duV9V6L1Rby+S/m4fl9vQ7zxE8id4u1NlzNGG944Vk7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNEaUDxk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNEaUDxk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9B21F000E9;
	Wed, 22 Jul 2026 20:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784751653;
	bh=rmuCcga3wVOFlVzrN1PwoyRaWiNJtVw+Y71Pi8w2b3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XNEaUDxk8Pg2xK3z1epFliwXMC/c2f/lFG+8gH/Y+xR7JMWOyIMEcwodW8KDBAsQ6
	 /UuyPJ4gndST1ZEzNa8WyKkh5s5HZwv8RFuanUzj074oeZT6o/HhhINZNLvEKJZwat
	 rorlYbGc/LQgRS5zFPRhbkaiXeDuryXNqvOrXNFZsMNRVzggMib/FR4vMYm5f1zReI
	 3pDHD/z2JLZNvz216b3a/9PBsZlOWo47ZPDWp+24LyVaFXv6h9f2WLu8CrDaKIuVpj
	 TlSpg61RktHB+wyRopgXG+EulTv9DzpgaSdZyXYYe35n51uqqxM+/vDXugH4vW//9c
	 THdIhO35kvNvA==
Date: Wed, 22 Jul 2026 21:20:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] dt-bindings: regmap: add common schema for
 no-sequential-read
Message-ID: <e3686340-6fbf-46e6-b505-e06615fa8473@sirena.org.uk>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mh5b4uZTj31td+ez"
Content-Disposition: inline
In-Reply-To: <amD_vkMOrtKq5NvX@bombadil>
X-Cookie: Life is like an analogy.


--Mh5b4uZTj31td+ez
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2026 at 08:24:37PM +0200, Richard Leitner wrote:
> On Wed, Jul 22, 2026 at 02:59:12PM +0100, Mark Brown wrote:

> > No, this should not be a DT property.  We should discover this through
> > the bus, just like we do currently for the various I2C quirks that are
> > advertied by the I2C subsystem.

> What do you mean "discover this through the bus"? As mentioned in the
> commit message there is no possibility to detect that within the affected
> I2C device drivers.

> Or do you mean that it should be "discovered" by modelling the MCU which
> "proxies" the I2C traffic between the host and the sensor/device as some
> kind of "parent" device of the sensor?

If there is hardware there that rewrites the traffic then obviously that
hardware should be described in the device tree, yes.  It sounds like
this is the actual I2C controller and is what is imposing the limits.

--Mh5b4uZTj31td+ez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmphJh8ACgkQJNaLcl1U
h9Dm4ggAgzYGvFUefPOscQKOpayCq8y1hleZ4h7Xy0rHOcB4AbofIdLkHiHJ+A3N
mMF5xf7pzcrDOspMEtqxPU36WdZDLuWeO89dnYrxzPf7VPy8cDKDsraJt9aXuc+I
acl+rClEGdn74IAGqVm5U/efcDNypsVrPjBw5/j2v8BkUBMs7DCiasZyYXZO5jvk
/DsrDAjAaV5QMnmGGQImGR3j6GvwF5Z9kKFviRI24JzLtwDlVtdiAgBcbOaGVKcQ
bZVMMEIUGsXJdI31Y1R2U8aX1mGB7eLiyRQIDuqittgJCeQY2tdrJyI5DaD1gNsp
NblMSLFQ8y0XUIExOgreC5kknsolLw==
=4hgc
-----END PGP SIGNATURE-----

--Mh5b4uZTj31td+ez--
