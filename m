Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AAD49A3C0
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946894; cv=fail; b=oKXQ/Yis2xdtlhRX2pesfrUCBBxFvfKyCJgi2W5VKXGVLMUERodY34juLUN/Xtk5jAso9EQxJ+SCwOgXaotiDygSwqokR1Jlzfr4ilJz3CZDcdezJ4yw30bdNAtewyekLEwo5wx1BidgkfdUVbzKXLiUkja1q9KMGMdrcY5h7Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946894; c=relaxed/simple;
	bh=MdpisW3V3YZHOGrQyy6SE2FEuIwi4wMIhWw74r03Dk8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Fd2y2xhB1buZaBTPcwVd6UuJXojE7O2LL7I3wAk3qSHU/Me+LiTm/qorkut7F4fVA8g2AsRZkPBeWLcmYCdw4CCHa08Dc0Ii3GEwmbGlhkcb1tNi442e42IUs9e0dYSgIIIKn/S9tURXOvKTJblHKB8yckTVGDLpjGBIGoj+x70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QHsPJEEg; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QHsPJEEg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpL1iubY9TgR7Bmew3xJL0so2Izl37hQFv+4LtOcNd31J/bF066dsJITaml7drfz7bNBnCtGYXi1evcrbSn30v4uQFue19142f6VpL7bXKOPYh3PD9/5A5EBwzFKu+zdtd/0mocu25GHaQT5yRmZqiA4d8z94GXhsRXbQUpfogxeymetEFj8pSlvVLrqAYy+S9FfbkvryeWEd468rJLFy6ice4gu/U/G2nMYvvL4pzzgNRpAKE8ueswcWeIXw3hZwLbryyCVkd4GHFtpB8w58SKw2cN1xK1Q5Z4xnpoaO5dwV9PBMaoiH2ifD3GO1h9Dowyb96x+qPcTX5DoMf9q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d0eCzXUcdhkqAijLW0L1fKKeaf6XX1FIrseHUdvY5E=;
 b=K4ApIVMEP7Fhr9nsC51lCd+jj+/hWBhRR6+aVf8YeoRSgTwOWQEawOCXZ0j5qxV/5r3J7V9J54Y4QjQKiPUYOxwMipZBY/woYjEd6xgwK5iGlUbRRR8AK61BvfhiodpuceZKUenyYTAJZqJ2k5W/m1BXiBDHAVvofKV9YDjYnwUtuyO1y3UwrBUti6fgQ17ft96poxE4mAW3F1tv/ti733un5KCjSjI/kvLypxqxSUqVd/6EzxuI7RTeFwpUsP/4QsM2IPpAvxd/XS9U1Fd7VK9K8xvrVVC8de1tcdWCpm6Sczlgp6nSPJ2l33veiQT9hgUCMBR0L8l9VzuBNJQWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d0eCzXUcdhkqAijLW0L1fKKeaf6XX1FIrseHUdvY5E=;
 b=QHsPJEEgkFCu70+FCAdQmnX7CqRBuBe2a+or5VuF5c7kagZlNJ3IOB12QlZbgXyh22ge6ewW2lz6zX9oJbeOOz0cvAouQXqYOvI0znFDdDvnn3k7svW5hqtnatSsjvslg5R80e3K4oIlGyo+BYXOmcF/8xsT0yc183DNGWWFFfbHQBPlduPpg5e8Z2sfwC5Fhjc7X8womu04pi6znRW7oQFzJQXrFZ755YSXmmHmExmSMzyZiwRku6PmBFOx6PVqpUnfPH4tn1exWZREJqfRzNJUsGVwLkALzWNDCQcx6tkP5YVaGMiJzxGp/6jfnzF2LZM5XJHTOP0m0byRY/FwCQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 13:14:49 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 13:14:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 02 Oct 2026 21:11:23 +0800
Subject: [PATCH v2 7/7] regmap: debugfs: Use guard to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-regmap-lock-2nd-v2-7-e172b0501c52@nxp.com>
References: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
In-Reply-To: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 530e573d-8508-4c3d-2745-08df20872312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|56012099006|10067099003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SMnS2F+uQ3iuoACDXSGfyx8SelvxMbRxhIoSlCEB6GHFHOPQk2p10u4gz6yR6Rz3hdmViXYNOCy/So/1L24Rwa9Wpl+NGZwvF1LE4kQiGMrBGHnn6jiDmjCa4JXhd6aZmf6CGiQnKSNMjLEqoW3OpFCHeK/GwdchAnLFcXtUjIncAJhFS50ER7TYJV9FjaE9BpeqfMDAqjqRKXw+QRuUMpNsdcbw9nY9ipZ4imC8IpiCnY1coS67paKtTUWpsNnV2kPLcUciECvloQ2EVpisukjKHW9Ml2emC2OmhLoHkx8Yi1FPTETq7ofrWbQnPwSxkkE4OZTBMYMhFCWLR/6hWSuYAjsbYoY4CfzelBfTrJkkhrV1EipyeIPuxs6fDAVLxFFQGH7O6IdbxqjfktRDwRTs32jb+vjo6KdxSmY8bDDkK7ziFOMazrUH1Ee3ar3X1Ek/V/tqSI16OYwGAA9vBmJXg7CpcQmIe3TEPRmL1CIW3CuBUtmt0UGJRqLMJAvxGWPYHPb4XiWNCqFlbhFdEVgRMtbqTQnlcj1P7lCMZJ8Cp/AV9puzlyGexVqmzMT1Fdg55opKgya1/10ChxRPmZQd7L+c48tMUqyy9JT8hUo5PeVYjGB2qOPgkn+Qwga9NF/f0szteqOQD6g0PGmAfXhadEU0upjAE/DmVc9epng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(56012099006)(10067099003)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWwxQkRSZS9zb3dxMDdvUlZkMmIwQ25FMzZ4ZzJaZ1krNlpXTEVlbmZSTXRs?=
 =?utf-8?B?NmloZHdqbCs1YWtPcTI1TUxFWVVjTEtrOVhpQTJTY3V4YkRYalhFYWJTT2tv?=
 =?utf-8?B?RWl5Yk9lR1V0SjVoNG5sYnlUQVB6VmVyc0JHZEdJQWxQQ3VxOU94ajFZQTd0?=
 =?utf-8?B?K3o1M2t1SzkxQlB2em1xb1lvMUhNTytCeWF1ZkpOVGRBeGhWRkpsUDRNa0lM?=
 =?utf-8?B?S3Z2YzllMXpWZjNtNGNtSGxOTzZUOUUzU0g1SzlxcHJaME81QXl1SDJhVEhn?=
 =?utf-8?B?TDBXZTZ3OVhRMUdkM05PSU1aMmwweHZDcVJsdU1UM2JOU0ppVk5MZGVCOHhX?=
 =?utf-8?B?N2Q4bThCWWVUMjVlMk01YWkvRGt1OGlpeUFMaEc1ckpaVmQ0cUh1OUxEUyta?=
 =?utf-8?B?ODF2ZlJ2TUVGY0wzU3Yxa2g0YXdVdlVNazI4bWt3cG5meWs0VUVRMW0yV0pv?=
 =?utf-8?B?NHZmV0dRZnNIeEg0SE1OM2lQaHlpK09hN1Z3WGljcVdQNkVwWXZwS3ZMOGRl?=
 =?utf-8?B?ZC83dFlaQkdYbCsybUt3aVhaTDg5VUUyeVNRWUNpVWdvcm1OdGwxeVVxTTI4?=
 =?utf-8?B?ZldYL3BpWFNsQmN0Z1FUd3dEQ3FuMFVvZUlrME5XMTNuQ1hyMktsK3RPOWU0?=
 =?utf-8?B?TWM5WHY0bXVjMjZjaEJ0UFpUMHJvVjdTd3hhcUUyYjIwS1RuSlNTekFkbjFY?=
 =?utf-8?B?VXFsL1NlRWpSSkdNVnJ2UjhOZFE4aFNXZ3R3VWVwZExWZFR4U0JRR2xFYW45?=
 =?utf-8?B?MERORkVIUkNiMXVkTGpXZC9MQ3lCbXFaMzM1ZHpseDUxWnJqNmYxaTV6NVYw?=
 =?utf-8?B?cjE5Ui90dzU3Z3liem1zNG9OMHZUanlIVkV6VW5WUGpDKzlYY1JNUDByVjU5?=
 =?utf-8?B?SnJRdSs0MmNBbVJQdTZxbUoyYzRrcFNKK1pKWUpMaEM1NGFpNllWU3VLTXlP?=
 =?utf-8?B?ZkFUbjFTUUhrMldtT1NMM3VXbEVaVlY2YTlFeldJZlZmUWVuUzR5S1ptcW9q?=
 =?utf-8?B?M3RlMzFyTSsvamdVVG15dmZZVGF2VVo1VjRHRnk0dkhPNjFsZnVlMFRTQ3BM?=
 =?utf-8?B?VEhEL3FpNnZRbS9NTW05Rk83bndrY1VhUWxtcFJrK2U3MnU4Z0dzZk5hKzFZ?=
 =?utf-8?B?TlFFdmdkbDNPWU8wVEM5eVhhbDhCTldwNXdNVXhyR1Z5TURYU1E4K2R3STZy?=
 =?utf-8?B?RzZYZnBWTWMvQ2Z2cXZya3RsY09PSUFiSXd1NXppTkNvY09oWTdETTFKcmYw?=
 =?utf-8?B?Umh6Ymo5ZlpBaEQxczdZRzBhemJrdE1kUzhLVi9ZZUFPajFuK2d5V2VPSjQ2?=
 =?utf-8?B?Ly9lWUtjRkNjOTlXVG82djBEckxiTTB0U2xGUWJjVDQvTmtGckJMMWJOQnQ1?=
 =?utf-8?B?RlNpL0txZ2p0SUdiaWc0WmxsOXZHUlNKODJacUMwY2V6dFpUTWtXbXdNd2xX?=
 =?utf-8?B?Z0txaEJuaXhOTENqRXhEUlI0Q3QydnJNbW9VbUh0d2x0MTd0Qzg2RVhyanJ3?=
 =?utf-8?B?aVhiU3FCL2EyWEVRTktZb291RWU1c2ZTSEMrZHEyWElLRXJzbmN1UGczeTBx?=
 =?utf-8?B?MXVxY01xUEtnY3hmUW1YbnArTll3a1U4WXFkWVFHcVY5QThaQWJwSUx2Y2M3?=
 =?utf-8?B?dnd0SnBOeThsNVdHdDJPTGY5OUwrU0s1dXhrbk9GWEFjYVM4L2dIM2FJZy9J?=
 =?utf-8?B?YTdybDhhSVIvRGFRNjQya2pROWxpYkk0clNGOXE4WVlBcjRtdENJRU0vYkM1?=
 =?utf-8?B?VlROV0RZcHkwWHhUdG5rdGg4b3p6cE9BTldDelR6NFc2eEpxTUkwaHZiVWhy?=
 =?utf-8?B?b1dRZDhMd2FQU2dPQTEwK0lKNDBRa3FMZnhYVmlGc2Z1Z1NUVng5YnBJMnlj?=
 =?utf-8?B?OU1aNEJiZUF2NVhiUWVUWkNmdmJCNUJJVC9DdFYrbVJhSi91VXpxakF1ZXNY?=
 =?utf-8?B?eUVxb3J6aE5sN0xCdUh1M0JBN1lLc3FLNnZoOStOazBGU2djaUk2ZmV0S3ll?=
 =?utf-8?B?a09TOWNZS2pFbXlBZ3RDTGUzSkVSU2ZKOFlhdkpucFBNRjhGczZkYzRKOStO?=
 =?utf-8?B?eERQSTcwQ0hEMzc3R1M2YjUvc0VVMFl0anlFTkIvdEY3Nlg2dEJsMldRY2kz?=
 =?utf-8?B?UER0QzE5aVhMUG1TQkE0NGxLZGkyT1ZrREdrRERMS1FnTFJkU1diWDBnbHg1?=
 =?utf-8?B?SHRKUkJwMm10cks4UG5BN2VNbjg3UlB1Y1gzZHJlTHV1T3Q3VjBiQ2lSYXhN?=
 =?utf-8?B?dFlWSlNaSUg0dEJiT2RuQnhUQk9qRnU4OE9XdGJjYTJkeE9MNkM1eXNHTEFp?=
 =?utf-8?B?OFA2Z3cwdkY1WkNJaFY1My9uQlJCM2dENndzcUJ5YmVhRTNnVmN0LzFYU3Rv?=
 =?utf-8?Q?d81D+O3iupXynk16lmXQsMdEQshxRHTsTyda3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530e573d-8508-4c3d-2745-08df20872312
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:14:49.3597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1DX+XAuDPTE2K2HPIEOwUEwo2gz/kSMPykFYDM42zWte6GssAL9pCE/doEpBoFWwPxUbBMGAA3QkkJMgu6UMP+kPa8EnaLEP8TY7ZC+acTf6sdm5vYd+KVCbkkjRbZ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

From: Peng Fan <peng.fan@nxp.com>

Replace open-coded mutex_lock()/unlock() pairs with guard() and
scoped_guard() across the debugfs code.

 - regmap_debugfs_get_dump_start(): guard(mutex) replaces three
   unlock sites (kzalloc failure, cache hit, end-of-function).

 - regmap_next_readable_reg(): early return for the common case
   and scoped_guard for the cache fallback path.

 - regmap_reg_ranges_read_file(): scoped_guard wraps the cache
   iteration loop.

 - regmap_debugfs_init(): scoped_guard for single list_add.

 - regmap_debugfs_exit(): flatten if/else into early return and
   scoped_guard for the early-list cleanup.

 - regmap_debugfs_initcall(): guard(mutex) held to function end.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-debugfs.c | 63 +++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index 0a9c27426f15..b2ae52a21331 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -107,7 +107,7 @@ static unsigned int regmap_debugfs_get_dump_start(struct regmap *map,
 	 * If we don't have a cache build one so we don't have to do a
 	 * linear scan each time.
 	 */
-	mutex_lock(&map->cache_lock);
+	guard(mutex)(&map->cache_lock);
 	i = base;
 	if (list_empty(&map->debugfs_off_cache)) {
 		for (; i <= map->max_register; i += map->reg_stride) {
@@ -129,7 +129,6 @@ static unsigned int regmap_debugfs_get_dump_start(struct regmap *map,
 				c = kzalloc_obj(*c);
 				if (!c) {
 					regmap_debugfs_free_dump_cache(map);
-					mutex_unlock(&map->cache_lock);
 					return base;
 				}
 				c->min = p;
@@ -162,14 +161,12 @@ static unsigned int regmap_debugfs_get_dump_start(struct regmap *map,
 			fpos_offset = from - c->min;
 			reg_offset = fpos_offset / map->debugfs_tot_len;
 			*pos = c->min + (reg_offset * map->debugfs_tot_len);
-			mutex_unlock(&map->cache_lock);
 			return c->base_reg + (reg_offset * map->reg_stride);
 		}
 
 		*pos = c->max;
 		ret = c->max_reg;
 	}
-	mutex_unlock(&map->cache_lock);
 
 	return ret;
 }
@@ -191,10 +188,10 @@ static int regmap_next_readable_reg(struct regmap *map, int reg)
 	struct regmap_debugfs_off_cache *c;
 	int ret = -EINVAL;
 
-	if (regmap_printable(map, reg + map->reg_stride)) {
-		ret = reg + map->reg_stride;
-	} else {
-		mutex_lock(&map->cache_lock);
+	if (regmap_printable(map, reg + map->reg_stride))
+		return reg + map->reg_stride;
+
+	scoped_guard(mutex, &map->cache_lock) {
 		list_for_each_entry(c, &map->debugfs_off_cache, list) {
 			if (reg > c->max_reg)
 				continue;
@@ -203,8 +200,8 @@ static int regmap_next_readable_reg(struct regmap *map, int reg)
 				break;
 			}
 		}
-		mutex_unlock(&map->cache_lock);
 	}
+
 	return ret;
 }
 
@@ -393,19 +390,19 @@ static ssize_t regmap_reg_ranges_read_file(struct file *file,
 	/* Reset file pointer as the fixed-format of the `registers'
 	 * file is not compatible with the `range' file */
 	p = 0;
-	mutex_lock(&map->cache_lock);
-	list_for_each_entry(c, &map->debugfs_off_cache, list) {
-		entry_len = snprintf(entry, PAGE_SIZE, "%x-%x\n",
-				     c->base_reg, c->max_reg);
-		if (p >= *ppos) {
-			if (buf_pos + entry_len > count)
-				break;
-			memcpy(buf + buf_pos, entry, entry_len);
-			buf_pos += entry_len;
+	scoped_guard(mutex, &map->cache_lock) {
+		list_for_each_entry(c, &map->debugfs_off_cache, list) {
+			entry_len = snprintf(entry, PAGE_SIZE, "%x-%x\n",
+					     c->base_reg, c->max_reg);
+			if (p >= *ppos) {
+				if (buf_pos + entry_len > count)
+					break;
+				memcpy(buf + buf_pos, entry, entry_len);
+				buf_pos += entry_len;
+			}
+			p += entry_len;
 		}
-		p += entry_len;
 	}
-	mutex_unlock(&map->cache_lock);
 
 	kfree(entry);
 	ret = buf_pos;
@@ -552,9 +549,8 @@ void regmap_debugfs_init(struct regmap *map)
 		if (!node)
 			return;
 		node->map = map;
-		mutex_lock(&regmap_debugfs_early_lock);
-		list_add(&node->link, &regmap_debugfs_early_list);
-		mutex_unlock(&regmap_debugfs_early_lock);
+		scoped_guard(mutex, &regmap_debugfs_early_lock)
+			list_add(&node->link, &regmap_debugfs_early_list);
 		return;
 	}
 
@@ -653,29 +649,29 @@ void regmap_debugfs_init(struct regmap *map)
 
 void regmap_debugfs_exit(struct regmap *map)
 {
+	struct regmap_debugfs_node *node, *tmp;
+
 	if (map->debugfs) {
 		debugfs_remove_recursive(map->debugfs);
-		mutex_lock(&map->cache_lock);
-		regmap_debugfs_free_dump_cache(map);
-		mutex_unlock(&map->cache_lock);
+		scoped_guard(mutex, &map->cache_lock)
+			regmap_debugfs_free_dump_cache(map);
 		if (map->debugfs_dummy_id >= 0) {
 			ida_free(&dummy_ida, map->debugfs_dummy_id);
 			map->debugfs_dummy_id = -1;
 		}
 		kfree(map->debugfs_name);
 		map->debugfs_name = NULL;
-	} else {
-		struct regmap_debugfs_node *node, *tmp;
 
-		mutex_lock(&regmap_debugfs_early_lock);
-		list_for_each_entry_safe(node, tmp, &regmap_debugfs_early_list,
-					 link) {
+		return;
+	}
+
+	scoped_guard(mutex, &regmap_debugfs_early_lock) {
+		list_for_each_entry_safe(node, tmp, &regmap_debugfs_early_list, link) {
 			if (node->map == map) {
 				list_del(&node->link);
 				kfree(node);
 			}
 		}
-		mutex_unlock(&regmap_debugfs_early_lock);
 	}
 }
 
@@ -685,11 +681,10 @@ void regmap_debugfs_initcall(void)
 
 	regmap_debugfs_root = debugfs_create_dir("regmap", NULL);
 
-	mutex_lock(&regmap_debugfs_early_lock);
+	guard(mutex)(&regmap_debugfs_early_lock);
 	list_for_each_entry_safe(node, tmp, &regmap_debugfs_early_list, link) {
 		regmap_debugfs_init(node->map);
 		list_del(&node->link);
 		kfree(node);
 	}
-	mutex_unlock(&regmap_debugfs_early_lock);
 }

-- 
2.51.0

