Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013009.outbound.protection.outlook.com [52.101.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96493F1079
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761838; cv=fail; b=Z+3+Vf9C3AGvwFbm7pMEs303MIDk9sS9hkPqUqb8GKD7tczk+/ZQVw/GQPhf6gJiMAbrMXy4tb4cMVfMAcpG5kdu+Eq542ogaBeu9R5I3lPPVAH5uBsS824XHTfBiB33iSrzD47qtzRW3rZjJ1r8FZs35RAqNOmHDyEDTBs8PE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761838; c=relaxed/simple;
	bh=a9/baVfgkn0LxEG4DMhRd4xaihZZGdB0jry0D1y3e50=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CYT+R7kiF98sE1Y2xkSK0ES8NNOrY1VuSbgU0a4FS0I7I7hpf9zN1vxbYFbnJZVMo0bzUVP6Z/97WG6QqPxNJV6o6LGLKL9u2AEgirKSGH1OD/3Eqy7jWF5vvrsVBl+qaOCh0LLX3QENnEeULUsj9NRCB3C8b4exMzpC4fRmMW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FkqqfU04; arc=fail smtp.client-ip=52.101.83.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FkqqfU04"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNCENbuNR5AKMvC4vtgnHcJzOpS2+xqmhdimGKE46QFKweSzhX1c5FTfQFVaWJJNuPYxYr+uCScxKUzbZpydIQCLglGr8atukcTf/2wzc+wiIbbPnGbUaIxm8ntBFETEvanV2Vlmh8IucY4dIj3ksSgMmVXPJ7dy9OFc6HcSDSxp8frCDme4Nep5vXY4j7rsOQQBPqwnIat/ExzWQmLFY/M1kpFn279Xlu//9ZR2izEW+dCYcW668UoPstyE8fZLwT13aZ35t8ys+V29+voxaS1aT6RXNZjs3WVmeEVXpK0PIaGU7HpTx+ZFIxTqcWnPOTQW+LIXFhDCFUOJwdbxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuwgMWqMBQAB+uJUhIewy9RvZ0l8eqbGT7BWfcsUfiU=;
 b=Dr0M0vJdN6NgZOZPnx7H0DWru5fUvYAcJ2ieO4slbDcmtV6EnRbj8ywt8Ef6ayUSYj67bbtlMQYWdvvh06oCUQNNE+GOX/r+vbwzfe02vgNmPfq+qyMcByz9zfhZD3i7pYvfYuL14IrVc4L/7yTO+SQusoqu7+4c8BJvYoaFXK6gHOPVrMrqhbItLEIgBhWbSid8Gq79mg1P1o66sSMo0fOcc09N4FRUjlDFeeDuLxxW4h3ZYFdSahGop9ah+Q1bxo2pKT/E9HtrQ3WJkR81kC/ydj4QhCg5VDq5tq1/AzO3ZulykZVJfRAS38H98sqvFdxy4rpgXpjGOMP3nOlhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuwgMWqMBQAB+uJUhIewy9RvZ0l8eqbGT7BWfcsUfiU=;
 b=FkqqfU04V/b4ZmmEtf47mVUlQS+HcTTZ7XKS/qmfa3A0cu7jY7laYZORFLFoW7jUz43v2grMBkO1nTi5YiQsRw7+tLcATOA2WYdGCHRJvD8v+c0+rEvnvuL/zGCbo9yTDtk+D33ASWxvCndKlUHt20XbaLhtVGhqDV9dxWbxcsoh09lWXnxaWG4I+5XMqzA/Z9J5C1AqJcMRhNdTPlC9m0DbJYCPD3JwQxyB/yekWIL8z2E4+jrqNGCynxsEBjIq8O5UB5Nz5psmnR1meU3QF3q/K2k95gfBj1KKN9axWgCMzZvu2GbEtlqdiD37vBOuXjyXPuVp+C67Ir5sP66eXA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8714.eurprd04.prod.outlook.com (2603:10a6:20b:43d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 09:50:29 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 09:50:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 30 Sep 2026 17:47:01 +0800
Subject: [PATCH 7/7] regmap: fix potential double-free of map->reg_defaults
 on cache reinit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-regmap-lock-2nd-v1-7-33a8a482f9ae@nxp.com>
References: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
In-Reply-To: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0210.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc19d01-39cf-42c2-69f1-08df1ed84249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vTmXYgBw6lSoL4LaNTzU4hUpI8LF0vfPr6fy5o0ilDONVaSZDMq0mOmCaWdKSJkMbWVUsesTEZ2i6SkFwAsxF5x+g8P5b4DiUoWAXlHbQD0WfkGNrLGoL0TRhAxTp1pj5XYpFGr7FaI9m1T/ZovUOekoofNc7wxygOBlgq087iXHBgKHXjwB5mVSMjajHsz4A3EcH/+5jVlyXY7kHOpCYvLvyeJol3iJ1HakawVJEgwoapr4994y1qwqj7IPUZJqvNT4aQLzCJwcxHliqsYx54b4wSuAhnx3Z9TkqNkgy9tVxl81RabYI8D7eJjPRUXyHdCvoAK7dzV1eAEC1GGA6NceP697ZCuuC9S0rBszGcsaOQsG2moM6YFkfAr/oL4LkkvtpKJoeVij4xbZESuskr14KwP2KpQFapgoGiVmVlfr/QQBxNycgqDsHJtcKW7bobpVv9c6RA68RXjYfOmHxzdQiE4UKsTa4qixiVsil9PRCL+vmUqoe1Yj+NN26Jgcy6yksePt+OKuLnfwJkv70bJHIS4/Icsxiu1enCHTbtEehR6e8T7dVKs+i8vaUvQLIw6g2SS1osfhWc2hx/PiIf6HZ/lA4d4zSf8Cvcc0dwQCxiSb9EhN7KvLpgZnCzF/NCP7F/zq3ZS6GdyISn1hjPJgsy9kCnzS0jIX5U7ncmc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzE1UlFKZS82MHZhTjlrS1daQ0Y4Z1ZaMkhoQ1lwMjZvV2ZRRjNiQktDS2Jr?=
 =?utf-8?B?Sk9QNjV1dEx2b3h1dEVESjJsTWdpWHFjUitGUWl1Mk5IWFIvanVEOHU3Wkda?=
 =?utf-8?B?WEM2dEdneDlsNllhbDR6WlZBVmxlS2FJM0R2N3Q5NEFLbWR3MVdDL093VkRE?=
 =?utf-8?B?YjBFQW4zeS93eU9hYVVaaTdzdzg2RVE4SmUxQlptZGZDb1YyWDMrSlVkMXhL?=
 =?utf-8?B?SWFGaGlpOFZJVTJ6aWw0QnRnc2QzV3ZaUE8zaUdueDZKUElCcHgzSTdvTjMv?=
 =?utf-8?B?ZmV2Q1hoWTlMenJreHVVRmw3dzNzWktuM2xpMXRaN1NQRm5tUktWaFhtSWY0?=
 =?utf-8?B?alNvRTJWQnNLbU5yb0dtWlErM1JPcjRpa0d1SU5HZzI2TUdGeW8zR1gwVzJu?=
 =?utf-8?B?eEZMN1dTWGlSWkc1NFpzbkRwbk56cXZiaTNhR3k5cGhvSTN6YkRGRnhZUmJG?=
 =?utf-8?B?c0JlMjhxRDJmRDdwSCt2Q0RIMnU4bm9TSVlncUVDclYvQitTaC81bHBXUFVs?=
 =?utf-8?B?MXhoOUY2NC9OOE1pWWpWcEtkWDFOT1V1MFNNcjBGeEpNbFJQWU4xNHNITDBk?=
 =?utf-8?B?Q1NIQkUzZ096RzZTSlFEMFFncGFxOXlzdGpWTVRzOElKUlk2QUdwcE9meU1l?=
 =?utf-8?B?S1M3VXFSRDVJcTNnS01PTWl5OXJpQjIxZXlVSUpGTUVEZnE1ekxROUJPTGZZ?=
 =?utf-8?B?ZWk4U2VhQi9aa29kOU91bm5wZmc3MjgwSzJVMmg4bEVmS2hOaWZYZFdPckk4?=
 =?utf-8?B?ZjhSYnMwRjVrbG41WGhFOXM3c3lLNzNoamVwSXN6NkN3eUJxNnVNVTRHYmdW?=
 =?utf-8?B?RDA2S2VKVnRSczRqSFJka24zYkpIcVovMkNLaWkxOEhtTW9ES1J6WWRQM2R6?=
 =?utf-8?B?RmlpREhiaTMzaVN0dGZPbzY5c1EwcWNtWUNnWXBnZHpXcXgwYm5QZVM3bkYr?=
 =?utf-8?B?VEhmQXk2Vk1UMUNHd0c4QTBzK3kxaE1wZ292ZHZsNnphUFZhVkVMVFdhbnZs?=
 =?utf-8?B?S2I2WUhZK1dWOEFtTlNEdlBnL1h3dUlZcUpyMWc1RTgzUmw1VVc3N2JSTk84?=
 =?utf-8?B?cTFPZjBrZ0VMdEkxakJscEFxdFRxY08vamx5SjNvejNldHNBVjZ3eUpiOEVx?=
 =?utf-8?B?SmZYL2c3R3Q1TWFJMUd1MjVpSkRpRlRaMkFtVzkrSzlFdXdEcnpwZ2pmMDc0?=
 =?utf-8?B?V2lUaFo5b3ErT2JUMVNVMndrbjFnY0VDbzM0emxFUUJ5NTlLZ3VSTXFTRjJF?=
 =?utf-8?B?OUxhOGZTT2VEcHJhY0dkOHFJTEdQS2JjdnNyaTJyL29XZnN2Y21UeHArUi8v?=
 =?utf-8?B?YkhmU2ZhZlpBZmxzZjg5ZENQR3VsRnR5bXB3WEIzNHZhR2lDWVZ6SjgwMWZy?=
 =?utf-8?B?YmN1SFpTWU1ScGVLVjJFWEtueEt4U3VUcE81ZE5jY0lSK0krQ0oraGlqajND?=
 =?utf-8?B?OHhKZ2E1cTJKYVNUN0RRUUZOa1djL1MrNm5Wd3F3Rmc0d0dMWnRZUm5ic25C?=
 =?utf-8?B?SGwveGR5aU9pWDFocnpZbDZpR3VxK3gwQUZ0b1JXYitXL0ZMM25TU29ZeDFS?=
 =?utf-8?B?VXg5aEpLNzZhWWJHQ0lpV0l2TXZaR3ZHVk9FczlPVGhqdWZIZy95Q3REVHp0?=
 =?utf-8?B?eTRVMlJTd2hBTTNqQ2F3UnlVZFhsZkhsbFNmNGM4WVRiMzZBazVrSHpjVXlG?=
 =?utf-8?B?YU5nek1oc0pMWTl4TW5UVG1OQ3dWT1BhYmIxeWpXUXpyRFo4bit5ek4wVzM4?=
 =?utf-8?B?Uy9BbXdQMHpWVElkUisxT2gvTHNJTGc4SDVQcEhGRStDeGQwWjVWS2xVRnBj?=
 =?utf-8?B?ZFpZck5BY01CaG1nbzBhMFpINS9neUs3YWRmWlg2cXBvcG82eThUVlRadXRr?=
 =?utf-8?B?c3N5TWpObDh3bDNoSzhrd3JLTVg0TG93aGY4VTZtd2FiRmY2SWNITmJML2N4?=
 =?utf-8?B?cVV6eWdrNnhxM0RmRDluTm1HeVJ2OUxodEZSVmkwTzR1d2UycHlYU0JSQURP?=
 =?utf-8?B?VEI2d1pTek9HYU5IM250anZ6OWxxYndQVmE0eDMvTVFOaXFtekxBS1dHZlVI?=
 =?utf-8?B?OGhVbzVUSkl3eUR1N3VuRDhQNmdsMWlRcXhONm0xSHBvMSt4N3g4KzVTRHZm?=
 =?utf-8?B?SjJyQWljRk1nWm5IMW9YNzd4bHlhOVRBU0tHTm4zTUdjZW1mQWdyZlhtelp5?=
 =?utf-8?B?SXVKNHRoUE9OV2ZyTVRIRVNzUzUwQkhCWU1yU0E5SjVIZkl1V2QxUUFhRnZN?=
 =?utf-8?B?azZFa1JyaXg5d3c4MjNpTUFuK2VBd3hmd2NERWdLOFpNN2VrRWxNbFQwSlNZ?=
 =?utf-8?B?ZEU1NUtqM29QQVB6d0xyZUhjVmxYUHVlQTRJSVByaW5ESkF3WmViMlBMRjEz?=
 =?utf-8?Q?8JqxGbWOfbZZ/Getd69qZXwTn7ea6wegpoD54?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc19d01-39cf-42c2-69f1-08df1ed84249
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:50:28.5204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubrQ8h/tFgkoE8Rarj2hTRSLnkRZfGsC0op0brQ9DtTBA880gsrBYVWAF7lq8ik+fS2/KaNnLahQc5SGbxFoLxA2l+dOBjeHnUGZ2CRxfl2yN8LGHa1pio54aAsWVoYc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8714

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

