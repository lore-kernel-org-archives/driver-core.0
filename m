Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41ED2FD7BC
	for <driver-core@lists.linux.dev>; Mon, 20 Apr 2026 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776698817; cv=none; b=Q8MEtgwqkl01eDgtMbkm+tz9EzQXWgDGFiOeFQ3gzbZYiZe8cdjD6esRXjKlK1ZStnSyfJDVplwTjQkdFRlXD9jJj3wru3fMOLgFdjxb1Z5n4t2rqfNlsvnZGQicBLl2Nlphv9Ex3AFRCJfuQal1S2lOju8zXT0oCX3E+JRtyWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776698817; c=relaxed/simple;
	bh=4vvr+xDrAWxMxjnNh4nkvtXpBMA19u1S8MdxP1fEm4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZY4AfOorZCyPq6Hh9iIN4T9mT8YELeH74iuhX5JmYWRdolK75UIllsgJ1V8fv7wwF+jB0YdYPWo8kYYRWxnEA3Zdp1v1vEpJLN91vya6COBdFR/Zdcdo41pDIy9Z0WkVWS6hn42xSC6AifVLonemL1B76JtcjnTgdCb4vAgh46c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KJMCHFhu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KJMCHFhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776698812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jQvaSb3MuBGeMbb7vK8Mg571zM++WUT9vxPRh2XvaDA=;
	b=KJMCHFhuw7JVHs9DMc7oLgMhGEt4Ju3J+2PkqMmvVxRq07be8VM1Q2pvc2bDDJnQtRqJ81
	DljFSIt8X6h36/8ATFLS8mG0qlPz2BU/OWCl+bPAXQTzPRmk/k7JekT+s2BbZEes5u2/0E
	okgEIGd7Vc1Frg8PP7aNw6x5LCb4gH8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-694-L-DnokiiM0SANo03j7vmxQ-1; Mon,
 20 Apr 2026 11:26:48 -0400
X-MC-Unique: L-DnokiiM0SANo03j7vmxQ-1
X-Mimecast-MFC-AGG-ID: L-DnokiiM0SANo03j7vmxQ_1776698803
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AF88218005A8;
	Mon, 20 Apr 2026 15:26:41 +0000 (UTC)
Received: from fedora-work.redhat.com (unknown [10.22.65.236])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 162C719560AB;
	Mon, 20 Apr 2026 15:26:36 +0000 (UTC)
From: David Jeffery <djeffery@redhat.com>
To: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Tarun Sahu <tarunsahu@google.com>,
	Pasha Tatashin <tatashin@google.com>,
	=?UTF-8?q?Micha=C5=82=20C=C5=82api=C5=84ski?= <mclapinski@google.com>,
	Jordan Richards <jordanrichards@google.com>,
	Ewan Milne <emilne@redhat.com>,
	John Meneghini <jmeneghi@redhat.com>,
	"Lombardi, Maurizio" <mlombard@redhat.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Laurence Oberman <loberman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	John Garry <john.g.garry@oracle.com>,
	David Jeffery <djeffery@redhat.com>
Subject: [PATCH 4/5] PCI: Enable async shutdown support
Date: Mon, 20 Apr 2026 11:26:07 -0400
Message-ID: <20260420152608.6244-5-djeffery@redhat.com>
In-Reply-To: <20260420152608.6244-1-djeffery@redhat.com>
References: <20260420152608.6244-1-djeffery@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 5Igw-E7tznGxSaQXgQeUfkFby99Xgbfv5fTD3EIMDF8_1776698803
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Like its async suspend support, allow PCI device shutdown to be performed
asynchronously to reduce shutdown time.

Signed-off-by: David Jeffery <djeffery@redhat.com>
Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
---
 drivers/pci/probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bccc7a4bdd79..4d98bab2163d 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1040,6 +1040,7 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
 
 	bus->bridge = get_device(&bridge->dev);
 	device_enable_async_suspend(bus->bridge);
+	device_enable_async_shutdown(bus->bridge);
 	pci_set_bus_of_node(bus);
 	pci_set_bus_msi_domain(bus);
 	if (bridge->msi_domain && !dev_get_msi_domain(&bus->dev) &&
@@ -2749,6 +2750,7 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	pci_reassigndev_resource_alignment(dev);
 
 	pci_init_capabilities(dev);
+	device_enable_async_shutdown(&dev->dev);
 
 	/*
 	 * Add the device to our list of discovered devices
-- 
2.53.0

