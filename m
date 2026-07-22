Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124D442B35;
	Wed, 22 Jul 2026 22:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757796; cv=none; b=TQsjXvqf4ZSKXoqpHxGc7L3pimUSKeArGTDrGwLoUmGAsIr9Wim+qQRW13ZTx7/YWw04kDb5nlVBV71Kx6acVZgQGNuTQs/E5/+IjTKJLx9vTBan46Va+jg09/W/5RNoBd1rjlEpzgRen53rCN8eLm4988qGZ6uXaGzlZ5D3l6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757796; c=relaxed/simple;
	bh=gBixSaMBnaL1CABNhnDdqEOlFsDNyAJG4Ci/wGAeAw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmlEHHuvLv9hIhDcf4Ch8ms1D2xkT4dGEvlBJmnd5qeVnQzWhHecWsLIOS/YXmLVKgxPhYWot1uVG9dZGBGNkCuEKrPfxP8zrFZ9mQ3GTow7j6WI9VdQ8kuHRID/jxgWnwp0fkpypHU8qSX2r9q2i5mpdE2C4b2Z4L+mLp2NUrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZceZ6Dpf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZceZ6Dpf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5A11F000E9;
	Wed, 22 Jul 2026 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784757794;
	bh=gBixSaMBnaL1CABNhnDdqEOlFsDNyAJG4Ci/wGAeAw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZceZ6DpftM8rE70/IUQt+5H6w7QVkxOmcG3U0e7RQQNI/qWMfOTfCB5L2zGPfPySm
	 qtBMYyzVOREgWgzVTFTXIqHa5z7QQfHOvOZdBKDV0IWIdGTmbNJO/igWBOaEVjhpWl
	 fgMon25BYyE3RqSeB1C1oDNryeu6ezUXS3mUOziUgLus3hGEDkD2QUxTC+6xO1ivT5
	 0CIgEgz7zfCPgWVWH3wftIoVfynJ5pt/06j7JnIX3tJcoy25DLVC3406XOy9QzdVk0
	 sqEBfQEVLAJXDUTYo++Xx/WRjjTYRoj7dnSkwJRmiFsDKuQNdrBzlYzE0XKrzya5dM
	 olo0ZvfwicYIw==
Date: Wed, 22 Jul 2026 23:03:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
References: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
 <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
 <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
 <amD_vkMOrtKq5NvX@bombadil>
 <20260722201622.GD648629@killaraus.ideasonboard.com>
 <amEvJBOE3Ja014Ap@bombadil>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WaKKYvpZpGJ7Styh"
Content-Disposition: inline
In-Reply-To: <amEvJBOE3Ja014Ap@bombadil>
X-Cookie: Life is like an analogy.


--WaKKYvpZpGJ7Styh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2026 at 11:58:46PM +0200, Richard Leitner wrote:

> @Mark: I understood that if the fpga really intercepts the I2C bus, it
> should be modelled accordingly in device tree. But what would be the
> preferred implementation if both devices sit on the same I2C bus, but
> one is messing up some register reads on purpose?

I think we would need to have a coherent understanding and description
of the actual issue to know how to describe it.

Please do not add random characters to my name.

--WaKKYvpZpGJ7Styh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmphPhwACgkQJNaLcl1U
h9DOMQf+PANsFc6iFFuYlZAP8uDnSytRsEwyZ3ssVtq1UFqJl7tQVSn/zDy4SBIR
HhB7C2aTN5h8nxDT0vm9LwVL2idQgdDLuPRg+ewHhbBwr+PfyEoftAuCVm8C7ffq
8W9GxCxKDq163HnSQDVMc9MxJpnsnBtN4fFJADOp51mSELccOKPFrD/0196QC4pN
t3pIk/bfrluV7Man46q91M9oaIFIDBUp9IZFQRHkfmcB5C9yMnye+u8RoApW9Q1R
js4V0OhRqVLqTq7cTL6CsO42bvxpz8opp5jZfXGmvFoOeCU28H7I6Ra4NXsG6bU8
sMF8DXRIrbxDQGuorF1zLKE7eNdHGA==
=d4Yn
-----END PGP SIGNATURE-----

--WaKKYvpZpGJ7Styh--
