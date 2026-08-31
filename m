Received: from mx1.mail-out.lima-city.de (mx1.mail-out.lima-city.de [91.216.248.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449D73D6689;
	Mon, 31 Aug 2026 23:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219663; cv=none; b=ps2n5tncDni55MJQ70qoDnf9mrWV3MSQSqytmV8nobfB+022HddfITxoi5l0qVtHWDGOKI+gubOld6V7O1KMFG5PZx0GlC3P7o/rkUbUgkali5n2FC952Chu4eJyDTOdrwJvj9S6Eqla5MN928PSScazvLA7EkXYj+p/yjVQHGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219663; c=relaxed/simple;
	bh=Pd+xuj/awkQjzclpiwBAlCOaUDbx6XwHn6PW/HGWlGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ga0SpHK5cNvFSnELYxjUhpuwHab0mwY/Ce8aX5AhxleLZm+2tt45i7p6ksMUDdZdmfy61Ue0yoHctBSgojFZOCXJvMqj0zoTSm/v0qvPmV8jysol6CF39NBxPsVYP64LSVBbj1mGvRupCzMyLPytHkm3aud8oYupC2XSEe8f6P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de; spf=pass smtp.mailfrom=matt3o12.de; dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b=NpCoRxf9; arc=none smtp.client-ip=91.216.248.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b="NpCoRxf9"
From: Matteo Kloiber <kernel@matt3o12.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matt3o12.de;
	s=securedbylima-20230709; t=1788219153;
	bh=Pd+xuj/awkQjzclpiwBAlCOaUDbx6XwHn6PW/HGWlGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpCoRxf92FZv9ezg56i3s4eaV+rg3wSalMNrQ1ifw0PSoniBKhdKXfDqF7zK0a1WF
	 hVqXw0Lfgz426mJuqN3i7DpJ7YtWVvFX/WtiMPuNOiLQfclMPFHFd3OBPUqkWWyC9Z
	 eiX880QoRoI8IeYSOlfSH8ubn8oOLzhHRGIGPYPq0mpT9rex1hriMIP7fu17UzmBUB
	 a6yspNk+lj0DuCdkzcA8MI0rSHOhE2xRlNvHhXSD+bsTWFRzHHf2X3G+iHkclS8Lb0
	 fUcJbckd8IDf2Dz32Vm/oQHBqFhiUIbocQgWvi5/JXvAu+Lg4AiQrzcyfSB+a3Y6b+
	 0U9JupAyf3PGg==
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
Subject: [PATCH 1/2] gpu: nova-core: declare unlimited DMA max segment size
Date: Tue,  1 Sep 2026 01:32:14 +0200
Message-ID: <20260831233215.287881-2-kernel@matt3o12.de>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260831233215.287881-1-kernel@matt3o12.de>
References: <20260831233215.287881-1-kernel@matt3o12.de>
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

Signed-off-by: Matteo Kloiber <kernel@matt3o12.de>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/gpu/nova-core/gpu.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index fd1414004dd0..233ef2dc9688 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -343,6 +343,13 @@ pub(crate) fn new<'a>(
                 // still constructing it, so no concurrent DMA allocations can exist.
                 unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
 
+                // Nova re-decomposes SG segments into 4 KiB page-table entries, so it
+                // has no upper bound on segment length; declare that to the DMA layer.
+                //
+                // SAFETY: same invariant as above -- still constructing, no concurrent
+                // DMA mapping can exist.
+                unsafe { pdev.dma_set_max_seg_size(u32::MAX) };
+
                 hal.wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))?;
             },
-- 
2.51.2

