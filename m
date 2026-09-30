Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F373AF657
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761795; cv=fail; b=CE/aAZBFgPuYMzo4oQBCA+cVW7U1+lYoswlXuTuSnhqBlG293q5OfIOBpKZ952OMl+YOHRzsqtUv7VI5J9sqLnd0tvWZv97ywmOOrrXxbhA8dLoblUhVqt3jWqjF3TtanMsmYrVAX6Ac69MC6lGrko+7z+Sw8gkx8hAs1HkyM6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761795; c=relaxed/simple;
	bh=qhqKvpkB55buM/VylSDP/dTkqQ1odZtb90Kid60xVD8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hRQ2m2DvuTI9fOEmd+gHm/pyv5l2AQO1mlwPmoKhJ0Phyd34W5NrVFM8mmiZCcdA+tXbJz4YHZwC0+9lA3IJ1Y/sI/LnAdwLP62qU/vVMrVxBAQtgEDwIrB4bwfHqTkulbvD3cnfIFWUMERMhRWw3KDt/IQkiMKbPDSxH3H/oG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PhisL3nm; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PhisL3nm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkA4qnEYlAVX5p5WRDZnXNUw5EMwOCuJJZduZu62lP3I8eeZw09YccWpH3mPRDRK9rNccAfXrp8q6uWf4bRL5nGtmmB7HrA09F3QvsgJe5mzznUgDUHzVHTuJNe+2MQvexoQgBAT/ojtnVBGsoQXVgfDCfuv0nqKCFFHrxrysSSBZORkdlxh5GAfM/yz0Jao4+fWskN5atQpmVithbzYgvJtMAOfMEv+tIO/eUi4qSmvvEXxoJ++eLPygif/ydJEHwW3Zenn6OcJgtA8b+GpQqAzojfUyKxvScySnEl9qtR0QJZ/atLwiqVh2nGHJu+BmvDYbN+36cBIql/MUe32yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZF09Mxc3me51DrximCZ+/JZoDGZALrTSAuaEY9gXLMw=;
 b=KphlwVUMqOmSWluiDGOYskdbgdFDAjlIBaW5BTBcDEZPPS88KOaf/XOsVwtWKddTbLslmeSudag/Ru9wHfiUStdtwR3N/zu6tA9+wnnDzOgjwM8ucNfQI2a/Ow887n1DMAlV8f1pgxzze6hDHaxf4KC06MVmyN6+ZkP0fj+/CnAALdyIXEeRL/iX0Se0uuew7vYM5hgKoDHOCG6jQoVW10XH0GydA0tXabUheFT1/7iReIdoEYY/bJHom/FqHIVbkzB4z9Qr/a1wfy52oLhUtnK5tKazrnGt3alFAAZfU3VHW9nsmr7zn5aYcCrn8FxfTsxnf3loZRq4EBWwoNxLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF09Mxc3me51DrximCZ+/JZoDGZALrTSAuaEY9gXLMw=;
 b=PhisL3nm7OAnKZjjqWZGw+WKtH63CPmvyTSqSK9UHBWWiZ8m4YO6OLO+zilQWMU90cxW+c9Cwhg5ci4sDdu7Ix6xrl1KE3cjM8e4gXKriVhc9ik1PFhtVlh3dCRLFXa8YKtTUKXJPeDxlsVLRxmsqVm5G0KRHq1j+MYUXpIVxjl7aQ4NBfcuAdX4U8CvyMwmQbYOcR/KgI3tpZd2Rz8zASZ+bvvbVUELFppAlvRoLTZeepIeloEzsjeUoDmE2OvXqj7/LYuuedydCPCLdPps5V0k5NoYUnrSLb11op3Li1JFCq8lSrX2YzpRHC7wC7B/Q6r8Jdm2GAmffh3BiE/0OQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 30 Sep
 2026 09:49:50 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 09:49:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 30 Sep 2026 17:46:56 +0800
Subject: [PATCH 2/7] regcache: extract __regcache_sync() to deduplicate
 sync dispatch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-regmap-lock-2nd-v1-2-33a8a482f9ae@nxp.com>
References: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
In-Reply-To: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0168.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: ac65e75a-5299-478b-03a6-08df1ed82bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|19092799006|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+z6PYlfOqEsDMyIuA9wGB4fWMBYJPqG8pQ7+qzjIbTMroGbyONgNKD/CePT1NSFSFLaJ3waimtVHshBB23idshVKwpyj8MIGJIo/wETzmecsUw/tlyJ/VQP05Qz8kEaKDN1+LvI3a/nQlnr7rGoJsrmWDzfEjLUP/pPKY0xUFgxzbsNnmQBoFsNrApBvxUzb12OSFIVwJxFyiJ839vMfVqN0htBLgHxo2WysuZ4XuU2JBrCr2Q5uE6npkbHWgTNfWKMdYwDKCO8a/xhHxbPuRUtnubztQGPnBcoFpj+RgxQPPodffQhNWHQ2H3u660b+2UQWwJPetsYLKOnWLhipm5Jj+c4ARrv1dxVT+r5MFnT2Azf94o4rlUpCs67wFTS7IvZoKCyrEB2nvIv6YhbMPtAmVrVVukXwltTp2s8TrssLnXMcfVcxpqLqFUh/bfd+n7GCpOrETM8IvDR6Kj/Mk1per6ZEPnYlSpXVTH45M7dlaPeGEP3peFjcYWFIbAaWkzCMuTSznHb6/mpZzao4+15Lfa6SQBVAWsn3pa1QevHmQ/qufJTueaxdnG9yu+Cxc4PpgSULHTj+UcQNR/Hi2ENH3HkCilx5OVqZnka3yRE6ilMVHax6ZYXlwuxbtKPGfLKADlzxvmKQ5gBaJr72bt6QdCFuTMAG9uB9nWRrBHE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(19092799006)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFhZZEx2ZUQ2Yk10RzNLUW5RbmRqQXcvOVBjdDJXdU9jazVqM0NPOTBmdVdC?=
 =?utf-8?B?ZnJZTDVxaHBzdHV4NDhaSXlSeUtORnArMFdNbmVQTVM1V1VmVTUybjltbGRw?=
 =?utf-8?B?QmpiSytGa1Q2TUhJKy9FWWYwMGdBUEZ0TTJDTFpCUnFaMWM1eWpsSWp4N01F?=
 =?utf-8?B?Q1c1VElSUEJNQlQ3aUhaZmhCbis1S0NVWEk4L250Z3hqME4rWG44L2VDenk3?=
 =?utf-8?B?WDVUME0ySWVTaEhKeTNtNExraXNEOVZXK095YTEvNWt2d3Ryb09MQVRoN3ZE?=
 =?utf-8?B?QmNJRnpUS2d6ZjQ2bmRWdWMyN1lMeWdRTldiQjlrREI0Z1VmbFlEbnBTQWdB?=
 =?utf-8?B?akxtUmp5NzlOekFYbjZYd2xHMGIySUgzbDhBeTJUSkNNZDZKQXl3bjd3SGZl?=
 =?utf-8?B?NEVkRWJHdTJtakIySTE0UUlwOEhTcjZubTBrT0tBMEhOMmNLVVNDczFSUDEz?=
 =?utf-8?B?SVhYbitFUzR4cUhhZG5tbE01Y2FteXhCc3QwV0w4K29GQTdHVW5VY21CNmxw?=
 =?utf-8?B?dWZSbkNRMUUvb211SDd3YTZ5SjE3bEpOVUVmVTFJS2NGb1Yzb1lrV0k2dVVm?=
 =?utf-8?B?SXRIbjZ0N2liNXozeFBFeGYxcW1VaGtvc1BmRXZBQVh2SjlyRTRUYmEzVHpS?=
 =?utf-8?B?b1c0RzdCUEN6SkJ1Ymdrb05GSjFGbE8zLzQyUll2dzVuWkJFTTF2T1dlb1FV?=
 =?utf-8?B?S1JORzNLRzFsU29wU0lKNGhhOHVqdW9MUG9OOS9qTUx5ZVNWQWV6QkdPM1VQ?=
 =?utf-8?B?UHlBMHBYQS9jR0dVQnVVcUM3dUh1Qk1namtaYlRsV09KUUNtdmNEeHd0UmVv?=
 =?utf-8?B?R2hZb2RxeENselNSYk12TjcrUzZSTGVTTHlyMTFZeHBKMFhmZ3FtYTlJNlBP?=
 =?utf-8?B?SGxFREdiREYzVDhjZU9xc0IyUkx6S0diWENxeXVFZm5uWVlmTjhhNHl5SlpX?=
 =?utf-8?B?Ynl3c2kxYVBpNXBhZUZYVm52TmRwNXBxcENZb1N5U0NnaEE3NDI2Qys5TDR5?=
 =?utf-8?B?UXpkaUdBV2U1ZllxRnZ6YUt1VDVpdG5PMEw4WXZDWUV2OW9Gem1IdHJSbndw?=
 =?utf-8?B?SXZpeldseWpEd24xV1ZpL2doM0hPMnAyek1VYjdCb090Ri9oOStHTENWSEV1?=
 =?utf-8?B?SEFObEtjT1EvUTkvZXZ2MjhIa2FTQjlzVEIyd2dEUi91MkRHcFlZSDdkZlJO?=
 =?utf-8?B?SEJpN3BlejZRMTRwV2tRT2hrQWV3d3JTWVU0VUpZNTFMK0Rpa0czK2JQcmJL?=
 =?utf-8?B?eGltZlkwZUdaeUVQMEY1YmZwNkd3YXdaaHBoMzNPQUJFUzZaSWNxeVFJdWRY?=
 =?utf-8?B?S1VCL0JkamprYnYxMEU0OW02K2h5dzEvMGFsTUdIazBqaHhSMFFWSHoyeEtx?=
 =?utf-8?B?YTBVRFV4UnVLUllFdzhCZmJ1aXRNRnk2QWMxNm5vL1dzbU9mZkhBd0IxRHQw?=
 =?utf-8?B?VWcrUkszNDJleU5YRXU4eWMraEs5REcvditnVHRTLzErVHlMRDk3WVp3VGhm?=
 =?utf-8?B?N01tak9qRkY4Q1duZkp4emZCWnA0anhnOXJNZEZmdisyaUh0R3lJZXdGTHNK?=
 =?utf-8?B?MzFRSEltbWN2ODFEbkhWUy9SeGJMdDBnZ0xwclVHMW0vb2ZhNlh2THVKK084?=
 =?utf-8?B?VUFKYWprVWd1d29rcDgyTVRxUTlYZXpzSERkdU1rRHorMXNDbzAwVzJZMGlH?=
 =?utf-8?B?U2V1T0RhcGwyVlkwL3dYZG41Q21IRldtUjdXNVdBNTgvaE52bWR4dzczOFFJ?=
 =?utf-8?B?emQzWXJ2ZnNXOGozZ1RKQXR6NXZzcTVDWkNpd004emFDVFBBcTlIeXUxT2tP?=
 =?utf-8?B?cll3eHZGS1J6MTlsQ2tvd3g0SWNCS0kyMFZaR2FCSDNuT0lBZE9pdVJBL1B0?=
 =?utf-8?B?aWtabW9rQnhBOUdlb3hqbU4rWXVXRlZLZ1ZsSXgzWTVTMmJJRlZPSFM3NUV0?=
 =?utf-8?B?czl4UHFjM2IzTWY4eTE3eDJ2R2RRdm1RSUpGMDZvTVVnaW9ybVQ5UG5PNjd0?=
 =?utf-8?B?QVN1Tm5jUk9qVEY4b0NCdmRrWmxqQklOUkpzMHZHTnB6QythcTBOR1NTam1Y?=
 =?utf-8?B?dk1iK3Rtdm5XTzNYdG5IUXhrNzF1MjNEYXFmT1Vqd2E1NFhPYVBWRXNMVWd6?=
 =?utf-8?B?ajZaamh6WmtJdjVhK2dvM01ONVN1ejRDcC9JNjg1QzJ5TmcrMlAxRkJBdVd0?=
 =?utf-8?B?dmRITUFyTGhKR0xQTklMeWZhM0lJb3JmdnAraStnVjFvWmdjWThJZ0daNDdm?=
 =?utf-8?B?UVR6K1BzYTFFUDF0WTl1dHA0QmZja0MzUk1rUWpwU2hvdk9mcmRiV3U5UXBu?=
 =?utf-8?B?cmpUSm8wREl3UElvRTNvZVdyNnRDQzJYVDZyM3FlY0h5V1VUbEVBTnRqT1Z0?=
 =?utf-8?Q?0iYlHHZ1nn1sA013Ky7t1Ncw7cgQrmHDPA7eC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac65e75a-5299-478b-03a6-08df1ed82bb2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:49:50.6023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQZwbSuoN1ncrRFVOAlw5G9NVsoocYUf/XhqfCYk7Lf8Z3jLMEUPK6DT5HqwZbGgfwbFGRh2sRBThXqx5pvU+QCdXSB2wXk3dzOjDXyLH5E9MBHgIYQ2ClVLWRDDyCEJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

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

