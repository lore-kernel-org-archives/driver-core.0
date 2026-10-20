Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514714;
	b=QxTr37u5q+h8wgwxpIe6snGozVbwU9/ohehYVVUQx7Rri9VpYXc526gckxO8icUjAv3/
	 tc/XzhARdxJLBs3SpP0Y2PsYWUrnBs2Uuf5zKgowe9M5MqhOrlJ2IiT3ruD5r36rRD2xh
	 jWvkPpdg3g2qm/6WhIIorJ9AK8qvrrvViYE2D2p7m4md8/7cX/51omQZOwyBxLVgT2uF8
	 pVyvT1XS6GUG3pnASGzanGfj8Tpl53fG+OoRmqMeokmP+ejeQ3Af0srVIAdey5NtwufwA
	 bskM0vKVmmRwRrrdoWHpR/PXstoayvKe0ksaCV3Fd8U+tdylnl2sva+iNM+4AAseeBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514714;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=bxjP7KUlohvZ2YPEyHIa7bKbPs42+xcSHkWZNTuvybw=;
	b=EA1P639VQ9L3WHucCUyAOf9PFGnYUvulOEqwdsxYzpNBmBgApXXwvY88QVV/w6l98DgG
	 sY/dAI0eX9byVvSxPn9Kb72DnBw8iaDZMhkKOiHtbgsSgd52IrRfr97qc/uBuh7ReJMnV
	 cjspSVEEPMOSFrfnTlyhNu/beR4oXWuiyTm4vZh0dP0HARtBrp2tDE0jXhP4eGKuNA8jM
	 dqNtIB7IEVSvrHSxXOqoG3/E8ttbJUPVZ8g32luLsPRmQaU3rKES7AVfwGODuE0F5bBoc
	 gyYCOCJiqRYpC3fclG/5EQMJAb+H2rgLYT/W7eIe017QMV64aR4O8uPtam6ZCQHvjeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vqx1B7Xm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB7560A4AE6
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 16:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB7560A4AE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vqx1B7Xm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792514713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bxjP7KUlohvZ2YPEyHIa7bKbPs42+xcSHkWZNTuvybw=;
	b=Vqx1B7XmUEFBawzIzNj607qZkotJIgW7xY2cQeQeqO7Xm5eNMm+UOmBPE2bUr800PF3riw
	mVfGvEjl6G+DcNNG6c4jHJEh1i7kmANpsUTxN3SEJtPaDZFDqTH/5jr/t49PcUIGRn7U7Z
	b23wxjhnLP6DJVaF+f+kFiGhPvRvNIY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-fnxMTARHNV-bSHZRxYAnOQ-1; Tue,
 20 Oct 2026 16:45:08 +0000
X-MC-Unique: fnxMTARHNV-bSHZRxYAnOQ-1
X-Mimecast-MFC-AGG-ID: fnxMTARHNV-bSHZRxYAnOQ_1792514704
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 888F11953952;
	Tue, 20 Oct 2026 16:45:03 +0000 (UTC)
Received: from djeffery-thinkpadp1gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 516C430001A2;
	Tue, 20 Oct 2026 16:45:00 +0000 (UTC)
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
	David Jeffery <djeffery@redhat.com>
Subject: [PATCH 5/9] driver core: do not always lock parent in shutdown
Date: Tue, 20 Oct 2026 12:44:31 -0400
Message-ID: <20261020164435.80499-6-djeffery@redhat.com>
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
X-Mimecast-MFC-PROC-ID: eA6RKCWlUALKeXQgY6fXlZlNm6hAucrXc8sBtZqgaXA_1792514704
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Don't lock a parent device unless it is needed in device_shutdown. This
is in preparation for making device shutdown asynchronous, when it will
be needed to allow children of a common parent to shut down
simultaneously.

And only acquire a reference to the parent device if the parent is to be
locked.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
---
 drivers/base/core.c | 44 ++++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 7fe3fa6870a7..93605698affc 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4903,12 +4903,10 @@ int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid)
 	return error;
 }
 
-static void shutdown_one_device(struct device *dev, struct device *parent)
+static void __shutdown_one_device(struct device *dev)
 {
-	/* hold lock to avoid race with probe/release */
-	if (parent)
-		device_lock(parent);
-	device_lock(dev);
+	if (!dev->p || dev->p->dead)
+		return;
 
 	/* Don't allow any more runtime suspends */
 	pm_runtime_get_noresume(dev);
@@ -4928,13 +4926,33 @@ static void shutdown_one_device(struct device *dev, struct device *parent)
 			dev_info(dev, "shutdown\n");
 		dev->driver->shutdown(dev);
 	}
+}
 
-	device_unlock(dev);
-	if (parent)
+static void shutdown_one_device(struct device *dev)
+{
+	struct device *parent;
+
+	device_lock(dev);
+
+	/* use parent lock if needed to avoid race with probe/release */
+	if (dev->p && !dev->p->dead && dev->bus && dev->bus->need_parent_lock &&
+	    (parent = get_device(dev->parent))) {
+		/* the parent lock needs to be acquired first, so re-lock */
+		device_unlock(dev);
+
+		device_lock(parent);
+		device_lock(dev);
+
+		__shutdown_one_device(dev);
+		device_unlock(dev);
 		device_unlock(parent);
+		put_device(parent);
+	} else {
+		__shutdown_one_device(dev);
+		device_unlock(dev);
+	}
 
 	put_device(dev);
-	put_device(parent);
 }
 
 /**
@@ -4942,7 +4960,7 @@ static void shutdown_one_device(struct device *dev, struct device *parent)
  */
 void device_shutdown(void)
 {
-	struct device *dev, *parent;
+	struct device *dev;
 
 	wait_for_device_probe();
 	device_block_probing();
@@ -4960,12 +4978,6 @@ void device_shutdown(void)
 		dev = list_entry(devices_kset->list.prev, struct device,
 				kobj.entry);
 
-		/*
-		 * hold reference count of device's parent to
-		 * prevent it from being freed because parent's
-		 * lock is to be held
-		 */
-		parent = get_device(dev->parent);
 		get_device(dev);
 		/*
 		 * Make sure the device is off the kset list, in the
@@ -4974,7 +4986,7 @@ void device_shutdown(void)
 		list_del_init(&dev->kobj.entry);
 		spin_unlock(&devices_kset->list_lock);
 
-		shutdown_one_device(dev, parent);
+		shutdown_one_device(dev);
 
 		spin_lock(&devices_kset->list_lock);
 	}
-- 
2.55.0

