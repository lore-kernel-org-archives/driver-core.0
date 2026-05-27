Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0613F6601
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 13:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887616; cv=none; b=Lf8CuyWvV/unTL4zywtjmP6n9PHQfCpJIrJ7rn0TaWZYEC4LFpxyYDdjdONqQ654W8QKy/wz2aZydwJGZWjtuhwkSMvujbuTIRQfpNqLoO+Ak3gsJaNETZA8umAwgnJWRp/b6hYRMOA8HKrRVHRF1TjpOOTjG0SFlzCWUmdeBKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887616; c=relaxed/simple;
	bh=agHr2sBhIjxK3Ormo5y5nfaxM4jTXpBnQzURrcUDSe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CW4qM80Op8RqQ0eVHLkC+qDtsAULUn+jNfFWlE6Tpw2jMHKFRrfp/5Uwq9Ypd1PfAX/c/1bJf573rGZtfp8hH5/ejwOxf9SCA/PLeJd6ernFFTloYFU+bcEmz5Ys6Sr9/n25tEq9xkKmYhclNHNgaGhfOVzgWnmp8xOfqVPFJ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bz673UA9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bz673UA9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832FC1F00A3F
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887615;
	bh=IWzal5f7ADTgKqW+mTx8TdSHtfH1pO86e+7eGi1WMeI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bz673UA9o2dxwJ/yJ5c+fGYoFTBtdtulF/u89jD9mV6VYz8OwCV8YusiNfGxmm+Fn
	 PyHDOvIq/+J7q5q0kRR5a0ZniEWro7x+W+dbgVyyfV4fYSSmBwxf4iX0fX6v7oPhht
	 hX81W2p4Q8aZSqjN99wCclmzfx8khZOQz9Lei0HXfpINo/zl1QDutw/MJdKTOvbANW
	 oBtol/P61IYMpSnEQ7gLNDpl6WRspFWOW9b0qq+aIQ80QZeJBtGVz63KzavOG/rhf4
	 WXcOS3R1X1rP4YrkM+oqt+KkEmbcx7Ku8XzznatKo9qOdJO/63Cin34bsltsXuD5lJ
	 76Yqut6UoeznQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39397d63804so66278961fa.2
        for <driver-core@lists.linux.dev>; Wed, 27 May 2026 06:13:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/r4Qe2Xpo+WwxcvCPidvN0geAURdPOwbYCbPwj4SmoC22rWiaqE0S0/aCYU245wOBtj/MsRMP9PXbNpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTUifluRndC3mC1D70mVUU8V3Jc3bJMm7gVHClX4UUK5A7IFQi
	NFZghD513kkUIOgklIMF4Ksmm1JKyPYYlqDvaJc+UkrJ3++QvYSA7b33YLe8ZJzNT6BQ9eK5sAb
	MmCz+i7+kYQsYBR4gp4cDc0U6lrEQQW0=
X-Received: by 2002:a05:651c:1991:b0:396:297a:8a7d with SMTP id
 38308e7fff4ca-396297a8abbmr13747761fa.0.1779887614270; Wed, 27 May 2026
 06:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522-strict-provenance-redux-v1-1-0880b65fc17c@kernel.org> <DITEXRBFOZLD.V7Z5AFF3JXBO@garyguo.net>
In-Reply-To: <DITEXRBFOZLD.V7Z5AFF3JXBO@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 27 May 2026 15:12:57 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9mQhe6o4tir2PFiJBD=iddSz1iKs7uPtkBTq8uMzsWOjQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ia2k-DUjFNwjaSz1hg3z4LUmJRBmj7rL7yD8RllH3cRhYgJr7B3uG4fEM
Message-ID: <CAJ-ks9mQhe6o4tir2PFiJBD=iddSz1iKs7uPtkBTq8uMzsWOjQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: use strict provenance APIs
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 7:13=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri May 22, 2026 at 6:19 PM BST, Tamir Duberstein wrote:
> > Replace existing pointer-to-integer and integer-to-pointer conversions
> > with calls to the strict provenance APIs.
> >
> > The strict provenance APIs were stabilized in Rust 1.84.0 [1]. Since
> > commit f32fb9c58a5b ("rust: bump Rust minimum supported version to
> > 1.85.0 (Debian Trixie)"), the minimum supported Rust version is 1.85.0,
> > so no polyfills are needed.
> >
> > Link: https://blog.rust-lang.org/2025/01/09/Rust-1.84.0.html#strict-pro=
venance-apis [1]
> > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > Link: https://lore.kernel.org/all/D8EIXDMRXMJP.36TFCGWZBRS3Y@proton.me/
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > ---
> >  rust/kernel/alloc.rs           |  2 +-
> >  rust/kernel/alloc/allocator.rs |  2 +-
> >  rust/kernel/devres.rs          |  4 ++--
> >  rust/kernel/error.rs           |  2 +-
> >  rust/kernel/io.rs              | 10 ++++++----
> >  rust/kernel/io/mem.rs          |  4 ++--
> >  rust/kernel/of.rs              |  2 +-
> >  rust/kernel/pci/io.rs          |  4 ++--
> >  rust/kernel/str.rs             | 16 ++++++----------
> >  rust/kernel/uaccess.rs         |  2 +-
>
> This touches many subsystems, so you'd need to break this up.

Ack.

> I'm also refactoring in my I/O projection series which I've already
> converted most stuff that I touched to strict provenance:
> https://lore.kernel.org/rust-for-linux/20260421-io_projection-v2-0-4c251c=
692ef4@garyguo.net/

Will wait until this lands to re-spin.
