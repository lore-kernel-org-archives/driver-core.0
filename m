Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795573504;
	b=z+ztoBWKiOmk6cb9+d+BEuoD76ya3WJRWO/1lDjH2Lf1WWPKqn4XhH9a/4mx+DpaKIve
	 djQ2MAHfkE3lNhQnBUtU12d+9VdKprW7BJRj6PNUfCyFNVHk/bZsSRBONDFnW0xMZGVAt
	 0l1oSTUACOdoizKqWwk8rdXUzPPNUjbPwLJXtVrAV+eG3vuoa6j5B67gatUVm136E+HEQ
	 ZfCqpunGoZUzSGPVvmqe/khghBmfno3NPjQ+WRVKxQ1CqmPGfWL9Nb4bW1vKp4DIDwUcw
	 DApAHB9to1P3I+UuBtOpqGoJZbQKa7xV+G+AhkDwt3mVh83g4Yw594YsDziRRhtuYxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
	b=37oy2juD6TzxVWxl85VcRVStxRFJAK0amKV2+q/Jf5uoD/v8VO8nTEM57CUJfOggXMNU
	 eF3rRANkiMfvGH2TytLr6E9DomZfk5m5wPoxMvbgVrqAPYJHR3h06PnKqoxHiKWWoYkFA
	 1kcvshzEIcFkAWX//i5vN2lwBtGBaZCzZyV2+QH5T7+lvOKiir3oCmbCqEyBXqy7rnbeY
	 UK+0YDulqtZGC8ztvrdO3KY4SxVZpMol4aLuMiQlu1t0QwPZL1jZcVeqtaUYt/UA3M7sP
	 F/MKnC6+YaWSL006NwzynVSGA+PqH5tO42rLouYuA1nFd45g0q2wOf9PBESn0f2ssmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMxYTRYt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ED0606A326
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 02:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47ED0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMxYTRYt
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adff684a52so42905621fa.1
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 18:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795573502; cv=none;
        d=google.com; s=arc-20260327;
        b=e5ogGdYlefX/q/1EONulmh3Ign0+IwOsyf74WhFlbbjOzjQa+PPJaEkx+Dixp+RFgZ
         xH41TUslIMvtucG8FT/3FrAtjLOnKtgRkLINm+qhvzdD9llrpGwuwHeub5SFOHfb30kK
         gb0sLA4+4ReAi6nOSaBtRxEZH1rmQloOjSxFt0vmhPm73icXMj4qoMN2+zTWFPOSmKVd
         Yw51NjZLczlISNuoBpYdAUudRaJ9CLseS+fqldPclK8jv4ksn/Xx081Xmd4/hVnjAs9N
         AEGuIk+K1y/noCkxI1T/YiDkQ+7VXbohBsawJUCP7OJlSvVqjw3KZcbiiDIIhl0z3hqF
         4PLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
        fh=oNzvsqtI0lLTo1ZIFzVYmP6MHaGbEljzM0RaUg44rF4=;
        b=ZM9T4vflK0qs8OZB+C6ownnDZ3DbDD5onHlrrIKNh5/bNn5ahSlNoIwHkp29BL2Mok
         6HfJTlKT/R21Q+fGNHLRaZ9bt6Ab8Vgoh6pyemqWZ97DGgmkalPknkFiaBV+pnUQzRDl
         FLRpmVuiV0NERPWocui/9GPFzcQjYYd6GN00GlamRCt1VC5x5Z7zefbYu1ELAYWUnW7a
         xVaQ7LKS+I4tg4MVLYRVOkrhjp/+lqR7HD5vuy6ODRBzxSrp9pGxTi2sxNN7+KlqPCtF
         mJ9iuEv7ieHmFQbLbdwYivtoIV2GT7Dz0fKj7t4FyLVj8ud84EYyCdAocN11rKF8k1cI
         FmiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573502; x=1796178302; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
        b=JMxYTRYt1n2MWJILjLlVXCCN2ui5O6AZ0cP5kUYTB+KbNGXbAr0yZChRSp5zzDBdVN
         FTYGjfZEDpxHHR+tQ+PICycuv7N897FBITHqkWPFvO3rfK/M+Qwpz7IJXm3Tl6ijyMLX
         nGzbBfcAG48HCVBFrMkLc/6x5UPtnw+RJ2aaaMNQT5OX/Rusf/8iOzVvoNUKLsB507TO
         MchBTIn29Ud8uj/BJTTkr87IyaDGUHdj5EURASSM5QhMUgAw/qcCb3PvPpdNuyllJyxb
         IOBj4zkjq+bbDTxtmr2hK1uSf+qLvYJb3/73DG8Y0f59psns/giA0RveM4IhrgaUGbJf
         417Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573502; x=1796178302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
        b=DyA9ZJO4iy19ZM4AqrJJDuGXyrESdjG7OSCWe3HH1muk8ta8veW6TIFVpG7evZYTD5
         WMU3xEV7W/f9EDIa3kOoZDvxJ5E1xM4M2fFRi24lNy8o5NodyjRYg4HojYQiLePCws+Y
         5hHwFaMbtYr5Hhe0u4YepWnw3B/F7si8gVHe5TuCOA/EXz8GL67kgPUgxkdHRixTsGbX
         /sU4L1bpRGrHqrDlflxkoAkvlN1OGCkKJZfm28hzTgYFms0SZ/5z05d7Is84MIdACCS4
         WYYUOmKg9V9uX4rRw1xvoU08LeRwVYLSBYwoi9EwJDCcbmce/6sohSciZ2dDEkxLYD9P
         9eAA==
X-Forwarded-Encrypted: i=1; AL+hErHMhY8GHuluSeiaTQGZ7GFiQeJMpBAgwXkYnhGWC4ziR3LL8Dix2mtOdZslaGiFiUzN+WrO1WJ1bj3hTQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/b3afOXw3odniW3ligdPJ5DzMtSFXPdc6Mu9wM/GSXXHJxFS5P
	9QCOzMELpqmVVcUFjys99KKkovIXffsnlrL/N66qf0Iz5DHEixKEarJYVs4SDy0W8VO0tC7pE75
	GqOyER5h5krzrP0ORGwREf6IZYCfRRRY=
X-Gm-Gg: AZFdTZdFOw6CxDLpF/CxXHOqU8O/u9emGGDwwe9dWhHfHQTZ529fYxUgKQPxrBsw0yq
	cKA7a2mbXfWaJgqKXJF3xyzSUs+IWfql6LCwXzVX1hxz+2thNhJYitsqTiD7P/x+mlw6W65bopb
	59fo6ShV3n6X6klqM41DMYs8IXyOSXCxsMcuH6WnIfoGyjDIZ7CaVyx1DiJuZRl3m+uq1PmZWDh
	Egn6NLSjxJp1e5KPNkFbnhfk8o2kzjcpewRDI5qTQBoFQhs/g26lY/jHymWPdqr5nr/+S7cPeOF
	3AEZJhQAqs95oGiCvIhYTcEL1+HeEeNpGfsm8cqV+7tv/tkKg4knE6pEkGILZmE/Oyu9ZZasUP6
	u96IBiUilVEzIIinfrH4wksThLuqQBfMR5Bfs
X-Received: by 2002:a05:651c:160c:b0:3ad:ff5d:19b1 with SMTP id
 38308e7fff4ca-3ae7b7fbe41mr38238951fa.20.1795573502123; Tue, 24 Nov 2026
 18:25:02 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
 <20261109155743.83740-4-muchamadcoirulanwar@gmail.com> <179538281024.9825.4132712997497273037@linux.dev>
In-Reply-To: <179538281024.9825.4132712997497273037@linux.dev>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 25 Nov 2026 09:24:50 +0700
X-Gm-Features: Aa3M54rxCZafdUbvRb9-vw6Ll7Se68ZBnBVHsI0xIW9ramLI50wU4YKTZItQkks
Message-ID: <CAO26r3Tn95hm8SCEcP13wXE7p+iQpJ0O2n_tyhQvYUTkG813cA@mail.gmail.com>
Subject: Re: [RFC PATCH v7 3/4] rust: add minimal IIO subsystem abstractions
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Mark Brown <broonie@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Shuai Liu <847807867@qq.com>, 
	linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 04:26, Igor Korotin <igor.korotin@linux.dev> wrote:
>
> Clippy shows two issues in iio.rs:
>
> 1. Line 332 -- ..unsafe { zeroed() } in VTABLE. The SAFETY reasoning is
>    already written above the const, but clippy's undocumented_unsafe_blocks
>    wants its own comment immediately above that specific line.
>
> 2. Line 408 -- unsafe { (&*priv_ptr).channels() }, drop the &:
>    unsafe { (*priv_ptr).channels() }. needless_borrow, no semantic change.

Hi Igor,

Thanks for the review.

I plan to use `pin_init::zeroed()` instead, since `iio_info` implements
`Zeroable`. That removes the need for the unsafe block.
I also removed the explicit borrow, as you suggested.

Cheers,
Coirul

> Cheers
> Igor
