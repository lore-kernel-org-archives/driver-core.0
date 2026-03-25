Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3019E1F4634;
	Wed, 25 Mar 2026 00:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399181; cv=none; b=DbDnnMBUz8Whs3zbsTvG5uLAGgsstnDNrSrYDrBaCa7x+tcE8sOoP3CCsIRgA48sfh2hysibxQR8d+17A5NqbPYNH28fiIzwiYxqswHOfo9RYUpkAYc9UPSfRpal3rtWxkuTKvkIX/D9V94K8dQ1AJTzf2H9MYBOlDhSPA7q/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399181; c=relaxed/simple;
	bh=FL1JEdq1tctPBGMzomr8d8x2jF4EF+GuISsfrwolWBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbxMX6L88e8W6NYit/VKhyLSFFJYXzxftWyA0DyGJ+XCjzKjuBGZLC4ygxTkkFTsyMJb7PsnOqrWXXNOMQsnAIS5ShmUJpxs9VyNJMl9iuFj61bgsXPK+wcUb8qDDgRmRnXTBIE7uBAqRRkQ6In3KcnjUbJyoJYHHqBRLBmRWgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/7JI/Zx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/7JI/Zx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5CCC2BCB2;
	Wed, 25 Mar 2026 00:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774399180;
	bh=FL1JEdq1tctPBGMzomr8d8x2jF4EF+GuISsfrwolWBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r/7JI/Zxyj00ZvSGCx9RrpoMT1uddYpxcG5XCLiLS3LVVACMib7IPfa9NSoM1qk0V
	 78/fC13BslBNA8E/UDwsmNBSD5M92jicRml8a84ElBKm+BIw34+IiojbBhTTf431TJ
	 zYbp+C7jzfK1z6gKa3EHhuKKgRktqRUev5akLumhgahvRJDfyshQK9aFTxpcx3EKzU
	 TmwkkoAa0Qi6pEwnHaNV350cpn1Y/bQ+BZiu8Q5bC82lLylqebXf7er4AQmfJSwDVi
	 mY2Z9myG/K9fCX0s8McQuckk1GkFUCd8uj7phVl0n2ldu8Jm5vSSv9HsInybd5qALl
	 uGlVJVKGBtJ1A==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
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
	ttabi@nvidia.com
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/3] gpu: nova-core: use sized array for GSP log buffers
Date: Wed, 25 Mar 2026 01:39:17 +0100
Message-ID: <20260325003921.3420-3-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325003921.3420-1-dakr@kernel.org>
References: <20260325003921.3420-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch LogBuffer from Coherent<[u8]> (unsized) to
Coherent<[u8; LOG_BUFFER_SIZE]> (sized). The buffer size is a
compile-time constant (RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE), so a
fixed-size array is more precise and avoids the need for the runtime
length parameter of zeroed_slice().

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gsp.rs | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 04e3976127cc..ba5b7f990031 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -42,6 +42,7 @@
 
 /// Number of GSP pages to use in a RM log buffer.
 const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
+const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
 
 /// Array of page table entries, as understood by the GSP bootloader.
 #[repr(C)]
@@ -77,24 +78,19 @@ fn entry(start: DmaAddress, index: usize) -> Result<u64> {
 /// then pp points to index into the buffer where the next logging entry will
 /// be written. Therefore, the logging data is valid if:
 ///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer(Coherent<[u8]>);
+struct LogBuffer(Coherent<[u8; LOG_BUFFER_SIZE]>);
 
 impl LogBuffer {
     /// Creates a new `LogBuffer` mapped on `dev`.
     fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
-        const NUM_PAGES: usize = RM_LOG_BUFFER_NUM_PAGES;
-
-        let obj = Self(Coherent::<u8>::zeroed_slice(
-            dev,
-            NUM_PAGES * GSP_PAGE_SIZE,
-            GFP_KERNEL,
-        )?);
+        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
 
         let start_addr = obj.0.dma_handle();
 
         // SAFETY: `obj` has just been created and we are its sole user.
-        let pte_region =
-            unsafe { &mut obj.0.as_mut()[size_of::<u64>()..][..NUM_PAGES * size_of::<u64>()] };
+        let pte_region = unsafe {
+            &mut obj.0.as_mut()[size_of::<u64>()..][..RM_LOG_BUFFER_NUM_PAGES * size_of::<u64>()]
+        };
 
         // Write values one by one to avoid an on-stack instance of `PteArray`.
         for (i, chunk) in pte_region.chunks_exact_mut(size_of::<u64>()).enumerate() {
-- 
2.53.0

