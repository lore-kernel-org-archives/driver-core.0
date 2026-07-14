Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC0E363C60;
	Tue, 14 Jul 2026 11:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784028185; cv=none; b=hq2AN6y4Unlt1tHMk+/IH8VQoyn14kbvfoQ5VCAFJjl+lLGmVCMUBPpLYtIpj1e8NO11CTf0Hij1jfi4dWQov9DrM0oN1kS6h4NOS7vY9liFBKECpPwYswdEtptpvmCpERj4tNZgl2teErjRhG/tbhQdmiLoS8jmow0XTMwEWxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784028185; c=relaxed/simple;
	bh=IVtuCHKxfhQiyj+PwJ/rYkJNdabtaOoLclCc0A023x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bowYuSKvQbcU4rSLfVdbWHZWZEYNf5QBESvHEGUQysgux7BzwpZd0Pu7tMFYVJG/eb4hyLuYTjkgVlguKIEP4543Jbh2NvcN9JfWlsWJVQQ9w01XUSS7yhA4w33vlyWADxeTtkX4dOLn0bPVEritcdvaN+kHfWSjUYlzMsRoeiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDhw+GiU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDhw+GiU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293AF1F000E9;
	Tue, 14 Jul 2026 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784028184;
	bh=IVtuCHKxfhQiyj+PwJ/rYkJNdabtaOoLclCc0A023x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YDhw+GiUAo5ZwGwFsF6ltQkil1zROVdv34ktdSZ7WlYZEEaiEeEMV2NH+PPGZjSK4
	 b2Zm0QRMwOeAEelHdJvnL0dDLWnByyBMBhoV21CXqs6dABu5HRm/GIriZbmV2NARMS
	 EhpIja8cMNlkZwoqTQW7fGKxn+/KaJGh6VJP2Sc/H6faLHmRhXEzrNey0oecQnI6TA
	 YgAcen5uTSnWbRPMLJEvN3/gk+B0+y0y+NqolpCZcSITCGWCBZ/E10CysMBqHfpEq4
	 Qgawp44l11eLnN3klGBQajiYqrdQdpuyieY2SAYEJNqaqH3qtUVCIw2Emv5NnxNg1j
	 yDY/8CdUFoP+Q==
Date: Tue, 14 Jul 2026 12:23:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] regcache: disable cache_only before rewriting paging
 registers
Message-ID: <6bf54da6-10ce-46dd-aea0-9e7fc64e7006@sirena.org.uk>
References: <20260713073059.47914-1-phucduc.bui@gmail.com>
 <24ce60c7-5539-4fba-8bf3-3a10875c3b75@sirena.org.uk>
 <CAABR9nHfThjz99fVyoAZcSdOh09-n0_WfM2OWL4zkSZG5Pm7Dg@mail.gmail.com>
 <687d81be-566c-481a-9ece-08526c33ff91@sirena.org.uk>
 <CAABR9nHWV_qMWaYOeWroU6cPH3n3pDjbafHmXMeMVfiqC562Aw@mail.gmail.com>
 <41e52d6d-8f91-4685-b659-94d3844fa959@sirena.org.uk>
 <CAABR9nH8oMXpp-_RFxFWWOWenaZ8XoD8Yr3KDh82RmffKWZRPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QPyssLpscz2ovqC5"
Content-Disposition: inline
In-Reply-To: <CAABR9nH8oMXpp-_RFxFWWOWenaZ8XoD8Yr3KDh82RmffKWZRPQ@mail.gmail.com>
X-Cookie: Neutrinos have bad breadth.


--QPyssLpscz2ovqC5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2026 at 04:58:45AM +0700, Bui Duc Phuc wrote:

> As described in the commit message, if regcache_sync() is called while
> cache_only is still enabled, it can return success even though the cache
> and the hardware are still out of sync, with cache_dirty remaining true.

> From the caller's perspective, that seems like a successful synchronization
> even though no synchronization actually occurred.

Right, we didn't explicitly add a check for that - I guess it never
occurred to anyone to do so since it's such a nonsensical thing to do.

> If that's the case, then it seems that neither of these approaches would
> be appropriate:
> 1. Automatically clearing cache_only before writing the selector register.
> 2. Making regcache_sync() reject calls when cache_only is still enabled.

Probably 2 is better.

> Would it then be correct to understand that calling regcache_sync() while
> cache_only is still enabled is simply considered incorrect API usage,
> and that in such a case the responsibility lies with the caller, rather than
> regcache_sync() itself ?

> If so, would it make sense to document this requirement explicitly,
> or perhaps emit a warning when regcache_sync() is called while
> cache_only is still enabled?

Yes.

--QPyssLpscz2ovqC5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWHBMACgkQJNaLcl1U
h9ALrwf+M4HHv10fB2erJIDBGPXWjrEenjjATrBanf/kmYaMYBKry8Lscz/kPbJ2
KdUm7B4oKZGCJUNp+493OG3jm6s0O1RNLnZpG14ltq16J5K9/Kv1+T9yxHZ49Ux3
MQaCYJ1z8RGZvQ6Mxfx0Em6uysvbVDtw2ApRPBdTs3k2iXMYA6AkzfwYgtv6rH1s
vAk1Q2hWiYdAcQ6OzIExpkJj9k0qh3SSG2vRlDmoCn18A699u6vy/U7WDEpq2ycQ
KDqaJsGRxXisTnPHaFlchYdgRbA6LDxzJWSJ17iDu1q3ss4wqVaStRwuP4pQGKpZ
M/lKaWInUK6ZlCtjgqKrm4DygU8Q1Q==
=Ff1R
-----END PGP SIGNATURE-----

--QPyssLpscz2ovqC5--
