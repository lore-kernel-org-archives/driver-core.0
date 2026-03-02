Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8A0361658;
	Mon,  2 Mar 2026 14:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462994; cv=none; b=YSzJp3OGFuIQfzV2N0Rf2slXAgXW+UbHLoD221n30m+HyGsCH9SK9yathKXjTGI54OIY4tnuWEaNVl8FGyDMZ0t0Xa8o7CI/UJmbRssCUEeF7KTtN5TiznvRSzAXPGqASTuOlWTxHpuzMAObA8rmqYkyJc/IO4gbWz7mP2h5Gew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462994; c=relaxed/simple;
	bh=1miEIN2avhmT5G1zbL1U+B5ARoyxKGWaOXF+/YBjnNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgW0Yafg3gQozW+zh0Gfcn/kfcaz3dLQe7JDusKLXtctD7oRKi2y4lznizQ4lEU35vz0Ywi09zr30UC4LTeYEJa7Sfa5YkfM2CjLfqM3uNlGOWJ87WRhPxzSu5CPP3YTCX/VC9VN/5iEMvAGxT2ut0QPPJHxkAZrvKsBgo248S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJ3cjHG7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJ3cjHG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D34C19423;
	Mon,  2 Mar 2026 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772462994;
	bh=1miEIN2avhmT5G1zbL1U+B5ARoyxKGWaOXF+/YBjnNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJ3cjHG7RXIiEGp/aoxQ1cipypc/4hpxF38GwuiTWLObwkeqWVrcAayuAg1+NKYlw
	 mSn+qnb6cuVW7KYu1AeBGUoFa2duf9vxs6e3gCYGx8RJs2JpAGvb2Nf8o2B7UfUOIK
	 OwNHSGUkboZoBD5BMygtfC09DNKkOODnEPDT/cCUT1hj36CIHi1fhgldjL39GeEnem
	 d/4jnq0m4yrLHu46lraW++GeYDT9FjkoKEGRWWba+1whEepEszG6PNjf92ssSZ8GH9
	 NDhYsv+68l6UsNZw/xvDXBj4A5Oi0KUrLdXMYS4XOO0FvBnQ42X/ur4hlqHzvwm53l
	 1LxlzOXAubYCQ==
Date: Mon, 2 Mar 2026 14:49:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v4 1/3] regcache: Move HW readback after cache
 initialisation
Message-ID: <90f16d38-b698-4a84-b4f7-49597f353dfa@sirena.org.uk>
References: <20260302095847.2310066-1-andriy.shevchenko@linux.intel.com>
 <20260302095847.2310066-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="grHHbHhswHe7OtVZ"
Content-Disposition: inline
In-Reply-To: <20260302095847.2310066-2-andriy.shevchenko@linux.intel.com>
X-Cookie: You love peace.


--grHHbHhswHe7OtVZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2026 at 10:56:55AM +0100, Andy Shevchenko wrote:

> +	/*
> +	 * Some devices such as PMICs don't have cache defaults,
> +	 * we cope with this by reading back the HW registers and
> +	 * crafting the cache defaults by hand.
> +	 */
> +	ret = regcache_hw_init(map, count);
> +	if (ret)
> +		goto err_exit;
> +

We need to delete the free of reg_defaults from regcache_hw_init() when
it fails, the error handling for err_exit also frees that so we'd end up
with a double free.  Which is awfully error prone and part of what
you're trying to fix here :/

--grHHbHhswHe7OtVZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmlo40ACgkQJNaLcl1U
h9A+Twf+IQCv1hP+4UDP+yOPnn6NSoGikF+IqYkdT0CZvThRx/5/n8O9D9W8rF8w
DlnVamEu2YutEJcvdmP1bmKuHZ3RKU+wKqhsPV/xBJo/ZiPOzLYFnA760QgNn+2E
YghPQlMTbhNUy9teQ996TtKNO3HPdzp/NfuF70DUTJCXM3ba5Du1fmiBBw1eWBF0
tum/rgKQESN7bSs6Xvj6nEHiLnqxzI9dZVavKxGXmvkqQv/plZ27qDL2rPRbVrvo
KRGX444wmfSk9sN7Fh+zqWf1dMgCNu5jSQU4WhkJ0jO7Jfi1bO4EXuIuM17BGHNO
Jq7sv+O84ACLjsDEv7HMVyErqpAvCQ==
=wGMX
-----END PGP SIGNATURE-----

--grHHbHhswHe7OtVZ--
