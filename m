Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92EA2DC79A;
	Wed, 28 Jan 2026 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769642493; cv=none; b=YLK/MqIaWUXuQeK0YqUS22APZgy8kNe8OLv1NwDWiHEo++Qajcl/tQ3RFkSSQc4NGfCjmu2xP3fx1mtKec6Ta34J+fGHkA3ONwGVOFXYtV+tZP55Bzr4+n25idqWKFcmzHDM3Gv/M4PbyDoo3GK35gC53kTjOwXbHKQ/D7XkoJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769642493; c=relaxed/simple;
	bh=pGn6tRlh76X1LRm+QzdGvJqlCD9cubRsIBiMDtmr1PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+eNkUvuY+bJ88DzWAyDNJHlR7JbxWAWetiJIkByjjU9LSMPX7MSK2jCTNbOKK/De6Gl83xX1dNtG8MQi0rn+pStzk5SMJnExhvQYhuxQI2VhZ8e5Y83vkLc8LIQLxLxFXAAu8wEWw+iwzGMrKizPAhrHoQ731R7a8FxUr0VlQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFc9Ym3k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFc9Ym3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E736C116C6;
	Wed, 28 Jan 2026 23:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769642492;
	bh=pGn6tRlh76X1LRm+QzdGvJqlCD9cubRsIBiMDtmr1PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WFc9Ym3kShJhBmWe8au5S8aGw2WePaEVwhY+GvA7SFa35Bj1a1EhIDxgrby3LYsM1
	 kW/7rpWaf5WLaGEb+QVAPyHH7Q6WI5xlejag+Z/USUxeLx8wMP1GOSBQBnubZ/TA5v
	 tcGqf7uz1K6kZNEswl3Jq3WgHOq3xIePnuRrwOK4BhsYU+gfmJEO8YTe+sZTI7iC2t
	 9k0M+bHdVXkvAty96ArvT6JtcYRNw61HEq8C5nCt8rIqH1qcqkqxeaBSH8TabmCIWj
	 j0axxGhdLXiAnu0z5gZSNO5LvAvT7Milu5Jk48VftPXBbekc1U7xMBixj3LJR8cswp
	 6tkfPPNY0riVw==
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
Subject: [PATCH 2/2] drm: vkms: do not use devres groups
Date: Thu, 29 Jan 2026 00:20:34 +0100
Message-ID: <20260128232038.2399-2-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128232038.2399-1-dakr@kernel.org>
References: <20260128232038.2399-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using devres groups in vkms is unnecessary, as the corresponding cleanup
happens automatically when the device is unbound through
faux_device_destroy().

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 434c295f44ba..585fd642281c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -169,16 +169,11 @@ int vkms_create(struct vkms_config *config)
 	if (!fdev)
 		return -ENODEV;
 
-	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
-		ret = -ENOMEM;
-		goto out_unregister;
-	}
-
 	vkms_device = devm_drm_dev_alloc(&fdev->dev, &vkms_driver,
 					 struct vkms_device, drm);
 	if (IS_ERR(vkms_device)) {
 		ret = PTR_ERR(vkms_device);
-		goto out_devres;
+		goto out;
 	}
 	vkms_device->faux_dev = fdev;
 	vkms_device->config = config;
@@ -189,33 +184,31 @@ int vkms_create(struct vkms_config *config)
 
 	if (ret) {
 		DRM_ERROR("Could not initialize DMA support\n");
-		goto out_devres;
+		goto out;
 	}
 
 	ret = drm_vblank_init(&vkms_device->drm,
 			      vkms_config_get_num_crtcs(config));
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
-		goto out_devres;
+		goto out;
 	}
 
 	ret = vkms_modeset_init(vkms_device);
 	if (ret)
-		goto out_devres;
+		goto out;
 
 	vkms_config_register_debugfs(vkms_device);
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
-		goto out_devres;
+		goto out;
 
 	drm_client_setup(&vkms_device->drm, NULL);
 
 	return 0;
 
-out_devres:
-	devres_release_group(&fdev->dev, NULL);
-out_unregister:
+out:
 	faux_device_destroy(fdev);
 	return ret;
 }
@@ -262,7 +255,6 @@ void vkms_destroy(struct vkms_config *config)
 	drm_colorop_pipeline_destroy(&config->dev->drm);
 	drm_dev_unregister(&config->dev->drm);
 	drm_atomic_helper_shutdown(&config->dev->drm);
-	devres_release_group(&fdev->dev, NULL);
 	faux_device_destroy(fdev);
 
 	config->dev = NULL;
-- 
2.52.0

