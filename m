Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5840BCCB
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 03:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653541; cv=none; b=SYAQ7XiKxhL9ZkJ2XNz3wR4IVDQ1s4/iiFZWJWXkN/YlceA/ff6HznR6coYSiQqyILzQrB4V4kD4ivhubVUY7kIKYq+vzovak08PLL8GqjpM+kRAUi4hBFIUe72sA5VT+pIf+NrLio2118PaxZbOygxbQgSQNqd/L/xSLA60UK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653541; c=relaxed/simple;
	bh=hg80R4Fy3y1Gkv79OMihDSs+R+YGPlgT4tBqq7uV0O8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P6Sdcz/9sb5VIQhUJxpLXgWL+0PN/5g+qq9aIVs1VEAg6a5QRd5Z80Xi4CoB3WEkMPA4a15s3bDMVDYBI6+MBaQXb9fnE4PJNm5kuVZa3DIvnUTMUwh6LdOFVeEdAQDy/GsyeeEm5xr315ovxF5VFE1Y4XE0/DP2LAJos9oUO3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BjWnqTL2; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BjWnqTL2"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df8484f12cso36586705ad.3
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 20:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653539; x=1791258339; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVWbroKeyy/vXGetpyerZbPvNTfOYuPtP3zO4UmiVu0=;
        b=BjWnqTL2IS+DqyXZibMScFlsLDvtgIQL3DdGb8edhSeZAo2dLKKvQ7QTF4CtqMGiAI
         UPfIdPjOk/yPuOBUmFEPDV73lEXxd4a/7ODMEXuK7qA/c/h0cY1x3iAaX8PZA+ZIFMz4
         5yiHx2Bf5ny1KG8F05ja15YnxKOQmTKxtlb6Qa+QNXuGmxfqg36ul8Utsv+sKAdeNqC3
         alMGZcfPAVz8n1Ne8OqGV3MQ7vn5XZtrxcjkdwRajxn7zFyCKEPzrOvPhLx3abYpZPou
         EEakOc7dcBS7cMw+Qjc5gfK83M/Y+DmD8qNZAEvFVYK8EaoHSf84+pTcLn8m8xU0Izxv
         IvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653539; x=1791258339;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVWbroKeyy/vXGetpyerZbPvNTfOYuPtP3zO4UmiVu0=;
        b=jj7sWAvwvj3V1iavRftNGAmWNylNHV7pQG5+OX8x3xIGWlsMzUCnKsLt+EDNBwoTfv
         /mGPgI2XA2uhmkE4qrmutRdDPjoYX/Blh/XnouWdgNcCIxCS07NdIHHAoC6fABSuJgB1
         XO1IikLpIMiWfEq4xxR4IZiNyT0mNKzWFrtel9Au9D/jcn/MeY8wd1siiYVRk4c2C/lL
         +T76TxoSvOO7EQ0f55U1UWW1ZDu4YcFHtn6LClTlpA8i0V0ux3KpcU/TwoqBF94AJFKw
         TQ6VJ/uvCoGbvsmgsnZKJOnPBuvDe0eON60EtddxhKGZQgd1fY/sg6TntdDZwr/9NIVT
         gzbg==
X-Forwarded-Encrypted: i=1; AKwUvBzS0a0Y90wYl0XmOUTzopSEHWw+SMFWTRNWC/Tdny++H2hVXlvBg1Qdgi5DlwsHMb8w8rO+PWXL0/MM5g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ5HBXQNgB/+WXjiXF8xHPdyxx5aqAZkt2WZkZdH1H1fPzhgzMc
	hQ1wRXiLA8iTmQK5t9HLymeENp5PcaQmPtfms3MP40hhFZtKN9GAE4l75GzkldSK17zqHeOPEBo
	hVQ==
X-Received: from plqu23.prod.google.com ([2002:a17:902:a617:b0:2df:9ebf:232b])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db06:b0:2e2:c84b:43e9
 with SMTP id d9443c01a7336-2e2c84b48d6mr8655125ad.1.1790653538595; Mon, 28
 Sep 2026 20:45:38 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:02 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-9-praan@google.com>
Subject: [PATCH v11 08/16] genirq/msi: Provide msi_device_domain_restore_msi_msgs()
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

From: Thomas Gleixner <tglx@kernel.org>

Devices that provide the message store for MSI interrupts in their own
hardware registers often lose that register state across power transitions
(such as runtime suspend or system sleep) and need to restore the cached
MSI messages upon resume.

Provide msi_device_domain_restore_msi_msgs() to iterate over all
associated MSI descriptors in a device's MSI domain under proper
descriptor and irq_desc locking and rewrite the cached MSI messages via
the irq_chip hierarchy.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
[praan: Use scoped_irqdesc_get_and_buslock(), fix the xarray range bound
 and write the commit message]
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 include/linux/msi.h |  2 ++
 kernel/irq/msi.c    | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index a4613de11960..44d551e85abd 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -669,6 +669,8 @@ void msi_domain_free_irqs_all(struct device *dev, unsigned int domid);
 
 struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain);
 
+void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid);
+
 /* Per device platform MSI */
 int platform_device_msi_init_and_alloc_irqs(struct device *dev, unsigned int nvec,
 					    irq_write_msi_msg_t write_msi_msg);
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index df460a574d80..8fb855b5e09f 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1784,3 +1784,40 @@ bool msi_device_has_isolated_msi(struct device *dev)
 	return arch_is_isolated_msi();
 }
 EXPORT_SYMBOL_GPL(msi_device_has_isolated_msi);
+
+/**
+ * msi_device_domain_restore_msi_msgs - Restore MSI messages for a device domain
+ * @dev:	The device to restore MSI messages for
+ * @domid:	The id of the interrupt domain to restore
+ */
+void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid)
+{
+	if (!dev->msi.data)
+		return;
+
+	guard(msi_descs_lock)(dev);
+	struct irq_domain *domain = msi_get_device_domain(dev, domid);
+
+	if (!domain || !irq_domain_is_msi_device(domain))
+		return;
+
+	struct xarray *xa = &dev->msi.data->__domains[domid].store;
+	struct msi_domain_info *info = domain->host_data;
+	struct msi_desc *msi_desc;
+	unsigned long idx;
+
+	xa_for_each_range(xa, idx, msi_desc, 0, info->hwsize - 1) {
+		/* Only handle MSI entries which have an interrupt associated */
+		if (!msi_desc_match(msi_desc, MSI_DESC_ASSOCIATED))
+			continue;
+
+		scoped_irqdesc_get_and_buslock(msi_desc->irq, 0) {
+			struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
+			struct msi_msg msg = msi_desc->msg;
+
+			if (data->chip)
+				irq_chip_write_msi_msg(data, &msg);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(msi_device_domain_restore_msi_msgs);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

