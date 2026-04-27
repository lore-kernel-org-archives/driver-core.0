Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9163C3C1E
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295916; cv=none; b=IRpseAdeXGKsvM0O9wxxe8IS6QB0T1601WaJb/5hCKD0iKlpr/j4LvPCxG6ymRqoE9i/6KTMgqG8jn8yj3pYC9vzTw5h/Kk9wv6V8AQlJMPpNsQEYaSaStJi4UksG4ibYqqZAhuneeyR0NzEboKVAbEagSPyPuOI8rK6i1QfOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295916; c=relaxed/simple;
	bh=qcZdDAZYcucxialNIwKMj7fy8LHoFUSymG/EEtHJ/94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fe/WpAcijXwPFy0lhaiIT3aqYG3LtK3eNyDH63ivdzsT+BkWoQ/FBeg1z55W8hct+0brU05UIkKT6yJoIR/Wh9v6j0NmG/e0p/J4noHoVSDubHKu2jWQmaNMFApG0AVu9fgBuLYcuLr5+wpuQ711cVapPmX7YiLbHh0DUzKUK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPRs4Ri4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHnKNIrX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPRs4Ri4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHnKNIrX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9Oc9P3825223
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 13:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zkk15cs4HQuTAwcx0rFc4UdYWGmvwU5NjUq
	dwPsu1+U=; b=BPRs4Ri4eG80x+9Vb8VjxMScKoLcIBbFyXs1QYFv5rmc7ZCm9oC
	iCSuySrFoP5p2pKa0p79XuUVdB5Y5Wn0NtfQvl5qhwn2D8B9vnYP1jH7C5WDWhlx
	E1oaAYF/k0VL2h44fZZAOqvWMmpNtdiwmQm9B8lVX1LqTQ7J85d55HwEL1RQnpXx
	hsVd41VE3Zd46oFAwEX66HCoDihU02JheuJCr4X4s8rX40YyUYnB8zJ1+ggJRC4s
	xVqfJzTDE0t2v6DN+Rsw6ytWcK0JbC0M/pDNtCQ6eLcYszU52YnMKL7VH8QAhOTd
	0HwLYyITCRfBW+56DkdkCx5vHQSC81T9YLQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5550vfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 13:18:32 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56ae34d6738so15800358e0c.3
        for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295912; x=1777900712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zkk15cs4HQuTAwcx0rFc4UdYWGmvwU5NjUqdwPsu1+U=;
        b=JHnKNIrXv1ayaCbd2HCF2dTTBkO0xyfFtmW5kqIrE1sa3GM1190UnhM5geWEmpogP/
         gx1DScdRAgFSaqeJeF5dwF7PvYvDWf48ebTEHJo3mCEfcOrpzUmu+sHYP+DZlV/nk+oI
         p6s70m84YgHM99iANb/uxlMS19ZP3D7NiLXjQ87S4+z545YRuYRA2oSJszfwsiripw1u
         J++hk+MifyAgF+HE4izuiN7mFZmWhULwMTCxeS0MA4nmrjCxZ5AMDO6p5K50/xrArjSb
         iZ9gqzA0lpz2WyORshtmtoeJfaVUhRRcDlnLLBFUw+peMA9Qf2OVlIjRsdGI9HLKaF+a
         EgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295912; x=1777900712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkk15cs4HQuTAwcx0rFc4UdYWGmvwU5NjUqdwPsu1+U=;
        b=oOcSLBt0gTp/wiAa3nzWtyLAub11KOuaOB7dByVtEQyucCOpCQbSkMI9Rw4tU5DWlo
         HxM7hPn4Yt5Nfj62kaJPhL6KfAvFh7lhH1l6SWFQfRvGuV4jLuSx9yKDq9khjqrJTBnr
         6/ywOaI6sHYMZELxGeX6ZoZva/3FWT8lEKn7BshMAczlJVHobpv3hUdCnW4JArrMVV+H
         MAaPUH0DD2tMtXA5NBg8uQA1kAWT1hsiVwDi9HdJFq0egIvGM1uQMGgjzzYkPNdXQbIr
         8GwrkF+5B6vtcdroHpLY/6CO8HYTK3TQkUT9z852nNaR97QtodLeyPdqrgO0B7SByVHb
         fg1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9pSYSYrL1S793V2P/tpPr0CGjiMAPEiN6hlqQIF63Ks2HjlQx25bwfukL7aishMneVmfNK1UIqNEo+pg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLC4VTzOGvNInx796N3xLuw280uWShx++32KygyLOC/cfw8UcT
	R8rzzrK/tytXXd6cIk1iXFD76hUKZN1J23CrWA4ToDdNzuI1MexQDihYCsO9p4QomE9PkK9TqEg
	pJhmtAyeSZRogQXJ/FCj5En3OhtwSk/IS5byxDdsOvnIN30XwkmPAhu2mOhXtvIPHrA==
X-Gm-Gg: AeBDieuSxDyaG6WAgiFR3Scp3Gj9I3qZRn4ImvsiDgjfng/AgpBUbO2SL+/iAu5s9VN
	tq2OaU8rPHzUQBPR0ppRs/KLZOolP1KlM8brGAIZfjW/uvroBFNHML2gq1ba0qTB9OvsoAS0Ds4
	l2JfoaWvZ5Kvnls1+qmDXtB71kReVCgIYTTHpPEMCFGiqSkE8Ope/FqPPa6eLVrFJeo0C8hV9fP
	6b5dNedMKo/iYkyoy1HzshZEdFkx3PHLTHy0TJ5EzsHFRHm+ceHb50QJJ/LfhGeV5rRtwDh+4oF
	xdzDVeUZlfM+eFWmJjs2xMM5qjksmVkZJtpTLSO36JapjTcetdTzDmcjgBM94gTRGq7FwPiRhXd
	N+9CJD5dYlKWGCEflwUC+zYJSCck5UC9BjGaJic1eZaAdM2igFRYxwjMzLJN8
X-Received: by 2002:a05:6102:dcd:b0:612:b3af:39f1 with SMTP id ada2fe7eead31-616f68d1bafmr21907528137.18.1777295911946;
        Mon, 27 Apr 2026 06:18:31 -0700 (PDT)
X-Received: by 2002:a05:6102:dcd:b0:612:b3af:39f1 with SMTP id ada2fe7eead31-616f68d1bafmr21907497137.18.1777295911521;
        Mon, 27 Apr 2026 06:18:31 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:83be:e944:7b0e:ef3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a66533ff4sm112607135e9.6.2026.04.27.06.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:18:30 -0700 (PDT)
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
Subject: [PATCH v2] software node: provide wrappers around kobject_get/put()
Date: Mon, 27 Apr 2026 15:18:25 +0200
Message-ID: <20260427131825.15793-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: i44oeJ7TcCNDmtlIdJkuTfROE7PPk-vY
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef6229 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=bCnx2AzvNVCsJt7Mrv4A:9
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0MSBTYWx0ZWRfXzdA6tjvJH6W6
 gxFF1bMabWtxVqaX63k+ykYbBH6vSpJu+of40L+4fWczPz210tHElElNL6jX+CNbmciJ+YqHljJ
 /lJxNImOqfGYi/pIZWgTUqrPnZDgGf2ihCmGtyqqbWr1UrxbGeSw9UrL0bMPPsYP1Fzq7WuG14+
 93TTlEcVedfEk3gx34UPpilTiv3hFFk5nqf9f5w/JasDexh6h+NKPCy6DuAnQd9+Pazq1anoJ1n
 GWn8aZRidLE4dH0FZF2FEzsb12rmS8PB5aJpqGc3pnkEKSsAIGnonFHDdmyYw3a+BPC+B0Tkl67
 fbAJJIx+L0tvnMlH+rBQ4hQi2GHF0iJ1iZGtwD3MzuFU/EQc/KMECqL0nfLEVUwlfmfytjuXuG1
 ac2MEQP3uzp8hvNayxQiOfe3dM9N/qF7LjEDZJMqTXqyqsr7jI3GsIiXhhFme7IR7DYyvufPmcP
 6GQW2vb5KxAv1cSrfBg==
X-Proofpoint-ORIG-GUID: i44oeJ7TcCNDmtlIdJkuTfROE7PPk-vY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270141

Make the code more readable by avoid constant dereferencing of the
swnode's kobject when managing references. Provide wrappers that take
struct swnode * as argument and make them hide that logic.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Make swnode_get() return the address of the swnode whose refcount it
  bumps and use that fact in software_node_get()

 drivers/base/swnode.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index a19f8f722bc8e..869228a65cb36 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -374,20 +374,28 @@ EXPORT_SYMBOL_GPL(property_entries_free);
 /* -------------------------------------------------------------------------- */
 /* fwnode operations */
 
-static struct fwnode_handle *software_node_get(struct fwnode_handle *fwnode)
+static struct swnode *swnode_get(struct swnode *swnode)
 {
-	struct swnode *swnode = to_swnode(fwnode);
-
 	kobject_get(&swnode->kobj);
 
+	return swnode;
+}
+
+static void swnode_put(struct swnode *swnode)
+{
+	kobject_put(&swnode->kobj);
+}
+
+static struct fwnode_handle *software_node_get(struct fwnode_handle *fwnode)
+{
+	struct swnode *swnode = swnode_get(to_swnode(fwnode));
+
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

