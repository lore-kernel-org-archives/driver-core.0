Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B7397321;
	Thu, 30 Jul 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431151; cv=none; b=jJtXvaRMRznOf8lccYVmlXzj1uPDxqWR3ENsp8tYtmF+JuPCgILzYpKOopB38bY0mkS441CLJR1Clay1ckLRKmpd3G06eyfOXHo3UOF/NnSqhgiX/oZlGfnnTHRjDTctHAsNbtUGO8Iv7D5msZc4r2OnoPHliguFSqrG+zu9qaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431151; c=relaxed/simple;
	bh=FTFUONPZ59+GJBuoVyzqKeWjyXfvQxVwyjwhiLzc75o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H491IeTJcZ0LHN/bjBnfNa8wm0spiLLVF2ZvdhA4qg3vRgjV6cWVfJU5qT4aufGnY/AghFk5UPyvUw5A2JdjYyaIOEQvYKhsAfDpCLlu9oZT4gMD2+I2lTZivzTTC7A8Y0U5uURNWMX7G0vswdIlCpCLUWNgSLxSHUyrmsfEF/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f/jt8kXY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f/jt8kXY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB56FC2BCF7;
	Thu, 30 Jul 2026 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1785431151; bh=FTFUONPZ59+GJBuoVyzqKeWjyXfvQxVwyjwhiLzc75o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f/jt8kXY791tKpDq1ShjjhUrVh7rO1K5+VAFQpuWAnaycz+1jSsiDNo13LaWsGcNB
	 CuOngTCHDvlzdLNt7Bn+CtxF5Si+fksTZSA7HZirq1iesPQU7BpWUwIa6ZhsarmvaH
	 dIXKcEUtphzq6RnIYJIYC2tO/HhkK76hAWnAI4/U=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE79FC5516F;
	Thu, 30 Jul 2026 17:05:50 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 31 Jul 2026 01:05:41 +0800
Subject: [PATCH v2 3/9] rust: debugfs: add Entry::from_raw and
 ScopedDir::from_dentry
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-tyr-debugfs-v2-v2-3-aea19eccb996@linux.dev>
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
In-Reply-To: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Melissa Wen <mwen@igalia.com>, Wambui Karuga <wambui.karugax@gmail.com>, 
 Eric Anholt <eric@anholt.net>, Ben Gamari <bgamari@gmail.com>, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785431148; l=2419;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=FTFUONPZ59+GJBuoVyzqKeWjyXfvQxVwyjwhiLzc75o=;
 b=oDB9AgTRksigyDa32LKWaz2haxDqxaPU9ZNoKyWk2lZQksK+lhTkT3ANydQK7o5sAwThohcZm
 tN6hxLfrA6bBsIAG2AFfPthvNKam079pN6pEZHxRiv9W9CHM1n3f42I
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add methods to construct debugfs abstractions from raw C dentry
pointers. Needed by DRM debugfs_init callback to create ScopedDir
from the root dentry provided by C core.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/debugfs.rs       | 19 +++++++++++++++++++
 rust/kernel/debugfs/entry.rs | 15 ++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index dea0e2c953039..0f521762352ad 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -735,4 +735,23 @@ fn new(name: &CStr) -> ScopedDir<'data, 'static> {
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


