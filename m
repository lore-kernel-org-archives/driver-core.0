Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605CD218ADD;
	Sun, 19 Jul 2026 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784472790; cv=none; b=MPE+MICIpdA6KM+IbnKiTRieXtt5fwgiZTGt0uDhW9q4S4pi7Ei720mb8XLanFoUY81TRYXRgQ0UuVobhLSq4ACdRkaYlJaDyvI5c6EYnJpmvZ1VHD8+BTX7vbYjmed2r7pB0Gwsj1bVaZbJaBAJzifQvKHK+4udyDueL6K6xE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784472790; c=relaxed/simple;
	bh=aq3pOZqJK91IG7gtQO8DiXpAlrA8wVZEXASV9iiiAjU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=EHEf/lhpv9gUEjpgGyWXEh2YKR0v7dOJ8LybXoKoYcLLGTwNvkln5f9zPX9t3CVuqLb2ey4etlCPWkBdqk25Nr2dICPeieXQNJMzsgRLkZEFG4bbrw1vdZ8g1tFfk1cFw/zQu3pX7R484DJoghmMMCrUfeFpE/yyk4BNk7TFICs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jbul1uGA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jbul1uGA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E4F1F000E9;
	Sun, 19 Jul 2026 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784472788;
	bh=ZnAmwB0XbvWs3mSwaXG7uF2RwKAnPAZGV/EgsVpSugI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=Jbul1uGA5LlZ2vA4tGyqEGSxgutYrj8WHuhA8xgV9ZvwE4k0kPwCbOQmyrKYh8Unf
	 QTpX7Si2dzkGIH2zsiaePJjooJbCDL6fxOv86jTDEB4KfoFOSrbbznR2x4cH9cRTqy
	 xq3o1/Py9QvD6pWnJy2d2cBfYwdstpouRgzoMier1fAmzslNYi59p0rTVaGu8+ZvfK
	 a+PiADKO6Duf5NXDuXnTLuXNSPb/aEiN66It0PD8877SSVsPqfMSp4FX07dcyUBspa
	 djEkvZjP9ekgd7slqSY4NzaHbvZ9DzptlMjmaR1uYyWyK9xkf83WtjLrWG+G+iDZXy
	 OoRpV4ObjZbhA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 16:53:02 +0200
Message-Id: <DK2MT37NYCTQ.3JCJ9EAQ9TJEE@kernel.org>
To: "Lorenzo Delgado" <lnsdev@proton.me>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: io: convert ResourceSize into a transparent
 newtype
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Robin
 Murphy" <robin.murphy@arm.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <nova-gpu@lists.linux.dev>
References: <20260712113602.389060-1-lnsdev@proton.me>
 <DK0BPAHR8IS3.2KLSLH7K448RJ@kernel.org>
 <20260719104012.364283-1-lnsdev@proton.me>
In-Reply-To: <20260719104012.364283-1-lnsdev@proton.me>

On Sun Jul 19, 2026 at 12:40 PM CEST, Lorenzo Delgado wrote:
> I tried that, but it doesn't build. ResourceSize wraps resource_size_t,
> which is u64 on 64-bit (CONFIG_PHYS_ADDR_T_64BIT), so the impl the patch
> already has,
>
>     impl From<ResourceSize> for bindings::resource_size_t
>
> is already From<ResourceSize> for u64 there, and a second one conflicts:
>
>     error[E0119]: conflicting implementations of trait
>                   `From<ResourceSize>` for type `u64`

Sure, but in the case a cfg-gate is perfectly fine, as the impl will always=
 be
availble.  Either through impl for u64 directly or through impl for
bindings::resource_size_t.

> There's a simpler way that stays infallible and adds nothing to io.rs.
> ResourceSize already has into_raw() (io/resource.rs uses it at the C
> boundaries), so nova-core can do:
>
>     let num_pages =3D
>         usize::from_safe_cast(sg_entry.dma_len().into_raw()).div_ceil(GSP=
_PAGE_SIZE);
>
> into_raw() gives back resource_size_t, and from_safe_cast handles that
> as u32 or u64 depending on the config, so it stays infallible. I'll use
> that in v2 unless you'd prefer something else.

I don't want to grow it arbitrarily in nova-core - which is also why I open=
ed
the question of moving FromSafeCast to generic infrastructure again - but i=
n
this case we should rather add the FromSafeCast<ResourceSize> for usize imp=
l in
drivers/gpu/nova-core/num.rs for now and move it subsequently.
