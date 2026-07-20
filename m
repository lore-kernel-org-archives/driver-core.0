Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7CC2FD68B;
	Mon, 20 Jul 2026 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544255; cv=fail; b=ZDSCs61UFnT+yaf6mP+S+zU2jpiEMUgYgIYZGEpAHRbuV3IOsh8DwsKhxsPbRLVWfBZ3dMvh/6TiGAhIOcycMoWZ0XREj3PGew/afQFARpFral0/oX3v7jhftTC9ES5vQomGIkO05cQg+c1mJIhSfeXXo4gEzyDGORvs2bJkLCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544255; c=relaxed/simple;
	bh=Wxq6VTEQBFQtTowwkhJyktgO56s0QrxvsAoVHO1A1K4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XjxPLa91/LI9+0zMzRmRsHTdI+oGt2y5GSJz1RvsWg89Q1uW3GaYgXjc7AwCagCT2hEfoV7bxtu/2voGZyFxPNdaUaDwOxE2U6JL6eWDG5ifhVDjGd16v9SxUh5A1QiJECLfTQAg+xRQVpDEvHdi8dibz62hT3g4W1lRjVk6n30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eYd3M0a7; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eYd3M0a7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEOJkkks16ZU9+L5RDQurax0dFSzop3HsaOjRsw1gzTcqjiko2l3rKKYl/5+uSmeDpXgWWgfHVp30SGLyaz/LHImVjU3EnojA33wrl7oc8dWNfDjIVB2c8V7yLujBS4RYc/UCY5sPjUMiSpfEG3D/ZDxmPR89m2F/PthlZIFqgRA6wXP+F+2UvKBt413qX5ZNHH4UnFWqKb87jCjQ/GStXmNGMLYd4KCsPTs1BSZgidkQ3ti0J4bxwzfUJXChhd9Fy03hBhUhpM01xj6i7+RTgOiA5mxPNAE8K00EPdt4WsT0TWljMUlb2C/j1O2MvhC7kYFEycZ6wq5DMKV3TlVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHaX+v+4PWJEl5iG+8C/lsO+Az7q8AgYNl6gfwIyIkc=;
 b=WvK0Oa+6d17bIGefnXHUMb43xkeHxDC6GsvBAa7ArgZ2ARkU9NxTa035xBDonvK+8AlX2MgWl9U7tjAz/nm1/ALHpU21YuHHUkWrYQvajHF4boso9woAW51tzrsRlipX7aiztAUZ4oSafct0tTZvq8aVMNhsAGgQQpDilB32qRMbkuNSxe6SXyXndf4/ITobe0LQ/YdoTqMPNeWnlPRkhhWMVwUdNCQ5/B7oMFA6rPFNjRtCAPcp9wu7kq4o1Dw9XmxRfqnu1nwOmSk7n+8BjIevpkh5tjcOJn9+CLvPJ+RnFj/pCFBfX2X5jrYZ71TCHzFNJRhBldshsj0fvHdDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHaX+v+4PWJEl5iG+8C/lsO+Az7q8AgYNl6gfwIyIkc=;
 b=eYd3M0a7AflbklbozIh1bz426N6dhYl349tJKnL/Cdsrke1GnxWsz/M89tg2e6m2qDT8C0IzVFni/w1wp536eG+CGw0iSXgXA5W5R42Pf+uvVFA/lL9luwBJEki/G1O8fCLphdoXXf82ADvcoRLTbDgEO43QQE2M3EkY4X4a0L81x9dCrCDnm99kwvC/qr+8VgxZG9aXRBLeTihNj8vU+KRlgnjobaphtvd3b8mEPeaRvYCYlG1neamzHpiJyyWSF1q03nrdeeLnikksfsR13gR8BFUXf4JS8MnDRA82BR72g9478uyJvqL8Y1/+EYT7vakTdJhCbtuetE3GLZPpqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA1PR04MB12222.eurprd04.prod.outlook.com (2603:10a6:102:562::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 20 Jul
 2026 10:44:02 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 10:44:02 +0000
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
Subject: [PATCH v5 2/2] device property: add test cases for fwnode_for_each_child_node()
Date: Mon, 20 Jul 2026 18:47:30 +0800
Message-Id: <20260720104730.1285552-2-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720104730.1285552-1-xu.yang_2@oss.nxp.com>
References: <20260720104730.1285552-1-xu.yang_2@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0267.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PA1PR04MB12222:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6ac23b-c8f6-43bc-4d2e-08dee64bcff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|7416014|10067099003|6133799003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OaZPaJghMPtMTJhAMf5xV5smUIpBxmOHGzbEj1RYIlQnpyiaQ0ZIr5YFykbkJn9eyJaFwHfbscQr+QPmjPd3eToEHHsNl0vWZwlOTU9O36C3xVbOcbPRVbFjaE3Jf/mitTOrpHr9z1Yt40N/WvEjskoFK2+8BQe+dATbGkzNmZiuxPIbzyCWdOEJPhFs4Hvs9b1ihhYk8yOexLU3KyYgtA4qd+4d9gvry5xcY33iuPD6i2Ua/XmkcULkm9eKdnDn4GZls8WFiPxOj50hAk3ZD/eB9ilZiJb2Kwj7m+kbJAj0Aq3ohGS0zv06RdvbwAFvwds4LT/qH4z8wBxbWNnyidtZZb/cirpIJeZAkXXP7T/cts8m6qUMSh42woTPhNr+UE//CfMh4L/7nYacxy7UAmmg9s+x+5tpcYJn+WgEWebdur79EybnC2LgRIIZQwHJOoKC/2cZnV/vKcc+KTgbpcTiBfsv0GA2cOtJABkMAsLylnXny31f3BoCmR/wXHZQsmzEHBAPcoBafqNmBZIc8PxjGOilRNFMm8uN6UgJ34shCsFpVpPxmh2AQwxLEDGyqmTXUodVcObAxOulVEj63ozDGIJR7YPI/N39fDaH1nXuAILQNx6tEPBTrcC8VDNHsvm2nOvD00n3Q9/bDqDmBKfO3JBQFpmW7nFYuTFW7z8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(7416014)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+3PRyFJAyGpmu3D3RNfZqm6U2J4eZvg2HqqP+eAiPmsHZJkpEIgFtjMd7Csc?=
 =?us-ascii?Q?jNBvXBAYlA3NxObDdueko1qGH/tvY4xYi2JykoTFTsOxA2GiPWayc2NKU1ii?=
 =?us-ascii?Q?uBMPmJA0QIi30MNYKU0lVC2r5/qzcAh3HgDuCRnYPyq9nB9mbqws8ukYJUZh?=
 =?us-ascii?Q?CwgB8cSQ6n5bUiEVW+uMbmCYSvlMZOn1GFo1tzyDsJplO4DitTe2K/xnVm6G?=
 =?us-ascii?Q?jJLVcPGNSru99D4KvwKgC+NIJIUDaHjTl7N3hwHlhlfrCMsdlEeU1nVtcC2g?=
 =?us-ascii?Q?ydFkIIZn5GT+XeqJbwFc+8KcMq2Kznt8tC5iSiSqMdSeBnvYGmRV4kmsVzIT?=
 =?us-ascii?Q?7itrMFmdXvIpRr8B7QlWq8kQG3pK7DyVejNOAw3fNct1eJBoBxhE2udrcITW?=
 =?us-ascii?Q?9v7hZ7suep1KMwrS+qh5UqePHeH1HBa+fJmAc32s9MSe4OwO44RYZuJTMEHh?=
 =?us-ascii?Q?rnsRmiQg/Xs4t4TDswyDcZ9FWNIpJ7+/+HSNf48eOzBrfHtX4ypkdVnL8vfy?=
 =?us-ascii?Q?Gvzw9lEdlMnHvKnVNPc0eG7eLDRs/p+Oibh5FZoR3+eAhM5XMnvxxdH2PiyP?=
 =?us-ascii?Q?kAqbdGh6vNg+vb3jk4nZIRh4a/25K2PJZXgHxLfE9OPkZMCztV/dPanuvcxI?=
 =?us-ascii?Q?8w3LoNaqVHaKOxpJh6NFdg/6wvEGgoFgqsVfsGgxW4puD9BOR/if1/biuuKp?=
 =?us-ascii?Q?VW/5XCL6f8nkh6LaAm8tHCYPqTyPdmirSe0nGSUr+r1W4dZ14SFcu6WJ5LlP?=
 =?us-ascii?Q?a+067jfN2Tqn2iKKRLh3jOgzIoebo2WRoERrzgpOKXFck5Ab8uRS4MlGnOrr?=
 =?us-ascii?Q?mY7FLzBdmmqp9++UdslGzHGGD54vOKlO/NyegOzz6uCPJFdPDbZLn7v4guCC?=
 =?us-ascii?Q?XvCQaOG1K0oJPiZos8dnU91slYCHqHubm1T8QeASfhhoNEzIKYGMU7vbRbFW?=
 =?us-ascii?Q?VTFi8JgKfsBfD7QIopoWCZoXYXUIqkmmTIcy0/aikz1ioqVBt5CMT5DSLYqC?=
 =?us-ascii?Q?ZJ9Kcr+HuNQtKc0n+Q0wdie5zLOvc8oNQt+ThvZqFE27viBods2+lgIkFsej?=
 =?us-ascii?Q?9ImpkUSVhT/WMlLkm2CheP8EE2hzgWP9M72t9wEDLmA6IteJWQYE+Mu1+p76?=
 =?us-ascii?Q?tyOWg+jaxGkUBG3EkQGmUxFXlOgLabMIwiWqiwYh/5WtvfNn7GyAWGig/LIP?=
 =?us-ascii?Q?22bLMcHdBwsgu6xRtGv+T5eAVM9fDqrJ50oewPB9r0U6vpeANE3aSTtw/REB?=
 =?us-ascii?Q?f9qS/ld9QvV2x5yH19wkwjVGu6vUxtsHRikFEFVlpeP4gTLndZhM0TwhCxIQ?=
 =?us-ascii?Q?dZ0dd16zM0kF0maFRiwMUlVVf0h6cL0D2TW9xYiqTx9X2xFWm8cfTWq6SVW0?=
 =?us-ascii?Q?ELHa3z3UcCHeezpsE7dZeB7yYvmQTzLjLpBNlk6qA6hVGjYkXGAe9F7Z673n?=
 =?us-ascii?Q?MyzgokWrOfTkKoZ2809ViM04f2gzJ2cRcfbizZa/8/lA4yVAPZvA1CjPpUqg?=
 =?us-ascii?Q?RssX18wj5tcNVpLdKIj8lei1ELMlgdJWpFebpiG72Zv6Ui2/UBBNwb6a2oaH?=
 =?us-ascii?Q?53vnCZcKmwF0vACEnSv1Gixk08FccFVsNyw+plNVQMfcgQ23ifBbdZk0JGO5?=
 =?us-ascii?Q?7QpaI8N5OqjQOlvMloK93oDVIzX+0LRwD64z6CJliN7VJaVNg5mHlcDVFhZk?=
 =?us-ascii?Q?qb1LG5ADMIvPXO3pZpLrGXcI89B9BPpbwTYNcfVyorPF4odMpk/klG1SL1Rh?=
 =?us-ascii?Q?cYDkJXuCa2cQ3fDzP4uWh1BYEk6lgSp7N5uxvvjDJ2k0U2zyUcw0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6ac23b-c8f6-43bc-4d2e-08dee64bcff1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 10:44:02.1409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T13akXMV8GnTjyxbJJmxltiCR8FGCoVa13oE+iMlhqh7Wt1HKp5ZMJuzFHBHWIx8gGUT8A5A0Lf7FFOAgd0bn4SEUz0p/7Hc0m8hFMxB8UfQZcsmA6feE5A3Lc3WO1w4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12222

From: Xu Yang <xu.yang_2@nxp.com>

Add test cases for fwnode_for_each_child_node() API.

Test command:
$ ./tools/testing/kunit/kunit.py run property-entry

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - add patch#1 to fix "of_node_ktype undefined error"
---
 drivers/base/test/Kconfig               |   1 +
 drivers/base/test/property-entry-test.c | 136 ++++++++++++++++++++++++
 2 files changed, 137 insertions(+)

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
index a8657eb06f94..a3d1caf28cc7 100644
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
 
-- 
2.34.1

