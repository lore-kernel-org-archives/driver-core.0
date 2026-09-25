Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB413C2790
	for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368116; cv=none; b=f9VC0BOLU2VcVwPI/PL8boPcb6d2TjpSqbMvwmjzecAUutpzTWzwyZ6P7YMWCNEOk4UWUfzRtURQsOzASC6k2fLNZCcBTdLP+AFlTemtnCO2w9hfc0x5DnYWQjmRMfsr05R4R964GIqANbxiHfnDfBdAAaOMxEssD2SZ37U/Hd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368116; c=relaxed/simple;
	bh=OISNyxqYsyIJjvZpwj+5Ey+JOQREWF6pIQkZttrSuig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4m5Am8LfcxmOcwCZLzteDC9ScYmCGXw/GcwqI0MTEuUGFGzwRef5IIfGluLZFcb2GucIqFtiYwzR7bRo2nkklaXqGfXNYnpUMQMIkvSJKezVgu60FwR0GzG6jOZIL9OI8OwTTSDNDUPXHgGCk2vxI0eor8MAirJWKWZ2LHXb0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iTyM7YCq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iTyM7YCq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso9357465e9.2
        for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790368112; x=1790972912; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MPkKdQ6kZcjzNVQGvFMHY0E0nhE5dpwirKpR+Cx91W8=;
        b=iTyM7YCquriB0RA1GBIPsaRvBKqssNA9wMbXSQ7Y9wCpKUPR1brXy85lgPa+872KA3
         VlbRAkv6HODrb0JMNi2J0lN/TpJ1v0/rwWvdRynhOgfO9+HR7ZuizJCwUfHUT6H8znvM
         7xKdi6QaKx5D/ydZpADXMdeKgexJwlYIBG/QRe1QLzwtVrGQX1Caz4nzNajV+dUoZ1Rt
         8GTHfIevzpemPGfJvlALw95RksBRPEJrZG2Z2NAVtL8Sn6M//L7maABsHdj8BITSTHEg
         N6MIYhNms4IuGep8wEYfjBqkvgQsBkTqV9pdLa59PLg/2cEiP6/TtFvbGd80l1F747t1
         /xQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790368112; x=1790972912;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPkKdQ6kZcjzNVQGvFMHY0E0nhE5dpwirKpR+Cx91W8=;
        b=gnQILE4txTIF/na4R0dwSWcpqnT0QisytRgT/0kPPHBfSoyUtkEQVqbOgSzCopJS9g
         qKIFgaXEotbmHiWf/NFMrWvJuTnNYrt4/VldIP7d10lVpaSX4cPpc2hIkDryMaYLGZQt
         w/yR87OZvtjlPxc3MgN6p++Q474A/qDxyOLt+7U+2atKY5liBlZtngOKDpViztCG021B
         eWhOApqbim+5UNxDeRJUF1qppzWzhmNPSaxSjGYhAH4nFX5M6yQYoxn5AonExujKs6lA
         1X0dDdm4BsfBFnU53gTB2aNWM6f5XIZNtCUJdyuRhSxmcWBNnn88AopZRLa5ZAOqG2CG
         9L2w==
X-Forwarded-Encrypted: i=1; AKwUvBwV1NMM29ioxdLp8YG4c9toX3looBiAqsYVfZmEQolhaaI1w5XiJzOs2noVpgQSZNcXKnLQ5NHMe27QqA==@lists.linux.dev
X-Gm-Message-State: AFuF++kWlXx3B73ex9StqxgomJ2l0cr75kjZlC7jCEYiAqoToNsuGBEX
	pu82GJV8W4UOu0/KmOTR2cOS8q2I1R1B3hlcE7DJbrelv1vC1e2B2HlSFaMFMHERcMs=
X-Gm-Gg: AYBFou19i5dHoNQ4h9PQLwKq7xxaFvjigrZpCz0fukXJh+HoYW5QkUk2cCaVorTOgEI
	FDwo4DoO99fw7kpPkOr4iXLpxFbF9MlPwgF8svK8OTI3iDqICshPYC3gX+0pLjHij6kfz9Duq1W
	tqizhYk1Hf1GFYIz5uY2VgezeNdvJx4D0qxLrEqCw8NuS87GFduAVRPBJPnZ2vnYEn5qGSmmo3J
	GAFhHtUHOko1ONh3jfj5usaadq8t7eObhyHRj+C1eKfBW8fbjlSgZ3M/H9NzQtqLK3suYiyTqKo
	8LCoyFJcMtsNwE4telJ9a9/rsEz9aoGRaV+NDebhyw5wcG8YAHGUYLHOp7M5YCm9QA8LzegSlYP
	TsqfC8aoFEmcLi8DESYYgKBnhgJJ7mFiut3/6NHOWc3cPK2uC9d2QpeNemZT+5tIaj3jjQWxGTr
	UmNCQ6hfWPOradPq8JYxUMSKIf/F22vnSgjc/fbqfvHgl6vuD/TuebnCfIvR8mbXTrli2ymlKpR
	TU=
X-Received: by 2002:a05:600c:310b:b0:49d:34:420d with SMTP id 5b1f17b1804b1-49fe66f3e61mr119387075e9.20.1790368112077;
        Fri, 25 Sep 2026 13:28:32 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fe5ce4941sm172649185e9.6.2026.09.25.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:28:31 -0700 (PDT)
Date: Fri, 25 Sep 2026 22:28:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	Bradley Morgan <brads@mainlining.org>, Danilo Krummrich <dakr@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] Add TAINT_DRIVER_OVERRIDE for usage of driver_override
Message-ID: <arbYJUnMkb8Mqbam@monoceros>
References: <20260925182041.1025371-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hfoj37cw2gi5ppmu"
Content-Disposition: inline
In-Reply-To: <20260925182041.1025371-2-u.kleine-koenig@baylibre.com>


--hfoj37cw2gi5ppmu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Add TAINT_DRIVER_OVERRIDE for usage of driver_override
MIME-Version: 1.0

Hello David,

On Fri, Sep 25, 2026 at 08:20:40PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Commit fcbfaffee51a ("driver core: add TAINT_FORCED_BIND for when
> userspace manually messes with devices and drivers") introduced a taint
> for usage of bind/unbind sysfs files that manually trigger driver probe
> and remove respectively.
>=20
> For drivers that do their resource management correctly (which is also
> needed for module unloading) bind and unbind for matching devices are
> not critical operations. The thing that makes bind and unbind unsafe is
> that drivers can be forced on devices that originally don't match using
> driver_override. The result is that e.g. of_device_get_match_data()
> returns NULL despite all .of_match_table entries having a non-NULL
> .driver_data member which yields a NULL pointer exception for several
> drivers. And given that after setting a driver_override a manual bind is
> only one way a driver can be bound to an unexpected device, a separate
> taint for such an override is justified.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Sashiko found an issue in the oneline shell script, I fixed that in a
separate commit because it wasn't introduced in my patch.

Also I violated my own rule not to send patches directly before calling
it a day and so missed to squash in the build fix that Sashiko also
found =F0=9F=A4=A6.

I wait a bit before sending a v2, but if you want to take a glimpse
already on the changes I did, look at

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git driver_=
override-taint

Best regards
Uwe

--hfoj37cw2gi5ppmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq22WsACgkQj4D7WH0S
/k5wzwf/e+nKnBHFLEFkk8qt+OAiFap0dlTSMlJIBcnEpsrNDid/nI94lQcq4oyj
ow4CxnbcvYgscNLOSwlp6XaZDAcH+N0m/0E9fQSznntmfxsavFPBfFKeH7shsZUl
j2h7EDIaeVeYlTJE8wnTFqikllHmPKDly6zSCpa5vBcescFkj1XM6bsTTLawx/gU
g+waIeksx5QOyDFRbGmFZUa3wIhy+atcDO7Zn2nzh6dTkJve7XEsZ81+L2t48Dqw
TjrzRUXsAdR/R3YBn7//ejzDmLmJONXcLvdi91fgDpmDOsxlR2byDQyBba9Z5kiJ
GIkxzJVpscvwynkkeVZdv+EtSgGJ8w==
=PGxC
-----END PGP SIGNATURE-----

--hfoj37cw2gi5ppmu--
