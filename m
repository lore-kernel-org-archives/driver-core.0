Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010048.outbound.protection.outlook.com [52.101.84.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ED936495D
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 06:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970810; cv=fail; b=LP/sCE1lFn9OfCYz09rokc64v3rhc0eXEikvGTNmt2RXzvp4oxzScKwjYmSLdIpbPuPsNPCxM2KHAvXOQ3vQDypXT8DI3+vAajNKm/X9pdYJyxwtvs3LDLmr64JcDIsIVc1EXr7iwQ6s0vtyiIYavZq2qW9tThy6RRFda21WmJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970810; c=relaxed/simple;
	bh=63A2AFH/qGSjediDkS/PvJ8MNNDbSwsXZkG+Qc1w33A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=akkhiotapqmmgwiCbYXhyjBb9zdiCuMv7FhZPUmFxOF5MP0VgGw9t6clWAQL9g3hOrMOOByKrzzDPx056TbVk5l/CnmLrvbd4W4YuY6VFw1Y9SLx0aWmfT9gqZ2GsmvXL8bYkCiz6JVlcnzVIFYG14AeJX0+Xrv1TYPl2e/5vds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dDjvKzRH; arc=fail smtp.client-ip=52.101.84.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dDjvKzRH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxn/ZQf3tKsRopu9VQq/tHT6wJDVsRbh0PpMKupL+AwWUQ1PqI87cmzjzGc7sxPACLMa5mpPvNOwvgGJe9XHyaaqlfUzd3iLtWFcFHy+KQCrZ0RRhBH5rZBopF0WGDJKsDoKSyec6MH/hKKGIkwsb2RlrMVL33+I0nlgCwvWCNyf5xR74R5pO4mJOowGKiugpUQySEtwrFc8FYkGWdVtFkDmd1ksaL0cBsggnyKj307OmWcwxkhH4Y+vR0xISWhrUDNGiSkHHDm8IyTS7IgZfcTiM1jeQa5FWH0FEoPvsOUZkatziIq354qjJMdxZTwcueIH3fyhO1J/xaQQOf93eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiFnZQGSXcOViRbBNJ7tn3Qo5hszctgk56ZUFp6TTfg=;
 b=joU69nx/nKrlgzz5oteWDskQ8094wrDsB7ZkY0ixTn5Byb54/lqazuXtnf+u0aBpZTf/+A13gaXcp6nHC02e1U64Iho99OUB3D4K6kkLIytqax6kU19ZmKTL3c9f2aL7ILP+qUDgt/gNWaoei/IZgZ3drVf/VyGdZxKDW2ofWsgFyz4pHQ9HIQd0+US4wIbi9Gmtj9jFzxvQ25dJ7Ih9+u+9dvDVUYbg/2MdEkOwLYyqwbuseCfWQm2G6g3hxuFnBCzYb6CIjRqt9/x5WvPvkzxsRxf3jUvcTyNr5sMhMedslRzCpWvYku+4ZPn9TmZWNuj4XSKr17H/OilUVwFCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiFnZQGSXcOViRbBNJ7tn3Qo5hszctgk56ZUFp6TTfg=;
 b=dDjvKzRHC9nWYj+VUPbo8zy4DBGGw5qf2T499PXDhVOQAdb3T91jplE6InAHGjeIHfP/1gjoN+Esz2bGZoZsDwVIMzip0xK9oCUaEU8NUkEJHKDoqRbaRT11W2dgXiPMI+ur0RiSnRahK51sw4d+1W3VypRHVw010onL0TQ7zk8GE7kjrL9OGE+Zr9bjpBZDynbnWF6X+eS2up3jkhD8uvpxTnHlnQJ9i+bdSwiRmzdhhpcVCeYFPo/1NqkE0w0eYOXLAJV3ujfbMN6PzdAMqMdSJX9Ma8ksnXrc6xEaP5fNH7C0Y5qSofCUN8YUTZEU8jUH2eSQOe4wl7bFXPcgZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9586.eurprd04.prod.outlook.com (2603:10a6:10:31e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 06:06:45 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:06:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 21 Sep 2026 14:03:36 +0800
Subject: [PATCH RFC 4/4] regmap: debugfs: use the regmap scoped lock guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-regmap-lock-guard-v1-4-cdbd97b46074@nxp.com>
References: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
In-Reply-To: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0089.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a92dec6-a451-4efe-06eb-08df17a683f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|56012099006|5023799004|11063799006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+eeSICYHSmuVdFNx5kFV0pPqRxckA7lGMcsv57BLfosv31i6a4GKjfUfXbJJJnGwuEvFrdTGi7gzah+AlO9bDJaJ5IBSO29goAtv8pb7dr3E7t8DUgll62DRBEAuzO8fd7hsWNEiUjUQ565NKk5Z6fAX0Dcb9UsTj++C5pO9ryJjXSegMd0YA1KENF4Hqlcq58g+qpW0k0yODHWkvKpWsNei29yffMhl/CWvpNdj10W9dpeGRXI412+JFj9EZAoWhtzgnAnsqbePq9xCCuDa/XAasVxotEpjvf2hoiVNuviPk1muZHMFu3fdQ0aJDGM0DAxU/dLGFJe8Mp0DDBP3LaYmVRyKYcr5I46zUTY0GW2tnMGjCn4wzEhr3okBkz4mFAw9SlCDwN9eLmEJ8NS3jb0unHBk1KJGBhhPYJIYLHbnkrQWJJB0IT+ODNyo1Rytakf0QGbTMYvORLdl9NVNLManY40nT8b7Gn+PpfCZf5ek1D+6QsyeTZ698wKfKXKQCTw4aCKwjo4ZWA5nZf208utGWrMSNTzyyuAzCWJIODNSLV7faVlJCNoBPedAy2aq9/L3CfiBDFTQHchsU/dM1jb5hCQ7+E/vxuVzRTexRrxQhdzTmdGFBsXk5D5XsUcchXhzZVhjMtbh1K2wv8jrZYi1P2N0YewWRhkat89/VT8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFpkSmx0TS9TYWVsaHFyYkFGdHVQTjQwb1pDOUJBbml5TWdwbUdyQ2hjamFp?=
 =?utf-8?B?TnI0enlxY01WcG5TcG1DakpvVXJRaGVtbkFhc01mT3lBTU1HVnJjWHU1T0RZ?=
 =?utf-8?B?MDk2RVNrSEYrZno3K3VQdEROajBMeTFCZ01wZWpNMzd2eVZ2QlZ0OXpJK0R6?=
 =?utf-8?B?RndyMWQ5TUw3Rm9OVXh3UDhHUFBZd3VPZnFkaXAyNVo1enpjU2RyeWJPYnNm?=
 =?utf-8?B?Z21VYjVmT1ByTE9mb1phVU8xcFh1R3VrSE5IbSs1eWRYMVI1Um9HRTVVNkZx?=
 =?utf-8?B?K2ZDbDNRbGNwR1JJTzhxTlV0TmJDVGhwYXN3ZmY0Z1VsRWtrTi9IQTVpWlFh?=
 =?utf-8?B?WTZyMXFjT0FGREkvM3ZLa2dHNWEvRWVpWWIvcWgwcGE1WW83QndPUFNYN0ZP?=
 =?utf-8?B?emMrOVN1QkVSU1lucSsvaWhQR01kRy9RY3dPR3hRN3JBQjBaa2tnTWNhUEk5?=
 =?utf-8?B?bEhhK1lhc0Fjc0JSbUtyUytWTHNxMnF4cVlCeHZ6TzNWOTRHK1VyaUVTeFl4?=
 =?utf-8?B?UXFWbFhaVXNacG50R0FDb1E4MlA0a294Sm41K25PUnRXekNkM0Vxb1pKNTZs?=
 =?utf-8?B?SWU1Y0haWVFEZDRCb2hTZUJtRWtXU1czZHlsNGs1MS8vZlNDYWZBV0ZzdkhF?=
 =?utf-8?B?U2NmWUo2ZzcxdmVmN2hCS1crd2ZCeWZ0Ymp4Si80M3dlTENDc09yTDlHWlZN?=
 =?utf-8?B?dEZHeTVJOEg4djU2Z0xFVEo4OVAzYWdVQktRWldXWXdGaHRCWEVZUTlXTFBP?=
 =?utf-8?B?SU1VQ284bmJUOTdzSjI0L3NTR0dXNVA3RUFGMUtwaGRqd1p3VUVwT1FCMGtC?=
 =?utf-8?B?dDluaSt4NVJWWWZCYStiZENPaEQ1NGhpbTVIKzdwWmRZeittS2xrUzRYcGc3?=
 =?utf-8?B?QnlYaWRSQ090SEQxSlpoYktDTW9NenNVL0JtV0pQQWk5SGR0Z20zTXEwZ2l4?=
 =?utf-8?B?TVZiOWFqV3BuMTdvcHpiWm5xOWRURUR1bmdPNjhkSXZISzdlNGJrSDlSZjN4?=
 =?utf-8?B?andBb1V6czM5TVovYXd5cXl4OFFUY2pmeUtQN2hja0hHRktVS2p6VVB3azBE?=
 =?utf-8?B?a2U3ekdhbEFkWkxCcWFEMjdTak9iUjQ0RUxvaHBWTGNpN1RnZW1pNElGeDdB?=
 =?utf-8?B?ZW01Vm5BVFdTWmZtTU1oZGpvNGV5T2ZaQVgwNjd5dDkxWm9kQWl1ZHp6NVlk?=
 =?utf-8?B?WXN2dFVLRFQxY2VlL1ZnaVhNZFhsNXJSVkhabU12MW1MUjZ0bmdic1ZHSkcv?=
 =?utf-8?B?R01CUmxraGVtTEY0TVZFaFBwRXVQT1ZsajNIcnBMSFN4ekhhdGJDZW9saGdW?=
 =?utf-8?B?VWgvTDFwbmtRSklPU2lrU05YT013MFhQbEJwdU9MRG1FQ1NPSGgxdWcrT2tR?=
 =?utf-8?B?S0psbjVPNVlUNjBhTTRFdWRrZ2pLNklDNndNaU40WExUTitWOW01cDRZTVJx?=
 =?utf-8?B?Um5XZ01WWFF2aDU2Y1hkdmVKV1A2Vm51a1F2YWhJTGE1YkpQM29KaFlVaTcz?=
 =?utf-8?B?ZVFud0FzcDFnTnN5V1lxRDdsajdqTWtlVCtkQ1hjeDhsYkFpYW9pOXN3Zis3?=
 =?utf-8?B?cHlTaWh0bGhCenBjWnBxblFXdlVnVjBnYTBDRStldm44NzRtZUJuNDZGMExv?=
 =?utf-8?B?d1M5bmNRRkNFR2pnaXZRTEZYKzBxYWJmNVJkVjRrZHpqT3BzK2NlZ1NKTzlL?=
 =?utf-8?B?a2k5WFV3MGZaV05tRzhjZGJwTDFBRzgwMitLSFo4T1ZzR2ZvMC9rT2prQkRG?=
 =?utf-8?B?U0NsenU3aFNNWVdPZGdqYVJ5UDMzeGNtVno4bnlEYXVPT3ZWVzJCR0svR2ZS?=
 =?utf-8?B?Nk42aVZUcUE4S2VVSE1jUjAvcFZjUjFEbW5KWnBYVEo0OG1kSGRnR2FqS0tx?=
 =?utf-8?B?ZmR1WHFwblBaU2wxL2xRNERNME91b3c3eWUzSTU4OEdIWWQ3Nm5jZ2Njb2hw?=
 =?utf-8?B?bUFPUWwzUWVXakJJUG9OeTNPb1lwa25UVFF1VGR5NngrTWlZYmVwdUhFVHIr?=
 =?utf-8?B?SDBmcW1rYU9XcDBnMG9UN0JlNFBiNTBQeTNhZk0xbEo0NHB1amlMZXB2dWcw?=
 =?utf-8?B?WjVEbzJuL2F2aEEzVEoyL05mVEZKamhZTVh3bnc0YlpWdXdDUzgwV0FHazAw?=
 =?utf-8?B?ZXorb1pPOTI2Q2MxdmM1Vzl5Mm9hcFVYUGJkcVFDNGhPWCs1cjVLZkNmS0RJ?=
 =?utf-8?B?UGwxU3hLLzlMbk84cStKVjBsSlpnaVdMQmJTbS9UcXMxT1pUS2haSVRQQzZL?=
 =?utf-8?B?YlJ3aHByaE9odUVvbmptUHJxNGxWazFWdVQ4MFlMZTJWbk1FblZ6YU92M2xL?=
 =?utf-8?B?d0Jxek0vTW9wRmV4dXYyblp6Z3dLQ3l6c3huNnlOZEQrYmhudUhnbzk5UEEw?=
 =?utf-8?Q?iyfcaEQbioFE0dstHjodpKA4A1To53JN8VrAo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a92dec6-a451-4efe-06eb-08df17a683f9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:06:45.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvO9ADyj7ndmLVrh0Nwx771adwfkTZELBz0lV8btMvnhMapNPOUFbWFVMmrjPApwqV6ax/NebkOzZgQcb5Mk6+8C+Xj8MPRtETKKa1o/X5ssu/ImRqW95QBt0oyLEbmx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9586

From: Peng Fan <peng.fan@nxp.com>

Convert the open-coded map->lock()/map->unlock() users in the debugfs
cache_only and cache_bypass write handlers to the regmap scoped guard.

regmap_cache_bypass_write_file() uses guard(regmap)() since the locked
region runs to the return. regmap_cache_only_write_file() uses
scoped_guard(regmap, ...) because the subsequent regcache_sync() must
run with the lock released - it takes the regmap lock itself - so it
stays outside the guarded scope exactly as before. No functional
change.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-debugfs.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index 18f1c60749fe..ec207548a6bb 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -471,18 +471,16 @@ static ssize_t regmap_cache_only_write_file(struct file *file,
 	if (err)
 		return count;
 
-	map->lock(map->lock_arg);
-
-	if (new_val && !map->cache_only) {
-		dev_warn(map->dev, "debugfs cache_only=Y forced\n");
-		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
-	} else if (!new_val && map->cache_only) {
-		dev_warn(map->dev, "debugfs cache_only=N forced: syncing cache\n");
-		require_sync = true;
+	scoped_guard(regmap, map) {
+		if (new_val && !map->cache_only) {
+			dev_warn(map->dev, "debugfs cache_only=Y forced\n");
+			add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+		} else if (!new_val && map->cache_only) {
+			dev_warn(map->dev, "debugfs cache_only=N forced: syncing cache\n");
+			require_sync = true;
+		}
+		map->cache_only = new_val;
 	}
-	map->cache_only = new_val;
-
-	map->unlock(map->lock_arg);
 
 	if (require_sync) {
 		err = regcache_sync(map);
@@ -513,7 +511,7 @@ static ssize_t regmap_cache_bypass_write_file(struct file *file,
 	if (err)
 		return count;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	if (new_val && !map->cache_bypass) {
 		dev_warn(map->dev, "debugfs cache_bypass=Y forced\n");
@@ -523,8 +521,6 @@ static ssize_t regmap_cache_bypass_write_file(struct file *file,
 	}
 	map->cache_bypass = new_val;
 
-	map->unlock(map->lock_arg);
-
 	return count;
 }
 

-- 
2.51.0

