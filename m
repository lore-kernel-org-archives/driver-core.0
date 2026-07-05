Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD2137DAA9
	for <driver-core@lists.linux.dev>; Sun,  5 Jul 2026 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783254158; cv=pass; b=uPuFhJ5FhS+1si84agb0FE44BAICyF+n9plD1rMAwzkV1P5//NLXxoYMscO3yZdcsRHq/JJ7N9OCB5ZgxiY1oNpI3c9CfzIn2S7l+m+LTtBT2JTqYVmbqFmVJYA8WZJou2FJQ2UudWkqkVtFaLbBAY397Qld8f0HofPLpBtCXlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783254158; c=relaxed/simple;
	bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=KknYbSY51wZQdYBoz0ypVhYTvphBiecfNn6xLWXeNrk2iauU3Z0kKAKDi4Etjua7lzzWk4kPrc6JM1awmxWpTj85E1nspo/1EoStJe72M/0yJ5pP+9UVF2nqrZ14+Y4QB+grKw7YQE7g13mpUkEccx5TCrlTF4/UmGvvwLzHGhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzBNXuFe; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzBNXuFe"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-380a02c71e2so761424a91.3
        for <driver-core@lists.linux.dev>; Sun, 05 Jul 2026 05:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783254156; cv=none;
        d=google.com; s=arc-20260327;
        b=MRCEmdWCgpFImDYfmmCPCJiqZSLPKHdT1MxSyxEoBhrn/iB+NZPodb7yhlc2rx3ixb
         MH9UCDPQrha+nSVuSkjssDJ302nScEaZYRfThg0B48y9mfbi3Oyi7ArSLGdkJqVN98B8
         +g9wHrLnsuMIeSBEwWn5dhSVpAnNRYPpnO16ExS46DInsE6Nh9427IQfXrPqDexdA0yU
         X3JHTx46Qhc+U84nbcogPMfwdNkZWDqyFtkb+nP+F+8dftJjrKee9jXG1ooGpOOgxbnn
         qpsIuwgEmA/T0lymwr9baM8cDJI35DHzOjYAx82II21vlwbzCa0XFvRuYXKBRC8nebhd
         pPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        fh=RvNBZ5LNJdf4oBT2nVP35eMhKWZ6ci+t0WWLAu2zOSI=;
        b=NLuCzj3hT4tZIc2o5IR9mytNE97xJqukAqytxACk4x2xygWJXPa70RVl5GvnQC+Kxl
         13vHMs3KxIZyUuU4+JvEJa7GYcs9ERqoq9zzk71K8FCiHY5HR/mGNeL9q1zjdzRWS30K
         zNEX2c3oyA6q/rq7BLKla7XpQGtfpEHS10HtLIPuhVTyvxBou8I+XmRXgeIABEH2iJgK
         hgroqydguyE4yEbIhbrRXzjTudYDmQPOZ72oOtIyWqKYQrQdrWhqRIwJ+V2aWVbcbVI5
         VZ0yt08+g6TJ5puJ6r4gK4ET9cWc/PW62JuVWhdklGCUDZBoghgUgONmV7nH3oSl0NDf
         OPOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783254156; x=1783858956; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        b=VzBNXuFeXCaDWHRctHOq2OVFGDi+cOXgOuXJS9HNZKJhqDh0unQ7tdokFueuyCqram
         IY1F+bgS9Yy0tLEpcNEMlY5icUmFiw6aUAKgmuOFkGw3jd1ArC0dR5m1n51YHYqr4Ef3
         OAQpQnOHSY7KJEKJndI7/xEkHTQj9Z9YWmv3JB5TEUsXH3g3Mehqt/OrqHw9PW7Z9e6W
         AE7oxUHQiok3RaK95C7aiG+QDRXlWj6GEjGsSkq5TlJosUnF2g2W2kQ1rl4tIQ9BfzOy
         NJOmJ2aQyllsw9DcpRdq+c5j4QqUIol5Q7MDHlps9oZlmpE7Kh4B9mIPgCD7WzZ19Z+3
         l/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783254156; x=1783858956;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        b=DrMw8zCVcGP4qh3gIWW74nXv+nzTO1Gyxdzg5XEOY2B9qRk1eGKH/0iSNR9LQInesL
         G4GOEkxMpE/zytNhzcx5h+D7RdnDAJJ90izwlwz0ICb+nzsOuBbA349D65x1+yfyz5Bm
         LHmfXpAllijZmahd0AjGQRsURfmcGHs1JecdGphWyprckoZMKeAWJWhHNzYkkTtHqGZd
         yXzfYOdAPYgCFbxHR90F3xtK8uZrWkvh9y4Rp3HGltCrWNtfZrt/PvwdGZunMJ3cM+L2
         KaLEkaUSMGq+QcOxbRJeiQH8roPyxz8fB6Gyl5SVMWUhuV2sj/4tkdUo6WnGzoj9AHba
         GmUg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9TJ8vkhwBhm0/+wIHxNM0htyROXhjkgm835KV6HBbQGk6AiTqcE2wgJczreiX9OU0eP8TGEksd7x1CA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyXHiLTsaRwZ4c+24p9z+PkTwObq2Pq+hK+H3X/gpEiU/+o77f
	KYtLCJB8J/e2i+7lSD5snuQe+VAItzap79bKLnpypHQuMFO1LqXVh6Y5danu9KlUVRhiQT4Qvtu
	8KaNXzjhv0cZ5Ysc4NechFzLz605p4Gs=
X-Gm-Gg: AfdE7clzHV2N/Ulkyj/mv6IXW7NkSLLKGS8wrH2S6Yopwmc3QCS1hNGzgpdFN6b22ot
	wFd6PlpRhtmaYFJ9JKRByj1CxbVzO5Deubq39T8Kls3ogyvYBEY/sVOIZPIwnIR8qlFbzsfkzFH
	M7PyGYfesbU6dwfYXKrn54fPTIk+6uUe//DrN4tHHiQTE2bHuRAGAu4I8BsogzM3A4V4N+lvhDe
	xsBMvVs0RmapjZOvA1ml2IxBHV99ToBTQg5ahdWr9PGS683q5NEM1mjaxI12TbxJisvvV+YUWg1
	grFZ6v9JN+QEX4h2VuZYTB8vXvGN6L1Z8AVdN5g1BPFu22EqUwHrEx0YQEE7XtLxHPuudqp0Bas
	PrWJ6g6vm7yhh
X-Received: by 2002:a17:90a:a416:b0:383:5a16:bd67 with SMTP id
 98e67ed59e1d1-3835a16bddcmr2702118a91.4.1783254156186; Sun, 05 Jul 2026
 05:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <c89a1bc8-6cc1-4e16-ac95-add389e45a2b@lunn.ch> <akmnh0AKFfu9-OYn@gurudas.dev>
In-Reply-To: <akmnh0AKFfu9-OYn@gurudas.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 14:22:20 +0200
X-Gm-Features: AVVi8CdKZk1uQg3RyoO9gWWnGdg1D5rtqZ5BcTTqS2w4TtsLqn1TqMImL9QufHY
Message-ID: <CANiq72k0zokLC_L2wPJRDb_CyvnJznOSKUgTaiHo87GT6Pwyag@mail.gmail.com>
Subject: Re: [PATCH 0/7] rust: Use kernel style vertical imports in various drivers
To: Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 2:38=E2=80=AFAM Guru Das Srinagesh <linux@gurudas.de=
v> wrote:
>
> Miguel, could you please indicate if you have a preference here?

Gary is right -- it depends.

Generally speaking, it is best to do changes through each tree;
especially so if it is the kind of thing that may be prone to
conflicts.

In certain cases, yes, I may take treewide changes, with Acked-by's
from maintainers (and very exceptionally I have done it without that
if e.g. it is trivial enough and enough time has passed -- trusting
that people trust me to do so).

It is part of why the Rust tree exists, i.e. as a fallback and also
for convenience in certain cases.

I hope that clarifies.

Cheers,
Miguel
