Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F31E298CC4;
	Tue, 21 Jul 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631085; cv=fail; b=lD6BlD9iXYcEhiI1P7enIyUMHAM8gbOtFiiI7/VR7EHIhxjfM6/0Ta3mqMR+IlMjoQMoAUwhzsNw0RTJmldUsgq9Y9PKe/zw/j6LQWhvxmM/7oeuMNDcb1kUNP+o9Rpqn0UaO0hnWLobT8eNbHSLlPXdY4MQ72kZTMcpB9JLJgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631085; c=relaxed/simple;
	bh=J8rCzIeNxffngXK/9QRZTABo1B/JC7Kw17bBxQYLW8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qL6/wRDnz5b+KaY1OfzFd8cmjBveT+c3aeHRFJ65rnQ6rH5ge5g6fwMwKTnKPZ/trqVxkfBMdYkn9ND+WHMYSMP7pZqhWuszU4b0yzX63Wu5aGlRFM7jOGIjtjX3hafCn3EuvuaBuDv1h11AHqq17Ik4w5aVlD9fkmOOQxCUi3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LXWpMxkq; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LXWpMxkq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pF75dUmAnll59u3ceb/ezk/OlbYqwUam065ddWhRZlaeMot6ds/j7NHGHVA81hSgR1QOB/7ux0HNX0F7/KnoSoJG8hgp3/Zx6hzrEYGJx37djfqr6t2PbClQPj1ufKxgDkFxZvQM35A952wATJIjGu0Ksu2RW50iR9HA6vZ764rb3V/+ZI+U+30G6Z+RHKUC6bgCD5Sk5mLTMyfayMnfznppMBejiOWZ56Sv3u7Y3wDR8NWkLNrounx0QhkF54g5E+W/IhICaCGIpgnpUFAKLWy/IeR2phP+GYSUBYGMyUUogBO7EcB5TSwyPAwpIa6l5HJimslyEmGdheRpekcs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8my5e5utQcVimemFNC3AGNHQx9xNq9RLLew8RBx6uY=;
 b=IccbYg1qD4G2eESa2UjJ01hQDCKJktF4TuDeLbZsnncpHGb0m2/aWo7XboWaVRDcZ9oG4pk/e0QtIzbFMEBDZXtCNCeFPr7cdhXi39yK6afgNowgbsF8ffL47RheCJulmsIbkNFhx+OlhGXYzZFCu+9OPXUZHdNjH2iAPCXYkhFyN/QDGt+32LFf2gSFHby/rVLE050AbHm/9wKPxIBG+IZTYm9PJUCM8ziOTMGLzIV5biz22ECWcPmiLv/J3kQgIrp5CGyaVhtbUviMztqyVlu5pJycf7IrdzjFz1BzvDua9C9gE/++cAFfa70T2JWn/ITdVLh6oR/OFHnu06nExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8my5e5utQcVimemFNC3AGNHQx9xNq9RLLew8RBx6uY=;
 b=LXWpMxkqJtm8ct2GsuNx7tA+pTmvK3bKkGZLEgwPK2W7RRlwUdnmqk7WeSBinslKpSMiGxLhIw9AUR15+gMUJNaKnnp6WJEqiwxMHndJQp/oNT24W/d2frusMCWg+hsAnGGUUdALHoZDNFKXYxQuQQWSULPf9aCc97rxrSBDsZh4E80tCwQ34mLKebJ9NvIcvfn6Z0e+rkvSMPNw0b0NmOk0ZwusGnKO2oE1lPz9fatdpPXigWBECbDz1MdhwgiVctEY2PtqNdm/Hw2g6njZ+qD/Mj9kEJaYayz1xfQ9YQ9+E3t+nmywRmlIKLvhpI+php9AD9OXAbWzaQfV0bZsrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GVXPR04MB12105.eurprd04.prod.outlook.com (2603:10a6:150:335::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:51:19 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:51:19 +0000
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
Subject: [PATCH v6 1/2] of: kobj: export of_node_ktype for use by modules
Date: Tue, 21 Jul 2026 18:54:47 +0800
Message-Id: <20260721105448.2109894-2-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GVXPR04MB12105:EE_
X-MS-Office365-Filtering-Correlation-Id: e62647f8-2dc5-432b-a16d-08dee715fed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|7416014|376014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KEbkypeuwJ68ku9R1AJaqzFA7usbXBu9FHDsIUAuhOrhymL/VuFMtsutQK6dsWBHozoZRyg0JdCf2LDIaDSs0Z8tsfu9AC2NrNu8FT0scVRAQcpB5wUemxr31dHEIL49BhSoCVJWHyfUAhe62DGOz22STQiWUIeeUDj1++CSU0XteYbXM5zTPDaAEX7jorDDPYZXE1FB8nfGhl+cn/xMZPhsMY5QR8kfvQpt1NPYCtp7Vzo5D3LKdPYRZwx4ckGPLXbGWew/+i9Xbwqn6Aq2nEGstmudw4wsTCN7zt7x7IDT7Me8BIq5HMzlaxoyQ01PKoJhfbuQ5RCPmrlT7DlcbfjNPJS/GHFmaV00rhlm692HFzURFLYBr4lcLJppTmGf+/v1Nkn/z+HtUejHC7GHaGMXLJJeoT1dKnyZs3mO6UjOLV/adyv0kJ2sHJUwHzoHg4q6ESaKJ+MHDKrXqZx2PZhJ+w0TIengY/H1yba8zM6key+xrqj3Iy2bxdrb4xJEb8k48I7XtjSbZzZavo/17ZkzdmjMy+YAm4yDDcalDKhn2JgycZlYhNiTWlr8KhhXJJJ2hSfJebK7gIIRufCCPTm7Y9neJ9PZUQScrN+Ae6HLchbCFTvSaZEqCUrSDVi/9Cjd47OfGoX03nmax6v8I1sHgJjLq4rdMHyZ30T4hbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(7416014)(376014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g105eQw3GWi5gZkotHaS5NWITYndrv8CFkHCEvj16Lnt0KDPhePOIRV8/8ow?=
 =?us-ascii?Q?zoy7HdPWnRB5rrewdRwLCLdwX1kLEJ+BYQT53D019UGKywlHX+U9USJ2RY3n?=
 =?us-ascii?Q?gosC6eQzLaQf17W46DxkzUULqd+QPuM1tlP5suONwyzqzDo3cv6vTWW64faP?=
 =?us-ascii?Q?pEfYECKtAmlyzDWQQR6QNE6pP3OZdvFehuHrliuq0YTESEjYLe0xbxtDLtUb?=
 =?us-ascii?Q?djbN/FcOTZ3Gv+6bDma64+x4UPqxKt7YO5wlxjxedlIy2T4SlN1L3jSjsOUV?=
 =?us-ascii?Q?yCi3MRxE0r/Yz5ZwtdV79PdQjlp7N/IB2B5a+M3kD/wSBRwDp5ZsTFEu6lHn?=
 =?us-ascii?Q?RkvrsLAjUwGd22lk5mL3v7ZuQjctHyszAfYQ78egee5KIdX63oFwcsyyeW/D?=
 =?us-ascii?Q?qgUf1drPdmMPsvvt9FnwB4hIG7bmLJBnlcunEEVFc7W7GYkZr8V1qFgZpLpW?=
 =?us-ascii?Q?zzsRcAr3keRlHl84/I/6nYnIcLOiJyTrckPigOS//xEUPSNO4F69QGpX/2q6?=
 =?us-ascii?Q?hn4eYFIs+6QONkucyktBmT4AE9TNTAUtIfhBFV1A4OnkE7K/oZKO4yt8ypaV?=
 =?us-ascii?Q?+/LDqchrSayzSExtfqTUCZaf8IJUwsYRr9zJs9jWQuaXTDuyqa3dEf+DDUWw?=
 =?us-ascii?Q?U+F0NdNfCBB4cwr2SdWsArQvQQEhC1bzSD3hPaPIuoy4chxmFW5Jx0+2Bf0Q?=
 =?us-ascii?Q?dRqix3Pe2mmt/frXCR3H2DWAt5lMxm5Pe/sKRYsODEBjyyIqpzKjR1DFCwHq?=
 =?us-ascii?Q?sBrf9GoIo6uBl87YreRnaGg9GDBZoKLzMsQWINxy3tsVIErXyhq9QhiwHDHE?=
 =?us-ascii?Q?78KjJGUr/gaCDbK7A/4eyy85fulSEfuu3ddMjaaMcaax0K/oh2uYM11elmp+?=
 =?us-ascii?Q?FpzJYthHvmROOSrr9yPe1Ibh8WGOniZl4ZMfMb1qlyZ4GJqM6I3FaCasPM15?=
 =?us-ascii?Q?Qv1U6+5Qo092Gyr8EFVXwf1FjMJTvSUP8VexSy593uOPF9adtHqAVxVEZlm5?=
 =?us-ascii?Q?SDRbAGnWUyLcIwGqA//9RZSjXbPjt4pCcmkKv+WxRCzn3sGBIxIJvCN44HV5?=
 =?us-ascii?Q?CAPYvbP2QCZhPbrE5xevH7R6MMikdbXA/Cbva0UhuYA+XUFh2SMNQ4UjJNYq?=
 =?us-ascii?Q?3l0f1gmAoaNy+3BPFGkfT9OpICfYDhiEWy5H1yC6RnhoyBbvqaDrkcI2xW6l?=
 =?us-ascii?Q?4KLvq8VBcZWqq4IOPdG6JmhQIRmNtGkj2jegxogc4hqj5muc5B2W4BIUJWU7?=
 =?us-ascii?Q?zfyBhWm6iq+mzbPxSS0d7se+mpLhreH4lUZzTiB3ogns+CV+9YM0n/z0CU6h?=
 =?us-ascii?Q?fVNuokSqYARZ2Tw0mqCHRHtK1qRJU0TxoJto03928C8pmJXo/RfLQ5xX7kdd?=
 =?us-ascii?Q?BtVwyNmINwxDPArcwsOMOUB+1N37qlAy8FsN2+ToZ4KOWCVIQXr6JqvGgOgN?=
 =?us-ascii?Q?htomU3LEGtaTFmxFu9MLoRi+vYuvlha8BwzS7PzjxMA04cbmfEQ3mi6upHoE?=
 =?us-ascii?Q?AgJSLIvlUCli77ZRrn+VcLYR+9kp4fG22yDXxCpiXmTejJlWyUECOkNsxNZI?=
 =?us-ascii?Q?NK6mrt1w9y6CRTFYratVjhCN3zxuDTy/0aBQazZuFSWjduvcxq48YglnH3tc?=
 =?us-ascii?Q?J8ELLFygQlJA70K20bFjM/lDb3emmZtG4rzwdEjpRkos1E6WEZ5JJQVzKvzW?=
 =?us-ascii?Q?ElhJyyt60+k0T/AOIeqQ5qMolUl4X6/DXcRx4PDGRDLxoevEMY3d3GNeYbzH?=
 =?us-ascii?Q?Udikl3Qzy0WrsOe1T1ESjucRuHoqoda4+Ir247BHOrqSsibpRpYl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62647f8-2dc5-432b-a16d-08dee715fed0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:51:19.0964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSz6xKjrUO852qptfICRbkf3JAlJ0f6gp7TWeUihsx8lmn/PoxfAoHBYLKMQ9HoHGPGwi9IKkU/qgYY5zYYgKGKL99pXp68pAHXDW8xrvC+vPdC/pwz/bIRhbCa9nTAV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12105

From: Xu Yang <xu.yang_2@nxp.com>

of_node_init() is a static inline that references of_node_ktype when
CONFIG_OF_KOBJ=y. Any module that calls of_node_init() will therefore
have an unresolved reference to of_node_ktype at load time, because
the symbol is defined in drivers/of/kobj.c but was never exported.

This causes a modpost build error when CONFIG_OF_KOBJ=y and
CONFIG_DRIVER_PE_KUNIT_TEST=m:

  ERROR: modpost: "of_node_ktype"
  [drivers/base/test/property-entry-test.ko] undefined!

Add EXPORT_SYMBOL_IF_KUNIT(of_node_ktype) so that modules such as the
KUnit property-entry test can call of_node_init() without hitting this
linker error.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607181651.RnUuV8n6-lkp@intel.com/
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - use EXPORT_SYMBOL_IF_KUNIT as suggested by Andy Shevchenko
Changes in v5:
 - new one
---
 drivers/of/kobj.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index 1bb61a2c3399..081b8fa38603 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/of.h>
 #include <linux/slab.h>
+#include <kunit/visibility.h>
 
 #include "of_private.h"
 
@@ -27,6 +28,7 @@ static void of_node_release(struct kobject *kobj)
 const struct kobj_type of_node_ktype = {
 	.release = of_node_release,
 };
+EXPORT_SYMBOL_IF_KUNIT(of_node_ktype);
 
 static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
 				const struct bin_attribute *bin_attr, char *buf,
-- 
2.34.1

