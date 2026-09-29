Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0573E5A0F
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661211; cv=none; b=i7rtsRMkC8k4FRcvbnkNdyPLcsQj5TNl2GnvS59jvOlxHOeVHt8sTunsJMts/H4Tkej9M2hg4uX3hUnIjxq/zOc41u/WdMwDZX+Cra+QKCvMHBf9b+EKYQZ2Ux/O18msKHkwIPhG8wT3Vfq7vKJB1COOO2aif2+T9GIdgSM0gCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661211; c=relaxed/simple;
	bh=ngp0Z71bP8R1r8qPJz7GJYV+9s7Y/H9eYdP6lvbeJRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJgRUxfIL8n7z0zJHArGiViKrqYm04bDvTg4KvRodlFAefdjI1cV84EPFXvg7YUETQkt4vFd0JhyjLce474DXKpfu7B2kdcSYLyMEiaDzpLG3LDz0x5c/9GbCzBdaVCYyx9mKkjxmvGhvLXIPKPaEMLXMyNiIpQ4S2TLlwK0b7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PKVJ9Gr9; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PKVJ9Gr9"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so1361523f8f.1
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 22:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790661207; x=1791266007; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ngp0Z71bP8R1r8qPJz7GJYV+9s7Y/H9eYdP6lvbeJRY=;
        b=PKVJ9Gr9ELRuQAMFOssXGBjlyCkvgyXMBmRDY/xBlAoMM4JvSUzhtYAY1dZprs6NQh
         kUP0tlraxpsUJhdxBX1u/82OVHk0Uzys7zDLlvwl53MdzdwtYtxuFFBhF1Wp1qQJ2lEQ
         VI/DG1CqOhp2jPJxz2KWW0+a6BK5R8U2PmIgdE0yaj0Pk/0uvPdwb1ZOUyqXyKo6DVzA
         zrU3dd9sa8Y7K/VyxXb5YaWzruKJtaUzCRPgCxtMRIWk0BEjaErdgR2Zq/g8ibOm8rnw
         ni7AOJfM+/NjdzixpDumgciR3mNIciJxXB7Xin54fmvFq2TAJY2LCWAzHoGbHD4+SeUA
         B/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661207; x=1791266007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngp0Z71bP8R1r8qPJz7GJYV+9s7Y/H9eYdP6lvbeJRY=;
        b=0+/qrd3aIBM6Pbi8Ch2COM/acLLiVjNgMOXTRNcJbq+I3ECmgRplRBYV7JfWwwAQKD
         38PU95l2yM0oqdcV+5PeEb1WjhIdax0oo6VuADLjvVVwt6f3D1/b2NiPlHuGdrzy7n6X
         X1j+NQQIZosf458jdd34KZNBiPagvT+UkQKiKzdariH4yQV46YS1fCJ5GPf2NGRevzJR
         wVQn8RhXEOK7mm/5usODAtS7ulB/bAWOQwdoX/Uw1ZtMUMLNj8ZqlH5Tx0BIy7estAG9
         5xcjhmcBnkkEewJNB9QbHKEypQGZ8GHSc8nVvO7kdGsj3bZBMZV3phfMlQe74bFI5S4f
         aYdg==
X-Forwarded-Encrypted: i=1; AKwUvBxMonkMJyqSvukgX0DA/iydvn8DPqxK2oeb7ThLogsKYbI59q4wWHRhNgDdf5a2aLBk1xnqAnoZPkWujw==@lists.linux.dev
X-Gm-Message-State: AFuF++mTySVcwct64llLooQUU0Wm43EEnXrv87tW7sqNqQcTDUOqkkFJ
	PwUkvtr6qd0wGK8ITHIeKp99re7JGyGIHJTJTd4ERLp3cICBTcscTdfhyqGEtO95or4=
X-Gm-Gg: AYBFou2aQLt4u2TgvLMOhc3UQgwbLkN/cTcanX+V7YkAJ1qPF12yPJWt3/sKbYmXaK0
	rKeA4+VwrsAJL5OgwzA2jJ3KAjiofU7xoOCnW4rW5lLPG3ZkuAwdlMJG5sOng7NEm17ru9tdMJE
	yA+YuVD4hhG8/WXxBSQ9FstLRrQYaSmvsScPRvyKIwvOWe7X9DMKg321X0c8gVA4lb/yqNxCc7e
	Xv+yQ8ETQs/ZYf249SdWBaFEFnlTZHbk4W01RXbtM5y9LAKDFqfXj1HjvwemMb4y+z96Z+Pk/nk
	TRrhu7qs0QbY58q72xqW4jj/ApDbJFS8HlGKVWOqAjZ7zlKAIC8R9fhc9cOiX4E8WT3+6RrQxTN
	9+2QHQNStTfT603WN6otfU38Nw6ePZoRQfeAZHI0L1S9twqar2ymrrSGR3LUMlTD2qVFAgzYZVs
	nc7gqtpksH9QXbMLamumFKTcgk80U/mZyfpzEVOPbNJhQTTJBCjm0UWzVEWDvyfsLea67l7XlOv
	xk=
X-Received: by 2002:a05:600c:1daa:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a00ec54708mr13164425e9.0.1790661207369;
        Mon, 28 Sep 2026 22:53:27 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a00d10bb26sm36434675e9.0.2026.09.28.22.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:53:25 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:53:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	Bradley Morgan <brads@mainlining.org>, Thierry Reding <thierry.reding@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add TAINT_DRIVER_OVERRIDE for usage of
 driver_override
Message-ID: <artRKXU0jygdcxx3@monoceros>
References: <cover.1790612298.git.u.kleine-koenig@baylibre.com>
 <DLR4AMFM8QZ2.36R6G0LD9D53Q@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmkyuzojfuhp3rl4"
Content-Disposition: inline
In-Reply-To: <DLR4AMFM8QZ2.36R6G0LD9D53Q@kernel.org>


--nmkyuzojfuhp3rl4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/3] Add TAINT_DRIVER_OVERRIDE for usage of
 driver_override
MIME-Version: 1.0

On Mon, Sep 28, 2026 at 07:15:12PM +0200, Danilo Krummrich wrote:
> On Mon Sep 28, 2026 at 6:46 PM CEST, Uwe Kleine-K=F6nig wrote:
> > Note that different to Danilo's suggestion I don't differentiate between
> > driver_overrides setup in userspace and those setup in kernel space.
> > IMHO all are bad and there are alternatives for the legitimate cases.
>=20
> I agree that the implementation - i.e. (ab)using driver override - the af=
fected
> subsystems have chosen is wrong.
>=20
> But, there is a difference between picking the wrong implementation and b=
eing
> semantically wrong to a point that we need to taint the kernel.
>=20
> So, yes this should be cleaned up, but we should not taint the kernel for
> otherwise correct code. Otherwise we could as well taint the kernel for e=
very
> other abuse of an API.

My position on that is: Do the global change now and help the subsystems
to clean up the mess. In my experice waiting with changes until all
affected parties are smooth with it is a recipe for failure.

> > I think applying this complete patch set and keeping fcbfaffee51a ("dri=
ver
> > core: add TAINT_FORCED_BIND for when userspace manually messes with dev=
ices and
> > drivers") is too much, so this series serves mainly as discussion groun=
d for
> > choosing a sane way to prevent fuzzing results of only mild interest an=
d stop
> > patch sets harding drivers for driver_override handling.
> > My preference would be to revert (or drop) fcbfaffee51a and then only
> > apply patch #3. Maybe also keep patch #2 to taint if
> > "allow_driver_override" is provided.
>=20
> Agreed, but as mentioned in [1], I think it is also reasonable to only ke=
ep
> TAINT_FORCED_BIND for buses that do not support hotplug in the first plac=
e.
>=20
> [1] https://lore.kernel.org/driver-core/DLIL9H50MALI.3JROXYEEUM3KU@kernel=
=2Eorg/

Fine for me, that would mean to apply the whole series and restrict
TAINT_FORCED_BIND to "static" busses.

Best regards
Uwe

--nmkyuzojfuhp3rl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq7UlEACgkQj4D7WH0S
/k5Ltgf/VeTTEIetbw5CxkvMrdNO+abbUIbuqST/lOMuzUIceHqJNYOIMDMmyjkw
xj1U7U4uEbm/xPTPwPmeqmAaW5N0yLxTw8aM+N+/c8aZF9BAGIVB5oZxmKMYC9Ui
vcvs4rDvokk3GKxvKaRagr8oxD4JjNWAJY+6aO4DpcWQGcYdLDoSThTsQkZeiU3h
tF6qBM90NoLUwVRpYsAWplhY6UYcspHYpQqZGlHnTXZRXPQ3aw13N/I75qi4YYzk
0zKiyYJt+1rsujTnSL5iMOjcCdYWjhq42qsmSdalfBhWdn4USszYLkdP+SiftCN4
WKQQxD58vg8NQh3dgBjs7fQRXgFy3Q==
=Igh3
-----END PGP SIGNATURE-----

--nmkyuzojfuhp3rl4--
