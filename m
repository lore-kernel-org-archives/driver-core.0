Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F634A3AB;
	Thu, 16 Jul 2026 21:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784238341; cv=none; b=pwtjtF8WWkflM5xeuAFLr6p1lZ1ADbdmoV98czGN3fYBTTSSaAkjceCSlbfN/z8KkWpBB5TIrMK+wu32fmfHmBXVO46YOfZM06HoStu0tZJLMHQiyhToGYB7gFb+toxhAP3XuHoPKkyWfvGH/6HR7bQlK87S0i6a5wrekmKVSqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784238341; c=relaxed/simple;
	bh=KnHukbFJpMu+avYQFX2AuAY5rj3s4RHoVW5of9xuwzE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WNt++84QbZ+d2/iAkQuwuHtZldKcnaLWBnq+tg8NogBZiH/piduvAinVQUV1L6yHT6s/7vlEdmaZXDK4QaI8JgUgryiTf0Q3QJADNLTgi41tv3HvGpiEqr9E3SKJBAcs4cuW121i4GrI0db1IAiPZs1MZ664K+A+rfphA6CkSSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOVFBljM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOVFBljM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CD01F000E9;
	Thu, 16 Jul 2026 21:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784238338;
	bh=SJvdaIZRu8T0uCxoeY8INDcMoT1AGrOY6CE/xsqgPiQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=nOVFBljMUDhS1tefi/uZVzqRbpz4+zJHWFTJ2RwMJIQGtrUm5Yzk6q5PAiwbmkxlq
	 yyPthBsWmThti+id+GXdUfY+vIP+vr7H5V+vSrqXI71XeRsjwHRpUWjJoaHnfFCYCR
	 haBziRL1RkDk/3X+f8bTVhsLIRXy3OKtGMwqqViVR5eAMp4CgDgzdCs29g3owGGK3P
	 jXykmXLx6VmdMXSy50bscJSsCFvYOnWTA2f1fhEudF1TdSk8wMsaWhynrsfzVB5W6q
	 JorzK40hLr5Pqt+vIqBxi8xJsunhx+qMOAEYb/oel/Uoq2Jl5n5RC3id0tVMvO1ItA
	 FVkJjoq7kVqCA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 23:45:32 +0200
Message-Id: <DK0BPAHR8IS3.2KLSLH7K448RJ@kernel.org>
Subject: Re: [PATCH] rust: io: convert ResourceSize into a transparent
 newtype
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <nova-gpu@lists.linux.dev>
To: "Lorenzo Delgado" <lnsdev@proton.me>, "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260712113602.389060-1-lnsdev@proton.me>
In-Reply-To: <20260712113602.389060-1-lnsdev@proton.me>

On Sun Jul 12, 2026 at 1:36 PM CEST, Lorenzo Delgado wrote:
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 99a302bae567..d7593888e65b 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -175,7 +175,7 @@ pub(crate) fn radix3_dma_handle(&self) -> DmaAddress =
{
>  fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) =
-> Result<VVec<u8>> {
>      for sg_entry in sg_table.iter() {
>          // Number of pages we need to map.
> -        let num_pages =3D usize::from_safe_cast(sg_entry.dma_len()).div_=
ceil(GSP_PAGE_SIZE);
> +        let num_pages =3D usize::try_from(sg_entry.dma_len())?.div_ceil(=
GSP_PAGE_SIZE);

I think this is worse, as the conversion becomes fallible.

You could implement From<ResourceSize> for u64 and then keep using
usize::from_safe_cast() in nova-core.

Alternatively, we could also consider moving the FromSafeCast trait to
rust/kernel/num.rs and add FromSafeCast<ResourceSize> impls for usize.

I originally proposed the approach [1], since in nova-core we had a lot of
fallible conversion, while our Kconfig mandates that they can never actuall=
y
fail.

However, by making it commonly availble I do see a risk with the cfg-gated =
impls
silently breaking the build.

Now, technically that's the feature and 0-day etc. should usually catch it,=
 but
on the other hand we also usually try to avoid cfg-gates in the kernel.

Miguel, I think you were in favor of this as well, what do you think?

[1] https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@kerne=
l.org/
