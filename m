Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484747;
	b=mAOxrkD1KaNNzzRyOaCqncTg19UTVr3MkJcrQg9YSsl2UhghXiADKJh1lILa+o5glSIs
	 X8ZCRGnr781uYW3CsK1eLWIFzfhk473Z7jsq1pqS8Ml5aOpOJEngASpwO14s1OmfiKiTD
	 BYWnaxEQLgO37W5bsHaYi4U7S+K0ZBRTREAcuTd8o8uQBCUcS15evrYBeXLiSMJ47h9Mc
	 hq6317WouvFHxBjVhlNaP1ohyxYPiOviCXZANDTy5ouxtJhQdp6e1Eq+TanNFYbi9uAVs
	 V+nFQsl/nXY/Z7hJMTD44RZCP2G4UY5ESX4cEf6x7Yz+L/ZCujOB7TsoE+gUnBHfmJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484747;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=8M0oh2AqgxAI6ZpQRJJhghp96GjY8sQQ1ghn1+UQZnU=;
	b=q3gZ/pqDXLZjLqIJOo7WaLOLT+dF4OE02OnYt9+1ETrBxBQJpRwSMlqeXTST1t3PMcQr
	 t0voRAp4cSu8JHDgXlOAEIdrUEtg8S/Jh+Tf0xtBbhJ2695EJfxHl8LL+YUKspyvUwLvh
	 PbAQSracm3+mysnCgBAMwHeJcg+MRhgpje+D2B7XXerd/DV8oxti94u7w4WnXGMOYcgnN
	 fM7jgwpQHsQIJxjzbvBtxtKhYkFczoWFbKl0IbPeNtMcUc8WwsTo2xG0l7w1BOlzeZV8q
	 qStAIBbvdMhZ/Zf7ahe66hr82aOefoic0hu2Wrb8HIUHugUYy0+3qq94V49W5+AA87A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HknpIIqB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59942606A31B;
	Tue, 20 Oct 2026 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HknpIIqB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792484746;
	b=FgPoTl+yeNRRHhK72O8ELkfEEdU10jb7xOM0QNRZtes2bT1qZKT4nk19hMfZ2gPKsP5C
	 Nm8W2ZBgMy+U+rgyVXoLdKcgW94+l95qrSOiCUffk7r+j2cmj2POggcwnGzF+ad2jRGl1
	 ZZl/dTmEVJ+/3ARlV0RQ0Gr0l/lGypWKGIwIYn+r/EkqDHfPCqO5z1RlNlFyGN38GCQxQ
	 U0AmeFRe89h9a6d47BaMCQTqEuWerFr89FGQoGf6Nsu7aKPsPpoDuAx+HkAjHf7rRMusK
	 bAaJ5+UBJAN75j0zpLoIqqYE/EYY9a5Yq3qLKiRKbDUTfHMNEkKEmw3ZDDkZMZl7TMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792484746;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=8M0oh2AqgxAI6ZpQRJJhghp96GjY8sQQ1ghn1+UQZnU=;
	b=q/rIZtmngc2brjlffBD1+sxNgNPvZUf/Uk/lw2b8rsC5cZ5AbqGGia8eFVQ3Sl3msIEn
	 R32cfgQ1rPoCpi6NNhzrONWGs5Q0QAwFoLtTdZySnuWJqk5MSf1PsnmnrVGjjaT3NsWzp
	 qtsysX8lC78Dna5GuSX9na5MJwg2DsCJmenfKMc9GUN0UiuM4VJBDdDDvBnQKjJhpvpNK
	 fU42mIcwI5EndAZA/qp/jrhlj3EiIjErgcnorRdOvXoOpQRxVbzD8lLYS38Gml529f6qh
	 jPl6fn5YVsxPwkN+BwMjB0oYycpdev0Pxm9B7WJmPJZDVTt1nbf3X79lg8C0F+36Zrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45D0A1F000C8;
	Tue, 20 Oct 2026 08:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484746;
	bh=8M0oh2AqgxAI6ZpQRJJhghp96GjY8sQQ1ghn1+UQZnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HknpIIqBWVG4RDDAWPFpeRRZGI105BMcDt/QIyAV3htiFcIUqAU8Ri2roNpFry+6f
	 +kOv38KMHhCeBugMGAoYx80IeABD8tTwrDsIq33IGF0ys4V7aymNlRctRl+0nAsALZ
	 OHG8osUMufjdJjYWE8UA/9TnvxqE73TuGWXRIEH50rHZ+5VRAB6E9wEIJFrnRkN25c
	 H45MBY6CfEyCZgtzfukiSv0D5/6fNhQ0bkaYUhfNr1Ivo3SZE8manAWF3xFC61B7UJ
	 LmJs9bFUtTPKI/C3vauUl4lgQv+ar0Nb7pplNlpPpvGrKykypckpFqPe/4YPb9UPCZ
	 yUivwQHc+kJrw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9FFEE430CC;
	Tue, 20 Oct 2026 08:25:45 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Tue, 20 Oct 2026 16:25:18 +0800
Subject: [PATCH v4 01/11] rust: sizes: add SZ_4G constant
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261020-tyr-ioctls-v4-1-704de77da223@kylinos.cn>
References: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
In-Reply-To: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, 
 driver-core@lists.linux.dev, Ke Sun <sunke@kylinos.cn>, 
 linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792484721; l=1808;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=5K5ZDtbb0No9pS3iRwCaB/ZkoyNuv4RA97gE66KsHmQ=;
 b=S7kNtOQT98eXxrrMvt4CgYx9CRvn9LdTut3eQA05YkIP763ffVSnG4AhPDuBiTBCVr5svmTSQ
 ijyrtnGRtN+ClGSgrmja1W8xjNWmpTDLmdDgZdMd8avLa/I2O501p7K
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Alvin Sun <alvin.sun@linux.dev>

SZ_4G is used by Tyr when splitting the GPU VA range into
user and kernel regions. Add a LargeSizeConstants trait, implemented
for u64 since SizeConstants only covers sizes that fit in a u32.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/sizes.rs            | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 930e63290cdd4..ee99f470ae5f4 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -116,6 +116,7 @@ const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
 const size_t RUST_CONST_HELPER_ARCH_KMALLOC_MINALIGN = ARCH_KMALLOC_MINALIGN;
 const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;
 const size_t RUST_CONST_HELPER_GENLMSG_DEFAULT_SIZE = GENLMSG_DEFAULT_SIZE;
+const unsigned long long RUST_CONST_HELPER_SZ_4G = SZ_4G;
 const gfp_t RUST_CONST_HELPER_GFP_ATOMIC = GFP_ATOMIC;
 const gfp_t RUST_CONST_HELPER_GFP_KERNEL = GFP_KERNEL;
 const gfp_t RUST_CONST_HELPER_GFP_KERNEL_ACCOUNT = GFP_KERNEL_ACCOUNT;
diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
index 521b2b38bfe77..0acc8733d2368 100644
--- a/rust/kernel/sizes.rs
+++ b/rust/kernel/sizes.rs
@@ -132,3 +132,15 @@ impl SizeConstants for $first {
 }
 
 define_sizes!(u32, u64, usize);
+
+/// Large size constants (≥ 4 GiB).
+///
+/// Only implemented for [`u64`].
+pub trait LargeSizeConstants {
+    /// `0x1_0000_0000`.
+    const SZ_4G: Self;
+}
+
+impl LargeSizeConstants for u64 {
+    const SZ_4G: Self = bindings::SZ_4G;
+}

-- 
2.43.0


