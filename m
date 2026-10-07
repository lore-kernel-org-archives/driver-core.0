Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3292495020
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 12:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374832; cv=fail; b=PKYG1FmhR3L0ckXip6osJzB7FPDchTxkt7bYSsVoh/F9trSSZu//VxKcP5tYByF+TN/WG5ghXs8JIztSjNqvCYgF4mMwzZllGARD+5ig4wcW7gqhcQz9X6owB+yByT7wpiksj+ZaX5I6OG1npcUt9NFrqF1hBXpKhS+OKgsSsL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374832; c=relaxed/simple;
	bh=FpljNuSV3EK5zrrUQ9mUasISxwPgjrus+FfPxGxC/BU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SDAopZHtrlg19+pbhJHEZyRp53Bzx9+5Y09c1IbzP9YqH9Gmpg6vliEHlrMAvXlZwbKKV/C+uoHvde60YrkfkVJBTVadBEU3bGViOPRC0DMt1vmP3w1OQ9AYLXJsIbizD/aZswVUGFaYBW5GVfWbFpGDoWROqIXsFFQLP+6pVYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TCMfS+8n; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TCMfS+8n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdpqxhmVFvZ9cUsls3bETlBkeLtLtxiYMNq4HVOu32QZfVDLFeKPjCx4nqxwmNowXvzNFQYMXj5YHYGtlkBOi0ejdi9qua5qcFvrN7YgFZRXVrn4N0UoBG6WzoNZvK5wXLHK+qLjk1FmLG6HwaUEZN+oV69uqJ/HsUS4ayamDAFuA1HaSIMefygyqitcV0zeVUdKDN4ueGchcSjrGxPIEdrAFaYYEtqewwfxzVAgHMCaeGBFUTpHvGJxca8YaOtiExtYZXTYJkDWkPxU8koYA/cnPe1KH+nXLkrwgEsbadUdWZmJBJuHR9u4mw9u8/ssN85mJu2ayXxi+yn5GVTNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxh5wqwFWwF3YmiSl9V1CVzV7TXaBzK06xckYP+81+U=;
 b=T8UJa8B+noUOwe26ADv2J0VZ0nS+p6YOLrhIrgV5el8VxFPrQ1199BrWs/738qZkxbJgLnlX8lIfw2rVMoIuMjetWiR3g6rPifQmvZctEIBomVkKkxLW8sAbIQImwd6RFCdlzmRhSe+p/y6Aeq40azg8OE0bu+egaArodJiY1TEUpurk96xVJNOTgCMoVhCcSFJDZCPG/2rB1uhGHDljBIIf3JAtS52ouz+U5QcVb8wQwz0Z1Cjb9oFptDOSX9YoJG19+TJT/Gurh7lvmvju5OdSyNN2OSbBWkTCP6ajlJ+XGR88djJPIf07jmKzbQLjdB9syUrwMf0ljgjJ7ctRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxh5wqwFWwF3YmiSl9V1CVzV7TXaBzK06xckYP+81+U=;
 b=TCMfS+8nYYI8G9vkuWL06wCqx7wZV3stAJTaeQtgHwqE1QOFGhMsUlVH7aqbuJXwSNDfeyi98xNVz+0lTwKjXGy8DoanN8AywXp4l9Gx+ZFXNjh0QaIgm2dh6W0VljSPqoNtxE50anUsxdI2vWfrLPYPg568H9lkSAt9azuUOmpbDsvRaCAfoPB72PHZHd30DpcEPVL/GbWMox2oQ2bVVqTBY+NzZzvPB5ipdPBZqpC3RsPc4gxtLLtr4DnsLGlP2HCSGWwHHKCnjHBQzGcWyXMnf9OihlT/Oqk/U72JLznP/1kSLwZGw7iH/xeorLsGIacIvKX/aAcSMywcbMYzAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM6PPF8C695F6EE.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a90) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 12:06:51 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 12:06:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 20:03:57 +0800
Subject: [PATCH v3 1/7] regcache: extract locked helpers to replace
 open-coded lock/unlock pairs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-regmap-lock-2nd-v3-1-0e590c4125be@nxp.com>
References: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
In-Reply-To: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM6PPF8C695F6EE:EE_
X-MS-Office365-Filtering-Correlation-Id: ba29896c-c9ad-401d-3c4e-08df246b78d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|11063799006|10067099003|5023799004|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	75hFTFUdt2PikXV9+85AblnHEBP3LDrQVNs5RtLE/CXaimX/4bBgsKLp9zQfO4e563VK4RlqiAhKwLoKSWPa9JShw+boEUGPnv1arGi8oi7kr8xr11SkZ8FrBS+y1XbfZy3DA1vnYBNEDlaPtJpV7yIDI+L7y5Y/iE/PhkH1pWj9FazViCDhbutzWPZ2/tJQZ9YcKppFBvoVz8YuUxAKC3sLm/DdUKTNxROcfidDiuXk2TO1CkF8VF65EidfB8JmT1WkpIgQRIGsTDI4sza54KEZil1lQgLYMsfpTUbeJGuzDvrLXeiiH08BtPV3RkZbKsiYdsuYfYnc7xLJl127sF8XzxA+tUcattw1YPlm5DWjiAJOPnqNy/m8PV10y9HBkAMVtoYNkA7cAFTj2HD1YQsQyG8Lcpy2G+Ces7nlnIr9ImnAsCzRtid2WP8lrgxxaunQCuLGYIirSwV8zwbEzkiBXOD1bs8u/K66VO4Ph8NuTWBDhZu0jPnx7kKBN8K27L+EBQh/c9QlBBHn767KMaqQPfuNZs336SUP2K4KT2L3XqddVbqXrywVyNSxPmGmxXBWA6YtD56YQkdUN5JL63qMWD4L6DMjXtHoSntWXKj6ZCAXDkjm0hQGZppudDigFGnUTT47pC80nrJsCSc2NRf04x6La2TVlsqEeUCrTD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(5023799004)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVZYUHhmVkVteS9uWnl3c05keVo3a2ZzNy9SdE9HRW91NDdya0Y3L0xIKzhB?=
 =?utf-8?B?WVJBL2FiZlJWUlVUM0xEZXdlRmJBMDVtSy9mQzBuTEVrYWJ0NzRUdG0zZmdM?=
 =?utf-8?B?c3huYURBZU5LQmZTUWtsR2NUakxOMmZ0cWEzdTdIcmRNN0xNdlAzZldIRFdz?=
 =?utf-8?B?RUt5TFk3YjAzaDZydW40QWlUTXZUOENmL1FBaENMWjdoL0doNVlQeFhTMXR2?=
 =?utf-8?B?MFNlcDh4cm1CRGhlWCtrY1BpT1FSS3RJeWRmdTJFUGJQVEcvL2pNTkMrZTFa?=
 =?utf-8?B?T2xkK0EzVzh5Y3BodGZHVUdzNU1keDFOc1I5NWpWdjZxZkYxeDNjTVBxR3dP?=
 =?utf-8?B?YkZDcGJ6ZGJZNGh2eWtkc1h3Uk9aaktIWkFudVNyRzd4c2E5d1pKL0VOTVJi?=
 =?utf-8?B?a25kT0RabCtubThnWlo4ckcvcXVJU1YvNjFFWFN2M0ZsL0lwRTVRYWdLdEVz?=
 =?utf-8?B?US9hYzRmNjVYZkE0ZGR6L0RvaThlUGZsL2Jta0JzbjEyRWJMSEFEVm94VUZw?=
 =?utf-8?B?ak1qWjhXRHRTVUM2czFUZXVnakRTZS8zcDA4MkJYUDU0OVErd2hvMUtjRmhk?=
 =?utf-8?B?cUhsWFZqZWMxTWRFaVdTZnYvY2ZEV2dhMkZiOTV5SHVJM3VTcmdEQmlHSU1B?=
 =?utf-8?B?K0tNMUlTbjhwK3hnNWdWWXlkWHMzRE5vOG9oR3lIYjRHU0dHYWZ4aTNUSHNN?=
 =?utf-8?B?a3d0c3ZiMy9rOWFOQVA5M2loaitIYUYzR2RsRXFBWEl5SFZrZVlMMnNHRkZV?=
 =?utf-8?B?ckphT3hvRUcvVGRDUDJ5by83TWJHQk0wdHVsemJYWlFzVTRDWm83VjdyQTl1?=
 =?utf-8?B?NEdBRUdScUVNbjByUTh5SlNsd0pwcXZLUnVYa3Nkc2k2ZUFtOVhDTEJsSlNv?=
 =?utf-8?B?YkVtL0hHd0l5bitGaDdIK1BBM3lSV3lKZ2Jua0U2UFc4Q3NCNHR0bU10UEFF?=
 =?utf-8?B?RXZwM0VBcDVHOVhCSm1EVEJZakFtTHdBY2JrQkc4Sk03REJNbmVZd21iZXZB?=
 =?utf-8?B?SjYvSmZzR1pnVU1KUFpsbXAyUFRtMTZxbjNlYUd2VVNxWmJvdWhjZUNiajJs?=
 =?utf-8?B?MlJVS01JM1FkdFZ1YzRJQVRXbUEyblM4ZUErVHJiZENPTUM3Rm1VNlNvZU53?=
 =?utf-8?B?WXBTaVNLS01XN25RRm5paVdmQmx6YmVYTDJTZ0ZiS0tRU0s2SVhkOWdiWUZL?=
 =?utf-8?B?OWRvYUdWU24rN1FabGxXMnFZamJDbzhZWkgxTXdXVjA4SzVMWDBIMUMyUUpQ?=
 =?utf-8?B?Znp0dGVzdU54b1pjZDlabThPeVFRWmpsRzZGclJtTzBVNHl6Z0NrSlpPcWll?=
 =?utf-8?B?VkV6TWZvQVRuYzhPeTloQjlxTmZ2Zm1FTjIrQmZNMU10aTBQeHVPdUkwN1Nk?=
 =?utf-8?B?QzZnV0UzTXBuT0tGbUNMNjZMcEU5WHQ0Uk0rbXRMWGw3WXgvcTN1WlUrb1Nk?=
 =?utf-8?B?cFFkNGt3VkluaHcrb1YyWDJZdlc5NC8vajZ3aFVxVzBIK3ZMSy8rRlBWaTg1?=
 =?utf-8?B?Nzl3c0lwS2VUMWdGdDkwc2E2OTVzbDl6STFWS1RGbENkUllsRWZvWXBid0Nh?=
 =?utf-8?B?cEpOaU9tZ05CZXc4M1N3KzNneFRYeUlnalE5MzIyWWU1N0VqdDRwMnZXbzJa?=
 =?utf-8?B?cHhkTHVnZmsrTGdTNXhaYk1rY1VHd01vSTQ4Ym1ldnBuMmVYODFxQjVxaWRv?=
 =?utf-8?B?T2hNdVR0R0haNHlmOGt4YXFUOEMvME9lOXJGRlc5b1B4Tk9VRGNkVXFqazZi?=
 =?utf-8?B?VWlrVnF0SWM2Uy9NQjBvbWZPRVFhWGc2aGY4bzgycmpKUUFRdWdtSTY5czha?=
 =?utf-8?B?UW1SK2ZVeE9WNmRQRlp1eEJDRjhCSlpLeVhiUERaRE1rQ1NZWUVITFpuSVd1?=
 =?utf-8?B?cTM5ZnRZS0daZFhubktxNkFVdEdFRkRJTk9BZDZ3dVNoczRGcXUyYVlnTGdQ?=
 =?utf-8?B?RzM3enArZHNhNkdDb09WSGhmL0RGRjNFbHdsdzlOaUhobW0rZWZ5NGdaR2JU?=
 =?utf-8?B?aHNvd3pHTS9qc1h6YWg5cFlvQzg3bUVmTDEwbkErNFVWeHpEcXVMQWlSV0RH?=
 =?utf-8?B?V3A2Zm9od2UzcThHSFBVRGE1Q0NmTTRjK01ybmh4WUFoQ1F2Y2Noa0dwNElM?=
 =?utf-8?B?K2dVUmJkQnYxeFRkWmhkUjRFbUxsVzVVWGpnMVRWamRhMEpFZFdsM0twdXhO?=
 =?utf-8?B?QVJvUzhhYmVoN2NxOXVFSHNiYldXdWVFeHdoZXcwOTN1ZlNTbGFFQ2lmcmpM?=
 =?utf-8?B?YU0xdkplemRRQitFUlN0d2FpWEhVa3pOcUU4bFIyVWNFc0VmZUJ0Tk9XN2xY?=
 =?utf-8?B?YUxFVXd0RllTN3dMR0dYZGE0TVNoMlRmMnlaRHJ3QzlpNUI4b1FtZlEzdXdz?=
 =?utf-8?Q?uLXpdTGNZZ2sd7xPNUNIITM8LVSwxbMqjrVfl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba29896c-c9ad-401d-3c4e-08df246b78d5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:06:51.8478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClXoAITwaNjTv9JFeGlPa0kDKQxrN+LK0FUASOpXMdlCaYefqdW82d6U6ZFv8XrbJXjMFEnf2utWUKgloYP9711/au0jlqROnpgiY+g3mOGMh5zFGtRPtWs1vPHG77gU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPF8C695F6EE

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

