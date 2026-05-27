Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3E040DFB4
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 13:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888254; cv=none; b=OV2TAPGFsm8NYq4z+v7O/rBIIXkm906R7KoaCoThQcbeovYm0fPHNP8K+Ah4AKjzgLDSClDFP0V9xeFun0V3WBAgOj5+Ev2JtOnzhj2LOmpZDOyx4Vs1ceHyHFqXeAjlXbQU9V6BQOmXG/eB5gYvamt2wtGPFnNW8JqQ6rD/Gbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888254; c=relaxed/simple;
	bh=VrRmT2jrD5eQifoZLA3GNRe3myJ8hdGw2cXZeGvkFp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVwmRx6+oi4jamVVVspOe2bBLkFqPGKpNE/2IO3Lu0OJ7P4CdChKetfEOZBbcS0G1VXEwWRmcoYXZzSAiBE/xL2coZ2ZZ2vN8TyPeBKTvLFh2kYyjIVeETtLHMQcY/L7myTpI6YR2ewh05oOVmD0oAwvHK5UPbVhz/AQVF+mFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBafHIhO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBafHIhO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958201F00A3E
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 13:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779888253;
	bh=VrRmT2jrD5eQifoZLA3GNRe3myJ8hdGw2cXZeGvkFp0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YBafHIhOaOJcNs5M1MV8JWRjkwfJHiH+5AqE/7mVSl0ObFdQKft4nJ3hgPL1uZ34D
	 xlMpKSCnkufT+Meqj3ayK7u3w3QSrJMSDZxf3Vl6CCSAM464Kof8wZKodxuQXKykz9
	 Xood9CI7c24ZtRR5yvQthwCopnfAoqnmx8ZfYuQhhOzeRqQ6tfeAY/4gh4qO6XwKzl
	 eRkmlR6NTSunQoaHCxMqnv6Sca0u+9xNOL53FQRXky7L1WjDLqRmNtmo6GvSn2++BO
	 GDRaMAA//icdI+Gv/YjA+sR0792sjB5cWxrzEBT64gHfEatxGJ5Kowt7u9LTBUk732
	 +5+9O80HMD7FQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e800deae4so103164031fa.0
        for <driver-core@lists.linux.dev>; Wed, 27 May 2026 06:24:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HAUMxWEqbUoo+GQswDjkkPT0Atd4EUJPSk3dCyVkYfxvwjNucAVTpL9tyyhS0IaZdXO9dRXWWPDhg5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIqMabqHQDo0byNduuWXgrbhmMTabUXye8p1V1J1v2e3TlqhvC
	U0f7Q/y+bVlee9USWpp0AwVYn4xarfrIfiwOUSSXoH55e4EZH9oEXN28llLZsbQ4o/VL6XqJ+IL
	Co8VkJby2hcNSIWdrfZGgCeCnjwxmcQQ=
X-Received: by 2002:a2e:9a15:0:b0:38c:63df:8298 with SMTP id
 38308e7fff4ca-395d8d70fd0mr78032971fa.28.1779888252359; Wed, 27 May 2026
 06:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-fileops-unsound-redesign-v2-0-6fc11066b530@kernel.org>
 <20260526-fileops-unsound-redesign-v2-2-6fc11066b530@kernel.org> <CAGSQo03Fv_qqGTxugL1eddby4wfiUm9MHevnNxyg1dVXAfCA4Q@mail.gmail.com>
In-Reply-To: <CAGSQo03Fv_qqGTxugL1eddby4wfiUm9MHevnNxyg1dVXAfCA4Q@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 27 May 2026 15:23:36 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9mzqO3cOwEMCYb53C=CxiAD-Jfq=o9Et4XcFii7v2zW9A@mail.gmail.com>
X-Gm-Features: AVHnY4KPCnpcjUZCBQEunDjg6m3mWpkXnjnznfqZl2_-QoEC4eOLWESJy3fjTjY
Message-ID: <CAJ-ks9mzqO3cOwEMCYb53C=CxiAD-Jfq=o9Et4XcFii7v2zW9A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: debugfs: avoid transmuting FileOps
To: Matthew Maurer <mmaurer@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 4:18=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> On Tue, May 26, 2026 at 11:08=E2=80=AFAM Tamir Duberstein <tamird@kernel.=
org> wrote:
> > `FileOps` has the default Rust representation, which does not guarantee
> > the same layout for different generic instantiations [1]. Thus the
> > reference created by `adapt()` is not justified.
>
> This is correct, though I'll note for the sake of anyone concerned
> with an existing kernel that this can only break with
> `-Zrandomize-fields` in the current compiler - the layout engine only
> examines layout data + an optional random seed when that flag is set,
> so swapping out a ZST, no-alignment-requirement field for another ZST,
> no-alignment-requirement field will never result in a mismatch unless
> you are actively randomizing fields.
>
> > The callback operations do need to access private data through one of
> > the transparent adapter types. Express that relationship directly: make
> > `Adapter<D>` the unsafe proof that operations implemented for an adapte=
r
> > may access stored `D`, and instantiate the corresponding operations
> > tables as `FileOps<D>`. The adapter implementations are justified by
> > their transparent representations [2].
>
> I think your approach here may need to be adjusted because:
> 1. `Adapter` requires additional knowledge at the trait usage site
> (that the invariants of the target are upheld - specifically
> type-inhabitedness).
> 2. You now access `FILE_OPS` directly off the type, rather than off a
> value, so you no longer have any proof that types are inhabited that
> you require.
>
> You might be able to rework this so that you can track inhabitedness
> properly, but maybe a simpler resolution might work - what if we just
> add `#[repr(C)]` onto `FileOps`? The addition of an unaligned ZST
> field to a `#[repr(C)]` struct should never change its representation.

Thanks for explaining this. I had missed that receiving a callback
reference at registration does not help justify reconstructing a value
of its type later, once the operations table can be obtained without
that reference.

I tried to follow that observation through the existing design.
`#[repr(C)]` appears to address the transmute of `FileOps`, but I think
the callback adapters would still discard the callback references and
later reconstruct `F` and `W` through `materialize_zst()`. So I have
been working on a more intrusive v3 that removes both mechanisms.

The approach I have currently is to use debugfs auxiliary data to retain
the actual callback references. `FileOps` becomes parameterized by both
the backing data type and the auxiliary data type, and callback
operations recover their callback value through `debugfs_get_aux()`.

This is not API-neutral. Debugfs exposes one auxiliary pointer, so a
read-write callback file needs one object containing both retained
callback references. In the version I have now,
`read_write_callback_file()` takes a `&'static ReadWriteCallbacks<F, W>`
instead of two separate callback references. There are no in-tree users
of that API, but it is still a visible change and may be the wrong
tradeoff.

Does this seem like a reasonable direction?

Thanks,
Tamir
