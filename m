Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299409;
	b=rZGnVTCazcXl6LcSlxTyokgdCm/A5i2Pf+akSgYpeMpA19AseCrfMOMXmlLGG1q6eWGm
	 RJeAFynhAlo93hy2aPX7MJ0D2WpXa5MCfapd3uvzmhBWBk2jllg7BZNLgp14UFt9LzSdK
	 KSd+SleEUS3lnjm6YJcCOArQcaza+98jOOdYk/uRGzwghKBeFHmq22O5Kkpr2Mh/QH/8U
	 g0R69fT1P9PtW9GRO0iSVrP0C1dIVpILe5Ft7WBEv28yHZWdSmZa+ZLw2VQpJWdcD+s6D
	 +g3cduVbwdV3sutF96Z+Yiy7+Nw3JxQffCMMiy5HBrZnMdFceUnvTheUDj4nhFx7Dag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299409;
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
	bh=cd9SCufOyYPNiGFhhfTt4wjS2hjfwuGSKcOdakx6ziw=;
	b=DTKO3bWoIQA1u0KIqebOzR1CykzsqE9oDCo5rK+cvYFvbyep2CiTFGbOMFq02ddVjuPP
	 EWN8I0miZSZdOL7ZoDrXdrEQcnN7Nn5NoP+hFl2iy2Ma3UmD5AphB7EOqNbbD+lCvGWKc
	 del7KFO+stH0vL4B+Cq0xudOfk+mpXuqJaUIsKiD/bsOdDT5svUZYu50ds8mMDlMXb+MS
	 XBYvXtFWZKNB9gjY2nqaFam6Zfo1lAP+9t9nwxsOpWHSDDiIQhoA4iWV8mZL5GVGpKQ7r
	 XcYpmiO7uNcItFR+d4nVT94t+v0Lc0jvvQsZ7S5jkwIW4UHExgjRMTVqxwn8Kkq1MyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BHVLTXrI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.44
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0930606A99F
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 08:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0930606A99F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BHVLTXrI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0/syuaaengMN0oVeguHCJHURhQSDCLbxvVTaFwcB70PLoccBw0Y+3o4XmPjhTM9IgMaBXdauAa976HJn6aVPCKL0NIRTn3+LQw38inaEzCd8PmhenjfpEzK7jhWhngY6/yqxLSTabhiTExomYy9f570qE/FX0zvqA/2c2qFDXgkpM/h6Dcbo2QMIkUrxA5+ib6104dv/SWb9becPi6eNrmSa/wguDwmdV2Jr4Tq4XFs/jaHNoIcEK7oe/a0smeTH6p64Q1qOLB2eU2ebSMmnH9a8hC6Ivh3O93ToIYD1BejYM+J8jHxnkxCoN37tF84TCMBFaVzaAvMwLr+xFIh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd9SCufOyYPNiGFhhfTt4wjS2hjfwuGSKcOdakx6ziw=;
 b=jrRDlvSvQg+gmDhkBpTVDRl3A+m/egiVxx+QoirWaxjXMih33TgrZQvqGg1T47t3W+U6sTw3oDFaTR1FfpXbxTMDqYOdXV9l5F/DCOeD/dnmJHMVSEjwOqp27VoCAfhkNklTgp2ti9VWPPQAJeEyR8Z2jZeEHr3RMN/yj6tidI85J8zsJ83/YzNdCxzXtMo9e2wLTE4XwVnFSAyYade33RpxUODNeOmAEihKcWscaN9H1FGg/zPQRkX+CptuRFbkARLj+OLBhEg23JVVIqKNlMGgDIRzA4Zsxy6IoVkbRqSiQIg6uhLKV3U3RI1ZcTCh5Q6lunpxz6RhflpBbBvjFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cd9SCufOyYPNiGFhhfTt4wjS2hjfwuGSKcOdakx6ziw=;
 b=BHVLTXrIeMmi4WOpECfijf6xQcqIFNzyFDR53lQuBHgfkAt6jBojPXNA5tNyz6Gs6l8iK6B2e6hkptSSLl0ksNOQtWSFWUB7OhGs0R9VkpWQ5CngesY2MnfuqPKbhdhYhR/prn+Yi1XlTsyB9I9zRyHqK8BMeU2eHEsiIyHm38jqJAgIy9GEKoF8jLKmTqBctq+gM3Et5xY4VvXcq4mGdI+fGZhI2M7Y37FoRKZEXCjWgK7y6ROx0GLso7MDBRbiecQyh50n17Ly+kbdtX+yJE6oeN1GdOtb0hMiUouMlAOk+6Y+ZgFf7w8MXr2p973w2AOCn0m/+qbX8g/85NKtQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by AMDPR04MB200793.eurprd04.prod.outlook.com (2603:10a6:20b:749::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 08:30:06 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:30:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 10 Nov 2026 16:25:33 +0800
Subject: [PATCH 9/9] regmap: kunit: add test for regmap_bus::init_limits
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-regmap-improve-v1-9-3a76b6c10ec6@nxp.com>
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
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To DBBPR04MB7883.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|AMDPR04MB200793:EE_
X-MS-Office365-Filtering-Correlation-Id: 83695f51-b418-450c-d00b-08df3f04d2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|5023799004|11063799006|56012099006|261022075727099003|261021121427099003|261102123227099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	vX8gAFiio6pAYmaBbCT+7Bxn7Q/btMzgWib4ShND1tGrfueV54XygNWt51lp0pduPdu9+j/tW0QnpWm1XGfjA37BlYTmDmn+G+s2m3sfPUUfu8Dq5+Oxq01dZdnecTnxI6YSO+P/ZK/i7p8ai5E50l5+6VS/HykEfPbd501AUa6Be+yh9jxhd9+PKm2qNLdw5SwAfoVK3M5wsZo85B/tI9jIwqLzMxaeSlNOls5ebpV5UStGrE/07szr0+C/AT2Jgcqi2jsxCwDxugpgr2Xyul0jHpv4zxOVo59nbG4/rE6xTbVpBwRKt3CULj2ALThVCfiWu1YLkAnoGOPZqBZvQ8tTvVmrkkzZXmIzAhBNDfkssXSw/VFCKFG/l66JbFbbSreNGirv1fOHyddL4yFinyT1ccxaCsBmGfZ/+vH1TeQEnjAK8n2V/UNfZwx/ficcEC0zVd9g2Djil315Pj4UnfBjoEvKmfQhPUVfqphLc76FyWbwKtjpIYkHF3OacFvrPpTgSHwjpZWpnDUAfQoeIRYY07JYpYGEe7zW0Pp+nyftbtvU7uSU0Mv8UJnE1Mx2a13Z+eR51rThOg1Am7Bao70Slt/nApBt+BL2q4BVsTg9muwiHBsNUi0XnDDJQvZmF+keQZJCAmRzXdIk3ojhcO4VwJqBhZfQMTQP8rRdQA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(5023799004)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWgzQmpFMEgxNDdBSXZDaS9EOE5SaERobFRhTVFIbDJCUUl3VHhGTDlib2tL?=
 =?utf-8?B?a3c2U0FLQWZCRFJ0Z1NqdlgwWDl6dkxrOGVEVjZXeVNqMk8xekptMk1UYVg0?=
 =?utf-8?B?ZFlqZW53ZGtmMCt0Zmt6UDd4bk5ibFRnbXo3bzUrQVFYYmh4SHJFSEJZOW9o?=
 =?utf-8?B?c1BZRERwZUJLWDJvTWc1UlRySHRDajEvZUlNcS9tTmRhaG8xbCtzOTZYck1v?=
 =?utf-8?B?dlNPYUhYOTZVTTQ1RTAyWGw4UUlpSm8yR3JrQy8xTmZEUzBLMkZvc0p0bWxq?=
 =?utf-8?B?OFNiTkdHSVdKRXFhOUxzTkZFa0d4QUtKalo3eWh2eGw4TkwyWUlXL1RETUx1?=
 =?utf-8?B?KzRMclowa2RYWWFnUTJKU2swMzY1Y3hWY0JLcG53d2JyVGwxQytyVGlaVzVj?=
 =?utf-8?B?L3ZQNStpSjFuc1gyWUJvNnduLzVRQWZnY2w1ZXcxMjByallITnBPcGo4QjBS?=
 =?utf-8?B?NkZoYk5PbGlzR0RUQUdheEFFM3JJTENXNXBCanBiSUhWZGxPSWtIeGZIZ09t?=
 =?utf-8?B?UEo4R1JuNUVMTFFaYWpEMlNMWWEzRmYvbEcvOHNtRm5tNUtDcjh4ejBkaE91?=
 =?utf-8?B?YTgyRy80WmVacGVLTkt5Njl6WFNnTUtxWGNoQ1l1L0ZjOFpmLzRiUlF3NGVh?=
 =?utf-8?B?enBJY0puTkx0eG5iaEJ0UXFWS0g0dzR4ckFNSW9lNWFpdy91UE12cGpEODN2?=
 =?utf-8?B?Q2wxQ1JXd1pweXlmenVKNmxWcnQ5ZUdET2ZTOTBIa1lpaGYvVHIwWkl1N2dM?=
 =?utf-8?B?ejRIeEFtUzZpd0hhelE5SEwvWmlUMGR4dEJjVThLVnhhWFNkdkwrKzVESldo?=
 =?utf-8?B?NTd6YmVXa2ZOMWRUWW90NEJyVkw4cGNXRjVMSldPSzdiSHZjVUloeE1aQVF5?=
 =?utf-8?B?aWR3TmdiZTVLWVduRXczMHJXMEtrY1FoZDBmaElMa3Y0c3c5WkxIcElIZjhV?=
 =?utf-8?B?bEl4b0UzOTAvZ3ZxTFE2aDdiVkZNTUd2TnhNSGxVVlcvdmxxZ0ViQ1FpdzFi?=
 =?utf-8?B?WGQvQStaRFgrNEhZNjA2cHNZSzZRYmxuSkNvQ09pVUI5ZUw5REJqRDQvbjBl?=
 =?utf-8?B?NW1GcDFWSzRocHp2bFJJV3dEWCtMZTRwVitybWdkN2ZZYVU4c1dhbElTcFZt?=
 =?utf-8?B?eDdwK2VnZStabG51S1RvWkZvSnQ3SHdZZENiOFl6blBFUTg2OXVhblkxSEtB?=
 =?utf-8?B?TStoY0txNnB3OU9Eclp3RHFxY2V5OUIveWFVelNqVmg5cVdJSjVKWUVPQmE0?=
 =?utf-8?B?U0k5OUZMbUg1VmQxeGxOYUJMbWtrdlJUd0EycWt0clVlY3RDSUFrQnhhVGZH?=
 =?utf-8?B?elluZDNLZUI4ekNQdlVJRDdqUWExY2YzVkxDQnBvMXUwY2lvZUNYRklLbTJN?=
 =?utf-8?B?UUE5WDczUXVtVDFKT2RhazdxQ1NXQVBRMFN0VG9uN2FScktucjZzZHlhWGJF?=
 =?utf-8?B?WkkzUHkxWnJmQnN2UkoyY01nQkkxb1JLV1pkUVFpcm9xbldhV3NNRlRXYzBO?=
 =?utf-8?B?N1k0RHRLd0VNSlFocDNNMFFTbDVsZG4wQ0MyWWdHbGRtSnhEaGZ5NDhUaGtL?=
 =?utf-8?B?cTlTbnR2TFRUV01jMWFSeEF2WTR1aWZjbWp6TllQSVYyM1dXb1RTRmRFbGth?=
 =?utf-8?B?Wk92aGNpTEdPSzJhSkNzSzlXYmgwNHNIbXlmNitRcHd3d0IzQURpd055UzAy?=
 =?utf-8?B?cmJLZm03REVoTlVSeWVTVVQ0dmhaaWZGdU5abDVTUERlM2pEcjZhUXFjTkJx?=
 =?utf-8?B?WXRiRktmNnY1dzZqVkIrb1d2WXNpODhyZUVpa2hTdGorbWFURkU4K211OFF3?=
 =?utf-8?B?ZzJpYThRRmxQeTRiajdTc1BFZDZZZHVpNlhrU0ltU1ZaTnlHb3A4Q3NrMzhK?=
 =?utf-8?B?YnFVVkQ5NmJvcmtHVzRNZGxBNGUxOEs4U280VURyUDI3dUdCRXdIbEVyUlkw?=
 =?utf-8?B?Z25tcTRGSSt2MFVaNnRBcHkzZ2J3YXBEZjk3ZURxMjRvRTB2NEFlaE5NM3cx?=
 =?utf-8?B?RXVpRy9ydHE0RHl4NjM5RWUwSmpES0lnelJIb1R0UUxsQjNpSmZneTVyQ0o0?=
 =?utf-8?B?TitQV2w1ZFdUREQ3dk0xMXhreHlPUkw5ZmlNNndWNWNwV0FCOGRxNHlJQVdq?=
 =?utf-8?B?NW5DK0lsRXZWZ1B6QVdNaElIbWFZMXpSS3RxdkcwaWdzTXVPUlBKVUU0Yytn?=
 =?utf-8?B?dDEvNUJUMWhoRmZ4eHF4U0NFRmJVdmpMNm9ZSGltQWZ1MlFTZVkzUGZRWWww?=
 =?utf-8?B?TnExNHZRSVFpMFZtR0tIaGo2T1Mrd2NHNmpxQUlpWlcwSWdHTDltZU1zdllj?=
 =?utf-8?B?cHJEak9aTGRmSXhxVWJZVWJQcTJMUUV1akhNOFZXeUNlUURIbzhFNTJMT1Ns?=
 =?utf-8?Q?7QIVdDTVRnX/qCAMnoeE2aGecLTnl9v00rNR8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83695f51-b418-450c-d00b-08df3f04d2f2
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:30:06.4248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FAXNdshcg47XvsiXMeo89zc366RYtfQGmar2Z2NmZLo0YClw9RYDuWOJ/+I88ikTptUx3IfxOIHADPIYTy6O6KcLmNEAolvRIqdVsW/6vYZFuTVf6lq3UgMH1YfxDqM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB200793

From: Peng Fan <peng.fan@nxp.com>

Add coverage for the optional regmap_bus::init_limits() callback. The
test bus lowers the raw I/O limits and relies on raw register defaults so
that regcache_hw_init() reads from the device during map initialization.
The readback must be split according to the limits set by the callback,
which also verifies that __regmap_init() invokes the callback before
regcache_init().

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-kunit.c | 89 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/base/regmap/regmap-kunit.c b/drivers/base/regmap/regmap-kunit.c
index c948219f46a3..f2fe2eef3403 100644
--- a/drivers/base/regmap/regmap-kunit.c
+++ b/drivers/base/regmap/regmap-kunit.c
@@ -2247,6 +2247,94 @@ static void raw_ranges(struct kunit *test)
 	}
 }
 
+#define TEST_INIT_LIMITS_REGS 16
+#define TEST_INIT_LIMITS_MAX_RAW 4
+
+struct test_init_limits_data {
+	int num_reads;
+	size_t read_sizes[TEST_INIT_LIMITS_REGS];
+};
+
+static void test_init_limits_bus_init_limits(struct regmap *map,
+					     const struct regmap_config *config)
+{
+	map->max_raw_read = TEST_INIT_LIMITS_MAX_RAW;
+	map->max_raw_write = TEST_INIT_LIMITS_MAX_RAW;
+}
+
+static int test_init_limits_bus_read(void *context, const void *reg_buf,
+				     size_t reg_size, void *val_buf,
+				     size_t val_size)
+{
+	struct test_init_limits_data *data = context;
+
+	if (data->num_reads < ARRAY_SIZE(data->read_sizes))
+		data->read_sizes[data->num_reads] = val_size;
+	data->num_reads++;
+
+	memset(val_buf, 0, val_size);
+
+	return 0;
+}
+
+static int test_init_limits_bus_write(void *context, const void *data,
+				      size_t count)
+{
+	return 0;
+}
+
+static const struct regmap_bus test_init_limits_bus = {
+	.read = test_init_limits_bus_read,
+	.write = test_init_limits_bus_write,
+	.init_limits = test_init_limits_bus_init_limits,
+};
+
+static const struct regmap_config test_init_limits_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = TEST_INIT_LIMITS_REGS - 1,
+	.cache_type = REGCACHE_FLAT,
+	.num_reg_defaults_raw = TEST_INIT_LIMITS_REGS,
+};
+
+static void test_init_limits(struct kunit *test)
+{
+	struct regmap_test_priv *priv = test->priv;
+	struct test_init_limits_data *data;
+	struct regmap *map;
+	int i, ret;
+
+	data = kunit_kzalloc(test, sizeof(*data), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, data);
+
+	map = regmap_init(priv->dev, &test_init_limits_bus, data,
+			  &test_init_limits_config);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(map));
+	if (IS_ERR(map))
+		return;
+
+	ret = kunit_add_action_or_reset(test, regmap_exit_action, map);
+	KUNIT_ASSERT_EQ(test, 0, ret);
+	if (ret)
+		return;
+
+	KUNIT_EXPECT_EQ(test, (size_t)TEST_INIT_LIMITS_MAX_RAW,
+			regmap_get_raw_read_max(map));
+	KUNIT_EXPECT_EQ(test, (size_t)TEST_INIT_LIMITS_MAX_RAW,
+			regmap_get_raw_write_max(map));
+
+	/*
+	 * regcache_hw_init() reads raw defaults during map initialization,
+	 * so the callback must already have set the limit which chunks the
+	 * readback.
+	 */
+	KUNIT_ASSERT_EQ(test, TEST_INIT_LIMITS_REGS / TEST_INIT_LIMITS_MAX_RAW,
+			data->num_reads);
+	for (i = 0; i < data->num_reads; i++)
+		KUNIT_EXPECT_EQ(test, (size_t)TEST_INIT_LIMITS_MAX_RAW,
+				data->read_sizes[i]);
+}
+
 static struct kunit_case regmap_test_cases[] = {
 	KUNIT_CASE_PARAM(basic_read_write, regcache_types_gen_params),
 	KUNIT_CASE_PARAM(read_bypassed, real_cache_types_gen_params),
@@ -2290,6 +2378,7 @@ static struct kunit_case regmap_test_cases[] = {
 	KUNIT_CASE_PARAM(raw_noinc_write, raw_test_types_gen_params),
 	KUNIT_CASE_PARAM(raw_sync, raw_test_cache_types_gen_params),
 	KUNIT_CASE_PARAM(raw_ranges, raw_test_cache_types_gen_params),
+	KUNIT_CASE(test_init_limits),
 	{}
 };
 

-- 
2.51.0

