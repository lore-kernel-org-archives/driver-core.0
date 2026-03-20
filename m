Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DADC303A07;
	Fri, 20 Mar 2026 19:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774036014; cv=none; b=OvAqSNWpl93O3uLwQ837fCoG1AbxVnxCz/6fKCHHb4+SqE3glXTXleOKYaND5GuG/pcA2V2MLTmG6wXIK+I7YxbP2VD+Scs1RUcQ+B+czhwOKv9MG3COAPL8KpO76Xmr52EvpW+57nevju0LnauRPTNDn2tIBl4B+cAX63f+NbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774036014; c=relaxed/simple;
	bh=+gN5RwGnaQSMZxMY/xHZRgUoqJ9A7H33p/A6H++uu+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPRQvVS96xRmWh+yeD93xgUsar9apnScwM3K2TkEnPKfkWbaIGfA1QDSRwnOMsYGofJ6qoHnIlMmwBVP01QLEJ3xTENELoZ4Szo8W3wCNIFl0rJ4Vw588XlPRcK9D5j2KmEbkLcw8jD3MXkCuloVImfAqoaTS05qYasIQsm04y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0TQqxrA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0TQqxrA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED350C2BC9E;
	Fri, 20 Mar 2026 19:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774036013;
	bh=+gN5RwGnaQSMZxMY/xHZRgUoqJ9A7H33p/A6H++uu+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m0TQqxrAiJ2ko/8lyY+apyFbcQwBGhgd/kyPlfzTBCNxT3fRY3NRgtj8hol892lJy
	 LAg8spl6UfGZd33v6OKys/zmq7I5FpoYMg/+F36D8FjyQHThzDBu5dy27ZxE8JiUkS
	 u5g4sWr/dUdcXzrA4g/07bTWFoBx7P0fy5j+EljWrKHHpL1VwW0zUNcfrL6DR+OYK0
	 55yMcISG7hDa23wvIppSGTX4mUI6k8mNSKSJunV7iHc6Fy3pv95n1xjvpIPp1JC70/
	 CKp0bodrdNpIvydELXoS4eLRNMAc4RjlFbQF80BK8FiWuZRzNJJDWRHzlROU2hhjyz
	 BVodYOfpgdWHQ==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com
Cc: driver-core@lists.linux.dev,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 3/8] rust: dma: add zeroed constructor to `Coherent`
Date: Fri, 20 Mar 2026 20:45:38 +0100
Message-ID: <20260320194626.36263-4-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320194626.36263-1-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

These constructors create a coherent container of a single object
instead of slice. They are named `zeroed` and `zeroed_with_attrs` to
emphasis that they are created initialized zeroed. It is intended that
there'll be new constructors that take `PinInit` instead of zeroing.

Signed-off-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs       | 81 ++++++++++++++++++++++++++++++++++++----
 samples/rust/rust_dma.rs |  8 ++--
 2 files changed, 77 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index ff3e147f1a23..db645b01bdd0 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -47,7 +47,7 @@ pub trait Device: AsRef<device::Device<Core>> {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -64,7 +64,7 @@ unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -83,7 +83,7 @@ unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -102,7 +102,7 @@ unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_max_seg_size(&self, size: u32) {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -202,12 +202,12 @@ pub const fn value(&self) -> u64 {
 ///
 /// ```
 /// # use kernel::device::{Bound, Device};
-/// use kernel::dma::{attrs::*, CoherentAllocation};
+/// use kernel::dma::{attrs::*, Coherent};
 ///
 /// # fn test(dev: &Device<Bound>) -> Result {
 /// let attribs = DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_WARN;
-/// let c: CoherentAllocation<u64> =
-///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, attribs)?;
+/// let c: Coherent<[u64]> =
+///     Coherent::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, attribs)?;
 /// # Ok::<(), Error>(()) }
 /// ```
 #[derive(Clone, Copy, PartialEq)]
@@ -492,7 +492,6 @@ pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
 
 impl<T: AsBytes + FromBytes> Coherent<T> {
     /// Allocates a region of `T` of coherent memory.
-    #[expect(unused)]
     fn alloc_with_attrs(
         dev: &device::Device<Bound>,
         gfp_flags: kernel::alloc::Flags,
@@ -529,6 +528,35 @@ fn alloc_with_attrs(
         })
     }
 
+    /// Allocates a region of type `T` of coherent memory.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{attrs::*, Coherent};
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let c: Coherent<[u64; 4]> =
+    ///     Coherent::zeroed_with_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    #[inline]
+    pub fn zeroed_with_attrs(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Self::alloc_with_attrs(dev, gfp_flags | __GFP_ZERO, dma_attrs)
+    }
+
+    /// Performs the same functionality as [`Coherent::zeroed_with_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    #[inline]
+    pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> Result<Self> {
+        Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
+    }
+
     /// Allocates a region of `[T; len]` of coherent memory.
     fn alloc_slice_with_attrs(
         dev: &device::Device<Bound>,
@@ -572,6 +600,43 @@ fn alloc_slice_with_attrs(
             dma_attrs,
         })
     }
+
+    /// Allocates a zeroed region of type `T` of coherent memory.
+    ///
+    /// Unlike `Coherent::<[T; N]>::zeroed_with_attrs`, `Coherent::<T>::zeroed_slices` support
+    /// a runtime length.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{attrs::*, Coherent};
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let c: Coherent<[u64]> =
+    ///     Coherent::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    #[inline]
+    pub fn zeroed_slice_with_attrs(
+        dev: &device::Device<Bound>,
+        len: usize,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Coherent<[T]>> {
+        Coherent::alloc_slice_with_attrs(dev, len, gfp_flags | __GFP_ZERO, dma_attrs)
+    }
+
+    /// Performs the same functionality as [`Coherent::zeroed_slice_with_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    #[inline]
+    pub fn zeroed_slice(
+        dev: &device::Device<Bound>,
+        len: usize,
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Coherent<[T]>> {
+        Self::zeroed_slice_with_attrs(dev, len, gfp_flags, Attrs(0))
+    }
 }
 
 impl<T> Coherent<[T]> {
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index ce39b5545097..314ef51cd86c 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -6,7 +6,7 @@
 
 use kernel::{
     device::Core,
-    dma::{CoherentAllocation, DataDirection, Device, DmaMask},
+    dma::{Coherent, DataDirection, Device, DmaMask},
     page, pci,
     prelude::*,
     scatterlist::{Owned, SGTable},
@@ -16,7 +16,7 @@
 #[pin_data(PinnedDrop)]
 struct DmaSampleDriver {
     pdev: ARef<pci::Device>,
-    ca: CoherentAllocation<MyStruct>,
+    ca: Coherent<[MyStruct]>,
     #[pin]
     sgt: SGTable<Owned<VVec<u8>>>,
 }
@@ -64,8 +64,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             // SAFETY: There are no concurrent calls to DMA allocation and mapping primitives.
             unsafe { pdev.dma_set_mask_and_coherent(mask)? };
 
-            let ca: CoherentAllocation<MyStruct> =
-                CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
+            let ca: Coherent<[MyStruct]> =
+                Coherent::zeroed_slice(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
             for (i, value) in TEST_VALUES.into_iter().enumerate() {
                 kernel::dma_write!(ca, [i]?, MyStruct::new(value.0, value.1));
-- 
2.53.0

