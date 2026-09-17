Received: from sender6-pp-o94.zoho.com (sender6-pp-o94.zoho.com [165.173.180.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A9D3D6CA5
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 06:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626539; cv=pass; b=uI2oYydkWzyisP5bhAXZIoxz7lXxIRwrl6tw+hqfDjDIBusZROMVNF5ou8sBywWA01zPLngUSiKkmguLAGrzhVm84IZK9jUbUP/tR3txm7cpwX5+pQd/zgsEZaysAINzwnFMuuboMkYNMLsrGt9Q8g39yW3OXTpnsdccy4JWE54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626539; c=relaxed/simple;
	bh=NQo+cIKbt9AjN+cbx6M+C+3WPBigcNYE/QaA7+O5H3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nA9BBfIppXCa9uHRU2deURg1UTXVYBbDt5ZV+zTrrY4UkhzRemKItc5P5zkKGJFhOmuOqwFPcI9kM4xieFEzuCHcRZpRvtmgoSxyH6Vn17ILa7AoSbYCbEfTJn57QRf7HJviAhjaICJa964MlgaLgt7TFGI6WePsqCS9dyfzNfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=ming.li@zohomail.com header.b=a95+j3fb; arc=pass smtp.client-ip=165.173.180.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=ming.li@zohomail.com header.b="a95+j3fb"
ARC-Seal: i=1; a=rsa-sha256; t=1789626536; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G45Fx5uFiNsxgEANZo3r3xpzq8a1Sw/olYW8Q853Cdwv5cSvBrtsmktETbW/HNAAHUmjW70aSInBd9wCrtvXHQqqAdy/pZ0bB8fpwiZ0jsKEgJve18Eb/phoiJ2oCaFMtOZKl8Jcqw92915VF2ulJRWqMod82siHkVqzZiA8cz0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789626536; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q5rZmamiUjbl0ROqioWMK3xmaOK0RTgjlpX4JiEHB+4=; 
	b=k4iuqx/oiA+Pe6tSJidIa9GFmc7iD3U0Fjd2ib4RBORN5mc7/ZI5lOHNOxc8DZWvoeGy/F8+tzTrYsVBIcabxTjbTTi24w1s7sScsBLTzO3u21XR3n2/7+hOhWDGHwbwP/DjnN7NUO9qgorOLEPtDeJzWUb3c7sucRQexVJBXrY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=ming.li@zohomail.com;
	dmarc=pass header.from=<ming.li@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789626536;
	s=zm2022; d=zohomail.com; i=ming.li@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=q5rZmamiUjbl0ROqioWMK3xmaOK0RTgjlpX4JiEHB+4=;
	b=a95+j3fblUniAMn42bOpfpZ4QnrW2RxFLUVnxs9Ymjpq+javFTyaqzvZJ1FrmzK4
	FT4y0gPK2X2ueb7rWPl0yvQd+9SJ3R+1QuAFm7GxKdb6LGB3tzoiLRvWnhvQH6M4gEM
	HOa/4jRfJP+AjtGSkaXYkAae43C2upZL09sesJtw=
Received: by smtp.zohomail.com with SMTPS id 1789626534758704.6197889996848;
	Wed, 16 Sep 2026 23:28:54 -0700 (PDT)
From: Li Ming <ming.li@zohomail.com>
Date: Thu, 17 Sep 2026 14:28:00 +0800
Subject: [PATCH] drivers/base/node: Fix cleanup path of
 node_init_node_access()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-fix_cleanup_patch_of_node_init_node_access-v1-1-afeafe7e259c@zohomail.com>
X-B4-Tracking: v=1; b=H4sIAG+Iq2oC/yWN0QrCMAxFf2Xk2cJW2Ub9FZES08wFJC3NFGHs3
 y36ds7DuXcH4ypscOl2qPwWk6xNhlMHtKI+2ElqDr73Ux+G2S3yifRk1FeJBTdaY16i5sRRVLY
 /IRGbuTGFcfZTON89QhsslVv9O7vejuMLCxOONHwAAAA=
X-Change-ID: 20260917-fix_cleanup_patch_of_node_init_node_access-5d9572693b2a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Keith Busch <kbusch@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Li Ming <ming.li@zohomail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789626532; l=1562;
 i=ming.li@zohomail.com; s=20260210; h=from:subject:message-id;
 bh=NQo+cIKbt9AjN+cbx6M+C+3WPBigcNYE/QaA7+O5H3o=;
 b=Sx0TIQbXQ5SpMjcfHLOo1yNeEco0KYv+BBgMxXLk9YgMe8wZ2x8dGdyAWM6TLSDSvmBbTeL0n
 UxIzEZj0VU+A4M8jw8A2bgz3XpgaHE6hagD8SDKx0nEgcCQRoTcl41z
X-Developer-Key: i=ming.li@zohomail.com; a=ed25519;
 pk=JfhrdHjyYJMXt47Hy8d/fsqZuhGPD4Z3whV5lTfVvhE=
Feedback-ID: zu080112278e94ff9b14f6f3adc312877b000099804d77dafbd36b90f41a3bb5f4a01e043eef36911781b913:ZohoMail
X-Zoho-CM-AccountID: abd763e7b9fa23acf4f42a44f9876d2d993e05abdb9290f9ccb1008c977bf7f0
X-ZohoMailClient: External

In node_init_node_access(), it frees the device when device_register()
fails. But per the description of device_register(), should use
put_device() to give up the device reference when device_register()
fails, rather than freeing the device directly.

Fixes: 08d9dbe72b1f ("node: Link memory nodes to their compute nodes")
Signed-off-by: Li Ming <ming.li@zohomail.com>
---
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

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-fix_cleanup_patch_of_node_init_node_access-5d9572693b2a

Best regards,
-- 
Li Ming <ming.li@zohomail.com>

