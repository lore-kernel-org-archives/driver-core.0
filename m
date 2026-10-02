Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC5B499F19
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946850; cv=fail; b=KDNJrYPgVUmPGtRuH64ag+AA1ayCmRwDvgf47LwkqesOHck5cBM8KYOsbuyIdAMOvhMR1TQtVNcII2REd9m3ERibMYGl7uJlyo01rDbU1/yM9z7w2EF5T9+FElkGVJaojip8EBR6taEWzAxThrz50pZ5x/JtPMZeRVIC0ijaPP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946850; c=relaxed/simple;
	bh=FpljNuSV3EK5zrrUQ9mUasISxwPgjrus+FfPxGxC/BU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=k2ZnpwNtvqWlgBTXMUmrLuNtPzx/Pf77O6WgdMUGucvzV1iyNY3HHC5CTsZYttljsqD37MAK5WPYoEu4MTiRkge2dQMMaFOWMK3OYRTSnchIBJmO6lj+iyXRSeIwjapYGPO+VfjsjY4aLZ34cZse6hqb/iwtMpl9rZ3BxXH5AWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e5N71z01; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e5N71z01"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWYi/Ot4TDsRUMd3b9A7QWCXwjHtiblZyRO3DBFRroVgoF+XUpp+0yZk58WLBLSl2l/B31SMPCyiCyFwggJfa71Ok6ZUQkRt1WfnFEnaI40djCwEXnG+iA1Sp27Rvxeezxuu8XX7fKrPkthe9KVbkJTw1g6P8SWgf/y7mz3TNG+dNdoKSKRN3Kv3X3zqStakgrdS+jOL+TVpaf1rgZnp1hZLRWZ2+zci8g3r1O2aJe75kUgx9wusiF3a3GN4fL8M98LvRuNNU3KaffW2py2umxqaGCwZqy78xWRbG6l8wUVC8bgDuGoA1yo+leVEm8HKAhYOwV0ehv4LtXAJPKVzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxh5wqwFWwF3YmiSl9V1CVzV7TXaBzK06xckYP+81+U=;
 b=JTs5PeTkU5gGb0rCDivdSRYvBcjPo7sTnPooChvdHYwyeaIXDG5RSNEOmkcI/RqYGOzY2cnpPkiUd2xHuogI4zq8ug+W5fXfnZaO6WtAhtzZ6D19bft6dP7cPf7tVHeGxw2xiCyTVmSRFgpizZvOBr8AGItJHIokSnwXFcgLEBomzy2FzazOEovYKqWp/5wsDEGLN3/6aIuJqt9zPAHY6UvO8WDfM9asuXlw8giq9vsOb1+yXAwmef7qD+4Sp5lOeZfz8WPPfxbE0xeF5DC6EO0xbXRw27oyCARxmJv/+Y3VWyw7BRuXQUPWj5VcWXhHvUnc6OuJKOZZDqZC9p6TiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxh5wqwFWwF3YmiSl9V1CVzV7TXaBzK06xckYP+81+U=;
 b=e5N71z01Ppj8OUhTJQKIWc9Zv9+exiE166EoPTtmXfgYSHSOJZzf6gDWC6t5oo8jS55a/Ak4OOV31JKUvMICjS814efkP7TalcRpqHyhnHcyiyO8qaKzPir0zD4O2Kr55zO4hYDEIJnalLvE8EnYpKOVtbWNIcEf5Ag/0mVQLsmosiU6Eex3jgGAV3zsl6u9RD9w2WGvK7ltaSlQwAQeNKeK2QA6ctzmi4neJZ2mw86nsb1Bm28xTpTCeqr2C83Ii90v4Uq+yc88sOiNwxprQPUOFGcvMfjpagbHSj1Ap1LhzEenHy6GR+9/ORFCm0bfH2qNcXabOGlS/PABUWE5+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10207.eurprd04.prod.outlook.com (2603:10a6:102:463::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 13:14:05 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 13:14:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 02 Oct 2026 21:11:17 +0800
Subject: [PATCH v2 1/7] regcache: extract locked helpers to replace
 open-coded lock/unlock pairs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-regmap-lock-2nd-v2-1-e172b0501c52@nxp.com>
References: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
In-Reply-To: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10207:EE_
X-MS-Office365-Filtering-Correlation-Id: 206e9fec-fde2-492f-370e-08df2087092e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|23010399003|18002099003|22082099003|6133799003|5023799004|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	yL5hiOP+FcFVRXgLPFaXOXzF1SiKaPdztG174JSnTw+lEPicm7X1zL2ICU6Qz2KbrjZj8lLI2B67cfsNmGfulA4vIt/dYhXHd1RkY/g4lyHrAnlHzmM3lu3vb1TcIAqC+cumUFdQFir5HZksBx6I7WuoF/h30GtDe0NGeFgIv0B0W+ggRnDJnjorMXCvm1ZyGrjzr/c6i/frnTkcQM7nxL/6cGi9DhVJt8DivV4aXIhgSw/rpEKwbErHYY70lkD10dSjHYXiVIdzycBo5PQsdT1xl7qDdvvLio5k/AcMsrLzIZTHXBY6y5e+HQuZk2n17agVHEOdaN74QQ+CRAIhWxWLiuiIaqqLgMbmVs8CmzF9TD0xDTSvfCEcONeVTPJE0JELOmzdX3RgEyO/tQQiay5b0cff+0dTiShkZthsItopF2HzixRlrWxWkVQNLV3piUs4A5PTkuWzFGD3kRUwnPNp40PpAxJ5hsRZ99HkGApLUq7wq552Ib7c+qQYYEsxb3nQQGyedA8sMX/hlBQ0pFH+uTk5aKfiEPs/v4weK0eehN+gp+UTWIh0lGKDv8sIuquV6FQBz5WFfh/nobh93KMjBJlSzmhhRAX1/gM1xlA+e1/Y7cV52zF+cpR8LA+hSi71N8fZCBbIMUbSO9ciqcmQXK9YTWuhStWvl5vMzBU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STNJaWZpN3hBcFBYdlYwS3hUeUFKejk0WnVPQ3hXVGxpcnlRbUtlNWFqMGh5?=
 =?utf-8?B?c0UvNEhyNW1XNlFOOEgwN0xIcVFCWS9tNlBjbnVMRkNaVDFrbEJQbmliQzUr?=
 =?utf-8?B?aC93Lzd0V2lJQU5VVWxlL2RHcmM1VkNqbkRwRm1EOUFXWXhjM3B6Wi9STkpq?=
 =?utf-8?B?dG4vUXZZMHV2bDdRVmh4NDBmR0lXTTlYaXVTckM2Y2dyNGRpRkZudkhKSUtE?=
 =?utf-8?B?dXk2YmxGcVBpZkJsV3BRdUkveUIrK1VEc05CaTNnVVFadE1kQjY3YkMvRjlS?=
 =?utf-8?B?a3RPY1QrTy9TTE91Zmw0QWtwZ0hRQnQzd0lhRnlOaXFHaTJiU2pvTUY1cUdw?=
 =?utf-8?B?L3BZQ2lrbnJtZ3pNV3h5M0hnd2duMnh1K2lxem5QR0hqQkxlSDFCeTFoa0dy?=
 =?utf-8?B?TnVhWmozRFllY1M1bXc2OXhKRnVkUjlMLzNKWWRacFdqTnYySS9sTUkzbDRC?=
 =?utf-8?B?QXlRdFdOMzBSWDRabm14VnAzR2pBNmExVnlJaGliZS9aanlSems5NlpqRGVF?=
 =?utf-8?B?SHg0c1BFbmIvakd4blNUUi8zSVNBdG0wVmx2bmdIMlNiK2NQdms5UWEzVC91?=
 =?utf-8?B?cnlxeTc2UDlWUjZUOUltc2lsb3FTeUdBQlQzQVNVL1F4UXMwdXE5SmtZN2Na?=
 =?utf-8?B?bWRKYWRUd0JEMlRQbGV3TFVkMkI3eUowZkJ4R1dSZ3g3NTJ3RjdmQ0EvM25K?=
 =?utf-8?B?NnJoc2huM2NJZFFDVzZJQXE1Wnp6bHBqcDVNdTJMRE5JQk9tTnNDWjM4Q1Vr?=
 =?utf-8?B?NllMN2FwTkJrNFdsSVJjcWIyalAwQTVpdXRXUGxUL01jeTByUWRxa2tVRFZX?=
 =?utf-8?B?emU3MEtKTm55QjNjY0hiKy9UUEIvWm52SWVDZmlRRzBqdG1pOGhLTlZxS2E4?=
 =?utf-8?B?eUkwRWVpL2szcllsVitSWjNvNjlVeVdWMDI3bWI4LzNVOFFWbmxDeTlkclBv?=
 =?utf-8?B?RFJGeTErTzR2ZldTZmRYMTNxUGNZMG9CdjUrUUtnR0hBTEd6MnhGelJiUG1I?=
 =?utf-8?B?OTJGRVVONFVNZWFxVmhpQW9KeUFaOExsVnBVK2xtNXJDOStIcDJubHRQZVhS?=
 =?utf-8?B?dEVVdzA4R2w0UEttNXoxUWFFTG9qS1dhbEZpcWVIOXFiMnR4azg1aVJCcmV2?=
 =?utf-8?B?S1A4NE1JZlZkR2FWS3NJR254SzZ6dHZhRGR1VGt5Qnp1L0VTVll6Q1VGZ3ow?=
 =?utf-8?B?dkdobVZXS2FSQUI4VjJHMnM4ajErcTREcXl4dG1iV1YzOTNXdlRMZ1BuNEsx?=
 =?utf-8?B?eVM1ekxyNTN1OXhXc0ZQM3ZyVzhwdnI3NEFSRnhUVU5NM2l5UllZandyNktL?=
 =?utf-8?B?RnNxdC9LbmptZXZ0ZEo5RlRFYzJjUHlqdGxwYmJBME55U0VsWHdSMnhOdlMx?=
 =?utf-8?B?bUoxYlVQTDJYY1ZIbGdLd1A1SzcvV0phczh5aXFqaFZzdlhoZzljeFZHekhE?=
 =?utf-8?B?UCtEUng1bHR0aXBaOUR3TmdKa1M5V2p4UXM5OW11VTQ1TGcxRkFmSjZPTEYv?=
 =?utf-8?B?dEw0RUdQcHlKU2REV2xsaWZLUUtRbm44WG1OazhycldJSHF3bENpMmQ2Q1Z6?=
 =?utf-8?B?RzJLZ05GcldSNHB0am9jRjZhZ3hnQTNLOXp1TURGU2FLTEV1b295MXRETkp0?=
 =?utf-8?B?dTYxa0Q0QnRkQ2JmZVRCczZSMmFvK21WTkE0cnU5OHRzTCtNTjFiZlJVK2NJ?=
 =?utf-8?B?SUUrTUlyTkhxMkpVcFczc1dvK1FxRVFiQkM5TVUzWi9raFlrT0JmYXB1Nlkr?=
 =?utf-8?B?dFF4ajhlTzBKRjJJYUVzbENuZWFYZTRJUkNacUwxOG4wVFIraHhJcTIyaFpz?=
 =?utf-8?B?R29hcS8wOGlXdFBJWStvam9ZbVBJcGlxakJtWWFGdmx4QTRRa3Zmd2kvdkMv?=
 =?utf-8?B?M0Uzc2pKYU9pSEhKTDgzSk1iSlRDVENNQkdMUEpBSDJqSzhqSUF4QTZ3U2hv?=
 =?utf-8?B?SHRVRlI2eDhUR1U0YXBYYjdsSmExWU9NT1E5UTVuTEFKbnhaaDdscHVBQi9G?=
 =?utf-8?B?eDNUVFRVOHdCcWU0VVlmK2NBdUZMZDB4aFpIZHpZaXFPQmdiaWtoNmpMTzhq?=
 =?utf-8?B?TlV3RWRhTi9tNjJjdll5ODhQVit0SnE4TzVFRWNlcU9yc0ZGSmVFS3dlNWE0?=
 =?utf-8?B?VElVS0hnc2pmRjNYYXc4OUIvUTdwZFRxblppd2p3ZnNBbTZVQ2FMaDA4T09W?=
 =?utf-8?B?K1JCd3YvTWkwUTd2dm9KdXdLcktCZ1lMWHdveDFmdlpQN0RORkg0ak1UMFBx?=
 =?utf-8?B?dW9EOE1NZVo0T0UwL2NKc21PbHZERVo1amlFR1Nuekh6K1dyN0hZbWlpcjND?=
 =?utf-8?B?aWFxVVVxVDRRWTNqbDJaQ0YrOXQ1ZzlMbHNuVGtDTkxITHhtMkZtOVp1SEkx?=
 =?utf-8?Q?A0eT10rEg1iPvw/6Re1g3u8IHgkYDfENRHjuS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206e9fec-fde2-492f-370e-08df2087092e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:14:05.8897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SL2KAwq3uH2XNEzJbVjCpSF/6U6zuABZhhocUKpcjAHDv+HuF45X33+YbzWyStLs4u/vI9knjcwQtO6QsCthpAI6Ux2SCBhLPD9HamZQN+wP7L5hxyDG3CyHe2Bhi1nP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10207

From: Peng Fan <peng.fan@nxp.com>

The previous patch ("regcache: use the regmap scoped lock guard")
deliberately left regcache_init() with explicit map->lock()/unlock()
calls because the function has a goto err_* cleanup ladder and mixing
goto with cleanup helpers in the same function is discouraged by
cleanup.h.

Solve this by extracting two static helpers:

  regcache_locked_op()  - acquires the regmap lock via guard(regmap),
                          invokes an int-returning cache_ops callback
                          (init, populate), and returns its result.
                          Returns 0 when the callback is NULL.

  regcache_locked_exit() - acquires the regmap lock via guard(regmap)
                           and invokes the void-returning exit
                           callback.  Returns immediately when the
                           callback is NULL.

Because the lock scope is now entirely inside the helper functions,
it never crosses a goto target in the caller, so the cleanup.h
concern does not apply.

Convert all four remaining open-coded lock/unlock sites in
regcache_init() (init, populate, error-path exit) and the
scoped_guard in regcache_exit() to use these helpers.

No functional change.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c | 57 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 4c80db5d6f6f..ebfa27bb6f54 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -121,6 +121,28 @@ static void regcache_hw_exit(struct regmap *map)
 		kfree(map->reg_defaults_raw);
 }
 
+static int regcache_locked_op(struct regmap *map,
+			      int (*op)(struct regmap *map),
+			      const char *action)
+{
+	if (!op)
+		return 0;
+
+	dev_dbg(map->dev, "%s %s cache\n", action, map->cache_ops->name);
+	guard(regmap)(map);
+	return op(map);
+}
+
+static void regcache_locked_exit(struct regmap *map)
+{
+	if (!map->cache_ops->exit)
+		return;
+
+	dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
+	guard(regmap)(map);
+	map->cache_ops->exit(map);
+}
+
 int regcache_init(struct regmap *map, const struct regmap_config *config)
 {
 	bool sort_defaults = false;
@@ -222,15 +244,9 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		map->max_register_is_set = true;
 	}
 
-	if (map->cache_ops->init) {
-		dev_dbg(map->dev, "Initializing %s cache\n",
-			map->cache_ops->name);
-		map->lock(map->lock_arg);
-		ret = map->cache_ops->init(map);
-		map->unlock(map->lock_arg);
-		if (ret)
-			goto err_free_reg_defaults;
-	}
+	ret = regcache_locked_op(map, map->cache_ops->init, "Initializing");
+	if (ret)
+		goto err_free_reg_defaults;
 
 	/*
 	 * Some devices such as PMICs don't have cache defaults,
@@ -243,12 +259,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 			goto err_exit;
 	}
 
-	if (map->cache_ops->populate &&
-	    (map->num_reg_defaults || map->reg_default_cb)) {
-		dev_dbg(map->dev, "Populating %s cache\n", map->cache_ops->name);
-		map->lock(map->lock_arg);
-		ret = map->cache_ops->populate(map);
-		map->unlock(map->lock_arg);
+	if (map->num_reg_defaults || map->reg_default_cb) {
+		ret = regcache_locked_op(map, map->cache_ops->populate, "Populating");
 		if (ret)
 			goto err_free;
 	}
@@ -257,12 +269,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 err_free:
 	regcache_hw_exit(map);
 err_exit:
-	if (map->cache_ops->exit) {
-		dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
-		map->lock(map->lock_arg);
-		map->cache_ops->exit(map);
-		map->unlock(map->lock_arg);
-	}
+	regcache_locked_exit(map);
 err_free_reg_defaults:
 	kfree(map->reg_defaults);
 
@@ -277,13 +284,7 @@ void regcache_exit(struct regmap *map)
 	BUG_ON(!map->cache_ops);
 
 	regcache_hw_exit(map);
-
-	if (map->cache_ops->exit) {
-		dev_dbg(map->dev, "Destroying %s cache\n",
-			map->cache_ops->name);
-		scoped_guard(regmap, map)
-			map->cache_ops->exit(map);
-	}
+	regcache_locked_exit(map);
 
 	kfree(map->reg_defaults);
 }

-- 
2.51.0

