Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648203C1D52
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 03:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653518; cv=none; b=JO2yAVKvJx0YMLMyy19Kcn8Bsjp+ScLArh3s4CKu/YmHM7u431T6peXCB4oKS57XVXpNHt0sft7cjo7fVPuGW0Lko1Z/9eCN2pZLTsVGL3ZBR7ot+pYeB+Pmv9Q+8AoZBTSbqfQfEtI3HwJVmAmLVIOa/P1//G19TuH8Efns7ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653518; c=relaxed/simple;
	bh=sSaCOx4U6R0q+XEpXdBsjzIiaG0C0n1CnHH/2I4K5iI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=StBrLTxfqP5OCysKwLsd6TpBgrpdPL2A/TSPc4zoG7g9+C1uMzZc5HJIpUZOWa7f/T6uE3qyQtq5r3xVpXvnP6+oHtAr7KxMk2Vtf6EWUOYrg/qFhHenBXu8dUDWKu8AsVolEabyS2T5RUYt+CBQOVJtbYx+52xEzSXBHMa54RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VsrTZo8W; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VsrTZo8W"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so2215987a12.2
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 20:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653517; x=1791258317; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDZxo1vDA8KPlmypD4LBvSL25B+x7JnUcC92a9yoH8o=;
        b=VsrTZo8WwFkEYPeLi3bG4Xm9Bh7PhV1dVl8QHHLbyNItR2SI2T5yddNiu9bpnixFRK
         Mb8VvmWAc6EyyI7uA43I3gZezRdUi/WQ5/TzrpnuqpIXef8h/qgkHd7ly4tbRzTp2xGh
         tVKGf37IcxGFktnuDB1RVLr11gXSgulZmQn5HIJJO3mUHdOgOfiSV0XGs8vAvQ7ymWYD
         EleSr/6se9RYCuYtAn9EkkVhQxn/yIsqZp9VpRj+6QM9PfriR3tBFCBOCO+QvHXjpD9H
         +VX8wq8gC8UdgXJ+TycwaEPNaU2gxYAtyFMo5T7j+faSIEix0nIFrgJduDsD+z+g+Vk9
         fkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653517; x=1791258317;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDZxo1vDA8KPlmypD4LBvSL25B+x7JnUcC92a9yoH8o=;
        b=HWGBjrUbCvqhtMFdrbqINI7iFJodV+2rv285xAyDjX1pVh21+6TSz5A69Qyv/H+5rG
         JO319VzBiyJzLKDCgrKeTB+ysNip+57r3a+oGi/NW0uEgW1iFIiBmQjbYe7ma3GSfrts
         4CrTMwzcLSfEy1ymRW0aStwxFS7O0K9HTVeiMO3aOhWLw8+fV7082n1Bzpd4GfN1xSTQ
         SMu9vsxl0YGxwY4c4dEXwjFDnE9fTIkeqTKcdhidssnYKk3btT4LpT7+AL3cTlXw71g2
         Ieoedy2qxeyLpTPVBFjX58YQafB+d7aW+BmLhb4CMwSio/cQkQjFqM6/t9WnspYACk0s
         rICA==
X-Forwarded-Encrypted: i=1; AKwUvByNqzSFryJQHoaa5+WB1seBNP5dkW19+eu+sOQlvfX++A7cUMwuItHqPQQV0rhopCKxY03LClKLc7w9lQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mgmOTrl4PxWMj0+vnZCJakGS5rWqo44J5xTYJrul/BpPCSOcgO
	Jkj69EV1VhZGXYlHhBacmqUNGsJP9m3UyX+ljyD0s7KxnpiDS56lIXiLmNlH/v+0mMXOB4Hudzo
	zzw==
X-Received: from pfcs22.prod.google.com ([2002:a05:6a00:6fd6:b0:882:ebd3:410c])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:7585:b0:87f:dcc3:62f
 with SMTP id d2e1a72fcca58-87fdcc35542mr7869110b3a.60.1790653516329; Mon, 28
 Sep 2026 20:45:16 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:55 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-2-praan@google.com>
Subject: [PATCH v11 01/16] iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Refactor arm_smmu_setup_irqs by splitting it into two parts, one for
registering interrupt handlers and the other one for enabling interrupt
generation in the hardware. This refactor helps in re-initialization of
hardware interrupts as part of a subsequent patch that enables runtime
power management for the arm-smmu-v3 driver.

Additionally, pass a 'resume' flag to arm_smmu_device_reset() to skip
registering IRQ handlers again during resume. On probe, handlers are
registered after queues are configured but before enabling translation.

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 75 +++++++++++++++------
 1 file changed, 56 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..270e6617a19a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4756,14 +4756,55 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 	}
 }
 
+static void arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
+{
+	int ret;
+	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
+
+	/*
+	 * Enable interrupt generation on the SMMU.
+	 * As per the ARM SMMUv3 spec section 6.3.17 (SMMU_IRQ_CTRL):
+	 *
+	 * Completion of an Update of x_IRQEN from 0 to 1 guarantees that the
+	 * MSI configuration in SMMU_x_IRQ_CFG{0,1,2} will be used for all
+	 * future MSIs generated from source x. All wired or MSI interrupts
+	 * that are triggered from a source relate to occurrences that happened
+	 * after the completion of the Update that enabled the source. It is
+	 * not permitted to trigger an interrupt that relates to an occurrence
+	 * that happened before the source was enabled, even if the source was
+	 * previously enabled at the time of the occurrence.
+	 */
+	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
+				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
+	if (ret)
+		dev_warn(smmu->dev, "failed to enable irqs\n");
+}
+
+static int arm_smmu_disable_irqs(struct arm_smmu_device *smmu)
+{
+	return arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
+				       ARM_SMMU_IRQ_CTRLACK);
+}
+
 static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
-	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
 
-	/* Disable IRQs first */
-	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
-				      ARM_SMMU_IRQ_CTRLACK);
+	/*
+	 * Disable IRQs first as required by the Arm SMMUv3 spec.
+	 * As per the ARM SMMUv3 spec section 6.3.17 (SMMU_IRQ_CTRL):
+	 *
+	 * An Update of x_IRQEN from 1 to 0 completes when all prior MSIs have
+	 * completed. An MSI has completed when it is visible to its
+	 * Shareability domain, or when it has aborted, and the abort is
+	 * recorded in the appropriate SMMU_(*_)GERROR bit. Completion of this
+	 * Update guarantees that no new MSI writes or wired edge events from
+	 * source x become visible until the source is re-enabled.
+	 */
+	ret = arm_smmu_disable_irqs(smmu);
 	if (ret) {
 		dev_err(smmu->dev, "failed to disable irqs\n");
 		return ret;
@@ -4785,15 +4826,6 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 	} else
 		arm_smmu_setup_unique_irqs(smmu);
 
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
-
-	/* Enable interrupt generation on the SMMU */
-	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
-				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
-	if (ret)
-		dev_warn(smmu->dev, "failed to enable irqs\n");
-
 	return 0;
 }
 
@@ -4841,7 +4873,7 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 	writel_relaxed(reg, smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
 }
 
-static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
+static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool resume)
 {
 	int ret;
 	u32 reg, enables;
@@ -4943,12 +4975,17 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		}
 	}
 
-	ret = arm_smmu_setup_irqs(smmu);
-	if (ret) {
-		dev_err(smmu->dev, "failed to setup irqs\n");
-		return ret;
+	if (!resume) {
+		ret = arm_smmu_setup_irqs(smmu);
+		if (ret) {
+			dev_err(smmu->dev, "failed to setup irqs\n");
+			return ret;
+		}
 	}
 
+	/* Enable interrupt generation on the SMMU */
+	arm_smmu_enable_irqs(smmu);
+
 	if (is_kdump_kernel())
 		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
 
@@ -5594,7 +5631,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	arm_smmu_rmr_install_bypass_ste(smmu);
 
 	/* Reset the device */
-	ret = arm_smmu_device_reset(smmu);
+	ret = arm_smmu_device_reset(smmu, false);
 	if (ret) {
 		arm_smmu_device_disable(smmu);
 		return ret;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

