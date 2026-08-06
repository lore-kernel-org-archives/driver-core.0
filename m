Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95082371D05;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036195; cv=none; b=LKsLdO6Et5KGUm6/aNxUCpCC2ZJ6y70ySwAY9bYGdcbSiNQV+Sgl0HdIA/8ST3NjAt12IW+W6njcafzSHm5HFNQ1R5q8UsvNK6i9CBqnMziAyRhKvKBpbjsr8CbIrKi1LK1ysUuIKCtprjTCFBAqBMdAAecYjPDcxXDPYgwGORc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036195; c=relaxed/simple;
	bh=gBeCwzgG77EObc2Yyji4wjMjI8hg1cHLHMj7opVab9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qz4MsI3BeiVR/XT5l8vb+ds46JDBsvjGvX4LOArjKUC2S2MO7ZNWBJEvX2lihmWld5HwwN2OoIx5o42AviHZW7pef6UwXJj2lJTnbTH/4+025Mmh/HvhhF5TQuerJemQMol3izn8wvfi/7qf1/MFOSRnTkDnqFK6QvjBQ1uBTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GCiSK5T0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GCiSK5T0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D319C2BCFF;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1786036195; bh=gBeCwzgG77EObc2Yyji4wjMjI8hg1cHLHMj7opVab9g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GCiSK5T0hiEC5OWWinNef8l0w0S59cnZ4eiis4qiKM2SP2J8mqKNWX/8+kBy1wv4u
	 9gHtavzhiTJs6KYKfAHYZ6mNpieX2vkKWPHMOMp7og06IE446chia4qldYXcrJoFA8
	 Vkng0SCWDkUW53V5DimQevcIbSlDdhWFKvlPcC+M=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2B2C5AC81;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 07 Aug 2026 01:07:25 +0800
Subject: [PATCH v3 3/8] rust: debugfs: add ScopeRef for existing dentries
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-tyr-debugfs-v2-v3-3-ff5595ac66ae@linux.dev>
References: <20260807-tyr-debugfs-v2-v3-0-ff5595ac66ae@linux.dev>
In-Reply-To: <20260807-tyr-debugfs-v2-v3-0-ff5595ac66ae@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Greg Kroah-Hartman <gregkh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786036192; l=5737;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=gBeCwzgG77EObc2Yyji4wjMjI8hg1cHLHMj7opVab9g=;
 b=fxzLoGbcjbRzQmSV14JVKvUk4fBi1ynRhqiyz7qnp7FIftA+IE4Nb9DENs0oXyil0ol6jTgeP
 JEV56FGjnhKA1XGbIUv7oY2yk1r/Wc2/Ms4IZJbHAe1n4Z0EL0ROo+b
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add methods to construct debugfs abstractions from raw C dentry
pointers. Needed by DRM debugfs_init callback to create ScopedDir
from an existing dentry.

Add ScopeRef<'a, T>, a debugfs directory handle that carries a
reference to associated data of type T.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/debugfs.rs       | 84 ++++++++++++++++++++++++++++++++++++++++++--
 rust/kernel/debugfs/entry.rs | 15 +++++++-
 2 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index d7b8014a64746..831d6750a34ba 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -24,7 +24,7 @@
         PhantomData,
         PhantomPinned, //
     },
-    ops::Deref,
+    ops::Deref, //
 };
 
 mod traits;
@@ -33,6 +33,7 @@
     BinaryReaderMut,
     BinaryWriter,
     Reader,
+    SeqShow,
     Writer, //
 };
 
@@ -51,6 +52,7 @@
     FileOps,
     ReadFile,
     ReadWriteFile,
+    SeqReadFile,
     WriteFile, //
 };
 
@@ -538,7 +540,7 @@ pub fn dir<'dir2>(&'dir2 self, name: &CStr) -> ScopedDir<'data, 'dir2> {
         }
     }
 
-    fn create_file<T: Sync>(&self, name: &CStr, data: &'data T, vtable: &'static FileOps<T>) {
+    fn create_file<T: Sync>(&self, name: &CStr, data: &'data T, vtable: &FileOps<T>) {
         #[cfg(CONFIG_DEBUG_FS)]
         core::mem::forget(Entry::file(name, &self.entry, data, vtable));
     }
@@ -588,6 +590,14 @@ pub fn read_callback_file<T, F>(&self, name: &CStr, data: &'data T, _f: &'static
         self.create_file(name, data, vtable)
     }
 
+    /// Creates a seq_file debugfs file in this directory.
+    ///
+    /// The file's contents are produced by invoking [`SeqShow::show`] with
+    /// `data` on each read.
+    pub fn seq_file<S: SeqShow<U>, U: Sync>(&self, name: &CStr, data: &'data U) {
+        self.create_file(name, data, &<S as SeqReadFile<U>>::FILE_OPS)
+    }
+
     /// Creates a read-write file in this directory.
     ///
     /// Reading the file uses the [`Writer`] implementation on `data`. Writing to the file uses
@@ -721,4 +731,74 @@ fn new(name: &CStr) -> ScopedDir<'data, 'static> {
             _phantom: PhantomData,
         }
     }
+
+    /// Creates a [`ScopedDir`] wrapping an existing debugfs dentry.
+    ///
+    /// Files created under this directory are not automatically removed on drop;
+    /// their lifetime is tied to the dentry owner.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure the dentry remains valid for the lifetime of the
+    /// returned `ScopedDir`.
+    pub unsafe fn from_dentry(dentry: *mut bindings::dentry) -> Self {
+        let _ = dentry;
+        ScopedDir {
+            #[cfg(CONFIG_DEBUG_FS)]
+            // SAFETY: The caller guarantees the dentry is valid and outlives this `ScopedDir`.
+            entry: ManuallyDrop::new(unsafe { Entry::from_raw(dentry) }),
+            _phantom: PhantomData,
+        }
+    }
+}
+
+/// A reference to a debugfs directory that also holds a reference to
+/// associated data of type `T`.
+///
+/// Created from an existing debugfs dentry (e.g. the DRM debugfs root).
+/// `data` must remain valid while the debugfs files created under this
+/// scope may be accessed.
+pub struct ScopeRef<'a, T> {
+    #[cfg(CONFIG_DEBUG_FS)]
+    inner: ScopedDir<'a, 'a>,
+    data: &'a T,
+}
+
+impl<'a, T> ScopeRef<'a, T> {
+    /// Creates a [`ScopeRef`] from an existing debugfs dentry and a data reference.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `dentry` remains valid for the lifetime of
+    /// the returned [`ScopeRef`] and that `data` remains valid while the
+    /// debugfs files created under this scope may be accessed.
+    pub unsafe fn new(dentry: *mut bindings::dentry, data: &'a T) -> Self {
+        let _ = dentry;
+        ScopeRef {
+            #[cfg(CONFIG_DEBUG_FS)]
+            // SAFETY: By the safety preconditions of `new`, `dentry` is valid
+            // and remains valid for the lifetime of the returned `ScopeRef`.
+            inner: unsafe { ScopedDir::from_dentry(dentry) },
+            data,
+        }
+    }
+
+    /// Creates a seq_file debugfs file in this directory.
+    ///
+    /// The file's contents are produced by invoking [`SeqShow::show`] with
+    /// `data` on each read.
+    #[cfg(CONFIG_DEBUG_FS)]
+    pub fn seq_file<S: SeqShow<T>>(&self, name: &CStr)
+    where
+        T: Sync,
+    {
+        self.inner.seq_file::<S, T>(name, self.data);
+    }
+
+    #[cfg(not(CONFIG_DEBUG_FS))]
+    pub fn seq_file<S: SeqShow<T>>(&self, _name: &CStr)
+    where
+        T: Sync,
+    {
+    }
 }
diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
index 46aad64896ecb..7643ff0fa6093 100644
--- a/rust/kernel/debugfs/entry.rs
+++ b/rust/kernel/debugfs/entry.rs
@@ -8,7 +8,7 @@
         CStr,
         CStrExt as _, //
     },
-    sync::Arc,
+    sync::Arc, //
 };
 
 use core::marker::PhantomData;
@@ -87,6 +87,19 @@ pub(crate) unsafe fn dynamic_file<T>(
 }
 
 impl<'a> Entry<'a> {
+    /// Wraps a raw dentry pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure the dentry is valid and outlives this `Entry`.
+    pub(crate) unsafe fn from_raw(entry: *mut bindings::dentry) -> Self {
+        Self {
+            entry,
+            _parent: None,
+            _phantom: PhantomData,
+        }
+    }
+
     pub(crate) fn dir(name: &CStr, parent: Option<&'a Entry<'_>>) -> Self {
         let parent_ptr = match &parent {
             Some(entry) => entry.as_ptr(),

-- 
2.43.0


