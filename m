Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2375D1429D;
	Sun, 30 Aug 2026 19:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788118755; cv=none; b=sas/jn3+afRtDbreoz5lfq1AV2hWx6/PcbTZtENS/cvIhNxHGewQttvkYVFNoiagDhEhixVn5M/KigBc/vqtDoLb7WYUT2QE6O63wJptKEKq0lQbOoTaem4HXn4oxtuneFWhgsJ8q5LMfLefOJ3FROoFD2NF+k7PujMuplAPOgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788118755; c=relaxed/simple;
	bh=7xfsaydFEvbUWapeTENio4cmMfp+78hijjctMlZ1e0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUYC/do/Eis6f+vfOyxCpzTGI/dRlrvFUGMESZSN3kbvx2RxqH+JXU0c3S8ZLyg1ksLHjunlxg4tpwuCgCGAEFm/8AqDDD7PAITumUQ6z7YxA6+SaIljDItW4jpIQ1vIvaxPXQamiR+TeeOQsEA9DKtdFxAR71Y5Ea5rLBuJATM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7bn7Wic; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7bn7Wic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B5B1F00ACA;
	Sun, 30 Aug 2026 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788118753;
	bh=OZ6s/u8xoocw26jm3ao7aAa57mY0XtncPNJjNbGVUbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B7bn7Wic/4XXYSexQYoRZo3mANz7bl+hBqcGOUhTlx+YedGQZ2vR8ycNZi+DRlqtT
	 N6wLtgoBet9RNBLgXRUcBzgWp9rg2hDc7TwRJH4HTIPUN9ATkfDqKajjPvIAV4FPev
	 RFc2geNWbrsPxT98q6K3zdgOa/9cp3Y7z/8hUn2g4qUWOAH6sw5uTZ86LmGeT1vV/e
	 +CUyqiArW1W10JHN5SHwg+9Hsjg/escs/gaxlb6yoclKmTbkH5FoRp2syIJfop/YVV
	 4RGi5Xrvy8ttGpvEYqDQn1ESHyV3fLvG5WtueG0f+HWrYgthei2UjFBFYjpFMZtd7v
	 pmUWeVQVb40VA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	mmaurer@google.com
Cc: driver-core@lists.linux.dev,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/4] rust: debugfs: drop 'static bound from ScopedDir file creation methods
Date: Sun, 30 Aug 2026 21:37:13 +0200
Message-ID: <20260830193824.471089-2-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830193824.471089-1-dakr@kernel.org>
References: <20260830193824.471089-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the T: 'static bound from ScopedDir's file creation methods
(read_binary_file(), read_only_file(), etc.) to support registering
debugfs files backed by types that contain non-'static references, such
as dma::Coherent<'a, T>.

The previous 'static bound existed because ScopedDir::create_file() took
&'static FileOps<T>, and &'static requires T: 'static for well-
formedness. However, this was overly conservative; FileOps instances are
always associated consts residing in static storage, so the pointer
passed to the C debugfs API is always valid for the file's lifetime.

Formalize this as a type invariant on FileOps. All instances reside in
static storage, enforced by requiring FileOps::new() to only be used in
const/static items. Replace the Deref impl with an explicit fops()
method that returns &'static bindings::file_operations, justified by the
type invariant.

With this, ScopedDir::create_file() takes &FileOps<T> (no 'static),
preserving the generic type safety (T links the fops to the data type)
while allowing non-'static T.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/debugfs.rs          | 26 +++++------------
 rust/kernel/debugfs/entry.rs    |  4 +--
 rust/kernel/debugfs/file_ops.rs | 52 +++++++++++++++++++--------------
 3 files changed, 39 insertions(+), 43 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index d7b8014a6474..2beb55d444ca 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -538,7 +538,7 @@ pub fn dir<'dir2>(&'dir2 self, name: &CStr) -> ScopedDir<'data, 'dir2> {
         }
     }
 
-    fn create_file<T: Sync>(&self, name: &CStr, data: &'data T, vtable: &'static FileOps<T>) {
+    fn create_file<T: Sync>(&self, name: &CStr, data: &'data T, vtable: &FileOps<T>) {
         #[cfg(CONFIG_DEBUG_FS)]
         core::mem::forget(Entry::file(name, &self.entry, data, vtable));
     }
@@ -550,7 +550,7 @@ fn create_file<T: Sync>(&self, name: &CStr, data: &'data T, vtable: &'static Fil
     /// This function does not produce an owning handle to the file. The created
     /// file is removed when the [`Scope`] that this directory belongs
     /// to is dropped.
-    pub fn read_only_file<T: Writer + Send + Sync + 'static>(&self, name: &CStr, data: &'data T) {
+    pub fn read_only_file<T: Writer + Send + Sync>(&self, name: &CStr, data: &'data T) {
         self.create_file(name, data, &T::FILE_OPS)
     }
 
@@ -560,11 +560,7 @@ pub fn read_only_file<T: Writer + Send + Sync + 'static>(&self, name: &CStr, dat
     ///
     /// This function does not produce an owning handle to the file. The created file is removed
     /// when the [`Scope`] that this directory belongs to is dropped.
-    pub fn read_binary_file<T: BinaryWriter + Send + Sync + 'static>(
-        &self,
-        name: &CStr,
-        data: &'data T,
-    ) {
+    pub fn read_binary_file<T: BinaryWriter + Send + Sync>(&self, name: &CStr, data: &'data T) {
         self.create_file(name, data, &T::FILE_OPS)
     }
 
@@ -596,11 +592,7 @@ pub fn read_callback_file<T, F>(&self, name: &CStr, data: &'data T, _f: &'static
     /// This function does not produce an owning handle to the file. The created
     /// file is removed when the [`Scope`] that this directory belongs
     /// to is dropped.
-    pub fn read_write_file<T: Writer + Reader + Send + Sync + 'static>(
-        &self,
-        name: &CStr,
-        data: &'data T,
-    ) {
+    pub fn read_write_file<T: Writer + Reader + Send + Sync>(&self, name: &CStr, data: &'data T) {
         let vtable = &<T as ReadWriteFile<_>>::FILE_OPS;
         self.create_file(name, data, vtable)
     }
@@ -612,7 +604,7 @@ pub fn read_write_file<T: Writer + Reader + Send + Sync + 'static>(
     ///
     /// This function does not produce an owning handle to the file. The created file is removed
     /// when the [`Scope`] that this directory belongs to is dropped.
-    pub fn read_write_binary_file<T: BinaryWriter + BinaryReader + Send + Sync + 'static>(
+    pub fn read_write_binary_file<T: BinaryWriter + BinaryReader + Send + Sync>(
         &self,
         name: &CStr,
         data: &'data T,
@@ -655,7 +647,7 @@ pub fn read_write_callback_file<T, F, W>(
     /// This function does not produce an owning handle to the file. The created
     /// file is removed when the [`Scope`] that this directory belongs
     /// to is dropped.
-    pub fn write_only_file<T: Reader + Send + Sync + 'static>(&self, name: &CStr, data: &'data T) {
+    pub fn write_only_file<T: Reader + Send + Sync>(&self, name: &CStr, data: &'data T) {
         let vtable = &<T as WriteFile<_>>::FILE_OPS;
         self.create_file(name, data, vtable)
     }
@@ -666,11 +658,7 @@ pub fn write_only_file<T: Reader + Send + Sync + 'static>(&self, name: &CStr, da
     ///
     /// This function does not produce an owning handle to the file. The created file is removed
     /// when the [`Scope`] that this directory belongs to is dropped.
-    pub fn write_binary_file<T: BinaryReader + Send + Sync + 'static>(
-        &self,
-        name: &CStr,
-        data: &'data T,
-    ) {
+    pub fn write_binary_file<T: BinaryReader + Send + Sync>(&self, name: &CStr, data: &'data T) {
         self.create_file(name, data, &T::FILE_OPS)
     }
 
diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
index 46aad64896ec..88a870d8c295 100644
--- a/rust/kernel/debugfs/entry.rs
+++ b/rust/kernel/debugfs/entry.rs
@@ -74,7 +74,7 @@ pub(crate) unsafe fn dynamic_file<T>(
                 parent.as_ptr(),
                 core::ptr::from_ref(data) as *mut c_void,
                 core::ptr::null(),
-                &**file_ops,
+                file_ops.fops(),
             )
         };
 
@@ -127,7 +127,7 @@ pub(crate) fn file<T>(
                 parent.as_ptr(),
                 core::ptr::from_ref(data) as *mut c_void,
                 core::ptr::null(),
-                &**file_ops,
+                file_ops.fops(),
             )
         };
 
diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index f15908f71c4a..7e1dd8c75ad9 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -20,14 +20,12 @@
 
 use core::marker::PhantomData;
 
-#[cfg(CONFIG_DEBUG_FS)]
-use core::ops::Deref;
-
-/// # Invariant
+/// # Invariants
 ///
-/// `FileOps<T>` will always contain an `operations` which is safe to use for a file backed
-/// off an inode which has a pointer to a `T` in its private data that is safe to convert
-/// into a reference.
+/// - `FileOps<T>` will always contain an `operations` which is safe to use for a file backed
+///   off an inode which has a pointer to a `T` in its private data that is safe to convert
+///   into a reference.
+/// - Every instance of `FileOps<T>` resides in static storage.
 pub(super) struct FileOps<T> {
     #[cfg(CONFIG_DEBUG_FS)]
     operations: bindings::file_operations,
@@ -39,9 +37,13 @@ pub(super) struct FileOps<T> {
 impl<T> FileOps<T> {
     /// # Safety
     ///
-    /// The caller asserts that the provided `operations` is safe to use for a file whose
-    /// inode has a pointer to `T` in its private data that is safe to convert into a reference.
+    /// - The caller asserts that the provided `operations` is safe to use for a file whose
+    ///   inode has a pointer to `T` in its private data that is safe to convert into a reference.
+    /// - Must only be used to initialize a `const` or `static` item, to uphold the type invariant
+    ///   that all `FileOps` instances reside in static storage.
     const unsafe fn new(operations: bindings::file_operations, mode: u16) -> Self {
+        // INVARIANT: The caller is required to only use this in a `const` or `static` item,
+        // ensuring that all `FileOps` instances reside in static storage.
         Self {
             #[cfg(CONFIG_DEBUG_FS)]
             operations,
@@ -65,11 +67,11 @@ pub(super) const fn adapt(&self) -> &FileOps<T::Inner> {
 }
 
 #[cfg(CONFIG_DEBUG_FS)]
-impl<T> Deref for FileOps<T> {
-    type Target = bindings::file_operations;
-
-    fn deref(&self) -> &Self::Target {
-        &self.operations
+impl<T> FileOps<T> {
+    /// Returns a `'static` reference to the inner `file_operations`.
+    pub(crate) fn fops(&self) -> &'static bindings::file_operations {
+        // SAFETY: By the type invariant, `self` resides in static storage.
+        unsafe { core::mem::transmute(&self.operations) }
     }
 }
 
@@ -138,9 +140,10 @@ impl<T: Writer + Sync> ReadFile<T> for T {
             ..pin_init::zeroed()
         };
         // SAFETY: `operations` is all stock `seq_file` implementations except for `writer_open`.
-        // `open`'s only requirement beyond what is provided to all open functions is that the
-        // inode's data pointer must point to a `T` that will outlive it, which matches the
-        // `FileOps` requirements.
+        // - `open`'s only requirement beyond what is provided to all open functions is that the
+        //   inode's data pointer must point to a `T` that will outlive it, which matches the
+        //   `FileOps` requirements.
+        // - This is a `const` item, satisfying the static storage invariant.
         unsafe { FileOps::new(operations, 0o400) }
     };
 }
@@ -194,9 +197,10 @@ impl<T: Writer + Reader + Sync> ReadWriteFile<T> for T {
         // `writer_open`'s only requirement beyond what is provided to all open functions is that
         // the inode's data pointer must point to a `T` that will outlive it, which matches the
         // `FileOps` requirements.
-        // `write` only requires that the file's private data pointer points to `seq_file`
-        // which points to a `T` that will outlive it, which matches what `writer_open`
-        // provides.
+        // - `write` only requires that the file's private data pointer points to `seq_file`
+        //   which points to a `T` that will outlive it, which matches what `writer_open`
+        //   provides.
+        // - This is a `const` item, satisfying the static storage invariant.
         unsafe { FileOps::new(operations, 0o600) }
     };
 }
@@ -245,10 +249,11 @@ impl<T: Reader + Sync> WriteFile<T> for T {
             ..pin_init::zeroed()
         };
         // SAFETY:
-        // * `write_only_open` populates the file private data with the inode private data
-        // * `write_only_write`'s only requirement is that the private data of the file point to
+        // - `write_only_open` populates the file private data with the inode private data
+        // - `write_only_write`'s only requirement is that the private data of the file point to
         //   a `T` and be legal to convert to a shared reference, which `write_only_open`
         //   satisfies.
+        // - This is a `const` item, satisfying the static storage invariant.
         unsafe { FileOps::new(operations, 0o200) }
     };
 }
@@ -303,6 +308,7 @@ impl<T: BinaryWriter + Sync> BinaryReadFile<T> for T {
         //   corresponding `struct file`.
         // - `blob_read()` re-creates a reference to `T` from the `struct file`'s private data.
         // - `default_llseek()` does not access the `struct file`'s private data.
+        // - This is a `const` item, satisfying the static storage invariant.
         unsafe { FileOps::new(operations, 0o400) }
     };
 }
@@ -357,6 +363,7 @@ impl<T: BinaryReader + Sync> BinaryWriteFile<T> for T {
         //   corresponding `struct file`.
         // - `blob_write()` re-creates a reference to `T` from the `struct file`'s private data.
         // - `default_llseek()` does not access the `struct file`'s private data.
+        // - This is a `const` item, satisfying the static storage invariant.
         unsafe { FileOps::new(operations, 0o200) }
     };
 }
@@ -383,6 +390,7 @@ impl<T: BinaryWriter + BinaryReader + Sync> BinaryReadWriteFile<T> for T {
         // - `blob_read()` re-creates a reference to `T` from the `struct file`'s private data.
         // - `blob_write()` re-creates a reference to `T` from the `struct file`'s private data.
         // - `default_llseek()` does not access the `struct file`'s private data.
+        // - This is a `const` item, satisfying the static storage invariant.
         unsafe { FileOps::new(operations, 0o600) }
     };
 }
-- 
2.55.0

