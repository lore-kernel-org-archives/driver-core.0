Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625792;
	b=UU3xngV8f3UPI67AkyDI0M4qvexUrluYfMr2mODnjuopqoKS9f5YfTEly5QTbgb3rFqd
	 DQpIQP5CMQjZRIMAYsCB+o896HRscGAXHT/MP662PWqpz1t74PdiGdMEYM5fNS7pi8aD0
	 4djmfRM7Ze1j35jVfLBZPkOOEUSOG4ImJ8z9yqvAzSvz0xPK3YXe60Q1cquJzdZ1VP8nG
	 +eEn/2i5UZKdojvv6rpHjqOwTCzFnahs4qAxzqf6Y2spItPuKOGnxMMeTfsVEVaSm3OxI
	 Yci1EmEJvekoTHvFdCL7UXIOOF4BsZGu8t+sZ8pe+dP3QO5vrOn0Fs3G4Eu65aMgFnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625792;
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
	bh=lo2YREYBp2oAuMTjVpEz5NoJPa1ojqEjriRXH0iNnjQ=;
	b=fhSbrYfHiE3RjZunEATnBfWXZ9BTFiYBlc2llslZVbb0csd2dB+lm+PTeju3hh1/6BJC
	 XJVGxCr1v/mAc9bSAo+EXiz2ga1GMqEIngR5MBdbznso4vtyGnpovsb7cRkAxtgddDuNx
	 DRWY/P5sutydd3QL8siKfkpdCu/mJT27Jeu1KBtnyK+RvHG3r5rWCdOkR8SA3Mo0NWnqy
	 Gpcti56pctY1HLS5zbcbZwcys445Tfxke98bueG6+LfCBoqyNNpLHxSXq93tFLUP4hAzT
	 36eV/9NBPsQs5h1Dvgi/j5H3D6MZlfddJ5Uq7Aj4k2ND4icGjn28wG7chX0Pc9k7pmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=PCFa5i5I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.136
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022136.outbound.protection.outlook.com [52.101.96.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403C606A330
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 16:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6403C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=PCFa5i5I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8Q2AlVVOCWKd0oIKYHfsHNAIXkDx7HqkMeSOAVYFEqv/4bd8m2+6iFjKDluqRo8FUFJNOyBjIAZiETMVopWjHSru58yEADZJYs3klaG+dF57qer6r6myvz/nc9Z3wiiDmAjZTMvpSJiOrZgCtkz/HhOfC05i1TzUxC4yBRx7MFPlZEfDyOGuqz5WsJR733tJ8TzCJC7GxHB8LxFFiGfZ1Im+8/m4c7BCC5RUAevgIpAZfshD4N7QzSgh6wNZZhWUR1UR4uHqbm7Nnrd8vjyztNRowwZkXDYNEhPbtW9OdO6LgP26rwVtDNykaUNAMvzadMjhzXWFLWyhB08prOvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lo2YREYBp2oAuMTjVpEz5NoJPa1ojqEjriRXH0iNnjQ=;
 b=npWkijD+x3ud6wyUiZxk2UzbY7CgnAPrp8gqkKI99nygo2ahmjWlGbR8naIYULolKQqpDy3LpgS8KAulHfHMwsDEfwiyogR04/D0T3e4lSr8Z8IiUa2bt6pXiS2KEhrfkT5l7C4/osPaHYIbfpbmNusF3+bFtM4r+A8RgfGLP3GbGjP4s7m8D2HqjSTopNKAnDyhmhXH3CYGb9K+n2fVcXx29eX6xHhOYL07MxP5pzeLso7VcLM9/EvxKHcVuLnn1uGTwbPIDkk1PCqV8NL6nbUDJ6Ho8SIxVuxaD+2HJ1Bahg4bqf4ycI0t9Ut3DlJfbCVz94GPAQbZnxJAd1yDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lo2YREYBp2oAuMTjVpEz5NoJPa1ojqEjriRXH0iNnjQ=;
 b=PCFa5i5ImStVD/sYfdtv3IHAU0zlzIgaeDV8vMwrqndU1lzDy8FpgBbSQo9KLnLoc9mop9Z9upFouJuCnjZjKNjW8zIHK/2W+pRjTvT39BiIZD63Hm4HXehMzNhFb7kK4ysXYHNqSBLn8G8kIWo560eQvg8XT+EHsu4nHfWClbw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CW1P265MB625033.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 16:56:29 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 16:56:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 16:56:28 +0000
Message-Id: <DN4G7VBIPADT.1IGDA1MWO9OCG@garyguo.net>
Cc: "Tejun Heo" <tj@kernel.org>, "Lai Jiangshan" <jiangshanlai@gmail.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
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
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-1-707c68994940@google.com>
 <DMZ9I1E2XDQ7.3F0NFO0VNO0BU@garyguo.net>
 <20261119151717.682282-1-aliceryhl@google.com>
In-Reply-To: <20261119151717.682282-1-aliceryhl@google.com>
X-ClientProxiedBy: LO4P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::13) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: fe9126a2-da30-461f-35d5-08df4b150cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|7416014|376014|1800799024|18002099003|22082099003|4143699003|261009223027099003|56012099006|10067099003|261026140227099003|261022105027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	LomJd8yXkfbBPc/EHQS/86KXWJ3WslRsCDYwQ8X1jdlTltbU2ZNuKTKZuC5Taa5RT8o1Z1yHRNUp866kTIb1A+3OUNDpAsWP3FYqi098XMiLOUW34hhTiD6eYd0Xnnwih5ttf021Xfzzl1HYb9Jk3wqbJhWio2KkV1UkhCEWAXz6aI28Pgdj8Qy2R/1UBneKPyqoCxOC16Pkk2i5OWPxM9hmbeSfGATKRuZa4KY/jSFbqHqFJqToIMpqFAUvkmbuxn5vDHyMchdieYzZ9/9w7T6fAOv6Z942s2f55qbNKKeiXfWrwbJZAj2hcUH4uf0kUNBaSG9jJ0VpqcOFIMkElBQ/RQDq8PhS4PJ/r9xOZr9r6bV1CY8Yer9GBRX7ijS2TUFqyy9enc5Gi6F40Ug81b7ATDeCC7g9ZAlbq11/HVJDH6h+BO+gTYVwsZWf2NRKWq1dPOYhCtB1fHHj02TwT2RsIgCvHTuBfu6tYPDP6xcmQ7BCFYufW1WrD/0u8KFY/QYsMeLn7LPzof2vMilGfNbtdfApM8rBPPboVULZGr6K6OX2J/3bvKVzBlPpFqZdQRE+3SprCLefqGQNg9e7zMbGP8GNqJGrOLuy80RyVs98pI5AQWVGJBIxqNG6qwRzVL4i6c9ujVfD6QuHNphtVv4c4cG1q9oaRyZ/sNW1avw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(7416014)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(261009223027099003)(56012099006)(10067099003)(261026140227099003)(261022105027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clg2MFZ5QklFWmt5T2owMXlWWU9GSnlTNXNiOWtTalF0RUdjUlFCejYycTlE?=
 =?utf-8?B?bi9vQXErVjF1UXZsejdXd0FkSUtkMGxMekRzeFM0YU9PSmZvK2NDRjBZVkdy?=
 =?utf-8?B?Z3Q0Qzd2NGZRRk82dllzRit6eUJGaHQ0akZXU3BldHA2ajRuWGRlUGtSeFlx?=
 =?utf-8?B?cDZDZlNGZWtWcUlzREdXTXJwSmRuU3FlNFdoejFaK1kwQ09yRXN4TlhMYlJO?=
 =?utf-8?B?M1prMzdCRis0d1pMVkwrc0ZhK3c5bVQxNkVIM0ZBanhFbG56SkIzVS9BUDlT?=
 =?utf-8?B?MkR4NlBBT3ZnYUdQT0FlZUZxNnpZNklrNjNDcDlBeFdNdE41U2ZUQVU4ZDVv?=
 =?utf-8?B?NjE3RHQ1UEZ2LzdOY2ovZVhkV0s1UXFpYktPRHRSRUlpUTg1R3hhKy9Ibisy?=
 =?utf-8?B?eG5pM3Q0bXBreTcyNGplSy9jY3ZmVkR0UjFMNjkxcWZaT1k5QkcrdUlkbk5t?=
 =?utf-8?B?TFdDWDhDbVEreDdYWDR3RzZvTldyVG9RRVZ4V24vdlZaNVBQbXJ3TXB5S1Mx?=
 =?utf-8?B?TUdHQU5BMVlDK29rUGRHM2pjd011cGc2TGFEQ09jWmlOMzJaZkFjRGpBY3Fy?=
 =?utf-8?B?RmUwdkJrNUc2S0NxTmJxVkFyREU0YlAyNlkzaUREblcxZFIrTmxVcXF0SE9k?=
 =?utf-8?B?UjFoUDRncU5EeWZLMnUyM3dkNXpHdFYyQ3pTZkcwZG5sNVkvQnQ4YVJWU2s0?=
 =?utf-8?B?OUlHT3dyUmMvOXVDbm9UQzFDZStDbWJDc3J5MU9DbGYxd3ZYRDJnTmZZalM5?=
 =?utf-8?B?eExqMDZOY2ZWUHlxYXQ1cHBHTmhOTXgzKzZnVHBFWEhvaENjT2RyVTZrdTJp?=
 =?utf-8?B?dlRENmhOeTFEaFZqQ1oxVGx0TG0weDFyR1JlaUxPWjMzOVJWbVR1bTdHYVFE?=
 =?utf-8?B?cDczb3dyMWtZbTlrS3lUY0x4SFV0cENReE13aExpN0tJekwrUk5GZkt1Tkc2?=
 =?utf-8?B?TThCeTQvNHRZd1o1TjZTa21DMnp2M0kxZDNDWFpodDNGaUJNWDFlZ2g4dXN4?=
 =?utf-8?B?eVJqckhPUXAyQWdzbTZNenlFTVdPK0w2ZFpyVEZ0L1hMRGNFSkw0dVEzR1lj?=
 =?utf-8?B?MWg5a1QxbjMvUFFTWEhlQWhqL3J4Q0s1T2swWjNFY1cyUllZVE5pQU9KYm1k?=
 =?utf-8?B?aGNTSkVnUEpjRlZEZS9PL0lYdWJtMnA5bnFVazZUcEtCTU5YWE5rZXdMMitv?=
 =?utf-8?B?WEx5ZUl3MDlwakI1UWJ5d1hpck9kNTA5TDcxS1IyR29HWCs4YnB0bUI4Qlk4?=
 =?utf-8?B?MVFwZGNHM201dmt3SVVKYXFTQnRtOS9DWGJ2V2ZQWGtYNXU4T0pHSVhpMUpJ?=
 =?utf-8?B?ZHdpUFdCQVFGdVBYT3ZLYk5UUXMrblBCVkJJTCs3OW9zZXlOVWp2cEM1M2RJ?=
 =?utf-8?B?cGUyQVpCQVcyNHpFZWxoYmNKSGVBeWpza3VNeTRzMjlITzhmaGV3ZUN4Sitn?=
 =?utf-8?B?TkNzc2haTkdWQ0NKTFpLYm03Mzc3OG1IWnRHSmZTNmlUNlBwWSs4OXBUbUJV?=
 =?utf-8?B?V0tmWWhLa0hrclRyVTUrZFZtem55WkY3MTBKN2c1UUJWVjM0Q09kSDUwbUVS?=
 =?utf-8?B?NjVRVjdtS0ZoZ2lhUVU2M2JLQ3Rxd2RNenZaS2ovU0VxMEc4WDhpWnhnR2Ix?=
 =?utf-8?B?andsS0xEUWpaWTd3ellkWWZ2ekc4eWtyZU9wWnJCZGtLN05mWElMQURMcGVT?=
 =?utf-8?B?bU5RUElqdlIzbXZ0VWNxbytYMGRXR0J3a1ZGNjNHc213ZmljUXNxRGJKcnJU?=
 =?utf-8?B?bkVSSlM5ZnJDSjd0U0k3NmpqZWxZeUcvRnJMQkNOTDN1ZTFlVUhRRktpMS9z?=
 =?utf-8?B?WjdzOXlLa0t1OUJVZm5HSEZHekFGYzkrcXFvV1diMXdZbnNTcGFQVmw5SDhv?=
 =?utf-8?B?NVgyQ2FmNHlkOTRRbWdDQjBFQU5MRWhHV1VpZFlKNFhSMnF0YnBESGVlUnJY?=
 =?utf-8?B?aVMxQ29rWGZPT3drOU5oaVVFZGZHdmtwOG43dE9JQWFad3JIYTdMY0NZQm5u?=
 =?utf-8?B?M1BPSjlIWVhrRitub2JlUVlkWmlvZjJQSDc1Z3R4M3VuWlZrVHJPcUl5a3Jp?=
 =?utf-8?B?cjBkWEtWeVFoMTNMV3ZNemxta0FXMmhMbEdwZWw3c25zM09IR3BPT3c4NCts?=
 =?utf-8?B?cWdtVFZVSDRURWlFZzg2UXVEY1hYM3FJZ0pBeU1XWllBT0MraDVGN2hrV3JY?=
 =?utf-8?B?dzgvbDRJN1NsRktFeitYL0xKTUplSWNJT2hOOFUyS3NKNUNNS3FrSzJHR1Vz?=
 =?utf-8?B?SkJiZ21hVnRHdUlBUlpoT2wwLyt4YmtiWGRkRzBnclQ3Z2ZvbE5RdEtpd3BF?=
 =?utf-8?B?cDhTNWZPV1dzbUNzYlBYZXgvMmNmM20rQnhjRGQ5bmRhVUJSU1drUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9126a2-da30-461f-35d5-08df4b150cbd
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:56:29.1342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHsHoaX69uW8EOLi2OVjhbIGcR8NWG8/KPwBHSRd2cQ38Ho21NYhXwOYSSpobUkQuO+HHzbBqqzb2GWgfgDF8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB625033

On Thu Nov 19, 2026 at 3:17 PM GMT, Alice Ryhl wrote:
> On Thu, Nov 19, 2026 at 02:37:17PM +0000, Gary Guo wrote:
>> On Thu Nov 19, 2026 at 2:12 PM GMT, Alice Ryhl wrote:
>> >  __rust_helper void rust_helper_init_work_with_key(struct work_struct =
*work,
>> >  						  work_func_t func,
>> > -						  bool onstack,
>> >  						  const char *name,
>> >  						  struct lock_class_key *key)
>> >  {
>> > -	__init_work(work, onstack);
>> > +	__init_work(work, object_is_on_stack(work));
>>=20
>> Is this fully optimized out if !CONFIG_DEBUG_OBJECTS_WORK?
>
> Yes, on normal architectures (checked x86_64 and arm64 with Clang and
> GCC): `get_current()` omits `volatile` and `current->stack` is a plain
> load, so DCE removes all of `object_is_on_stack(work)` once the empty
> `__init_work()` stub is inlined.
>
> The one exception is `ARCH=3Dum` with `CONFIG_SMP=3Dy`, where `get_curren=
t()`
> calls an external `uml_curr_cpu()` function without `__attribute_const__`
> (and under `CONFIG_RUST_INLINE_HELPERS`, the dead `mrs`/`movq %gs:...`
> inline asm stays in `helpers.bc` until backend codegen drops it). I can
> wrap it in `if (IS_ENABLED(CONFIG_DEBUG_OBJECTS_WORK))` if I send a v5.

With or without it added (leaning on adding one):

Reviewed-by: Gary Guo <gary@garyguo.net>

>
> Alice


