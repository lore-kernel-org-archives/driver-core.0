Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629143BD22E
	for <driver-core@lists.linux.dev>; Thu, 24 Sep 2026 06:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231613; cv=fail; b=n9hh6H+YNvnThm7scbKdoRMj/WEY+WQX44JOzH+FABeL0Pj10CZ6kEvLR3+DvaYioKtu5c562rBYdBkXwE5AsEkwl6PCs8naEJ0DwRnY7jYTphR26iYaqn03tK2npBiePsX9IhEoci1cB+Y2z70ub/uZLWVITulySinG5QXX1sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231613; c=relaxed/simple;
	bh=HIvhKMujZLbaLy8U4TcAuH+6UUErBwURCNgSI1Bc73o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Afoq0ZkKALAyDIBK7bc5RfeiK91EscivDMEwo+Cs19jJLkxlLG5nJqsO/7LC/jqGKHgTvXnu3b72vWF7XOZyJJDilIoVYbjQWpKrAev9d50igwEMNiyrOLgolmzIiqDl1K1Rv5wywO+TkF2ib4HKaLrAbQTlFNom1V0MdItFEKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dxd9mqT1; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dxd9mqT1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzqfDMUs8FUc930WUJpc7eY+ceaUcQsx5BEtym5P/PsrDBnOfz9I9H7gRoKlHvAthaW8SPKLoAkGSI+U7DFs++qq/xDxhqXNx2jlzKVjE83KjphuAHMogL3RDse/0Ur9mNPAlE5rgxSIaKEOX+Bv3HAbOTpMZ/E0yrS8cn4G0/dJfN6p7Gfs2/aexlWjCQ7QsK401xMBK2k5l2rel2mQ1616nwWje7w6m+mm71HFpWr3SOJQw9wtLhLxXOuXniIcDvlO7hNreS7LnZyXIjEhBHOjwHmsgetaNrClJi8LhIfK0jjlLPVZvDmfvqqQzdcq1sUGkc3/3ytkSmLw/SWXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsCpB4PGry6ZyNH3NR3naI9Q2PuD8hKIPjYInHQO/E4=;
 b=UgsCAxWeut5f6sMjIs4DX1LKoOtLI4EckuHjNP/DP1ISoZT9mm/GvDVkhiyiXqEfJiaJGkcpdzrVgis1VEeHbghu/VLPPDGA8nKqOa6k1ycu3sJj+2bkVp0cuDAT10SO+h6Us09T8GC54JUXimWQQ1vO60RPqC6QBxIkoBSmFxhzfnJQMCZuivcVUGRjVpJ7powHfXdRgS5yGxM+fohwNgHSjd8zio5+1rsYZMJCw46WjvH548fdCMz1NdE+cvtqE9peJ/0/ywlqo8U1OpDmokuRHU5FECHDDwjPHI5F46bk5ubSoUnfL9raT13fs5PuvOewTx4mhKqu+V/b9FQ02A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsCpB4PGry6ZyNH3NR3naI9Q2PuD8hKIPjYInHQO/E4=;
 b=Dxd9mqT1lUblYyf7jXJyxrRe5+rgVcoIYsxSNw9F3MGBE3KH/gDhi9fTBpMfU5L5+E7wTyFNnZUOBJdYpT7/5SSueOkcIu9IKnLp+WMq7XX47hO7fKw9rRC0LKpi/L+y7xbkI9fQI2ospLHTg0zX8e7Fe1xUgjZrgHP9QwAwCFiCJPAYL0D98xn3qg1xY7P5I/uEFWOG4tCqWv2cridQNlD+ovYc1rJ83ZwolSzO+GypYuuArWl2fX4x8aRGtZKzjjITFVDGfzvI+w3TiqiK2DzuArSjJJK5mFSm6LmZGCgf4qWOL1jBR2/LXLbeG3Ea77orvcadjZjINOPsd2gL8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM0PR04MB6801.eurprd04.prod.outlook.com (2603:10a6:208:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:33:28 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 06:33:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 24 Sep 2026 14:30:52 +0800
Subject: [PATCH RFC v3 1/4] regmap: convert lock/unlock to a scoped guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-regmap-lock-guard-v3-1-8a6127223c16@nxp.com>
References: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
In-Reply-To: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM0PR04MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: c026d392-9bc3-4347-0d16-08df1a05bda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|23010399003|6133799003|10067099003|18002099003|22082099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	LTw4WlXHGS1gN29Rn/4MgavqRebH6SxUAGzkr3Wm/EMgYMC2XFJYHASkS55drjUkw5fpwHcWRJnDgH/Vc1+Y0t6XS4wd+SOHq2vcbcnJyWw/Q+dMogdPKxf6tWOQrBOFOlMDohc5OKXgsOcskIeZQm/xsis7W5uRNuv9Nziy3XcWKEOHbPGFXKV0pUEA6UxT+FbC4Y5EQY7kEbzVtrJAVu7DM8xzIMtH8/5JQgZpGvtaLo4mO8jmiXcowqdY5qVh8vxL8RXKhb92g0ZTSHgRyEocRHhmZOkMZYZpatYnmxP4yMMpgLhcIIt1/nQi29uJVuUkktgtz/rJZ8CA0s3ts0FgdSLjxdbKRcwjH1V5JqzNrAIlVlSjXe96tv/QYxF1GaYlPPk7C/Ehip27PRXHGkp5idlxbaJL62pUQyQKGRDv4tITFPX+Ip6h5ibOS/Ke0q9FGAnn/Kqh1ZeYpLTSLDHFe97xH+xKU/M7+xiiDaGY04broS0iec9EOAUcyJswVIKMmDymsQ9UbQFObe0xz6dVu0Hyc7AE3wKK56h9oMIqJebcOpaAg8IGFyGUjF4ev/9t48cjEkC1NSa5jmpwM1Gzh8tR/DkxgbZT9QWZFJU7KA3Ak1TYj5825FsWzZ7qUC2hhs/shtUITBgYVkQiU2xGChaA2JdHwm2xudjvLfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1JObzRCd1ZMaDdqdmlsbW1GUjBCSGNvZEMvR05hUWZTLzdIMVpvdzNPRjJk?=
 =?utf-8?B?dGRzTEZFN2piN0xWb3U5eldneFZKRlE2U0ZrMGJrTmhzMzdGY0x1R0R3dUpL?=
 =?utf-8?B?V0ZnanF6MnlZNnhLbm9VU1dBMzlxNThmN2NLWDBrRjhHSWJzdEphNCtUaW5W?=
 =?utf-8?B?d0x4K1RSaDBuV3FIV3pXSnVnNDZvUmREWVJLSnFvK1N4ekY1bzkvdm5wNjZr?=
 =?utf-8?B?Q0pXZWFMRU5JREg2bnp5aWdZUk1hczhGR2IxL3E0dWRKY3pIL3R1cWtkZ3Zn?=
 =?utf-8?B?dE93cmhWaE5zOU5aQmF3TU5XQ1hRMlpldS9KMWs2YW9LWU9LL2hnWFpTUWhn?=
 =?utf-8?B?T21rcU9nemY2b0I4QklwUGJPUDVoMmlZZldPRkoyQ3VKb0RENG5PY0d6dTR0?=
 =?utf-8?B?TVlMb2xrTllPUHlQSk5UQnpkUU5IMDBGaFN5N1RSYmRtRlJROXhiZHByemgx?=
 =?utf-8?B?U1drWkd0a0FEalhuUm1aOGp3cXpQd0RKOUdXTWZmNmJDNFJja1l1MjhUcXRT?=
 =?utf-8?B?WnlZaHZjSDhaTVd4dVdFNmRlVlVGNXdvWG5aRFVJU1FObWJnT0ZjaG9NNGEr?=
 =?utf-8?B?SDRBU1gxREJxbm5tcEFYTzlyWnhUSkFFNXdtc2hTWEJPdHplRWhReFdhNnlP?=
 =?utf-8?B?dUlzVGMxNFlaanFnOUE5RWVPWWtzV0M3S3ZBTEU4SVpZcjdoK3JTQ0JjUGE2?=
 =?utf-8?B?ZTVLMTNGdTloVUs4dWtRdndpMDUwK3JhMXVlVzJPdndvako5ci9LdFVEdFZz?=
 =?utf-8?B?cDFNTkZKcXVkRm9oSHRDRGlDa3FmZk1OZU5hQ0pta1dPV01pZjlqeWQ4cGdT?=
 =?utf-8?B?cGxDZGNRUWNKMEVIRHpQRk9xVThlTWtSUGhSVHk5a2E5cmNtdEd1RE1EcWZV?=
 =?utf-8?B?bC9DZVJFcWQ5cGtSVWFhTjM2RFdFajhTbkh1czJUb21Ca05ybmpWL0RUM0l4?=
 =?utf-8?B?WncxL2JYa0xYWWRBN09jZmZnby9QUUtPVnVvYllweko4UCttdHZiRDhXMnlX?=
 =?utf-8?B?MTlwcFFiR2pmQnRvaThKQW5UQ1ZFZXFaUVVnWTh0MUIrSDJyY0tmQmo3M0Nu?=
 =?utf-8?B?TFhPaG9LZjNuU1ptSkprbUt4NFFOb0JPYi85bkJUNzlocUxic1F0YUNvYksx?=
 =?utf-8?B?dmZMcnpVNmNVbC9VMXRWdk82OGt1QUd3enloRHV6Z1l1WVljQi9qaFdLYmU3?=
 =?utf-8?B?UE92Y1ZxNEJyMWJXYkZwZWdZdVFINllSVDNFZGNTSGZCMm1ybXQwN3RqajJU?=
 =?utf-8?B?ano1czk1VGRDdDdTRWtlMEpKVFdlb3JTLzRsMDRVZnJTcXI3cDQyTUF2UjdB?=
 =?utf-8?B?VE0rZFI5L2EycUxueFZtWEhlaFVjaCtlaTY0a2xreFI2VDNRNmllNVlWb0h1?=
 =?utf-8?B?K2hkVkNuNUZGNVFuWC9KYkpxcnpPLzllTWxmRVBvRWpLQzFCdThxMEtTRWxN?=
 =?utf-8?B?bGUzUDdCSmxQa3pSTC9vTVJLaUNRdEVUaFo1bU0ySmY4TDRSYUUwV25ncDBi?=
 =?utf-8?B?NHBYS21VU0dpYm5iVG9zSVVzVnJhZENMeS90TXlKbmZzZzRENDRTZjZpTXda?=
 =?utf-8?B?OXNwY0xWNWV5VksrZHB5bzZKSnVaWEV3Smh6M3F5TjFsTnZ2dXdPeGF1VWZi?=
 =?utf-8?B?QVFIVWlpLzU4MTdDUE1CQU9sc05XQnkzWkNibzl1Y3hNNGZaNlpHRnBDNXJR?=
 =?utf-8?B?MDMxL3hiRDdvRzlTSWFqYkEyOUI3STJCR2J4ZDcwcHV3aVVycXRpNDFheW9s?=
 =?utf-8?B?MTlEYURLMXRMV015QytrRmJaUUJlSjBpNTFDaG9MallOdXQ0dXE1eHhNSHNM?=
 =?utf-8?B?Z2hzZmJLRExHNldWK1pPbGZ4QlRHcDd3dUxsRyt1ZzNRL1BvTHhhcjdkVElG?=
 =?utf-8?B?aFh3TWszdnhTYTdhdHY1OFUrdUp6aUhETXVKTmFtZG54a0JHZ1o2M3dKTXBh?=
 =?utf-8?B?YUFpUVdpdTIyV085TEdObzAzRStFaUw2Z2NWM1Q1REphdFRXQWx6ZmZTSWNE?=
 =?utf-8?B?TXVIOHlDOENHbVJ3eDlmcGgzbjFhK1hkc2dtMEs0Z1dZa3Q2dXQralNyYU1F?=
 =?utf-8?B?aEgvbzNzSldpY083UVIwOHdSYVQ3ZlBqR2FxS0Y2Q1ZKWDM5N2Q2ZXJhZTZH?=
 =?utf-8?B?UU4vaHpmWWNGS2RUbWhHblBmWHloN2ZKbEhJMTVNZFJLS1Q5Wk1uWVpkMXZy?=
 =?utf-8?B?MHVHd1hoZVZsc25WQ0VlNEF2Y04zd2F5Q1pLcnlGMXNDSkVNTktRbytuejd5?=
 =?utf-8?B?alFxZ015RmlzQzZudEdoUWtPS2M4MTZoSDE5QUo1NXZ4YmMvOEpaNkx6MU5G?=
 =?utf-8?B?UUMxSUpPODdGbWZFMFlpbDFMY2ZIVU5UTUNWdWgvVlZFTEVrWlpST3NCRlpn?=
 =?utf-8?Q?nREbQbcjKwXsvFa38zGExRJkeBsgGpK/ZDpAh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c026d392-9bc3-4347-0d16-08df1a05bda8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:33:28.5504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3YdenspORneXcvidByNunpB1tx1/LtlDPNVENYcydXHg3A/+00vm4MoUZ3Gb4ij5osjDePDe07X0wZoIxh64/qYdd+ZedeesC2zHvp5Zjj/ZkYRx+aMRLj6qRBNwL9X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6801

From: Peng Fan <peng.fan@nxp.com>

The regmap lock and unlock callbacks are invoked directly as
map->lock(map->lock_arg) / map->unlock(map->lock_arg) at every call
site. This open-coded pattern requires manual unlocking on every
return path, which spreads goto out_unlock chains and duplicated
unlock statements throughout the code and is an easy place to leak
the lock on an error path.

Define a scoped guard for the regmap lock in internal.h. The lock and
unlock callbacks are chosen at init time (mutex, spinlock, raw
spinlock, hwspinlock or none) and return void, so an unconditional
DEFINE_GUARD() is sufficient.

Convert all lock/unlock users in regmap.c to guard(regmap)() for
function-scope critical sections and scoped_guard(regmap, ...) where
work must run outside the lock (e.g. regmap_register_patch() calling
regmap_async_complete()). This drops every manual unlock and the
associated goto out_unlock labels with no functional change.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/internal.h |  11 +++
 drivers/base/regmap/regmap.c   | 182 +++++++++++++----------------------------
 2 files changed, 70 insertions(+), 123 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index c73036744468..ea375cc8ae87 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -10,6 +10,7 @@
 #ifndef _REGMAP_INTERNAL_H
 #define _REGMAP_INTERNAL_H
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/fs.h>
@@ -185,6 +186,16 @@ struct regmap {
 	struct hwspinlock *hwlock;
 };
 
+/*
+ * Scoped guard for the regmap lock. The lock/unlock callbacks are selected
+ * at init time (mutex, spinlock, raw spinlock, hwspinlock or none) and never
+ * fail, so an unconditional guard is sufficient. Use with guard(regmap)(map)
+ * or scoped_guard(regmap, map) { ... }.
+ */
+DEFINE_GUARD(regmap, struct regmap *,
+	     _T->lock(_T->lock_arg),
+	     _T->unlock(_T->lock_arg))
+
 struct regcache_ops {
 	const char *name;
 	enum regcache_type type;
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 98184a00097a..0b40e1e7817c 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -115,9 +115,8 @@ bool regmap_cached(struct regmap *map, unsigned int reg)
 	if (map->max_register_is_set && reg > map->max_register)
 		return false;
 
-	map->lock(map->lock_arg);
-	ret = regcache_read(map, reg, &val);
-	map->unlock(map->lock_arg);
+	scoped_guard(regmap, map)
+		ret = regcache_read(map, reg, &val);
 	if (ret)
 		return false;
 
@@ -1977,18 +1976,12 @@ int _regmap_write(struct regmap *map, unsigned int reg,
  */
 int regmap_write(struct regmap *map, unsigned int reg, unsigned int val)
 {
-	int ret;
-
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
-
-	ret = _regmap_write(map, reg, val);
-
-	map->unlock(map->lock_arg);
+	guard(regmap)(map);
 
-	return ret;
+	return _regmap_write(map, reg, val);
 }
 EXPORT_SYMBOL_GPL(regmap_write);
 
@@ -2009,7 +2002,7 @@ int regmap_write_async(struct regmap *map, unsigned int reg, unsigned int val)
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	map->async = true;
 
@@ -2017,8 +2010,6 @@ int regmap_write_async(struct regmap *map, unsigned int reg, unsigned int val)
 
 	map->async = false;
 
-	map->unlock(map->lock_arg);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_write_async);
@@ -2080,20 +2071,14 @@ int _regmap_raw_write(struct regmap *map, unsigned int reg,
 int regmap_raw_write(struct regmap *map, unsigned int reg,
 		     const void *val, size_t val_len)
 {
-	int ret;
-
 	if (!regmap_can_raw_write(map))
 		return -EINVAL;
 	if (val_len % map->format.val_bytes)
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
-	ret = _regmap_raw_write(map, reg, val, val_len, false);
-
-	map->unlock(map->lock_arg);
-
-	return ret;
+	return _regmap_raw_write(map, reg, val, val_len, false);
 }
 EXPORT_SYMBOL_GPL(regmap_raw_write);
 
@@ -2211,21 +2196,17 @@ int regmap_noinc_write(struct regmap *map, unsigned int reg,
 	if (val_len == 0)
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
-	if (!regmap_volatile(map, reg) || !regmap_writeable_noinc(map, reg)) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	if (!regmap_volatile(map, reg) || !regmap_writeable_noinc(map, reg))
+		return -EINVAL;
 
 	/*
 	 * Use the accelerated operation if we can. The val drops the const
 	 * typing in order to facilitate code reuse in regmap_noinc_readwrite().
 	 */
-	if (map->bus->reg_noinc_write) {
-		ret = regmap_noinc_readwrite(map, reg, (void *)val, val_len, true);
-		goto out_unlock;
-	}
+	if (map->bus->reg_noinc_write)
+		return regmap_noinc_readwrite(map, reg, (void *)val, val_len, true);
 
 	while (val_len) {
 		if (map->max_raw_write && map->max_raw_write < val_len)
@@ -2234,14 +2215,12 @@ int regmap_noinc_write(struct regmap *map, unsigned int reg,
 			write_len = val_len;
 		ret = _regmap_raw_write(map, reg, val, write_len, true);
 		if (ret)
-			goto out_unlock;
+			return ret;
 		val = ((u8 *)val) + write_len;
 		val_len -= write_len;
 	}
 
-out_unlock:
-	map->unlock(map->lock_arg);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(regmap_noinc_write);
 
@@ -2357,7 +2336,8 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 	 * single write operations.
 	 */
 	if (!map->write || !map->format.parse_inplace) {
-		map->lock(map->lock_arg);
+		guard(regmap)(map);
+
 		for (i = 0; i < val_count; i++) {
 			unsigned int ival;
 
@@ -2372,18 +2352,15 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 				ival = *(u32 *)(val + (i * val_bytes));
 				break;
 			default:
-				ret = -EINVAL;
-				goto out;
+				return -EINVAL;
 			}
 
 			ret = _regmap_write(map,
 					    reg + regmap_get_offset(map, i),
 					    ival);
 			if (ret != 0)
-				goto out;
+				return ret;
 		}
-out:
-		map->unlock(map->lock_arg);
 	} else {
 		void *wval;
 
@@ -2653,15 +2630,9 @@ static int _regmap_multi_reg_write(struct regmap *map,
 int regmap_multi_reg_write(struct regmap *map, const struct reg_sequence *regs,
 			   int num_regs)
 {
-	int ret;
-
-	map->lock(map->lock_arg);
-
-	ret = _regmap_multi_reg_write(map, regs, num_regs);
-
-	map->unlock(map->lock_arg);
+	guard(regmap)(map);
 
-	return ret;
+	return _regmap_multi_reg_write(map, regs, num_regs);
 }
 EXPORT_SYMBOL_GPL(regmap_multi_reg_write);
 
@@ -2690,7 +2661,7 @@ int regmap_multi_reg_write_bypassed(struct regmap *map,
 	int ret;
 	bool bypass;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	bypass = map->cache_bypass;
 	map->cache_bypass = true;
@@ -2699,8 +2670,6 @@ int regmap_multi_reg_write_bypassed(struct regmap *map,
 
 	map->cache_bypass = bypass;
 
-	map->unlock(map->lock_arg);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_multi_reg_write_bypassed);
@@ -2737,7 +2706,7 @@ int regmap_raw_write_async(struct regmap *map, unsigned int reg,
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	map->async = true;
 
@@ -2745,8 +2714,6 @@ int regmap_raw_write_async(struct regmap *map, unsigned int reg,
 
 	map->async = false;
 
-	map->unlock(map->lock_arg);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_raw_write_async);
@@ -2863,18 +2830,12 @@ static int _regmap_read(struct regmap *map, unsigned int reg,
  */
 int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val)
 {
-	int ret;
-
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
-	ret = _regmap_read(map, reg, val);
-
-	map->unlock(map->lock_arg);
-
-	return ret;
+	return _regmap_read(map, reg, val);
 }
 EXPORT_SYMBOL_GPL(regmap_read);
 
@@ -2897,7 +2858,7 @@ int regmap_read_bypassed(struct regmap *map, unsigned int reg, unsigned int *val
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	bypass = map->cache_bypass;
 	cache_only = map->cache_only;
@@ -2909,8 +2870,6 @@ int regmap_read_bypassed(struct regmap *map, unsigned int reg, unsigned int *val
 	map->cache_bypass = bypass;
 	map->cache_only = cache_only;
 
-	map->unlock(map->lock_arg);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_read_bypassed);
@@ -2941,22 +2900,18 @@ int regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 	if (val_count == 0)
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	if (regmap_volatile_range(map, reg, val_count) || map->cache_bypass ||
 	    map->cache_type == REGCACHE_NONE) {
 		size_t chunk_count, chunk_bytes;
 		size_t chunk_regs = val_count;
 
-		if (!map->cache_bypass && map->cache_only) {
-			ret = -EBUSY;
-			goto out;
-		}
+		if (!map->cache_bypass && map->cache_only)
+			return -EBUSY;
 
-		if (!map->read) {
-			ret = -ENOTSUPP;
-			goto out;
-		}
+		if (!map->read)
+			return -ENOTSUPP;
 
 		if (map->use_single_read)
 			chunk_regs = 1;
@@ -2970,7 +2925,7 @@ int regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 		for (i = 0; i < chunk_count; i++) {
 			ret = _regmap_raw_read(map, reg, val, chunk_bytes, false);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			reg += regmap_get_offset(map, chunk_regs);
 			val += chunk_bytes;
@@ -2981,7 +2936,7 @@ int regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 		if (val_len) {
 			ret = _regmap_raw_read(map, reg, val, val_len, false);
 			if (ret != 0)
-				goto out;
+				return ret;
 		}
 	} else {
 		/* Otherwise go word by word for the cache; should be low
@@ -2991,16 +2946,13 @@ int regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 			ret = _regmap_read(map, reg + regmap_get_offset(map, i),
 					   &v);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			map->format.format_val(val + (i * val_bytes), v, 0);
 		}
 	}
 
- out:
-	map->unlock(map->lock_arg);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(regmap_raw_read);
 
@@ -3041,12 +2993,10 @@ int regmap_noinc_read(struct regmap *map, unsigned int reg,
 	if (val_len == 0)
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
-	if (!regmap_volatile(map, reg) || !regmap_readable_noinc(map, reg)) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	if (!regmap_volatile(map, reg) || !regmap_readable_noinc(map, reg))
+		return -EINVAL;
 
 	/*
 	 * We have not defined the FIFO semantics for cache, as the
@@ -3054,16 +3004,12 @@ int regmap_noinc_read(struct regmap *map, unsigned int reg,
 	 * written value? Just avoid this by always reading the FIFO
 	 * even when using cache. Cache only will not work.
 	 */
-	if (!map->cache_bypass && map->cache_only) {
-		ret = -EBUSY;
-		goto out_unlock;
-	}
+	if (!map->cache_bypass && map->cache_only)
+		return -EBUSY;
 
 	/* Use the accelerated operation if we can */
-	if (map->bus->reg_noinc_read) {
-		ret = regmap_noinc_readwrite(map, reg, val, val_len, false);
-		goto out_unlock;
-	}
+	if (map->bus->reg_noinc_read)
+		return regmap_noinc_readwrite(map, reg, val, val_len, false);
 
 	while (val_len) {
 		if (map->max_raw_read && map->max_raw_read < val_len)
@@ -3072,14 +3018,12 @@ int regmap_noinc_read(struct regmap *map, unsigned int reg,
 			read_len = val_len;
 		ret = _regmap_raw_read(map, reg, val, read_len, true);
 		if (ret)
-			goto out_unlock;
+			return ret;
 		val = ((u8 *)val) + read_len;
 		val_len -= read_len;
 	}
 
-out_unlock:
-	map->unlock(map->lock_arg);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(regmap_noinc_read);
 
@@ -3149,22 +3093,20 @@ static int _regmap_bulk_read(struct regmap *map, unsigned int reg,
 	u8 *u8 = val;
 	int ret, i;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	for (i = 0; i < val_count; i++) {
 		unsigned int ival;
 
 		if (regs) {
-			if (!IS_ALIGNED(regs[i], map->reg_stride)) {
-				ret = -EINVAL;
-				goto out;
-			}
+			if (!IS_ALIGNED(regs[i], map->reg_stride))
+				return -EINVAL;
 			ret = _regmap_read(map, regs[i], &ival);
 		} else {
 			ret = _regmap_read(map, reg + regmap_get_offset(map, i), &ival);
 		}
 		if (ret != 0)
-			goto out;
+			return ret;
 
 		switch (map->format.val_bytes) {
 		case 4:
@@ -3177,13 +3119,11 @@ static int _regmap_bulk_read(struct regmap *map, unsigned int reg,
 			u8[i] = ival;
 			break;
 		default:
-			ret = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 	}
-out:
-	map->unlock(map->lock_arg);
-	return ret;
+
+	return 0;
 }
 
 /**
@@ -3310,7 +3250,7 @@ int regmap_update_bits_base(struct regmap *map, unsigned int reg,
 {
 	int ret;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	map->async = async;
 
@@ -3318,8 +3258,6 @@ int regmap_update_bits_base(struct regmap *map, unsigned int reg,
 
 	map->async = false;
 
-	map->unlock(map->lock_arg);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_update_bits_base);
@@ -3452,19 +3390,17 @@ int regmap_register_patch(struct regmap *map, const struct reg_sequence *regs,
 		return -ENOMEM;
 	}
 
-	map->lock(map->lock_arg);
+	scoped_guard(regmap, map) {
+		bypass = map->cache_bypass;
 
-	bypass = map->cache_bypass;
+		map->cache_bypass = true;
+		map->async = true;
 
-	map->cache_bypass = true;
-	map->async = true;
-
-	ret = _regmap_multi_reg_write(map, regs, num_regs);
+		ret = _regmap_multi_reg_write(map, regs, num_regs);
 
-	map->async = false;
-	map->cache_bypass = bypass;
-
-	map->unlock(map->lock_arg);
+		map->async = false;
+		map->cache_bypass = bypass;
+	}
 
 	regmap_async_complete(map);
 

-- 
2.51.0

