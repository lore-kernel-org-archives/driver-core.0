Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B43230C171
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888296; cv=pass; b=d3CkmCh7XHVJov4w5RntIv/sr90lPSN10ZlcX42TbouJ1FP+0LViZnqcnrah4ycb8cplR8q/YJLOSLBQAF/OFaWQDTSd5GxXSA/nMSjMNs+e/WhPxKOoEANg+8P8bCfqofvx5Cbh0xPMR39BbK3MEmKak2kyn0DYhFYzX6R95G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888296; c=relaxed/simple;
	bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6qfQmsNBRQDYM4LZDg5xL3R4/3PoztE4ZXO1srtkmZV+494l3hCzr2KTBbHeRUij2dimHQfSBfgGMqEmiSGwY6YrF3kmuGIMiHht9nfJWx91h5piWM6LccySJ7U+i3FR1H4JbDF+x9Zt++W6+F2tyeXjR4LNQFQNuMpu6nSDaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsoA+Ww+; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsoA+Ww+"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f114d129c0so986950eec.0
        for <driver-core@lists.linux.dev>; Wed, 27 May 2026 06:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779888294; cv=none;
        d=google.com; s=arc-20240605;
        b=BxZeJ4Mu0gPG4dvhHZTX0mVuimZPsRw+nKu/w3dwmc6BnHsXgEt/wmFHvHKaBelxK6
         5dqIoQii8zAr3q7+I24b/xoFazxIKiOMU4eCF2WjPl0x04mhM1RS8IiGmItaFhJ5MU1I
         tMR4nnOcmqMcKeaB5lbLV5ux1XkkoV8OIkCn9OG0Zz3wTgAKQwZ8yNVXXgNFXsFQJEmU
         Y8PXZf0Q5WEZ9edo4XykBS/fQifMPK3oBkg8YdK+Wh1eRk1lcBXiqxzr678monGsjpmn
         Km5Rm0GuwfVe37WGtxfNOODnuawb61rGbA71D7zbIAoixWd/y3bGLZ+smjb0aX+hMKq2
         xhkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
        fh=qWdzUPkKpyPZQO9QQKF6tgDpTWtjuTq8jkqxk53iVzM=;
        b=OvE1Imu9LgeJseOo9yq6wpl/BBpeSbKEA/moBFZXJD/iiH9zOk0lw8r1LMP+5/ebfj
         o6ieHMbHH3+4lXPvefw3yeXTsXBD+5qMAC3mwHExY3eW8C7ff2RjpkzVk7YUZ/MFe8T3
         7ewvos56OyuCeV2LvEmJgYw/G7swKemMPhO/ecCbcXL1z6pCl4tC9c2cMlZDwfneu0Gl
         oHoxfnIjY4uYcA+vFb6RBp9qeyZt3Gj3MW/tlDFC8btd/OGa6jpcTSeZLFnhgQmGO3fZ
         EOKR5uW2VI+I5/hP3tDnsymzuslJUCy10S7Lj/Mf9O7x8d1BK3Ga5PQjbze1yGyzHKr4
         idbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779888294; x=1780493094; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
        b=AsoA+Ww+9joR4ArtdPH95uqnULTH+apqn/vZkYK41hojwd86Mr7WJ6Bnlqlw+ZVx58
         a/UuJD56DAVn3YhVgjMDKT8J6z8BPqc+J2X5YnIKoAPIG7TqMI2UjrNr7IYByMG0bOJ6
         mJj9ifgzimwjPN7J9rkIcbFCDGG+rMbSupBDA82hTou70qmZ2mxUPBZFt3AZZW7HuHb9
         nPngBGItK2p48FnIqGHdh5dWKsJFkyer1hd5IOC2FkFH4jPBYPDZjwIY1xwP+KPrVSw8
         df8EAnYre/cJ/uXquq9/5QpjGutBmeTg4m3IJM/KAOnDIZf3ktjI1NopXjRvpkuPnNvj
         vLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779888294; x=1780493094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
        b=Xzp3l7Ml4+phEohil7Vg2KqhrpLFR1YNgTv7lbc9ciz3r5D2z/L7om2OA8L+ZbF8bF
         4uURUGPNzOUKDfXH/GyYIZZthKG8nDupScfW95h7eJ6JkzhYk1FmXG3U31kLJT7yMlB3
         BsG6Fgv54CFJid8OibCDOoUVOGRB8bAxssSzBbC0otA1kdRjOPo8838hztIaFoyiTaIJ
         s56QcFUYOh04R8jl8jb7/IdgpOa+UCFEGVl3RwO75yavU2ckex5kaJZPIHH7/SllTDZM
         LYyxaOtCSXDUjPacoFi8s7pbq27iMabOQf2fdbjkLImlL3X0BUnAhgggaaeExqv6h1eb
         uroA==
X-Forwarded-Encrypted: i=1; AFNElJ80FP6PvzdFcZbiIEoW6OxtuVo+bKsyjex3Cyy9OazSgxyZp7xO6ibTPcZ0qntzQUC0c/mxpGE3qcsRGw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5b5wOcAjSaPXG7auO7id56wwfyuDRwFX9JwanBxxfGtkehIZX
	GxUA1h7TiVkIF9q3IhqoYM1UWoNTeZToqXWqLXLBV00Ju1SZSwhYiO8G4W9g7R9t1DWyzIQFVC/
	IvRxYCfkPcacdfFhp1zsiQLdRZqva90Y=
X-Gm-Gg: Acq92OHJe0NNYC/4nCvfvtlINTxHXXPzi+0Xw8kyOExwtaCDeWpBJQyr1XLR5HpQxbE
	nxjEQpADRoDPE8uDnmCyratlGCBlnFgqNHOL758nqPBqnhsseeHILWCDn8A+GzJEUMXyeph67CD
	D3Q6yn0HtVVC0ZEqrTNqp9YqNpmJUTSOV9sKCZyNVYetYzt3QnMBILH91imFIugygNG6QY7flda
	npCqpKeh/GnTwDf4Uaz+6KMWRt2ZkA+KxxExJJ2y3DFVdFnQJcN+/WmJ6CIjQ/vQrucsC338dkV
	2VcfbLJ/mJ96b0MFmL/6QPfDtYdeoAli5DLfa70KWlnHR9boTrLLdFv8y8f8suFF441Y31+sxFk
	9YgM0n+Z2qsKLE2es+6IvwM3/L2kBlr4Z/A==
X-Received: by 2002:a05:7301:3d06:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-30449040654mr4461690eec.2.1779888294371; Wed, 27 May 2026
 06:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com> <20260527-bitfield-v4-3-e8821d4efbde@nvidia.com>
In-Reply-To: <20260527-bitfield-v4-3-e8821d4efbde@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 15:24:38 +0200
X-Gm-Features: AVHnY4JsqmQr9qwBGoMiDhQionqiPv95QMqmQwU6hiT2GBpgjyTZd0EHweeVTfk
Message-ID: <CANiq72mSYh3TbVHTUvze5vs1uqJ0UxTBUDyUwPOdzPVRsLiRbA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] rust: bitfield: fully qualify types in macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 2:52=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> These types were not fully qualified, which could cause issues if the
> local module shadows them.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Should we fixup this into #1? (on apply maybe?)

Similarly, for #2, I guess it may separate to give credit to Gary (?),
but typically we don't create extra commits if it is still not landed.

Or what am I missing? Perhaps they are intended to show the changelog (?).

(Either way, thanks for this!)

Cheers,
Miguel
