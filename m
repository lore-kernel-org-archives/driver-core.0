Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506D43BCD05
	for <driver-core@lists.linux.dev>; Wed,  5 Aug 2026 22:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968481; cv=none; b=I0IAY4oDmHdXT6tlkWU3cRW/Iv6OAg5Jb+G+onpZNYEifgxKqB8hM/FQY+dVmdoMs4NGdlN/74yKR8TI0Tf3Q2cOIhaz3aJnIAqthSiKXaovBaDth5IgnWNbKMq5aptaFDCN9+Qa9XK9mWLf70nk2gmm47lnItgIwkvWLCgYoVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968481; c=relaxed/simple;
	bh=YHh/QBCgs/aO9lwXCOLDvEOA5goxPQWmPGE1HCLt62Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbN64PGOq/t5RAcqzqbbQC4uItoUQ/n/mDA4KkW7B5fl+GLlMco+d7AW2cZMB2r7Cr5d9J61zG24KR1jhgZl78yVk1T6Yt07q9Q7hL/Flw3CiOyP4f4d26Ksf8ub0VlNbqGJkEf4YYdRwswCFpWwML2O04leL/Kp4sExbvIDttM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 247BA70A24FA; Thu, 06 Aug 2026 00:21:16 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
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
Subject: [PATCH] rust: io: Add a BigEndianMmio wrapper
Date: Thu,  6 Aug 2026 00:21:09 +0200
Message-ID: <20260805222110.2949369-1-linkmauve@linkmauve.fr>
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
 rust/helpers/io.c | 34 +++++++++++++++++++
 rust/kernel/io.rs | 84 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

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
index a38c20ba3d23..a91979e4392a 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
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
+/// I/O Backend for memory-mapped I/O, with relaxed access semantics.
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

