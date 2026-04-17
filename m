Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4663B2F1FD7
	for <driver-core@lists.linux.dev>; Fri, 17 Apr 2026 12:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428482; cv=pass; b=hJ9YJaTs7UY/1KhXRdattLg56TXnLdbwiL4JMkw5yrau9cvuZS+Uh4lkOQ9bPaqF8mfrvZWBB+zTEg+7aYZAe4opZ2kS+sCInVK/VPwv+BpXZ28vvY9W9ojR7+s/5AIaRNBQ8YMplVY5z4NVjw3Fm9ptojqsDtgn3isYoNJV+9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428482; c=relaxed/simple;
	bh=rl+p+AaNveQQn7NLxvMrIdc/G5AP3TAJtJkZcc0GLPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8AxDof4E4kaCZTdoBEwVWRjmtVDthhVIgnpHTcJC1evW1XbyhLC/3eL/be2ZihVIx3c8pHChuvaReZ9t5OGyMF8OMPiaOI9aLt80eSI6ehU7p75NW2fZDDSlHR6oClW63XF29SG8i5Vd8pkT2SCrmkjyhpBV3X+U1TSgxDB91w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEjpomgw; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEjpomgw"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2d958ce9921so60923eec.0
        for <driver-core@lists.linux.dev>; Fri, 17 Apr 2026 05:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776428480; cv=none;
        d=google.com; s=arc-20240605;
        b=JaME9dA+1+Yx8Tvj/U89u7k4kJxaxeW1LcDMsLWLoLmRhib32QoqJTc/6GradXFmGG
         EN6zGRkekxJ9OiAsZWr66GeppVPFOnLDsHfOem5Yj0TC8ghKwZX2J1ikHk61d+k8+YUG
         9WMrqiLj2A3sF1XN9CRyvIE0ZDvJX9kN9M2Y0t2yVdUTNJc5u3sbsZwQMksXVVfD1bfM
         6Itzqq2ry+j279uNEWbEcWacMRcXcWN31bASPBnZPwRfcPLvYaENh7ko0C0Ecbo+LheY
         tcHEzcxGPqJgMtaCF1CagWqzY5ntLnv92GjxEykIRGa0RpCXXYDkGqBMF4RiAXPmzacQ
         56Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rl+p+AaNveQQn7NLxvMrIdc/G5AP3TAJtJkZcc0GLPE=;
        fh=wGjLa6PevXFpza47UaKwURhQh6KsFcCZ3S7WF5eYHV4=;
        b=axhYtdp1QoQpwGSA8SW8sMKXg1pi3Xx/NK01zmd1L7DFYGDimB2MaMgkg1zBMjcZC1
         jxMc+e9sg0s8D9MjCJQOqLt1qG44INetrgilYoZL1Npnuw1bJdFlq1C8LHHucE4578/d
         H/e4Eeb2IphiaqgMZpqXxDD1jT7sbN1D0lSGs/Yez3ZzkBmdYmcpICRnG9HnvX26/0ga
         Es0H1dbgy2auyhn5bW6rWUFlsMwHWyIufq5iq3LwXv4BSfagAMouKIwXfmjb5990l3VA
         OoqYehyquxzMrB2IFE9bBC4EXzE8SuswFQ0H+k0ydYh7kkZL7L//7xBPYEDoS+np1PBG
         xoWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776428480; x=1777033280; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl+p+AaNveQQn7NLxvMrIdc/G5AP3TAJtJkZcc0GLPE=;
        b=LEjpomgwEgsQWfcZpIBB2sX+GtrSIJNzZgGz4wHedK0GkziaeL2XqciOEFio5j785M
         3/MBOOsrJPXpoYl+zNV+uU2GJkzoyiRmzW+mL7yXVgbTSBR0nA+9UL/PkbYHGZeg6GFy
         Jl6Yj2qDorbd0CbMUhQkHFZx5ssSuL7nWyfUyBq+g0V8T63GNF8tCgkeXWaCL2YbFqtO
         55U0cjW0Q/rOfeks50dRYRmDJMlnXxPoxmkTMXYDVFF3UKQ4ohdBgG9GQORKXzDKr7r1
         HBc0tydC7g8FYfRA7ORh0wFyKmA9X8Wvo1e6HbIPC2uWynuUeonmJ4OCSnADnLPWjwLX
         IIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776428480; x=1777033280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rl+p+AaNveQQn7NLxvMrIdc/G5AP3TAJtJkZcc0GLPE=;
        b=DK1l1gSYjf6u3lehQtItdDQjT2pLizSzJSG8x0uR2u8bW/Y+S5RuagxsMZV5ERad1X
         SyzECXXp7FVvq5RX+Tor3MV7RiR6GXer5k82HJFu9SmSQWF+OUHEJJszxQJSq30YpDCL
         6z8gbm3mXc334dyQIUwrjuQygzfn9ItoolJyzfKDIBwsIOyBTDlKi6XbEYQu2LDsiVTK
         vemGn9vOj1Z9eWjo8PJ+wO4X54KRsvqCwo31pzZqaPdoVOo3cEEdzr4Gf+p3K+sQ97RN
         xquKSO7CbZmbQ55P0fgLQ1gpJa2ttzKOUsZWUo2aJCntJrV8uihlcuqV7spL12SQUouq
         /FgA==
X-Forwarded-Encrypted: i=1; AFNElJ/cCCl2nZ60b6kLJpCcLKip1HDFPrXjyByq2bLEv9g+tqqFpNSxOjvgLfnH9MYSJ//s57L9O9wETSJEQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxortzQ8PiX7/DgODspAfGyJjjzW99LmmkvMzp/HYojRz+fdq2X
	lgFlAscUDsIjSdRxUPyvWtI3/kE6f51Z0hE0hz8VqOHk0LV0bOZWx+o7+LSDwdxyv7+X5F6tOFw
	eD9tXth+ABVMhlCXlPnZGQBV3nYscMQ8=
X-Gm-Gg: AeBDievTH1ptGXCM/ZFahrh9qoo5ZYL/qr96fYyrdk8dJFoLGx4bIbzvrvmxPu6X0cI
	/YgWEe3mtb9zrwU/m95ZpBV4FIMvhan3ES9BZ0LWKtiRyjXniJoHX/DAQ2jvsxLtkaks7kw/7iQ
	ba1C47AZrK+avRGBqCugnp1krffHSm/zGhmQUwvHJMXTapQwZDJS9gPXMWjxRQMRAPrD9YybOlR
	GEOn5woThnS1R7oLSxnsP6sKTJsKcpBDhBN90WLVbwV6jM1dwKtQLuV9AiV6G8xwZ2WueVLCXtB
	+4XNZODpooo8m9TzisIt6+WtjETpUq/t0S4Nbup2QKfAlz0yOD7F/lbwU4+KnSUxxrZg5xP/NZ+
	nm8sZXtYtqAmeve633IMiK9bc+bcXPtsaag==
X-Received: by 2002:a05:7300:d70b:b0:2d4:62f0:b2e1 with SMTP id
 5a478bee46e88-2e452bb2b57mr527795eec.0.1776428480348; Fri, 17 Apr 2026
 05:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <798e83e6-eb7b-4502-85e7-5a0f6d9c6281@nvidia.com> <DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org>
 <CANiq72k0FXcekxs=E+xLe3=wyu+KHr4yM0wLj1VgtgTUb_K4MQ@mail.gmail.com> <DHVEWDBHYKQF.XBXZ704CMXCF@kernel.org>
In-Reply-To: <DHVEWDBHYKQF.XBXZ704CMXCF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Apr 2026 14:21:08 +0200
X-Gm-Features: AQROBzBxmAoyKatwLVEj-ovr7OXihWaqmDt3TqAdX7jALMUhbTGV97pdxOBe1oM
Message-ID: <CANiq72mNP4J_czVo25d1yRdWxBNFKaT9OPOC7k5EDzZ9YmdEww@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: add `bitfield!` macro
To: Danilo Krummrich <dakr@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 2:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> This all builds on the assumption that we don't have a process in place t=
hat
> covers this.

It builds on what happens today. From what I saw, Mark merges
`drm-rust-next`, which is why I mentioned it, i.e. to help prevent
something unexpected around `linux-next`.

If the branches going into `linux-next` change, then great!

Cheers,
Miguel
