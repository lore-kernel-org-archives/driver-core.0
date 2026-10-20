Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514723;
	b=ix8TJOzEQA996Iw2ytb2g+KjSfyRQIERkSoesPZzrGPKuzLyZ3z9OsMNJH6u/xxOFi1Y
	 wFedwcekCSDPvtDcarYx3jOxYsMd7vXH0hNBsWCxEGmBCvPPHFwJSPR5szwvydIC6r/rQ
	 amn68fo0xkhsPUUxsqUKhOVXuVpQz+PVrCYxBGQHZ2u6EWDM3bOwZsSEQh14XU1FHR4Zw
	 gb686uwFsE6A2t2j1AXTw7axzjp/2UE/umNaLQ05wgOexVTKUvA58Ta98ni8UI6GnPwyH
	 8GD/SeGcz8O46+7tNz0VWSr/ylhcEhCYczkJZ0r/0k8q1SOyVoTmngJoZ9ijOF8qkgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514723;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=J5XvO9ED1PnQW6LvxI91yeoYZ/9/NbKN8AWis2OJ8FM=;
	b=3ewRxKNduPScwZPaT/rezBYhJWkANnRjBkUN/iKPFzLlH01yLzvsZwKGf85LP+rh4MoL
	 tSgFJBXM/3CI7miXr+Wi1JSZJ0IzzVMXhNpv+zI2fI2ty+GJweSC146x7Vhtq3W6tB1vo
	 aXQJUy5m2TaFO/AjnisEIQAtQSFwC0IjomhVDQDtpx3cnwcTcIbPEnYg3ZlHW2No/ccQt
	 /JaA/ZZnHByF3X1I1Wk6xoU8xLFtlPdNV98yxEfKK67nULv+bheQQlpufLV76cLtSXRtI
	 GeQ27thyJwrMVRVwsZGAFxYA8clSF4nz15iXsQ7nTpyi/6BdRTXwyx+EvqdtE1U/lUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HLmUryNK;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FAC60A6F48
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 16:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FAC60A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HLmUryNK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792514721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J5XvO9ED1PnQW6LvxI91yeoYZ/9/NbKN8AWis2OJ8FM=;
	b=HLmUryNKNl+peRu+CKSaCN1dP0kJrPG2YAwDR6CuCmz6O4FWEXmqb0vexZT2wDEI0w4dSp
	HD6k06glOETymJsoQsVI9l6jF0Re1XxJzS+/ArdV8Ztkl3++oKuypjM+52UhaLt/NLxwFi
	n9RAZcISuJVD+iP9wjL1oyHnM04ecb8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-261-TlZSv--DMT2Duq_tJQJIEQ-1; Tue,
 20 Oct 2026 16:45:17 +0000
X-MC-Unique: TlZSv--DMT2Duq_tJQJIEQ-1
X-Mimecast-MFC-AGG-ID: TlZSv--DMT2Duq_tJQJIEQ_1792514715
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61072195C25C;
	Tue, 20 Oct 2026 16:45:15 +0000 (UTC)
Received: from djeffery-thinkpadp1gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CA14130002CB;
	Tue, 20 Oct 2026 16:45:11 +0000 (UTC)
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
Date: Tue, 20 Oct 2026 12:44:34 -0400
Message-ID: <20261020164435.80499-9-djeffery@redhat.com>
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
X-Mimecast-MFC-PROC-ID: feqygjK-imoT1hO6OCS2lDzi3XRkb7n-GWmP4GvTl2Y_1792514715
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

