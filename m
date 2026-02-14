Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0DA27707;
	Sat, 14 Feb 2026 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771063500; cv=none; b=k2JW9468XatLov16A6yiq1lNUiPRTujfP1oPni2ji7qQ+9XnL2eC24g3JIBPvCXmxJDoHcXGlTnuThOWmbbQk3hLtENcTtN8I1kZHqRxTL7RMaSncG0ScWzvbVwwWypXgsOMDUxRPanZPBOjrxHbyur72968WRvYoC4JhkfiSvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771063500; c=relaxed/simple;
	bh=ktlgjjJnThkWNtfX2JdHDqVKfSsH2ZRXJ4MLTDj4id8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uagt+/wcXa9X5+zrXi+C/ndHLEY3nEUxU0EeZBJHjnkOMmaXukSBV4Tx2kCadv9HffR4jEvmsGkwIqXDuI/MZy2Z52UJMvTsiEwj0GF7V6qu5V4nZ0qt5V6u7GwoX5goy4zRPze+ru/FYmaEyOMa0YWlYhI6A4m9KPffo93+0Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ptgguOky; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ptgguOky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B2DC16AAE;
	Sat, 14 Feb 2026 10:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771063500;
	bh=ktlgjjJnThkWNtfX2JdHDqVKfSsH2ZRXJ4MLTDj4id8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ptgguOkywMACAx+gNnc5ibtUibXTW5r0Obhlb5BCq41P7UCNHyMM+v5S2lmPkRr70
	 FxDdIFrwSla9cZneDxGwKI51aXNQf2QhuMrosTW0NvPa6rbR1v6IC9wXirG/innfJ3
	 BghCRuyMlsl2zd516UpQ+2G0dV4bUozOUqEVV8jJAbDC0MyZrfMnD9s3b8sm7mY3FU
	 HIqkxl9+YqIE8OSbnajDHIO5dJUD7bF4N0ve2yHlJdmXigNecrAphPgAGrjN6MpJl1
	 K6iMTsb9QAjDV/Nu16Z/of9JyI60kKnwWF2XtMtPE5eTvLJWs7xVUde7j+S/tP1IQy
	 6RHvA4ibZtvAg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 11:04:55 +0100
Message-Id: <DGELM1R9FJNE.30QDHV2IXV0BI@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] rust: dma: generalize `dma_{read,write}` macro
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-3-gary@garyguo.net>
In-Reply-To: <20260214053344.1994776-3-gary@garyguo.net>

On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
> +    (@parse [$dma:expr] [$($proj:tt)*] [, $val:expr]) =3D> {
> +        let ptr =3D $crate::project_pointer!(
> +            mut $crate::dma::CoherentAllocation::as_mut_ptr(&$dma), $($p=
roj)*
> +        );
> +        let val =3D $val;
> +        // SAFETY: pointer created by projection is within DMA region.
> +        unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, ptr=
, val) }

This evaluates `$dma` for a second time (and also places it inside an
`unsafe` block).

> +    };

Missing surrounding `{}` to allow this in expression position?

> +    (@parse [$dma:expr] [$($proj:tt)*] [.$field:tt $($rest:tt)*]) =3D> {
> +        $crate::dma_write!(@parse [$dma] [$($proj)* .$field] [$($rest)*]=
)
> +    };
> +    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr]? $($rest:tt)*]) =
=3D> {
> +        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]?] [$($rest)=
*])
> +    };
> +    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr] $($rest:tt)*]) =3D=
> {
> +        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]] [$($rest)*=
])
> +    };
> +    ($dma:expr, $($rest:tt)*) =3D> {
> +        $crate::dma_write!(@parse [$dma] [] [$($rest)*])
>      };

I'm wondering if this also works:
   =20
    ($dma:expr, $($(.$field:ident)? $([$index:expr])?)*, $val:expr) =3D> {{
        let dma =3D &$dma;
        let ptr =3D $crate::project_pointer!(
            mut $crate::dma::CoherentAllocation::as_mut_ptr(dma),
            $($(.$field)? $([$index])?)*,
        );
        let val =3D $val;
        // SAFETY: pointer created by projection is within DMA region.
        unsafe { $crate::dma::CoherentAllocation::field_write(dma, ptr, val=
) }
    }}

>  }
> diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
> index 9c45851c876e..b772ada2c65c 100644
> --- a/samples/rust/rust_dma.rs
> +++ b/samples/rust/rust_dma.rs
> @@ -68,7 +68,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo=
) -> impl PinInit<Self, E
>                  CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_V=
ALUES.len(), GFP_KERNEL)?;
> =20
>              for (i, value) in TEST_VALUES.into_iter().enumerate() {
> -                kernel::dma_write!(ca[i] =3D MyStruct::new(value.0, valu=
e.1))?;
> +                kernel::dma_write!(ca, [i]?, MyStruct::new(value.0, valu=
e.1));
>              }
> =20
>              let size =3D 4 * page::PAGE_SIZE;
> @@ -91,17 +91,17 @@ fn drop(self: Pin<&mut Self>) {
>          dev_info!(self.pdev, "Unload DMA test driver.\n");
> =20
>          for (i, value) in TEST_VALUES.into_iter().enumerate() {
> -            let val0 =3D kernel::dma_read!(self.ca[i].h);
> -            let val1 =3D kernel::dma_read!(self.ca[i].b);
> -            assert!(val0.is_ok());
> -            assert!(val1.is_ok());
> +            let result =3D (|| -> Result<_> {
> +                let val0 =3D kernel::dma_read!(self.ca, [i]?.h);
> +                let val1 =3D kernel::dma_read!(self.ca, [i]?.b);
> =20
> -            if let Ok(val0) =3D val0 {
>                  assert_eq!(val0, value.0);
> -            }
> -            if let Ok(val1) =3D val1 {
>                  assert_eq!(val1, value.1);
> -            }
> +
> +                Ok(())
> +            })();

I dislike that we have to reintroduce the budget-try block here. Ideally
we could add something like `try` at the beginning of the macro and then
automatically add the try block. Feel free to make that a future series.

Cheers,
Benno

> +
> +            assert!(result.is_ok());
>          }
> =20
>          for (i, entry) in self.sgt.iter().enumerate() {

