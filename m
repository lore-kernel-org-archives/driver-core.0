Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17253655C9
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 06:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970795; cv=fail; b=DN91/l5iPpAMRFV78FG8+iGEsQjlVWjnzo3D3XTwv7guVkgiZBLZOgPCz+ZEregKlvZXcSQArSSZuDgHzkFTs/N3BMm/RLYJpkD1oe4BwIzdwKT7EmEfz+rM6m4JsdJDrNyUl5aY4PD5KHPpr4AfFKN9MSm3pefvHFY1J7jou4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970795; c=relaxed/simple;
	bh=/ALLXukdcnnJY+hRAZp+pud+OoiL0K+DwVCZ81g8wWo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=is9TfWL5E8F972oe1MIEevLbqn+h+4FoeDEVDs64opOJ94Lv6luvfGwP/BTdAfnbNjyAzNxRqejjkqk2o0En+UkIg39rUV60pYtsGs4Ol0HovTCxQgvpiYRohyNe1xeG1eHqMG4IwwEZlDMdzffuQjbIUyj4GtHTgyVgRmwpQb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=U08AiKZ/; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="U08AiKZ/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hszNwUZwMdkc6tJCz2XeD8YDukxE9c4NL/wCWebMnlfiMKalb9aOw2Zsv4qazYcA4/HIgQqtNby+v3OW1h3+JzPxTVVhPJbTUo95v3U8Jgb4mtZ9YolQ/xUr8ZxfkS76MQRSUYWImqFx5RkkGgOGP5LKiSBnhbjunPmsaPNOqomHyNr8CzObDxkQBS8z8KTYZA7LXol8+YQlFRuOl90xIlDo+dQ9LyQFQX9ZCr5KD8/pYnZNGMdX/nlPfZ/q7hQoFdcRGnC4OfowTZnkzaHpTGpyj0zwaG87dAQTGnr7LAFI8sE1uxbzz8qlipmbtgO5IZ/i/ZVSudHu2jBNC1FFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZiOiZuaYzibxHw4vLnKIO1j3FrZDLfryW+44dGTxRM=;
 b=mg9wWH70+9H/xTdfq2uEnTBVtiQFiwBK1vfrI2SI6w8Tr1fCUoIN6RqYXaoGn7w1Mm9bhCCr6/CLKZoKfg7ZB6PJpRAT/gqWmnnHW6YO9qsY7nyT2+nC4P5NRzCcvC3lyZKYuintQLxl+6KOoTKDpkvgc6fTNH0VjNtyu+gR1JrQ7mGw70nQVdz7MRR3lNkGS9THukD/WCAJDuNW5ikDR9+y3xpGM9+Y71sue/lns6c0zBk/ym+ZKULQfuOQNRjuP3UJgU4ISKwqeKUmYC1GfaJDmEfdiwYDu26+qiV9W0TnEsW/Kr1wV6tzsggwwZRNHiMNm3b4Nqd/UxM2VAi03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZiOiZuaYzibxHw4vLnKIO1j3FrZDLfryW+44dGTxRM=;
 b=U08AiKZ/dmZvZnCcRf6uowd96mjiIruVYrDF/ik9wWvULuCP/6KzaZwLyrMeDEAs2T5GELeA6alURFD5r62+8Fwpja/K5PAp0FCWlKdUWHXNBtnhUzcUyK3cpkd1/k5OVFPWjdH7uAucDMh/A47KXBlcNHM4a5qkbEU7DxCKiqz1T309pCT/eXlEy+yts1sNZ4y8YTU12GWKRATqY2Kqgw3AOqMeyFBlFbz5F7vqjL7ROVUXzC1mEufT1Da1cR8dvjjzFjK4HVHJh8YdDePaRYN27LHi3ddDjm8nMVDPg0b5x8+ODOfyeDRlv5XW4AYrjwmIbG9+4Rsb6gxWY2DWxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9586.eurprd04.prod.outlook.com (2603:10a6:10:31e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 06:06:29 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:06:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 21 Sep 2026 14:03:34 +0800
Subject: [PATCH RFC 2/4] regcache: use the regmap scoped lock guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-regmap-lock-guard-v1-2-cdbd97b46074@nxp.com>
References: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
In-Reply-To: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0288.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2cff08-c93b-4b5a-951b-08df17a67a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|56012099006|5023799004|11063799006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NYIaGTv5f7YHT3HqqdNTo7dm27hB9xhzoPG9CudrDaHdWCwlNAHw2TFrVlunPXJqW1I6E7TXRfFnZ5uXjGwzPVJ8vwvpyBkj+nmKoTO4kB4XV+vEXShXCaPlX+i5tf/EmTmYQveHojITCndpm56scRm4CVSZ11yWIdZWqH2IzTQGpCfNTIuJzzVueJHsqg4J3o6wOL5HRydgJsPxP0VAKmv0aG/JQ/khcq0rqtK4mYDPfw4AD0RYreY2/jiwi4HLuh8V+mvMXXMBtainCzKA+HIo2PiLJn4SHUxfeTtB1StIlvrnRAtoJj9lVf7GaNC0NYWSKxvCnl4dnQ759dVt0b2mYQy08MIKLwlZO9iWo3y3SaD34rMJin9UUXE9lVHV1tcpv/PN6poQGPws2Ol9rqahKdPgVbtnj0wyRZvs/mvW+J2ZnuWbhU1uGRj8hfFXZWPaYxYHHg5lRzJm/xTDRpAwNtpe+WqPJeQn9rkiUZMA7igEI46nOLQJU9Y2F45DuQwn4Vqxp5iZ9tYrubZVzPQEO3ecrGn59ZJDaukdEvT2Ie5Y7B6lRe29gt6t5R88tvtLZ4dt/JgnBQVxQR5fQUIh1A9tW4L2/Lrn6Kf0BdHJQecw8wX0fk2xRzjXDb7jUAV+OO7b3eMqmpsLPds2sbEvD3+LuiA99AuZvZeDGuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0V4ZTNZdEJOQXc2N2JNSnZLQStVNTdmNStqb25oSERadkRERnNjMmY1MGJ4?=
 =?utf-8?B?V0hJaGFIdEFqY3VTL0c3cmI1RjNuQUpkRjRSaUhEN2JEbmlvYVJoUEdweWJj?=
 =?utf-8?B?aHRDQmdvekNvQWpvVm5qMko1NG91dHFlU0k4clFUTzhjWEFrQXpQQWl4citz?=
 =?utf-8?B?Wnd4SEhRM29mWXhFdk11VWhmYmN4bThrdCt0dnpuNVR5OTg0T01KN1FiYUdM?=
 =?utf-8?B?ajRwRFVWVm1ZNWFHVVNCQWtZL3ZCNk1meEs5bFdIc0libHpVSTJ5d1VqSDlB?=
 =?utf-8?B?VXRiaHlraWFCUlRlbFJlS29pN0VmZzlEKy9YbzIwSnY1NTZBbk9xaVgvNlpE?=
 =?utf-8?B?NzVhNXF3NUtNWlVNL0pjRHp0Y3ZxTDBSeVEyczczemduNWRYaVJXS05qWVA1?=
 =?utf-8?B?emNFVmZ4alE1eG0vejdvWThhVEdPemFWdzBML2VQRHR3NTFsTEt2UFNjdXlW?=
 =?utf-8?B?Mm0zRjhwMjRUUjVPOS93czlSclRRYldpUEV5YjlZT0hQZ1dDcUxnTGVRaE9x?=
 =?utf-8?B?UlZLeStKaC9pZFhWTnh6dk1JWWR5cFhMa3N2Nyt3dnk0dGN1amRSclVNakJw?=
 =?utf-8?B?UzY4TENJRGFWaGR2cHo2NXVRNUE5UUxpKy9sd2NQbTd3NHhEeFA1RWhoSDVv?=
 =?utf-8?B?Wnp3RVNpMTgwZ3lLcmZQQTY5emJ4VUR3aGRmcGMyNFJBQ09heDZXOTFvN25W?=
 =?utf-8?B?dGNUNTdXT2MrZEN3aVBqQWZ6eEhjUGtzWDhZV21EdFZ4bmthTHZkMVlXN0Yr?=
 =?utf-8?B?cDgxY3BTRFF3Rk0wSENDK1RCRHFubXdSSDdvYmJsL0hMeHZjMG04cTJwMnBm?=
 =?utf-8?B?TWFMNkRUZFhWMGdUTlRhTVp6QkpKV0Y1eXV2YStvdVY1RmNIcndOdW1WdHRi?=
 =?utf-8?B?dGlqczZTSG9CZUVNWjJMMjVxUy81TU13WHRnUE9vWUlCTEZUc3JaWnlsTW5B?=
 =?utf-8?B?U2xFaU5tQlJxczNEd0swbFMzVHM3MTA1Rkw1RkNDTWFqK0wrOE5MeEhkeDlV?=
 =?utf-8?B?ZDM1V2RHQytHVXl2Z2NtTGJ4Y0JRMWtDSkJJbzRTUmxCU1ZIRi9aRnVHeVUw?=
 =?utf-8?B?ZVlTZGY2eGlRR2lnV3FDOVo2L0hHV0phV0VCZEhLNGhKUmJyaXFVY3M5QVE5?=
 =?utf-8?B?VE5mVjd6cERaQ1c4cCt5dkFmbTBiQzdRNlVFQzNpSWlSam12dXMvRHFoZVJm?=
 =?utf-8?B?bkxjZ1lnUFFmVWFxV0UxbmIvN3RzRzJ3MUZrbksrWldzZkVneW9xNFRGN2dH?=
 =?utf-8?B?UWJSbEtEcndpRm1wRTZkZVhFUGdHdTE5bnNSTVpCS0h5NGp4UHNDWWRZTW1Z?=
 =?utf-8?B?SjlwVjljSXdZWUxCL29RL042QmFhaldZVGd0cC9TaS9IaHE2R3EyNG9JUENr?=
 =?utf-8?B?UWpjSlRIa0NuakdCeUFieGlYSU9waFBWdFlhRU9RditPcGZiTGtQTVQ4dFdU?=
 =?utf-8?B?bTExNmt6eFNpd2NTQ1MvTmFSQ2JWVDdnajczUWZTM0dubG9OajJGTTkrK0Q4?=
 =?utf-8?B?UXRvUnZTSGZWcE5CUFp0RkxGU2RSSU5QVE1yUUdrQlkzVUtsWGo2TnNMb3hP?=
 =?utf-8?B?dkdVbUlZbHBMdmEyTkFGSjRSVW84VFZEV1d0WEQzSURQZ0RqN0dwN3pvVXFq?=
 =?utf-8?B?VCtHWjFyWEtmV08rUzdocEpVREpuY3FFaG9zZUdIanplWXhqVFlhNnJ2T0pr?=
 =?utf-8?B?STI4eDUzOGJEQ1VYRERqOTQvdGwwZnJ4YlVEbnh5OGxkVFVNeEF1VHJNWnM2?=
 =?utf-8?B?bU9zanYwK1U3VkJKdXJ2eU9hQW85RVlzeVFMODVQQkxzSUdodUJyVnZoRk0y?=
 =?utf-8?B?R2hwZ2NIVkNwSGZpcmZIYmdVT1JZb2hhMzZjYU9lcm44K3pveFBpSm9qalZK?=
 =?utf-8?B?MVcrSUxLWEhWcTVHVW9hWG10ZThENVhhQmxxQ0dTRGNBemZqYW1yVHNmd2gv?=
 =?utf-8?B?UW91UC9vQzJOR1dYME1wejNRUTM4TWgzV3VjNCtzU0FnYkJjcEhNWDgwWDJi?=
 =?utf-8?B?em1jbXBkVXA4SVRBREtYV2JqdjBqbG9QR1g5bmh4L3JRZS9OS3J0MnhDWkJx?=
 =?utf-8?B?S1ptVUFmdjZqYjl2T1cxM29GejVMMlJnR2VOZy9qNm5VVjhGbmZ5cERMSk9O?=
 =?utf-8?B?TDJzLzducHFLNDZVV3ZyakVUcnFBaENhOEVaTjBpVW9oSXE5T3FqbmFUeTE0?=
 =?utf-8?B?UTBJMzJ1YWs5M2lySkwxTWRDZ0g0Q29Gd3N6VnBDMmkwZXdWelNvcjB6OHNT?=
 =?utf-8?B?ZnNtZnA1ZjloTVJXcVlTYnNPZ2ZsMk5tL05yeWhRa2pJUmRCZ0d5WUlPRzZs?=
 =?utf-8?B?eW9pREVndTBVU2pkYzh3Mld6WlN0V0tBdEYxVlI3NjBnYVhmd25sSW9pOWtx?=
 =?utf-8?Q?O3DJA4zXfUV+0i3kRmveLhtuV3gULZeXUThYz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2cff08-c93b-4b5a-951b-08df17a67a61
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:06:29.7483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8z3yFQU+XSdRdoXnPkrAilmdp53IIQYBmXhVaAKrEdFM+rZnDDKkJLrzOkcTsBS466KAqbxjxrU5UJe8cCLfngPGJuBM7br8YCEowW1Usl5Zn5kWP3sMypqNV7kg99Bh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9586

From: Peng Fan <peng.fan@nxp.com>

Convert the open-coded map->lock()/map->unlock() users in regcache.c
to the regmap scoped guard introduced for regmap.c. Use
scoped_guard(regmap, ...) where the locked region is a subsection of
the function (regcache_init(), regcache_exit(), regcache_sync() and
regcache_sync_region(), whose regmap_async_complete() must run
unlocked) and guard(regmap)() for the function-scope critical
sections.

Removes the manual unlock on the WARN_ON(cache_only) early-exit
paths and the goto out unlock chains in regcache_sync() and
regcache_sync_region(). The early-return paths still skip the
no_sync_defaults reset exactly as before, since the original code
returned without reaching the out label. No functional change.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c | 193 ++++++++++++++++++-----------------------
 1 file changed, 86 insertions(+), 107 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 0d58d900a2ca..ec9ed6ec3368 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -225,9 +225,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	if (map->cache_ops->init) {
 		dev_dbg(map->dev, "Initializing %s cache\n",
 			map->cache_ops->name);
-		map->lock(map->lock_arg);
-		ret = map->cache_ops->init(map);
-		map->unlock(map->lock_arg);
+		scoped_guard(regmap, map)
+			ret = map->cache_ops->init(map);
 		if (ret)
 			goto err_free_reg_defaults;
 	}
@@ -246,9 +245,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	if (map->cache_ops->populate &&
 	    (map->num_reg_defaults || map->reg_default_cb)) {
 		dev_dbg(map->dev, "Populating %s cache\n", map->cache_ops->name);
-		map->lock(map->lock_arg);
-		ret = map->cache_ops->populate(map);
-		map->unlock(map->lock_arg);
+		scoped_guard(regmap, map)
+			ret = map->cache_ops->populate(map);
 		if (ret)
 			goto err_free;
 	}
@@ -259,9 +257,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 err_exit:
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
-		map->lock(map->lock_arg);
-		map->cache_ops->exit(map);
-		map->unlock(map->lock_arg);
+		scoped_guard(regmap, map)
+			map->cache_ops->exit(map);
 	}
 err_free_reg_defaults:
 	kfree(map->reg_defaults);
@@ -281,9 +278,8 @@ void regcache_exit(struct regmap *map)
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n",
 			map->cache_ops->name);
-		map->lock(map->lock_arg);
-		map->cache_ops->exit(map);
-		map->unlock(map->lock_arg);
+		scoped_guard(regmap, map)
+			map->cache_ops->exit(map);
 	}
 
 	kfree(map->reg_defaults);
@@ -432,73 +428,69 @@ int regcache_sync(struct regmap *map)
 
 	BUG_ON(!map->cache_ops);
 
-	map->lock(map->lock_arg);
-
-	if (WARN_ON(map->cache_only)) {
-		map->unlock(map->lock_arg);
-		return -EINVAL;
-	}
-
-	/* Remember the initial bypass state */
-	bypass = map->cache_bypass;
-	dev_dbg(map->dev, "Syncing %s cache\n",
-		map->cache_ops->name);
-	name = map->cache_ops->name;
-	trace_regcache_sync(map, name, "start");
+	scoped_guard(regmap, map) {
+		if (WARN_ON(map->cache_only))
+			return -EINVAL;
 
-	if (!map->cache_dirty)
-		goto out;
+		/* Remember the initial bypass state */
+		bypass = map->cache_bypass;
+		dev_dbg(map->dev, "Syncing %s cache\n",
+			map->cache_ops->name);
+		name = map->cache_ops->name;
+		trace_regcache_sync(map, name, "start");
 
-	/* Apply any patch first */
-	map->cache_bypass = true;
-	for (i = 0; i < map->patch_regs; i++) {
-		sync_ret = _regmap_write(map, map->patch[i].reg, map->patch[i].def);
-		if (sync_ret != 0) {
-			dev_err(map->dev, "Failed to write %x = %x: %d\n",
-				map->patch[i].reg, map->patch[i].def, sync_ret);
+		if (!map->cache_dirty)
 			goto out;
+
+		/* Apply any patch first */
+		map->cache_bypass = true;
+		for (i = 0; i < map->patch_regs; i++) {
+			sync_ret = _regmap_write(map, map->patch[i].reg, map->patch[i].def);
+			if (sync_ret != 0) {
+				dev_err(map->dev, "Failed to write %x = %x: %d\n",
+					map->patch[i].reg, map->patch[i].def, sync_ret);
+				goto out;
+			}
 		}
-	}
-	map->cache_bypass = false;
+		map->cache_bypass = false;
 
-	if (map->cache_ops->sync)
-		sync_ret = map->cache_ops->sync(map, 0, map->max_register);
-	else
-		sync_ret = regcache_default_sync(map, 0, map->max_register);
+		if (map->cache_ops->sync)
+			sync_ret = map->cache_ops->sync(map, 0, map->max_register);
+		else
+			sync_ret = regcache_default_sync(map, 0, map->max_register);
 
-	if (sync_ret == 0)
-		map->cache_dirty = false;
+		if (sync_ret == 0)
+			map->cache_dirty = false;
 
 out:
-	/* Restore the bypass state */
-	map->cache_bypass = bypass;
-	map->no_sync_defaults = false;
-
-	/*
-	 * If we did any paging with cache bypassed and a cached
-	 * paging register then the register and cache state might
-	 * have gone out of sync, force writes of all the paging
-	 * registers.
-	 */
-	rb_for_each(node, NULL, &map->range_tree, rbtree_all) {
-		struct regmap_range_node *this =
-			rb_entry(node, struct regmap_range_node, node);
-
-		/* If there's nothing in the cache there's nothing to sync */
-		if (regcache_read(map, this->selector_reg, &i) != 0)
-			continue;
-
-		selector_ret = _regmap_write(map, this->selector_reg, i);
-		if (selector_ret != 0) {
-			map->cache_dirty = true;
-			dev_err(map->dev, "Failed to write %x = %x: %d\n",
-				this->selector_reg, i, selector_ret);
-			break;
+		/* Restore the bypass state */
+		map->cache_bypass = bypass;
+		map->no_sync_defaults = false;
+
+		/*
+		 * If we did any paging with cache bypassed and a cached
+		 * paging register then the register and cache state might
+		 * have gone out of sync, force writes of all the paging
+		 * registers.
+		 */
+		rb_for_each(node, NULL, &map->range_tree, rbtree_all) {
+			struct regmap_range_node *this =
+				rb_entry(node, struct regmap_range_node, node);
+
+			/* If there's nothing in the cache there's nothing to sync */
+			if (regcache_read(map, this->selector_reg, &i) != 0)
+				continue;
+
+			selector_ret = _regmap_write(map, this->selector_reg, i);
+			if (selector_ret != 0) {
+				map->cache_dirty = true;
+				dev_err(map->dev, "Failed to write %x = %x: %d\n",
+					this->selector_reg, i, selector_ret);
+				break;
+			}
 		}
 	}
 
-	map->unlock(map->lock_arg);
-
 	regmap_async_complete(map);
 
 	trace_regcache_sync(map, name, "stop");
@@ -531,36 +523,34 @@ int regcache_sync_region(struct regmap *map, unsigned int min,
 
 	BUG_ON(!map->cache_ops);
 
-	map->lock(map->lock_arg);
+	scoped_guard(regmap, map) {
+		if (WARN_ON(map->cache_only))
+			return -EINVAL;
 
-	if (WARN_ON(map->cache_only)) {
-		map->unlock(map->lock_arg);
-		return -EINVAL;
-	}
-	/* Remember the initial bypass state */
-	bypass = map->cache_bypass;
+		/* Remember the initial bypass state */
+		bypass = map->cache_bypass;
 
-	name = map->cache_ops->name;
-	dev_dbg(map->dev, "Syncing %s cache from %#x-%#x\n", name, min, max);
+		name = map->cache_ops->name;
+		dev_dbg(map->dev, "Syncing %s cache from %#x-%#x\n", name, min, max);
 
-	trace_regcache_sync(map, name, "start region");
+		trace_regcache_sync(map, name, "start region");
 
-	if (!map->cache_dirty)
-		goto out;
+		if (!map->cache_dirty)
+			goto out;
 
-	map->async = true;
+		map->async = true;
 
-	if (map->cache_ops->sync)
-		ret = map->cache_ops->sync(map, min, max);
-	else
-		ret = regcache_default_sync(map, min, max);
+		if (map->cache_ops->sync)
+			ret = map->cache_ops->sync(map, min, max);
+		else
+			ret = regcache_default_sync(map, min, max);
 
 out:
-	/* Restore the bypass state */
-	map->cache_bypass = bypass;
-	map->async = false;
-	map->no_sync_defaults = false;
-	map->unlock(map->lock_arg);
+		/* Restore the bypass state */
+		map->cache_bypass = bypass;
+		map->async = false;
+		map->no_sync_defaults = false;
+	}
 
 	regmap_async_complete(map);
 
@@ -584,20 +574,14 @@ EXPORT_SYMBOL_GPL(regcache_sync_region);
 int regcache_drop_region(struct regmap *map, unsigned int min,
 			 unsigned int max)
 {
-	int ret = 0;
-
 	if (!map->cache_ops || !map->cache_ops->drop)
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	trace_regcache_drop_region(map, min, max);
 
-	ret = map->cache_ops->drop(map, min, max);
-
-	map->unlock(map->lock_arg);
-
-	return ret;
+	return map->cache_ops->drop(map, min, max);
 }
 EXPORT_SYMBOL_GPL(regcache_drop_region);
 
@@ -615,12 +599,11 @@ EXPORT_SYMBOL_GPL(regcache_drop_region);
  */
 void regcache_cache_only(struct regmap *map, bool enable)
 {
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 	WARN_ON(map->cache_type != REGCACHE_NONE &&
 		map->cache_bypass && enable);
 	map->cache_only = enable;
 	trace_regmap_cache_only(map, enable);
-	map->unlock(map->lock_arg);
 }
 EXPORT_SYMBOL_GPL(regcache_cache_only);
 
@@ -639,10 +622,9 @@ EXPORT_SYMBOL_GPL(regcache_cache_only);
  */
 void regcache_mark_dirty(struct regmap *map)
 {
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 	map->cache_dirty = true;
 	map->no_sync_defaults = true;
-	map->unlock(map->lock_arg);
 }
 EXPORT_SYMBOL_GPL(regcache_mark_dirty);
 
@@ -659,11 +641,10 @@ EXPORT_SYMBOL_GPL(regcache_mark_dirty);
  */
 void regcache_cache_bypass(struct regmap *map, bool enable)
 {
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 	WARN_ON(map->cache_only && enable);
 	map->cache_bypass = enable;
 	trace_regmap_cache_bypass(map, enable);
-	map->unlock(map->lock_arg);
 }
 EXPORT_SYMBOL_GPL(regcache_cache_bypass);
 
@@ -680,12 +661,10 @@ bool regcache_reg_cached(struct regmap *map, unsigned int reg)
 	unsigned int val;
 	int ret;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	ret = regcache_read(map, reg, &val);
 
-	map->unlock(map->lock_arg);
-
 	return ret == 0;
 }
 EXPORT_SYMBOL_GPL(regcache_reg_cached);

-- 
2.51.0

