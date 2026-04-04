Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6262BEC3F
	for <driver-core@lists.linux.dev>; Sat,  4 Apr 2026 18:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775329059; cv=pass; b=KuqOF2exQFXeY553bq4CCqQpAmIvaLAlnpC+WxQxWx2KpPk+EGScFN3xg80AAKwEbt0DQwYxoWmvU2IVOpDomAzuTP5aXHBntpzNYv8vbzsQoe+MfBzqpNLKk7w1KOAOGa/qnezeaIpd8d8p504OpuFZogruihd30d+sBVwTpkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775329059; c=relaxed/simple;
	bh=Dpo1bHWRFUqXo0uNqbtuJo1O2t+g9zkQj8ymAL8CgUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5ani+8/U2e1I6+Kr5JfMJLpwr7bYCrKH2TTpd8OKpruMOA4mINF9CzQmVEobibhWIsCSi23JmQCIjhjUoKH86v6TpLguR1P4utkZ2+Tn789DdDNh7Tg5gc10YR7Qkdv0Zh6DZu12E2GviS38TAKQ+m8kzS9poAfOGuSVEezdHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQHLv3SQ; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQHLv3SQ"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12736a0147cso146852c88.1
        for <driver-core@lists.linux.dev>; Sat, 04 Apr 2026 11:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775329057; cv=none;
        d=google.com; s=arc-20240605;
        b=bz0B0i8MPta5n0efGsTrp3hmJqKJ7+OciaD0yCRWG1EMoVgXq+d/S0BVYVgg/6SUAe
         cdT/pSqLT/RUIT1yyU0WEhL2J4O/3VkYFUxuRKtej5R92ItqgC/db21CTPoH7pvQOCtT
         t0601d24LeTxWQRrMUYNQ/h0Z9P1zt2T4PF/pS5c/fhI77/OqLITamcynXfXPHc7TXhw
         slg87lTnKAnjRhEa1yvTGGxoGdhBtguw0Da5Zwoz3/lRkpr582V6faUcr9+M4xSPXqtj
         NENwhV2lYKDPglFOTOJVgfTp+Bp4s5mYTG6dme50e/25AFELqrBOroD6q135vM5SrOQS
         MC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dpo1bHWRFUqXo0uNqbtuJo1O2t+g9zkQj8ymAL8CgUQ=;
        fh=4nnSmAOQpiHS01nYeztU+hBcL8aov5MuEV5zwoUsblg=;
        b=G3kn1MLEeUJHPMgU2xolXeX4gpIJpX7GTI+No9P/bSwv4lp7mi8SeU85ItDs58wHOk
         9YvVy7OfL64Si/BAggrikmq5dv6YTapokuB4yG+/4R6CZ8RMToh6z2VFBpy7GOSERJ1Y
         qlWL4XqoYoYFFun5hvksotneK8rSa9IuBDqqpxJrPKyP2RjHjjjWBx6uLwmbJbyuCTAs
         feJUI0H0uENy4zN3hP8oSrYGXMcB69Czs7emxt6gyJCjqJu2//pK05TRPbGJ3OaDIFxs
         /tKXkoG0qT9znBpU4PZLUvGvPtSQYE1/oTnd64nzICYKR5ZBNDptyyik7BRf831qjsyw
         a62A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775329057; x=1775933857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dpo1bHWRFUqXo0uNqbtuJo1O2t+g9zkQj8ymAL8CgUQ=;
        b=pQHLv3SQ/8TPcgZomsCie/7BqXQGmgxXYc8EBcSFhQwLlJ7MmgtERK20RWYPv+m6Bm
         BQG/Jj1QLDwGOgo9XeJdQkFw6mBImiBclpDxzPZqaNizDitWbvMszbhlgqd2HaLcmsjT
         xXDwGNI0DwATRyVSz+ZPUJOGGf78niULZ1i/iFfpVf/s6wvfFPY1b5PBFHHxN92pPIf3
         /2R3PUQDKQN9qBXCUKRyOIB4W588oSQEVE4lIiXfOO0J+m7vQGykQOadB+SiO9FeFNJv
         BaVeSomfcU7HRFJgnxOFTx3Vp3rWXpKCKwn0Q879BQg4ODpc+Tj968AtAzlZcOGpPKkC
         loaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775329057; x=1775933857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dpo1bHWRFUqXo0uNqbtuJo1O2t+g9zkQj8ymAL8CgUQ=;
        b=RpqAB/kkaoapO3GKNq1ILdRsHnDs8GPpiGztJIe6gcku4NhOv8dbbBv+maJnibSFH8
         0GmOtyxbZTuPgh07tOK2eurNeENFV39dEMz4ZJvNO/Um1nkqF482gb/lmoMgivv5GPX7
         2VWrF43ZsqN/IntTxaMYPy2sJupCqB/J1NoDDqjpKDO6rF76TLcrpKdoxgs56rB5sDZt
         IctfAN8LPscMjaJz5Y8MWE2gkHK901HVUkY7QCeC9GBcxbtd7PWQ+4Iczhepo14A7OVf
         wem9z+7nwPWBOlVKLkRICHy3ddl/o5Vq351hf110BRsedue+ZMDXWtHbAv8U9aI5alER
         UONw==
X-Forwarded-Encrypted: i=1; AJvYcCVcquWvGgo3qOWevsgRBawuquioUy7bT+DsrMXuPh6y91TnJxvCE/7ff5Iehm5KyDWPo5dlAUakxKQS0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7LJB2DSokH/AIuKRRv1wVSSKHCbEiF7ba6qkrYlNtLk4X9M7N
	PbI/aEc1WFbm4jGNlQqkJm8TMSKzcShPqeJ0Wk9TN3KJ/Toz7Vo0tGGMrUypfh5t0g3zzuIRlYV
	hryvj6YcsNEBHrase0epnd4WNSvRWuiY=
X-Gm-Gg: AeBDiesaA2A4SwGNP7fSDFRZ37h3GYtjk5wRD9eG9TwSbw5Sx7jpXa8xofvqDSUMIZ2
	6ERZ8ek5TNByjMrZ4ba+Y3d4nTY7hIs4FqA5dI2hfuMapBOJiPYTYbah8ES9wAJKD5+VAgKvdbZ
	F7uwAROFc/+yC48+wX08ksAAWWB5Q+QXwdbpjsX2ueDmydL5TABC4vQ3yEsdFUgiBJOtjpPfiWi
	5yym0pkkNJYh1PYJhE4NQPpM+byO2yJmYw3i2pWGMFni5cGrCAyGPwmwMONETyDs1F+lK8Ufa8K
	fh6Qcg3GWFnfCIvvg1wu7lepzbSBaV+EpVDeCKHixf7n8WdjjbSTBcUFHTXJCth9wndiTGMp7UL
	rtC3Xb3+LwLOq9+3Jp5YJ7zc=
X-Received: by 2002:a05:7300:aa8d:b0:2cb:cc20:1771 with SMTP id
 5a478bee46e88-2cbfdb8142amr1797820eec.7.1775329057099; Sat, 04 Apr 2026
 11:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323153807.1360705-1-gary@kernel.org> <20260323153807.1360705-3-gary@kernel.org>
In-Reply-To: <20260323153807.1360705-3-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 20:57:24 +0200
X-Gm-Features: AQROBzB07bZJqe_QfYpU84UafC2n0TqoqgFxBdtNVi67KZHjlaS5_K2l556ldMw
Message-ID: <CANiq72=L_GtftTstEznWi908HwcWLmD=cf0gnmLcGkfN+RTaMw@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: io: generalize `Mmio` to arbitrary type
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 4:38=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Currently, `io::Mmio` always represent an untyped region of a compile-tim=
e
> known minimum size, which is roughly equivalent to `void __iomem*` (but
> with bound checks). However, it is useful to also be to represent I/O
> memory of a specific type, e.g. `u32 __iomem*` or `struct foo __iomem*`.
>
> Thus, make `Mmio` generic on arbitrary `T`, where `T` is a sized type, or=
 a
> DST that implements `KnownSize`. Similar to the `MmioRaw` change, the
> existing behaviour is preserved in the form of `Mmio<Region<SIZE>>`. This
> change brings the MMIO closer to the DMA coherent allocation types that w=
e
> have, which is already typed.
>
> To be able to implement `IoKnownSize`, add a `MIN_SIZE` constant to
> `KnownSize` trait to represent compile-time known minimum size of a
> specific type.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
