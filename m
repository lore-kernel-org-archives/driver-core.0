Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C83F211A;
	Wed,  5 Aug 2026 21:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785966902; cv=none; b=dRRbf+O+dR2UyzezhiRLhUdgEKNykI0zm7sdlmQLnZllVDczPHC/qejd5NqugEv60gFJjTe00BRRCEifAwWhaFUknWYmhoUGZ7o3l+heyJgzJiRMdLkfX2S9C3XBlb9UE91UOLXA2DIkLgffq2Wolmuw1FjLtkBbrZw/LWE67kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785966902; c=relaxed/simple;
	bh=DBiAbkCS1lvRs9n49RlCrB61Ci8CG0hVQsEsnkBwnD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l1k/g54F8M9i5/I5pmPqhmnGh8LcYbqMFoRAnnNnLSxaoO//Jba7Z0uMkjUg/iWVN6mUxV0/+qtVRMKJ89O6/zRqFO+FLssu4vNVJbtfeg//WfDon7/vqckEeQI0wvwBKD341yJt7ZRBH3lmTOWjbMJM2NbLYNZcQcf335Nj1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=U7Kr6nQp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=j7/k4Y0i; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="U7Kr6nQp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="j7/k4Y0i"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hFkjF20Y7z8v33;
	Wed, 05 Aug 2026 23:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785966897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEFZse9b5nsPPhTe5byZ4ixDs16zcGmsf1GvqdvIIqk=;
	b=U7Kr6nQp6MUXGoJ5VenRUgbMxVqQdqN6qfj+Mh4yJzFuDCcL1waDM4dxj3Cw9oQNcZvn1i
	QXsiR7JeRR9r99eCs8E0xWdX66DH5pT96RXXdYN5nKBJuwMZzg7sfrA4FQVfSIgjW7xTAI
	3hkmxGDB7IVucJizEO6ToHfQZZSYdGVBRzN2P89wMGQswKO9R2iF3Supe+YW5gbx/AtgNj
	BXsqDAZDUiHKKktNQqwvdnpcLQVgMFe46700o1o+WZxMyYRoNDDTB597X/CTkm5snmxfhJ
	0MdluJyZqMHSoeJ94+9no1+YzfV0FfH+BrnVCPFXukexa/Oaf7EBhgFGcl2YBA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="j7/k4Y0i";
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785966895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEFZse9b5nsPPhTe5byZ4ixDs16zcGmsf1GvqdvIIqk=;
	b=j7/k4Y0iRIAh79gxNyCWhF6UyQ043cY2ZuHxssElx8gNj1OuUXLeqeBJ1IEGujf5DBoYgZ
	twxsx9z3cn8MsuE19t+dSQ1Scm/c7pvkFYVCJvnTTuQAJaT12CHkb2E2r8a0vGzBx6fVm0
	ERNuKZx9iLXIsk1bff0jRqgM0KR23eBfoeAWgp/Jdiof/yUdVIvAcVw+tjLqz4hYET7c/z
	K5fZZZBobAsfB8Id/1NlWEk+2fdf8qCsmoBhehn8fg2Tp2pRQr28p7+ypbx3cQXdI5nHAE
	mzgO5JYjvsJMGxxDGoa6HarKcna8Ts/Q+O0S3884IbmOcIhcFQua3+CvFSSysQ==
Date: Wed, 05 Aug 2026 23:54:41 +0200
Subject: [PATCH 1/3] rust: dma: add ContiguousBuffer trait for streaming
 DMA storage
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-dma-streaming-v1-1-03974c86b141@mailbox.org>
References: <20260805-dma-streaming-v1-0-03974c86b141@mailbox.org>
In-Reply-To: <20260805-dma-streaming-v1-0-03974c86b141@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Maurice Hieronymus <mhi@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785966885; l=3482;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=DBiAbkCS1lvRs9n49RlCrB61Ci8CG0hVQsEsnkBwnD0=;
 b=c9zTXb17WyO3ABUP8ekT+qxnVf2ERinmmJPjb+LT7SuLmPFnZU5D1pgWWQ2nnnxINsmO7sWOI
 dUqr+F05Kc6BV5HSAAYuKQwTi4k3jaRxPi8fRaaUX0OBQYyOxyHPmJ+
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-ID: 835c32740e77a55c46e
X-MBO-RS-META: 9o5gdoh6j1phbqdi1cdu48r85eusspup
X-Rspamd-Queue-Id: 4hFkjF20Y7z8v33

The streaming DMA API (`dma_map_single()`) does not allocate, it maps a
buffer the caller already owns. Not every allocation qualifies: the
buffer must be a single physically contiguous region in the kernel's
linear mapping, which rules out `vmalloc()`ed memory and the stack.

Add `ContiguousBuffer`, an unsafe trait describing that requirement, and
implement it for `KBox<T>`, whose storage comes from `kmalloc()`.

The trait hands out owned storage rather than a borrowed slice, so the
mapping added in the next patch can take ownership and guarantee that no
other CPU-side reference exists while the device owns the buffer. `Data`
is bounded by `FromBytes` and `AsBytes` because the device may write an
arbitrary byte pattern into the region and may read it, so it must not
contain uninitialized padding.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 rust/kernel/dma.rs | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 200def84fb69..8a8af5ab7feb 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -564,6 +564,63 @@ fn from(value: CoherentBox<T>) -> Self {
     }
 }
 
+/// Backing storage that can be passed to the single-buffer streaming DMA API.
+///
+/// # Safety
+///
+/// Implementers must guarantee that, for as long as `Self` is alive and not mutated:
+///
+/// * [`ptr`](Self::ptr) returns a pointer to the start of a single, physically contiguous region
+///   of [`size`](Self::size) bytes, and [`data`](Self::data) refers to exactly that region.
+/// * The region lives in the kernel's linear mapping, i.e. it is neither `vmalloc()`ed nor stack
+///   memory, both of which `dma_map_single()` rejects.
+/// * The region is DMA-safe in the sense of the [DMA API howto].
+///
+/// [DMA API howto]: srctree/Documentation/core-api/dma-api-howto.rst
+pub unsafe trait ContiguousBuffer {
+    /// The CPU-side view of the region.
+    ///
+    /// [`FromBytes`] because the device may write an arbitrary byte pattern into the region,
+    /// [`AsBytes`] because it may read the region, which must therefore have no uninitialized
+    /// padding.
+    type Data: ?Sized + FromBytes + AsBytes;
+
+    /// Returns a pointer to the start of the region.
+    fn ptr(&mut self) -> *mut c_void;
+
+    /// Returns the size of the region in bytes.
+    fn size(&self) -> usize;
+
+    /// Returns a mutable reference to the region.
+    fn data(&mut self) -> &mut Self::Data;
+}
+
+// SAFETY: `KBox` allocates via `kmalloc()`, which returns a single physically contiguous,
+// DMA-safe region in the kernel's linear mapping. All three methods describe that allocation.
+unsafe impl<T: FromBytes + AsBytes> ContiguousBuffer for KBox<T> {
+    type Data = T;
+
+    fn ptr(&mut self) -> *mut c_void {
+        let ptr = &raw mut **self;
+        ptr.cast()
+    }
+
+    fn size(&self) -> usize {
+        const {
+            assert!(
+                core::mem::size_of::<T>() > 0,
+                "It doesn't make sense to map a ZST for DMA"
+            );
+        }
+
+        core::mem::size_of_val(&**self)
+    }
+
+    fn data(&mut self) -> &mut Self::Data {
+        self
+    }
+}
+
 /// An abstraction of the `dma_alloc_coherent` API.
 ///
 /// This is an abstraction around the `dma_alloc_coherent` API which is used to allocate and map

-- 
2.54.0

