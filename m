Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1E73C1984;
	Thu, 26 Feb 2026 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114257; cv=none; b=SRq8+LR98FXesKU4+1qiuGCIIpXbfPCuBlQcE8gkqmBmyICmQWxA+EbKnHbZRUxHfJkE6HPHoS1mI5Rzlus/XZX11kUTtGfOKdSCr4ob7IesDOyX17QJ6eQapDFAEq5U9iuuDQDbkZR55wspsQwNLDtf+hj1r+wIWes139948HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114257; c=relaxed/simple;
	bh=LFYLm2faG5FI4FilKADjQvY+oQBfoF97VwGk6/+LcMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvJ5zp150ImnTc3HqxYWVC1kYrom8OO4uZzrU+vTiY3zoMKTPP57+2NTqyKa/DkbbTtg1CDZYQsIAJbPKx9mlbd/RgYCKWnYk6hoMYdyaqhFpoLBlKUwB4rKQ+OSm4pJ2ELW1jGc05lE49sXpFPl9zsvGpFrKax0d07+DiLOFes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddIpLSiU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddIpLSiU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61CCC116C6;
	Thu, 26 Feb 2026 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772114257;
	bh=LFYLm2faG5FI4FilKADjQvY+oQBfoF97VwGk6/+LcMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddIpLSiUxqwzQSpsemCStZj2ha5mkkSny7MqMH2GfULbNzq5Gs0Q1aanSrYfoQIa9
	 KarjA4+K4RIYaf4dqgz1g0cBoQOpfnkwwGEVtlkrPy6EG9/xECwUh6c2eHAH1uTNb3
	 gqxxlhLgeAwYrXBWhyRYYrrxIdiqsmnvj4ZKHn1QcuyhqVsWHbMMFmuJX5KfeXqkb6
	 MnVJioh3+nRwvwMcCsk4cgD87g49D5dku134+u1V9MNUGx/C56nTpWYlMmH6didmJF
	 bb85tdMu0rbUdADAJDqeEt6oAI6P5ygv+VqeSwJeRc6d/KxGaQPu4vjsOaH/SKTuIN
	 QwxTdg3X9ku6g==
Date: Thu, 26 Feb 2026 13:57:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 3/5] regcache: Move HW readback after cache
 initialisation
Message-ID: <36abd1f8-aa9b-4f73-9512-0170907df158@sirena.org.uk>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
 <20260225161659.3811671-4-andriy.shevchenko@linux.intel.com>
 <ea6308f8-2a70-4b46-8052-b98d6f5ca5c9@sirena.org.uk>
 <aaBKPIsYHnvRSGL0@smile.fi.intel.com>
 <aaBNkthHVhR1OL_Q@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YYZoD2Se0c1il8N1"
Content-Disposition: inline
In-Reply-To: <aaBNkthHVhR1OL_Q@smile.fi.intel.com>
X-Cookie: Honk if you love peace and quiet.


--YYZoD2Se0c1il8N1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 26, 2026 at 03:41:38PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 26, 2026 at 03:27:28PM +0200, Andy Shevchenko wrote:

> > I also run kunit test cases and it seems like half-failing. I'm about to check
> > deeper what's the cause. (Obviously it works in my case on real HW, but...)

Yeah, it worked for me on a bunch of other hardware.

> At least one small amendment fixed all kunit failures for me. I will send a new
> version soon with also fixed patch 5.

Great.

--YYZoD2Se0c1il8N1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmgUUwACgkQJNaLcl1U
h9BLmgf+OZBB1RBXqG1poQiO659PHONeLLYdqhx+gbX4twFEhNjy36bM5UdJH8Lw
yyxaPaVxolLr2zxUJLhR472jyM/ULvWYKfHKpn6BqNA/5797+oxylH4Kyr0eldCO
VG0XhBtE4+1Y0wS+xGSibIpor/OIF077x9K/GyF+J0L+gwakHeEyeR5Nn2m+jqdB
p0/h9TlmDiSD9VCCfaVoxpBK3i0H+Sn8mbxxtD4ieJuxFljxZE+vrr0R8IIBBOQt
AQzsSxtT5B3kNvMK9EXcSrC7MhGA8FUDjrsiOg2IkqFHtlttxu3/L97eh64OjGA9
87VLJDDVoamTtOTQTReI9jMLd+y7UQ==
=mMxn
-----END PGP SIGNATURE-----

--YYZoD2Se0c1il8N1--
