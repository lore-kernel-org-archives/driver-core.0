Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795501310;
	b=O8oyXM41x0f/nsXzK3e44/8doMCL9Qmyx68ThsrMsDLchwfisA3B3fS/n8up/RQCmqkq
	 r1IuTbH79vEeXYUNh37QdHto+wywRdba0ZOjFcj3qnbEvlG8VqtmIx0FQ/5GsJAl2VFYa
	 ccT1pineQt6/Zl5KEhf3qhYUQQWcamFlFjDcGAOAGISmNMpzbMfdfuyQCEGumBIYf00BW
	 4daPjQGD+Xcv9gG+oKbIRLxv9Q5vr8IK5reeBfWPNbt6I3Nj3vqUTKsOkKr4KVRwo9UoL
	 D5AK2V6NISpt2/VlPraYKLvhKVSwSdSeFmPCblaxf4D/VBo8o5UKTMWIJAac9trQjOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501310;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yDjib7Hyd6wNnIgneYMeyA51h7Twq0X5yVMVzVny/PA=;
	b=B+8oeYAr8prp2282dE2OAIghsJN0BcqOOph/15KtQn1or6CGpldatrT35WoM1oHp2L2j
	 t58F+j4xKi73rLg6pWIi963xAu0Yj5pi1cDX5+tqsvqzhSEElqRgdWkQyiMghz15uxObJ
	 W0VdvJxt7XVSIcaMK9YB/ywZVWZaaKmC5P0zQVtb+o4ypXR8VV5reLFg5qYIW2LpmQn2B
	 ZubzC0/wmxXIoYUcK3oQ7yHsaxNrKjUleKY9vvfSQP5QNXHrLAttDLTvztsb5hZZYuLKs
	 ZJEXBpE2yhSUya//ubsqjZ5CFCuP7bo3Rgv0r4zF00H1zf5kbFiZ1FjX6t12CLISzTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="VpFfE/wq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.3
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27953606A327
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 06:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27953606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VpFfE/wq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itr0djN+nCy/vKzCNqJJ8wR5Y4PJtoRQ44Pa29Qcpr45sQ2CkG43V6jQNDfe+tymwsF/FGLnBfTKyg0kTW6DkMHOzKIyOkzYZKkqjzEXbgFXbap50goF0/QIkwVgkNChYpNT4W0ltZSyPT6xIEFy09cc4MtrMKb7bJEgtKLVeQ75BQqyh/Lbd/z7VBbbAu6Wo2EvBMbFlPxyQ/r3sf5z+WfZtyzBxpDdmrhwsooE3Mwj4ilgHwqMkstBnMjGZUCACdHOV2mKttFhr8eJaeYVcGWG4N0XysWYV7m0ig0ikwvAjHtZVEbyls5XVNqGRI12RPcqLEELo/6P7QkLHa21wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDjib7Hyd6wNnIgneYMeyA51h7Twq0X5yVMVzVny/PA=;
 b=d8vcgQ3d39JX4nyr175BRcmIU/szy9GMu/mEUJ2c10NLtLupxJ+XeHOj0uRULEwr7boSlxYHhGtfQGB9MlQ74GnBcNXgEXS/RFDBGfnKzwNGY77pMqfTkDfC16V/APq1NBiHHkgN9UH+cv14FeaVHetBJ4MJN4+V8DsR7o30dHUiF7pQ/otyOFmlVeEZHOs38ViXSRQv4mrlY+RE9uDArE2NYbUi2Q1xUBG0j0ayb1LUDGZq1x45tkPvD8tlGtcB/XgHayQtLuZJmezGce0zWWu1G0WHfBY3YPDjmF7fWLUq8GKhs3wsgJ+DtEdx2cHY9q5zWpVL8jcshGidiNoS2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDjib7Hyd6wNnIgneYMeyA51h7Twq0X5yVMVzVny/PA=;
 b=VpFfE/wq89WQFsDHyPZAV93nxkjmYp7Ai+oAljOHr86YlBwPVhUBPNR1QvaEGhI18hEH2ZRQKf4nl94EBtvgrwFh5CsluhyCfRCeDQQDl6vQOwKhnpQNeTbcfVPg6DKg+Z7iECk+HdN9tJQiXkhmqdmrkI9sEtApVP3eoUrn0W07bGIE5iikuE17nyHrRJq89tykHjpjx8c9Y9U3tWSoXGK2Tb1hLifG7zOh93ymdVVdrwvkD3htC6GRg3sPbEx40UmXXAgy3qkKW6tbFGY+NGn9hj+xfYBs0RODBep5HYreuEeMfYUcehUMzwXFeozYFOgRg2eDKxqYtF4l/DqKEg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SJ5PPFCD5E2E1DE.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 06:21:46 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0615.012; Tue, 24 Nov 2026
 06:21:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 15:21:42 +0900
Message-Id: <DN383BHVHGTB.VVVG9TORAA70@nvidia.com>
Subject: Re: [PATCH v2] samples: rust_dma: add missing newline in dev_info!
 call
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Ivan Borovyk" <saref012@gmail.com>
Cc: <dakr@kernel.org>, <ojeda@kernel.org>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <tamird@kernel.org>, <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20261123010430.365536-1-saref012@gmail.com>
 <20261123230618.375172-1-saref012@gmail.com>
In-Reply-To: <20261123230618.375172-1-saref012@gmail.com>
X-ClientProxiedBy: TYCP301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SJ5PPFCD5E2E1DE:EE_
X-MS-Office365-Filtering-Correlation-Id: c6751057-1c24-419b-012a-08df49f336e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|10070799003|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|261022105027099003|261028144727099003|261026140227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	W6qZs2mN9tcGUwfmz1fTrKWnOcht+q4cUtYk4CadQVbV+NseqeCxeRTjnYYgyD56lu2q4fmXGZeIGcZsFRmgIjX0EIeTBWWjXaLLclojcVNpbIT777/uiYgZJ+UV9QM+BIkR8Rj/LO0/T3d0usi4Hbr0T5te88U7sBOh+lEZ1qBmGRGDPvrOsyss7GW7Stlvbor50OYtVf14hz0MgytujC89m0spBAmadA5ijRxxmD3LsyruuwNaVXIL1ah2Fn7t8tVEn7iXLS89U2YZe07jUYSJ+qoaFOFVD5OPLSvOATFs2DzLUs6GzHOshMIH8N+k+dKC0f9ISgA7y4mlk8LmXbMANopPbgO/VihjwKhifbn4auKu+iJoXUz3/3xFjXejljPqVHnRxquVEU3LaQtZe25/EcnBei/N5SwAfLN5kruYAdTk5Ik1lsK2zxu+OQcNzJEEt7mrWBva0f0Kw898oVdGg265mmQptELDMgye4UKihfuKB7JMpRdRL6Js1hRVJxG9jhWLjDz3Syvyf71qKxso7JkXxnoG/PHJ5njPF9irR87nIiQp+ED0a+BfiprJ06WxejDOEwPs5Kg9UKxXAPP0W6WPj9GewbgP5ZnfrteJpy40l5peCYDW8aY11jNjRKI05iAEUVpECVZExymIjq0wf7Uaaj8wWkxaniwIgyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261022105027099003)(261028144727099003)(261026140227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0NLT09wTGdCMkQ0ekxnNXhXL1A1UHdIR0hac1haeVJNdHBITWRSMklMaXdC?=
 =?utf-8?B?c3oza01mLzA4Q3JmWUFJemJwb0xzTHJUZVhOZE52SC9vOXNzZWhnemNrZHBT?=
 =?utf-8?B?alhJd1MzeGYrYWhCczZyT1pnMGtuakVPRndKUy9ETjNGM01OUDA1V0NTL3NM?=
 =?utf-8?B?YTZBelVLVjI1UllWQkl3SWxSbGpSUWsxUUE3VG9JNnpGN1ZYdHZEbUNyQ1VS?=
 =?utf-8?B?enpZNkEwTWpWZmU1ZVA0OWRnWU5ocysvM2hpTTd4RnhaYjVaZFhLdURYbHI4?=
 =?utf-8?B?cURvZE8yd0ZQTnJLNHNmUVdyYWN4ZGJkRCtBK0dWcFZLMHFpc1ByekxQTEpN?=
 =?utf-8?B?YmFxOXBmWTQ2VDlESFRRMVlGbUpOaGFyRXAxOUQ1eFRiN2dyMzZHZ21tNEJT?=
 =?utf-8?B?b25Ca0g4eXRhNVBkb05LNUdrN0E2Ukg3NXp5dUM0NmkzTWpBc1pmajJLc2pr?=
 =?utf-8?B?SGFZNUZIY0tNWHI5RVVKMmRTR2lKS3E1dVk5VGhkeXZvZnozb0dzS0x5bzBk?=
 =?utf-8?B?ZGZJTUhKbU43bWplWXYxSmxuOGtJNlVtT3BLc0E3WlFUR2djNlhsWmZIS3Vy?=
 =?utf-8?B?aHR1Vmo4cVArY2psR2t4S0JxcGJLTjB6WjlINGhweUFvdU80T1NWdEliS0x5?=
 =?utf-8?B?cGFFTW1qQythQldTWUQrWWV1WkpsN3BMS2IzU1Y1YzFhd2F4dDBBU1J4M2xh?=
 =?utf-8?B?dUVaWERMeDFnVnpzcFYvVHVRdVlGVElpSjFLRjJ2MUEzRTJocitDVXdTSnM1?=
 =?utf-8?B?ZzIxZWZpdkQ2ekZPN2lOOHVUMWtmRGExWUFlUFdMQWx6M1pROXRESFdueldD?=
 =?utf-8?B?cktsSisvOUlkMkttWVpJcDl3cVVOT0J0V2VwUHVQRzdHVWtyZXFIK3JYNm5U?=
 =?utf-8?B?ZFBRdXdac28yZFBjVkVnRmhuUUxzTGQvRHoydXl6Uy8veWxKZHpudlNhN1FX?=
 =?utf-8?B?QmtMQ2U3R1dPVUYxbEVnWkVuSmtxWlFvbGM3TUNFS3Bzb3BaRExLeG1kd3Vq?=
 =?utf-8?B?eGNqT3JhQ0pKTmJYNVBsTXo1UmIvaE1qYnhIaVU0WTlyMTFKWFJrYjI5empV?=
 =?utf-8?B?RWp5ME14K3dIRldodEd4MEN1VkpCVXprS1VINHduMVdyMjh0U3NoQytIUE9h?=
 =?utf-8?B?YlVhZ2JjWVBOMmp1Wjl4TXlFNXlqejE2am0zQ3IxWjg5TUlsYzZOdUh5M0pP?=
 =?utf-8?B?UTJMN0R4UXlZZGdKQWxSN2d4Mmt0dmtPYUJteGs1clBoM0VBZ2J0SzFhT0Ji?=
 =?utf-8?B?cXVPVmg0akNDd2JpSVJ4UU5EY2p2bGZuUitQeHlGMFl3d3c3cXpPZTAxVEhY?=
 =?utf-8?B?N0NZZU4vb0FMT0lKVWFwczRpbm1NT3lKbGVTc3U3cWF5OEZnemU4SmJSUCta?=
 =?utf-8?B?OWFhb09qVzl3ODNLY2ZWc0dOaGFXSlBzNXlvNllOM0t5NnJPMi9xcTZWVzZW?=
 =?utf-8?B?eng0M0txbnBGK2pDQjVxVHZONW9WZzJ6anN0U2ZFc2EybXFVckdEMGFML3VV?=
 =?utf-8?B?dWhuWVRNSUhhc0JxUUlVQUhGNmFTL1Nsb2t3ZVZsWFI0eSs2cHp0TEpzRlNM?=
 =?utf-8?B?djBzSko4WG1PSkJlejhzL2xGcEo2TW5QSStGNWU0clYyZ2dERkwzU25BamtH?=
 =?utf-8?B?TENTb2RWaEJzQWcyT2VacDNSWjJRcmtWbi9GNmxvUEpiakxrM1NVR1JsVTdq?=
 =?utf-8?B?b1ZsME5ZVnU4enBtN2Q1Ti9XRVVxMGdXK0M5VXFLSXN0NzJTOTIvWmllYklI?=
 =?utf-8?B?bnZsRU4xSkRuVWZWYW1UMTEwRVZSRXAwbjd1UGN0TmFnUjhqM2JGdXU4MUxy?=
 =?utf-8?B?OU1ZZGtQcHIxYTFFVzVNNGo2ZWxKY01TeHA0UmY0bis4ZmZLUTczS2E4ZmVC?=
 =?utf-8?B?MUEzSXRoU0FYYks0ZTF1UC9jM3lWclB2cW1XUVNLb0lnb3R2cnpmbU4xTXJh?=
 =?utf-8?B?V3ppWnI3VG5BMWZZanJURVVjMGgyaVVITnFKM0RIOGZtbENUSW01SEJ0bmJo?=
 =?utf-8?B?QTZlZDdtekp0alJTellETHV2R2U4UXh1VkRZSXNRZ1NxNldrWFUvZFJIdDNi?=
 =?utf-8?B?M0x0N1RqbDhJZ2kvbXByblRlM1ZzKzI1U0VEMnprL2RIL1JBTTRmUGM1RFVB?=
 =?utf-8?B?V1kvSlNtdGZtWnByRks3OWNlWFBKSDZNMVVta0lCZGhLcHVYQzVtUUZ5RDFy?=
 =?utf-8?B?VTQ1K2hQWDBXeG1nWEFzL3Y4aVpZZ0paWkxGZjNrTDY1bkxxbWwrd25GRnR2?=
 =?utf-8?B?N2xTbVFtM242ZWpxRmVjR2hiMUtibUtvRXhnU28rcDRpb296b3FLRHFZbUNR?=
 =?utf-8?B?UzVibk1NdmpFMnBHWGVzU0t0L1ZBMDNsRXROM296QlFRaTE5WWloSGhoYU84?=
 =?utf-8?Q?KifXPPCxzmxenk4ir4XdvLg5uZ3CsenfNM4iqIZHEOfZb?=
X-MS-Exchange-AntiSpam-MessageData-1: ToGiMiP6MYxumg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6751057-1c24-419b-012a-08df49f336e9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:21:46.0977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCtHH7joIic/i6Uc7zS8eBc9/LWqA/B3hQse6WhPQOBN/wHVjN5einvrK+CaPGA+sKzTUiFC70oRNBydXB0KiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFCD5E2E1DE

On Tue Nov 24, 2026 at 8:06 AM JST, Ivan Borovyk wrote:
> The dev_info! call in PinnedDrop::drop() lacks a trailing newline in its
> format string, unlike the other dev_info!() calls in the file. End the
> format string with '\n' for consistency with the dev_*!() and pr_*!()
> macro conventions.
>
> Fixes: 5444799d701c ("samples: rust: dma: add sample code for SGTable")
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Ivan Borovyk <saref012@gmail.com>

FWIW,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
