Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792680353;
	b=GC8xbi6Psxe3ZPTJ142dLyeGTGLYbBNRRo1BYVG+88fO1xBfdBqFxF3ILZwQn/7T/XT0
	 O6JmPvbBYqdEOVeuzg5KAUKKJyyuKarfgjm8Kga7OaV6gc4YStVuM3a3DPUwFD3ybfQIM
	 3VuHFCfn6yQcwEwlc4FDopqABfAzl+Ix2i0/Ho3OLoQQigD10op+6j0uQEc+rV8NCkWqk
	 Nthe1bnM0IClpM+j3ZiW7m4UOubS8OO9kNfWMVHN9dcMUm8b7rxrjb4bdWs5jbsHXwym1
	 jcK7L2toG2JN8hcrW0ix4BC4yQaxn0tYjb6rr+JiCRd6XoKTkqMrqp/pmBub1SdOI6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
	b=db7J2ltmWc54ZjKhfBAZ6i+ME7fzQ49U4O8xZHjMwGlhOB19DZjuS9TbEdk3uc4vRSrO
	 HS/MkNeJ2p7GkjwXZMp4Y3jMOAIyQAraDHJ3kv50CEArduOda/RAJL+pt/tKGiYCJeg6Z
	 YbdDs8XhjYS4lXbECkMfvkuEGcR9wzb5+TAZICAeBAqYBQ3+xKro8vEp2PPIxblXIFFpk
	 P9z7BmdpqHi5Ye+Xf99hqo8eG1IrIrpKd69GMi+C7lUTGMqLO+OjiQl0qKVhbk9agC57m
	 I7QQnpW9B2aahW+KwPxh21PJTSLtVBUR2HDcrNZLZOkftnhIOfTNXAC+r6yC4QnaCzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HQZpGO67;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307E0606A31A
	for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 14:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HQZpGO67
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35e8253292cso162245eec.3
        for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 07:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792680352; cv=none;
        d=google.com; s=arc-20260327;
        b=De0mWkgWHlogWjKvrmL2jKfzZTLXK2bKV5qE4rGCvoZWB61/WLQRuw6ra0v4uHeDrB
         LD4WcyRcmFpVIW+HR6z8QnBWykWJ0gIW8RuTS6jF+GzatMNJKNtFspAIO1A/ZbqfQJ6n
         XK+lq0UM9G9zwsVJTuq33gJyn9z6VlS++BTt7s7t9xzHTAvG2qgMF5Dmf9lFs3Pc0pYg
         /c9Fo8GHbdogr/6aQUAbiBmd0kSovmSrSsKXQ9cPIZ2DkDT6/WD/mBURk18MYq7ZEIB+
         32iAeYDUJ6l3oARZNvzt22o9Wi6vwoXms+IbZhak3Vy3pDF/Nz7n94nbYZKl6BIIPyx7
         iEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
        fh=24igxP0Rq+iXw0FbVg5bo86R5Js8ff4SIg0sD0yhgr0=;
        b=hZF2dnAllXmT9Yg02nWitdL5Z6ziMQpdNVgw7KMF8/u+RTGn+kqFL0cG/Wf9pynrTl
         COS1xxMdIDA/EvoIA0YgCcaFxFhJQ5FfjEcYoQJaFaH4VBKTsTUJ1hFtZ26grYlRT9cV
         Giin1FGoeqen2Uoa1/kEzzORZiZdRRcPOPZw7BGEEWq9oufO+a5O0f8Oiv2ot2ztrMqq
         X/o4qGTYVHGIrdcaiX5Hh9bglE4MPKldxUEodCywdvPMf0PawHsUA9ToBq1CnJGjYGn9
         2N2e7AocbNM0ljJw51gt4uYS+T2Bcnpxtc5Mh/ZbgBGMWv+kTKJJKyiG0l9FieKV/aHv
         Mv+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680352; x=1793285152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
        b=HQZpGO67TYzkKA3Yct+XGtfJG48fmGteRaLEjEnllbc5kk/rk8uYh7OZLLyfwD+kN9
         nWEiiFJIzWUQxfD8AAF5OcsfH4CqR9ETnquCCg9LJ9fBPUfRb4h+XhTlxfgnwVNKr5pi
         e5b7bg3u6ayIgAg1VLBKp6KAEyLZqbUeI3wbTRgwoWmATnokAK6g++iv4lZeW39GZZoD
         +7Qx76U1FnLDA8q+hDcyjg2DX6kx6XFOYX1DKXm0wAUy/rmYl84bKJMfNQg0N+NBK3C2
         rYLfw9pOihSXtKp+64gc0pcBKe/nhrQd0U9JZJFv3f3DeC0Y9qtBhkCBI0Qz3ZCUl5ze
         3GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680352; x=1793285152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7MNmmannnTHpNepj6tElIKAllzu+hiojkNaJAVo5So=;
        b=vBSgoaFlZkBYnO0KUBWnNdoGqdiltzZdO00aCWEd3forbUT1w3+gk+svaP6tn/Felv
         2XL3BhlFngCrL8IN0lt67dxu4Pum5/QyIL63yd5Hz/v78kFc/ktYdl+4EFSzPk/g281D
         5EwtIKX1OzScUg9bHaZJx3ZKMZ+MXHBFphLrFi9NvS+A/7psv9DMUOzUbNaFQ/gT5bP9
         /hhJDJmylgFMZ3m3SMEO5+C+bZeeIVCuBdnCY3RKWw1/rLdkm5vhD8jIukAxO82S4vuc
         2TMMyhLxCVbsj4fv0qlSZH2CKtQNs3mRD+pToTAsYxzQs2KEsQLqiKA9bFFYBoTqjPek
         qI7w==
X-Forwarded-Encrypted: i=1; AKwUvBwQbpyb/qfKsWawYME9AOK5+RwD1IwGBRjF+Iw7kC+duuQ82FvITcKIQyiztKTveHEt1hotp+OITIxdEg==@lists.linux.dev
X-Gm-Message-State: AFq9FYINM5bL0BLnG/GrLNlyTQVWR5Be9aZIyoqTAgpGL8YjRFk17JIG
	a0+S8UwP2cnYmVds8pBFeVOoca6eF6m1+tm/erpORqpi2+ccuRRO6HR/AJ/6mgOGmBtrO3HnVdc
	dBCSzxOtlDQ966hVtg7kDAgFP/OKKaQU=
X-Gm-Gg: AYBFou3rtFf0lmr05xnBDr5Bhdn4w4tnDo3uizq+W1kP6xT0HcajyUGejYbGvfyEdK7
	q1xxpi2lEIFy8dMVZjm+66XTjx7F/nxYJvCKXvsqMCTf5TxMpyLdX1vgLTrfj5m4n42DI+Z0vfj
	JqVNYHxQSNWLi7ZKjyXfNOQ2o1482yA4pWYQQsShCnk2DlSe+SYqvVz9Zytx/gbDTIDJYn6JDza
	CtwhGVvyx6oj54J3XcydFEzUckux0gH5KDL9uPReZ3gg9pa+c5ubj+HDhipqBkd/A92DE8U0amQ
	KF7HFTyc8eYFxEUgW8O1ntUdjdRZvl/YTz5Y1nHAaZGNnsAx6PBVfV7HryZkPbKWmAlFR4dEGCQ
	E9hcB4ks/7sl0oGSzRuk8LbabP1SU5OscWM+07E9yUEpm1v42CoK7phGus+6WwcDlF+D+nfwqmY
	DSIDyT0iCazER/WoUgChDWJRZOWGNVhR5+QfFQzGiEYRZ/Wug9FHX5l5Ewa7R7o4pbakFO/4yoc
	cov3nwUH+/oqmrExZBSTyJCfHi68MIVA7Cs
X-Received: by 2002:a05:693c:811a:b0:368:8792:720 with SMTP id
 5a478bee46e88-36887a14b77mr6320743eec.1.1792680352107; Thu, 22 Oct 2026
 07:45:52 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Oct 2026 16:45:38 +0200
X-Gm-Features: AclHuK8EKOtLgMJPZNE8Rsgx4kNwJ7cv5GEy9zBG17C1iZxOPqBR29S9pWwIt5Y
Message-ID: <CANiq72mEp=Vyj9-TcG6_X5_q+8guGQvJFbgmEwQdORn53-V=JA@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: Fix CFI type mismatches
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> This series fixes a few CONFIG_CFI indirect call type mismatches that
> I've run into while working on Tyr. If we're going to run into a lot
> of these in future, perhaps we need a better solution than addressing
> them one at a time?

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
