Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111DE3EFFB9;
	Mon, 13 Jul 2026 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943910; cv=none; b=D2RStMnw1wSYjEd0tMK7NgFpNoFwiJx0ij2ea/bR6769HQNKc2nCxOcMrqpcOhdKQSZLwg1wtxTCX+q9uAwFBsZi2uPX0kuoQvKJ+7bJt+JK0TATJERKPKzxPIWu01FR3npPo0HxfBpD3NZWFyQ7KnOzbdDAIodLlxEkxB66lUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943910; c=relaxed/simple;
	bh=9bbs8UX/297e1HapjI5HShVyBPRIxWU3JxIV15XlJo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOqQLEakBklK0LuFC3hXsCkITCVDWnrsuWG0gwUppZWhCgRlRXLaHW2KgLUf72vMZoVgULzs2sOBQ3doB+ZB1v/+Y3KuOdtDTKO4e/TQ8i7XLffTuakaaNUCqWsqYTaGJzhHSwKvuTaSelyRyKBI8sH0sTCRIXFzugeURNj81r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4jSutHR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4jSutHR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655211F000E9;
	Mon, 13 Jul 2026 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783943908;
	bh=LFdgWE8j2Fy/JAcHkvs2nspRxcxwJtn8agbgicSouxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U4jSutHRU0CtyfV1izwKsoNyGodc45+IQzbASX2BWOxgcMwf8X0iVe0Xk/u7FTyf1
	 qozzuLOOHkCm69LyWQXR7giqz3XMlye1ATNVZnD1Gm0Yap0klPCHA+WxAphe/ZXXO0
	 AGzGhzdVTwh24sSWLke1b6l+2UWQaZlr7+wpXX1SXgurTRNl/OM9PtiG4Qs/rVt6rl
	 yAeRxVIGnM87P0zzViTGboxuq8NRFiLwr3mENy/a9V2YmjWJryA1JxgVMuBdHz0ix9
	 Tzu4PKqqltggIgpq+F0IfTFcxtOqoxQtekbCIsn7eK5thvtpBCxRB5aFeP5Zbrd2Kz
	 PO9707gwdPR7Q==
Date: Mon, 13 Jul 2026 12:58:24 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] regcache: disable cache_only before rewriting paging
 registers
Message-ID: <24ce60c7-5539-4fba-8bf3-3a10875c3b75@sirena.org.uk>
References: <20260713073059.47914-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e6pyUuZX8ocioo3k"
Content-Disposition: inline
In-Reply-To: <20260713073059.47914-1-phucduc.bui@gmail.com>
X-Cookie: Courage is grace under pressure.


--e6pyUuZX8ocioo3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 02:30:58PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> cache_only must be disabled before re-writing the paging selector
> registers. Otherwise, _regmap_write() would update only the cache
> and return without calling map->reg_write(), leaving the selector
> register on the hardware unwritten and out of sync with the cache.

No, any access to the hardware is buggy - the whole point of cache only
mode is that we can't access the hardware.  The paging register is part
of the context that needs to be rewritten when resyncing the cache.

--e6pyUuZX8ocioo3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU0uAACgkQJNaLcl1U
h9DE9Af+Pq0nfo6VnhRNOS1cwY5i6em3yrTF0hT50wAW0LjGCUY2/9hcsVnfKXKz
PGxjGTa87Xme7A4cAXRmzGmkmZIRVTmGFAeegJvdaTWVNNf96M1bfNX/75ZmiOK+
0R67wLyZfiKxoAbuJvtD4zFeYZ0bmhcVkr4FdxpCDTJcnnmR1MzlerXbsmkGCxiD
02fS1R6CuVXf4YGDvgtjGrogJVSQ4N/b9sN9InsLlR4I+9ip2it4SOuoi0H99utO
Bnn+dv/gvkrfGvBAgB6WMsRnen3CTj3zicOBMMs1sQi+5VYFtnJrtaT1rliiv/dE
Ao5JA18BtqWbFbXHn6A4nWo+1E6x5g==
=FLJF
-----END PGP SIGNATURE-----

--e6pyUuZX8ocioo3k--
