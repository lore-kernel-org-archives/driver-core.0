Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C98400E0D
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499147; cv=fail; b=UMfSDkeV51xzH8LGPDHqaKoEZgzbJP/7j7zKmV/Gpl13FYE20YWfocphVS+NOKWZfjxjXEWniN8M3L6gtVHF7Auowb5emy5++8ZdJKUWpu7mE8xOH9EHVzSSpsB5EudHnP+UavOwTjqdHto8BYYBG3ja9XNtQAxCsWT4+Kqze0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499147; c=relaxed/simple;
	bh=lkf3wF2Hil10VBQlX/7dRFEH/Gh3wDIGg1ybMaI6iag=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=VJ0StmMKtynjDm7MZGPW6pVYZyBAJd7NzEJC5MA1W8GluXdlgKMGupFk94Z5nTOI4CrwVDTP1KanVfzS7+Mrh1h7fmbNX5ARFQWkZQsS2FNcj/kWRK2XVOCfr4ylcA7B5PMYEwmYFmny6vtHaUf52pFuLNfUc+88PYS7WOSEwCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=khHGXpuj; arc=fail smtp.client-ip=40.93.194.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="khHGXpuj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgFKlM+8E9Ra0/wMQmJpbaR4EigH8P1ntj6fWYRPB9+6nFi7LheBwkl2dN0X2+blVUrkJO0yOosWlEQRrRPq3Zavwyi5YQJDZPKFqrI51XXB0/ONOsmfnVEyuuj+8sKaf1vhTR+TR0wPg/ijPIeMnhlS8aP7D3Au4bNgXgJm+WLsolz4Mt0gTSPccQe+StLvrivIV1lz5XTlKdFwTiVuBYR9blFxNp0CEy2RGeYPTTHvZre/BUM++WlUqskaxCIuaMZUhfZbPGrM73QE8yqmP0N4FL+bzpYKMriqOqxC2C+SDn/vPgf7gK+H44zItRmrqzCYx8NZ+UuDRZBuMTnEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkf3wF2Hil10VBQlX/7dRFEH/Gh3wDIGg1ybMaI6iag=;
 b=jgMotWnw/PYyyBGFpkA3OHJ7YI6DAxTs8RLrPaATbd9yoek+KmB2MS8UjeKbxkVZ0RH4in1dl+UfJ/XzqRlyq03j5y3StPjwRVvljucy7bQH3rSOjBTv6BMPkcyEiJOrV0X2GRlWERms8Ikg+/Klco31XTl5VDf/V2+VvvnH31qq3dME7rjMRzZtdMwqYLWx9HXxPl2aQQA4XKAdu78YzcSotUiZkZ3qtOLtzqeCeED8ShY7PFCV1VQtj5QWBYMG3DLq5RZHAUPhLKzZNKtqSns/KQe/jEMherI+TuTwzOcn2SG/XbIf5y19Z4xyW6y6JeqnmeU2yx5NHmZArowfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkf3wF2Hil10VBQlX/7dRFEH/Gh3wDIGg1ybMaI6iag=;
 b=khHGXpujt5gKCbsrkI3NTPejojh9oP54UXxbQI0X0R0OQltmgLgr81/PjvYgg/bA3II2qYObevIRZ1s1LvHEfgkAIvEJgFwqwD/P1EBLKFa79G7OpWBJqOUN9fUrJMjgbyG2/6ct7v2x3+w48zUP207V6wKK8N8BAUnuUd6nJo34Qo8WU0TOFZX49XSlyeWkdS/MdigVHjQ20dBwxyD186UqsmlNRMYbqKlYSfp2mSLJBVP1K5j5ceOFAhNcrhD/63l4B7Gt3XLsGoWEe9Vw8kZm5EowwB8cYRy4jtueqOf1u7XOQfkgNtr/PRrqfH6rFQ8OOfUIMukJF9lobgUNng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7268.namprd12.prod.outlook.com (2603:10b6:930:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 08:25:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 08:25:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 17:25:32 +0900
Message-Id: <DJT1OEEX0LQU.H9DPHR1SBN9X@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Greg Kroah-Hartman"
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
 <DJSEKYNY1LJ6.3SWGGDXKIURC7@nvidia.com>
 <DJSET0S73YYD.2HCX79F9XAWF3@garyguo.net>
In-Reply-To: <DJSET0S73YYD.2HCX79F9XAWF3@garyguo.net>
X-ClientProxiedBy: OS3P301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21f::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 47370757-4a6c-424a-23a4-08dedcca7c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|10070799003|1800799024|366016|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VyOex223KAK21eoLdLXLSihPz56wPHNM1+odsNekgAnOEkpnG0q0HYx7NFEOe8ftZr+yz7UnhyIOf4GL1XYwsbJVN5GSiFaJ7xrBtmORHFcukDivvyaioEl7qdP76sn+4HpPIPPfDOSun9HFT//IdotbE7aZnCZ1c/NxmbgfM8ud8/JrGFl/+q4uxHeVYK9d5zH68nV5/82RU9tq3eovM+dm3Os+oYhHVVcnLiEY1MQ56MGKRVmqKw1o3XaOe3DHp+Ha28bm74gSt2geCPDPxl5R23EExL1bO1x/J72+dSPzsW2vRr+7WjYb7YAAflH4WA2K19NTQBXGhHDSJCdZjAuVYkGfKKB/m+Z7oDmtjZ54owwcC0w+O30R54RN2rgdmLZmGWUBe+7lJmjrX016TqhdemnBf9bc+4YnGkMyHCAmkU6ieggZ1m2OjyKJM18yG+1rYM3ys9NWPaZXxO19x+pMyumBjL7FTH/4tDqlnhWc6v3EEWdJcL0fDE7/WO2ZZ6/X6ke0+hKasNiLS3kZPPem7x9GhvVFGZeqMVme6bZtjUTFraGTUHlsavngQJb7EB7AHum0timFoSUgSrbV3k9EnCRw1WnqGBqkMw/w1EGgUuXg4En4Mu4kBSDc/k1qhIps60DfGHVXkav5RSqOQ0K8Fodnc7bwi3Sb7Hh0qYM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(10070799003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2w5KzEvb255SmlTRmFjMjl3LzhzNWl0MklhZG1nKzZuNXBxSjd0dHp5QXNu?=
 =?utf-8?B?UDUrSFRNUlU5aksxWStvYmVQRWZ2a1lRQnE0RmxHZFZZdTFPUExNb0Z5d1BD?=
 =?utf-8?B?dHdTakx4cUdVUnlNV3lLWDJiQmpKVTBiTEJoa2hmbVNaTnlrLytGTWhzemRJ?=
 =?utf-8?B?WFFWQjVEYVJYRUIxSmtyVmkwK0U4VGFhVTY2QmVLWkdUUFZ6QnNIak5IT2Fj?=
 =?utf-8?B?djlFdWZYeWFSTU9CODAzUjJGd1Y5TTJmVnJHdHV3NWhJWTBjZFl0RVFvKzNH?=
 =?utf-8?B?cVdrbjlGVVNzM1plc3lFZ2huTzRHS3JPcnNrL25OcmZBUElmT3Y3SkhJNWJD?=
 =?utf-8?B?cXBzYWRQNDFuM20zMUN1OE1pbnJiWTVYcDh2Q015VjBnUmJuZVhZSm9OUEQ1?=
 =?utf-8?B?ai9FRDJ1OGxIUzhsa2JwcGdZWk5hMkM3NHhpOVh5Ky9ldWgzOHdiWFY2UlBI?=
 =?utf-8?B?NlBOdjZFcFQxMy9NVUYwUUYvOGE3aW5mS0NKRTJTWmg5ZGFkT0RtTTRFdWdM?=
 =?utf-8?B?WlRETUZSVTRjSEJpYk9iTTdEZ2F3VDZLMm4rRGUyZnFCMWhUQmlIcDVDRjla?=
 =?utf-8?B?b1dJNWUxQkRpM2NMaTdLYUgzUG1aNFB1R0tJM1Y1Y2NacmZpUk42WWZvK21u?=
 =?utf-8?B?NnVsSHJoclRpblcydzJrUFhnUm5sNVV6eEh0TzZJbkFXdVh1OHIyTEg3TzNX?=
 =?utf-8?B?TnpFemIrZCtQSWV4RTRGRHg0TWdqZFgwemNDTUxLMGlNUW9WUDZ3Y2pNblVN?=
 =?utf-8?B?dFBPTzgzRTBJdmJETjBSdWtWeUx1a1RKNm5rR2xoM3N2bDFCTld4UUpnTU9Y?=
 =?utf-8?B?WXJFU3RLdmF4dEhsWThvbnVyVm1lWUVEM0dWTmpKMVB6N3owRzQrdG9FR1pL?=
 =?utf-8?B?WVIwQzdMeG5GWVVVNGJZS1c4OVNyNW9pTENnR0JjQStJMktPWDJpLy9KdkNl?=
 =?utf-8?B?Z0xGVjRkTjZQLzV4SE5JdjRnUy9Yb3dCU2FPY2JwSEREZW01RjNIUitxaDJK?=
 =?utf-8?B?TnlVVmk5QUNQZ090bEF2SXY4dnM0VEYyRWVNVU9ZQjYyQ2t0ajVVQ3cxRkw2?=
 =?utf-8?B?WE16SThPVHpPY28xdG9WbEZqUmZTbHdDYUdPN0tTNndOaWxLS0s3bHIyOUhX?=
 =?utf-8?B?ZnBNWEFma3R1c1V6T2laTno1WnJHUUpzc05PY3dCNCtnaGFnRU9mNDd4S0c0?=
 =?utf-8?B?NlUwSXdxK2k5cW9aQTZYL3JYTm1MMVgvRkM0OTdJOURSV3Z0SE95Q1hwMDBy?=
 =?utf-8?B?RTZtVjVNSVp3WWJKUjk4REtzN1dFRVdVOWx6Q3krS1J1TXh4TkhGOVJqNnZm?=
 =?utf-8?B?emVnUW44L3VjUjByUy9QYkQ5RnNzMEVOTHYxc0ZYVkdoazh0N2lUcytvT2k4?=
 =?utf-8?B?blpFYXhPcHdqb1lNaEJyejdnbXVlK1NkMHNBM1EzYUpOMS9JOTVxZzVVc0lq?=
 =?utf-8?B?SHY5aWZLb0trZEsreDh6RG1TWWxtand2R1E2QkF6RHdiRDdvdFdEdkhtR2RT?=
 =?utf-8?B?T1dyUi9GeFUraXcxcXhtTDR5dldPOWVIZ0FJa01ZUm9xVktuNlN3U0hFUXFR?=
 =?utf-8?B?akdxaWxqaEhRQ09GY210QTVaQkorY2ZjV3h3OHdCWFcyV0N6TTRIODUxYkhM?=
 =?utf-8?B?WGY2cjAvaEdRUlR1allLa3lCRExvTkppTlM4SzlMWlpUc3VoUWk5VGkvekxp?=
 =?utf-8?B?blQwaXJXZllab3d1WXJ0U3U0dWgxNC9yMVk0VHFaTTZKSWdWbUZ2R0E4blBB?=
 =?utf-8?B?TUNUNlBkTUkxSUxWWVMxbkRZdXgwbURmTFlnQW5lRnk1QzdyUGFsamdRVTVX?=
 =?utf-8?B?eHFFdEF1U2E2ekdBUTVYajlPMVdLRUdtTHBObXVxZFQ0eFc4QjJOUTZCUnF1?=
 =?utf-8?B?SXlDTW91Vm1vb0xGRFVrb0lPaHprcFZNNlRrTlVVLzBmcnZIa0FDS1oxRHF1?=
 =?utf-8?B?MDhndGVuU2pSS2hpQzlaejdnYitxc0FKZEN4UEpHOGNHVnY4eVhySjVOb2k4?=
 =?utf-8?B?STM0djkxZnJCdVhrcFFKZ0JLTHdWckNkZEUrVE1aUjBaSXVXK1lKUGEvK0Yv?=
 =?utf-8?B?Q1c5eWtPQlJuQ1NsVlhiZktSU0pEdEFIUkFvNlN1UkNTbVVJWnJvZHVwTTVM?=
 =?utf-8?B?Sm9uS3Y5VHYxRFdsaTNpdkszRE1XRTF4Y0c0ODBVZ28yWlFvQUg3Y1NZWm51?=
 =?utf-8?B?dzBXbEpzUlRNS2N4ZkFKdlNIVUlweVMweTlMc0poY3F6blJEWmptK0Y0VDlr?=
 =?utf-8?B?K0RzMVZONmFQdERJMGJxWVY4MDNlWXJiZmFoK0RqWnlhd1JXdmtSMjB2L0N5?=
 =?utf-8?B?a21lRmdtY0FsMlNQL0ZjZmRPTnBmdFlUWVFPOXo2RHRiMjh6UFZMV25vaEx5?=
 =?utf-8?Q?+kz9fGLkDwdwW2oiD8wUDMp/JQRMUfSi1UH8NeID1URe7?=
X-MS-Exchange-AntiSpam-MessageData-1: z5enyd/W4YqYQQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47370757-4a6c-424a-23a4-08dedcca7c57
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:25:36.2744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QiD+6ouM2lmJCXh8DEkUgOLA9upVNGRBF/oAy5Hz6zLRaqGu7T/xC5YO0uVzZYl5N+wlTH6NcakZM5Hh8r3Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7268

On Tue Jul 7, 2026 at 11:30 PM JST, Gary Guo wrote:
> On Tue Jul 7, 2026 at 3:19 PM BST, Alexandre Courbot wrote:
>> On Tue Jul 7, 2026 at 9:12 PM JST, Miguel Ojeda wrote:
>>> On Tue, Jul 7, 2026 at 1:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
>>>>
>>>> We set `msrv =3D "1.85"` in our .clippy.toml, and my local testing wit=
h 1.88 and
>>>> 1.96.1 doesn't produce this warning.
>>>
>>> Yeah, I was trying to reproduce it locally too and didn't succeed yet.
>>
>> Ok so this is nuts but it appears to only reproduce when
>> `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy` (and `CONFIG_SAMPLE_RUST_SOC=3Dm` to b=
uild
>> `soc.rs`)
>
> That's crazy. Turns out that clippy's default equivalent check relies on =
MIR:
> https://github.com/rust-lang/rust-clippy/blob/60f8c3a019cfda37e07de60e9cf=
d7ee77b290fb5/clippy_utils/src/lib.rs#L570
> and somehow this check misses `null()` when opt level is high enough. The=
re
> isn't a check for MSRV in the trait impl.
>
> Please report a clippy bug.

Done: https://github.com/rust-lang/rust-clippy/issues/17379

As for this patch, I guess we don't need it then?
