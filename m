Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291FC3FF1A5
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 03:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653543; cv=none; b=fIc4jmAsPxZcaPt5IyevYAfMzEGNhvr/7PGIOXZrWNSvgGkJ4/JwQRNvWZx8SVQB/Q/YfMjccPEIpK3zQXO7Foo610Ghed2WyiX6P5M/bVGDN+o8Dg9JJoYK/gCqlGmUGPh/u+DWC8Zk4f++Iklpg4rCCOlBL5PZlZNJg5PBtfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653543; c=relaxed/simple;
	bh=rAWcJCCi9A6gOKRWLlYQUftC1yte/SSOlRW13UF9bXE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=giKBI3sS6RUzC68HM9ru94fSJoqnhbojZU8gkOBHmlihPPSXqfZ3Egf6CgjIh+gVGBglQv+WmwIGrNv1B8fhQJK7zG1wFTmLtCW3DWkrhvCfF00Of/1EVT3vtLKZO2Rgv9Nmi/+3G+l55KN2Z+1hO7aiBmtENL5cJQqNCfeBudk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q9JoblNB; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q9JoblNB"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso5561273a12.3
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 20:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653541; x=1791258341; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWQbzPnJHI/UQ6xRoFaSMFgVnf7una/rhjMJI3MVJUs=;
        b=q9JoblNBbojPSTLgb4A8Z6jSgWJ833VfeHrLynAZVR1VTcyNKaHeptQ34KWYF4L/9B
         ZmkDVVNRnno99g2Cv1Xs2amAp7VkUXXwJN3qUnHjTF3ZS9pUzdf2EqAtblYgsuwo8mFA
         qYhT7G58dMqyJ7VeBjmbXooBNTdihFnYO2OOFFvF/5NwafOjjSixReFPS4oT+TaoNG+t
         tq1I+5E4StspQfSHsHPhf72ZiZAjA72fiPda+XTj9XxcQ8eqV0ZXN734tlQ0SlNdm3/u
         y//ZyIY4po1AM0p+H7VGRl7nbba7wTNj78XcX8QfJmeIzXxsMui4jpBPfvMk0h9f1RG7
         GEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653541; x=1791258341;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWQbzPnJHI/UQ6xRoFaSMFgVnf7una/rhjMJI3MVJUs=;
        b=TODgayjq4QWWeOe7qoDFOTOkuHTVwcxrOJ6696Mo3KjD9KjPlwtgS4/RuA0W/NgCoW
         wUZ4nuaWuAH0PGk1cKXpYYe8N/EKfwgMqEkr53PG5jMTfJc3gDD7RWm+viGnORv3ucyY
         cPAU10IiLSmYyMq8ZmQmqXYMbH+weS2yg1PB7oWJLVHprzK7f83xpGbl6rzAoGVUcg3K
         i4DUo92SiD9q+GClWwghs7U6iGqmX7k4G1jVABIY04mw1rJmmgP2AqS+OATyih9ShCS3
         yVG41D29YaP5fEhFlTKwLSK7qEojlezWfI/73BQ/huTZG4SrYCSNoMbJ3VkHY/IZDa2d
         hgXg==
X-Forwarded-Encrypted: i=1; AKwUvBw2O52GDo2xqsf2YdfKrjJiVa2cIcu6p6ZRZRppR/8dYc6P7+7iAeCVRfHxumLJhuTenhCqknJdJ54Z5A==@lists.linux.dev
X-Gm-Message-State: AFuF++mUa87mN8nRlL1N9h9CQ/sl1aQKe7iVeJiEochCPIH3F4FO3NWb
	T/Tk+o7XIN474VGIE29VJUna85m+ymhp3jCy8JA5CeHRXFN8TveQfT4DsmiOdfsEOh3kngRF95b
	VVQ==
X-Received: from pgc13.prod.google.com ([2002:a05:6a02:2f8d:b0:cc7:4d12:8a9a])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4324:b0:3d1:e510:9052
 with SMTP id adf61e73a8af0-3de0e6f3973mr13463950637.7.1790653541112; Mon, 28
 Sep 2026 20:45:41 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:03 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-10-praan@google.com>
Subject: [PATCH v11 09/16] iommu/arm-smmu-v3: Restore MSI config on resume
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
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

The SMMU's MSI configuration registers (*_IRQ_CFGn) containing target
address, data and memory attributes lose their state when the SMMU is
powered down.

Introduce arm_smmu_resume_msis() to zero the *_IRQ_CFG0 registers (which
reset to unknown values) and restore the cached MSI messages across the
device's MSI domain via msi_device_domain_restore_msi_msgs().

In addition, clear ARM_SMMU_FEAT_MSI if MSI setup fails and the driver
falls back to wired IRQs, preventing spurious MSI resume attempts.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index dc2fc02b5163..7347d3ecdae8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4779,6 +4779,19 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
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
+	/* No-op if no MSI device domain was instantiated (e.g. wired IRQs) */
+	msi_device_domain_restore_msi_msgs(smmu->dev, MSI_DEFAULT_DOMAIN);
+}
+
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

