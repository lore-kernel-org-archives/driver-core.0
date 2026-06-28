Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574F33B27F0;
	Sun, 28 Jun 2026 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658536; cv=none; b=BheGMNbDVMUG82Xt8oAbeDFQGzo9sdR/k3XRv2Q4JqE8FPJfJeDwbOQO1LC+B838tw+hwDhN8ngmFUPwSooXUDB+iggu3FzDaPfRLYJlJl4vUZZMWJIfWVYKvmk5v5vfacc/LSYp8XqT+fVPLa7KJ394r7OH0puPabTxCYQ7a2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658536; c=relaxed/simple;
	bh=YD3o9OzyCUmfnsPcmCkY5mUagsUrbYKjH4nwSMicCF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQKHfISsO1//Tmx5YpxD+lrC38M8OdAdB7riDoM+sQHVwDKtJU1ZGGR/4+ld4/ncKonaPwy469R9IqhqqrtE4iINnQuIzfjepf+T1zQ1aFZOp1Plbfo4P5/ECflJ8ijk3W64itRAtbeXLIZFZm5QBE37pP4ZfC6QbttCsaSVji4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdLIaW2D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdLIaW2D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9281F000E9;
	Sun, 28 Jun 2026 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658535;
	bh=uMm8F5rJDzXasV8CQirEBISfvAruKBnGmjcz8vuPhB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DdLIaW2DBwwK/hwCyyoKvAo0ywFilQd3eNKVoTcPQSwMp1D7KBv212sLVupWFZTed
	 6IwTw7RtCdPXKqjEelGI06UZHEYN3kISMgbHGcVNdmx6gQlZ0PX2TJDoLIEi2Z+low
	 9erXrwfQhPt88m+vrKqb7hlHKM3JDVGWWDiSh8YqJ7Jy92kwc6KuuCBGk8+GbWRea+
	 efjRF+ddTX5++/vSkAEDrg/bcxkdKsTP9pbGy4x1BqjJb5XVYLNeyk5Tlc8ar1btXq
	 zC/voNolnAHeOfGpvalpedcaPnfoOkTqSWC4gCcNDtisAHiXRVmlAlBqAJhM3vG3Xe
	 XDoj30D0Ea4EA==
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
Subject: [PATCH v5 19/19] drm: nova: Use drm::Device<Registered> to access the parent bus device
Date: Sun, 28 Jun 2026 16:53:39 +0200
Message-ID: <20260628145406.2107056-20-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628145406.2107056-1-dakr@kernel.org>
References: <20260628145406.2107056-1-dakr@kernel.org>
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

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/driver.rs | 11 ++---------
 drivers/gpu/drm/nova/file.rs   |  7 ++++---
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index bd2a55405db8..739690bc2db5 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -29,11 +29,6 @@ pub(crate) struct Nova<'bound> {
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
@@ -64,9 +59,7 @@ fn probe<'bound>(
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
@@ -80,7 +73,7 @@ fn probe<'bound>(
 
 #[vtable]
 impl drm::Driver for NovaDriver {
-    type Data = NovaData;
+    type Data = ();
     type RegistrationData<'a> = ();
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

