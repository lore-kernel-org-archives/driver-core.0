Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD843793DC
	for <driver-core@lists.linux.dev>; Sun, 19 Jul 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784457641; cv=none; b=M1JOpKLEGp8OY2rhkvIkLV8DHVBXRebpQaabONF2X0vKYSJrd0bYYZGaelUNy9Zi2MoSWL5sT0HJyU0ZTlPJ5oEJId45zTvFhOt6FGwiiC7qUbYDvKJ12D5hFuKKX5w0mqccN0hO3aq9zqDk80QonZQXZGiR//l/7earXn8DDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784457641; c=relaxed/simple;
	bh=46IJyqisk8+0DDSzTFOuTVoIOMOKMmD/CIIhjJ3Z9+I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lyqn6XkwJmUxu1w9EFb23SAKsB9sO8UpCOXDCzzLrOAajnqkMJfQ/dLuC5O1rv5895lmbG12hcpXKOYWorpIvIGLRSzLbaCuvUusAXG+xn29l2/5Nmw+pmMOpw5/HmM5oUAo8dNrBttUi8SoyPPr0BPv621LFafQjom31v/++j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=US4t7lxp; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="US4t7lxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784457626; x=1784716826;
	bh=zUxHqzZSBc5RXM72ArQovGGBnJ3WnpK1SD3so7JOaw8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=US4t7lxpZvtGKR4YcO1W14Rg17A91+J1/CaVf7ScGSg+RfMv3/OetOjrlYwd8GyXR
	 TVOo3HcE6jgvsId8OR7bzmGHfF434qj54rMwyWjeh0jnc+M2gzYnTcOc/AcHBH6xkk
	 DQoYSLMlvLUBVeKoH5f+yfQZf5FSeWBff7baQN4eD/z/6RTm7BW/6pmT3RRIyleyF5
	 cRH64Ys282V6dLpx5Y2I8ruKW8FpU/llqT8v9usAhB2m3IHJspuMqJO01i1F7KNBmZ
	 /xkkWJLOalMDaOnLleoxJsiZWkurUoFrXGsKcO+x/smAlbIXU/MYeawyrYeXnK6JZ5
	 jJfVuowTUp+Mg==
Date: Sun, 19 Jul 2026 10:40:19 +0000
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev
Subject: Re: [PATCH] rust: io: convert ResourceSize into a transparent newtype
Message-ID: <20260719104012.364283-1-lnsdev@proton.me>
In-Reply-To: <DK0BPAHR8IS3.2KLSLH7K448RJ@kernel.org>
References: <20260712113602.389060-1-lnsdev@proton.me> <DK0BPAHR8IS3.2KLSLH7K448RJ@kernel.org>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: 511a3e7a8a9ded91417d401cf07b2a6e0a605640
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Jul 16, 2026 at 11:45 PM CEST, Danilo Krummrich wrote:
> On Sun Jul 12, 2026 at 1:36 PM CEST, Lorenzo Delgado wrote:
> > -        let num_pages =3D usize::from_safe_cast(sg_entry.dma_len()).di=
v_ceil(GSP_PAGE_SIZE);
> > +        let num_pages =3D usize::try_from(sg_entry.dma_len())?.div_cei=
l(GSP_PAGE_SIZE);
>
> I think this is worse, as the conversion becomes fallible.

Agreed, that's a regression for nova-core, where the Kconfig guarantees
the value fits and the conversion should stay infallible. I'll drop the
try_from() there.

> You could implement From<ResourceSize> for u64 and then keep using
> usize::from_safe_cast() in nova-core.

I tried that, but it doesn't build. ResourceSize wraps resource_size_t,
which is u64 on 64-bit (CONFIG_PHYS_ADDR_T_64BIT), so the impl the patch
already has,

    impl From<ResourceSize> for bindings::resource_size_t

is already From<ResourceSize> for u64 there, and a second one conflicts:

    error[E0119]: conflicting implementations of trait
                  `From<ResourceSize>` for type `u64`

There's a simpler way that stays infallible and adds nothing to io.rs.
ResourceSize already has into_raw() (io/resource.rs uses it at the C
boundaries), so nova-core can do:

    let num_pages =3D
        usize::from_safe_cast(sg_entry.dma_len().into_raw()).div_ceil(GSP_P=
AGE_SIZE);

into_raw() gives back resource_size_t, and from_safe_cast handles that
as u32 or u64 depending on the config, so it stays infallible. I'll use
that in v2 unless you'd prefer something else.

> Alternatively, we could also consider moving the FromSafeCast trait to
> rust/kernel/num.rs and add FromSafeCast<ResourceSize> impls for usize.
> [...]
> However, by making it commonly availble I do see a risk with the
> cfg-gated impls silently breaking the build.

Agreed on the risk. A FromSafeCast<ResourceSize> for usize impl would
have to be cfg-gated like the u64 one, which is the same
silent-breakage-under-randconfig case you mention.

Since into_raw() keeps this patch self-contained, moving FromSafeCast
into the kernel crate is a separate change from the newtype conversion.
It seems worth doing on its own, and I'm happy to send it as its own
series so it gets reviewed as a new core API, but it doesn't need to
block this patch. I'll post v2 with the into_raw() change.

Thanks for the review.

Lorenzo

