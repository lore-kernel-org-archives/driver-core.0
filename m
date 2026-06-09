Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D306B4BCAC2
	for <driver-core@lists.linux.dev>; Tue,  9 Jun 2026 17:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025579; cv=pass; b=IlUHbxQAhB30lqAUaIvuAs6imjgSfc2CXBn4R5dn6ccvKRiszZkxB7jIUwRRpnWxkE3zZ7GpXLXKjSavdIYR04CVrmGOZ3IpGvqlQ9EYbXpLLo2yZ8LFkGrfauLpv5xA24/dUfnqFVEMUYoEnbU1O52BAhwKf3tcKRZ2kDQl+Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025579; c=relaxed/simple;
	bh=i9E6g7FrTHJuH/KM/L2YDGTx0q9lRs2Xj+Q3YKzpptI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAS+cydgH1XVFpz05MR/mCM8OsNcFZnXxKHdZYLKpu/lAuB0FqwHsnWjitROiPh4RFOuii1xh8dwxqSkTtEXS6nDZKMw4/KUjP9hummJpWkhV4VHc2nqP6U03w88hPVOYn3lvv7kLz4uP6erzRr8F20WAhqfZ02HXwlZZx1/690=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6r+nG2X; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6r+nG2X"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304dc707c7eso543571eec.1
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 10:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781025578; cv=none;
        d=google.com; s=arc-20240605;
        b=JGlpr/3Ul5xIg+Mt6AHFjQ412MfCK8Iy2nlQ+QXaTKy2RF7OV6Aenv71wYsRahS5sg
         AghHY7fwmg2ixGCDRBZSRh8LqbeSp+JDs2ch51VYkGleEvkRc2qrrvTIbxyDeXGmdD/G
         FI9kbxLHnlON2+rv/q3C/ld6a9Y7yg3MqAzRo0fu++SfWI3SFaStg+ABKRGrtuZu0AQq
         brK9/lnoYvWp7apWSJgBDtMhw2R1k6xzJRa6N6835zF1pHTaGlJmH+h8MNjxu6VL4vuO
         Dt44QCx3rNdD4cO+ejSokIwLQTMrWcuE7LKqmSP0gO+CrtOVcNO6gUlHKOsr2QHx6bVx
         7SgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qdj1ZDhkK9hVS2s2BU4ZL0QegPmYjb1pgGPh1FYEFmw=;
        fh=0AvWUneEcZtmhuKNKvHGtVDK4Ufoq38zJIiWQ2aUHr4=;
        b=S9LaH2zrk5GgwOWOZoW6gNpi12IuvjM6kTPrTkagrXGFl3ElMbG7t/7bIjUxQuSDS0
         OU4KJ5SMzLRdiVh5AMixtrlsQtGRJPSrll4a4nhTd6Dg8IQx+Ku74sonDhRjP9+yE2MU
         dXn9g4W9ignNk+IZdwz6UgxF8aadpJwUZJtZ0yVL8kAW3+auKIXZOivlzN4/U7Q/POwH
         qsNQIkJactkwITwm3uO2ni79/thfkNB4HiJufqulT6avvUrcRUaDssm4UJUYkIeKrUxU
         UYPbw/c8Vw3x8gtw5lGTtWCDLo/xCDB2+8WogQIdsFOpqumUBltOztj5Rfg/NUO9bTLu
         9gdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781025578; x=1781630378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qdj1ZDhkK9hVS2s2BU4ZL0QegPmYjb1pgGPh1FYEFmw=;
        b=Y6r+nG2XaeV6xrq7YPi6Ti+D55LZCCn+YEqjBPmcmOWDkqMZKsmqP9vyzyfKuuWdaD
         XAPbmWxV3Y89+BEt3bpNt2LRwr/hxEqiBOk1BvIA22JIVjFscnupS1HWcMO9l2XupfzA
         wMNrpOMPKGHmaUaTJwOEbKsEnpOVn76WVbYQPzk3/BYVAezS/cuSBzEetfkLLhRXWjac
         BqSTiZumoRF6CkpL3YtEy5m5sd3SkOJdQYTeNqEheOYTIEGyeSIsRsHdss0/a9Xxnt6A
         N4FHkf97VsNt9s6jcNFH3EbAJ8I28pJC1JiAdEzKQN2soABwhVtx31emzhEV4EMpmIUf
         ercw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781025578; x=1781630378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qdj1ZDhkK9hVS2s2BU4ZL0QegPmYjb1pgGPh1FYEFmw=;
        b=OyAZgCDxngNp6cSd9QzfPONKUAt1UpIZfVIp9j1NQP3AoWXsngkgFUdPMxrdQXq5Gy
         pTQJqi+yv9FGRMNTD42yAdVrQAC5RSHw9TXHiwUlEQDE7KBlwtmjJ/ReTJfNJNNZF8NN
         C5vG0jh+9F9QHOlsYzarwYedsSe3h+2ArvS3LRDHayOcDZpbDAAAa4IJC8aTF4o9hjXB
         iAcWy5gAtSijwomzYQoIzgCFu38JL4qDov+E44DjK9nmAiMlly9ik71f8IRCC1h2ic0u
         TQuwdEY5GQ3wmvTMc3ARk3Gutd+te5a6k05uyU+iw9Uv2b7Z4nTKY+JBT9GocQcO7fZp
         jl4A==
X-Forwarded-Encrypted: i=1; AFNElJ+hV4j6710VrZH1SQtTByh52evZQgkGutoNaCzpuhKzYSRlcu7OsISJA7Jp8mYvUps+5IH45fSzp0mHQg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywyi+pc9hSMQHy6s9/hd5m/4cQBnaP3DG3Pj/AxKmCnItnNZCkx
	7xkUUnG22heiOuMVtK1Q+l9fFDqXyiphI5SRhnE8R4kkjGwmmeJpo5YcE+s4Hfu493hnhP5Ab0J
	T833TFcrTLYUP+Lc/yA21ihJ0+tbiuNs=
X-Gm-Gg: Acq92OGY6gTD25m93YTvlsocCxuXksMITcJzRPJ5YgOkmuDXU0kn7QSerjQgPuFLhQS
	1KSbwFiOgRRFbnIJdD7UyZCnQa37KzzTFTUZvejAIknjJZvtWi2LHKP/4b0Ni5wLdMDjlLuPYcd
	IpwwQu6TnEoZYYAdupnALncQ3zGSWR/uHxxbIaeKC/AaojKIRXFYhN0m9BLJ1SyOuP0mBvqcntv
	mw9BKHe25l87epjFJgVB0hm98PzJ2g3Fwo+nptHKs9sjY9BXJFrzGorMYTuYQHoqXL8dNKn+FCQ
	0UGFl89olu3SxYbF9VDJOBeVPXjWfINr1WrQyYRe1uijvnWsXKoLbHBXj4eFsDjV+IweLjrRJx1
	lerneo+/ubybrpgu6/mVKo5YE6FBQyVK+LQ==
X-Received: by 2002:a05:7301:169a:b0:2ff:b29b:87b with SMTP id
 5a478bee46e88-3077b5fe235mr6554986eec.5.1781025577871; Tue, 09 Jun 2026
 10:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609142637.373347-1-gary@kernel.org>
In-Reply-To: <20260609142637.373347-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 19:19:25 +0200
X-Gm-Features: AVVi8CeFkVbj9E3PXx3Az4UAa3Y8O7iOpi-vamCvayZRaQa0QwlC9T9yRU6Twpc
Message-ID: <CANiq72miJLmc2EadxUa+yVZ5T72QuTES4Gz=YVUsNivYvR=wDQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: make `build_assert` module the home of related macros
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Tamir Duberstein <tamird@kernel.org>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 4:27=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> This is the remaining unapplied patch from
> https://lore.kernel.org/rust-for-linux/20260319121653.2975748-1-gary@kern=
el.org/.

Thanks for rebasing! I had it as "Waiting for apply" in the
spreadsheet, but this saved me a bit of work.

Quick question below about the prelude...

> +#[doc(no_inline)]
> +pub use crate::build_assert::{
> +    build_assert,
> +    build_error,
> +    const_assert,
> +    static_assert, //
> +};

Did you split this for some reason? I moved the file to a single group
per crate when I moved the file to the new formatting style, so I was
wondering if we could keep it non-split. I mean, it may be nicer for
macros since it allows us to group them, but I hope we don't end up
with many `use`s again if we go down that road again...

Or perhaps you did it for the attribute, i.e. it may behave
differently, but I doubt that is the case? i.e. if `no_inline` somehow
behaves differently this way.

> rust/kernel/sync/atomic/predefine.rs

In this one you used the prelude, but in the others not -- which is
fine, we should be using the prelude more (though perhaps it is a
separate change), but I wonder if there was a reason.

Thanks!

Cheers,
Miguel
