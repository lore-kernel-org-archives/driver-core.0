Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F693644A1
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730363; cv=none; b=RX269vQLHWH6ZVn2A2kLp4I27fYfy89B93jAKo45SCKK0tmBjQKEFNkKROov5fovSghxtEv41dfO5vY2lywgTrU+x4W9g3XvZTXAWty01vZGjtgx1dCFyv83ATj4JxebqLgzg2NpFD2CH3nHGOdJQJHsaJSGJ+MWy/5QPVdJckA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730363; c=relaxed/simple;
	bh=zaiJLexiF98y8XcMe93LaDHZUMWvIUjsVpeVPy2+qgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmahZx0+FPwoGwwYRKzXcLoF8tkVFBD2zOKfsgutROmGzPdEHLipjScB63msQpVDnab4sdoSK7TgJODzOzLF7nL4kuPtBzzEWuY2ClPa54GZFY1q6Ff6XbbzvnFukEKLve9srkody8Bw0bRD0Ma9gL8ePfXvwYoyTiJL1qfS0/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcTHCiWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuHlsUeV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcTHCiWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuHlsUeV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATYrm2647249
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eUhmGJbv6k1XDbgbJ9s2sfVkkEIVefNbG9jVOo4wYIw=; b=bcTHCiWxOiugwPib
	8HDNj5BIp4aaGBKPQ9EAztIhY9W6IE8NzwNP66CJNSru6o52xP8UOivFp1zYBjbE
	t+OaFyfdooNaLb3Z7iQs7aiPWKhpdw+FdmxLfXZxB64J+Ig2a301ImbzdV9AWMnq
	oU76HFygbwb6JtyA8S3Em/zhNIIOpReqhGX02cv3B1j7/RMCC39YXf3eNruxDnZn
	uwNgpRVB0Wfrxc/LM0BgHeW7DueSdkBxZ83XUoXTegcwdJiqxNfGURIHKXbsIIoC
	TykM3SJCq4RM12zyWBi3Qb9hmvaCNhS3CvZXH/PPLFD+xvFEoyulnvxvaU4o6Uqb
	OlbCuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8p40q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ad11e2197so594115585a.1
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 03:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730360; x=1783335160; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUhmGJbv6k1XDbgbJ9s2sfVkkEIVefNbG9jVOo4wYIw=;
        b=FuHlsUeVxhgww/iRsJwRDCpDPBGPa12Z4sGz4wUiIe/YODivD2GOULlN8ZZP5Q5p8Z
         Cc3MYXo6FrQubdhFcEimCbC4882rxYriSbeEybW+IkgKlrBzrErVE9zN9Pknyhp6sMxb
         4J1ftk3rgvz4rPRNEmNCqAReq265r8lqScNZz2M5OfO4d4+5p3+9/i79zAYKBcNNf6VY
         GntlIH1J7LGxvsdLcf3YlYHwkuTe0jp4HUVabH2uZBZzl1gUxI2dKGjAnDH7mSsnmU+Z
         4+eX7K//ugFhZo7KnGKrzOcD7nheIXpPoaibj7Wd420RmvLw587XLuzSkjOO3XxNzbH4
         Vaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730360; x=1783335160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eUhmGJbv6k1XDbgbJ9s2sfVkkEIVefNbG9jVOo4wYIw=;
        b=heMqwtg6lUht/VLAO8qLQ8E+Kua0vejjkB8HF7BYfWTX/pzJEkiPVAVoiruBf5D44E
         zQ87GHwVPCAuL2cTRdZVNeJXJLqbt/+UYemkR0yDmW3yrYTE8S0RSXBFdlxgUzS7qrZ0
         8BA4UFkRuanfz3ZRuepE6Vl9QdM6Os6tD3Fx1R5YWpqm73qDjazDI2FsBeYfa0vyu+op
         atzYXbappDLskFjFDx6k0rfZB+Cg7gQdGU9lRHxBB7l3i1HmoafBn3sememAMN9hKSwE
         dO0CUkv5fDKg1J5GmEJKezhLQvE6wdKx5Ub/8Px56Po0rlBQ6IKfsRJzbRHn1ySs23KO
         dnwg==
X-Forwarded-Encrypted: i=1; AFNElJ9CgXqI8dzsE/hAHry6lMzYHFefmAOydNf5qW5cBRrcRftM3aKSjp2PvtVsB7sTkoRE75hzkqOw19/qtw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz63xPOFlp71exMLIxgtDi5ji+EeuseAo6lrUrh/OzIs1tM+yC2
	354550VPpOJeMiHqgMqXeJ1CRC2z7v7scf6dpcleoHfbT7EFmh/pcjxliix7drSztPSFFAEl2jp
	DVllVEJXsLB01SAfkHWKfo1FJBLMzd45a5wHx6SlXOGG0EFOwpH/Rqh2IZsop7wCPkg==
X-Gm-Gg: AfdE7cm0gbY5m6vVG0GuuhWh1PWNepCw9BBNCYvHXd/4MvQprwnVVvFwP8FpKA0PIkK
	BCDFA2RNY505M+U17xaSMBBa4Bt/7r7YbyN5SiPV57bQY2ieSqQuDJFX35jdDRU6Rc79DLI6MmQ
	Hm+BJ1zPsSR61/9AQL38zcTPOPQCR7wJhtwIk8qnSh347fY5z4VVMEJvPRlLOVJxJiJh8Wk4Yo3
	qDTfHl+xrvOFbfjVuld/STtFoByNpI6YJw/j4Om2eoGpZv5Ee+OGUuoO7Elu3DjYQxSBs7FZ4pK
	gfwX2n3y2haj3JCMOVou25qtU0cikcEm5v9r6Diyy7WgBIVVWMSM0wfKDdisZ6xi1dBpM1vBH93
	myrSJThevxpgNRmM/1s7t3eEde1MBPSQkxrt15ukO
X-Received: by 2002:a05:620a:2a0a:b0:926:e8e6:3b09 with SMTP id af79cd13be357-9293dea9e7bmr2373503785a.54.1782730359521;
        Mon, 29 Jun 2026 03:52:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0a:b0:926:e8e6:3b09 with SMTP id af79cd13be357-9293dea9e7bmr2373499085a.54.1782730358805;
        Mon, 29 Jun 2026 03:52:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:52:07 +0200
Subject: [PATCH 2/5] software node: add fw_devlink support
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-swnode-fw-devlink-v1-2-b90058b41839@oss.qualcomm.com>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
In-Reply-To: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5901;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zaiJLexiF98y8XcMe93LaDHZUMWvIUjsVpeVPy2+qgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5t0Y9gDbRacLGA38+hEuDqKZaDGylsWKnXO
 jty9JT45GyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJObQAKCRAFnS7L/zaE
 w7uFD/0dTneqZ2cF0h8mSLdekIQ/jforMnCahzb5haC6IBoks/HERg9gKPMxr47I2RsPVJ7EDVM
 Hoib9K7MhaLH1ssXUnzGxzU0t1EMHsuRtCN8tSdU2IuatwKVMOx2zDirAlmWxkzSQcxavkC7Ahx
 e+8n1DLlKhh86o/5/Fi8axWIlgA+Dudef8ISacUz5pAvqH6zt/roj0xGWvfU5BZxkltg+M66yer
 Nln3PG8p2DyQT0yGZuT2fIUharosrL9b1JJt5s88QLhZAYpUTw2XXJ/o74Ap/xWxUecgX+qt7bJ
 FWFDUsh688jD4rEBuIBkRDPXZ3B4C7PtvqNE+9X5ZAhEqzF6Vy2GBclxYelrom/cl2j9XZANLpK
 ulae2sg4T4JHrCCCW4HQx4RNTe+NbEBKRjoT4mDAqPaZ9KzFMOyJGH72y/YlFtnY9ad/+x30oQi
 xkB69uuRhijx4LqFTY+Z4homeXD/mjMENJEkqXUPDhZ5dJ6yi/m3xr9bIpCP4SvoKwtJJs1K0lF
 1R2lcIHbpjH3LClw2tfnx/Bh3s/kCLBNzrmK8Lk4l7LFA3Q0J/j/iqqIrD0+mB/8ecnCSd62QQ3
 5nRaC5cA9KISwqiIYPRMoSuaSj/A1WQwlgc+vcCU6XrmBnQlURX9wycpSW93N31yN0WVU+w0R2r
 e6bu2CsS6ySlHdw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfXzkOAYI6PO59S
 UdP79+Oq8Nl9fgRkxfPI4Gpe16MqQ271d8vxQ748pibCeProl4roWrr005Px2eUaST9bSkJ9hWG
 UclhhyL3WiqKVKRwdTKR9BRi6zwd4gI=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a424e78 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hYae1UF5it2L3rE2BuUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uF8IHtRFbuWmakQPb9OF8eVuAWWHnFyU
X-Proofpoint-ORIG-GUID: uF8IHtRFbuWmakQPb9OF8eVuAWWHnFyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX29bRMNuMPxwY
 IxzsZe+w1LOQiSkSooMJCtMtuP0JoGLcOA9yMH7Edc+I35A5ORDQkCmZ4SC2tSIf6QLPbQUzikl
 rrtKtI1LKheyS+KkASLMbxf18fAW8MWgqERchtBd6a72PIA/8KGq6ajzvCY+Ca3Dau21cuWMtbZ
 Qu/H6K+YHI8dfnUvSXUsWs6UaJIzu6LKVUsKSU18boFH81vzhC+IC4heODVSyDur93V23cCwWoi
 vKyLZaNa/hmBRHGQt2Kqb5Bl5nbqmvGr2kZqCW2zk+r18WF1TzREFWu0jZUkNCjUw2zeAcJ8vnB
 e0G+R2wzEKxui2vRkd5lZdfabHLvYwnHgS1MIhjzCQTpj/zs0GEaQZeRzj65vBN+O18wmLNq7jb
 2nV9zFKj9S7QwjsuCviKtNhVSYqOT344PzuUmJXvzKf0uHpuPRFIs4olExZmMIbQnYz8+JXk4uH
 YRcCdkczZlRe3G2RzCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

Software nodes can be used to describe supplier-consumer relationships
between devices they represent using reference property entries. Unlike
for OF-nodes, driver core cannot yet use these references to create a
probe order that avoids needless probe deferrals on missing providers.

Implement software_node_add_links() modelled on of_fwnode_add_links().
For every DEV_PROP_REF property we resolve each referenced supplier and
create an fwnode link from the node to it. The driver core later promotes
these to device links and defers the consumer until the suppliers are
ready.

There's no allowlist like the one DT needs - devicetree phandles appear
in plenty of non-supplier contexts, but a software node only carries a
reference property when its author explicitly points at another node, so
we treat every reference as an intentional supplier dependency and link
all of them. Graph "remote-endpoint" references are skipped for now: they
go 2-ways between endpoint nodes and would create graph cycles without
the port-parent lifting DT does via get_con_dev(). References to
suppliers that aren't registered yet and self-references are ignored.

fw_devlink resolves the supplier device through fwnode->dev but the core
only records the owning device on the primary fwnode. When the software
node is a device's secondary fwnode, mirror the device pointer onto it in
software_node_notify() so the consumer can actually find the supplier
instead of deferring forever.

While at it: purge the fwnode links in software_node_release() now that
software nodes can own them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 869228a65cb365567ddac7db6ad7b8743e0dbca9..48eb67826f9e1917acc7a6a513c1536a7ece0961 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -699,6 +699,62 @@ software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int software_node_add_links(struct fwnode_handle *fwnode)
+{
+	const struct software_node_ref_args *ref, *ref_array;
+	struct swnode *swnode = to_swnode(fwnode);
+	const struct property_entry *prop;
+	struct fwnode_handle *refnode;
+	unsigned int count, i;
+
+	if (!swnode || !swnode->node->properties)
+		return 0;
+
+	/*
+	 * Unlike Device Tree, where phandles appear in many non-supplier
+	 * contexts and a curated allowlist is required, a software node only
+	 * carries a DEV_PROP_REF property when the author explicitly describes
+	 * a reference to another node. Every such reference is therefore an
+	 * intentional supplier dependency, so we create fwnode links for all
+	 * of them.
+	 */
+	for (prop = swnode->node->properties; prop->name; prop++) {
+		if (prop->type != DEV_PROP_REF || prop->is_inline)
+			continue;
+
+		/*
+		 * TODO: Graph "remote-endpoint" references go both ways
+		 * between endpoint child nodes and would create endpoint
+		 * cycles. Let's leave it out for now until we have potential
+		 * users.
+		 */
+		if (!strcmp(prop->name, "remote-endpoint"))
+			continue;
+
+		ref_array = prop->pointer;
+		count = prop->length / sizeof(*ref_array);
+
+		for (i = 0; i < count; i++) {
+			ref = &ref_array[i];
+
+			if (ref->swnode)
+				refnode = software_node_fwnode(ref->swnode);
+			else if (ref->fwnode)
+				refnode = ref->fwnode;
+			else
+				continue;
+
+			/* Supplier not registered yet, or self-reference. */
+			if (!refnode || refnode == &swnode->fwnode)
+				continue;
+
+			fwnode_link_add(&swnode->fwnode, refnode, 0);
+		}
+	}
+
+	return 0;
+}
+
 static const struct fwnode_operations software_node_ops = {
 	.get = software_node_get,
 	.put = software_node_put,
@@ -716,6 +772,7 @@ static const struct fwnode_operations software_node_ops = {
 	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
 	.graph_get_port_parent = software_node_graph_get_port_parent,
 	.graph_parse_endpoint = software_node_graph_parse_endpoint,
+	.add_links = software_node_add_links,
 };
 
 /* -------------------------------------------------------------------------- */
@@ -787,6 +844,8 @@ static void software_node_release(struct kobject *kobj)
 {
 	struct swnode *swnode = kobj_to_swnode(kobj);
 
+	fwnode_links_purge(&swnode->fwnode);
+
 	if (swnode->parent) {
 		ida_free(&swnode->parent->child_ids, swnode->id);
 		list_del(&swnode->entry);
@@ -1105,6 +1164,17 @@ void software_node_notify(struct device *dev)
 	if (!swnode)
 		return;
 
+	/*
+	 * When the software node is the device's secondary firmware node, the
+	 * core only records the owning device on the primary fwnode (see
+	 * device_add()). fw_devlink resolves a supplier device through
+	 * fwnode->dev, so without this a consumer referencing the software
+	 * node could never find the supplier device and would defer forever.
+	 * Make fwnode.dev point to its owner in that case.
+	 */
+	if (dev_fwnode(dev) != &swnode->fwnode && !swnode->fwnode.dev)
+		swnode->fwnode.dev = dev;
+
 	swnode_get(swnode);
 	ret = sysfs_create_link(&dev->kobj, &swnode->kobj, "software_node");
 	if (ret)
@@ -1127,6 +1197,15 @@ void software_node_notify_remove(struct device *dev)
 
 	sysfs_remove_link(&swnode->kobj, dev_name(dev));
 	sysfs_remove_link(&dev->kobj, "software_node");
+
+	/*
+	 * Drop the device pointer mirrored onto a secondary software node in
+	 * software_node_notify(). For a primary software node the core owns
+	 * fwnode->dev and clears it in device_del().
+	 */
+	if (dev_fwnode(dev) != &swnode->fwnode && swnode->fwnode.dev == dev)
+		swnode->fwnode.dev = NULL;
+
 	swnode_put(swnode);
 
 	if (swnode->managed) {

-- 
2.47.3

