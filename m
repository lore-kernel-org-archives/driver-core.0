Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9A539732C
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779826726; cv=pass; b=glzMCOV+ikAjG8qS5QoYggvp63F7tfNC2bVQ1Wf7vKF5fA3VR+SVyUUv3jAEcSpqCrsoq1Eczsb9IHKml+LmDBly7AlnKCQjuA1vNM3Q26kiKOYIH8wGtuSjHXVkL1f7Sgx7Ptp/17Z3zR12Ln5Fz+cB8T2OWX4Ujcy/hq5b5aY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779826726; c=relaxed/simple;
	bh=2EfW5FJiLUMdxFZx0t3GAXCm7D9MDorB8Rk3fnu3n2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9oIVU4KuOZBlLyapAfq9ZVeXbtI99q9usjAivoPJE/V3JCDTv31xuBFXknCRWSlf3/Fa8/pIPdeMEKLEC8mYkqCV6O7U7TOi1QbnJAOKKQOiR9vtmDFYfAGm7OUVaS4YKntL5GxGmjcr7o0f4y+CKRGdSzOJqWMvzKj8IBJqwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oKhXlqXL; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oKhXlqXL"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so84a12.0
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 13:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779826724; cv=none;
        d=google.com; s=arc-20240605;
        b=cpoHOnyziHJrTsnvOSnAoKpn2O75XG5W275NxMvI3M8+zYEyhVHhIBj1bbrwVPadUl
         YohnygROAvQ/i2j2ObBc6NDhFN1+y1uBkpw5jLTi5WvT8p5V5ppYyiUZhxTO2EK6GWd9
         q8VRNVcmnUTl54cVEqOjs8Aw1wSxN+yxs66TlXdrAP4481rtaGQJxhouxucsKDNE8kkR
         JxhLBfLEoscYCr95PI5Zq4rxjG5y3TqiOVq9ws3+TrUAtF7EZ4rZMs7zxxtjdT/Hf3z9
         ynOIgHphMAtG1ymJst7uBYSf082N6G1+W6VnjHtuhaquCrINJC59yULFzUB5ZhTnIZBo
         wmOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aJlM3BAYDrmo3DwancX1ED2w1utQAochXYkQZkRqHXo=;
        fh=+RPjkBKDmkS+mcRzpa65+1DuQXW5+/64j0CuIASb428=;
        b=R1HyPJQFL2942CwlV6v+vj+K9rQ0oMD7+Zf4HmigteIC0xkFqwLq0y9mK/FiAHlibi
         2qPRjMfHQQz4QjxfhlFhC6k03z8sGeljYy5bYJRW7ig2kGvZWrBpOjRKJEe20biZIN4X
         8qDKCZ8CxKxfBuk8MSUovvFc+kkm17df6BvVtowEPsF6QTbR5E4jQvrOkcL0+ZRwLRAo
         RyZKJWgXUGYl+yg9oadFLGgAtcGFEWj57a+kGy6Zcoq4X7evUIY06RwBAN5Vs0Wlvrx0
         pzR+uz084REcb5iTIT0giQ8gQKKBn1hxc46KXTNC7tARBbt4o0NjZX/g01RtCs+COQF9
         WP5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779826724; x=1780431524; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJlM3BAYDrmo3DwancX1ED2w1utQAochXYkQZkRqHXo=;
        b=oKhXlqXLRjS9AU2W6P3L0WS7BhJGrENCVFlT7aeoiang+tepL57wMeOi/XUNjFdbqq
         8FE6zBUl/MS//4KVj+bkFEqUStLYE816Kili1m3cnt5llMZ3mf/F9J/QMMNqhsgOXIcl
         V2j/H7BiUjSG1/URTHcju+uUHYyjE1MTIORtwyz8V3OX6dA4h3jh62pnG4QcT+tA6BAS
         3sufFd4YdIoI8zievzjU6DlnVmTX4EKhgr82b3gbmZTjApvkMvTKZsQidflOYnkrqj8+
         UIbyvnivzg+BUjHmhvxsFjpeqKfTuLqUCT/JWz+F2K/aHeqydff305kyanWDiOTRqejj
         2M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779826724; x=1780431524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aJlM3BAYDrmo3DwancX1ED2w1utQAochXYkQZkRqHXo=;
        b=SJqg02GRicL2KGxBJqf/gZdMPL6m0tjdxaYXKu44tPmQ7NuTmsKvyujZHUjXQvxmx+
         Kh5ESr69tciXmfmf4EIpdOYEw0vT2HKDFh8rZCmf3HV3kakZy4+yZ722Bs2iFmRvvCno
         ODY+bp+xOMCh+o+8JjpcSea5ZwKDNupTRY+h6X8QR+ADY8x9fTVoABFlJVYxzCD7ZbQc
         sVDrhNVIMskZV/TrW5blOjZLDfeFAXfEyZVBDFc9L1CFWI4LEoMfAWlRMMha52K0QoX4
         Bco6401Jl7O4ra4P8uJc/K6EVnRAYQP/RfuOxUWNGfRQcCreT2nbCB5j4zEIjMwr38Ky
         5vWw==
X-Forwarded-Encrypted: i=1; AFNElJ/fsxWkhjuBJvBRuFlpIrZ/w7NFu208QPAHPrikxEPve23HRzhlXNTehW32+aPtvHMhC8O2nMzr2IN+cw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAe8Og6Zf61hTPgZ8UWbV3CHmb88N00oVwKQ4o0HrQ9ZA65AZ8
	lRK69vhETWLEMObVURkG3nCs9paO7u9wx/YXRICWMs4jOwNlbdA6tdi7VL4a12hy5DqYssho56p
	WQZ63YHfSHS3NMXXbA/Gxa2D5Lk5KQcqlGfwSqT7Z
X-Gm-Gg: Acq92OHR+3Itj8fsPT82VGFu2EYgUBqJ1HpHw2PurIUAQ9QW7YjaQp0zO2RnfgdhPpC
	z35E4bTDrcvF2B81kgH+ww6Oy3h7FFDxf4EXDzpKHWxdkHRgMlKK7z/jYg/2qw10diXr0f9Loia
	G+yCFcwf40JqWlbIybgiHlwdJVk/C/w9+oI7fgUqkJl1awGyKiujKhvh7YQa4jt9qIHrC2Uvm7D
	1q40veFaNo4/pfiXsTG+h8/zJN+/U9S0ZG8wKdbWRRPtWfUQS1REc+J9Ulvit1C3dGsmNo+kSzM
	pN9W86V4Oc1qX5udP0Z1fA942c7G+fWyALa6oGa6WWnnOFE=
X-Received: by 2002:a05:6402:100e:b0:67c:f3b6:5fef with SMTP id
 4fb4d7f45d1cf-688fd13675cmr181352a12.6.1779826723187; Tue, 26 May 2026
 13:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-fileops-unsound-redesign-v2-0-6fc11066b530@kernel.org> <20260526-fileops-unsound-redesign-v2-2-6fc11066b530@kernel.org>
In-Reply-To: <20260526-fileops-unsound-redesign-v2-2-6fc11066b530@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 26 May 2026 13:18:31 -0700
X-Gm-Features: AVHnY4JZHjLPzhwx15C8hQq2kw1MyRAsEHnLXCiNNpE1KCJ7vZ6SPIU_N1J_OZU
Message-ID: <CAGSQo03Fv_qqGTxugL1eddby4wfiUm9MHevnNxyg1dVXAfCA4Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: debugfs: avoid transmuting FileOps
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 11:08=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
> `FileOps` has the default Rust representation, which does not guarantee
> the same layout for different generic instantiations [1]. Thus the
> reference created by `adapt()` is not justified.

This is correct, though I'll note for the sake of anyone concerned
with an existing kernel that this can only break with
`-Zrandomize-fields` in the current compiler - the layout engine only
examines layout data + an optional random seed when that flag is set,
so swapping out a ZST, no-alignment-requirement field for another ZST,
no-alignment-requirement field will never result in a mismatch unless
you are actively randomizing fields.

> The callback operations do need to access private data through one of
> the transparent adapter types. Express that relationship directly: make
> `Adapter<D>` the unsafe proof that operations implemented for an adapter
> may access stored `D`, and instantiate the corresponding operations
> tables as `FileOps<D>`. The adapter implementations are justified by
> their transparent representations [2].

I think your approach here may need to be adjusted because:
1. `Adapter` requires additional knowledge at the trait usage site
(that the invariants of the target are upheld - specifically
type-inhabitedness).
2. You now access `FILE_OPS` directly off the type, rather than off a
value, so you no longer have any proof that types are inhabited that
you require.

You might be able to rework this so that you can track inhabitedness
properly, but maybe a simpler resolution might work - what if we just
add `#[repr(C)]` onto `FileOps`? The addition of an unaligned ZST
field to a `#[repr(C)]` struct should never change its representation.

> +/// Operations may reconstruct a shared reference to `Self` from a point=
er to

I think this is the crux of the problem with this approach. Users of
the trait can't really know the invariants are upheld as-is. See later
comments.

> +/// `D`. Implementers must also arrange for any additional invariants of=
 `Self`
> +/// to hold whenever such an operation is called.
> +pub(super) unsafe trait Adapter<D> {}
> +

>  ///
>  /// # Invariants
>  ///
> -/// If an instance for `WritableAdapter<_, W>` is constructed, `W` is in=
habited.
> +/// When `WritableAdapter<_, W>` is used for file operations, `W` is inh=
abited.

I don't think this works. `WritableAdapter<Foo, Bar>` can be crated
for any D and W at compile time, there's nothing stopping it. That
means that the `FILE_OPS` constant produced must be valid or fail to
compile. Invariants on types are runtime statements about the object
level. You cannot check for `W` to be inhabited at compile time, so
this isn't a valid invariant.

>  #[repr(transparent)]
> -pub(crate) struct WritableAdapter<D, W> {
> +pub(super) struct WritableAdapter<D, W> {
>      inner: D,
>      _writer: PhantomData<W>,
>  }
>
> -// SAFETY: Stripping off the adapter only removes constraints
> -unsafe impl<D, W> Adapter for WritableAdapter<D, W> {
> -    type Inner =3D D;
> -}
> -
>  impl<D: Writer, W> Writer for WritableAdapter<D, W> {
>      fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
>          self.inner.write(fmt)
> @@ -58,19 +58,20 @@ impl<D: Deref, W> Reader for WritableAdapter<D, W>
>      W: Fn(&D::Target, &mut UserSliceReader) -> Result + Send + Sync + 's=
tatic,
>  {
>      fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
> -        // SAFETY: WritableAdapter<_, W> can only be constructed if W is=
 inhabited

I don't think this is valid - you don't know that `read_from_slice` is
only called after creation through the callback API. If that's what we
want, then we need to make the trait method `read_from_slice` unsafe
and tell the caller they need to make sure that's how this was
constructed, and things will get out of hand. This is what I was
referring to earlier - we want to use the presence of a
`WritableAdapter<_, W>` as evidence that `W` is inhabited, but we no
longer can because of the invariant change.

> +        // SAFETY: The callback API obtains this implementation only aft=
er
> +        // receiving a `&'static W`, so `W` is inhabited.
>          let w: &W =3D unsafe { materialize_zst() };
>          w(self.inner.deref(), reader)
>      }
>  }
>
> -/// Adapter to implement `Writer` via a callback with the same represent=
ation as `T`.
> +/// Adapter to implement `Writer` via a callback with the same represent=
ation as `D`.
>  ///
>  /// # Invariants
>  ///
> -/// If an instance for `FormatAdapter<_, F>` is constructed, `F` is inha=
bited.
> +/// When `FormatAdapter<_, F>` is used for file operations, `F` is inhab=
ited.

As above - access to FILE_OPS is not unsafe, so you cannot make the
caller required to prove something to access it. (And you certainly
can't do it here - such a declaration would need to be in the trait
defining the `FILE_OPS` constant at a minimum.)

>  #[repr(transparent)]
> -pub(crate) struct FormatAdapter<D, F> {
> +pub(super) struct FormatAdapter<D, F> {
>      inner: D,
>      _formatter: PhantomData<F>,
>  }
> @@ -87,27 +88,22 @@ impl<D, F> Writer for FormatAdapter<D, F>
>      F: Fn(&D, &mut fmt::Formatter<'_>) -> fmt::Result + 'static,
>  {
>      fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
> -        // SAFETY: FormatAdapter<_, F> can only be constructed if F is i=
nhabited
> +        // SAFETY: The callback API obtains this implementation only aft=
er
> +        // receiving a `&'static F`, so `F` is inhabited.
>          let f: &F =3D unsafe { materialize_zst() };
>          f(&self.inner, fmt)
>      }
>  }

> +// SAFETY: `FormatAdapter<D, F>` is transparent over `D`. The callback A=
PI
> +// receives a `&'static F`, which establishes its inhabitation invariant=
.

This is the problem - the impl itself can't know that we got a
`&'static F`. You'd have to demonstrate that at every cast site, and
the knowledge isn't there anymore because you removed the construction
invariant.

> +unsafe impl<D, F> Adapter<D> for FormatAdapter<D, F> {}
