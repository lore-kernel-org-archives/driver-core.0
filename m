Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C067C4AD4CB
	for <driver-core@lists.linux.dev>; Wed,  2 Sep 2026 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368948; cv=none; b=ieh/7Mcmk3OHElznI90+eYGSWVZx43ugIBiQQL+zxwec2HlQrhdDpqsit2G1FPc+YAfPWAvXeIVtD+duMq/utVpVvacwAORr/VTnuqlDHetEDwRSNWknZKoefDX1rqvgWkk6ucosZFXrhoibP09x6XM+4mqnOZomGdFS+vw4eng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368948; c=relaxed/simple;
	bh=JNrK/0ub6m0FDk0x2dT/rnm7U5smWJV1A0KGzkCWXGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=MeNCLFYiByJBomtsGlUC4hS+WqZzLsSpfSJzs0BvsCGrymzaTlqGYlHMoagr3rRMtFn2WPo1ZF3HQNNy1rSVjqfB7pUaNe5YyYccF46O9LVBBR4rMjMHc1CbAARKFl2g9NICPN3pBIu2oyqlq06RIXJpneksl3mTGF+7cDVjh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fxG8YmJJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fxG8YmJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788368945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLtaBWF2S8xYQupQu7qrCH159MdeXfdQdbvdeZt1vZM=;
	b=fxG8YmJJqgasAmse+PqRA6kOjqcReox3qdTfJJP/NLhC3sBCcTjhFedHUAzm8mMEombXMP
	Sjf21aLhKE1+Ebp9bAu3Eqy9wNTwWSPewLrsIVJ1lDu63fbxJT/bcntBHIvLP2tthnoJYZ
	dzXtRFFNqQfefglEeVUxWUh3zNxHvu0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-3OijcrHXP6-6pAt_90kFWA-1; Wed,
 02 Sep 2026 13:09:02 -0400
X-MC-Unique: 3OijcrHXP6-6pAt_90kFWA-1
X-Mimecast-MFC-AGG-ID: 3OijcrHXP6-6pAt_90kFWA_1788368939
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB3701834507;
	Wed,  2 Sep 2026 17:08:59 +0000 (UTC)
Received: from djeffery-thinkpadp1gen3.rmtusga.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 65E4A1955D8D;
	Wed,  2 Sep 2026 17:08:56 +0000 (UTC)
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
Subject: [PATCH 3/9] driver core: warn should device_move try to move a need_parent_lock device
Date: Wed,  2 Sep 2026 13:07:28 -0400
Message-ID: <20260902170734.95504-4-djeffery@redhat.com>
In-Reply-To: <20260902170734.95504-1-djeffery@redhat.com>
References: <20260902170734.95504-1-djeffery@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: Z2vNha2PcY57LJacLmy8TJWv5ooKBOSqAsszHjNbxLM_1788368939
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Currently, no device has need_parent_lock set and is moved by
device_move. need_parent_lock is only set by the usb bus and very
few device types ever use device_move.

Add a warning to device_move to catch should it ever be used on a
device with need_parent_lock set. The combination would break
the immutable relationship needed between parent and child for
need_parent_lock when locking and unlocking both.

Suggested-by: Tarun Sahu <tarunsahu@google.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
---
 drivers/base/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bce555dd74f6..e8a62c8f0ad3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4705,6 +4705,14 @@ int device_move(struct device *dev, struct device *new_parent,
 	if (!dev)
 		return -EINVAL;
 
+	/*
+	 * device_move() should not be used on devices with need_parent_lock
+	 * set. Concurrent reparenting will violate the immutable
+	 * relationship needed while locking and unlocking both parent and
+	 * child.
+	 */
+	WARN_ON(dev->bus && dev->bus->need_parent_lock);
+
 	device_pm_lock();
 	new_parent = get_device(new_parent);
 	new_parent_kobj = get_device_parent(dev, new_parent);
-- 
2.55.0

