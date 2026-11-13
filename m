Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575750;
	b=OyCMUVvx9aMK+i+orbNgDxMN0GvuX/0JqI95VPjzTwGbVcsvavsQdWCwJYJ7HnsLwiSD
	 Ho2hAJGzPjW25r0+GenbySYvfkePbvwsanBLa7uOt/boV0evrbKoCtGcs8hliMccTrzi0
	 hwP+4/g1vIm2mTxt6fRt2pobbzqEYT6t18mCpwnALKHAvP/nkG1fZDcvSVaZBIkojfa2Y
	 +dtIVtSFpI6TvvMMnz9X27Bp74hHfhJCzBYXWGQiuQVLPKjye/cqS//C6rjLajRS7qugU
	 yl1C/nMZtyoic8pS95Gj98hCPPR2/Ki8LDyaRJANHr1vX+nFJsMC86MCibf+E3UGT4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575750;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sNs9dw0Nqnz0km07lR3zmY7OWw3VLUamfMydRJ6ooco=;
	b=B1Mu5pSLLbGBsYqdCT/VHBy0pn1hY8fIRM9bWlxsuTgWrj56YNmRLMufpavJc6iT7ha7
	 ZBQabAphItKbTQ1P8WyfGHKHq6rR7E3uFmota+AwxkdZ21XFw+RxmLKPUEilx3U8SvyaW
	 rkCyw2juM0dBieBjjfE2nU4HIp1KmJpzkI7hm7/AGr6Vcs82xAGau9cbinxoEGSe/6a8O
	 gIpSbSqxi/U4weMXh52nhZjN9BAkmRKSKzBU04pFocCjajCfaOaXm+C8kZK9Z/8WwexSf
	 h2bHDnJ+Kn+REidD8zkifOgkHH9cg+3vb07h/nkuudEfHu5xFmNHiz82sQRTcCeiJgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XoCuh1Nq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0EE606A88E;
	Fri, 13 Nov 2026 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XoCuh1Nq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AC31F000C6;
	Fri, 13 Nov 2026 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794575750;
	bh=sNs9dw0Nqnz0km07lR3zmY7OWw3VLUamfMydRJ6ooco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XoCuh1NqReZMqjey+GrCXaEVV4Nv2H7hbTMiOCaBmj3GmT7pX5LJxaZrzIAtLFdVu
	 hu0uWOARjZeaLAqRrqMPMRa2MQAnwvY5gQx50p838auRLqMPkdDp7Nc0E+NJ/EjXnD
	 OwFDEeYNM5hDUpsv7Bht3pSPSKZ2onEbn1QX6hi7ITzg9u+ivQ/RgYI100wSnc5JEe
	 EmXraWGKgPYH9HRXeAxwfHjkYp2dgrQMPJA4/Jxi4Y33GyIejkQYYXBC9Ko9KZHh4p
	 zOS57ioFbJYcPh8f9WoQ40mQPU05G6Wp0ZkWabvMe+UJ/oZi7Vgxoj5SjSthiIY2Lv
	 V1hwS050nqltw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 13 Nov 2026 14:15:09 +0100
Subject: [PATCH v6 2/4] rust: sync: atomic: add memcpy
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
Message-Id: <20261113-page-volatile-io-v6-2-5603e527c919@kernel.org>
References: <20261113-page-volatile-io-v6-0-5603e527c919@kernel.org>
In-Reply-To: <20261113-page-volatile-io-v6-0-5603e527c919@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lyude Paul <lyude@redhat.com>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3231; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=DSGQymeDaea3kRkiaM87A7fK2NEYs8mzxM5Kac6zHvs=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq9w1gZrqtPndda5c6hmyhLNbXu27i8QRfJbWRW
 MFne6F112uJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCavcNYAAKCRD6UCkIqsW9
 0Pf/D/wOBz4O/7yniG2g93HD5S7Pzc0N7KIJ9yetlKf7ttB8N8LdP5ytENVKyvWgoipsdR6bcqh
 XX92iOmGMfk7LOcpaaZ3DAMTiErKGKvf2XDJDSSTuT3lOAnEURSZolnZ4PHcMyacN/mKVObM6Rg
 VLx0VcQ6goHYkXzL5XAdipLm7rcDXLIDrfxh1q34qzY5TNtIwNEhmqwoSYgNMz6G0p6XUFpLZv+
 mJkEFylqLFWuh4L6b/9n2yvP91+7q77CNUdWkTqs3rc7/YlzYjEb1PoateSjsa9Wfsxa4D/LXOB
 S3V3Sf2+uIS+XwSenWFvqXNycT9QRIDbrkReHqHfzBxMs2dQUv60MD/wSH5CgD/71d7SFOpJC+k
 5r/8zUkSPjI9u9LK3I4cYkzYNjjkHzLEK7WClQP6U0iOCw3pGzOHly+zKXQvguwY5MPfs6dMQ1m
 MIZkLTSD7bhISMWc9wwThGuFPE7aEpwhLTYlf0P0N5eOrpBgYZ0Z0aYBa657RF+hxsjSMWXMH7U
 HByp3tJa0TyNoASoRHsiS9W/YyX4jdQdkYT92ySmQ2fhGN4Ck9nmcuggSwJ/bt6INGKb2XbOIcs
 7sAycD5KIvsvQZ93nIFGRAJHiu9l81gH3FAhVo55ngSQ+u+h7EsZBKeOIr+hxH3GqwPUjcUtWIY
 tGt1ORNKwkeKkNA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a helper to copy `len` bytes from `src` to `dst` using byte-wise atomic
memory operations. This is the concurrent-safe counterpart of
`core::ptr::copy_nonoverlapping()` (the equivalent of standard C's
`memcpy()`). Because of the atomicity at byte level, when the copy races
with another concurrent atomic access (or when a normal read races with an
atomic read), or with an external access (from DMA or userspace), the
behavior of this function is defined: the memory is copied at (at least)
byte granularity.

The helper is the building block for higher-level copy operations that need
to remain defined under racing accesses, such as the `SysMem` I/O backend,
which copies to and from memory that may be shared with hardware or user
space.

The implementation forwards to the kernel's `memcpy()`, which is
implemented in a way that byte-wise atomic memory load/store instructions
are used.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/atomic.rs | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 6d27898add42..d25627fa6557 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -848,3 +848,39 @@ pub unsafe fn cmpxchg<T: AtomicType, Ordering: ordering::Ordering>(
     // per LKMM.
     unsafe { Atomic::from_ptr(ptr) }.cmpxchg(old, new, o)
 }
+
+/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
+///
+/// This is the concurrent-safe counterpart of `core::ptr::copy_nonoverlapping()` (the equivalent
+/// of standard C's `memcpy()`). Because of the atomicity at byte level, when racing with another
+/// concurrent atomic access (or when a normal read races with an atomic read), or with an external
+/// access (from DMA or userspace), the behavior of this function is defined: the memory is copied
+/// at (at least) byte granularity.
+///
+/// Implementation note: this is currently implemented by the kernel's `memcpy()`, which is
+/// implemented in a way such that byte-wise atomic memory load/store instructions are used.
+///
+/// # Safety
+///
+/// Callers must ensure that:
+///
+/// - `src` is valid for atomic reads for `len` bytes for the duration of the call.
+/// - `dst` is valid for atomic writes for `len` bytes for the duration of the call.
+/// - The memory regions `src .. src + len` and `dst .. dst + len` do not overlap.
+#[inline]
+pub unsafe fn memcpy(src: *const u8, dst: *mut u8, len: usize) {
+    // SAFETY: By the safety requirements of this function, the following operation will not:
+    //  - Trap.
+    //  - Invalidate any reference invariants.
+    //  - Race with any operation by the Rust AM, as `bindings::memcpy` is a byte-wise atomic
+    //    operation and all operations by the Rust AM to the involved memory areas use byte-wise
+    //    atomic semantics.
+    //  - Copy between overlapping regions, which `memcpy()` does not support.
+    unsafe {
+        bindings::memcpy(
+            dst.cast::<kernel::ffi::c_void>(),
+            src.cast::<kernel::ffi::c_void>(),
+            len,
+        )
+    };
+}

-- 
2.54.0


