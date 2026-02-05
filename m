Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C49132D7F1
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325229; cv=none; b=KGuZuispQwkSkZZSd3CJCHPaZAaHBob+9p2RNXt972xgPsD66oO7B38vK0xhtYdluFXmPAATnuR4mBcOcTwfohI2tnafRGiW2fIuPfDFH+/ASjeCItFuA4wKuSzm8t6RY/CLazelpAI3RlVnzmungh6Zq/z5oIWDF+95KuUAjn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325229; c=relaxed/simple;
	bh=rV6qi9tLa8BSeGhd9naq45rlh6qRoKLszIak7MQlwuA=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=BmjJKAmaC2Zjgsm+bpwGUNWKWnCG2eZttEpx54LPtBAm3XkkLjX8ieEpKI/temk3IXgChvJObsZ1O46CBAMWbPAtS/pbocahK6k3E1YH2oFcVXpcAictdhO0O1wF7SrGcBy0l1IIXsB6MYNWhN/13GO7vw12xxeLDhdUyzXMXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ObNepT1m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ObNepT1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
	b=ObNepT1mq8yMfb1Y/UcuH4xLRbyrUjhiIjztVdQUGbRKBYOJ3byMsVmGvWvmcz1f46EPQW
	d/uTJGFOhioYa+LTxUSanV8Ih/GRJAyGtJPPguNxiruSHutFrTfQhWjHb8VayRgUZTc9t2
	DYsWYWm/OjIQQIJ88kf0YDQeAtLJNjE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-_MeEV9LJOBmtf-0hvBk6_g-1; Thu, 05 Feb 2026 16:00:26 -0500
X-MC-Unique: _MeEV9LJOBmtf-0hvBk6_g-1
X-Mimecast-MFC-AGG-ID: _MeEV9LJOBmtf-0hvBk6_g_1770325226
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8947c4398c4so48674086d6.3
        for <driver-core@lists.linux.dev>; Thu, 05 Feb 2026 13:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325226; x=1770930026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
        b=E5mW+mRvN+eJYDj6dDYlno6akwynyLFHbVgNmyN5VQHeWfprlfIOyvsYHYojtwvgyZ
         vOAxdCdNeutrvAc9ztO9KoArATPraVMY6QPG+fC5AVuhNRcB4H2u33y0ygI+M7987/C+
         u5bt76ENZDZM+/xsDd3Cpgr6TNMl8UxbOkPOPIq0HxGXZ5jTyxBykJIGPdtmiKWK02dx
         EeahxdxV08Z60Y0aQ1k2+44h2QggLPQFiF8WCLe+/VaOCyLdWdZxjuROGpbAwlIKAONu
         KNdeVUaXMncc9kRLDTltPyEwrS+7mY0GprWK9UZ1L/k0esbXk4Pss/VUqJrUbNI0MYtQ
         iybg==
X-Forwarded-Encrypted: i=1; AJvYcCXsD2Beg/Hd8O9sHOMh0mRW5kSLEGaTs07H0xh3/zM8yYJuzl7ILpU089oDjELdKym2qUmxMeukzposAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhHHnlrgzOHPQo6g4wpuwZwlbJyIK+uEBEYEYyz/B9Oeb8yq1l
	FXt9d+6kq/RZ2YjEQhKVMxn0Xw/GP8T0qHp4/JXwoOSD9r1pP+6rwRi8QUC9tTxC6hba2U7/8Fn
	kx5AyiWx0DlJOR2SEGGbQPOfXPa5uHuiMGY29WcnP13+k1P5v3Ya1SI/+yF+nEp2W
X-Gm-Gg: AZuq6aJudPlMSmKv8Hp84DinYOd3CyiNOlltuYRkgcoGOf2MKLIrN3pidBitZPkVZjx
	135P+2E35tWZm9PW0eXR5jC28yDm7o0nd+XJM6prpirvtMXGs1RvbJny0y0ciOeBBNeXi9QrPi7
	4APj2nAm01kJlMNY1AHqb4112E7EZJYIgiujgC6POy5WDNjwNSEF4dn7w+4ydt4iC+6MFWk/V6M
	4xVK4OKECC9EEl7irKIIqcikLr51pKNhuasnTv2ODZM1AcKPdUuNBCI2pRNnc1Q9ejBltrxoDle
	LSl6dFghdYFY1mPKOwr0CRBfhr1e3zacJu2v1zN0XLqOi3zlM7KuFqlxeO69sCcvjqW/mmWcQ4s
	PTYz1X2t8oTrlZh0=
X-Received: by 2002:ad4:5c45:0:b0:882:6cd3:7f64 with SMTP id 6a1803df08f44-8953cc8c1c3mr6670916d6.44.1770325225683;
        Thu, 05 Feb 2026 13:00:25 -0800 (PST)
X-Received: by 2002:ad4:5c45:0:b0:882:6cd3:7f64 with SMTP id 6a1803df08f44-8953cc8c1c3mr6669906d6.44.1770325225055;
        Thu, 05 Feb 2026 13:00:25 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:22 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:49 -0500
Subject: [PATCH v2 02/10] fpga: dfl-pci: set driver flag to disable SR-IOV
 on remove()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev, 
 Peter Colberg <pcolberg@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qEstSlCyMEPUoOCKULZZuiFXcYqzIQWMqVmZH5u4S3w_1770325226
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Set the flag managed_sriov in the pci_driver structure to show how a
PCI driver may opt into disabling the Single Root I/O Virtualization
(SR-IOV) capability of the device when the driver is removed.

Merge the function cci_remove_feature_devs() into cci_pci_remove().

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Demonstrate flag managed_sriov for dfl-pci driver.
---
 drivers/fpga/dfl-pci.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
index 602807d6afcc09af9e1d53368b41460ef86545d8..7965c307f9b79bdd2c2c3277d519ab2c4e701797 100644
--- a/drivers/fpga/dfl-pci.c
+++ b/drivers/fpga/dfl-pci.c
@@ -125,15 +125,6 @@ static int cci_init_drvdata(struct pci_dev *pcidev)
 	return 0;
 }
 
-static void cci_remove_feature_devs(struct pci_dev *pcidev)
-{
-	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
-
-	/* remove all children feature devices */
-	dfl_fpga_feature_devs_remove(drvdata->cdev);
-	cci_pci_free_irq(pcidev);
-}
-
 static int *cci_pci_create_irq_table(struct pci_dev *pcidev, unsigned int nvec)
 {
 	unsigned int i;
@@ -425,10 +416,11 @@ static int cci_pci_sriov_configure(struct pci_dev *pcidev, int num_vfs)
 
 static void cci_pci_remove(struct pci_dev *pcidev)
 {
-	if (dev_is_pf(&pcidev->dev))
-		cci_pci_sriov_configure(pcidev, 0);
+	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
 
-	cci_remove_feature_devs(pcidev);
+	/* remove all children feature devices */
+	dfl_fpga_feature_devs_remove(drvdata->cdev);
+	cci_pci_free_irq(pcidev);
 }
 
 static struct pci_driver cci_pci_driver = {
@@ -437,6 +429,7 @@ static struct pci_driver cci_pci_driver = {
 	.probe = cci_pci_probe,
 	.remove = cci_pci_remove,
 	.sriov_configure = cci_pci_sriov_configure,
+	.managed_sriov = true,
 };
 
 module_pci_driver(cci_pci_driver);

-- 
2.52.0

