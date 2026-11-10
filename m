Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299361;
	b=pkYeDJTqdlnYm7mTnnFA1BQNqKFJAgKWzLqURdA7SkS9I6tL+evuZXzGCI6mLDGffQ++
	 N2kVKsnEZtNDbmvXjAeqS3BUE7FDxrED9LihSWNZ8arLwoEG+bxldt2uOEaZljCO72kIE
	 pFnq1Uek75WTzg/IwSN0/+AjZ/oogdyLbL5BnoJioD6aG538RcKRSfTgPiFlwTc4MJY1R
	 KIlG8COdu0b5Vriq26Wk6BWLR85wGgp/NpuFS3U5YXwHcW+yt8f8H3w3RhTCdrrGy2T3V
	 uVbtmUtDo5980ioS93Rvqkyl/TWHi1EyKP4AcqmfLpNQCvDpQfS04hrzWxXGsdC/gCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299361;
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
	bh=fCEk9XLLV8hMmIC8L+WzObSBYbC/eL7edp1GqnDbaNg=;
	b=h1UICIe6qLiyw8AB+SpNN9h+2b+oruE2baIZIaEuuUwZWSH4WI3VxVLG0OR21zRzDd5j
	 9C0mTmGo64TAO4pTG+Q1SCsbfqXniHd3YCPchECnET5p2gDxX+llbY4+O4TUCqurdt6FZ
	 x7W7xJvK5DPhmoI9Td5/c6M797X+YThR7VwJDeUo9WmZbdov5D1HVEj6UOoxKu8Ez8JLD
	 sHf7CvH+HewzF8j6OAvA2f8gKjkXnqgLMxG2ghtRlHcK18bZ1jNl8/Uy0wjr7aTCnGnZs
	 Vg9W4i1QV28C6+APtcm0YbsfSgwy5zO9QhcgSjqsAjXIpFWpFgDB6T7Zzy9qZ+vZ2ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=V7MrAApw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.21
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E1D60A2617
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 08:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E1D60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=V7MrAApw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UILKg2hovYoUizj3CBn0pVLt4xzxT+hWp0hxaiF3Oj4h2uyIUUhkmDLXp4YGkxyVJ+ejqA3c0w4tGtj5cSjqZRIhtMA2uHPtGxD5DkIXJ+oZNGXkITrl7TE2o3uXIJeHBxlknPUUzbDGaDrB3/2p407v82GOe8LvI00wMN1mGqo/yfLiDS6HKtMEwNcz47SN6J6f+Ud5otThmoUka8WMk1qUfz3dFtBK3/lwxUeR/ygYScgGiyZ+e19oq7QlEbPjtAGKYvm9XEQrc35mtHpl5buupX9gjWpFkENTNqygjPUdHY3UFrLTw652VJ0qq26UtZHN0aY0ofgP4qIwAyHd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCEk9XLLV8hMmIC8L+WzObSBYbC/eL7edp1GqnDbaNg=;
 b=LVUwC6l/OPTW1CDjRtV1HtAxhNFTwLEaaOWkcdupOktw+q67FL1giJdNpb5FgBBhBXpxXVxgu5AFGx07d50yyluvHXUnmqNYaTUtk4AkFnp4dt9uHFf6weLuW6s7NEmLej2N7K9IbaFDx8pdIW0Lxc+n5XWXRn/CbDoaoWIuvIkRze2wR4fNhFU593ZImeOdTz9JZp9S5XwDcGPYW5eqFs4E6X17Hb9cW0K9idKs1dwAhyfC2Y4tc1ndzOhdNZcv30hnLRkFCDyusvn9/3PlRRifIfQ7sG7/keeCKMrizjQ1V5+2FizAhKi/vYT3ZccVwqSpyvoA8dSG74ycOo/I/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCEk9XLLV8hMmIC8L+WzObSBYbC/eL7edp1GqnDbaNg=;
 b=V7MrAApwf4uKwEGuQYHsLPuJQ++tYV+ZTbYBsVl6AAZU0Y2PBwvw+KWOBwS4+fq55a1UPNc1YXK8Bfc8bt/xPqU1zo3DnTSOt5nDQh1/JvUIbpdu7JE0fRzQ3KgV5d694THkDbUJ+45ooLekih3oj2UVbVORgrR5Gp3xXLWQwxw/QpNdt1TwZRbk5+2eS95Qm9vmn0f0yUo0+15rVhwjAFo6ZtQ1KxFYoX1XrONKVA03eb21P1XApVMABS0vZrnouxQPr+zx8SsfE7Bwt3avxnGxWZQGilC/O7sL4Cpc1ya8+LcdvbO9rOAspMk4F4se8yoHIBSiiqPOJWB7BkicXA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by FRZPR04MB12430.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:29:18 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:29:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 10 Nov 2026 16:25:26 +0800
Subject: [PATCH 2/9] regmap-i2c: avoid underflow when applying write length
 quirk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-regmap-improve-v1-2-3a76b6c10ec6@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0253.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::17) To DBBPR04MB7883.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 158563a7-88ab-4c0d-a50f-08df3f04b67d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|261009223027099003|10067099003|261028144727099003|11063799006|56012099006|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	w309KH8vA46ZEQAsYmJSxKJ/aj+VB+8DQENlyB5R/praLD133fjVCnJ1CcjVGg8PXDbvLIMT+Zn+eiyCzvvPCeGSz40IWjkSY0aPhqkPhsxKe9KAWnMCHHfJBmxnO2qQDgWXi19h5y1fk7XyipWHpaxhNht83fYLI1NJI1rnKrBKszpZ6CBY2B3VpiSxyTWER8ohGJc5FAUM0/ldr4wk4w1c7w5pi0RbJMU9iaBZnhWhsaLhgMX39nIGl63BDWs6uK1/h+ChKACeyXPA3Kp+w33fZlU34+GWyOh5/G8BKFI/KFeOWYVFRy32hm3ePRYbucRIYBAbu8OGu5OpdpV3lAKiyiiqmsK0xzOAyUedMH/mbGp1VCt8NGlBq9cRE6OwWBAxfHWCZWepOtRelk19dlHbltkuEGora6pktQmIJ7Um8PPDoS/3lg5nS/rSJYqyCD7xWq3KSbK12XydFMI1m5nhIFfV9/SjbzbWEOoAStf23FE91d1br/yybydWuU24/tkXk5rIQ+e4ZsybYdMgxTx0rTaKEmZZkq6HW8NOkzfdgy6x19vr2Nt15kg7FAhCMce95fHFFzrfqY39gOsuQaCrVdbTx/9SV8d/jk+4cwAQBMnc317mbg4QGRE3FoEhzLgVw0D5ckdfRkkXy/9F2kk1RPFlNomtDRqO6lYF2lc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(261009223027099003)(10067099003)(261028144727099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clZqWVB5NTVEVXk1UUExbEIxY3YvOURMRndHN2hCU2xzaVFhTHIwNzBaWXJ2?=
 =?utf-8?B?RXlWK0QzeTd0SUpzQno4Sy9kbTNJcTYxRXJOdzVpQ0lGRGxKdGV5VWhEaHJZ?=
 =?utf-8?B?RDdZaHUzNkl3SU9YZjVBS0poei9jTUluTENVVkNFV0FXNWtuWEdFUjNrVnRW?=
 =?utf-8?B?N2U5MEJGcGpyN2J0Vkgrd1ZhSGFTZ3lLYUJnQVZLV1NOT0kvalVma2pqV0xM?=
 =?utf-8?B?UWhHOGlaMVl5aWQvUFNBM2V4cG10Sm1iNkRwOSt0NVowVCtLWTF4NWQ3U2h4?=
 =?utf-8?B?WU0vOG9VQW9rdWNxTFh4RlMybU0wNGFJNllxSWFsY3EwdDd5UndwbENBa0Fu?=
 =?utf-8?B?akovdkVST0RtR2JxUFpWSVRvNmZydTdEblRSQnFWQVdETEJNUUxKcHBSSFhn?=
 =?utf-8?B?TGNRUXFXa2daTE5HcnViNWFNTkplWW5YU3ZGMnlWYlhqREVhWGRPZ2JKUEt2?=
 =?utf-8?B?bXlkYnFwVzBNMUlqOGJDUGVRUmNBNXc5ZklYQnZzb05GR2lYS3hyN1pEU0xB?=
 =?utf-8?B?RkNnYXd5cm5abURUQU0vYXRhOUtiUnBsaEJMRUZDU1R6aXZHYk5WYkJwa1Bm?=
 =?utf-8?B?L0puRXozLzNpT0QrZEd6TGptV1lyWXhFSU1jWDJENUthRGc2K291N204RFF1?=
 =?utf-8?B?WnNrMmVPVmRKeUpEZCtsa21LWGNyNGoweWFBLyt1WGNsM1pCZHFWS2ZWVzkr?=
 =?utf-8?B?WFp6WU1rR25RTmdJOGVaTWdJNjgyS09OeVpzODZxRG81NFFFRWhkQzFSaUpI?=
 =?utf-8?B?eUxDVFUzbGpIR0VHRk50YlRoSGxmNlA2S0k4RGovbWVHTmtVU2lva0JPVVpy?=
 =?utf-8?B?NHpoMWxrWFE2ajlmNXQ5di9Md29NQ1FiUHhUNnZBb3U2VG9obWEwVmpWcE5h?=
 =?utf-8?B?Vi9KUUVoZXl4UkZiOEcvbjVUVG9kMUcxeUZHS3F0RThGanRuTlZGVFVQQlpq?=
 =?utf-8?B?N2ZSUW14SHl6dWd6a0xpcXhwOG8ySUlVdDcvYkpNUmZOTEhteHk4N1FPZ2M4?=
 =?utf-8?B?TDIrbnBwQmorcDY1ZlF2bVVJUTdtdHFnQzVwWndIb0xhRUp6VjcxdUtVcjFn?=
 =?utf-8?B?YUVuOVc2czJhSldzQU8ydmxLU2hIcUR1Ti9pZzZYdFR3bDI5Z2pUWjcwU2ll?=
 =?utf-8?B?SC94Uy9jVEdyak1lbGxPL1pqSVpHOXUzOE1XVUlMQ0hNTCt3Q2J2VGhoR0Zp?=
 =?utf-8?B?M0RkTCs3U0RiRFF6TDNpRkVZUitRM2dsYnJzNUhYR1lsaWxSY3dhcGN5YTNB?=
 =?utf-8?B?cHpta3ArWEtPRGdFbVI0YjVoMDcwOFplRFJFcGQxdDFiREpPYnEzaldTSEtZ?=
 =?utf-8?B?OVcydmJMVFloU3U1MDg1Si9HeDMxazBwUlJLUEkvempFOTdJUG4wbSt5ei93?=
 =?utf-8?B?REZTcG9aVnorMDgyVDdObktoWXFtQVgwVGh6d1VldmgzWkZ5MEJRQkIzSG9D?=
 =?utf-8?B?SnoxZFRJcGF5NUZYYnhoOGpJQzRnbm9UVVNJTWlYZng4K2ErOE9LU1lUSjUr?=
 =?utf-8?B?b0NwamVBV2YrNlozZzFBOUtEbGk4R0lBK1F6UlpGRmt4ZnFGVDViRUFsMXBM?=
 =?utf-8?B?YzNXV1hrZDMxenIvNVlpMzlJYm1jajJjVDdodkRXdk1DdTMvNEhvOUhuSjZt?=
 =?utf-8?B?UTlQTEliVTIxS3ZxcEdKOTZUSVdKQUluVmM4Y3V0SCtoWitSR1pUWk9LSHNn?=
 =?utf-8?B?NjJCU0FrdGg1czVwSlpaNWtGcWZDTmpZbUNWV1lhRU9zZVZwWURNQ3JYRmpQ?=
 =?utf-8?B?UzluOG82dWgwRnNjZXE1UC9mRjBUTDVhalVWb0c1RHo4TUJJZXFGMmwzKzYz?=
 =?utf-8?B?SUdiVnZZQm0yMnE0a2NjRWI5bkxXaHBUQjBXTUVrMkluVSthcGhXQ2F5dUtB?=
 =?utf-8?B?elJFZGJES1ZjbjJ1ZzZUWjM2aFZFalFtSVd6b0FWQ05sOFI5Vk92SEZsNVFQ?=
 =?utf-8?B?M1Q4RWhqT1IrZzNtWHdiUWl3TFd3WnFOdjJmNHhZZWRkNTV1TlV4bFYrUytP?=
 =?utf-8?B?ZWVkb1U2dlBTQ3M1TmZKU2RKYTZlbVRYeWpqZms3RDNTd0J0OWVCclBPajMv?=
 =?utf-8?B?bUV4Smg2TndOWnBVdWUrVGUxNWdKSUxZUytETmJZbE8ySjdWWnY0Qm5uWnlu?=
 =?utf-8?B?ektmaTd5a2gvRUdVcVF3WlpETXpEUkoxcWgyeUpRS2Z4OFROQ3g4NS9ERzJw?=
 =?utf-8?B?ZWpzZUo1elFoYVJvb2RPd3lyMGRBVFNtWkNvL1hUV0ZaTmVQejg2Z0p5TGVj?=
 =?utf-8?B?Vzh0TURDa1FQcnBJczNGMFFJOFU5NUYvV1hHWFlHT291cGZleHZ3Nnk5ZUdD?=
 =?utf-8?B?MHhTRG05ek15QWxKSEVQaFQ0RHRWS2Q0UFFoaXc0Q0NQUzg1bnVuYlJDUFpX?=
 =?utf-8?Q?i2xYZ1pfyUS6e+ZSD0tCLNB5g4jk+vwd35caZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158563a7-88ab-4c0d-a50f-08df3f04b67d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:29:18.5439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7GBzTI/acZEB/MnmtCY9043Ry4CDB+bB73MkespaA4GImtmHU/hgTbcrlshLIM2Mkp+UR9zn86o+DohRbegmIIckp4nypO44lKAwHSlQdYvB71o5EKG/TARW+xn7uO1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12430

From: Peng Fan <peng.fan@nxp.com>

The adapter max_write_len quirk covers the whole write message, including
the register address, so regmap_get_i2c_bus() subtracts the register
address size to obtain the maximum raw payload. If max_write_len is not
larger than the register address size, that subtraction underflows and
produces a huge limit; when the sizes are equal it produces zero, which
regmap also treats as no limit.

No raw write can succeed with such an adapter because the register
address alone exceeds the quirk limit, so keep the current limit instead
of replacing it with a bogus value.

Fixes: ea030ca68819 ("regmap-i2c: Set regmap max raw r/w from quirks")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-i2c.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index 8663a4ec0a3d..eb3db02ad8fb 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -401,9 +401,14 @@ static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 			max_read = quirks->max_read_len;
 
 		if (quirks->max_write_len &&
-		    (max_write == 0 || max_write > quirks->max_write_len))
-			max_write = quirks->max_write_len -
-				(config->reg_bits + config->pad_bits) / BITS_PER_BYTE;
+		    (max_write == 0 || max_write > quirks->max_write_len)) {
+			size_t reg_reserve_size;
+
+			reg_reserve_size = (config->reg_bits + config->pad_bits) /
+					   BITS_PER_BYTE;
+			if (quirks->max_write_len > reg_reserve_size)
+				max_write = quirks->max_write_len - reg_reserve_size;
+		}
 
 		if (max_read != bus->max_raw_read ||
 		    max_write != bus->max_raw_write) {

-- 
2.51.0

