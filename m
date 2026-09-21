Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C7364059
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 06:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970802; cv=fail; b=XsRZ3HBaIAlor6GvlLNaEulHs1hRmlbiYad/1OvXA7/AVlmwuvRzAeNvj1LJ4t62je0nRutkxTfKjlLwDeyLfy2ddlyqxdVMS3OLJkLwjGC23Pj9dUEMcj8oGQDJNu7/w2Y6hmnHQtOKGudccUm0V60nkl1qDi/6NiXl6Ru+qP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970802; c=relaxed/simple;
	bh=WbRDC37uig0N60EAsqxrvM4g0fQ/+Wp4srJdR3I18LY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rhCCZFS1LNNsGjfXgtDcCrQmhn/IdxO3CCjGdp+/9M4pxrJAVqTl6mMWseVWGq/7O5Ef1tf+CS0SVTp6VDlnI9UDEf+nj0JjqcEpKURys+MluwQihQdny1ra8i2bJ4j8W3HUeGWLdva72F/By7XrlrAbLDAx9ye7iYdbVZLVi9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x01OJMEa; arc=fail smtp.client-ip=52.101.72.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x01OJMEa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDbHvQvjs3bN+M/JhoQ6j/jaM5WHLxOPY4vXNqIW0YCLIKLF8kpo1cZqrgImMHh7dhN5mTgjIKQXahviyXhn7FlWGg2WesLCsW9tpa/90n8jo3eeVbqttK1dMyjZjsBkC6QXOdLPpQKWUgFpC8Mbl7MwZn66hKCU+aTWhFLH0g49C5G80SvWC5+gK4vAYbgVGgYCebEVoZQER0CYSE1P1+4YiUaKmXNkbCQ9B856SGDd/GX5SU3GXnvUGwkU3Rgs0IebiUQg3DMh4LnpyXj//8WW7VEN/ZmMnKGuD0amKnSlbhnHo7mWjnAYKdV2fW5+dVMXQgjnXdQji86HOOQcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Vaxc4CK8aQcE3BPY0Zz4fTuSDePI6IScfYAT7hKa78=;
 b=LPCtNMGphUIn6fguD05+0BmQ/83bd1h7DT1mjkc84pTZPGDv7GVefFjHuvWyc7YkQz0f0mSl5igbTdqIcqghkboD++t4cQs7RwOruqbKTQMyCNXc99acJIvq8WAGPx3SQVupqPUqY7rrkb0C3gbMmkIBRmrfk7ifXb4uzp8+KFkk3r3g4P6dxctssAp7MdMuatxzhyd80MCfDmr2Nw8esjnNn8NmlVWmW0nw4Wfmy+vgO660JsNSNyMnQD2m/Q7eXcc1AQeGRyA+GcwIpThp/uXe6pUGCZE70UPDuHsfyTrN8oNZRypgdNX1EGBBBgNqfWqrzCOkiAtmr2dl1YDlBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Vaxc4CK8aQcE3BPY0Zz4fTuSDePI6IScfYAT7hKa78=;
 b=x01OJMEaj6SKk2SqjTUbAlLMXiCEasEgvyXo1LN/7ab2oGKaainRluet2xnBhAY1BBgaT8+k/6uVTtCtReMfXcm+EXOgBWtp4tAXZ+0Ls9BXqvcBjIOQ4TYvx2mio1r0ll/FAAM5KAX9gfnnTYxqh1yf6BkTF7Bxr9dnktDCU6stb93bCGLtQstFmrBih+SxcKRoEcS2PMPdqhJqQrauVPo4ZXCwhpXeN+n6M0OlOtjq8XUMPKUs6N6tWNjlNHbcgLkgPcpr7ju4uLWmSeT8pCzn9VedwDOtXb+cCHj9tYPc8YS4IMqhFd5oUhexwiod/ViWss4DLyKul503wePY2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9586.eurprd04.prod.outlook.com (2603:10a6:10:31e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 06:06:38 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:06:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 21 Sep 2026 14:03:35 +0800
Subject: [PATCH RFC 3/4] regcache: rbtree: use the regmap scoped lock guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-regmap-lock-guard-v1-3-cdbd97b46074@nxp.com>
References: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
In-Reply-To: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba1466d-125a-4567-9742-08df17a67f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|56012099006|11063799006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q6FZmqppUkgicXrdMPB+oeaTiXSHL94ZO8/hjUHyAVj8tpTKL/T41ud/fuiFPQYUA2q3j66wFiyK/xQuDh4zfZDHWjIHHGWntsEy8IvnyTNi5q8J0zGt2omOLqwITIXc4V1jwDIFOD3r6PBqInY4/Q/8p4ZXdQ9aMe+0FpoCs6ntrkJyP5AlygK0Dtqq+/5t9Y99ippXAWk1p6w86BkNFiBEd35RMcljfB2754HrIjSBE+7+987j6R3y0mykyvG9szppRTsKna1SgxbF6wDh41EMHCV1OEh/9DikesZ+EEdykwFJxUV030BMWzIZXAhKp3yTPXonwTcySDrFrevfQ3Pe/HdsZWNarJpYGudRvaCTvcB1ZhbYsZAcipFieOfO1ysPVUJJUhEemRx+QKP5NjuNAgL62P0vyweblJvNG4ezYjhSSShVwuEfLCMsq4RkB52+O1nTZQyXwHGeLOHtrbdviW4ZRBOEgkjCH160rM+DQA1Ew8AeOv55ZmVdYqGtiZxzQ7hsLO2wBzRQ19qXS0PVcQVinbBYg96sBVHjYJpvUk1zQJpAQKYAsoSSTEyAhp/pRJ3PPlzE3X+5bMPCAz4pqVaKaKJWuwvEKqC61TVSucz75JYlsYuS1c72HNB2Jj0DH7B+o5rHIGoKHPDiakBFudumhNljwLKmRfRbWOQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUh5OWlyeWttNE1JRytNQU5MVDNpZzdxZUhDVC9mb3Yya0lrOTVHUkNoV3hG?=
 =?utf-8?B?b2JhSmo4bGtZQ0JtcW9wRmtCL3pPR2FadE5MaTdaMGxaUVFIQmVXQ29Ebi90?=
 =?utf-8?B?bEpYNVZQUDRlbWdwNmNZNUdoOXRyNWZrUFdZZmk4L0xmODdHMElQdk9OTGJo?=
 =?utf-8?B?cXlkak5MYUhUaGtFYlc5WE92OTRWcWs5MVQ1MDVMNzlRSlZWbkQzOEpYaUov?=
 =?utf-8?B?Z2RkSlZwNndwVUFEOWRRY1Q0RmErVGRhNjlDcERVMXRLWm1VUzZyUXZic2l3?=
 =?utf-8?B?YStNMG1VdGd6QUhpT2JBQjNrSGlVZ2IyTzdkeEFpRnFJcDF3YnQyNlM5L3RI?=
 =?utf-8?B?akJydUV6RElaT2NTZG5qZ0k0SXdlaGd4TkxCZm1JYTB6a3pJZkJuRE9QVkFw?=
 =?utf-8?B?RFRsODIraXVOVzNnMDNSbkZDbVhaYUFuWms3a2FmaVJCekF2cXc2dnVWU0Nl?=
 =?utf-8?B?ckpXSUtPUkFqak55c0Vlc2NPS1pMQysrUlZITkVWT1Rzd2NSekJGcCtsWm03?=
 =?utf-8?B?eXNVTTlhdnNNcW5ZVmVHRGEwL2hEbTcwbWh3bVRTUWUzaG5UOXo4YWtiZUVS?=
 =?utf-8?B?cTM2d2NmMWl2SDBDcDE0K1FKNXNqaDhySjdVL3A1bWlmbGZINnZxWW1LR2ND?=
 =?utf-8?B?a1pHZk45SGJENXdOWkdPRHJBQ2ZPZkdyMzBUMldta2pKWFZsVjNnTEhwYmNo?=
 =?utf-8?B?QkdybDVScHJTNEt3Ynl6a21YRHB6TnFRY3FYSnN0R2pVTHFJTWRscG0wTWFP?=
 =?utf-8?B?SHkyaXN6VUd1Z2wvcFFrQk5iY2E4UDBmVXJRS0hiYXl6a0dHc1NWSWJ4eXE4?=
 =?utf-8?B?NjU1alhlZ0Z6UGF2RU5zbWlBZkh2U2ZnMHhvd09vaGMyenVOTi9aeEloMWdt?=
 =?utf-8?B?d1RRUUNVSVZzMVI1UlZUblN0YXhIRWp6RUltV2NoOFNrcHB5UEJHR1Y5MHJ2?=
 =?utf-8?B?Y0lUSlQ2WXg5SkJhYlhDUS9jWGs5Q3U4NUNESWc0d0lGeElsbGZNT2hOLzF3?=
 =?utf-8?B?azIzK0tsMkcyU3hDbVdxZVI1N1RmT2xoMmg0Tjl2ZHFiMGJxa2ZyYktKU01E?=
 =?utf-8?B?ZWkrazVtL01rTGlSSVZPa0hBTTVUci9rRFRVOUZvWUUwV1pqZTRxWjR2NG9o?=
 =?utf-8?B?bmZ3dW5mcDMrWUIvU1ZoQVA0RFlmSk9DQkdWdDk2VnVmVGxXVU8xY3FHQVkv?=
 =?utf-8?B?NFJNRXpleWEzZkpxVVBrVnlhMFZDY3lRMW4rYko2SExnNnZ1VlJXaElQZXl3?=
 =?utf-8?B?R3oraVhlR2NHK0xGNTE4TGFhRXNQM2tXQVpvUkMrMTZlbk9lY2hMd0FUOFFy?=
 =?utf-8?B?Y2Q5N0ZjRXV0L3JGOFdZbWFSN2RUdDMxYm9SZWRkaDhCMzd0YXVtN2xGbWo2?=
 =?utf-8?B?RlNQL2t0RDVNcUNYaTdOUmFsWWpzL2Qvb3NkdmVWaklpL0xNUGlEZTVhZzVW?=
 =?utf-8?B?dnREaHdqQjBwVEhZbE9Md01FWHBaQmQ5SEhlekE0YXF3bXVoVkJuSUI0MHdP?=
 =?utf-8?B?Ti9JNmRMN2ZkWVczNWFQTUNFYnNaSCttUXpaTlJaeTdGTy9uakgrcjgyTXVF?=
 =?utf-8?B?K3ZsV3ZMalFBaXh3NjNGRmtndmViV1RKUnpucnVreEgrUlhUbktXb2NGVHBr?=
 =?utf-8?B?blZ4Ui9GVTUyRlg1VnZOT1FRcUM4enFJL3AvSDFDdmcxUHFwMEhnSVhKVHV6?=
 =?utf-8?B?S1ZIeTA1K0owQUVmNU9xRVdmWk1OaXRObjZLYnFTNjFodE9QUGEwWDdDV29x?=
 =?utf-8?B?a2Z6dEphdCszRUJqaDNudFBseHZjZit5T2lEZnRzZ2pWamZDR1puQXIvblo4?=
 =?utf-8?B?R3JHTElBUFAwS1UySVp1eGpFWGJWa01PNlQyMjVHME1mdCtBa0dBbm5GRmRv?=
 =?utf-8?B?dG5qZFFDdWlJWjZTbTVDNWRkeENudGVlWkRiU20wVDk4Z2xTL29yVDhmN0xM?=
 =?utf-8?B?a2xvY2pWNVpxT3l5M2Q1YUtsd05IUUZpMmVENEMxNXkzQVdIOHIvem1WNEpE?=
 =?utf-8?B?dForaXlaeDM3YUdNQzB6eVowYm5ubmRvSTJ6cTlSeThvRVlieXF2QmJZTzBC?=
 =?utf-8?B?Z2l2MDUzYU5TR3JjZXltd0JMb3ZscERRYjJYeVUyMUhGZzFBeSsrVXdyQ0FH?=
 =?utf-8?B?T3VSb3MrNU9UcEE0bzZMQmRYd0NSK1pBV2VoSGtIczg4cWE1Z2c0MFFhZVND?=
 =?utf-8?B?YlhwTnllVHRZMGI2dCtIU0YzNnI4dThNOUV1VllBbUR4c3Zlclkyb001dm9l?=
 =?utf-8?B?elU5bk5UbWt6U0tsZFZldkF2amtQem5SY0JRZWRIOWpXWFZ6T0xzNVEyb04x?=
 =?utf-8?B?aXQwV0xLVmdPTDQvcXNMR2JMWW5tMXl5VmhwVllTVFJIeXkybUJGbEFqRmFW?=
 =?utf-8?Q?RfMphgrujlSfPppmfgxlflJKFr0G38oq0dWGH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba1466d-125a-4567-9742-08df17a67f6c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:06:38.0775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwBTyKTx8ZgcwNcodhvggNXaI+FMTlsRRMia3/ga0TKt6JI9I7BNG8jZQCPHrgkVZcrtLl7JNj3uXW1z1DM27tJMVSLP8v8zadar8SrnusQtjAY5y4FxNeJkjoJELGWM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9586

From: Peng Fan <peng.fan@nxp.com>

Convert the open-coded map->lock()/map->unlock() pair in rbtree_show()
to guard(regmap)(). The locked region spans the whole function body up
to the single return, so a function-scope guard drops the manual
unlock with no functional change.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache-rbtree.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regcache-rbtree.c b/drivers/base/regmap/regcache-rbtree.c
index 520d5f8ba3cd..e2feed6dbecf 100644
--- a/drivers/base/regmap/regcache-rbtree.c
+++ b/drivers/base/regmap/regcache-rbtree.c
@@ -141,7 +141,7 @@ static int rbtree_show(struct seq_file *s, void *ignored)
 	int registers = 0;
 	int this_registers, average;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	mem_size = sizeof(*rbtree_ctx);
 
@@ -168,8 +168,6 @@ static int rbtree_show(struct seq_file *s, void *ignored)
 	seq_printf(s, "%d nodes, %d registers, average %d registers, used %zu bytes\n",
 		   nodes, registers, average, mem_size);
 
-	map->unlock(map->lock_arg);
-
 	return 0;
 }
 

-- 
2.51.0

