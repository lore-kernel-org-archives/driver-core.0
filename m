Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BFE36DA04;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036195; cv=none; b=RvooGclcmoG89thUG/01bIKPOOYH2+d7MLiJf6pE1yRY/jgxXzNoqklAEfdKd17LW8eiQGisJgkSFxjhvTA/7lciLu+Tqt+8RrOQE9n/tmpXDMcYArn08QxcWFAuwS+AGdEwOnT4daObazATWWj8noTnS38fCBhiEnYHesm+wfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036195; c=relaxed/simple;
	bh=S91QflBSULvrfjiqsIil2QLyQMnzG3EKMzzqukOgbg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gSnoPLPZbftWMs/FRpL9QA7lb2AQJy87RU7Q6mnGlvZ+iiU/RaB1hh5FXTh9SnPgMNwnVUWiq9zrZCZ9+Qa3k2v5gv0eVsr75nNanDv7omyxyInvjIkqXDKFcCBg4N4gPylBmqaKUBXVADOBhb5kIZ0CI+LoN2YXE8Lrk1rql1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AZjHYCKK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AZjHYCKK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E21BC2BCF5;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1786036195; bh=S91QflBSULvrfjiqsIil2QLyQMnzG3EKMzzqukOgbg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AZjHYCKKnwOSLIkoGt2QPuaF4vCrTuIJskmNUUhEuvo3aata9rDcv5bGW5BVP1Wdp
	 VBkWPdgdpTkGYDnSCNZHYkvS/dZ5BZu8Q2YZRtJxJ0TQ1I3QIluOQ/pej1qqacIDoo
	 natkMgFLnctvSUi0Vz0InzWyPUq9SB7gLMk5Jmlc=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFDDC56205;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 07 Aug 2026 01:07:24 +0800
Subject: [PATCH v3 2/8] rust: debugfs: add seq_file support
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-tyr-debugfs-v2-v3-2-ff5595ac66ae@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786036192; l=4116;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=S91QflBSULvrfjiqsIil2QLyQMnzG3EKMzzqukOgbg4=;
 b=lOdaecEPQc/anzAS8mKEBFibrr6ZfwYq6RvEk6I7QDaEpVGd8av1G9CsZbQkYis7VuaEEI8fC
 NBqJNtFbZ+ADoD1jcJAoGShdgROyGYAxVdoAi+DzmBV+H3SvUzDwIQo
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add SeqShow trait for seq_file-backed debugfs files. Needed by DRM
and other subsystems to expose readable debugfs state via seq_file.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/debugfs/file_ops.rs | 60 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/traits.rs   | 11 ++++++++
 2 files changed, 71 insertions(+)

diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index f15908f71c4a2..ee8c85360e924 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -5,11 +5,13 @@
     BinaryReader,
     BinaryWriter,
     Reader,
+    SeqShow,
     Writer, //
 };
 
 use crate::{
     debugfs::callback_adapters::Adapter,
+    error::from_result,
     fmt,
     fs::file,
     prelude::*,
@@ -123,6 +125,64 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     0
 }
 
+/// Show callback for `SeqShow` types.
+///
+/// # Safety
+///
+/// The seq_file core guarantees that `seq` points to a live `seq_file`
+/// whose private data is a valid pointer to a `T` with no outstanding
+/// mutable references.
+unsafe extern "C" fn seq_file_show<S: SeqShow<T>, T: Sync>(
+    seq: *mut bindings::seq_file,
+    _: *mut c_void,
+) -> c_int {
+    // SAFETY: `seq->private` is a valid `T` pointer with no outstanding
+    // mutable references.
+    let data = unsafe { &*((*seq).private.cast::<T>()) };
+    // SAFETY: `seq` points to a live `seq_file`.
+    let m = unsafe { SeqFile::from_raw(seq) };
+    from_result(|| S::show(data, m).map(|()| 0))
+}
+
+/// Open callback for `SeqShow` types.
+///
+/// # Safety
+///
+/// The VFS guarantees that `inode` is valid with `i_private` pointing to a
+/// valid `T` that remains valid for the duration of the call, and that `file`
+/// points to a live, uninitialized file object.
+unsafe extern "C" fn seq_file_open<S: SeqShow<T>, T: Sync>(
+    inode: *mut bindings::inode,
+    file: *mut bindings::file,
+) -> c_int {
+    // SAFETY: `inode` is valid per VFS. `i_private` points to a valid `T`
+    // (guaranteed by the `FileOps<T>` invariants).
+    let data = unsafe { (*inode).i_private.cast::<T>() };
+
+    // SAFETY: `file` is valid per VFS; `data` matches `seq_file_show`'s contract.
+    unsafe { bindings::single_open(file, Some(seq_file_show::<S, T>), data.cast()) }
+}
+
+pub(crate) trait SeqReadFile<T> {
+    const FILE_OPS: FileOps<T>;
+}
+
+impl<S: SeqShow<T>, T: Sync> SeqReadFile<T> for S {
+    const FILE_OPS: FileOps<T> = {
+        let operations = bindings::file_operations {
+            read: Some(bindings::seq_read),
+            llseek: Some(bindings::seq_lseek),
+            release: Some(bindings::single_release),
+            open: Some(seq_file_open::<Self, T>),
+            ..pin_init::zeroed()
+        };
+        // SAFETY: `read` and `llseek` are stock `seq_file` implementations.
+        // `seq_file_open` treats `inode->i_private` as a valid `&T` reference,
+        // satisfying the `FileOps::new` contract.
+        unsafe { FileOps::new(operations, 0o400) }
+    };
+}
+
 // Work around lack of generic const items.
 pub(crate) trait ReadFile<T> {
     const FILE_OPS: FileOps<T>;
diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index 8c39524b6a990..02782cd817c4b 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -8,6 +8,7 @@
     fmt,
     fs::file,
     prelude::*,
+    seq_file::SeqFile,
     sync::{
         atomic::{
             Atomic,
@@ -338,3 +339,13 @@ fn read_from_slice(
         self.deref().read_from_slice(reader, offset)
     }
 }
+
+/// Renders `data` into a seq_file.
+///
+/// `data` is the value stashed as the debugfs file's `i_private` at creation
+/// time. `show` is invoked on each read to produce the file's contents.
+/// `data` must remain valid while the debugfs file is registered.
+pub trait SeqShow<T> {
+    /// Writes debugfs output for the file.
+    fn show(data: &T, m: &SeqFile) -> Result;
+}

-- 
2.43.0


