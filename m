Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795099043;
	b=Dz+qH1RISwvHkwv80sjHQj1gUZbDMXovWTmQHSrwcQjrz7mzpBtWo1h39g+E0OWBUkdJ
	 dhnoVzBalEGvWV1QwmfUpJbAS2F8VxjUJ639bOd9WaPGNG1ImaBq1ahOK/aGkD769Z0G2
	 GS+6Rk5oiSRZ2zX4WK+X+0cpjSlcxT7YO4Mhav5uVL1QHpnUk0HBVE31l4uZHyQHvloBX
	 zyD1bOdDQate1SsDVUcKzFFgliedNkZH6PhzEosJqYg8qsEdn/yConm8zbSNc2gz+2crs
	 dec5Rccl8DcbH0DOsF9I4etT7Kj7o4yN8+ElupBa9SIJV+iE1FppSATvapo5lpZDTSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099043;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
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
	bh=2yPawa30pMZm+m+1HYk9uQ8u/Pr25MPacJvADJ3uVwg=;
	b=iYikXeEZqjUF2MhBsQvRbxr6xZ86g33tB7wwdqFHmWcEkHXTFhMk8lcTSpckqaObPX77
	 PVcbxMzprL91P6qzH/x89L5cwBd/hlVwmMQ6FGxeeoUmUaqwpQqskziCREkedXMeJXg/6
	 Yw1gG37aDEsJm6JatrddDgKy5Vr6xM1BbGt9Iblhhg9p0Pre2w8bY1oWofqDTrK7NIYC2
	 BV7DYDrdlfUSTCix04nGBpJnSp8RcPevbBAVhUEyaZgbnxOSvzHcYBjZ00en4oJnkbzLn
	 bE0Ua4c3BOmYhy/ANzmZTrJMw7nT9u4w6F0vuYzGysTs4OO4gP2PXuNs1NcO8+pv/Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=VF4uxDpv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.116
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020116.outbound.protection.outlook.com [52.101.195.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB44606A325
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 14:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB44606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=VF4uxDpv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op9fjY4EVvnmeQP5eT3jY+e27K2x0ltqTzAfWHbStDXXBnNflh4aQatPNc+WNDaJjAU2v5+7wSe+vGeKwEt27m2cw5oWq1l0pw47MwNizUswvjwQK+FK602US+uUjP2yKOe+7om9OwcG1IPLVJoof803AHwgCoXhxHkkYppWa77mSWf3DOUaf5+PlCkfpZF81ffGj0ScnG0LLmVoHicONx2h0POQirYyhe5ciYKkvzBddyqmOHbnUcS7EuHBUH41jLuYCfHHnzIh6+q7P5C2Nx997YJpsW2qivqCyiOc1sn6lKuHMZVZfV3ilYqkdYt0oKzyIwbtYKF8In5VwHAfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yPawa30pMZm+m+1HYk9uQ8u/Pr25MPacJvADJ3uVwg=;
 b=sr1aJ6K1vbOxi/8wRaq9DEsFfESA5DPWQ1BrdNlg5bCT1dM2RhR6p3luOczT42pb2R5796VACfJCgP6ITgRNZKXgX8p2CiGUx0CNlRZfWv9eoYbleHNAbzod1Gly6Qfc2dliv8V5Bv/xbs8h6o0Y2bLkoN805+98g27HWoqVk8QGj09/65xH7uSlFHiMMEinWnFrCMACuNeypyLPEPU92sVcnf/VOAwlbTKg79Qoq2PZYfI/mExCHftkcMWa6HTU4ZZt08aTIcfi4vGCAiuFc29cCuPEj4zx+PnRuv0YyO1iUqUmSLRq4PO90JjAcRRnpOzwgUkvwqOnpPVuzJth1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yPawa30pMZm+m+1HYk9uQ8u/Pr25MPacJvADJ3uVwg=;
 b=VF4uxDpv5akR0Tin7Ru7NFhLRO0rwbBWGl+SYpDU48HLwIRGYa29PZr13xqsdAcbTlKc2FmwImEIGRXwaMUmr7lHTQp8hJjRL698ReAWlh4rct0sra2BjdhEHS7x/wvwj4fN1baM6M5ukhJ30aH1FyA0LMGVDtTeMUxuKKjpSHE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO6P265MB5950.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:37:18 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 14:37:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 14:37:17 +0000
Message-Id: <DMZ9I1E2XDQ7.3F0NFO0VNO0BU@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Tejun Heo" <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>
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
Subject: Re: [PATCH v4 1/5] rust: workqueue: support stack-allocated work
 items
X-Mailer: aerc 0.22.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-1-707c68994940@google.com>
In-Reply-To: <20261119-rust-workqueue-v4-1-707c68994940@google.com>
X-ClientProxiedBy: LO4P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::7) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO6P265MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: c209c0df-c22e-4721-d6ea-08df464a9cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|7416014|22082099003|18002099003|6133799003|56012099006|4143699003|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Kl9LcNsn5DWjh/qbblxy3vaL658SYLCc748o9akmd0H/6zHafdDb1lyN4XtXRJYEGsh4JJtUm0k8I+SYrxiASHNeXG6aZP43nuj2EufNJKQtzKUN0tXE5FeFxANRTNX4WFZC8V1JFz6iUyoq9358J3JCsxhTyKxOOJJ/72aUwq7nSZ6g1iUmBTFdEsdQ8bR0b1NIPmwIgQjzBDXd59ex/35/UeNDX/gwEIyLx0fb/J3Wt4fv3NYSZIx0To8rtCEBPYS6+N9tQ4TCu/WEDBdg2rERcVcL2pfZYSTgmeAQGxuKaODxoPdb9C0A9SjtmBsBmm4moxy4nsmiyc6ey8O2BD00OJDopLpBpfU3CSPw37RGvPxM6eDlTHfjrgg3Epp8onbYfUQFxVxEAv1mMjDY50r5nTRd/SzrVnoXmp2tJgC6W2IxQtkD9Z7rRiHUZ1fCP0P39iSzc5+FSgr/C+ePc8miYLPdHcOhbOmGm3rJSWui03OgPTqtFX+a0tUWBOBzS5o+TKwo5rH9hRusmI5+gwiqE2WgYcpGdONUH8ZndE+TlkLsivYwfeHPlgLtH1sMye4i2SKcHX1JmImVoewa0oAHSvoBc6CHnin2v4ufbIneU9Vm4DZB/AaiENDqPPjN2DhcOs0ZgdS0TlFQKtskeAn0Q1D+usxzZnT7C2mFqfw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWxIYTNmcFdadVFySDkwMXFFQ0NVY2RDSzBFTU5BblBmcEdaUnRYZktvdXJo?=
 =?utf-8?B?VG9HSUwxcWdxOVZFNUdPZk5MdDNKOTF2Vkhsc0JQeE9lTWhmbEFKZGJFL1ZF?=
 =?utf-8?B?czRyRlo0aTFGNVMxallGZkZkdHd2cVhaNTNqU0dyaEplTVBZM0pPY2dORjFy?=
 =?utf-8?B?NVl3WUQyeGkzL2w1QXRLSzkzRDJGVGZ2RnF6Y0pNTk9Ga2pZeC94VTJ3ZVBj?=
 =?utf-8?B?SVcybXZiSEk0UXNEOHpPeFVLOVF0TkpQdHB5bG5DU2ZiT3g0NVJ6NFU0eDV3?=
 =?utf-8?B?djdPSXhnQndUTCtsRGs0UmJ6bEZzOHhSUExzS0ZMMVRONEZJM2NWN0VTNFNX?=
 =?utf-8?B?SVhaNDZndjhKOW9Wb2ZRd3BIa094Y1FudVFUanRTSUFWbmI1TUd4MUQyaDJU?=
 =?utf-8?B?NmFicnNCVno0cWNSOGkrZFhYWmhRMFluVHZ0OG9WSVduVjZmSzdxTlFSYm10?=
 =?utf-8?B?aGJ2dDBIR08zZUlWeGIxMFp5Vk1nTXh4aHVqaUY3WGxvTGdER2FaSGM4TGpF?=
 =?utf-8?B?UitFWXRtRC9qd1E2MnE0T2RHYk0rSVRxZGUrN0lGMXRic0tUQnUwVDlMRFRn?=
 =?utf-8?B?T0RXTkNxMWN2UWxtWk9yWVBQTGlKdUsxVzRjQ2crOFp0TGI3UFJCc0dkZWNH?=
 =?utf-8?B?c0xjVmdYbTJxalpWMys4cHlxNkd1K1d1bXZwV3VZVUQ2VkNtYlVMVGtheWt1?=
 =?utf-8?B?TDF2akZTbkFWMFg4Z0tiWWVqdE5NUXZpSzBpbVNSdXNLeVV5RWNzaFhKaS83?=
 =?utf-8?B?RU4vTTlYbWltZHBuYzRuOFBDY2tsK2Zwei9pcVQ1WW1kZ1pCbHBnL284b24v?=
 =?utf-8?B?c3lseVYrdXI5UWJ4QytRSG5VNmhKenJ2eUJxbVRyS09jZTk3bHhDd2s5UnR1?=
 =?utf-8?B?bGhqZjhjbUxRR1BUbDBoK1l2ckxhWXlKT09pVXNKM0dCNnA0OUorbkFuQ1pt?=
 =?utf-8?B?K1hNWlFFaE1VcEFnRlBIcjlYb25uckFLYzcvQVlqbC9BYnlXOUZ6RWVxWUVM?=
 =?utf-8?B?ZVJKZmlmVkk5S0hNSHRQN3R1SEFtRDhxV1ZmRFhraHBRMkF4VEtjMm0walFD?=
 =?utf-8?B?ejJEYVpVWktSVGNxL1pCSWFGczZjb2ZJSlk2dXp5eU5qVWRqb1RnNmloOU5w?=
 =?utf-8?B?Vk9VNHQrVWNxTkQ4SVJMUVFMVUgrM2N6U2toOTVtY0RmMHpWUVFxd2ZnaHly?=
 =?utf-8?B?clhKalZ3VmRLVjM3dEpnL0FseU1jUVdVVG9JZVFaYWN1QlZkejJPZjVoNGdL?=
 =?utf-8?B?UUxhSVRLaG02aXJCZVhuVlAwWjNCUHNzVjFDNEFWYm51a2xSbGZTUmVkOVZ2?=
 =?utf-8?B?aWc2OENxWGNkY3NTcDJLK3R0dmp6QW5qSUdkb2lOWld4Vyszc0tydlo2S1Iz?=
 =?utf-8?B?YnNKUzV0MTY1TWoxQ2NIdUUwRDVUOHVJbnQ3V3Z1MGJjNUFubjBDalZJK2tU?=
 =?utf-8?B?V1BWT1hHNjg4dGtMQ0RXRnhLMnFCYlYwSnlGaEx3b0U3WGlOaVpGUlMvejNP?=
 =?utf-8?B?NjhNSkRRQ1BQNW04dFlTazQ5cEZ6MTBSR01XWE5MTHMyZ3ptY3J1clNHamo0?=
 =?utf-8?B?VVFtK3pBdUk5N1VNNmtjbVdOMXdiaFUyNEV6NzZ4clZZNzZWUnE1WG9jR2lK?=
 =?utf-8?B?Rk9RYUlteUx0RFQzblQ5Ny9iRU1hK3RtUkdHSnRGNGE3WUdIanVkd0VXTW5R?=
 =?utf-8?B?aUJsNm5ZQXZ6WHQrZW9sN0poR0lXZU9NYWdQV3EvQWs5QUhnd1A1b21pU0gw?=
 =?utf-8?B?OUlMOTZuaUd0cUhVYkF3YzloaFU5Rk9keXZQMWdNUmJEVWNjbTBBQWo4SzdK?=
 =?utf-8?B?cHNTK1BVaWlUd0ErR3Y4VzdVMXM5elR6ZXhuRzFIU1F3N1JLcjhvL3ZnVVU3?=
 =?utf-8?B?WE9NL0NqWE5xK1hKTUl4bFREd29HVHczVDEzQkJiQzVWTmdyK2hwejcyQVd3?=
 =?utf-8?B?UVFsaWtPK2tqcms5bmIwVWNxcVFQNi90MnVHVzVWTjA5WGF4aEx6emxHYkRE?=
 =?utf-8?B?ZmZhaDFGQzE5TkMyUnJ2YmtaNGJlS1p5dk5GRGZpWlZnaFI4MnNCckNaQjNF?=
 =?utf-8?B?UGVVZWtVNnlObUJQY1hSODZMbWJtUkl6SHZhSCtaSWVaRnprdGVBVm1LampR?=
 =?utf-8?B?aHNiOFU1Y2pMQ2p1T1VVdUlNNmV5cVB1VCtKZkxHWnBEdVZ6RHoyWHhseUhX?=
 =?utf-8?B?WDZSSTRXVm1rSURydnJWN1FpNk1PK0NUK3d3QXZ6bWR5WG0rL3VlOUxUa1pP?=
 =?utf-8?B?WmV2UVJwTnlGRGRZVDVvTHJYOGFFQWt0aW42bVBPUk1WMTF3UDZxbWIrblVk?=
 =?utf-8?B?UFBrUUdmKzNNZWlMQ1hOQ2ZoQmhYRU4yMUd2dTMrZHlMWXh6K0JYQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c209c0df-c22e-4721-d6ea-08df464a9cef
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:37:18.5671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFWQcnpQ6D1v7KMMKuvck6x2SN4umtl0+AAQquZtWkTBGQWGVDqFyLYN2x24fETa6jmket1fX07hhhJV2fjfMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5950

On Thu Nov 19, 2026 at 2:12 PM GMT, Alice Ryhl wrote:
> Pass `object_is_on_stack(work)` to `__init_work()` in
> `rust_helper_init_work_with_key()` instead of taking an explicit
> `onstack` parameter, and call `destroy_work_on_stack()` when `Work` is
> dropped. This ensures `CONFIG_DEBUG_OBJECTS_WORK` properly tracks and
> cleans up stack-allocated work items without requiring separate
> constructors.
>
> Fixes: 7324b88975c5 ("rust: workqueue: add helper for defining work_struc=
t fields")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/workqueue.c |  9 +++++++--
>  rust/kernel/workqueue.rs | 13 ++++++++++---
>  2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
> index ce1c3a5b2150..337382acfbf5 100644
> --- a/rust/helpers/workqueue.c
> +++ b/rust/helpers/workqueue.c
> @@ -1,16 +1,21 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> +#include <linux/sched/task_stack.h>
>  #include <linux/workqueue.h>
> =20
>  __rust_helper void rust_helper_init_work_with_key(struct work_struct *wo=
rk,
>  						  work_func_t func,
> -						  bool onstack,
>  						  const char *name,
>  						  struct lock_class_key *key)
>  {
> -	__init_work(work, onstack);
> +	__init_work(work, object_is_on_stack(work));

Is this fully optimized out if !CONFIG_DEBUG_OBJECTS_WORK?

Best,
Gary

>  	work->data =3D (atomic_long_t)WORK_DATA_INIT();
>  	lockdep_init_map(&work->lockdep_map, name, key, 0);
>  	INIT_LIST_HEAD(&work->entry);
>  	work->func =3D func;
>  }
> +
> +__rust_helper void rust_helper_destroy_work_on_stack(struct work_struct =
*work)
> +{
> +	destroy_work_on_stack(work);
> +}
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index a872f9fffb90..6eb6c40138f2 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -481,7 +481,7 @@ pub trait WorkItem<const ID: u64 =3D 0> {
>  /// This is a helper type used to associate a `work_struct` with the [`W=
orkItem`] that uses it.
>  ///
>  /// [`run`]: WorkItemPointer::run
> -#[pin_data]
> +#[pin_data(PinnedDrop)]
>  #[repr(transparent)]
>  pub struct Work<T: ?Sized, const ID: u64 =3D 0> {
>      #[pin]
> @@ -513,7 +513,6 @@ pub fn new(name: &'static CStr, key: Pin<&'static Loc=
kClassKey>) -> impl PinInit
>                      bindings::init_work_with_key(
>                          slot,
>                          Some(T::Pointer::run),
> -                        false,
>                          name.as_char_ptr(),
>                          key.as_ptr(),
>                      )
> @@ -539,6 +538,15 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bind=
ings::work_struct {
>      }
>  }
> =20
> +#[pinned_drop]
> +impl<T: ?Sized, const ID: u64> PinnedDrop for Work<T, ID> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: `self.work.get()` points to a valid `work_struct` ini=
tialized in `Work::new`,
> +        // and the work item is not currently queued because `Self` is b=
eing dropped.
> +        unsafe { bindings::destroy_work_on_stack(self.work.get()) }
> +    }
> +}
> +
>  /// Declares that a type contains a [`Work<T, ID>`].
>  ///
>  /// The intended way of using this trait is via the [`impl_has_work!`] m=
acro. You can use the macro
> @@ -686,7 +694,6 @@ pub fn new(
>                      bindings::init_work_with_key(
>                          core::ptr::addr_of_mut!((*slot).work),
>                          Some(T::Pointer::run),
> -                        false,
>                          work_name.as_char_ptr(),
>                          work_key.as_ptr(),
>                      )


