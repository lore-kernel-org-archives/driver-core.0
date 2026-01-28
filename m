Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314AE29D265;
	Wed, 28 Jan 2026 23:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769642489; cv=none; b=R4zj7wqBdX0aGhr+S9PE/jAbFZ8ZLUqTTPbWsTdfBQaqIOGuiUFrWiOZpIXJTTek7V2A1vsc7KH62U1IcxAojkTauSpIdbvlC9Ein5WLGKAK0QZBDy2wIPS0tT9dJ3h7Fi2vdKD4V5JyRlG6FU4zGe4Fe1jRjyBlKoDa3CSLnF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769642489; c=relaxed/simple;
	bh=Gr4t3B1tqgCoEK96h0WSs3SbBJgDd9kUcab5OUuwJSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFEVIdctW8Gz8cNXLXDRw1dwytJooG1J9ro9vQRHOIQrMAZAk9ojvSE1k+DStM4pGHrFhclA3YSla0jRE+xzlZgIQNpnprV2RmXhhd0ySw7mh32xJ2WeXvOJknq+PvR7FeQ+oNl3udATop5/t2gQjrh1Pqmi9wAMM0o8k2OkkPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoqwOzwN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoqwOzwN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6464CC4CEF1;
	Wed, 28 Jan 2026 23:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769642488;
	bh=Gr4t3B1tqgCoEK96h0WSs3SbBJgDd9kUcab5OUuwJSk=;
	h=From:To:Cc:Subject:Date:From;
	b=HoqwOzwNUew+Rn/PHZBdSGkXdaqb3YgmIlp8joF3Ml9qQuH449w4GikGSkv/PGFt+
	 ZUNRYuEscIgjVbaeoSTYVDBUiiOfcrkVg6x23YU161gh0IRJ71Vrp+Ycjd/qE5X2Ji
	 +TnMWBLERTlID3hiYYeF1+QAYNmDTmdM5ldzQ5H1ls9RgTMy/2uECxFrLa/uCTN+FY
	 ka59RuiQmg+eoPrHNPzFZP0Yzv2UiLumBILfCelEZnTXouFPDrSIQtWmDZoAZeDsWG
	 w5hZ1vdmbYMx2zXxmpv0vB6sfbNO7FSO8dsComeQBK0/+OE8+2yWSuy01yXaxM9v09
	 66q9eJ8awV87A==
From: Danilo Krummrich <dakr@kernel.org>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	louis.chauvet@bootlin.com,
	hamohammed.sa@gmail.com,
	melissa.srw@gmail.com,
	lyude@redhat.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] drm: vgem: do not use devres groups
Date: Thu, 29 Jan 2026 00:20:33 +0100
Message-ID: <20260128232038.2399-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using devres groups in vgem is unnecessary, as the corresponding cleanup
happens automatically when the device is unbound through
faux_device_destroy().

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 260c64733972..d75f2ee56cf6 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -133,11 +133,6 @@ static int __init vgem_init(void)
 	if (!fdev)
 		return -ENODEV;
 
-	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
-		ret = -ENOMEM;
-		goto out_unregister;
-	}
-
 	dma_coerce_mask_and_coherent(&fdev->dev,
 				     DMA_BIT_MASK(64));
 
@@ -145,20 +140,18 @@ static int __init vgem_init(void)
 					 struct vgem_device, drm);
 	if (IS_ERR(vgem_device)) {
 		ret = PTR_ERR(vgem_device);
-		goto out_devres;
+		goto out;
 	}
 	vgem_device->faux_dev = fdev;
 
 	/* Final step: expose the device/driver to userspace */
 	ret = drm_dev_register(&vgem_device->drm, 0);
 	if (ret)
-		goto out_devres;
+		goto out;
 
 	return 0;
 
-out_devres:
-	devres_release_group(&fdev->dev, NULL);
-out_unregister:
+out:
 	faux_device_destroy(fdev);
 	return ret;
 }
@@ -168,7 +161,6 @@ static void __exit vgem_exit(void)
 	struct faux_device *fdev = vgem_device->faux_dev;
 
 	drm_dev_unregister(&vgem_device->drm);
-	devres_release_group(&fdev->dev, NULL);
 	faux_device_destroy(fdev);
 }
 

base-commit: a50007089e078a1b7a826559a02277b1601ee189
-- 
2.52.0

