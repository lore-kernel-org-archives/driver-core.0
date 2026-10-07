Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44365496D53
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374857; cv=fail; b=IE06WJhvhtUlFAEljeP2CabmW2eB07CeVeZVdNO2yoJBCPG9So2I/VwybHIwg9BBkL/cZgdGPdvO38ijPAm8u1K6wFbbXNWNrjO2AneUIcrZoWuGEWZ/mr95ZWjo1yb5rl9ZcEVpGPnKEE+DmshUoSxLvv9RJOqTgJw6pasnYs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374857; c=relaxed/simple;
	bh=oiktoNQkD2EKDPMr2Z4Kbq3xflzqqkiUbMaMOpEkf4o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HFaESfuD9miFAG1wTSIARkthiVpT3vRkwUYhr1aAaiAQdo8o6hbDqq7TzR90PFDa2BCzVKvi4/Us8F8fjWAKwoshCQ+MSb7HqqDkX6bbKGLyBN2ihMadv9jwvBFFlMaQG+N789bu6diyFcS3MCAnKmFrJICZMM2+DK1jAq/Uo6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T5isXyYG; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T5isXyYG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NV2A/VF73bIeND3TE9nGgcI0/Zy6ZqhF0cXrcEX3UKdPJ2Jyeb9uVrSMCRm/hcYWZzxTKhR9SyvOi4TAd+5GsBlrftmXzgM7cnzr+n1em4mD7H4aGV+EV0drz/6sUgL0LlJ5DuuOO3RYT5AYjTtW4Cj07/NsEC4G0sn5iFss4UUkPVN3fVbvkJ7+bqcpsD2EXDJJ0hX88x5tOHIhGQmO4v5GVeBckg8gwBRuCX40lwjhIhgNV2svfC6S574Dh4eJYssWpkmXIsMTr+/e7wP6/dT4S9KDrw+AW/NG0XsCvFw+c0NU2JIcUvXKas3sonVRwqObBGOB5QbQKpOKRJzf5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9JHuyMeymcIkNSx/WVNQpMTFXWmiB2b6I+HUytvPg8=;
 b=hGpEm2DdfIya+lVhGY+NJ6YQMJ5GcWG5vN6ZM4L41IitPlm43DoQeFc5s2FzmPpH5UWUBZ6sVo6iPjb4jm8cVCivMY+GFeydF9hEwdPLPgFoCPNlLTJTe9XcvZNGXVq0pObs5Ret7khBWLf+k0Tcvy8ISSuErTBikf9LxZ+MCmo3ipJgxLwK3SYy0ytvmiQSoEy6Lf3rmuWfWiN3qDBswmwGPrGVEZzzv92nx4n4I1vHMZ1+0I/tWq3jIbXuGZZ4N9o78xZawzvlSnry8zNdxILUwtKP+oA9fk4t31bwQydt93dOvi7JEuYH9wIPabnHVjizZ0BaBZjXo9s6yqQTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9JHuyMeymcIkNSx/WVNQpMTFXWmiB2b6I+HUytvPg8=;
 b=T5isXyYG/4EeIQVaeKWwjxYXd7vvXJ8SEdbOLVSEns1bDZCnHN/Y2HYmihV//hi00ygrP1as0KJ+7tK2Cj8wPZBLjXcsmaOfZH/IqusuaPndsdIfTDviWrFz29zLzVlEnQ+Plb6Lzvl2FUA7oRN6LEko82NKxrjznTwW0yJ0FMeYX603A+vYgDNkiXm8K127Uq2C3uZmW3Wj24G7vDsbAE7TWvio3BdPbS3y5dAEhmGvMg5HhRSDUm/NrDtT57AeTkrv5Xy0lyFkdIq4pEexoTGDp7l+M4Eak/mFUQ+pJkcjWJcTEFZ5jfaDiNqzmROwc+apVAQVmGYqr1BuIO/ugw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM6PPF8C695F6EE.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a90) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 12:07:06 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 12:07:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 20:03:59 +0800
Subject: [PATCH v3 3/7] regcache: simplify control flow and reduce nesting
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-regmap-lock-2nd-v3-3-0e590c4125be@nxp.com>
References: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
In-Reply-To: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0233.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM6PPF8C695F6EE:EE_
X-MS-Office365-Filtering-Correlation-Id: 945d1c59-2b71-46c8-8276-08df246b8175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fxQDnuYXSrJHe9UiJpKmCxaEGs9lTU12Sn8V2xm9s721JBwlUGQrF6b/T8aURnl3wUoA4shSGERdhuUHlGpYnMgV0Ft6Jv5YLyW4sV8ALYL+azEBuyy2tzz6Thvy+cWARzgNEpaF3/a9aHqxN89a7IE7MViG5mxs6Lp3sCHYebLF5kbcDR/PpI84xiGDjcB/xZ6JOfdiLveJZMT8Pl+ruLJKSt5ktDPnbWtRnsudv8D52JWvesSDED6FTMVYdTTdvD1mVy7WeX0CqRDQJDelGMv+GR2VIswf2e/Y4pzRuK8VCzYolmyhFRwQ2qZoAj3/igISB8c52oZheG/RVjkeFT0Dtaol4RcepzkNOQ9BFbBZbzalCTxOxSEZxZog03cJs3OJPyaSBaymOuC4EwQgyV+ZlTSFriByV/o4Qs3/aURpbONmiaoeq3dLhoJXDbLMYRxauzk1hRm35Bj7dv5Lr4KkYTk2F/4Aj8qntJ6HmxTZK15MXVHrXHFqF3KEXov76D4Nl2lIL9VqpYwIhdhZmnltkxw5BUA94HdwntvAvFTHofWwVtV0hpb1n1AYZo/JQvxj2mDWHd8QJi4620FPfPEe0jzwsv1ARzJtjc5wY0bpOHIaVte1MCGuDUQqdUdVGUt6I+T6XIav25adxIjCZ+HHVC+ZrrDC4XobPXrTo8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHJydnkycTBCMEFKeWg4cmFya3BEQ0pFQVBPS3NtUm5YT08zOHhNc3VIbFVw?=
 =?utf-8?B?ZEdDaWgrNVBwNnQyenF0a1RFKzdoQTVCRDhlRmZGellTblR5V1lkR2NsSkEx?=
 =?utf-8?B?THNkTEphekVFeTJWMVNBSGVzVXQvdUQzNDVwWHB6eW5pcCt4T3FCVkJ1cXZ1?=
 =?utf-8?B?Y0xsOUdQVC9KV3VzcVlxNDZLcnpldnk1b2RzdUNBUEI1amJqSyt6VXZNVmRQ?=
 =?utf-8?B?a1QwWkRyLy9ZbjRaMTRLb0NNMHBHeTRUTDhnL0EwUXF5UU9ydERRcXlQYUlJ?=
 =?utf-8?B?alA3SndQRkdGb1k5bTZuc2hVR3JPbmFmNTlZanZZOHI0bzYrcmlYdHpSdmdK?=
 =?utf-8?B?MUdaUUkxcE9sMHI0ZTZGRnM5QzV2R1F2SzllRG9UTWJpNjhaMUZZdG8yalJG?=
 =?utf-8?B?d3dmbWFzczI5d2FYSGpqM1U5cUJmMmpkUE83NW1WWllmY1Z1M3FPTmdEU0Yv?=
 =?utf-8?B?TERBOXhwbFJpWDhwejU1bFBhMjlvZWdxbWV5bXoxMXQrbGJLYTJyblVLNkhy?=
 =?utf-8?B?amFISWdQSDlWR0J6NERDY3dnNGMzN1dUV1M3RFRCbmNJUXl5WDE5RjRhUGto?=
 =?utf-8?B?NkJRMTc5QlJzcDRMU2FYOXh5S3NHNlZQb3ExdW1HVFhzdEZ6L1RtK3hrR1Z2?=
 =?utf-8?B?ek1pK2gyRjN0b3dkc0FPOU04RFBJcStpdjN6a2V5S3pxcFE1bG9vOXBLeG9n?=
 =?utf-8?B?OC9yUnVNSVoyS01VbW5Kbkd1aU5YVHF4bGZ4NzA1WEFrMS9lejRrV0VxWGsv?=
 =?utf-8?B?WXU5bG9TdFdPdkF6RUszbC9ob01VU0JscHJGM041TzF3SjA3K0k4QmVSVFpu?=
 =?utf-8?B?aVNnZWYxQnQxUHM2YVY0S2NRNVEwaWpwWjRqTEhVb1paK1lTTUtydThtVTNH?=
 =?utf-8?B?QlVibmZXdzNVWkUrQ1N0d1NwNW9jUjNnR2o0TmNJMjk4VGwzQ1loZUxRU1da?=
 =?utf-8?B?Tm9FQ245UCtUUUlML2lIT2UvSGcvZXRpb3hCSU5JT2hERmtOeDd2SnQ2V2N4?=
 =?utf-8?B?cmhhd2xyelIyeFdkMnQvT3pKTTU4TksxeEZmT1BYaUdjZGhDVTNKZ1FyOG9N?=
 =?utf-8?B?T1hNc3pObHR0QnI3Zlk2ak16MHhSTStCS0ppeGlDZjl2akhnL2ZySHdRb29q?=
 =?utf-8?B?d3dENHV1TTRTVW1FSDA0RkNsblRiVlhCS3VDVm5LcDhDR1lVQUthRHAwUHM2?=
 =?utf-8?B?aWdJcHlPUHdkcitpa3ZxQTE4bUNtSi93cTVTVGlWZTdJNFhuQXpqcU9HeGRL?=
 =?utf-8?B?QzdDQkNUY0J5MGNaK1dKbnhTRUVpV3ZuMm5EVEpSZHh6OTFMUFcxMkpVZEhC?=
 =?utf-8?B?ekZtaW92aHpMTW0yTTRPYzRaVjZCM0J1Q1IrUGpJb1RmS1VjK1BMZTdZTDda?=
 =?utf-8?B?REI3Z1FSWVNLcTBSNnU3cDVGV3FLTUplUmY5elhwVnVwODJjanY3c1NsYVl3?=
 =?utf-8?B?ZTJQQlJXbkEyL05XUStUUUlweWFJNWMvTFdVazJscVlsOXdLSk5JQXBHNTVB?=
 =?utf-8?B?ZVh5UFFSanZPdmtNdlg3ZnNVM1U1cGYzd0E0bHRXdFAzRWJHTVc3ZUFScFlH?=
 =?utf-8?B?U1ZFVVBTV1lYQjZPMmwvVHUwMHAxeUIzKy9LWUlaL1MzSUdGbjRaL2lxNHFI?=
 =?utf-8?B?TGtMcU9Ca0h6Sk1JMStRWTZxbEJqd3NkamRXUDdUS1FHMWtxNVVZOE1MTTBs?=
 =?utf-8?B?Wkg4aXVURnp5M3U0Z1o3alF5QzhuNDBZeXhXaS9nQjNtemx1YlNlcStvTU81?=
 =?utf-8?B?bXJPakMva3hhcHJYN01CQ2Z1STJwTG91bWZCL3poL29kNXdtam44alFUa2M2?=
 =?utf-8?B?ZHUvR2JUL25zdUxWWXdCdTE3T25Jb2tBODZwSm9wZmRSV0s0eFFKNXh0bjJ3?=
 =?utf-8?B?eFpLSXpZQ1dGMTJPUWtnTG15U0hIQkFoUGlvbGNpVFh5eUtDdHd5WWN5ZEp4?=
 =?utf-8?B?NjAzZDhCWUxPOUdmMmpobHZBbFZxNHRSR1RsbXo1T3ZvU04vdGlZcHBzV3lP?=
 =?utf-8?B?TEhTSnRBWnpmVGJZM1E1UmR2MHEzSHZnR3E0M250elNsVSsvQ1VacncvY2xG?=
 =?utf-8?B?Yy9Kbm5FRzIxZys1b2pESjBTTXdNSmpPZlFkTG1ULzZwZ1ZqWEpBTGQrTVN5?=
 =?utf-8?B?djBjdkVCRmFXRUR2R3h0Vk9zOWJwWFdaRnJtL3huRnYzYmY2S0VaUVlGVHpu?=
 =?utf-8?B?SHJ3RHcydXNNZmpQM0I0UW1va3VFODZjeGhqTHV4R0tnemovYStuV0o1ekto?=
 =?utf-8?B?QkZkVDJ3akJwUWozYXFxNE1mR3VOSElubWFLMCtYTFlySDJJTWVXNDNkU1px?=
 =?utf-8?B?T1hpd0lzSzJNbVFsRVl3L3YyNG5UbHFOZ3pmbi94VUJTdEZRKzBRWnk5Z0VZ?=
 =?utf-8?Q?kYBCC1xOtB+94XPDp1Zb0f/EXBOvQmGEE0PEp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945d1c59-2b71-46c8-8276-08df246b8175
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:07:06.3079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIOkxqThjfOG9RSY+2iiYA+TVE6RFUms1/y2R4yxtHx1Te1VABrlCqMRM+yYB6AntfsM9lem+gwtTc+LUJlZW9DurM1K85pp0SiJmXcSoSIWYLLuSiJKSmGEoylbkxeG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPF8C695F6EE

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

