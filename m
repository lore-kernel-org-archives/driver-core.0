Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299369;
	b=d0HhZeY+KayBcS/gQWpVk7yVpjsnNCb8/myhqJaM4WdfQwd/YL9vNWrarJt2K0FUlGO1
	 hVJoijUyr7r56xHlv4yDbXqTUxtDjwLq/mhfH4SSRP84ykx67KoR+Y67TatQtCG3awu0Y
	 LuUC4rxlLmFvDAA/wwGbl2Pr0bRqZ7V56shwKOK6m2IDShKcDZ3SUnsGG9i6HKDWXlyCs
	 Aqfogj56TrR+MbQdOanK7zhNXlxR5KxKMXnWyAi09FbjuKCsmrtJ0m4M+WoiJiM00wsLb
	 dyS6tju3JUNA2g7hf+TLi/mBUcXPXL7e7Su/G4C2ayBYYV39TQbDlQMzfoevzJloBbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299369;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=o8ZkQgxi8Ce+EeHNR8tUGP0CbPaF31VRBAk1mcR91l4=;
	b=fYEXTibzOr//qQWMqcZazgPvUHuPt17c9fxpJhJ9p8rCldk9EXUaJyefvxnqEjospr/b
	 DCKPTl38qYr2qCHtUSGAxnbSOZaH1mcs/MY99wYZW9rWe2nXahUB9ekDbHHunWnvbI/Td
	 jBPDdXFGutcMryaWV/2HNALKukn+rCaoU/5/EHV+edmMgpsQgT/uei36gRzpRCeCsPadd
	 hQ2NNm2+OtkYXcNAZzu9pl21O03AjY3iUuZnc0XZ8Ntq0CVu6qoJKdBWyXFxxH4w8bTuk
	 edz+KqV6zK6yYgzjDibkl0XyzTOQwtWMLrlzrZgLim0Gvmz+uih5u4ivH/pLPgIZLmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lUgu3Dic;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.40
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013040.outbound.protection.outlook.com [52.101.83.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5FD60A3826
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 08:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5FD60A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lUgu3Dic
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XekUgMQrSa9A4gFFQQYyFnHBK4DtTtSgqbsZuw6hnGBWiVwex+iuH++Piy6N1O/KwUXeicux9tNuwefkawGWFrtZGXBIrYaBtlHbwAf+qRFsW5Q8ixVk6Y85/SDKHxePEf+HxeftVcolIaYufU4wmU63os1tNf7WKb982wDUwbl/0XJYuTukVvPM7tZ8mjtNHNnxL0sH6MV/Z91XnjlwGvFkFKKg0sZz8ZsYsAHqFZS0YoKsAq7sjtFMVn/Nm1oLYoceBFOUNEtZvw6LmeB0HSWJLuI9s/f1qKDXFB26TaRSDNaxi+ZrM4coh1lA174QxQm+uAetOaaKL91Bm65Baw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8ZkQgxi8Ce+EeHNR8tUGP0CbPaF31VRBAk1mcR91l4=;
 b=IUdimGoreGptPUCCRoxhPRvv6K2nCr4PRRRkkm3VNUq5sLkTXAxAyN/JoBy0lyE6BE29XmAkacTFFFZzcLk4r3fRktTvE1+NxuSQP0ThLIpC44bfdCIlVrohVklXzMbwvfgCyd8Ainli/MCEdK9CkI1OXKdPLbBKEbKCIPFgRQXHbiAd+csoYY+/dJBbkFFdA40TrWMVq1vFBniU/7GfGW6uvU+vJ9Lqn5/ggyubArxiUsrl/PWgr16xAk0UPnxSE76U0f5G71tRJccJLSHyP/appzlHWSOuwkPkha/c6L7QbBHEq9VIDJY4TVor5yfHGQsMuV+1ln66ED/mDLhr4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8ZkQgxi8Ce+EeHNR8tUGP0CbPaF31VRBAk1mcR91l4=;
 b=lUgu3Dicrg5IpEnbPlV3MWGAwg5WN/fuw1zMlK/qUGkqJ4OZRrid0ANrd43fmmAEk6GOQVMUFLl+JVuc3t6Jx3pnQfVemZXwlYCbIsAdKc9uJE257sNEPexQJZD+HconsiIy7uIowyA+Hoi/PIh0WmDC4AlbgP4tbAoSFxypJ7EXYYKyb+ZHeT2gvNdRcG0YfEnmEeZc5FL5CMOFS9kZ9XnzJv1qCzMMR+8nvcarH5bDH1pOvp8MirU/Ji8xcj+wrWNcV4u2g6l2RNNpChNIkvWA70KRsCpPeFocZJIdL/6fqp6n0mVpesppFPeaki3NeGy/qs+h8FVrbzU2gk24hA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by FRZPR04MB12430.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:29:25 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:29:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 10 Nov 2026 16:25:27 +0800
Subject: [PATCH 3/9] regmap: deduplicate fast_io checks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-regmap-improve-v1-3-3a76b6c10ec6@nxp.com>
References: <20261110-regmap-improve-v1-0-3a76b6c10ec6@nxp.com>
In-Reply-To: <20261110-regmap-improve-v1-0-3a76b6c10ec6@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: MA5PR01CA0252.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::7) To DBBPR04MB7883.eurprd04.prod.outlook.com
 (2603:10a6:10:1e9::23)
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
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|FRZPR04MB12430:EE_
X-MS-Office365-Filtering-Correlation-Id: f662299a-22d1-46fc-a63b-08df3f04ba82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|261009223027099003|10067099003|261009221727099003|11063799006|56012099006|261021121427099003|261021123027099003|261009220027099003|261026121527099003|261009223327099003|261009221227099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JQi5qaV9RVqEmpnoSpd6uenExhrPCLBu1ORp+m8JRLYEda3ciFlEmFBLjemS+piVrQbTl+J9HQebX+A8o6Z2WFLTQ8c5nek/p7NYpWUxZhzdXaVYxlQxvSx1r8YZvDBAqzHlUG2l3xvtZurPZM5WCj15mkXUAw+gfpGYIFjS1NvOpdChsSKH8+6L5UMnvBM7s8SiYcvJKhdnX218uCJkX3JvnEn/e5RyDO1PzC2D0Rqbu3xgUdW8vaIj8wfX518D1YLEeBrCpEb8o5+Gd55zuoh/nSJYg8wf3LbhMDPX5icDfPYh0lij2oPH60FNvM3JN7WiBWQ5ObChO1/u/h2rIXLxtwUcpWddzp56AfwSoHIhLcpDvmeeCrENoNWwGPEwmlXqR267u7pxUmNLbk+NuEi2XpwnTbHcqtAPtCzPZad+G2LFeZd6IDjOHAcL29pZGrgdyumf+SYUufS9uXBohf2/8MpegSnXjHg68xzsmSCa4PJKY2xTFufX3nqRaU9pYHn0JeRko/rjtB3E4r1XyU26czJTNqgXcpykypc5fnB7Om2ThEWwbACjhKY+DfMJwJMo94G5BntTPWT8s1AwErqTe5kwJNZ6aQItT7eUYQTd2rJXyCtLRue+4Dzca32ceGSvgKN2xG3MsBjX+1QiWn4KHSBXaOCv9pGmcooh1RM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(261009223027099003)(10067099003)(261009221727099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009220027099003)(261026121527099003)(261009223327099003)(261009221227099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHBicjkxY25jbXhTSXFuYlNDZ1VKRGNIS3dNYlJuMnJ5N3VwVm04TlJ6OS94?=
 =?utf-8?B?QTFtdUhLZThaVXpHdVVYaVFwaXl5dy9Bak5xUnl2SFZjenNvTW5EQlhLemVw?=
 =?utf-8?B?R2VBMU1CenN4b21pblNkWURTeEk1UnNPd1pPYnQwaUZBUlVpeXNXbldhWEFx?=
 =?utf-8?B?RWZ2Ymx4T3ljVFZpcExGQTdKZDBGMVIwRFYrYTdCMVhNTlFlaU1sU2p5UWlN?=
 =?utf-8?B?bmw3cDFtcFFrZkZYMmJVcmg5Ym1DcTJTOHR6RXZJZFZSTFNSejBzTExRbVpD?=
 =?utf-8?B?M3l5TlpJUXJXNnYxdEczVlZ1RTJvOXdKZVRKdnI3VlZCUCt5SGVKRUQ0OXd1?=
 =?utf-8?B?Z1AvNGE2T2pmTVk5QWVPSEdRVGc4MGduUDVMa3dTak5HajlmdWZ5WURHdTVU?=
 =?utf-8?B?RTZNb2Z2YlNZRmNUa3FZaXBrY2NlR3I0YUZpYkdtcnFqYzlhNGdJRmc3bi9G?=
 =?utf-8?B?ZDJYRzZQclpubTVJa2c3czZTTEVDT0tLdFIxOURVV0RKZVROTlNuZS9IMVpU?=
 =?utf-8?B?eCtUOXFiL0UvS3BCVUdiSEp3OWtyTFRaUjNObXRJREtTbFhESzlmUm16Y2dz?=
 =?utf-8?B?cjJEZWRDSjNhZEdCRE9QTFF4MFVlbEVoanA2RkNVekU1L3J3TGcxTnNkTmpl?=
 =?utf-8?B?ZEpRZ2ZZQVpxa21KeW96Q2VqWG5DWTVtb01SU2NOdXJpUjVRUUxuVHh2WUl4?=
 =?utf-8?B?VDFyVTJ6RURIelBrcW9TRWlUVnF2UmtiLzltWUtJY2w3QURyT2JJV0pGUGRy?=
 =?utf-8?B?NW4wT2crY01qTGk0YTlZeXhSSWMwNFUxOC8remR0eEFIa09SdmtrNlZvZ3k3?=
 =?utf-8?B?MnFUT1FHSERNTmhZU2I1SUtXZGNZZ1hObFpmaUw4eXo1ZFlxNTRnSTR2c21u?=
 =?utf-8?B?OFFBQzQ1cmRwTjMzM09mdGdFSnRjWm42MmR5WHN5KzNpNE9haERsYndHSXZO?=
 =?utf-8?B?aXFjZGt0aDNJR1p6amtSMHIwRW9NN0NnL3FIQmIwNXRuaUdaV1N6aUdNMnhP?=
 =?utf-8?B?N2tvQ24vc2RQcmI3NGRkd3AzSkZQM1FZcXZ3RzlYMGx3K3Y5YTh3NWJ3V3pR?=
 =?utf-8?B?YWthc0Y5a2ViOWlyZUxWd0FHU2VXTithVlA5OXpBcTQzN1pZdFl4QktSUXUv?=
 =?utf-8?B?SVlRTHZqTWJOUVppTG1IWHVIK01IYU5tMTRjNE5aYytrbnJYWnpqUXlWekZy?=
 =?utf-8?B?VzVxM0xrQS9kK1c1NzFBMXRLN2w5cXYrRU1jeTZtRDJ2QWZCNmZ4UG1PM2hR?=
 =?utf-8?B?UXNTekFXNitpK2pJdWxHZGc5MXIwVWlUd2Q0c3lkWjNIQWhMeFF1dnREZWYv?=
 =?utf-8?B?OTRFN1p3NmFJdXNUQXNsRWJTZm9UUW1Odk9PWTltY2cyYUZoT3JzdkdtRXpp?=
 =?utf-8?B?TGJoYk5RdGFrM3gwMzFNaXFRblBrVnVVWWljREp0TDM2cWJhelRaSERSbGFD?=
 =?utf-8?B?eU5NSDBKS0hPZW9SMzBXNkl5VGNqNGY0MzBaKzl0WUpVam1OVDlqTzEvZlhL?=
 =?utf-8?B?THhYQUJkZTg1YXFvayswTVVmQmVKK3k0MkdtSU12aVRSOTdQWkIzWFd5Q0ZH?=
 =?utf-8?B?eHBEZkxVOEpXaXFId3AxZHc3bmtNRWEwWXNEZjdmWDY0U3BsaWVLRHpjeDZR?=
 =?utf-8?B?WGdLdmEzb3J0ZzAza1JXSW9rY0F5ampjKyszS20vWUhxNzhSQmU2WjUzZk5q?=
 =?utf-8?B?OWxmTTY5T1JERkhwZzFETTVYcFBNZUNRLzJSZVk2ZEkwdkkzU3grejcxV0dF?=
 =?utf-8?B?U1RreFVjbXdhNU5Ud3RaY1VKMytMMlRRMEM5NWxvaFhLWWRZZG0wWnJCTzVp?=
 =?utf-8?B?NVdwL3RlWjJlWDBwbllBNDhqak9JeDVRNE9qRUJJaThsNFVwcHRRTUtwMk4w?=
 =?utf-8?B?T3ZkMDRrRXcvVHlYaEROVW1tOWZPZGJleGlGM2lFMTk0RjFVSjBhVHBiRGg4?=
 =?utf-8?B?RktGbE1YU0lCSDJhcDhaV1puUVdsMG9zWi9Bd2k2d2gxZFZZS2V6VGF1bWVm?=
 =?utf-8?B?dGJ1MVM1ZWdoNXZ6aUZVdGNHWktjZUN3ekIveTAyeWVOVjdTNG8ySm5BVTlX?=
 =?utf-8?B?emdaVXkyRWcvYmZGZzZ0VHhjaE95T3lvVHhCQXE0WkVYcXFQV2M2c1FFZ3VC?=
 =?utf-8?B?MFNsbVplaVBSOXJaMGNWekkwOFZsRm9QbnRiNFcraW5lOG5IbW5Ib3dZajZK?=
 =?utf-8?B?bnIrbDArMUVQL09vRXVCcWgvbGdtTEJXV1l2SnJaMGFvZitzNUo2NUJuNGNk?=
 =?utf-8?B?RGtEc0FaYlFBWVlFUTAzeW4yQlBMM3RPTkJGeVNnR2s2N2VTdlNvM0NJYURK?=
 =?utf-8?B?dzNBR0IwL0VFYXJEZ3dGclkwc2V6cVFpemRxMXUrcVhUOXdPSkF1aXIxS0V5?=
 =?utf-8?Q?RK3PbKA0m3be/mM+jn68gdd6UJNaklKE67F/M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f662299a-22d1-46fc-a63b-08df3f04ba82
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:29:25.4352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPwwowRbpfIxWxqWOCTD3AgJH5vzuXPSLB2lgZd5JHAovnaHe5E6awFwh9YrcYa7QWeFTg3z08+WTEZHqDOM7DiX8k0nq8jTSJsTRRS6qM/ICkJ5T4kRB65e5jd1mu9i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12430

From: Peng Fan <peng.fan@nxp.com>

__regmap_init() evaluates "(bus && bus->fast_io) || config->fast_io" in
two places to decide whether the map has to be usable from atomic
context. Compute it once into a local fast_io variable.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 83f1f5942135..dff6511ab50e 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -681,6 +681,7 @@ struct regmap *__regmap_init(struct device *dev,
 			     const char *lock_name)
 {
 	struct regmap *map;
+	bool fast_io;
 	int ret = -EINVAL;
 	enum regmap_endian reg_endian, val_endian;
 	int i, j;
@@ -700,6 +701,8 @@ struct regmap *__regmap_init(struct device *dev,
 
 	ret = -EINVAL; /* Later error paths rely on this */
 
+	fast_io = (bus && bus->fast_io) || config->fast_io;
+
 	if (config->disable_locking) {
 		map->lock = map->unlock = regmap_lock_unlock_none;
 		map->can_sleep = config->can_sleep;
@@ -733,8 +736,7 @@ struct regmap *__regmap_init(struct device *dev,
 
 		map->lock_arg = map;
 	} else {
-		if ((bus && bus->fast_io) ||
-		    config->fast_io) {
+		if (fast_io) {
 			if (config->use_raw_spinlock) {
 				raw_spin_lock_init(&map->raw_spinlock);
 				map->lock = regmap_lock_raw_spinlock;
@@ -764,10 +766,7 @@ struct regmap *__regmap_init(struct device *dev,
 	 * When we write in fast-paths with regmap_bulk_write() don't allocate
 	 * scratch buffers with sleeping allocations.
 	 */
-	if ((bus && bus->fast_io) || config->fast_io)
-		map->alloc_flags = GFP_ATOMIC;
-	else
-		map->alloc_flags = GFP_KERNEL;
+	map->alloc_flags = fast_io ? GFP_ATOMIC : GFP_KERNEL;
 
 	map->reg_base = config->reg_base;
 	map->reg_shift = config->pad_bits % 8;

-- 
2.51.0

