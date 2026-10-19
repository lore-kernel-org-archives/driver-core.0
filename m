Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE0C4F474E
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413333; cv=pass; b=vGtCYJCMlkT3Ym+SRtvQQQh470kdfpWSw6Jtpz7c4vvJKmVgq/oXN4+lYpWBjzqOQYdAU8W6uBNktT4E51uIr2KS5XeR2ECCFdYeetMv6hK8UpBHTa3GqWRk2/9oErx60eMD3PYfClCqCx0kjdcWac3M/83M4AcQQ4oHwyjZZjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413333; c=relaxed/simple;
	bh=kHYzzrv0/FqkmbWY/rN/GxGNCP9TcRC3pY9kk8aXaeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4c6G2OVRQ3RVZK+WATSscybpk/X86bnHPfSRyEKmMiFjdeGGLCUv4YA5fxfbUQBP+txc0Rnx+NBIz5mUUZ7KswmMPGqOuCjXgxooULtfANRP/m+CJn0K1Vv5V42xMEUPvbre+OmEhc5FPiHAMGXZdg4GeCPvjnrfT+ogNoatWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcxCHAH2; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcxCHAH2"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3584f70a5aaso226977eec.1
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 05:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792413316; cv=none;
        d=google.com; s=arc-20260327;
        b=W0I+m4zRg03Q61LMtz0YkjIkcGCsOdhVD4PO/8vIDQoVBR4ZFhLrWmIJaZ4HpqOQdj
         qyJRYVCsyTE4gue8gM9H7+nKPuKXu6Mw+8j8gGgHfP9YQZ/eB6cy65HRK70DkKS5zW6I
         1LjOOIUsfnFe4C4tMBTclJqfePj7ja4hn8jPFDsmxmGHIOQc8gf48VtaOPf4XJeaBOhd
         XXutAjaZ9M+Vu9tEIRPILX4Dr5T5ficFlghUbIZrtwnusV6mpj9T9rm+xF8BI6BT1Cgo
         C6qBEuk+G70q2FZ7AafK+YvsYlEuKNPV9sdz+BNcgIfC8w12n6oDZs3aqjHwRqOYvje1
         O1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4G6BdTXSrvUBkKrtgqJe7ik23iqNQYFU8yzcfGukx8=;
        fh=GtGaWyK4VBd9tzeJ79TgE/2BuUTSB4k3p9FxZaU9YIU=;
        b=bVeuKBJCAw44hEq/EyZuBWioWm9vHALUiWiYVOtGtEfj5XaQFBXJspQUZAnmguspZm
         ATlydYLzmxMIw5CY1mAS8V+TBHZJ2qR2u9JMUCmiGuE2K6NPWkifXz7jy2BSYrZepGBU
         /2EhXfjq5em/5lK5nyRyqWOeYdQxuptqpKyB0hcntSzbNgeY8tlAMx26Ma97WK2KFVkU
         QdP3lwGXix+kpNvSQ0L3CQi+shki2mBhG4J/eawbhevS7sdXcn1XOvgiM27Dd+XnqCXo
         m5kDVBGLC5Dyz0B73+GhR9WqzB2ARR4ppLpqb7znsAYZ64tRrPpZIMeBTyyajSNPB8d7
         FnYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413316; x=1793018116; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z4G6BdTXSrvUBkKrtgqJe7ik23iqNQYFU8yzcfGukx8=;
        b=mcxCHAH28McWe+Y/2lJEO8EFFF3Oul6aKPGsOFuNwg7ezQtdXSIl+WAhiiGlcqtzoo
         rmEmkp01fIfNg6q8l8l2al+HEDyNEKE/YERnzYR7lMj5iFYecLIucxGgK4nkSZLvan54
         ytyuo5aInk267vtDo5VNA4IsrQZUSmwXF5yhScVr87YTib2tnFkG8znczvoA3c7CLhYH
         VqkwZb5Iswo8qzLuemm34VItTfOW8c/8gs7341WH+bWJTzNtfww6jgBIHdUgXi6wnZw9
         0/VVHf/1d6ncSDM9vvVz6xoSxpC0H8kX8T2fnKvtRig5CxgfSyStE3NHBc1RHNOgG4NP
         YK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413316; x=1793018116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4G6BdTXSrvUBkKrtgqJe7ik23iqNQYFU8yzcfGukx8=;
        b=rlII4UnpXClyWAjKm+CznkT8XJGRaN8kJW643pdpIQVQ6c1JMdoWAlAl4pd2FRVNVC
         XcgRJxjpqe3poi+xAPDp9VO59VmWT1EBcHcJ9yAmQxQdok3ds1x0lCzt8uQKeLomdB99
         psTv23dcv6y1SDi2PTy3otrlrj3Oj4K8uFHACW642OHRP2u7Bc1qChFqSihdb3mkuE15
         2hz9EWJFv7DXScHe/Ux4AgtjGUHX7exJ2wkfKeAJcbhODlvWm1g6+sufF2TAvu53vVlA
         4rw8fDrOBDMs2tJtzi/KX/mdNjXiLKgKzFNmMg3iUySKi9ZJYUmr7FW/g/sIcdMHLP3f
         swWg==
X-Forwarded-Encrypted: i=1; AKwUvBwlvyAktkUhJqxwx5zT35cAyXTZlW95UaYZ/EA9lr6qrB+1Nl3xsNQ+Kidi3Gt7O3U86l5XLbRPjX5NLA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIpueCY2ynC0GiBp9L4pyCF3TFxk2loq3S4wvaskKZ9qp9pJY4T
	12/WgxF/SYbIE6gQOzA1IPmNyFywqM3T5oFLwZmTJLhSBhTRtz0/B7MtCv4HGDKZUHdUtmPJaiW
	K9NzvhRqrzHdwpgrbDu1VrAeBZV5syx4=
X-Gm-Gg: AYBFou1XR0DWVLY6hck2OdPSbM036rG1kjV86zb9LOdkpHC8TGTYfUo9T6YA0TD+13j
	/BHCcS0IB1ZIm9mPCpQDtxKugv8PuGLQc37MpbpA1gtGQ42PcqrxIdWwAum2z7rGccaRJ3utxwu
	VMsJJHYnYoNp8j2UETx39FBXuFIWv/EFK3csB7xUY8W0r0fpn3B5/S1HSWTJKFq4NS6L+VO/4+d
	Qm0203TsV2Sw/6rN2zPRAkNnCO096E3gRYltTJ7PCzqRbx3IKgtzE9Lu+imOXs9aO5akb+ZSxzE
	mQQ2IvjnGq1IZvRUqIE2tPTbSvHWcHDRngK2r2YaOo12c89DrqJ0wPlKXUINnI+w8651xO0JcVX
	bnp2LT8aozsSuqB1YMOY8rRhSvGHU89i2Y//x2ZowQN6tDGSsQ2j+bS9CY/Cyxg8eOrkoI9SbBu
	mjau1p+62jcjpnHxfxjtJ/kVMYNiF1kQLD3fvQiVQJZzZTxn4r+7YW
X-Received: by 2002:a05:693c:20d2:10b0:35f:8c5d:5938 with SMTP id
 5a478bee46e88-3619ffc5b52mr18422794eec.1.1792413316441; Mon, 19 Oct 2026
 05:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261019114811.1105192-1-gary@kernel.org> <CANiq72kzVouV2GmeFpmZS1PNPDo6gZsmG8MMrrovvETUxVSVsA@mail.gmail.com>
In-Reply-To: <CANiq72kzVouV2GmeFpmZS1PNPDo6gZsmG8MMrrovvETUxVSVsA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Oct 2026 14:35:02 +0200
X-Gm-Features: AclHuK8NqyayzMi_L0qJx39DKhIVVz2vRnMPPzA4fngWVWW2n2x20pZjM2meo0E
Message-ID: <CANiq72kxe2f1cO+yypVW9LY4pAHO29wn+O3sUECvHXPnLu2hdA@mail.gmail.com>
Subject: Re: [PATCH] rust: doc: mark `Io` as notable trait
To: Gary Guo <gary@garyguo.net>, Guillaume Gomez <contact@guillaume-gomez.fr>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:28=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The attribute has been there under that name since 1.53, so it should
> be fine, and we can always rename it or remove it.
>
> Having said that, let's mention it in this week's call with upstream
> Rust. Cc'ing Guillaume so that he is aware too.
>
> Unless they say they really want us to not use it at all:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

I added it to our usual live list in the "Nice to have" section:

  https://github.com/Rust-for-Linux/linux/issues/2

By the way, for the commit:

Link: https://github.com/rust-lang/rust/issues/45040

Cheers,
Miguel

On Mon, Oct 19, 2026 at 2:28=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 1:48=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >
> > `Io` trait is the primary way of interacting with a bunch of types, e.g=
.
> > `Mmio` and `Coherent`. It is hidden in "blanket impl" section which is =
not
> > very discoverable.
> >
> > Use nightly feature to mark `Io` as a notable trait, so it is highlight=
ed
> > at the top of the rustdoc page.
> >
> > Signed-off-by: Gary Guo <gary@garyguo.net>
>
> The attribute has been there under that name since 1.53, so it should
> be fine, and we can always rename it or remove it.
>
> Having said that, let's mention it in this week's call with upstream
> Rust. Cc'ing Guillaume so that he is aware too.
>
> Unless they say they really want us to not use it at all:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Cheers,
> Miguel



--=20
Cheers,
Miguel
