Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E54518C332
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 00:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774224968; cv=none; b=FYbihOIreInERstqzFpr+04dBN7QarqEq2IE5dHYQJLk7MZ3dZyOSOzQHlNzaBwNkDdFi0ECmpNrwaMiSirWB5Pm5LXB7i4ugCjPbcrT3jNaYowT10S+3UEORZ0hkOOjPO/eo82812NlWapido7/mtiDibilOWBqDag9OUQBa30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774224968; c=relaxed/simple;
	bh=Vz6hlss71wCpMQTFpOI1UCwil8q0Rwfj9v3C/adr88w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+MliT3G9GeRKG3QjJa3RFNjiPiO+iavxBeFnUivw4kYyitzRyYm7ISYDLaZJ3nKNHx0Ec5LMntDKMn5A8Zz3HFFVUZtzAneKH/GgZEGPZuFN+TksbsllSq6Dx2BFquOem6neeV32KDyegw3XO+tvPdvGW1D/gdc9OEQCHN8Cc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K49IgaKB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K49IgaKB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA95CC2BCB9
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 00:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774224967;
	bh=Vz6hlss71wCpMQTFpOI1UCwil8q0Rwfj9v3C/adr88w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K49IgaKBHvfjrjUTPdu5EtJnJwHDSCtVg5836pGr17Tolll4phlkn3kK6tscuRGv8
	 lj5wVJvGU+l0/J3q8zhrEzFzUOcZ577TSsiAgd+xEM4SQUags8QNKmcaMuEsX2IIk6
	 Eupr/0fE/NSaHgtnc8Hv6coQqu/Ie/rMmpxuqD+FL1PqFdABPdkDTe0xVxxhv0IBoj
	 SxDPEqllePTuhppFENB0kGnniMAP9rmUokobao7jnz8BsjXfhNAMi4/3yzzIiD8l7k
	 ZBBGM2pjbfHTbcV4vglorRmhvHpscvYWXeZOZ0N8aMxjr/cT2T6v5elPXiIGjKWhaZ
	 w/LiUbTXc5X4Q==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38be5e86918so32450501fa.3
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 17:16:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNXduL1N2gV2699CRja3UuO95lDHjopaGS42iKTCs+kAogSHIpdrJjKeTRgoEaVSRqSKTZImFONbHwfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPvX09Zsal3rmlfBywQk+pusYr1Uh4BE1iHPQkBvUGdVSgbxo7
	QJh/10ssGo6hJgoBubhCvfSTV7wdD5sNG6JAkmhNYPcEFBwGTpL1xHVIgZk9nO5FUo0nJwj1bjO
	PNX50QkbbU+MZu1YG7V4r0s3pBmp0ZPc=
X-Received: by 2002:a05:651c:1313:b0:38b:df0c:979f with SMTP id
 38308e7fff4ca-38bf9741c1bmr26363211fa.37.1774224965758; Sun, 22 Mar 2026
 17:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-5-gary@kernel.org>
In-Reply-To: <20260319121653.2975748-5-gary@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 22 Mar 2026 20:15:29 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9k+aTosVrC+e5SAm7Hso60sGw=YiBRjwwx5ruRNgSRepA@mail.gmail.com>
X-Gm-Features: AQROBzDn4PtiEdBNjn48YaossWLeRtmfaQJy0WX92eUX_bEnBMYsO2ItiMTXlbM
Message-ID: <CAJ-ks9k+aTosVrC+e5SAm7Hso60sGw=YiBRjwwx5ruRNgSRepA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Yury Norov <ynorov@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 8:17=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Given the macro scoping rules, all macros are rendered 3 times, in the
> module, in the top-level of kernel crate, and in the prelude.
>
> Add `#[doc(no_inline)]` to the prelude so it just shows up as re-export.
> Add `#[doc(hidden)]` to the macro definition and `#[doc(inline)]` to the
> re-export inside `build_assert` module so the top-level items are hidden.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  drivers/gpu/nova-core/bitfield.rs    |  4 ++--
>  drivers/gpu/nova-core/num.rs         |  2 +-
>  rust/kernel/build_assert.rs          | 19 ++++++++++++-------
>  rust/kernel/dma.rs                   |  5 +++--
>  rust/kernel/io/register.rs           | 19 ++++++++++++-------
>  rust/kernel/io/resource.rs           |  2 +-
>  rust/kernel/ioctl.rs                 |  2 +-
>  rust/kernel/net/phy/reg.rs           |  8 +++++---
>  rust/kernel/num/bounded.rs           |  2 +-
>  rust/kernel/prelude.rs               |  3 ++-
>  rust/kernel/sync/atomic/internal.rs  |  9 ++++++---
>  rust/kernel/sync/atomic/predefine.rs |  2 +-
>  rust/kernel/sync/locked_by.rs        |  2 +-
>  rust/kernel/sync/refcount.rs         |  8 +++++---
>  rust/kernel/xarray.rs                | 10 ++++++++--

Acked-by: Tamir Duberstein <tamird@kernel.org>
