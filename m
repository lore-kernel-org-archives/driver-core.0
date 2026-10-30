Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355174;
	b=ILBXejAIYMrvKfqfvKNProfvkNpJsZj7cDOsbvI1SIa92eSjjfWMDrFKGupsq9gxDDV3
	 SGWFCxoiWdEdzQ5zMV2TLKWI11E7LCCK0ZX/xxL8LhVxRO497VOZqia5HprJpWdaLKHx9
	 cYzwr5Q+u7lXuj7m6HFZD2+Hd2tmGk6hhh57kHlipRphvAepV/LNxR5g50+psgzQBtxUJ
	 5QzCqNof6zA5uqoIjsZJYghtOhoioAQvWd2ALI5a8CtXZ/eDCodS8nh+vMTtbnDlHcel3
	 ds4yrrsA/w0LsssNJd5dkz+cC4CEueI3mXesZ474LKbjt1VHKzvPS51nUeaZGhek2SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4tYDtJid68SRru4uZjKZRvvAoXLCMBoY5roZrQvhHKY=;
	b=vLq5u2LQUEBV5Sdd3IDAkZpfHo5nOU2DPfU8Iqm3CXZ42SY5eq1iTtvvv9O77iLS/CFS
	 EWWQm3otjSNSCg1xL7Vr9HI9iVKijg1yu0t6g7ZQdcxHmGpx8CALSz8l4/v/qUNz7/jJc
	 RB5hZoP/eZL1HkiRUG50T9PIrD6xLFrxqe8I3CEEZo49xlRG+aardwuvFZAHh5W206m5a
	 JhohtX/ioaL7yhuNw4t/CMPKkXiFJ+U1TEOscXycJnJtOlWYaJgRxklimTqfkVAI9RBjo
	 zhGPxfJv7+v5mdwzR6yJjX+SmwfBj/v2lU1oka2GcBzqrouAZKLx2c5z6/TtgpgsScg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YDUaqGMz;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23709606A31D
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 10:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23709606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YDUaqGMz
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so4723805e9.1
        for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793355171; x=1793959971; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4tYDtJid68SRru4uZjKZRvvAoXLCMBoY5roZrQvhHKY=;
        b=YDUaqGMznBLUlbZ0I8aeb1qzzO5TDSLSRVi6/eQo9iIwapZWZKE4hqeoLagA5GVSRw
         RGLgQ9/KAYUjIAaNKqMPnp/stge4VhGHZOo3YtkVjknifsduEkwa7oPsKsYny6WUhVq4
         iulz6PUcQJ/bl0kCiUBXMVe6ieLy244QzpAtrFh9H/97U5l3R3Ttj1gAbCRdd23jrKRJ
         wSoVQfRQgy7/03v5hulwXZQg+az2pKq0UU9LwI4FbKhsDz50dusGZPVwcCo0l8QxntjX
         A1SkRx3vCmBk8jzVGxNOOK0b8uyHIXdnSzeV0FwgJCHhYAepIZEYPon2ex8tma7Yc+/L
         ZuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355171; x=1793959971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tYDtJid68SRru4uZjKZRvvAoXLCMBoY5roZrQvhHKY=;
        b=sV7ibhBiQrtRuPAWU+0K6zn3SZNIlj/Kex3J7Mn9zAgXiLTjYw8GsOcpf3uhdvuwVL
         M3y5vTAUN45lJ4Gj1kTeQFBmYueo31Frrp9cOeoJoGBZkPIdC9aQqjzhrqrc7siGK3bI
         F+YOq7BnPqZcELAa0cvD2BdGp1RXy2FRo+N98evObz2YZ3BJ5P4nI2ZzxOBYlKP5gfXN
         UhuqQq14n6TV4AE5LK8Rl4JsHvr7ROl+8qG50uQItsWiijLU2PTznHw+GXY2bdEpYLXY
         T2PvElEQN7Tp3brbrP/UI/ppH7jAFBsCJJXNHyDIMYBfbI3kA9xhB11d5k97PYbwkFma
         KzYQ==
X-Forwarded-Encrypted: i=1; AKwUvByIPGp8E3v4Uzg2aFLx9duMrLYRv+0smMxRIoWwQInZlI0XxxLX69kWvz1Xk9In6JhSHeD3+/hExhUpXQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKRMDktAEnl0CHBN+rQQ5PLax1ZXnYHzukWqMGNqRSYbMJM2j0U
	DtVrQkCYt+ltyjVeuwsKUZoy8KlQLklZ7TOJd3dwAy2XvAYRzgsm01w53CxIF0DHZXk=
X-Gm-Gg: AYBFou1RAEMGNoSeX+LEWlVSAnU8PnawbqVD4I3RL/5XSBj+1VVn0VaAE09mB/4+BL+
	Txx8h0ljMALPiI5DrGe0eJJCnExr0XvmF+wafbM4bS1GzMU8ItIAY8V6nyeKjrB5UdZzfnaUOM2
	IHnPosMic2wlgIP1YI3Max95ytSyhW7hSz8Zi7nnrIIMQDUurFld1r4pglYREXGfBS9pnXdfvjF
	M5x1dFBZf8xIPRnVR1uXR63p6T0l+BdkgoWYHdpvNMWOKlEULTOBqZpgYthYJ1oxyLfNl2u0Acm
	G9Obm0PBbNy969i8XYF5QvbW1B3zFqzqXso/HSfYVdCPqJuv2/pLcnVsbzC71XlwHJBmku+hCxy
	fFAbJAXIe5qhCDVfgx+vFOupDTJboKICuBiZklRkF4c5NjUMMm4THDtRnFbl0H8eUhIjukhVrlg
	dNc4vSceKNanOIirJaNk4XE+vXNJtHCr+fAI4K53xOBztEbWeL8vxOCIitt1TdZT68fDrvoeiwT
	a/t1KQVxRjszOGja4hYw9fnGaaNKtbqfQ03Q9u/6ocD2HrQnpm75WJ+aBHMoPrhEqDjtjJ0HBYL
	nJao1fRwwj5h8kQRCmftV1FYKoQlL2mvs++agANNpZROLdrcKUy3BiHSC0MbJpu2iqbaN5JN+y+
	MlYnUmPFrnGRRIguw
X-Received: by 2002:a05:600c:3f06:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ac181e75c2mr35620425e9.13.1793355171498;
        Fri, 30 Oct 2026 03:12:51 -0700 (PDT)
Received: from localhost (p200300f65f19a904f4ce339f1421d16f.dip0.t-ipconnect.de. [2003:f6:5f19:a904:f4ce:339f:1421:d16f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4abf5b27e46sm80092625e9.3.2026.10.30.03.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:12:50 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:12:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] Revert "driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers"
Message-ID: <auRs-6y8ox4EWDcS@monoceros>
References: <20261028-bind_taint-revert-v1-1-7c6b9cef30c9@linuxfoundation.org>
 <auODHyLrfQylISX2@monoceros>
 <DMHL9O0EWLKU.3F47YHYEGNURK@kernel.org>
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
	protocol="application/pgp-signature"; boundary="p3i3dqzye2ignvny"
Content-Disposition: inline
In-Reply-To: <DMHL9O0EWLKU.3F47YHYEGNURK@kernel.org>


--p3i3dqzye2ignvny
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers"
MIME-Version: 1.0

Hello Danilo,

On Thu, Oct 29, 2026 at 09:02:35PM +0100, Danilo Krummrich wrote:
> On Thu Oct 29, 2026 at 6:39 PM CET, Uwe Kleine-K=F6nig wrote:
> > It's not part of commit fcbfaffee51a452cc8efcbaa3b88ec4595678424, but
> > conceptually we need=20
> >
> > diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentat=
ion/admin-guide/tainted-kernels.rst
> > index 3d312bc17942..fcb8b9734548 100644
> > --- a/Documentation/admin-guide/tainted-kernels.rst
> > +++ b/Documentation/admin-guide/tainted-kernels.rst
> > @@ -74,7 +74,7 @@ a particular type of taint. It's best to leave that t=
o the aforementioned
> >  script, but if you need something quick you can use this shell command=
 to check
> >  which bits are set::
> > =20
> > -	$ for i in $(seq 0 20); do echo $i $(($(cat /proc/sys/kernel/tainted)=
>>$i&1));done
> > +	$ for i in $(seq 0 19); do echo $i $(($(cat /proc/sys/kernel/tainted)=
>>$i&1));done
> > =20
> >  Table for decoding tainted state
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > in this change which was fixed in commit f1850e443b0e ("docs:
> > admin-guide: Handle TAINT_FORCED_BIND when parsing
> > /proc/sys/kernel/tainted"), but that commit shouldn't be reverted as it
> > contains a simplification that we should keep.
>=20
> Fixed it up, thanks!

Thanks. Looking at a287f97d4256b5f5527f5b5a54f8ada55e1482c7:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

(just in case you're still willing to rewrite the commit for adding
that).

Best regards
Uwe

--p3i3dqzye2ignvny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrkbZ4ACgkQj4D7WH0S
/k5H6QgAjdChEcwuB16UGAH94yVcVY96eqaJTIs2lSSXrN5mF/j8+wojtf6d88zs
DBUdsIkALsB6jIBpNQ6JVgKn85jEDmiUoaOryV/lU68VYYkeS/s7FVQFvj8YEef9
iOdBZr5OwsHxvvrecVFcd1psXr8oXFYra6CYHs8Z0Cv5JXqt3DLxWjLtAgc0TVTj
hPLgALy7vx5AGw5S+Al5GMGlvCDk1ZgDTtxIWx4CUWAEPXMMwXVe0GO+0LHSqam6
/oVmyhz56OyzkBvx1Y71mPtZ1CMB8jSWENEn7ouZN0clusKo8yTdsCBwCMnNDJR7
6T5dYqDGih58q0J2wYKJqB06kpwLlw==
=ViXi
-----END PGP SIGNATURE-----

--p3i3dqzye2ignvny--
