Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8783536F413
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777034578; cv=none; b=VeYIY1F7tICiW79fJwRnfD68VniHO5oTwWoyS7yXT34Z769Qjp5cQxI/Gg5XeLUdPq/4s+iIyRyc7R7Psa0PoQacIOgSsyf1IlKKoUUTURU8NAs4AGXiNu0G9jzeDp9vI9M9K0vKNaiiBB1xgcXpM/79valq7KewHtg9MKVGF2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777034578; c=relaxed/simple;
	bh=cn4e2mz/A/5QWBWv2xUeJh3QyOT0vY1ZmQPa8Lp5MPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nw3LCD6x89cayNEgQLRHfZSMxx/DdO2/RBn+nTmmVbGYbUQcg5s+QjIzEHW+zCbk811al8kPKZ91KSRx5tah7l1cRlO9Eki4puoAvQ7LOJiOhQcvY8xERrYfZarIg3UU3WDhWynvq+2aMIjPWrHLOV/4OdZ413O1YORAaUB6mOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cinR7IhL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmt9+pDi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cinR7IhL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmt9+pDi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9HtLt1532385
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 12:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mAx5dCTDz4Eq0M25T8JIZmXtmzTcjsQUU5V
	vEpgsfDQ=; b=cinR7IhLEZLJbguPcj7Bb9G0w0JZhOvY9wj182Q8XqJuhEeIAKt
	PKKXO0ciuOeluszPw0XIm298/eICLh6bozbKlKr/lKVUTj5mVKSdfaPZIVByCbXs
	vrBuwTuowol1BgNMZ8E/aR8VoVG8deI5EhkCQ/LLY4xxf10twBuKuZadJ3/bs/Q1
	HykJ75WvDNau69ZyNxLNAS9RyTZllpp8dtrZbA/N63NKsP7PTrgFXFz8gPJrllNb
	bKiwBj0LqEKs8uRbwAwya7faLz5CBX4WZeLqAf1hPjSl3m1cXgsKbGRqyJdrRSrW
	Ic31lkNgRAJyDYefQtTt++cQB5SM8AsIUVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26m68r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 12:42:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb007bc36so119204671cf.3
        for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777034576; x=1777639376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mAx5dCTDz4Eq0M25T8JIZmXtmzTcjsQUU5VvEpgsfDQ=;
        b=dmt9+pDiaWLMbqPdCYIZS44GOoj1VvzvhafNqFY0CWTD87LAg/+SGG0oNKRsXcUnXZ
         QcS2FhnWbDmYPCO799lgTa2tdpYRoNlDSjq/ljoN4aQ0kfYJA6wr/CnS2xhxkfTGtpXJ
         wFntptu66jpSt/Sizs6ANzi7RVQqIBVvLoBPSY59vGiS9OANHqD/qzBlWSwoJxSxBP8X
         m07SBC/ear33hd1hWEG6dF/zQxn1inQG9fFSpKJd6DwvHPYlQfnR/UPpmz5qJdeapRCZ
         jNlMJ0tzdyyl7g1E/8cztUVU2DYaepQ/eGNqv3rqbL9vtCbMIBSVhAtwcAuNOWN2KXXc
         VLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777034576; x=1777639376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAx5dCTDz4Eq0M25T8JIZmXtmzTcjsQUU5VvEpgsfDQ=;
        b=ZY63aCv25O9e2/zF5aFO49CFdvoKqh3tZMo2QINegfvBLZrjz/uVm1SRjk3krdVTF6
         8CVLhViu09T47VXbWFROcdwNJcYVHVqpiR5MN/WdsEG8Cw7d9zaY+Ka4IyMYPbrLJoNl
         ezcOeHD7OQXR9NpbihiD/rr1Ku+uw5gVPWG0TeHnCY/unATu+RwZHdWEwA3K8Eyqg5wh
         xiD/57RnGXoE8dgtuNfVLmKp1z2I3H4ZC/JxM+YiOl/sUefeTKMXr8uD3J1F/SzEJEaD
         9NB2OFH0jsVhKhQUfKgvfTPNI6RJIeDY1XQwoluvnbpJxOisr0OWlxWj0EFZFcFgO6/l
         aXoA==
X-Forwarded-Encrypted: i=1; AFNElJ+doqtYUa29AtOW+a7mRShE47hahED5R088cf0GSDCeS9ZyKKARMAP3usY64GsAMYNEXsgJIRWYh4LIWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuK9uMJCfkMwhrDRZ4g5HuqJqjPiINDn5JD1bhM9IvqkVoZ2cf
	3RnkKQwJmkD+wo4s2Sv8Q9hDX7UoX/7u0mbE8PBnu6sxsCV31213Ggwur0v7/C7HyOef73/uEMC
	FFCAoNVSS2G2aZXuH/Q3EBfBkKp51leqSDENGY6oPHYiLNUhIjtmSN9dMfFuvZRd+sA==
X-Gm-Gg: AeBDieunaJJ0yppZADoVKSw2oDLGedrHYRguqmq4CN/3uxPC541Q8gmN9M+CqqCqj1f
	JbYUwFdJutF/zmXPQVKmrdQmiJGKvZvhVN6UDXb6ITWEJjKugsm25TXUd94u+sRlevaH/8BWWem
	oEsfRU18+0611yZcIt7bVkmtNYTEoX1tv30o4eJGF0y/g7Ode9aE/GVogYExSTeWvu/humkJJGx
	eVdEH4jzBW9i2UtRU+R+xijY/SksnBI8Ov0BRZHojPDdxTVSi6oUUxnSR8fVdWwo7s3A1OMOTud
	O1J5xxj8GHwoAwl+hMCDWNosaFkVXaReHl1z52P+XNwIVBQIbb1BLs6CjHnekOthLT1UVIjJu0d
	DuJeaXtS8YS7AQks0vUUu+DH6m8SeyI+z3xN3fkTZBqIsRvHH0s42HTggxbZ8
X-Received: by 2002:a05:622a:5a94:b0:50d:7b0c:35e7 with SMTP id d75a77b69052e-50e36ed02b9mr476541651cf.43.1777034575746;
        Fri, 24 Apr 2026 05:42:55 -0700 (PDT)
X-Received: by 2002:a05:622a:5a94:b0:50d:7b0c:35e7 with SMTP id d75a77b69052e-50e36ed02b9mr476541241cf.43.1777034575357;
        Fri, 24 Apr 2026 05:42:55 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4b5d:10b8:b359:f3a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6114f2cfsm29841715e9.35.2026.04.24.05.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 05:42:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] software node: provide wrappers around kobject_get/put()
Date: Fri, 24 Apr 2026 14:42:50 +0200
Message-ID: <20260424124250.92890-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: N-61T-tbPkOTc0_L3jbkz2Wiu0Ljx8Ow
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb6550 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=YraBtKz_dzo4wXHYukEA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: N-61T-tbPkOTc0_L3jbkz2Wiu0Ljx8Ow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfX6Lps9D+qoUki
 Ts5bFoElcBhalW00aO0F85mjIVfyq8bbuDu+xenvntLkkYFW9CH13Yfo5sJXWs4FjRPJNTLqywU
 vStI5F+L5RDyg+UgCDkPdQ/Ne5thXp3HtqBSvAPkMzE5uIpFL4o7K5UdD+RDGxwDcMvlWSWIbyY
 P9eVkbWvuGoSK5GjoFMFz7Ri9OR8bULJD06Ny354/+jzV8vSmshemcyZ/kAlETq36s72q/9R1Lf
 nxSi7Tn+bV/menydHpBIcZUduYymZ+vwBU00dbE4GnxeNxzIA8dpIuVhdugtIb8dYYTHY56R2IE
 k4W5n/XLaH3oegz304JlbNFwwMWqqik2NWTn0Ek4IqaecZVXGXzdhYkWQ1InQFop3AizLav0X+F
 okqcTHRXCD9OfZXS1AxJYdgUx7KCbmJ2ANmJfj5J3KBZtkDdQ50OtyX7ndEV5vzExhDfxpNUTZe
 NbMALxFCQSCEpQo6Eeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240117

Make the code more readable by avoid constant dereferencing of the
swnode's kobject when managing references. Provide wrappers that take
struct swnode * as argument and make them hide that logic.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index a19f8f722bc8e..503908c04ae66 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -374,20 +374,28 @@ EXPORT_SYMBOL_GPL(property_entries_free);
 /* -------------------------------------------------------------------------- */
 /* fwnode operations */
 
+static void swnode_get(struct swnode *swnode)
+{
+	kobject_get(&swnode->kobj);
+}
+
+static void swnode_put(struct swnode *swnode)
+{
+	kobject_put(&swnode->kobj);
+}
+
 static struct fwnode_handle *software_node_get(struct fwnode_handle *fwnode)
 {
 	struct swnode *swnode = to_swnode(fwnode);
 
-	kobject_get(&swnode->kobj);
+	swnode_get(swnode);
 
 	return &swnode->fwnode;
 }
 
 static void software_node_put(struct fwnode_handle *fwnode)
 {
-	struct swnode *swnode = to_swnode(fwnode);
-
-	kobject_put(&swnode->kobj);
+	swnode_put(to_swnode(fwnode));
 }
 
 static bool software_node_property_present(const struct fwnode_handle *fwnode,
@@ -493,7 +501,7 @@ software_node_get_named_child_node(const struct fwnode_handle *fwnode,
 
 	list_for_each_entry(child, &swnode->children, entry) {
 		if (!strcmp(childname, kobject_name(&child->kobj))) {
-			kobject_get(&child->kobj);
+			swnode_get(child);
 			return &child->fwnode;
 		}
 	}
@@ -737,7 +745,7 @@ software_node_find_by_name(const struct software_node *parent, const char *name)
 		swnode = kobj_to_swnode(k);
 		if (parent == swnode->node->parent && swnode->node->name &&
 		    !strcmp(name, swnode->node->name)) {
-			kobject_get(&swnode->kobj);
+			swnode_get(swnode);
 			break;
 		}
 		swnode = NULL;
@@ -835,13 +843,13 @@ swnode_register(const struct software_node *node, struct swnode *parent,
 					   parent ? &parent->kobj : NULL,
 					   "node%d", swnode->id);
 	if (ret) {
-		kobject_put(&swnode->kobj);
+		swnode_put(swnode);
 		return ERR_PTR(ret);
 	}
 
 	/*
 	 * Assign the flag only in the successful case, so
-	 * the above kobject_put() won't mess up with properties.
+	 * the above swnode_put() won't mess up with properties.
 	 */
 	swnode->allocated = allocated;
 
@@ -978,7 +986,7 @@ void fwnode_remove_software_node(struct fwnode_handle *fwnode)
 	if (!swnode)
 		return;
 
-	kobject_put(&swnode->kobj);
+	swnode_put(swnode);
 }
 EXPORT_SYMBOL_GPL(fwnode_remove_software_node);
 
@@ -1002,7 +1010,7 @@ int device_add_software_node(struct device *dev, const struct software_node *nod
 
 	swnode = software_node_to_swnode(node);
 	if (swnode) {
-		kobject_get(&swnode->kobj);
+		swnode_get(swnode);
 	} else {
 		ret = software_node_register(node);
 		if (ret)
@@ -1044,7 +1052,7 @@ void device_remove_software_node(struct device *dev)
 		software_node_notify_remove(dev);
 
 	set_secondary_fwnode(dev, NULL);
-	kobject_put(&swnode->kobj);
+	swnode_put(swnode);
 }
 EXPORT_SYMBOL_GPL(device_remove_software_node);
 
@@ -1097,7 +1105,7 @@ void software_node_notify(struct device *dev)
 	if (!swnode)
 		return;
 
-	kobject_get(&swnode->kobj);
+	swnode_get(swnode);
 	ret = sysfs_create_link(&dev->kobj, &swnode->kobj, "software_node");
 	if (ret)
 		return;
@@ -1119,11 +1127,11 @@ void software_node_notify_remove(struct device *dev)
 
 	sysfs_remove_link(&swnode->kobj, dev_name(dev));
 	sysfs_remove_link(&dev->kobj, "software_node");
-	kobject_put(&swnode->kobj);
+	swnode_put(swnode);
 
 	if (swnode->managed) {
 		set_secondary_fwnode(dev, NULL);
-		kobject_put(&swnode->kobj);
+		swnode_put(swnode);
 	}
 }
 
-- 
2.47.3

