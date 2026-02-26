Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2D123C368;
	Thu, 26 Feb 2026 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772108449; cv=none; b=sf6JNyo7ygTY44mEFOtLJjrHHohnu/sLkhX4YJWlqh2U/GYtTtR17V/rNswO3iIKTEq1k0qmy+RlBV8qe08jYTJZb/TUsquHd22a02SefEQ9K4WK6RSv0AvjgxXSwdQCxy+kGWFoCf3aL+7nJ2xXVC9I80HXSTAzLqLbx6XVEvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772108449; c=relaxed/simple;
	bh=8uQJiNQVj1CGXNrtBS4cm9ee+OnH9RnvFIxb2YUAMY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xn3/OKBMO4n2J1TZlaBLCQQhiRWnxV+FbPayPzYD5dHBqbHzl5v0hUO9IgBM/BHUBfraNrm/KiVgLk+j2S5j8/QOn9V/Pn0S8GVX3VsSfmFtNH7abzgOUFrulpnJI5xCKs53r5PjiZ4DyiPX4+gbY8iJIMcdaj0nLGW7nAjAOMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bc8zUeey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bc8zUeey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DDAC116C6;
	Thu, 26 Feb 2026 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772108449;
	bh=8uQJiNQVj1CGXNrtBS4cm9ee+OnH9RnvFIxb2YUAMY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bc8zUeeyF3GuNjLUnomakMZ+NG5/YI4OBzRiR9Obl2HC5A3+yZyt6ZtogQ1ASqdMQ
	 SbpjQjCDhuOMMArMOF4b7j5m5bItwSCvCfSFxKwZC8OG9I8FypcW2tQrJsaFVtkq3l
	 bA8rMDk10kOkCzyhgNkaPRwYU3YFJwWTNRHArx1zCBihxTC3ZWFrbnmHq4h3mFRS/o
	 /W/eSNVqEmUz39A3F6kYlwXPnOC/UyBIn24bkNnrOMpQGeBk3k9NVttziqcomNfr22
	 gcGXlWF1BpJ5FXpf8UQFM0j62S28+121Aagtq3Iw7Jp1WY8xLgnjSTtWOGg29jCbEA
	 /xjxbjZrpJmMA==
Date: Thu, 26 Feb 2026 12:20:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 3/5] regcache: Move HW readback after cache
 initialisation
Message-ID: <ea6308f8-2a70-4b46-8052-b98d6f5ca5c9@sirena.org.uk>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
 <20260225161659.3811671-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="457S+ae8RXgt+A52"
Content-Disposition: inline
In-Reply-To: <20260225161659.3811671-4-andriy.shevchenko@linux.intel.com>
X-Cookie: They also surf who only stand on waves.


--457S+ae8RXgt+A52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 05:15:57PM +0100, Andy Shevchenko wrote:
> Make sure that cache is initialised before calling any IO
> using regmap, this makes sure that we won't access NULL or
> invalid pointers in the cache which hasn't been initialised.

Either this (I suspect it's this) or the subsequent patch is introducing
regressions in the ASoC tests on several of my systems in the form:

# ok 1 get_value.AT91SAMG20EK.13
# # AT91SAMG20EK.13 Inpwm8731 1-001b: ASoC error (-5): at soc_component_read_no_lock() on wm8731.1-001b for register: [0x00000004]
ut Mux

  https://lava.sirena.org.uk/scheduler/job/2498613#L1549

It's not absolutely everything but it's multiple systems (several with
Wolfson devices, plus the Pine64 Plus which has an integrated Allwinner
CODEC).  I didn't check beyond seeing the failures yet.

--457S+ae8RXgt+A52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmgOpwACgkQJNaLcl1U
h9CqogfzBPqEToeUG3H0yxWAi3jZvnJcfzOmpgXapBEBhYgZEGFgdjs74U/lhq7z
Ow28g1U1qzEVhJ1PrT2hkQrhb2+LrWkegKxi/bXI6pgb6f0YumeawdWwNPwDt3im
rz52i+jTUBo8bDGYdBfa7AeAdOk5gqUT/ReQHeUpQQBGXcm+ob5FKZgi0A42PjkH
JwvA7RDCru6IqBoEMtCJCQewA9aEpJq4ejV/8ZlH21VWS6CPuFfSwh+aB3O/M/Xn
3xhKj5rVsuhWdWgqu/wjP80U7QjdXAz4XK80TqyKWw/40BBxfemkL6wqHnMlMnre
sYfCL7tK7hRLb7oxY5jx7Vy825MD
=KHPe
-----END PGP SIGNATURE-----

--457S+ae8RXgt+A52--
