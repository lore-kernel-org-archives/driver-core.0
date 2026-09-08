Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16395921FD
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 17:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887854; cv=none; b=Wd3CH1d1GORc6D5XEfFon+18KCvY3Lmx1vdqaYloLiqPTCRY1ljNjneG3xMixRsx+TIiZsB/XOuRIO9Mve76xn9sM7k2YaS6s3QHSBDQACaH0L6d3D6f3zNWqKtXFatrnY+fhiT8jDj3aISOGnMESNxl5fOBeNF8Z3weFB0/7no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887854; c=relaxed/simple;
	bh=C5uAJUyLYWWpIdx9dxkBviYTtWet+XiQNOrYr81Ody4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o8f2UT1md/aVqsUjj+4CNlMiT7rrY+YzmbKZVJ9HxwJkCh1FPLCELCMF4JzwGwpJhin98KNjXPNnt5NYkVSO+SthrDgYQAqtC6SQT8FdIaz0+TzCMlCIYCenG+cZWvcdBj+3NkToKbdKm6JFqQYXsc4HzpGRQjutoJvz4aif6S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OK9Qawm6; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OK9Qawm6"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8627258ef12so2515433b3a.2
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887852; x=1789492652; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZQ96GtbiVZMUuZJG5wzZJpcCp+T4Rvb6Y19B34gIxE=;
        b=OK9Qawm6pd9NcfqMemKMmhgel5pPvAoLailkJWlnOznVAmJ5iXzp/84IVRW6S1/CUe
         rPzRVKKKsh60O3Nw9f+P+JNiKfG4BStoMIiljuaKd/GSv6wEddVOrPdXF1iyoNuDIJ1m
         3OxnWfjYCYwXeNhTrkrscpSXpe3oVgP8XV0b91IhFUx9xWxVHpCzFXPMnHrfury29Sli
         Qi+A6ujjdLP8TVW35DMHCBRgXMiMlMkBi+eQTPhP0S6+tr9+Lu3rzHQGgU9LwCnk8eGH
         HxbyMprlOoL5u5CTJLIZVUdIBLgEudQmiQOzRZHw2d+5IPF7kcUUb4Q0v3V9w7Eptaax
         oB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887852; x=1789492652;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZQ96GtbiVZMUuZJG5wzZJpcCp+T4Rvb6Y19B34gIxE=;
        b=Kvo6jPj8C5nzzhLubQF69EBgIy8kIIGHXFWs7sRm47xF1Um6qSInLL4JYd8KEUOpbU
         2H0oQPmkmFJjoYa83PuReSyxw5r90DeLXv1mx94xzXRp1AjwBcVc7fIBm0N4nrKYCcLE
         dX96lfs3waz/KQUAUxVNFrxi6DBVolg7h/T0q0szoEIwDgM5l5OtG02ByF6ZPciysr8v
         P8Ard4mlJhBl/sPwkGdZNky1XuRSfdRWBRJrf1mcct0XAAY3WjRjzOb5QJTiXB2bvfBy
         vrxMNMKYY866Mzc6d5H0kwe1+IgeoS+WwyVljLrEwV9YJj/Y/6UP7IpsTot3nOfqsQCp
         Lydw==
X-Forwarded-Encrypted: i=1; AKwUvBwi5ZxF5Gk1mizTXW3deY0Yy/3rroVDviI1uHo22vwaW3CiufjpuRFCtNYp9boQtPz+Ft0XgQhE/zHJqg==@lists.linux.dev
X-Gm-Message-State: AFuF++ntC3zUYHzr1kHFzrC0SG6AAO06+Bj3DRJdMx6LimYAwuV1iu0H
	KIz1aXa/Wo7TSW2nkwrSV4o3EcP+wSo7iMrZ5wjpjEXICdJNJivRRQCLvg8+PSoZLRQGCqfhKLR
	qdw==
X-Received: from pfcg5.prod.google.com ([2002:a05:6a00:23c5:b0:847:7f5d:6b90])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:17a1:b0:857:726d:2708
 with SMTP id d2e1a72fcca58-8616c645061mr40446869b3a.20.1788887851696; Tue, 08
 Sep 2026 10:17:31 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:03 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-8-praan@google.com>
Subject: [PATCH v10 07/15] platform-msi: Introduce platform_device_msi_rewrite()
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Platform devices using MSIs often lose their MSI configuration registers
during system suspend or power down. Add platform_device_msi_rewrite()
to re-apply the cached MSI configuration for a given IRQ using the
device-provided write_msi_msg callback.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/base/platform-msi.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/msi.h         |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 69eed058eb20..022febf2da93 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -94,3 +94,40 @@ void platform_device_msi_free_irqs_all(struct device *dev)
 	msi_remove_device_irq_domain(dev, MSI_DEFAULT_DOMAIN);
 }
 EXPORT_SYMBOL_GPL(platform_device_msi_free_irqs_all);
+
+/**
+ * platform_device_msi_rewrite - Rewrite the MSI config for a platform device
+ * @dev:		The device for which to rewrite interrupt
+ * @irq:		The interrupt number to be rewritten.
+ * @write_msi_msg:	Callback to write the interrupt message for @dev
+ *
+ * Rewrites the cached MSI message for a platform device.
+ *
+ * Note: Platform MSI does not automatically cache composed messages. The caller's
+ * @write_msi_msg callback is expected to cache the message (e.g. into desc->msg)
+ * during initial configuration so it can be rewritten on resume.
+ */
+void platform_device_msi_rewrite(struct device *dev, unsigned int irq,
+				 irq_write_msi_msg_t write_msi_msg)
+{
+	struct msi_desc *desc;
+	struct msi_msg msg;
+
+	if (!irq || !write_msi_msg)
+		return;
+
+	desc = irq_get_msi_desc(irq);
+	if (!desc) {
+		dev_err(dev, "Failed to get MSI descriptor for irq %u\n", irq);
+		return;
+	}
+
+	__get_cached_msi_msg(desc, &msg);
+	if (!msg.address_hi && !msg.address_lo) {
+		dev_warn(dev, "No cached MSI message found for irq %u\n", irq);
+		return;
+	}
+
+	write_msi_msg(desc, &msg);
+}
+EXPORT_SYMBOL_GPL(platform_device_msi_rewrite);
diff --git a/include/linux/msi.h b/include/linux/msi.h
index a4613de11960..72b0d36160d9 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -673,6 +673,8 @@ struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain);
 int platform_device_msi_init_and_alloc_irqs(struct device *dev, unsigned int nvec,
 					    irq_write_msi_msg_t write_msi_msg);
 void platform_device_msi_free_irqs_all(struct device *dev);
+void platform_device_msi_rewrite(struct device *dev, unsigned int irq,
+				 irq_write_msi_msg_t write_msi_msg);
 
 bool msi_device_has_isolated_msi(struct device *dev);
 
-- 
2.55.0.979.g7e5102b832-goog

