Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D643382DC;
	Thu,  7 May 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146723; cv=none; b=GvCo1hOTGP2lQR9Y76ybxJk89rq7RD11geob4Qif5QREH6nZl0RSku5ZK8wHulijcLdg3w5/2Pn6ZA+NievsnMSp1TrFV1phlAEwM5rQ7vS2q3+AVFnjJdRv3uKvZ8lrolS/Ac7i8fuedmoEZwW60fz3E6mkXESKIpE+jCB+mKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146723; c=relaxed/simple;
	bh=DvD76aFmCt2GC/uZefcoafjwhsL5EVU4lW7EN5Ht7tI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=MZhft81itDF3bzUJGw6cb/2rkcg0dWzBD0Fa4u675o3xUTnosuorBo2qtZeXmHabbHfTvobnh+fRZi2NL6sl1q5d3or2KBCROqC+NsB4Ml1cAZ0RotyYkQr9xpaIkaJizp/4CWumj0IJrNfylkVhaBdTMLXyxv4hEkxz/c41hkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFoxxygs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFoxxygs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100A5C2BCB2;
	Thu,  7 May 2026 09:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778146723;
	bh=DvD76aFmCt2GC/uZefcoafjwhsL5EVU4lW7EN5Ht7tI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=TFoxxygss1xmYKvr5Yl0Mlyh8FFREIYwn4eS+gPc4rXa+E2aCMgzYR0lAuv8tG4Or
	 OD89+AUN+OhXFJhMfhsgaFA6G/+2a0KpEt0ivyh13nZovMvXPU1rARsyg4uL//NQF6
	 b2olgUCjOFTsdrdqfeGay6rXSUlKqD01apnxFFUVRpYsBgVwsT7tSh9/t0x5n8xAdm
	 5jbMRATlbYvNYEVGd7Dy72VRbXludcRoBHF6Fz0Ar+PHXeGF2WixwCNvNtdOpu/RaU
	 Smjex2scdFA4O3x6Tadz91h2CDKp44ZGqMP815Ur2qM7SNTDNxpc8+HuNdVlc7gZyR
	 pNfE12Gfvha3w==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 11:38:37 +0200
Message-Id: <DICCEKZ3HU84.34ES3SW3D1FNI@kernel.org>
Subject: Re: [PATCH 0/6] rust: drm: Higher-Ranked Lifetime private data
Cc: <aliceryhl@google.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <daniel.almeida@collabora.com>, <acourbot@nvidia.com>,
 <apopple@nvidia.com>, <ecourtney@nvidia.com>, <lyude@redhat.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: <deborah.brouwer@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260506221027.858481-1-dakr@kernel.org>
In-Reply-To: <20260506221027.858481-1-dakr@kernel.org>

On Thu May 7, 2026 at 12:05 AM CEST, Danilo Krummrich wrote:
> Danilo Krummrich (6):
>   rust: drm: Add Driver::ParentDevice associated type
>   rust: drm: Add UnbindGuard for drm_dev_enter/exit critical sections
>   rust: drm: Add RegistrationData to drm::Driver
>   rust: drm: Wrap ioctl dispatch in UnbindGuard
>   rust: drm: Pass registration data to ioctl handlers
>   rust: drm: Pass bound parent device to ioctl handlers

Deborah, following up on your question in the other thread, this is roughly=
 how
you'd use this in Tyr.

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 7ac3707823b6..447e53c0eecf 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -37,13 +37,17 @@
     regs, //
 };

-pub(crate) type IoMem =3D kernel::io::Mmio<SZ_2M>;
+pub(crate) type IoMem<'bound> =3D kernel::io::mem::IoMem<'bound, SZ_2M>;

 pub(crate) struct TyrDrmDriver;

 /// Convenience type alias for the DRM device type for this driver.
 pub(crate) type TyrDrmDevice<Ctx =3D drm::Registered> =3D drm::Device<TyrD=
rmDriver, Ctx>;

+pub(crate) struct RegData<'bound> {
+    pub(crate) iomem: IoMem<'bound>,
+}
+
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrPlatformDriverData {
     _device: ARef<TyrDrmDevice>,
@@ -65,7 +69,7 @@ pub(crate) struct TyrDrmDeviceData {
     pub(crate) gpu_info: GpuInfo,
 }

-fn issue_soft_reset(dev: &Device<Bound>, iomem: &IoMem) -> Result {
+fn issue_soft_reset(dev: &Device<Bound>, iomem: &IoMem<'_>) -> Result {
     regs::GPU_CMD.write(iomem, regs::GPU_CMD_SOFT_RESET);

     poll::read_poll_timeout(
@@ -133,8 +137,10 @@ fn probe(
                 gpu_info,
         });

+        let reg_data =3D RegData { iomem };
+
         let tdev =3D drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, da=
ta)?;
-        let tdev =3D drm::driver::Registration::new_foreign_owned(tdev, pd=
ev.as_ref(), (), 0)?;
+        let tdev =3D drm::driver::Registration::new_foreign_owned(tdev, pd=
ev.as_ref(), reg_data, 0)?;

         let driver =3D TyrPlatformDriverData {
             _device: tdev.into(),
@@ -176,7 +182,7 @@ fn drop(self: Pin<&mut Self>) {
 #[vtable]
 impl drm::Driver for TyrDrmDriver {
     type Data =3D TyrDrmDeviceData;
-    type RegistrationData =3D ForLt!(());
+    type RegistrationData =3D ForLt!(for<'a> RegData<'a>);
     type File =3D TyrDrmFileData;
     type Object<R: drm::DeviceContext> =3D drm::gem::Object<TyrObject, R>;
     type ParentDevice<Ctx: DeviceContext> =3D platform::Device<Ctx>;
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 9f53da7633ab..30efdf924cc2 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -10,6 +10,7 @@
 };

 use crate::driver::{
+    RegData,
     TyrDrmDevice,
     TyrDrmDriver, //
 };
@@ -32,10 +33,12 @@ impl TyrDrmFileData {
     pub(crate) fn dev_query(
         ddev: &TyrDrmDevice,
         _pdev: &platform::Device<device::Bound>,
-        _reg_data: &(),
+        reg_data: &RegData<'_>,
         devquery: &mut uapi::drm_panthor_dev_query,
         _file: &TyrDrmFile,
     ) -> Result<u32> {
+        let _iomem =3D reg_data.iomem;
+
         if devquery.pointer =3D=3D 0 {
             match devquery.type_ {
                 uapi::drm_panthor_dev_query_type_DRM_PANTHOR_DEV_QUERY_GPU=
_INFO =3D> {
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index bb0473c85bf7..f169fb1ccc03 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -34,7 +34,7 @@
 pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);

 impl GpuInfo {
-    pub(crate) fn new(iomem: &IoMem) -> Self {
+    pub(crate) fn new(iomem: &IoMem<'_>) -> Self {
         let gpu_id =3D regs::GPU_ID.read(iomem);
         let csf_id =3D regs::GPU_CSF_ID.read(iomem);
         let gpu_rev =3D regs::GPU_REVID.read(iomem);
@@ -206,7 +206,7 @@ fn from(value: u32) -> Self {
 }

 /// Powers on the l2 block.
-pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &IoMem) -> Result {
+pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &IoMem<'_>) -> Resul=
t {
     regs::L2_PWRON_LO.write(iomem, 1);

     poll::read_poll_timeout(
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 0881b3812afd..2b0da6019512 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -20,12 +20,12 @@

 impl<const OFFSET: usize> Register<OFFSET> {
     #[inline]
-    pub(crate) fn read(&self, iomem: &IoMem) -> u32 {
+    pub(crate) fn read(&self, iomem: &IoMem<'_>) -> u32 {
         iomem.read32(OFFSET)
     }

     #[inline]
-    pub(crate) fn write(&self, iomem: &IoMem, value: u32) {
+    pub(crate) fn write(&self, iomem: &IoMem<'_>, value: u32) {
         iomem.write32(value, OFFSET);
     }
 }
