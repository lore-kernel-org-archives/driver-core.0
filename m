Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D32E35A952
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 05:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870104; cv=fail; b=GQtexo8hPkljc/YJwU+ztNFVtao3Xpg179slZrvKcxV91J5qWnNpPpspeVj1WUzpfvqqQ53f09FPy5Lux1979OU6MVZQcFacdx6xjr0bqhzBdzZMKGgWrSkvXKadDFc64EzyumpOeyGNZfcbfUUrcnDMfcnl/wpZIl9+19+jKo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870104; c=relaxed/simple;
	bh=RQCv+d3RZ54fxCnsFihPlQrooJ8l8fOI7IXcYFVwYYM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pR54abSrQBa9FaClHrGzjmNZaLxc/YduGUXeS8W4nULLH8IUezyS9yoagPknzOr6BLb20g7r/v0WyFNqNBo1QwQJ9KOjFUw7uDsXuJK0uSo8HjbWuP14TneMX15uQoWHSSn+RC6nfFJQRnzkP+R5quNz8QlvFyw5yWvmXNiBr30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PX3MKl0g; arc=fail smtp.client-ip=52.101.201.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PX3MKl0g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMqMAkWcKqJkgiriD0LBek4H4mwrrYq0X78i0HTJvlxqlUMIbJPx1vCr++AI9Qu2z9Xk3zjY2+DhU/OuGcaCEjQj1tfA6BDSi0OMfco9Nw0xY0jkxqSiDy7eaO0QJJ2NNRsBO0RialnvECBx1Ko94IM+JpcTk46gB75xx4DNcbGvba0zEPwLxKiZat3yfpsHtXY2lk+8p3nPM56UyTdhvmJywe+DCowWMvIB32PJfkhPO+Meha0rUjyEiuoiqGHlZXub/vghw+bRvWfShglkQE38rDRUti8V7/xvlcLIU7us8MwlSSIBumssmeG8XcX9GE0FqZP9e4RTXK82CKHiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHAgtJJDHFram1gvWDYIVfd9vylskfY1zmg/OtfKmoM=;
 b=ZNO6v+UlDMNMQxfbL3B1kiaP6qGyDSAZn0568mQYW7OFaA76eb+GHNsxvt26DgfpzBi2YJxZpPZtl5j94MD7I1AzeSv6cUc4Q87JIofGvg4WQlQps1QqXufU1Xgsn85BnwcbCANKXlQrdDAMwRkO9MgTxE2wlcsRw5fYH/CiN8/4GuP+mBj+MBIK5Q148tZb68F2wp7gQW9d2V3WNCWX03kwGXvStx01N1MAqci+vxSOYTHvLRgnztLLKTNSk+M5m+pArebBQIHw+LcaO5xrqlbPq0zQE8H9yrgAXkolBbFOh3XFYLong8CAUpskDSZEgrF9j+sYRbGcg0ZGZgJ3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHAgtJJDHFram1gvWDYIVfd9vylskfY1zmg/OtfKmoM=;
 b=PX3MKl0gxqx3zTuTVFyk1vKkjvs416qeTWXxVcVXSqnjS4mim0koCTAxNaXYzP2e9F5LML/9UWztXI9x+56OV9VVh6ZDhc6S88hNWFdbKF8eiKqV5iu6C9pcKTdPylFov+fUFQe0ILDICC+lQW12khExvYt9EZpDD3UBEwJWYJWeEEmqKgq5cBIJNYDCm/972+YvnU5qQjnHqTHMDzDK2xKF3HKW5lm3d6zLVKS6MfmCx0gqMTX4Fjk4cTJy4DqkKLC2hfuZPxQ7pzlE25yR++Vtb5ZMHU2aFYzlK7j5XVKzGobf8wfGJ8ay1E1+Ke6JwYsJ8QBJWDNdj5jXlCcWGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5973.namprd12.prod.outlook.com (2603:10b6:510:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 05:14:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 05:14:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 14:14:52 +0900
Message-Id: <DK6JN4PZ077F.30PB0271O6MG4@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, <git@younes.io>, "Abdiel Janulgue"
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
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
 <DK6CCQDJHK8E.1DZHVZJDLS97P@garyguo.net>
 <DK6DC28Y2CZY.2IOLKS3T81VG8@nvidia.com>
 <DK6DXU51V88J.23CVF9ARSSGT2@garyguo.net>
 <DK6EP5W2N2U5.OTWCUSAPJWFD@kernel.org>
In-Reply-To: <DK6EP5W2N2U5.OTWCUSAPJWFD@kernel.org>
X-ClientProxiedBy: TYCP286CA0338.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e56759-af24-46f1-b0ed-08dee9428000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|23010399003|366016|6133799003|22082099003|18002099003|4143699003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	o/+ONb8bfFRbO3Ait7NA7DSQ4hbZ9pln4NsG8plvW0JudUzegpRP+6/Gd1uZKliP19F6VbcFkgZ4OfgwSM8tCGYLJZD4AGvGgVxzdEGZRTuFJ0lTUJ1xtcTDNCxd5TLv3Y6jkoHT4Y0VFEHKjgdehDa7B/DOb56zQJDKZXLChY2BRignWuWhYw20nDXRxKkPkjZ604R/ApNEjQ59acY01nqfeHFG/heMZkmccyXlm7ARtprNpv3MVcZiV7Rs9r0JOiGnHyhLC9FAIqEHjfwpTujNoEmdHtjEUG4Q2SgAlyYtEYLoLbkjCTFT/HyhoeNEZ7A129m/OgA4hFyGYeDkZq7bV9i7kvkOtKy3gP5Z/o5QFa0Crlaj2BoWf2edtwmr4y/xCSYOQJ8KnE5K25r3oZ3ZVUxaahT9/waHdo2qA9aPmzG6Aw2yijOtsDAlQBX5XHiNmAO7tEUIpuDVtWQIsq+1Fv+0tg+yDdGdIsbzNEXtFqLRVLl7ly7Fc2RFuVf5pe9LuvdzYY7qfG97q5YqH2o8am7i0mrjQpSOUiShpRiMjcNWFnFM9d5DClwCzZqJc35TCXOCoIuh+a//wv+H71nYM0b6ym8UnzMwfk3dX276F1YMbSMWPRFJlS6BT3SuKoEKk+dhFWXx5th7G6Ad3zEekCQVOahnAC8AnR4MB5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0xML2hNMjM3NDVzRUhmb0N4dmh3SnJkc0Y0ZERJc1p4SDBtNnpiL0pwUGNm?=
 =?utf-8?B?VkVIcDlLSy81cWtxbGpSdkJ0cWF4QUl4L05xYUNHcnYxaUxPZDh0dTU3bzRY?=
 =?utf-8?B?OWdCQTJJSUJNeGZzNFBxWjNKWk9UdWRyTktvL05BUEl0RUYwMXZ0T1NBTlo4?=
 =?utf-8?B?Z0xWbVhobmFPWWxsQnJKc0tVL3c0b0R6ZnNaemprc0NUZm13cWJDMXYxN1dF?=
 =?utf-8?B?SDlheHRiV3p5TzhndjFveTcwOHZKaVpGVi9ndW96eWR2WlRNcE9CVmNlVDBS?=
 =?utf-8?B?QWl6dzUvTjdkQnpqZFFpM2d0dDlBWTVMWUxqaHN2a01ESVd0TW9CenFSeHNu?=
 =?utf-8?B?YVlPSWFURXYxSXVpZ3ZiR1YxMDlqSlFvWi96M0piTWNsa3B2NHgvUWNZWFhG?=
 =?utf-8?B?MlNlTStnaW4rVDU0SDk4OXdraEFCNW1uazRyOFBiVHRTZjZ3VXZFUU4rQ2Rx?=
 =?utf-8?B?VWdORG5jTE9FUjA5aWZhZEM4RFAwZW5qZm5EM3NHemVwQi9iRUI1UFUrYS9O?=
 =?utf-8?B?RUFiY284WXFOVzJCQ3FYTEl0em9iYVArWjZWcXV1S1hKTmllTjNJc0FRbmlq?=
 =?utf-8?B?eEdRNE52a1U4Mm1XcG4zVTJEaFRDZXA4VjVKbk16VjF3bGd5T3ZYNDR5cStT?=
 =?utf-8?B?cWhUUHp0TTM0aWtibW84Mk5rYkhIZG4zQm9IaUk4UXRBSVF3cUNZTWw5YWV6?=
 =?utf-8?B?anJKZGNBL0dOY1FadHlSUXpwa1FwSFV3cHBlNmJNc3VtZWR5ZjZXaWcwRmtZ?=
 =?utf-8?B?bWVsUmlwd3VpVlkrN015NHVTZXhXVFRxUGZJcXlSSGFZUCt5UmMwdjJzc2xh?=
 =?utf-8?B?UFk1SHovUG03dEJucXUrZGo5ZjBkZUdPNlpJM3pvNWlFeDl5R2p2dHhzNmVy?=
 =?utf-8?B?dk1pdG1zK3VTQWlKVUtiMnZvQXBPY2FtZ2gzdVZWeE05OFU4Q3cwQ3A2L3E1?=
 =?utf-8?B?UFRQVkp3cjNaeThtcXIyNzFTV0sxc1ZtekNITSsyUkJveGhBTFBUV0F5eFlP?=
 =?utf-8?B?QzRCd2M5NVNhcDVrUjJjWmNVcFdKR2lWdHoralhpYXU3T1c0QndzWWd5NEhT?=
 =?utf-8?B?QkFMRXpsTHJYTmYrdGY3SlA5bU54MDRlWTdiVzRGdmxKWnhaZ0dHQm5OQmZ1?=
 =?utf-8?B?R3RCL0JwT2loaTZOZlN5SXZZemM1ZlB6Z09vbW9TOHhTVGFBQzN1TGZCR3FV?=
 =?utf-8?B?bUJqeGRVb1lrWlVrTzg4WWlqUGkwOTZsRGYxejdnNGUzNHAxY1hSV0E3K29t?=
 =?utf-8?B?OEZrcEc1Mldzd2FrOUM1dDg5WGtPK1ZEbE95dG1jUzdxM2NYS0FqeDlLa0F6?=
 =?utf-8?B?V05OTjVuaVFYRWdIR2ZkTmJuT09FL2lpNm0xYUI3NmVqcFZicU0rU0lnQUtp?=
 =?utf-8?B?MmpwQW9Za2h4dllOa3p1TWFLR1VJZEo3b2FndFR1RFRNbmNMR3NWcmpSOG4v?=
 =?utf-8?B?cHY4ekVqbExUTFFpMTBwZVlUbnI1UU1Talg1QTNld0U1RVFPWjM4cVlNMjZE?=
 =?utf-8?B?UHo1M2dNSnZFa1ZDeDc4aWdOUlRxT1NINEsxOUkybktBalJiNUNGOEs0c2ZJ?=
 =?utf-8?B?Q2NDWUxmc1U5M2VwZ3pqMnFKS1JiSEtmSDRycHd5T3Zqb1VENHBxQkQxZEFS?=
 =?utf-8?B?ME5Pekg1SmlHUTVWWm5JMVczTDBKc0VqamM5RVRHODZsbzdlbE0wRkJ1Tk1q?=
 =?utf-8?B?T0pEMkZDeW9LK0plenlZUEdXYXVxOGVYdGdlclAvRTk4b0FNaXZTdlVHdHdH?=
 =?utf-8?B?VFdFS2g2TFRrSjZYMWJzakRxT0tSTEIrYmZYK1ZjZUtUM3QzbUw3eDdidEl1?=
 =?utf-8?B?NWk4bTIzdzJQSUJXN1VKeFlIMjRLTGUzKzdRdlNCVVNOdlUvejAyUjRza0tW?=
 =?utf-8?B?RVhyRVdRS2dCZmhQd3BtV3kzbXA5YXQ4Q0VtNmd5MG5CMFdKeVg2RzVZV2RM?=
 =?utf-8?B?VkE5elhsMjVSUjZvSlgzQ0FDSVBHcXROTkczckZTdDFSUlpocGlFRG10aGJv?=
 =?utf-8?B?czhHdENyNURYckx4eVFNajFsSjJkbHF1WmlNSnUwc0piMVpyZHZsc3Rncysr?=
 =?utf-8?B?ZGNsckY0eG91VE9VUk1EVW5hZmJTMWpNZmlBVU1tK2tCLzhaSHFKUHlTbUY2?=
 =?utf-8?B?eTVXVTNidHhZbnJBMVpjODZudTRlQm94MFczU216OHlEMEh1dU1PTWV1ellE?=
 =?utf-8?B?bTVZNDVISTZCQlZhYmM0YnBEWUhJcnVuOW80a1RxMGFFb1VURlRBTkQweGxv?=
 =?utf-8?B?RGdOdTEyUXVESzBsaFFETllobnNOZy9ZdXNOTEoxM1E5R29vOHpWNG1HbVd4?=
 =?utf-8?B?UkVRTEwxZ0VOeFBjbDJUSlZrQ2JNMkJLV2tVZERyQ1VpWm0xMDdBazI4Mk5s?=
 =?utf-8?Q?CB7a9v02OUCJu7CKY0b4AeRyljpIFzMemI9YJIHbVHLvW?=
X-MS-Exchange-AntiSpam-MessageData-1: 4OSfRZ1J7sUthg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e56759-af24-46f1-b0ed-08dee9428000
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 05:14:56.2302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVPCAjC6gwkKYB4HueL5of2m5fAdUl3ANdFzvXFbm/2q2RwpNc4T4cooWfg6UBLPB66PVPS0b0ZxjCOyVPGhYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5973

On Fri Jul 24, 2026 at 10:22 AM JST, Danilo Krummrich wrote:
> On Fri Jul 24, 2026 at 2:46 AM CEST, Gary Guo wrote:
>> On Fri Jul 24, 2026 at 1:18 AM BST, Alexandre Courbot wrote:
>>> On Fri Jul 24, 2026 at 8:32 AM JST, Gary Guo wrote:
>>>> On Mon Jul 20, 2026 at 8:21 PM BST, Younes Akhouayri via B4 Relay wrot=
e:
>>>>> From: Younes Akhouayri <git@younes.io>
>>>>>
>>>>> Coherent<T>::write_to_slice() calculates a zero-byte copy when the fi=
le
>>>>> offset is beyond the allocation, but still calls
>>>>> UserSliceWriter::write_dma(). The latter rejects offsets beyond the
>>>>> allocation even when the copy length is zero, so a debugfs read past =
EOF
>>>>> returns -ERANGE.
>>>>>
>>>>> Return before calling write_dma() when the offset is at or beyond the
>>>>> allocation, matching simple_read_from_buffer() EOF semantics.
>>>>>
>>>>> Fixes: 016818513936 ("rust: dma: implement BinaryWriter for Coherent<=
[u8]>")
>>>>> Signed-off-by: Younes Akhouayri <git@younes.io>
>>>>> ---
>>>>>  rust/kernel/dma.rs | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>>>>> index 200def84fb69..36b72fb9ab46 100644
>>>>> --- a/rust/kernel/dma.rs
>>>>> +++ b/rust/kernel/dma.rs
>>>>> @@ -1005,6 +1005,10 @@ fn write_to_slice(
>>>>>              return Ok(0);
>>>>>          };
>>>>> =20
>>>>> +        if offset_val >=3D self.size() {
>>>>> +            return Ok(0);
>>>>> +        }
>>>>> +
>>>>>          let count =3D self.size().saturating_sub(offset_val).min(wri=
ter.len());
>>>>
>>>> This saturating_sub is redundant now and should just use -.
>>>
>>> Or even better, you could use `checked_sub` to perform the test and the
>>> subtraction in one go, while avoiding potentially panicking operands.
>>
>> I think the code is clearer with separate EOF check length calc. This al=
so needs
>> to return `Ok` so it's not like that you can use `?`.
>
> At a first glance I also thought of checked_sub(), and I think
>
> 	let Some(count) =3D self.size().checked_sub(offset_val) else {
> 	    return Ok(0);
> 	};
>
> 	writer.write_dma(self, offset_val, count.min(writer.len()))?;
>
> would work perfectly fine, but compared to Gary's proposal it still calls
> write_dma() for offset_val =3D=3D self.size(), which is harmless but unne=
cessary.
>
> Another option to avoid the panicking operand would be to keep saturating=
_sub()
> and add the check below the existing saturating_sub() call.
>
> 	if count =3D=3D 0 {
> 	    return Ok(0);
> 	}
>
> But this is also less obvious, as it hides a bit the fact that the proble=
m is
> about offset_val when calling write_dma().

So far this is the version I like best; a comment to clarify the
intent of the code should also remove all ambiguity.

What I had in mind was something like

    let count =3D match self.size().checked_sub(offset_val) {
          Some(0) | None =3D> return Ok(0),
          Some(count) =3D> count.min(writer.len()),
    };

... but I understand the concern that this is less legible.

The most important imho is that this check gives us an opportunity to
remove a panicking operator; granted, the check is enough to guarantee
the panic case will never be met, but it's still cleaner to not use
these when it is possible and easy to do so, which is the case here.
