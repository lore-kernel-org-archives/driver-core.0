Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3781C49BD73
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 13:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946873; cv=fail; b=srSMF5lSixdf/Hko9Xs4SVvC8GNkuk4n1wNHTGeAgDKGNqxYL/PPrLcpOs92gVnPj8yIASRHejXJqKizsf8Kehup3MwvkB5YOE/A3WMK/+J908JU4UHpdL397N7d2R4AAl6/tdYAkY99JJQpvEoEaH6QC+jEs9P9zD0HFh+NtU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946873; c=relaxed/simple;
	bh=FrvFI8cjkwU2nwRZmTrE2jdMqK9bne/uhLwoorH//7w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=O/n2mWKs6aN8IlZ3Dc/KMBAMU18/1S8tcPsxFblvCqT7GHavQhVsEhqjAL6qxeTyzkonUZN30xx+NEVEXk/olsturjTzf0F49pedjRZpy6t5TYkkGT+8rNfy7sbJc3au/LReCI7/Nc6Zy5tP6GbghGu0QNrxof4wLURprJDeiXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ivOxTkea; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ivOxTkea"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epNNFu1n2Fx9tCjziax/uR1t9btJtsQ68C6tsufyoXr740TPkx2wIpRCaul7DeVrahvYKBbJI1vLcaFJQN0a6lrsBXmhUDrduqUypsljUxCoF7LSUV6SpXTAW70B9TQ+cWlMEwqhNS0oVsLCp4SAA83hH/PCWOxTrrAvM3EeaDY7ZZ/T3FbcOW1VtaBUK9wrnm37sW9od5+Krxvgp8zmZuL+0zKDTQMTsA3KkhHeh1DiaOZ3WziZQLe5IG3wmd1M878q0n9eT2l8jER4kbk7ZM54DgxIB9pf4RSKPOLxjZhH5tTTyR2lecw0Wiy5TVmBBd/oCw9MmtXJW22FmoL1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VerTmCDCyJ9cwrgk7kisEHGSGbWM+DkVZyBozFqm9rg=;
 b=N71XX60ISJZ+PZ8A0k4D2Yu7XfelhEy39y1yrO07P7P4huqcs18TtlD+1P4zbz8tLIGkqs9msGeCUQ7O6jFXplpl+daRZZzeal0QdBzsy2V2V31aBg/SQLS7oscnKDnQlamHvgmEGK2NEB2uVjJ77PI2sIGcTZgNPnMJp+/I0ih5ciYTLgnMIpg7yqZk+Urh3OlvVsLlkNZeoepOuX1rkavhepEHYMPwkhb+CXFsaQT+yP3oab/vhHyla+1I5nj3vNyhhDdTXi2EfcEEQfivMCRioJEHZZMnoBK0mjeyq5LT0LRcQTKQZgiIuJ7WnGNyn7ZAvTq2TpUoanW7YFiXnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VerTmCDCyJ9cwrgk7kisEHGSGbWM+DkVZyBozFqm9rg=;
 b=ivOxTkeaS3RrctBgHX8Z1aVxsOp+3NYQBq+hCfjbmMyukJ7uBZ0Zpn7DnRo2hQUJPbozZgIK9H/YaKtDLE7MMTFv6uMUZ/3LhS6p9CckM2sMesUc8GKowi9vl4r5611saZc427uydOSxk7v4Pjj8dfW8pdi/CvIix7nHXc4hU1vA+ujzzxDofNxWHWq+x1Xufd3I2e1CwzWj/pM2MLYM78vbqpKbQ7Ua+xFOdsXMJKU6yeLT+J/WWYE23cFzQbb7qyHE/5V3b7QGb7F5HvhmthVBYDw1HceDXvXrdHR4hGSt5VwcUQlX0Ma5eRPP39lWxr4KgHJKk95ukrbQymC4aQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 13:14:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 13:14:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 02 Oct 2026 21:11:20 +0800
Subject: [PATCH v2 4/7] regmap: use krealloc_array() in
 regmap_register_patch()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-regmap-lock-2nd-v2-4-e172b0501c52@nxp.com>
References: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
In-Reply-To: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0261.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: f6738ff6-5190-40c8-787c-08df20871647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B6UjdPvpJ6o5Rj5wWDOaVimzWIXj+6572wvRFn3/5vkoJp9hqPgvTwRDqaITymx4PefWiPofY47yy79UwxtGSn91fp8pDKgTrMXf9y05hGZHywkmcchyp5c2hX/6ES2sgTLIDIf2xQW0OhNtUABn8JSuBvmB/9qT/GWnMvlUy5/fPzzTagKhlyYLQ+NsDBMoEXgrPMSX+Ww83evRu/rEe1I99g09ggQljvSfSR2qnKe3UaZbg65lD2Eaeqce7h8TNhXR60Qj6TbyDIN02UMHpP5vFQEncBtjHMedxQFyprrAAghnZKifEHbC/sGHbnCll65k25uh4Zq5KMV1KeW0+1N0RE9WmOpkVBQ9QZCsBSWKrguMg2B1x9iwY/NfKLLa/g6b5i6TsxXEHRKus/iQDWybKEG67Pb0GtBHr8pBBz/u3K8FU9rOxWIpKOpk2f3iRQpvTTM1s+wyaVW8KYYJf3Ddq7DEQbHhenRtYGei0TvXaIJViU+TeWSxchPSaE9GFgcomYlwU0FRsRYlf7XqlzrvvSVkDDRDbmFipCyfmsWymAQA9S5MyHFgvO/tOmWXkgoW692tKuvB2OUncGPGKp2SzXSETheb1tLkiqKgnm7OdQdv0YYs4c07kCSrisl+YU45HasjlWzhqBQQg2RblK/gw/qOuUngTlNUc+9h4g4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnpZeFJpZjY4TVhRbFF3OW9HNzE0NUpuYXdlQ1RjNk9ZUlU3V2l4NVdvMS9Y?=
 =?utf-8?B?U3VGZFdRUWxEdk1RRWN3NDlBcjFZMGE1dmVEQkVKM0dya3JQY2QwT2d3WExz?=
 =?utf-8?B?T0lSbVB3czd4MGt2d241VVBaaTNtc1BZNkx5M09qU1NSQkFJZWRGdkFDeCt1?=
 =?utf-8?B?aDNJbHlxQ2dBbktTYU9COFRKMXg5TUlvSFphL2g5SVd4anVxY0wxejMyekQ1?=
 =?utf-8?B?UmtjZ2k0UUN6MkJuYUZzTDNSb3NiUDFROGRodTJmKzY1NWJjTmJUMXh2R0tk?=
 =?utf-8?B?bFdDZEpaNWNrR2I5U3FLZU5VOVpMV2FoOWM3NG05QWgweDRyV2pSTWRaKzZs?=
 =?utf-8?B?aUREQ1phNVdPMnZoa2F2QXRPRzQ4RmlMbHhuUzFEL3ByaVV1NUVlRGV2d05K?=
 =?utf-8?B?Rm5jS1ZJUVBjR1AzVkZXUzZOdHFQc0c0MnU3M0xTSFBoNmlSdTZqMFpJUkZa?=
 =?utf-8?B?V25HbitXdG9VYkRTdkF6ZSttQTQrd1JOM0lXVTh3QjZzb2FHM1hNMnV6eE9Z?=
 =?utf-8?B?Q2VVNzk4dTllK3doc1pROWlVWUJmYjhDMEZCamFVZStmRzRnYVU0VmlPRmho?=
 =?utf-8?B?cXJiWGF6RTc0Z3pxRjhNYjI3eDFqcHJjTWZma016MDdGU3ZRSys0YmhpYVBG?=
 =?utf-8?B?TUdDcC9CWWFHZDlQNlpzdEI5LzJpWitycHN3Zngzem1OdGlrZ3F3VC9Kc241?=
 =?utf-8?B?OFdVNGFhTmVmRGNsUFFOTFc1Vk9QNHFyQ2xPaEt0S3h5a2pFWE5HbGRueU9C?=
 =?utf-8?B?RWZrK01UOUVMNVoyU0ovNHE4aUR5cE5uZkJodGgyTjFrK3dIbjNmVUI5dDEz?=
 =?utf-8?B?WGRvaTBPR25UKy80OVZRWGpqZkpKam5SZGR0aEQ2TXdOUzNKUVFsRGtDN1p5?=
 =?utf-8?B?cGVyNWwxVjBmbkJLZTJYTHYzYzFOVUwxaU9oZ2MvV3RPKzNidmQ2NnVZKzJE?=
 =?utf-8?B?K0hTZVJiY3ZsRUM4dll0YXowSE5nKzBtWlNJb3pWQ2pva0NCVmo2VmV1ZDUz?=
 =?utf-8?B?U0ZqeHlOZytoZjhZQnBNenhxWUQ2TWxWUEV2WFVHZ2dRaTIyRnIxQXhmUUpU?=
 =?utf-8?B?TXlDNXdPUE9aYXZoSjJZRWhRMzd2enRER2RRSUVJY0REeThoTE4zcnk2Mmpa?=
 =?utf-8?B?WjZNbGVuKzZNUHV1YVh0ME5PNG1mZXN0NTdyVGtETmplZWQ2dkd2dGR5Y2Zt?=
 =?utf-8?B?UkFoVGFQQW9DSzRQcXAvTGlpS1JYL3NldFNJNVJrSWQ3bFZYRnh1MGU5UVV4?=
 =?utf-8?B?Qk0welphQzF6SlcxSnNDNEJlS1VCK1Z5N3pPdnREN3FVa1RSTHF4RWo5bTdq?=
 =?utf-8?B?b05jN0FXM1FuMnR4N1BoR0xnbWxtWFo5Ni92SXhaeXdEblAxMi9GUjcvTm11?=
 =?utf-8?B?TnAvdkVMRDI2VjkwVktScHZiU2RCK2hBUlMyWFcrM2tSd1QyNjYzd0tLa0NB?=
 =?utf-8?B?QW9IZ0RieGZKVWVpRVFCelN5THRFOU1OaUlBckgvTGtuOFQ1R2syOFdlZFpZ?=
 =?utf-8?B?NDlvSDl4VTYxK3dLMVBaUCtzSnNETkFYMUlPTDEzcHNXTjdJVTM5WXdpMnJx?=
 =?utf-8?B?eS9xZStkRWw3UGtkNmsvNzZudkU1NVlwaDRQZkNYOUNoVVZrRGk3U1BUS2w4?=
 =?utf-8?B?THY2Y3VjU05yK0MzVkNOTVFCY0FGTkFUQ0NmRVdHV3BhS215VlE1TndXRnZm?=
 =?utf-8?B?cWtDV2ZqVlYxVEptZUNjVWtxd3YrK0k0YUlxMzc1b3c3Q05WL2xaWVJLSjhy?=
 =?utf-8?B?SjRwOFlqci9TZFdJcnRiZlVxREZ6WDNaRkJjNWk0b2w1VEpDdll5NjBwOVcw?=
 =?utf-8?B?cGt6VmdobEFDdUtBK3hINVIxOERYZWhoSHJ1QjZVOWJOWm1KT1E3N3RNc3E0?=
 =?utf-8?B?UTlMbGp5ZWhZOGNjVnpObWdYS3lVTStzdUFET2pieU5yZDZKUnFWazZrajVJ?=
 =?utf-8?B?TGkwU3pvdWtHNlJodEFuS1YzVkIrS3FzdGRXeVJrdDk0MjN3eFNOK2xidG84?=
 =?utf-8?B?K3VLZ3dmL2NhSlFyakNGeFVKYmZ0M3JOaVduTmFIa2lUVDlLZ2lRa0tKc0Rr?=
 =?utf-8?B?TmV1Kzd6a0M2eFJkL0JsNjNlN0NlVHRzUFZGR0tKK3l0THdpSWZxbVlMM0Ry?=
 =?utf-8?B?N1l4VGFiazZjTGRMWkNOQmtiN202cjJUMC80a05NODB1UUJ1NCtZanlTcHNu?=
 =?utf-8?B?SDF5Tkh2MGFZVWNQR245dEdxSTZ6ZjZJL1NnNDBMUmNKN3B5RzFCQWxCUm80?=
 =?utf-8?B?NWpudS9UU0ZXNlh3OSt1R1BqVzBvTnQ0MzhjR3lQM0dMMk1Ua1ZTUDZJcDQy?=
 =?utf-8?B?Y3NQdXdOeWlKU0FuUXplck41ZlBFUGpVdHFhRWJrWlRFUzFZRGNhL2NhOUxP?=
 =?utf-8?Q?30m6dlCVjMxNfmZcD+HeLfbdxgV1VxaXwNAHf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6738ff6-5190-40c8-787c-08df20871647
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:14:27.7724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AZs5eOFuKFXPqFGvlhfgDB61IZ3X6hjsvpK10Y/E7c29qk5ci4cWIM/a2UIai/x8Zwaok9+m6yH/S6iHI3smZ/GR8ArRfGSPvdgAjzLPQkIdIzqhYwqXJEdCvIh/s/s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

From: Peng Fan <peng.fan@nxp.com>

Replace krealloc() with krealloc_array() in regmap_register_patch() to
gain the built-in overflow check on the element-count * element-size
multiplication, and switch to the early-return error style to reduce
nesting.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 0b40e1e7817c..b9830afa6d8e 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -3379,16 +3379,13 @@ int regmap_register_patch(struct regmap *map, const struct reg_sequence *regs,
 	    num_regs))
 		return 0;
 
-	p = krealloc(map->patch,
-		     sizeof(struct reg_sequence) * (map->patch_regs + num_regs),
-		     GFP_KERNEL);
-	if (p) {
-		memcpy(p + map->patch_regs, regs, num_regs * sizeof(*regs));
-		map->patch = p;
-		map->patch_regs += num_regs;
-	} else {
+	p = krealloc_array(map->patch, map->patch_regs + num_regs, sizeof(*p), GFP_KERNEL);
+	if (!p)
 		return -ENOMEM;
-	}
+
+	memcpy(p + map->patch_regs, regs, num_regs * sizeof(*regs));
+	map->patch = p;
+	map->patch_regs += num_regs;
 
 	scoped_guard(regmap, map) {
 		bypass = map->cache_bypass;

-- 
2.51.0

