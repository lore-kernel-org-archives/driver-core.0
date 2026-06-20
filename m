Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCDB369234;
	Sat, 20 Jun 2026 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781981450; cv=none; b=ioPwEj/GJlpMGL+RXgJFauwHRRwz9KV04tKzkD2V6s5zzN5Kp8F5clnd96DudypyUIIfodmxpGGtw7Ld80qgpeXl/+2oGCK2tMlg1PVtOu8of0mOg8c/9weqyacu4erxY139vI7OGMbT+xwmikI/CyVmGAgCXFWD5tbl+/cneLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781981450; c=relaxed/simple;
	bh=e22K/YC4s94h/mvrEeQZ7H4FRSULed928JegRFBAsHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QuDAkkDxui9C8en5hK9YYdgExT2GkaExS9wtwGRfwxaaqh5P/shDoWAZ9Qv4YugeOxRWfKHNTLf9XKPtxvayfhGyJoJCLO7A0ogRToTTK1yTJzJtMG++7SmvyOD3b9x2H0WIE4fEb+ERWLM9bTTe5e8kzcxzk+NnVNz9FErp0oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnCPJi6j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnCPJi6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC9E1F000E9;
	Sat, 20 Jun 2026 18:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781981448;
	bh=0uIMdj24RIqH/QbXlggEkKnv+8TDDu+JVkTsWI9K8zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MnCPJi6jdKJM2p+Ap9kjp1QnEccAcEjNnimiaIh0DQdNI81T6YLhCdhB5H//GhR2V
	 0/gMlXoZbphDXc+Ib9Tmoc5l06ETEpGCaDItRxp1XvaPCdjmr3DqXqf6GIqL4EQpxf
	 5qGJbRbrKIBs1MnC1nr4j+folc2xOxq4iXtjf+OfwARgUktyGdjWEZMf33gLK4+9IG
	 ToxbjHG24UqioDmmSO1fCDlszZ9rB3NuKFi9xZs3PKpJomF4kkE0Vf6NZReLxEp/Mb
	 x3I/eL5fLlRAR1W03O7YqDuCZQplgbCtKCd3Y2gjO85LOE8zaVaYYpFRxkRosFz1Nh
	 kNKDmDVf+lK+g==
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
Subject: [PATCH v4 16/16] drm: nova: Use drm::Device<Registered> to access the parent bus device
Date: Sat, 20 Jun 2026 20:48:09 +0200
Message-ID: <20260620184924.2247517-17-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620184924.2247517-1-dakr@kernel.org>
References: <20260620184924.2247517-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The get_param ioctl needs access to the parent auxiliary device. Since
ioctl handlers run inside a RegistrationGuard, accept
&NovaDevice<Registered> to obtain &auxiliary::Device<Bound> via as_ref()
directly. This removes the need for drm::Device data, hence set it to
().

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/driver.rs | 11 ++---------
 drivers/gpu/drm/nova/file.rs   |  7 ++++---
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 131212df94d3..81df8158d83b 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -30,11 +30,6 @@ pub(crate) struct Nova<'bound> {
 /// Convienence type alias for the DRM device type for this driver
 pub(crate) type NovaDevice<Ctx = drm::Normal> = drm::Device<NovaDriver, Ctx>;
 
-#[pin_data]
-pub(crate) struct NovaData {
-    pub(crate) adev: ARef<auxiliary::Device>,
-}
-
 const INFO: drm::DriverInfo = drm::DriverInfo {
     major: 0,
     minor: 0,
@@ -65,9 +60,7 @@ fn probe<'bound>(
         adev: &'bound auxiliary::Device<Core<'_>>,
         _info: &'bound Self::IdInfo,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
-        let data = try_pin_init!(NovaData { adev: adev.into() });
-
-        let drm = drm::UnregisteredDevice::<Self>::new(adev, data)?;
+        let drm = drm::UnregisteredDevice::<Self>::new(adev, Ok(()))?;
         // SAFETY: `reg` is stored in `Nova` and dropped when the driver is unbound; it is
         // never forgotten.
         let reg = unsafe { drm::Registration::new(adev.as_ref(), drm, (), 0)? };
@@ -81,7 +74,7 @@ fn probe<'bound>(
 
 #[vtable]
 impl drm::Driver for NovaDriver {
-    type Data = NovaData;
+    type Data = ();
     type RegistrationData = ForLt!(());
     type File = File;
     type Object = gem::Object<NovaObject>;
diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index 208be4e38188..298c02bacb4b 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -4,6 +4,8 @@
 use crate::gem::NovaObject;
 use kernel::{
     alloc::flags::*,
+    auxiliary,
+    device::Bound,
     drm::{
         self,
         gem::BaseObject,
@@ -32,9 +34,8 @@ pub(crate) fn get_param(
         getparam: &mut uapi::drm_nova_getparam,
         _file: &drm::File<File>,
     ) -> Result<u32> {
-        let adev = &dev.adev;
-        let parent = adev.parent();
-        let pdev: &pci::Device = parent.try_into()?;
+        let adev: &auxiliary::Device<Bound> = dev.as_ref();
+        let pdev: &pci::Device<Bound> = adev.parent().try_into()?;
 
         let value = match getparam.param as u32 {
             uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
-- 
2.54.0

