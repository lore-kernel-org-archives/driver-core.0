Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9183B9922;
	Wed,  7 Oct 2026 13:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379406; cv=none; b=ImcMc0kZYepg7UVQKv5tFqmbYv71Vn8maPLaG5+nVREjAc0CYOmB9YLMGhLGHg/DG61Fjp7B0aC0Zhf6Far5eSxeqOqN5LHSIDodFdTheF1rD3oWrJ+orTz5dBzfP+j5R6hWLlcoitmC/pg9kJ2LvSwl+UB4/Gbby0PqPejHPcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379406; c=relaxed/simple;
	bh=XxoBq+ELA8pjevYW73krGfx9TC2k3JWXnPXHiTk8P4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLs5YKTQZ2Rclqvb8lY779OTYGY2gInZrvynAWsCa43BPQlj6RqTZPwRhCAhURtx+CkHWG/quAZhpne0yazamqfyVhg/JlFO4MTiRVl2E5AKNeDE0OGh5GPXJ42FVtJTM80H6yqpXZwItkHccQo42V/Ybl/Ldafg0xXavxSu4tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNnXR9bF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNnXR9bF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9502E1F0089B;
	Wed,  7 Oct 2026 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791379388;
	bh=XxoBq+ELA8pjevYW73krGfx9TC2k3JWXnPXHiTk8P4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NNnXR9bF5zq2J7cLpp3TI20zFntcJ4VN0XB8Wxd1ZPaYBWHCx01YYtMPJi9cie1Dt
	 1nt97eAllNupzcUmL10/NYHEvx+9JY9iDly+iiyaLMO9ZO1+PN7hLeGS8astIIjv1m
	 pDwC3s24gPUgBmoYxkF7qfoeGYBUGbyZ36CiveCx6cTIOqj7xScxXqRpjbo6vPCrDC
	 ezCt7dHlWrv+WULIvfk1Mqe0qwCgR6CLh0MC5P/yIIKKEXPlf5tzpLO9SAECXhGdqW
	 T5OWlUahiW1uudMKIQyKkXmQ5JD6io677DIb3Ez058lsFizbyBYhlnWhKMF4GKe/Kg
	 /G7LnGPA7vXVg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7A0B01AC57CE; Wed, 07 Oct 2026 14:23:05 +0100 (BST)
Date: Wed, 7 Oct 2026 15:23:05 +0200
From: Mark Brown <broonie@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 0/7] regmap: cleanups for regcache and regmap init
 paths
Message-ID: <asZHudwIW5QkdhCg@sirena.co.uk>
References: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5RAu3ZEHhqbW9/r"
Content-Disposition: inline
In-Reply-To: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
X-Cookie: You will forget that you ever knew me.


--w5RAu3ZEHhqbW9/r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 08:03:56PM +0800, Peng Fan (OSS) wrote:
> Following up the previous regmap guard lock patchset [1].
>=20
> [1] https://lore.kernel.org/all/179062150526.139547.3870545428656485907.b=
4-ty@b4/#r
>=20
> This is the 2nd batch to do more cleanup.
>=20
> This series tidies up locking, error handling, and resource management
> across the regmap core and regcache.

I applied v2, please send an incremental change with the fix for the
goto issue.

--w5RAu3ZEHhqbW9/r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasZHtgAKCRAv73Ows9A4
iRofAP42jYsrdT2s2YS4/cS21aN+q9IRVmmVVPjZ+1KYbwgVlwD8DvBH6r4jagxf
Otb+P7b5WqmtqwnOw3FdaTxLPmrV+gE=
=bMg2
-----END PGP SIGNATURE-----

--w5RAu3ZEHhqbW9/r--
