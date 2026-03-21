Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77618334C33;
	Sat, 21 Mar 2026 17:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774114078; cv=none; b=Wur9KkyB1L8ogWnjK9/pP6y8Txq8eyoGS9ImGj6/y8AV5uV5sQnED0L2UozfyXaUBu3W/1bHkGJIc/y77qiJCTRr9mo/rcuE4V16SjimYMv2gkNj5oSEsQ1JGdEAhDK1Pwxp2iSGPxsLw+ljIvyOPHuuLWqjOG/Vyqjo12PluVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774114078; c=relaxed/simple;
	bh=X4IHFCxyZSSmXToEQx1vG1DzpDrP0/7YDyakwrB9GsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVtUN1INrZN82cK10xz3PtPWKocK5eU7J1RONIIVChT3YDdvgjU3yhHzZwxlh9VflMgiVXwW+t0tXEZZ/aFC3BuKasLLChRuu5pu/Z6SGnZ+ny14omaTm16emE2EV2t/70DUvb47HSdz1eWat407kcDh6LTYVviyFaCxWUC+FoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E03QHWv7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E03QHWv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20450C2BCAF;
	Sat, 21 Mar 2026 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774114078;
	bh=X4IHFCxyZSSmXToEQx1vG1DzpDrP0/7YDyakwrB9GsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E03QHWv7GTzCGeY1kPeFtnSiyYdXmcIfiX/kXiSXkuNVk7a7QGMF2k/q7WLI+/7me
	 inCKimPCdgbMGG9WY/nqJuovGfJStqmcwnhpfan6++PtZRTTjMXEcBcJsEW8e14V/S
	 T1C5ftvwYthYamshPATmTefsFph/3p+/PLmiWntMe96C6NVDRzq9fUauQ4J0TVVbMq
	 2/szsO/8yRcXAQO+1DPqj18iw9VE1OEWzWQNPjnklxqqle5aaMAM8Oz0FA0H2KK+wt
	 Bwwv8/nKmDDps74iDJ7HofI0VLCFXhMrQbRX0ALv66YCfH8n4NQoH/UNFVS1bRywt3
	 nHS0CJXmUxunQ==
From: Danilo Krummrich <dakr@kernel.org>
To: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] rust: dma: add CoherentHandle for DMA allocations without kernel mapping
Date: Sat, 21 Mar 2026 18:27:47 +0100
Message-ID: <20260321172749.592387-2-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321172749.592387-1-dakr@kernel.org>
References: <20260321172749.592387-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CoherentHandle, an opaque DMA allocation type for buffers that are
only ever accessed by hardware. Unlike Coherent<T>, it does not provide
CPU access to the allocated memory.

CoherentHandle implicitly sets DMA_ATTR_NO_KERNEL_MAPPING and stores the
value returned by dma_alloc_attrs() as an opaque handle
(NonNull<c_void>) rather than a typed pointer, since with this flag the
C API returns an opaque cookie (e.g. struct page *), not a CPU pointer
to the allocated memory.

Only the DMA bus address is exposed to drivers; the opaque handle is
used solely to free the allocation on drop.

This commit is for reference only; there is currently no in-tree user.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 119 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 9e0c9ff91cba..fa30793c798d 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -1011,6 +1011,125 @@ fn drop(&mut self) {
 // can be sent to another thread.
 unsafe impl<T: KnownSize + Send + ?Sized> Send for Coherent<T> {}
 
+/// An opaque DMA allocation without a kernel virtual mapping.
+///
+/// Unlike [`Coherent`], a `CoherentHandle` does not provide CPU access to the allocated memory.
+/// The allocation is always performed with `DMA_ATTR_NO_KERNEL_MAPPING`, meaning no kernel
+/// virtual mapping is created for the buffer. The value returned by the C API as the CPU
+/// address is an opaque handle used only to free the allocation.
+///
+/// This is useful for buffers that are only ever accessed by hardware.
+///
+/// # Invariants
+///
+/// - `cpu_handle` holds the opaque handle returned by `dma_alloc_attrs` with
+///   `DMA_ATTR_NO_KERNEL_MAPPING` set, and is only valid for passing back to `dma_free_attrs`.
+/// - `dma_handle` is the corresponding bus address for device DMA.
+/// - `size` is the allocation size in bytes as passed to `dma_alloc_attrs`.
+/// - `dma_attrs` contains the attributes used for the allocation, always including
+///   `DMA_ATTR_NO_KERNEL_MAPPING`.
+pub struct CoherentHandle {
+    dev: ARef<device::Device>,
+    dma_handle: DmaAddress,
+    cpu_handle: NonNull<c_void>,
+    size: usize,
+    dma_attrs: Attrs,
+}
+
+impl CoherentHandle {
+    /// Allocates `size` bytes of coherent DMA memory without creating a kernel virtual mapping.
+    ///
+    /// Additional DMA attributes may be passed via `dma_attrs`; `DMA_ATTR_NO_KERNEL_MAPPING` is
+    /// always set implicitly.
+    ///
+    /// Returns `EINVAL` if `size` is zero, `ENOMEM` if the allocation fails.
+    pub fn alloc_with_attrs(
+        dev: &device::Device<Bound>,
+        size: usize,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        if size == 0 {
+            return Err(EINVAL);
+        }
+
+        let dma_attrs = dma_attrs | Attrs(bindings::DMA_ATTR_NO_KERNEL_MAPPING);
+        let mut dma_handle = 0;
+        // SAFETY: `dev.as_raw()` is valid by the type invariant on `device::Device`.
+        let cpu_handle = unsafe {
+            bindings::dma_alloc_attrs(
+                dev.as_raw(),
+                size,
+                &mut dma_handle,
+                gfp_flags.as_raw(),
+                dma_attrs.as_raw(),
+            )
+        };
+
+        let cpu_handle = NonNull::new(cpu_handle).ok_or(ENOMEM)?;
+
+        // INVARIANT: `cpu_handle` is the opaque handle from a successful `dma_alloc_attrs` call
+        // with `DMA_ATTR_NO_KERNEL_MAPPING`, `dma_handle` is the corresponding DMA address,
+        // and we hold a refcounted reference to the device.
+        Ok(Self {
+            dev: dev.into(),
+            dma_handle,
+            cpu_handle,
+            size,
+            dma_attrs,
+        })
+    }
+
+    /// Allocates `size` bytes of coherent DMA memory without creating a kernel virtual mapping.
+    #[inline]
+    pub fn alloc(
+        dev: &device::Device<Bound>,
+        size: usize,
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Self> {
+        Self::alloc_with_attrs(dev, size, gfp_flags, Attrs(0))
+    }
+
+    /// Returns the DMA handle for this allocation.
+    ///
+    /// This address can be programmed into device hardware for DMA access.
+    #[inline]
+    pub fn dma_handle(&self) -> DmaAddress {
+        self.dma_handle
+    }
+
+    /// Returns the size in bytes of this allocation.
+    #[inline]
+    pub fn size(&self) -> usize {
+        self.size
+    }
+}
+
+impl Drop for CoherentHandle {
+    fn drop(&mut self) {
+        // SAFETY: All values are valid by the type invariants on `CoherentHandle`.
+        // `cpu_handle` is the opaque handle from `dma_alloc_attrs` and is passed back unchanged.
+        unsafe {
+            bindings::dma_free_attrs(
+                self.dev.as_raw(),
+                self.size,
+                self.cpu_handle.as_ptr(),
+                self.dma_handle,
+                self.dma_attrs.as_raw(),
+            )
+        }
+    }
+}
+
+// SAFETY: `CoherentHandle` only holds a device reference, a DMA handle, an opaque CPU handle,
+// and a size. None of these are tied to a specific thread.
+unsafe impl Send for CoherentHandle {}
+
+// SAFETY: `CoherentHandle` provides no CPU access to the underlying allocation. The only
+// operations on `&CoherentHandle` are reading the DMA handle and size, both of which are
+// plain `Copy` values.
+unsafe impl Sync for CoherentHandle {}
+
 /// Reads a field of an item from an allocated region of structs.
 ///
 /// The syntax is of the form `kernel::dma_read!(dma, proj)` where `dma` is an expression evaluating
-- 
2.53.0

