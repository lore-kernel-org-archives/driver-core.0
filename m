Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506B37A83C
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 17:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014883; cv=none; b=En59RbVlVziFzlXdMKDNBIB9fURxmLKR/oRwx+hybiPtFVDpu1NYtc9w1B2O/bQXM609jKUQcUiFVz1sCXqcTCyMIum0radVc/Ox0FmWTArnw9fyLPDh85Wivq3xzjRsHrnG2/SfJCRqgxuDqrlS1QxfcVr3o+02D77RPNdexS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014883; c=relaxed/simple;
	bh=Ix7h4DxeUvpQUSmYcL8h0e+G6qvX9bYt9GxELafVnIU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qV8BnGQ3zzX6ZX76d2iKuQYV3tqz0Jwm94Fu1qK1tPyttni44S/3UsQcy2IKpdWMzVYpsVyNXhuKFDIiIEUb2S3dXmUl4AFVd7LxXq6DILUgOzVzc8qAqoEJcUqLn0EoN3x+SUnHhUVZ/wC4fXNGI5czjNDfSHl/FQyuKTaxFn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=b1LI7GlK; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="b1LI7GlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1783014882; x=1814550882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i8x4rQZI3wGrMps1gx7J+LUAbzJ5YVpPGmgWVMyrcn0=;
  b=b1LI7GlKf6eV+S3e3PdgocwtcKoLX3NbptIMVS6XzgaGyM2nYZQT2nk4
   XshQOf3ZpM9jy60CBDkxoPjNdl/32bfD/Jk1Nykyyym03QTYUICR+xR5J
   T2rXZtMEuTmgcNaf7y58KcgYCmcZIJrxieN6KL/RIK20YuYellzFF9Z6F
   sedNwpJAI0CwC/5JtybJMoJvZ4FVbHy8cUIHPLQIdSSVLoaDM/+3qsjs2
   VqFeyp3BqG6QrC4DOvjCIVdpLe4ExJHsHIsZCTRObFOQOOc63pnsLHe2x
   XlR986CViS3wUvvVM5q7pKULn16+G6FjxCcTC82l0YWXbzyChOY1DY+O+
   Q==;
X-CSE-ConnectionGUID: sfChYbsLR7+K9S+0iXxigw==
X-CSE-MsgGUID: eL0Sbib7Rj2GDrU/NWV6oA==
X-IronPort-AV: E=Sophos;i="6.25,144,1779148800"; 
   d="scan'208";a="22744903"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 17:54:40 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:15888]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.58.93:2525] with esmtp (Farcaster)
 id 1c94e942-37ba-4e7a-870c-87f2133b068d; Thu, 2 Jul 2026 17:54:39 +0000 (UTC)
X-Farcaster-Flow-ID: 1c94e942-37ba-4e7a-870c-87f2133b068d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 17:54:39 +0000
Received: from dev-dsk-sakacpav-1a-480d1124.eu-west-1.amazon.com
 (172.19.96.155) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Thu, 2 Jul 2026
 17:54:36 +0000
From: Pavol Sakac <sakacpav@amazon.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Tejun Heo
	<tj@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>, "David
 Woodhouse" <dwmw@amazon.co.uk>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, "David
 Matlack" <dmatlack@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Alexander Graf <graf@amazon.com>, <linux-mm@kvack.org>,
	<kexec@lists.infradead.org>, <nh-open-source@amazon.com>
Subject: [RFC PATCH 11/14] vfio: opt vfio-dev and VFIO group devices into sysfs_lazy
Date: Thu, 2 Jul 2026 19:51:11 +0200
Message-ID: <20260702175114.24659-7-sakacpav@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702175114.24659-1-sakacpav@amazon.de>
References: <20260702174033.32116-1-sakacpav@amazon.de>
 <20260702175114.24659-1-sakacpav@amazon.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D042UWB003.ant.amazon.com (10.13.139.135) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Call device_set_sysfs_lazy() on vfio_device->device (vfio-dev/) and
on the VFIO group's struct device (vfio/<group>/) before device_add().
With opt-in, vfio-dev directories materialise their attribute_groups
(vfio_dev_groups + drvdata->ops->dev_groups) on first access via the
sysfs lookup path instead of eagerly at device_add(). The VFIO
group device's flat attrs follow the same deferral.

Removes the eager creation cost on platforms with thousands of VFs
assigned to VFIO containers. No userspace ABI change.

Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Cc: linux-api@vger.kernel.org
Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Pavol Sakac <sakacpav@amazon.de>
---
 drivers/vfio/group.c     | 5 +++++
 drivers/vfio/vfio_main.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index b2299e5bc6df3..aa7e0033b96e8 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -533,6 +533,11 @@ static struct vfio_group *vfio_group_alloc(struct iommu_group *iommu_group,
 	group->dev.devt = MKDEV(MAJOR(vfio.group_devt), minor);
 	group->dev.class = &vfio_class;
 	group->dev.release = vfio_group_release;
+	/* Defer per-device attrs to first kernfs access; userspace reads via ioctl. */
+	if (device_set_sysfs_lazy(&group->dev)) {
+		put_device(&group->dev);
+		return ERR_PTR(-ENOMEM);
+	}
 	cdev_init(&group->cdev, &vfio_group_fops);
 	group->cdev.owner = THIS_MODULE;
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 6222376ab6ab5..ab90279c44bd0 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -306,6 +306,11 @@ static int vfio_init_device(struct vfio_device *device, struct device *dev,
 			goto out_uninit;
 	}
 
+	/* Allocated before device_initialize() so out_uninit unwind frees it. */
+	ret = device_set_sysfs_lazy(&device->device);
+	if (ret)
+		goto out_uninit;
+
 	device_initialize(&device->device);
 	device->device.release = vfio_device_release;
 	device->device.class = &vfio_device_class;
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

