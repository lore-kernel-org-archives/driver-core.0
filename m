Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7EE3BE654;
	Mon, 23 Mar 2026 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280341; cv=none; b=XjDrfw4PVujBYt4SE63ptrCxEULUWjFOw7XAewiWab1l03vDZOWVDksi/kOqIftIlm50Wz63SZ5AS2xbf3ebabeEFE5dG54hazGTw5EKRfAqm6eavYVW36bbSyvqFZ0vUHrqa2e3uCbEsp14gLQ9bsfGF/N7F3TBMKyxyqtVc78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280341; c=relaxed/simple;
	bh=uWbfkbgZ8z/+BgvUJNvYFQdej4xQGA5BuBLe3F08Kdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+ynUBjBNEiumqpljTDhjeFWJ1BvtyJjY/MAWHcxY4g7+3YJlvtDX4iThVSd0pYs3dN19HPLeNwntn0yzH6FU7lMYezPjzc/KEkjCh0JTFdkdyLzBlSG+Ywo6uTcY4ipNB6Ia7tCUYbbUJWbTMY4jn4XBFlSY+BUdPHZro6o1c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kswqL5UK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kswqL5UK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4525C4CEF7;
	Mon, 23 Mar 2026 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774280341;
	bh=uWbfkbgZ8z/+BgvUJNvYFQdej4xQGA5BuBLe3F08Kdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=kswqL5UKhQmqTw/bCdhFtY5QsDaNGpuRHNPlPBAyXwJ5UAwdrWho9ISbr9YtiFfFY
	 3j++L3jh6YzLYUSnnClzu4e+qN51Pm98R9RaWHPNzElGVtKei6/SlssEc9NqhGRyOK
	 P+N9gOyh1rXpqaqemt/wYhQixQvkyiTULoclxTLPQ82hZqzaRK8nzdyr5DGwXSD5Ue
	 DkgoKGMgpFEtq15v2pbRzA9qLhxj4ztoZPc+1Diy4ldmPyP09vxYMrNGgGJBBS9Zyx
	 QbcDTv8QCCo2Pd/WSUEkMbM3BAeWvkVuO8dPjRiGJe8v2vsEhAuYJL6BOEDtp30HYs
	 SXpuhNCUqM51A==
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
Subject: [PATCH 8/8] rust: dma: drop `dma_read!` and `dma_write!` API
Date: Mon, 23 Mar 2026 15:38:00 +0000
Message-ID: <20260323153807.1360705-9-gary@kernel.org>
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

The primitive read/write use case is covered by the `io_read!` and
`io_write!` macro. The non-primitive use case was finicky; they should
either be achieved using `CoherentBox` or `as_ref()/as_mut()` to assert the
lack of concurrent access, or should be using memcpy-like APIs to express
the non-atomic and tearable nature.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/dma.rs       | 131 ---------------------------------------
 samples/rust/rust_dma.rs |  21 ++++---
 2 files changed, 14 insertions(+), 138 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index fcdf85f5ed50..7124886a468d 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -598,52 +598,6 @@ pub unsafe fn as_mut(&self) -> &mut T {
         // SAFETY: per safety requirement.
         unsafe { &mut *self.as_mut_ptr() }
     }
-
-    /// Reads the value of `field` and ensures that its type is [`FromBytes`].
-    ///
-    /// # Safety
-    ///
-    /// This must be called from the [`dma_read`] macro which ensures that the `field` pointer is
-    /// validated beforehand.
-    ///
-    /// Public but hidden since it should only be used from [`dma_read`] macro.
-    #[doc(hidden)]
-    pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
-        // SAFETY:
-        // - By the safety requirements field is valid.
-        // - Using read_volatile() here is not sound as per the usual rules, the usage here is
-        // a special exception with the following notes in place. When dealing with a potential
-        // race from a hardware or code outside kernel (e.g. user-space program), we need that
-        // read on a valid memory is not UB. Currently read_volatile() is used for this, and the
-        // rationale behind is that it should generate the same code as READ_ONCE() which the
-        // kernel already relies on to avoid UB on data races. Note that the usage of
-        // read_volatile() is limited to this particular case, it cannot be used to prevent
-        // the UB caused by racing between two kernel functions nor do they provide atomicity.
-        unsafe { field.read_volatile() }
-    }
-
-    /// Writes a value to `field` and ensures that its type is [`AsBytes`].
-    ///
-    /// # Safety
-    ///
-    /// This must be called from the [`dma_write`] macro which ensures that the `field` pointer is
-    /// validated beforehand.
-    ///
-    /// Public but hidden since it should only be used from [`dma_write`] macro.
-    #[doc(hidden)]
-    pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
-        // SAFETY:
-        // - By the safety requirements field is valid.
-        // - Using write_volatile() here is not sound as per the usual rules, the usage here is
-        // a special exception with the following notes in place. When dealing with a potential
-        // race from a hardware or code outside kernel (e.g. user-space program), we need that
-        // write on a valid memory is not UB. Currently write_volatile() is used for this, and the
-        // rationale behind is that it should generate the same code as WRITE_ONCE() which the
-        // kernel already relies on to avoid UB on data races. Note that the usage of
-        // write_volatile() is limited to this particular case, it cannot be used to prevent
-        // the UB caused by racing between two kernel functions nor do they provide atomicity.
-        unsafe { field.write_volatile(val) }
-    }
 }
 
 impl<T: AsBytes + FromBytes> Coherent<T> {
@@ -959,88 +913,3 @@ pub unsafe fn as_mut(self) -> &'a mut T {
         unsafe { &mut *ptr }
     }
 }
-
-/// Reads a field of an item from an allocated region of structs.
-///
-/// The syntax is of the form `kernel::dma_read!(dma, proj)` where `dma` is an expression evaluating
-/// to a [`Coherent`] and `proj` is a [projection specification](kernel::ptr::project!).
-///
-/// # Examples
-///
-/// ```
-/// use kernel::device::Device;
-/// use kernel::dma::{attrs::*, Coherent};
-///
-/// struct MyStruct { field: u32, }
-///
-/// // SAFETY: All bit patterns are acceptable values for `MyStruct`.
-/// unsafe impl kernel::transmute::FromBytes for MyStruct{};
-/// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
-/// unsafe impl kernel::transmute::AsBytes for MyStruct{};
-///
-/// # fn test(alloc: &kernel::dma::Coherent<[MyStruct]>) -> Result {
-/// let whole = kernel::dma_read!(alloc, [2]?);
-/// let field = kernel::dma_read!(alloc, [1]?.field);
-/// # Ok::<(), Error>(()) }
-/// ```
-#[macro_export]
-macro_rules! dma_read {
-    ($dma:expr, $($proj:tt)*) => {{
-        let dma = &$dma;
-        let ptr = $crate::ptr::project!(
-            $crate::dma::Coherent::as_ptr(dma), $($proj)*
-        );
-        // SAFETY: The pointer created by the projection is within the DMA region.
-        unsafe { $crate::dma::Coherent::field_read(dma, ptr) }
-    }};
-}
-
-/// Writes to a field of an item from an allocated region of structs.
-///
-/// The syntax is of the form `kernel::dma_write!(dma, proj, val)` where `dma` is an expression
-/// evaluating to a [`Coherent`], `proj` is a
-/// [projection specification](kernel::ptr::project!), and `val` is the value to be written to the
-/// projected location.
-///
-/// # Examples
-///
-/// ```
-/// use kernel::device::Device;
-/// use kernel::dma::{attrs::*, Coherent};
-///
-/// struct MyStruct { member: u32, }
-///
-/// // SAFETY: All bit patterns are acceptable values for `MyStruct`.
-/// unsafe impl kernel::transmute::FromBytes for MyStruct{};
-/// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
-/// unsafe impl kernel::transmute::AsBytes for MyStruct{};
-///
-/// # fn test(alloc: &kernel::dma::Coherent<[MyStruct]>) -> Result {
-/// kernel::dma_write!(alloc, [2]?.member, 0xf);
-/// kernel::dma_write!(alloc, [1]?, MyStruct { member: 0xf });
-/// # Ok::<(), Error>(()) }
-/// ```
-#[macro_export]
-macro_rules! dma_write {
-    (@parse [$dma:expr] [$($proj:tt)*] [, $val:expr]) => {{
-        let dma = &$dma;
-        let ptr = $crate::ptr::project!(
-            mut $crate::dma::Coherent::as_mut_ptr(dma), $($proj)*
-        );
-        let val = $val;
-        // SAFETY: The pointer created by the projection is within the DMA region.
-        unsafe { $crate::dma::Coherent::field_write(dma, ptr, val) }
-    }};
-    (@parse [$dma:expr] [$($proj:tt)*] [.$field:tt $($rest:tt)*]) => {
-        $crate::dma_write!(@parse [$dma] [$($proj)* .$field] [$($rest)*])
-    };
-    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr]? $($rest:tt)*]) => {
-        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]?] [$($rest)*])
-    };
-    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr] $($rest:tt)*]) => {
-        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]] [$($rest)*])
-    };
-    ($dma:expr, $($rest:tt)*) => {
-        $crate::dma_write!(@parse [$dma] [] [$($rest)*])
-    };
-}
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 314ef51cd86c..7bd1b8588835 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -6,7 +6,14 @@
 
 use kernel::{
     device::Core,
-    dma::{Coherent, DataDirection, Device, DmaMask},
+    dma::{
+        Coherent,
+        CoherentBox,
+        DataDirection,
+        Device,
+        DmaMask, //
+    },
+    io::io_read,
     page, pci,
     prelude::*,
     scatterlist::{Owned, SGTable},
@@ -64,11 +71,11 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             // SAFETY: There are no concurrent calls to DMA allocation and mapping primitives.
             unsafe { pdev.dma_set_mask_and_coherent(mask)? };
 
-            let ca: Coherent<[MyStruct]> =
-                Coherent::zeroed_slice(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
+            let mut ca: CoherentBox<[MyStruct]> =
+                CoherentBox::zeroed_slice(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
             for (i, value) in TEST_VALUES.into_iter().enumerate() {
-                kernel::dma_write!(ca, [i]?, MyStruct::new(value.0, value.1));
+                ca.init_at(i, MyStruct::new(value.0, value.1))?;
             }
 
             let size = 4 * page::PAGE_SIZE;
@@ -78,7 +85,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
 
             Ok(try_pin_init!(Self {
                 pdev: pdev.into(),
-                ca,
+                ca: ca.into(),
                 sgt <- sgt,
             }))
         })
@@ -88,8 +95,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
 impl DmaSampleDriver {
     fn check_dma(&self) -> Result {
         for (i, value) in TEST_VALUES.into_iter().enumerate() {
-            let val0 = kernel::dma_read!(self.ca, [i]?.h);
-            let val1 = kernel::dma_read!(self.ca, [i]?.b);
+            let val0 = io_read!(self.ca, [i]?.h);
+            let val1 = io_read!(self.ca, [i]?.b);
 
             assert_eq!(val0, value.0);
             assert_eq!(val1, value.1);
-- 
2.51.2

