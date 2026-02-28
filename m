Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DEC292B2E;
	Sat, 28 Feb 2026 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284152; cv=none; b=PmlDkGf2lkWsOn1cEaae2RBAfnn0STPiYsV9mPWXKrAvIkkliJTrUpeneBsIlTnYP+LBThz+w7xbI6T3cbUo12UCeqmVOwnYrRW4iXpfhvTxerSPVMjxMbz6MFCUxssyFfS7yEO13ijAa8roHQpZwSUBNkncpt6JdAPljPyKeng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284152; c=relaxed/simple;
	bh=qpHkATkPIw0k7n6MVly5jh+hbgsca2+Oeg4nKZl+2DA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mebfQnZamutMhON6jjOGX7wx6C6iMX1UUKYnEdonc0XT7FexnLY5uFc9OKQksUawhljXuX3VeF9A1jce6CUo7JgBVYgNO56mm7PCPOcsBhRc/6jpURJSSKLNGEmJMZOU4U9OGJ+l13iiiD9SjiYoi0m8gSnerAkMkd3R1AZD68U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJD9+MAw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJD9+MAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EEEC116D0;
	Sat, 28 Feb 2026 13:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772284151;
	bh=qpHkATkPIw0k7n6MVly5jh+hbgsca2+Oeg4nKZl+2DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJD9+MAwMgTmZqHCmCXa0YVtC8wYO63o4bXQ72HVsQKToeeCPAOcDG3Mkj1GI0Ld8
	 5zC/womRxg2e6ATxFyxhuOaLQ1YSo7cNbPtrsbvdF6jgjbwsAh8/jBCqEXzm8WpCkq
	 Q7vwvCLFo2WpFsSJZcmK8KP0/Btdi3ibUC8CUWUx2RpUvOAMj/6LHCCzl8lEcJHhdG
	 /Tm011hkgpqFiKaAxm4U8BgJu6aTbQfZAqQRGp6nImB+d8+UNw/dN8GjqkvZ3bloKb
	 +cLw8oycsQWqXg7rVicMuT6gu02FXSa3RP4Et6gEjM1xAxo0MaXvOvpDFayQDWiqgu
	 yvbjxbtrq8Hjw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4D57B1AC58E4; Sat, 28 Feb 2026 13:09:09 +0000 (GMT)
Date: Sat, 28 Feb 2026 13:09:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] regcache: Move HW readback after cache
 initialisation
Message-ID: <aaLo9QdbtR7u6y3c@sirena.co.uk>
References: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
 <20260226135918.381979-2-andriy.shevchenko@linux.intel.com>
 <0c5bdf5a-459b-4ef8-95cb-3d1c0ad867bb@sirena.org.uk>
 <aaEvH2dk9yTwaUc8@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vQ+6NTyZrBeCOEy4"
Content-Disposition: inline
In-Reply-To: <aaEvH2dk9yTwaUc8@smile.fi.intel.com>
X-Cookie: Think big.  Pollute the Mississippi.


--vQ+6NTyZrBeCOEy4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2026 at 07:43:59AM +0200, Andy Shevchenko wrote:

> Is it possible to allocate something, then count, then reallocate
> in the existing caches and in the potential future ones?

> I think it's the patter that we first count the size of the allocation,
> do the allocation, and only then fill up the allocated area with data.

> Otherwise we came back to the chicken-egg issue this patch tries to solve.

The main worry there would be transiently consuming huge amounts of
memory if there's a very sparse regsiter map, though we'd also be
burning lots of CPU time checking all those registers so perhaps it's
not a real concern, and the whole thing is kind of an edge case anyway.
Though now I look again we are careful to bypass the cache during the
hw_init() so we should be safe anyway I think.

--vQ+6NTyZrBeCOEy4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmi6PQACgkQJNaLcl1U
h9C12Qf/WDbAEjrc4dw0+otW4dkFpl3w/FGYm+TzFnbzzd/kM6PVqjxZA2DRpORo
vg5IeuL4ARoX80NiDAKsIajir3ExBXpKTlls1nH3vtAkNHBU8esTsCRHQr1Q82e0
25AJIqH8/nBIvoLBKT7K/ZkKj5sctIIoZgK+XsmfuxY9GSmlMYrKAIXw5zMGr1td
2c16mYwv/zjriXn0/yyfQ8WMTpi0UnkA1wDJydfDbNrxd97GNPaYOK5Nwh3Z7577
Yu98vb2IB1BsZGl7C7Ev6w0AkZzU1xWm3ymfvBEXr6qRubPMgRkYvPHAZTORZU3v
azThYF6U314POsLCCeaD+0Snh8ebew==
=rgXQ
-----END PGP SIGNATURE-----

--vQ+6NTyZrBeCOEy4--
