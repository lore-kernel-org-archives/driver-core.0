Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9E156661
	for <driver-core@lists.linux.dev>; Sat, 30 May 2026 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780139895; cv=none; b=X33IlgtNFp8zApfBQSoD8JYtL8M7kuWLSdydtO8qEo48T6UuO0YuY31HKO9fvWDui97hlpX22hHrfXaRomB4blq49ZR04oN7YkDzjvUPjDe/2OfKxHEQWuipuLJYYbjr6gLP/Az6qzYrFgTAgUaCC6EXQUl0q8nFOcU0K3KyC14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780139895; c=relaxed/simple;
	bh=Q5TGsZROcJWmcOyKL/oQkN4v2uUEm+1teb/WHG5cXV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYuKE+pfEAlNijdlOdKUt6Gz6rzHM03KOLl4iXuCctoHofUNPQZs+RkeHK5EiYyijxurSsf7Mpozd9ARJBUkNGockT9V9muaSu4U2L3l44pSAoIc7Sq5YZPKKIX+6Nt9maT24+hGydUVbqeoz0VVjmX1GRYAoMrWqSzbQsPIBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTMxvyAw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTMxvyAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F971F0089C
	for <driver-core@lists.linux.dev>; Sat, 30 May 2026 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780139892;
	bh=Ccev3Fye2FqNyre2qH0MG6jq+rX5lkqnISSRC9L/mlw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jTMxvyAws6XPomXsdV2+XLNenZMOFMhXP/620za909+z9AUqYegljfuUBHvqyHxbk
	 BGAOZ1f/0EaSHRkCf2NnCu+Vke3ARGaq+/Sq0/uZeS5SrJNER+Y1ijEe5vMBabuoNF
	 +9PLZbMIivVMU1cE7aGSuKGnh86bPGEEh2GtL+nbaa4PAe3CjYTo1uh9GBEoJ/hdWJ
	 aYw0nVbb8LGqD/cO4tgM6BCwycZWAmq3h3skCtb9h7sTmAUaiiutIox4Crc81WBJWO
	 iHcxud3yH4FY1GNVEjqfXOgtHdn/Z7feUPWt3p+WDICc1xWeSlYGTWJAfzVzjEQBiE
	 4g3EEqJfQpxeA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3965bc493caso8854901fa.2
        for <driver-core@lists.linux.dev>; Sat, 30 May 2026 04:18:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ95MawDbcKZIx7UuD3VAobsV8fmLW4J5d1tHyh43a+WAxBtH3NtY2ZYNdTh4PUfW7VhfXTkbyE7iy4cEw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx861hQyFvZknbD+cslWzPEuosGhIejyE4Pr1PBC5eC3BFe+FZr
	RBBzoqsirFrAgzGeaYpeq4aqF6E/JzwPf/E6DsCgGwaRFQK6Yu9P3Y7fH0mTmak8Cy3BeJ+jYeo
	xJUSSJ6BpeD2R/K34x+yAM7qxoXSOOwg=
X-Received: by 2002:a2e:3c02:0:b0:395:5afc:fc5d with SMTP id
 38308e7fff4ca-39664fcb9f4mr7242891fa.29.1780139890940; Sat, 30 May 2026
 04:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-trasnmute_ptr_to_ptr-v1-0-d89bc1dda3b5@kernel.org>
 <20260526-trasnmute_ptr_to_ptr-v1-1-d89bc1dda3b5@kernel.org> <DIUCGW63J6ZU.2BL1N832XXYUY@garyguo.net>
In-Reply-To: <DIUCGW63J6ZU.2BL1N832XXYUY@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 30 May 2026 13:17:33 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9njMdNW0vbGBh1TP6m+3N+QPPKvVtd8V_nvtDvSNfxkTg@mail.gmail.com>
X-Gm-Features: AVHnY4J5E7mfIRetjnOAh-5c3GgIPl8lpKYMq26egh96R9twCS2VYkb2WJgD6ds
Message-ID: <CAJ-ks9njMdNW0vbGBh1TP6m+3N+QPPKvVtd8V_nvtDvSNfxkTg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: device: remove unused ref-to-ref transmute
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 7:07=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue May 26, 2026 at 3:39 PM BST, Tamir Duberstein wrote:
> > The Ok return value of `read_array_from_fwnode_property` requires a
> > reference-to-reference transmute to construct but is never read, thus
> > remove it.
> >
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > ---
> >  rust/kernel/device/property.rs | 42 +++++++++++++++++-----------------=
--------
> >  1 file changed, 17 insertions(+), 25 deletions(-)
> >
> > diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/proper=
ty.rs
> > index 5aead835fbbc..87be2784f7a7 100644
> > --- a/rust/kernel/device/property.rs
> > +++ b/rust/kernel/device/property.rs
> > @@ -136,18 +136,15 @@ pub fn property_read_array_vec<'fwnode, 'name, T:=
 PropertyInt>(
> >          let mut val: KVec<T> =3D KVec::with_capacity(len, GFP_KERNEL)?=
;
> >
> >          let res =3D T::read_array_from_fwnode_property(self, name, val=
.spare_capacity_mut());
> > -        let res =3D match res {
> > -            Ok(_) =3D> {
> > -                // SAFETY:
> > -                // - `len` is equal to `val.capacity - val.len`, becau=
se
> > -                //   `val.capacity` is `len` and `val.len` is zero.
> > -                // - All elements within the interval [`0`, `len`) wer=
e initialized
> > -                //   by `read_array_from_fwnode_property`.
> > -                unsafe { val.inc_len(len) }
> > -                Ok(val)
> > -            }
> > -            Err(e) =3D> Err(e),
> > -        };
> > +        let res =3D res.map(|()| {
> > +            // SAFETY:
> > +            // - `len` is equal to `val.capacity - val.len`, because
> > +            //   `val.capacity` is `len` and `val.len` is zero.
> > +            // - All elements within the interval [`0`, `len`) were in=
itialized
> > +            //   by `read_array_from_fwnode_property`.
> > +            unsafe { val.inc_len(len) }
> > +            val
> > +        });
> >          Ok(PropertyGuard {
> >              inner: res,
> >              fwnode: self,
> > @@ -474,12 +471,12 @@ fn read_from_fwnode_property(fwnode: &FwNode, nam=
e: &CStr) -> Result<Self> {
> >  /// It must be public, because it appears in the signatures of other p=
ublic
> >  /// functions, but its methods shouldn't be used outside the kernel cr=
ate.
> >  pub trait PropertyInt: Copy + Sealed {
> > -    /// Reads a property array.
> > -    fn read_array_from_fwnode_property<'a>(
> > +    /// Reads a property array into `out`.
> > +    fn read_array_from_fwnode_property(
> >          fwnode: &FwNode,
> >          name: &CStr,
> > -        out: &'a mut [MaybeUninit<Self>],
> > -    ) -> Result<&'a mut [Self]>;
> > +        out: &mut [MaybeUninit<Self>],
> > +    ) -> Result;
>
> I think the old signature is quite reasonable. You provide storage and th=
e
> buffer is filled and that the return value is the proof of initialization=
.
>
> If you're concerned with `transmute` it should just be replaced with
> `assume_init_mut()`.

The signature is reasonable, but it is dead code. This is a private
function; I see no benefit in keeping dead code around. If it is
needed in the future, it can be easily restored.
