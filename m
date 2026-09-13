Received: from mx1.mail-out.lima-city.de (mx1.mail-out.lima-city.de [91.216.248.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D532F2773E4;
	Sun, 13 Sep 2026 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333732; cv=none; b=aTeL1PTtlhv64ZYJbY4Y3Cy9xvXo3dLlFW66FosjW9DbG+Zf15ZWwD2b/oCDyV/Fmrsd2EzencwIhBqDoZlChUrzBJWbLjhUheMtT2OBZGg+rU6mGOZNpEVX2DbyWoWuf+IoDZWs0EAjA5wi9tdSdeYfKHC4nXNs4uD6GcpNTTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333732; c=relaxed/simple;
	bh=3xNCv3SnT48TuYnliag8Bk7AVkdX7pKFEQAlaBFdBH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoZwmtXOrlsoKj3XrrOOlnRmuy/ZZqB3rHDKKir7T8VUMlQv0V76QEZSGErL+Fz59kGYFpia4HBDBNexel9uIPuvsd/IIFgocry9AneBjcjvxHtHX6U4qnk1xjCTIUL2OWgq+80NjlecGgNp/s5P3fKCCRQPPctAlISoEN8Eq2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de; spf=pass smtp.mailfrom=matt3o12.de; dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b=gNeodVX7; arc=none smtp.client-ip=91.216.248.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b="gNeodVX7"
From: Matteo Kloiber <kernel@matt3o12.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matt3o12.de;
	s=securedbylima-20230709; t=1789333728;
	bh=3xNCv3SnT48TuYnliag8Bk7AVkdX7pKFEQAlaBFdBH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gNeodVX7TzeceRRgx4Ydsps/z73ttUdXg47D3c1ub60rePywFnE4wltDIhQ7n7twN
	 YCY1gO/6IH311sfLCUVs8NLMS1Ke9oLl9Lh26u1O1a6cxsFdZbZCCKBfN1ya9roA2I
	 xznQ21T+6jZdN923TW4G/cBcFjV8jpi23TBOojOtnL4JSJOL1aB6JYIGs1Ca+t7Fny
	 b2A38wGn7XTh8BrX61XUdqB2+YZIMiblxlwKSe0upuXny7F33PtIS1CxTz4hjdWdot
	 +9ytZtlSvQ3Y/+YgldmzyU9CJiEMQrtDeZ737WRgMroS3jehElxpWlaDDpH011AjfG
	 IDk/1c+WZGS0g==
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: aliceryhl@google.com,
	ojeda@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matteo Kloiber <kernel@matt3o12.de>
Subject: [PATCH v2 2/2] rust: scatterlist: honor the device's maximum segment size
Date: Sun, 13 Sep 2026 23:08:28 +0200
Message-ID: <20260913210828.125655-3-kernel@matt3o12.de>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260913210828.125655-1-kernel@matt3o12.de>
References: <20260913210828.125655-1-kernel@matt3o12.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SGTable::new() caps segment length at dma_max_mapping_size() only, which
limits the DMA mapping path (e.g. swiotlb), not the device itself. The
per-device limit from dma_set_max_seg_size() is ignored, so contiguous
page segments can be longer than the declared max segment size,
potentially causing problems for future drivers that use this
abstraction.

Fixes: 05aa6fb1c21d ("rust: scatterlist: Add abstraction for sg_table")
Signed-off-by: Matteo Kloiber <kernel@matt3o12.de>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/helpers/dma.c         |  5 +++++
 rust/kernel/scatterlist.rs | 12 ++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/dma.c b/rust/helpers/dma.c
index 9fbeb507b08c..ff8f24dae9df 100644
--- a/rust/helpers/dma.c
+++ b/rust/helpers/dma.c
@@ -49,3 +49,8 @@ __rust_helper void rust_helper_dma_set_max_seg_size(struct device *dev,
 {
 	dma_set_max_seg_size(dev, size);
 }
+
+__rust_helper unsigned int rust_helper_dma_get_max_seg_size(struct device *dev)
+{
+	return dma_get_max_seg_size(dev);
+}
diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
index b83c468b5c63..44eeafed05e3 100644
--- a/rust/kernel/scatterlist.rs
+++ b/rust/kernel/scatterlist.rs
@@ -350,15 +350,23 @@ fn new(
             page_vec.push(page.as_ptr(), flags)?;
         }
 
+        // Cap segments at both the DMA mapping-path limit and the device's declared
+        // max segment size.
+        //
         // `dma_max_mapping_size` returns `size_t`, but `sg_alloc_table_from_pages_segment()` takes
         // an `unsigned int`.
         //
         // SAFETY: `dev.as_raw()` is a valid pointer to a `struct device`.
-        let max_segment = match unsafe { bindings::dma_max_mapping_size(dev.as_raw()) } {
+        let max_mapping_size = match unsafe { bindings::dma_max_mapping_size(dev.as_raw()) } {
             0 => u32::MAX,
-            max_segment => u32::try_from(max_segment).unwrap_or(u32::MAX),
+            max_mapping_size => u32::try_from(max_mapping_size).unwrap_or(u32::MAX),
         };
 
+        // SAFETY: `dev.as_raw()` is a valid pointer to a `struct device`.
+        let max_seg_size = unsafe { bindings::dma_get_max_seg_size(dev.as_raw()) };
+
+        let max_segment = max_mapping_size.min(max_seg_size);
+
         Ok(try_pin_init!(&this in Self {
             // SAFETY:
             // - `page_vec` is a `KVec` of valid `struct page *` obtained from `pages`.
-- 
2.51.2

