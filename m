Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E6841D65F;
	Thu, 16 Jul 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206331; cv=none; b=KbvOrH7i84UcaRXlPLTTgSDAXImDN+VJJOiXUGoaHBubpzTi3S44u/AZllZsI6MVZ1PhUYSAbzK/fcQuPfrC3IbIFTeOe2yDN2t8hqO71xh4ScVKTZJufRMwxRgu3A7RaIo0gAzwwQtnoEGAcnMhUPCGWEFr6tHj3mgtoCQhRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206331; c=relaxed/simple;
	bh=yolVH1YJ03CRG3ZTA0bWsd8h1RVzFCu+K5MmbvTqyVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj7NxH1zy3cC2pxpPBjMqHOygIByR9i0f3S8npZQhqL/RnnI7v09be/AyOAmkFpFbMNNbH1VrhY+vBuJol73sk8CFjWpA8bwBdEFwOAG7uxLKUVZGhK2aCrDjUpaUjiKuHa/Knql0iqphiy4b3cEwbmXI7SajL7f63eu/R8+Xyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S91BXzBb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S91BXzBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162C81F000E9;
	Thu, 16 Jul 2026 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784206329;
	bh=yolVH1YJ03CRG3ZTA0bWsd8h1RVzFCu+K5MmbvTqyVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S91BXzBb3upOQlVPTZzenWu5qV/OPVttwye4Z5Wxn2bvdMO5mHkYk9i1wi76cR88B
	 ntV01lF9fL0d+MPW/DSdPFrRGXKlnGb2pPPGaOp4nIa8IHSrGYYNp3YE+9Z7ypT51Y
	 2IQ0ySU33IhzADYsv0j8WAG/N4t49BqPD6hSCUUmZVuZi/4oSYqJ+o6TCMF5HrcUDQ
	 btWyFvmF6NeYb1N6zGkbjqwwPx7RpwjCDSSG7H4wguJbKIA9hUpxUYKJjBCYFlacFb
	 UPqXes2NyP3CVV4/EK6TK0l3TNh6LHk+jsT6saNGl/snIGfZ3+NLwYbzrvWSBcR9fC
	 qx2EWzoX7+sHQ==
Date: Thu, 16 Jul 2026 13:52:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] regcache: Warn if regcache_sync() is called in
 cache_only mode
Message-ID: <ce5acc9f-3447-46f7-b096-fb7eebcbd6b3@sirena.org.uk>
References: <20260715052100.24983-1-phucduc.bui@gmail.com>
 <4e43250d-85eb-4019-b092-039e10e84ae1@sirena.org.uk>
 <CAABR9nE=eYDfd8rJpOGyhC3d5E1tteUW+7vgHBBWKpU4sN8PUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5wqQDs4UsAojpBJ"
Content-Disposition: inline
In-Reply-To: <CAABR9nE=eYDfd8rJpOGyhC3d5E1tteUW+7vgHBBWKpU4sN8PUw@mail.gmail.com>
X-Cookie: The more the merrier.


--b5wqQDs4UsAojpBJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2026 at 05:06:12PM +0700, Bui Duc Phuc wrote:

> On top of that, I'd like to ask about a design question:
> Should regcache_sync() set map->cache_only = true again if it fails
> partway through,
> or should we leave it to the caller to call regcache_cache_only() themselves?

That's for the caller.

> If we leave it to the caller, should we also update the function's
> documentation
> to make clear that after a failed sync, the state of the registers is no longer
> guaranteed to match the cache, and that further register access should be
> done carefully , and that calling regcache_cache_only() is recommended to
> keep the device in a safe/consistent state?

I'd have hoped it'd be fairly obvious that the device is in an
indeterminate state after a failed sync, TBH if I/O isn't working
recovery options are going to be *super* limited.

--b5wqQDs4UsAojpBJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpY0/QACgkQJNaLcl1U
h9DavQf+OjGRabkEVPFGtWiIBTAnEMSS+ltLgLPAAFI+Nd4sUWJ0gc0WLLFgXC7Z
ZzjAx0BE+Fi3CvvWtXmcX5+/qQaIxanZn5jBFJnZwr42zGqxGr8o7zOUdIBIKzOY
n3jUql/nXE9dfUuAyveoo1XbZSXcUIKDo5WBnolbaEFcqveAl0DLj4P33N+i9XNe
jK9Gdws6dfMjVqHIG391p4INGP6fz9ix7LVObj6BrzFxA48oA3pcV5U26wIBI4OA
slbCXANME8Z5IZstiz3SvP4/ED3RXoaeuMe8aonvqxXnncMm17ZVjOcSPpuLnbdh
U9b0fMbubxXNVTFbq3HZ5jcV3ApDpw==
=rMd7
-----END PGP SIGNATURE-----

--b5wqQDs4UsAojpBJ--
