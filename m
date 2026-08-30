Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1ED30E0E5;
	Sun, 30 Aug 2026 19:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788118764; cv=none; b=J3R6mJFWOftnY9ngRH/21qi6dnn9t3bF9BJW+EH4LK7WQevO4TAJxXFVZcxfcDyekoY2wBB7rn5JBHgNEA4McA0wn/5zdMmYtnz4JV9MN6EuB3cd/SX0iMXcKX2PjHgFbZWcOsrqQulScQb7xgmrnCPOJde7enRF1cfNEbfBSJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788118764; c=relaxed/simple;
	bh=Bk77OQ+XO7DwxeKwSuQ7QLWo0FO77UFCvzsLBJ0lapo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tUi6JuiyhZEd5I7OmhvBAlQF6SHJzsY9Ya8j/HmyUw+MImaVFQD8EJ46aUqiv9lI1jvppy01+92Uqw2ANoGoe8avhgCF2wZ4MS48LjFHDv+M6ITfQ8Dbu8qamc5UZNXBTZ12l9tLH1kk1ZzIQ9guksDOjT0gzr47KmA2SmnYBqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxbKKmxU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxbKKmxU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0D31F00A3D;
	Sun, 30 Aug 2026 19:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788118762;
	bh=RupuevcnYIIoLY8dVsaKW8QE9RVHkxsAk8upTA88T3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AxbKKmxUZnqx/6L9yPI9ddEdcxzyhoWhQVKMLe2zFb1Fkq1iyhyFOhW3RpeXaD2ty
	 0VeYN7m9NM4xLLosCt5s6w0tRePONfO8N+iYawK2d2tfCNI/GRF782HuSwnZDf8FMc
	 yvkeTV08E510d9qw2oNOyKW2SU00CG8RKyH//BnpImWgtHHEHl2cR9OIZmnTVZlQa4
	 /CoOD4s0EHO6BB6DtY0bFo1M4INsjunNA9gw8TXGHoDp/zZxJo57CcW7+OzgDcWQn8
	 p/iAFs0djTeAWZFBAIYG7cIjsswOCBf+aOQCy1uIlf4viVHCEP0w1LV6GaBoUXutGp
	 vLvo85DwHNPSg==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	mmaurer@google.com
Cc: driver-core@lists.linux.dev,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 3/4] samples: rust_dma: separate driver type from driver data
Date: Sun, 30 Aug 2026 21:37:15 +0200
Message-ID: <20260830193824.471089-4-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830193824.471089-1-dakr@kernel.org>
References: <20260830193824.471089-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split DmaSampleDriver into a driver type and a separate DmaSampleData
struct for the driver's bus device private data, using
DmaSampleData<'bound> as the Driver::Data<'bound> associated type.

Store a &'bound pci::Device<Bound> reference instead of an
ARef<pci::Device>, tying the data to the device's bound scope.

This prepares for adding a lifetime parameter to dma::Coherent, which
requires the data type to carry a lifetime.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 samples/rust/rust_dma.rs | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index bd60034ded23..0fac9d4ae566 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -5,7 +5,10 @@
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
 use kernel::{
-    device::Core,
+    device::{
+        Bound,
+        Core, //
+    },
     dma::{
         Coherent,
         DataDirection,
@@ -23,13 +26,14 @@
     scatterlist::{
         Owned,
         SGTable, //
-    },
-    sync::aref::ARef, //
+    }, //
 };
 
+struct DmaSampleDriver;
+
 #[pin_data(PinnedDrop)]
-struct DmaSampleDriver {
-    pdev: ARef<pci::Device>,
+struct DmaSampleData<'bound> {
+    pdev: &'bound pci::Device<Bound>,
     ca: Coherent<[MyStruct]>,
     #[pin]
     sgt: SGTable<Owned<VVec<u8>>>,
@@ -67,13 +71,13 @@ unsafe impl kernel::transmute::FromBytes for MyStruct {}
 
 impl pci::Driver for DmaSampleDriver {
     type IdInfo = ();
-    type Data<'bound> = Self;
+    type Data<'bound> = DmaSampleData<'bound>;
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
 
     fn probe<'bound>(
         pdev: &'bound pci::Device<Core<'_>>,
         _info: Option<&'bound Self::IdInfo>,
-    ) -> impl PinInit<Self, Error> + 'bound {
+    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
         pin_init::pin_init_scope(move || {
             dev_info!(pdev, "Probe DMA test driver.\n");
 
@@ -94,8 +98,8 @@ fn probe<'bound>(
 
             let sgt = SGTable::new(pdev.as_ref(), pages, DataDirection::ToDevice, GFP_KERNEL);
 
-            Ok(try_pin_init!(Self {
-                pdev: pdev.into(),
+            Ok(try_pin_init!(Self::Data {
+                pdev,
                 ca,
                 sgt <- sgt,
             }))
@@ -103,7 +107,7 @@ fn probe<'bound>(
     }
 }
 
-impl DmaSampleDriver {
+impl DmaSampleData<'_> {
     fn check_dma(&self) {
         for (i, value) in TEST_VALUES.into_iter().enumerate() {
             let val0 = io_read!(self.ca, [panic: i].h);
@@ -116,7 +120,7 @@ fn check_dma(&self) {
 }
 
 #[pinned_drop]
-impl PinnedDrop for DmaSampleDriver {
+impl PinnedDrop for DmaSampleData<'_> {
     fn drop(self: Pin<&mut Self>) {
         dev_info!(self.pdev, "Unload DMA test driver.\n");
 
-- 
2.55.0

