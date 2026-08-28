Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40A4250BF2
	for <driver-core@lists.linux.dev>; Fri, 28 Aug 2026 01:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787880333; cv=none; b=FzQ5SlDFXtIDmYThUMcOla+Dh1YFxNdnsPE7/AI3BJXzrvEX7NfwGdLc7H9WjS7KJIVhFn8emDwre2gMwmcbqNDzY7aKWdwx5ThMqIUJwtlNj3AoyJGmccSkSmIudygfmv1I6RWsIpzhuh+x8D81jdCBwxdzK61/vz4ryoZFnEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787880333; c=relaxed/simple;
	bh=PiMz91fgKeAGRi2qjs6YX3N4xqaM92CZto38n2Pyqcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PZHHPnpXHZYz2/PAHP+UGyYOB7WYp/N501d1U9rZT8QuXTNymGLpLGCSWVzDPEb2jdMSh4+f0hI2waC8JeDNRRV4myYMmg7zFe7of3XiLU4quR53ZehquxFH29n+pi4maYf1kNyJ9qpw5z84sw9Ji1LmgVEYmX8N7Qzxx23iZBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 56c52f0ea27f11f19a56ed5b684f684d-20260828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9b890ffe-e922-4e46-aa31-1a6f6024c7b0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:b857933a0b8eda2aa8359278fcd6e8ff,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 56c52f0ea27f11f19a56ed5b684f684d-20260828
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 656790457; Fri, 28 Aug 2026 09:25:22 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Keith Busch <kbusch@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linkai Gong <gonglinkai@kylinos.cn>
Subject: [PATCH v2] drivers/base/node: fix UAF on device_register() failure
Date: Fri, 28 Aug 2026 09:25:16 +0800
Message-Id: <20260828012516.3591496-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806082804.2845360-1-gonglinkai@kylinos.cn>
References: <20260806082804.2845360-1-gonglinkai@kylinos.cn>
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
v2:
- rename the free_name error label to put_device (Danilo)

 drivers/base/node.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 3da91929ad4e..d5eec2ef76dd 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -171,13 +171,14 @@ static struct node_access_nodes *node_init_node_access(struct node *node,
 		goto free;
 
 	if (device_register(dev))
-		goto free_name;
+		goto put_device;
 
 	pm_runtime_no_callbacks(dev);
 	list_add_tail(&access_node->list_node, &node->access_list);
 	return access_node;
-free_name:
-	kfree_const(dev->kobj.name);
+put_device:
+	put_device(dev);
+	return NULL;
 free:
 	kfree(access_node);
 	return NULL;
-- 
2.25.1
