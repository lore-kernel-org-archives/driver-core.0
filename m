Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7904DC55A;
	Tue,  3 Mar 2026 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555027; cv=none; b=i7obHoGYTzix7HlrCGAODrv6BWhydZ/Mn9WfiSh8W1SZJBSQgD85o/VXiOOcFBprS0OWYR6IjNhwr4EZo3mhpFTnrkwIRpetlMLPIeV7+atzY2zjZg5E1vJFgJU/s5dlYePjYhC9ej+xwezlf7GiqXeBYdFVSI07ookmm3Otyj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555027; c=relaxed/simple;
	bh=RRwlxYxwMBwbZCAUZL3IuCb0Hwkrc8JPcDDRIvn48Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmKZ85ioqy4lacDMVX3GBQdZBmapUiNGIhxF0Dvm3cxTmrHA8rf2FYJmpQxTU3b91C9+LaUTvlBZNdnSapLWrk824eHMAXDSibiMwzDQk+XqqZbQeF0Hg863n+8m8WJdqJUlRfEUaEPewti7CBVSuWmc3LM2C24KjTwjg8eqOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXJ+vRwp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXJ+vRwp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77E6C19425;
	Tue,  3 Mar 2026 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555026;
	bh=RRwlxYxwMBwbZCAUZL3IuCb0Hwkrc8JPcDDRIvn48Qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXJ+vRwpD+EC7R58rTnSZ/QZYMKFuXqSXO3N90797MlZ9vYi3KprMBIs8w+G2RZD+
	 2kN6PvgKj34HKMHJhIzKXtVaeylMgeF56kentZ9Z9C09Yg1O53lPcZYOVNxXr7gbi3
	 jINaPy0/1NcOm7jOt3Vh9vaMj3FWtgqTBZAhcgwyeOhi4Gbp5fRzxoJxG9C5pvGwSo
	 YXJSBpUDyzqSVWqFcWC8DvlGuWgBZTMkHljj0xCicQYs1BuGQTdLtBWf5gJCRyn+im
	 et4kuO34LXSpgiC2zi5PxvGiBDFsNw0H8/iNP6nKFYClKVa7pE27bJ9H2LB68qKy1s
	 ELA3SlfZZ+GNg==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com
Cc: driver-core@lists.linux.dev,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 6/8] gpu: nova-core: use Coherent::init to initialize GspFwWprMeta
Date: Tue,  3 Mar 2026 17:22:57 +0100
Message-ID: <20260303162314.94363-7-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303162314.94363-1-dakr@kernel.org>
References: <20260303162314.94363-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert wpr_meta to use Coherent::init() and simplify the
initialization.  It also avoids a separate initialization of
GspFwWprMeta on the stack.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gsp/boot.rs |  7 ++-----
 drivers/gpu/nova-core/gsp/fw.rs   | 20 +++++++++++++++-----
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 7f46fa5e9b50..1a4d9ee4f256 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -2,8 +2,7 @@
 
 use kernel::{
     device,
-    dma::CoherentAllocation,
-    dma_write,
+    dma::Coherent,
     io::poll::read_poll_timeout,
     pci,
     prelude::*,
@@ -155,9 +154,7 @@ pub(crate) fn boot(
             bar,
         )?;
 
-        let wpr_meta =
-            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(wpr_meta, [0]?, GspFwWprMeta::new(&gsp_fw, &fb_layout));
+        let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f1797e1f0d9d..751d5447214d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -131,7 +131,9 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 /// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
-pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
+pub(crate) struct GspFwWprMeta {
+    inner: bindings::GspFwWprMeta,
+}
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.
 unsafe impl AsBytes for GspFwWprMeta {}
@@ -144,10 +146,14 @@ unsafe impl FromBytes for GspFwWprMeta {}
 type GspFwWprMetaBootInfo = bindings::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
 
 impl GspFwWprMeta {
-    /// Fill in and return a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
+    /// Returns an initializer for a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
     /// `fb_layout` layout.
-    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
-        Self(bindings::GspFwWprMeta {
+    pub(crate) fn new<'a>(
+        gsp_firmware: &'a GspFirmware,
+        fb_layout: &'a FbLayout,
+    ) -> impl Init<Self> + 'a {
+        #[allow(non_snake_case)]
+        let init_inner = init!(bindings::GspFwWprMeta {
             // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC` unmodified.
             magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
             revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
@@ -182,7 +188,11 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
-            ..Default::default()
+            ..Zeroable::init_zeroed()
+        });
+
+        init!(GspFwWprMeta {
+            inner <- init_inner,
         })
     }
 }
-- 
2.53.0

