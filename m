Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD0B526AB1
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887853; cv=none; b=jbBdrumKdcCeKXuh67YmZmEcVfYLGlu1ghZvbD+lO9rJ70MRGeCxSsT/YmKCoYTjyotqOfFdP3KPZpLBvjYaNbxlaCEDwi6wUWhCeCOYF/OcDbcxk9Pr2YXPzwN4e+sXik7Cp/WuUS1CsFt8TeoU6BGVFQxZiMI/n5uyzEpR/BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887853; c=relaxed/simple;
	bh=vMT/cJ3zaoQMUvK8SnLuLj7FZMK4HGZ4xexVkc4OlV4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oLV6qQYSiL2ev8loLyuSRKJPyYcsW2AHZZr1NTK0kfx00Q2xa8O8GPPcGjWetCJbvczN4Yy9HI9iGqoBrqYjkFagKfXiOx6WZ1xQ9BgOtK8KNrs3brWJELHVAMuTCmzXstdSsClkqU04t2V8BD9mLpC6EYFGLKKGAmRSgNcGlOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hSE7pGfH; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hSE7pGfH"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so6021805a91.3
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887849; x=1789492649; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XsMPvOE3afXsZVMyFMwLpKgTSpBthouLl9Pg3MA9sM=;
        b=hSE7pGfHeFP8M5esD8fzrXaMKwtrp5r0jsxAyJSz3REh8RqsM+/S61Dt+bYvYk4el1
         vPr/RYlv7Re+1kmRPyxh/RjaEOsK9nSsuvXbrDZmZyvEA0Ma9FLcA6X2aCY6RiysrbB7
         FGxIqz/y8M4fIwNflvoxMxkxrjSJ1EZDPOWSmuIU5Atyh1cMTpYTGjFDO+KlY7HAzLiw
         6vw/aIsgWEPUOifZ14EwE019h2tct63c/D54kGoS61P5JwO3RUZdisJqOSf1gRlLen3b
         qRhPcBN1tkgVhee+eoVEfegkFjFQ19Hq+eRlS4uyFvp3wwXAD4BOGFXSKWczcGsePo7W
         ZPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887849; x=1789492649;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XsMPvOE3afXsZVMyFMwLpKgTSpBthouLl9Pg3MA9sM=;
        b=Yul/amDQhmdRcSh2Jb5Tbx2KzTdwimIk2ztxTU1C4OiFB2qCCraT71B+rjvNTx7ceC
         om+ukvgaTL/lssFCRCbqPNCfz691ED54BPf+kQACcXA2ghBH/jZeFQVDjF4ZvY0n/JIm
         kqc1ChLgE1SXUoEc6y3jPAm1UC55NaGuzxVRtabjaEvKrMWppbwqQ+d06Sn6dd/EYkX/
         QqORcMQWXN3XgaSlxVHwwGUnTsIhUyx1ekM9mmc9VVXq0DBumud0vUadCRb+juSaw8YA
         E+QH4IrnnBsZ6xK7jsxvlyFkw4bwt46RknyND85CnWEQkQVE8dZz+Za6oytsdjrAW8t0
         Etwg==
X-Forwarded-Encrypted: i=1; AKwUvBzSTHCZG1xvnYgyNEFx5OzSWj3F+MnEsYI+pvlNq/xm8g8KhF/ch6cNUSCHsACHkWJjvcZvtxKivz38LA==@lists.linux.dev
X-Gm-Message-State: AFuF++l6MCNPdlyesn1atyLtjfZLdbyJZROv1EWjNHEs71s6YHFH/hH1
	tKefhckLq2nioPbAbmPlory22YgYXfKWihrWbeeki0+Q6cBK8Aque6d9yYa4kxNsXa2JJHzXqPd
	PXw==
X-Received: from pjbmv24.prod.google.com ([2002:a17:90b:1998:b0:39b:4485:d746])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:528e:b0:38e:ad9d:1161
 with SMTP id 98e67ed59e1d1-39b25ee67f0mr45919989a91.0.1788887849350; Tue, 08
 Sep 2026 10:17:29 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:02 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-7-praan@google.com>
Subject: [PATCH v10 06/15] iommu/tegra241-cmdqv: Restore PROD and CONS after resume
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

From: Ashish Mhetre <amhetre@nvidia.com>

PROD and CONS indices for vcmdqs are getting set to 0 after resume.
Because of this the vcmdq is not consuming commands after resume.
Fix this by restoring PROD and CONS indices after resume from
saved pointers.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index a394bf0f487f..c7989fcd2c62 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -567,6 +567,16 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 	/* Configure and enable VCMDQ */
 	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
 
+	/*
+	 * HW Registers reset to 0 when power-cycled. Restore them from their
+	 * SW copies to prevent executing stale/ghost commands after resume.
+	 * Note on RPM: Power-cycles can never happen when VCMDQs are assigned
+	 * to the Guests since the relevant frameworks (IOMMUFD / VFIO) hold
+	 * active PM references preventing suspend while VMs are active.
+	 */
+	writel_relaxed(vcmdq->cmdq.q.llq.prod, REG_VCMDQ_PAGE0(vcmdq, PROD));
+	writel_relaxed(vcmdq->cmdq.q.llq.cons, REG_VCMDQ_PAGE0(vcmdq, CONS));
+
 	ret = vcmdq_write_config(vcmdq, VCMDQ_EN);
 	if (ret) {
 		dev_err(vcmdq->cmdqv->dev,
-- 
2.55.0.979.g7e5102b832-goog

