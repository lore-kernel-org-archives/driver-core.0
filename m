Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794408368;
	b=OoQiMhwaPr2BY7jzxtOBQEDKHIh5cSQaVClhR4FpVd3uHVbRByDKDnDQ2G0Fm+9tSQaL
	 Y7z63/w+yNJEDQQMitd1rLjcE3Fmt9k0Hc9rHaS8h/PtXavsp1baHw0P47e30+AkbPHnl
	 cVEmJbR8f8trpShdSCntltTX94qbKLOR3axDJcaq7CH+x+tC5dzSXoxrY3Ptaq0/vecbs
	 5jZzX3XPAww9Z7GJoKWKq4N3o/EQerleqPbMFlb4SK60JTlvG/xNpEIMlloGrRCSLYmHb
	 mbjSu8Ob/HDvjfsN3GlS62lJEw6TqdTghB0iPTML1QRsSpo01VFswWRncabRafPqytg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408368;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Content-Type:Content-Disposition:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HNmKuweznOU1T1jP70m0xgSOtTlOAhMxYS/77mDPkFA=;
	b=rAOcUg3xsb8ADvxzc43EVKW9eaSNS3daxAbpAI0b2Cfp98sa9O3nvLWnFKy5+C7KC1w3
	 4VbLRICZrqVnyBg6cHJKwK+/mgVtqoGYNOVoDtC/Lxtbyw1d3M19rnlz+7K4Fx9wHTiTc
	 uLKvw+pmRNFgx4JUeOI2x3VsQHAP/dHU+loayrj2kkz+PrdyjQkd/SNcx0UGlk+ivcGpV
	 sFe/VYTJEIXv8pXLErD7kXKBywP3V52mW62uWKu+03eqGVS4ziWpEqq1BUGZ6n7EcWLq0
	 1R8f2lBgY0vxeBYHyUDYnf1HU4tZZTUiV07Z57t6IeoLgkN2wEd9hNjPGOe7HoAsApw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OMdj4yNh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.43
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECDC606A887
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 14:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECDC606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OMdj4yNh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwYGsJNbiAuJPEe8pr71awi4K9BnaEyKts4dkE1psaYI5TeWfKC6KUO7ML1jLfsNE2Su8rbBDuj8SUczpR08VYuQ8T+brcJXqsWvRso4bluCDovqLUb74uQM30lLeAXRuURqnpD0BD6+XiTPG+Yq7IsIJLc+iFZcKxSyZFjbQGFftxKMv0x0JjMtjzUUoBNLPyota07PWliRMbGS0LxSUPoSZHo/mw9PHXFK5XuaOfE/eQZKIg5VXxP7RNIHQq1wfB37BstuqExQnVKZrMCbw2BPFYX2t+zEtc3Ini8bNJcOugxJjSTkGzEMeIUwgmr3AUwUi1JRqHCoy8qXN4MIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNmKuweznOU1T1jP70m0xgSOtTlOAhMxYS/77mDPkFA=;
 b=Br+8XVcR0Qakv2mrsb/wZvyt5c2lm8SDy/HhppJZK+sny6hb+uWLfink7nYOWOvR1dVRLoTgeUAX2oQfiFmmSKBm15NxRZNlFZrclsuHgjacGFJuCEZs0qBJRUsK3rIsh2rsNJvCgGTaSRR5zCiDSV+6M0EHnLBoDxuXl0d1Z0yg2elOY2YenMZEWLKoGYXiv3v4ctnjMC0UIkuW2/x1E+jf0y5plT0DTXl5sBgk7BHxoFJ///xYacD/WU95hJBFfeRSIrGzj7/DqZELFB5ydJBwqC5HbKUy29ClqgOhLq+GQUVIc9pNVPcO/JJ7xy/njS8XnSexmghstNmQmb1KSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNmKuweznOU1T1jP70m0xgSOtTlOAhMxYS/77mDPkFA=;
 b=OMdj4yNhuOEvpApesDVEuyqBMyGMrw+URvEHUgcoAj/Qh8JuUHogsJgx6+2ieU2ZFI5D5lGjAjDtc+rfX5ohh0m9lyYr5Lr5lldpu0MYTbgViggoUhkH/hGjcoy+8hEru/ZTdo0JGdEGYf1AJgZGrVEW5NtTD09wMZcJ/gfTc7RPOV+/TKcvPJxVD3dZjr0rZQxR0LTh3YD9v5pQ/HBHg9XTOjmxrLkTqQ7arzoQAi1ZZvXMEmzAPnWe47XQKg3+AgdfC1edEKsatIWkrFTUD00QMRctVQB04KKDqPldQOrgz5MP4o2HRXWsZHsyTl9OQFjBVv5HfsubkrK3sTfBLQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB10581.eurprd04.prod.outlook.com (2603:10a6:150:20e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 14:46:00 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 14:46:00 +0000
Date: Wed, 11 Nov 2026 22:50:55 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: driver-core@lists.linux.dev, peng.fan@linux.dev
Subject: swnode patches
Message-ID: <avSAz/42lF14FQPE@shlinux89>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB10581:EE_
X-MS-Office365-Filtering-Correlation-Id: d909311f-e6e9-4c9d-2df4-08df4002809e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|10067099003|261022105027099003|11063799006|56012099006|261026140227099003|261026121527099003|261028144727099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zJeKS0VDSD9KjFqzJtoLhU1wWRWZAQaZuHSc/h3FDmJPrcWt4F5e2gTR6KuivcASCsARLnNHMGZrp2sggyXFdx1APdM5S6lO4AlC/chvR9yRaFnMjuCuoAINAH+IZ6VF+gdSwU2NEwumrZX+XQJyFdAaPl5ADvsQTB2+CT0mr1mphtcxO0xBR2r+emlnr/gLTXct/vNvEU413b3SVqnieeRqC2DrxpOP0x+sKK6UK1CFCWdoK4mj06uzODOk948rX2vQBgvVSzIsI/c7SOu0EkjKRMH7Cz6uBbdl5ttj2kU2QvTgGQrscokmmMK5imHQ3opkOA4XLSjIBfA7ODW3Nydd+XzZI5DQtqZ1XNBiFcHaevyhybm++CNYJEi6meKbUpIJx4xloRtchZ4nX19i+ELA11kix/ySd6q049DR/nMRqIJQRRfrOrbP2rg+QJd3mlbxZmHO+AzymuAyBOS4ZVz47jaRp0qjxHxdGNuufHkXDiAZCQoPXT42F1eI7zT68tVdaIkN3r2cNCYmoWuLHkYohy2yEGBEpR7oCMNi4+Yba5iQCg3Y+ANU55c58uLQhJIzik5mRQv6dggfUAZmSk8tQEzTLhae/LNbttVv1G95N7M0luHuCb+abKuW40eN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(10067099003)(261022105027099003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzgLvQXhD1LNoSf+R/vI6RnhSWLZBjVD0OfbCPSBAM2YIa2OGpfW1eQeS99r?=
 =?us-ascii?Q?/5ry1Aes+3tuA4pzvT/X1LoWzafnnzmnv4wQii5ImprpODcnU6wFCR16tcw7?=
 =?us-ascii?Q?f2F9/5dGdSUE1lhkCZEQ2ekAmsXsduNgCu+xaAiHwisTtlKEaGMIarTF6ARc?=
 =?us-ascii?Q?+mWjZi/QY7d+8BZvPegbjJepLmEm2fYC3vxmBjmhaP07LhCtqPjiyMff9TLX?=
 =?us-ascii?Q?9igIEGZ8u2skUGjVHeoVTtewducvoAHGAn/vDGuHJU4qhecpoOnqhMwsmWba?=
 =?us-ascii?Q?iFPtScYcIahx4Ab7LlQF8+lmAUQZT5qmG15eTkfR/YkEjBN8tDFmQHbkJk4k?=
 =?us-ascii?Q?g5f1R26y12jXbxaBHHIE2332NVDzjEd7D7fUCmo7Ec8w/nUJFH/ygiRLzpyY?=
 =?us-ascii?Q?IInk1cghOM/TYm/d6rcb9Vk4Y896A0+TirfathRtyKN3eoDIRz8ZKJF6lu5b?=
 =?us-ascii?Q?NBruQ1tGWtIQx+n/7iYwqvUGvnKIRdav/Yls9GlxzLQJHdHN/zhBz+7GnDFO?=
 =?us-ascii?Q?MJdN+mOGuiOmyEHTpPmpj6yS4LSQrj4kAykbxRfCQHWe1oZez8BjsZ7+mGIM?=
 =?us-ascii?Q?rDX66nmzG6hMbgRJXdXUwFPAcncgV6FyNM4ZJQzSqur5dFof24zVxZqp/t6g?=
 =?us-ascii?Q?T5gijcVs4XYWzOmM1vg8qxRLncsMqk0CDj1PpGgm6Qb9+RaGafROoIzi7H2a?=
 =?us-ascii?Q?yioXPhzZ4qYuDw42vElC8gAHUU5GXOhcySE4GItjSoHo1YerY9KVwxqwtOh1?=
 =?us-ascii?Q?unqAbu8Dah6Afq9yqQCW7nF+z6UL5peaD3XukHLfy5GRswso5elFxrgmeN9x?=
 =?us-ascii?Q?EwmaJdRmv4bJfc4JOz4y9RAtPkgG6o3fEmSGfKZ093TUf08jz0+jgFY7Uv/A?=
 =?us-ascii?Q?uDMg6To1rs+VPMwOfblw8nkqRvpBeJAbwnOZdAqXf11IUnLZ8VPr05qnk/N4?=
 =?us-ascii?Q?IY0IFnnId8A7X7vlOFtgKyU9ERIZof7S/L2QYpb+FoB7MR+zxldrpTCCkyES?=
 =?us-ascii?Q?OOR5pNiWD0kMNayrrnE2WzqSX9rAB3IOVCo9R4K3snNjWVaL6R2zKRl/Hwkq?=
 =?us-ascii?Q?wAoGFNbz/kE66SxFKnt1bqqLIuH99X6FkqebU6h1meTu4zmrUMu2zcQd+vRb?=
 =?us-ascii?Q?x18bWFiqE39rt90NFpCCBM1FL2yp6aoyjgnRZx0nvlVjxUAWZECvakKMY8k+?=
 =?us-ascii?Q?ZOdAzfNE0LfYzCaRCz/ug1TXw8xlec+gBStXwliq8KaSA+jNwjlpclXgnKWz?=
 =?us-ascii?Q?ejfFMISFB3ahpB+lTKUe64R3r2tGDf0IwNKJlsYKh4O9P+QkWwdTb+Do3bCr?=
 =?us-ascii?Q?fXoeZt5juhcWzqzl/+yeyGluU51lzG39agBZnym/J7ospG8k5tu/2KOeUjJD?=
 =?us-ascii?Q?0CSHZYW9B4wHqmxYzvekl+t/WU47Js92Eo2BArX3zuBuWgiBHDQ5BhYS5ic0?=
 =?us-ascii?Q?jt9moksMtPUWoVD4blMPW8AA6aiXYwW++95AaEndXz4yHfmq/LYpBB+6T1Xc?=
 =?us-ascii?Q?r6k4eSjHtRKCETcQFchoa++GfvIk+fGVMU71WJbXvOPgyeff00jZZ71N53VJ?=
 =?us-ascii?Q?TphHmzOEBy4WPmptFaat7je3BjK2FI8iu6VTFTehX7Yu58QQBozaE+aV/nqy?=
 =?us-ascii?Q?IPh4dc/YcVXvKsFYBvpVaFNyMB0+6V/lCXh3GjDpvWXBOYiB3TAF393GUhCn?=
 =?us-ascii?Q?3Hl2HXYxJRuBIIBPA5NTGvLm9qarbv8ownxhpCXHSCwbROiijrLx7bFdF+XN?=
 =?us-ascii?Q?U6cTzRNWeywIIF9+JJsbU++BzfrePEJVxlyP/TKwqPot+VlCQX0J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d909311f-e6e9-4c9d-2df4-08df4002809e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:46:00.4046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYxKEzDtxCJ2NCaCG4H7Xw4siCwZVWhdGVEBUfun+dODoMZhvgeMPi2UVAgYVHmT/l/NjNGo15Hpz0/jsYSRbO0kKsKrzwjzhiAb4R4T0DFyYEvvGelMWNE42HdqH343
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10581

Hi Bartosz,

Hope you are doing well.

I see your patch [1], and would like to check with you whether you have some
TODOs or plans to address similar issues that I met in [2]. I have version 3 [3],
but still not ready.

To avoid work conflicts, if you have plans to address similar issues, I could
stop my work and wait for your patches.

[1] https://lore.kernel.org/driver-core/esbdzbsadwc7hym6aa6x3lirhs3r47w2wcygwshcb3metdh773@ersixahci2rm/T/#m010d95f0c09331b0ab80410d7c495db75d47caa0
[2] https://lore.kernel.org/all/20261106-swnode-race-v1-v2-0-f8bc7b14d578@nxp.com/
[3] https://github.com/MrVan/linux/commits/b4/sw/

Thanks
Peng
