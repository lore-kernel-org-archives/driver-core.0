Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F0F257845
	for <driver-core@lists.linux.dev>; Sat, 13 Jun 2026 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781345146; cv=pass; b=bJYuX79weqF7efYcRp1K3cEIO/eY3NW4lXEQkM9nqVV6iJHVDXanebj6gw+27Mp0Nri3Fm/j8V4vsAxoHOkM/8wO/T1gOUgaKs1oR7gCBtALrOyJ612IV4Rpc3vW2H+3bYYm9bt08QgFR/ydPQZ1ploUhfYrMElQR+AgYiF0mHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781345146; c=relaxed/simple;
	bh=a9H86iIlJln7zNImJOs7H3Twwdm5fUP3s4vZPkvhH/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHJjf3J1+hnfBOzV0YwacxmdmGB4X1Zmya8zQpatvEg9RByw0RIEcx3rH2DSxUtsuJT8FwD4XKrCecgX7WNH+Gk+kZmgZ2P95vuz32r9d8OuwEM151X80W2kSLpS80Ta8lF6lnhfrl0zR5iMPlqhiBGa8q/Lf0+hNCM7KYogx6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2WP5XCx; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2WP5XCx"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304e86ecebfso116939eec.0
        for <driver-core@lists.linux.dev>; Sat, 13 Jun 2026 03:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781345144; cv=none;
        d=google.com; s=arc-20240605;
        b=MV9DwdjkChhCM21oNL8PF9rZA/4xkwmohNubVmV1R7DvdtkDKEKHawSTWu4QoHSpSx
         uYd1nFJ4seWz1u05n9KEngD0Fy5xqXbSSYR7McWuhB23bHF2FK5fK+aLSyN0qzv3xGj3
         Dum2k2ogEx3+G+VggTqjK/LCzVyzlF7pGWSQNptwx/mwba2KxIkg0ok/3GJLDqH5m4gj
         4BtMvnBUQzqjhRMu4vHjXYjMvpJqB+J25cCsMo1xuF86glbC2xdQ3osefDHqGp9txw4N
         XBTfX+I+LbOoyIDmUDjn1ygzANADLjC4oYWuxlUPj1W/NeeWa8Rvhqzb0v+09QBf0Fj8
         iI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CBjNOSpJlw+yD+1WI2YpvIUWPKEOoXhGnrq65FYW9Fw=;
        fh=RBYfxgfIHatN5KY2uL/rKgNpfnRP/qulUF5zIrDcXSQ=;
        b=NAmPGwDomDh1UmkOd23J79tEtf2LHEZ6GAe2Gq8Kk2jBvei0XttBscxx2fFpW0zQzy
         rzwkM3UgnTxoeSrebmLP00v45iA1zcuJwsMLCBSv4UXUyrSJgYQWRuN+NzqW5azfugaM
         sq+bP5cioAELcJTspIBNa5ukfstiGasywILyQGybJFjMeomeVdwtbeay4b7lSD5U22na
         8JkDcWmRQNwuGbjyyu3ZqePBGSVg1OfCZssQDkwgcHsyUhHiX53dtCT+JUlzcAk4vFm7
         Ac/9fhijeNy3bPqs7yFjSNGcAlJ8MY5dh+sTV+cCPRoJBBQTEejiBPX+YijZesU1fjKA
         1ZiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781345144; x=1781949944; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBjNOSpJlw+yD+1WI2YpvIUWPKEOoXhGnrq65FYW9Fw=;
        b=U2WP5XCxt7YroHfOQRAV6+lR+XIcerwVpLI/hNgPF82huHD3tn3bL/lX4J/5f+QHqd
         Qyx6RREUfG9dC9sUsGtmzXiTIMyOHwQFQ1MACO/BGCGOBNAMF6mOXAMb1I9xB7bYZJgg
         wbd3gRb+fHpMeDQWCjuezPNmL4kGgyuVHgCkQezSt43mww9ZDyOErv4EewtnWiRtRmme
         JgLrT4lvtR25ENf5nQB8hGkIvEHPsHalFPyXoYJNajT4+Jpm7t9aZLEmo/wHvuq2fEv7
         9BNUFgaOHBGjI8WAnk6hhjk+slmNGO5LAGsfC+km2uLsqRehkZLl4VLQLTpr2ja7+k0E
         WJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781345144; x=1781949944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CBjNOSpJlw+yD+1WI2YpvIUWPKEOoXhGnrq65FYW9Fw=;
        b=diUrNZlihc8gJ/bEhiEJ3UyIw+8LyOpKRlgHObn9fJv1kvZPWnKOQCuWCwdlqBR47u
         3H/AXnuxTJT/DodAZOHYPGcPWbUBVRNtoXPNXFYkb/sWep2oVG8fqbL3lHZzL6a6vGRM
         qD1eSKARUWVhhrlLWD5eaY5QqYbq0898NR7d66HZDkAYAmluaMQV5m1NS1/aVUCKh1GU
         v47ynTg5O7MiyA9O6aOJHUzAAhP8EL1IPl/bDUdiHw+/kkn4GA1pvsoCaiLcskdod+rj
         7fHk2qD1aioKS0thhDb+S8Zjjqrp7UwEf2akcCN5P50p0gt/v0IZnQ4AnLzLBQs24by4
         a8/w==
X-Forwarded-Encrypted: i=1; AFNElJ+dKI6HzbSZIxPCx0UYc7xSfUHG3wGvOG5bFimLc6T5chF3e3+2m5MSWAvP6i4J55iAtn5cjY5raeDI6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/q5BKtMlKYRHAxOnxcHsWFMeHzoJrMB5BLNOTL/bcGaP/FRBD
	v6Ld8/AkfQ005/491N/FEIxRxWZhXtMiMxkVV0jLio3PMPGp541PfxrEYY9pACW/XAP+trlsrUd
	7SanRx6KiMJOVH/r3zCPX8vrgUVI7Odg=
X-Gm-Gg: Acq92OHF2AOEh7RMZ9yX6h0nHH7EhOttAdsvG1wTWzc6s8yjgn1c/ex155/GlGMrfZG
	mUava2ba0/yYzNBu3KSqHfYbRr3aJK4i/zK9Mzlx0sMPm2uu3quXs7gK767Fwc9n9isM4MOYUSv
	pOcYsV3ElSp3wvJZPBPyaN3WhpvSsmtzNOmD0ncYLQ6mol+8JzAUlQ9ngBZbngFkiT+5/9qN72q
	pyHBiOTp65yGsyk5O6VE2P1lap7nTszwadU+63c1toSozy0Mfg9oh11/2jjBWfiugTknnKLdbqD
	/apGh4xkeQ1xFeKTKYYPtfxYpbRYarpoWY8l/Sqp7ZboKNPPuwKhiawFGXD1QCSW4T/7aflGaNw
	a5yqPjaAxP3hgAGc451PLMcw=
X-Received: by 2002:a05:7300:641a:b0:304:e327:aef8 with SMTP id
 5a478bee46e88-3081ff62e8fmr1477519eec.2.1781345143929; Sat, 13 Jun 2026
 03:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611-io_projection-v4-0-1f7224b02dcb@garyguo.net> <20260611-io_projection-v4-1-1f7224b02dcb@garyguo.net>
In-Reply-To: <20260611-io_projection-v4-1-1f7224b02dcb@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 12:05:30 +0200
X-Gm-Features: AVVi8Ce5ZWN0tgHXx4wgAxeDGhIDTq9KOdKjeJ9s14OzuckvDKwA8hSyjUXURv0
Message-ID: <CANiq72mLqrcdZEAGM1wJ6OE7yUxzDT4dRsYjO91kPzoB5h6mfw@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] rust: io: add dynamically-sized `Region` type
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +    /// Create a raw mutable pointer from given base address and size.
> +    ///
> +    /// The alignment of `base` is checked, and `size` is checked agains=
t the minimum size specified
> +    /// via const generics.
> +    #[inline]
> +    pub fn ptr_try_from_raw_parts_mut(base: *mut u8, size: usize) -> Res=
ult<*mut Self> {
> +        if size < SIZE || base.align_offset(4) !=3D 0 || !size.is_multip=
le_of(4) {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(Self::ptr_from_raw_parts_mut(base, size))
> +    }

Hmm... I wonder if, at least for the `try_` one, we should have `//
INVARIANT:` on top of the `Ok`, since we at least checked that part.

> +// Stable since Rust 1.87.0.
> +#![feature(unsigned_is_multiple_of)]

It indeed appears available without changes since Rust 1.82.0 <=3D MSRV.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I think Danilo asked for the Acked-by back in the first version but
you dropped it since the patch changed, so here it is again :)

Thanks!

Cheers,
Miguel
