Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DAB49BD97
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946880; cv=fail; b=ZmPZl7vEm1GP6EbIDOLIzlOQqAj+BJ8UWPzXEEdNUszvVWIlLbPMkwq9j69pq/vozNLDz+i9a33C6m1hJNApZC2rBc26IcTP06UZ6+80tbWNJkffcj8Q9EcCquAMIo5b3wXUelAgJohoyfTImrDEgpoxn6knSPa6ZCkSRuk8Ozo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946880; c=relaxed/simple;
	bh=a9/baVfgkn0LxEG4DMhRd4xaihZZGdB0jry0D1y3e50=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IwlcaCau+uxRBIIkK8KnPry3tDVFZl4nrSN047BhtJCxpbMzf8QAtoTVuOHVb9xPNMCI3bxruz2cMRhuhFJrfUETcZHXLxLLnMo0z7HnhP6qMBbVtEEcPdrRzjzsGJrl1BZKnf0X4tqyK24H2NPz23Cf36sXLakMd42ru30je2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WYDTsbAH; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WYDTsbAH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaLVXx0Od4ihpkQmIHAWpROjD2z5BFK/I7sJDtm8qHbxmS+yl4Mlwa3Kfe91vo/CYw+5ho0ixWTwJRNF6GK28P0eH5nXR6odjhe63Wopfm5ZZU8smsk+9niFOkmyHyDf6t/4B1cIKNbm9QQ13ysH6rE2UfxdXF4DXkMin+uIAP0zsFwfRr0F5uoUqt91TxC/Gjsgaok8jW+D/io/5Yspobn3BRcRuXy9oSoWy0EDlt/6vF2n/iiVTB/6WTsTyke0bmNfVc/tm/fnZJgvgd6P/h5RXL7AT80ywJQjyu5IEuLk8SJYC2reG9r+AVm5lI9l6dqet/wK8ghYcYIrHCACVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuwgMWqMBQAB+uJUhIewy9RvZ0l8eqbGT7BWfcsUfiU=;
 b=lNpGnAleR3wEjtEuHxY464+5Ygi+axHhNjg37Do4p/yJNt3F7+uev9eKktz1lpz5Mrl4t3aisN3/hVBTUjijyTvTF/xbMDYUdZctb0CN33hbZrWDw5ICMaPrlj+aHehpDU/a3XRrlZv5Dnnfk55q7B/Wj3ZsBtYC6/RFupZ1lR2/CR1gJ76I+0jqv9F9OYlhUMn83kb42qF6B3ZOBVN64XKlT58sY8scrDvb2NBmQoVAHX9IkuVXSeH4R7vuE8Rr7+MSVgFYGzqucPTvLmIZJu+UxqHV/FwsOnp4teF/5gg83t8xJqw/hWlRkUbN84A/tFT48SeOdZ5aDTDBMXxpwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuwgMWqMBQAB+uJUhIewy9RvZ0l8eqbGT7BWfcsUfiU=;
 b=WYDTsbAHZfqdRAV9yGaPPDEnzXljUSDedyIG6GdDxeJGlDtupojMg9jh+gw35N8X6QfTg+HZDsO5OTpZfY/7+ur0ESM/RqttPHkXfq+PttPCMkSTSq+/mmz3XGqinONIAqNb3IXzYMI4MHPPLRQPbd7nBwovnER5mbVSzQt/7bTHWaMOcNQqSSGTtcFXmLmCljYqZykwj+w0/2S7xnm3/dZXSumBJWZs8kppPNaOPSWr97+H7O+a7pNSx1TP1BrOaQ76FT9Y2aB3c7S15THRFWiEOzhapFhcLcx+ZDpUkvkr8COoU2P2sJPcV5MjV6041cp/c3ZHG1L/R/EAN66kdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 13:14:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 13:14:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 02 Oct 2026 21:11:21 +0800
Subject: [PATCH v2 5/7] regmap: fix potential double-free of
 map->reg_defaults on cache reinit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-regmap-lock-2nd-v2-5-e172b0501c52@nxp.com>
References: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
In-Reply-To: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9c7fcb-42ee-40b0-40cb-08df20871b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0KMGf4dQ3w3GWxMdiBJOwqbWB6ILYvKGWA2arIp8NzwQMJizgajjJTuzr3DfwCdt4GPQaN5hkm9nW/lPHgA5E6sCt39CI+zL2/K5actbphDRBtKo5WnSLW3ux4n/spv3zsfGNpWrUcrfZ31m7x60mBsVJ/ROJgSsunxMQj+I6udUtXMHEOoOekxdML5FXghDKp8pF0Rb6mjGHh2Xw/Zjpg2AcwemLZ6Mr0MpwYLggD/LmHA1lQgfM+9W8iYfCCvUcdyDk7MEGb7lsFBuDkK/FK99NC7kClCzrsbVl1n0aPbRWctejhZwvLCQQIIoigkcCiE5RoZBDswD4v6Fo8xc62Ne410WmeOl2Kfwz7+U9lgzhUj+2xQKC2k1O+XEwAkRTPlj7VwKreenI2UtSOb1jWwdsCTZrjgMozM+YR00IZ5VcLbr5rgMQqWh4X2VOw75Rawb9giVETo5j/bCH5HM8XaakIo9SABlvQyKY5Z25IwwXzr/VbI8gIsYbubVskkmLcuSfy5KTZOslGmoceNYrihSgVbnsJuH51jp4IKKt6xmfIvKX7RQbGKXOjFa23A2RUUJQdLDnDYU9hPtoqMQMBguCZvG4QS5Fph/j6a2m71pKLvX9rysxbtNJVt31NH/Tcz9icMwzVhsvWtyopLURU4ekJTtUZIyi3ggD7xPc7s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVVYODdTR2QvM2hxeVEzRkJYUVI3U2ZYTzNtV21kUFdkdGZMY1l6WVpVbmhs?=
 =?utf-8?B?ZzljQmEvUThIaUJRb1F6bi9McGJ5cVR2NTY1ZlNKME9CUW9MTHVDTGRWa3cw?=
 =?utf-8?B?VzVnWVBBbVl1RXI1QS9RZFdsU0h3c3gxQ0owc09oRFRDQ2dLK2Z2ZDlJM1Bu?=
 =?utf-8?B?Y0sremZYWGlDMENOYlFWZmMvMUFITng0N09nRjY4SWFSREQxajZyWHhISE5M?=
 =?utf-8?B?VUoxK0hZTGczeEJROGNFb0hxTmxzSEFEYUFTT095bktNQkoyNWtTdjlqOTNo?=
 =?utf-8?B?NGYyYm83MUZyTnlMWmUrb015ZnpSNXdOYXYwNkRKaGFvd3NpdzZCMGpEbUhq?=
 =?utf-8?B?czRZL21SRHRPRXBpV0FKd3NLcThlNklVSmVoMncwTURzUFN4VllOY2RMbkJO?=
 =?utf-8?B?UE0wZ3BuQzNwSFJMNXIvUlg0UnFTVU55R0wvaGlYbzJqdWNHdXdGQ1ZXVWVF?=
 =?utf-8?B?VUl0VVh4WXQxbmpTVTJOb0dqbUIzSFVvd1dsbFJaQlNrLy9MWnpYRnNOeHhS?=
 =?utf-8?B?QXJremN0dnVrcjY5SytKQTUwdmdXcUc1R29yQ2s3cUdZb1U3L3lIalF0R0k1?=
 =?utf-8?B?UnVWMjRwRHMyeHJZMXJxaG5JdVo2T3Q0VDlVU2h1SGkrNUdhY0VGQ2lhY2tP?=
 =?utf-8?B?VG5qcjVjUzI5d0NHMlNoWWozNVl1RXI2VlJQOUtkWXl2T2tGS1U1ZTYyR3Vs?=
 =?utf-8?B?RjU4RjdtbzZZR2FlK0ZwdjUydzE0UE1MbUxuYy9oT2ZVaWNVaDlrOGE1cTEv?=
 =?utf-8?B?RS9vSmRkZnQvWTJwTTd1S3lDb1NvblF6RjNvOVlBdUFEcnpPR0Z3ZkJTSXlY?=
 =?utf-8?B?MUNnZytQYkt3ODJOQW9pWXZ5cURmdUEwU1VmaHBYOUtLNXlOUUhseWtEOVJw?=
 =?utf-8?B?aDltdm5yTnlrNG92YUZ3N0FMbS9MT3VHNkRRV0c0SFh3M2h6NDhqSlc2WUxv?=
 =?utf-8?B?OHVJTGUrK0hPYitVek5XeVc4Tk90UnJmbGI0Y1o4aVF2L2Myais2Tk56ZGZa?=
 =?utf-8?B?bEY3U3BVZjI3eDFNMmlvaDllNDRnajBKRHZyZmRjRDBYeEViQ2l5TkE0MmNt?=
 =?utf-8?B?UEtWL2EvOVFocUJUMllrUkZMWEtGU2NjcUc3aDhrSWZLR0ducHNON2liYWUw?=
 =?utf-8?B?ZEFzS1Frd1RGaVdqaktsNVo3VFBMWFMwb2pET25IdEtPcHlYTklGdkVnTUZR?=
 =?utf-8?B?Mks3alFndzJoOGRjUDl1RzlzMloxM2s5VThTaEl5TDRhZVVJajhXUlNJaFZ0?=
 =?utf-8?B?VlpmTTVmY3lXcTREM0lrUER3OXhVWU5DM09CdnpqblBxQ3hTSWdJb21IajJP?=
 =?utf-8?B?bUt3TFpsNURVdlRleE03Z1JEdGZTVEhkb2trQWpSbHl1b1dta1hCYk1NRUNC?=
 =?utf-8?B?QkdjNzErVGlpcWVUbXdwankwRTdkQ3N3cmlsVUFrRGppUHJ4cWU2V0NHbytn?=
 =?utf-8?B?MENlUFUvbWlXbnZMRGdnN2RwcWRVV3RZKzh6a1d0QkVrYmJ3NXNmQ3VJT3pz?=
 =?utf-8?B?d0lwR1RTOVpnYWtXbi94UzFvdEUyVi8rU3ZYSUFMalhVMURhT1l3ZHJDRG81?=
 =?utf-8?B?b2VOTXQ5S1YrcjR6bjFVSzFTVHY5K2NYSU1LczRmdFFKbjUzU0x4L0ZyMjZR?=
 =?utf-8?B?eDZsZVpzNGkwTVF0QXMwNHN5Vi9uNm85dWxJbXJ0MXRUQTVrcUV4Mklta2ZY?=
 =?utf-8?B?UEw3a0piRm94WGxYcW9JbWkwMEdPMU8vZk95bENUWWY0RUozRm9raUlKb0Rz?=
 =?utf-8?B?ZSt5am03QzBjTks4aVYwcTJQOFhKRmt0TGt4MExEOXNraThGK0NPU0NYN3N2?=
 =?utf-8?B?ZVRSNWVhek5lbThVWERDVWxRUmkxUE9LS2Y0dzBZZzkzYVlxWGEzeHE0Q2t4?=
 =?utf-8?B?cDRRZnhhTndERmkySUVNMnpsTWtiblVnRFNYWkZHcGVtZTBaWnEwaDgvRFdq?=
 =?utf-8?B?Kyt1clNnN1R2VUZ2dFEzQ05ta1UzSkRtWDBrNjhNMXdSZWlhOGptUFJscGtk?=
 =?utf-8?B?bUk3WjQ5WFlROGliYjlEd2tlN2tlMnlVQlk0WVFCTDRxZ1RCQmR1U3AvUVNj?=
 =?utf-8?B?WFo2bmFzVW9ZcnQzY1g0RXhHTkFacWhOYjdudjhOT0tReUl4cVBNVEVvMjhr?=
 =?utf-8?B?NjVoVnNtTkRIb21ETGlqZ3pEWERra2g4UEJpcmFWcGRsYUF6U1B0TFhjTnlq?=
 =?utf-8?B?bXY1U1JIc0djM1QxQk1IajkwUFBjaFdBSW5ieEFsMU5DUnFnZ2p3Qjl5ZFhE?=
 =?utf-8?B?SVZsSUtMSnREeGFZZTY1RXJvZytkMHdTbURlUlc3cFB1NnBMKzBSV2RNTFlU?=
 =?utf-8?B?dVdwbnpJa1l4QlV3WTdNN3Nram9VNFBLZ0NJL0Z3ZUtuVElReE1WU2NaTHc2?=
 =?utf-8?Q?41+Hoy7P3KQC/U7fF7nLGyKf/yX0x3QHVrpDA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9c7fcb-42ee-40b0-40cb-08df20871b07
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:14:35.7376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/oPXp7ySedH/6+iX0+TaHkTkWEIj5SlvjYxHn22xonU9qlareADa5jYcS/3qJxNuPQOj6C92qFRtXY7Tp12jXizrhjN+jVH7Xd273S0cd1qRytbiSLeq/hFAQARonNm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

From: Peng Fan <peng.fan@nxp.com>

regcache_exit() frees map->reg_defaults but does not NULL the pointer.
If regmap_reinit_cache() is later called with a config that has neither
reg_defaults nor num_reg_defaults_raw, regcache_init() skips both
allocation branches and leaves the stale pointer in place.  Should
cache_ops->init then fail, the err_free_reg_defaults error path calls
kfree(map->reg_defaults) a second time.

NULL the pointer after freeing so the error-path kfree() is a harmless
no-op.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 136d6adf3120..3b1c2f28d585 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -294,6 +294,7 @@ void regcache_exit(struct regmap *map)
 	regcache_locked_exit(map);
 
 	kfree(map->reg_defaults);
+	map->reg_defaults = NULL;
 }
 
 /**

-- 
2.51.0

