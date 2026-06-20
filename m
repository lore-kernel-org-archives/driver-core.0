Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B281BD9D0;
	Sat, 20 Jun 2026 00:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781917151; cv=none; b=FeeNe4yRIz5deH8onQM7YtLcZZ4s6HuQIog8pnCCij+fFeL+gYIX2khtzWyagjWkXZyB5jgvQxd907l0ZYqAMoRBFoYuvdzSDmTaece1TyG6ksy2UTaumDfWazhGRMt/RNX97nRm8ovUZOVFPlhSVQtrgbhVq/bon6vDRpV/UW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781917151; c=relaxed/simple;
	bh=Zx6jQHge8sqUz9AvdLf24aB2gIXQUv1KWUra0QuDmFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecDqKqdlCbTTD95FTqUdWcEDBOwSKtk+yPamiyQuajMTl60HE/65/GgFdfNrXAupubOYtiGIctvJ2+jKuqHFeJhwCZcSeHeWb7DftIzXNB872vqA41FwZ2whDbbjzM3FvrJrdecKoaD7rYIDa8SQxzeslphADOpyLMZrT1Wf8eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/8z3Py1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/8z3Py1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA77B1F000E9;
	Sat, 20 Jun 2026 00:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781917149;
	bh=z2qcvpM3ZQNunW5DthaZVELDb7hwNEN84QegVeTGrEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P/8z3Py1O8qlsh+ZUEr67T9FjrGQPMxOfYY7juf9llMc8+kp4L7PQyO/TdQeJJHfq
	 60uMcu0uiHJJCZ+iKb0G2zHtfvBXcJzdSYDVemvd+wv/vTtdNo/pXyOrmpXJypUadi
	 wMGId9xZhddopcthmSzjHsfKNHatUATQl+wWOgl/Pk0gnjvOjdWsPxBbrBBxFYmTSY
	 4HO5QhkkMJiwFPlNRDvBvwHEHMCRDBjZ5dAkVzZJdSrTlq71jZeIhuj2M+mZiM6JcG
	 O5qBEqeJNBOJPIRzfsBnne1YUvm04U3c3WKIaubRzg/DVz733PKtixDrt3efZGQI+d
	 JXzDJidUW8yjw==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	ecourtney@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	deborah.brouwer@collabora.com,
	boris.brezillon@collabora.com,
	lyude@redhat.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 02/13] rust: drm: Add Driver::ParentDevice associated type
Date: Sat, 20 Jun 2026 02:51:14 +0200
Message-ID: <20260620005431.1562115-3-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620005431.1562115-1-dakr@kernel.org>
References: <20260620005431.1562115-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a ParentDevice associated type to the Driver trait, allowing each
DRM driver to declare its parent bus device type (e.g.
auxiliary::Device, platform::Device).

Change UnregisteredDevice::new() to take &T::ParentDevice<Bound>,
ensuring at the type level that the DRM device's parent matches the
declared bus device type.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/driver.rs | 8 ++++++--
 drivers/gpu/drm/tyr/driver.rs  | 6 ++++--
 rust/kernel/drm/device.rs      | 7 +++++--
 rust/kernel/drm/driver.rs      | 3 +++
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 48933d86ddda..c5b0313006bd 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -2,7 +2,10 @@
 
 use kernel::{
     auxiliary,
-    device::Core,
+    device::{
+        Core,
+        DeviceContext, //
+    },
     drm::{
         self,
         gem,
@@ -62,7 +65,7 @@ fn probe<'bound>(
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
-        let drm = drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
+        let drm = drm::UnregisteredDevice::<Self>::new(adev, data)?;
         let drm = drm::Registration::new_foreign_owned(drm, adev.as_ref(), 0)?;
 
         Ok(Nova { drm: drm.into() })
@@ -74,6 +77,7 @@ impl drm::Driver for NovaDriver {
     type Data = NovaData;
     type File = File;
     type Object<Ctx: drm::DeviceContext> = gem::Object<NovaObject, Ctx>;
+    type ParentDevice<Ctx: DeviceContext> = auxiliary::Device<Ctx>;
 
     const INFO: drm::DriverInfo = INFO;
 
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index d063bc664cc1..338c25ccc151 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -7,7 +7,8 @@
     },
     device::{
         Core,
-        Device, //
+        Device,
+        DeviceContext, //
     },
     dma::{
         Device as DmaDevice,
@@ -148,7 +149,7 @@ fn probe<'bound>(
                 gpu_info,
         });
 
-        let tdev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref(), data)?;
+        let tdev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, data)?;
         let tdev = drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), 0)?;
 
         let driver = TyrPlatformDriverData {
@@ -182,6 +183,7 @@ impl drm::Driver for TyrDrmDriver {
     type Data = TyrDrmDeviceData;
     type File = TyrDrmFileData;
     type Object<R: drm::DeviceContext> = drm::gem::shmem::Object<BoData, R>;
+    type ParentDevice<Ctx: DeviceContext> = platform::Device<Ctx>;
 
     const INFO: drm::DriverInfo = INFO;
     const FEAT_RENDER: bool = true;
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 5e91474e6dbb..23eb4c0a65ef 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -178,7 +178,10 @@ const fn compute_features() -> u32 {
     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
     ///
     /// This can be used to create a [`Registration`](kernel::drm::Registration).
-    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<Self> {
+    pub fn new(
+        dev: &T::ParentDevice<device::Bound>,
+        data: impl PinInit<T::Data, Error>,
+    ) -> Result<Self> {
         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
         // compatible `Layout`.
         let layout = Kmalloc::aligned_layout(Layout::new::<Device<T, Normal>>());
@@ -195,7 +198,7 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<S
         // - `dev` is valid by its type invarants,
         let raw_drm: *mut Device<T, Normal> = unsafe {
             bindings::__drm_dev_alloc(
-                dev.as_raw(),
+                dev.as_ref().as_raw(),
                 &alloc_vtable,
                 layout.size(),
                 mem::offset_of!(Device<T, Normal>, dev),
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 25f7e233884d..802e7fc13e30 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -116,6 +116,9 @@ pub trait Driver {
     /// The type used to represent a DRM File (client)
     type File: drm::file::DriverFile;
 
+    /// The bus device type of the parent device that the DRM device is associated with.
+    type ParentDevice<Ctx: device::DeviceContext>: device::AsBusDevice<Ctx>;
+
     /// Driver metadata
     const INFO: DriverInfo;
 
-- 
2.54.0

