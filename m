Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01322353A7C;
	Mon, 13 Jul 2026 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955169; cv=none; b=oHWwDbnzoKp+WZYLA42KLTk/4FblkOkekAlcYTst5Lewu4fvYZxI2C2Z6m57fYRXLAgTWY/RxbNp+aJ2cyw+P6nZmYp8UbrxJ6W+WNgoYHUZc60bL6BdCKqbgqGW3ooPY0ewhSMukmV+bxgUGdyfDDd/AUTv1A5tKx16QNYD+/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955169; c=relaxed/simple;
	bh=rz0q4rAHjUOiSZMkusykelwfi/oTPMiEDGC+lMRwSCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nto1HG7bFrFE6poBIMTz8XMyEGMgV0J5DYpf1LPIGcgad9A5aDx3FNIrwiA9hEoYZByPSaA3Ywbe+O/acZvDou+WBskjPVV50oYKFpZsE/mhF507A2tec0zbClq7+KaqqSNepkVzl7A+/6ExmVFU9pLSytrdIlu9R0SSnXgECXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hv8Q+Ad/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hv8Q+Ad/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952A31F000E9;
	Mon, 13 Jul 2026 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783955167;
	bh=rz0q4rAHjUOiSZMkusykelwfi/oTPMiEDGC+lMRwSCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hv8Q+Ad/FXdtifGwoN+tuJ9byq1BbY1OgUX4XXJpen5D7EwCRNzr9fDRzrAAdzFsb
	 52Pcputd9zQWdSy/ZrccTcI7VLeYpcHmXVve2meavqOedWBSJGAz7hxM7OghS4pQPY
	 WQeKd6i0w+1Dk9QJYrvjIHjkzXPstmgjjx3oQJHHKsFJ3nTWKxYMZKWKPFYew0htkC
	 gEtrHYVzcBQfTPdDEH/DRndQE58Ni8CMtSRmu7F8qJ1O8/YBRR7DGkeNTbq00ffP/h
	 jgQKyd52IbnMSUhZnYadPom6IApxRjQYJhf9xHkbBHIe/wEX5PAW0SFXqbNVAr5LJ7
	 1F8Dr7FTZIONQ==
Date: Mon, 13 Jul 2026 16:06:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] regcache: disable cache_only before rewriting paging
 registers
Message-ID: <41e52d6d-8f91-4685-b659-94d3844fa959@sirena.org.uk>
References: <20260713073059.47914-1-phucduc.bui@gmail.com>
 <24ce60c7-5539-4fba-8bf3-3a10875c3b75@sirena.org.uk>
 <CAABR9nHfThjz99fVyoAZcSdOh09-n0_WfM2OWL4zkSZG5Pm7Dg@mail.gmail.com>
 <687d81be-566c-481a-9ece-08526c33ff91@sirena.org.uk>
 <CAABR9nHWV_qMWaYOeWroU6cPH3n3pDjbafHmXMeMVfiqC562Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HLJZHp0zVo2J1kwa"
Content-Disposition: inline
In-Reply-To: <CAABR9nHWV_qMWaYOeWroU6cPH3n3pDjbafHmXMeMVfiqC562Aw@mail.gmail.com>
X-Cookie: Courage is grace under pressure.


--HLJZHp0zVo2J1kwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2026 at 09:59:46PM +0700, Bui Duc Phuc wrote:

> However, after reviewing the existing users of regcache_sync(), I found
> that there are several drivers that call regcache_sync() without first calling
> regcache_cache_only(map, false). That made me think such a change
> could break existing users, so I decided not to pursue that approach.

> If the intended usage is indeed that regcache_cache_only(map, false) should
> always be set before regcache_sync() is ever used, then I'm happy to revisit
> this approach and also prepare follow-up patches for the drivers that don't
> currently follow that pattern.

You might not bother setting cache only in the suspend/resume path if
you know nothing else from the driver will touch the device until resume
is completed, something else might block anything that would try to
write.

--HLJZHp0zVo2J1kwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU/tsACgkQJNaLcl1U
h9ClfQf9E8/xKTgve7nrJ7BF+WSVR7G5D9d6UIq5FTbYgNxO39gEBs80gu2rCyjr
42Kga5FaJFn16z+YcnkKD3vCSratbbj7OPG8P/JYWPlWWec1Pa7Brrs6J8WBpuyh
HpLjtHfyPOFAPK7tGF/CsihovHs/on8Cz+y8rhPNeULnLNLX4KmqU6gxQ20dlnF2
es25PYYQrOWA2FRXB8mgXBa3a8Gm6EqdEK8e7bG8V9cQtkhL3C7XuX+ot7angXJT
gYth5W6ygEqkRk9ZTr4bCZgwLSf1V/CGT2T405RzPbhhD9Op5EM2fkrSxw4eRu2e
gmWE+3UNWh4B5bC4BvuKeXmJGAyugw==
=zMsL
-----END PGP SIGNATURE-----

--HLJZHp0zVo2J1kwa--
