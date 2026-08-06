Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E675A3A7F6E;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036196; cv=none; b=tjAcnzGBPDj4RwnZY9uZW5RR/c9Dr9PT1b3pDR2/sQFINy36nwVJzapJViVAA5uG5Vh6PVqAYdp19tAN0gk+PZeVk1DY9vWceHfqx6EW5vJWnkMLWpKnL+/DPZiswn4pZaihsFC7FaSZFpzverMllkJfJsSm8EbmH1oHCcQ3Cqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036196; c=relaxed/simple;
	bh=QHl4zF104FjEJv5EfdoTh+Dh51gSw1NGDy/nsEhLv34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aoHQgzsVFnXXZGds8b9EYzvAWOP2tMIpOI65EXz53NhZ13Uc5u0R9auqcm5Uka9APgSukb9dVDa/MNraTc0et2TMnTWwWZDtYljXiWsAW8HBOs1Nfp0piQwEac4ZWjVn6mhH5JX4wLfdjr5nvYZqZWaD9jd08Byq9Ihpc94opwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c7nGzpCG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c7nGzpCG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3178C2BCF7;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1786036195; bh=QHl4zF104FjEJv5EfdoTh+Dh51gSw1NGDy/nsEhLv34=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c7nGzpCG4HP0eMzipChrBvI8RvpbuY9GEOT7K9O+5/hjdm6BaQSl3MRLh/u1hTh/2
	 8lD8mVffWrgqt4UwcvBG9aW0LF9HZo73WuK8GstPLRqRh2m01n4qspo07ndnD8yY6D
	 ECeSpqOKflVkqBfSwmGMWNQVAIZCEl52Vk8m11w4=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8A1C5AC80;
	Thu,  6 Aug 2026 17:09:55 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 07 Aug 2026 01:07:30 +0800
Subject: [PATCH v3 8/8] drm/tyr: add gpuvas debugfs file
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-tyr-debugfs-v2-v3-8-ff5595ac66ae@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786036192; l=2935;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=QHl4zF104FjEJv5EfdoTh+Dh51gSw1NGDy/nsEhLv34=;
 b=EDW+LINfipfjQN40BZXGiBJkys+ojiHl56VY5LRMvBSzMZqZ0CzU2sJ5et2gOdpgT3surAqHC
 jpT5U223SjcBunTKuYhnu03wROWdcR8/GWF+Ulr6NbP3VqA8N8F6rL+
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add a gpuvas debugfs file listing all GPU VAs for the Tyr DRM driver.
Collects VMs into a shared list during firmware init and renders them
via dump_gpuva_info on read.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 drivers/gpu/drm/tyr/debugfs.rs | 20 ++++++++++++++++++++
 drivers/gpu/drm/tyr/driver.rs  | 10 ++++++++++
 drivers/gpu/drm/tyr/tyr.rs     |  1 +
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/tyr/debugfs.rs b/drivers/gpu/drm/tyr/debugfs.rs
new file mode 100644
index 0000000000000..0e93c629829cd
--- /dev/null
+++ b/drivers/gpu/drm/tyr/debugfs.rs
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! Debugfs support for the Tyr DRM driver.
+
+use kernel::{
+    debugfs::SeqShow,
+    prelude::*,
+    seq_file, //
+};
+
+use crate::driver::TyrDrmRegistrationData;
+
+/// `SeqShow` implementation for the `gpuvas` debugfs file.
+pub(crate) struct GpuvasShow;
+
+impl SeqShow<TyrDrmRegistrationData<'_>> for GpuvasShow {
+    fn show(reg_data: &TyrDrmRegistrationData<'_>, m: &seq_file::SeqFile) -> Result {
+        reg_data.vm_registry.for_each(|vm| vm.dump_gpuva_info(m))
+    }
+}
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index f26c3bb332e70..20be2dafa8421 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -7,6 +7,7 @@
         Clk,
         OptionalClk, //
     },
+    debugfs,
     device::{
         Bound,
         Core,
@@ -45,6 +46,7 @@
 };
 
 use crate::{
+    debugfs::GpuvasShow,
     file::TyrDrmFileData,
     fw::{
         irq::{
@@ -87,6 +89,9 @@ pub(crate) struct TyrDrmRegistrationData<'drm> {
     /// Firmware sections.
     pub(crate) fw: Arc<Firmware<'drm>>,
 
+    /// VM registry, used by debugfs to enumerate GPU VA spaces.
+    pub(crate) vm_registry: Arc<VmRegistry<'drm>>,
+
     #[pin]
     clks: Mutex<Clocks>,
 
@@ -198,6 +203,7 @@ fn probe<'bound>(
         let reg_data = pin_init!(TyrDrmRegistrationData {
                 pdev,
                 fw: firmware,
+                vm_registry: registry,
                 clks <- new_mutex!(Clocks {
                     core: core_clk,
                     stacks: stacks_clk,
@@ -252,6 +258,10 @@ impl drm::Driver for TyrDrmDriver {
     kernel::declare_drm_ioctls! {
         (PANTHOR_DEV_QUERY, drm_panthor_dev_query, ioctl::RENDER_ALLOW, TyrDrmFileData::dev_query),
     }
+
+    fn debugfs_init(dir: &debugfs::ScopeRef<'_, TyrDrmRegistrationData<'_>>) {
+        dir.seq_file::<GpuvasShow>(c"gpuvas");
+    }
 }
 
 struct Clocks {
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index e7ec450bdc9c0..6eb13c15d1657 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -7,6 +7,7 @@
 
 use crate::driver::TyrPlatformDriver;
 
+mod debugfs;
 mod driver;
 mod file;
 mod fw;

-- 
2.43.0


