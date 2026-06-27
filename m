Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35226F289
	for <driver-core@lists.linux.dev>; Sat, 27 Jun 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782575420; cv=none; b=VU9itHMDq4dsZRlAMMUgoQm4NiAAKTBdYWKBFYqbhjplWkXahVnN2MIrenOipdmsrC3SnZrezmi1yPYsLpZ0Amw14a1STSVTBPdMS+0bwF/fSZ1GYZyB+f2hZdtKaQf7bvIxq3bctdDRW7OODFaQR9//Mxd5vw9rIr9+dHcSRGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782575420; c=relaxed/simple;
	bh=9GxMEUDo4N35h7IsRta1+WofgOVFkeky5QiXcV/Iumo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuULQlZd8o7ShzAwLepMn+A47frd8WV/3trnLAKB/8CKr2j7q4ixpwI12P8bMG9Gl64cCdKAUqlsgmJe3S2xEqPQnmmPEdCAxf6+8aWP1sHue1PNCJg8fjIL0KkZWDQnm/i+JvygNqKKIJh3a1tHZVhAslH8R4sxvBjdsxv7734=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SNE/nuew; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SNE/nuew"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4926fe5be4bso11257735e9.0
        for <driver-core@lists.linux.dev>; Sat, 27 Jun 2026 08:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782575417; x=1783180217; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GxMEUDo4N35h7IsRta1+WofgOVFkeky5QiXcV/Iumo=;
        b=SNE/nuewYN28X/mbe/d82T0OnrBV4SB83YnvF5oLhU4RdbKmYXWF9JXkCTTSkTrzZ5
         YzKdaTQciLE2Hyd4qbO1KUJDQiPqRcNOs69Aiz6ZMI8kjFvEB74Db2dOvMkVuZywTXdP
         mntyMigkYZURi0wydUhI5NYXm2VSUnOZmzTGGIvdFV+S97WhlrxFh8cvmUtWCqTn1QjI
         O+YxreXSwqDggc5MxOPQLHejgscD+PHe5r1VkvR21UU0OvCIcNVOrICLlrqQNECcixti
         evSJg80k+3g1bZEpULvqTHcFYpoluWs7vij6jcf/9O/Sk+YdSN1wNCXuZ/0K6Ia5+pAA
         tJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782575417; x=1783180217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GxMEUDo4N35h7IsRta1+WofgOVFkeky5QiXcV/Iumo=;
        b=oBPFD61HmacZAG2ZH7njXNgkFaONn3tLBDdGcfcSFVX4rDf0MddohsWgZ0BQbGdlvZ
         rBkv84oS6/viJz+06bIk3cQcmtb2PuUHSs6Sh8masgwPOsVjMJVbW3pvfFCK/RQHo1cO
         AhB0d54kU9gUCNVzvCOjO2xpi18FTSKNT4O4V/4FoYF1TR5OkGmyXJm+SgtSvg8Pfcib
         Oe1vX4ilxhqQK5I4lFf5imCo7LBGl05uIQGuLxxYSvGafQE3TRGOgT9Uo414uTJXSOvZ
         ZlTPfXZaclrtUdcMZRCKHm2xsBQlNeKy0t2a8JTYT63JLBmfEe2mobmF0v6mbhg2iZZU
         O12A==
X-Forwarded-Encrypted: i=1; AFNElJ8BTcZBt2yzs0dvQebqPUFlbBQx3Z6WnCompUG2U1p2AToPXDT9n0b1xNTgssJaLAoPu1ofEgVlRWdRfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAayfTTadmL9C+RROMawc5lg3QRM30VkpkpwnWoHNwfEhluds1
	Pm8ErVbdWOIQxJVm4+JG9yWwJQFDMTUKw7W6J6oUQn1nwr7V5N4jFXdtAoVjelBCT/k=
X-Gm-Gg: AfdE7cnumqYGRBqb6oK8y6hkIPQ7CzEE4EovIJdH7vIZj8xw2E/MQYbV4SnkTvNyQQc
	Q7g6KMiNJdNNzfmsHj8KovrApuqBa2f8ZfBzfWj0W1A/e67GBRE0r8LxLV6iQ6PVjDPqMz9wrOC
	7YWYlRVVIkBPGXOT7Rvh5JnayQscpGtwsxyk2aqap636qjT1uPl6n92SZ9iEnhd0ZF/ZQo7EDRU
	D6gNJt0UUB8TcZ3gXYcw1pDE2SidxDio4JIYZFQKtDiytIByUYs9Tqzx3l+LINx+8eDAi01qTZF
	+vq12RBQgvQFoiVdp5LJioQ7d8kUhkrWpooYZRlERopLldPG6G9YNboSBLkwmKSy9p0HTHxV62g
	adudtAVstshvUJJLder2xFg8O/BGoLxg0pNskxyuPGreMy6Ziv1/sm30xvt0x4ALk4Yx0yeQbiO
	QqGHaEMYnWRk0PGBghrQ==
X-Received: by 2002:a05:600c:83c9:b0:492:379c:32ee with SMTP id 5b1f17b1804b1-4926fc2f61dmr81704435e9.6.1782575416576;
        Sat, 27 Jun 2026 08:50:16 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c285fc1sm103214375e9.1.2026.06.27.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 08:50:15 -0700 (PDT)
Date: Sat, 27 Jun 2026 17:50:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/17] driver: core: Include headers for
 acpi_device_id and of_device_id for struct device_driver
Message-ID: <aj_wwOo8zuYVlhxn@monoceros>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
 <976ec5b0529016d63ca3cadf8792f7b2324ab58b.1782490566.git.u.kleine-koenig@baylibre.com>
 <CAHk-=whM6kwmSXnD-9pcSNLzvZLFyzXzdm08NuEr-ZH8WxQKPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gtxxclcmvvz7edjw"
Content-Disposition: inline
In-Reply-To: <CAHk-=whM6kwmSXnD-9pcSNLzvZLFyzXzdm08NuEr-ZH8WxQKPQ@mail.gmail.com>


--gtxxclcmvvz7edjw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/17] driver: core: Include headers for
 acpi_device_id and of_device_id for struct device_driver
MIME-Version: 1.0

Hello Linus,

On Fri, Jun 26, 2026 at 11:30:34AM -0700, Linus Torvalds wrote:
> Ok, looking at these patches, I realize that I hate the pathname.
>=20
> On Fri, 26 Jun 2026 at 11:01, Uwe Kleine-K=F6nig (The Capable Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > +#include <linux/mod_device_id/acpi.h>
> > +#include <linux/mod_device_id/of.h>
>=20
> Honestly, that "mod_" part of the path name makes no sense to me.
>=20
> Yes, it came from the old header name "mod_devicetable.h", and yes, it
> comes from the fact that the device ID structures are also used for
> module loading rules. So there's a historical reason for the "mod",
> but I don't think it's a particularly good reason, and not a reason to
> keep it.
>=20
> None of the structures are called that - they are just called
> "xyz_device_id", and while module loading may be *one* of the uses for
> it, it certainly isn't the only one - or even the main one. Arguably a
> much bigger reason for those device ids tend to be all the bus
> matching code (ie acpi_match_device() and friends).
>=20
> So let's just get rid of the "mod" part from the name, ok?

Full ack. I already dropped it in my local tree. I won't resent for that
change now and assume Greg's acks still apply. It will be part of v3
that I intend to send after you cut -rc1.

Thanks
Uwe

--gtxxclcmvvz7edjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo/8TIACgkQj4D7WH0S
/k5ZwQgAgml+si/0zMfftNdtNUsXXV4e9JR4VV92MuErycywxWp0BgJdcIjCLySV
TmUcggh6INLQDNj/g1QCRNfpU1NG20FM1I3Hr3gOTO7socHjSrKoA8xMfAN0JqF8
qYmSWQzhC8ItsdOyBDwnGplvZNxzFZ9C6VMANcUbR0JVI4OzEgz7/gbgnz18Bc8W
UbQ6byfOsPCINLfXoVBgM/VFCj3meX35dDFkAyM4/N4AOLLLKjIkbkWduAy5TIfi
jrj5+yHVppCYKmCuKBVTVij9om9bARXEX31SvDDSFO7uCRdY+GshLbF9BZ8PtUSV
YPTQcpscLUPO+ZcnmR+rip4knaSiMg==
=uIqW
-----END PGP SIGNATURE-----

--gtxxclcmvvz7edjw--
