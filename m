Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399BE27CB02;
	Sun, 19 Jul 2026 21:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495159; cv=none; b=Dwkl8XZepUTbnMYKIWPAxqLaadGdnKTJYEnhZ0oHr5eKaPzTEsoSbQYcfuOZteaIZAEetL+vQ4zj3kdOzRWJveF+9pU65yI5p/awmofItaGGo9cxPWWtjY7wWugXsEOLBKK2FfbKpCB9tPLhppeB5OnI+FUfPz6IN2k31FNovvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495159; c=relaxed/simple;
	bh=x6B8R9qpNdfyAZTiXZNALr+WCka8C5KNnLFo9l+bVZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdSb7ajEHcsGKfRliZ0KiuLTkqz/2WlM/btEI+LNjs3ya+gL1LbkPFtrXL7MOxAU0xC3aR1XhRCR4ZAazoRXR3skJRsqZaBROlEd1RdpwXU/IUkTAfKwCVHNLfmRE+7b7F9/cHaQG9UJpsN03iZt+bbVFYGak4JhAhW0UNAfNX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpbJeTQ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpbJeTQ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A391F000E9;
	Sun, 19 Jul 2026 21:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784495157;
	bh=VjDhyFvHKYINnydOvc7lIaEJ0iwtTCW6WBRAk6n0CQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WpbJeTQ+SbhFBoKxgkJzGn9HaXV6nuGizmqxP+uG8k5a1FHpUwTwh2DxnQ0RHdhYe
	 y8iCZ5nnuy1y9fs1+j7N5xm9EZrux1zHu8X9/4f1ePT3ChAH2bqBJcpvcMytKmLL0p
	 1QMoV1iuLdG/2vkCcUmEkbjOYrkW4tC4rzQI/COxBuUDsbT5XdnYP73zyLEDJUru2k
	 n7KMjA2J3MhtOhHnw6tOCgaAwdU6xyLaafxjAZJ97X7Z9t4u/r/XvBV6FJhRy/M+Je
	 PlEGvWLRCoxcVchZMA33c1oZyue8xPMFbHiVE5Fl3uGAVZxGd+1UN98p1SS8xwpg/x
	 Mfgo0Nu5hUt5Q==
Date: Sun, 19 Jul 2026 22:05:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v1] regmap: Clarify _regmap_update_bits() 'async'
 kernel-doc
Message-ID: <355e82aa-024e-4ded-b8e0-901ac71f0b03@sirena.org.uk>
References: <89cb2459-3d47-4ed6-8406-c6908320f791@sirena.org.uk>
 <20260717233124.GA216954@bhelgaas>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hyDUYyBP/ojY7M9/"
Content-Disposition: inline
In-Reply-To: <20260717233124.GA216954@bhelgaas>
X-Cookie: Courage is grace under pressure.


--hyDUYyBP/ojY7M9/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2026 at 06:31:24PM -0500, Bjorn Helgaas wrote:
> On Fri, Jul 17, 2026 at 11:59:14PM +0100, Mark Brown wrote:

> > That's...  verbose.  If you want to add a statement that async mode
> > will be using async I/O then possibly I guess but there's a whole bunch
> > more there.

> Maybe something like this would be enough?

>   If async is true, queue an asynchronous write. However, reads are
>   synchronous on most buses, so they will still block unless the
>   device uses a register cache.

Looks OK.

--hyDUYyBP/ojY7M9/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpdPDAACgkQJNaLcl1U
h9AN8wf5Aeq6+bDcgCCe50OLlfkC34lPhYwSuob0woAyNipt6S3Hi2g4ybfl/Dl2
9MJu2pyGygAenZORtDwICsKuIQq8FGZPwEzXwwsswIjgAOLrhHAE1k8qbQmDbvKK
gLpuJprtmKORnN/QnC+gISWDwsa5fWemWcSzp/vN8TFGm6WG54iGAN6oC/v63xpT
KpuUwJlYdHo1w55arYcneuHq9GlMssZk2IwIuMQ6gtfLpj6WrUlQHmChZnIYhf5R
dPgQoFGcZr+HARqzFa5ZUPZdTCQox30kccj8poyE5U9RT5VD/xzyeC2Er+zLTqic
GHXEMX1owiXwCao0cAhqJxFLmDbigg==
=WgHI
-----END PGP SIGNATURE-----

--hyDUYyBP/ojY7M9/--
