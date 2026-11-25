Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624786;
	b=zbM95lSAugyux4mP7fwkdbRvu1LO9Y5bGHG0iuSYFkh28DpveN5CXlKl4ZimYHHkWNBv
	 vPlxZBd1FPv5Qh0uOhLo/4Fv6XAhpsO68uBVUxt/gi9cPkLSB57dLUDnPfutObw7xvVco
	 sInY5Hd7t5DiARC1n+dIMzY2CVdhxIAqoTQImsISzoTtBdhxjzSc3K/aFSdIiKetq5tw8
	 AykjmsSeqKnP/215zfZy9l1AZdeREb62FtTnkH3FYsL7X6+oQQ8chAqzMUN1cUKtlqDQC
	 rHBavIFL4mH+Wiwj1amMMf+rzpy9Nhrymo5fUccbERFbxZy14L7Bdqqn9Bp5JsDPa6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624786;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=vjSh/XuGaG/4bjbawpBDsLwTmKGX6H8ELcrXGH1hncw=;
	b=4DaBeUUxH4X2+OsYZRqujsLnVVN0ZRD2XA8g6TyPh+nQPaTTfPgHWUrWe/q/ePVgryXH
	 oG+hQxJbbWQ7qbZTGizxiL5QHWZ/RLptW+j17/X07/hwO4Tjh9AU7BR0ChURzeAo5Y6mP
	 OBsQ4PBVX+HuqanRJNi8XNFsggRGnsfJbcWZzBppA/HTX/dEgWOd0y7UoXQPtCGAzFE9L
	 zAy02KTvW07iECqgK/zt6VaDRYLRBtGqBgmOw2+0+sGF0gwcpxQctrAC2OwsUkiTv+YeW
	 Ev/u9uPPnDIAmuuXRb9ZPxnvR6XMNM0ymIdoa6zz7IX9HYh/Q1FaHOtO/SwGWs3Y2mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=bpvnuCec;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.73
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022073.outbound.protection.outlook.com [52.101.101.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DB8606A33C
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 16:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DB8606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=bpvnuCec
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxXWwQrAeNP5OGMyIzHCjqozQhOq5BYJR3ZiRa+CUhaJ9jJx5YyxPQJ+bBWrGdek7kOdlzs5SmrK7ra/Gffr+zkDbUipsGDks+ADPY9n7KsbsoaqZi6osDulW+swdKEX3VI1Zfuo4XF7Y6GXw1lciNIGMZYydEsaOmaDj5VcesVKj5ArfuA4c+BhBEv/OQVTCMoZj+wDDKy9ZQRtAljRTg6hyootnSIC3DH4Pgqiqz9l0e0BUS+KlY1hTnOwVnwzB6PeTcZh+5AnHRuop/Ah+hAR4BvAdfaRMCfvQ4iBiA7DD2FDsKRz1Lm9wcUlqQBm+Vuj9tOd/3T3isvbbjtXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjSh/XuGaG/4bjbawpBDsLwTmKGX6H8ELcrXGH1hncw=;
 b=qtftymRmSIOIbbpxDwvHWY9oJQYEV5rPb64f4s41jYFctifJ7CrQ2QoT7fvLqpxcfo4JOQgDu0Kg5oUagI6lz0cNX1pePygXNj0f8VSVftv3GQuTqV8UI+OAyG+cTbdPhVcfKk1NJpO7vmI7FK+w4q2m7QfnmIiVq67CxOlzRDfal2nNBqYkucrFRY3dIRdzmGIJDlPpaJ/2rBhpSQTtVyfh1IP5x0iy0ouwv33Z4m17ATCU/BVa+5diMZHPB+YDbvOw3JIy5Twj6chYUiSDj+aqUzz8p47QcoTHPHfm/6i7BFZIBEhNNOkwwDGsk7uk3Q+nPkgsgNFC3fHoO1OMqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjSh/XuGaG/4bjbawpBDsLwTmKGX6H8ELcrXGH1hncw=;
 b=bpvnuCecr8MYIFMNbqBS2dhh6lDQUwnqQ1A682D1NKxzYg8iWFUr2U+yaVBYK7B58LYmw5YZem1BbxzGUjDtqF96TqzMq4wVIx1D4fskitCyjDeDqtKkiYW71ZOnsHiWwxHD3vEvSboHQ2DSHw6e6zb8QDuxP+zap2/OcJjBTK4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWLP265MB2386.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:66::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 16:39:41 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 16:39:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 16:39:41 +0000
Message-Id: <DN4FV0JM8LYR.VJWXQ4AYC1Z9@garyguo.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Gary Guo"
 <gary@garyguo.net>
Cc: "Ivan Borovyk" <saref012@gmail.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>, <abdiel.janulgue@gmail.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <boqun@kernel.org>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <tamird@kernel.org>, <acourbot@nvidia.com>, <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] samples: rust_dma: add missing newline in dev_info!
 call
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20261123010430.365536-1-saref012@gmail.com>
 <20261123230618.375172-1-saref012@gmail.com>
 <DN3II6MGM5KW.364GAZDJSKNMU@garyguo.net>
 <6D2642C7-8293-4E9F-9DB4-3199A20B0CF2@collabora.com>
In-Reply-To: <6D2642C7-8293-4E9F-9DB4-3199A20B0CF2@collabora.com>
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CWLP265MB2386:EE_
X-MS-Office365-Filtering-Correlation-Id: a29f0c9d-1c3f-4331-66a7-08df4b12b44d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|10070799003|366016|4143699003|22082099003|261009223027099003|18002099003|10067099003|56012099006|261026140227099003|261026121527099003|261022105027099003|261021121427099003|261028144727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	gskSW81F+kEEDa7nC/1TayCQlw73e4pn028NoFrcEY99Thz61CZUidcZMvd9tyoTk2JowL0sE148bEPVhcuEdMc7CJ97r7a84SpMDUV1MsJ+XkvPzZ8CsW4x3/2Vd+NeZSyyOTcrSE6bUikdqoixy+BJ9iVP1bwAK8cX383IoR+LDM/UO4/bYbvvFMRgRvr3J8bEELxWZupg9VRAqhmd+dDLbfPJ8imlmQB3uaVnEcmAuesMyL3CmlpxcX5smC71ywwFNiArNiIvgn1Cf4KIuUjQroSRoTOLsyeiH2d4WkUgcod5QyOH2yQae/lx8C0scmIF0aFwUxpJQGuu4YJcAcXMebLAMAB73Zs1IsbHPRMoizQcAV5sbbp3GOoulxcYBTS/MxufYB953M/9iw6yRRJJl3pTqLYJyIoU5veho5NFPDsn9jWO2ZVkGMciDPDGrllzi9aB8y2T9ZShCiNieOCP0mxuq66bLZvxtRpPkdfHA78khtwH1UDT5IyordOLK38EZQ3OAW1QNglgOvt34Pfd1do+h9df2a6VSrPbFlqLnstQAPhPnb+5aOqcXB3IfaySNSg6oDgMGSrpQFULMTBgJslsJzcdxL7m8Ku+QWg2WPRz305SjTX4TP1LB9bh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(10070799003)(366016)(4143699003)(22082099003)(261009223027099003)(18002099003)(10067099003)(56012099006)(261026140227099003)(261026121527099003)(261022105027099003)(261021121427099003)(261028144727099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0JkSG9LNzJNdi9LUXJESjFBdW5kVGk3a080N20zbWFpYWs0d2ZLNWdFcVVp?=
 =?utf-8?B?b2lORnJsVzlBckRhWDlCY3M2eHVUZkN5UFVrOVJuRFpqZHlvNXp6c3pMbmFi?=
 =?utf-8?B?eWMwVkhnZVZpV1lDUitrYWg0OStGTmNSNXl6bFJNak5Za0ExWXRFd1hscDVW?=
 =?utf-8?B?a0xEcDJ4M2tMYkgrN0QvL3VMRzJJcjBERFFhWnhCbkpGTERGK2VEcDlaakF3?=
 =?utf-8?B?MmdqMWp4WEdsK21jN1VFZVRUUXVNQ3dBc3pBenJFanhDVnYzcUsvT0RIeTQr?=
 =?utf-8?B?RDdHeVNFOXQ2dU82S3RkUUJhK0FncUg4YkRpbXVXYitrZjBvak1MRmpOc3Mr?=
 =?utf-8?B?U1M5cEx0enc0L044Y3NHejhLWUc2d1JESzdja1NUTUMxK0IrSHNiQUxISTR2?=
 =?utf-8?B?b2F3MlNlSXBPYmptKzd2bGNMQjd5clBxeEgxdlFKYi9WdllZV0Q1cTRXNHhp?=
 =?utf-8?B?NUxMdlpPc3FkNU0xcEhSVU9pV0JLZFdEemZER3M0ODNRaWNydVllWlN0S3ZJ?=
 =?utf-8?B?S1czMWVjY3Ftc3lTc0RYK1gzZjVaZ09zdldSdk9kSUNReUI1aStEdDRkOU0x?=
 =?utf-8?B?QVIvQTRzakxhaDB4bkVXSDNZWE1HK3RscDVpbkhWdGtSdXZaTWpyd0pIend5?=
 =?utf-8?B?Q2RTdkNvb09aVlNWbC9oaTMrZWMwRzc0cElMWENJTXBHZUl5OEt0NndLdGsx?=
 =?utf-8?B?UlNsNk5TNUE3UDBwei9qb0lwTG9Dd1pHWkNHdUZ6WEtCVkJJTGQyb0JscGpV?=
 =?utf-8?B?clF6ZzkxZXhwK21iamQzZjBMVyt6S0NjWkJEVlRoaWpBTVlxSWEvNEZUVmlq?=
 =?utf-8?B?S3BseXpteUNUZGQ3N3hhWWFEdm55d3p4YW9wL2RDb2sra0lyZkw4KzR6SjQx?=
 =?utf-8?B?VEJGdlh6aktmK2taUW1GMitwVGJZVytZaGdVbUdJUXpNeTBGbVYzMVk0d2Zv?=
 =?utf-8?B?QVdaREt6Y3JGQVYwdDlTUWh4TjlyYm5Td3AyNTRVbUtCeDdnQ1BaZStJTWdt?=
 =?utf-8?B?dE4xaEJVbUNBR3IyNTRKQnUwY1lhdEhhVHg2RXozclZyTVlHUC92cEt1a1Zx?=
 =?utf-8?B?d3JIVEJad3paa0dPL2svd1k5OW5rdG9TVitDYndVbXBPRUNVQUpadDVmZWVn?=
 =?utf-8?B?T3ZFYUFTRm8veC9oWTRFWWhMaUVDSFBKYk9kN0dhcU9rYkVWalljU2U5U3lY?=
 =?utf-8?B?M3R2L24vZThYMkNrSXJjOW9SMkE3aU41dklRZS81MXpEN0JZNVFCVUMvcTBO?=
 =?utf-8?B?Q3N2QUxEemZSdXBDM1RDVWVmbHJnMUVIcDhlU241cWJUT2hmdm9TZ1pHTUdQ?=
 =?utf-8?B?ZWx6QVJqV2UzL0oyV2FDU2NzMm5OQXc2K1hVblFIWGIrZlQxdXdxZFU4RkhT?=
 =?utf-8?B?WUthL3h5ZnJnek11bEc0bWh3Vm9RYitXVWE4VFZxcXVFWEpLUmFzR0NXVWxk?=
 =?utf-8?B?VzFJaXFQRUpkMGdXdUhGN1U2M0tObFFBbjR1a2tYclNOeERYcnZld0NMem92?=
 =?utf-8?B?RHpTa3d6YzJCUnhTcm13Q0FEbFFnb2o5OXJOTk0yTE9iNklENjJYRGlUbk51?=
 =?utf-8?B?bE5WbVZ6SGtnbEU5TTNIanQrUTJGeDhxT3Q5azhFdHQ4ZlFVUmhrN1JYdktC?=
 =?utf-8?B?Yk9WaGFNTkhlcjBibnMxK2VIVEhsajJtYmIrQ1hPT2libTVQeFIrSm9vYXFF?=
 =?utf-8?B?YW9JMGVEbHdIRllMZWc5eFhtWDRoZlhwVEsrc3dVL0tJSUtQQzdQcWdCV1FK?=
 =?utf-8?B?THp2V1Y2d2F6UDFVU0VaSkhXc0ZRQzZOaWhGSTlBTnhDcDhOOGVCMXk2NVE1?=
 =?utf-8?B?Vk1vS2J0ckxWSzF1dHBvbHJLbjBkNS8rcFhvTW5yenJsQXRpV2VzbXl0S3FO?=
 =?utf-8?B?WFVTMHZsR1VRRStaZU9URjF6T21yRitjWmdGTyt2N1RiMkZYZTRtRGRYUEtL?=
 =?utf-8?B?VUZKR3prMHdIVFFRR2JSTFlNTE5GM3ZHSEdLUWdHMHhBZUMyTWVJWHpxWDVC?=
 =?utf-8?B?ZjhkeTExV0l3aVZvcEpYYnhySXl2Tld0b3p6OWM1U3FsZFp1YTlSNGo1M2VF?=
 =?utf-8?B?WGRrOVVKMTd1K252aWVwWm1Vb3lIaU9HYWhuWUdubFJYZnczNUtZenR2TlY1?=
 =?utf-8?B?N21GYUtNSzc3alRIOVAvWDIvVXBYaXA1YWRjSjFmbjEwUW4xU1BPR3B5QVJa?=
 =?utf-8?B?aFJRMjVrTHpjTjE0OFpDT2I5Tll2VmdTRVc1ZlFyY2NKaFVDaFZBbkZFN0g4?=
 =?utf-8?B?YVJ0dkpjdzlpZHRYNkV0cHlCZUs1UU5iVHZaYU51ZTBQOSttSTNoZkEyZklY?=
 =?utf-8?B?U2JaQ3JxanEyWUxWdXU1ZGV4U1BMa3NJZUhIWDc4azRVUzBmS1VDZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a29f0c9d-1c3f-4331-66a7-08df4b12b44d
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:39:41.7427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IWAYjmff15oGVYZuA8M6KXI2PfxgHPh8mN54hZPzBmuxnC466lpMR5ERJfBqo/t+T6YHoOgDmZJsAx38216+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2386

On Tue Nov 24, 2026 at 4:14 PM GMT, Daniel Almeida wrote:
>
>
>> On 24 Nov 2026, at 11:31, Gary Guo <gary@garyguo.net> wrote:
>>=20
>> On Mon Nov 23, 2026 at 11:06 PM GMT, Ivan Borovyk wrote:
>>> The dev_info! call in PinnedDrop::drop() lacks a trailing newline in it=
s
>>> format string, unlike the other dev_info!() calls in the file. End the
>>> format string with '\n' for consistency with the dev_*!() and pr_*!()
>>> macro conventions.
>>>=20
>>> Fixes: 5444799d701c ("samples: rust: dma: add sample code for SGTable")
>>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>>> Link: https://github.com/Rust-for-Linux/linux/issues/1139
>>> Signed-off-by: Ivan Borovyk <saref012@gmail.com>
>>=20
>> FWIW I have a series that would make trailing newline optional (although=
 I've
>> not got any feedbacks about whether people would like that):
>>=20
>> https://lore.kernel.org/rust-for-linux/20260728-printk-v1-5-855606634d70=
@garyguo.net/
>>=20
>> Best,
>> Gary
>
> IIRC, there were some discussions about this, where people asked the Rust=
 side
> to not deviate from the C side in this regard. It=E2=80=99s been a while =
though, so take it
> with a grain of salt.

I initially proposed requiring newline to be omitted, but people don't like=
 it
because they might have habit of writing "\n" if they write a lot of C kern=
el
code.

On the other hand, people write a lot of Rust userspace code would have the
habit of not writing "\n" because that's how `log` and `tracing` library wo=
rk.

So in that version I changed it to accept either and behave the same. The
newlines are stripped by printk anyway and gets turned into a non-continuab=
le
marker and is not actually a newline, because printk keeps records as oppos=
ed to
plain texts.

Best,
Gary
