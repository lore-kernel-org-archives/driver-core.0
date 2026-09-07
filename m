Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AB82DB79C
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 02:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788749261; cv=none; b=MrhJFro/QQ9ciGNHsveyr8ZNefaQC2cr85J0lQxDl2jFQYmGjce3yYwE4mdfZg79ZXDa9csPb+zigt77MMLBVzYFSDg/XKyeoh6xTuW/EP0rdJnH0tZOjXJRvXnFASchSUlV7boP+xUHnlyS3T0sacafAXFTxds09FFL0B+QgTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788749261; c=relaxed/simple;
	bh=jZYY5NaJH+vzPmPiabk4EdnDnHng5JQYG4Vi0ch6uR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m1T9TPmsNUN4t9R5fkSkqIbnk1dwN+qjMIFXRFCiMpr80e5mlDDUdhz6l6DPq+i06/jR8sP65+1cx3YU7IvTJJr1Xp+/7rjsC4UfNnDwTvSoOx3SWYqi2BiYX/BRjjXki/YBZhiJctJ9NM1NgwXTUWs8Ewu5OdrCq408hYw01L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7ae3ea62aa6611f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c1e5e03d-6776-4f06-a688-68e4fb7cb5a4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:56fa679ec0deb223dc4fca44739f3fbc,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|850|865|898,TC:nil,Content:0|15|50|9
	9,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7ae3ea62aa6611f19a56ed5b684f684d-20260907
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 74153910; Mon, 07 Sep 2026 10:47:35 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Keith Busch <kbusch@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drivers/base/node: fix UAF on device_register() failure
Date: Mon,  7 Sep 2026 10:47:32 +0800
Message-Id: <20260907024732.1452228-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260828012516.3591496-1-gonglinkai@kylinos.cn>
References: <20260828012516.3591496-1-gonglinkai@kylinos.cn>
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

Fixes: 08d9dbe72b1f ("node: Link memory nodes to their compute nodes")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
v3:
- drop both goto labels; the error paths just return (Danilo)

v2:
- rename the free_name error label to put_device (Danilo)

 drivers/base/node.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 3da91929ad4e..dcdc8626627a 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -167,20 +167,19 @@ static struct node_access_nodes *node_init_node_access(struct node *node,
 	dev->parent = &node->dev;
 	dev->release = node_access_release;
 	dev->groups = node_access_node_groups;
-	if (dev_set_name(dev, "access%u", access))
-		goto free;
+	if (dev_set_name(dev, "access%u", access)) {
+		kfree(access_node);
+		return NULL;
+	}
 
-	if (device_register(dev))
-		goto free_name;
+	if (device_register(dev)) {
+		put_device(dev);
+		return NULL;
+	}
 
 	pm_runtime_no_callbacks(dev);
 	list_add_tail(&access_node->list_node, &node->access_list);
 	return access_node;
-free_name:
-	kfree_const(dev->kobj.name);
-free:
-	kfree(access_node);
-	return NULL;
 }
 
 #ifdef CONFIG_HMEM_REPORTING
-- 
2.25.1
