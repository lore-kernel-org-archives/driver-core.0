Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238C23CD8AB
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 21:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572540; cv=none; b=SNlG3ugS82y3tVH/6CpH6eDmtnI9MzeSWhYTGdTDhKXOW9yOSw6+s/m/0vmy7A1UZf62UEX/FodBbwQpfHy8VPu5/BdHnuVB3RHpzpKsu6CJLRjr9T89P/UWxZi7iocGPw0z+ixgZzBNpupw2JtrBoKVqYPpOSzjlAOsal5OdLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572540; c=relaxed/simple;
	bh=WKMW8HVlmZaoyJE5jsAXtcRs0N48w7Ua2f/NenCBzOQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=r8JYl7M4GRxwruWqSgCeaptkdFB4y//9b9Gqbl3xFSbK+p6ktBHz5vZE6FdTG6WyznaIenM6AecehceI1CrQLeYdAUIR+Jhaz8vNRrUi4HGCXKqw9HQuFjvENFjicm0gwhYZpBAkjIk2YNYWx245Dn6a9/V0Q8K8y1p0KSNKOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OCESQA4c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OCESQA4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irBf4YUdN1+vibh8PKUSXKnT1yGXKOqgKyvxp0mJGPY=;
	b=OCESQA4clh8Axb1EjczquFMRnGOxVQ0eJn0FXweTVNSIxFkuzc2tNJ9bFvcsjNAOLNxk9z
	Tzwha96xnUDt8Puun9MztQK61kbNN+O9W/1yep/mDbg01mbH1wtQMk3u13R44FXdv7jg+o
	TRHQ8bldEBnrh6Kg+VGFCL1XExIfl38=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-KdjgOW_dO1Kv1hCouc8QAA-1; Tue, 03 Mar 2026 16:15:37 -0500
X-MC-Unique: KdjgOW_dO1Kv1hCouc8QAA-1
X-Mimecast-MFC-AGG-ID: KdjgOW_dO1Kv1hCouc8QAA_1772572536
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506b4bdde91so469737221cf.2
        for <driver-core@lists.linux.dev>; Tue, 03 Mar 2026 13:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572536; x=1773177336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=irBf4YUdN1+vibh8PKUSXKnT1yGXKOqgKyvxp0mJGPY=;
        b=wvK7OUSTNks6dtBKT7LidIh5tZqMZ6QrCDpwwXgM5gMUBhRa3bhOPpDn0t57oxXFUS
         Xh8qwfe+FJArNLbmKp5ciTS0+YhWo4rnsYJjBZn1qW0uXsfFct1Ses49NTVN2sl5IcCN
         2f3v0oyf+sMufUQ6+DF6WLPPCricEwDOa/eP4K2/AA7pWSnhQIBm6+LZWiof44xB6tv1
         Cx5osmrAF9ZsynOlE3shVLcBVdtrMvuxsZu9OrYE3hixmKNoWbCLyEDUnWt8qb+otod5
         yfNY2+XsN4vSGvsMVxkXTimMDMnV+sQQkrwsUhCcVxtdDgbbNm0q+Q+yHEbfRFFgyPSJ
         VWDg==
X-Forwarded-Encrypted: i=1; AJvYcCXK2BmCpRNaqPd5kUnUMAW4GVf6JI5vBoT6PpYfMAmCNf6t3qDkxEJ4RhakLmysods1MJLXasjy0LJ/dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIHijUFjwhfRlXvhTbJSnpDGVWXSJNk0Oud+DeBmT1pPtMN4vP
	8eKXxEmsm79gXtQ0WCEauOzSKKooGnjXcJWOXxOs2d3/9ol8Ho9eyMsk/PNU+YCmrsnqLJFeM/4
	7CdQ6g4zhFFzIwGe8sj/JwvcMn2AfaaxVZOaXkcywkDke6tvfYEASBm3Cr6ns1skA
X-Gm-Gg: ATEYQzwK1TAo6ISNZ1jJmljf0eUWojPOfbQ3SYm47ilnoeQDv7Mm3B9czuF+NyyM99W
	b+Xa1aEwYzgVjpFsiTMRiyiMhmF1Qm9MibPqRbO3wMzmDaHTc6RR0PsgiPzZZH1Flf2h85DJXhb
	09kC0pDVdhSs9ZM2CiBLL4rtii+N5oDIXUnyvv4Mxs/BZ+wtlP6+jm3P9k0OXF4zmyA4XR76pED
	fGXNsT762/qHz5qgFlYxptO/0tFlKMgV5b7luCWsMhTlvmkJ7XdL+VGycfOBc/49cBDuqH9AlFm
	Fu5HWm45hHhICntxbaeCwiADxHgsYLPBtj7axzjU5vewShtW0hjX2JEJNt/Wf9RA7eR1p21BNzY
	Kj+gNm1nszFNwI5yoBLV3eTaErA==
X-Received: by 2002:a05:622a:1891:b0:502:9abb:c919 with SMTP id d75a77b69052e-5075287910dmr225477851cf.10.1772572536395;
        Tue, 03 Mar 2026 13:15:36 -0800 (PST)
X-Received: by 2002:a05:622a:1891:b0:502:9abb:c919 with SMTP id d75a77b69052e-5075287910dmr225477351cf.10.1772572535732;
        Tue, 03 Mar 2026 13:15:35 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:35 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:22 -0500
Subject: [PATCH v3 02/10] fpga: dfl-pci: set driver flag to disable SR-IOV
 on remove()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-2-4443c35f0c88@redhat.com>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
In-Reply-To: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
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
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
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
X-Mimecast-MFC-PROC-ID: X43y7mMAY9g6AWR40tC0Ei_nL94ahsJMVV7UNhI8nC0_1772572536
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
index e25205c6d8f00cec579016acade28e743812c924..2410e6f3efe100a635eebfdb21f28f62a3759890 100644
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
2.53.0

