Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010036.outbound.protection.outlook.com [40.93.198.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D44E42E8C7
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433989; cv=fail; b=W+Ej4l0vQUcESj3As1S/Tp13E5gaHnTNslqPlSeHsGIfvyF7PxR8FvAQnLQmbxi6VYlQqoGbxu0qLDui0GyYm6TK3bHX+FlfmtRnox660Y4mJSxcUY3IwSX8K+A0ivhrlCbjT4Y+Dh+qFuQoSR/Por6ImQIRtkgyMEIgB83EdgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433989; c=relaxed/simple;
	bh=mhTjP3a/KlT91dImFjXe4d3W9BV0mZj17FZb1sUfopg=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=JujY9fNkux9iSZzWoEiipDzY/dlewaWaREgkvjRPY00LCys+X8juaq+m4jEtxxm9FCaqnx6nlYinmtMaOT97Df76u3cOAbT0CJ+8V3/G7Ki2slvIKuaw6wHmPr8Jopvq1yOrbU3mpwtSWYBhS0ExjiC5UYecCqUvJTaHtcrUm/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TU3W13QY; arc=fail smtp.client-ip=40.93.198.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TU3W13QY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=volWATJx8g1o2U926xg9KWwwIFzGl0jkYvani9FIik9VPvpoSfRaWO8HK9xQOcPVohmpVNELc3uVLSpdZ1j4CtQaZG7PPV7MAHHJ3fpKDrhCFxG5ul61YDk1cd3pxnvbH4fAH0aa3Syj0guKi4E0hOng+fKe9rQ60INcHE+3HwsAzAZN6h2r1V4nvG1zTTYv7dmzWR4LQYevcnwtKKY+HIFZPP4t2PcoAIblqdUA5OXu9l/r7bBFb8xrBQDjfPbGFB2oXILk+pDinWweyllNXAjTHwsaRtq1J21+EdAzR98xLK8g0C4UqhXqw6gHYqQN+ei4ou5E9WGwJPofgjBG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhTjP3a/KlT91dImFjXe4d3W9BV0mZj17FZb1sUfopg=;
 b=G5DqrD3lxF9IrfJPnLKdN6ubVCXr8/rS9a98V77DZ12TEetNXMl8v1CNOps2Wr9mBgcHmqCZjdPA9KL+Js4/ZiGDG+vX488bO9U7IisIaGEdDguXkdmdIWqXnawlE6LPRbExaQKDSy6L1wY2rpC99Et9t8/07Xz9LsUZ4iEf3h/b8NFicgjd9g9DeGrjcOhzLc5tqsa+xS4saTd9WGb/L/xl2gXPL0vXJjQNYNLSFTMpE/D3u9mtbcj4y40CDk182WNjatTZKhXUNH81dkpH5qwZMplooXxbkseepL+KwUwT9UcX+E05Y3Mt7ENVYzLGyKzax4GDmbQqwi7bEsIuBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhTjP3a/KlT91dImFjXe4d3W9BV0mZj17FZb1sUfopg=;
 b=TU3W13QY5qPEeAhFbX2roOeun97bVQ8tylZSKIuEhodEI9gR0jCpgGEWrRmd2OQrpZRZLcck/yGCitErRwebpyO3S6zWOSjHKGY8uLeO2zCvxpviJzjHxb58LvWl3+VRWtwskvozJefyVaOwmhRrRwOB3P6vR1d2ioUfqpSowZtIo2VOh5ZXh9CR+rXlIpmbV4QuhyVW9Z3JVDRe8k99n/QH9J5tL32nxSq/DZlvJbfGXjHMnjdbMY4C927ECYJlI7HtLd+1vmBshBFeub4YzXTP515ji27cPzXhXOOllvBy5nRlHfQEZ8iBRs+qm+XlDz09tfmM3YuWkbgjvilAZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB5868.namprd12.prod.outlook.com (2603:10b6:8:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 14:19:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 14:19:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 23:19:37 +0900
Message-Id: <DJSEKYNY1LJ6.3SWGGDXKIURC7@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Matthew Maurer"
 <mmaurer@google.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
 <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net>
 <CANiq72=Q7aR51uvwKXUh2YWJmDuBAHPECA57qG3Hr20xWCt0mA@mail.gmail.com>
In-Reply-To: <CANiq72=Q7aR51uvwKXUh2YWJmDuBAHPECA57qG3Hr20xWCt0mA@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0193.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4803e7-c891-40cf-960b-08dedc32c890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|10070799003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NahDqUmNnVwFpChgpJKgMZiZa84yFdL2ZLUi2yJy7Jp299TLmocb8RymbdFKbtMfyrUWZEi82BPsAGrbYOHFtBpsfbsSSnIygmA291j0AsFMeY1H8xKcW235/9o97uK05brHl04Zkbtvxe1O+pOTVtzQct1FKUOEIDTUzLJz9Ox3ZYqsNTTpENoGE96ONTvyPedBbFuRrXx46zY7xLoIcXt0zl/99Yr4xVGJbeyWIgbBGqQgVNUBfGBp+/9InvYaEigtxRYGdrbXFU6wouXLzOepWHAt3C7TxnMmmMZIbstdW6enz2XyEwXlJjuLl3qDyOHXlAExvhY9oAH1ZoyAvqY7nnDdf/fQM89cP8NjkuCH9/sU/QN6tn8gFjzDt3LLs4UdMQLdDnmBqh+Ke04i82yTrbd1UrnC2RBS+vLHpxQuYpddH67ptOKKDKEJksJmz74N1H8ntRitsijs4rI6eIG/5iC93ggpKgO2hBCnwnm4doN9TU7dhur8LApQyXXUjTRhk/dUX0IZiaO8APHuGt4l7AwKOZ3j7ZMn1cxSnvmXhnsJsZ8bZCba05e0kBzQDNX5goGJ0g7TmZmDohtygn1IJya4zX3S2tG0OdyRgQq6bTO5KN2qwh4GonFBV5AYm8aTTLGwX1EsVa0ZJzX8mlAfgcrYNi3apsrbU40CWj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(10070799003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzZnL2d0U3JBVWh3d1lFN0Mvak9KTG15VDNsWDB6ZDZmY3I5Q0hsRmJoZ3Nu?=
 =?utf-8?B?Myt0NkpsSDRVWnBPRkJYVWVLa2FnUFNoa0hXSjJIUlBCYkxSMmo4OHo0M21D?=
 =?utf-8?B?dUIyZUk3R1BxL3NHdnJCSHJ4NHZqTUI5VDFtaUtNdkdLRTByNXJXcDNhOXds?=
 =?utf-8?B?NVV5SUJVZ0kyWmF2VjBoamFVYUZRdE8zZmFPYUc0Q0JTdXJUME12WEJLL3ZO?=
 =?utf-8?B?TmlmS1crbUdBMFh6SDJGL1NaaGtmOHFVaXRMRmRjMytzOWRicXA0d0t3bGdZ?=
 =?utf-8?B?Z2xsUHVCeWhra0hYTXB1emkxTGVLcmNKRjBGQWk0dmRybU83ajdoclNvR3J6?=
 =?utf-8?B?S01CNGNCbVNWQVlDdXNvY2NDT3UvSFdpZW9kaWkvSXd3RERBWXBKYS9lY0oz?=
 =?utf-8?B?SWhJZkhPazZTWi9hRDFRa3I3aHBqWGVuU2cvd0FveklqRk1vNlk2dWl0Um14?=
 =?utf-8?B?c2pJbVVXZjlHVmpxWkFoN0xqalpCR3RxT25Ubnd0K1FOdFVKNHRCZS9IOG0v?=
 =?utf-8?B?eG5Qd2ZGTEsvMEhBaTREaHdtOFFVRkswQXBwbTBFZGtwL1RwV29WdnhhcW0r?=
 =?utf-8?B?c1grSzRudnFCVWtSaGZTNmRvYmc4SGIyTzV4VGxla0NUKzZ6ekVRTmtOdEZ3?=
 =?utf-8?B?OUtmbmw4RlVnd2Nya2xtQ0pkSGVSU21GM3JkTzF2S3U2Z0s5RzJKdFVsVVB3?=
 =?utf-8?B?UDhBM3NaMjlWakpBRjErVElTeTJ0MGZQMFIrRUozdWNBZEtsRVgxVXUzMThX?=
 =?utf-8?B?MC9aeitnVzNVKzRaSkVIZzMxSXozdjRXUmtHK05tODBrWWNNSDlWL28rT0d6?=
 =?utf-8?B?QW42U3kxY0k2RkZ3MWxqbk14anlNbTc5a2JHREVQaXp5RXMrQm9qS2RadFNV?=
 =?utf-8?B?WFhJbmJJTWhWMkp5OGV6ZlJZMDQxVXN1VmVqbWswb2FQZVZsUFNiQXVkQks5?=
 =?utf-8?B?U1ptRVdETVB1UERpdHAvOVUvSEs2OExETjE0c1g0aXNlc20remVRZldQeGFR?=
 =?utf-8?B?ZHJWS2NSRXk4cmxXUTl3U1FBRG53djJKNDB1dEYxNlRabzNsMlhIcUg5WWlh?=
 =?utf-8?B?alJhVHIzZGJ6TWtZUkRHUU5pWi9KY1J5OFZNdmNzcHNLVDROV1hQMEY4WjFh?=
 =?utf-8?B?dCt4aytRYlJObHc3TFRIRGE4Q0JDSnZZRlJBczAwQWtFdGVwWU9hajgwUVF2?=
 =?utf-8?B?VGxISU5DbGoyQTdBZXFaY0ZTS25reHFVTEZrZXJsbEczVk45azVlWGwwTmMz?=
 =?utf-8?B?YVZsZzFLRC93cHNQK1MrK2pGNVdaNEhGZlc2dVFpOHVpNmNuZGZyQXQ1R2lo?=
 =?utf-8?B?U0VHaUtHcmRUWkc5dnludldmdnJUN0s0eW5JOXduK29BNm11Y3dWSXU4MVQy?=
 =?utf-8?B?UTFaZkc3WGdDcHlZVElaWlFneXo2Vk53WDYzSnFSdldHcGxGVnZhY200NzVp?=
 =?utf-8?B?S2hZL1JjTU5paDk0Wjh3czVBNlRUekxtZjdBZE1ydEFCcTNxZ2plMlRCTzg1?=
 =?utf-8?B?Si83dVpRU0dBWkwwNEZmM3M0NVFNMElOUWpMNmNTYmFJbXJVWGxZWVQveklm?=
 =?utf-8?B?SDFMQUxjZDNNRDNZOFlDYno4NGVhejdZSXdSL25uUVo2SkhMejJPZW9TWDNl?=
 =?utf-8?B?WkNkSHBjQ3VRd29uOW11eERleWNiazBuSHN1TlM1NDN6YThHMUNTNWNVYWpn?=
 =?utf-8?B?a01PTnZvQ1NNejQ0VGU3aUsrZGVoS0lkRWxmUDlyUzJ1eXpKdW9RQ2ZGaHdE?=
 =?utf-8?B?cDcrNFhaM3dzeEs4WEZpTFhSTTlOMWwxbmxpMFVWUlVaQlR5MzNXVjRMQlJP?=
 =?utf-8?B?cmRyRGFCVE9sSEUrT3hreHNrL0Q1bzUyOEo4eXJPbkNhSG00WjZkUVNDOXJS?=
 =?utf-8?B?TXJrZXB4YVZuem9LVzkrOU4zc0hyV3pROE9mQVBwWk1lMUxJQ3pmbDhiVXJJ?=
 =?utf-8?B?aU5OVUlLY245aVUwS214RmRNelNtaGJCUDRKNW1IbVRxNDJnblBoRE1tbWda?=
 =?utf-8?B?WkVJU29wcUZPTmY2bmxXV2hwUzBTaHRmR0ZXK0RWKzdBTXlncThPSDRzdGtN?=
 =?utf-8?B?VlcxWnlKNTN0YjRrWnk3VGtienRvU3IyYW9zVTBvUXBKMk1KbUxLYlM2dURh?=
 =?utf-8?B?UjlIakkraWZmR1d6bVBRbm0zejZCbmxGamsrTE9HdGNwOHZuRWh5TVlmUlpD?=
 =?utf-8?B?Y05Vbk01U3dGeHRSYWhTRjRiNmJRai9GNnFFMjBBbmR3VjJad3RWNUlNcTEr?=
 =?utf-8?B?OXg2emVDUFpiT0pBQTNzcnpsK1Axc085K29BTXVPL2dDb2hBUExxUGQ5S01M?=
 =?utf-8?B?WW9JUHR6UllpenZJY2IwOWFrN0lna3dacG90c3RTcTFEL0pMczJHR2NJRmJH?=
 =?utf-8?Q?5WH2kYdQAm0hThUbgdhNF+vq9MkgrSOs7Xeaxu+kBBHSD?=
X-MS-Exchange-AntiSpam-MessageData-1: GS2Dh1n67QbL3Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4803e7-c891-40cf-960b-08dedc32c890
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 14:19:40.6521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DalA/jLvRtoHfI+Fc7CDHOt5OOaGI0Mxwb6GXmXIrJ1TVKH2A/nHzry9KPCX/hcbgI1o74EW8r/B1W31CtirHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5868

On Tue Jul 7, 2026 at 9:12 PM JST, Miguel Ojeda wrote:
> On Tue, Jul 7, 2026 at 1:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>>
>> We set `msrv =3D "1.85"` in our .clippy.toml, and my local testing with =
1.88 and
>> 1.96.1 doesn't produce this warning.
>
> Yeah, I was trying to reproduce it locally too and didn't succeed yet.

Ok so this is nuts but it appears to only reproduce when
`CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy` (and `CONFIG_SAMPLE_RUST_SOC=3Dm` to buil=
d
`soc.rs`)
