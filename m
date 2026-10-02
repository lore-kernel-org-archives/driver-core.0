Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075B449EC49
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 13:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946859; cv=fail; b=EvmIU0cwk6RdcndOA5gWz57QOu+psjzLOMT1M6w32XPl/iZ0lJ3HoWekLPrEy7sZFRVe0r8G9Ilyon3rSZmzHQEFGge8HfAw8Uuwc/oqgWq4suJa/5QKT/pqbD62ewPakxOsR/+vPSKdL7AvSwMTD3/7xeS56wes01rNF9NwIt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946859; c=relaxed/simple;
	bh=qhqKvpkB55buM/VylSDP/dTkqQ1odZtb90Kid60xVD8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Vl9R+VGy2eSMABQPHzAGHmx0YE5EV5zaZfeo32F5lMFHG4kY3O5q+Otn7go5/O57ksvoHPyE3uVik2R/F36YBdf3Axz8v8QSsMNhQGNLgjiL2k1ptjvrOUwDAF7hmG3IuakOsKivSujtLVhmVCENfyaLQmdwCJa/aS1XPasS+yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O0+utIyB; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O0+utIyB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vK+pBuQbzgAhjJObZGq8jWAWMzMN0hxlSCdOGa+lROOoRe2hbKV66l4f6CCobPwFyZkJolSheypt8HLEGg5lBOVS4qNIkNjAdVI5NZ7FCzlZph5nlPNJPGhRKWwpRH8YmyiaYxmA2FjxjOS4WsE6pFXafPNNvttMDIjfwmLgQXNROIYFIgnWlGfwIrE5m4orqeai8D2RcQU2mvgdj7OeLjL4IY5CWh5b3mSaGue3BnTiRfuNa02KGm7RRMfifr6jp1mhUIS29UuqrA3tiZV15gcOCSnnGBViJ8wtjlusg16CqTlHmHHxkv7fYmy6ng5nOpzagam6NGfclkwxcUCSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZF09Mxc3me51DrximCZ+/JZoDGZALrTSAuaEY9gXLMw=;
 b=nXeGKOruRAfEiyNOn1ehLkn4dJytxx2A7SfbGLf7oRTVkvgI0oDlN44RRF2ilw7mEQAWKyUa+9T+2vcK6wsu+EWE3RKi192hECC2bt3VHYe6Zdumk6n+UB7119DMs51KOyhHFtt7dPsetNFtgbEDmqyeJpBLfeImJgDknxLtXuoBMgszBrdnfSvamZ9YhC4qADjybOxpj8+m40yNotO+lgtyOrG4n26gMPNxsBPNWSScFusGVF6GpF13UaApimShbML4VqLX9ekhdfeP88mFe+XftEsQ17CgnJgglIxUEzJy/M6Gm+/T7OgLPzUv5vDhoGZCcpPAHwOVC8EW8OeAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF09Mxc3me51DrximCZ+/JZoDGZALrTSAuaEY9gXLMw=;
 b=O0+utIyBfTMM8onrRBd8s2ZG2DpfJ4WKKHYSEPxVNAXJVy6uvHRGpWoMV4oXs20W7W+f2oX34QmXxNkSvS5V8Av10Suja7FA/Es3b60rSoq5nn+2UJVQCb5tqZsCVETV3JKGhI7EqGlPRzdC6K7TJ6l6rpW0iJMvt0FZT8CARuEyFiVEa+R2alGOyWYTRJJjvYOrd++2tDn2oTK+yCXsL/jtdA6KohVEFR2hu0o0yLkS/Mlki+wIHOVfffBwdSNfMruMUgt8kjwO6rp6ENLq1jzah65uOEKO7eQsCj3eB2a1tOB+StDbG3s6Li64rPHKZApJLSTSgSaUHM5Ir0guSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10207.eurprd04.prod.outlook.com (2603:10a6:102:463::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 13:14:13 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 13:14:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 02 Oct 2026 21:11:18 +0800
Subject: [PATCH v2 2/7] regcache: extract __regcache_sync() to deduplicate
 sync dispatch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-regmap-lock-2nd-v2-2-e172b0501c52@nxp.com>
References: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
In-Reply-To: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0069.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10207:EE_
X-MS-Office365-Filtering-Correlation-Id: 15032b37-17f0-48d8-21e7-08df20870d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	L/s7iXYtBAiS6ZxtoPjBIOR556FMjmJ10oYWA6cKsG0f8XstTDZ97D+yRikKraDYNvQlIkclIYdFaQ+cDD8DD9MJgGRx2xzS64JkQDWPleNJ4W8hxZxm4J3Whl7yFM9RXEjR1w9HEm/v0hBm56VkklgPT3zSlx3BSWZvm/dxJACfnwnD2qf4rG8buKR2kU+w8dMhMCFtmVjq0y/At1gY+aOMdSGJxvvGarywy4tAZGEN4uLReiMqMB07MK2exvn/pJTalNDCRaeXpgMXQPiVp+w6ibkSwHa0mrnlGEVTZzRhlzhyjZbcsk/EjqNaeLwN5sLH6XbdWR4PdSxlTL+9OCqKRS0K1OdsWubhfR5o0hjmMQvzxVtm+2RzpIDR23Vr88GPotqzDqcnihOugv5Yhd7ON5Z2EJMNWXNG5AmCSY5sUNnVdpZ2Bv2N61eIerEV43xwSuWRPRZMmQyq9Of1zd317xza9qgijlAMMnLZyWeBxAT4nye4uxcwji75BlTDPGZJkx7/qP2hXQjXGDfimWPlKso3/32KvAmn+3UBawFTQ+m2BIXawk6wLiJZZrCpRWp97UlIRDyEdqYEzLum4tCObj0qTB5n7OJLrYxK0jvlmujrc3W55ujcjQCy7SjGbFdImZsN0Y4woLiMynrHQLtKO/1I5wo+b6d+rd+DF8s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0Z5bjRpQkphK2NQcnZRMmVTUXJPREErVlJXVzBqS2FydWV5dURrTTZFbmFt?=
 =?utf-8?B?S2JHb0JtVjNadDVSSXZMVUN5cjFKUU5mNnZHeVVJSnIyNkJBc0xObTdRZm5z?=
 =?utf-8?B?dThCSXcwVGdIcWVnU3BYQWhBN1ZnZ2VUTUFLS2VaTzB1dTlhdWJNSm4xV1pP?=
 =?utf-8?B?cEd1am9jU2MrZzJpT2xncUU2N0w5Mm8rcWN5c1YyUmNLa1FEc3RMSTIzcEsw?=
 =?utf-8?B?NFZUMno0QmNBMUdVUlZGZlI4ZUZ5WGxDeHIzdHZNbTFNRjNIQncrWkZlemRj?=
 =?utf-8?B?Z0RLdUw3T3VHc2tnSjhacVRjS01meGh0NWNtLzJtZWVWb3VDVDlRVDZYMmtv?=
 =?utf-8?B?Szdqa242dHlRcE04dWY1cmdEMThwQ0hZK01aVkp4OEIzM0tvUUp6d2RadVoz?=
 =?utf-8?B?eEQyMDVWUXgzYzcyemE1bzNvSlozQkpaNVIyVEVib0c2L3VDQU1qd2VTNE9w?=
 =?utf-8?B?d01MY3VEbWJhblpGMmZqSHN2bVdOY1dkZHlFUUdJRHNHLzI1bzdGdTNQWUxO?=
 =?utf-8?B?SXI5eVV4OHVocjhZZHhuNXhFWnZlZmtCVklpQXRBVW1VeFpwdDFlb2VZOHI4?=
 =?utf-8?B?c2k5bkV5ODF0RC9PeFVhR1hsQVRSUTdCY29OaHIxQzZFTk92Z1R1Wjk5Z2FW?=
 =?utf-8?B?NjR5Z2tFVk9FdXRQZVdtd3VZWG5wUzlhTnNQVnBmNnU4eXNBVUl0R0U4djlW?=
 =?utf-8?B?a0RhMWlKQUlWKytMcnJJbFRRWmtOb0tTTGgrV3VSZG9iMzRla09ERi9JMUNU?=
 =?utf-8?B?TW15cFYvTnJlZEhPTVFqUDZQVjdEWXZzN2gwenkwQXRzU0xUWWFhcERYRW0v?=
 =?utf-8?B?MnF4L3Fld0M0QU85S3MwaVRqQmV6ei9aWjJLMDZUem0vWTAyRUp0MkVMN0hu?=
 =?utf-8?B?UUFJbjJVbDN5R3haaWlMRzY1OURTWmNYR3JDckFDbDR2N2RSRjNPWDJBQVJL?=
 =?utf-8?B?b0lKdHY5aWVUVCtXTkNXam5qeGZZeXY1TEMxb3V5eTNkbXVocXVQallXMytz?=
 =?utf-8?B?dkpuNVdhNEZQeTM3MHFPT0o5aWZyWHVaSnljWGZEQWpHcE55eG1RdWlVcGVl?=
 =?utf-8?B?emZiNHhqMlM3YkJ0WnNIWEdaSzU5UWZzZktzQlczNTlNemovS2FhMXBHdXBZ?=
 =?utf-8?B?V3MrL2MraFA1SE00QXBBNEtyQTRhSkZiWjc2eFYxWE0wWkRreFo2WjZucm9L?=
 =?utf-8?B?aGJ5aHlRcXhIRUpFbllOZ1VCcnVLYTBYaWtPTDE1K1RycWJvSHgyQTJadmVP?=
 =?utf-8?B?eGZ2NE9teW5zcUM4dkpBd3VjczlKVGJMenUrNy9POXVqOC96WURFZWFCTXpv?=
 =?utf-8?B?OUZ6ZzJLNFRxRENXT2tlbkRhYlNQQzNJRjlLemwzcWg4YWJKTHNoYXN4RUdL?=
 =?utf-8?B?UnJNbkFKaWNjaDdqOEF3V09XRERJUEl1Sk5KSTErcHNaRGFyVmdrVlRjR1hh?=
 =?utf-8?B?Wlh6SzU5U1NzTFNqeHB1ckVRWnN1UkFPM2VIZGRSaWtLSEgxRm1UQis3MGlR?=
 =?utf-8?B?Z1FWRXBlZ1hjc29vRjhTN1RlMDdTS0tSbTRsblRxLzhKS3ExbkkwWW94RUo2?=
 =?utf-8?B?eWZZUXpWMHhWQ1BGQmF2amw4OHVWZkVrKzJBc01XYXV6b0VGcXpRR2QrZk40?=
 =?utf-8?B?eU54MVQ3ZW5XZnlvSmczcGxmUW9FTzZUdE5JbU5zM0hOVi9TMW0wbEMyMlNa?=
 =?utf-8?B?Slo0S3dIVXhTODk4ZUN4YStoRTlyTFNuWlA3azE3NUpiRk1ndEZlTnJ1SDB5?=
 =?utf-8?B?Z3VRYXNONWd3UW51STNxYXlNQjNHSEYyeHN1ejRHQk5PbEt0VUxMK00xMWEx?=
 =?utf-8?B?R1RHWmtxNGJ3Wkl2SElKdDJQWWM3WDZkTmFweU9KbHo4aUFKOStZUHdPc01T?=
 =?utf-8?B?UThWL0wyeEZ2dVpmU0JCSlFVMlFyeGwvV3dmbmZxRVdWYkJRbG9CWUpDdE0y?=
 =?utf-8?B?RmtlbUJnQnVZclVNcWlvNGN0ZkJxdTRtcjZuWjZUZCthbVUzbVNZbnZ1VXNW?=
 =?utf-8?B?UDZDbFNzbElJN2FNRTh3S1RKQUUyOHBZS2lqa1dsTnpiOU1nWWM2R3o3UDA4?=
 =?utf-8?B?SjVlZllXUGd1Ulpsd0N1aTZYbEQ2YjZIU3ROWXdrOG42ai9jNHV4WCt6OEhT?=
 =?utf-8?B?NkREVi9tTDRmbjFNMmt4NlZmVG14R3d4YjExTGJiV2hJWDJmclhMcGlHRGMr?=
 =?utf-8?B?OW55Y3NPUGZ3SVpPUnRxbEtNUUtKaExSR2RPSVlqK0ZHRzhRWDlEaWc3VUxy?=
 =?utf-8?B?YkRESDR1cmVvTWs0VEJjL2JtTVdsa3I3VGUwN3cyMmJHZ0JoSU84bEU2Z2U0?=
 =?utf-8?B?L0hhR1pQRmZ4ME41S0ptMGNDUFlnWlZ3d0NhMFJEYVdPRXJEQ0RKMHI0UFNs?=
 =?utf-8?Q?LwKsjJaPaHho6DWtGN9EQQMk5bxD6aIkzqXOs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15032b37-17f0-48d8-21e7-08df20870d69
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:14:13.0509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4veoUm/Uvq+4gIVZHn3lmSeAiBxcTSfDQROjcREfw1rZR6UfhACYXnN5PJ1HNOGNFp5IGgwJndgUcQ253TF5jA66O2Slj5YLSmzb92LigotNSuceSBEq6R+iFC40wAI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10207

From: Peng Fan <peng.fan@nxp.com>

regcache_sync() and regcache_sync_region() both open-code the same
pattern: check cache_dirty, then dispatch to either cache_ops->sync()
or regcache_default_sync().

Extract this into a static __regcache_sync() helper that both callers
share. The helper checks cache_dirty and returns 0 early when the
cache is clean, dispatches to the backend sync callback when present,
and falls back to regcache_default_sync() otherwise.

In regcache_sync_region(), the cache_dirty early-exit previously
skipped setting map->async. With the helper, map->async is set to
true before the call and restored to false unconditionally afterward,
so when cache_dirty is false the flag is toggled and immediately
restored - functionally equivalent.

No functional change.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index ebfa27bb6f54..b486cd826b3c 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -22,6 +22,8 @@ static const struct regcache_ops *cache_types[] = {
 	&regcache_flat_ops,
 };
 
+static int regcache_default_sync(struct regmap *map, unsigned int min, unsigned int max);
+
 static int regcache_defaults_cmp(const void *a, const void *b)
 {
 	const struct reg_default *x = a;
@@ -143,6 +145,17 @@ static void regcache_locked_exit(struct regmap *map)
 	map->cache_ops->exit(map);
 }
 
+static int __regcache_sync(struct regmap *map, unsigned int min, unsigned int max)
+{
+	if (!map->cache_dirty)
+		return 0;
+
+	if (map->cache_ops->sync)
+		return map->cache_ops->sync(map, min, max);
+
+	return regcache_default_sync(map, min, max);
+}
+
 int regcache_init(struct regmap *map, const struct regmap_config *config)
 {
 	bool sort_defaults = false;
@@ -461,11 +474,7 @@ int regcache_sync(struct regmap *map)
 	}
 	map->cache_bypass = false;
 
-	if (map->cache_ops->sync)
-		sync_ret = map->cache_ops->sync(map, 0, map->max_register);
-	else
-		sync_ret = regcache_default_sync(map, 0, map->max_register);
-
+	sync_ret = __regcache_sync(map, 0, map->max_register);
 	if (sync_ret == 0)
 		map->cache_dirty = false;
 
@@ -545,17 +554,10 @@ int regcache_sync_region(struct regmap *map, unsigned int min,
 
 	trace_regcache_sync(map, name, "start region");
 
-	if (!map->cache_dirty)
-		goto out;
-
 	map->async = true;
 
-	if (map->cache_ops->sync)
-		ret = map->cache_ops->sync(map, min, max);
-	else
-		ret = regcache_default_sync(map, min, max);
+	ret = __regcache_sync(map, min, max);
 
-out:
 	/* Restore the bypass state */
 	map->cache_bypass = bypass;
 	map->async = false;

-- 
2.51.0

