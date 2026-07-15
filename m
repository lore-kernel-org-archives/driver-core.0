Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE003644C4;
	Wed, 15 Jul 2026 12:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119179; cv=none; b=aB4vJefIc8z2iTt/FOffHgK1J2WWstARvWfx8RcRi7u6bjMuV3NrCYvlDPzLWBwG7M6BZqCClEEgDdYtMtb9o5thNVzTm10Ckn0uAKRKQHPLGgLTEqRPGNkh9Jg6lJrYLpv36SrN9RibeTr1dsuChugYF1pBy91Ik0R6jMzx+x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119179; c=relaxed/simple;
	bh=T2zHeTM2DbzVWEeUJOQjivs9kNzjGPjKd5XUVKmu1Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bR03q6O4561V2WOfsLkt8xctOplqdmq9LWSrCwArlnfGe8TyjphC0vxPsjktTZOPdL/v92G/m61zmtZliImgC3IzI1m+kLxlZV/iAgoVgikEdlQXm9eCgZlgns64C3PrIYzcysPTnqMz5X6UZXQJyEYvRqODJ51lFD+YE0TzHFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXnpIWgM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXnpIWgM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E520F1F000E9;
	Wed, 15 Jul 2026 12:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784119178;
	bh=PjMY3T9xFa5JIMs80gLa4gv3Eh1yyKsjqrQtXdi6zLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LXnpIWgMbXQYX/e6BV0ukbdXjenMvCgwd6O31hIYZbasxRy5FQiMBpnZNf6YuixqZ
	 kPVDAlB/bfGo+l3Uk3snwMJT3L7jF0tXmsn5J3VNZXS/WBlo7Dt0Gzo/Cyqv9+OwDR
	 jaJX8HeFxy59Nx+lI0s7E9zFIcXwGmyKlPwqvgieLE0FOdyJ3u4xs5MCC1Yy1OpJMX
	 Zt8hlDZxk2JiL4kTRryuvtQxQgbLN+zJAt1q68433iV7bjqWvQo1DIBkqN01IG7CEh
	 WCTsNGrwDiNItvsgy7XO2tzUmn2UdsbSv+8/mLMxW3dC0j3kqx4qIdP8nAO+OD4YxD
	 bgf+YGruaFyWg==
Date: Wed, 15 Jul 2026 13:39:34 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] regcache: Warn if regcache_sync() is called in
 cache_only mode
Message-ID: <4e43250d-85eb-4019-b092-039e10e84ae1@sirena.org.uk>
References: <20260715052100.24983-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5O9mnMEqqXFoyIhO"
Content-Disposition: inline
In-Reply-To: <20260715052100.24983-1-phucduc.bui@gmail.com>
X-Cookie: "Speed is subsittute fo accurancy."


--5O9mnMEqqXFoyIhO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 12:21:00PM +0700, phucduc.bui@gmail.com wrote:

> @@ -411,6 +415,9 @@ int regcache_sync(struct regmap *map)
>  	if (WARN_ON(map->cache_type =3D=3D REGCACHE_NONE))
>  		return -EINVAL;
> =20
> +	if (WARN_ON(map->cache_only))
> +		return -EINVAL;
> +
>  	BUG_ON(!map->cache_ops);
> =20
>  	map->lock(map->lock_arg);

The check needs to be done under lock otherwise some other thread could
come in and put the regmap into cache only mode between the check and
when we take the lock.

We also need a similar check in regcache_sync_region().

--5O9mnMEqqXFoyIhO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXf4UACgkQJNaLcl1U
h9DDJAf/RPTQd68tsIkSpzmZ759t3OHty4lJhNbxnGBVfBtthY62fOZj+7itQQg+
nHOSHqe1bpcPDE++zOxUAevUcVaW6zfbRXvOFWzxuXFFu/WjIXMyuVYho6rDhSFg
cL6UBZfCFNO8doL7J5oOlSWo7A3wq0xf/7jM+udKNTaCrvEULAyGCcW+8noi+Bwf
YtDcC6RnghhKSoNmDezL3lY+I9p7oegCTae2QBY7HE75epJXzAQpmVeFmusyiwwF
sQeoT+zizKaCJLh1MawSLQVZLDi7DofQv/7GH05NJL2BstNDCBFbTEyWWWddaHUe
CSqK40LwpyS/p3ZN5VMcByWAdL8kKg==
=ntNO
-----END PGP SIGNATURE-----

--5O9mnMEqqXFoyIhO--
