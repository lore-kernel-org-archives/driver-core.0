Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52933F23BF
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 03:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653529; cv=none; b=Ti5EXj6ArCMApczjG3uNXAkxMAhWuVu2UyGxANvCSrzJj15yHw4NFfXPTy/kRNlpNzIsYExP4lQGzy7t9LwR6ak6qtrbRD9TPwBvmaDbF5ltqaI16OLHug15oXMGOUr5Rbl+7Im9dV3yana5E0XDuwuh3qiDC2rhJ9GfGd4oA6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653529; c=relaxed/simple;
	bh=SuJ0VJDw+vh7P8OkJfHaGZVisnLRpOyIShpAsEtDHfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TzftI2zN4ek7nZC1jjolIUcczHjY9dTMoJ1EzzKa/KepDUShl0p++gMLS3WNj6rlhF/n7qMM4YqPhnJNe+pjdoQsjTMj86+F0sg/aDQIFgnwFHGtHiS/IBZ9iRA36HN7IrYKxGtmj9IcnjmckTv8XKMMd8dbC4bER9l3DF2GzMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pS08/8ue; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pS08/8ue"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86917d18880so2770428b3a.0
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 20:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653527; x=1791258327; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnUSb4lP0yPlj/wu8X8ngRGHkepeNm6ppJnOg67H/0o=;
        b=pS08/8ue1WnsoTOjII9XBE+gQ9615h8R5rk8R/lyUjiLhnRonXRkUXEOoLkTjZRRH8
         b2ECkGbewGTXQuUE21vx7nrzasszng9y8uAA/5DE1OF5AggiAMVpwa4l5erW8WBVAYMt
         lOhKv+QnpwInk5Scz6/SfKJJGNpC8s7HXGwzjKE349JvpMCw16vRPaRPWSOz+aVWJTWt
         aZnPeF9uYR7s/dF+yMr6VNGwy/9AANmjGxewI59jjTePHOp0cUeL5CNBZWEnJyUELjWT
         YLAzrZK76ewZR7vv3ub0IYHKmTrewIcSYnAboStjyiQif7L8xExhES7ooZxAB+jdSdXK
         iIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653527; x=1791258327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnUSb4lP0yPlj/wu8X8ngRGHkepeNm6ppJnOg67H/0o=;
        b=RJKMeditAMHhFlEUYQnUGJBGkmczKC5C37TcfjMz/8v+Z6glGzrjNZufFiIPqO1q/F
         LA9fWG46pQFm4v+y7Xgm4Tvaq3vyKxEJQm12vffYW8EbBbaYj4HXxATUyVyJzgUGwJ+o
         pC6NpKxegd0pNhhdSdOvwMcW3hUo31MI5huiUQZrhbOHxEhL79FAmWZm7G4r5rFscZQS
         7fRupm9vSR8oJ+2ggutuzYa8KZRsIcikZz3mLCSHgL0UK1UsqoBlA/6MlS09xsVPZ2mY
         Vl79QaNkgM+g4L2/+VobpOuv40YyJ8k6AsdhisBgymBJbhslKLJWHFFVnCaiIBrwAA9/
         u1aA==
X-Forwarded-Encrypted: i=1; AKwUvBy0P2t8aHrALvPulQCqFB9Zza5yzogBPlww4lQux28qPAm90VLRtKniSHW+kQcWkXQmDhywI32s3qb1Ig==@lists.linux.dev
X-Gm-Message-State: AFuF++nbo2xTMhNIs5slSN0WUJ3yR2MKlqxkzxzGJcLbLJHmrWVDH58N
	L1Ncl8EX3bZlLIdM+/CpaidUCH8lxlwhb6IMMyy22wyIheLtwUL7MPg/8ik0XJ8ppuI5SDme6Gn
	6rA==
X-Received: from pgdh4.prod.google.com ([2002:a05:6a02:5184:b0:cc7:b470:94ff])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2583:b0:3dd:85a9:55b8
 with SMTP id adf61e73a8af0-3de0e8b481emr12791744637.35.1790653526784; Mon, 28
 Sep 2026 20:45:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:59 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-6-praan@google.com>
Subject: [PATCH v11 05/16] iommu/arm-smmu-v3: Add a helper to drain cmd queues
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

Before we suspend SMMU, we want to ensure that all commands (especially
ATC_INV) have been flushed by the CMDQ, i.e. the CMDQs are empty.
Add arm_smmu_drain_cmdqs() that drains the command queue using the
arm_smmu_drain_queue() helper.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d809b625f7fb..dc2fc02b5163 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1028,6 +1028,33 @@ int arm_smmu_drain_queue(struct arm_smmu_device *smmu,
 	return -ETIMEDOUT;
 }
 
+/*
+ * Lockless, the caller must ensure that no concurrent command submissions
+ * can happen (such as during suspend where clients are already quiesced).
+ * Polling until PROD == CONS ensures all pending commands in the queue have
+ * been consumed by the hardware.
+ */
+static int __maybe_unused arm_smmu_drain_cmdqs(struct arm_smmu_device *smmu)
+{
+	int ret, err;
+
+	/*
+	 * We skip cmdq locking here since this helper is only called
+	 * from contexts (like suspend) where the caller has already
+	 * ensured that new command submissions are fully closed.
+	 */
+	ret = arm_smmu_drain_queue(smmu, &smmu->cmdq.q, true);
+
+	/* Drain all implementation-specific queues */
+	if (smmu->impl_ops && smmu->impl_ops->drain_queues) {
+		err = smmu->impl_ops->drain_queues(smmu);
+		if (err)
+			ret = err;
+	}
+
+	return ret;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

