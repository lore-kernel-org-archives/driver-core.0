Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE31D5CC9;
	Sat, 20 Jun 2026 00:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781917200; cv=none; b=TbkRZpuM2nYCoc1kWOkg7P9ehaGdvRdPyzksYori9sl1B6KQZV6SRaHfgrNOarfJ38riHVtZPLJn3fQ694F6Pm317EbX+OWslbMOSqivOe78D1bJ3VA6hxzuARypjqeFszEkYPGfwuHBnWEOO+CJ6+RWR6eY2xhRn8jPA0tdYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781917200; c=relaxed/simple;
	bh=jg5Ksuuku/c/aP17iXhr4AJE19Q2SMqJ9kR5JuLclew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebEsDDfPHozGksgJfZE5ecipNGT7RJkEUBVeCOTUd9a8f/GYLFNRcRwZ9Fc1WV9YmXAZHG5fXyQcaYr6c9guA2+ToJYywy+3gvaDWGKTldoptfGDVTJhip5nup62N6yOH45o3vJmQVnWt+I0ae81o5mSTi2C4n/iGuBg40XTsCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfs4BO3H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfs4BO3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444511F00A3A;
	Sat, 20 Jun 2026 00:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781917199;
	bh=kXEnwZ2kzXB5ckA55mlOUIcDkhGQPesnafeAN2RBfmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mfs4BO3HDnjbNckFX8C+i/62Rmf6+SmBZDTvI710/tbzpTNoVbtodu/GqWPyxNGMw
	 psayJl3wLo5yAGj+xZ1cTWxhR5RVvRnrp9naGp7ifjoZcfumD0DdJvJuqKmq1NUxht
	 wthP0yarTnbvJG5NhphWPBNYvyedb5XMpsA64zDBYYhiuIH0gVfJYIeeisRyB73tAY
	 d9XkZPChwuR91bGg/ZoLj/jJ+JtOp7g6X1Y/eIOYGq4LoqXfBFo7TENQz2/3iKNqNL
	 9NnHbQo/ORaJkubflz+9CR+LRR00s6ZdIX1za4zYcu5OJOe8BrhrSTD9ueDU1d2mN7
	 mG8yBXeTU+WMw==
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
Subject: [PATCH v3 13/13] drm: nova: Use drm::Device<Registered> to access the parent bus device
Date: Sat, 20 Jun 2026 02:51:25 +0200
Message-ID: <20260620005431.1562115-14-dakr@kernel.org>
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

The get_param ioctl needs access to the parent auxiliary device. Since
ioctl handlers run inside a RegistrationGuard, accept
&NovaDevice<Registered> to obtain &auxiliary::Device<Bound> via as_ref()
directly. This removes the need for drm::Device data, hence set it to
().

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/driver.rs | 11 ++---------
 drivers/gpu/drm/nova/file.rs   | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 14 deletions(-)

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
index 4c9fa409a8be..e0e79b571983 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -4,7 +4,13 @@
 use crate::gem::NovaObject;
 use kernel::{
     alloc::flags::*,
-    drm::{self, gem::BaseObject},
+    auxiliary,
+    device::Bound,
+    drm::{
+        self,
+        gem::BaseObject,
+        Registered, //
+    },
     pci,
     prelude::*,
     uapi,
@@ -23,14 +29,13 @@ fn open(_dev: &NovaDevice) -> Result<Pin<KBox<Self>>> {
 impl File {
     /// IOCTL: get_param: Query GPU / driver metadata.
     pub(crate) fn get_param(
-        dev: &NovaDevice,
+        dev: &NovaDevice<Registered>,
         _reg_data: &(),
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

