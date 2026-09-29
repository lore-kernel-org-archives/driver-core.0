Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218883E4107
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 03:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653538; cv=none; b=kmV+Ds2O1VS2yoPgrrENoaEON4OQwjtmq3RnX/hkj7A5pZoKja91EkmZ2LlisKKpgSyOBT0n0j8X/yaXYxshK2iYfLBu9d3RGc9q/d+Kn9uyrGPGn7LqVfF/hZtvpjHcO718KJSZxijoRKVAirvU/16qjmIgD3yQ0mtK0IKnv5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653538; c=relaxed/simple;
	bh=fBsvcJTGySkCd+eb4363p1Jk8F2h4J7YsqmmUHp9hgU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W6GOwZRbLjxk26ZVs7iwvpex3Mk3FnE7ROCO4S9wVmv14xyb59YRkZHvT8FbX0SfuzcS8V53iPI7UOX2wGIa9Z9lWfzK3xCSGdpMSzJ+FE31LZmgQWVXX08TXcUW0WIbmN6pOz0Ua+BroRDLLFy7Sj75fkTr8AWi7RT2mZaLnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BOQxmVHT; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BOQxmVHT"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8696b921ac0so3093044b3a.3
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 20:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653536; x=1791258336; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTnb5gdEOwnPdz4JRroX+sFrer89MQl7kw/S2QGLtV4=;
        b=BOQxmVHTcKX5Ee2YPNap7Q33dNnVa56rkiAcxH26Z+7OK4uOURbq28Y+Pnh6CLA8f5
         aLPXr6uqpwMdr0025ugAusxt+6JOp0sdWHB1wdkbHWbpiM15r7bLqRMh3UFhWl/3i/JP
         ahF0l/62qXcFlm2E0PYOW3J/ZmZIQ5Yc36elQjtLlmXnW3jRtVmnBtz+Rv2hFcICoQIv
         VZbBXbu8rGn6GJekNeEwjyl78mSfBGQaj9/kv1c/svT0J+FaVrSxdN4oHbekTkkNpLgH
         fFH6Q+Wzgy9LUPKfNkgZivkXjynHZzbfg3CuongAutb1G57D+MIgLUOTkuQ8eFDNpjQy
         2P/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653536; x=1791258336;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTnb5gdEOwnPdz4JRroX+sFrer89MQl7kw/S2QGLtV4=;
        b=KiAb+agP4+ucMg1Wt2BHHNIBXVGZTi3w+9QN1s4JxJ3UQTS3SFzUSvIRuvHyuTqdm9
         lMyS8O38jhYIQMQx0lnO27yG5oALp46w7MaYfDwFZk/OjeBcxWM1hGmWyTGnUHYzQWOB
         a8V9AamW6jcHgAtxCdjnkk+ZBEMn/WYi3CF4NMTmz8gnedvf6UbRyWZKJvs9L0ZouyXx
         mYpOhHsSImxX9MkQ502zDVYEc26VZgNVBFSQg1gkrOaGjDKXLaQC4ri9bXe/ikjPT4eV
         0REwoiO/S5uRh3CBW+1dwmGZF8Xc6gk6qrOqu+aYli1TKv2rQOEfdL2E6u7lkYTc+xp8
         kIrw==
X-Forwarded-Encrypted: i=1; AKwUvByzYk2OBmlBUJk+mzvkg7ZCm5ZktFBlCFlq88SMc4JtZo0Ju2NvC1hqjvY2tNwhV8jj6+Mo96fKC0mrXA==@lists.linux.dev
X-Gm-Message-State: AFuF++l4z9H32OUCN6JRe7UDtqdklJW6vCGVAuvpyCkzn4s+pg72vv9q
	/TFahbfGKeIOtD20lqihv1iaRrtk0ApcJ+gVTJ5B0XFhIqWmd8H8rTrc1D/WvwQq6fBM478wwd2
	KQQ==
X-Received: from pgbdp8.prod.google.com ([2002:a05:6a02:f08:b0:cc7:a092:edd9])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e38b:b0:3de:67b8:26bc
 with SMTP id adf61e73a8af0-3de67b82a79mr3606310637.30.1790653536063; Mon, 28
 Sep 2026 20:45:36 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:01 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-8-praan@google.com>
Subject: [PATCH v11 07/16] genirq/msi: Cache MSI message in irq_chip_write_msi_msg()
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

Currently, PCI MSI caches the composed MSI message into the MSI
descriptor inside __pci_write_msi_msg(), whereas platform MSI and other
device MSI domains do not cache the message in the core, forcing
individual drivers to manually copy the message into desc->msg if they
need to restore it across power transitions.

Cache desc->msg in irq_chip_write_msi_msg() before invoking the chip
callback so all hierarchical MSI domains automatically record the
latest message. Document why the redundant assignment in
__pci_write_msi_msg() must remain for direct callers outside the
irq_chip hierarchy.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/msi/msi.c | 6 ++++++
 kernel/irq/msi.c      | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 80a9db417dc8..f7bedc31d486 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -257,6 +257,12 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 		pci_write_msg_msi(dev, entry, msg);
 	}
 
+	/*
+	 * Although irq_chip_write_msi_msg() already caches the message,
+	 * keep the assignment here for callers that invoke
+	 * __pci_write_msi_msg() or pci_write_msi_msg() directly outside
+	 * the irq_chip hierarchy.
+	 */
 	entry->msg = *msg;
 
 	if (entry->write_msi_msg)
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index fb5f372215bf..df460a574d80 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -634,6 +634,15 @@ static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid
 static inline void irq_chip_write_msi_msg(struct irq_data *data,
 					  struct msi_msg *msg)
 {
+	struct msi_desc *desc = irq_data_get_msi_desc(data);
+
+	/*
+	 * PCI Multi-MSI shares a single descriptor across all vectors and
+	 * the device stores only the base message. Cache the message of the
+	 * first interrupt only, so that sub-vectors cannot overwrite it.
+	 */
+	if (desc->irq == data->irq)
+		desc->msg = *msg;
 	data->chip->irq_write_msi_msg(data, msg);
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

