Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699819;
	b=cw0KC67IBCoHbfbvRig45XfiNmBMLjKbfBCdsRiSJhACJXGreonCxyNPpOu7pl7+Nq22
	 2+0EvdLqQXiNO4CErHN2FNW5xBoUiUr5aJDiqKnKXE8Y+2ceXEdhPFOEpoKyqqr4gEJi6
	 Qy3ncosSrzWUxmYoDFOrVZ12l/byEKJQeXeAjwSI1NbBBsZzi+RHAv0YiivGaJLmAkyFb
	 50JL2H+0sW7B3MUuSJ8xMwNvqDS1qdCWUajV+vt0XgiW7FN0/Fw62AqOOFgrsK7TxnTh/
	 3F6mvknbKgZVWGXHEkxbpi4dM9+tMkFc74LT6mSXJcPXO9S4yRCzXLr8GNIx23lsxuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699819;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VgPgzRBTEZawyAypOvRkCasEHHDXiWmJn4tANhssVTA=;
	b=TENEn5c47pSjDFEeVSEZR8R0dIAsdc78Aiwxa13j4UdzCuMN5SyFlcEY9yG0oijVzgfK
	 vwE4DNijWhGKRK1JwQ5llxLL57iYLqUIu0sUxAMGQkiHJJvch2UQWlsAAmfNr8yORqX5N
	 33wT88kYkua8fHUWo9mhjyZ3bDIp+IPUr/VbpMYsLgnmnVfhcn3ZlHbN1FPHPvapTFRXi
	 eqn6ig6FkGhSE99Gdp9DUdn8XOJub6BjDMuZJ4OGzwiRQodqZ25vJCLFnYTB/MDbWtcm+
	 hYkkCqySJwQi9SydtJNlRaK3tiWk9I2syze6NrzmqztiSi6C1FXDiw8xA1+2+sThHgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYUUchTe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1D0606A329;
	Sat, 14 Nov 2026 23:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYUUchTe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6A91F000C4;
	Sat, 14 Nov 2026 23:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794699818;
	bh=VgPgzRBTEZawyAypOvRkCasEHHDXiWmJn4tANhssVTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YYUUchTePltL7ctXo3UyBJwQZRaLgGaxWl6b/xU66mKxT/3Uyr5aXyJKxhEZVtuas
	 RicjkwvvtmUpPwOCMSWDP69B4kQCIAOr54k0NfWxi9k1FX8qCAoCtLKWWzdDMp6tEQ
	 8RnR/a3q4vjahDz+0bjd3SV+ZJmpc9PohVkkAjBvOnGxsOfJnvclpdRpECLpqIdmKV
	 RsQKjhqRZQrrMufCAL2M5CTxNJ82ZQqwZJfnZRKAiU0FxzGDyGRp55M2v4WVRDMg0H
	 /MTZCIu3BAct3i3ZMAU1z6yU0oZq1UML8TQJhHmfR+n4PJLRB2yhtUWSLimzOFOJum
	 IrJN2RAhs0uSQ==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev
Cc: driver-core@lists.linux.dev,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 2/2] gpu: nova-core: remove unnecessary firmware pin-init
Date: Sun, 15 Nov 2026 00:42:54 +0100
Message-ID: <20261114234324.82387-2-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234324.82387-1-dakr@kernel.org>
References: <20261114234324.82387-1-dakr@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that SGTable no longer requires pinning, remove the pin-init
machinery from Radix3 and GspFirmware.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/firmware/gsp.rs    | 43 +++++--------
 drivers/gpu/nova-core/firmware/radix3.rs | 82 +++++++++++-------------
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 3 files changed, 56 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 341a8b19aa38..ff92a12b2994 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -25,10 +25,8 @@
 };
 
 /// The GSP firmware image, its signatures, and the GSP bootloader.
-#[pin_data]
 pub(crate) struct GspFirmware<'a> {
     /// The firmware image and the radix3 table that maps it.
-    #[pin]
     radix3: Radix3<'a>,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     pub(crate) signatures: Coherent<'a, [u8]>,
@@ -39,34 +37,27 @@ pub(crate) struct GspFirmware<'a> {
 impl<'a> GspFirmware<'a> {
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
-    pub(crate) fn new(
-        dev: &'a device::Device<device::Bound>,
-        chipset: Chipset,
-    ) -> impl PinInit<Self, Error> + 'a {
-        pin_init::pin_init_scope(move || {
-            let firmware = request_tlv(dev, chipset, "gsp")?;
-            let tlv = Tlv::new(firmware.data())?;
-            dev_dbg!(dev, "loaded gsp firmware v{}\n", tlv.get_string(b"VERS")?);
+    pub(crate) fn new(dev: &'a device::Device<device::Bound>, chipset: Chipset) -> Result<Self> {
+        let firmware = request_tlv(dev, chipset, "gsp")?;
+        let tlv = Tlv::new(firmware.data())?;
+        dev_dbg!(dev, "loaded gsp firmware v{}\n", tlv.get_string(b"VERS")?);
 
-            let size = usize::from_safe_cast(tlv.get_u32(b"SIZE")?);
-            let mut fw_vvec = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
+        let size = usize::from_safe_cast(tlv.get_u32(b"SIZE")?);
+        let mut fw_vvec = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
 
-            let chip_name = chipset.name();
-            let file = tlv.get_string(b"FILE")?;
-            let filename = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{file}"))?;
-            firmware::request_into_buf(&filename, dev, fw_vvec.as_mut_slice())?;
+        let chip_name = chipset.name();
+        let file = tlv.get_string(b"FILE")?;
+        let filename = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{file}"))?;
+        firmware::request_into_buf(&filename, dev, fw_vvec.as_mut_slice())?;
 
-            let signatures = Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?;
+        Ok(Self {
+            radix3: Radix3::new(dev, fw_vvec)?,
+            signatures: Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?,
+            bootloader: {
+                let bl = request_tlv(dev, chipset, "gsp_bootloader")?;
 
-            Ok(try_pin_init!(Self {
-                radix3 <- Radix3::new(dev, fw_vvec),
-                signatures,
-                bootloader: {
-                    let bl = request_tlv(dev, chipset, "gsp_bootloader")?;
-
-                    RiscvFirmware::new(dev, &bl)?
-                },
-            }))
+                RiscvFirmware::new(dev, &bl)?
+            },
         })
     }
 
diff --git a/drivers/gpu/nova-core/firmware/radix3.rs b/drivers/gpu/nova-core/firmware/radix3.rs
index a3e43fc8ec86..2c8787d5930d 100644
--- a/drivers/gpu/nova-core/firmware/radix3.rs
+++ b/drivers/gpu/nova-core/firmware/radix3.rs
@@ -32,60 +32,54 @@
 };
 
 /// A radix3 page table and the data it maps.
-#[pin_data]
 pub(crate) struct Radix3<'a> {
     /// The mapped data.
-    data: SGTable<Owned<'a, VVec<u8>>>,
-    /// Level 2: one entry per page of `data`.
-    level2: SGTable<Owned<'a, VVec<u8>>>,
-    /// Level 1: one entry per page of `level2`.
-    level1: SGTable<Owned<'a, VVec<u8>>>,
-    /// Level 0: one page, whose single entry is the DMA address of the first `level1` page.
+    _data: SGTable<Owned<'a, VVec<u8>>>,
+    /// Level 2: one entry per page of `_data`.
+    _level2: SGTable<Owned<'a, VVec<u8>>>,
+    /// Level 1: one entry per page of `_level2`.
+    _level1: SGTable<Owned<'a, VVec<u8>>>,
+    /// Level 0: one page, whose single entry is the DMA address of the first `_level1` page.
     level0: Coherent<'a, [u64]>,
-    /// Length of `data`, in bytes.
+    /// Length of `_data`, in bytes.
     size: usize,
 }
 
 impl<'a> Radix3<'a> {
     /// Builds a radix3 page table over `data`, mapped for `dev` to read. May sleep.
-    pub(crate) fn new(
-        dev: &'a device::Device<device::Bound>,
-        data: VVec<u8>,
-    ) -> impl PinInit<Self, Error> + 'a {
+    pub(crate) fn new(dev: &'a device::Device<device::Bound>, data: VVec<u8>) -> Result<Self> {
         let size = data.len();
 
-        pin_init::pin_init_scope(move || {
-            Ok(try_pin_init!(Self {
-                data: SGTable::new(dev, data, DataDirection::ToDevice, GFP_KERNEL)?,
-                level2: {
-                    let l2 = build_lvl(data)?;
-                    SGTable::new(dev, l2, DataDirection::ToDevice, GFP_KERNEL)?
-                },
-                level1: {
-                    let l1 = build_lvl(level2)?;
-                    SGTable::new(dev, l1, DataDirection::ToDevice, GFP_KERNEL)?
-                },
-                level0: {
-                    // Allocate the level 0 page table as a device-visible DMA object, and map the
-                    // level 1 page table onto it.
-
-                    // Fill level 1 page entry.
-                    let level1_entry = level1.iter().next().ok_or(EINVAL)?;
-                    let level1_entry_addr = level1_entry.dma_address();
-
-                    // Create level 0 page table data and fill its first entry with the level 1
-                    // table.
-                    let mut level0 = CoherentBox::<'_, [u64]>::zeroed_slice(
-                        dev,
-                        GSP_PAGE_SIZE / size_of::<u64>(),
-                        GFP_KERNEL,
-                    )?;
-                    level0[0] = level1_entry_addr.to_le();
-
-                    level0.into()
-                },
-                size,
-            }))
+        let data = SGTable::new(dev, data, DataDirection::ToDevice, GFP_KERNEL)?;
+
+        let l2 = build_lvl(&data)?;
+        let level2 = SGTable::new(dev, l2, DataDirection::ToDevice, GFP_KERNEL)?;
+
+        let l1 = build_lvl(&level2)?;
+        let level1 = SGTable::new(dev, l1, DataDirection::ToDevice, GFP_KERNEL)?;
+
+        // Allocate the level 0 page table as a device-visible DMA object, and map the
+        // level 1 page table onto it.
+
+        // Fill level 1 page entry.
+        let level1_entry = level1.iter().next().ok_or(EINVAL)?;
+        let level1_entry_addr = level1_entry.dma_address();
+
+        // Create level 0 page table data and fill its first entry with the level 1
+        // table.
+        let mut level0 = CoherentBox::<'_, [u64]>::zeroed_slice(
+            dev,
+            GSP_PAGE_SIZE / size_of::<u64>(),
+            GFP_KERNEL,
+        )?;
+        level0[0] = level1_entry_addr.to_le();
+
+        Ok(Self {
+            _data: data,
+            _level2: level2,
+            _level1: level1,
+            level0: level0.into(),
+            size,
         })
     }
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 4fb1b69ac9d5..ac09b40832aa 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -40,7 +40,7 @@ pub(crate) fn boot(
         let dev = pdev.as_ref();
         let hal = super::hal::gsp_hal(chipset);
 
-        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset), GFP_KERNEL)?;
+        let gsp_fw = GspFirmware::new(dev, chipset)?;
 
         self.cmdq
             .send_command_no_wait(commands::SetSystemInfo::new(pdev, chipset))?;
-- 
2.56.1

