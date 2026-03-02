Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CD52798F3;
	Mon,  2 Mar 2026 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462573; cv=none; b=TSh3h8qoOExvVy1N51shWiByhaC1046SoaNqS/yHasaKWK1aPDkahxU1t25LDLwynbPBlQCs5CJNuFqqvR+DxFHEsfMbs9ze9j8x6s+AlJ0GYGZI9weuG9tqFtfVRAGwzNLdO5Xksp7dW+lumSj8oQz0ZnNbwChJR8aa9VrqlP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462573; c=relaxed/simple;
	bh=jdPZtaNXT3Ug5PAx8Lx74Slf+71lV1kNv1pKhVbsBH8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=o8Zx0o+btPWjJOcPasJtwJ5sIey2c8FNq2n0WLYDZ/K68w3rmz5mOGjg3hNjFV10paXgxiAVF3N70z+nuZWFzDclrqdr4szQ+A275p9NLvoy9oIVsXRaroUFe1PkXDqkiDOkvh+jU1XiSLB+fkvz0U8aUFArvj/98JyGuzSIQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKskj/3G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKskj/3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711E4C19423;
	Mon,  2 Mar 2026 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772462573;
	bh=jdPZtaNXT3Ug5PAx8Lx74Slf+71lV1kNv1pKhVbsBH8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=bKskj/3Gmz/aaGAjDErolvdnSoFrXZr/GHrBzAv0dVtTHvrC6GzINql1X0+/9sOLb
	 Hx5Jg9colGJgyUAoym/D2ghGizsKSxKtmmXNrApbSLo8AFw1hMVFP39S0uYTXb/A94
	 iktb6VQx1SW5yZpCYelxEgCsuW9rRgK9JRQ+4Ko2VPfezIOMhwvtGg3Xwe+Ot2s+iZ
	 khx8gL/wWY5Qj9/0/mt5yqIeTQZKfGaRYCa/bL+5AulFtSYmD3s0RFnDjTU3RFNKKf
	 eWQYYPq9eK7HQxzGBcU0ZgdCx+zpM+HHnBpdxHHkMqUH2Lg3WrXx8F0pbxGmUg1GPO
	 4ODVUOhHiFA8A==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:42:47 +0100
Message-Id: <DGSDJIG8MASY.1LD0X1CDOWYCN@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] rust: dma: use pointer projection infra for
 `dma_{read, write}` macro
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-3-gary@kernel.org>
In-Reply-To: <20260302130223.134058-3-gary@kernel.org>

On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Current `dma_read!`, `dma_write!` macros also use a custom
> `addr_of!()`-based implementation for projecting pointers, which has
> soundness issue as it relies on absence of `Deref` implementation on type=
s.
> It also has a soundness issue where it does not protect against unaligned
> fields (when `#[repr(packed)]` is used) so it can generate misaligned
> accesses.
>
> This commit migrates them to use the general pointer projection
> infrastructure, which handles these cases correctly.
>
> As part of migration, the macro is updated to have an improved surface
> syntax. The current macro have
>
>     dma_read!(a.b.c[d].e.f)
>
> to mean `a.b.c` is a DMA coherent allocation and it should project into i=
t
> with `[d].e.f` and do a read, which is confusing as it makes the indexing
> operator integral to the macro (so it will break if you have an array of
> `CoherentAllocation`, for example).
>
> This also is problematic as we would like to generalize
> `CoherentAllocation` from just slices to arbitrary types.
>
> Make the macro expects `dma_read!(path.to.dma, .path.inside.dma)` as the
> canonical syntax. The index operator is no longer special and is just one
> type of projection (in additional to field projection). Similarly, make
> `dma_write!(path.to.dma, .path.inside.dma, value)` become the canonical
> syntax for writing.
>
> Another issue of the current macro is that it is always fallible. This
> makes sense with existing design of `CoherentAllocation`, but once we
> support fixed size arrays with `CoherentAllocation`, it is desirable to
> have the ability to perform infallible indexing as well, e.g. doing a `[0=
]`
> index of `[Foo; 2]` is okay and can be checked at build-time, so forcing
> falliblity is non-ideal. To capture this, the macro is changed to use
> `[idx]` as infallible projection and `[idx]?` as fallible index projectio=
n
> (those syntax are part of the general projection infra). A benefit of thi=
s
> is that while individual indexing operation may fail, the overall
> read/write operation is not fallible.
>
> Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  drivers/gpu/nova-core/gsp.rs      |  14 ++--
>  drivers/gpu/nova-core/gsp/boot.rs |   2 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs |  10 ++-
>  rust/kernel/dma.rs                | 114 +++++++++++++-----------------
>  samples/rust/rust_dma.rs          |  30 ++++----
>  5 files changed, 81 insertions(+), 89 deletions(-)
