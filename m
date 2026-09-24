Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72F3BB9F4
	for <driver-core@lists.linux.dev>; Thu, 24 Sep 2026 06:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231631; cv=fail; b=quLV9YJvgvicIQN1bL/s8o7sV8Bip0HDy8YIshEqEO0gp9fdUaLBHyUq0eJB5LEilCcNycA3y7xCSaUyau1kPCxutrLeicbmsVW8Ex8jiQFE9SGG3A09x83QhwiLTrTfiVWmnIjyl9jXwi9jcLzTImI0cyol42ZlH7K7SeiLW3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231631; c=relaxed/simple;
	bh=slD5vePQHyydAgQvsga28Bsh7TtsVqnlEF4YAalBUg4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N8X/O91SVatYA+dGOFFOqXJKx7qeKerO4bCGBiR1hNnJGT4UZ+PYy2V+gO9AvQ8vhh1P+0DOL+nYcjI+8bq5DiUsiZhhKl3BuviSifkDSL7Nj9Yckwni4YyMdZVUf2FgwcNHxPHPbD2injCCHBOn0sGlQb2nMkcZBXBqT7Sptj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L7oPksrX; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L7oPksrX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYO3+P4bmu08S4gTzCxdqgyphEvyfu8DliMiBQUl6JGJEqi9Hc7ABSx67Xue6HcssLS3TckSsWMVSKGycJguUIjAVurbwzXd5VdZwP2m89yRcFYo6QnzVEoWcc12OWpkYcr1Ps5hK6F7CAvbvKJFfdV7jT2Si6Pj2h0YNc8yk5UUbggZm3n/10EAWdMTWgSEywOkGG3lmo8b+V/XRsPSLGKq7VuY6IRh2GUX4iW6dtSyi3iOY8bba1PVVbUpJEOY1y5AmLxUb9t6Kp1k4gS0DZZGM4D9LTfNnBv347/MuK3aMxk8IHfgg2+BVkmgi8k9jLWyUevmhTKq9/U8TBHAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ye/bCOqMuqEymW5eVsUlkGLka9+seqW8ZgGi8MkS0M=;
 b=CDZqm9fUVkWEKktXBBZlMqXZYa96eL7LdDjnQNrwG/OSsyC/yAhCMb9tsRKzLnGEnf9etzEDIWAOtH8UxW3Xtv7fIjw+EQz5ywFucOXIL4rkx+ClwZUTH1PwxnXKjnGnS/OQn7s1p2wxxv67iBbYLlv5aayWOkBcC9ODMMMHcGgP0qblsWTw84LTPu6QgW8Y+rHWVCfwAF7iWYvbbbm61lFdeBPny/oUgZQif/3DCiKSWSbxaWCzYh8pDve4n+a3z5HZveeNpuzqdlqDJECokXP33SwLBLe5aKwF/D8tuv95RfUESmT2HGRDXGUaDrSKsIbRGJJJjsONVozcpQWTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ye/bCOqMuqEymW5eVsUlkGLka9+seqW8ZgGi8MkS0M=;
 b=L7oPksrXHld89FD/7e74pgsWpuQjkRzcU0WzC3qI6l+52esgTixpQqYNWnwGq3lbpIoz2cGzSQ7EC+ZokI0NIjv9+H+DyI7ynNTb8xZ57uZ1iMmyoys36ofjMYAsW7sKqT7wczE8gOXz98zl9rDLsDURHhUqgpKHmVbS6d5w6V5m2Tifg7TSBP7ZXuHQGw1RCU3VRh05XiCH8qb2OS+1oqW+LEsIOHA6RGInLezb3VqNxtyFSDmEMeXIEUN2DnTyMEXtZbIMeFSl7rPoyhJPgB5cdM656nMNihPJ93pfkpXepZ7NDbOLJOdDy7/PD1MnvbvpGjEiNH290DZBBX8n6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM0PR04MB6801.eurprd04.prod.outlook.com (2603:10a6:208:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:33:47 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 06:33:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 24 Sep 2026 14:30:53 +0800
Subject: [PATCH RFC v3 2/4] regcache: use the regmap scoped lock guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-regmap-lock-guard-v3-2-8a6127223c16@nxp.com>
References: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
In-Reply-To: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0236.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM0PR04MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7231e1-5849-4936-7230-08df1a05c9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|23010399003|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZuSq7tuZcVR263llR9TJlN+f7rfK2it1bR6ySXlW8QY9617C6A08SaDbKquVQugl+G5U88WZLQURfSRHWBOrYsaiy8NBCZR5827Wm905W4a/PytJ9BnD/1v0YrygyZl5WbVInCTw9gXkUQA0vc66o6pmVOIIt5wG+tPkEXKa/LYHolbd3CyW+Nd6zplKCs3AGiodVVAg/4ty8VORhh9p7W02hp2B4tTWhfAlPw7J0uWgq9r+BF50CkVngaPCbJuMWbiSWWOJVMDEQ/QpMjr+1y7D8VuIGMdXAskmgglHh7Ofy8RT01Pm1TTEXcUzVOv9Nq+cDCXQrrGeQ/XX181Aw7V3mHnWOQTDgQukzX1XY031qHR69ieHgqIVUwmnWGz9c3S5Ui8Xjy733u9s4oM4hCM6/6tP8hWWF4RdBFsbOqTPU6gHyvsXgKd3CugQjAmryuKsekd8NVpAEIbVK56/FQyAXKBUzzfgi0k0ae3muBSESo/hixao7N4ZpObs5LCpdZhzynjO1+FHAVGIvV4lDtYAmYcu1NIM2uGx3zcs06dX4enC/MQrH4b5Xnwm3DD9qqx1jpB9A5YKcsLWBsIgdrbcfnbvXWtH3sVfJrF5TuOPAgFWFLw7kWxqPE6gUcpo7OMxVwiWY33SFQ4NFhxNwM6ojH6adtcvZVE7eMd9zqY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzF3WVVUaWtac3Y4eU9rZWVIWlFlVnpMZ2tkSGxFbFFUYk1wQzdBVnQyTnAv?=
 =?utf-8?B?bkFHM2txTkNWSThDTlpIakgvS28xWjdnT1dxMkxMWW9jMGtZV0ZzYTlFc2ZK?=
 =?utf-8?B?VWl0SVhyOXBBTjQzMm9aZGZEbE91TWNQc1MrN3g2OWwyNDZmT1FmVkt3MGY0?=
 =?utf-8?B?Snp1cWtETDdNeTVCRGJwaUVFOW5jenFlTUJoa1VMWUpsVEd6cWdTdGx6cmk3?=
 =?utf-8?B?cjhsMmJmUUJHRFRCZFdFVjJGVVZMZ0ZwMnFGS25OTVdZV3VBdlh3SFNmVWxn?=
 =?utf-8?B?UDJsSG0xMnkyVDFMMHV2VzBqN2p1N0JPVDlZNmpZUXhhWEM0QmN0cUhmdUpw?=
 =?utf-8?B?Z0pEdHI3c29pSVN5aFdvcS9GUDE2MktheUNjSzFES1kySnl6dGJ1YW5lMHQx?=
 =?utf-8?B?cUZEOFBQTk8rOWplSVZ1cEJHTExMcGVzYmdDNVZxYjRDUW5nYU5RcnAydWM4?=
 =?utf-8?B?Rnc2VVV4YTZMdDBFZmk5OURLQnpKTis0KzR4Y0dvRUhwaUZ5RE1ueS9weWlP?=
 =?utf-8?B?dzlUdjhmZU1qRlRPM3RwVFRYVHdFaCt4Wm1KdmhETE9vYmx0enExUnZHeW82?=
 =?utf-8?B?YTNxa2xJbDRmMUFtd1ZHRGdEZ0NLUmk0elkxRDl1M3JXbXk2MkE4OHNDbVZP?=
 =?utf-8?B?ZEpQSm1SdzYxcWRsSTZwa0JNSjg2bjltMWlLbnMrUDNrOXc0amxlMFo1OGxq?=
 =?utf-8?B?U2xzYUpEOWNSNUhpb3cyQktkV0NBbWFrT2hCdGFLcjliRHI4cHUvc1VNb3A2?=
 =?utf-8?B?Ui9DWE8yekUzRFFMWkE2SlRIYnJVbFppNlAzc1B3WGFNSW5QTlYwNy9xNkh2?=
 =?utf-8?B?YmE3eXphbkhmN3lLTTVDLzVNdWdNbHNEOS9hM2hsOHBiVnlBbm1Jc0hwaWRk?=
 =?utf-8?B?cVhiczduMVl2YUh4MW9qQ2NUWEpUYUJ4ZlZEZkJ5SEhQaVJjRnJUTVRIZmJ1?=
 =?utf-8?B?bTNqZ1VnMmtEd0lHenNXdC9hVGtKMjgxakZwZ0dEM0dXS25TY01WeXJoM3BE?=
 =?utf-8?B?NGpuL3RtSUNCMVBmN2p5Q2FBV0xsM1YvcmxUTkhnRndIM0pMUzVJRVFtTGlv?=
 =?utf-8?B?RHkydjRibXBlckdacVROaDZObTlKM3RMYVEzUXVIeVNFN3FVK1lOR0dNZHho?=
 =?utf-8?B?UkZXYjY5UmZBLzBvN2hqUWdsTzRzK3dWdTdIZkdRVDJhalhzcEhUbEdlMDht?=
 =?utf-8?B?VGtyOFpCOHg2QXlOd1BSQmx1VENZUW50bVhMUEE1eE8wQWw0SldDTTN3MXpW?=
 =?utf-8?B?SVQyNlRMaVRFMmVkWng2Skc4c1M1VlJMOEJ4d3BVVVJFT25LSjU2SU9DT1B1?=
 =?utf-8?B?SVpsS21HNG9OWVRtRENSUWZMRzRwZVZTanJnQVY4VWpxRTByd1lleW1lTXNU?=
 =?utf-8?B?eXpOM0ZHaGVoem03Z1NhWUFaS0t4VFBxd1hGOXpmK2hVU1J4R1BQMDloNG1Q?=
 =?utf-8?B?RGV0ZysyNFF3Y1VKSkVkZEgxUlFpZnFRSVhlRmhpaVozaHdwdWgxcUR4dGd2?=
 =?utf-8?B?WGYycWVYSHNLNXJYQ3ZJTmxDZUNhK1o5aVQ4MGVJQzcwcGNEZGg3MXRRMVkw?=
 =?utf-8?B?RWVhOWIyZTBFSng4RFFtK2dlNDUwQUZQWXFCbGl6b3R2cUJIa0s4eFpObTFz?=
 =?utf-8?B?aXJBaElUeGk0RXpxWmtqYmlyd0EvMDM2b0tYNWVUUlpxWlQ2TGJGb0pWOTU1?=
 =?utf-8?B?b2dWL1ozb3dtWWFOKzlBd0Q0UHZyaWU2MEJ0TFZ4Qm81R2JybHRvQzlKbGo0?=
 =?utf-8?B?dGs5ZEUwNUhSSzFRelJRRVF2eHlNWFoxeHVqelUzY0VSaXRROHJrSUtOTGRZ?=
 =?utf-8?B?NUw2ejZaN0lISk5lN0hLRkhORHgrZEU0dk5xMG1paE8vVFNVeHFWcVJSbUpQ?=
 =?utf-8?B?Zk5VRWZIaFYvTytLQjl0Y08zeVo1RWMrSVB0b3E2ZHNFQjNTeE1WMDRoWjlN?=
 =?utf-8?B?RVlwd25pWmdFL0NJSGJkVCsxWFVMZTF1ZVA4SlQ1OG5vQU5BcEdCalllV0lv?=
 =?utf-8?B?bkVKMTl5NlVzSlhRbFNsMXlxVVRxbnNYUzB2UkV6UlJYckxHWnY0TnR5elZL?=
 =?utf-8?B?R1JVSXZKeGdSeUh6M2o4UGVlQVQ4NUxpSDkrVGpjTEx3WjVPUzJKUjNKWWtU?=
 =?utf-8?B?NUZta08zeDV0TFNKcDN6T0RaWXQwMmtZQ2FCL1lMUFpUdWJveGx2Z1Y4T29o?=
 =?utf-8?B?UnRFUFpyaXlsQzlnU3pPRjZQMmwxQWdmY05wVW5WTk83V3VQVlpvN0xwa0tx?=
 =?utf-8?B?UnJwVDNpTGxiZHlFNXVqU3FjakhrNWl5S1BBcW1XY2RjUVFkUHQvYU9TbVpP?=
 =?utf-8?B?L0p0Sk9UU2MveG1sZkprOW0zQUw1bkxzRlpYdjQwZ09NSXpmZmFhaGtDRTRr?=
 =?utf-8?Q?WpDRd4kCAVu9smyist8ui0dIumn/54brrjnIx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7231e1-5849-4936-7230-08df1a05c9b1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:33:47.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgVs7Jrv7DQyvXAaD6KJ+QTfCBBzzfo+C9AfRLwvIbEea1luAKpiWpW26FvmhqZYy3etKFXWhg5ey2FmEupQGzwR1wGyb0JTCmul7PurKHTCUicrZZQ55/fP+LjKp4e+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6801

From: Peng Fan <peng.fan@nxp.com>

Convert the open-coded map->lock()/map->unlock() users in regcache.c
to the regmap scoped guard introduced for regmap.c. Use
scoped_guard(regmap, ...) in regcache_exit(), where the locked region
is a subsection of the function, and guard(regmap)() for the
function-scope critical sections.

regcache_init() keeps explicit map->lock()/map->unlock() calls: it
has a goto err_* cleanup ladder and mixing goto with cleanup helpers
in the same function is not allowed by cleanup.h.

regcache_sync() and regcache_sync_region() are left as-is: they
already use a single goto out unlock path, so converting them would
require either mixing a goto with a scoped_guard scope or restructuring
their control flow, neither of which is an improvement.

No functional change.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 0d58d900a2ca..4c80db5d6f6f 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -281,9 +281,8 @@ void regcache_exit(struct regmap *map)
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
@@ -584,20 +583,14 @@ EXPORT_SYMBOL_GPL(regcache_sync_region);
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
 
@@ -615,12 +608,11 @@ EXPORT_SYMBOL_GPL(regcache_drop_region);
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
 
@@ -639,10 +631,9 @@ EXPORT_SYMBOL_GPL(regcache_cache_only);
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
 
@@ -659,11 +650,10 @@ EXPORT_SYMBOL_GPL(regcache_mark_dirty);
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
 
@@ -680,12 +670,10 @@ bool regcache_reg_cached(struct regmap *map, unsigned int reg)
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

