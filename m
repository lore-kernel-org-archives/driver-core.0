Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A15D29AB05
	for <driver-core@lists.linux.dev>; Sun,  5 Jul 2026 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783253581; cv=pass; b=MGix4KT8ckP90DaGSaQ7p6oe+8qSYseujZMpOtEtcboDGUodeu3LJQUbLNkSWKdSvkgC0Z/eEUbCPxI06bCgs1zDI6w3W3U2cq8xvSRemFHB7C2Br+EAhndfAUzY/iZQO/hNUeFh25aMq+7j3tzCQ3za3z3MJLMQahjG/QHXzsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783253581; c=relaxed/simple;
	bh=5ISwFpI0UbPRq9FTX8wSAZ5/fVWcYX66lDYusFmfZZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=pYMPBTFSXqRCbMBEgTt/FbD6Ogb1Oncw26xaZAq/2Y9U5OG0Lebrux8jbAV0FH7ZWV3/fF6GiKgvUz4CfnWStlQEG1gmPVToFrVrehgvvEZ1pSQ3eTLxAJML+frFv603QibhpwhCyTIpwZB0ziqXHQpYo+Y+fi03XA5XHaGxxt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnxAPnUB; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnxAPnUB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc7e132d3eso1407325ad.3
        for <driver-core@lists.linux.dev>; Sun, 05 Jul 2026 05:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783253579; cv=none;
        d=google.com; s=arc-20260327;
        b=N8Lo4d3h5YSYAYqUPgl5FHOLv2C1w9F5hq1gUy1iWJ5rulxHe7QoNBubIdG5c14AFJ
         yuBUH9d1zd9bwJmxlADBjCyovy/pAhomPmWWunbxBUeqK1E1MerDxs3PLlubRTNZzX0w
         NHS2qhzq0S7EUlrXQaVeu9xphwrX5w7EHKrOl1pmTPV5dyqBGDVKCC6CzgMdIwxa/Uh0
         a4+W1Bwrt/UlFjELHyHVSHLW6a8ZJu1/qwaYZQG/WHEyw4IQbdzoW9GxyhUSJTL08j0s
         BJgZwbTIr86g2SSF9LwD0yXWti9efGoAyLq49fI7s0VmfC9oX/wZ815PEPMxxj4D4kjc
         t0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        fh=SNm1nQRto9v6mfe3T+vS1nstSzdgzh6qaCsXQtbu1Dg=;
        b=AlRfMaqZXB6+jX7of2o24GouNp/kmWMOpUM8tfd9N+8Ik5pZ3GV6cH4ARgEwL0MEsA
         9MuVUVX2H5rrO3U/ifU4TEREFIYXS+KNPq4COOYmPDlBvUwQfu9J1e/fa76crq4ukSRs
         3WRu8RhM9MBkr1GVlc+nQNYfquo0USnOrN1CKwp7gR6zK7fAzYIaTAGXxEofcCQRkMxg
         KYTkDJGwz8CpC5bOleC6NsHeyh7qI1quQ6E4M6O5eMSPw7FtatfImLenvAoKxVkkyKnZ
         yMJ3n1PRhBYTScszegemUSdJ4al/1b6eRvl6x+zmPnHICjIFfcoFhWLWiVDaacu304rJ
         GziQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783253579; x=1783858379; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        b=WnxAPnUB8J5mJvEs3bTuzNM9fXEOncLTebda3jQOzY//y136D2cXAYO54HudAFkAci
         qXYxtMuwNEwD2kWTfCiA4bpiFZeTWgyhvUGlYQJxSutuqkSFSoEjI5v4aqy6e5rJ8G/p
         LoTAESv2vMxyLDACshFYEc1nkmurq2FIMP1XGNbOzylgCCU00COFKeXOvce0Gr8C4vna
         7ccr/VifzvbJK0rxSUCHJZqa5qO3Luc12pz8OK5KaWqLpTB1KUuH3XNrI18xNa47yL5y
         KQD5vmnp09lOWDUgYhL5bCj/5ZHkDiYmwv0LMa+hk0sEUYC3XVCL+Kcqm+zDU8WMBrGe
         TaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783253579; x=1783858379;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        b=XBYyK5+Umqk2Cdg0MEGSsokRRahBtOBlW9UYsIxo1k6K/UOxfKKykyVTcPQMIB6CGE
         dd8/usK/J33D046fKEcPdvjGfWKdACSC/sZfdxrnTyukaeYQ9FgrpfW6OPrb0RjGnWVB
         bZMOSS2T4yfSN+/8navy1dojdspSzgITscc58m8rxiQ2BU0Mwg0W+nAUXoG4kfwp3ztA
         +OQ30YbBf8DHLDQPyRsn+xRljzwZRYX93gXeJolnhKIb0PLI/zo89R7b+vt3Gy0CPBGY
         LQN9wGebBw7mIHQndtTr2GbLfDw4md1shOs+757QxVisXLW2JRGtRtEyYiRvM3c1RbXb
         2KOA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8iZqyKM9strXhgcXZIZURsxyq4M1bR+eFCcTpj8vRktexe61cAtVYoizzOSr75cCtt84wK4mHB3eb8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9JBFkgXIw2enyYWqz7xht6h2vMOqgRjoOdCbffeTenbX6LDzh
	jOjlbQDpOCfj/YwjotqViQM0GBJT+4mSoxOiUZ7SjgRimblZ+W8ClGziaXxwSSIWo7H+PwQcRzq
	ZPa0SxB7LcwzC8oryZKkUZ90QwrEVdTY=
X-Gm-Gg: AfdE7cmmTrqLMiI2YAw35RWpFN9n8cZKasnrV066A7Rcf1w60niBO5CqtgMRSbdS87X
	+IUkHdXIrtHdZk/PmatdOvTN+l4Dn4S6z8QoSJ20q7CltZROhzofZwYL4C7kA8/OG3lBQVe6wFq
	wrvA334LysZ5ksMB1lV2AtT4fEENAwKBCpVwuQW1Ugg1qgFYIaSKigWo2V7QR5Z1mRxEQAHQJPF
	0+jeztdflRL/1bfDTBuiTG9WO7sKRdS8Qk3MbpXW+SQ1C9gO9SmElG1+jzTCd8jWT3NuBzmUibs
	LLl/6TAtCjRV/I3utbKDi5O8p5bzWfU7Aaq6b0BQmwshEqe8GXWVUmHUZ8yGl3Pyjwi/fZWyseo
	NJvpVQINX9d2q
X-Received: by 2002:a17:90b:268f:b0:381:28e0:6248 with SMTP id
 98e67ed59e1d1-382802beaa9mr4128789a91.1.1783253579563; Sun, 05 Jul 2026
 05:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
 <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com> <CANiq72=SQK7pd-fj+4MOb=E6=R-DHCcLcuCvN=us2E5o7Rcy2A@mail.gmail.com>
 <akmtA7EbVBdhRAOq@gurudas.dev>
In-Reply-To: <akmtA7EbVBdhRAOq@gurudas.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 14:12:47 +0200
X-Gm-Features: AVVi8Cfl7DMeNQYuJP9tYThrU-TabLAul_khYoWVx5WCyAQG55ujZm7jKpKar4U
Message-ID: <CANiq72nESZyX95XSKC3zaog=XSQF09bYJmre0mUbtQ42-Ly6tA@mail.gmail.com>
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 3:02=E2=80=AFAM Guru Das Srinagesh <linux@gurudas.de=
v> wrote:
>
> But unfortunately, since `imports_layout` is an unstable option currently=
 [1], it
> cannot be used straightaway.

Yeah, we are trying to get that one stabilized -- upstream `rustfmt`
is aware and working on it. More context at:

  https://github.com/rust-lang/rustfmt/issues/6829
  https://github.com/Rust-for-Linux/linux/issues/398

> However, .rustfmt.toml already has a section of commented-out unstable op=
tions kept
> as a reference for when they stabilize. Would it make sense to add `#impo=
rts_layout =3D
> "Vertical"` there? If so, I can include it in v2.

That may be a bit confusing, because we still need to add the `//`
comments. And if you add them, then `rustfmt` will format properly,
i.e. you don't need the unstable option.

Put another way: the intended workflow is to add the `//` and then to
run `make ... rustfmt`.

I hope that clarifies!

Cheers,
Miguel
