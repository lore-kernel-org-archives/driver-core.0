Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6E537AA95
	for <driver-core@lists.linux.dev>; Tue, 19 May 2026 19:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217338; cv=none; b=UqgkmEuAdYcxyvGnFOY4b6GIM6tZG0KLOxry+l2pM1zXSE9NvhKzwqHz6M+x+3atzKnN8GgW1jwwBh6CrLHfsp7ntgrfpCZHmWst1ureC1eOnlRteqnmUeRwfTElSf0tW7MxPpGv0yeXDxoFO2Kl7AVqgd7UjzsCur1K4dKec1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217338; c=relaxed/simple;
	bh=k0U0SPErPKCW9LWawSkKTcXgFGdc7H4m2CUvw8GQtis=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8tEzb/E+pHD2QJ+avpqmcufq4nUMszfB1lTwUiLkArvDkvX9RRDiWqCZHEXuyh6uDc6Kdt0Tq/I4jj/Yg1q9WNU42r6aYIYnNDFGjnIwPdAmhVdKhq5URFlEoOYEm0W/P8io8HPDg2Ov4Idues04AxzFDd0sChuekESgEU3A2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G15pZRrA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G15pZRrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779217336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0U0SPErPKCW9LWawSkKTcXgFGdc7H4m2CUvw8GQtis=;
	b=G15pZRrAmm/GYWygQuao36aQPPrj/gNJSGGzetAzUUD1PLMQ5eYGIijfWCpk4cj5GXLxWk
	TJJ9xwG6IIwLOmXbK5OHbyWdJvjdqweHHiquZ8c/oW0P2Fu/+l+m/DQJAohin9UpO/RnjW
	CrvDanSlLhNkzNGWrsW6fqSnBlHzO7U=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-_WkiBGRpMoasGnwOwvJ5WA-1; Tue, 19 May 2026 15:02:14 -0400
X-MC-Unique: _WkiBGRpMoasGnwOwvJ5WA-1
X-Mimecast-MFC-AGG-ID: _WkiBGRpMoasGnwOwvJ5WA_1779217334
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1329791f18fso6805624c88.1
        for <driver-core@lists.linux.dev>; Tue, 19 May 2026 12:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217334; x=1779822134;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0U0SPErPKCW9LWawSkKTcXgFGdc7H4m2CUvw8GQtis=;
        b=jrAdV5GFRRZEBXq6v5noGDKnUJz11t5I1Lg7BCd6n5doz/UFQOdHwfszzfqeto9E75
         6vFJAzsKTHafdBIJbvpCwppq/2p+BKGjdP6jeV84LDV8c0mN+3SfxDqEHoNQPM8iEJSp
         xnaRChBw3aPbe5nwzGp3ID5lo9g9vEnYC19AgvMDl3+AnPwxeUobti6tIzc7cKC18nYl
         YRvDIAwmkPV1vYFJbBmDcS6cpvoZGMNOyEvihl0Jn+DEPnrVt+M/5GltlcUhnfiqYjBP
         qIy+c0Kkdc5BMokK451RDTd3o0mbsI0Oy5Po+sj07rH8RhsWCbXzqymaHaVpkFF5T+JE
         ZuHw==
X-Forwarded-Encrypted: i=1; AFNElJ8YKA3lObLsGRSEYn0FuUN1GKNqTKV+bzfOpeRfDMXGPWHGsdhInt7+lgWfQRMlaI7ILITFN+ZXuT4l0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZZQpRyjY4kMUCkbYCjmcvhFVU4rzHBYDYee1DSrUbVdjMp7L9
	5YjKF+7bOhfSzrXMHsvrtBEWNcqvBVYxUU6ucl63o4cJCQRnR8kArSk2DYenCGL+f3wAPDmKPpO
	EGpvHYkTylxNRPB8OofzPcz4QAUlfIHchEZ+i2DN9LoA0dmz8kxmR2geZtPRT1+TA
X-Gm-Gg: Acq92OH2cq/z1XW/P2JoH0ya39q8e2VsZ8kxvUZA/Vnq6GnMqWozoKYBMux/TmkVJ/1
	ohtnggEox3i+RGPyn6FlT6KG2YWSAYw+veuiFtQgX6o8taeYk0Jt1HAL+jMXQI0etHXBYTjxXxf
	1J0q5n7rkqk1NfYIx77E9z6FCmCoAne3W9hF0RIYusbHNVEGLShPipZfuCNTol8ExCbfACt71wp
	q4vd1y38DBI7xkVRh1RonJkyRaRKOIiqjKxv7yGwCm7iTloimmsdMM8lDlkwfwYvAIeZC5qXYrM
	qm0f0m62P1M6IDjMudUoGI7+qKPcjD52l6KhkQKdTXkfqt9vRRq2a/bXIZUwy4Mvrkf8wQP7pJ8
	l8LWhG9E+p8IBO6EuZQ==
X-Received: by 2002:a05:7022:6baa:b0:135:578a:cde2 with SMTP id a92af1059eb24-135578ad3admr5580664c88.34.1779217333584;
        Tue, 19 May 2026 12:02:13 -0700 (PDT)
X-Received: by 2002:a05:7022:6baa:b0:135:578a:cde2 with SMTP id a92af1059eb24-135578ad3admr5580606c88.34.1779217332985;
        Tue, 19 May 2026 12:02:12 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910baf22315sm1962832785a.21.2026.05.19.12.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:02:12 -0700 (PDT)
Message-ID: <3ed6a4bc42a547ed973cf2b77bde7171e0a15314.camel@redhat.com>
Subject: Re: [PATCH 0/6] rust: drm: Higher-Ranked Lifetime private data
From: lyude@redhat.com
To: Boris Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, aliceryhl@google.com, 
	airlied@gmail.com, simona@ffwll.ch, daniel.almeida@collabora.com, 
	acourbot@nvidia.com, apopple@nvidia.com, ecourtney@nvidia.com,
 ojeda@kernel.org, 	boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, 	a.hindborg@kernel.org,
 tmgross@umich.edu, driver-core@lists.linux.dev, 	nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Date: Tue, 19 May 2026 15:02:11 -0400
In-Reply-To: <20260519205947.3c9d99b3@fedora>
References: <20260506221027.858481-1-dakr@kernel.org>
		<DICCEKZ3HU84.34ES3SW3D1FNI@kernel.org>	<agYbppHWXk_hW99M@um790>
		<DIIMVPTLV3O5.3Q3DHU66WQZUA@kernel.org> <20260519205947.3c9d99b3@fedora>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kINsCGIIQiZkOV-vJCc_encKNYGtNJWqaKcx1vMwBP0_1779217334
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-05-19 at 20:59 +0200, Boris Brezillon wrote:
> On Thu, 14 May 2026 21:07:11 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>=20
> > On Thu May 14, 2026 at 8:59 PM CEST, Deborah Brouwer wrote:
> > > let unreg_dev =3D
> > > drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, data)?;=C2=A0=20
> >=20
> > You shouldn't need this anymore as the drm::Registration itself has
> > private data
> > now that is bound to the lifetime of the underlying bus device,
> > which should be
> > the correct lifetime for juggling the GPU page tables.
>=20
> The problem we have is that, to initialize some of the sub-components
> of the driver, we need to be able to allocate GEM objects before the
> DRM
> device is exposed (registered), and because the data we want to
> attach
> to the final registration contains these sub-components, we need to
> defer the data assignment to the registration step (which was allowed
> by [1], but apparently this was dropped from the latest version of
> the series for some reason).
>=20
> [1]
> https://lore.kernel.org/dri-devel/20260320233645.950190-4-lyude@redha
> t.com/

I dropped it because when talking with Danilo I had the impression that
we weren't going to need this (and I thought we explicitly had
mentioned it when talking with eachother). But I'm always happy to add
it back

