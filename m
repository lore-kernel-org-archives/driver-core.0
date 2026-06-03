Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA40D1429D;
	Wed,  3 Jun 2026 01:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450083; cv=none; b=Wy+IwLhFmdhkK7BGsEZWcjdymfKUF3itTkOsjUOaVmikfbQlwe8OtoqP7swa6PSJRfW1Ji5jljIxwH1jgHX9tt/R+v8CtDMxTo8nKp/IgPzzlBjU01pQ/pWAREv7DGj2DAerwglwR7BYoY1LOiOsd9AvfnWeDAOHa/mS5bfXnVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450083; c=relaxed/simple;
	bh=cXxNJK2Xuff/MabnWTvB1SqsWHxb7RgpicRRvpU5AL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VduHpo+sKcdQKtIwbtuTE09oADnx9r8gH5vKptIF8p9xrcGW3JvheVsyn6MvYqpQVwunDEC1XleMj0RNyiKD0nWZkS75FuyHzRR6OkmBfalJGS0I49Pt5Mm1HY90CEWl6a+ixQLsrDFRjgeGeMLNFT9VyQCpamIb9KkJvNzH4uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfsnbHR+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfsnbHR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639231F0089A;
	Wed,  3 Jun 2026 01:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450082;
	bh=Zroeszp4iFiTtbrqGQ6aWtPmjlPL9U1c0ijXSEdtli8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OfsnbHR+n7fVCFsU4Ts5JkkOu5udMu+qsP0NghIl22mNv9MOfb0w4EI9KY96dIEFD
	 OGkeC/s862AIxRbgaGketzY51C++dDKvhgc2IC90LyQ89k/Bg27BbJyUIyObr6WpTw
	 Vd/CFQUmUHwVSRHhb7yKzc+6V62XQsH/WM8xIP1BLhFcKzGJc/Nuq4MrpeMhyETYfk
	 lVby0B0wr6TBt0DxkBiYQzocRfs1JiASj2bgKOzpOP/E2hWNXmY7Q57atD7Qg1+VgD
	 zIrIHYcQ3UiAxAYT6sPDS8XFt96yvrgRaFvgHZLel016LylaGmoC4a2mB1AP0Ljac3
	 JM4HlqTBtCqow==
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
	boris.brezillon@collabora.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 1/7] rust: drm: Add Driver::ParentDevice associated type
Date: Wed,  3 Jun 2026 03:15:43 +0200
Message-ID: <20260603011711.2077361-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603011711.2077361-1-dakr@kernel.org>
References: <20260603011711.2077361-1-dakr@kernel.org>
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
index 477cf771fb10..858272fc2164 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -208,7 +208,10 @@ const fn compute_features() -> u32 {
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
         let layout = Kmalloc::aligned_layout(Layout::new::<Device<T, Uninit>>());
@@ -225,7 +228,7 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<S
         // - `dev` is valid by its type invarants,
         let raw_drm: *mut Device<T, Uninit> = unsafe {
             bindings::__drm_dev_alloc(
-                dev.as_raw(),
+                dev.as_ref().as_raw(),
                 &alloc_vtable,
                 layout.size(),
                 mem::offset_of!(Device<T, Uninit>, dev),
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

