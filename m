Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514707;
	b=JwMhxLgeMCYX6MhjU5sSO3V5HD28+6MA/zHgMfoON9NrNBZWtikNkhOh6ze2pGeIE/2T
	 q7rxkd/iTPaCzmYTU5cwN5LuiKzn87xmmZz++gz9UDojwywTRTHUgEQRVAfBBNyNRGumu
	 2Y11juz197OlWNEF8ETbc40yiZm35OGK5RRxqfJ2Pk7V3xGE3jNKYyRfAZFjrB2IpDFim
	 7ZUzBXRv/g83fnhCslTC5ezZUlpcyc3KurehLNLt8orJPUOHK7syO8mLjhTnh2C4e2J3A
	 Jv6u4gWqkazZ6wZTToLnDQGatFmNX+JXBWdt3I+lZ3STNHxOMDIT1VnSaYBKwf6v7fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514707;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=7SXPhK4KAKzT6yjy3hN3OczRFZykeYYqxRn6w8LmMcQ=;
	b=JRsG5fsORAv866B37OA+zJKZIYze09Jzft6XYusWGOwd/78UwdXIAC5MVSGa20kO/LmP
	 DrqsIljbsXK7M7Ulz/tGSGwx9XSGQn6JNv5m1waW9M3TrTi9BURRvNVSAEamQqtGbQ+67
	 Gtj+mZULaRCu6E2vUwBemqXrRvHj+TSoSpv4MTRm3Je9CYot5KUmuUeH5p30HAqGajTob
	 0ttiCiaRs2ZG79gzMzkpVNdCN5cq9mnVDnw2+fOxIKRlypcXwFlDtaAebktXtr6kjG2Me
	 A9UwlnaOP4OSr6JUqunaukO920uMKAIw4c6DzIaKB89lD0owJqprrdOV13SZ0G9dTow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LvhWpHd5;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BBF60A4AC0
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 16:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13BBF60A4AC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LvhWpHd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792514706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7SXPhK4KAKzT6yjy3hN3OczRFZykeYYqxRn6w8LmMcQ=;
	b=LvhWpHd5hzecXo3NuSCbjaldOfTDP2ia/BoXPpJDglQ+qf0PfOMjbQLuxY0qwkExlR6jE9
	LvBh+4yMW3QlZPIWu6LS6NJhb9Xh/2aDtdat2WmLyY7NKouLo0TC0pkllG8JkFDfW/OV7m
	ydOrlP0pSYHq151Dsf9B7M3K9xMkxMI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-367-hxd81ZlOP4GYWes5oqs4Ew-1; Tue,
 20 Oct 2026 16:45:02 +0000
X-MC-Unique: hxd81ZlOP4GYWes5oqs4Ew-1
X-Mimecast-MFC-AGG-ID: hxd81ZlOP4GYWes5oqs4Ew_1792514700
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F5AE195BDF6;
	Tue, 20 Oct 2026 16:45:00 +0000 (UTC)
Received: from djeffery-thinkpadp1gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8855730002CB;
	Tue, 20 Oct 2026 16:44:56 +0000 (UTC)
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
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [PATCH 4/9] driver core: separate function to shutdown one device
Date: Tue, 20 Oct 2026 12:44:30 -0400
Message-ID: <20261020164435.80499-5-djeffery@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ltFnDSs6YYJMZLGDaW8ncLCnT__vFHEDc0HX8pzZWOA_1792514700
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Make a separate function for the part of device_shutdown() that does the
shutown for a single device.  This is in preparation for making device
shutdown asynchronous.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/base/core.c | 65 ++++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index e8a62c8f0ad3..7fe3fa6870a7 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4903,6 +4903,40 @@ int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid)
 	return error;
 }
 
+static void shutdown_one_device(struct device *dev, struct device *parent)
+{
+	/* hold lock to avoid race with probe/release */
+	if (parent)
+		device_lock(parent);
+	device_lock(dev);
+
+	/* Don't allow any more runtime suspends */
+	pm_runtime_get_noresume(dev);
+	pm_runtime_barrier(dev);
+
+	if (dev->class && dev->class->shutdown_pre) {
+		if (initcall_debug)
+			dev_info(dev, "shutdown_pre\n");
+		dev->class->shutdown_pre(dev);
+	}
+	if (dev->bus && dev->bus->shutdown) {
+		if (initcall_debug)
+			dev_info(dev, "shutdown\n");
+		dev->bus->shutdown(dev);
+	} else if (dev->driver && dev->driver->shutdown) {
+		if (initcall_debug)
+			dev_info(dev, "shutdown\n");
+		dev->driver->shutdown(dev);
+	}
+
+	device_unlock(dev);
+	if (parent)
+		device_unlock(parent);
+
+	put_device(dev);
+	put_device(parent);
+}
+
 /**
  * device_shutdown - call ->shutdown() on each device to shutdown.
  */
@@ -4940,36 +4974,7 @@ void device_shutdown(void)
 		list_del_init(&dev->kobj.entry);
 		spin_unlock(&devices_kset->list_lock);
 
-		/* hold lock to avoid race with probe/release */
-		if (parent)
-			device_lock(parent);
-		device_lock(dev);
-
-		/* Don't allow any more runtime suspends */
-		pm_runtime_get_noresume(dev);
-		pm_runtime_barrier(dev);
-
-		if (dev->class && dev->class->shutdown_pre) {
-			if (initcall_debug)
-				dev_info(dev, "shutdown_pre\n");
-			dev->class->shutdown_pre(dev);
-		}
-		if (dev->bus && dev->bus->shutdown) {
-			if (initcall_debug)
-				dev_info(dev, "shutdown\n");
-			dev->bus->shutdown(dev);
-		} else if (dev->driver && dev->driver->shutdown) {
-			if (initcall_debug)
-				dev_info(dev, "shutdown\n");
-			dev->driver->shutdown(dev);
-		}
-
-		device_unlock(dev);
-		if (parent)
-			device_unlock(parent);
-
-		put_device(dev);
-		put_device(parent);
+		shutdown_one_device(dev, parent);
 
 		spin_lock(&devices_kset->list_lock);
 	}
-- 
2.55.0

