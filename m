Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53F930E837
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 13:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100502; cv=pass; b=tC7Q4f3sEeDyrC4IAIiBAkplMT8LWlzC+zfI/nehs0/WHG4qXF1UbiQE485J7IT3/iBiNATiHpqRpxF/1aKE3c9NxTB5gRClt4D1a/fRDlXKOk6reBL2YliYvqFWaTwKNNkdelkuOLtuX/lHsgAqRFKz1hprSnbf4kpQU22kcgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100502; c=relaxed/simple;
	bh=E37BO8hDdA+Rl7BL4jzarWentIvaF0FL23SOtM4G2kQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlShvl8XeGQYJbeRl6j05GAVKtDqViNHrGVbEQ2/xIrrQz28ERlnN2OiG+qSeacp2A8vcj0DABmP/Jn5T4Aa3NEBdMT6BzZFv8IT2Ir9pHded4PS7jlIrap8Ij/kr53LduMMGJMue9I4f2ojcXkS6smjbl1EAQ77cXBJGehwK1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzOC+a1G; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzOC+a1G"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0f76bd201so174090eec.3
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 06:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774100500; cv=none;
        d=google.com; s=arc-20240605;
        b=PPsMBwPIuQmMy3n20WpMO5uxaoTGdkLUH0OPQ9Yk73MLcNZ7qZbZweGIMSJ7syKWhR
         9qUnUX91vK3CFx8ENZco64jgBAvF05gyzusT5SIk1/BDvkfCGuxJcMLmjSxDIaGVRi6P
         XGz4d6MVEqOkveQpTifnTZiGZDawUiB7D3DCZt3JEfHw+FS5vX/dtdYtXs7gXhZ2cI8d
         7aGGnRX7298O8gRQcvtj59yIVomtVSoUrBuV0wdGqM2+P7yuw4xOxmYMr1K9Cz1lK5mE
         D171LlbshTqf5tsYE7VuX+7JzP2KB9X7D+9ehTrO0U1N+Ne0ESHPDGNmGcD09WVVLtOk
         3ZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLhX9/g2+09qUmS7UZocL6buru35hRvt9bcjyD+wrFQ=;
        fh=Z+QQCYjR4HF2+7mPiMCCFDAqGcFO5OkAPZ/OfHxlJak=;
        b=G/CUXTJHZJOKk4GlG3wXOz5ZkhgLtBKfz7/W3iE01PnKZ69w/pEYg9WoNVqt0UQ0NB
         aIG8f8lswS6/DGcor4wpH3/xhdhhzae8Gsj7Mq03SDOFX+4CyG5bHSOiJUZBaK8bgt8i
         acxax9G+/YpWt5L44UnSWr4O3lAxrl64jaeBr4+H4jijadJuXHl2bTIkHKzHnbu9ctrm
         01O8Rh9loaAVhT+vUrV0poMv4jfW1930JWLo1YYbHAWJmUv3xDAivWhaf4NOleKglt4Y
         pU1n/gfdUS5ZJHRuFhZhfwW0GQqrtRCn6/1PplFYwIXCnun+rxSBfPu2nify18LyUQlk
         tjVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774100500; x=1774705300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLhX9/g2+09qUmS7UZocL6buru35hRvt9bcjyD+wrFQ=;
        b=hzOC+a1G8VPQj2CwP1FA5tSd7wAnDlW8gVcbBDogvgHFdFDrvY6GiyCyXDpBOO8irs
         4xdzZxPC+D0RHO/4nEff3sTIgRFQNfkeUnhA/fPccQWfufAcVUxPTWnTdjKm2WRaKTiu
         iAzy8rELBvNokjx6SBz6Zs4wiAl3On9QOJ9TE87qmg8eYVcC96dOCXvw5wSwnRJZDkVl
         ZrTxZGPx6ukKsL/MfqDJvSB51b1NgasG2XeB8NTFUyEjKoxr9sM5D2HHJDNGXYZ3GnX3
         qdLihN0tUCo1tv6DwAePY/Xk+TZIN2Cld4acliIczNnLK7p6fCKpYFbRWt/BF5c93qEM
         qILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774100500; x=1774705300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XLhX9/g2+09qUmS7UZocL6buru35hRvt9bcjyD+wrFQ=;
        b=Kr64TMYgcOEcE6RzRLAGQPIPwhm6EseIkq3gY47ZR9Rou2JfNneL3s6FavtJwm43BK
         RkF+sJ+Mdnz9YN0go2wM+7nbAVuE7aqGfvVPlclX8SKwQj0tILXH0P5Q6yMJRRFp813p
         XB9x1w8oGiHEP1QXJKmBiNRXw2AmzoLq0Ye3W6H5Uf65N0kwqSFkOwaOna7WQbUSf7IA
         6pU/iqb2VwIX6rt9WDog+zXUcio6b+E+JMKlNb3Ejh4x1yi5zekpTdrJGptWDly85Ubo
         dHOP2w97T0ay6CAKktPMpNiJbldtAW5tJF2VEC0Zq9Ut/kzEduQNESJ5PD+jRubbO3v4
         jqRA==
X-Forwarded-Encrypted: i=1; AJvYcCWWZaQBzY+FRsjn4scjRQagsAZV5cusTnVgd5H6qpWMimUNkhi5oNSHtnWY6YpyIxleWt4C5TS1x6HiBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE0IOBi7mV1slVi/8il6+ZuZdP77WLQLlrZcoUROCLkKd0qSqb
	UT+9bPyDuSe5kuWO7tXZ8zC8F1Pn/Tv9O2CMQTNECA61In7nkt21IWdGkXjT3uJepyC5KAFew5h
	xnex2cz+R4+HsaOAM0njGs3KImmHWhjI=
X-Gm-Gg: ATEYQzyHIZTIyjgJcO4OVN6c/pqcC5KkTa34b05E+IfNA577fCsNiZYTuwcW6oJiDVr
	yavyl3kqD6Or0AYRiSKqjiusA3wU5FG4hFLRbbtZnLzHp84vBAX3i+exb7CEttR/nhADIvYHj/6
	RmyARnQET4CKKDnT6ngc25ve5kbiNOWZIREqz0/B7uvVRzba/XWtzyZjf3wEDM0+SXRph0YW3rv
	n/I5rfWLq7/ACQBjOajioxeOA2rIrRbMj0Itm/48QQR1lCov1oUHuKfp555H5V1fVaXMM61L7wX
	sx5ZEv8y2qJgCztxWZwYVApHdHHCZM3MxUf899Laznpdqpw9GrkyzPDv/n6uQzVYFOFwfBHQ7w5
	sKqQSxV5cz1ZY88X5pTL9Kts=
X-Received: by 2002:a05:693c:3105:b0:2be:687:5dbc with SMTP id
 5a478bee46e88-2c1097cc851mr1504671eec.6.1774100500037; Sat, 21 Mar 2026
 06:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-5-gary@kernel.org>
 <DH8HDA6Q6FU3.3JR57W97IO1VE@nvidia.com> <DH8HYCAIRCZD.2DXSNBFXXT6ED@garyguo.net>
In-Reply-To: <DH8HYCAIRCZD.2DXSNBFXXT6ED@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Mar 2026 14:41:27 +0100
X-Gm-Features: AaiRm51Hwdlg5eHPgbbbJ8KEe0n7xAmw4NZpb9mUA-Y19mwW6yxZqTznI1K4o44
Message-ID: <CANiq72kamU+XqG8AisK8uk9A2vkJeo0xcXZ7SJiisb9KMLK6ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Tamir Duberstein <tamird@kernel.org>, Yury Norov <ynorov@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 2:32=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I personally view them all as variants of BUILD_BUG_ON, hence the name is
> `build_assert`. I thought about `assert`, but to me that feels like it's =
going
> to host runtime assertions.
>
> I won't be surprised if we're going to have `assert` module in the future=
 to
> host families of
>
>     assert!()
>     warn_on!()
>     unsafe { assume!() }
>     ensure!()
>
> etc..

We also have now `unsafe_precondition_assert` in the `safety` module
which is essentially a `debug_assert` at least for now, which could
potentially be moved too.

Most of these (both build time and runtime ones) should be in the
prelude anyway, so they should be easy to reorganize.

Cheers,
Miguel
