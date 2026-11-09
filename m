Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794184624;
	b=vrtTfoMpWDC5nJiyjxL8aix8whDjGqKDbYc2F4tFEpe/Cqo8d61AC9c7cV6hBf89qUJp
	 P2qW+F/RlTqolo92PIB64LACmqp/MJMm2pBrHPkVRuZb7YbyppcljoOEqXz2U05uKT22N
	 0vE2MSQgsmz8Wh1ivrDO1tYC4ZWnUm8Rnnw5jPe2STiElN3dcsxjOSWBhZUxK7lD4DsHB
	 GyBMJwmBZT+PYGmPPTYkD5mpJao/Y0idq3yzLzNBbvGZ6SyDejr8fj/UvlYNF1BqAfoY4
	 iu9JVcbbl0DAEliK8CFkmEGcYSZkdoFu4KLILnmhO8T6fQe2Tt8yt8LfnmOpS+CkZxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184624;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=jPxyRVxUkD8Td+9QwNyvaWaSg+CRoePkY9b5UHxne8c=;
	b=HFUggEp+pW7yYHtK2WGCRwnn3jZOp9ClV8ecXaXtnxTYwV2mJn4ohZ0VSbuZ1AlVd+as
	 PAaWXmEiPkA1e20kdvp+rjYNwc52pjQqhefMPaHj6zy+PtzRPkBMwIfVP1+c7C67waI/W
	 d6HGDsuudu/kVWF49uQ+RWeLsSLESN2MeoZwmfZ7klFiCxIlt6HFBPpwnf0crxnaTcbYG
	 VxyLKP01LvEmQDe9w8qOn1C8rXj7Ew0uF6QqlEWdE+J12xOQzRdZBP0kl9DKd6dijxuEy
	 7nTNlKWue99mDZkx0pOCJuE4OSsoVZ3AXEjnrt4BLBVtdefQPKgswLJnlM+Kwt56kzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3BfP5yv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF59606D820;
	Mon,  9 Nov 2026 00:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3BfP5yv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794184624;
	b=hlz3qxw/PU4QVNb50L36ta/Y5TNia3S+ccnh2kN/uUz1jUPtlh2Y4JgtXvhx+/WG5rgn
	 m5iGoTWQ9LxSZjk6TIvzEuxxKPTv/NVhxI+L1oyw+UpEwKC1JHrvUoUfO1kNX2JNbBQTq
	 8uVVUEuiBGj47J1jrzsiGBcGRfnppc5/+QetGyjs0BAh4hBg671b1b8V2HxbVg1VuIoT1
	 wlX0NJZ3trLiOdx3Yn3XNAkbp/duNDczlh1p75QGTQoog6idRiNE2OKvU0pBv0O0zHPlt
	 CIfo/QmxCdqhNgxoQGINrWpS8/1WYE1krxLWaC1b5hhcT14Wa0Z7h+yALx6vJbCra8A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794184624;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=jPxyRVxUkD8Td+9QwNyvaWaSg+CRoePkY9b5UHxne8c=;
	b=gQPvAXd7rLfvJ3nytCg7/NwrKarELrzry66rAux0sbtldXHOToBwcP92Dcx8qYu1LMvX
	 TrED2s2h7pntzl293P5GamB7WeSoNcwuiqWx3vUNYp0kFWIMeQzz8xK66fRAq9bGBgrL/
	 yMBWX1qhb5mqCgB+XWu4zBtNntnBxmW5YT2jXyW9cmcQcc30wNOcBLO5rbeGMKnzUdkHH
	 SFS9t6bf2Eb5ETK13Ftm+Tpg9yrWHx06rLdW4BpWtMrWPtT+qsCQs8bWTZzT+y0vS/Kmb
	 TcYZ0bQY9uIyrVleS2s53r/nxF8hnAa8UxOuoMTSS59o7fy80ilHXXUw2/9vMR2qXdA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8E671F008A3;
	Mon,  9 Nov 2026 00:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184623;
	bh=jPxyRVxUkD8Td+9QwNyvaWaSg+CRoePkY9b5UHxne8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=h3BfP5yvS1/AcEMIldri0EGYwiF9Llh6vBOIM+mFZAf/YimmyZOA+8cmBU4dsBy7P
	 Ht4z1sqhK7T+pQxx8PKxnta70huKEoGTOYUqMumG65QdJt479lZHpihF4+4ahoDyY4
	 5mUAJ6zFzwC2E4hagMSxciSEy4820HV9mkWRdWAJLE5ZgbWMrEa5d2kgcJ4aTiwdut
	 HQBXzveswWbqQ2TPIv7FAvOgk+LttfQFN+K3Enf5fUjPQgWrw/NxTRmi+KZuO4e7so
	 uijz/DfY0aR0Aln2yev+HTCTrzhvE5YA+iJk7Uz1pYlVZegSNOusRb5GqWk80pZ1Wh
	 VK/skDRUcmvvg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 33068481AD;
	Mon,  9 Nov 2026 00:37:02 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Mon, 09 Nov 2026 08:36:46 +0800
Subject: [PATCH v6 03/10] rust: sync: arc: relax `ForeignOwnable` for
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
Message-Id: <20261109-tyr-ioctls-v6-3-b2896bf2b3c9@kylinos.cn>
References: <20261109-tyr-ioctls-v6-0-b2896bf2b3c9@kylinos.cn>
In-Reply-To: <20261109-tyr-ioctls-v6-0-b2896bf2b3c9@kylinos.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184620; l=1389;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=E65clxOu/qjNbqNDrRBBfaWHB/W/gvw7JStoVkgnAT4=;
 b=3Tw464BzixT1KqKTQ6lgYn0kwrJf3W48RF+eVIGvwaNWVnPG8CWcvPt8CrJ3rlAHDtPS13fzn
 YW6DjeaS5k+CqtDtqOS1YJCgTNPCAgsfU6tG4W4atXEsy8axvvcfRHL
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Alvin Sun <alvin.sun@linux.dev>

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


