Received: from mx1.mail-out.lima-city.de (mx1.mail-out.lima-city.de [91.216.248.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C71037DAD5;
	Sun, 13 Sep 2026 21:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333730; cv=none; b=guyOfsUSRbdDNy4XiXB89JtnzkHZrovd12DorOuqB7uztevRue7Gw8kSVGWIaMFS9+z/+CUIOm+F4bOANaWYN/YTp6W/eVSfhkhY1OqfNNUsCYZPvHeSmFm9Ilia2+kOfKSFCvl31pMqzhzeiMWtl7cVPK5Oq3/6qmo8os7uI/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333730; c=relaxed/simple;
	bh=YAfzGGez1KlfbwFRmw6Z8+ppdhSswn0ovC86+tjumRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FxgnUNs4BgInMFsVT/JtR+Eck96w4V0HV74nfx0r7/1iRZIxblLQn+8hQiApOkeuCDutRZnOoa8ZlqIW/GQrs8RefzMCzbMg0k8ACzwLkpsehLKOiRCRak3qdyKud8puN4YKPpyqx/aFzxfLuFSyMjDYZGf1QRT2WDFwSiimRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de; spf=pass smtp.mailfrom=matt3o12.de; dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b=iCUHrDVC; arc=none smtp.client-ip=91.216.248.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b="iCUHrDVC"
From: Matteo Kloiber <kernel@matt3o12.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matt3o12.de;
	s=securedbylima-20230709; t=1789333726;
	bh=YAfzGGez1KlfbwFRmw6Z8+ppdhSswn0ovC86+tjumRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCUHrDVCx5pMJJkUSJ5nLeZX2odZx2TdJUQFVxerVFcRiOZ6Xwg+NfCy1znXa0/+z
	 s5LKhhlOMfxWbViL4c3m84lkUKO5PCxnfkypVosDgMePDEW1SIevHQcgXi3fJKyeTG
	 O+uUZF/OgXAV4ARKG9adA1PR6tBtvRzGWRTNl9+M5bzWFZ4v0LGRAQ6nDu5pVG9ePX
	 Bgp0pGN4AiBXYHiL4aWLWAt53DgPOFd/g/ITYRtRj6jcXvqrYHZUs5xvUTPCX9Ysgg
	 bUnEOlm+wIx5RUatkQoV7I4xCAc2l9G7pNK6pL1BMVz65HnYrwHzYrfOJ1qpfmdmrI
	 3DJbU/mczEwRA==
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
Subject: [PATCH v2 1/2] gpu: nova-core: declare unlimited DMA max segment size
Date: Sun, 13 Sep 2026 23:08:27 +0200
Message-ID: <20260913210828.125655-2-kernel@matt3o12.de>
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

The PCI default max_seg_size is 64 KiB. nova-core never raises it, so
mapping the GSP firmware image (~60 MiB) as a scatter-gather table
triggers a DMA-API debug warning when contiguous pages coalesce into
segments that exceed the default:

  DMA-API: nova-core 0000:00:03.0: mapping sg segment longer than
  device claims to support [len=62914560] [max=65536]

CONFIG_DMA_API_DEBUG=y is required to see this warning.

Assisted-by: LLM
Signed-off-by: Matteo Kloiber <kernel@matt3o12.de>
---
 drivers/gpu/nova-core/gpu.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index fd1414004dd0..edc0207c01a0 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -343,6 +343,13 @@ pub(crate) fn new<'a>(
                 // still constructing it, so no concurrent DMA allocations can exist.
                 unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
 
+                // Nova walks SG segments to build page tables, so their length is
+                // irrelevant to the device.
+                //
+                // SAFETY: `Gpu` owns all DMA allocations for this device, and we are
+                // still constructing it, so no concurrent DMA allocations can exist.
+                unsafe { pdev.dma_set_max_seg_size(u32::MAX) };
+
                 hal.wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))?;
             },
-- 
2.51.2

