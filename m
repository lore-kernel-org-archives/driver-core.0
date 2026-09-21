Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7730B36194A
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 06:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970787; cv=fail; b=qsGRn0A+rb351UkbkZX6RJoC0Tm8optxUVlfoAWtcJ46hbkiMq5dGvjpWbIvguI4HbEMrI4gOgHtoaHbhKdz9oKX+PTsEUVaUFwm4sbY08B3q7j7WKXrbwrwT/yvR80EsX4YLBUdjx0+bN646aSQKEYe4WtcRgvyE6JUYVQHZM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970787; c=relaxed/simple;
	bh=fN8UdGTM7Tk+dcZJ2Kkz8R5Gilirh4SF3XUBI5hnark=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aemuiWRQjPSm8TMbQjR6nKVrtvAVRLo6o7C0rI3wXMBMsPEBi1j3qEwi+1rtPm0KD+2EJgMi/j47rJaRf6ZusznRs3CKmapbFjukApo20LXmySKGsO4GaapMEPgPrOJXU1y34yyQuFU9tw25sfM7xpXhT3zQFRTeNk9Y5Xu8/OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PjXE+WaT; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PjXE+WaT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdQ7ti8WxwvmZpxWhzEaF0YmS3F+5nNC8bNGr/YmVjptubHvSEddIxdZhRETnYsQeNkbrpuUFeYkcpcEY9XphYgfEjyjFMbuVsdwpvor31LrDfCIyi7gc7iqW6uTyoBbOOxa+NxF9Zvpkxa5AXzERppcqmCF2Chk0oCQraJ5Igv9iZx+HI0D0UMHFVgeRNScv3HS7qjgVgKdyBnEywXC8eHZagr0swMfMsgOQv2gTJF1gCnwp6ZJzBvJWbSycKdvFg3B2JUkI5i+hmIOeVo0q5LGj9ALJ3VbqcmjIDQcUfaA8TAa8frdb8thK+0IIAzLVEbyYMdkMGkyF2gPWrbXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDvr6LycASLMFQYnnxm/x42hixtBGuvyzYV7LG/fgFA=;
 b=kT7t/36zB4oZ2Hx1dYdT6VRMbENu1fyQUaAV/tNT6cmCgtECm4NoIfzxg+1efzjH4QWg3wjYnSRFZQxUaOXqGTymlbtyWUNbV7HqAhaOdVrYzkEntdHhwajxKGQxdzzFtDkslXr5I4i2ymHbZQrTM9I0J4MgN8Utg+imbU9/NIeQCIDdbQ/jtNC6LMzvSriz4ZnB7vWAdnRWgpu1B5TXDvcILIVSKzaSP2etd+fZk9m7H3xw1cZeMEU8wAU0P0oUlmVA/wjG08DZti4Agl0JT2Z/OoOXKKOYPNAhDnOxHqlAu3scmvS0dkyblxkreKhERzqs+NKhtvIbaMeH/rEpow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDvr6LycASLMFQYnnxm/x42hixtBGuvyzYV7LG/fgFA=;
 b=PjXE+WaTDz3xFPqvmnHuUxj/tiGeTn9NqV7G9QHPxA4vqf5r+H5+lO5zdOcyBrTB4D3wZYQBbgtGL1cnDZ31+T9UX4YWxwNsZNph4NTWuR+XkePW766+NeXNX1Nj1CeBnS+dVJRPaFSBpCf0dUeaCY4hu0doAe5bxDGkWeGqgEHrAgZnw1XGESBetaDy/BXCdfstvoF2F2Thncv4jiH3eId8wAYlAfuDRDDpY/AuQmw1zHRlownR17JWLYhe076V1Ko6aYmjb4swhKAtEINbxksA0yHqhxQvyWfODXg+wDgeJUe8vC5vvSVjiN2jpPsoR+klTP+mZSkG3kp+VnZ95Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB10432.eurprd04.prod.outlook.com (2603:10a6:150:1e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:06:22 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:06:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 21 Sep 2026 14:03:33 +0800
Subject: [PATCH RFC 1/4] regmap: convert lock/unlock to a scoped guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-regmap-lock-guard-v1-1-cdbd97b46074@nxp.com>
References: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
In-Reply-To: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB10432:EE_
X-MS-Office365-Filtering-Correlation-Id: 81299d52-f1c6-44c9-c5fa-08df17a675f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|6133799003|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Bo/+oeM2V71Kfw5GyqhC3xMG01mpfosl1JoZlVYsdjRLJP5JtS667VFMH7TjkXCuIGvzcb9HVF2WkGNJ9c0LXiES1y6Ftz0h8AAvDMZ9CI5vYChABsGqqUXZBGoykSjmPbpoLRGLCXDVJ9UMYzikgP4rb5tyRpQ/M2x5/cdQcqF85bMWklljjQpOvpKdQ3XzULINzOAwBC2aex+c4tALy4UMpM+tIEGp6+dXxnGkQALlWBlZNnPpkLwJewFqRi0wzJHJUtq6xCMMZKd/PGRiviXKQUHM9AuxBkhVxbp4/qiNj83pDHVvSpXgLGzaHDTGpo9EmrO4tvLJ1E0sv0XrMKyOTwdVVUKVZmHeQJCdecQdrNc6FPodY0sVXz7dZuALV3gm5UB7cEPulGDPGPZGyU/qlmK+ML4LEpVmku6hb7P1wd1CHPlTYUNK1C9J4MITa0iOKJzIipdVBczv0Ci5cM7CFc/6WnCe5W+ME8KBgSukGSvaoMBr2OPbKLfvbWml1pNV3fOCWaNz/WArEy98F9LVX658VN6gq8Ynx9jJyBvlaVKL3YLvthsHudI/Q/MnUW+zO7CBtnpu76/vqRJSSPwGWg0W6jvgnP4q9mcufO/oa7t5fu4uRD8rEZhdhB1VIxa/EgnTBmSo5yjbR+Khv9+28NgtZtSBxYvyGO4qRLk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGI1M1hTRm16WC9BQzBINEFvUE9vYTZCbWgwQU4vN2tPU1VyYTUvamdjVTZT?=
 =?utf-8?B?cnpWQXFDaHN2T2dNeEkyWVBTUkJ2dVZaQlM2SGhOa1NNZ0tGd1pCdmZ3aDhC?=
 =?utf-8?B?b2tUdE5IMkNaTS8zb2N3Skh5RzRrUUYyYnlMak0vZy82K1FqN3ROTklGcDBK?=
 =?utf-8?B?QTV5WEozcit3aWZ3K3c0MUxWMXZsOUF5UjhWRnd3M2xZUlFsaGY4K2hiVU4w?=
 =?utf-8?B?NmhPR2QwQWViMzhiM09FTWErb3RFZVM4K0xCUE9wNWgzNWRxbDBVaVdQUHJ4?=
 =?utf-8?B?cnBmcWl6TW5FVEQxaE9pZi9BdGZtbnQ2cU5ER2ZURXF5eGlrQlJ6eGdMUHpD?=
 =?utf-8?B?by9HRW5UWmZWZkJiR1c1YmI2a3BqWjRIRTJhVTIxSzlPczRlZFUrQ2lxWkJL?=
 =?utf-8?B?K2tYUUE1VFg3ZnBsWVYycGs3Z2RCTWJidDF2ZTRaVkx6Z2FXQVRmTWRLOUFu?=
 =?utf-8?B?MVUrcGg0SXYxRGRVTUdRSHFlTDNiNGRuSDNmNWtjVjY3dmtid0pucSsrRmpa?=
 =?utf-8?B?eWJQR2JSTmdkbks0SmxNdE1vejh4blpZeGsyVnVHa2lFRWNWWEZWb1g4OSt5?=
 =?utf-8?B?bTNwZkVETzBmSmlZZWJHTGV4SllOcXRUdjVMd2NjczdXbEE1bktWdEtPdVZB?=
 =?utf-8?B?anMrVmViMnl6dFVDajBMYlZ1VVpWODMwUFE3VWV3SHFZTElaa2FWN2dHcHF1?=
 =?utf-8?B?b2lQMDZib2tXdXYzbHczVENKNFhieHljNEFwaGRjK2RjTHpxZXZvdGtUM05X?=
 =?utf-8?B?Z3JwdDN1bHkzUWp6Q3VKdUFnRzFsekZNQmhvN21VSlNrMHB5bUkrY1F5eVNm?=
 =?utf-8?B?dVNkdjFGMExZVTBwMUhWNTc1RzNEZEYxRkpGRVlTQ2ZGZW9OOFdQbDFuVTJw?=
 =?utf-8?B?N1pMZzhCbFI3YWhOTXA5cHU5NGI1Vkx2OWFNbVVkSFE2QWEzWnVwRlA1bXFE?=
 =?utf-8?B?Q3I4RGJXRmQvNmpGUmNYWktUbjYxT0hDVHlPaUhZL3BsQVROc1p2aTFnekEz?=
 =?utf-8?B?d1pzNlBsdUlubG9oMStnMktwWUR0bkNwUkZ6c05oSnJYaFoxN1E3WXFqTnBI?=
 =?utf-8?B?eTJQSENyN1d1a3N1SThMZnh6bldvU3hZcWtxY0d2MHpnK25UcjNuZzFYY09H?=
 =?utf-8?B?dGRVaGxHQnNCVWo5dWNOTnY0SWNOSUk1UUxobGcrc1JDV0pGZnRCRXlJaWht?=
 =?utf-8?B?OUFXdmpuN3B2UjhWRDdYRGpCUVliOVh4ZXlBdjkrRCtIc3FLbDdQVHpuQ0NO?=
 =?utf-8?B?cVk0bDEzajZMbDhPL2FLbzVlT3RpTVlTWUxFU0U4aHlJV2MxOGN3dTVGVjFi?=
 =?utf-8?B?MFBJNDRqTG11R0RZd0FJUS9oSHo3TThSemhtQ1E1NFhqdUpoZDJvUjkwY0V1?=
 =?utf-8?B?Nng5VE9PbzVtLzhPdGRHYzJ1OGVCSDJlSThja0N5NVZaclZFV01saWpUYlVB?=
 =?utf-8?B?R3c0azRheXBXQU5SMkRZUEhNRTh2R3FMNS9EK2IxRW5jTE04eThXQzg3QjZZ?=
 =?utf-8?B?UUVJZEUxVDVWemlSZTM0RE9wZ1N0MXpPYkRKZVh2eXF4REt6cC9BS0hvQ0lw?=
 =?utf-8?B?aHdBeHFsN2NRWnZoRXlaTXlUUjZmZHlQRlFzbXZ6Vkwybm03T1psWWQ0QUQw?=
 =?utf-8?B?b29YTlFJNi9jc3NpaStWdDF2OXoxU2czY1lOVERiMkk2S0hnak1jeXdlYitj?=
 =?utf-8?B?ZVJJa1NJT2JpUUZObzdjcjZndXR2SVV0SjEya3h6ZTE5cy9OS1BBRmpINXNy?=
 =?utf-8?B?Q2JhU1pocEFOOWMrY1J0OE9SZVVHY3owa08xN1ROR0FXcWVTdWZlTEhBSXY3?=
 =?utf-8?B?N3kvYnVOSGRlYUlRRHRsRDBHeUN2cTZtQWVtR3pnUmw4K1E1ZHAwSkVEYmF5?=
 =?utf-8?B?K1hwT2w0QlhNRUdTZTZpWkhtejNJd3FQUmx6d2RyTTBrUFRsbmR6ZEhYV1Bo?=
 =?utf-8?B?ZEw5aWNlZndKdWJMdm03UnhhNzhCTnlvc2xrMDBMbzMxSzJGWXpCbjFuMUt3?=
 =?utf-8?B?c3NRZ1ErYnZCNTdORnExdU9FOHAvVHZHWENBalNyNUNYOE9FSDVZR2t5eHZ5?=
 =?utf-8?B?RjNrZXVWV2dkTEVKUmIwbUllZUdDYjMvNGN6akQ1YVVzZmJsSnFKbmFiOS9m?=
 =?utf-8?B?VWlmcGMwU3ROS2o0OW5lWW4zZ1hlSmdPYlkrRzNCdXkrRW9CMndGV1ZOVE1U?=
 =?utf-8?B?UmFYOW9xMm5BTzEvdXZCRXZ0cG5Kend3bWhVMmo3YjVjWngvMkJGNkVoaHhJ?=
 =?utf-8?B?TEVURXhVcS9LNmF2bjJwL1hDN3dqcUZhbmtvalQ2eEZBZTFEdGFXNWl5M1kr?=
 =?utf-8?B?SHZIbTZJaGRQVVBmYVltb0RBQ2h6LzNvMUhmZ3IxM2NrZ1lZNTJXeGhEampx?=
 =?utf-8?Q?uxtSrdPtupvL8Yyr9oUf5xqK38vKQiDPVtFho?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81299d52-f1c6-44c9-c5fa-08df17a675f7
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:06:22.3037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zegvUTlk11LOTZRZcKiOCO8Au2MnjpQJYPi6sN76eGdDU2z8aUflRysUM7ngmSffxOdD0aIuZIG+dSjyEmolM5U5cIdjJ4yydLJltFqyywYs5dZzfONovsCP5692fkbj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10432

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

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/internal.h |  11 +++
 drivers/base/regmap/regmap.c   | 182 +++++++++++++----------------------------
 2 files changed, 70 insertions(+), 123 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index c73036744468..b023de9c7217 100644
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
+ * Scoped guard for the regmap lock.  The lock/unlock callbacks are selected
+ * at init time (mutex, spinlock, raw spinlock, hwspinlock or none) and never
+ * fail, so an unconditional guard is sufficient.  Use with guard(regmap)(map)
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

