Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675614;
	b=EkzMzzfBEfBmnEUHtVqZCn2AgEvRnMqwxUUHdZoSIUwTqXGhEYnK5PsxGtJNcob79ond
	 pk3Z8ydP3ftLPQjkM4mHud6MNOIxaogObxMaORBNVOgRK93qKAJKbNo42OKnG8pBKxP3I
	 kHOZWFlHC5O+XwmorPdi6UMfaPSdqNOEPZIpC/02sR/L73JkUjLKdN4e2sy/Jb0+RLGl1
	 H2fyOQbGjft4PO7jma3DqnWDFVw1pVkpMvwojffichp4MC1FqjPzOV2d8cqqA4WaZ+jKe
	 jI+VS79eQc0NDQ4yfDOKlql/y471Wfh3FLtKtEjeXz3vLJ9uIpC4HiCFW6OMe1WdLng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675614;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=69HZyYX1PHYpjErDwZXMQF9DIlVgu/jdMJf/ledDTLc=;
	b=0bVly5KtBEa3iIcmb3BMQYlpGrd6ud89krKcH9Srsuck8pcL12IIOxVGjqPjDAh7PGzk
	 OMEQxeA39LiB4wmN1HeL7UPs0+lL7a0s0c36vzlPZn1CU6eWwNdSDJa/RwmaFRo0jn218
	 51pYwQeHmK2oIQguubG96Fuw7H+P8AOgvAO3GriY0OmwxMfLL6DZRoarbYpH/sbALol+n
	 dVSMQAhZ+UBgLXdFtDglG4telVku9tKS7kRFBfqzLiz3BK6fTExu061h1kJ6j23ztIz0s
	 eQW2xw9cThUQUk3NWeyD8K07PHmXis317vznuTmg2OilDnqwOJWFt5GBgaOXRtUg31g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jjXmovxg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD200606A31B;
	Thu, 22 Oct 2026 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jjXmovxg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CAC1F000C2;
	Thu, 22 Oct 2026 13:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792675613;
	bh=69HZyYX1PHYpjErDwZXMQF9DIlVgu/jdMJf/ledDTLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jjXmovxgdrsphJLyOqNDjcPYOMX01IWCYEJ862g+eJqaEllGzzYgnXK2YTFPs42tg
	 oWZy0Ao127dOEc7q6XhxB6uytUtyFy5kwAVBd0HCNVqF+sB8xVpBAcO7vZuvOVF55R
	 T4UGZyCFF7gTz8w0Va5U5AG3jqcxW55qOndWs7spt8b2wARgOeWFAGbNkNPbHoSGkf
	 AH0AXPR6jqaajEeY6cGDk0PcjLOmHwQ89CDq/KwdrtgS3qabMJxEibSrdVF7dq1Y99
	 KSJRHJ/QRvzTqRTRKlLIPE5e3WrM0yGQEivZhn4cG+zhDoVqTBAumTNdyJrvM3dnIM
	 E0s3JXaC8M5zw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 674611D24C6A; Thu, 22 Oct 2026 14:26:51 +0100 (BST)
Date: Thu, 22 Oct 2026 14:26:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v1 1/1] regmap: irq: Get rid of duplicate check in
 regmap_del_irq_chip()
Message-ID: <atoPG1nCj9yF_eEt@sirena.org.uk>
References: <20261021205036.1013622-1-andriy.shevchenko@linux.intel.com>
 <atnFxRi4DSKL2TWr@hovoldconsulting.com>
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
	protocol="application/pgp-signature"; boundary="rejkrCkMiDA7Sr80"
Content-Disposition: inline
In-Reply-To: <atnFxRi4DSKL2TWr@hovoldconsulting.com>
X-Cookie: Whoever dies with the most toys wins.


--rejkrCkMiDA7Sr80
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 10:13:57AM +0200, Johan Hovold wrote:
> On Wed, Oct 21, 2026 at 10:50:35PM +0200, Andy Shevchenko wrote:
> > irq_dispose_mapping() already 0-aware, so there is no need to
> > perform the same test outside of the call. Get rid of duplicate
> > check in regmap_del_irq_chip().

> > -		virq = irq_find_mapping(d->domain, hwirq);
> > -		if (virq)
> > -			irq_dispose_mapping(virq);
> > +		irq_dispose_mapping(irq_find_mapping(d->domain, hwirq));

> This just makes the code less readable, and for no good reason.

Is there intended to be a benefit from the error check?  It seems like a
microopotimisation that just removes robustness from something that
really should not be a hot path.

--rejkrCkMiDA7Sr80
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatoPGwAKCRAv73Ows9A4
idocAP0dyG1KQNO+eed1GSWgHYtOr6NjtfVp345LpR1Wur3XWAEA1Gr2Cd+pHg76
9XNxb5Cn0mYe+C9iyg6NzpR56O2mWws=
=64LF
-----END PGP SIGNATURE-----

--rejkrCkMiDA7Sr80--
