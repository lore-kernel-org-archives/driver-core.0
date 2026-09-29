Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42043DAABB
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 05:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660880; cv=none; b=GEvOUBG9CQDyo8nsDAhQvmJG3sSo6k6KGR5esAuWZOjA4mxtLs5rbkI8RIu7ODklKjklW++C3M9DV789b5oJJdwzIYUgdBmq83yFrA+A026S3MMLSNCl/lDA3w7aPNR0m+A5XhcphQYzO+kXL+OOEH9AZgMg+uhlfjFcHCkA1is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660880; c=relaxed/simple;
	bh=CDuQm5RAa6fP2MiRVZ5uOBH+aWa5eA70HoXFhMlM++0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUJkytVD9PrN6hjkUxeFx4Czqb94h0Lmb5+WFdAYhZIbthaArOWNruaJ5426kH/4c/GLoEDFAGDk6TNb/OmUNujGRzbeiqogY87fOcZE8BCw/iscaSBjnTuQjc5Nzc8cUUSGoif7YWFYrSUTCsybHga7n4LfSYH07ye+GLhp/d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=T4uhGb45; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="T4uhGb45"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so2106582f8f.0
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 22:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790660876; x=1791265676; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JeHGaTR7TjIlYYRqp+6saqTg4D2/subzB+Hz3wyrU48=;
        b=T4uhGb459YVJZrMxI91dC6ee6yLJWiIRJM0QbAknV9bmemusPrZhI138Izn727n8BF
         5X2jACdOh1WS9bbqTyJMuNVYeUDaxDMLQE3PJnNwZ2jXmdBaW9SmhbVgXYPwmZ9GWHC9
         vCi6e7INXMS2bQHn6lYZ1WBSfCGT6W7S43kLiuAK7g5yLeRR6+onTPG985AhMTVAlnX1
         FEzneEslKnKPl0taZKv3G3olRclESlAm8zyprEx48k/mIQdz4B2+UZnH+BQi1qg2i92E
         ewBo15qsPDioJqOJPj2ZeRtFEit4keinypEgdIUTN68xzcfOenyZNQ/1MnPtmPkQoIIu
         mI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660876; x=1791265676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeHGaTR7TjIlYYRqp+6saqTg4D2/subzB+Hz3wyrU48=;
        b=eK6gQlTHyp0iyckSboKUmbk0kUemubTet/ic+fDNLwF8FHL9knvd2KwjmQi0ePFukl
         Huz0DyO8lOuaGVpQRZ47wyGaYa1cwYYypc7fcb2uRMqi51rLEDA9buprd7k0cdyhwEpN
         RlTCmxodHPEO8XoNptzsMl67KHUIqvoDuID+8Lg7tudfWlqWmnd/S4aUDdqtt8dFccOJ
         Vmi9aAkh4DSVFmhs7Ic9yfSkdGATzIuSjiZTsagSa9EjOUVD8OyFnVtaFBttsXB+8Kbd
         R01hevlLPjhmIUGSQzTpQfZZbpVQ4zrS0cG+GEpHS8g7nodhv2lxR+pK1zsQHx9Mxlhy
         U3PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ70WhcC+wTz15zPEEyBm6oWOe5S6JyT4DEcQHhUxK7WbT9lZJsJoR3/nqF4pGfDIV3GmHvGSqq6pi2A==@lists.linux.dev
X-Gm-Message-State: AFuF++nl3gfkEz9/WT/4UjU9UfZzRVWFgwaNradkZ7iAdZyivsPjW4qd
	q5hEDynIeKInVDA5Vvc10lS1at87vMmQrcuL51ZFsMpKFBq5By+N1hRXhnyf+nkGRfY=
X-Gm-Gg: AYBFou1zE3euDNES+wh/mT4Jh1jXhOrPSeFIw7OknFFU3F6K/hQYm4gtO+xenDv4Our
	Lrx34j/E331eMUiJ7sBfc6AI62gKUXo2Z/NW2mZdIzAnnU7/DeBIhGvxpc99h7I8QBhG48wurmO
	N09UXlleO0AzidWOMN7TZ4fmC3iFBNQ/lZyqd7pPh7INhtpT35X/EQGxL4dJoLsIS02a/wpm26e
	vWlF9RaXSbyhodVOe5cwn5iPbOzXbfrN14LEPON4JhKmZPlXxIkpnVaKE8I6qNqbTRW2LirxVQ4
	wWR0BmQM+AbjT0SLYuiieqZM/uaTa0BJ/qIOfETtvQ4b6xXIaIhtNld6HQpyacxrWzzpIzSHQPN
	zfBGgeY9tFbDIQjhf2hULlRJBfmAVyYKXjrR/YiK4ZiMcuvZfnqVNt+LffD8qC6fBs1wm/n1cz6
	tLlb0i8xVEbsAEkO1Ew+/5D+bBe+N/IZWiMlscl5D7OiX2ZcoNcldwWmlsRNoMMyZ9LHWzl2n6+
	2RL
X-Received: by 2002:a05:600c:8719:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fe66c8a5amr268539955e9.7.1790660875688;
        Mon, 28 Sep 2026 22:47:55 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a00cfafa23sm47009155e9.14.2026.09.28.22.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:47:54 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:47:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	Bradley Morgan <brads@mainlining.org>, Thierry Reding <thierry.reding@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] Add TAINT_DRIVER_OVERRIDE for usage of
 driver_override
Message-ID: <artQhFRifzEj-DJd@monoceros>
References: <cover.1790612298.git.u.kleine-koenig@baylibre.com>
 <20260928215127.1811259-1-dakr@kernel.org>
 <DLRA7CWTA1K4.K2BCBX8MBNHQ@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7i4xitnibbpezyka"
Content-Disposition: inline
In-Reply-To: <DLRA7CWTA1K4.K2BCBX8MBNHQ@kernel.org>


--7i4xitnibbpezyka
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v3 0/3] Add TAINT_DRIVER_OVERRIDE for usage of
 driver_override
MIME-Version: 1.0

Hello Danilo,

On Mon, Sep 28, 2026 at 11:53:03PM +0200, Danilo Krummrich wrote:
> On Mon Sep 28, 2026 at 11:51 PM CEST, Danilo Krummrich wrote:
> > On Mon, 28 Sep 2026 18:46:01 +0200, Uwe Kleine-K=F6nig wrote:
> >> [PATCH v3 0/3] Add TAINT_DRIVER_OVERRIDE for usage of driver_override
> >
> > Applied, thanks!
> >
> >   Branch: driver-core-testing
> >   Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/dri=
ver-core.git
> >
> > [1/3] docs: admin-guide: Handle TAINT_FORCED_BIND when parsing /proc/sy=
s/kernel/tainted
> >       commit: f1850e443b0e
> >
> >       [ Fix a typo in the commit message. - Danilo ]

Oh thanks.

> > The patch will appear in the next linux-next integration (typically wit=
hin 24
> > hours on weekdays).
> >
> > The patch is in the driver-core-testing branch and will be promoted to
> > driver-core-next after validation.
>=20
> I've picked this up, as this fix is independent from the rest of the seri=
es.

That's great, I will make sure to base the next respin on top of that.

Best regards
Uwe

--7i4xitnibbpezyka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq7UQYACgkQj4D7WH0S
/k663QgArBi4fVbOIlKZk9jI0WbkAw8kxGQecc/jC1cqoY0MaDRRd1R3MJBHFZGS
MtcolDGw4kwFN2gJDPkqm6wzBYH6gUNJD9K2vN4/pq7O/w8fwGdkql0URAkFP6d8
+bAvFqIlphHEVEkTazLtRTqrb/Lc7j08r8AqAlYfaZj04Z0152PfoIUGvjiWe7vw
AFHstULjtwUOQe6VvJTIjwwec0KJrPkcFMGZRroIi/iC6AYeyH/QIUUyBAK9S2Om
Vfw95aqzvs1k6lsqx866tRlhXwoDW8YvQWWxKyKHM/yktT/Mjqysn0rEtiFJP+Px
w/WI1772ODDDblPFv3khxpm6c03A8A==
=WTJ9
-----END PGP SIGNATURE-----

--7i4xitnibbpezyka--
