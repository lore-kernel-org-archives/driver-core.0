Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074A0313E31;
	Thu, 26 Feb 2026 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104242; cv=none; b=nN3iM5lc253/UAlG2T+2H3QkavBbNQFbPxhl0UkWycV1FJaaGb+x7F45nCKg0GCcu0Nulqyv6bPbWQri5QCiGnIjOBDfG5BG1MB9F8borXpXdZrf85Wj82ocoZtJtW1+xeM3q2qOf1535ffmFKK3PsjNBbjfeoCYn1CCRnbs0uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104242; c=relaxed/simple;
	bh=jlWRUAGOk0gQUZjfpvrO3WSndc1G/a3HOfEro/1SNZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlxLUKrsdNM9B8Xk3egEDmGkqf0fanXNBMZB6riNdTwx7B4KLZ7I4p7cufO4/4Bzq5guqPhWeWZiZWvz5dHEnNtgc4UI6J5IYVHQy+3TwDDuYeQhXlExwrZbCnxh2ZGCJu0mh+gd5uuv1MenL34JH2aLE4OfmPWTG93d9u1w0gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpqS5Yt8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpqS5Yt8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9C6C116C6;
	Thu, 26 Feb 2026 11:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772104241;
	bh=jlWRUAGOk0gQUZjfpvrO3WSndc1G/a3HOfEro/1SNZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpqS5Yt8phKt6gZNLP19c+arzih2UaGMPgwF3mFQP2/cS9K8W0/pQ4iNqKOKU6+bh
	 9gZI1mgvWfLckENwGPJqRuchTg0cVHZvfEBB2mLBgdoHwE/tUrdzV2fkXikn8V9y3A
	 tLeAj/OdxyLxZqyKvgSkegpIxGabhKpsqk9WdQWW9dw042VCOl02JqJbjZwzOl2R6o
	 wIpP0xSeGoMksf3bxqraNJLr6qnmWkMJKKaXpwVdp39m0QL1yKOOpq6vPQTY3u5T4z
	 pxMlj3kP7ke8i9KVzye6m5+L0cLhceLlmJFjXCRAP24TohSJLRpbXl5+OxoCqeJAKt
	 zfGeilfHK7sfg==
Date: Thu, 26 Feb 2026 11:10:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 5/5] regcache: Amend printf() specifiers when printing
 registers
Message-ID: <0eff41b7-d2df-48ff-83b4-c1100e83daee@sirena.org.uk>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
 <20260225161659.3811671-6-andriy.shevchenko@linux.intel.com>
 <a2e1dc8d-584c-4c72-8e9c-558a220ab5d4@sirena.org.uk>
 <aZ9McAzXLejc3Ttl@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3EM3kJomJqEqtt+H"
Content-Disposition: inline
In-Reply-To: <aZ9McAzXLejc3Ttl@smile.fi.intel.com>
X-Cookie: Honk if you love peace and quiet.


--3EM3kJomJqEqtt+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 09:24:32PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 25, 2026 at 07:15:18PM +0000, Mark Brown wrote:
> > On Wed, Feb 25, 2026 at 05:15:59PM +0100, Andy Shevchenko wrote:

> > > -	dev_dbg(map->dev, "Writing %zu bytes for %d registers from 0x%x-0x%x\n",
> > > +	dev_dbg(map->dev, "Writing %zu bytes for %d registers from %#x-%#x\n",
> > >  		count * val_bytes, count, base, cur - map->reg_stride);

> > I'm really not convinced this is helping legibility.

> You mean the only this hunk, or the entire patch?

Just that hunk, it's new and unusual, reads less cleanly and I can't
identify any problem it solves.

--3EM3kJomJqEqtt+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmgKi0ACgkQJNaLcl1U
h9CShQf/SVRUqEiQO16sD4HXmGG/so1xBw4UrCmPOdtdvKAnsEb+RIZ9Js7WTFrC
NKD51eUbB9uqTrIQ3BHt+HQ2ZeRxQQ6ho8tq0Slz0AL+HG8KqE34vLnSsOJheB7b
q5KRUSODPCiEWBHiMb5w2ItiKhKf6NL2wFWJE60Lqfecx5njAZFThs7k9HAlY5Mr
lLe+qoOEDvd/Vyqh77c3j2zvZH6XQo88WKvMD313qXgZC/iwbQKK7mioEoTCVeHQ
tksFMb/En3f7u17alkLCCCfVGyesC/FBPEcCQclSGXUdcOOPZ6u5XKlayuD+4oyL
8Hd3N4LB6E9/lkqaRfSJtNCqX/v7xw==
=Q2tJ
-----END PGP SIGNATURE-----

--3EM3kJomJqEqtt+H--
