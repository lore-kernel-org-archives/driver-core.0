Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406305326A2
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663115; cv=none; b=FGejLvcy9K5tHLQ64MJGnpu6eERJZtVT9QF9Q6pXEWw7rLsHY1m1EQqttoxfOxbomEo9DdSxY7spmGx2N3D0FnBMSBwOpdaxYeyPs9U3+2sMWsf3mPx8tk8k4JrPGNQTjeeNndnX5zf1yjMjuCMDSOvCsq4XLdzmEAOAbkUxYRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663115; c=relaxed/simple;
	bh=Tkmhq7ipcJ4eJBwsM1IcqrP9wqQcBe6egEgtbha4A80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=jihN04Hy4h38VyRWgTDTAhBg+yKNAFx8Tju+UMFqL7hYWUyACgVwJyTDsVSPNoVNLboHWznX/8ASz/6xUNGOsoTt/b5RWzu1al2ARmDj7/Yk26YO7pBKtKnS3ZFS4Jv3kHePfy6Bx2wXN+kWlPKNKMgBIKje5G4T1D9k0Wjrikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IJQuoiR7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IJQuoiR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J5XvO9ED1PnQW6LvxI91yeoYZ/9/NbKN8AWis2OJ8FM=;
	b=IJQuoiR7/Ik5yr0l0gvrfmK8Ok2Gra/yNCJ+e+9nSaafK1ahVXwMONgSTsSkVt/irMoFGo
	eF9u9d/eWgb7QidDXffzG2tHlponrmVplO3rJiYvdST/atAxR2p1NJbh6/ZngRzWxg3bnB
	NGmtBX+aKKdLJDHqGV8wjHtxgaRNMIc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-CeX5IH-BPMSoXeUtkPmpQA-1; Thu,
 17 Sep 2026 12:38:29 -0400
X-MC-Unique: CeX5IH-BPMSoXeUtkPmpQA-1
X-Mimecast-MFC-AGG-ID: CeX5IH-BPMSoXeUtkPmpQA_1789663104
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C3D801944E40;
	Thu, 17 Sep 2026 16:38:24 +0000 (UTC)
Received: from djeffery-thinkpadp1gen3.rmtusga.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 179061800345;
	Thu, 17 Sep 2026 16:38:20 +0000 (UTC)
From: David Jeffery <djeffery@redhat.com>
To: driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Tarun Sahu <tarunsahu@google.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Laurence Oberman <loberman@redhat.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	kexec@lists.infradead.org,
	"Ewan Milne" <emilne@redhat.com>,
	"John Meneghini" <jmeneghi@redhat.com>,
	"Lombardi, Maurizio" <mlombard@redhat.com>,
	"Bart Van Assche" <bvanassche@acm.org>,
	"John Garry" <john.g.garry@oracle.com>,
	"Jeremy Allison" <jallison@ciq.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"Pasha Tatashin" <tatashin@google.com>,
	David Jeffery <djeffery@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 8/9] PCI: Enable async shutdown support
Date: Thu, 17 Sep 2026 12:37:43 -0400
Message-ID: <20260917163744.191748-9-djeffery@redhat.com>
In-Reply-To: <20260917163744.191748-1-djeffery@redhat.com>
References: <20260917163744.191748-1-djeffery@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 0dH9u3lQ6DRipF6t1FDPgRCHBQr4unfFG_12wLJAHNI_1789663104
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Like its async suspend support, allow PCI device shutdown to be performed
asynchronously to reduce shutdown time.

Signed-off-by: David Jeffery <djeffery@redhat.com>
Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 27008e2ea5af..101a96718acd 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1038,6 +1038,7 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
 	if (err)
 		goto free;
 
+	dev_set_async_shutdown(&bridge->dev);
 	/* Temporarily move resources off the list */
 	list_splice_init(&bridge->windows, &resources);
 	err = device_add(&bridge->dev);
@@ -2748,6 +2749,7 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	pci_reassigndev_resource_alignment(dev);
 
 	pci_init_capabilities(dev);
+	dev_set_async_shutdown(&dev->dev);
 
 	platform_pci_configure_wake(dev);
 
-- 
2.55.0

