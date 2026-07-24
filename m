Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF552F87B
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 00:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852330; cv=fail; b=XpUd6e+FTrgMfDNDnp/V2nGIWy3SZQQWg48McqA1U8Zz4guBixL7APpvTDAdeSULNiS9Wn0K+OdeJKlbSLWPp/x+s93Xx1TZzl0XTDLyDXyHSLkpdJo5TaiznHkMIzubM5CV5VdgRrgJUw4/YU9jyBIoEzYmepPuSY+WYzJgMZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852330; c=relaxed/simple;
	bh=0ybZdOddSwoKw+sTJd1ii5ar02fnHgjdsniPBWvhC+Q=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=HK1x0XV9ekTa04MYVNVTPIWYhByGHK+fF355e70u8fZK1R7y/dX8VvxVTy1GwjPKeZ5sdZeJSze6g26Bf7i/POJy+86wLYmhkWmf62EfaBGaL5TDBCBzfGFOxgzlaE4RDCJW4JKBAgU08J2KoIi1RSRrUr7jDwvgqQLrmJ7C3m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lGuBUqwf; arc=fail smtp.client-ip=40.107.209.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lGuBUqwf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHq1cRj0LWqUqzCpfXtqXNwVBiqKl74vTnN5UhJ/dfNWs39+ngrbsXNNc8dHbq0pwW1W2ATnogx6A1sPQtDVg0LLXohR3nP+4QNgA40PImYw02DKqD32OYtUOGD/QC4Nwsfq6flsoo0ZvO0p6EYDmA48VbFZHXjpXLXFTtQjz8ewACA8elItGpc+LRmvhQ6ZFl06vuXY9BMbaIfFCOUtoq58tVy1CSAHdaQcAx5r57UykL91apBqXg6Kl7yf+KL954NAMX4cMFVQdCLfXC9AWfyoUTigs9dyMpzlTEXyOkaqqTIM6hTAEpDjZ9fQuOqz8N2vv8MJcjw41SP6DnHXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1XkN781JVZ/iCO158THLDz/lbOtN76qqyI+nDFyMlU=;
 b=Z+2JoK/bOrCpPBRaXehjsgg9ivaVescvsDoOchSSslIIyAKsO/fvd23JjQeCco1MS9yuXU+D9JoMU2jfshYBzbzTIfFW8b3R+qSt5hyzxoZwQ+CC2Qag97T1Hq4YPgTqIFEcRFJkPDQrV3sY0ZTHp/TDnLyWwGE7kU5OorIIW/W5D4/+zEIkYz1a2UYLxOqWpuqM7AFPTxqK2gTDOo0a1O4ceWBo53TbA4zhm2Rd6hOrTHVfdaVL3tRTs1VeZt70Gi2TXOuUKLn9nCkB2GeERpW3MLuEjr8aaTx1CilTlkP/jYNeRKL/SaPxtQkb0nYenG9XopIFwtb387+REglegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1XkN781JVZ/iCO158THLDz/lbOtN76qqyI+nDFyMlU=;
 b=lGuBUqwfpVc5NzLVCwQmvI3OnXuJSwY2JqXpgi5bHlH4ZbecEnkokZdjlTKtYYo01XYHtFBqthUhzHIqnpoCFgdDdqGVjuqLd6He46V11OxHlh2Qv0Xn5gJt84IOjmHp/pAv8r9Eb1I2YAvdoIECEcdow3tVThL5OeClaGKa0F1xJubdg3MctOlah9ox0kOmAwWjTQnLQVuzFZUMzVmFJa346tBXfi+GpeEcW82syck7NRVjd/r/0YY9RF7QGwWriYazD0Ai5s2BoJRqdz1a8BcruwSnj5eHzwCOARaxhyhaxqPUcXDWrTNFl7JlBa7S4qePvUiqkMfUkz5BrA9ELg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 00:18:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.009; Fri, 24 Jul 2026
 00:18:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 09:18:18 +0900
Message-Id: <DK6DC28Y2CZY.2IOLKS3T81VG8@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: <git@younes.io>, "Danilo Krummrich" <dakr@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Timur Tabi"
 <ttabi@nvidia.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: dma: return zero for Coherent reads past EOF
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
 <DK6CCQDJHK8E.1DZHVZJDLS97P@garyguo.net>
In-Reply-To: <DK6CCQDJHK8E.1DZHVZJDLS97P@garyguo.net>
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 705f6960-d80c-4f54-5761-08dee9191269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|7416014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2e9NoWiCNNOemXaitJRwDKcFsj82GeBR90mw7u7REEwQMeaxMSRwpMTPWj6HslX+AC7UDWsILQrtnaD6kZ8XCMiSOzlGeLF6rmy5dj5cm87nLtmhYjw0WQRbsQaO722uWL9cBv97afaKq9lhAmyV01Zk7BKB1uh1ecjNpO8vzyDC0NDYorPgFI9F7XDeiNwUkipTna074TGBsCuQPhCMP5N1xNC0U9EXqET4oaC1nm/Siu3HKcJUqgke29p4R6YiaRBMa/11hyMoySsOTH0PVTmADgsthjnLXjemwWe9aQnF4hdOJ/KVKETeGguF5shM012qxxPyu8T4y2k8UhAU3U/pfKg7YHNz3PAPl9wr3+BjY2F/CP1P/1RyvhRGDhAtVI9IE7bl+uDJ/D5YpYo0zBPE43rrLDUE1O0YkN0SYjODxAW6Nqn9LAY2TWYEAvWfYiE+rFQyT093KnYH0ssIr2CNeOLX47HpbYg/2IkvKALdQbyEwRtvaT6TPXIgnEXFRxibfRedrHNc4LBX03j0rtSXeWEqqntYadMOa6U4/hxx2OrEoXjwEnt8LTSQpAg+/gz1PfDvYkaRvgJxO68QJsj5gfoW7uywh9UtwonaVWFKnKGywb+ZmH+sksTBnCmpo35WWSH0/EBYZNCbQJQTZadFW25EqownPSPCCNwrD4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(7416014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXcxSC9KV1ZJV0R0Qmw5bFJ1eVRmRFYyaStTTEtsMWVpS01HZFRDcGtXdDJy?=
 =?utf-8?B?UFpJa0RaWm91dHdyVVBHWXJ2SWsycElIQTFmb1o4aUlNdlA4WEhLcXpBMm96?=
 =?utf-8?B?QVUzWjVHempRQVBEd2MzUWwwSDUvdmZZZDFZai9oK0t3b2dabWQxWnNVaXZV?=
 =?utf-8?B?UXJOdzZPTW1PZnYyb0tybTN4UmxZUW41VTJmQnd5WFZkSFR6QThxbEVtSVRt?=
 =?utf-8?B?QUMzU21mNFdnYWhHUExNMXVveWkxcVd3MnJtRnZ5Rm9UaEd0YWppUjlqS0RR?=
 =?utf-8?B?VGdSYXFXam54MUZkYUtuSllyMC9HVGdLWE1HQ1gyOGMrTUNQZE55bUoxdjl6?=
 =?utf-8?B?TkpOMFZjaUxTSmVmaTl4YWc2cDJDOVVlMW9EUE1haHBOWjNWbHl2TjI0NzlG?=
 =?utf-8?B?UWpWbkttU1pYRFRRb05NTDA0Q29OdHE0Lytab09jVzFhVWpUU2VYMUJRTTJ1?=
 =?utf-8?B?dUhxZ3N6WU51eHNIcEwxcUhjYVlpZlUzdExzMmh3czN6NHFKUjFVSlRrZlpB?=
 =?utf-8?B?Wnl3SGtpZmNlbCt2VmxPZWxTUUs1Y0hGUldRNG5HMEpjcEdFV081N3B4Z2pI?=
 =?utf-8?B?RDJHalNYcVJra1Y4RFF6L3E4ZmoweWZPUDhlRW9OUnRGRG1kUXVBKzAzZTdZ?=
 =?utf-8?B?RE5BcVE0OUJic1N3VCtaSGZPNXRxRWk3M2N1TDdZR0kxb2t1YWxEYWl0OXF0?=
 =?utf-8?B?MnpOSUxuUkJ4QUl3bldaZnlqRVROOWpsaDBpQUZkSU5WbW55UVEvZE83djVi?=
 =?utf-8?B?d3cycmNaVkRqZzQxTzdKSi9iZ3BVV0ZtUjVOdnpaUk9yRUo2Q29UcFJuYlNq?=
 =?utf-8?B?S1pzaGpFc3lpN0tnVjVncDZRSWpqQ2dKRUQxWTR2S2FETnJMaE42OS9mTXB6?=
 =?utf-8?B?OHNMZXVGdmFiUkwrRjJGclFrTlNDMFJWZHAxcTk1OGxDUnhONzJkc3ltNWdW?=
 =?utf-8?B?cHZ4TjZWamlpbi9qNkozT2UvdFJIUC9HdGR2L1I2UGl1ckZpYmt3K0VpK2g2?=
 =?utf-8?B?dDVDTU5GM1JIT2NVSVpyc0Y2Sm02UWUyN1pZVTlTQWN1MVpycUhucDh2TTVM?=
 =?utf-8?B?RUIwY1ZMU01KRW1pZWRoR3llVDErU2h6V21jRXRnSGsyNmxrOXhKMDlkZTFO?=
 =?utf-8?B?M09ualpFczBJeDZtcDg1UTVuQy9oeDBDYWxuNmJhWVBRLzV2TUladm5Wbndo?=
 =?utf-8?B?QlZXYm5qUjBqejNZeFQvcCtGOUZxZEpPSThaZEZLZlp6cHRaRGlLaDRlYzMz?=
 =?utf-8?B?ZFRlMlppY2VnK0dJc1BtcE9aaXRyS004WGliVnRVYUxDVG1oSE5vUTVBdzR6?=
 =?utf-8?B?VDNjT3l2cUlVVXpyVmNpWkdVV0RTVS9jYjRuVEF1b2V1QXNFaUovMVhnNVZh?=
 =?utf-8?B?TjhsK0p6N1ArM1F6NCtqK0JnQ1J6ampJWDRTbkhuanFMRDVNclNiRlQ3NWtK?=
 =?utf-8?B?RDBFRE11REFtTEVLRFJKQjZocVU2NTRQYldhSHlaT1d0T3dKQ2Nocmcvc2M0?=
 =?utf-8?B?MzdEUEtSeTkyU1JjUG5sZTV1NFl4RytzaE00a1NUU0NKQ1lYVXdyMzNPL2ZL?=
 =?utf-8?B?ZSt2V0gzS3RDK0lQRWlJZ2Q3Z3hBMjFkTjYrSUFFbXR5dTE4aC91M29FNCt6?=
 =?utf-8?B?MmxPRDdlNDBkYkFTRW9TV2VqNnhEaVRkbXozSW5GUVc5Z2NQTDY4eE5xb2F3?=
 =?utf-8?B?Y2svd2xCd25KTlFLMXFnOFl0dFhFcG5WYWF1d3VScmVJNHhMdTBKdTAvS2or?=
 =?utf-8?B?MjJhaVdPZUZPTzR5aUZ6MFBwNXhWQjY2bnJaOWVFOEF2UHdwM0pLTnhBNHRk?=
 =?utf-8?B?Q0dHdkg2NlZMZHB1bFY3UHh2ZlExaEsvQy9mNmJpb3VmWmhOODdZYkRGZlZa?=
 =?utf-8?B?Uno0bVZUbklQeUg1bFFlNzRYYTY4bHFHdlJlcWNDUTRjeDRtU1JZZXBjL2Nj?=
 =?utf-8?B?RElXa0NlNzBqR0s1RHp0QzFrR2Y5c21TWlNGUXJPZ0NmNFoxc3ZXM0dpeEVG?=
 =?utf-8?B?Qit4N0sxYUxEelJ2U2hYV0FwNStXVVoyanpqVGJobGFCenBSd0VKM3NXVXlQ?=
 =?utf-8?B?bE9pMGVWSGFYREd1ME5pdldDM3RTZkI1NXRIK1pOalM5cHErTU5aT0svMk0z?=
 =?utf-8?B?d0Y0UU01dHdSVkNxZ2piQTZOdXlibHM4RURuNG1HSjVSbytwalVadXRqbW13?=
 =?utf-8?B?UDdUTW85ZHo0b1JITC8rRkN6b3ZsSWRVaEd2a0JPNlV1T21NRnpyOUJhOVF4?=
 =?utf-8?B?aVhHL3BpL3RTNVBQa00vSWlMU1dING85TWRERGZ6ZUxsWHJDdjRyVHVWUmRR?=
 =?utf-8?B?NmtjenFxcW9ES2Y4ZDlvc2pvRHgzN01MMDFyQUpVTCt3M2pTUzQwQzNrSVFU?=
 =?utf-8?Q?V1qA6VqgTkmhP4jz2UEUOqFMXKTlk9UJctcpxBFLL+hyL?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Kzc+YYXXvQENA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705f6960-d80c-4f54-5761-08dee9191269
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 00:18:22.8654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2S4rUoMEQnr7IMcoeIbrlujiSlRKMJCWYHa1TDzZHCdnwmaWTO1lm7PJYnr2eOxbEV7XpNhKhI+EFk38Lq7o8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722

On Fri Jul 24, 2026 at 8:32 AM JST, Gary Guo wrote:
> On Mon Jul 20, 2026 at 8:21 PM BST, Younes Akhouayri via B4 Relay wrote:
>> From: Younes Akhouayri <git@younes.io>
>>
>> Coherent<T>::write_to_slice() calculates a zero-byte copy when the file
>> offset is beyond the allocation, but still calls
>> UserSliceWriter::write_dma(). The latter rejects offsets beyond the
>> allocation even when the copy length is zero, so a debugfs read past EOF
>> returns -ERANGE.
>>
>> Return before calling write_dma() when the offset is at or beyond the
>> allocation, matching simple_read_from_buffer() EOF semantics.
>>
>> Fixes: 016818513936 ("rust: dma: implement BinaryWriter for Coherent<[u8=
]>")
>> Signed-off-by: Younes Akhouayri <git@younes.io>
>> ---
>>  rust/kernel/dma.rs | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index 200def84fb69..36b72fb9ab46 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -1005,6 +1005,10 @@ fn write_to_slice(
>>              return Ok(0);
>>          };
>> =20
>> +        if offset_val >=3D self.size() {
>> +            return Ok(0);
>> +        }
>> +
>>          let count =3D self.size().saturating_sub(offset_val).min(writer=
.len());
>
> This saturating_sub is redundant now and should just use -.

Or even better, you could use `checked_sub` to perform the test and the
subtraction in one go, while avoiding potentially panicking operands.
