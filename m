Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F395257824
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691516; cv=none; b=hhJQ07sw72KM02vtEzgNSkih0O3Ofz7jbeLbuDo8wxmc+qoNvtMlGNEO08MONcnE4z9iZ4RLwmbFeus1HwbIxypOHfFARtCE4T7F2pv5LwGfkN2O1/Sy+DVt/I77MFNYuzavbcQPb+SCCdZ0ooSAmlZLwt6DTwNx4GWBvbvr8xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691516; c=relaxed/simple;
	bh=p8na6W0xPTYfTVnsE7Dd5eOOL46+fWqxiXgdhhhwMHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ymv/O/BnjzSugXFEKfroYMa+Slgf5OJUjSmsXMTQeyGLeWwUWDTgaWgzqhIboiC3W+xc0GttIHvbCyvOG4RRLDVD3bJMO6ikcLlMRez2Lfy3X6kiL7xxE6VUqRE6bN+91hKYBsxiDaQM8dWcVGnAMD5DxoCrhbDeXkkddbed3aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYl0CLl/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D4JSHzcu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYl0CLl/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D4JSHzcu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6ZOJ823221
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GOJMry5Lrk7UCqJP9VX7WgzjsId57wM52BDwYMyHQM=; b=IYl0CLl/uU5b+dI8
	Lovkgm3fAEF4TsSsmneucnzMeAyzWBOf4saM55b/qA59n5b+TfQUPAnbOQTj3BXY
	GjaTYapxfv3i19G1hCWYB6yZG+VUt493aou7sY1N1PLnzlfH6F+F8t7IS1bYqFyK
	UtlNq2ZTUhp378gNYidl/1PfmXU6iUtViKYc+TfwVeWw4PU9XZkk6Z7i6yMBYBgN
	eWng8LRH59RX6DtHpAjQwQ6HRDLPUfKvw20u6N4OLPHnzTA0nP950384BrCbwLn2
	Nzkg5EmueT3quxeBT64n53YlxeXYt5DUjFVcIoKumDfYO/jmCG05PqSvpE4HaBBt
	BsfOmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjcxun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:51:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07f25de2so7400571cf.3
        for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 06:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691513; x=1784296313; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GOJMry5Lrk7UCqJP9VX7WgzjsId57wM52BDwYMyHQM=;
        b=D4JSHzcu0+YcjycjsojZF79iPfauC2bVUoE2rJveU4Kfis6IJqgz1ixu5IJPLeoGsW
         3ER82detO/AC0b7lCW3J0rwpbTmXmHBODKUBvi5eyAAa5nXUw2BsTIHUtcs7Kt1vKe4s
         EsRnzbrYeZ/shDDbbLtJ9YsYsAs/ddTnZ3hVcfcDJBbXWOrD2sTKQ/731rTAxtTtueQ6
         +NnYLgdbM4NiXTC4yZDbi3GtaBGjMYKIREnN4+eF62Y5O6SmN5Tb8kijgIH5BzGm0wOb
         ybUy8p3MvQCipGYooJooHUmXbjetDw/IQ7uCscRitH2ROgMDReM/xHhBLnYvutDjmO0P
         fKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691513; x=1784296313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GOJMry5Lrk7UCqJP9VX7WgzjsId57wM52BDwYMyHQM=;
        b=CKvx7+Iq/uWgo/N3ZUIiqoAnLpGRx02/6E/hLjkCz6LA/QR7r+uaQIZ3pvemsYJBIC
         aN5bzt6tgAC7ZJHsDTuHYLtw9jiQRaSmRj+w5mW3dsxq5vgkHApWeM0PIMm47x9qyG+N
         lQzufADpGYh6X2To678D+3enB7AYVzwEth0zcgjATU2uIlDXaa7H+qDt7GIiZbjDTPDf
         aBdY2t6o5k3vpWlCzeQG3NDycvT5pkECD4XpUTJA3lhuLD9/sfWeHBjC+wLVDm/6dQ+M
         9+PLjJFM2vbU5r4mDuJhtW7uBP6HoRn/1dHnq1iIcjFmVefF3HTBlHmdTD5Ao21+15ON
         i+EA==
X-Forwarded-Encrypted: i=1; AHgh+Rpq05n6tXnGSobMKq/X4AlFOj/vTz4RbNQEcLQaGg/wUO7BLysZBTztibCwf1QDMJq6ob7NEK9xH3rKdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyM7Hz1fLJBeX2BRKn+gNIWTsaGZGP/LOERNq2S6WHsNNJyS/D+
	7zwGjqwSM/j3DMWcopHaCTUKZdmACTgSFpkySgIN6z8Vjeylt9JBGyTJnim4zb6trr9f9gOANdh
	DfUyn7x3VCiNXJzhrzB/U/4YX9mcIiRBM8+Dqkk4vr3vLRmYbBrG63zUbDXgC6paGgw==
X-Gm-Gg: AfdE7cmJmQQeLExuptiGle/LlzsZquy5tB5N/i/iZnz/WIPeFAHKlls6j4+G9Lz2qvm
	O5nGCI2djkk9U+SykEAa6lRz1Ppkh1/mhCGqLWqNN+lxRrFpTowHcf+Rz1RIgIkwsLuB6rxbgaw
	aOUBQQhgYhXN4G9scpfzi/u9XS6+ZdW1ZLD/TyF2XCLozUsvyx45dqMlUUzDt7LYLQU+SwgBFM8
	XJjJRwnxb3QfgX4z82eriznobBtBqp+TcEy1ZyOm5e/u4sMDPp35trMtOZD3yRaWdz8wzMEjPYn
	S/Le5EnT0agvJKWP1fuvvPmLJP2PMdwTK6pUk75YRXDzU8OdomF7+etd54pZMBzGHbrlbWdI8p5
	xgjHizoiVnXgGxlAdXr17q41fY/j7lLt7bWIB5RK8
X-Received: by 2002:a05:622a:4290:b0:51a:8c9b:649c with SMTP id d75a77b69052e-51c8b411e7dmr129533391cf.64.1783691513062;
        Fri, 10 Jul 2026 06:51:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4290:b0:51a:8c9b:649c with SMTP id d75a77b69052e-51c8b411e7dmr129532901cf.64.1783691512576;
        Fri, 10 Jul 2026 06:51:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:51:21 +0200
Subject: [PATCH v3 2/5] software node: add fw_devlink support
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-swnode-fw-devlink-v3-2-993f31874e40@oss.qualcomm.com>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
In-Reply-To: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5927;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p8na6W0xPTYfTVnsE7Dd5eOOL46+fWqxiXgdhhhwMHA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPjrpyCZS0mjk0G0cGCkbItm0SHjyb8xeL7R4
 rb5T7biiRKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD46wAKCRAFnS7L/zaE
 w6ixD/9kkAISCrEhTTLyc3rb9FGcOP9AOwfUlXm4ABpAf3CTU7noD+xkmDj6r+aZdfC9sTh2Tss
 vRMLRtJroMPuqRDma94T3LqCCVCzJ7eHRj9LyK3NhxGllXjSaNCnMW0JsD5KW1pqjRzQxwpXqG4
 5bC/++mv7aWzd+j9TZ1AxSfQpinywvKTtRxT+HqIPgXQNpHAfh2n1AB6uddVf7VJ4Sjn3y5cedJ
 PmvjilckDiqRQ0iE65HCic23vT/hhmg3b4cZ7g5ExaOwwX4fQ7TYQ+JGvnvuiyW0FBihy4gXuya
 FbpUxN5sz1tqfUMk1p8i+4puupIK1Kxr+zORkIARU5HGjP4p3E17gd2h6LODmtflvlVU3idQMzL
 1TBBjwTTaYG3n0dO+fwHiL1EfT9yXWJ1K0oMa46q6hxVYPgZVyb9DzmIEQ0zSv+kWlEqhKJA7GR
 6FfOZDGjoTIjXommDRasgfWy/kRWC0UNMC6PF9FO98wI+2pR577zOGi55zGlvKEHdE8UCnDJ9UT
 DPJQrbGuSiLUClACqLaUNEVuqe91mwXfPWI8SAE8tWrMOX4xAaQO4/4M2nxOpPp/WMfRv0t6RdU
 rnRlheItrq34/50fscAY1Zk7RfEiKQujLTIY6I6Sx3bwju0+s/SH7+DbGpDKLlk21fMjvccoSzg
 vxna1u3RgzFKMRg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX+sN/u3okj/bj
 OYKukU4ErTJgUKdYcktX690wNnpcGbVPrWVWb1g2WzTs+P7qwB9WikEr2M6qaydc72C9Xso/Qoe
 NgKPOYv5H3yldXtirP7Sp8Kr1ZJ2QfzYGpkvFVx7fYNr0qW5ITHnaO0XLjFp/6SiBhc5Z1JTXUP
 OUy9kEtTZciIb52FGVFlld3yZ6Hj06mq2fmXpj1B5ESILSMe2Jp2PTu686FBlOMnItC84ReQtVl
 l0PKc4NYH+UICDI9LLTpk3ui0NZ9L4+4TszjpuFOpvNeMFuthdY7d+CGS8obwEfzMVzN2bPrFLc
 1vHDBwt16ygPS/8RdkkFXE/iesNnq0dmKEOKZ+ZEczZBh95ix1xX6gAxksQZIrVVGfcZ/pgDOvS
 f0KEnK9/d/S0EB7ljNZjdusskYzBntRpH6vE/gwqdDrCMUGE7zWwf3UrIC5iP9CmY11JdlwKTpN
 phxkhb38XXqRzTbA6NA==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50f8f9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fLzRGSmVK1lo7flavS8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: xUP8igQg02p9QhzvDbL42GLZ5k01DJyq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX7i4i0yzDTGmF
 TXZo+uvnaPAp5q6bIXHlFJTFiI69KP4NrtqqX2NmmnNq+Y5YWZBdBmK5Xoyvueu6wFgfc7N/MPr
 rmViRmzmdH2Z21GTscazcR/ZlocaNYk=
X-Proofpoint-ORIG-GUID: xUP8igQg02p9QhzvDbL42GLZ5k01DJyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100137

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
index 869228a65cb365567ddac7db6ad7b8743e0dbca9..1f2315858cc3e04c7ff197324f1862c32a2ffa31 100644
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
+	unsigned int count;
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
+		for (unsigned int i = 0; i < count; i++) {
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
+	 * When the software node is the device's secondary firmware node,
+	 * the core only records the owning device on the primary fwnode
+	 * (see device_add()). fw_devlink resolves a supplier device through
+	 * fwnode->dev, so without this a consumer referencing the software
+	 * node could never find the supplier device and would defer forever.
+	 * Make fwnode.dev point to its owner in that case.
+	 */
+	if (!device_match_fwnode(dev, &swnode->fwnode) && !swnode->fwnode.dev)
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
+	if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.dev == dev)
+		swnode->fwnode.dev = NULL;
+
 	swnode_put(swnode);
 
 	if (swnode->managed) {

-- 
2.47.3

