Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CAA3AB262;
	Fri, 25 Sep 2026 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338964; cv=none; b=B2ePhWreeYrRzsDaQlhE1c9qIMrY9z6Fi1hJs9+DDRfXcBBt9HHr45Y3nwko+57uPV2xtzRfDo1dhvEtrMyKT4oto7MWcNn5C9svjNHKaIXpfRTmSllGZhldx8DpdyChsybX++PIqO/hqZusVgVdRg74kSld8wZDbuMuQZhmRdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338964; c=relaxed/simple;
	bh=kuLNl+1ZFMd31q/aWZ/wE3h709FqVMDuybc7TRci5jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8KLpiHT1cL4gtrIlrbrvn/rBhgo/pYSBuXC8FGg/AMcboDrecAlGGSyg6WfxyqRdUw4z0r2thGg80Ne6TjTg4UC/OYv9UITsRHVx4ZtH/PtiHBiUOT/jaRjrzLhODxuyOA3q6ISlBMfnsYK/I2b0nf/Z8ULSBuy1Vmfi63ulDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJa6vShx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJa6vShx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD911F000FF;
	Fri, 25 Sep 2026 12:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790338963;
	bh=BtXeJJ65S4UeVQRbUtMGQJKB5yrfWtpwgfn2OXm0/sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EJa6vShxQR9gYfBXxH4t8oW8oAjA+NqrsyJahnkJ0JwN8bsuGI8EEuaXcIDF+Jowy
	 fo7GnGFg+LHkSNAmJmBLSP/sXYTgwS+QK0rqRCS/mAvYYdrvpgTuNaIOfw1BSpTZ7X
	 aplE3IqieC7LiZIdGAhh9rJA5GUHZKiXaHD3y9cf7VKlRenuQoGk3d39n8R4x7UreY
	 CHNm553SgmbzcKUywpoo7KsWzBGGvJVzVRi3RJ22GCcpw13qFuN+9WqfVYxQJjoKjU
	 o/TrB77RhtsXgIX/b5uN7gkvHs6Y+MJkh1e6gAauvO3yTWB2/oyNA1aFxn1r5tRXal
	 AiQBvgt5ovygg==
Date: Fri, 25 Sep 2026 13:22:39 +0100
From: Mark Brown <broonie@kernel.org>
To: michael.reeves077@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, asahi@lists.linux.dev
Subject: Re: [PATCH] regmap: Drop map lock during cache init and exit
Message-ID: <60c791d7-10fd-4019-81c2-69057002ac83@sirena.org.uk>
References: <20260925-regcache-lifecycle-submit-v1-1-83b75ca79d96@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i9aQO7k9vw3SMnrp"
Content-Disposition: inline
In-Reply-To: <20260925-regcache-lifecycle-submit-v1-1-83b75ca79d96@gmail.com>
X-Cookie: Love America -- or give it back.


--i9aQO7k9vw3SMnrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 08:43:22PM +1000, Michael Reeves via B4 Relay wrote:

> Commit fd4ebc07b4df ("regmap: Hold the regmap lock when allocating and
> freeing the cache") added the lock for Maple tree lockdep validation.
> The current Maple tree backend uses internal locking, and cache
> population is now separate from cache allocation.

Do you have a reference for what you're referencing here?  The issue is
precisely that the maple tree does it's own locking with a spinlock, if
we ever use the maple tree from a hardirq context the use of the
spinlock in hardirq context will be tracked and then on removal we'll
get a locking inversion warning when we try to free it.  The maple tree
locking is entirely unneeded and forces us to jump through these hoops
but there's no way to turn it off.

--i9aQO7k9vw3SMnrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2Z44ACgkQJNaLcl1U
h9AdGAf/acoumXnzD/1JovsKiVPTl9ydt4aplkNH9EIe2DlPkiZ6w2uF8RVJr0X4
V5OkYLCafg3YEBkqjYuZ1Jl210mvQCjBqs3bewhp+6r+Bs0Wdszj7o4KuQCb2RjP
pxEHX1y9GaOIYm1+vmXcD3SS1WNz8ArdhJX+oMJ+F/g5YNKgG/IZWucxVqm4AEpT
AogQjFQ8tObgIyorVXg9Ue4nZjOwgxM+f0bZSVeM35+Ks1tlpGm/J1d+r9Crqn1F
ZHvDnHaJ8/NjcQBnFptNSnfsluwajlQ6gJ7S4q9QHx3TSBvAHWiaZ2SmmgFzmNOz
50IEIUqYhEwzOXNwzj9eaMi4XvTV5A==
=AWkm
-----END PGP SIGNATURE-----

--i9aQO7k9vw3SMnrp--
