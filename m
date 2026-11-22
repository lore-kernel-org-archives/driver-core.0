Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795352576;
	b=osUyTe7GR81Hq7PyPt3dIE3vSFGmnI/ceNM0FTYAKkKeA3bPxfOlucs8Q6yE9rzv5f+z
	 cG6s6WKWS0B2TPG4c67g0ptB6M2Jn4VZtZ1PnaYc8zTqoo9qSevYYa3G2mPwAcUZCI0M/
	 Z9SjReNauQnZsC794DR1eqbDaUirsxclhgYzp28rwFt8BUiLJFhk6gdvLfnnqGrNOr5Hh
	 iIu49/7zyFIO9uiXqk0TlSrdm1p/QZjO0d/RV4zeI4UOL0wGXUBWQjt1KYkEkHm1i/BqJ
	 EFIkOUbaaA9hORm+3p3eX3hPbZZPhcDan4DZOHeKAA+EHaoVO7fa9wd3sMYkQChj2Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352576;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=uyNOGucpm2Hdawt9271GoTw7Iyd+QR1AG2JE+mFAUD8=;
	b=sipllRc2JAwkA7rVs9+1Q9Jf+i3/Aa9CAvOxIJ3NIGih1B/VTOHf2MJVQT9iK5Le/QMP
	 NrennqW0zaPU6SvEd9buDnXaDaZcMTTE7MRUwmg1oSX9Ra3v7NtySq6IVW7yj7OSEkXmw
	 yRSPWHmXQ3CF3ru7W4S+FYVn03xERGFOnkJ0ZfgZ0N7r4ecddtm1nDK4jRbhcr0Zdvf9r
	 LqoYDgY4D5u+b8c+qO4StbFZh0LG4a1Yv0NVsZwWy0ENw2GVP2KLRybquzgPc2oN2tq3I
	 UNyTaN4XB/HYD8Sgkvw1E9v8da2FyKZK4iC9tOmCaD4m0CtQGF2gqsgZ/0NSrerNzIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=owem2OxP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9708606A330;
	Sun, 22 Nov 2026 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=owem2OxP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795352576;
	b=EA1pWsBPvyXNPZi89h6hjXsFM1RF6wYf3aHI23UjB9Cbfi63cgl3VN4vcWuPKEZxO0Ra
	 jEFoDqCa2OBkv2iVzVX28sGPJDQcdDtGsynSOcvExGiCYdq9hgSogz1xUr+80OZaCmmrp
	 xQc61vLxXavRexoeJWkoyPK+xo8/LIf1t4gy2b6q2gH406I7JKxWHZAzxNPTevqucJbKI
	 jxPH1K65G7SQ8LsnWlAjrzV4uh5u8gNeB8w33uQdRJAfL6+SAOUN+FiMIireHRXvHzGuO
	 RGxExnwEqlgvy7DwSNhxsMSSRd4cGSQTKJjrksKTavxrra8LLRg2R5+qkOftZKaPR8w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795352576;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=uyNOGucpm2Hdawt9271GoTw7Iyd+QR1AG2JE+mFAUD8=;
	b=EqHDRITDWtnLCUTWsU2MwUBZ0QPQpFidmng4GD8oW3S4gduRXhoyA/In8G/xcuGFxTDh
	 QiWFbnxEwCXXNDQBmyaFu8UUOAGZazzYrvZQYpxK4SWxHbDZ7BuJk5rhcTIVMk2axBfZj
	 xiMS8oNpYF9imqQQpk4tX+LaWkfwpzuI9d8L79eq2/KY+Tr3jtKjGvdNtL1JqGZp4BTJY
	 shNsRkK70jOKIsKJNjA6ibBS4agPgOWFL+OV4JKMws2hlMhaUmaeluprkC6FgQ9j+QRw5
	 hQJERu4JgKIC9zSd+l1Gvh/f9x1PQnvAe9coQnsGwS5ywMaxtF3cWP4P9C/F4HSsjpg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E108A1F000E1;
	Sun, 22 Nov 2026 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1795352576; bh=uyNOGucpm2Hdawt9271GoTw7Iyd+QR1AG2JE+mFAUD8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=owem2OxPKcb90P+JzSKOJRwMwckPAJ/TiR42moMSTYHC0rTg6znvkn/YNg2HEYWoy
	 RAZLh4UpgqS/njRnbB6jwBmP77yblGxGzY2IbPOQ0X06rqKQY1vpVjip/1typaz5oe
	 cAzzoqMFBgH+XxactSX23KjsiZq/1AaG+557gn2Q=
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B73904C073;
	Sun, 22 Nov 2026 13:02:34 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Sun, 22 Nov 2026 20:50:29 +0800
Subject: [PATCH v7 10/10] drm/tyr: add BO-related ioctls
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-tyr-ioctls-v7-10-3a2af624b992@linux.dev>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
In-Reply-To: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
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
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795352551; l=5762;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=AzMnZarF2DGhywSoCR7Qyzkxwwb8F+ZXDPQo3lLLLzc=;
 b=LopV2a8Yja0UfwXM6/qSsFB1NHzY05tsSXBa7Ki9j9YbtkOcDfQaLGZ9bpJpMymMurEnWVQpM
 xMaGjhtDzLZDeyoICMHhum929cq1qp2Vh6HiNNxInmcgdWuqQKBpzQO
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Implement BO_CREATE and BO_MMAP_OFFSET so userspace can allocate GPU
buffers and obtain a DRM mmap offset for the generic mmap path.
BO_CREATE page-aligns the requested size and accepts NO_MMAP or WB_MMAP,
which are mutually exclusive; an exclusive VM returns EOPNOTSUPP.
BO_MMAP_OFFSET rejects NO_MMAP objects, which must never be CPU-mapped.

Co-developed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 drivers/gpu/drm/tyr/driver.rs |  2 +
 drivers/gpu/drm/tyr/file.rs   | 94 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/gem.rs    |  2 -
 3 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 6869ab345d8fd..8632e6e820c97 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -237,6 +237,8 @@ impl drm::Driver for TyrDrmDriver {
         (PANTHOR_VM_DESTROY, drm_panthor_vm_destroy, ioctl::RENDER_ALLOW, TyrDrmFileData::vm_destroy),
         (PANTHOR_VM_BIND, drm_panthor_vm_bind, ioctl::RENDER_ALLOW, TyrDrmFileData::vm_bind),
         (PANTHOR_VM_GET_STATE, drm_panthor_vm_get_state, ioctl::RENDER_ALLOW, TyrDrmFileData::vm_get_state),
+        (PANTHOR_BO_CREATE, drm_panthor_bo_create, ioctl::RENDER_ALLOW, TyrDrmFileData::bo_create),
+        (PANTHOR_BO_MMAP_OFFSET, drm_panthor_bo_mmap_offset, ioctl::RENDER_ALLOW, TyrDrmFileData::bo_mmap_offset),
     }
 }
 
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 8fccb42ab9e56..db57df68449cd 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -242,6 +242,100 @@ pub(crate) fn vm_get_state(
             Ok(0)
         })
     }
+
+    pub(crate) fn bo_create(
+        ddev: &TyrDrmDevice<Registered>,
+        reg_data: &TyrDrmRegistrationData<'_>,
+        bocreate: &mut uapi::drm_panthor_bo_create,
+        file: &TyrDrmFile,
+    ) -> Result<u32> {
+        if bocreate.size == 0 || bocreate.pad != 0 {
+            dev_dbg!(
+                ddev.as_ref(),
+                "Invalid BO_CREATE params: size={}, pad={}\n",
+                bocreate.size,
+                bocreate.pad
+            );
+            return Err(EINVAL);
+        }
+
+        let no_mmap = uapi::drm_panthor_bo_flags_DRM_PANTHOR_BO_NO_MMAP;
+        let wb_mmap = uapi::drm_panthor_bo_flags_DRM_PANTHOR_BO_WB_MMAP;
+        let valid_flags = no_mmap | wb_mmap;
+
+        if bocreate.flags & !valid_flags != 0 {
+            dev_dbg!(
+                ddev.as_ref(),
+                "Invalid BO_CREATE flags: {:#x}\n",
+                bocreate.flags
+            );
+            return Err(EINVAL);
+        }
+        if bocreate.flags & no_mmap != 0 && bocreate.flags & wb_mmap != 0 {
+            dev_dbg!(ddev.as_ref(), "BO_CREATE: NO_MMAP conflicts with WB_MMAP\n");
+            return Err(EINVAL);
+        }
+
+        if bocreate.exclusive_vm_id != 0 {
+            dev_dbg!(ddev.as_ref(), "BO_CREATE: exclusive_vm_id not supported\n");
+            return Err(EOPNOTSUPP);
+        }
+
+        let size = usize::try_from(bocreate.size).map_err(|_| {
+            dev_dbg!(
+                ddev.as_ref(),
+                "BO_CREATE size {:#x} too large\n",
+                bocreate.size
+            );
+            EINVAL
+        })?;
+        let bo = file.inner_with(|pfile| {
+            crate::gem::new_object(
+                ddev,
+                pfile.reg.pdev.as_ref(),
+                size,
+                bocreate.flags,
+                reg_data.coherent,
+            )
+        })?;
+        bocreate.handle = bo.create_handle(file)?;
+        bocreate.size = u64::from_safe_cast(bo.size());
+
+        Ok(0)
+    }
+
+    pub(crate) fn bo_mmap_offset(
+        ddev: &TyrDrmDevice<Registered>,
+        _reg_data: &TyrDrmRegistrationData<'_>,
+        bommap: &mut uapi::drm_panthor_bo_mmap_offset,
+        file: &TyrDrmFile,
+    ) -> Result<u32> {
+        if bommap.pad != 0 {
+            dev_dbg!(
+                ddev.as_ref(),
+                "BO mmap offset pad not zero: {}\n",
+                bommap.pad
+            );
+            return Err(EINVAL);
+        }
+
+        let bo = crate::gem::lookup_handle(file, bommap.handle).inspect_err(|_| {
+            dev_dbg!(ddev.as_ref(), "Invalid BO mmap handle: {}\n", bommap.handle);
+        })?;
+        if bo.flags() & uapi::drm_panthor_bo_flags_DRM_PANTHOR_BO_NO_MMAP != 0 {
+            dev_dbg!(ddev.as_ref(), "BO mmap offset on NO_MMAP object\n");
+            return Err(EPERM);
+        }
+        bommap.offset = bo.create_mmap_offset().inspect_err(|_| {
+            dev_err!(
+                ddev.as_ref(),
+                "Failed to create mmap offset for handle {}\n",
+                bommap.handle
+            );
+        })?;
+
+        Ok(0)
+    }
 }
 
 fn vm_bind_exec_op(vm: &Vm<'_>, file: &TyrDrmFile, op: &VmBindOp) -> Result {
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 55e2d67b96d98..d2ef121c8b1b6 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -45,7 +45,6 @@ pub(crate) struct BoData {
 
 impl BoData {
     /// Returns the flags the BO was created with.
-    #[expect(dead_code)]
     pub(crate) fn flags(&self) -> u32 {
         self.flags
     }
@@ -83,7 +82,6 @@ pub(crate) fn should_map_wc(coherent: bool, flags: u32) -> bool {
 }
 
 /// Create a new GEM buffer object.
-#[expect(dead_code)]
 pub(crate) fn new_object(
     ddev: &TyrDrmDevice,
     pdev: &Device<Bound>,

-- 
2.43.0


