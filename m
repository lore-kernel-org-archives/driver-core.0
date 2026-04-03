Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C124336D
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 00:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177507; cv=none; b=jp5mwa6BrJugWKyVOlNPyBalB1PIHv1AXT/IFAFPGSSKavG/Psq71s2w/RyetjbDrxh7qfZs1qcY5K9FxwrBO6PMTAA6L92rsYCorn3qOv37MgUGMcJaV7y3HBQifHOnjSgEhU8hXacmIzjgCLqt7OarTPymIE0c5N6Ds1UsuEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177507; c=relaxed/simple;
	bh=/M0FfRzU7RVjhShiy7G7rTfAd90/jtHt9dofWLRy5KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFaNM09Ju41zaBaPgTXg7zi2k21FS1hFnvDxRkycc8NcFyQ+T4brRRauWlhTqWfgwk/Rh7/c07mv7mV/wCPANIyVk7lxhQYw5Oe2slaV2WWHVYKbhCVKIat1SnEO/hqN6Cx9tUs5HPiYUDaqdKHl30whuYEcPhC2RQ9YydWzTEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nidH4MxH; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nidH4MxH"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12732165d1eso2250157c88.1
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 17:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775177505; x=1775782305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7YjIBbL/N3pUe7DW8lfq5UV0N0T+SK6BvJG2WvPW8U=;
        b=nidH4MxHSRRmtDIbuZ94nelTFDz5mGz2fMf2weMlNkxd4acGSpLpXAf8qT9wkT5ej3
         B29Zk8X3LKyJLm07/vJteoBH+eH2bDXV3sk+epxu353lFgcpq84YXf3K+S2vsA6WlL0v
         0j0nW+3rLD6HZwPLDUVeXgFdhLalgCgJWmBeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177505; x=1775782305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7YjIBbL/N3pUe7DW8lfq5UV0N0T+SK6BvJG2WvPW8U=;
        b=hWlRCQ2RBQwuJYG/vr+TJB0kxurFbkDeXXcf8a53djxbgYEvK+wMYWOKTGaKuNRnUf
         VzevW39K6YhXMmqfoAYo/m5ormYSOSZixWEG0f+xfxiN/LYXhwRg1opO37ZaI8mwXaJM
         j8J0y2LOlmG4gseIyk7ymXBBPl8T7fdbGdOTdl+ItPcOnDABDiJkxyCiSEvOpWgY9/wz
         2EijsSrkbXx+WhvITd+Ic/29tltmpLGzGbWuGTKtApquj/gsDbtOd8tjJe/sV+e3G4az
         gxO3I1d8feHKxGuIt2HloT/JvIKmiVb3z/2MlXFvL8K7FVF4OsRzrhWF+0I7ljZttMhV
         wPrg==
X-Forwarded-Encrypted: i=1; AJvYcCXqYRj/Vhvyo5kpNqzIUpltVv6X3yLn6fLUs4N4DEKUb8NxT16xyK8Hm62NSYWE9YUibxEqpknW9S1bAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxvt88GEo7/PocC5Se3Aek+pY8RF0pmKW4oO4SzS8zRWxMGGVm
	JlWBKL8VELLg40TCrB8j5TcT3o3ymwfw8cvs26NKrkS9YLY0Or06Yts7fiJPzDEcig==
X-Gm-Gg: ATEYQzzkPAE7jHb3vTpP4xeL1HneSJ+pBR3wrvy1LP+kFepNzi4gL3a7HtmjJAIZmtz
	TboWaqZz9V6mEKSbDTMOt1ho5ybgYtjKut/IAkhchDuZHUGBw+n73nWw4w+NfO2sGrRVPZr8BNs
	TmnFU7XdesBLyglU4fCBNsa5lnvLrbXMbEfIQlBFDbaPZi7HX3ccomNlQOs2GSAV7AxUNl2mZ0+
	/ve5x6V4VA5oPMum3QtikBgneJ9fJJymr0JCmRjNLAstdVUZ1vPBfPwMAyyOzLxz35+koy3vFDU
	mLERoMvbXSK8MCb4kkZRbMHBuWb+nLA3Sl5HVEgbDZLT8xf5wS+zC5gP6bZPvWUDOQfuq/s3TQB
	dX2TDqZ7ghVExJB/QbfW38Ah9FcWWgiLccxEHEeJdcV9fSa6G1NR1MyhTe9iFRmy69XCMkyJXOH
	AbuZosU1dRudSoTu6KjUazN/iZpnqiBakt3gcmYlS54z6dxNkp4H8jS2nptQ1dZ8AGg2SLBk58m
	nUYAKaP3CE=
X-Received: by 2002:a05:7022:6881:b0:12a:747e:5b5c with SMTP id a92af1059eb24-12bfb7459b2mr534683c88.24.1775177504969;
        Thu, 02 Apr 2026 17:51:44 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:5db3:7542:a530:f43a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm3630074eec.5.2026.04.02.17.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:51:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Leon Romanovsky <leon@kernel.org>,
	Paul Burton <paul.burton@mips.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Toshi Kani <toshi.kani@hp.com>,
	Christoph Hellwig <hch@lst.de>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	driver-core@lists.linux.dev,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org
Subject: [PATCH v3 3/9] driver core: Replace dev->dma_iommu with DEV_FLAG_DMA_IOMMU
Date: Thu,  2 Apr 2026 17:49:49 -0700
Message-ID: <20260402174925.v3.3.Id20d5973cbff542fea290e13177e9423f5d81342@changeid>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260403005005.30424-1-dianders@chromium.org>
References: <20260403005005.30424-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In C, bitfields are not necessarily safe to modify from multiple
threads without locking. Switch "dma_iommu" over to the "flags" field
so modifications are safe.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

NOTE: even though previously we only took up a bit if
CONFIG_IOMMU_DMA, in this change I reserve the bit unconditionally.
While we could get the "dynamic" behavior by changing the flags
definition to be an "enum", it doesn't seem worth it at this
point. This also allows us to move one "#ifdef" to an "if", getting
better compile-time testing of both sides of the "if".

Changes in v3:
- New

 drivers/iommu/dma-iommu.c | 9 ++++++---
 drivers/iommu/iommu.c     | 5 ++---
 include/linux/device.h    | 8 +++-----
 include/linux/iommu-dma.h | 4 +++-
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 94d514169642..a3423ece9578 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2112,18 +2112,21 @@ EXPORT_SYMBOL_GPL(dma_iova_destroy);
 
 void iommu_setup_dma_ops(struct device *dev, struct iommu_domain *domain)
 {
+	bool dma_iommu;
+
 	if (dev_is_pci(dev))
 		dev->iommu->pci_32bit_workaround = !iommu_dma_forcedac;
 
-	dev->dma_iommu = iommu_is_dma_domain(domain);
-	if (dev->dma_iommu && iommu_dma_init_domain(domain, dev))
+	dma_iommu = iommu_is_dma_domain(domain);
+	assign_bit(DEV_FLAG_DMA_IOMMU, &dev->flags, dma_iommu);
+	if (dma_iommu && iommu_dma_init_domain(domain, dev))
 		goto out_err;
 
 	return;
 out_err:
 	pr_warn("Failed to set up IOMMU for device %s; retaining platform DMA ops\n",
 		dev_name(dev));
-	dev->dma_iommu = false;
+	clear_bit(DEV_FLAG_DMA_IOMMU, &dev->flags);
 }
 
 static bool has_msi_cookie(const struct iommu_domain *domain)
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 50718ab810a4..7722ac086981 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -589,9 +589,8 @@ static void iommu_deinit_device(struct device *dev)
 	dev->iommu_group = NULL;
 	module_put(ops->owner);
 	dev_iommu_free(dev);
-#ifdef CONFIG_IOMMU_DMA
-	dev->dma_iommu = false;
-#endif
+	if (IS_ENABLED(CONFIG_IOMMU_DMA))
+		clear_bit(DEV_FLAG_DMA_IOMMU, &dev->flags);
 }
 
 static struct iommu_domain *pasid_array_entry_to_domain(void *entry)
diff --git a/include/linux/device.h b/include/linux/device.h
index 7e5737c6d7d1..e74c7d0813ce 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -468,10 +468,13 @@ struct device_physical_location {
  * @DEV_FLAG_CAN_MATCH: The device has matched with a driver at least once or it
  *		is in a bus (like AMBA) which can't check for matching drivers
  *		until other devices probe successfully.
+ * @DEV_FLAG_DMA_IOMMU: Device is using default IOMMU implementation for DMA and
+ *		doesn't rely on dma_ops structure.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE,
 	DEV_FLAG_CAN_MATCH,
+	DEV_FLAG_DMA_IOMMU,
 };
 
 /**
@@ -564,8 +567,6 @@ enum struct_device_flags {
  *		for dma allocations.  This flag is managed by the dma ops
  *		instance from ->dma_supported.
  * @dma_skip_sync: DMA sync operations can be skipped for coherent buffers.
- * @dma_iommu: Device is using default IOMMU implementation for DMA and
- *		doesn't rely on dma_ops structure.
  * @flags:	DEV_FLAG_XXX flags. Use atomic bitfield operations to modify.
  *
  * At the lowest level, every device in a Linux system is represented by an
@@ -685,9 +686,6 @@ struct device {
 #ifdef CONFIG_DMA_NEED_SYNC
 	bool			dma_skip_sync:1;
 #endif
-#ifdef CONFIG_IOMMU_DMA
-	bool			dma_iommu:1;
-#endif
 
 	unsigned long		flags;
 };
diff --git a/include/linux/iommu-dma.h b/include/linux/iommu-dma.h
index a92b3ff9b934..b6177672539d 100644
--- a/include/linux/iommu-dma.h
+++ b/include/linux/iommu-dma.h
@@ -7,12 +7,14 @@
 #ifndef _LINUX_IOMMU_DMA_H
 #define _LINUX_IOMMU_DMA_H
 
+#include <linux/bitops.h>
 #include <linux/dma-direction.h>
+#include <linux/device.h>
 
 #ifdef CONFIG_IOMMU_DMA
 static inline bool use_dma_iommu(struct device *dev)
 {
-	return dev->dma_iommu;
+	return test_bit(DEV_FLAG_DMA_IOMMU, &dev->flags);
 }
 #else
 static inline bool use_dma_iommu(struct device *dev)
-- 
2.53.0.1213.gd9a14994de-goog

