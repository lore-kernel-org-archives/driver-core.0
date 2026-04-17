Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAA93947A0;
	Fri, 17 Apr 2026 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427241; cv=none; b=Ts3VJTxnR2dFSw675Opz5IYWuQIytikQMcxHvSByY+0d1j82XR7t20RFFRO7iJqiPYyBfQkxVCavEJpyNBIpzvE+U017RI2NTFVIeX1X7GAwB7RFxy8KqtEo4TlmdLKiwtVMHo+0xJi8rLfIMCgTvdUNg0+8EoD5tTNCk3coBRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427241; c=relaxed/simple;
	bh=tZPmJ+F0Q+5+qbyQORfl3ivntWS2W2QdCwZg4NBs7Uc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=ZTAlqUFjVQPkCnTiBAZoxP9Xb8kAbjUQzWY0K/RVhVLAfl5nbWluqdrIkE3bio+HfLd4MKzRISgzkylk9sApjqEi83E7fBTPU0ZNmHfd2PLL96CMjmp9vU1I57kyMeHwER6MWGFyVj81B0XEMhxZIe+pTHCzfAtoRwRUh536FiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7Xiw4JE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7Xiw4JE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB39AC19425;
	Fri, 17 Apr 2026 12:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776427241;
	bh=tZPmJ+F0Q+5+qbyQORfl3ivntWS2W2QdCwZg4NBs7Uc=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=J7Xiw4JEQZQqZ5x6r4n41db5MYpX8tURzAJLjwAY7HRmmOjw1Z5ua5wfZE+VevU3t
	 PaOwqX+p2JSGnTFdWT2fIxbZpu3IIQy/LTQkB7DU2St0p8ussbmz3W1Tiv8JrP0MW3
	 wkPruLs49mi36bHyqU3f0AtYpTtlsLQeRFOZ4v+A2C+Cm/6H0veYZg0x4n814hDyWH
	 eh1jqil+SqaleOBQgU6VR/gwOCXSg1IbTvMPYpFNUFUomdLpwjX/sBc2+J2Lq4TA91
	 gtPAuQXxNDESSrowarkT6TYYdITFIn0Fnh9sFbT3VPDd5A1fMbq/2/USiIc4s4vgxh
	 qZNm2tKQ/NMGg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 14:00:34 +0200
Message-Id: <DHVEWDBHYKQF.XBXZ704CMXCF@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 0/3] rust: add `bitfield!` macro
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Yury
 Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Mark Brown"
 <broonie@kernel.org>
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <798e83e6-eb7b-4502-85e7-5a0f6d9c6281@nvidia.com>
 <DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org>
 <CANiq72k0FXcekxs=E+xLe3=wyu+KHr4yM0wLj1VgtgTUb_K4MQ@mail.gmail.com>
In-Reply-To: <CANiq72k0FXcekxs=E+xLe3=wyu+KHr4yM0wLj1VgtgTUb_K4MQ@mail.gmail.com>

On Fri Apr 17, 2026 at 7:55 AM CEST, Miguel Ojeda wrote:
> I think that for branches going into linux-next, in general, new
> material is not meant to be added until the merge window closes, e.g.
> from last -next:
>
>     The merge window is open, so please to not addd any v7.1 material
>     to your linux-next included branches until after the merge window clo=
ses.
>
> Some things do target future merge windows (e.g. Rust itself was such
> a case for a long time), so it may be fine when adding it before the
> merge window opens, but I think the idea is mostly to avoid too much
> movement during the merge window to avoid interfering with other
> maintainers finishing their trees for Linus etc.
>
> But not sure how flexible this is -- Cc'ing Mark.

This all builds on the assumption that we don't have a process in place tha=
t
covers this.

However, all major DRM trees run the above process and handle linux-next in=
 the
following way.

  * -next
        Features; open at all times.

  * -next-fixes
        Fixes for features in -next that have been included before -rc6; ac=
tive
        between -rc6 and the next -rc1.

  * -fixes
        Fixes targeting the current -rc cycle.

These are mapped to two additional branches that linux-next pulls from:

  * for-linux-next
        Normally points to -next. Between -rc6 and -rc1 it switches to
        -next-fixes instead.

  * for-linux-next-fixes
        Always points to -fixes.

The same thing is going to happen for drm-rust tree, once everything is set=
 up.

- Danilo
