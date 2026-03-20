Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022134.outbound.protection.outlook.com [52.101.96.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3846C34CFDF
	for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 20:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774040187; cv=fail; b=McW58ClGig8Ty7a5eTrzrn61h9gfbjURIR5Vhd0tZFDnQ8/8OyXxx1rLFCzB0altIL19kG6DsBF5SV4OykMF0PgY/jheZlcdfOF06yhCV0+AqgzYYzOKiHHz5tjrimeQSI9KOQlZormQHZ2sv8YZdDQV60UEw8PFWxW7/KLS7QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774040187; c=relaxed/simple;
	bh=e7FPuDdQ/tasqC+SajahC4J/Cr5Odx74VmIUJLyP1Hs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=R98NUOmPlMBpf7+1vkY1+AZ20DV9W7MdOA843u/YAYi6OUbnTYA84ijDCNmbfhc6TDoENOhLFlKK0AezxnYektUr7rkxGAnvCTCFaT6/e9k+RKxFazKR89EfwW58NGs0qG0xOt4BVZFqM2BHXkDcOo5xLrV/Xj4ElFTIIUWh5VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=u8LlXGth; arc=fail smtp.client-ip=52.101.96.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="u8LlXGth"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ng5qLG1tupTD2QhbGm6HPQTE9s46gbFOVvvxuOasVVDJUfsTAlCBoo3x0QcWxa+OBQHyK0PNYa2Pz9hR8OjkZEa9G/jhULzqCZiUfY/lSOXdSKCugoiDNyBogzu1S+d4wcQDR7kJ79FFyZINUz7Ts1RxXEhd1iB+G8uMAaiKbUbZDTPCOu3P/2ccgIeW8WJsQdLxc7C+whgx8EkSaXTnyRrJ1cDUUVu6dP65676D1+2KMQXNcNJQRu0mS6jxAlxeANfUksaaQBYiGoz7FBgRuLjUaHkyVDLTdFfl7Ca1wH7/lOKf57NrjgC47xeiqcTtFOwo3/Q3G1KvWmbTNOp5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuJ6f9ZrSqzCT/SbOMINQKpP29Ly+9y59uSpWGoZK3w=;
 b=tmIFLsQX70A1NonK7HqHkSgkIZKmgRF8mqhH8lLHBwxn1LAgmCZRvR4zI1ojmMbDkTzwSbb/+O0G1DasMxsWAGLEFlNWXsZdApRLrZE4lVK8HKIjbhXcaoNRDFiffDp+8oBDEwWYfI81prjhSK5WOH7cabsgj9Iya70My9DAQLd04CfoI+GxynZ1enmQUu9t/1P8MIgN2d0eeFIcmfn3s8HxE7l5IxuyZ4H9dxoZXGaE8CHt4ySya+4qdkBcc3s46VfCVdrMYqE4KscRzY1Y+JQSwb1F2I3ASWQdv4BA2HR8SlsYGsGuFgAyBiVTcPbZdGQNTYtszoCq6FVhES0dXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuJ6f9ZrSqzCT/SbOMINQKpP29Ly+9y59uSpWGoZK3w=;
 b=u8LlXGthn3XhS4mj+i6RPd9FEwIbwO3xk8XiHL4FLmikn4N4RjbglCxsAM+ixtT6TUnwD6nOPqNlt4NwgsU8mdYgGIY6z7TvlVduYjsRsobxl/3jLbu4W9wpcxEajBbUwN9JKe1ny/Jh9/k2V9LrwTfFLxovXLrRM2JZDYbPOyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LNXP265MB2555.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.24; Fri, 20 Mar
 2026 20:56:24 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 20:56:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 20:56:23 +0000
Message-Id: <DH7WRDC8KIH3.2645X14X6YRU1@garyguo.net>
Cc: <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/8] rust: dma: add Coherent:init() and
 Coherent::init_with_attrs()
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260320194626.36263-1-dakr@kernel.org>
 <20260320194626.36263-6-dakr@kernel.org>
In-Reply-To: <20260320194626.36263-6-dakr@kernel.org>
X-ClientProxiedBy: LO2P265CA0302.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::26) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LNXP265MB2555:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee4e4ef-93f6-4273-31f5-08de86c32595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|921020|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K5ICqe/iGqbOtOnpKhovn09vZk5k3Aboyp3IEL4nTeuhnvo1F6Op/YJAWU014YdavsHJvmOMkpFHnBWXoe7q/jpwcf5Tnnumy0QEqiEXKYUGKVEBgoubhbh567gz0ZBJMD50GUGUhNWfVXNWnas0DZaF88OnQxrrUhFUKDrd1KPTAnJen/oUZH+uuwtqfhr7JQB3lN32NX/MUfoyg1R2mKuVkpaFIRhSqsIVRZJ/WmwHRi42CYtkg4LXfjmAGQIRn/kjvZ51UGIeXpcS5otGlixNXuNyp10uJdeuqsowBXhevyrPcFbjC0h8t/Rax6//wUP5autzcK0IWtovUskgBajgn9R3gZ6GwO4MBqBxq3hHRoChRs3M8o7fpBzXIL86lfplqUWNoMeEyAH14KpUxPW8pnkzHzKQyrW+KEqRyKjDsK+98B+Bj86YtRZAByrvEFqGY5wJnbaoffDYo7WB7QAEbMZ/svo8r/o1yl9hUdRXtjXRSERYP5s3Hy9mwpRD2IyaPJrQncRbNFMT19ykI+D+iHgxWu5P/JKd3P6BTDHw1cuaTP/v1jS55Z3fErmyyRi3IU51JjKK3m74yg1ce8IgXr6HWPprhd+G5u3Ywi/ebOOPAbkPlbD/fqbuM5Nj+UzanqoPDA4AvXFqm2PTvajLAEMs0ctzbKZxVj+FWezPTqBXlKzmNbkFcujtmMxQW881dW3/MEGldYOZfUiiVa507dcnWx1zgt7dXILeHxT+j2FqJKCrPwu+J2iyryeLLilu2oXSvnykfam6HYgUOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(921020)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0J4WkgrR2hsV08rcEh5VzFIWHlDMWZjWTFwUVVGQXdvTTI1NitSbS9WNFpj?=
 =?utf-8?B?R21BRlJYbjFjY3ZzbWNFWDg5Y05OQXpXTjVQZ01BK2EwWlBHeGNKWkFKejVo?=
 =?utf-8?B?NmRDdldXdWxrclFRUng0cWg2QUF4eHUrQkpIZU1jcXJSbVVsTTBCNkFCLzYw?=
 =?utf-8?B?SzhMUzlYTHdKUkpZNllBZWp5WEROci9NWjIwd2tsa2xxZVhUZ0RNditKdk9h?=
 =?utf-8?B?RmJ5cHVQeFB3cnVmR0JZWUJIS1Q5WTluM0JXMnMzWmNMTlZraFAwY2lzNnpI?=
 =?utf-8?B?Q1VoL1V0ZEFjZFhqSUEzRlo0S2ZPSHBTZmRTNElRaldZSVNNK25nL2pRaDRX?=
 =?utf-8?B?OVR3QUhXOWUwNE95ZHlYQmtMbHZMekMwUFMyRHpUaElyVEdIU0JUVldSZXdO?=
 =?utf-8?B?VG94ZU51RDBOMXF0aEFUNHNodzIwdUZzcVFGTVVTdlo5SW8vaHFqVllYa3VX?=
 =?utf-8?B?bllQM200eFJhVmtrYWRZQWxiTEh0b2orRjdGUjN3WFU2aHFrQVk0Y3NNaDd1?=
 =?utf-8?B?eHU0amozTHRxYlhjVXdjRklyTW96cnZjM0JGckJ3b0RRYTNZbm5rZFM5Y1ZE?=
 =?utf-8?B?ZENMTlhyS0Z1MnBHTk9BeEJYVG41Sjk3NnBJZXdwSjFsai9hb2pscXZvRFBG?=
 =?utf-8?B?Mm5EbjFTTFo4VTVQM0hQd0tBUHY5OENrTjgrcTFMWXBXeTk3NVEyWUdHclI5?=
 =?utf-8?B?ci9wdkQ4bjhkWFpHVm5keDQrSGdTZUp6b1lMWGswKzBSSXVGaEczSy91bXVa?=
 =?utf-8?B?dkZud2NrUlFmLzVaQmFKT0VaSGsyMW8zcWtsL0paUksrNFh2R2NBd0lHby90?=
 =?utf-8?B?a1VyV2w1QVdiVXJpU0gxMTZ6NEM2TmQ1T3kzaTU3ZGkyTVVtSzF3bWxpWTBV?=
 =?utf-8?B?dnVxNHB1NFFIQ0oxb3ljR2FsSTZWckc4SWYwK0oyWGJKbXhYMDVMQWcvZE0y?=
 =?utf-8?B?QitmcmVsVEhJL2xHSnoxZTUwWmZPczB3V3lIQ1IvQlkzSm05OS9iRW91NGVO?=
 =?utf-8?B?SFBWM0hOQnRYeW5rRGtzcFNvUGpHT1k2Vmg5aXNnM29iUklJZ0FTbGsrSmIz?=
 =?utf-8?B?UzZnQmVEdW9WWXRyL1JKL3NLRkVGbFl3dWlOV1gwYWFuSWtBdG5ueGhoOFp2?=
 =?utf-8?B?N2UrWTZ4OWREVEhTdzFoYnhHa1B1Z05Sa0xCNmhDb3MrdEt6Mm44SitLK21N?=
 =?utf-8?B?MVJRb0s5bFpzWTNFRldEMVdHUE5OeUErMXBzdUFjckhxd0ZGQUpDeUsraFVD?=
 =?utf-8?B?aTgrcUVHY3hoUVk3SWZVaUE3UEJWQmtBQnJmcW1ycWIzQTF1SzZ6Uytudk1P?=
 =?utf-8?B?V0R2MXZ5bUZHSHdkLzNvSms0cDcrcFhXdm8vdVMvSmowRk1PVXZBakpHVnJR?=
 =?utf-8?B?MXpPZFNFNTNZL215K245QkRmbmVUYTkzVzYxWEt3T0R0VWRJWlFWdU5VY3Bi?=
 =?utf-8?B?VUswUitIS1NVRnRIaE9SRzZMdHpzS0p2cWVRUXBUV0VjZXRQZ0l0YzkzaGRU?=
 =?utf-8?B?UHNuV3AwY2RUcDdONVZobTRROTQyWnRKU1phRE8zSys4NWFUN3FwWTJKK21w?=
 =?utf-8?B?NjJDS0phc1N3Y2xRbmsyRTF2ait0Z01HRHlHZmpQNUlENG9relNBWHVXK0lN?=
 =?utf-8?B?RGptQWxTeGcvMVlOdzlZaVBrZ3pUdXZUZk1la3VuNGpKdEFhM1RUb2R1dFhJ?=
 =?utf-8?B?bXl6RVlld0VPU0c3eUs5cXdESDVNejJlelliY2RyZ0FkRlpYY3BJL1NkRUx6?=
 =?utf-8?B?WE5KR3lWbkZORkk3SjhuRnpSbGNlZDhJakM3NzZCMjVNSVcwVVJSMU9yWkFi?=
 =?utf-8?B?UDljOXJEY3czT3NheDRhZ25jMXhNdU1DQ3hWalJFTFZXY01FNjFLbjV2c0lr?=
 =?utf-8?B?SEYvb0tYaFIxZ0lNVzhGR0xBTjN3TkpkN2JOYWt5RjREQjlxZm13VE9mNC96?=
 =?utf-8?B?dWxVTW84MlZZRCtEalEwUGpBWUxmQVFaRzZjN0RKN2VTOXo1bUd4U2xBVlFz?=
 =?utf-8?B?dUY1WG9kUFB6Y3ZGZEN1WWpuL0JReVFtOC8vZUhldGNzeUlPS1NjL0p0aUpI?=
 =?utf-8?B?UGFSSkNRbTAxdDhFWERBdFNVRXF1Tm5Pc21BRWVDZUk4L0ZGQndHMzhTREl5?=
 =?utf-8?B?SjVPcFIyU20xVE83U3dIdi9UWkpGL29YMjZnbkxWVkRXaUxrTVVFdUJIZHBX?=
 =?utf-8?B?dFJQS2ZKV1Z1cWFTdE4zKzJhN0ZBNWNoOHlkb0J5eG9WOWVHRDhqTElZODlK?=
 =?utf-8?B?WDdEMmZWT0djYW9IUThzdTFVSkhBMFI3ajN3eTBPbWdHMWFJMHNHalNxNHRQ?=
 =?utf-8?B?NlV4SUpGM28vdlZLTnZjbmVoRC93dGhKdElpTFhNV2dqenVzV2hIdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee4e4ef-93f6-4273-31f5-08de86c32595
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 20:56:24.1163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ecI4b/+5HcJq0GbL86koozSSfOVvqmDd0fFZEsPPQ0mTdUF4VMjQM+liza/aaRy8TCmblVVkddSqQb0uJ7VZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2555

On Fri Mar 20, 2026 at 7:45 PM GMT, Danilo Krummrich wrote:
> Analogous to Coherent::zeroed() and Coherent::zeroed_with_attrs(), add
> Coherent:init() and Coherent::init_with_attrs() which both take an impl
> Init<T, E> argument initializing the DMA coherent memory.
>=20
> Compared to CoherentInit, Coherent::init() is a one-shot constructor
> that runs an Init closure and immediately exposes the DMA handle,
> whereas CoherentInit is a multi-stage initializer that provides safe
> &mut T access by withholding the DMA address until converted to
> Coherent.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/dma.rs | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)

