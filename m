Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE0A42B726
	for <driver-core@lists.linux.dev>; Thu, 14 May 2026 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771449; cv=none; b=mTwjYgaFk7xiBVKbVBi1YjM8LnlwgG9qcInXbNh7sc62vsQrNN7Po6oZ5efOiSQ5zU8PkpM/5HuE34Qvy6MoInRzaIKT4vVgEJVrvw/GdzGxiBGK2MAyIFLvr4ZBDsE3OGIMlqze6X0anK1upWL3gCoGPCsDiAxtc+BoGjWgYiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771449; c=relaxed/simple;
	bh=oH77PiL1cpVbCsomfXoCXl5xmvUBF/D51Ru9RKD4tSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clHVANKCi0ZLiop3lDolE861yhAEYrk7vjq+AnlqVlTM6eYmH7Z8PElPVs221t/Xj82iiJUcIfZ7seulwA65UbH8rWhiMo8Tn2T82LiAOUbxSt5jIJH3N7pl9faqF8l+D+ofcpyTkzvNxfiVJB65AjPxaptW0DW54Nd8AglSIAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W9VZh1gO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W9VZh1gO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67AFB244B;
	Thu, 14 May 2026 08:10:39 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.23.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AC103F836;
	Thu, 14 May 2026 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778771444; bh=oH77PiL1cpVbCsomfXoCXl5xmvUBF/D51Ru9RKD4tSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W9VZh1gOsr5o9Zs868dK+zq6z4BxQ+1pkH2KJ9Ocx2K+ESjLMRhsOO+ZSlTcViqUW
	 3/px2u88PMdC6BSzLUjoQVw/7DBDdMNk8rsE6VWEEW5bgPOZ6qW3buL1ahJs9OZzGX
	 nTIHVFB6nfJvvqD0Nvw9MzXNDth+WWxbnbspA+2A=
From: Beata Michalska <beata.michalska@arm.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] [DO NOT MERGE] drm/tyr: wire runtime PM hooks
Date: Thu, 14 May 2026 17:09:05 +0200
Message-ID: <20260514150957.3501924-4-beata.michalska@arm.com>
In-Reply-To: <20260514150957.3501924-1-beata.michalska@arm.com>
References: <20260514150957.3501924-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for runtime PM.
Apply basic configuration and add suspend/resume hooks, ready for
future power-gating support.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 drivers/gpu/drm/tyr/driver.rs | 123 +++++++++++++++++++++++++++-------
 drivers/gpu/drm/tyr/file.rs   |   3 +
 2 files changed, 103 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 279710b36a10..cda3b7bcd352 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
 use kernel::{
+    bindings,
     clk::{
         Clk,
         OptionalClk, //
@@ -17,6 +18,7 @@
     new_mutex,
     of,
     platform,
+    pm::*,
     prelude::*,
     regulator,
     regulator::Regulator,
@@ -53,12 +55,12 @@ pub(crate) struct TyrPlatformDriverData {
 pub(crate) struct TyrDrmDeviceData {
     pub(crate) pdev: ARef<platform::Device>,
 
-    #[pin]
-    clks: Mutex<Clocks>,
-
     #[pin]
     regulators: Mutex<Regulators>,
 
+    /// Runtime PM context
+    pub(crate) pm_context: PMContext<TyrPlatformDriverData, kernel::pm::Active>,
+
     /// Some information on the GPU.
     ///
     /// This is mainly queried by userspace, i.e.: Mesa.
@@ -92,25 +94,23 @@ fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
 impl platform::Driver for TyrPlatformDriverData {
     type IdInfo = ();
     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+    const PM_OPS: Option<&'static bindings::dev_pm_ops> = Some(&PMContext::<Self>::PM_OPS);
 
     fn probe(
         pdev: &platform::Device<Core>,
         _info: Option<&Self::IdInfo>,
     ) -> impl PinInit<Self, Error> {
-        let core_clk = Clk::get(pdev.as_ref(), Some(c"core"))?;
-        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c"stacks"))?;
-        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c"coregroup"))?;
-
-        core_clk.prepare_enable()?;
-        stacks_clk.prepare_enable()?;
-        coregroup_clk.prepare_enable()?;
-
+        let pm_state = TyrRuntimeState::pm_init(pdev.as_ref())?;
         let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"mali")?;
         let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"sram")?;
 
         let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
         let iomem = Arc::pin_init(request.iomap_sized::<SZ_2M>(), GFP_KERNEL)?;
 
+        let pm_context = PMContext::new(pdev.as_ref(), None)?;
+        pm_context.apply_config(&[PMConfig::AutoSuspend(true),PMConfig::AutoSuspendDelay(300)])?;
+        pm_context.init_state(RuntimePMState::Active, Some(pm_state))?;
+
         issue_soft_reset(pdev.as_ref(), &iomem)?;
         gpu::l2_power_on(pdev.as_ref(), &iomem)?;
 
@@ -121,15 +121,11 @@ fn probe(
 
         let data = try_pin_init!(TyrDrmDeviceData {
                 pdev: platform.clone(),
-                clks <- new_mutex!(Clocks {
-                    core: core_clk,
-                    stacks: stacks_clk,
-                    coregroup: coregroup_clk,
-                }),
                 regulators <- new_mutex!(Regulators {
                     _mali: mali_regulator,
                     _sram: sram_regulator,
                 }),
+                pm_context: pm_context.enable()?,
                 gpu_info,
         });
 
@@ -152,13 +148,7 @@ fn drop(self: Pin<&mut Self>) {}
 
 #[pinned_drop]
 impl PinnedDrop for TyrDrmDeviceData {
-    fn drop(self: Pin<&mut Self>) {
-        // TODO: the type-state pattern for Clks will fix this.
-        let clks = self.clks.lock();
-        clks.core.disable_unprepare();
-        clks.stacks.disable_unprepare();
-        clks.coregroup.disable_unprepare();
-    }
+    fn drop(self: Pin<&mut Self>) {}
 }
 
 // We need to retain the name "panthor" to achieve drop-in compatibility with
@@ -196,3 +186,90 @@ struct Regulators {
     _mali: Regulator<regulator::Enabled>,
     _sram: Regulator<regulator::Enabled>,
 }
+
+pub(crate) struct TyrRuntimeState {
+    clks: Clocks,
+}
+
+impl TyrRuntimeState {
+    fn pm_init(dev: &'_ kernel::device::Device<kernel::device::Bound>) -> Result<Arc<Self>> {
+         let core_clk = Clk::get(dev, Some(c"core"))?;
+         let stacks_clk = OptionalClk::get(dev, Some(c"stacks"))?;
+         let coregroup_clk = OptionalClk::get(dev, Some(c"coregroup"))?;
+
+         core_clk.prepare_enable()?;
+         stacks_clk.prepare_enable()?;
+         coregroup_clk.prepare_enable()?;
+
+         Ok(Arc::new(
+             Self {
+                clks: Clocks {
+                     core: core_clk,
+                    stacks: stacks_clk,
+                    coregroup: coregroup_clk,
+                 }
+            },
+            GFP_KERNEL
+        )?)
+    }
+}
+
+#[vtable]
+impl PMOps for TyrPlatformDriverData {
+    type DriverDataType = TyrPlatformDriverData;
+    type DeviceType<'a> = &'a platform::Device;
+    type RuntimePayloadType = TyrRuntimeState;
+    type PMContextRef<'a> = &'a PMContext<TyrPlatformDriverData, Active>;
+
+    fn get_pmcontext(data: &Self::DriverDataType) -> Result<Self::PMContextRef<'_>> {
+        Ok(&data._device.pm_context)
+    }
+
+    fn runtime_suspend(
+        _dev:  Self::DeviceType<'_>,
+        data: Option<Arc<Self::RuntimePayloadType>>
+    ) -> Result<
+            Option<Arc<Self::RuntimePayloadType>>,
+            (Option<Arc<Self::RuntimePayloadType>>, kernel::error::Error)
+    > {
+        match data {
+            Some(state) => {
+                state.clks.core.disable_unprepare();
+                state.clks.stacks.disable_unprepare();
+                state.clks.coregroup.disable_unprepare();
+
+                Ok(Some(state))
+            }
+            None => {
+                pr_err!("Tyr: no runtime data\n");
+                Ok(None)
+            }
+        }
+    }
+
+    fn runtime_resume(
+        _dev: Self::DeviceType<'_>,
+        data: Option<Arc<Self::RuntimePayloadType>>
+    ) -> Result<
+            Option<Arc<Self::RuntimePayloadType>>,
+            (Option<Arc<Self::RuntimePayloadType>>, kernel::error::Error)
+    > {
+
+        match data {
+            Some(state) => {
+                let previous_state = Some(state.clone());
+                (|| {
+                    //@TODO: @FIXME: this needs to be able to unroll changes
+                    state.clks.core.prepare_enable()?;
+                    state.clks.stacks.prepare_enable()?;
+                    state.clks.coregroup.prepare_enable()?;
+
+                    Ok(Some(state))
+                }
+                )()
+                .map_err(|e| (previous_state, e))
+            },
+            None => Err((data, EINVAL)),
+        }
+    }
+}
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 31411da203c5..8256ce05fb6f 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -2,6 +2,7 @@
 
 use kernel::{
     drm,
+    pm::*,
     prelude::*,
     uaccess::UserSlice,
     uapi, //
@@ -32,6 +33,8 @@ pub(crate) fn dev_query(
         devquery: &mut uapi::drm_panthor_dev_query,
         _file: &TyrDrmFile,
     ) -> Result<u32> {
+        let _pm_scope = ddev.pm_context.get(Profile::new())?;
+
         if devquery.pointer == 0 {
             match devquery.type_ {
                 uapi::drm_panthor_dev_query_type_DRM_PANTHOR_DEV_QUERY_GPU_INFO => {
-- 
2.43.0

