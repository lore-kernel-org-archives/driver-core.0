Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA812931DD;
	Fri, 17 Jul 2026 22:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784329160; cv=none; b=sNYCLwon+7q6XLOXvjQX4fBSCfZldpCEC4B4xl5k6KfwwXgcYakVjyw73JeqsilSydPznmqPBunZ6JLWPDfJCbv9ZHUsuoSr4rcOi3rFb4zC8v3ZWK+uTKe5nXNZK1BegYGriEkBR7x23uOqo52DMeYeyDo6zY6yArIlPel4H3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784329160; c=relaxed/simple;
	bh=xPlJfI8CUTaVT4p+boBdsVMzdOdXKackHM7kkSY/2sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dA2CYxPqOhYuK0cbWmrUcnoyWLv62QwT7S5Ji4gt8USXDHvYohhFZI8laJXH3a6xf4oZPkTcYOLmitRtqUbHlfyEJc2PRvDehw++/CPlQg5nvvJnbgGv664PmdC9mbwSxNbvO9SszzGV+cp2wRU/c8ULCL5Qnn/BZifcGtdGXAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZZEq3HZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZZEq3HZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F55A1F000E9;
	Fri, 17 Jul 2026 22:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784329159;
	bh=yxi9vRKzBx5zGvFOWBpdmwdrQl70F+91NwgiT5Gy+NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nZZEq3HZkl33fltxtZwuO4EH31hI/af9AeqX4Kr5fdQxc1NeNKQWcynFkDwfEbZAj
	 +GqiLgliJ7De+d13tLGKSDmxZ0umjE6LpYNDD1UTZ2LBTfyiDmZWxl1OkRi9aH1EIc
	 g3hS1t9oBRNCHiBjFPNoxM+IXNnpjx/JJhDILxzSy+PHKr7XX5ibymTo4ZMNRppNKA
	 1EdFZ904QVvCmU51mhnkPFCBFIqrhdnUC+oUKHssLMANB6H0pb94VbUlf3OCRm7zCM
	 HgN9/ryiCtv7BBNWNYI+TCDPhVdDqiilvTmQw5khgfXvXpeWU45jUI5com4lXFAUYx
	 +KQoaVNGFTjOw==
Date: Fri, 17 Jul 2026 23:59:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v1] regmap: Clarify _regmap_update_bits() 'async'
 kernel-doc
Message-ID: <89cb2459-3d47-4ed6-8406-c6908320f791@sirena.org.uk>
References: <20260717205031.197980-1-bhelgaas@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3K2qE7EGQQUD+mxj"
Content-Disposition: inline
In-Reply-To: <20260717205031.197980-1-bhelgaas@google.com>
X-Cookie: Enjoy yourself while you're still old.


--3K2qE7EGQQUD+mxj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2026 at 03:50:31PM -0500, Bjorn Helgaas wrote:

> Reword it to clarify the read-modify-write mechanics: when 'async' is true,
> the write is queued asynchronously, but the read will still be synchronous
> unless the device uses a register cache.

> - * If async is true:
> - *
> - * With most buses the read must be done synchronously so this is most useful
> - * for devices with a cache which do not need to interact with the hardware to
> - * determine the current register value.
> + * If async is true, queue an asynchronous write. However, most buses
> + * require synchronous reads, so the read-modify-write cycle will still
> + * block on the read unless the device uses a register cache.  Therefore,
> + * this flag is most useful for cached devices, where the current value can
> + * be read from memory without hardware I/O.

That's...  verbose.  If you want to add a statement that async mode
will be using async I/O then possibly I guess but there's a whole bunch
more there.

--3K2qE7EGQQUD+mxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpas8IACgkQJNaLcl1U
h9AHRwf/ZodISltCpj7GFHkEbYXMn/Q/NTpofSXWV27PsB46caLBBrNGGGRdRU6E
zxB8i3eWNX9p4PQ1zR5hW1/joA/+BXBs/XQY92M1ClPNXXdqhDgznziSapYY8390
8mCG45seFnc+KjbN94TU+7A4i4D0qRJ0SzPaQQK7YATfysHXTupQRXMcY7Ewysra
fGpTBi8C4Hodis1sa8UGtn/RiSi1yIFLzqaZXidwFViyOAJhW/b6oU+5O/fYEmNE
l0mx3saeBg1tw6aJDiGPv4glIGL7a7wY9w+jr4MKBy3ZVgEQH8wtndXdu2AitqY3
biojkBy7wNCAMGy8bs07jFEMXyfJFg==
=SWHN
-----END PGP SIGNATURE-----

--3K2qE7EGQQUD+mxj--
