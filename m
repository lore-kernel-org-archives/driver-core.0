Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795352566;
	b=XOy7+yE1/Xzbr60EXr+X4I8PhMVsFyCgZrujbPsA23ap8aWxMN6JseiZD/0bIZhaNWbu
	 79aLON0PkiP8u1TKABPnLWWSF4JUcpDQptGoShGyTa8fq/3VnbTpDMR9fMQrcexAQ89NH
	 nUHbjQFMLkwXnIOzBm3/5usA9jKruWkI3Z/akWafRbZteIZw0IVOOIFC+Dn2FFcB2/Psp
	 WGl9BHmB7ty1IFAfHBhhECXFacrpieUO72uk6sYt0a/JVJGBxMXxs8Md6wv2IjSpjdrxS
	 b6KGcvfehI3AMqH9w7/TkZ4iErDQHKM/2SAbCRT0zhRwfbkJNG4vXLA1wLf64F4lu9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352566;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=A0G4nQxOtEkJJTatEFR/Y62zYOWi++yfTh/emLcUVrU=;
	b=mYs8QX79W11G1tbTTS8qBqfS/GD8bCgRFIEd2lhkQOMOvre1338nk4sN39U+KwDUMoT9
	 RkL9Xqfq3RoRC4sa6sBA9mluUBKDxeysEwtcFxRxvSFsfGPdC0YhFqNLF4InE8i/1qizR
	 G6TnwkGb9N6Yfcvbp2bHt4zVM/bFRZ53kTuxGRlvuOW4nYsuTRNQC6xu8zuGv15djU445
	 6Rl8o7IHe/pSPmVfHG557BLfTqPPPiaJEhAyhnEpZMkoecZCX/+aR6KN2KuJWAOnMqeKT
	 4P5P2/NAoKgFv83pCtVdVoWnL3tiD9qZ5otO0/PoQda3kqxFxl1tmZSeKefPXnlDtuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=yewXViJZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC51A606A337;
	Sun, 22 Nov 2026 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=yewXViJZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795352566;
	b=dAdk4HWx4iIX6AnqLyvBJm4VhWeWEcTfFOgf3sfOnXBqobQsampfs6BXjZUp2d1e660D
	 xtOxz27zitAOdpVTyTW2CJQGisnFmCzOBNR2ADoLiO7EpVoIDkf36DeCquza2hG7d4TLI
	 56joFoP6BaNEvG9w1flZZvbziGIP0slM9eKrl8HLd2W4BitPKk13G2CjbyULzRM2mXJI5
	 kIKQfyJVGTSZr5Dt5BH4EsKYUkZHgmggLWv0xHb6mYMmn0wX0s8QjOmWsqZPYUrjs8cVE
	 ZJr0R1jfM1ef9rdey0SvPtZu+9wJJhW+y+mgu0lcBIDXYZVnnOL4PQPrGwXNSDEw2wg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795352566;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=A0G4nQxOtEkJJTatEFR/Y62zYOWi++yfTh/emLcUVrU=;
	b=zsMVD+4NP6eBGfyRF4YBWMH1pwufiy5tNUdg0x2IGDGlDb7hLL0zBfM8RUUmkkUeL46X
	 cYzhEtWqNUkKMA8N7bjha5gUzNSxBhu8nAeZ8h4jhMDM4a1urXtrkT4YUfCtMEvPpDs8A
	 XTTZIzV4JDGkibfSs7UlPfP1FoxmxgjvD8/9285jq/OfVYz8hWVewtm3P3oSnWpaICIOi
	 1y4I3t29ITc68Mj4bN/swpV15pdL4HE5J2yluFCasELmADnsnhNAaV0sb/4yNqEaRtNet
	 u/K+yquviI0rWaT8Oz30YuAFI76VYcTqdX3BaZMFMPOJ8SpJ7xHD+g1dX7fz6TO4dtQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 734401F000D0;
	Sun, 22 Nov 2026 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1795352566; bh=A0G4nQxOtEkJJTatEFR/Y62zYOWi++yfTh/emLcUVrU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=yewXViJZq9o60Ov75JDSZRiA7S1EpspIp4WXrT69vYygcEs7nqfyE7ad22s+G+q8h
	 V84/CdtL/zR7AtwQfro0k+wtt+YHTchGGZuwDtxCdGQxxbcMDKrUFe/RtfrrYGz1EB
	 K8kCi3V9kZPUWsQlEtla47qvh0CT3iXkSEwWW4E8=
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F0C1B4C057;
	Sun, 22 Nov 2026 13:02:33 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Sun, 22 Nov 2026 20:50:22 +0800
Subject: [PATCH v7 03/10] rust: sync: arc: relax `ForeignOwnable` for
 `Arc<T>`
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-tyr-ioctls-v7-3-3a2af624b992@linux.dev>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
In-Reply-To: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
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
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795352551; l=1389;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=E65clxOu/qjNbqNDrRBBfaWHB/W/gvw7JStoVkgnAT4=;
 b=rgqWPnwJKctrGwdGQetlNd7KUGuTt9snjiLGs9rkxFX/uZ/s3JYn/fIkl14xeCpDuIU7Q8DR5
 eMSwt09EjANBaVP8yqR/RkhcttZ+pW2Vok26yhRejB435C/8rQim/oy
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Drop the `'static` bound so that refcounted values borrowing from a
driver registration scope can be foreign-owned by the XArray
abstraction.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/sync/arc.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 8ae0fe6f19ec0..9b582a815f888 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -363,11 +363,17 @@ pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
 
 // SAFETY: The pointer returned by `into_foreign` was originally allocated as an
 // `KBox<ArcInner<T>>`, so that type is what determines the alignment.
-unsafe impl<T: 'static> ForeignOwnable for Arc<T> {
+unsafe impl<T> ForeignOwnable for Arc<T> {
     const FOREIGN_ALIGN: usize = <KBox<ArcInner<T>> as ForeignOwnable>::FOREIGN_ALIGN;
 
-    type Borrowed<'a> = ArcBorrow<'a, T>;
-    type BorrowedMut<'a> = Self::Borrowed<'a>;
+    type Borrowed<'a>
+        = ArcBorrow<'a, T>
+    where
+        T: 'a;
+    type BorrowedMut<'a>
+        = Self::Borrowed<'a>
+    where
+        T: 'a;
 
     fn into_foreign(self) -> *mut c_void {
         ManuallyDrop::new(self).ptr.as_ptr().cast()

-- 
2.43.0


