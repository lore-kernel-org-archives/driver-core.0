Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625845;
	b=nEJh7SmS+Cco5i9+vdJkwwL2wB4oycCppDRtBSEN4N/A3WLKPyzBPihYvdNPeVwc2q6f
	 k6DEA+oYkJdKuDyid2i3Kkx6ZpCvvIbr8T5t9GYf98T332baDfL8IDjsC8bV6cL6hnxxo
	 G/nPlG634BKDV9Q+kuwzcu1c2qpf9mGoUipqw7enDh5h1EbVJ2w6dKDJ3evLIkAn/MkGs
	 NRjGF7PZjq4eTq0M0OKVM2YD1m8wsOyfmTgFNW5u0DoxByjIiHOXG6mitwMoIoaoPY3V3
	 jSQspj1+cU10Ze9ufAnSSc0uXyiAWYxlLDEnwag7g0cZqmE62P8f9Koqu2U2dDmfJHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625845;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
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
	bh=7tQlHAs7KQUy6b+cbTwngdXkqV17unFtNGTM3PLKtBM=;
	b=wqS3V0tnelgX3GwsXoogHGOumx2kDUZFkU3P6GKTtF7yfC/BGpzWDH3sPrbeWBSSihVg
	 zXlY4iYJeY3t06qU3V5z3Tt71mcvyO6N7IHS0zrkyg8Cg2S7tN51GAjvuWVlOxk4iNoVP
	 +fcskD7s4q3UpiILlFVxDld8TT6oEwzEEc/9f9wb9zqP/AB1Hre++ps8Hlu586vY1ZQZs
	 oOAF+wohX/u31wLHba88OuR/X73woQs5VingfSjYnZPmB9i/IYD4CAQPmSC4njaSXVMzq
	 CRaLIyf1dUbw0TDSY/BWjn+0PjwmBhoZybbHzYPK96gtTA2t2Sim1+YfC2xH080Dw8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=jsdOwtIl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.73
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022073.outbound.protection.outlook.com [52.101.96.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078A6606A329
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 16:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 078A6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=jsdOwtIl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4QuJWtG3+4+KoWH9yHR5hd11X4R9vc/hOgyEDO0KIwizdUa/UiUu4JGZzDc+W6PhcMlmirtz1iGzMXfV5AvjPX2MBUXam1tKZfL4guCMtDClL/FKkLbRv4osdkdRUnPwnMlV9W7nmj24HuerjPlyL9l1NoDS/x46GXA5ocP3ooR0n4DV2M1ThK2oK1egXzqzkRZUQmHG5wI9uYimeDV774HLryCL6FyRjWkuu7oX84uWCfejToRKoq864apafYvVZ9WgSUwAwYD32VR7IFY4rxmPqgFs4uckjCmcudT7Cs8nRq7QFED5idS0rrBCSbKjQafZUlQnBOK+V/Szgtjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tQlHAs7KQUy6b+cbTwngdXkqV17unFtNGTM3PLKtBM=;
 b=ORXr0Ag2Kxf3x1XPhaOt/o5ceXP/8cHzv0B1OSGM2d2wMfr9k1SpSUCHo5RNbOE1HKcYfXGY6opgpYoRZN/5nISPoLrCc0I7WM+YgNmaLKxbrBsRLOpz8133om7Pdh4G9dtdYi0cBeCPafmftL08hS4QGYaF7qvR9U17stSnKqlqOLVgboJL9++CsmMW/OtiLGcsYgTm6vUqUXhKAjBjZ05e51ePfMIFweBL3/FZGtB95fHyQYr2FWLtn0/EuDVp9ccMb0mfZtMOTWRnp4UM53KazgmRLLenNFk0K55EbRjs7JOOEYvuJKYB9Z1u0JHAUHRYEuSEkp+dcPubz5WAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tQlHAs7KQUy6b+cbTwngdXkqV17unFtNGTM3PLKtBM=;
 b=jsdOwtIlicgGvvvkKsz/8DbqKWYchbfsHQhIG2WWtvgurF9H6VjkGofkBirzv5F/jYHlRKwD1nOuGx3pWgxf7W0iDc0SZdYUO72JwhAPwV0YsJ3MHpPS7irWOQl5LbZ+I5HDiz0s/dlWquRZVplLQJntrzZXzbFjxw6zI1k970k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CW1P265MB625033.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 16:57:21 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 16:57:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 16:57:20 +0000
Message-Id: <DN4G8JETRABW.2O6NBI29ALL1N@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "John Hubbard"
 <jhubbard@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
Subject: Re: [PATCH v4 4/5] rust: workqueue: add creation of workqueues
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Tejun Heo" <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-4-707c68994940@google.com>
In-Reply-To: <20261119-rust-workqueue-v4-4-707c68994940@google.com>
X-ClientProxiedBy: LO4P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::18) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CW1P265MB625033:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2b8454-0bdb-495b-ec92-08df4b152bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|7416014|376014|1800799024|18002099003|22082099003|4143699003|261009223027099003|56012099006|10067099003|261102123227099003|261026121527099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	JSxxXIEukRZ6GAXhz4h1RPdtRs9ORknlLr8ko7S3+gUsCpf/bNYcejbkb/ncug3as0KNZEpI0rCen1SJO/m1FtKU40PeSTHk8qwLoHQWAhMJvqkDymOh0hcp2H6pSsjWsxj9kwgaXeeMCO/3UjQ3tMWI8T6CHA188NN4c+6IKVdhCDb7NTAm97ycr7jbIq3me4ssUfOaQRixk19BRePq06r0lhcDqAISr5nWOzTZxqAophIw+sdMuJ0jZ7eoC9Q+357kLTjIMcCPllWIaw3xB5TdnKaqe2Fh5pyN2NvqRnaS/4AjSXmGiQaETyWQnwWVORZEhKe1UG5VeQWV5SxmjpFZS+uXwO4ww2a6S/kDpFDOB6WVqdim4FbQbHk5P0pPLs7PIQZBvq7VR09cr2cw8lHt/GQ4scxJ8zc0NOGgsxtmHfqVlj2qFT+vQoYohqEq8seInHdIjK2tCH1eQYh/dYsZmrJHGpIWYckjR1ytmjHRrHQxKu8LXN+54DG7wpPVuzO/g5vuKPlRon035yXleFc0DHLmBJteqteFU3iPRTvfAt6m0Wp05+BrPq5oef0exWPPOBDiFYYktxTxa94CpArLmnQTii8ZU8E3Qs2SDq4TkctVrfJqufwdj0MBqdRK9RLEM5xprRoAwD308HtkX29iDEHHV150Qctqxq2IyNg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(7416014)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(261009223027099003)(56012099006)(10067099003)(261102123227099003)(261026121527099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmJsYy9pU3VkNjBscmtydG1MQ3QyRW51Ui8xekIzOVhIeHgrdmNkTDFld1l5?=
 =?utf-8?B?TmpybWQrZXNzRlZFSldrdEt0TGlucHNRbHJDQXFvM2lQeTdKRVI0OFZJNzBa?=
 =?utf-8?B?cWhvazNRQjFZNy9Pc3RMeFNlRm1MSWJWYTdnb3RMRkJNWDR3Y0laNGhNK3hT?=
 =?utf-8?B?US9lNDBYc3Fnb2lUbVlhMWg4dlh0QjJ3eWw2T3gxaXhPSXhJYUdlcUNWRUw0?=
 =?utf-8?B?NUs5NnRYY2h4VnZDUllQUm0rS3lKdjBFYWVubDZwaXlrV0JYQ3lFZmtBOGlW?=
 =?utf-8?B?bG96QzJSRHVVeW9nOEkrMHlrVXJtbUZKZUwvdlRySGJqeFVXQTZXRkpFZGpr?=
 =?utf-8?B?cEM1QWcrTlNzRDF4dENUNkJuWjlJazkzR01CcTVlYzNIYWNPN3Y4NVljUDVu?=
 =?utf-8?B?VEJhVjVEQWNrVERaNVNRQ2RqdTU4VnhOR2ZLSjNjYno4a3VTbktsU3NXTUFC?=
 =?utf-8?B?N2RWS1dvNnNweUkzak5QbDhYcG1Oei9QTUwveXcwa3NUL1NZVWVLNFFKM1Nn?=
 =?utf-8?B?OXJIbGF1YkVlQ2lzNXkwTlhoNEwyVlpCc3c1SW5HZ2x2MFhURENOeXBTTDlR?=
 =?utf-8?B?Zi85WVpycTB0UmlqQ1crSldGcHNkWDcvbjE2K1ZYNllYNU9KZ0w0S3prUDNn?=
 =?utf-8?B?aFQxU3IvMm1iclpYRllXMExWZnVhSVVteVdtakhxbnJCME4vQmJvSzZzaGkr?=
 =?utf-8?B?aVVTYWYvOGF4T01WOCtld3dLU0dEOFdnMk1YZElsOFVlendnNDFMdTNYb1Zw?=
 =?utf-8?B?YXhGRVZ2bVFXVDkrNWNsOXBybXVyenR6T3FTYlJQY1dOWFJLOHNsQ0tjZks1?=
 =?utf-8?B?SXVrc0h3R2xkT3lzYm1YU1JuSHFQeWFRTzRjeG9KRkh6OFExMXVEbFhab21x?=
 =?utf-8?B?VlNva0U1NjB0Z3pTRzhscUpFRjVlUmpaR0w5SWZseWpiR0x4NjlVSTlweHls?=
 =?utf-8?B?SFp5K2N0OXI2ZnErRWhtR0lUZDE3V3hib2UxRVVLOGxBempZNmFGZTZkM0Iv?=
 =?utf-8?B?SjJ2bVBHczdqUlNjRDQ1dmJJVlZ1dGlOTHpyamRLcmFEL05ZQVJ2akFSSUdm?=
 =?utf-8?B?dlY4NVNYS3FLNklkME44ZHZnT2NLV2h3NTY0cnN3QncwRHB5ckorNWR5dzM2?=
 =?utf-8?B?ZXBEMmJPNDVjUk1hR21ERWIyaGdBR2daczJUdDBlMXB0Y1AwUm5UUGlPOW13?=
 =?utf-8?B?cjd3Vks1ME1YN1hGRWdMMzljZ3I5R00yVk5XMC9QVkZMV29CRkUxU0hLamJS?=
 =?utf-8?B?Rk11Z2FyZjNxeDZLbTRKYzNQNkxMbWFSNzJyTjNFMXdPYTZGa3NwaHN0NGZz?=
 =?utf-8?B?SWZlbUtPRmJqUk1rNFZpeGgvSHliNWtCUTdocThJc2xnaHJ5Tm1XNUl0a0h2?=
 =?utf-8?B?RHlKeCtLZ1hYUUJyV1I3ZXcrODI2OGFrYUxieXUwWU5jM0ZDNlg3a1V1aUtV?=
 =?utf-8?B?aVYyK0ZVSUc0bktrNnJZdzBkN3g4SjNqNjZtb2dPVCsvRS9WelgyY21TOVJu?=
 =?utf-8?B?VkxkOGtlTEtNR2pxRWo0eno5RG9hSkZxM0x1dlhJQUozTjJJVGZkbXFmeENn?=
 =?utf-8?B?d2I2QjlkWEZhZ0tENkZTbFNVV0hXcjZ4eUZYcDBZQ1c0TTVXUURHM3ZKR1Fq?=
 =?utf-8?B?RktDZFduRGRDclJtbVhjSnhEZkpFaWlRMXNwdWdyVWtPTGwxM243ZnZHZU9N?=
 =?utf-8?B?NnZyUllpNm1Jd0JpRi80Mmx4bWFGdGpBSVNRaHVlc1VKQ3dZU0FYYTYzWWpZ?=
 =?utf-8?B?S3FnOVloczlSM1VYQWtKc1RsZUdxT0ZOMm5YaE45V0hYM0xrWjAxa0JYZjE0?=
 =?utf-8?B?cXgvT3A1emZ2SDlPNWNTOFdJUFZKVHBNbzRYbVBhM29oNVlqRGF4RW84aTRQ?=
 =?utf-8?B?N3ZJS09MSUpCZlVYaTNDWG13MlpYMFRscDhIR1hJNTg4MUZvclM3bUt6RFdo?=
 =?utf-8?B?Z3VnTGFQdmJHeDVnVWZ5M3FQY2plWVpjRm52SzNFbkg5ZEtNV2VUZjlhQnJU?=
 =?utf-8?B?SS80WGcvVER6R0ZtS1Z6RU5OaVFzN2twVVNWUHVEeTh5enpJZklDd1hFRzVP?=
 =?utf-8?B?ZldHYXpIMUhzN1RQSHA4VU1pSnVSa052SDZabzA3QzA2ZUR2L3A4dHUxQ1di?=
 =?utf-8?B?bGpCaHk4OCtEZlZSTEVyRHFTeXRTSHBjUitab081S3pQcjZxcFYreWU5RG54?=
 =?utf-8?B?WXdmUmhXTHlzQlNwTDdOWWZ3dEJXR0pyZUZLMWora2IrN3dLTlFCZnFLRlFn?=
 =?utf-8?B?MVdKMWliNjVCZ1FzNjJ5enJ5RUk4dElDMWFicWZwajh2VWZwTkFqMUlRTUtl?=
 =?utf-8?B?aEtxL2p6WUdxazQ5bWFMSURjNVJMYnBJN2pMYnR4cUFhZDZ1NUlBUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2b8454-0bdb-495b-ec92-08df4b152bfa
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:57:21.5280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1erBQNqqoaO2L+ux74qIr+rUxNhdTbO1zt8r9fdYy9utE0ckb5WnNZa+WXn+NLyyGpDI8tGaUighdtPEPnriZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB625033

On Thu Nov 19, 2026 at 2:12 PM GMT, Alice Ryhl wrote:
> Creating workqueues is needed by various GPU drivers. Not only does it
> give you better control over execution, it also allows devices to ensure
> that all tasks have exited before the device is unbound (or similar) by
> running the workqueue destructor.
>=20
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/helpers/workqueue.c         |   7 +
>  rust/kernel/workqueue/builder.rs | 370 +++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/workqueue/mod.rs     |  51 +++++-
>  3 files changed, 425 insertions(+), 3 deletions(-)

