Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.115
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795626577;
	b=H7e+UDvXjcxYq3zJX0TgHzrBDHse3d0ATm421RlT+xLbzls8V6HTWcuL0UMEHxVPiKkL
	 a1ThT1IXADxGrvqC4KuEqNKqcszLChrZOQx9RHbPAPWSCo1SJCXp+j6QD5HGEs93Ia1fB
	 gSj6PQaCX+O+vRNaUYb1fTAxHP8WTf5baSXcoyQGVyr40yobsvoEKJQUSbgJgF6ky3wFJ
	 Sx+Im9sPrsKocsyTsQixBpEChRPLDRaEDQcFtD5XWABRAoFr5Opa8/auR4tUZj1+XjdX1
	 f1VBkO1hde0ebtAT3UWKnrsigYJJp/EOFDPxqiNnlEcZW1HgBz/EPicpbtatVjeHyoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626577;
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
	bh=vjGl7KkarS9xXV/eoPfJ16pLIS+oo75B1VI53zpQUn0=;
	b=dg/iVigcJ7wSnU23KRGeeLX8f8Oo3E5GDF0IsjIphB0GX0zlSUMxB9AlmO9d4j3dqqOm
	 2NciT8xqtS0QT5tniDMY4RxqGg8e28JTY2CWiKmmKmHV9p6/KuSfiLEibgppxJRNFzIBv
	 CbrpsOdN2Lu72HXnA296+2GOkrLzPHVoaTaNI/AA8h61Rx7w68RhfxY9U3j5U+eHoyxFU
	 TX7WxFufazJv5LtdBmmWOJSu7er4nqAIJtGaLDeIC+RsmfJ3odRkM+n50cXlq7KLbD59r
	 L7XrW6IuUa24xP8e4RD4W4esKh/GUWUYGpOepK879UmO/yhr9M70DGPdvPi6TnVbTcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=UMBaqIXa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.115
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020115.outbound.protection.outlook.com [52.101.195.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A61A606A335
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 17:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A61A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=UMBaqIXa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jq5UTY5WHhc3tY2n6sf7hTN9Tsdatupgr5ARbXU34Y19Gp8CrAqynx4hdL6uGt0Z1DgqcwZEW0ZoY9q6aQOAyqZvwroc6pX9UkM4reZYW3QY/33M8fkQ99/Nk2PEYgdsHcckxcwLpnOkgc02fulrBITP8OCRlDMQmhzCUfDh+6wCEajz87AvxtNg1wP8gkNCCC2a1BwBIiVOoSDPWq7J7TJC8DB/G4N+YnW0nrdFM5fu279HTctxGCwKp7Cv25GIGqz9kbGgNcI5rm0bIKsbY4BzIASbtewhnkiqMgIkCUjZ6fcOaeMLiXUnMPqN6QmGLnaLKuOabSm/d+A/5R3F1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjGl7KkarS9xXV/eoPfJ16pLIS+oo75B1VI53zpQUn0=;
 b=oaBxZZfxk7JDUukEPhHwAjZ6K5GMidFdix5kcKctkPjtUpcdxKI/6Nyommizs9Mf08cZnRyL1gQyhjeeHjWef02YmckKsb1iGt1xc2e+NMb4xJIOSY0ZtDxs2zgz9PXkZwquS5DXfXF2gTUi3FWs8S1qaBU79QtJt+wwlw/G305EKodR96QriCmlG3KU7OCKxxux+4tArHABqUdYVcDrroDtz4LGfplBKGgsell1Qn7dcgkcd9fZVLhg1xDTrYT9hIyE2NOkMCgeMJwOuFBjVVUBR39DV9qmZnXxH4AFZ8uayWnSJYuPXIrweoLfwElpQXx5KWudhia8vdvILAjlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjGl7KkarS9xXV/eoPfJ16pLIS+oo75B1VI53zpQUn0=;
 b=UMBaqIXaWzLq1H1ce+8zHQnvxJ6E5T4W+k+aIUPglG+Nifoaif6bPe3Qi+XFwuhi4vmyFHHwhVb0MjYLzN/mkm90MnwkeAAkDYWIi2t0cvfBBv9MAbAkT2ae7aIyfJMz7T8BgAJnUgIH2E6be+V6tEbLska9gWm/MFZkBGAsyOo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CW1P265MB8411.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 17:09:28 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:09:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 17:09:27 +0000
Message-Id: <DN4GHTBW875I.1I5XBLY7M57HX@garyguo.net>
To: "Tejun Heo" <tj@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>
Cc: "Lai Jiangshan" <jiangshanlai@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "John Hubbard" <jhubbard@nvidia.com>, "Philipp
 Stanner" <phasta@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>
Subject: Re: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static
 work items
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-5-707c68994940@google.com>
 <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
In-Reply-To: <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
X-ClientProxiedBy: LO4P123CA0120.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::17) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: e6407787-55e4-46f2-42e8-08df4b16dd4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|7416014|376014|366016|18002099003|22082099003|6133799003|10067099003|56012099006|4143699003|261102123227099003|261028144727099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	rkTYIeJa3X2x/BDp9pAr0+4VVE2oAZaF/VPhSSifJb+AXAs1w0jJIzarAUKn2esJKDSU4aa1Cr2Uy1GUarS9c2fXa7YxmkU/1mD9u6iuUvUaUG8452HASQuHID5rGKKmRpYuKbk0VbvwjsxWmOxdIh5n4hj3H5lDS/buCYHK2D9KvW09II1gkS+9XJghWZEcOPsPy4CxGUVjb3m8TmV81VyZ3nQMnSU8gyRtfy5kTK7MKblABwlgfwivMZaZEMCEG7/ruspwy1DPdgkhIo5K4VeIP4FKrv1jc9nEZMRvnvJT/k0EudBcnx84Zhj24STjxlyOHMFnivgplWcPEg43yJJNxG3Y4AwhU6ae1gKYXDLsquhnbidx7xbUrFeaXkJIFOpXETscaR/HOYYJ97Irj8S0oeTLD9Tnbvskgod8bcthOO9IsyGTafLffQ3J+6c8uXwNCgrfX/1xf8DUDGpXB1oi6tGOxJJyiGlb7j7r4fT76VUGiBh2KO4EvAMYpk/giNO6oeQStlnq8w5DFuuOXLXHhySzAmkGJ+Rz/yuQV7zHStIlpelb1TQ/ixpjLY9kJgsDAMBHn/YpSx1tiHGxl+XGcoSUY7sAtBXPBrQgAoKzdYzqRbzLJOgc2TD2kIQAh4lbGtJ9j0QCtJ46gZWPotPaMVQ3lTQNPPSaKO0tFqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(7416014)(376014)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(56012099006)(4143699003)(261102123227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGdhWkhBTVJSczZqa1ZBaDZnTEhaL2RyMUFESEMxcVpuU1VJcHVrTmFLUENY?=
 =?utf-8?B?blczRU9RQ2hleUdxbi9SYlNIVzJuakI4VUVyRHZZdDNmSGVQTVpLbmJ3Y0hR?=
 =?utf-8?B?eUtkaHRSSTZJU2NXU0wrV3BhdWlBQnNXQVZES211dGlzN2NhSndZRzc1Nmpm?=
 =?utf-8?B?VlE0ZGsvM0prcFFRWVZHWUx4T2svWDl0cFdlVWhLUlhZUFhiNE5JUGZtckY3?=
 =?utf-8?B?WktybmJjU1lLQWluMUpHYmlvOEdtOXhqT3NvRklYQmIzQjgzTmVUYWtmeHpD?=
 =?utf-8?B?ZDdQMmNxcFJZNU01Rm1ucHJUMFlHMFk4QmFQbmpNN1lLZ1V3R2xJK1ZHV1Rn?=
 =?utf-8?B?MjZNL0p6Vy9pVUZZSFZqT2hhd1NHNG5sUEZ3Q0lVKzExUXdjTjRBcWJ4OG5k?=
 =?utf-8?B?VUNDSDhKekdScFQyT2E2OFIvWm9pTUNEcm1DU3Jrbjd3bzVWb3ZjdGpFdzBn?=
 =?utf-8?B?bHcxbkJqOXpaS2Ywakg3NTRIc0VoMVkwRTljTnVnMGhucFZHMktFcVlvM2VC?=
 =?utf-8?B?dFVGZ2g5SFBIY0xOTnJyOUVEa0N1V1FuNmNkclBvWFQzaFlkQnFhMy8zTU9O?=
 =?utf-8?B?d2F1K2JVL2I5ZURqWUNFa2pSVkJ3ZGN1MmlOV2hlRzRzaGpxbkZQVnN0NWl3?=
 =?utf-8?B?YjZVYnVIbmRHYzhUNmp6eGNnd2xhOHFuaUg1WVVDUEN2WEdZTytoYWF0VUE1?=
 =?utf-8?B?ZUpJRUxCWEY3Q3lPczEwTlI3ZmNIWkdZQ3Z1VDFJOGdnN1V1bE9CRHMxWFpl?=
 =?utf-8?B?Q2NBNWdQa2lFNlhYUUFiZy9CRWlpTkR4UlE0Z2x5My9EWU1hT202anBwM25F?=
 =?utf-8?B?ZDJMUGhnSDFIT0t3NEZMNzhyelZYdmR1dXNuNVZSVGpvbHF3NmNtSUlyc01s?=
 =?utf-8?B?UmN1Z1VmbTdjaW1TaFIvREVHTFJsTXQ5ajRMVFZHRkFCOVF0U0w1Q2cyM0VB?=
 =?utf-8?B?YmIxRkNhQ3VqbFNsSUdXNUkyUUY2QTFSOHJ2UHBTQ0tNTThyOENGbmxEbWpP?=
 =?utf-8?B?Q1huOTU3L0hzS1djTW51ZEthSW5ydlpvOGZaZ0hrd2orWFNMUDB6NmxGZXBy?=
 =?utf-8?B?Y3ZzNUFvNFlOczh6Z2dwVjhLWThPdURyRHJKZlcvRTh1a3FYMlRzaWZMVnFN?=
 =?utf-8?B?aU9Qdk05cGxjRERzQjJxQkR5TkdRVkV5ZjZkb205RmFMdzhzalZPMVgrUTNq?=
 =?utf-8?B?ZU00TlFpQzV0WE5hbThqQUpjaFZrWmtTNndkS091RGFYbDF3cEdjQlVjeUdp?=
 =?utf-8?B?a0VLN3NOdU1hTGxzU1lZUm9QeEFzYm95L0k1eUhuWWl6V1FoVzdncStTTlR3?=
 =?utf-8?B?Q2ZjY1VsRHMrclZYZjB0dTJ0QlU5cWJYdW1vS0JyM1NKdXBUdVVYM2hIaWpK?=
 =?utf-8?B?amU3dXBHdjVUNzBzTWFpNVpsaGpvOWo2VXMwMWc0Q1hsZnd6YkFtcTBodEYv?=
 =?utf-8?B?djR4M01YK2NoYUQwOFVTOW9tWUdZNXNFdGNHMVpyNEh6bzVUbUFqUSs4NEpN?=
 =?utf-8?B?QXRYYUd5Zm12a2xiT0lOYVhZNkN3V3g2Mjh5WDAvLzJHYVVLdkhXWUsrYmlQ?=
 =?utf-8?B?UzBlUXdrZHU0Y2lLVXR6OWZLMlZwNEpyOHdxSGxCMjBDZzB4WEpsVzJkQVY3?=
 =?utf-8?B?VEN6NGM1N0hVaitvK2h4b292Wkl0SmQreEVVTURic2ZhNVpVY1JQdWxsQndO?=
 =?utf-8?B?d3l4UEtwd21OMmhjQW9wRTlSTDc4emhVOU5aN3lmQ2RjVGtBcFhUVG53dDZM?=
 =?utf-8?B?VElaak5zU081U3hiZ200enpacWNLTzFobTFwdVEwVEY1S3N2TG0rS25MNHUz?=
 =?utf-8?B?bkdOS1UySmRXT2VkQ2pFZ04yb0lNSmtwOXV2UUtZT1FXcDZxWlU5WGx3MERR?=
 =?utf-8?B?RWg4MklJamUwTWJIQTNyZ0IwbXI0WUtTdGFIWUxhK2I3TExUdVcrNEVjeXI1?=
 =?utf-8?B?WUp6Zmxzd1UrYnA1R2YzdTJSRjhaSDBHalpPaGtoYjVTRnNRQ3k4cmtrRU9U?=
 =?utf-8?B?ZG16S2U1bDQ4MGtsV01MVHNMaldzaGlWTi9pL0xJVkd6N1FobEZkbDQyUU0z?=
 =?utf-8?B?VkNCUUtiTUlUSCtTa2lKTjg2aE9Lc2s5VDMvWUR4azFaVjNVa2tlbzM5SFQ0?=
 =?utf-8?B?WlZuMFpTTWhYZUJORkRBN2VqTVRNYzd1ZlppL2JWUnBFcmVYNElQYTlzZlVw?=
 =?utf-8?B?MFRQOG1SaTZqL1Urd05LZTZCVnY2ejRnbG05b3VZVnRiUjFZdmxLRlRFM1hl?=
 =?utf-8?B?QndackVEODNYVUJlRUxQRmlGVnZxeG93WW5ZcVRiTmgzYW1md2pLTGljL0Mx?=
 =?utf-8?B?cEZMbzJSSm5MdFZzeW9TMVpaV1k3dXpoOHVDOG8yaDN5NWhTVnJmQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e6407787-55e4-46f2-42e8-08df4b16dd4b
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:09:28.5839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ei72amIaoY8D66I/oKrFD4oxPiQxMYLxb2Bc8jQhypIgIXc0BwbXFt3GuDrz1GLtQlB6Q9VUsIzaj6wXFELZWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8411

On Wed Nov 25, 2026 at 4:44 PM GMT, Tejun Heo wrote:
> Hello, Alice.
>
> On Thu, Nov 19, 2026 at 02:12:46PM +0000, Alice Ryhl wrote:
>> Because the cancellation guarantee only holds if the destructor runs
>> before the bound Queue or any lifetime in T expires, ScopedWork::new()
>> (and thus new_scoped_work!) is unsafe and requires that the resulting
>> value is never forgotten and is dropped before 'wq or T's lifetimes end.
>
> I'm no Rust expert, so maybe this is me thinking too much in C, but
> requiring the compiler to understand and enforce that a workqueue outlive=
s
> its scoped work items doesn't seem very convenient to use. Wouldn't it be
> easier to package e.g. a percpu refcnt with the workqueue, have each scop=
ed
> work item hold a reference from creation to destruction, and make
> destroy_workqueue() keep draining until the count reaches zero?

The workqueue outliving scoped work is actually already enforced by the Rus=
t
compiler, however Rust provides no guarantted destructor execution (say if =
you
construct the ScopedWork on a reference counted container and somehow leake=
d a
reference count).

Even in such cases, Rust lifetime will still make sure no external code wil=
l be
able to reference the leaked objects -- however, for work item a callback c=
an
fire and access itself, hence we need this guarantee.

Adding a reference count to the workqueue solves the issue of work item
accessing the workqueue from its callback, however it is not sufficient, as=
 the
workqueue may reference a device resource, and in such cases it captures a
lifetime of the device being bound. This lifetime cannot be reference count=
ed as
when the device is unbound, the resources are gone and it's not permitted t=
o use
reference counting to keep it alive.

So we still need the guaranteed destructor execution guarantee and referenc=
e
counting wq alone is not sufficient to remove this safety requirement.

Best,
Gary
