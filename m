Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D3436212E;
	Thu, 26 Feb 2026 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772144100; cv=none; b=LJP0q6Hm4eJ10QHQREhaJl0VO99ZThW4Fv97LwNeeNgyvvVNeqJ1VxlsJLIAa7hY4L+/NbYFcUtkdqIVwHeLR4ozn+Xuj6O76fWcNPLOW5vyrbxmF1/WOM19oSshwVGh732urQA9q5K4zfEGFT3b9SbOv3YWcvOP4iDjWkInqkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772144100; c=relaxed/simple;
	bh=0USga85PMyWwffKigR9cKfgRTa8Xn/K//r4kuhwXRcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1odcu5CdkZHTtuBTke/pLSP7+xnHNmQIZCBgZqztqzE+v31aKB/GfdxEMWTU7XQZz3ygrWuO+HZwy+KR02OegkaCMePp8njhjx534w1R8nlgtEFqewdxjAAvJyg1+AMMMFGZPJETudAptVCX0h4uGxck/MRYx8jTdyK/1YmEGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ww8mjO8f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ww8mjO8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B28C2BC86;
	Thu, 26 Feb 2026 22:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772144099;
	bh=0USga85PMyWwffKigR9cKfgRTa8Xn/K//r4kuhwXRcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ww8mjO8fBabVHljviVM5i0Xs6vrkgX7P424f4oWe25heG/CbV2fuYunwCdK9TgKTS
	 hxWFHVzfBWIinnWmkwB6TnjauCUiTT8nqhq8YvZSWXD8+sfOrykIimE6v1mgij9lIk
	 HHR1jen7orB//2PpyfqIRA271Fb2oYcF7W5OtKw7XbvJ6UrSCFseIOY+6BNCv7o8lj
	 vJr9mWZwVM48AqTQssGpPE/pqygP8qmbhaIP6C+uDnMJ4pL5L48hY5Qx9csWdju5Sy
	 JMEEpnh/Ckj8uNsFfRhTjgJo8muh2fs1to4u1NHOrDpdlUX6WBibvg6YK82FcSZVqP
	 EiptfBqPa284g==
Date: Thu, 26 Feb 2026 22:14:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] regcache: Move HW readback after cache
 initialisation
Message-ID: <0c5bdf5a-459b-4ef8-95cb-3d1c0ad867bb@sirena.org.uk>
References: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
 <20260226135918.381979-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KzpUGS7AJsUbFUqp"
Content-Disposition: inline
In-Reply-To: <20260226135918.381979-2-andriy.shevchenko@linux.intel.com>
X-Cookie: Honk if you love peace and quiet.


--KzpUGS7AJsUbFUqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 02:57:09PM +0100, Andy Shevchenko wrote:

> Make sure that cache is initialised before calling any IO
> using regmap, this makes sure that we won't access NULL or
> invalid pointers in the cache which hasn't been initialised.

> @@ -202,14 +210,6 @@ int regcache_init(struct regmap *map, const struct r=
egmap_config *config)
>  		count =3D regcache_count_cacheable_registers(map);
>  		if (map->cache_bypass)
>  			return 0;

This is in the case where num_reg_defaults_raw !=3D 0 (and we didn't have
any explicit defaults!), it's the only place where count gets set...

> =20
> +	/*
> +	 * Some devices such as PMICs don't have cache defaults,
> +	 * we cope with this by reading back the HW registers and
> +	 * crafting the cache defaults by hand.
> +	 */
> +	ret =3D regcache_hw_init(map, count);
> +	if (ret)
> +		goto err_exit;
> +

=2E..and we now pass count off to regcache_hw_init() which will attempt to
allocate a zero length array and presumably faceplant if that happens.
I don't *think* we should ever hit that case (at least not for a
sensible regmap), but I'm having to think far too hard about the whole
thing to convince myself it's safe.  I think we should keep the counting
of registers to allocate and the decision to call regcache_hw_init()
more joined up.

--KzpUGS7AJsUbFUqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmgxd8ACgkQJNaLcl1U
h9Drhwf/ddkXy07XL6MLYy1xjnSvRGNJwEi4kwOG2pa8kO97SG0bhsUq0mT26v5v
pt7k+mYbtvPv2KGNJVNV8h6Wl5auFW9LVF702OvyAYrNtkWbZtgyMUO5oeafUi5T
Fsx/T8wG3NEcxQ7WYJbn61PCo22MqJGhniteWy8mhPFc0HhRuSyBeINCJWnD2eAu
rtw+GIVapfOsV6ZHSWSlwMu5UiKW1kCi7Wzzgfae7jx9ZGZmbA5DV53JuWHaHqBw
Azl/9yuiZdOdHCIMgWyd0zCesbWDvLwIIiQz/X6qTEAwy6TRWhiRSummJZI2bflI
5Tqi+nE4jAiR0wB7TyxPQvoMs+Rh0w==
=ZuOD
-----END PGP SIGNATURE-----

--KzpUGS7AJsUbFUqp--
