Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EAD5908BD
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 17:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887856; cv=none; b=F0b2AVIcdv0l9UBTV0lWmysScFrAIhAE6nHFTss95pvxNO5A7sE8bAvUYT444R44+7Pp0QqyZnd1e3skq2Ari4fOUXMYJdhOOP2N9MPOYx6SxKldiRxk2+Ot1FLudcKthT7if3eMO/8/pauXjPFAQEbaqO7nZfUykvUHTuqPTj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887856; c=relaxed/simple;
	bh=jEIOHJab1Wfmn2ynLehmYRmiolL7FcHLiGk38dkIow8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qva+jxqAI1xccqjUhTxvAe5b5+67/VDE1G9wRXgimNpw1MbEQE2GaNWkJhHNxgTB7c6A9RGPMaVC/Q5UbPwHIDsN5iUBy+yr+8WqgD2kuwViekEAQOhFFGPzsoLnEAYAkzr+D6grOo/0F4WwgWr/z6GR3/2V5oEc1vzpsXMbmQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FCdkuJXr; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FCdkuJXr"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso6949460b3a.1
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887854; x=1789492654; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1q6wMbvWs5hyRc4lMFhdHQIXxqX9BNA101N+lgrnFo=;
        b=FCdkuJXrt5gQfk05lES0f/zgrviUfxcca3USNlKDRqqIPcbqyDvC5H0uGLUPaUk2fb
         2mGQ5wmhOYC7IBD+Z2cbungA9jW2TsnVtrgC+k6CoXoFoLT0KRNtOGloufE0Y1gHO07/
         NYc3xKI5zKDgE9iI9mzFQDwl6ZpnLdfhnt+BpsBtt+9FD7gU0S/RzruWPFunuXLHZDMH
         E1IruY7Zw2nQmwOTbdFKKjMUN2CvucdhHiiiDEuSHDar0Q/ex+Fw+eEuZCKn5Qnnz0mL
         dc8PK2xnl45MLiB0MQd7YVda/tknKCEGdp5oeiC7iUdpFPHoBsNg6JGUZy+BZnmXiddA
         dajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887854; x=1789492654;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1q6wMbvWs5hyRc4lMFhdHQIXxqX9BNA101N+lgrnFo=;
        b=T1vDezGeZNrweI2rFX4cd4dMKkt7zkKhGopVNnIdTxwACr1YyeT7um1CiGB3ySrNy8
         YkFqWNrP7pZ8YduUvBIcNRWqT7KuztNBlMIdf5th38Moqn5SzKDDRkKunhPb5qMlfSoL
         /jl9IlCcehFQN8FVpsr1fNI/SkcG1DOfrzqDciWN5huvJEV7TMeSyhYTox/n80fTbqqn
         5ksM1TlEd939sFV+6pHKTu8r8FLFeWm+DiwDoO+wgA18xJ00HOaU18QfxMMPtUgtdx1B
         FT9omR2waHdFjSN1rJ2JZbzw9cV1AEVn2kNH+zb7LZ854qBwdhj6z8DmQU43rj0ugpa6
         FKBA==
X-Forwarded-Encrypted: i=1; AKwUvBxFCfC0+WTjaZbCKW+jqgss7Shv43h+Sg5jZ6MZFtp095IpRW0ayO65x1fkPtg+uRnfFVDuFr58Crc/Ng==@lists.linux.dev
X-Gm-Message-State: AFuF++m3EYBQQbG5MYe7P05IgNRAuzs9OVyOghSWwfMdPFJ5fKP1oqkc
	lVoKOvvC3y2O/MnX06a2wQne49urkeSiMNY4cmxtBSDXDUT9X8nx00vhe5IfxLy4wsN1ueJ71vD
	uKQ==
X-Received: from pfbim24.prod.google.com ([2002:a05:6a00:8d98:b0:84b:57b7:60c5])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4506:b0:837:f111:b70
 with SMTP id d2e1a72fcca58-85ffc18995amr33657135b3a.4.1788887853997; Tue, 08
 Sep 2026 10:17:33 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:04 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-9-praan@google.com>
Subject: [PATCH v10 08/15] iommu/arm-smmu-v3: Cache and restore MSI config
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

The SMMU's MSI configuration registers (*_IRQ_CFGn) containing target
address, data and memory attributes lose their state when the SMMU is
powered down. We'll need to cache and restore their contents to ensure
that MSIs work after the system resumes. Address this, by caching the
original `msi_msg` within the `msi_desc` when the config is first written
by `arm_smmu_write_msi_msg`. This primarily includes the target address
and data since the memory attributes are fixed.

Introduce a new helper `arm_smmu_resume_msis` which will later be called
during the driver's resume callback. The helper re-configures the IRQCFG
registers for each relevant interrupt (evtq, gerr, priq) via the new
platform_device_msi_rewrite() helper.

In addition, clear ARM_SMMU_FEAT_MSI if MSI setup fails and the driver
falls back to wired IRQs, preventing spurious MSI resume attempts.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index dc2fc02b5163..a8166e75db0b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4771,6 +4771,9 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
 
+	/* Cache the msi_msg for resume */
+	desc->msg = *msg;
+
 	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
 	doorbell &= MSI_CFG0_ADDR_MASK;
 
@@ -4779,6 +4782,31 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
 }
 
+static void __maybe_unused arm_smmu_resume_msis(struct arm_smmu_device *smmu)
+{
+	/* Clear the MSI address regs as they reset to unknown value */
+	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
+	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
+
+	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
+		return;
+
+	if (!smmu->dev->msi.domain) {
+		dev_err(smmu->dev, "msi_domain absent during resume\n");
+		smmu->features &= ~ARM_SMMU_FEAT_MSI;
+		return;
+	}
+
+	platform_device_msi_rewrite(smmu->dev, smmu->gerr_irq, arm_smmu_write_msi_msg);
+	platform_device_msi_rewrite(smmu->dev, smmu->evtq.q.irq, arm_smmu_write_msi_msg);
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		platform_device_msi_rewrite(smmu->dev, smmu->priq.q.irq, arm_smmu_write_msi_msg);
+}
+
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
@@ -4798,6 +4826,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 
 	if (!dev->msi.domain) {
 		dev_info(smmu->dev, "msi_domain absent - falling back to wired irqs\n");
+		smmu->features &= ~ARM_SMMU_FEAT_MSI;
 		return;
 	}
 
@@ -4805,6 +4834,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 	ret = platform_device_msi_init_and_alloc_irqs(dev, nvec, arm_smmu_write_msi_msg);
 	if (ret) {
 		dev_warn(dev, "failed to allocate MSIs - falling back to wired irqs\n");
+		smmu->features &= ~ARM_SMMU_FEAT_MSI;
 		return;
 	}
 
@@ -4918,6 +4948,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 
 	irq = smmu->combined_irq;
 	if (irq) {
+		/* MSIs are unsupported for combined irq cases */
+		smmu->features &= ~ARM_SMMU_FEAT_MSI;
 		/*
 		 * Cavium ThunderX2 implementation doesn't support unique irq
 		 * lines. Use a single irq line for all the SMMUv3 interrupts.
-- 
2.55.0.979.g7e5102b832-goog

