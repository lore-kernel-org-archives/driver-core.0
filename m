Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592368;
	b=jxrps48h+O2EbgDT7lniLOyv1U7kKULaxAUlbNe5bW67aU6gXR4P84FAdQwFs44Qzg2q
	 lplwwbiC2nPg6kslU5TOcQfY2UM3ma8E5vpYjr0CXEjk9kVE+n5JZlAKBYU75YoHH///w
	 huXMoJHy+I/IVcMP6nhx+vGD8vgbBp2dU9nxk4rmMy2GGbruzzcvh3Si/O5vrxZ/Mg6xy
	 /JzEEPoqNbP+w4IHTFMNGgb6CfuwAFq+fCc6Tuz6QjL0anXi1UdwSnj+R271ZpVat8Nrc
	 LGGalwXAh+RECWifCMji679xjr4paLaFBnbBYlF8xsAp2VpjlUtQruhGnUVyp/9qSLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592368;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=s5Tqx0IqS1hUP1VTyxULc2SKeezgn3DcuF6eMYjyhxA=;
	b=XwkbWNccsZKsEUNzryQvC7QxULtgbUiurz2e2KD1E7T+LTY8t2zrGSySb+5adJYtnwr4
	 dJ4y1DxLCZ5n6IzCCqzc5MRZ8ubzavWsw/xhpxbvU6LlXfC2jRH9qE9gG6cSSXpWD4N7Y
	 R3bZlW9lCRFIimWIldbT01xjNauRa7Vl2ZtQZnc2/+8Pqkqvnjgry61S3nOxr5ly/UH5s
	 iNTWe4F02C/VxKBLKGNBk9IvSfWDsdrG9EdD5fU/DVe/6sRCPQJ3aepJ5/P7QLEi2xKVL
	 bu265bGnDm64DQ1hWm5wMFlNM4gBxOkvFluCph9uGfcD5bR/f4J6w+0rdFbecm0Vf9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7l87nwp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F023606B342;
	Fri, 13 Nov 2026 17:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7l87nwp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298291F000C4;
	Fri, 13 Nov 2026 17:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592367;
	bh=s5Tqx0IqS1hUP1VTyxULc2SKeezgn3DcuF6eMYjyhxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h7l87nwpytXvkktpYHeKytrdd1gt9G1cEcvGByhSFJVkUwSyhI4Sro4Ry/r2RKqsB
	 rWGJoq1pZWMNO8bQX92mEL5ztOqgsQ0yk0zuOQvou2B4h3uxufI1GYv4FQpSNHMxoX
	 nMhwbKf1kP41n+gz2K3drjH/Mco/kOMx+dZ1grI/q1EpIQHCqJQvlaGHkhUgpyFKFp
	 vWLXTmvknaAEBocPTjWzYuAYnbiz0/Xhxo5cTzJutREsLxZeMrjn5PgW5nJPcm3SxF
	 gbM4YudhEMDFJ4oGpPnruEp8HAhrYCvTrECTgDjaks3EewmxXb+5lxBcxIbe7OySot
	 +Q6qbpvVdkdZg==
Date: Fri, 13 Nov 2026 17:52:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v1 2/4] regmap: Drop never used devm_regmap_*_free() APIs
Message-ID: <ec267c4b-2412-4da0-a46d-d9ca8810d093@sirena.org.uk>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
 <20261110093820.454682-3-andriy.shevchenko@linux.intel.com>
 <179442294226.513646.6459407661987242086.b4-review@b4>
 <avVjKPairv4zkB4o@ashevche-desk.local>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LR1K+I1v0utGIzb4"
Content-Disposition: inline
In-Reply-To: <avVjKPairv4zkB4o@ashevche-desk.local>
X-Cookie: Flee at once, all is discovered.


--LR1K+I1v0utGIzb4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2026 at 08:56:40AM +0200, Andy Shevchenko wrote:
> On Wed, Nov 11, 2026 at 06:49:02PM +0000, Mark Brown wrote:

> > I tend to think that if we have allocation functions we should have
> > matching release functions, this avoids cross tree annoyances and bugs
> > due to people using inappropriate release functions which actually
> > exist rather than adding the ones they should use.

> In general yes, but for devm_*() it makes not much sense as proven by dozens
> of dropped "release/free" type of devm_*() calls in the past. Also as commit
> message says for more than 10 years nobody used it even once. What does make
> you think there eventually be at least a single user?

Some of those release/free of devm issues are people intentionally doing
a free and using the wrong function to do so, the main use case is
enumerating something and deciding that some of the functionality is not
usable so freeing the state for that functionality so you're not wasting
memory carrying it around unused.

--LR1K+I1v0utGIzb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3TmoACgkQJNaLcl1U
h9BpfggAgaeRbroXiJauXKJFOh7AQpyorIQK/OS3zj185w3PA43OWfTMsj8+NRE6
VHPyvQif96UWZEgYeiSD7uU9vFNeZjF32wSJoMvpN/WSF+hDMw2RYsFNWuyx3XAB
02V7jV+3TvbQei1iXzGQEzC8aBM9K9LkzdTFpuEsySa20yuKzD6AOWtrLPtoclN9
6VRA9qKLkZceIixIiPApKAZAP52WgCm26i39NyxYHiEJJPCsedeBN3Y3dIk2P34j
hcBBkd/wyL91oRNt2IBCTT/Dgaw77nq8svc0WkqrvaOyPMuyk7QTpwLmc0b2f8Fk
uKacq4jHoEo167OvrRohenquwhv+Pg==
=gpLV
-----END PGP SIGNATURE-----

--LR1K+I1v0utGIzb4--
