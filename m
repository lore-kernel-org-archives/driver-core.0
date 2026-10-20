Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514720;
	b=RB0XK5NmWOYf1azIX7Pb8nVNxmAeb2bvgZ2pUVjk5WySkheDrSB22oWK3DeMR+E22Bgq
	 mL7J43ywQ/UO401bvEiLX9kFWqLCHdHuBDIyfLtuKPv/XtN/g/7vTH2mf43WRsvxHP9eT
	 uxM8NMvpjQkK1Cr8QQrvzgqfqkuljXpNpNGmQHOFkMTEuCT6M+dcXFHXSKjJWzJqZ6/7Q
	 oVO9cv7NNXvVtYvwj/0x3ZJCyijyLDxRI40mdd8iDLaihnw4DYlOawLVdP3Bhqmj/OvWh
	 rDuZKIRo7FuQKATQoq5hz2noMNmHT/LcJ2n6NavQagk2IGdN/T5EZyOqFDbzud1RwNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514720;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=6CVM95O8nJA2j5PntuVbYrjGyYXMZc4AlBaFKMW1Qic=;
	b=oomu3lS5VUxIQLqV/R6JTEoUie4RSy1EI27K2U77bBsVl68DhuiyGbkkS99R9nTeNbhM
	 39ESH3ISp7I7xbrBt/OdQfbPzkerE1xl+/qCQ4Vobd+yNxjVVrOZ+T51sPyTuuECwAv9A
	 SY7cIRND6xb/k6eyihfitpuKmSLwe5O1OmlDxl/Bp2znx5ALdG99kHFi1WepAs3D53iMK
	 +XePSBu8m5qT88h1t3g6+0YLoib78UO8ZLUaiBajZpyzcOy6CifQxWLyYyjZ/muWIIEKF
	 yF2SB3YjLxAcujYZf85ZFsmCalIjgxOYCKR8+jrf3omv0XS9tEjxeZzcKZoH9tW1ayA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=No83ZoQX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407C160A3827
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 16:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 407C160A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=No83ZoQX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792514719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6CVM95O8nJA2j5PntuVbYrjGyYXMZc4AlBaFKMW1Qic=;
	b=No83ZoQXTuCAW47XNIBl00sLLS33Jv6ISWJ94tt3L+OcBb0ufc1/Q3jyVzZqJScZjTeyLF
	0EDzRB2z1dEK6y86DEPWxTsJycFXACnYwc3amSOqfvIZeOsm6ghgKm0IfYW84IXlCNLWjq
	/BOqi2JXJdIs5f+oX0nzv1d4uyW/mW0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-349-ujwPqpUtPIa42pYUcohVfw-1; Tue,
 20 Oct 2026 16:45:13 +0000
X-MC-Unique: ujwPqpUtPIa42pYUcohVfw-1
X-Mimecast-MFC-AGG-ID: ujwPqpUtPIa42pYUcohVfw_1792514711
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A2F51945CB3;
	Tue, 20 Oct 2026 16:45:11 +0000 (UTC)
Received: from djeffery-thinkpadp1gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 604D13000617;
	Tue, 20 Oct 2026 16:45:07 +0000 (UTC)
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
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 7/9] PCI: Link a virtual function to its physical function
Date: Tue, 20 Oct 2026 12:44:33 -0400
Message-ID: <20261020164435.80499-8-djeffery@redhat.com>
In-Reply-To: <20261020164435.80499-1-djeffery@redhat.com>
References: <20261020164435.80499-1-djeffery@redhat.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 9R1cBYYtzQvymPGhv92AcIrixhezNxIgVymXGqP_cd8_1792514711
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

With a PCI virtual function having the same bus for its parent
as the physical function it is associated with, there is no
explicit dependency between the two in the device tree. With
async shutdown, this can result in the PF being shutdown before the
VF has an opportunity to shutdown.

Link the VF as a consumer of the PF to note its dependency and
ensure clean shutdown ordering.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/iov.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 9d408fb8ac25..9b74211c6ab4 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -382,14 +382,20 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
 	}
 
 	pci_device_add(virtfn, virtfn->bus);
+	if (!device_link_add(&virtfn->dev, &dev->dev, DL_FLAG_STATELESS)) {
+		rc = -ENOMEM;
+		goto failed1;
+	}
+
 	rc = pci_iov_sysfs_link(dev, virtfn, id);
 	if (rc)
-		goto failed1;
+		goto unlink;
 
 	pci_bus_add_device(virtfn);
 
 	return 0;
-
+unlink:
+	device_link_remove(&virtfn->dev, &dev->dev);
 failed1:
 	pci_stop_and_remove_bus_device(virtfn);
 	pci_dev_put(dev);
@@ -421,6 +427,7 @@ void pci_iov_remove_virtfn(struct pci_dev *dev, int id)
 	if (virtfn->dev.kobj.sd)
 		sysfs_remove_link(&virtfn->dev.kobj, "physfn");
 
+	device_link_remove(&virtfn->dev, &dev->dev);
 	pci_stop_and_remove_bus_device(virtfn);
 	virtfn_remove_bus(dev->bus, virtfn->bus);
 
-- 
2.55.0

