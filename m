Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729DF3DB31E
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 06:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997332; cv=none; b=kbbE8Tv6tCpYFKAyGGWFR/SWzGbmaUqMHc9PldUFfavZWSYPs9mxNKSjCpPrEJ3Hv9mOYgaU1NGaQWijN/jSIaOhc3tMU/6r01HZsbaw22FnbngsnCLf4oKJj8n7/C31+Z6oGBhMfsCBzKKTyi1/PU0eoEYYB3lW/U/AJfVv2vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997332; c=relaxed/simple;
	bh=/4VEb4lu7jJv1J2369j6uGurfX24GvQlqc0cDhlc6pI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPjPBJe61IH5X7p4UFT451y6JhsNslvm8dAw9U9RPaPoAOLUmiHGDU5cigXjTuzPwk7UomO/nnfIBhlFhhbTPws2Q6t7GQ77zeE9kKjDA6uTek5/8ecwDqzBl2/6TLpkvqJN0aDDOoLUiSioIVkipVGA9RbHuBo3XqcDUt9xUVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id BF80270A28AC; Thu, 06 Aug 2026 08:22:08 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Ethan Plant <plant.ethan@gmail.com>,
	Michael Garofalo <officialTechflashYT@gmail.com>,
	Ash Logan <ash@heyquark.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH v2] rust: io: Add a BigEndianMmio wrapper
Date: Thu,  6 Aug 2026 08:22:04 +0200
Message-ID: <20260806062207.3024012-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows the user to read from and write to big-endian MMIO devices,
such as those found on PowerPC systems.

The implementation is pretty much a copy-paste of the RelaxedMmio type,
with the business logic changed.

This has been tested with various WIP drivers on the Nintendo Wii, and I
thought it would be nicer to upstream it before those are completely
ready, to get some review.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 rust/helpers/io.c | 34 ++++++++++++++++++
 rust/kernel/io.rs | 88 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 120 insertions(+), 2 deletions(-)

Changes since v1:
- Link to v1:
  https://lore.kernel.org/rust-for-linux/178598049138.1212746.2443151507074972963.b4-review@b4/T/
- Fix copy/paste mistake in backend docstring (thank you Ethan Plant!)
- Fix safety comment in macro documentation.

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 7ed9a4f77f1b..3bbb86a00d67 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -120,6 +120,40 @@ __rust_helper void rust_helper_writeq_relaxed(u64 value, void __iomem *addr)
 }
 #endif
 
+__rust_helper u16 rust_helper_ioread16be(const void __iomem *addr)
+{
+	return ioread16be(addr);
+}
+
+__rust_helper u32 rust_helper_ioread32be(const void __iomem *addr)
+{
+	return ioread32be(addr);
+}
+
+#ifdef CONFIG_64BIT
+__rust_helper u64 rust_helper_ioread64be(const void __iomem *addr)
+{
+	return ioread64be(addr);
+}
+#endif
+
+__rust_helper void rust_helper_iowrite16be(u16 value, void __iomem *addr)
+{
+	iowrite16be(value, addr);
+}
+
+__rust_helper void rust_helper_iowrite32be(u32 value, void __iomem *addr)
+{
+	iowrite32be(value, addr);
+}
+
+#ifdef CONFIG_64BIT
+__rust_helper void rust_helper_iowrite64be(u64 value, void __iomem *addr)
+{
+	iowrite64be(value, addr);
+}
+#endif
+
 __rust_helper resource_size_t rust_helper_resource_size(struct resource *res)
 {
 	return resource_size(res);
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index a38c20ba3d23..ab8b7864298a 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -1194,14 +1194,14 @@ impl IoCapable<$ty> for $backend {
             #[inline]
             fn io_read(view: <$backend as IoBackend>::View<'_, $ty>) -> $ty {
                 // SAFETY: `$backend::as_ptr(view)` is a valid pointer for MMIO operations for both
-                // `MmioBackend` and `RelaxedMmioBackend`.
+                // `MmioBackend`, `RelaxedMmioBackend` and `BigEndianMmioBackend`.
                 unsafe { bindings::$read_fn($backend::as_ptr(view).cast_const().cast()) }
             }
 
             #[inline]
             fn io_write(view: <$backend as IoBackend>::View<'_, $ty>, value: $ty) {
                 // SAFETY: `$backend::as_ptr(view)` is a valid pointer for MMIO operations for both
-                // `MmioBackend` and `RelaxedMmioBackend`.
+                // `MmioBackend`, `RelaxedMmioBackend` and `BigEndianMmioBackend`.
                 unsafe { bindings::$write_fn(value, $backend::as_ptr(view).cast()) }
             }
         }
@@ -1751,3 +1751,87 @@ macro_rules! io_write {
 }
 #[doc(inline)]
 pub use crate::io_write;
+
+/// [`Mmio`] wrapper using big-endian accessors.
+///
+/// This type provides an implementation of [`Io`] that uses big-endian I/O MMIO operands instead of
+/// the regular little-endian ones.
+///
+/// See [`Mmio::big_endian`] for a usage example.
+#[repr(transparent)]
+pub struct BigEndianMmio<'a, T: ?Sized>(Mmio<'a, T>);
+
+impl<T: ?Sized> Copy for BigEndianMmio<'_, T> {}
+impl<T: ?Sized> Clone for BigEndianMmio<'_, T> {
+    #[inline]
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+/// I/O Backend for memory-mapped I/O using big-endian accessors.
+pub struct BigEndianMmioBackend;
+
+impl IoBackend for BigEndianMmioBackend {
+    type View<'a, T: ?Sized + KnownSize> = BigEndianMmio<'a, T>;
+
+    #[inline]
+    fn as_ptr<'a, T: ?Sized + KnownSize>(view: Self::View<'a, T>) -> *mut T {
+        MmioBackend::as_ptr(view.0)
+    }
+
+    #[inline]
+    unsafe fn project_view<'a, T: ?Sized + KnownSize, U: ?Sized + KnownSize>(
+        view: Self::View<'a, T>,
+        ptr: *mut U,
+    ) -> Self::View<'a, U> {
+        // SAFETY: Per safety requirement.
+        BigEndianMmio(unsafe { MmioBackend::project_view(view.0, ptr) })
+    }
+}
+
+impl<'a, T: ?Sized + KnownSize> IoBase<'a> for BigEndianMmio<'a, T> {
+    type Backend = BigEndianMmioBackend;
+    type Target = T;
+
+    #[inline]
+    fn as_view(self) -> BigEndianMmio<'a, T> {
+        self
+    }
+}
+
+impl<'a, T: ?Sized> Mmio<'a, T> {
+    /// Returns a [`BigEndianMmio`] reference that performs big-endian I/O operations.
+    ///
+    /// Big-endian makes no change to 8-bit accesses, but will invert the bytes of 16-, 32- and
+    /// 64-bit accesses, to ensure numbers will be read in their correct order.
+    ///
+    /// # Examples
+    ///
+    /// ```no_run
+    /// use kernel::io::{
+    ///     Io,
+    ///     Mmio,
+    ///     Region,
+    ///     BigEndianMmio,
+    /// };
+    ///
+    /// fn do_io(io: Mmio<'_, Region<0x100>>) {
+    ///     // The access is performed using `ioread32be` instead of `readl`.
+    ///     let v = io.big_endian().read32(0x10);
+    /// }
+    ///
+    /// ```
+    #[inline]
+    pub fn big_endian(self) -> BigEndianMmio<'a, T> {
+        BigEndianMmio(self)
+    }
+}
+
+// MMIO regions support 8, 16, and 32-bit accesses.
+impl_mmio_io_capable!(BigEndianMmioBackend, u8, readb, writeb);
+impl_mmio_io_capable!(BigEndianMmioBackend, u16, ioread16be, iowrite16be);
+impl_mmio_io_capable!(BigEndianMmioBackend, u32, ioread32be, iowrite32be);
+// MMIO regions on 64-bit systems also support 64-bit accesses.
+#[cfg(CONFIG_64BIT)]
+impl_mmio_io_capable!(BigEndianMmioBackend, u64, ioread64be, iowrite64be);

base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
-- 
2.55.0

