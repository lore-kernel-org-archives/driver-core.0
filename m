Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E072391E4E
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030113; cv=none; b=NElFZTaRTPMpo6Mwa/xRBp2/55GSFHdNP8UdepXET/pctLJhGlVWeD4WoB2ZyHW1uMHxuzMyrXlKAXnHpJkDXuVGcphDLnWBjhFi3XL5q5LzTmoro/ST/ZZ5RxEQxP4b1bXRShW3TWdkC0pDDRLG+WhRoaM7n1VIm6I+WyIt9DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030113; c=relaxed/simple;
	bh=sSOMPBG4fiWze6IAdyKEgJOvNuDwNVHf2DlIvHsEtKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFXh5tm7CSvVAJvQWx55yl6EvoI/HoYRa5I1u/ZjooWE426j/oUmRRealaIwsO/xJz369rxwWDEgUIsEIfkkPoSvPePh230Y+HoaNTvNZo9mjt+YaxmsqHfBCqfhTf4QV7PVFebcUcCgJNd5hKUpTCnTKsHJtfLyw6bAqe9SByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ecf499af9so34266377b3.1
        for <driver-core@lists.linux.dev>; Thu, 06 Aug 2026 08:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030110; x=1786634910;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ohZ39jK4R7nHBsxWJDOlT0sMAW4jJSovzDHcfJTHmAg=;
        b=LWJy7x+4nBHZX1RJ1nEyt/4PvL2LfF1CkwoNtAeS/HvxJOcungMgZ8utkHX0IYEuUO
         Csq2QblUf3thRNVllsLiJfKasP8SDCm+bnCy3PqSJamK5Q/lXdSiQy1eN7quTmYb0iJa
         8sPsKgF7Qss90dCr3FJvEptjxr9I3MH5LVyBJLLaQYE9x/iKa2VELFvrBhN6garPPZ9g
         y4Q/iq14/4+9ixN5xJpTkbc2xW/rgMRlp8wQbw8bdGeMOKXcIcD8eSO0HESC2M2hZaco
         YPCbzZ1OGHm+2BquKqxOQS89KinyBuVSLSJbh+Wy5HCw04aD8OqpnvmtH80qK6K/sMKV
         8R+A==
X-Forwarded-Encrypted: i=1; AHgh+RowsIkuUrqV6HJ+eueDFzFmT4WvO05ZZs6mIC+v8x7PgPwLS/1dAKTvRYIwsYQc/G2Iiwh5qTH676SZUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZStV0wOzeJ//9N2ALzCHGCi983a4dkUhc9mRwa/Wr0MONxHSl
	KoY3Y/nhDn20YSI8pVWuFJfzrvNwxVuDzArjvRugI8GU3eallSoRgauIlVuxgl3R
X-Gm-Gg: AR+sD10+TMEMTArPhqNDznFNnV4EOLoeDOXX3O6I9p1WBmZng3zlQhfPlqWeMAdDWbO
	OgJCvhEWfzdtuO248d/c5tMVxiAuZT5hX1CwfSuS247SZVnvJync5z7YOisL9K1B6i7KtavwaTM
	zdbttPHceJlor7Rk89R8QtoiUUjaGotTgJMgwJ2kcBNihEX5OpGyq43y4L2jc/s3CDKFoHccjr7
	PtWkjmesqTZzquEqYkcEqKoF6P1ij1yatlGmw4C+WzRYryVWzW+nIVOhwjtiVxjTrcpB6fiHaAu
	q5UsplRnRAkdMajrnxd7aek8MapWrIlkz0eX6Wr5tUOj92SFZ1KMLfezkBtMNIPYsOruvL9yi8c
	qS724DYv5B3A/1tLtr9Cg0yHg1LYbSpXHDNNmRvsTdpx2orC1MDEXtlj0sA8X4hsUnDItFZPaeg
	VJOH9+0b+LoOu7ueo5N45GsP3VoJW4bybUNdEHtuVJLJIVzV80gnwX5BndXFporMUCaqZ0fYb7n
	wDM40JYIgsNgWAX/XuGdUmLEKUCv/64OUAd3AyU
X-Received: by 2002:a05:690c:6c85:b0:814:651e:a553 with SMTP id 00721157ae682-820224cc826mr89019137b3.28.1786030110575;
        Thu, 06 Aug 2026 08:28:30 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201326bb32sm40754217b3.21.2026.08.06.08.28.29
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 08:28:30 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8201447e8cdso38598497b3.3
        for <driver-core@lists.linux.dev>; Thu, 06 Aug 2026 08:28:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq+CKWeZFjdC09k0iKzo44SjQY1GH/k0vVV7dLtRqVCYTvHpUFIIjLrJJx/fHioCxUqy/w61dudYz9K7w==@lists.linux.dev
X-Received: by 2002:a05:6102:2b83:b0:738:133f:8d5e with SMTP id
 ada2fe7eead31-760ea747b4emr4930162137.12.1786029696259; Thu, 06 Aug 2026
 08:21:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803180931.97202-1-ojeda@kernel.org> <fb2daae7-4eba-4ca1-95a5-60f8157eb66b@app.fastmail.com>
 <DKFKXA6YWW8R.1NDZ44Q13XFQH@kernel.org> <20260804071330.24760Aaf-hca@linux.ibm.com>
 <33ecacea-ed2a-409c-ab1c-a136e06b1b7a@app.fastmail.com> <1aac654b8d333cc058a345b03ae0f798f1724ced.camel@linux.ibm.com>
 <57ac7553-4034-49e2-b686-b7272591da00@app.fastmail.com> <94c3ebc645e80feae1044a57b8b5c82d4d4ff408.camel@linux.ibm.com>
 <f2002ee7-00a4-4a3f-a516-409886b724ab@app.fastmail.com> <2aaf01a4417cea313ce0cce7cfdbec65d350a41f.camel@linux.ibm.com>
 <f85a48cb-4ad9-412c-be00-a8227d6c8fb1@app.fastmail.com>
In-Reply-To: <f85a48cb-4ad9-412c-be00-a8227d6c8fb1@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 17:21:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBiCA6+SWatmbB5bVdFd7_9CPNgR_eaTcOUpqAEA5J4w@mail.gmail.com>
X-Gm-Features: AUfX_mytiRYZjGYX1aobVkgoZ5obof2d1lrRV5Gr1cwx_C_pvGoMLWUjStMFMZU
Message-ID: <CAMuHMdWBiCA6+SWatmbB5bVdFd7_9CPNgR_eaTcOUpqAEA5J4w@mail.gmail.com>
Subject: Re: `io{re,un}map()` build error in s390 under `!CONFIG_HAS_IOMEM`
To: Arnd Bergmann <arnd@arndb.de>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gerd Bayer <gbayer@linux.ibm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, driver-core@lists.linux.dev, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	linux-s390@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 6 Aug 2026 at 15:51, Arnd Bergmann <arnd@arndb.de> wrote:
> I think the reason is that there are a couple of architectures
> (including non-MIO s390) that take a shortcut for normal
> ioremap() that avoids actually mapping anything, e.g. mips
> and related architectures have a fixed uncached mapping
> of all MMIO space visible to kernel, while some alpha, m68k
> powerpc, and s390 do something other than a pointer dereference
> for MMIO.

FTR, several m68k platforms use the transparent translation registers
to set up a mapping to the main system's MMIO space (like MIPS,
but programmable), and thus just need to add an offset.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
