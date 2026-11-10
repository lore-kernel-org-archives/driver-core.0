Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794310936;
	b=XbAwAECIDa9NVo/CDRtnG1z2bsS3uGVsxY1FMVFPkjBRA48hkuUBsplrxzfMpeJcxzcY
	 Wabzfr2E0uaywi9osC2rlP2BQYJ011mu4i4w6/JU1SAmgcP1XOM/f6VUmStEjcU04Y7I/
	 bvlUjPTKapLOJzgvbrx5EUJdvy1+YBAnZGcAwjqiSGo4CF6dpHh8YYmBE45mM9SKu6t/0
	 hCmbI8qAmc+nKCC3uURSVh7dyIPxiVAofw5hA1ocxdwC5hTFiXLJSNqdMWIMSWoGx58th
	 zJyJN+NCP42Tk+RmOo8inEDjtrvdPOpE3e3sbRnkAI8YqJIef8qd2uNeRS8C+JEWbUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310936;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=biS2YXkL1LdqGm/e9eSFF9+/NJ1/4ChCJYArfIF9alk=;
	b=H58dAK3TFx4gkpz7wfTsc4XCSzkQw3ACrseUOHnQ5/RIq9vRYTGFWQYUZT02Ycv6suoQ
	 1jGyPchOiCVxcfoH0q2U4STqokDd1MQY8QCqshjgRVcPMh9LGMfQerrA/YkZ5zWSkom/D
	 p1A3h/lQ4wyPH+BUBb+VbKIgklDaGySU3pwJLTV+CVvG7njj/O+yaE92maLvSysJZBIKV
	 o2UTcdiYA6oM9Di8PfIQM72dyYCUmgTk5SbyMk7Z4lTKMn3zO9cDQR6QiD32U9nlw8CT7
	 rE3h3VJAkmXHk+Zu4Pp0QbFFBX2IkH9xdc2MwXuXH8AVQsxZkcCgQeBeCkwCxu0jG+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HgjPPT+z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.67
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B3A606A325
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 11:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B3A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HgjPPT+z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heX+d9YLe87biONtpEIzt4J7bZ+NUtJ52l9CVEpTqwXTpi1GaSBd0igm/YeAkMHK9G/sSx8PsX+z9MdkqCJVhNoBrVPNwgZZK7Cteh119ZZYa9d7EVcwa8q+sOUXIsOPpNzDUYQdV+8b5qS4b7VS3oIkTK7JGeT+7thfiAZxugfSo0NeqqgXtVVAESxGweLqlQzN7fCuRFRnbFV71rFht0vyulXMnkcKeLpJQ2I7Nf5C+U2ARI2Guys3I0qZT+QWO+hJiJTr2XP0jSVVt0W7oR4xruOX/cBwT87Falwxsrd3lhNb+5v0AhJMyR1QbwPVaiuXyaSrR9AMmvmhuoFXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biS2YXkL1LdqGm/e9eSFF9+/NJ1/4ChCJYArfIF9alk=;
 b=sp0zrZR8RGcfUBURxvgHHTedRakFAQz5Aj+L7Fe86zTMfCfczV964vfJA3wSpgDW+g+DlFXC56r5rvU8f7sGML+FU1I6kDtYybT7vkuVEB9YXaFW4+ZgMf484XMXzf3y+EHxg6OIbL2wV6Z/BuFNiK1p+AOqePrLMXY+B6XZKhblcbyhF+nFBp1VBaqcNuBGpe2w/UQwTTkBIlh9v5vwa9WPAKXrh7oGh9TnalOPOPwO9dqgdxcCJKrkmrq4PgNXmc1jxJXpR9Qoz86LcB8E+QxlyxAiy1jFosVlydrYRkek0RH+LcEV+GSVyxE8IMQUksYcAlkBK3OVGDcUs/6hwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biS2YXkL1LdqGm/e9eSFF9+/NJ1/4ChCJYArfIF9alk=;
 b=HgjPPT+zb4C1OTysMXWF+gKgC/82qr3BCp7+E6hkH2h8cEs9EX/XVLNvRmEZUSVMSc8+vEAbqWp+6OeAOJDWJxCO/kVScRbzIJoik1GORcJA1jm5vdBTezbo6Rzu7f4dB51tXHrsWi66tGXPSREOvoj6XokE3nbZnY9ccTB9s/KpCRRxRANN7x4j1RWTCjJNOBHW/MMusvaRbxW7kC9wuHWVuKlMWY15KF+g3pVh21aE//IbDNh4SYtHs87MBj8Lt6Yvn9SY8EuiArj/lW2D4Bi5b4PMFgYEBv9q1u+/1+kRX+1ANJStzWL2L3kUlu7IFEzE+5OyTfxbqyWAdWfE0w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by PA2PR04MB10087.eurprd04.prod.outlook.com (2603:10a6:102:40b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 11:42:12 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 11:42:12 +0000
Date: Tue, 10 Nov 2026 19:47:06 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/9] regmap: clean up and improve __regmap_init()
Message-ID: <avMEOkZDXc+2XbmW@shlinux89>
References: <20261110-regmap-improve-v1-0-3a76b6c10ec6@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-regmap-improve-v1-0-3a76b6c10ec6@nxp.com>
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To DBBPR04MB7883.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|PA2PR04MB10087:EE_
X-MS-Office365-Filtering-Correlation-Id: 087bf3c5-fcb3-48de-6812-08df3f1fa8f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|18002099003|22082099003|11063799006|56012099006|261028144727099003|10067099003|261022105027099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	9d7r21Z2CsrhZ40YHeB9YgJPPq25VNJhvg3+Z6wN9g/uLGJDs06YHhPY2MbKCn1cWgUsJUYil/1z3HC+eDLiEr9QAHv5YFnoeGmKkWxchZPp7hZG4aGoqbFyJH4xp0kNrE9xsTNEQcFaMHYFL8dyEh3l0nb+F9jYRXtmLGAK9JE8FMQ8JrdH+kYWvEWtywzTfpbb7GG2OtUhW164HwJ69HlFG8ZkTNSDZnsYjrulTE7nQnwc5ubqhlROGBPlogQjmLQnNa57s1IKOquw0wkP0Fe3DxlPZ7ioakMJcC4T6qAG6DOEZZKD3mSw9kH76T672AQ6ZlSOR7WahjrFYcIlXFvRm9q+rt/Cyg1oOBLNkwWAJnRZCCkZSJvxiqVyssouG0spUFVCfK+uLuCSBIxbecE1PKX2A+v4Jo2XcKmKA14LpZaJ4ZxCjKHu9nujMQXfPB9d0RnHYpst+Il+oQFLu+KGcRvVmVq7Q60mV0u+VDwMudWu7+XbGCL4WeNOHz7b/wUrN+Bg7z6bA2aVEBLYYUkQlapfVJUSSnXabFlkP9ksRivvZuyfJDov8Sq+ss+srL4PU/qRvEURfRTFrVdEexnWdZlkuUYYbdHlFVc5fDc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(261028144727099003)(10067099003)(261022105027099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2YN+PjscW7YDFAHZw0XWzxDjDL84seUhMej8pPrF2I3WFIzOSAVs7o7eFD/X?=
 =?us-ascii?Q?X0tXJSbw24lxOcZsLXHFT1HDhV8veHNdw/LK/2IgvWH7MqEXSX9KCnH1WQPP?=
 =?us-ascii?Q?lTUMTWMDhRrhnzyJ/GSMCX2M3DQ5//IL22bX3l6qqbK0KndyaGGgkkwlHhSy?=
 =?us-ascii?Q?RSYMoP8reN12hUnFmhzFx3nipiA6qjCp7QYsaXTX8dEf92QcphrYTW0zKaZq?=
 =?us-ascii?Q?XoVuMRrfCxwostllwdrM8soaX0BFpllvbROzldR4SHWnN0KbSGSpDxAvaOY/?=
 =?us-ascii?Q?3Wkxe0GWk3m1mltKpCo90kn0SdjBABMRYiWyS5NPQLU6+Dco0AbgLgZ9rOT1?=
 =?us-ascii?Q?zkvpnkFA9/v5Wem9Z0m6dBlwCieS6Tmgf9MdTLfGuR4WpLxk2rTYIXp9Ml3u?=
 =?us-ascii?Q?AtSj/5FmSTg7GBN+mKmh+XzmineeC1BuF5jonkRN6tB9OB+ZPVu4NW2kopdb?=
 =?us-ascii?Q?Y0Ht+CL0Patdfj4Z17VYpxr+Lz3HUW5CF2FmxHQn06i7GJpUrXZpH5EDL2Yt?=
 =?us-ascii?Q?qG73UvH0ljw9mwrJe1L2dbX+lI29PaiBzvrQkhyhS3gnXuNPGhAO0ku4RHTf?=
 =?us-ascii?Q?3MNwQvvjsobz7Aoo5grXLzl8oQ5F5CCASL1rMVv+dHJ4XIHmcgzqMF6utfwL?=
 =?us-ascii?Q?p/R8AAnwIBv4tiZ9dTppcCWXpruXNEQxympC9jnGy6z9Vlc8J5geXnyedojF?=
 =?us-ascii?Q?Y/z/7JwIs2svYFIfl+U5ZfmXt+oKt1uuQLKwRBGQoMfIRvqWcxGRPxPj89QV?=
 =?us-ascii?Q?yOtpeQowETcJRx8J73+br2ObaNDku/NbWBRoZhnXReFtznxGgAkE4DCRtFRm?=
 =?us-ascii?Q?M921wZlPUCv+zXrVIgCjFz0UAR6lWU9645WuYv2qkiLZ3HFDmCPW5XqzlB4P?=
 =?us-ascii?Q?M7H3SWERVgZTc4+QRJ5w/3aGMMhfMxM633QOMtrX6z+3nTndp0DRWG7SMQyW?=
 =?us-ascii?Q?6p8H57vfYEA9JTWa/RC04xqVHtiUxWeoj9vhP/+gcyDnPiupEn7MvyemqLND?=
 =?us-ascii?Q?7FoAssMMsIfUpgnTX7cANcmsIw8NbE5KB2kqCO/d16irF/LdikIyu0dm23Ct?=
 =?us-ascii?Q?9cRGlZV07k6JTas0ESHg+mJTadyNsXf0Rai86aIDPDtpIPBgN/OBXyiQGfBc?=
 =?us-ascii?Q?Oxr3ErBD6CXj8BPZmPv+Ra2no1YpI7S9UpAFEwAM4ulDfA2C1VVPn/fpohw1?=
 =?us-ascii?Q?2HtjIGvuI/SLwHyfSp72N8tV/5XNMjwQN3kksRL4i30t+CoN95MSelHVhCbu?=
 =?us-ascii?Q?yjcu7dLZOkaQIe7XdnSm+DSgAvAVHFgXlbOnu9LUyheyFD+yw2YpoihII5hK?=
 =?us-ascii?Q?xzjZpNHH9HmprGZKxE6jfDv7NFBX7Phy55l4iNffZktZafmuKFFTemlY+0C6?=
 =?us-ascii?Q?e3EHqFcRPKTBvUAtfs2Z7M0m4+6MVI2qyUzgL0NvSL8p16N7xvJc1225lc/8?=
 =?us-ascii?Q?52JCFN3idyika8bJ0ACpIjjpFSJD/fsLGB1Pt4JemaHFtd/4MzUAPrCjqppB?=
 =?us-ascii?Q?QcMV0fkzYQGH3gsXPZO8GtuEJ5PkjslkzEIQq9dAWJvERz6CwZ9SdcxpCKvb?=
 =?us-ascii?Q?wzLrtCYyd1xWTGf9YpHOeCb1aY+E9ejJVG2Of6ij9KITGtcTRnAhVYJqEmMU?=
 =?us-ascii?Q?D+LfUN/cGmNfri0+CtE2X0QeUiucaCjhMDpAaVzKb8SVST1msJZ3ZcOMz/U8?=
 =?us-ascii?Q?BV4XBTiCx4gyR2TdXg2G/fkHvCgVVUkB9HDHuwpArJ/Z5nYoe9gsaFRnHAj/?=
 =?us-ascii?Q?gRjGZ4JMdDrTnENzUyMExCN3A+LxrH8GA/hu9yITFVV1cC4QW3bn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087bf3c5-fcb3-48de-6812-08df3f1fa8f2
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 11:42:12.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDt1AbTIETGqlhvNKftqC/vOLmQZGtwgsUK4Ih9R30smPXnDj1PbaCu0MBCO5HYR32wEuU60w91zsOxkrArEq3HdWxKPZ2WTxUtD0uVt7NKb6eRZiOSrL34TIAArCL6r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10087

Sashiko reported a few findings:
https://sashiko.dev/#/patchset/20261110-regmap-improve-v1-0-3a76b6c10ec6%40nxp.com

I will address in V2, so please wait V2.

Thanks,
Peng
