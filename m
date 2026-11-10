Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299396;
	b=ZplZssu6FpecZ2CfRQycFkcbzrC8ddJpr+AHaYzL/WEu6vppQs/TTUdmoP1DdYF7DQJj
	 qe7nyfTfL3gAxYcnMc1OitOi96CTZdv4BQ5J12aMhozLPb643JX0Udk/9B6KI5Jl9lkD+
	 3BmaGghrC1oI4fZlAU2q+inTFzZbooi08hHRlH/yimIop5dz6zw4SnnrVTwqUYzF7B0eH
	 ER16aoFa7JXWjDmkLclr098QfVvELcJPBKZCv0+klaMTkXQhLxjFsDx8Z2E8cS4JgbJL1
	 M+e4/cTQudQP2dGLtA0OLc7ROM2nTS0PRIqTZBXp5EvHS5LMfxPj6IDdnOU2yaOQOeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299396;
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
	bh=37GJRbn8y8CrnW+dQWPT5y39btSalZgtEo6tFY+a8BI=;
	b=glhO+4ufBlPfLt8p2bVEDr4CbMANSP+NYNst8oJ/aIyiMelt6/B5lFxC40+x6aievPIk
	 Mi0MH1So4gV80+iJxRzW8icq1uHZ31jDPgEeNPUvWUy4hPjUaL1mp0D8splNNVq5rR28I
	 swhbBLJLbTChuX3/FLbRy7ncqasfxQVFSJpjvGeAMrobPkbgJ5kPwGyh/dhZK9jcCT9G/
	 U4DKPruWed5CqRbPlbE/CejB2f9t4RD07QB6b8B+bA6aulYbEzjtDXbmwTWqloNlmxhSf
	 YngpHtAY6qmh/EYnHPVmjTLSPwWp5ey27n+FqGxY7w3uKYGwX5qdXZv1+y8Z0pKuKSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rwvMy8AF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.19
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988E960A2619
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 08:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 988E960A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rwvMy8AF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/JWqaEfPRopVrYgjBpCYWGfthbLegyItVB7/x/y0xsGmhkgY9oeBtgCxLfZQyXaaW+XnPi22tMua/vY8gp21z2Cg/AoGzWCAz4ylJvy+ZfLc1l9olsIw3zj26VG0L0kAprN7t1PsGeOTBqvT/r76zuhT8Os2pZPukIJazm9C4OEdklcaZpYV4T+4HJ56Ve2MODoXaZg67d4a6Qo+IGVVXDQp4fLELl1xiZJdyuwCy00eQFOsQ5KW13O/I7zcN7SGadWXifBU4b+QvHKK8UbV4dvpGPH7eWUInILthRwxqpST3als6Y0SvsmTAWI19yDhjiWa1J/CGHmTQbEHxwixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37GJRbn8y8CrnW+dQWPT5y39btSalZgtEo6tFY+a8BI=;
 b=B5N0Kdls3sYmQ9bY8tmTFhnVrrfr7J0GsNobYtLxXDQnfNEk/6axUXtio9jMuN8Z06h3zZVfdkbJ2DLFe4SZ0QlZ9xFt429qtHF5FL0nXPS49QPnMioCMKhDyVXc3/LUP5qxFZwlVWSg/rxV6t/Eu/w4gREJuat9yewbOl5kJq6EDD4DR1fSRIunbA9B6/GYCtT7Gz0Mh80epwUhjp694//1WHl5ySYZQHZHPROWJ81GerpGRoMBGq49RHLTkyixE/mrpqmcNwCnivg6utijbcjoI0ReG2BG/EhefXDg6k9GpkpdN+ZfNhLLp7FsJMCmxAJpAcaKmAG9nvMjOR+j8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37GJRbn8y8CrnW+dQWPT5y39btSalZgtEo6tFY+a8BI=;
 b=rwvMy8AFv/wRRBlhWmTCDmBs0vB0qOiyLTot8YhaZLnHF98OxwmCqa8HckufuYDZZQHtXMVFB5ytyCuynDPEmEK+q0QuUJU0ymoOXUR4tv1SPA+H6l4wb72X70Ut0vtdn6O5F9HIs+QrbbRol0XHBH0Ff8cQv5PRK3E/h6cGSyesRxjIhnRuP3oEdMctce47l9i8634xw9CSvVBfdAlMtQqQTPaXsEgpQK6N7CPSb/b1HZjoz5ryy4xiP9eTPljX0lDlm8m1Yac4uPTi23PXqTggEDrRQGDKzn8GpJ9eHeAD4b85l44bbL7PK1556VMlitMKBVtQ9LbqE8ZTF7ezFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by FRZPR04MB12430.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:29:53 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:29:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 10 Nov 2026 16:25:31 +0800
Subject: [PATCH 7/9] regmap: drop regmap_bus::free_on_exit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-regmap-improve-v1-7-3a76b6c10ec6@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To DBBPR04MB7883.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 9e88e8b4-00f8-414e-5d26-08df3f04cb1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|261009223027099003|10067099003|5023799004|11063799006|56012099006|261022075727099003|261021121427099003|261021123027099003|261026121527099003|261102130727099003|261102123227099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gBEbHrXRIezPVbWnrYUSx4GY/DrSLyE11oohRDwCOyBX1qraF98CSDwHy1SAnkdOmSKheWiYuvEmOY2qq7M8GkgEIhNU2Dz1Sb6UXInr8KtwEooSAfZwD8bUBTeBqPreOOKcPd3aqttAPEzNSg0C6jZCP7RIIxYJS5rCdGrOOQllJqEPm2ldWzX8lmtzNo5hS5wcW5BgCeNITmd9sMF7lBA+Fzj7SisU1faIOmRza/ZPemk+G+G+c+zlJRzujAzfVKaQW55trr/af54qdf3uEJcF5bttVLCNFLGOd27AvfHRUZmV2sKzEetkUitejplI/ZDVxs6B2MQXk5LquCIVyxm0tJvfV6QoqLRbJpjR/4RkTuBIvV9ohdZQNiKBEZe1g2OmhSPo0CNIROxehP6CHa24ws+PfD1O2phaLk7NJqK5pWEjoR0uIbO8gC1AKENGAOgb4EI8LHOzAMLjX0yrWZuYDK7wJeLiCwlGKgY06UtTu6zmawb54CUX1tV0Ube8QLG4VVemQaa9WqXUhJC1ChkplqPZowqfLHecpsVklw82AteBBUBXj8jj5r5+693uGomF3UrME+e4a7adr/hzgpBVgK3h8W6h7bjdtMvjS3J1ddzttrUNH9DKhWAlYusmhPfkq2uO+4WBBEvHwopaM9jO4BhrprZch7bTrfV0LTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(261009223027099003)(10067099003)(5023799004)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261102130727099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHBQenpxTHhaSUtnY292aTN5TW5NSDlkUUJqNisrQTFCQTgyaWpqN3pvcVVC?=
 =?utf-8?B?cHZvL2tFUVRKYU4raEpMdlZSU2w1Y3NKTlVqUHpaVFBtam9mV2QycWNEMVp4?=
 =?utf-8?B?dnN2ci9RYkVmMGREaVRmU25GcW8vUE9Wc2RxWWlDN0JmQ2FmaVpwdFprZzYy?=
 =?utf-8?B?M1RYb2dsQ0NnVExOa1VLUmdSVWkyS1JXUFp5bGYzM0plbm1Vc2M0dk8wcnha?=
 =?utf-8?B?R2ZtRlo5VUxMKzB3LytzWEI4MDduZG54dVVLMFZ0NWNpam9tTjk3WHpUeWxr?=
 =?utf-8?B?SG13R0dxZmMxcUlHRXlDSS93bVgxd3pHOENIZkZGNmtSUlhyWFA3Ym1lMTB5?=
 =?utf-8?B?M0tiRy8wVXNzNE5nTEZ3Y1d6R1Y0bHBWa2VPWE5wN0tPdzNob1RPZDA2ZUE3?=
 =?utf-8?B?WHUxbko3MW1nTmRWZzBLUWsxemlHem51MllQbDdXVmtEbjVmQmZFeVFiOG8r?=
 =?utf-8?B?ZjRyd2VRWkRaRElBdi8vcUNydjlNVlhBdnpmY2N4QmFxR29zT2FCVkpLenZC?=
 =?utf-8?B?ZGwyMWk2QVU2OXlaRWttamE1OTdVcXJLb0JyTU80TVdyYnE2VTR2Nzg3MDhO?=
 =?utf-8?B?QlNMWWRBV01HYXRYNkNVcTdCakNuQ2F5ejVyWUMrdTVGbFNLdlNGMkxXUTZo?=
 =?utf-8?B?MmZWY2YwTzBpUnppdCtINjJuMGFEOStyVi9sRUtnL1RLNkl4MUVrTURreThp?=
 =?utf-8?B?dzVoYkwxYjBnaDlaK1hDZmM3cTlQL3lyWjJLbGUzZHlsd1lqQzRnNU14czZv?=
 =?utf-8?B?eUt1NkhSMG1Ma3BRV3JLR0xPNm0wZnpNZ0wyTjYvaTBNZG9BOWt0dkUvb3VG?=
 =?utf-8?B?SUNJdnRWWXRRQVM5eVl3bDdYUmxHTnUyZlE1aWlpWFh5RGs5R1JBb25lZVhY?=
 =?utf-8?B?VUVuSS9BZGtYNFdEZ2tkbnhkRTZBcStlaFVPb0pCUElhTDVNdnMwQTQyL2VM?=
 =?utf-8?B?NXBVRUJJZHBwYU9ZZVYyQ3VNVDJTY2RxOXFESy9LSnZyT1pJRUZSVUFGU3p6?=
 =?utf-8?B?OUJISDFMYmdBRDBSUTVZSTlXUC9iWnJYNDhRUUZyOEh1NzVyMnZoaG85MHBu?=
 =?utf-8?B?QzI1Um10SzMwRlhQc0lLWFAxeDBKUWRDK09BTFAwSVFBR0RvM21xWTdmL1BL?=
 =?utf-8?B?c0lKclltYXBJSmNyaldhRlJOTWllbGVMWCtTa1A3dlh2MEk5YlZDYXdyNkU3?=
 =?utf-8?B?cytDMExCc1o4dnVWQ24wSHA1MVFpc3JsUkVwcjlxajk1STFrQjdLUW9vUHVM?=
 =?utf-8?B?aEZIcG1nMVQ4NEhyTW1oR3M4RHNFVFlxQW10cEdnOUNVMUwrRzlQVVJTenY2?=
 =?utf-8?B?NHpTWDNwdUl4cWNXUnNCMHRuZzVUTFp2Z3lSbk5HcmFuV0RtWWZFK2l3NzUz?=
 =?utf-8?B?clRrNS9ibEFvcEFUcmtJRm4rTGYrOTJvc3ZMQm9OSWRWYVVDVllCN2VGN0lG?=
 =?utf-8?B?MEJmNllNc0tnM0Y0T1RvTGtMVkNrSHNpUmo3aGJjZWs5R1F3RkROMjBiSk9v?=
 =?utf-8?B?TDVuSDZxaHlCUVhYV3I3dWFRQnRaRG5Ob3E4Tlh3ZG1oRE5oYndNcGtIVmhP?=
 =?utf-8?B?SUZIQWNoQ05oM1luMzQ4Qk5kVW5tbi9pYjBFZWN0UU1GOHA4LzI4dzF4aUtX?=
 =?utf-8?B?Z0pnQWlkRUZDTzJiV3ltSnZXYmg1VU5VUjJXQ1JaSWxIZUh6V1hGUUNQSXF1?=
 =?utf-8?B?ajZSUmV0cHl4MjY5V280OXJ3SW9NOFZHOUxXUE9JT013TjlIdm5YdjFsa1Uv?=
 =?utf-8?B?Z0o0YjdlNHN0OTNLRlRSUnZMWW4xdnNSR09yMkR3cmJUaHErNGsxcGNKTVpj?=
 =?utf-8?B?SUt6YzNHNmkxeUI2bWhGQ0VCeVNmMU5ZNytHWHBHVnRmdGRhK2NuNElmU3Q1?=
 =?utf-8?B?QzJWVEU0WG05a1B4ZmkvSXBvd2Jua3dJRGNLMENmUGFqclpCcWpHRm9xMmt6?=
 =?utf-8?B?MWlzWHpFK0VZcXNwN3EvRmJsbmU5NnRLeWx4K2s2YitVdnNpYWFjSGl2Wmhp?=
 =?utf-8?B?MWtmL3B0WllSVDZzVTBvM1p3NnFUTzNieWZuVVVxUW1BbVZaeFBSRHphUGx3?=
 =?utf-8?B?aEkzWmVXOHZJTWcwZnVuenBWNE91dnpHczh3UWlra29KWjgrVnB6K0JGK0No?=
 =?utf-8?B?bEFHSFdTcHo4QlpMcTRxUEpVRDlXR3Y0R1dxdllXSjBYUCtobXU5c3ZPK0Rs?=
 =?utf-8?B?MFNOL25nNkp1UWlWRWJiRnpOUUg2czRNMzFLai92NTd3UExtNGh5bi9pUmZW?=
 =?utf-8?B?azRQRTJyaHdiblU3Z0EzeW50dEQxRWZFbFM2TzZTc1lPNmUvQ3hYT0tQZGpU?=
 =?utf-8?B?enZFR1VBRGQrUVpwZG1CVUNSdUw1YUdDd2JEMVl2bHIwL0xvL1ZNME5Oakwv?=
 =?utf-8?Q?G3Z79mQErm77VLYm/siqh13/Pz5NwouapvgUj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e88e8b4-00f8-414e-5d26-08df3f04cb1f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:29:53.2322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2BBt6R81S4u0xEt6HHMk1NcjkA7eBvAR1rCTh6F6cMhDiwzBGLYCDdkFs7pHmfRvF3cTfqBrV/u/FbKvxgA84kjAR2AZtmviLLmL7uHoWREX5kUGa+oRhROj/oYfSdz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12430

From: Peng Fan <peng.fan@nxp.com>

The SPI and I2C bus helpers kmemdup the static regmap_bus to override
max_raw_read and max_raw_write per device and mark the copy with
free_on_exit so that the regmap core frees it. This is the only user of
free_on_exit, and the per-device limits can instead be applied to the
map while it is being initialized.

Add an optional regmap_bus::init_limits() callback which is invoked by
__regmap_init() after the bus raw I/O limits have been copied and before
the cache is initialized. The latter matters for maps with raw register
defaults: regcache_hw_init() reads them from the device while the map is
still being initialized and uses max_raw_read to chunk the transfer.

Use the callback for the I2C and SPI buses, which allows using the static
bus structures directly. This removes the per-device bus allocations and
lets us drop free_on_exit along with the associated error and exit paths
in the regmap core.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-i2c.c | 71 +++++++++++++++++++++-------------------
 drivers/base/regmap/regmap-spi.c | 64 ++++++++++++++----------------------
 drivers/base/regmap/regmap.c     |  7 ++--
 include/linux/regmap.h           |  7 ++--
 4 files changed, 70 insertions(+), 79 deletions(-)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index eb3db02ad8fb..247dd20eb02a 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -12,6 +12,36 @@
 
 #include "internal.h"
 
+static void regmap_i2c_init_limits(struct regmap *map,
+				   const struct regmap_config *config)
+{
+	struct device *dev = map->bus_context;
+	struct i2c_client *i2c = to_i2c_client(dev);
+	const struct i2c_adapter_quirks *quirks = i2c->adapter->quirks;
+	size_t max_read = map->max_raw_read;
+	size_t max_write = map->max_raw_write;
+
+	if (!quirks)
+		return;
+
+	if (quirks->max_read_len &&
+	    (max_read == 0 || max_read > quirks->max_read_len))
+		max_read = quirks->max_read_len;
+
+	if (quirks->max_write_len &&
+	    (max_write == 0 || max_write > quirks->max_write_len)) {
+		size_t reg_reserve_size;
+
+		reg_reserve_size = (config->reg_bits + config->pad_bits) /
+				   BITS_PER_BYTE;
+		if (quirks->max_write_len > reg_reserve_size)
+			max_write = quirks->max_write_len - reg_reserve_size;
+	}
+
+	map->max_raw_read = max_read;
+	map->max_raw_write = max_write;
+}
+
 static int regmap_smbus_byte_reg_read(void *context, unsigned int reg,
 				      unsigned int *val)
 {
@@ -46,6 +76,7 @@ static int regmap_smbus_byte_reg_write(void *context, unsigned int reg,
 static const struct regmap_bus regmap_smbus_byte = {
 	.reg_write = regmap_smbus_byte_reg_write,
 	.reg_read = regmap_smbus_byte_reg_read,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static int regmap_smbus_word_reg_read(void *context, unsigned int reg,
@@ -82,6 +113,7 @@ static int regmap_smbus_word_reg_write(void *context, unsigned int reg,
 static const struct regmap_bus regmap_smbus_word = {
 	.reg_write = regmap_smbus_word_reg_write,
 	.reg_read = regmap_smbus_word_reg_read,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static int regmap_smbus_word_read_swapped(void *context, unsigned int reg,
@@ -118,6 +150,7 @@ static int regmap_smbus_word_write_swapped(void *context, unsigned int reg,
 static const struct regmap_bus regmap_smbus_word_swapped = {
 	.reg_write = regmap_smbus_word_write_swapped,
 	.reg_read = regmap_smbus_word_read_swapped,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static int regmap_i2c_write(void *context, const void *data, size_t count)
@@ -203,6 +236,7 @@ static const struct regmap_bus regmap_i2c = {
 	.read = regmap_i2c_read,
 	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
 	.val_format_endian_default = REGMAP_ENDIAN_BIG,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static int regmap_i2c_smbus_i2c_write(void *context, const void *data,
@@ -244,6 +278,7 @@ static const struct regmap_bus regmap_i2c_smbus_i2c_block = {
 	.read = regmap_i2c_smbus_i2c_read,
 	.max_raw_read = I2C_SMBUS_BLOCK_MAX - 1,
 	.max_raw_write = I2C_SMBUS_BLOCK_MAX - 1,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static int regmap_i2c_smbus_i2c_write_reg16(void *context, const void *data,
@@ -301,6 +336,7 @@ static const struct regmap_bus regmap_i2c_smbus_i2c_block_reg16 = {
 	.read = regmap_i2c_smbus_i2c_read_reg16,
 	.max_raw_read = I2C_SMBUS_BLOCK_MAX - 2,
 	.max_raw_write = I2C_SMBUS_BLOCK_MAX - 2,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 /*
@@ -345,15 +381,13 @@ static const struct regmap_bus regmap_smbus_byte_word_reg16 = {
 	.read = regmap_i2c_smbus_i2c_read_reg16,
 	.max_raw_read = I2C_SMBUS_BLOCK_MAX - 2,
 	.max_raw_write = 1,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 					const struct regmap_config *config)
 {
-	const struct i2c_adapter_quirks *quirks;
 	const struct regmap_bus *bus = NULL;
-	struct regmap_bus *ret_bus;
-	u16 max_read, max_write;
 
 	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
 		bus = &regmap_i2c;
@@ -391,37 +425,6 @@ static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 	if (!bus)
 		return ERR_PTR(-ENOTSUPP);
 
-	max_read = bus->max_raw_read;
-	max_write = bus->max_raw_write;
-
-	quirks = i2c->adapter->quirks;
-	if (quirks) {
-		if (quirks->max_read_len &&
-		    (max_read == 0 || max_read > quirks->max_read_len))
-			max_read = quirks->max_read_len;
-
-		if (quirks->max_write_len &&
-		    (max_write == 0 || max_write > quirks->max_write_len)) {
-			size_t reg_reserve_size;
-
-			reg_reserve_size = (config->reg_bits + config->pad_bits) /
-					   BITS_PER_BYTE;
-			if (quirks->max_write_len > reg_reserve_size)
-				max_write = quirks->max_write_len - reg_reserve_size;
-		}
-
-		if (max_read != bus->max_raw_read ||
-		    max_write != bus->max_raw_write) {
-			ret_bus = kmemdup(bus, sizeof(*bus), GFP_KERNEL);
-			if (!ret_bus)
-				return ERR_PTR(-ENOMEM);
-			ret_bus->free_on_exit = true;
-			ret_bus->max_raw_read = max_read;
-			ret_bus->max_raw_write = max_write;
-			bus = ret_bus;
-		}
-	}
-
 	return bus;
 }
 
diff --git a/drivers/base/regmap/regmap-spi.c b/drivers/base/regmap/regmap-spi.c
index b9fec387997e..8eaebef07833 100644
--- a/drivers/base/regmap/regmap-spi.c
+++ b/drivers/base/regmap/regmap-spi.c
@@ -98,6 +98,26 @@ static int regmap_spi_read(void *context,
 	return spi_write_then_read(spi, reg, reg_size, val, val_size);
 }
 
+static void regmap_spi_init_limits(struct regmap *map,
+				   const struct regmap_config *config)
+{
+	struct device *dev = map->bus_context;
+	struct spi_device *spi = to_spi_device(dev);
+	size_t max_size = spi_max_transfer_size(spi);
+	size_t max_msg_size, reg_reserve_size;
+
+	if (max_size == SIZE_MAX)
+		return;
+
+	max_msg_size = spi_max_message_size(spi);
+	reg_reserve_size = (config->reg_bits + config->pad_bits) / BITS_PER_BYTE;
+	if (max_size + reg_reserve_size > max_msg_size)
+		max_size -= reg_reserve_size;
+
+	map->max_raw_read = max_size;
+	map->max_raw_write = max_size;
+}
+
 static const struct regmap_bus regmap_spi = {
 	.write = regmap_spi_write,
 	.gather_write = regmap_spi_gather_write,
@@ -107,46 +127,16 @@ static const struct regmap_bus regmap_spi = {
 	.read_flag_mask = 0x80,
 	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
 	.val_format_endian_default = REGMAP_ENDIAN_BIG,
+	.init_limits = regmap_spi_init_limits,
 };
 
-static const struct regmap_bus *regmap_get_spi_bus(struct spi_device *spi,
-						   const struct regmap_config *config)
-{
-	size_t max_size = spi_max_transfer_size(spi);
-	size_t max_msg_size, reg_reserve_size;
-	struct regmap_bus *bus;
-
-	if (max_size != SIZE_MAX) {
-		bus = kmemdup(&regmap_spi, sizeof(*bus), GFP_KERNEL);
-		if (!bus)
-			return ERR_PTR(-ENOMEM);
-
-		max_msg_size = spi_max_message_size(spi);
-		reg_reserve_size = (config->reg_bits + config->pad_bits) / BITS_PER_BYTE;
-		if (max_size + reg_reserve_size > max_msg_size)
-			max_size -= reg_reserve_size;
-
-		bus->free_on_exit = true;
-		bus->max_raw_read = max_size;
-		bus->max_raw_write = max_size;
-
-		return bus;
-	}
-
-	return &regmap_spi;
-}
-
 struct regmap *__regmap_init_spi(struct spi_device *spi,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name)
 {
-	const struct regmap_bus *bus = regmap_get_spi_bus(spi, config);
-
-	if (IS_ERR(bus))
-		return ERR_CAST(bus);
-
-	return __regmap_init(&spi->dev, bus, &spi->dev, config, lock_key, lock_name);
+	return __regmap_init(&spi->dev, &regmap_spi, &spi->dev, config,
+			     lock_key, lock_name);
 }
 EXPORT_SYMBOL_GPL(__regmap_init_spi);
 
@@ -155,12 +145,8 @@ struct regmap *__devm_regmap_init_spi(struct spi_device *spi,
 				      struct lock_class_key *lock_key,
 				      const char *lock_name)
 {
-	const struct regmap_bus *bus = regmap_get_spi_bus(spi, config);
-
-	if (IS_ERR(bus))
-		return ERR_CAST(bus);
-
-	return __devm_regmap_init(&spi->dev, bus, &spi->dev, config, lock_key, lock_name);
+	return __devm_regmap_init(&spi->dev, &regmap_spi, &spi->dev, config,
+				  lock_key, lock_name);
 }
 EXPORT_SYMBOL_GPL(__devm_regmap_init_spi);
 
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 0a7f73fc1101..c5acfe687d9c 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1179,6 +1179,9 @@ struct regmap *__regmap_init(struct device *dev,
 	if (ret)
 		goto err_range;
 
+	if (bus && bus->init_limits)
+		bus->init_limits(map, config);
+
 	ret = regcache_init(map, config);
 	if (ret != 0)
 		goto err_range;
@@ -1206,8 +1209,6 @@ struct regmap *__regmap_init(struct device *dev,
 err_map:
 	kfree(map);
 err:
-	if (bus && bus->free_on_exit)
-		kfree(bus);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(__regmap_init);
@@ -1513,8 +1514,6 @@ void regmap_exit(struct regmap *map)
 		mutex_destroy(&map->mutex);
 	kfree_const(map->name);
 	kfree(map->patch);
-	if (map->bus && map->bus->free_on_exit)
-		kfree(map->bus);
 	kfree(map);
 }
 EXPORT_SYMBOL_GPL(regmap_exit);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index a72f17ab6264..161457726163 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -579,7 +579,6 @@ typedef void (*regmap_hw_free_context)(void *context);
  *	     to perform locking. This field is ignored if custom lock/unlock
  *	     functions are used (see fields lock/unlock of
  *	     struct regmap_config).
- * @free_on_exit: kfree this on exit of regmap
  * @write: Write operation.
  * @gather_write: Write operation with split register/value, return -ENOTSUPP
  *                if not implemented  on a given device.
@@ -610,10 +609,12 @@ typedef void (*regmap_hw_free_context)(void *context);
  *     DEFAULT, BIG is assumed.
  * @max_raw_read: Max raw read size that can be used on the bus.
  * @max_raw_write: Max raw write size that can be used on the bus.
+ * @init_limits: Optional callback to adjust the maximum raw read and write
+ *     sizes for a device. Called during regmap initialization before the
+ *     cache is initialized.
  */
 struct regmap_bus {
 	bool fast_io;
-	bool free_on_exit;
 	regmap_hw_write write;
 	regmap_hw_gather_write gather_write;
 	regmap_hw_async_write async_write;
@@ -630,6 +631,8 @@ struct regmap_bus {
 	enum regmap_endian val_format_endian_default;
 	size_t max_raw_read;
 	size_t max_raw_write;
+	void (*init_limits)(struct regmap *map,
+			    const struct regmap_config *config);
 };
 
 /*

-- 
2.51.0

