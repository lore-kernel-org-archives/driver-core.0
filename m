Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299384;
	b=dlbfykLzD+v2gtoJpz3Tp9Cv6E3NDDaT6Fscj86UoWsZT/gqnzXGclJGIyDu3gtXj59Q
	 yw36oty0NqEi+XXYzG7VIlpItLVLWRgrphHZrayeudq/0twwkwlYN3y1RCT/2tNtJeQXL
	 SG930DXWG2n0l2+encOg3T7lVbUAwMAJn672dEUIOpzIN/7wVz/kz6Bqg7JkhMDYN1PMZ
	 gRWVlQ71NQFwkdktwEj6VcMwbIpf0RjeJGNqHuo5e3MbVDRvFCPPHDfACe3wbl1fRPtCZ
	 A/4mvAw0kHEw3gegkhjQLLkvDUan8A1D+BG0rM/6KJUXbTq2aV+mZbpR99h4Uv/pNrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299384;
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
	bh=c7hX6NPgiMXkbw4vHpOvki9EzCcN+XMYXKmh6avnXro=;
	b=QLQSQOyMnxrmZZ+/KEKF1tWE/KWdz7IYnPABmoBEtmD9NoH7Aq8WwONhl+Qvo1GpBXLw
	 Zoi5EzzJ71rZ60R/5GgCaOpd+d5YQSVsBQL/CEQa/JwPl/J6PxoqXR3ZEvylOg1IwZeJN
	 A019CnJTaW9IF5VdTK6xbNYKAbiUOp5Yg6Ko+XafX3/a13v0/Ke8ytW1QUwJpOeOzb/Bf
	 kUHNxZvSYr4fQomlSrSfQN2e9fZA+yNULrWpuL+5a88PfWW9qn0isI2s3ME4mrJneW/b5
	 fEyXKIvFztOUoRYeOtXMcG+t1uGmQJzsds3yVeXwBv0/xbzzWL8G6NektZYzPslhpEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GqITv5PV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.28
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013028.outbound.protection.outlook.com [52.101.83.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9660A2630
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 08:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA9660A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GqITv5PV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbK/1NKFg83IcNj4nlUVkdQycHcaU45os0hVt2GsDJhRj6CPTJSHPTwH2N0PS6ZBmObFqoFPuLCPMWoHu0Qur8MctcvyI5EKS056NKOqpjXTAiVtsEZE+KefdoHTglYXgOCR8g73t8Xh7bdWbV/gM22bfUX2haNCy8TCp5tRKccsy5XuFOYc3TSTwvRJ1SGe8um06lGtzDOneX8nHehylMphqBskt9QhYqkQp5lJ3GMZt+8jwKqFv/teseO0kr35R36xEfw0E73UfIEJFd4+kpqy9VmBZsIueAsUvN5apj6QcG0yuCGZqSNw2DBIipQrJD72Q5xvmEKB/gVbUySmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7hX6NPgiMXkbw4vHpOvki9EzCcN+XMYXKmh6avnXro=;
 b=eqI3wRYwoY7a2AgY9ZbvQA4Ye1Jro5duRBBiBn5e6JvY7kMfyDI9yeiIq5bSz78SDbuxVI6ls7ZMIxEP6W2UJ2J/3xyfS5Qj8MWf1aH8kfj80z82OL97WGzj5hD8+nA/20PPMa8DyLLqskSUbmHyyzVumbcYX75A31L86ueT0tcwjndDHbvfWk8jg2K6P5NF8xXrOHpb21yCvuPIx/K5uZhrDQ4+/Wp6RZZtvN4K/GnsrXY42l63cicuTgDXOBEFsej+ObP05WLlenb47HOv2flJOFcLczkr+/DpYmOtbd5KYlKdEpRhb0xRd1+lC7/kByYDHkzA/wFSklDUzC+8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7hX6NPgiMXkbw4vHpOvki9EzCcN+XMYXKmh6avnXro=;
 b=GqITv5PVzoY0JUq8T7Baxaj88DNoVHGTtISeK8uHQTI9E2oc7F71OdAJ0iS+xD3gj2qYsNrfm/tVLF4ERpb4SY2C6HluODEm/HQBjiWOvKTHffcqObt6/Hlvrdl9lS1AenxQ3cVZoJXWdYZcwMVnBQStpBamDv2SUv5ui2LlavWpsVGsTTiovnwJ9eYMGXdN5bNUAjWRo3ebDZ1Z4AQBz+8912QpSkTj6FyIwus0lEDsNDwh1Ccqo8b7cUfA2Jp7MwWrhogNNls+ZJFk8dmiUeP5U6O6hs+DjnWJVa3KQ9uLEb4+Nl4oY5h/63tewrN8yQ2ylAUoNfp73L1ZGDvIrw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by FRZPR04MB12430.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:29:41 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:29:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 10 Nov 2026 16:25:29 +0800
Subject: [PATCH 5/9] regmap: factor out regmap_init_ranges()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-regmap-improve-v1-5-3a76b6c10ec6@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To DBBPR04MB7883.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: dce18149-244d-41e0-633a-08df3f04c3d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|261009223027099003|10067099003|261028144727099003|11063799006|261021135927099003|56012099006|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261026121527099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ug7+ZLJep+zA+IgP6zk86todTVbSCpXvHSogDm2d1ZGGAh50yHKVKihuN2c0AihlH1fXZBRWwIycFaMplXxPxvHweAzARWj0BxDJ6TkbmWQRgay2kfb9xb/UX8mQoYa4Bq6mDdTPrXP50BklaekfXWpbuRKKK3H3ABd5uGKAsDv8UbAEV0PsG3fdPGbh+8XcQhsGA625NDroamMQeRC1pOrwJhIjGEfMRxIVJo7VqZl64u/foE4eXll1hcQWPiHNZoLoQcqiy+AJf30ixcmIjHW9UW0CBLc5Eng2v60ql/DHSDlsuqEBUyA9qdAOnOFD9TzP1He61MD6nTlrVK3D0NeQsU+iIC6jGDUjhzRfSmvgdDWrnt/uDHJl7bVWkqD61GyER2Mig6jukSuxaaTnflZT6v9Xyp5IdGt92CRe9ihWRSIT7CBtEtUZzHDCvPiGd8hRNcDLIfxVue0QssAxyjatNYJ1glZj0t+iej5w1b5cKCpbRrM41PhH7OxjmmWLzPWj3vJtbWyd8EJqXev8nW5Y18mTxcBQRjOQn/BgoO4RYQ8FbGFtQyTQ0ttURgLiLpN89DpT08nLk1eCvEjt+8ZEuLZXnrC+JVE/Ju3mL+31XOcsXWqzLfJbj6BGkQqRdQiL3L/7WfRsXVpfEJxayN/td2KUBG23AM7I/F55nA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(261009223027099003)(10067099003)(261028144727099003)(11063799006)(261021135927099003)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0lKN3ZFMDhuRGhielFieUlxKzJvSXNiR25UdjZWN1RJSyt5V1FONC9xYzd0?=
 =?utf-8?B?aW1tZ0NiVWZ0dGh1anpqdUQySjdwYlhKcy9JMGNPcXhvWU0zMU5NdkNvU3E1?=
 =?utf-8?B?QW5lM0VDNGVuVGhtNmtHNDhxTlhGRVd2dU51WGh0WWFzUUF3Umlud3BrT2hs?=
 =?utf-8?B?TE9lR1U4KzA0YldWbFp5OGJtb0hKdXlBVGl6bnZJNWNjcXdxM3FGa2xjM2dt?=
 =?utf-8?B?YUpWVUNyYk4zZnRCRWxEMUU5TzJ6SnRrdGc1MGtNY25iUFAycVJ4SER6QVE2?=
 =?utf-8?B?dmxKb2taVzk2WHVuTHN4aDRqMWIvMUdOZTZBRVprRnhJVVpIWDV3UjFLQnVR?=
 =?utf-8?B?NXFFeFV3ZHNZVHpmV2U1WGlJdXdZOXEycFZtdmRISElXb0hUd1drMUtmbGJx?=
 =?utf-8?B?alArR0ExVzlIYi9jaDdsRVNkSmtGM2xHVDBNc01meTFWMUdWbzNkZkV5SHZC?=
 =?utf-8?B?RnAyWVhIdEFaZHlYTHgzb1NPVU1QYndENW9KRTY5N3d6a2dGYXpHbU1kZ3Ru?=
 =?utf-8?B?VHVVQkptcUlnWHZYTmlKaUdycTN0Ky9aUjRxb09xVExxRDMyd05GSmprbm1N?=
 =?utf-8?B?OThnVkxkL2ZoUTMxQVhNdE1zN1VJRm9tOU5mMXhwRWMyYXpVNlE5Si9YS3ph?=
 =?utf-8?B?TWFvQW9WRUd5ZVJpQ1JFRytVRm8zc0MvYkhhVTN6elVSMUlqQkY2bU9yeUFJ?=
 =?utf-8?B?a0wwamxscTZYajMvMXVKVXd6WjZwcC9XeXA5VU1MYmZ0elEwUGxVajl3YzRl?=
 =?utf-8?B?bFIzQUZKTWUxRzhPTTJHUGNsYjNVUHVSNlJkdTQxUnRocGtWQXJjM0g3dmQ4?=
 =?utf-8?B?VXc3QklxY0trcW5DSkRXZFQxMTNlQlE2NWRCRmRvWGJ3SmZkZG02SFN0dXR0?=
 =?utf-8?B?K3Bid2dkbnh6dThoZjk2bGlZSGo5NmtGQ0E3b1IvYnZ2OGpUTlZ0TnJoVkpH?=
 =?utf-8?B?UmFoVm9JaDNBME15YmZrOVdmZnFQVUovbXR3YVQvR0tnSTA3NjRlVVdhUW9j?=
 =?utf-8?B?NGJqRStlM3dIay9LMEc2MzBYdExWYURWci9rQXpic1cvSnRxR1RLaFU0VXd5?=
 =?utf-8?B?Um5sNDlYSXc1MXNNR2lER1lGNUxHbXhSdDd6eUxaL3AyRWU4Nkxrd1dUalQ0?=
 =?utf-8?B?RlVaMTQ2UEQ0TVJvbmhQNThpL1dwbmsyaVMycWw2ci9YUTdkckkvNnMyU2cw?=
 =?utf-8?B?ZUtkbExZSzZBcU01ZzVZN0RjME91L0FCZVdrd1k2eVdzYW1VS2dtYm1pdFNJ?=
 =?utf-8?B?ZVA0NUVsNzJBSWZaQm0xWTZtakhpUFpOa3ZWS0FLVFc0QWdjUG5qYmFLSFBr?=
 =?utf-8?B?bFdMK0hkdm9OZVVGUm1BT2o1NkJ0NmFkK1dLZ1NCYkhncjRUU0FyNXpnVm5W?=
 =?utf-8?B?VmFETytSVUpvQVR4L3E4eHpMRHBPL2Q1RWh1cFFzVDI4T0hTcytSRWVWbHVG?=
 =?utf-8?B?VWFuLzQvS0w0MjVYRHkwNW53MHBrREI1ZDdFVXFZdXhBblJXUDRmcVR6VVpC?=
 =?utf-8?B?bFBuYWJjS1JDM0V1ZzZIbWFGS3ArL1N1SE5YUWhrWnNIL2hIbjdvM2d2NWtP?=
 =?utf-8?B?MFU0azFscHJMVUYxT05yS1l5Z3RhM2xpdWh5dTMzNS9IYStiTGhmUWVsTlBl?=
 =?utf-8?B?dE54M0ErNE5TN2wxc2lFOE9BRkJTRFZibFlFVEhWdzI1anh0eHhPMjdvNkk5?=
 =?utf-8?B?QzNPbnRIcGhIbDVsbmhtRVNwcHZ1WmhMUVY1UUJXZUxXR1hzZk8vUVJLMEtU?=
 =?utf-8?B?OXBLbEYydEQ2V3UrZWxBZGUvQmNvUkY4anNXYXBkUnBCM1diNm9CTHkyS3U1?=
 =?utf-8?B?TnFQWnNOVWI0TnlrNSttMGh1THNFZ2YvRW90VW53WXF1OVlibmJrQ2VMcjB6?=
 =?utf-8?B?U1l6cFhUd096WlU4N2p1cEF4a1dyMytaRDBZRU5WVGs2UjRpeXZZcUM5RFdQ?=
 =?utf-8?B?TjkyNUxMcFhCMzhobGpyWmF1VGcwQVp6THVCcVA5OTlTY0NWSWxXbVd6MmEr?=
 =?utf-8?B?VUVBNFdiM1Q0Z25DWHU3VndLbFlBTmhlL25SYWtTVHVheE5yK2ErN0s2NnN0?=
 =?utf-8?B?ZGprdjlxNzBpSW0yVWZIekU1bXVvcGNKTzNZQkNON2lBN25zWTFQUzZOU0lI?=
 =?utf-8?B?QXh2WnVjTFViVlNpUjNock5tbUtvUFc3eTRsVVZzdC91NEt6WnZTT0lHL1Jj?=
 =?utf-8?B?WmlIdG5NRUUvK2ozeERkNFd0WElTQjV1ZEFVaGxuQklYcm5KS1lWcW9iOTBZ?=
 =?utf-8?B?UXJSSXJMWUQvUlQ5Z3VxdWRWZzJsQ3lmZ1JIZ2dna1htcUV2QUlTNnhRTnkx?=
 =?utf-8?B?NHBYQXVZanFHenVMYlNyT1dBOSsyNXBmTmg0MlhIV0ZaQloydFV6RXRsaUZt?=
 =?utf-8?Q?LfJNPNX2CleL5tuRng0e8V37f1nUTcjNUq/eu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce18149-244d-41e0-633a-08df3f04c3d0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:29:41.1638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZmIKy2kYjQq4L9Iovpk5mjtjUAdYwVYsDJdEFfFaVJlkdUcz90nSMCu3JzSPPS+mnmwdaVo2OjEJvTEzoJ6IGLT3/Ytn5Eu14NW6reMP/wHED9r3wAxULVGoG//vQTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12430

From: Peng Fan <peng.fan@nxp.com>

Move the register range validation and rbtree construction loop out of
__regmap_init() into a dedicated regmap_init_ranges() helper. This is a
mechanical code movement with no functional change apart from fixing the
block comment style of an existing comment that checkpatch flags when it
appears in the diff context.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 192 +++++++++++++++++++++++--------------------
 1 file changed, 101 insertions(+), 91 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index b079921287c2..c554079835f5 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -748,6 +748,104 @@ static int regmap_set_lock(struct regmap *map, const struct regmap_config *confi
 	return 0;
 }
 
+/* Validate config->ranges and build the range rbtree. */
+static int regmap_init_ranges(struct regmap *map, const struct regmap_config *config)
+{
+	int i, j;
+
+	map->range_tree = RB_ROOT;
+
+	for (i = 0; i < config->num_ranges; i++) {
+		const struct regmap_range_cfg *range_cfg = &config->ranges[i];
+		struct regmap_range_node *new;
+
+		/* Sanity check */
+		if (range_cfg->range_max < range_cfg->range_min) {
+			dev_err(map->dev, "Invalid range %d: %u < %u\n", i,
+				range_cfg->range_max, range_cfg->range_min);
+			return -EINVAL;
+		}
+
+		if (range_cfg->range_max > map->max_register) {
+			dev_err(map->dev, "Invalid range %d: %u > %u\n", i,
+				range_cfg->range_max, map->max_register);
+			return -EINVAL;
+		}
+
+		if (range_cfg->selector_reg > map->max_register) {
+			dev_err(map->dev,
+				"Invalid range %d: selector out of map\n", i);
+			return -EINVAL;
+		}
+
+		if (range_cfg->window_len == 0) {
+			dev_err(map->dev, "Invalid range %d: window_len 0\n",
+				i);
+			return -EINVAL;
+		}
+
+		/*
+		 * Make sure that this register range has no selector
+		 * or data window within its boundary.
+		 */
+		for (j = 0; j < config->num_ranges; j++) {
+			unsigned int sel_reg = config->ranges[j].selector_reg;
+			unsigned int win_min = config->ranges[j].window_start;
+			unsigned int win_max = win_min +
+					       config->ranges[j].window_len - 1;
+
+			/* Allow data window inside its own virtual range */
+			if (j == i)
+				continue;
+
+			if (range_cfg->range_min <= sel_reg &&
+			    sel_reg <= range_cfg->range_max) {
+				dev_err(map->dev,
+					"Range %d: selector for %d in window\n",
+					i, j);
+				return -EINVAL;
+			}
+
+			if (!(win_max < range_cfg->range_min ||
+			      win_min > range_cfg->range_max)) {
+				dev_err(map->dev,
+					"Range %d: window for %d in window\n",
+					i, j);
+				return -EINVAL;
+			}
+		}
+
+		new = kzalloc_obj(*new);
+		if (new == NULL)
+			return -ENOMEM;
+
+		new->map = map;
+		new->name = range_cfg->name;
+		new->range_min = range_cfg->range_min;
+		new->range_max = range_cfg->range_max;
+		new->selector_reg = range_cfg->selector_reg;
+		new->selector_mask = range_cfg->selector_mask;
+		new->selector_shift = range_cfg->selector_shift;
+		new->window_start = range_cfg->window_start;
+		new->window_len = range_cfg->window_len;
+
+		if (!_regmap_range_add(map, new)) {
+			dev_err(map->dev, "Failed to add range %d\n", i);
+			kfree(new);
+			return -EINVAL;
+		}
+
+		if (map->selector_work_buf == NULL) {
+			map->selector_work_buf =
+				kzalloc(map->format.buf_size, GFP_KERNEL);
+			if (map->selector_work_buf == NULL)
+				return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
 struct regmap *__regmap_init(struct device *dev,
 			     const struct regmap_bus *bus,
 			     void *bus_context,
@@ -759,7 +857,6 @@ struct regmap *__regmap_init(struct device *dev,
 	bool fast_io;
 	int ret = -EINVAL;
 	enum regmap_endian reg_endian, val_endian;
-	int i, j;
 
 	if (!config)
 		goto err;
@@ -1076,96 +1173,9 @@ struct regmap *__regmap_init(struct device *dev,
 
 skip_format_initialization:
 
-	map->range_tree = RB_ROOT;
-	for (i = 0; i < config->num_ranges; i++) {
-		const struct regmap_range_cfg *range_cfg = &config->ranges[i];
-		struct regmap_range_node *new;
-
-		/* Sanity check */
-		if (range_cfg->range_max < range_cfg->range_min) {
-			dev_err(map->dev, "Invalid range %d: %u < %u\n", i,
-				range_cfg->range_max, range_cfg->range_min);
-			goto err_range;
-		}
-
-		if (range_cfg->range_max > map->max_register) {
-			dev_err(map->dev, "Invalid range %d: %u > %u\n", i,
-				range_cfg->range_max, map->max_register);
-			goto err_range;
-		}
-
-		if (range_cfg->selector_reg > map->max_register) {
-			dev_err(map->dev,
-				"Invalid range %d: selector out of map\n", i);
-			goto err_range;
-		}
-
-		if (range_cfg->window_len == 0) {
-			dev_err(map->dev, "Invalid range %d: window_len 0\n",
-				i);
-			goto err_range;
-		}
-
-		/* Make sure, that this register range has no selector
-		   or data window within its boundary */
-		for (j = 0; j < config->num_ranges; j++) {
-			unsigned int sel_reg = config->ranges[j].selector_reg;
-			unsigned int win_min = config->ranges[j].window_start;
-			unsigned int win_max = win_min +
-					       config->ranges[j].window_len - 1;
-
-			/* Allow data window inside its own virtual range */
-			if (j == i)
-				continue;
-
-			if (range_cfg->range_min <= sel_reg &&
-			    sel_reg <= range_cfg->range_max) {
-				dev_err(map->dev,
-					"Range %d: selector for %d in window\n",
-					i, j);
-				goto err_range;
-			}
-
-			if (!(win_max < range_cfg->range_min ||
-			      win_min > range_cfg->range_max)) {
-				dev_err(map->dev,
-					"Range %d: window for %d in window\n",
-					i, j);
-				goto err_range;
-			}
-		}
-
-		new = kzalloc_obj(*new);
-		if (new == NULL) {
-			ret = -ENOMEM;
-			goto err_range;
-		}
-
-		new->map = map;
-		new->name = range_cfg->name;
-		new->range_min = range_cfg->range_min;
-		new->range_max = range_cfg->range_max;
-		new->selector_reg = range_cfg->selector_reg;
-		new->selector_mask = range_cfg->selector_mask;
-		new->selector_shift = range_cfg->selector_shift;
-		new->window_start = range_cfg->window_start;
-		new->window_len = range_cfg->window_len;
-
-		if (!_regmap_range_add(map, new)) {
-			dev_err(map->dev, "Failed to add range %d\n", i);
-			kfree(new);
-			goto err_range;
-		}
-
-		if (map->selector_work_buf == NULL) {
-			map->selector_work_buf =
-				kzalloc(map->format.buf_size, GFP_KERNEL);
-			if (map->selector_work_buf == NULL) {
-				ret = -ENOMEM;
-				goto err_range;
-			}
-		}
-	}
+	ret = regmap_init_ranges(map, config);
+	if (ret)
+		goto err_range;
 
 	ret = regcache_init(map, config);
 	if (ret != 0)

-- 
2.51.0

