Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BFE40E8D7
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598350; cv=none; b=MSoY/S9RJcgs57M7B2VsYoo4lpzomtdTavC9rhvi5ubAEh9/RCx9wciMEUvEmBkTyoo94ktf4saX6SthVAMTItTpbuX+govwqw06wwjAUKl4oE8MpDFz/Hpfr6+I4ZDlYDyV6rWZCTn48CBpaq/txD+CB7bYHXhbzM5Y/kX6c3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598350; c=relaxed/simple;
	bh=vEwi2Wrj8XJBTeyO3CapK9F0vQ8rJkGyI4JGeflwS64=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Phbrw0bWzWvUAqTZLz2vunrbzjkkdC7Bz0J4yGdAQkDswmTKbYiUifLHO13bglUiiK8xSY7WdmJjqrYq1dGUoXpTN1Yucn6pvunZfWMGBOyFeXIqVoRNKwUIwUdrnSrVV43yRGh52rErmtoHwQ3vjvfwevwneB6nie+U9n4zYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f6a674d0695c11f1aa26b74ffac11d73-20260616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:db5936ca-1c1c-4e61-9233-ab53c1972109,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:809ba65cbf8ab6484b8b880a5de9b438,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f6a674d0695c11f1aa26b74ffac11d73-20260616
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 160812048; Tue, 16 Jun 2026 16:25:42 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH] driver core: Add error handling in virtual_device_parent()
Date: Tue, 16 Jun 2026 16:25:28 +0800
Message-Id: <20260616082528.1220652-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The virtual_device_parent() function calls kobject_create_and_add()
without checking its return value. If memory allocation fails,
kobject_create_and_add() returns NULL, which would be propagated
to the caller without any error indication.in get_device_parent
call virtual_device_parent, if return NULL for parent_kobj,
'k->parent == parent_kobj'in list_for_each_entry, will always false.

Add proper error handling to return -ENOMEM when
kobject_create_and_add() fails, so callers can detect and handle
the error appropriately.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 drivers/base/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f..50c3131b7106 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3249,9 +3249,10 @@ struct kobject *virtual_device_parent(void)
 {
 	static struct kobject *virtual_dir = NULL;
 
-	if (!virtual_dir)
-		virtual_dir = kobject_create_and_add("virtual",
+	virtual_dir = kobject_create_and_add("virtual",
 						     &devices_kset->kobj);
+	if (!virtual_dir)
+		return -ENOMEM;
 
 	return virtual_dir;
 }
-- 
2.25.1

