Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011068.outbound.protection.outlook.com [40.107.130.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F773F86F2
	for <driver-core@lists.linux.dev>; Thu, 24 Sep 2026 06:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231648; cv=fail; b=m28mNNUYYDIQqQSZDTTU7GiMJipCKO2uLQFYpUtlqYLSJ8BVOenQAYOEKIA+qE/cRiQw9lN4IRWEVNo4hnmnlRlBCm/tcUJe1J88yFt61qUGMwOiUPV7sCdNaTB4bVYR898dAB2k3Jfh+9R8J4cqz+VGVIng8s64HmVQibjS/mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231648; c=relaxed/simple;
	bh=OXt/Nf09t+moEFHp5s7HR9WjjvedtNB3aeyJe/OM6AI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QdwbJOC3T3Zg9WLHdn2aMBHpUz2GfzEAkaK9hV+FKWdED1uMvtYoWBVdnhBOZOSh56Fm1iEMbH6tNWAUBWQ/XNm+ZksO8SGuuwprcRoaCldPX/WqasSCGMmLEYJ0pbPe1qVWyLyzQJxANAHtqXRP68oKkKfx4EjcMF92GPh1MnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fhnl4/6T; arc=fail smtp.client-ip=40.107.130.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fhnl4/6T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9xqO1+AyTH59RQfgQceXC8wTe1XZ6Y9M2eGL+WeEkgz71oOOxPZCGdlW9hPTeZf/on3XH0UKb/xRVe2lg6ITNLiYbmmySRtHqlptjD2a8t7+MfeOn6rgfuboZ0aD2+imLvx0zPWALzBHwTQI0PkUsQQd9Rz5BRF+OJfoFlRU2SkdYpx7RzkKgydWWMokz2MOq6T2BgIgMHb+2ZLsfewA/q1KhCLJ3IwU6wxMSdjPXss604v8Rd4aDHayKI5syqvDEI1WljCquhDr86vazdr0Wk4qqbMWgrwUr4vk4LXKJkhXCo70GhCYWrl8yjETMJbQ1gRdtJjesLyJ4kNal9/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PHkW3+0ydMdhSCEHxhW94JGKBaLIF4FG49wutR2tOg=;
 b=nMAOp5qe4p/aSQCr0UeEBqW46sj4sSBXBejhkjSW2ErG1U4KhnNi0FqjceT31hSuzDfqkCprNx7EXfB88L8BUtoKVgeWudUePJi8USaOi5cI/H0/T+qJ6k+RJsLrz8ZW/zfYUXQlj43Rd0gUhjydaLs5yVlu6kRF/nxMEkmU4UyXIDQ045Im0s+M3+iJ+VcoRpEn17XuQWL/PHb2/IkcmLkThcggBsvbeMe8orXcKWkvHVMHLGVs3yYemeG1WE4nx32wqCruPcQaHFHAYL2kR1aibQQg/AYxZcGiEC14zHth/ydaBxLB49yJ9YZsuqR/qjVDZXVzNuBxTj2Ycb2y7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PHkW3+0ydMdhSCEHxhW94JGKBaLIF4FG49wutR2tOg=;
 b=fhnl4/6TylzxJeQBdSuM76wN/NQMuRwmSFstbPcCwSFYew6j2QusmO7RghDzMP6hyR7u500ncY43RsRttdh6BqBektMOpLngEghT0BgArT8hlE61WW75FUGAyKvlGcnXyTI2SJj6ynTUwBDZcuIVtHwP/aoFeuvy7YqXpNM/lDQh0tCV4ubPg9uRl7N+876+OkpwAUV6tsT4h9XN0hrTY0NQdJfytJ4I2OTcmavkQSBmmjNdf12I4TlKu3L7w8F6Ed3+FiXY/qy7TfMboWRbRQkWlADKyLNAiVIKYaMOTHXMqobtrYCRCdCsLKI858GeSOC7RIj5N6tpLVNJv5OOSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM0PR04MB6801.eurprd04.prod.outlook.com (2603:10a6:208:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:34:03 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 06:34:02 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 24 Sep 2026 14:30:55 +0800
Subject: [PATCH RFC v3 4/4] regmap: debugfs: use the regmap scoped lock
 guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-regmap-lock-guard-v3-4-8a6127223c16@nxp.com>
References: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
In-Reply-To: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0280.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM0PR04MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: 804f4037-b442-4352-aa83-08df1a05d317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|23010399003|10067099003|18002099003|22082099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	59bEwz1irdIVEmylpwN1t5ARMxMnSD5987ZNU+M+YcedhcRDnb2Mbzb4j9xwawmSN7PUkGqL6vDaBz3Y0zUwWhltWn1zqe0yOy7kkiZNd9knK0uzJfbrB2IT/lkLUs3kii3nFx3V/yzN7y1RfeCmEJDur48rFcyGW0MMVFIS6MS2ItFR0sD2IOlNT/t+02H/XJqPsXiqNB5R5vLiboJEGj4Dyqa3pVZ9lB/pDGDyYAHAKJseNTuz+1d+pcNuistp0ElZHSxf5It0XEMZdpGHFZdKynmKJ6E5PGrZpZJfEpZ61ibTfYnGvumtzpFWv4fXY5QAPeQ2d00/kUKLCebHCmr240QBXpKycAKN7c4y4YWbAvHkQGiofmE2REr92RvLGTyyBPRwOzkavOg80Zfl71cdCNuG/Yz7t0hDD69nrmEUWi4tRSgL2zjcKJmiGNjk40sDXaUrVRAElP+9j+luI9KcTkZ6Xd/MfOBBldwOKOjO+/U721r/3JQXlF8Wo6fl85UHTIEdJ57RjNyY77RyBAzP9hLUwW4tASTO4mh6ZXSlfXzJMq5fByD4nqTBseiBlZwep35QugKQzFk/sKtoFs75ezPfpRAFbdoNJ18C+6DPisRgORF1ElY3Xswkl+dKZEZPV953j5l09JJ0TV7KBFy5AgsoA/JzcYn40FClU/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEFWamVjK3hBcmNXNEpsY1E2T25DUDhkaEJFdWxDdEMwUkt5am1rb0tZYmVC?=
 =?utf-8?B?UWhwS29POGQ0YmdtRk5Cc1VISXZVNkI2QVZzNmFvbWp2MEhEYmJXVTlOQUhC?=
 =?utf-8?B?QTArcmFhOU84MDZjRjR5L1ZLT3lEMGJhYkQ2c1ZIT2I5ajdpL0hBQmlKR2Zm?=
 =?utf-8?B?VUZ5Mk56MVo4OUxkZkMzQnFKblp0WXZrRlhkVWliTFYxem5ZK01zeWJwUis5?=
 =?utf-8?B?ZFQxTDNUY0QwYlRLcGVRVkd4RE5USlFqazFFYi80RlVQQVgzWEtsa09rVFJx?=
 =?utf-8?B?ZWQxOUQzc2VkUENOSzFvdGNZSkpCVlpsRndpa2FPR1NKa3VNYWlIYW0yeHRY?=
 =?utf-8?B?M0xISHFUL1lxNmwweGhyNzZNTi96WjZXODZDemJCaWxoTDdaenN1a3FkVnNI?=
 =?utf-8?B?S1E1TlhyR21jZkFXZ0h2ek42QkhkUW9ONitEdys4N2M0elprbGlzVGtZRFhQ?=
 =?utf-8?B?K0pBaWpkck1BdGlNd2ExN1Z3VzVSYVRTZ0dnWkRFeG8vMXVsWGl6WTF3eURX?=
 =?utf-8?B?eDFJMldTYnlVZmg5eTdYRzNoY3RUeUZtb3NOb2dwU3F5bFV5RWtFTXNHMzZ2?=
 =?utf-8?B?dUFEdnBraDR2T1FqTmVjeWg1dXZmODA5NE1qT1VXYVd3S0hsUW9aMVRBcXVZ?=
 =?utf-8?B?TUpkcm1FdUowam81QVlPQmxOdHNraklrYnA3L3hha2l1aXF1b2N2dWtWb2t3?=
 =?utf-8?B?TnJ1QytUeDg0MHJyWDE2L0tRL1VlQ0E1aTZET2ZpNnl4M29ZamVNSFQwdWcv?=
 =?utf-8?B?Nk1yeWhrV3F2RU1pUllGUFFYcndjQzhkM3lrNkVtUFVyMUlwdFI4cTJsSnAy?=
 =?utf-8?B?TTJjQUZpemo3V2loUkdCaEVxL0pnSzFBUU5MVXNQOEg2REVjQy9Sa1FZMGJR?=
 =?utf-8?B?MmVFald3NHk2aDIzeXIvU0hOTUU0dHUxcXhKbkltL0RPUkRCYUZSdGFpa0NV?=
 =?utf-8?B?RmVtZjkrRDNKZXI0NCtqdkxyRmRreGdUZGlQcGdDMU1RQVhYUGhaTUVKQlFP?=
 =?utf-8?B?dFVVWkRRckVBK2lhNU93TUgzbVRtOWNuVHpjeDJuL2QrWVU3bWlhR1hFZHNy?=
 =?utf-8?B?TUlIbzZmekJ0S0E0RmVkYmQwWms2TUFtcnFmaTh6aTJGdjZvMUxJNzV0ODZK?=
 =?utf-8?B?SmxMYy96MlhKTS9VM3prYThTMGZLSENGUmxmSnE0bFZiR0daSGliTklzbW1j?=
 =?utf-8?B?NkppUm1JcmVQeUw2K3RZa0NXb2psdkg1dUxEVXYrNTZBQ1VUNmF1VlFHUXRr?=
 =?utf-8?B?aTZoYjVKcmh0ZkZ1WlFXTzkwSUJSSzU0TEErdG0wYTgvcTlOTFNZeTNva3M0?=
 =?utf-8?B?NHIwNjJYYktvQnY1eURST2prSElhNFRjYkYrU3dyVFR0dEVmbDRXV1l3cTFO?=
 =?utf-8?B?M3hiNWJESkdCWGU1NUs5Q2pjYnhEWDkyUXZSeFgzTnNEYVk1dEpkRURKbkkv?=
 =?utf-8?B?bXY5dy8wSjBWRmYvSDN5alFPc2dNakptdlVGSC9GVkgvdFluTnhNR3ljRFNZ?=
 =?utf-8?B?ZTNrR3lzZEJnY0FnYXB0VHNESmNmaHpiTkhWN2ZNcyt3V3hpUHh0V3FDRlRw?=
 =?utf-8?B?YmpQSEFUeGhUQi84TlFNdml5S2JKaUFXRlN2bVQwZnRrWHRsa1dPTEhXQnlF?=
 =?utf-8?B?SHpjbllMZ2R1NTk5MXZnUjBZbXluaVdpcVhlYXo2bGFHNUJSRGFMTHFuMHBO?=
 =?utf-8?B?eXRyV1FGWWRMZTcyYTQxYVNVMHpUbGVzM0FhMFRaWnRtVjRqV0xkUUI0SXFY?=
 =?utf-8?B?S1NmeG1IT281amVobnV4clNjVW1jNUsrcHROc3RhMUdPNnpjQk1EeXhoZ3lz?=
 =?utf-8?B?Mk9seDllcVZVbnc0d2NmVzJOd0xTWlp6cFRta2tJT09UdXZXczhmV2xsWGVS?=
 =?utf-8?B?b2NSL3dVLzdha0NaQTNidGhWZkp2Y0FDTkdvQ3ZkS09RajBrNTZVeUZQWXJi?=
 =?utf-8?B?WGRsWWRDcTRrNnAwME9GL1JvYzAwNVhyREswZHBMWnA4VlhUNm51RmpBNnY5?=
 =?utf-8?B?WVBCOVNqemltS0dFMitZNEpBZ21jSE1sQVFCc3F0UThDaHkwQ2VVU1g4bDhy?=
 =?utf-8?B?MEJBOUwyM2ZCZ2xFTmNFNExWV2VMb2U2NkxzQXFmRkd0YnR1cHo5TE10Wmc4?=
 =?utf-8?B?SlZRZ1A3VHEwN0Q3K2VCS3dwQnZKVnBCdldpUU9mR1lxRCtXekhRME5Sd0dC?=
 =?utf-8?B?OE5Mb1hCOHhyWE9mTDh6UUwxQjBYZkVyR0EwMjhtZDZnamN3MG4rd0tNWFVI?=
 =?utf-8?B?ekRFL2poVWJ4TEt2RjN6TkpLbjZXWWVJWjF6UVlFcmVaUkp3WCt2WFJsdTB0?=
 =?utf-8?B?Ymd6WSszR3c3eFpJSmpFc0VQbVZQRlRTNE1yM2NqSVV3NkRNSERXcm1OS0hv?=
 =?utf-8?Q?3Xis1IA7URnpi3g22gRdz3NcWnwYe1jumM+hq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804f4037-b442-4352-aa83-08df1a05d317
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:34:02.9503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxFMMn+USHNzXrCcFaL3h53dAES5Hmeng993PIqO6XCm1p7B7OJU9e0m0/6m6XkdqPgvbyXxL3FwnkY2p/MJ8YrnC1l5f6KJQcOvTWQ79uGntnuJT/Wvxe6Ghy9tdjhT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6801

From: Peng Fan <peng.fan@nxp.com>

Convert the open-coded map->lock()/map->unlock() users in the debugfs
cache_only and cache_bypass write handlers to the regmap scoped guard.

regmap_cache_bypass_write_file() uses guard(regmap)() since the locked
region runs to the return. regmap_cache_only_write_file() uses
scoped_guard(regmap, ...) because the subsequent regcache_sync() must
run with the lock released - it takes the regmap lock itself - so it
stays outside the guarded scope exactly as before. No functional
change.

Assisted-by: LLM
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

