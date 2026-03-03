Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B9833A9DA;
	Tue,  3 Mar 2026 13:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772542996; cv=none; b=gFTB3oqVSCGHzStApSWHj5PAwFyuxL82Qfn0jwfvEq7J48/sITdP9bQgfY3ai9W7fl3nM/hNH8uwLRX5MMm5UZEX/D/JFl3KtpoFw2V0J1ALmCZPthUuu7BE6vNQbEJSd1MG8XFbLNL8EMW5w4//dZRn46diXsxnP1m3xw+UOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772542996; c=relaxed/simple;
	bh=FAseuCiYTGP1N8OcV4dpIlSJQlQhep8ovUnVtpp8s04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onuLX0D1+/wTPgPLBqhiNY8nvPbGD4kRcsYn7XSfr7quBuu4kMXd30zrkMuDnkw3GZDVYyciej+KPTf+cv1x9vVsqOQE+jdLnT8iZPmoRSVgXKvyn/UIvxbtrjIYJgZMMuLBfnD/fqLbnGAOCoulr51m+rVdMteyZvVs6X0/U68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfNb3xS6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfNb3xS6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EE9C116C6;
	Tue,  3 Mar 2026 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772542996;
	bh=FAseuCiYTGP1N8OcV4dpIlSJQlQhep8ovUnVtpp8s04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfNb3xS6HLgUxUTzmtEeCcSH81Hgmx84HID+MB2IuFL450bzgynvU7ZPF+NXnS+M+
	 XFHJxgZboDFcPgEr3fXUHV9Pz7J4OfPRmQENpieeoVFwYzIvrXz/vD4IjnsW5/uUsx
	 oou65DLr0kSk3qlz8gX/sGvkVN7sD/WBv6gybQL6mzN5UDCmydv+KB+3pbytZvBvjI
	 xse1pxr4K0AUEhPLviNScG/Yh8Vat0yZw9q7dDC4WAKcLMSIOIjnWvg1bw7CA37QoY
	 M1054ycHgVYc6OePyTiYL8l24j50M9ViR71ZJMfzDqNOsScpQist9f0pJn/I/LCLdJ
	 UPLBIFeZJ5sUQ==
Date: Tue, 3 Mar 2026 13:03:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v5 2/2] regcache: Move HW readback after cache
 initialisation
Message-ID: <b619232e-d7d6-493e-b033-86850429af6c@sirena.org.uk>
References: <20260303092820.2818138-1-andriy.shevchenko@linux.intel.com>
 <20260303092820.2818138-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UoG71diTC/522LxJ"
Content-Disposition: inline
In-Reply-To: <20260303092820.2818138-3-andriy.shevchenko@linux.intel.com>
X-Cookie: Use the Force, Luke.


--UoG71diTC/522LxJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 10:26:25AM +0100, Andy Shevchenko wrote:

> @@ -230,9 +230,18 @@ int regcache_init(struct regmap *map, const struct r=
egmap_config *config)
>  		ret =3D map->cache_ops->init(map);
>  		map->unlock(map->lock_arg);
>  		if (ret)
> -			goto err_free;
> +			return ret;
>  	}
> =20

We might still need to free the copy we take of supplied reg_defaults,
it's not just the hw_init case.

--UoG71diTC/522LxJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmm3A4ACgkQJNaLcl1U
h9DbWAf/eJR8czTRkKpQsm3bu003oSHhXNEPm2sTTFDNvSoGVQYuFS5nzAMOLKkJ
STWHWbEIadwpeYbv2AJ8SO7/wux1yI5ODkEd6OzUFThzmGu2MmNY2TntQWNdKS3Y
jMSlBr+Gppf3/v3WWRw6xtJG1FqvsFu962QEUZ6ZH4cEf4OTi9p14XpNPLIx4pBE
VinD/IuADTla6ZXpIPpnDT/wlrpDsUIgEZAG4dEwD8Jp2SWS5z70uAyci9TIhWXC
V9GmjmPMpNJ0uSa3z3QQI789m9GwoIlTErna8ILWUe6peQzo5NIRPP2bqWYn+/iM
52hzY8rP88AfgYVxd3n0DPIvekrfXA==
=JDmU
-----END PGP SIGNATURE-----

--UoG71diTC/522LxJ--
