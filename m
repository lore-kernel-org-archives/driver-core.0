Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6647D53979F
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 11:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075632; cv=fail; b=o9sXphzaiTe5/1E8NT40WfCd8pU9OzEDuPTcO2qcthiVi2terdHnsb3WHzBdtNnuii2HlOySG6oxkMcClz/b1r1xENycEA0yqccFkOrJEm6p7AF4H/uOKxY7UwGf6rLRJ7C5oE9A7m/sRlcRbIUOX1yNLWkdGIFItbEbfOLzw7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075632; c=relaxed/simple;
	bh=63A2AFH/qGSjediDkS/PvJ8MNNDbSwsXZkG+Qc1w33A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kjcrtzHJ668qAv6FCyaX0sIdEZihqZlS40CLXmdvK9sRx3MyvKHjG2aMyH1N1h4MSjv8EBwB1gz3ck7gswlv2uXXCnyhUZVCwrvTnxnx232ayIAj8DsZftK7uCmACd+HsWChrZthlPFxQ5n2QcNGPX7vBTmAuZm6IZMxAqqKXO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R4RIg7XV; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R4RIg7XV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wk3j/lA8NaqZhH8OjC5gBLSXSJhQykUIwjWEiG5RCsXpEMjzmZhle9gBgtlvPff7UNSIsYxQ8VzoYgoe9ZQkaRZf1h1SmyBnSlqGcBFtFwwcwaMVEDpnjTnsL2R3im9mnavNDIOsPjQgK4zme7bcF6TDzQHHhNvwKgHYgPl7VpdYb70PxIByUJdQe3xGwwmxsKJujgTgoKxpnsgxSrKrMUTPUYjT2vKx8Y9sXEtG5+lP+1KfTUFHLZJMlrOyoGaedkJ2U8f0kRX+JLYweUzBCXNyGh5Td/9h3BxqeAGl8JXvRePBt4ZeSkHC9qDnRBq9JvjM1FTTsGiibg6hMtYdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiFnZQGSXcOViRbBNJ7tn3Qo5hszctgk56ZUFp6TTfg=;
 b=P00tJuiwVgPn4+mzY2auuAFv+wC5isnNKG9y2cEDLc+L9GFMpgSRp4Pzj5BoG3EktCErjotMv6VQFG0aBmxlIaulEtRAA7LBQpFi0tW2j5v5fNpWe+Xh9R0Yq2QEVydiZVZ1NG8GKKgsw9s0sGUBF31rtsIRlXk0e9+KulYPkTVCrFk4zoX6dMWyUWqkGunqJ96fErKoX9r8ahOY57nYkD7OAEziPKUvN+rfbGvC6ofc4sD1aTlP7WMU9Tf4qk0Nvayq3P5ZExx3UQjgVkd0wnbEvrMOPVYuriIO3bXWaNkJJV7utAdYpHMvE/LuHmsqWq0nRRj67bHe6ef/XQ5jhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiFnZQGSXcOViRbBNJ7tn3Qo5hszctgk56ZUFp6TTfg=;
 b=R4RIg7XVcZCzPqhsSMMZ9mEPkTmXR8R+vjGDubrEWww37Djlc3DR0gnyzC1r7J4bbjVXcDNsd9+RfBQgvPoTBy2726NbgqMS8eZL8YoyjV8ZEeI9kZ0wVVqngD8F7OXAhPLP02qOSzAW/y0ZarD+1yvNVx5/QNqBmUspL2QB89r1s2iL5uTWaNBR6+tV0qn8J7yA01l2Fs6UHeE7TJ+L9f01Qp3zPXjbOCMK1KY41HQEvawTEZiJ+G7gWl3QYsUkfsfzmms98ytoeNQnlWv1cvALioTlP6cULVv7+zPlMWFiA4DAKDF3mrv3O5GluOikO9synsLBYBzbDDahLn2Rhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11191.eurprd04.prod.outlook.com (2603:10a6:150:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 11:13:47 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 11:13:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 22 Sep 2026 19:10:58 +0800
Subject: [PATCH RFC v2 4/4] regmap: debugfs: use the regmap scoped lock
 guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-regmap-lock-guard-v2-4-0c9d426427bd@nxp.com>
References: <20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com>
In-Reply-To: <20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SG2P153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096::21) To
 AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11191:EE_
X-MS-Office365-Filtering-Correlation-Id: 448e6134-dc60-49c0-ae95-08df189a9243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|56012099006|5023799004|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	MbnCjV85BXUqedjNQMbaHyD8hvF+Jp32n7Uz6njTCCR8fGtfYYG6if4CU4dQD6kOQ/QdIBgirNabHaxSjXzZ1l/OyF8m6+YoN+7DjFfJ1e+D3+CjAlUM6hcsJRhfq4frupywy1S4BRdrjalo8bp2IqaVzHsl87Sr5wGM1MGWHetuGxF0+8npZmmBUhx/2M9z/TwBO24Zwj1o0wfu6MB78UL+tEluXhayaVhVXoyeUHEAKJfWEhdNLLoxQY80zKs9B80RMz8SzKenXv/PniHD7vKxtwxI7j4PUeUTYSqtK+WvjlycTvLlFsyfqMAPgFzdFiSS8AUpnZT4w/oEDTWYneLXV0BxgV1wA282nCmkDOoBX/T0ZAlzr0WZ1Ub6T4k8kwsea5Abl+WAh0yqqZY8dpWZ0kxGrX58hW4AXAo7fRo7LVbjm0N8qT1IMCpCOy6oaebqoFe+bhu/2I+qfXv0f2ARrF+X1MDMRnQCOZYXft+Apn41AMAoRosLThb8IcImVz++SBR+ikMBlAVIfU/8o19aYdiiKNlINUa1ID4YZP8inZkQLHLW/arLLpplUyX7Fm4Eegjr/egAov7MzJDKJFEnGvKzJjcpFbURpyuIgWD5QXuPz6v1Be61bF9tXt+IlWvzGpaxqmweBiD9B9KMaKVDVO4+Cnnk8f/hbsx+uxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(5023799004)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?allRMisyTzJWaktZMHBFVDFvT3VYQjVoNW1WajVpd3FRU0F6V0tUdTlwVzc5?=
 =?utf-8?B?Mm9LcHA2Z05FWjZLOTlpMVJYYzlyWjBYY1BPVHdCblk0ZGtNMFp0VWlXRm5x?=
 =?utf-8?B?SGQzOHpDNFhXZ3U4b1dFT0FNeGxvaE9QaGlUZW1lNUp3UWJXMS9CaGpCSkdw?=
 =?utf-8?B?ejdmaGp4aUNiUGhIS29YWEVHMXFwdXRIWnR6VVZldFJ0ZUtqTW9sbkZLamVo?=
 =?utf-8?B?aVlBWXRxbTBsNUxtTXN3VnFLMlhKeUhSa1NnaFMySG9QajB6MzFGN0FtVTYr?=
 =?utf-8?B?Tk5scHRTRVl0ZTM0UjNKZU9QODZORGZFeUp6dnBkTXQ3ekhSOG0xVXJGeCtX?=
 =?utf-8?B?dEhxVnhOT0dSWDhLTFNya29nNVlkYjZnRDZDajFVOWFtcEpuL21uR2RGbjJv?=
 =?utf-8?B?TWx6aEJwNW5FTmxzR3pOQ29uNHlmQnBWN2E3UmxZOGNFR2JFVHNWVmEwbWZT?=
 =?utf-8?B?dEJCaGtBSGlUQ1lGd0xKcWNKM2pwYUVFS0JnYVZOTnN2QnZhM2YxYmU4VURH?=
 =?utf-8?B?bzRzdHUrQWFJZmJLK2NwSm9MZDZXN0dydS9oNDVYcVBxYjdlOUNTREVFWUkv?=
 =?utf-8?B?dk55M2lLbVhVVGorb2JxbWJSTzBJdGV2bXBES0RTcmtPZ0xKVktteFRReUI0?=
 =?utf-8?B?OE9hbjBwVnJzUVZPTXBZUU5VMnIzODN4eEQ5dVVzZzNVOUYySVU2Q0p0UVZZ?=
 =?utf-8?B?WjA4a1lPdTltQUduVDgzNGo5a0NUSmhaZHMvL1lVQjloeUpIU0hUWGtzdFkx?=
 =?utf-8?B?MVRRRDZ1MWwvbXpqUmx6TjFmamJOUndicytzamRhYTR6RnF0N3Q0UXNobC9W?=
 =?utf-8?B?cFZaV09RVFNjbEhtU0VMcENXZ25QUGNWWGcvK2RoVi9HNzAxbkNDRGRyT3Zy?=
 =?utf-8?B?M2J5dWdrVDk0czFJTTZOdzQ2NVJQcEhOaUhCRmRicVRxaHArVTExUmcyRlhk?=
 =?utf-8?B?bjQxMEZ2QUltejBtYkNqV1YrOXloNHBHNGhJUlZwelpzOVlMamc4T2o5SG1n?=
 =?utf-8?B?UFpuaDgyZUxib3Y2SEVySDJTeWNVcUlaOU5nODZveUNmaVg5enptQ2FzYjJY?=
 =?utf-8?B?NFAxY0RLRUhPTzhaWE1IMEc5d0Ntb2tiOEowQUFORE9FYkdRZTVsaC9DdGVB?=
 =?utf-8?B?OFE0UUpkazRQd0xwamVsMG14K1hqUzl0eWVvMXNMSFdnN2dUS20zYTFFNWNV?=
 =?utf-8?B?a3gzTXJvYk9jNkNsUmZGc0tjQnZ6VDd2K2dQT2tmMUw2eXRPeGtuZWlTT3Fh?=
 =?utf-8?B?OEEvOXVvc0w0S1lFcnoySXovSWdvbmIwK0NkUzdqTVAxaFM3VGJwQk5FYVFj?=
 =?utf-8?B?UjVMZ3Q1Sm9DS2x6QmVVRUtta011YkV3RHBxVy9iK3NvaTZkUXo0azFsaktj?=
 =?utf-8?B?M01pK0s0YVpHKzBMbUJjZFZrc05LWS9jVC9oYmJHdHZabG0rMmY4KzU4ZWI3?=
 =?utf-8?B?ait4V1FEVEszb1gyelFUQjBRNWtzUjV2eGRUVGRRN3JDY1ZMRk9COGFBUVZv?=
 =?utf-8?B?UlFQVG9JbHZ2dGVrWXh4NGdjWWl4QWJJKzJka24xaFlFR2NLZXVFOUh0Q2lk?=
 =?utf-8?B?YXJkMUkrWForRCtrUFgvbHJ0UEpXR2FTT0ZOczBOajcvemJoWUhsSDA5ckRD?=
 =?utf-8?B?UzdnVWJWUDR0eDNwRkgvdklXUVRRR0lMa2FLR3haV1NuNkE4d2d1ZENEa0No?=
 =?utf-8?B?UlpKdkJGSG1kbzNRVHp3NSsvUzFxVUpFTmludTlDU2ZpVXpVdXBGdWRPbUQ5?=
 =?utf-8?B?QnlTK3RaRkVlY3BZdC91eUZiVi9tT25TWVc4anBvcWpFSUZKWFZqclBHdHJK?=
 =?utf-8?B?dG0rdk9SYTRTZzNKQmw2ZlZraE1aRjRrSmtDN2xIOS8zaFVTcXZ5NXFaSlFt?=
 =?utf-8?B?VkRDR0FhaDRiRitMTXYyeGQ2d1FCQ2FYSHNVNk00YzZZbzBTeDIxMjUvU3dP?=
 =?utf-8?B?UStHenkvalFyMmRDcFY2a0dCcmZIeXpPVVhPK1F2Qmd3WGZpMHg1SUdFbERQ?=
 =?utf-8?B?aDV6YkYyTWE5dDgrZDdSNHhPMmNxTnNPU3JuNUlwNVhweHpRcml4UmtZc0xt?=
 =?utf-8?B?UWE0Q2hEcnE1bSsycFd3TlluMWpVOXoxSm8zbWVyS00yWEN0OUcxM00vN21y?=
 =?utf-8?B?emVrcnhoN3FMTkJtdm1ieVRXNi9WUDR1UUh0ZGdiZVNpWDRqUE5kcGVXS0g5?=
 =?utf-8?B?Tm5XZXFoSVQ0V0F1cXNFQWszOGxvcjhhcXE0SERSTDYzMk9BYWpwVUdyNjVv?=
 =?utf-8?B?MFVyNng5b0JtQWZHU0xqZVpURGNYeTIxellnaWtzMDdBMFZYczhhVUlKSmxv?=
 =?utf-8?B?VzFMVVZ4MS91a0dsK09oRTlUeFRNUFhpU3pOZC9NZWJ5STRNN21GWnE0RDhK?=
 =?utf-8?Q?pAj5VDJTDlZr6+qhDRhOp8GDiK6oHs+7l4yDw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 448e6134-dc60-49c0-ae95-08df189a9243
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:13:46.8859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GGARSg1s9tPSTG0pdRKK9m6IdMPjDXmzDldmuHah08W96Hvg1OppP1jkcYUmecl5hixatZOwlxd28VWH7UFagAnXf+KtsXklFg1qjDwv8HHURYcCaPOrbP9D8K4jcCG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11191

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

