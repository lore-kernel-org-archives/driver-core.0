Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38B1496D4B
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946865; cv=fail; b=nlNeOwMD9P1+s1zi44Jf7BOdIHq/P7yb8dpFWpxX9ZwOXq6nxAV/Wn1tOa6KulX2cuumZEhbyNCiEHwghkQRsjfu2zoQuUK1Pcn4Dy0izjDHQtTXkBqGsysMROR91TSUqssxzqb2lc+JYuOoFOY5Ri5GED6FM6hzW7O1T8IOVN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946865; c=relaxed/simple;
	bh=oiktoNQkD2EKDPMr2Z4Kbq3xflzqqkiUbMaMOpEkf4o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PORwUHQfFIvUXwiSrPxRj0iuzJ4d4uGgpaDY/naGrnExOp5MDq/qFYWxLgkoTegITNwusGjsLpNqQoIRAHcw2QYsZ+F69yA6XpSmXe4mBcZNQqLDWtIXCg4Otzu070eeb6bFVsVU4WJzn2hqVdSVLKDER/Luz7jmOcb9CjyUVQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EVXPPUGw; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EVXPPUGw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNfKfdobn6KqSBxom8jfxrXx6iQzqESwTdJMQzd+YttTM+0xrtPpZIYwetLHF5cQBwrcN4oNhy2TIwh61nWcXRp7xc/EpLbhUsyXwfQpIE47wz3ZxUDj7PjOal+IfCNRnnXGzOm2Bzs9L8EpUKAR7oWUeLwF/DgrUYMThURIFU9yguo8NnMwEvQhgZmzvvDoqJBODAEwenXXCTdcNWbnDkWeAU+f9OOZIgJx/V9Q1lWbmnxAnUX67bTeAAdLDpD5733ZWg/fcajw7tOx+82pniNXTar0pl/KUrCsYNgR7Cc29J5P65hOeIGCNLfAChtQIeliJuVqZwIAbaVbysNtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9JHuyMeymcIkNSx/WVNQpMTFXWmiB2b6I+HUytvPg8=;
 b=POgFYJveXDg+FOR9C2dISWVaYRBW0yu+xlyvv/dFG01Boa8ATo9UXENoLJiuB8ps42qUaWEOSkBT9NkuzMRjcc4k0FLAuKp8ZB6lYEhV6TowkvLZsW2XNdLzHV27GmP+sAI6PVtTLs+wc+Hf6ktYGUBYufh5qwlAahrx9gnbdaZ6DoNRttF2fez++D8kAONOHJAE7PV3caXgD+CBRK7zT65xo8EpxJ2MInr0wMv1RG7dDMUZe5Ixl934YSbNnaIqMI1kzpVTJZ7mKwi2ig659k5zViEkZBp3ozog1zISbUqgQSTUXmgTKmOeioNbFdYMzvZbhGkGa5UPP/fWASXPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9JHuyMeymcIkNSx/WVNQpMTFXWmiB2b6I+HUytvPg8=;
 b=EVXPPUGwTpqMgP8gcUoS6z4gP5BYvLRFqfe/5kTQQ3DN0HFsrZmWootv4xxLWYbgNdy/Kp36m26dYhK5N+8dTotriMpVYxOzsftHzQA4BDNnHdJaIaC+b0cXw6GpaL+CNKq3KEwNKzfL/5nbfeRFOZobBSAbr5YVDuu6orZa1szM9wcWFKPhdIiQ9EpGMt0IteNc//7BoJpSwU4Jtt7yMikdNT49EfYhRuQ+DEz6kwjkGcLh+XgP3t2fhc1h4uLTj24gm2Da3RgcKjIGDFS9m3lNVz1/NSVmSN4gfn6VV9TK50FxSVR2oF7MsnMIlWb+vhhkBiay8kJKg5TG1sqA/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB11008.eurprd04.prod.outlook.com (2603:10a6:10:58d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 13:14:20 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 13:14:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 02 Oct 2026 21:11:19 +0800
Subject: [PATCH v2 3/7] regcache: simplify control flow and reduce nesting
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-regmap-lock-2nd-v2-3-e172b0501c52@nxp.com>
References: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
In-Reply-To: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB11008:EE_
X-MS-Office365-Filtering-Correlation-Id: 9796f83f-cb02-49c5-be83-08df208711ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IgM2wJz1aQ6uCzj2K+ek/1tMG0/zrf4M+muOVm029Ed6/ZWucPI67GJO9fxkfl8KsMgO5d0voV5z8jLpK97HGKWXo2rm3et7PuJZcZkOxi4NRMVwGxcmuCE9+aJugI1/TcBV2TW0emTPkhgflhpZeDjsNk9UU30rbhDuNtn7aPPUL8jTDHB0m5VhlA4koe7JGE0XF1ivYbaXKelScOvwof3r+q177V4F9eyBVUpmwUyOtBmKg/LhNPVGVWLIiAak8jCKm2sE0016JMNClT0IurIThbBRF1cWeqG+9VsMI+mg1NNDdGu6QED1BtBAem2vlrqClPDx3VovMh9qsguG7gCWq6WKcb2SHZfpn0+sCQqWnBHpB+EBZoK9zg0KDb2wlrWnhWcHMGWqiHLco49MJ1QFnfaoulq+B+weuG3r3DfD+5sAKEqd5deSBhNHL+CWdZFNe0Kqw0xIMCWYowKloEMpoqO6FqBsALc+r6jnf0B+SRveucCdFtpmuIJZ5aarWzCgIYKnlt2nUK+t646HY/cMBdWymrl54iC/MT8Bb1Dt18g1f7ZtoCc/XMwvrmJAhvFMR6gIye4QPJiKxfQltARUiKQcIm57yusABcH/yiW8rwMyXLZhDCFr0LNyh8HatQQDNBhq/PoVleXS4oaEfk38n2WucZ5yHeqi6dVbQFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVdiZk44UDdvK3BHNE8vZENXOXJGZGl2MXZMUVlsU0prYmU5MUYxempGbFlG?=
 =?utf-8?B?dTVXRDh3OGpicDJ6NFprWUVMM3VjRWtwWXR1cytFMjVjbGVQLzNiRmw4OHFY?=
 =?utf-8?B?QjI0SEdEUUFHR3NYTFl2ZHhLRmtMUzYxUWhwek5sdG9yVlBVNlFiYWhiV29N?=
 =?utf-8?B?TGhXMVAySFZtV04vTDJFUjQ5Nml2T1VDNEE2OVdoSXpFRjU5NFJLeTlFMUdh?=
 =?utf-8?B?ZHprMnlSTW8wUGg0azAyUW1XTUhhNDNVLzAxNUVrbTBGVFhWY0lNYTlIWUty?=
 =?utf-8?B?dUphMzdnTFpJZUZsdllwNXl3VyttVGN1UjN0TC9Uc000NytxZzJhQTFGOVVZ?=
 =?utf-8?B?dVhlakJvcEkrbWJFc1VsbUZ5Zk5uNFRBcFdyUlRmUTRNTThVb1dxRHlKSVJ3?=
 =?utf-8?B?Z2ZjY2RMcUV3RmNmU2U4c1pINzRadjllejZVMG9NQnhQYWhDM1VDdFo1aHR4?=
 =?utf-8?B?YUV0dmYycW94QVIrTUFGbFExQ21QU2RFNHpFdnJSRWVVbXA5NUV4VEY3dFM4?=
 =?utf-8?B?Ny92bDhrcGtOdDhwbTl2ME5ydG1jcXlFYVV5TEJ5bzhZb1lwM21INDlTTTd4?=
 =?utf-8?B?cDNMZWNIemhTZmgrS2VTRDBGL0pYNUU5VW10Um12eUsxczQvZ0ZsV0l1QXpV?=
 =?utf-8?B?U3JIUXZnYkFRZ2xEQ1JIZE9EbW9iQ0I4LytjTzdPa2dqcVFJRU5CZkVra3R2?=
 =?utf-8?B?a2R1Z0NuUC96S2ZDeUhscHV2WEZJV1BqM2hhNTFjakM1SVgyYXB0REJvVEtn?=
 =?utf-8?B?WmEyYm9EMmg0VDAvdGhCNHc2ZzRraWsyTE02bGZQYUVTTWlkRW00Y0NVZlVn?=
 =?utf-8?B?RnFwNU9MdktFZjI0UmVRaEtZajVmV3QzNzFpV3RKS2xkdFY5Q0xTSzZrUXp3?=
 =?utf-8?B?MFdNdnBIc0JQU2lyajNkMytKUHlLaFR4dk16bzE2clB0Zy93Nng3Z0tJZW5S?=
 =?utf-8?B?L1dQSGg3a0NUK24vSmVoUWxOWjQvV0JHcFEwbDZRZW0rTzRwaW94R1JEVDBK?=
 =?utf-8?B?YnJScUlqZnBrZitqNXBjbUM4Slhrb3pwc3I1LzlKM0xOamJtWFFaeERSVTda?=
 =?utf-8?B?ckJlaHpZOGp2eGlNWXp6akVBcjNWV1p0OUgwTEUzQzN4cExFb0w4RkVTdzVy?=
 =?utf-8?B?TjZnZ0N2bkhtZGUrd0d6SGRISXo5U1NzZk05ZWNyK2pjckJHajB3OWdhMlBL?=
 =?utf-8?B?ZXFCejdQVnZXME1DVUNmVTlBejVLYnhpZkxmTitWSCtQZGhOYUdkU2Y1bXZs?=
 =?utf-8?B?ZzBsOGc3WElhc1pQeG9XbWZBZzN1aGxlMWNvVUk2MmwzMWZvZERHWjh0OUJn?=
 =?utf-8?B?VEZ2Y3NzQ1VxeWoyaWZXZFVyS0F0Sk5CbTlZcldlZnJqU2JleFI0UkdHeXpw?=
 =?utf-8?B?MXBmYzl1VlovY1NSZ1ZOeG0zVHBhNzhIUDZudmJzMCs5OVE1Z3dXaDhIR2hE?=
 =?utf-8?B?VTZTUGE5dENnZzkxZFZFaDBFZ3VlRFJuanlqelNSYVJsYTVvUHVlTGx5V1o1?=
 =?utf-8?B?OXh2ZHowMnp3Z2t2RGFLRkliRDl1eWdlUCszWHVGRnZIQ0dZVHZXZWZ5Smhy?=
 =?utf-8?B?bW9wN1R6bXlxWTlHSVRDSC82UkczZTRrY2NsY1NpbDVZR3h4MzRuZ0R6Vkpt?=
 =?utf-8?B?UUljVTU1bDhKeGVWQkYxeTlIVGVOTW8yb3lPNHlPMGloSVdxK0dZdVMweUVC?=
 =?utf-8?B?TE5lbWVwN3crM0lGcVVJaUhWSU12OWFlQ2hEWDdNRUtjSVZLQmQ2Y3VVZjdr?=
 =?utf-8?B?UHJWTmkyM3d3angzR2YvVmpOVFpPalU1R0FYaXd1TkxGVGJSdW5YOUNnNGhk?=
 =?utf-8?B?cFEwdjV4cWhON0pxeEMyYnp3N3o1N3VkOFJZekxZd1AvQTNxaFg4WVdML0pm?=
 =?utf-8?B?Q2swVGlLT3Z1dktzbmRKTjBsTHBNMndnQ3lhMFhzZ2g1SjFZSW5JeHVHV3Y1?=
 =?utf-8?B?RW9MZWptY0dEMGphYVNTRWl3M094WDBIaHYxdThadDhPeUIvcjgxeDM5aU1i?=
 =?utf-8?B?QVJWU0xGZXpSTkpwWlgwVEx3dW8vOHBkWnQycHdCcXpSS1BjempVSHlJbkhW?=
 =?utf-8?B?ZjdTK0RBdUo0alZ5d2c5TzAxanlqTXVTOWZjcitDRmt3NTdXT082Zlcxb2Na?=
 =?utf-8?B?K05XVVpRYmFkMmNXZmZjcFZxdWtMS25vV3Q2VkVFbSt3TXJBTC92cXJOclgv?=
 =?utf-8?B?MVNQU1BrMjlDeVdmMG01THdPMXJmWG5Pd3pQS3V2RXNWS3NTdEVYcUhNbnc2?=
 =?utf-8?B?S1VHdUZoVUwxZ3JHaWFzdGtlaTlSMVpYQlNqZVZNOEtZenczamVvQzA1cGpm?=
 =?utf-8?B?eC9DakNxSkR1QnlnREJyMDU3d25CbUE4bU1jNzA0WTE2STcwQ1c3czlvRk9t?=
 =?utf-8?Q?IGY6ShvD92Wg26IaULm+vI5EkKWmdqo5XaFo8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9796f83f-cb02-49c5-be83-08df208711ee
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:14:20.4390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfF3yfPL8fX8T+z7NNUnw95uHYcSB/956Yhb129hqhFsut4ORmBYZwTumSByGhVcXSURAOpbQyxBffLAQVijoGluPvrofH2AYlqCepr0wSLi9YrV3NfzpeG6qlKU0sN7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11008

From: Peng Fan <peng.fan@nxp.com>

Move the count guard into regcache_hw_init() so callers don't need to
check before calling, and flatten conditional blocks that wrap a single
call by using early returns instead.

Merge the two separate reg_defaults / num_reg_defaults sanity checks
into a single expression, and drop unnecessary else-after-return in
regcache_lookup_reg() and regcache_sync_block().

No functional change.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c | 50 +++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index b486cd826b3c..136d6adf3120 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -58,12 +58,15 @@ static int regcache_count_cacheable_registers(struct regmap *map)
 	return count;
 }
 
-static int regcache_hw_init(struct regmap *map)
+static int regcache_hw_init(struct regmap *map, int count)
 {
 	int ret;
 	unsigned int reg, val;
 	void *tmp_buf;
 
+	if (!count)
+		return 0;
+
 	if (!map->reg_defaults_raw) {
 		bool cache_bypass = map->cache_bypass;
 		dev_dbg(map->dev, "No cache defaults, reading back from HW\n");
@@ -174,15 +177,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		return 0;
 	}
 
-	if (config->reg_defaults && !config->num_reg_defaults) {
-		dev_err(map->dev,
-			 "Register defaults are set without the number!\n");
-		return -EINVAL;
-	}
-
-	if (config->num_reg_defaults && !config->reg_defaults) {
-		dev_err(map->dev,
-			"Register defaults number are set without the reg!\n");
+	if (!!config->reg_defaults != !!config->num_reg_defaults) {
+		dev_err(map->dev, "reg_defaults and num_reg_defaults must both be specified\n");
 		return -EINVAL;
 	}
 
@@ -215,9 +211,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	map->cache = NULL;
 	map->cache_ops = cache_types[i];
 
-	if (!map->cache_ops->read ||
-	    !map->cache_ops->write ||
-	    !map->cache_ops->name)
+	if (!map->cache_ops->read || !map->cache_ops->write || !map->cache_ops->name)
 		return -EINVAL;
 
 	/* We still need to ensure that the reg_defaults
@@ -266,17 +260,17 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	 * we cope with this by reading back the HW registers and
 	 * crafting the cache defaults by hand.
 	 */
-	if (count) {
-		ret = regcache_hw_init(map);
-		if (ret)
-			goto err_exit;
-	}
+	ret = regcache_hw_init(map, count);
+	if (ret)
+		goto err_exit;
+
+	if (!map->num_reg_defaults && !map->reg_default_cb)
+		return 0;
+
+	ret = regcache_locked_op(map, map->cache_ops->populate, "Populating");
+	if (ret)
+		goto err_free;
 
-	if (map->num_reg_defaults || map->reg_default_cb) {
-		ret = regcache_locked_op(map, map->cache_ops->populate, "Populating");
-		if (ret)
-			goto err_free;
-	}
 	return 0;
 
 err_free:
@@ -762,8 +756,8 @@ int regcache_lookup_reg(struct regmap *map, unsigned int reg)
 
 	if (r)
 		return r - map->reg_defaults;
-	else
-		return -ENOENT;
+
+	return -ENOENT;
 }
 
 static bool regcache_reg_present(unsigned long *cache_present, unsigned int idx)
@@ -900,7 +894,7 @@ int regcache_sync_block(struct regmap *map, void *block,
 	if (regmap_can_raw_write(map) && !map->use_single_write)
 		return regcache_sync_block_raw(map, block, cache_present,
 					       block_base, start, end);
-	else
-		return regcache_sync_block_single(map, block, cache_present,
-						  block_base, start, end);
+
+	return regcache_sync_block_single(map, block, cache_present,
+					  block_base, start, end);
 }

-- 
2.51.0

