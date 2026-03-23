Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF253BADA9;
	Mon, 23 Mar 2026 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280325; cv=none; b=VlRCEiFh1M8cGcVTa9gUMGhCC6gWQBWKipp12Hyj5JCgku4ZDiKtSIv+NKwZ469yckeudz+lWUUD+1XYmRVOxLwWubgc4BXeemlQb4YRV01SY80VPQpGON4gT0byK7BOo3tKp4YYn/2Tz5G4ZCAEqVXh0Nsj61mMeKSklG14NEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280325; c=relaxed/simple;
	bh=tIWewFp7x6qDu6iQv8L+binaXaWOMdlo72Cz++arfpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HO25YLEta8HQTb5FCZB106Zjt0W/QHk+h/sS/Rg42vBSdCR6RWcMQkAKsiZVwYrghtOHoScYaYHF4gmDsn7tNdg8YxRG0leMN/4sdm39iBXDDdlkReYN7ifoR9IXXPTbrKvqnEoxQ4lTuewCARrRguPDG4yfQz3zv5NF8S/MCuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQuZHCv8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQuZHCv8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03038C2BCB4;
	Mon, 23 Mar 2026 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774280325;
	bh=tIWewFp7x6qDu6iQv8L+binaXaWOMdlo72Cz++arfpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=lQuZHCv85Cs08ptp16vCnr/phU8+rPShtHi4vSu/ZjqGFqxcIYVLxSfJLXfYyDjP/
	 Q3SyjZa8gbPGrUOOUKZt9IbyEGNVOKyXnO9mobhFscufN31GZQOxgI84Dlm31131jj
	 m9KR7YYK7UuIX4ruivrEMoEt7S7+jqH0qSkLwEBbPik18mRdmkH01fDRPRsQBaNinG
	 Z/xmbM/lDoJmilhkChUxf3ExoSQ1xDJda1fZzsPX9H0AuaqJryugP/zc4HSiEuqvAV
	 MrRCx+u89xANNR2fXhXKkjd5reGQnAz6i5QC3OoM+dWMCK6OwXQc0tF3bNItO16ITc
	 T7L4bV6gXnXNw==
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
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] rust: io: add view type
Date: Mon, 23 Mar 2026 15:37:56 +0000
Message-ID: <20260323153807.1360705-5-gary@kernel.org>
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

The view may be created statically via I/O projection using `io_project!()`
macro to perform compile-time checks, or created by type-casting an
existing view type with `try_cast()` function, where the size and alignment
checks are performed at runtime.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/io.rs | 147 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 146 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 72902a4a343d..8166e47f1381 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -7,7 +7,11 @@
 use crate::{
     bindings,
     prelude::*,
-    ptr::KnownSize, //
+    ptr::KnownSize,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
 };
 
 pub mod mem;
@@ -296,6 +300,13 @@ pub trait Io {
     /// Type of this I/O region. For untyped I/O regions, [`Region`] type can be used.
     type Type: ?Sized + KnownSize;
 
+    /// Get a [`View`] covering the entire region.
+    #[inline]
+    fn as_view(&self) -> View<'_, Self, Self::Type> {
+        // SAFETY: Trivially satisfied.
+        unsafe { View::new_unchecked(self, self.as_ptr()) }
+    }
+
     /// Returns the base pointer of this mapping.
     ///
     /// This is a pointer to capture metadata. The specific meaning of the pointer depends on
@@ -895,3 +906,137 @@ pub fn relaxed(&self) -> &RelaxedMmio<T> {
     readq_relaxed,
     writeq_relaxed
 );
+
+/// A view into an I/O region.
+///
+/// # Invariants
+///
+/// - `ptr` is aligned for `T`
+/// - `ptr` has same provenance as `io.as_ptr()`
+/// - `ptr.byte_offset_from(io.as_ptr())` is between 0 to
+///   `KnownSize::size(io.as_ptr()) - KnownSize::size(ptr)`.
+///
+/// These invariants are trivially satisfied if the pointer is created via pointer projection.
+pub struct View<'a, IO: ?Sized, T: ?Sized> {
+    io: &'a IO,
+    ptr: *mut T,
+}
+
+impl<'a, IO: ?Sized, T: ?Sized> View<'a, IO, T> {
+    // For `io_project!` macro use only.
+    #[doc(hidden)]
+    #[inline]
+    pub fn as_view(&self) -> Self {
+        *self
+    }
+
+    /// Create a view of a provided I/O region.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must satisfy the invariants of the view type.
+    #[inline]
+    pub unsafe fn new_unchecked(io: &'a IO, ptr: *mut T) -> Self {
+        // INVARIANT: Per function safety requirement.
+        Self { io, ptr }
+    }
+
+    /// Obtain the underlying I/O region.
+    #[inline]
+    pub fn io(self) -> &'a IO {
+        self.io
+    }
+
+    /// Obtain a pointer to the subview.
+    ///
+    /// The interpretation of the pointer depends on the underlying I/O region.
+    #[inline]
+    pub fn as_ptr(self) -> *mut T {
+        self.ptr
+    }
+}
+
+impl<IO: ?Sized, T: ?Sized> Clone for View<'_, IO, T> {
+    #[inline]
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<IO: ?Sized, T: ?Sized> Copy for View<'_, IO, T> {}
+
+impl<'a, IO: ?Sized, T: ?Sized> View<'a, IO, T> {
+    /// Try to convert this view into a different typed I/O view.
+    ///
+    /// The target type must be of same or smaller size to current type, and the current view must
+    /// be properly aligned for the target type.
+    #[inline]
+    pub fn try_cast<U>(self) -> Result<View<'a, IO, U>>
+    where
+        T: KnownSize + FromBytes + AsBytes,
+        U: FromBytes + AsBytes,
+    {
+        if size_of::<U>() > KnownSize::size(self.ptr) {
+            return Err(EINVAL);
+        }
+
+        if self.ptr.addr() % align_of::<U>() != 0 {
+            return Err(EINVAL);
+        }
+
+        // INVARIANT: We have checked bounds and alignment.
+        Ok(View {
+            io: self.io,
+            ptr: self.ptr.cast(),
+        })
+    }
+}
+
+/// Project an I/O type to a subview of it.
+///
+/// The syntax is of form `io_project!(io, proj)` where `io` is an expression to a type that
+/// implements [`Io`] and `proj` is a [projection specification](kernel::ptr::project!).
+///
+/// In addition to projecting from [`Io`], you may also project from a [`View`] of an [`Io`].
+///
+/// # Examples
+///
+/// ```
+/// use kernel::io::{
+///     io_project,
+///     Mmio,
+///     View,
+/// };
+/// struct MyStruct { field: u32, }
+///
+/// // SAFETY: All bit patterns are acceptable values for `MyStruct`.
+/// unsafe impl kernel::transmute::FromBytes for MyStruct{};
+/// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
+/// unsafe impl kernel::transmute::AsBytes for MyStruct{};
+///
+/// # fn test(mmio: &Mmio<[MyStruct]>) -> Result {
+/// // let mmio: Mmio<[MyStruct]>;
+/// let field: View<'_, _, u32> = io_project!(mmio, [1]?.field);
+/// let whole: View<'_, _, MyStruct> = io_project!(mmio, [2]?);
+/// let nested: View<'_, Mmio<_>, u32> = io_project!(whole, .field);
+/// # Ok::<(), Error>(()) }
+#[macro_export]
+#[doc(hidden)]
+macro_rules! io_project {
+    ($io:expr, $($proj:tt)*) => {{
+        // Bring `as_view` to scope.
+        use $crate::io::Io as _;
+
+        // Convert IO to view for unified handling.
+        // This also takes advantage to deref coercion.
+        let view: $crate::io::View<'_, _, _> = $io.as_view();
+        let ptr = $crate::ptr::project!(
+            mut view.as_ptr(), $($proj)*
+        );
+        // SAFETY: projection of a projection is still a valid projection.
+        unsafe { $crate::io::View::new_unchecked(view.io(), ptr) }
+    }};
+}
+
+#[doc(inline)]
+pub use crate::io_project;
-- 
2.51.2

