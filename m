Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BA9337699;
	Tue, 21 Jul 2026 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631091; cv=fail; b=usOb4k6gIsQgGrkNJ1QRhE/tfVvJaeNCOE33n567S10MltQb2mefql3OFkjuj+JiptT0mmz8kTQDrrE1HU5WEaUvSxbb945IrTJeJW97UXdcixt/uflrDeSyA+AQEHefxTEy4CWMom2NH4u6aQsuWimgLm4/0jr9wf8fq4Z0Yq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631091; c=relaxed/simple;
	bh=wqULSKimgAqxPJmqZSpSS3E7Q8rD9PzIChR9sVfNI+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K16pDmuNxRPDpztiMc9gen7wCsc4HkhNJxwKqkiPmXdRLY3heTIZtCKw8gquv42qwhBK+jtQykh1xlG/RQxrUgua8LhvKKTGQP6UxzLeGcxR1xppBuAXrNNRbLgUtOAC2b4CIBQclYwC2LF8vnrIySC8EggAKdgb+4HRaGgQhmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Wnbp6Dpy; arc=fail smtp.client-ip=40.107.130.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Wnbp6Dpy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6tgxxkHUAObpgHa9+W+MUH8ljKdvrrmPnT6mbP2HXjym5Qhm2uOE7AautOGI/5F5wKXRHJVOoDKhZuQxjT+CxKjjP5FZXOj4djHOe1f1uCV858RtSj9phqzd3RbZ/mJUvQazvMhIjDOhi653Twso00gkkwM+F4ZvR/BtifmXzzcFYMif/yjQyAmShuxaD3kmdN7ABvbcc5HVOoXvmp1M0/Nbli+3iNIJFqnH2iD8B3xFqcf1TV00+Sh0fZFHpxqlb8Rc7nosqogMIuxLgb+yLQu+92jw+hasJvxiFExrs3e+nBJy8hroZU5eS7bIN+ci084QTLqXkob8eEZ5b7m+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqDVVM64cjKdZhanKSfZIraljYYkdqUobq+kXEkZ00Q=;
 b=WNocJfCDoFueRvldM31wmAhtqpx6sZ4zECp506UZgaulK8BZLkECfaBM/fqIAWaruP2iCkDd40qcj8erfiiF/bj3yy9Syw8b1jxW+Dt6O5sp7rBQdm0KPMtro3XbH27VTxX0BzokV79X0Y+U7qzUEPUoL96yQHzDrZADX01DseCFYRMjZRKm7I0wAn36dSVwSryX3BiZmE6so8YBXruRAplHSnZjdaoqsSbtqXkwJamQ1x5nniJbSGq+VU/sZG40U6ZIEt4c1QIi9VIFLqFjMWWZgBTaLjjG9fIIs6oXNUtHSGO8gv/q33eX6XLGQG3+zshuhKGx2u9mzD5fj6dlZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqDVVM64cjKdZhanKSfZIraljYYkdqUobq+kXEkZ00Q=;
 b=Wnbp6DpyH6LrWtepfWlYkSflNRYErdf1QYGJvyLSe2Du5BPNrE0FK9vNlN3xR6SDcWTghSc1RKwioJDgkj93jVpxP96FEcjgwHz5VlD8tSpEQe7JCqR2kM8pnE5l5f2Ewzlq60ECWCyactUykwJKSyqAJOArdWzwtuNAvNfjo/d80cu3wY5zdhJcS5uF32VlJGZy3ehbbmlxO+2KHbczC30nmcrV70LcOupSg3nJ2g+mhhmAD0x+Bha8dJORQkqC3rPMzDJ2Flox9ycr4P9pOiKvdFGGPGI8NXOx0P0MND36kaHlv4MvWTOvsouYe8X8GBzEzfijVQolhw6/L1aQPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GVXPR04MB12105.eurprd04.prod.outlook.com (2603:10a6:150:335::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:51:26 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:51:26 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: bartosz.golaszewski@oss.qualcomm.com,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v6 2/2] device property: add test cases for fwnode_for_each_child_node()
Date: Tue, 21 Jul 2026 18:54:48 +0800
Message-Id: <20260721105448.2109894-3-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0032.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::10) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GVXPR04MB12105:EE_
X-MS-Office365-Filtering-Correlation-Id: 417f4c7d-6f93-4e7c-3448-08dee7160331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|7416014|376014|3023799007|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ngfNn2TVZKXveNVv8jewQzyvATR9DnlEMuQ1emhlzKN5CJ++FPMEfaBvZ5xaAihD5F6NIy003Xnk0/StVEXYnAEKTZT1y7rbBSKH+KPG6JPKRBbGTmXAQMjPc7wdcQHDFzfKJsf3KHfwTq/HxW9fmMnXaPjzdskIiyS4AogxI3SPf71Ia7drWBoZy97+ywljDhdoQ9XPUoGSVZe/DJ64Xe02NiEYNA+4Ge4JpDnEUWg2ohgY/4vOJm0LTvmUt9/fDfr44fqhU3600z1c3h3rjBL1Qjb7XkU2C40sudNiaSk9e8SPLPoQYnWzqABqahROvUnxXrM9Y4L60uApXenczbkMNISjlNV8i5uUCOKmqGjNUlDAPHagaNjov2ST7KfccTTbEOFVsuYHvB2+rJ7uOVObtR6HayEoNZ7EzCH+8Vu1uxyhhV2/YXA/sf/GPzv/GPymYrDBpdwXmWA3AoHy+VONPQdptmsHCkeyxNYNk82svQxYcrVprDuZQioGFZgOBQEuPZ3MpISlKSbQxdV49kVqKs5d3Q7hNo2vtZf7Nay/AvHLM3EcKCac+CXLRCo+B3yUivwL/vPmGpP1cfvAYxt8VfkjABLzgK1NQu8iIGzCv1Gh1ut6K16GiD37WUDvAeD7mK9HMOoSFj5zw7o/AZ/P7z3gqq9T7wNzpzQGqmU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(7416014)(376014)(3023799007)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aEkHJdBkRnNOUHbK4kCDnb/9qH0sbIGtOAqsLTsoerwDNmYTvuUT2TRBr0dz?=
 =?us-ascii?Q?qxA/79Lahu1faUnLC6k0ASwk/tbiltp8Sf9CRCNvTYuQAhdkMIFIaHZIpcYE?=
 =?us-ascii?Q?tCBlva8Q6T7daXJyp0DvQeg63OHST9siLKOq1PkZewd9i7btv22Wtm8x0gM6?=
 =?us-ascii?Q?+m8XtlvhCj9Q5zgRskltYWWCuCHUQDchg+PCO+HNBXIFNjcpzWrN2M0EYEqa?=
 =?us-ascii?Q?9RspHi+HwdbbuRq1wOcVFn4EaYlBguH2/f3Px0a9CwDVKI2yonNqfbRHG8jl?=
 =?us-ascii?Q?Ds2rwc/dEYPMLZVvvdsxpX058BXmslSadq3WReNZRUQXzLm4iVFT7GywyChg?=
 =?us-ascii?Q?34YhZSAD0uDHY7Ihmwj0tCvNEaRFT5OyftjuTJTBj/50JCPTFANKRWIhoP5B?=
 =?us-ascii?Q?ic/krTLW6aTS0VZUcplEpcptvmG28zmncwiwIlkPGFTMY2TuPJatHYGlT/So?=
 =?us-ascii?Q?RB+bLzPs7JC7qKPfrlrMWbvuyrdEzZsv6dlcAh9Uety/hkfla2CrBtBZzAVF?=
 =?us-ascii?Q?r3SUx5kjD1OVaPsErzEldnL3SPf1jxyHJ6h+m6F959NXNmVulHkYIgX3bpWa?=
 =?us-ascii?Q?L0UPgpZE6hjnNO/f8tgs1lHfCKNVcWQcQiZ/hvHjxycfsKerbry4aNoALpIw?=
 =?us-ascii?Q?3V3c5RTFMD98djgUYW1eACfcFPA/bGL72a5l7fypC49NUx1Ur4h/RYbziXg6?=
 =?us-ascii?Q?dKT5eDtEzWAXlYnWi5Sak1VzdbcZsIhKvjOCxMRs4Q92S1Kp/CSWXC6RWCwF?=
 =?us-ascii?Q?N3wbYVq5rJigHwcAApNJmMGNQv0Ed0+22aka+Dt7zgIMqFL7A5JwKmbleCbg?=
 =?us-ascii?Q?zdm1sv+7jjIbUo/nrjqhZBG1D8B9nxBOKnDWXPfv7ux6Qyww6ExAr+J9dH6h?=
 =?us-ascii?Q?Ps+HBguD0Tx8FzZbeuAXK8o60AVT6vueh/AAINNyIrYDeqoerxz9Udhq9p/H?=
 =?us-ascii?Q?4UHoVfE2rJt1Pe7PWu/zZF5DqFukFFl9M8cuIJT6hLbMSCPCRwMKpns5foeE?=
 =?us-ascii?Q?SW+vcGq56hC+I6Y7LfXFbJUKNYK+ixbm/raSYorfqFoV2qZhJiCs7cwLO941?=
 =?us-ascii?Q?DlRLoZKhI3Xw8NSp2kwyVCwYd62EFKe/9yDrxcRajOcDvHdnwVuoyTzIdghQ?=
 =?us-ascii?Q?lYgoTnD1HxY0DypTxrqLSPAtxmnwS1HjV8qqVstSgNy/ntCEG6n0yXHLCcrK?=
 =?us-ascii?Q?ieyr1AyvCBx4jJmwpxplWZtT/+l0VX+zFqG+fWoFA6YqnF8d/LliYoK7YxSO?=
 =?us-ascii?Q?93KplyWldiawN6XcNVCyOKC6j0M+np7zCTzZPTMcf1g/QRjCOUUvLL8NmxTw?=
 =?us-ascii?Q?Gv/sG4ZXT6N4/1ZEYD2vGOyiVNRPiX77eZi7+moDbohr2OSc0dyq9sqISNO2?=
 =?us-ascii?Q?K++rc+FlrZxw3HmazoDLm4omga4o7gPq8/1X4fdErF+UzWVafENEyZnEC7cO?=
 =?us-ascii?Q?Wnpkw+GrgJ+nRjjifCsI2BpQWdfng/sEewiWMYN7g17YL3FJ8k0LM/0rnGef?=
 =?us-ascii?Q?++BykaV0NETINJ5XNTPRYVSxm4xUEChQ/VpiViAhKhWsyXWqAAUGLaWdehAO?=
 =?us-ascii?Q?7vsgOkCTN3PRH0YdA1qect0qLw2xTHekf2RBRrhEjRxh+TE2dyyL5Z6s0qJd?=
 =?us-ascii?Q?BvQHpxfBKGyf5tBlh1eosKkNuaE/5xiBJm/t7yF7OvlAxC/ECMj+Uw8+WoZ1?=
 =?us-ascii?Q?BeCm1Mc3lnzcR7yt5ibZNAb36GPXfvf+e3RLPAdiF9D7yqqTGo2kflrHw+Or?=
 =?us-ascii?Q?rs2JO+bsPw9K4vDqH8XEz5E+t4IT8yaLqR3zD/UidzK7APffhepp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 417f4c7d-6f93-4e7c-3448-08dee7160331
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:51:26.3191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vmm5RTYH9hRUSe7J2q3f1iXuAG+8enw69j6OfJcMfzUWGxyRR2DJuHS+qAU0ipYcJJJQhYfj3W97290+Lfk1IrRo6vr2OMcJBoScdjH25cr82RGGAhGpPk+hM/x+9+J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12105

From: Xu Yang <xu.yang_2@nxp.com>

Add test cases for fwnode_for_each_child_node() API.

Test command:
$ ./tools/testing/kunit/kunit.py run property-entry

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - add MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING")
 - remove Andy's tag
Changes in v5:
 - add patch#1 to fix "of_node_ktype undefined error"
---
 drivers/base/test/Kconfig               |   1 +
 drivers/base/test/property-entry-test.c | 137 ++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
index 1ecf0791241a..542ce07530a1 100644
--- a/drivers/base/test/Kconfig
+++ b/drivers/base/test/Kconfig
@@ -17,6 +17,7 @@ config DM_KUNIT_TEST
 config DRIVER_PE_KUNIT_TEST
 	tristate "KUnit Tests for property entry API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
+	select OF
 	default KUNIT_ALL_TESTS
 
 config DRIVER_SWNODE_KUNIT_TEST
diff --git a/drivers/base/test/property-entry-test.c b/drivers/base/test/property-entry-test.c
index a8657eb06f94..855e73b9b21f 100644
--- a/drivers/base/test/property-entry-test.c
+++ b/drivers/base/test/property-entry-test.c
@@ -4,6 +4,8 @@
 // Copyright 2019 Google LLC.
 
 #include <kunit/test.h>
+
+#include <linux/of.h>
 #include <linux/property.h>
 #include <linux/types.h>
 
@@ -489,6 +491,139 @@ static void pe_test_reference(struct kunit *test)
 	software_node_unregister_node_group(group);
 }
 
+static struct fwnode_handle *create_device_node(struct kunit *test,
+						const char *name,
+						const char *full_name,
+						struct device_node *parent)
+{
+	struct device_node *node;
+
+	node = kunit_kzalloc(test, sizeof(*node), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, node);
+
+	node->name = kunit_kstrdup(test, name, GFP_KERNEL);
+	node->full_name = kunit_kstrdup(test, full_name, GFP_KERNEL);
+
+	if (parent) {
+		node->sibling = parent->child;
+		/* set the node as the first child of the parent */
+		parent->child = node;
+		node->parent = parent;
+	}
+
+	of_node_init(node);
+	return of_fwnode_handle(node);
+}
+
+/* Verifies that fwnode_for_each_child_node() can output correct children */
+static void pe_test_child_iteration(struct kunit *test)
+{
+	struct fwnode_handle *of_node, *of_node1;
+	struct fwnode_handle *sw_node, *sw_node1;
+	struct fwnode_handle *child;
+	int error, i, num;
+
+	static const struct software_node node = { .name = "sw" };
+	static const struct software_node node1 = { .name = "sw-1", .parent = &node};
+	static const struct software_node node2 = { .name = "sw-2", .parent = &node};
+	static const struct software_node node3 = { .name = "sw-3", .parent = &node};
+	static const struct software_node *group[] = { &node, &node1, &node2, &node3, NULL };
+
+	static const char * const of_child_array[] = { "of-1", "of-2", "of-3" };
+	static const char * const sw_child_array[] = { "sw-1", "sw-2", "sw-3" };
+	static const char * const of_sw_child_array[] = { "of-1", "of-2", "of-3",
+							  "sw-1", "sw-2", "sw-3" };
+	static const char * const sw_of_child_array[] = { "sw-1", "sw-2", "sw-3",
+							  "of-1", "of-2", "of-3" };
+
+	/* 1. Test OF node child iteration */
+
+	of_node = create_device_node(test, "of", "of", NULL);
+	create_device_node(test, "of", "of-3", to_of_node(of_node));
+	create_device_node(test, "of", "of-2", to_of_node(of_node));
+	of_node1 = create_device_node(test, "of", "of-1", to_of_node(of_node));
+
+	i = 0;
+	num = ARRAY_SIZE(of_child_array);
+	fwnode_for_each_child_node(of_node, child) {
+		KUNIT_ASSERT_LT(test, i, num);
+		KUNIT_EXPECT_STREQ(test, of_child_array[i++], fwnode_get_name(child));
+	}
+	KUNIT_EXPECT_PTR_EQ(test, child, NULL);
+
+	/* 2. Test SW node child iteration */
+
+	error = software_node_register_node_group(group);
+	KUNIT_ASSERT_EQ(test, error, 0);
+
+	sw_node = software_node_fwnode(&node);
+
+	i = 0;
+	num = ARRAY_SIZE(sw_child_array);
+	fwnode_for_each_child_node(sw_node, child) {
+		KUNIT_ASSERT_LT(test, i, num);
+		KUNIT_EXPECT_STREQ(test, sw_child_array[i++], fwnode_get_name(child));
+	}
+	KUNIT_EXPECT_PTR_EQ(test, child, NULL);
+
+	/* 3. Test OF (primary) + SW (secondary) node child iteration */
+
+	of_node->secondary = sw_node;
+	sw_node->secondary = ERR_PTR(-ENODEV);
+
+	i = 0;
+	num = ARRAY_SIZE(of_sw_child_array);
+	fwnode_for_each_child_node(of_node, child) {
+		KUNIT_ASSERT_LT(test, i, num);
+		KUNIT_EXPECT_STREQ(test, of_sw_child_array[i++], fwnode_get_name(child));
+	}
+	KUNIT_EXPECT_PTR_EQ(test, child, NULL);
+
+	/* 4. Test SW (primary) + OF (secondary) node child iteration */
+
+	sw_node->secondary = of_node;
+	of_node->secondary = ERR_PTR(-ENODEV);
+
+	i = 0;
+	num = ARRAY_SIZE(sw_of_child_array);
+	fwnode_for_each_child_node(sw_node, child) {
+		KUNIT_ASSERT_LT(test, i, num);
+		KUNIT_EXPECT_STREQ(test, sw_of_child_array[i++], fwnode_get_name(child));
+	}
+	KUNIT_EXPECT_PTR_EQ(test, child, NULL);
+
+	/* 5. Test OF (primary) + SW (secondary, but no children) node child iteration */
+
+	sw_node1 = software_node_fwnode(&node1);
+	of_node->secondary = sw_node1;
+	sw_node->secondary = ERR_PTR(-ENODEV);
+
+	i = 0;
+	num = ARRAY_SIZE(of_child_array);
+	fwnode_for_each_child_node(of_node, child) {
+		KUNIT_ASSERT_LT(test, i, num);
+		KUNIT_EXPECT_STREQ(test, of_child_array[i++], fwnode_get_name(child));
+	}
+	KUNIT_EXPECT_PTR_EQ(test, child, NULL);
+
+	/* 6. Test SW (primary) + OF (secondary, but no children) node child iteration */
+
+	sw_node->secondary = of_node1;
+	of_node->secondary = ERR_PTR(-ENODEV);
+
+	i = 0;
+	num = ARRAY_SIZE(sw_child_array);
+	fwnode_for_each_child_node(sw_node, child) {
+		KUNIT_ASSERT_LT(test, i, num);
+		KUNIT_EXPECT_STREQ(test, sw_child_array[i++], fwnode_get_name(child));
+	}
+	KUNIT_EXPECT_PTR_EQ(test, child, NULL);
+
+	of_node->secondary = NULL;
+	sw_node->secondary = NULL;
+	software_node_unregister_node_group(group);
+}
+
 static struct kunit_case property_entry_test_cases[] = {
 	KUNIT_CASE(pe_test_uints),
 	KUNIT_CASE(pe_test_uint_arrays),
@@ -497,6 +632,7 @@ static struct kunit_case property_entry_test_cases[] = {
 	KUNIT_CASE(pe_test_move_inline_u8),
 	KUNIT_CASE(pe_test_move_inline_str),
 	KUNIT_CASE(pe_test_reference),
+	KUNIT_CASE(pe_test_child_iteration),
 	{ }
 };
 
@@ -509,4 +645,5 @@ kunit_test_suite(property_entry_test_suite);
 
 MODULE_DESCRIPTION("Test module for the property entry API");
 MODULE_AUTHOR("Dmitry Torokhov <dtor@chromium.org>");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_LICENSE("GPL");
-- 
2.34.1

