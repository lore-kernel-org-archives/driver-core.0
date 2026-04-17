Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4DE35F5FD
	for <driver-core@lists.linux.dev>; Fri, 17 Apr 2026 05:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776405372; cv=pass; b=Ea3EDvGZ4mruUO8oVNGNvVNBShgWuEan0nAN6w8Yikt8k3vEajEl/9ASQ819Gf63zw0NFpWb7FhdHGoyugStyBeyj4YFbr85jtwHfckoHc8q4/UA6gpcMnpTNFIDAPoolwMzZ7AKNut5lQumcn3WZ46/lUOZSijYdS1T0JXRxfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776405372; c=relaxed/simple;
	bh=Apfo0/70TN4suYxYMmEunGi8x/Dp4oPTxy9kv1ax5Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knq1/nPeZpeNSO4oYgWj4s8HCMJrvL0MJGpkkscT0Rj6GyyAAqsJ1vsBposiPAUOpoOeo1rcIIkwPdNdokqMrOgYdvE56HKtWWqHYcsUsx7bfWl3hIfHd/Rys3IITsE15WQwdqYqY1BqZ1WVVnjURJtdafBGKTDJDp08xJb5VZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuAN9uhR; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuAN9uhR"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2d9472c97dbso26443eec.3
        for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 22:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776405370; cv=none;
        d=google.com; s=arc-20240605;
        b=lY0ifFFiKxYMvlHoDo3RBlpIbqH428a8ivSUgpNZS9pYxvMMML4I3fUX1FqCKzMDze
         8HMkw5u3fAm+5V4+MRwwknVYYi8qZcVN0xXI213/qat09FQoCdkt6KULEp4Jf53EKndv
         Q60pHVNU0RuPs2dXWnpiKVXVEplmpg99M6om2nFMJ2pXr5aBcnfGkVM2WPU0E4Otfsyi
         UhcsVRgaho84DCybuQkuS+joSbimyw3TpjUs3Z4QV9c48aRPn3imco6RrqcBqE0ds6vh
         SeYBGrslQ9WwFnd1cXKHjD/aRqB0ItJ5RZlfZYsohgrqYbZQ2ykD+7RzZ5QpJLiG/4/j
         HQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8wLBjGvJshmmFrIdurJHEvic7nm1Xi3uImDSR3XDZcU=;
        fh=ZR+34SvvamLHCNGHY+fxi6FM0BGlXS/5grjdOpJXz58=;
        b=lsn4ktOJV5/vYnRsg2v/1sadjEzOQBxhGQ9NSk1jmZxhl8A050Dmklqcl1lO6BYf6j
         dtDHO+GX/vwKvQa73ZdKcd4Plz0qlRcFen6cEFQapLbHEoQHQJGtAel8ZH2l7I/ZuKt/
         JEF1EAQ28EkU4oDt0Kmk3DiWkhT93Z4Q9IieQtlHM25ev0+8c4M99nwyuPYW1bQ0siIG
         PZ3NYPa1oQ0VKfYF42QsHVsHS/exymMXP4FJdmxV1zzIInCpOwC3RFtOQ0Pn8qRcf90m
         pOtMKtx+76eRTGDb1106xyTLk81DWXXrkSL4gFhKUK9jEPlCISqppggqQDm/D356vJos
         R0kg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776405370; x=1777010170; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wLBjGvJshmmFrIdurJHEvic7nm1Xi3uImDSR3XDZcU=;
        b=SuAN9uhRPYlo6IfC96MaGuiuvva4/dSnA51Y2smexGixrPdwOjXK+z9X9IMrvjiw2H
         TqBLrSIV0nlM2JNETmgXU1+eBORWoWKTIp0WAQ5nok86O3Yovb92lOtIf6CER/cyGKjL
         hnXZvG8CFRzWCVidHifotyeFj+ftumZZlxflN3R8GignsHNZciWr9REgsb9CV2RSd5eg
         1xXYelJ3mAUs8Vxf2ZzOJ3rYx2hOqAo8gbmHsj9T1WuUc1dCT//nQQba2y/n56M2VrGn
         xaKrZ5MT6criU0mdGa1V2OVn2qCOCs7+UW8entavx2ALTZ18l7kdvrcDbLKrj7YFaVKJ
         k4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776405370; x=1777010170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wLBjGvJshmmFrIdurJHEvic7nm1Xi3uImDSR3XDZcU=;
        b=E9KCjw32CvgFdqRErP8IOZOu3E1A9TnH9B8Comq7pRskEcSJzEkf28O48MG6XpbaUR
         UUpILR0ywLOucz4Vux2WXUE6s4tES4f22F01u3Nv5fN2Ob27xe84csqWf0DGi0veVNQa
         7R421r+WraLFvWoOO5CRr+l89rSAUptRrNT28nkfG57uVguzE8oZ2gN1fSakgpx3Cdf4
         PO4dKokIJGJpHjgjKGGPnU9cto9iFOoayEU0DDrMCHghLwp8qenJl8ksReA0vP6KdxN5
         pgXniPh6W3mpnlJP2KSSMPHO+Q1Opp4xlZoW7Lb+zCmCQ2rbmfEBMq7aWnAfWCnLqmd+
         swPg==
X-Forwarded-Encrypted: i=1; AFNElJ/00ErsdiXU73HCs02qjg92aOih+VlVO6U0QmmC+akDKoqpEUFWkkNdQjmlyITIZnPryYjMZMOaLAczxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvNPXV5w3aTfd6gO5b9krB0jeMIDIt2l7+dwsbj6yG9YYkQ0WC
	+k1nS37dfwSRLSkRz1d8vxTeUv4/ehZHPUHfraTbLB0O36bW4gg/AO/J6pt9tXhvkc6dbxvkCcc
	vF/m1s3cHXbe1MACwIUIrfLpv/Ep1k+E=
X-Gm-Gg: AeBDiesLJYelRPqEsLUMeQvPq42HTb3RrS8pMqcRdxLSl+BSyt7/XFIFCOiZAILbY1s
	effWWlNkL14yTsUPTWPWrjBFXOYToMiA47DjaN9Ge6v/xEjTEI956t4t9I3mEJckaaW8BOekezu
	VO2lE9bi8ye7ROPHmWCMpFO1TSDDnSQHIU8D0d5kvhfuyHJwPopHEiw5BkZIdELAXdulwrPJkaC
	wFK2vxzStglXLmbVNvx1wGr2HEqUASNDnO2unQpLws6K1z7AbvExIb7OOdRLNa5TryFVsXULPgN
	M7RpmNx8MuisoPvg8xuiTXDyi06I83ypi138FIelrBVWSf45dQ06i5o4/qCsc/IolleIdKJu1k9
	OulVXRR5tgu3/Kje2V+fe+mP+46E01Dysaw==
X-Received: by 2002:a05:7022:e1f:b0:128:d0cb:7a97 with SMTP id
 a92af1059eb24-12c73f93093mr233445c88.3.1776405370040; Thu, 16 Apr 2026
 22:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <798e83e6-eb7b-4502-85e7-5a0f6d9c6281@nvidia.com> <DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org>
In-Reply-To: <DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Apr 2026 07:55:57 +0200
X-Gm-Features: AQROBzC6Y3v48sYFOsEz2cwt7XYI8G2mRokkhCY-Bi8cmA958EMimlDkpSumvjs
Message-ID: <CANiq72k0FXcekxs=E+xLe3=wyu+KHr4yM0wLj1VgtgTUb_K4MQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: add `bitfield!` macro
To: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 12:19=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> But now it seems to develop into some semi-official "shadow infrastructur=
e" for
> when the drm-rust tree is closed after -rc6 and during the merge window, =
and
> it's not part of the official drm-rust workflow and other maintainers don=
't have
> oversight of it.
>
> So, in order to not motivate workarounds, starting from the next cycle, t=
he
> drm-rust-next branch will be open for new features at all times.
>
> Consequently, all patches applied to drm-rust-next after -rc6 do not targ=
et the
> upcoming merge window, but the next one.

I think that for branches going into linux-next, in general, new
material is not meant to be added until the merge window closes, e.g.
from last -next:

    The merge window is open, so please to not addd any v7.1 material
    to your linux-next included branches until after the merge window close=
s.

Some things do target future merge windows (e.g. Rust itself was such
a case for a long time), so it may be fine when adding it before the
merge window opens, but I think the idea is mostly to avoid too much
movement during the merge window to avoid interfering with other
maintainers finishing their trees for Linus etc.

But not sure how flexible this is -- Cc'ing Mark.

Cheers,
Miguel
