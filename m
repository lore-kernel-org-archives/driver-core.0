Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49303A8721;
	Tue, 26 May 2026 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812082; cv=none; b=A8wJRHH+TSMEIM/gmi0uzwqSbwwXt/JISulI46ATBt29QObK1fGc9Zdvg9CEziSoRI9QdhPyLf08P0Zyl/wc9LXd3CUVpuglxv0rY1d+H+IwtBwUK2P2MFshwagwWEFM896JxYCrbMJdgQHmT1OIZEa2gd6JJb6tYTiv2VmkoWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812082; c=relaxed/simple;
	bh=Lamp3vHSeVOpoIKbpQMmJUhOed6oH4WLdsjAI+uPm5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J5GyU5innwiNFpA4Xii207/cefIyHgzNUSd7r8WhraNYu4MWEnZEOqhzVI5l3b+K2osefFSPQzos/7TwbiXFj+KxDpnLK2nJ47SG83YMCMMebbsOPQ942qcrTtgwxegMDnnvak/pFhhV4f9BtiCCVJTbHSfJrrMG/hK8Go9KYNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHdzVTI5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHdzVTI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91411F000E9;
	Tue, 26 May 2026 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779812080;
	bh=bk1PbBxgP7Q5O8KtRGOmA5h7C1jxhFjN6G2AdUYDIE8=;
	h=From:Date:Subject:To:Cc;
	b=EHdzVTI5bHFy26fh6spBeA0KRK+/rVmedLde5iqNxUrkdLeqz0M8ILk281y2xQLct
	 MwIOq51shiB0C2XbcjzXsSLGmDZenxM+mxTHQEOtrptYQr5LN89d2Ar6NrL1WX3AIS
	 lLF6OoT2qP8UF9xS5dB4rouoHMSg7GFEJmngWXNJfUcSfasbiqjCRzNBkspSq4E3bE
	 4OF3WkFFHYc8pVNxiiYWhjOdsXUn36XiGt7zMZBte/EAKhYQ+vUKdUZ6pkgcA99Z9A
	 h02ebTolM0OYssbR41VgKFxUPnTtHKQ44L/o9eOBrmDJhQ6X4RYw+P9J++XpMlSUFE
	 7Y6i3dIIsNw7w==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 12:14:36 -0400
Subject: [PATCH] rust: debugfs: avoid transmuting FileOps
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-fileops-unsound-redesign-v1-1-bd1685cbaf56@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTvQBFLFq4iLtvlTR2RSMkaE0
 rsbdfkt3tvIUARG526jgpeYZG1wh47m26gLWGIz+d4PffADJ3kgr8ZVLVeNXBBhsigHN57c5I4
 pBE8tXwuSvH/ry/Vvq9Md8/P7o33/AFPG0k98AAAA
X-Change-ID: 20260526-fileops-unsound-redesign-51a81b17f552
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Matthew Maurer <mmaurer@google.com>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=19623; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Lamp3vHSeVOpoIKbpQMmJUhOed6oH4WLdsjAI+uPm5I=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmix97VGW3ila/Yos2ykudexX8xf30L9QecLKm9Zq82t
 CU0mId3TGRhEONisBRTZEkUPbQ3PfX2HtnMd8dh5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix0DHWMGLk4BmOqciQz/jP7b7K9ScWPRWvXKmr92Vmnqsc1uG3ZqLpWqmTy34/QVI0aGtzXJglv
 X7byla7rCaNv/+97K15zcHh83vXlpzmubYJcXjAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Commit 40ecc49466c8 ("rust: debugfs: Add support for callback-based
files") introduced `FileOps::adapt()`, which transmutes an `&FileOps<T>`
to an `&FileOps<T::Inner>`.

`FileOps` has the default Rust representation, which does not guarantee
the same layout for different generic instantiations [1]. Thus the
reference created by `adapt()` is not justified.

The callback operations do need to access private data through one of
the transparent adapter types. Express that relationship directly: make
`Adapter<D>` the unsafe proof that operations implemented for an adapter
may access stored `D`, and instantiate the corresponding operations
tables as `FileOps<D>`. The adapter implementations are justified by
their transparent representations [2].

Fixes: 40ecc49466c8 ("rust: debugfs: Add support for callback-based files")
Link: https://doc.rust-lang.org/reference/type-layout.html#the-rust-representation [1]
Link: https://doc.rust-lang.org/reference/type-layout.html#the-transparent-representation [2]
Assisted-by: Codex:gpt-5
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
I discovered this while looking to remove reference-to-reference
transmutes after discussing with Alice[1].

Link: https://lore.kernel.org/all/CAH5fLgibt_BQmOtkfEfo1=48zUeoWBJ-=u5gzw_a3X6Q7=aUSA@mail.gmail.com/ [1]
---
 rust/kernel/debugfs.rs                   | 20 +++----
 rust/kernel/debugfs/callback_adapters.rs | 67 ++++++++++++-----------
 rust/kernel/debugfs/file_ops.rs          | 92 ++++++++++++++++----------------
 3 files changed, 88 insertions(+), 91 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index d7b8014a6474..cb31c89eb139 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -239,7 +239,7 @@ pub fn read_callback_file<'a, T, E: 'a, F>(
         T: Send + Sync + 'static,
         F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result + Send + Sync,
     {
-        let file_ops = <FormatAdapter<T, F>>::FILE_OPS.adapt();
+        let file_ops = &<FormatAdapter<T, F> as ReadFile<T>>::FILE_OPS;
         self.create_file(name, data, file_ops)
     }
 
@@ -294,9 +294,7 @@ pub fn read_write_callback_file<'a, T, E: 'a, F, W>(
         W: Fn(&T, &mut UserSliceReader) -> Result + Send + Sync,
     {
         let file_ops =
-            <WritableAdapter<FormatAdapter<T, F>, W> as file_ops::ReadWriteFile<_>>::FILE_OPS
-                .adapt()
-                .adapt();
+            &<WritableAdapter<FormatAdapter<T, F>, W> as file_ops::ReadWriteFile<T>>::FILE_OPS;
         self.create_file(name, data, file_ops)
     }
 
@@ -348,9 +346,7 @@ pub fn write_callback_file<'a, T, E: 'a, W>(
         T: Send + Sync + 'static,
         W: Fn(&T, &mut UserSliceReader) -> Result + Send + Sync,
     {
-        let file_ops = <WritableAdapter<NoWriter<T>, W> as WriteFile<_>>::FILE_OPS
-            .adapt()
-            .adapt();
+        let file_ops = &<WritableAdapter<NoWriter<T>, W> as WriteFile<T>>::FILE_OPS;
         self.create_file(name, data, file_ops)
     }
 
@@ -584,7 +580,7 @@ pub fn read_callback_file<T, F>(&self, name: &CStr, data: &'data T, _f: &'static
         T: Send + Sync + 'static,
         F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result + Send + Sync,
     {
-        let vtable = <FormatAdapter<T, F> as ReadFile<_>>::FILE_OPS.adapt();
+        let vtable = &<FormatAdapter<T, F> as ReadFile<T>>::FILE_OPS;
         self.create_file(name, data, vtable)
     }
 
@@ -642,9 +638,7 @@ pub fn read_write_callback_file<T, F, W>(
         F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result + Send + Sync,
         W: Fn(&T, &mut UserSliceReader) -> Result + Send + Sync,
     {
-        let vtable = <WritableAdapter<FormatAdapter<T, F>, W> as ReadWriteFile<_>>::FILE_OPS
-            .adapt()
-            .adapt();
+        let vtable = &<WritableAdapter<FormatAdapter<T, F>, W> as ReadWriteFile<T>>::FILE_OPS;
         self.create_file(name, data, vtable)
     }
 
@@ -689,9 +683,7 @@ pub fn write_only_callback_file<T, W>(&self, name: &CStr, data: &'data T, _w: &'
         T: Send + Sync + 'static,
         W: Fn(&T, &mut UserSliceReader) -> Result + Send + Sync,
     {
-        let vtable = &<WritableAdapter<NoWriter<T>, W> as WriteFile<_>>::FILE_OPS
-            .adapt()
-            .adapt();
+        let vtable = &<WritableAdapter<NoWriter<T>, W> as WriteFile<T>>::FILE_OPS;
         self.create_file(name, data, vtable)
     }
 
diff --git a/rust/kernel/debugfs/callback_adapters.rs b/rust/kernel/debugfs/callback_adapters.rs
index dee7d021e18c..c90d796317dd 100644
--- a/rust/kernel/debugfs/callback_adapters.rs
+++ b/rust/kernel/debugfs/callback_adapters.rs
@@ -20,33 +20,33 @@
     ops::Deref, //
 };
 
+/// Indicates that operations implemented for `Self` may operate on file private
+/// data pointing to `D`.
+///
 /// # Safety
 ///
-/// To implement this trait, it must be safe to cast a `&Self` to a `&Inner`.
-/// It is intended for use in unstacking adapters out of `FileOps` backings.
-pub(crate) unsafe trait Adapter {
-    type Inner;
-}
+/// Operations may reconstruct a shared reference to `Self` from a pointer to
+/// `D`. Implementers must also arrange for any additional invariants of `Self`
+/// to hold whenever such an operation is called.
+pub(super) unsafe trait Adapter<D> {}
+
+// SAFETY: A pointer to `D` may be reconstructed as a shared reference to `D`.
+unsafe impl<D> Adapter<D> for D {}
 
-/// Adapter to implement `Reader` via a callback with the same representation as `T`.
+/// Adapter to implement `Reader` via a callback with the same representation as `D`.
 ///
-/// * Layer it on top of `WriterAdapter` if you want to add a custom callback for `write`.
-/// * Layer it on top of `NoWriter` to pass through any support present on the underlying type.
+/// * Layer it on top of `FormatAdapter` for a read-write callback file.
+/// * Layer it on top of `NoWriter` for a write-only callback file.
 ///
 /// # Invariants
 ///
-/// If an instance for `WritableAdapter<_, W>` is constructed, `W` is inhabited.
+/// When `WritableAdapter<_, W>` is used for file operations, `W` is inhabited.
 #[repr(transparent)]
-pub(crate) struct WritableAdapter<D, W> {
+pub(super) struct WritableAdapter<D, W> {
     inner: D,
     _writer: PhantomData<W>,
 }
 
-// SAFETY: Stripping off the adapter only removes constraints
-unsafe impl<D, W> Adapter for WritableAdapter<D, W> {
-    type Inner = D;
-}
-
 impl<D: Writer, W> Writer for WritableAdapter<D, W> {
     fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
         self.inner.write(fmt)
@@ -58,19 +58,20 @@ impl<D: Deref, W> Reader for WritableAdapter<D, W>
     W: Fn(&D::Target, &mut UserSliceReader) -> Result + Send + Sync + 'static,
 {
     fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
-        // SAFETY: WritableAdapter<_, W> can only be constructed if W is inhabited
+        // SAFETY: The callback API obtains this implementation only after
+        // receiving a `&'static W`, so `W` is inhabited.
         let w: &W = unsafe { materialize_zst() };
         w(self.inner.deref(), reader)
     }
 }
 
-/// Adapter to implement `Writer` via a callback with the same representation as `T`.
+/// Adapter to implement `Writer` via a callback with the same representation as `D`.
 ///
 /// # Invariants
 ///
-/// If an instance for `FormatAdapter<_, F>` is constructed, `F` is inhabited.
+/// When `FormatAdapter<_, F>` is used for file operations, `F` is inhabited.
 #[repr(transparent)]
-pub(crate) struct FormatAdapter<D, F> {
+pub(super) struct FormatAdapter<D, F> {
     inner: D,
     _formatter: PhantomData<F>,
 }
@@ -87,27 +88,22 @@ impl<D, F> Writer for FormatAdapter<D, F>
     F: Fn(&D, &mut fmt::Formatter<'_>) -> fmt::Result + 'static,
 {
     fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
-        // SAFETY: FormatAdapter<_, F> can only be constructed if F is inhabited
+        // SAFETY: The callback API obtains this implementation only after
+        // receiving a `&'static F`, so `F` is inhabited.
         let f: &F = unsafe { materialize_zst() };
         f(&self.inner, fmt)
     }
 }
 
-// SAFETY: Stripping off the adapter only removes constraints
-unsafe impl<D, F> Adapter for FormatAdapter<D, F> {
-    type Inner = D;
-}
+// SAFETY: `FormatAdapter<D, F>` is transparent over `D`. The callback API
+// receives a `&'static F`, which establishes its inhabitation invariant.
+unsafe impl<D, F> Adapter<D> for FormatAdapter<D, F> {}
 
 #[repr(transparent)]
-pub(crate) struct NoWriter<D> {
+pub(super) struct NoWriter<D> {
     inner: D,
 }
 
-// SAFETY: Stripping off the adapter only removes constraints
-unsafe impl<D> Adapter for NoWriter<D> {
-    type Inner = D;
-}
-
 impl<D> Deref for NoWriter<D> {
     type Target = D;
     fn deref(&self) -> &D {
@@ -115,11 +111,20 @@ fn deref(&self) -> &D {
     }
 }
 
+// SAFETY: The nested adapters are transparent over `D`. The callback APIs
+// receive `&'static F` and `&'static W`, which establish their inhabitation
+// invariants.
+unsafe impl<D, F, W> Adapter<D> for WritableAdapter<FormatAdapter<D, F>, W> {}
+
+// SAFETY: The nested adapters are transparent over `D`. The callback API
+// receives a `&'static W`, which establishes its inhabitation invariant.
+unsafe impl<D, W> Adapter<D> for WritableAdapter<NoWriter<D>, W> {}
+
 /// For types with a unique value, produce a static reference to it.
 ///
 /// # Safety
 ///
-/// The caller asserts that F is inhabited
+/// The caller asserts that `F` is inhabited.
 unsafe fn materialize_zst<F>() -> &'static F {
     const { assert!(core::mem::size_of::<F>() == 0) };
     let zst_dangle: core::ptr::NonNull<F> = core::ptr::NonNull::dangling();
diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index f15908f71c4a..a09d9bb75972 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -57,13 +57,6 @@ pub(crate) const fn mode(&self) -> u16 {
     }
 }
 
-impl<T: Adapter> FileOps<T> {
-    pub(super) const fn adapt(&self) -> &FileOps<T::Inner> {
-        // SAFETY: `Adapter` asserts that `T` can be legally cast to `T::Inner`.
-        unsafe { core::mem::transmute(self) }
-    }
-}
-
 #[cfg(CONFIG_DEBUG_FS)]
 impl<T> Deref for FileOps<T> {
     type Target = bindings::file_operations;
@@ -85,8 +78,9 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 ///
 /// # Safety
 ///
-/// * `inode`'s private pointer must point to a value of type `T` which will outlive the `inode`
-///   and will not have any unique references alias it during the call.
+/// * `inode`'s private pointer must be valid to convert to a shared reference
+///   to `T` for as long as it may be used by `writer_act::<T>`, without any
+///   unique references aliasing it during those calls.
 /// * `file` must point to a live, not-yet-initialized file object.
 unsafe extern "C" fn writer_open<T: Writer + Sync>(
     inode: *mut bindings::inode,
@@ -96,10 +90,11 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     let data = unsafe { (*inode).i_private };
     // SAFETY:
     // * `file` is acceptable by caller precondition.
-    // * `print_act` will be called on a `seq_file` with private data set to the third argument,
-    //   so we meet its safety requirements.
-    // * The `data` pointer passed in the third argument is a valid `T` pointer that outlives
-    //   this call by caller preconditions.
+    // * `writer_act::<T>` will be called on a `seq_file` with private data set
+    //   to the third argument, so we meet its safety requirements.
+    // * By caller precondition, the `data` pointer passed in the third argument
+    //   is valid to convert to a shared reference to `T` whenever
+    //   `writer_act::<T>` is called.
     unsafe { bindings::single_open(file, Some(writer_act::<T>), data) }
 }
 
@@ -107,14 +102,16 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 ///
 /// # Safety
 ///
-/// `seq` must point to a live `seq_file` whose private data is a valid pointer to a `T` which may
-/// not have any unique references alias it during the call.
+/// `seq` must point to a live `seq_file` whose private data is valid to convert
+/// to a shared reference to `T` and may not have any unique references aliasing
+/// it during the call.
 unsafe extern "C" fn writer_act<T: Writer + Sync>(
     seq: *mut bindings::seq_file,
     _: *mut c_void,
 ) -> c_int {
-    // SAFETY: By caller precondition, this pointer is valid pointer to a `T`, and
-    // there are not and will not be any unique references until we are done.
+    // SAFETY: By caller precondition, this pointer is valid to convert to a
+    // shared reference to `T`, and there are not and will not be any unique
+    // references until we are done.
     let data = unsafe { &*((*seq).private.cast::<T>()) };
     // SAFETY: By caller precondition, `seq_file` points to a live `seq_file`, so we can lift
     // it.
@@ -128,8 +125,11 @@ pub(crate) trait ReadFile<T> {
     const FILE_OPS: FileOps<T>;
 }
 
-impl<T: Writer + Sync> ReadFile<T> for T {
-    const FILE_OPS: FileOps<T> = {
+impl<T, D> ReadFile<D> for T
+where
+    T: Writer + Sync + Adapter<D>,
+{
+    const FILE_OPS: FileOps<D> = {
         let operations = bindings::file_operations {
             read: Some(bindings::seq_read),
             llseek: Some(bindings::seq_lseek),
@@ -137,10 +137,10 @@ impl<T: Writer + Sync> ReadFile<T> for T {
             open: Some(writer_open::<Self>),
             ..pin_init::zeroed()
         };
-        // SAFETY: `operations` is all stock `seq_file` implementations except for `writer_open`.
-        // `open`'s only requirement beyond what is provided to all open functions is that the
-        // inode's data pointer must point to a `T` that will outlive it, which matches the
-        // `FileOps` requirements.
+        // SAFETY: `operations` is all stock `seq_file` implementations except
+        // for `writer_open`, which passes private data to `writer_act::<T>`.
+        // `T: Adapter<D>` guarantees that it may reconstruct a reference to `T`
+        // from the `D` private data required by `FileOps<D>`.
         unsafe { FileOps::new(operations, 0o400) }
     };
 }
@@ -159,7 +159,7 @@ fn read<T: Reader + Sync>(data: &T, buf: *const c_char, count: usize) -> isize {
 ///
 /// `file` must be a valid pointer to a `file` struct.
 /// The `private_data` of the file must contain a valid pointer to a `seq_file` whose
-/// `private` data in turn points to a `T` that implements `Reader`.
+/// `private` data is valid to convert to a shared reference to `T`.
 /// `buf` must be a valid user-space buffer.
 pub(crate) unsafe extern "C" fn write<T: Reader + Sync>(
     file: *mut bindings::file,
@@ -169,7 +169,8 @@ fn read<T: Reader + Sync>(data: &T, buf: *const c_char, count: usize) -> isize {
 ) -> isize {
     // SAFETY: The file was opened with `single_open`, which sets `private_data` to a `seq_file`.
     let seq = unsafe { &mut *((*file).private_data.cast::<bindings::seq_file>()) };
-    // SAFETY: By caller precondition, this pointer is live and points to a value of type `T`.
+    // SAFETY: By caller precondition, this pointer is valid to convert to a shared reference to
+    // `T`.
     let data = unsafe { &*(seq.private as *const T) };
     read(data, buf, count)
 }
@@ -179,8 +180,11 @@ pub(crate) trait ReadWriteFile<T> {
     const FILE_OPS: FileOps<T>;
 }
 
-impl<T: Writer + Reader + Sync> ReadWriteFile<T> for T {
-    const FILE_OPS: FileOps<T> = {
+impl<T, D> ReadWriteFile<D> for T
+where
+    T: Writer + Reader + Sync + Adapter<D>,
+{
+    const FILE_OPS: FileOps<D> = {
         let operations = bindings::file_operations {
             open: Some(writer_open::<T>),
             read: Some(bindings::seq_read),
@@ -189,14 +193,9 @@ impl<T: Writer + Reader + Sync> ReadWriteFile<T> for T {
             release: Some(bindings::single_release),
             ..pin_init::zeroed()
         };
-        // SAFETY: `operations` is all stock `seq_file` implementations except for `writer_open`
-        // and `write`.
-        // `writer_open`'s only requirement beyond what is provided to all open functions is that
-        // the inode's data pointer must point to a `T` that will outlive it, which matches the
-        // `FileOps` requirements.
-        // `write` only requires that the file's private data pointer points to `seq_file`
-        // which points to a `T` that will outlive it, which matches what `writer_open`
-        // provides.
+        // SAFETY: `writer_open` and `write` access the private data through
+        // `T`; `T: Adapter<D>` guarantees that this is valid for the `D`
+        // private data required by `FileOps<D>`.
         unsafe { FileOps::new(operations, 0o600) }
     };
 }
@@ -217,8 +216,7 @@ impl<T: Writer + Reader + Sync> ReadWriteFile<T> for T {
 /// # Safety
 ///
 /// * `file` must be a valid pointer to a `file` struct.
-/// * The `private_data` of the file must contain a valid pointer to a `T` that implements
-///   `Reader`.
+/// * The `private_data` of the file must be valid to convert to a shared reference to `T`.
 /// * `buf` must be a valid user-space buffer.
 pub(crate) unsafe extern "C" fn write_only_write<T: Reader + Sync>(
     file: *mut bindings::file,
@@ -226,8 +224,8 @@ impl<T: Writer + Reader + Sync> ReadWriteFile<T> for T {
     count: usize,
     _ppos: *mut bindings::loff_t,
 ) -> isize {
-    // SAFETY: The caller ensures that `file` is a valid pointer and that `private_data` holds a
-    // valid pointer to `T`.
+    // SAFETY: The caller ensures that `file` is a valid pointer and that
+    // `private_data` is valid to convert to a shared reference to `T`.
     let data = unsafe { &*((*file).private_data as *const T) };
     read(data, buf, count)
 }
@@ -236,19 +234,21 @@ pub(crate) trait WriteFile<T> {
     const FILE_OPS: FileOps<T>;
 }
 
-impl<T: Reader + Sync> WriteFile<T> for T {
-    const FILE_OPS: FileOps<T> = {
+impl<T, D> WriteFile<D> for T
+where
+    T: Reader + Sync + Adapter<D>,
+{
+    const FILE_OPS: FileOps<D> = {
         let operations = bindings::file_operations {
             open: Some(write_only_open),
             write: Some(write_only_write::<T>),
             llseek: Some(bindings::noop_llseek),
             ..pin_init::zeroed()
         };
-        // SAFETY:
-        // * `write_only_open` populates the file private data with the inode private data
-        // * `write_only_write`'s only requirement is that the private data of the file point to
-        //   a `T` and be legal to convert to a shared reference, which `write_only_open`
-        //   satisfies.
+        // SAFETY: `write_only_open` stores the inode private data in the file,
+        // and `write_only_write::<T>` accesses it through `T`. `T: Adapter<D>`
+        // guarantees that this is valid for the `D` private data required by
+        // `FileOps<D>`.
         unsafe { FileOps::new(operations, 0o200) }
     };
 }

---
base-commit: fc1ce3afa2e61b4b15e71436ece91b0441a9f4f0
change-id: 20260526-fileops-unsound-redesign-51a81b17f552

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

