Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BABC3F44F2
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004901; cv=none; b=RqIh8t1NnawzKnS3pTLbbEW5pKz1kF1EUL1WPU3vLQqis3f5Fhq1VrEj0TALSCbL76aYzLwJ4nDBWbcgMqLDhTdg9zIaUboj1pgrlS+yVjFgPIPud9EEZxaeyCRq04QC+44ETfxpkrtlykaIB1p1vIlE5/qL/ukMpFbtu/Pr+64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004901; c=relaxed/simple;
	bh=mSY2VNhlh9FljPjkbUCFPuO4wj5+L60NyNTUfDdJgMk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CtqZbfk8ewbbsqdQzNXMBV/TPUDY1PLUiLeFEn8DmLkKafJO0B4VzjOcxKCeVIkSzyHFdlvWCJmgSILoc4IZc61FAmGCsnQgyOTGVjAYqBwvSuqGC4JFK2ZRhzvh+pLDIl5iFtsjxNvFje68v6OhwPYghovLI9UV3BOt9Jqfo1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c18254ea917011f1aa26b74ffac11d73-20260806
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:39e63fec-35c9-4ce4-b295-3499590ef04b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:41d38eca0b796d71b547ae671bcbb4f3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c18254ea917011f1aa26b74ffac11d73-20260806
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 355043357; Thu, 06 Aug 2026 16:28:09 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Keith Busch <kbusch@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linkai Gong <gonglinkai@kylinos.cn>
Subject: [PATCH] drivers/base/node: fix UAF on device_register() failure
Date: Thu,  6 Aug 2026 16:28:04 +0800
Message-Id: <20260806082804.2845360-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

node_init_node_access() frees the access node with kfree() if
device_register() fails. After device_register() the embedded device is
initialized and must be released with put_device() so that
node_access_release() can free it.

Use the same put_device error path style as node_init_cache_dev().

Fixes: 08d9dbe72b1f ("node: Link memory nodes to their compute nodes")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/base/node.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 3da91929ad4e..d2fd57c2edc8 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -176,8 +176,10 @@ static struct node_access_nodes *node_init_node_access(struct node *node,
 	pm_runtime_no_callbacks(dev);
 	list_add_tail(&access_node->list_node, &node->access_list);
 	return access_node;
+
 free_name:
-	kfree_const(dev->kobj.name);
+	put_device(dev);
+	return NULL;
 free:
 	kfree(access_node);
 	return NULL;
-- 
2.25.1

