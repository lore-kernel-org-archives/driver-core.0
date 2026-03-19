Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB5309DAF
	for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929556; cv=none; b=hIF/Vh0s6bx9y9awouf+iGaK96Wv3T9Y/mNb1YCqmX2W1c5tKWuS2wyojjVliSnIYVIi0YWLwEAtNLVbqESG9EqTJFAEJQaaXcl9JjPPyBM5lAxpLqJVMdtntDGe/ZFXr2HlKjIISUV99BaPPwFQqCwNdgtVB2hr4tAWK+hbZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929556; c=relaxed/simple;
	bh=4vvr+xDrAWxMxjnNh4nkvtXpBMA19u1S8MdxP1fEm4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Qtnw14anQ8Zo3e+39Adtk/QEnmoS0ncVOkDdPGtutLkwjHsQVkr77n5ZReZ2Zkw6TvU+krYFGlQ0vHuI7stJhMV8tn2BmSSNJ/jCDgFYQ/8aJ8hBSWiUcD30CCWqvOKE4el/Y1dn/veh07/+U8OK7GR4wwRktwvB4TJWvS0UWKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RWxjVTEU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RWxjVTEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773929552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jQvaSb3MuBGeMbb7vK8Mg571zM++WUT9vxPRh2XvaDA=;
	b=RWxjVTEUXoQjFJYJfR9M1vKLZvxWjZEgiqDgygFLnL+S9TRt4tqzP8XfDQex4NQDqBcxph
	W9TlQoGb6HiFsbxGJnFvOqMwnrQ0EAnNMrnYg+hh/zycNpX8EnhE9f/K0XgSa/cG469lCH
	GhfTmkQILqnyRqkMTvV62JGKmObhj1A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-ih4dCwmYM1mBXk6becXcqQ-1; Thu,
 19 Mar 2026 10:12:29 -0400
X-MC-Unique: ih4dCwmYM1mBXk6becXcqQ-1
X-Mimecast-MFC-AGG-ID: ih4dCwmYM1mBXk6becXcqQ_1773929540
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C5AF1954B17;
	Thu, 19 Mar 2026 14:12:20 +0000 (UTC)
Received: from fedora-work.redhat.com (unknown [10.22.66.24])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 54A8E1800576;
	Thu, 19 Mar 2026 14:12:16 +0000 (UTC)
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
	David Jeffery <djeffery@redhat.com>
Subject: [PATCH 4/5] PCI: enable async shutdown support
Date: Thu, 19 Mar 2026 10:11:41 -0400
Message-ID: <20260319141142.5781-5-djeffery@redhat.com>
In-Reply-To: <20260319141142.5781-1-djeffery@redhat.com>
References: <20260319141142.5781-1-djeffery@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 8mJEdOipRtRQZrPGL0g7mUCNold2RPZdO0r-Om9xabg_1773929540
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

