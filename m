Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B29C48FF89
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374843; cv=fail; b=LTzbd0w2pGazgQbxbGtkjybYleC+90+cZ/L3cn1OqWH1QalDRrCcpNapM6bhYBW+YWq1NDnc9crLBPSJHX0K98l0P5VDWCnzf8l1LkFeDa0yjmd4dzwZIj4w68iUvS5ul975fAZq6J6bE26w/71gRahVpRzWJphuv01hstH7oLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374843; c=relaxed/simple;
	bh=qhqKvpkB55buM/VylSDP/dTkqQ1odZtb90Kid60xVD8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DtH9KvN9jY5x6faCmDaNF0hle9U5QdJPJdc3QvdvheHC4QgoJSTEh/vRWIzMC62Z/zr5lSxl+MoZw7Mt+Twnknsv2oYwyGvCmVGEv0JJm1mYQaSC17T1MtuMCunB5pmMo/5yhFpwUz+VHDUXkNuvohG00Kd1UHbEtAloe/RAnCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b2Qa4VRv; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b2Qa4VRv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsWYaD/1in6TC6oHLFDFtyvrMl/Zb1+8UW34ikERnxPGwWA6JoCFBa8o3+YCpzCUkCII8RKTroGI/+WlEnkVIFui5ka4eRlbvJyowK/wNgYeQ1R0cOH7p/mnGiSOQEkC3F558HGLVRytFqBT33D0d5kV/KKgcGwICYe87zR0BCE5QZQcPOip45AtuZKgrc+yNgzgY8KMHzO+EBa9LnzSlZvlOTZ+hSSqfI0VM5OBy2n8Xm56C+yZYc3AOmkuMTFv4imKmSeOXulx8Py9hugvJ2fJp5s/hjIKe/TI+8dcdykaSKUtyRCQdr0N+cytTYBg3Me2fB0ZqTE/oaGUWgN4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZF09Mxc3me51DrximCZ+/JZoDGZALrTSAuaEY9gXLMw=;
 b=A7iYSZPR22QqDUD64JctioiaRQJMb4+BfUtYVZFp2EjvlmzderfwlGVKbNfDZR+GQi2D88drD/C8PBwfFiZPx7DAXMkVG/QLPLON1LHuEpJ3SshI06+9xWVKRC+G83TakCXg9H+pkxbd4lWSpyCL/5H9lT5F7TgOvSZEfmwHZWAmxZIXBoaPNdBMNNR/OMGqgw0zzwhCCHi9BhalXiAOMRkxuSfMl1dUYHdY0HcTG5dxu2Bz6NkorLgjDRzcepmFYmAibSYr8sGCjBxeEz+PWzmvtKVn4JQcMk6O04559tTh0IVKwuamYMkoTsKnyXYzTcdpriTMavaEsQkK/SnOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF09Mxc3me51DrximCZ+/JZoDGZALrTSAuaEY9gXLMw=;
 b=b2Qa4VRvHOvUXIiRcAvYHbsPmwJ9dIPaTUbv2LIETDHR+d2A8QatWQcgOoCuZX/eQdIX0vdLmPZL3KPnKno5/t/iepYelLwmJW4ZfwQkjNbvgHZhCs6LKujQ5ysTqLo0a6Zo7OnfHXeKHY/+lkaA5OOVP8kwHOUVfHMTgX2lmyidL8zysJVpntZaiX/MT60EXbLzJZF6AN9MFDtEWRzqVwEsrKhNV9jn+Lr4/HcOB/9WPYTMHweQ45Q9wLxnxAaV+4D46Y5Ych9ZuzKVCcJ+7pXDCBJqDMZahZzEEkg3QRAdm7j5pCKzQvquC20wzw8panRH/44akchhAUNlGZdOwQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM6PPF8C695F6EE.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a90) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 12:06:59 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 12:06:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 20:03:58 +0800
Subject: [PATCH v3 2/7] regcache: extract __regcache_sync() to deduplicate
 sync dispatch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-regmap-lock-2nd-v3-2-0e590c4125be@nxp.com>
References: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
In-Reply-To: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0184.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM6PPF8C695F6EE:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e37020-f34e-44d0-6fe5-08df246b7d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1Trkk5nW6C0mdio0wf2PU3cwOLfISw4NBX4UVvSDJtYpbbSpL8QrOVjA/BILSLmB2wP0Gottb1opV4KgIzV1dyM+5xFcOGd8r/LC+rOzyeDFdGhuFj3T5/sxVtcdvHugBl2q2XZY/32dKe/V0SgB07PF+l6qtoIIxESlRwPKP8VTGxtEBSvGoSJymZOC4TDEMQojX3veP6DBUS9Agyl3OsXfewFk9Vvx2xRj7ihDOPrLcYuNSDbtW64vZQJtlo7XKY7cpXmc5N9s/7yOOEQwhQMoJaqMXVFdIkDrvCjKXBgetlkWWUXvLy4XXM4Z//AtDdD63TyoX3sHPPlYYHfdLuldribawfkW0hey0BpY8OqIUjOSavMKjS0shsvsE0yRz80kuJgGr+3uIryfdQSU9RAgMpyVePUB52XPs9YQoz8bGZf9uVFXtzR0bdBLf4vMZ//PJlow07gWiweoX6B0jx68A4hdvpuBmuSKrgvVJ+/fox+tmpmfrG4rqQrZha0BkGiFH8CxnMZGzcx3CvfnXOQhD/ta2ePiBCXdMCIKso8YihFGHgKpVk8HZQHMMYzycQOmJMGoIXIpjRWtkJBzsvHwJqBi1MFzWFg6LM+LvedMtCxJRZmW/L2JHnzlLnpWW53tebfLNvEONCzC5SVuowT/ehxZYFblSU6qjm3sjlo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0dIMVZHbEMwemJQVTVPODBxbFIrY0YvWnI2Wk5CNEFWZ1VzSGE4U3NnRGdZ?=
 =?utf-8?B?ZjRpNDc0NEFIUVQ4WnJQNUFDbDN0VG9ZUnpIMVVhZy9nMDFROWJTTy94ZWpL?=
 =?utf-8?B?M3JXMmZ5ejhvU0h6V2RiWm5BZ01mMjdXY2Vta3RTaWhxTzNBMGg3dTRUZGxo?=
 =?utf-8?B?U1ByYThvMERRSWlSVm55MGt3UkF4bWYrdEFabmhXRlZ6UWVqSXJYYTMvZGtH?=
 =?utf-8?B?WU9IM0FzYlB1S3ExeGhZenlHSDlMVUVlSng0QXpKVS9ScVJpc0k3MWJEcHJN?=
 =?utf-8?B?SVN4blNUaWhvMVE5OWpnd0JCMXVEc1c5WGdRVlJDbWZGNEcrVHNUSmN0cnBD?=
 =?utf-8?B?TnU3dVRRTzJhYzZhUVVTSHc1SlQ5MWlCZHcwamhCekt2d3d6RDFCRUZHOGg2?=
 =?utf-8?B?dkdRdnNYa2dpaE5zbStFMXluTlcwaUJZc3F0TzFNdjQvY001OU9MRlNXVURW?=
 =?utf-8?B?amZiTGFxOHI0ZmV2Lytnb29FdXBEQm84T3hVdDZFWnNMR3R5aVNLZzJTaU9E?=
 =?utf-8?B?Zng3bUhYVldQYmJQRk5hTk5ZdU9GUHFHMEMwbEN6SXkrR1U5NXVIY3U4ZGVJ?=
 =?utf-8?B?ZFJNMnNMT2VQRUNoUCt2elpNMGN1alZwL1kzeWpsdGEyeHQ2a2F4b3BveW4x?=
 =?utf-8?B?bjBqekxUaGlPR3BaVExrSThUeDNqMURYOTNGZ1RPV3EyUjNxTnpvSi9CeGc4?=
 =?utf-8?B?ck55S2FQZmpJZHArSDFFNXpiNjRybjJmcElmMkYvVTNmU2FlYXhmMHIza1BX?=
 =?utf-8?B?bGZDUkN5U3ZJMVJvRGs0MVZid00zVmFBajNnU3pwVDE2STcxaHlOb0NzODVj?=
 =?utf-8?B?KzBrM09Ta3hxRmpqUjFKVE5jTWhzZW5CWVE1cWR2TEYwVXlqTE5QMmtlZ000?=
 =?utf-8?B?UUYxTUFPdkpEd2JyaDZsRmtUQmdieWNxekpyNDNqRnh6c0Z6ams5dzFES1Q1?=
 =?utf-8?B?L0IvdEVwRFFDb2VXYkVyVDlKQ2FET1RzbTFGZlZvTmZsa2x5YUs0OU9Ldkda?=
 =?utf-8?B?OFhyT0t3T2RMRjZHbXhpTHJTTUpjKzFOSnJzRmJNWElKWHhaUE5Uc01mZytz?=
 =?utf-8?B?MXRmNTRnaXNLRFMrNnVHeDNhSDduanBrMkJuSFlEeUthOEJuSWd6SkE5TFdN?=
 =?utf-8?B?RHczOEQzaU0zRWtuNkMxU3hKT3E1VERpYnAwZG40Q1NOQUozTDZWN2xwTE5w?=
 =?utf-8?B?ZVF0ejdSdVNDS3ZFTmZicFUrbDRBSDRZYVJGVnlZS0xMMXFyd0pORXVxVnVC?=
 =?utf-8?B?aXdCdU56bmx0Ukw0VU9ELzlhbzYwUEc3SFg5UVRMc3E4SDNhVUJJU2V0Q1ZB?=
 =?utf-8?B?S3lBUmZtb3dXZm9tS3FiUDB0aDNGczRMZ1ZlK3BBdDJYOTBzKzNsOEsrU0lR?=
 =?utf-8?B?amNDTmlKVDFjQjNPUXdhK2FtRmx0V3ZNS0hjQ1BBeWFIdXBmRitwTVRxY3Rx?=
 =?utf-8?B?YmhhNlcweXQ5VitJRGRRN3RIeVRsNHQxbW1WNytyemZFd0hHU2NFdmh5cFdw?=
 =?utf-8?B?ZnhCUENLaExpQXhKVVpDNUlGaXdGMzFwN0ZjUEdESTluTS9RcFFhcUJIK1Zm?=
 =?utf-8?B?Mm9EUWE3ejJRMUd1M21FbVhqc0pZREpKc3oyVjBJbG9tZW4zR0xaZVl4SmEr?=
 =?utf-8?B?UVpKN0xRMXNWd3RHOHdnTDhIQ3RPQVJJUnFINDJmMXN4N3BGQkZKTFplWE9G?=
 =?utf-8?B?WHJSOXc2WTFidU14WEdhK2dHNHR0WWp2WTFGd1F0WFRXb3MvZHovWU1UVHpN?=
 =?utf-8?B?NnhoWFYxU1BuWEk3N1M4d2tGaXN0bGNxNDllSzd4YlFQZGhJbW5MeDFpeVRQ?=
 =?utf-8?B?Uzg2VlVvdTJPUlg5eUtNUFoyN1BkVVU5cGRmRytYMDdYWUVyZ1pqbDJmQ1lM?=
 =?utf-8?B?VUp2b3R0YzJ1V3VhbXBhSkxPU0dnVitYNHpOeGppckNoQWlOUXFsOWliWTVn?=
 =?utf-8?B?NHRmOE5XU1NwSXhwbm1FeE5mVk9pSmVDcjNlS3dVUFpub3Rzc1ZGSjNKaWp2?=
 =?utf-8?B?MHB3dGc4ZEllQ1F6VUw5cFIxMmV0c3liWDlKZlpTNytwb2czbzd0M1kvWWNR?=
 =?utf-8?B?cnRCL0JDdnVqRWFwYkpadmUzdktoUlpZdjlsOGVvb3llYmE1elY5TndtK01t?=
 =?utf-8?B?S0JTN2JBTjdEcnlCMkRFYUxqS3gxZjkySlpoYjJGU2JvazVaa0RmUzdZdzNG?=
 =?utf-8?B?ODhRbDZFdWg2eGx1ZUo2RmdPdk1iR25VV2xOU28yUTExaDIyQWhlYytLRWp2?=
 =?utf-8?B?WjhYUDQyVDBTbGlPZ3Q4aU1oMHZPRW5sbTQ1Z0d4MGlra1N1cXh5akgxM3JG?=
 =?utf-8?B?NjRIc2VLbzFSTW1qYlFyN0xQV0xzR21XOENnQTdQc1M5aUg5UmRhcndpMmxq?=
 =?utf-8?Q?IfDX+wlTMLiihsmzvzp+Fx6urcOulLhZbtRbD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e37020-f34e-44d0-6fe5-08df246b7d38
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:06:59.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rshwMS5TNHXsxVsPgjbk3u5ZUYC/GsyU0gQUyj4bIpQlR8BqSdLr5YTheJBwTSazDOzDtKOmJG69lZDk9Q1AmT9m1Wj7iQxmWZJz6GUvG2sq/2AR/P5Qxh/+aVagy1P7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPF8C695F6EE

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

