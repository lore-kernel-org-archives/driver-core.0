Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367777;
	b=4PmPlrFIsKHeVZjxVZtsu5ShClRhwboiR7xrmgVF4psrXXo9M4KDibFAAGwVacfO1ZD7
	 bqmRZOUC++YNAbxkQ+oKsYoM5gjBRZBwTbx7tVQU7T88nGLvCkFKNsdQBO4c/WV+M10Vg
	 je7Cmn07DzDbtMdSRFHt5Uzqj+ftHhvItM0N6d8PBfybTh1Y/5f2lSjOEznVq0Kk6TU77
	 Ud6JkOjCU3ipVKKPeeYzDbJXbsOCMykXZKkjQVX1W6KRBzxKfqzZoIHGsxopwIzhSsXZp
	 JFJ5h5kMfGoL4MU6JKugyYo1doBLukiEjpo26LFebklsQAwAxbFGM3dJcqkJyBqlTDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367777;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k/O+G35jUBPlzfw87+qZX5Y4tlYERUDORjdn1BowKnI=;
	b=Y6urZPGIBu7Q3L1PetfurLVGsDLcn/xL7iPy3KxhI9yE30UcDJwv5BKWe9L0M6bn7/vD
	 vH47ZIoRnO5d2CsWU1/xih5so5HaHWmuAewLi18mYZBj5YwXu8nntjg1WAESUH3el/xY1
	 qp+DBnmtGyOmt+I9/ZodJyewaii76h5GX5Jse3HpHbZUwz6rCTw/Fi0VA3rzLYHG9fObk
	 Ue0ZhIhbqzphoXo5fAyxtdg3eqYUTqWnA57ARjgZJfQBAHtBlCYpgCQ137920ju/rHM3c
	 zk7/3NqVnB0D5p2pgoCswSd6R9y6SJhcwImqTtXwLuBeP0zdoCI1S4B8M8BObCJOO/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FCejtv5J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067E5606A32C;
	Sun, 22 Nov 2026 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FCejtv5J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77151F000C0;
	Sun, 22 Nov 2026 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795367776;
	bh=k/O+G35jUBPlzfw87+qZX5Y4tlYERUDORjdn1BowKnI=;
	h=From:To:Cc:Subject:Date;
	b=FCejtv5JKDoYbUW++UQ0RL1N0bDJsEu9TpGT/VlYRFwJa0dExT14715//khl7aMpy
	 sNjbz8X09DZQ77FBkk1zcf9jMuwjzylcX4Hdqih+1EuCL2CRVw54SZ11bfCvA2ufZp
	 qoQgtW02kqHAZ7nalmuL/ZLNTs8yJQAId9L2U0HXu8DPBs5N5bhiY+v9Wt6swvc49/
	 bWZ/2qn7BSCg76Fl+q4TUb/21L3BWHJwlP1h1QQS1RAZ1OKmY554/N5yXTs+fSZ3KN
	 1/uILhl2vtrs8/wbXnvh8QlW4K7M8mHyP8c4LmH6hmMGRCuKxaBVA+9nqCSUUdunEy
	 ax2UI5UxMNKVQ==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] samples: rust_dma: construct driver data by value
Date: Sun, 22 Nov 2026 18:15:32 +0100
Message-ID: <20261122171610.967066-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
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

Now that SGTable no longer requires pinning, construct DmaSampleData by
value and replace PinnedDrop with Drop.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 samples/rust/rust_dma.rs | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 844e137cddc8..b5d71ada8521 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -31,7 +31,6 @@
 
 struct DmaSampleDriver;
 
-#[pin_data(PinnedDrop)]
 struct DmaSampleData<'bound> {
     pdev: &'bound pci::Device<Bound>,
     ca: Coherent<'bound, [MyStruct]>,
@@ -77,28 +76,26 @@ fn probe<'bound>(
         pdev: &'bound pci::Device<Core<'_>>,
         _info: Option<&'bound Self::IdInfo>,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
-        pin_init::pin_init_scope(move || {
-            dev_info!(pdev, "Probe DMA test driver.\n");
+        dev_info!(pdev, "Probe DMA test driver.\n");
 
-            let mask = DmaMask::new::<64>();
+        let mask = DmaMask::new::<64>();
 
-            // SAFETY: There are no concurrent calls to DMA allocation and mapping primitives.
-            unsafe { pdev.dma_set_mask_and_coherent(mask)? };
+        // SAFETY: There are no concurrent calls to DMA allocation and mapping primitives.
+        unsafe { pdev.dma_set_mask_and_coherent(mask)? };
 
-            let ca: Coherent<'_, [MyStruct]> =
-                Coherent::zeroed_slice(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
+        let ca: Coherent<'_, [MyStruct]> =
+            Coherent::zeroed_slice(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
-            for (i, value) in TEST_VALUES.into_iter().enumerate() {
-                io_project!(ca, [panic: i]).copy_write(MyStruct::new(value.0, value.1));
-            }
+        for (i, value) in TEST_VALUES.into_iter().enumerate() {
+            io_project!(ca, [panic: i]).copy_write(MyStruct::new(value.0, value.1));
+        }
 
-            let size = 4 * page::PAGE_SIZE;
-            let pages = VVec::with_capacity(size, GFP_KERNEL)?;
+        let size = 4 * page::PAGE_SIZE;
+        let pages = VVec::with_capacity(size, GFP_KERNEL)?;
 
-            let sgt = SGTable::new(pdev.as_ref(), pages, DataDirection::ToDevice, GFP_KERNEL)?;
+        let sgt = SGTable::new(pdev.as_ref(), pages, DataDirection::ToDevice, GFP_KERNEL)?;
 
-            Ok(try_pin_init!(Self::Data { pdev, ca, sgt }))
-        })
+        Ok(Self::Data { pdev, ca, sgt })
     }
 }
 
@@ -114,9 +111,8 @@ fn check_dma(&self) {
     }
 }
 
-#[pinned_drop]
-impl PinnedDrop for DmaSampleData<'_> {
-    fn drop(self: Pin<&mut Self>) {
+impl Drop for DmaSampleData<'_> {
+    fn drop(&mut self) {
         dev_info!(self.pdev, "Unload DMA test driver.\n");
 
         self.check_dma();

base-commit: 0504beeb95d1be229d7cce00a12033468f5ac50b
-- 
2.56.1

