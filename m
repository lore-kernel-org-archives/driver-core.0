Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC113DBD48;
	Mon, 20 Jul 2026 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544244; cv=fail; b=h91tRX7ur3D/uYHLZKUBicGzyPT6YYFe6Ecm38vlhokp08neFKNoXcRUqdL+uwXudhYNqH5Fi+RidjQ8Prr3Eg9uLkXC/o7BVol66sQ7fNa9BCPKQaGe4U1LvKhjq2NWkVS2BfgU98qas+Uy6tA6DGigMZXmt7cpumoit+qTOik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544244; c=relaxed/simple;
	bh=68ug9sBK2HdEUMRsz26LfpNPShWeDNwKjJGFl5U4jQc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=oDeWSeGki9uDRe/n2zKdlnul9VN3zVKiU3p+vtwyIP8+MK82lhJF2g/ta3Sapi9+gptta6QfDqHKR3nxfhd/4zSLLtxRvA1fSvAhdb8XK07XdVvogxpxpVZVbJYhSYt3qLSOP+axjhLTeNa9WtOW9Ye+TuDcmZvxa44jqGPL82o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PIaes7GV; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PIaes7GV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1l3m5CKKKYd0kttArVaYI7GwIrWHqiUMBPO1Lasiu5Q1dzF4ET1BThoyPxQ+W5IyxvcjvD1GmNdLOPr601mS45O2TtrzljQTDATzVE20bkg40ZylEVP7pmrDDxfDeueezkaNUdcpr7Se2A2ceYfdA2MQg4FWrZo/oWk2ZEPA6QUzLRB0xVEiywDFtwGZMeNgqWjwk+HUKgWNDELx4Q8lsBShJ57DaQRBPgkkjov7FIpfv7yrLDmnxW3kRgdDD0WjDxd16gYY3+HAtYlj7KXhfQL7Jzqbxbdmd1SKqiOG6J2LF5sSBXyMdtJkjX4InB1VJfQKnpHcd3YnlOgrvwH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbnlkLLoT+NoGqf3cj3491f5Mc2JxN4Oe7d3jCbdtoY=;
 b=cWP60Q/cwhbiYf5G30vNRJzDcK44kt3PZ+q+OAthFGBkz/NwjNESwLLI0DKP1DZLwCKJ4eKZ99NxjdBU9kyatSH579h/KdE2Z68CuyCO5Y/WLD2NRCMnYupt3X6zT7gZHsI44kdeHdNMfTB2WwFQjSi6TfS89ah68lMO2yXn5LnjHpyzZHVtf7lL1QeB4Umdh3I6FlDvjceh9pc0hOTqYjmp7ZJh/RfqAh+5frAPqmO4494Loqr31wV6cwbWdjwjtwsW6Ai07aFNYKAU81J9uTTPvVf/nvQ4r1l6uJ5NoJM2j8tP4s85pRIBc67W45vF8iPgeKa67Br+QD2iahk1Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbnlkLLoT+NoGqf3cj3491f5Mc2JxN4Oe7d3jCbdtoY=;
 b=PIaes7GV4K2YWmRUOr4BgfkROdweej4LIOBJ58HRzT2EIl8aEhKTJ3hzxmuPmAqkxPGGxBlIYCWn0BV2ZrxMJoAsXPa/mb5Ux41wzitZoC4y+JJdnTQkVPuWeSVwjTyw2RfTr1QtSPX7B30LTZqNuP6Ihxwl7TGeFc+XLp/aFUUbWTjRTHNvL6kRsqvZNxcC5Rt3oDrb2mm2mX7RbF5b10CQVRyIHyWXWXNyStSaOykxeqDtH9weVSJTmFchv2tg4Qr1tpHLxTHBvvCdhSpFPPGIPzISmoDQ0QVwTvSln7akuQ7WgmaAW6manJIhE/fwVcx6xcTgw/mz75+XxCb2aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA1PR04MB12222.eurprd04.prod.outlook.com (2603:10a6:102:562::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 20 Jul
 2026 10:43:53 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 10:43:53 +0000
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
Subject: [PATCH v5 1/2] of: kobj: export of_node_ktype for use by modules
Date: Mon, 20 Jul 2026 18:47:29 +0800
Message-Id: <20260720104730.1285552-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 99f5114c-35b0-48b4-afc9-08dee64bcac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|7416014|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	yIbpWH3wtF/gSXCYdyIKRz9AnLCMoKHDT/Ir8Snu6G4rYsl1rt4fs/gGOLzwgetoYhwjZJil/T+PxfIM6a6P8FPwZCm0FdhFDpg7RCwMqFMbuVTdMsCnJW1sWH3WtH3WdFwHOaeiTwZXUzfUZgxYYbg84W9hl4hhhhZYCEzBIJ9ZoNZZZTOqMLXQ8Im1wTgrUQFAT3w9zl/Z4EBGDiNKQGM4+hb8wGioS1RQ9ysf6xHaW2ZXRefNX/1RzR1Qr6lx/83uWFeonhOqhRAln1tW/rljA6n4+BGGVG1Vn3jyePusqfBXzUSwIBnYoqe7Y/LQhmUbEzDHekanG/O5E2p++a4YL2I9t2vjsR2m0mWQkvjTy0u5KQ1O/3QB7WGWHAupgLMEi9tPpMLn77mqslTeCILfvkP7j58BqGdJT5c7zBTaM056L76W/HcImo7i0tMpbKg6P+NAU/56DD2u6KYMmZ+nHnqRbRAoWz0dssw5XvnBw33YF4lOXeGYE8JvfK2e6QMslv/1KMj64z8981Dwot+vJXm0geoFKBcMvNZmUWiQlvvhfcXQhsJGp/2XF9Kc9RBpm5CRWtJbnQvdVhdbRyvwi49JlnVf7EM3OeEf1QnDytvh1PZ/iiRlgkGqnKTIt6gAOhITSXwTdUIEX8SEYUUQO4Z6CPpWLEUlkg5GFaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(7416014)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ewi++hibm3Z4w72uVxWwGgTLRY6eZ+0a6OBPkDP4A+fJvPgEg488hy4GIje?=
 =?us-ascii?Q?+u7A/wnKWQgwtDPouIAq3cO2Us2ZSQ9n3JuWkfVEoLE2pWI7Fn67cgU1XRJq?=
 =?us-ascii?Q?J2P6J3lGLwaAtfomKEzuCosRdRcMp14E1hmS9KdWagGUDbEwFKUbqYIR7DVk?=
 =?us-ascii?Q?Tzal/ptWBgRwGHeqe36RWTCFBfRpwDgErvsckoGCuFQixX16bHRhqAXUkpEz?=
 =?us-ascii?Q?BZk1raLSD8L7bmty7BTCMSAOjtENcnGE/cy3a+akij5ldcCYvQy/DAXRfRvk?=
 =?us-ascii?Q?EDbE3NIWxCTmfSYIrlKP1QgXC482o2P7xZjvy2htRjnZDGuNJYMnq2lQq1U+?=
 =?us-ascii?Q?PnUUKZ27s1w1GBnb0zUXopyqILr6GrJf1/MFjBiMBBqHHCP1+y+4ylF4Oea5?=
 =?us-ascii?Q?2Hy6jQZ4gU/WqDiVIvXFnnJHOExaUWZNXiXv2zqCigNsHgkPrZbupP5WJL/q?=
 =?us-ascii?Q?5GMm5SymGoQAsUwE1wAb7otiAzUAuGBXS/mJOuboAUXA9EqpNXBKCA+7o8RY?=
 =?us-ascii?Q?PIHuQFjxuHzIudwgSox8m/+aKnBOxGPBaETfpVKMqq1qXyk6C43/KUzXMglt?=
 =?us-ascii?Q?kKHLxgAkvW5Tkpaon3npSP2MS9TjOwTgS7GJ89YJXFUKYWQREfNjLi6HD2Ju?=
 =?us-ascii?Q?wATrrmU5fJ0+ubujItlWSU2F/hOeWdm9jpMSOw0uPlbfBISWAKGBozsCN4La?=
 =?us-ascii?Q?Q4LyuECT/nWv5Mx6/R0XbBonJxT3k8nxa7ctxlvwCsRGcIBz0KTrztMJLD6I?=
 =?us-ascii?Q?KTw1FDe/we6aD/dJpABlBNaYmm3D4pDYHJUlBX9F5ZVbbQcjxHDfhvEQ4Nwe?=
 =?us-ascii?Q?e23toBUoxf077z/O9TSlujVEbQ15ilSWldU0JKx5nwTQSKKwZsHK7OjluJU4?=
 =?us-ascii?Q?u2/7klcv59ic53sWhjawBis+HklyEuGs7YkV9ye+KgY2MF/cpYn9DDRrBAz+?=
 =?us-ascii?Q?XGMlUBtwXD1I629PtDWwfVScmKh8FaymAE8/6DyQJIKqqMQFWnvnmqAqpuHz?=
 =?us-ascii?Q?Ns3GMNcRS3PrjlkgPh8t9XEl+fHdLAaR1z5BTBnFf1ckVfUo9nKShVIhG6fz?=
 =?us-ascii?Q?IrbbSc/FiAVgoFXXO2MVFx0AL4ZmkvQa342dwy8kzwk32Y8EXMFVjI2b3dMc?=
 =?us-ascii?Q?6OCchqxgvGJDwHaI0DsbZaey9+fVL3K1R3gLc/QDzK48S/DsFWo3uNJ7M8kZ?=
 =?us-ascii?Q?0HORFRxzNnHLpvRYRNvcDezOCEYK7IaUmIIbw46hMJ7NkjvdmXjtVmM1rJ6/?=
 =?us-ascii?Q?xQnlaiUT2JVFGJk8VulZsgbTL4r+6AjtX/K5VO+3Ly5zEbS2qRR9jxBqIKFp?=
 =?us-ascii?Q?dblCl5lDXvP8rHYNbRvJnKFvesMRwX2MZg1TVKxU3sjMU723s6B0wrisP8st?=
 =?us-ascii?Q?XlggTxzLD8anqhjhPNKRekZUXO+7W8rsM9dXDrn+z69TjVtF7JA2LSbj6CxF?=
 =?us-ascii?Q?sbxBFBbj1i624ufPadmsfcf8pvwbYDHr9VwJ0GbFzWOYvJX762B90GBX1mtT?=
 =?us-ascii?Q?HBKQfSyuKzI4es4rJoWmyvd8LM4gqUDNjBFl9OcBnU9KmCPlA0vvUo+WRohl?=
 =?us-ascii?Q?oQciwQal1qGeJc2MTUSv7axX5hRuhf2TylY0Xvn4KcqWdeSs7EbGF7foiKOU?=
 =?us-ascii?Q?uzDvt49D0x7WRuu7MG0TaYKDhFepiZjzjHlvtY+/d02G7gxXENBU9S/PbiFF?=
 =?us-ascii?Q?GNxdZxeSAWtuihISfr5RHzbGyJ8z3g4odgzSWQZ8j8/Zc1iuXo/q5N9VAnof?=
 =?us-ascii?Q?3zfxo1Ytsem+RS8vDcyH0ajoZnqMNMlcGQSdsqMcJCmET5mUapyF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f5114c-35b0-48b4-afc9-08dee64bcac3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 10:43:53.6597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVYA5a14GwsH9IrTUibaBT0CPScIX6Rtdpiba7G+5SJ9C5yWbxwp75U/6r3+wSV6aJQ9lzPIi5JQcLNzPuDyjEVvev0GqHrih3QAQkH/7gWyLQ+jHramyWG7Icy1fX/P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12222

From: Xu Yang <xu.yang_2@nxp.com>

of_node_init() is a static inline that references of_node_ktype when
CONFIG_OF_KOBJ=y. Any module that calls of_node_init() will therefore
have an unresolved reference to of_node_ktype at load time, because
the symbol is defined in drivers/of/kobj.c but was never exported.

This causes a modpost build error when CONFIG_OF_KOBJ=y and
CONFIG_DRIVER_PE_KUNIT_TEST=m:

  ERROR: modpost: "of_node_ktype"
  [drivers/base/test/property-entry-test.ko] undefined!

Add EXPORT_SYMBOL_GPL(of_node_ktype) so that GPL-licensed modules
such as the KUnit property-entry test can call of_node_init() without
hitting this linker error.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607181651.RnUuV8n6-lkp@intel.com/
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - new one
---
 drivers/of/kobj.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index 1bb61a2c3399..eacc53324d62 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -27,6 +27,7 @@ static void of_node_release(struct kobject *kobj)
 const struct kobj_type of_node_ktype = {
 	.release = of_node_release,
 };
+EXPORT_SYMBOL_GPL(of_node_ktype);
 
 static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
 				const struct bin_attribute *bin_attr, char *buf,
-- 
2.34.1

