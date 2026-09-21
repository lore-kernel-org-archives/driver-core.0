Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BD233E347;
	Mon, 21 Sep 2026 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982374; cv=none; b=gnsxemvv1RTNvsibQ1MgdA5hWcHIIvCE5FPBOUSgXBBBL995miEwTPEfPwHII6R3O7xKox8AlB3hNRdartriHHVw93EtjvdW1fSdgsUHduXbiByeJeizHG59O831CHc30QsIIeu7N0RtUrlRLrVDq9pXbqvclZVZW+8hvOJSEXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982374; c=relaxed/simple;
	bh=BAxtUZVQ1BEYK1Q+cUz5K5rGE5XaRoSXjcP5B8FiVhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6Kfj0lIKnybAAVN51keI/4Pb4BbXShJVTXpxGF1hMkIeBtpCBdsZFGktKebnx3s6ZwUjTbd9ASdvIt/lpV+C5O2p7EEX5hi/BUj4DvRucJxJIMjieS/Uikl6JVUClUoRhDsDtmYxvwP126kVFBeRTYV5FFTzbohZXrCByPmpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6jqQI6c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6jqQI6c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D441F00893;
	Mon, 21 Sep 2026 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982373;
	bh=0UAv8K4XD4cycLfQCkBui2xNduC/+GZFY8oysMlPaiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n6jqQI6coi+v507hq9aEUwfNtE3GwdYgdrln2+SuviKlaqvcdJeD1wAdxiRpJ7yP7
	 ih4vRUD/NEPlRRB1z9RwhZjjeulJNbTvO7XpqtPaYOUl+T/0UKaCfj9KRk781y2bhE
	 3kmb2VR3FRrl4EBGx0m5FMyozYeqLQmWvLQD/MWznELJEfS7xMyEFvBvhuRbc59lji
	 uFHFV4UQsG9yhrsKMcJ+UWQU1sfgdv0R9RgArGrrM2hK8uWaiEW5mg3+yx1svPRWgs
	 3YF2h+ft6HiBay6TZvn2wyRL+g5ngLleWLIxomg8eMNPnXkMEBnxtzr/s/8sCh60Ga
	 g09XORlSf3VHg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E67361AC52F4; Mon, 21 Sep 2026 10:19:29 +0100 (BST)
Date: Mon, 21 Sep 2026 11:19:29 +0200
From: Mark Brown <broonie@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 2/4] regcache: use the regmap scoped lock guard
Message-ID: <arD2oclSWsFo551s@sirena.co.uk>
References: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
 <20260921-regmap-lock-guard-v1-2-cdbd97b46074@nxp.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v5kXPfViKL/8hu/e"
Content-Disposition: inline
In-Reply-To: <20260921-regmap-lock-guard-v1-2-cdbd97b46074@nxp.com>
X-Cookie: Too clever is dumb.


--v5kXPfViKL/8hu/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 02:03:34PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Convert the open-coded map->lock()/map->unlock() users in regcache.c
> to the regmap scoped guard introduced for regmap.c. Use
> scoped_guard(regmap, ...) where the locked region is a subsection of

> @@ -432,73 +428,69 @@ int regcache_sync(struct regmap *map)

> +		for (i =3D 0; i < map->patch_regs; i++) {
> +			sync_ret =3D _regmap_write(map, map->patch[i].reg, map->patch[i].def);
> +			if (sync_ret !=3D 0) {
> +				dev_err(map->dev, "Failed to write %x =3D %x: %d\n",
> +					map->patch[i].reg, map->patch[i].def, sync_ret);
> +				goto out;
> +			}
>  		}

This has the mixing scoped guard and goto thing I keep raising.

--v5kXPfViKL/8hu/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqw9qEACgkQJNaLcl1U
h9C5Sgf8CHVp1uXi4cp0tdlSFoEnyqAgDHGMKqIiwKdP5Jq939YLRYuE/Bc73nLY
ycuIOwC7YgIGIEAsLaQtPCOJh6Str+RDJftvKcm2drP865gLAFRUE9xrNokEhAA0
PdKZszF28DL/33YcUBHX6Hft5tcUkBCKMH201zsmNZNCDc5Type6QVa71k71iDXF
Q2eDCDX1Fk+IaxVyfLdc5E/scVdhXJ2ZHJuk+dAqUoucHjidqvoALslZfSXLzLQQ
On2L20Ez4P4ABl7/LwpNbWKYERnTXjBkgH0Mf2l07yGbcb9taUII4caLDpeXvQDV
Tc60HnJHEp3MFylTr/AQjXFbTTzuug==
=QPFd
-----END PGP SIGNATURE-----

--v5kXPfViKL/8hu/e--
