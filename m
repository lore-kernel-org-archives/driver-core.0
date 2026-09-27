Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DA341D4D4
	for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 18:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532711; cv=none; b=ILHZ5M6oAOmmvmtRozzpAtJfS4Owc5YWDVdtSYjftJolp2yXOivW4OtULxwZSYm1YSJo/RAN/TlCjcEz4berSK4jCsm0dCTPwrtUKxCb6L6Hhjm+Y7PxcYIZMSGeAzxoxD/ReHCJdDKU0IdvY2FpYo3PYw5LSse4dY8S9ZK4OEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532711; c=relaxed/simple;
	bh=MsjhdNHNUOPcQ10FOtPouiKOZQKjr6aJbDQVX6QUNAw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qoVe1YreHt8PPe5nZobGzaMEFfoNlF4TjKA67eCqWuZgxCSLjmwzqZ0VYQBWQTzjZRH2jZJASYO5Pc7Vr+TwbrE3Iqr3JCrqnp+tvwbVEgvrIdqZfGDKx3WyBmW53bhZaWR6hyOIkLatnbYXwyoiZOtgJq8Q685l2JrFwF9943Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=zj5cByW8; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="zj5cByW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790532695; x=1790791895;
	bh=PW3qafb7hPoN12TvjOZ5TmRg4ziVC/vRpHNV2IFX1ZE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=zj5cByW89kw3MtjACGq6C9IDrNSf0X/PiwvD8l6tNlS3JJZunZ6gW6GKgmB2qWvyn
	 MuS59oHxqMMspdUYV/27hHn95/RfE62IzFXtec5WYi5FkTPYJt2zLiOuMvLGGrFL+D
	 f8urS7TMOw6p5djSRNkdCy5WGK6HZCvaIzs7gOHkuoNPeTL1VAcs1PUVmWxmLJS4O5
	 kvxRN1ZyzMkK6e6UpqP0nJTch0y2odQpoParYC4Czq3aMn5c+dKkhljD7YZSKQMXha
	 KO8CtjuKXogNacrtqSBFTtYp02WesFK352mhVR5ZtV6Qk0efllZ1nTLV72VNUU46ky
	 aVu4NcXZy1Ayg==
Date: Sun, 27 Sep 2026 18:11:31 +0000
To: Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Subject: [PATCH v4 0/2] rust: io: convert ResourceSize into a transparent newtype
Message-ID: <20260927-resource-size-newtype-v4-0-447a08af23fb@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: 30c9204b4ec447a9bb7a0d0613384c97637b5e06
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This turns ResourceSize from a type alias into a #[repr(transparent)]
newtype, so that every conversion at the FFI boundary is explicit.

The first patch changes SGEntry::dma_len() to return u32. The length of
a DMA segment is an unsigned int on the C side, so it was never a
ResourceSize. Doing that first means the newtype patch no longer has to
touch tyr or nova-core.

Note that Alexandre's nova_num series [1] rewrites the dma_len() line in
nova-core's gsp.rs to usize::from_safe_cast_arch(), which takes a u64.
With patch 1 applied, that line needs usize::from_safe_cast() instead,
and the FromSafeCastArch import goes away. The two series apply on top
of each other without conflicts, so this only shows up as a build
error. I can rebase on top of nova_num if it lands first.

[1] https://lore.kernel.org/r/20260828-nova_num-v1-0-e21f17ba4127@nvidia.co=
m

Signed-off-by: Lorenzo Delgado <lnsdev@proton.me>
---
Changes in v4:
- New patch 1: return u32 from SGEntry::dma_len(), as suggested by
  Danilo.
- Patch 2 no longer touches scatterlist.rs, tyr or nova-core.
- Drop FromSafeCastArch<ResourceSize> for usize. Its only user was the
  dma_len() conversion in nova-core.
- Link to v3: https://patch.msgid.link/20260920-resource-size-newtype-v3-1-=
9451444e83bb@proton.me

Changes in v3:
- Rebase on rust-next (v7.3-rc4).
- Implement FromSafeCastArch<ResourceSize> for usize in the kernel
  crate, next to the type, now that the lossless casts live in
  kernel::num::casts. Drop the impl from nova-core's num.rs, and switch
  gsp.rs to usize::from_safe_cast_arch(), the same line the nova-core
  conversion to kernel::num uses.
- Convert the dma_len() user in tyr, added since v2. Without it, tyr
  fails to build on 32-bit ARM without LPAE.
- Link to v2: https://lore.kernel.org/r/20260719200945.687904-1-lnsdev@prot=
on.me
- Link to v1: https://lore.kernel.org/r/20260712113602.389060-1-lnsdev@prot=
on.me

---
Lorenzo Delgado (2):
      rust: scatterlist: return u32 from SGEntry::dma_len()
      rust: io: convert ResourceSize into a transparent newtype

 drivers/gpu/drm/tyr/vm.rs  |  1 -
 rust/kernel/io.rs          | 74 ++++++++++++++++++++++++++++++++++++++++++=
----
 rust/kernel/io/resource.rs |  6 ++--
 rust/kernel/scatterlist.rs |  9 ++----
 4 files changed, 75 insertions(+), 15 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260920-resource-size-newtype-63a82d4f2cdb

Best regards,
-- =20
Lorenzo Delgado <lnsdev@proton.me>


