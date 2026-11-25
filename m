Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795626592;
	b=ZBOyWpfPVv7y+4arGDEBsMxNL/dXqGLWXQaNhu9vI9Ta0xJLUN5iOtWogXQyZYb+Lhsc
	 umI5ZbRYnxjzz7Fy3DhDwsCbmZgRfAq0TqQu5mOb71p18NAzDdL/lPm5AVEhUnPn2f6/w
	 9cVavnUGnGnRt1SMqTreDUyjwuHPxpbUNq06g1xJXzEWyLOg5dOCHKvUROL8fGP6bE7Sy
	 EJYIdhIErhzFFSZ4h8DER2t/3F9SinRXT+uHXUDNzoFrJ2g/7hoqyCP12Lzfun0HQgYIa
	 3aEINKiFM0JGA+UmlHt7b0v9CcTn4nUBDf2u7Xl7+i7o69yINJzM2Kgfa5mfdPGWqJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626592;
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
	bh=R0XKB+zfG0LEwkB5WWechZDFdzI6tpT/9qy8CVXtQjM=;
	b=Eh+zARoZmqtX5AiBBtP7sQWTVRGGMFZHNjkv9BE9eYAfYWcldAzE7TKgYRRL6JkrJF43
	 bvE/hzQHLSH1wTE1BDCnhA2B6salXK2VnNtFFlg1XN+USgt/AC/JJXueIJdV9rthVlcm9
	 8R0Mvy665Kw98fQ+vhbRpeECiramfMdbHPhgwVafUN4rYUHv0vm7gQq0lGeJ7iRMcNasM
	 fEr8OJpM2cJeFDrUMm39Kx0jg6I403dWen1fQPPr4X4D9cU41uGQZIkyd6jVfq/BaXr8s
	 kyTcld9U529S9TAoSjIHjaXOg49DkcfR/7TwZqq2IktP5/FeLIrA4XNG+2V8H45bmRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=dpk8t39z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.114
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020114.outbound.protection.outlook.com [52.101.195.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB3606A32C
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 17:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CB3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=dpk8t39z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzuUxE+EIeqmysIZmIRApkEk/c97CmQbAhXZHPbQSsSDKfK4h2OJKmdzfLpFSBuARQeCgm62Q+F8ZkQduweA0xkoSUEcUSG0cZKVuS+9pnOSSO2uXw9DtKq0aiRfP7LSJqDv/o9j1mOgGCJNdf3ckgXCQnoTuNNQGjmRzwKiWuLKRR8rcWbFVgp7blPxQf5NKg1HZoAOjZBcZaPujA/GuUl7Dd597HOo0tmvIBfhYVQHeScOSEiJeM9lLimZ4lVJPmOCgK1pgZ2FPhDvPSAUxJ+m94g9YotJ6ObIbehXiWLZeaG8xAWxqHYiPuZq3ZGXZTb8Jd2SBLj3pfAzCwAcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0XKB+zfG0LEwkB5WWechZDFdzI6tpT/9qy8CVXtQjM=;
 b=lJQmngvb6Cn5FVWVeUMYdW/Cq84ZIZRkVAOl2YLunb51z5HgsK2SGjUU1JqQ+Yp+h6lCusHgo9E1WDQ60ZEKRE4Cf1BLG5ybk7YoNhhTwMMZVcQl4GWca3egpnOyvECwI9QA0MrQOL50f3c2WMFoNpAPlwUSbXpfh/1Gb/XDD/Ay83nh7uP+wyVRoYXQKdHW5WUmRKOsthLFIMr5WJJonMGoIZQPGUg1bNCSMsbYxV6fv1PRc3Pln/JY79lwMDLhkEogTHc+UpYobyKtS/AGqHrox7Iq5Hnr/elOQwMot2L8T7pK7Qk7SpMdW/j8T/tBTbvnUzm7phf6oT3iurCY7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0XKB+zfG0LEwkB5WWechZDFdzI6tpT/9qy8CVXtQjM=;
 b=dpk8t39zRVR8eU8k9boRgk8ysaTifu8WzhasOE4JeYVFKlKddaFylpdsnZrlzDU+HpFH7cCOubft2v6aqR1KzyerF2OK6tdzNyRPtKj99DT7X4xCyXgbKTTXBK5tt/y2vtvf3kF+BAW97dRb8l1N/nFxgCFhb8Xlbnvxzhd/EEc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CW1P265MB8411.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 17:09:50 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:09:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 17:09:49 +0000
Message-Id: <DN4GI3DQIAHM.2PMLPQ3JOYW7V@garyguo.net>
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
Subject: Re: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static
 work items
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Tejun Heo" <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-5-707c68994940@google.com>
In-Reply-To: <20261119-rust-workqueue-v4-5-707c68994940@google.com>
X-ClientProxiedBy: LO2P123CA0073.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::6) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CW1P265MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: f40c96a3-72da-4303-1f4b-08df4b16ea44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|7416014|376014|366016|261009223027099003|18002099003|22082099003|10067099003|56012099006|4143699003|261102123227099003|261028144727099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	1lAqaWGlboElnbThIdBS2wgL6G5mP8hfk63uL0UP8YfYCQ6d19t25C0EtdLW/nArm0yypzoti8ofak3xGK9Yt6ZxRO8di9C2LCAKSvNA4cAC7b5/Q7bkP+ExNlysRLHzMhrO0oklFDwk+IslhCKg3uRtTmCFrE4y0jYXfPcp/tG7RyYI/0fm8ZfPXf2FtSiTqqMHmjzsfg1EdpClxO+pPj9nInJeUyAtUzmRBfkrGOV5FZMtLee1TrZKaXavwb8165FKWoCxL4zjsygKnGMkFjYaH0izkybpVfUtk56DlSjzLb6jzYVlHTMKoz9CQNvMgHUJPPaUfvwDoHzgTCljKHGZcHYQb3hfg1YBdQwZaDCVGNR9diW6QY62WdBkHgYU0NiZKx2/+6rSlVOiRb3EUcjPmVw9q3uMDDDzadjues+QMXpd5XOKEHamSc+EFQSvqCeZiGqAO5TWbs+IeeQbI+2OYq8kt1fcGEkoXHhxqtBPI+st8GkU0Ujx3ClecJ60YXd2jj4ZvOzFmdHFaTwdFEHZcH86KxrXwBFZ3xb5vjXwZ5/3kW+xCDKyzV+eR6QU8UIs53HwgQy4pmJKKcn3po6Axxq3jxXc30CWKA/xGLJevHL9y4rVpe9i51scH+2XhHCB+17UtZNhDjxdP9PoJYO8UK8K68hl1b25M7nI7q0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(7416014)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(261102123227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFZvYU1XQk1kRCtJR2tkSHY1TzdnQVlZUEl6ZXh1YWFlcEVrUGEzRWxsR1lM?=
 =?utf-8?B?anBGcjZTWGNYS3FrQThub3hqMWRtNWV6ZmJLYjdxaVh5VEFrMlltQWlVNTVs?=
 =?utf-8?B?QWg4dTE1Wm83UEdZOFlIb01rekRRMGhQbUJnRUFOMmR5QWhLKzg0cUJmbjl1?=
 =?utf-8?B?d3o5SmV6Rk5rRlVaZGZhYm1SZVg3QU1WdUlPT2hnVU5pNU9Ga1VBTW94dWhF?=
 =?utf-8?B?SUJQVzlyTnNJSm11aTBYQnZid0RlMmYxdXpmU1JZRzN2d0Y2b3BBZFV2a3dy?=
 =?utf-8?B?Q3BSZVBNUEVtdGJONlUxY3Z1T1NSUzdCWmZETXMxcGxwUytISGFmZ2l3REtj?=
 =?utf-8?B?NTFnWE1FdTdmdzI0dHVUUkFRN2NTR1VxSmZiT3BYcWg2T09NZWVHNlhuV0gx?=
 =?utf-8?B?aHgvMXV1ZW1aU2Y5aWpoY1k3YnBDemsrK2FyS0h3amFzSmlMbXdGSFZ2QUll?=
 =?utf-8?B?eXB0UmgrWjRIeGRDeXAwMjE0VmtuTzhlakFqdlBUQWczTzJjMVhuTjJFcW5N?=
 =?utf-8?B?bFpob3BybjdseTc2MFhTN0YzWWhrSUd0dEFHckpYK2ZKcDZJQVBBbExEbVhr?=
 =?utf-8?B?eTkzc0FkekxFeE9aeU9QR2VNUWViUFA0anh4Zlp1UGtvWmVxL1did0VZUE1Z?=
 =?utf-8?B?azhCQ1dwcDVSSXhWNjhnUzdWRlpJWW5sMFhyUjJkL2xXQ1dnM01ZRTNRTHNO?=
 =?utf-8?B?NGpGYmI4WldpSkVhZ3hOZVRrc1hRTzExc1gySmVTajhQNXBXdjNWTDd3ZmxS?=
 =?utf-8?B?OFZKbDl0YTdDT1d4UTc4WXlXdGJpRVFMMFZEcVRlUU1CYUhkaTgzNjFwMXR1?=
 =?utf-8?B?R0c0cnVTNytUYTdER3VVYWVGVHN1aGdtMXh1Vmxoc1cvaG1Ebm1MRzFEWVMx?=
 =?utf-8?B?Y2ZUblM3MW9JQ3FZaWVUbWZNbExTcFhpY3Y5QjNjSTVRTE1hcUs3a1pJRTlS?=
 =?utf-8?B?SFJnT1krK0tscFVFRktVa1E2THdBWktaakZHTTBRRDhmSTliV3AwdVNkWWdr?=
 =?utf-8?B?S3JhN3ZMNmR3c0JxWmxCZW4rcHk3ekcyU0Y4RnZEbWRvMEU5Z3pWTk9kVHJp?=
 =?utf-8?B?TjFyaW9YZ01ERGNTSW1JeE9iOUdTamROazFtUXFveDFQR3oydUhPZ2d2Qnh2?=
 =?utf-8?B?b3Q2TWQ4Zk43eWdiK004VXNnQ1gwQ3FOTTQ4L0JXMW9ROXo3YVU1N3NiVlJv?=
 =?utf-8?B?eEVzeE5RRnk1RWlYVGl1T3JWVEtKK09JUVhXTGtWeTJjTlJQNFkyMk9SVjFF?=
 =?utf-8?B?dUtxUHFWT3ZXWVhLYkRUQ3FhMFJjc2pETmllWXRYQTg3Y0tiQ3dLK2llTzFZ?=
 =?utf-8?B?MTMzdjJETFdhcU56VXc5WTFUWGoxZ3JiYlFRZmcvNFdxbkhkd2EwVVU1cmRt?=
 =?utf-8?B?VG1IYTlkK21ROUxyL05veEEzSGhULyszTVFGdC9XbFZld1JyRi84ZWtYb2FH?=
 =?utf-8?B?U3Vaa3orM3haSDlPWWoyNUVnT3RCeXN5QmdPelcyM2VDM2p0d1RySE5vUGhG?=
 =?utf-8?B?bE5LRTRuTnpraFl1L0Z1MW1rVmlqVmhLaGJqLy8rbjhFN1VoZFBnT2hEQlZZ?=
 =?utf-8?B?M0cwa3JUdTIwdWQzcGpNR2xpMXVzQmJ5WEhtbXZpWTc5b0tjTkJsV0JDTnRE?=
 =?utf-8?B?ZC9IV3FUODhtd0J5elE3VFIrNGM1dmtXZDdLb3Q0TFFTYjlVMlo4OWs4ZDht?=
 =?utf-8?B?TldXWmhZc3FQTG4wZ3JONVpnTjRQVGJEWWsxY1ZySFA2OU51cUk3cnFVSnlR?=
 =?utf-8?B?Y1QxQ3F1OGhLTmV0ZUJnN0ZvQXV6eVQxRzZNdzJIWmhIWEVDak1JT1F5VWhI?=
 =?utf-8?B?UUl0QzB6ajg1OXYrUzExSnNPM2UzYmRja1BBZGFVZUlSUmxGLzMyeFhGWDUx?=
 =?utf-8?B?V0g4MzNJUUVtNHIrV2JDZDBuMDRkYXUzZ1R3RGtLSE5vejhtQVVOckJoVHZi?=
 =?utf-8?B?dEJOeGZxSTNBc0EzMy8xbTJuYmtiUExzdDhpcXg5MDZWajZ0bmRObG8vd2h0?=
 =?utf-8?B?NkFmNVFyZjJtTDI2RUs1dEZLMDRleEFmNnNaMUNpUEx4ZWd3YTdwV2dFK2Yr?=
 =?utf-8?B?VXp2Z1NScS9iZUpPdFFlRnErcVd4S0RjYS8wdGxZQTF2emlhMXVHZElWVnE1?=
 =?utf-8?B?ZUxXb1pIaEh4VDR1cTFIcTZ5czQ0U2U3TkZ0bXYycm1JanZ2M2g5aXZKS2FT?=
 =?utf-8?B?QXY5RlAvcFRQRmoxZFpxMHJFQ1JRZXl4aUJMVVZEQ0dJMmFiNlltaGxPc2xM?=
 =?utf-8?B?dDdqZThqQkVXZWdPQWRTcUVqZDZWWXorTm41NzFEeGpiUG9MTTdOeGxJRVd2?=
 =?utf-8?B?Qk01RmdCeDFrZXdLdG5ORDJYZ2NaQVd4dVJXZVN1TXE2STQwZmY3dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f40c96a3-72da-4303-1f4b-08df4b16ea44
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:09:50.2495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bc9ryrKuwlfH3wHK5L5lHCNOS3EqzTyYuCyIkt9QmmD4N4ZvY3ITJU6Om5g+EgvIJCSKqPJ1+mrR1EveAjl1DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8411

On Thu Nov 19, 2026 at 2:12 PM GMT, Alice Ryhl wrote:
> From: Danilo Krummrich <dakr@kernel.org>
>=20
> Add ScopedWork<'wq, T>, a work item wrapper bound to a specific
> &'wq Queue whose destructor calls cancel_work_sync(), allowing T to
> carry non-'static lifetimes. Ownership of the data is not transferred to
> the workqueue; instead, the synchronous cancellation on drop guarantees
> the work function is not running when the data is freed.
>=20
> Each ScopedWork<'wq, T> is bound to a single Queue at construction and
> enqueued via ScopedWork::enqueue() to uphold the non-reentrance
> conditions documented in Documentation/core-api/workqueue.rst: queuing
> an in-flight work item onto a different workqueue violates those
> conditions, in which case cancel_work_sync() only waits for execution on
> the last queued workqueue and may return while an earlier execution is
> still running.
>=20
> Because the cancellation guarantee only holds if the destructor runs
> before the bound Queue or any lifetime in T expires, ScopedWork::new()
> (and thus new_scoped_work!) is unsafe and requires that the resulting
> value is never forgotten and is dropped before 'wq or T's lifetimes end.
> In return, ScopedWork::enqueue() is a safe method.
>=20
> ScopedWork does not use the Work/WorkItem machinery: it embeds the
> work_struct directly and registers its own C callback, which recovers
> the &ScopedWork<'_, T> via container_of!() and passes it to
> ScopedWorkItem::run(). The work_struct, queue pointer, and user data
> live in a private Inner<T> that is wrapped in Opaque as a whole, so that
> the &mut Self held by the destructor while cancel_work_sync() waits does
> not claim uniqueness over memory (including padding) that a worker
> thread may still be reading through &ScopedWork<'_, T>.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/workqueue/mod.rs    |  13 ++
>  rust/kernel/workqueue/scoped.rs | 410 ++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 423 insertions(+)

