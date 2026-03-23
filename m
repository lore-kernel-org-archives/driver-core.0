Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188423BA24F;
	Mon, 23 Mar 2026 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280329; cv=none; b=EeuAqLiUJpawXtcCpYJhIsfVo5IEqIYdsTAyZxNXtcoMJkbKmsmraazzTNDILXDpfWluaU1qBD7hERV6wWKcjTCaL3upH+s3Fqfw0Kz8oIzE6Klm1XmM1vp82MCcKn2xILs67WDCkXyJIvKrwU10xi2Y5cYrrz4rHyZWY/H4JTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280329; c=relaxed/simple;
	bh=qgrnQkHeH2BzH+1SRVeNJPVgmIO0NVcIXAXBHZ2wcts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AaNd8WgaMt6tZx8rWknxfyH33q0y3GLvnn/7JfMRJhsBxeWGYrSL40oh1aNl4es3FbK4ck9rynGug3w4syIINHBLnkLXuO3j0ETuSLaLij/AnOZblasl6uRRsiWJRvGYXTZRUx6KyXOtQlNW5qQkOGcqzQevCuN8tmbIeJoz87M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zdcg4TYE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zdcg4TYE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D924C2BC9E;
	Mon, 23 Mar 2026 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774280329;
	bh=qgrnQkHeH2BzH+1SRVeNJPVgmIO0NVcIXAXBHZ2wcts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=Zdcg4TYE2HubzrYwxig1jQhD3Yjm0W6GumJuq4uD7pVCH0DzSlHEUzZHkTUrmfqmA
	 kFME1VjXcDdi9VjQy/x3dYAqCN++lt6DYbvvabNOKbo++yKeUBuLZRUbPew+Po2dJb
	 1NxEB9ajZbyE5AJT4P0A4OC8yL9z8DOyyuxkaWfdZUhBtn/B63xb5TEdrcD3+qsZ9O
	 6E2Xcq982FV5NW8g4gliOiOO5x73KvkpE5Keo40njeW1qJ5e0NzM7ZV7K6wkerJX3I
	 ADSicek9YjauXm76j2ym4kvEM0xYtsuSA8cKiXaFvGZK39+6o/YPj+UmNSXXNhOITm
	 7ykE62fjoIHhQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] rust: dma: add methods to unsafely create reference from subview
Date: Mon, 23 Mar 2026 15:37:57 +0000
Message-ID: <20260323153807.1360705-6-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260323153807.1360705-1-gary@kernel.org>
References: <20260323153807.1360705-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Implement `Io` for `Coherent`, so now `dma::Coherent` can be used with I/O
projections.

This allows the `as_ref()` and `as_mut()` API to be used in smaller region
than the whole DMA allocation itself. For example, if a ring buffer is shared
between GPU and CPU, users may now use the `io_project!` API to obtain a view
of the buffer that is unified owned by the CPU and get a reference.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/dma.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 779d4babab9a..ae2939abc166 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -12,6 +12,10 @@
         Core, //
     },
     error::to_result,
+    io::{
+        Io,
+        IoCapable, //
+    },
     prelude::*,
     ptr::KnownSize,
     sync::aref::ARef,
@@ -864,6 +868,58 @@ fn drop(&mut self) {
 // can be sent to another thread.
 unsafe impl<T: KnownSize + Send + ?Sized> Send for Coherent<T> {}
 
+impl<T: ?Sized + KnownSize> Io for Coherent<T> {
+    type Type = T;
+
+    #[inline]
+    fn as_ptr(&self) -> *mut Self::Type {
+        self.as_mut_ptr()
+    }
+}
+
+impl<'a, B: ?Sized + KnownSize, T: ?Sized> crate::io::View<'a, Coherent<B>, T> {
+    /// Returns a DMA handle which may be given to the device as the DMA address base of
+    /// the region.
+    #[inline]
+    pub fn dma_handle(&self) -> DmaAddress {
+        let base = self.io();
+        let offset = self.as_ptr().addr() - base.as_ptr().addr();
+        base.dma_handle() + offset as DmaAddress
+    }
+
+    /// Returns a reference to the data in the region.
+    ///
+    /// # Safety
+    ///
+    /// * Callers must ensure that the device does not read/write to/from memory while the returned
+    ///   slice is live.
+    /// * Callers must ensure that this call does not race with a write to the same region while
+    ///   the returned slice is live.
+    #[inline]
+    pub unsafe fn as_ref(self) -> &'a T {
+        let ptr = self.as_ptr();
+        // SAFETY: pointer is aligned and valid per type invariant of `View`. Aliasing rule is
+        // satisfied per safety requirement.
+        unsafe { &*ptr }
+    }
+
+    /// Returns a mutable reference to the data in the region.
+    ///
+    /// # Safety
+    ///
+    /// * Callers must ensure that the device does not read/write to/from memory while the returned
+    ///   slice is live.
+    /// * Callers must ensure that this call does not race with a read or write to the same region
+    ///   while the returned slice is live.
+    #[inline]
+    pub unsafe fn as_mut(self) -> &'a mut T {
+        let ptr = self.as_ptr();
+        // SAFETY: pointer is aligned and valid per type invariant of `View`. Aliasing rule is
+        // satisfied per safety requirement.
+        unsafe { &mut *ptr }
+    }
+}
+
 /// Reads a field of an item from an allocated region of structs.
 ///
 /// The syntax is of the form `kernel::dma_read!(dma, proj)` where `dma` is an expression evaluating
-- 
2.51.2

