Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8345371D11;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036195; cv=none; b=sU4FbA4PxUPjlwYGLibSVr3lU2KW60ny8AIId0wG30nZuo/QrxaxKOY9qNGCkXiOM5sUrDKGTUq2k5OXhDEmqUzNhNfmhOozBwwKmO/xLcJP8/e+dK93ghcEh5a18rVPjChlfVlQCpm71WE09+/ctwFMKd1QWguU9BBxPKatnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036195; c=relaxed/simple;
	bh=iSdF+luNjDPO6H6nxaSmDmulGRciqP5amMZxLEHVmtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joEloEMzYC9HfbyDGzv9Q98ahnfW3wlVR2sY/RO1Lj2Oz5LItxy7cOiINfquVIE6SIm35UJXmHXIeTRjzoynWvpjzXNTNxXcyNK8oDdOPnYsiE/EbdClUmOIjWuVMSutsf6NwsIF6+JMmjLhJAPS4DWnWYk8smAntlnUs/K+1OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WQYihOQp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WQYihOQp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77ED7C2BD00;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1786036195; bh=iSdF+luNjDPO6H6nxaSmDmulGRciqP5amMZxLEHVmtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WQYihOQpr9OUCtrDKYyegWaCG31o7Hd9BwYQaMAbaZhkvCJluV7Mtaggn64YttYaT
	 4HAM2wJipbB239CAz/NY6yj7hMy3VWEmlNyYB3BANXJPSPGb80dZ/x4I9JvpOfjPtd
	 OEtmzz6IdLclICEO0sD9ulm/x1n0hZy/epox3Tv4=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6251EC5AC9E;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 07 Aug 2026 01:07:27 +0800
Subject: [PATCH v3 5/8] rust: drm: add debugfs_init callback to Driver
 trait
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-tyr-debugfs-v2-v3-5-ff5595ac66ae@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786036192; l=3893;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=iSdF+luNjDPO6H6nxaSmDmulGRciqP5amMZxLEHVmtk=;
 b=ZldjwIosw8T4AUAs13rIIp40Yo3Ta8eNDnAr5ngOYS3vLm3zkVA0mRb6DELoNVnG9fQKRfVeV
 YHc+XGZHlN/C8qSLi2v8IH7x7tqE7y07/E9u9bfQ6PXd/pxmR1sCYWx
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add debugfs_init method to the Driver trait, enabling Rust DRM drivers
to populate debugfs entries during device registration.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/drm/device.rs | 41 ++++++++++++++++++++++++++++++++++++++++-
 rust/kernel/drm/driver.rs | 11 +++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 7a3a0e21e9557..35fd514fec274 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -7,6 +7,7 @@
 use crate::{
     alloc::allocator::Kmalloc,
     bindings,
+    debugfs,
     device,
     drm::{
         self,
@@ -170,7 +171,7 @@ const fn compute_features() -> u32 {
         release: Some(Device::<T>::release),
         master_set: None,
         master_drop: None,
-        debugfs_init: None,
+        debugfs_init: Some(Device::<T>::debugfs_init_callback),
 
         gem_create_object: T::Object::ALLOC_OPS.gem_create_object,
         prime_handle_to_fd: T::Object::ALLOC_OPS.prime_handle_to_fd,
@@ -353,6 +354,44 @@ extern "C" fn release(ptr: *mut bindings::drm_device) {
         unsafe { core::ptr::drop_in_place(this) };
     }
 
+    /// C callback for `drm_driver.debugfs_init`.
+    ///
+    /// # Safety
+    ///
+    /// The DRM core guarantees that `minor` is valid and non-null, that
+    /// `minor->dev` is a valid `drm_device` embedded in a `Device<T>`.
+    unsafe extern "C" fn debugfs_init_callback(minor: *mut bindings::drm_minor) {
+        // SAFETY: `minor` is valid and non-null per the function's safety
+        // precondition.
+        let dev_ptr = unsafe { (*minor).dev };
+        // SAFETY: `minor` is valid per the function's safety precondition.
+        let debugfs_root = unsafe { (*minor).debugfs_root };
+
+        // Debugfs may be disabled.
+        if debugfs_root.is_null() {
+            return;
+        }
+
+        // SAFETY: `dev_ptr` points to a valid `drm_device` embedded in
+        // `Device<T>`.
+        let dev = unsafe { Self::from_raw(dev_ptr) };
+
+        // SAFETY: The device is in the registered state per the function's
+        // safety precondition.
+        let dev = unsafe { dev.assume_ctx::<Registered>() };
+
+        dev.registration_data_with(|reg_data| {
+            // SAFETY: `debugfs_root` is valid as long as the DRM device is
+            // registered. The debugfs proxy fops wait for in-progress file
+            // operations and block new ones during `debugfs_remove()`, so no
+            // access to `reg_data` can outlive it. `debugfs_remove()` runs
+            // before `Registration::drop` frees `reg_data`.
+            let dir = unsafe { debugfs::ScopeRef::new(debugfs_root, reg_data) };
+
+            T::debugfs_init(&dir);
+        });
+    }
+
     /// Change the [`DeviceContext`] for a [`Device`].
     ///
     /// # Safety
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 08b2a318cf02a..f850b11fd5c53 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -6,6 +6,7 @@
 
 use crate::{
     bindings,
+    debugfs,
     device,
     drm,
     error::to_result,
@@ -138,6 +139,16 @@ pub trait Driver {
     /// usable from the render node (i.e. marked DRM_RENDER_ALLOW), whereas
     /// userspace processes using the master node can invoke any ioctl.
     const FEAT_RENDER: bool = false;
+
+    /// Populates debugfs for this DRM device.
+    ///
+    /// Called by the DRM core during registration. The `ScopeRef` provides
+    /// access to the device's `RegistrationData` for creating debugfs files.
+    fn debugfs_init(_dir: &debugfs::ScopeRef<'_, Self::RegistrationData<'_>>)
+    where
+        Self: Sized,
+    {
+    }
 }
 
 /// The registration type of a `drm::Device`.

-- 
2.43.0


