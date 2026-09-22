Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC5553A39E
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075618; cv=fail; b=To86lv7B6UbGewivjcF5iniwNmkrtq8Yydn3H34EJpL5k+reNrFGoxwaRCCcg/qKHa9lYy/bHJpRqMrdR8TWyE/w+kJ9k/tS9fUl0G74tmcdmybe3HLAsA9E7kIovoILg8hC39PR3MmQ71T4De6KRJXLYWfuNzawUh1RxSPrMcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075618; c=relaxed/simple;
	bh=cQuRanmRD090kakGkgI6WnaWm2d1UQYC2Dc6+Cv1fA4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MIDLlQIVIHrRTWUuiwqaHWWD/5GnSZj4ptf197HVlzgRPdtBgkUMwMB9FVwpESyV2ON6ZERBCnJ2P5UDPl4gybM1Rfx68+TTdskAmvtJUrwvsvFwjAKdaQUWib2uCZXWDfC3sh6L+PeI1ieqTO8fuoytRFj8Ksto11EvBdGKP6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DES4OHbn; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DES4OHbn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHGkgUlt5S7GtlPVM4ucuEA2QIFfBDFvyavtiWm/UiOG+nEVsaW0HjP4zkKyneGxZZ+NjgGzTqNXMe0ZqxXfY1OrjUTtKBilie8QVnNWcK7MmcorEtnvOrkauMdEqnccR9qxVg/GuE37OAg+nDAZEI86xwLH43obpOHsAFRrGvYBHEmNkarQP2fYM5cTzs8VzWRLdDkJURUMaA1g7NecjQudHKa3SEvPcfmYhJa/IrKDqwXoTy0mqY79uPyPTmZ/2YW6wM52QSs943C+iXmnKxJdaxIxvtpQjchYBt/oxOu/RoNN/Z8QbzozJrBS3cfo1IUA4lRKYwZJk+5YEoG+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut6Z2J/rq6iFDeDKjaXl/xl0kqDwRjAdahzlO5UrXdk=;
 b=ZiEJ2ev05NVFZZ53rmnxguqqU/7y1KLicmsawi5G7+bHbACxHXUmzQ+ApLnGGYKG3cwagaokbqhSFsJSXUUgUJEDe2uaKY5SmHq562kDmkQWZ2dUtwEgUd8xSrmasHJnjtErp5epHMmA4Z0f2XciU++KPkiVH2Dh+gxbQJzyTE3ulptL1/CrCL9J2gxW82dhOxsNMxk2VD87MLVak+IP7tMlesUTCQGBwhSKXNJm+vknqx33Up8kW39crJCtQAuqO8ZnWIqNEUnf7TZRyucbhYyOo+vJtldlUc153nmu7NmzVt+TizKPypc7VIgPb0CgM+wajqMriPhnDE969SWEEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut6Z2J/rq6iFDeDKjaXl/xl0kqDwRjAdahzlO5UrXdk=;
 b=DES4OHbnvLDPUIGMQeZxTnemmhBKgx61Gsqta09OtpX8o0zBdrNG76mbQTbE6kePUTF7gaVyIkDKx1jU8+ebRCuGN0q3ulY6eK2QNVA0mM3We4JoaD42zpqEYJo1qT7ZL9qHoh4n5/I7EHDIVf2wYoUBPUok4eib8aACCn8zEw4fsMggsMkvr7+lrIQsfM4Uzf6jOVCSKLhTke1nqF/yW4+EDvkjMKloA4pwGwXOIwvn52kePFf+vVaiwuTWjoJv5F1lhAIekeY1nb8pXg/WsJg0S/+dGhQZ/bLc7qqJohIbEBIega+HCSceMw8nbsrvFHNtLTapslvwtCVSPAsLwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11191.eurprd04.prod.outlook.com (2603:10a6:150:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 11:13:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 11:13:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 22 Sep 2026 19:10:56 +0800
Subject: [PATCH RFC v2 2/4] regcache: use the regmap scoped lock guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-regmap-lock-guard-v2-2-0c9d426427bd@nxp.com>
References: <20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com>
In-Reply-To: <20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11191:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ffc369-8625-44e6-27d5-08df189a8b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	5Wfquyk02CQdGKrukCD6UBQ8iNk018Jja/lSSoYR0CQ6e057BpnBC6JwdAFhjesd6Pboe/uwzGnRrNuTMj/7p1MjuSZqLFRrd9Go+4ifHKkoKE2r58wkZLJBRVhESKZeNJXgCPPGN3ZV9WEYNrv0L4Oie7bnqTEWfm34D8rRtriJl/tlXG2d8wThOBc4szN+G2icUv7/x6imTPLLcjYl8vx/uSVZ//mLmAufKWe0Fs97Z9uh5mT3tiv2xE+y2TMiU8XT+/4sCEokFCAjbRZwum0ywNOffjEubHZ74sskBuZuVj6cB+MUtvtp2juCzk1U1YgBdCgvaKQ5HaDNdLDCc/1eIaOHzlwO/Sibs1D+HJe+jR5DHKtEdSMXzqwGWVxpxp25PpfHxhws3ZRC8kHdPV0+APk4GGA9uOZBWKPBSQIKy8Y9TIyK3C2fODEDxNeod9lww6XHUgYBv1jjsa6c325UTXry4ZFu+fCyPvlTl1qYKqAqdb4U+HtLP3SCpxyZfRcUCYk6IR5hpl7C1/HKuF8RGf92bZ4t9hsV/APZd0rGf9mVzPQagM7XC27Cgi9jWWQDB1nrG52ND6bpXf1Lc2ZlxETky637LiS2BwxQS/7nlJAnIBjqlIHUEx7hiKHSu/UdNIthWj/Lpdij2GGmIWRD6dnI2dGaA6EjzhG+fyU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHFUY3o0YldWbVRCeVJBVE1IVUF2Z2I1cENGd2p0UW1OeXVmc3NkeGk3SUMr?=
 =?utf-8?B?MEp4UllVeWs0Z3FmNDFTbTFTbVBjS0RhS0NOeDBINFFpdXZsdmlLZ25mb01Z?=
 =?utf-8?B?YS9TTEkyL1NDMGRsZVVFVEt1SmRMZm9rOVcrUHgrK0ZpOWZUakNRNzFrSisr?=
 =?utf-8?B?NzNzSy93L0lzekpmN05hekVvVDlBQnJscDJBNWNKL2xwa3FyY0xGWmdHRzJJ?=
 =?utf-8?B?V2lvQmZmOWptWk1EeWZnRE1IR0tvWWRqQWpranVYMWliNkFCTjFVVkp2Q1hh?=
 =?utf-8?B?RjU5TVdIOWF5S0JKZ3labzBzdHQ1R3NKamJ2YThwMmR3aUxiNmsrWlplU3pk?=
 =?utf-8?B?RysyaHkzWGRRdG1WZkxjZGVQdC9OanFsUnlBZHZybER1OTNCblExeXRYbmJR?=
 =?utf-8?B?am9ydXl4VEpXM0pVc3pyanAxcGZ1UzdLLzlnbmFOT0pkeWc2MHZaYkFVbzN3?=
 =?utf-8?B?cm5tekZlelVKd25yM01xbEhaaStFNEY3aUc5WEo1T3g2eEZwd3RiaURNU01O?=
 =?utf-8?B?SlhqbURzeXlWVXRYRVd3WGRmVmtaeGVkQzVMU2xSZHVwYVJCdUxaUE1KRGlG?=
 =?utf-8?B?K1FvWGhERXBhZnRYZWRtelp2bFZGeTBGczVPaFFCVHk0TEhuWmJDUm5sQ1Rm?=
 =?utf-8?B?WUhXbUwvbnlaWFkvMkxOelRFQlltdk9TL2Z5dTJ5aXJOd0J2c3ByZUJxUnlX?=
 =?utf-8?B?OER6aEVUMzhaQVRnL0RVek9mMmpIUStPSm1uZmlMRzJNUzhTZytWWVdLUUZ3?=
 =?utf-8?B?dDM4R1ptMER2NlVlVW5WRDFBZmFrM0VhM2dxb254MU5JYlNEYTlCUXovK3Fm?=
 =?utf-8?B?VWdkK1ZtT3ovZENMTzMzSFQ4emlJTmI5cVJ3cVlkdnlidHQ2R3gzVXF3YWh3?=
 =?utf-8?B?RWVxL3ZVU0dhL0dSL29ZQ1F5dTY3Qmw4VmFsNFJVWU1DUUtaSXRobU5uWWhq?=
 =?utf-8?B?WDNqS0h4WWd3bU9KeFRENE83RFVBZjMzOVZBbVhRRVF5NzAzcUNUNktLbFdi?=
 =?utf-8?B?QVdFOFBMZ1V0QzdRTmdwSWQraU4xOGZGdEpBNGR0LzNJR2IzdERMVDVEdEFB?=
 =?utf-8?B?UWd5NC9Lbk54czBsWlViM1dmeEI0YWtZT091UmZoM1RsVFJLZzQ1cE9BQU40?=
 =?utf-8?B?a0pjZW01MDlQVC8xK0hmQk5uY2t0ZGJnYVczWitQNUZZbVpNTmx4Q2J6amUr?=
 =?utf-8?B?dlNiYTFtT1dIRm1HaVo3THdBVGtNMnZJVE1oRk5DcDY1MkxPd2hVVlYwbllR?=
 =?utf-8?B?RkszQzg1OWxOVE9KOVdRQlhHd0lWZUZKVk5ZamQxaUt3TVZxMThVa2FxTk9Q?=
 =?utf-8?B?WnF6T1dscEdDSTEyUE9hM2JIcmNNTkVER2ZQa0VwZFJRbVBNaWo1N3FqK29Y?=
 =?utf-8?B?MkxNR0FWaFkzS2ZPblFmblE4dlNwT3hmRlJreFBlNCs2cUhVSkQ3aWc1aDl3?=
 =?utf-8?B?SkJMeXZVdzBkWlVGU1FZZTNUMElqdldtN01KUk5ZQnJoQ3lodXN2aXFhQitO?=
 =?utf-8?B?MXBKQmJMUVkvemg3S1pWb2xDM2ovNW5tWjBlOVNRWEplV3hWaWhRVm1ocUU1?=
 =?utf-8?B?R054VDVXcnNka2c2SmhrZUVua2FIU1QrQkQzN0tGbnp5WnZmZ2MvZHpvcVhE?=
 =?utf-8?B?RnN1c0xWdURXTWpoNWF6bzJyeUo1dkNnampCKzFBcmxmQ25kVXZsYTBPYkxt?=
 =?utf-8?B?c1NObHcraEY1YWl3ZWIvV3F5TWh6TlZSQ1c3a0s0a0g1V1F6ZndldU5FeFp1?=
 =?utf-8?B?aUFwaTNTTnpDN1ZRa29LV0orSFVUUnhzY2ZEVUpqZXdhd3owaXZOcmxQVGh5?=
 =?utf-8?B?cTBSTXhCRzd0ak9JM0d0a2dhdFYrQkwzOUx6UnN1bjB3YWtFUlJpVndOdkxM?=
 =?utf-8?B?Wlk2SmdjNXpZcGk5b0tMWmtqOGpJSFpYYjBTalFielFWT0pJT3hCTjA1Y09h?=
 =?utf-8?B?QUZVVEF4Lzc2dExtZXZnVEFNMXhxWTZHRnIrMXZXb3dWYTkrUGp1UFNMNjVD?=
 =?utf-8?B?M2duSUpUMkdYWC9JR2FTSlM3TEdnZXdvbGZUNHRlUU10UXlqNXZQQWRWSk9L?=
 =?utf-8?B?eDg5SE8wMVRLemhLZWhTVXF6SmREVlJlZ3RZUUpkUDNqVzR4ejQ3QzJxMElK?=
 =?utf-8?B?d1hha0o5NFV1VWw4Z2lCTXRCazNCTmRLcy9Cdy8yQy9aQXVvaTFsZlhlZnBk?=
 =?utf-8?B?dkQxU3ZPTXljN3hsRXNCN1FEMVpzc1lSOFZ3cDh3dXBzU2tYYytYWmsrZ2U5?=
 =?utf-8?B?VW9sZ2I3YkRZejVXa2JmaFV3dmlNVW9xQmNTcHk5R1ZDdUhzeFlpcDV4dHh2?=
 =?utf-8?B?dFFXd0pTN2p6L3FSbVJkSFpnbVAyRU5RTWxuZUpCc3NtTzBoa1VlMXJZNXY4?=
 =?utf-8?Q?+GZ/I/oDRAINmg9QrC6VzN5yD2SGBr2AclhFG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ffc369-8625-44e6-27d5-08df189a8b1f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:13:35.2264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVuTqlhmDPqFLvQG/U2fA67pxX51HyLUkQC4vIgRarCPd4+cKydV55AZPXvnvanpR6f9X5FaMPQZAQCfPh294KccgMUoXBMesg38jzG296O3Ets2e8XRU5PKIbf47ZIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11191

From: Peng Fan <peng.fan@nxp.com>

Convert the open-coded map->lock()/map->unlock() users in regcache.c
to the regmap scoped guard introduced for regmap.c. Use
scoped_guard(regmap, ...) in regcache_init() and regcache_exit(),
where the locked region is a subsection of the function, and
guard(regmap)() for the function-scope critical sections.

regcache_sync() and regcache_sync_region() are left as-is: they
already use a single goto out unlock path, so converting them would
require either mixing a goto with a scoped_guard scope or restructuring
their control flow, neither of which is an improvement.

regcache_init() keeps its goto err_* cleanup ladder alongside the
scoped_guard(). This does not conflict with the cleanup.h guidance
against mixing goto with cleanup helpers: that rule concerns a single
resource whose lifetime is managed by a goto. Here the goto ladder
only unwinds the allocation / hw-init path (kfree(map->reg_defaults),
regcache_hw_exit(), ->exit()), while the scoped_guard() covers a
different resource - the transient map lock around each callback - that
is acquired and released within its one-line scope and is never held
across a goto. The two mechanisms manage independent resources and no
goto ever crosses a live guard.

No functional change.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c | 43 ++++++++++++++----------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 0d58d900a2ca..d030fcbe11d9 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -225,9 +225,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	if (map->cache_ops->init) {
 		dev_dbg(map->dev, "Initializing %s cache\n",
 			map->cache_ops->name);
-		map->lock(map->lock_arg);
-		ret = map->cache_ops->init(map);
-		map->unlock(map->lock_arg);
+		scoped_guard(regmap, map)
+			ret = map->cache_ops->init(map);
 		if (ret)
 			goto err_free_reg_defaults;
 	}
@@ -246,9 +245,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	if (map->cache_ops->populate &&
 	    (map->num_reg_defaults || map->reg_default_cb)) {
 		dev_dbg(map->dev, "Populating %s cache\n", map->cache_ops->name);
-		map->lock(map->lock_arg);
-		ret = map->cache_ops->populate(map);
-		map->unlock(map->lock_arg);
+		scoped_guard(regmap, map)
+			ret = map->cache_ops->populate(map);
 		if (ret)
 			goto err_free;
 	}
@@ -259,9 +257,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 err_exit:
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
-		map->lock(map->lock_arg);
-		map->cache_ops->exit(map);
-		map->unlock(map->lock_arg);
+		scoped_guard(regmap, map)
+			map->cache_ops->exit(map);
 	}
 err_free_reg_defaults:
 	kfree(map->reg_defaults);
@@ -281,9 +278,8 @@ void regcache_exit(struct regmap *map)
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
@@ -584,20 +580,14 @@ EXPORT_SYMBOL_GPL(regcache_sync_region);
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
 
@@ -615,12 +605,11 @@ EXPORT_SYMBOL_GPL(regcache_drop_region);
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
 
@@ -639,10 +628,9 @@ EXPORT_SYMBOL_GPL(regcache_cache_only);
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
 
@@ -659,11 +647,10 @@ EXPORT_SYMBOL_GPL(regcache_mark_dirty);
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
 
@@ -680,12 +667,10 @@ bool regcache_reg_cached(struct regmap *map, unsigned int reg)
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

