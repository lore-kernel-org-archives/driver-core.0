Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AA424E4C3
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 01:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784856004; cv=fail; b=UctnIyPF/gitA+RnbdlWZBQTdowR5GKaMGN4S8ex+YFFpFmfi50N2RDS+kdNlD2zj3G295kcvRJRdo4S7wTE3dwor532BWyC/X2EJEj9Zc98OxL7rtzzqUhHNwZAyGJtNvkZTCmFb0IB6s+ZHhKPTT8ASnTysLRYgJEg/Vh8Ioo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784856004; c=relaxed/simple;
	bh=VgfVJMjDoFNBrJHPVv6vN4ZUW3Bus5/m/VzwqEbFrlw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=m1ADMtUZjGnGeaOx37Hd+UtaSKeEVWZ+2EJ0vTeQ/KCOxJB+zpvBkojdVVXErSD/6zxGEKcVouesnEiJ5RMdRVy7JMjYxjMUPCSfnwXhZukNobwf0bDlGe1E+J+iBmGgT7ZB5abBBAXGiDx0upupPsl7J4CRcvkkx/1NpeWSYHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aaZKudMU; arc=fail smtp.client-ip=52.101.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aaZKudMU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsCoR2gmaX+cDB6ufMkp6PhclThPZ2Qvax1eDnZ15WpCHsLW++Eaq7yhjv6BfCYLD9mhuxcK6omwLw1CXMpBy/d/0DG3MV9V/xwN4QhCMePbesbvT4cM5tl2C9l4GzwJDo0TG1AtKFLnC09VmXvGmGOR+Zj9a/ShQXV43AlFXgy1fxy7QNEp4KnS+mMbUldj8vG73zW4XjcMTu51GOGiR6eo70ppV+CO85wZK5BRByvT8ScVnExD782h24spAxk4bDxsGDM/pjqLx4R0FnWkGKVWy9uS7SmtpxYYngjhgsrss1IC/+Bly/yAJzk/Ovi6SfORSKFEJ9abdArOwx2ySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In8sWifuZeqWCrdYvuW+BA67crBMH67+G6ETOccoVzc=;
 b=KOrJq/Cz0acJPrurVyNupCcn13ABdw7aQ5K1a+DO/ezo2FfXWEalvMX9fO4f5CpedGcQ8jIqgbQqycMOQwLTNwZ6hHbL6I3H0sH6WgtLPSCSoazDN0kjN74XWos5GgcHyNC2XpubSDbyntucLSCyIrjazwujUJbyaijfmbgQvIWuV616+Woil6QRKFPfjY2ULqPtb2s7f3dHC6MLvEZw4oAy4GHnXcblyGbrZKK+OJVi/oJy6ODaEuQfeE0F3XLhkTbxJA4e+CxJKMw/3YeV/y6UbcPKVVL2Os9c+Kna5gEOI+xLvvLTH9VL4yMbi0IUz9B6dRI9gnhNsQenfDEtow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In8sWifuZeqWCrdYvuW+BA67crBMH67+G6ETOccoVzc=;
 b=aaZKudMUzbREofyNLjv4mFDbGm3EuhKCdCCNIVkWe5B3h/kOmqZbJL2VK+AqxZVtJxtl8ZijDv9bNlPMWO2zoJT3xTB0ZhGwcBb9T2o0BXVJTvW5Oa5wImDuseBLyVOestGUwy8kfo1RRhx51xy21gDxaxctYfs5XMPYFG2jsIr+KewwzrCb4yw8i0HHZF23PdjsemV+vZ3bYk/Qrq9ZInHvyFss/EJCX3TpjVvYQsdb2mOBVZwvutZbPswwfSTrGleu+LuJhRPXCKe4SiO76sy0YCatuodb4KSRFP+jG1j7pXpkajvVQ9s+/Ns7Ck5C59ng9d2BicHsDt0DaIQJgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by PH0PR12MB7815.namprd12.prod.outlook.com (2603:10b6:510:28a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 01:19:58 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%6]) with mapi id 15.21.0245.009; Fri, 24 Jul 2026
 01:19:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 10:19:53 +0900
Message-Id: <DK6EN7URPZ6E.1OGM4A8LHLRV1@nvidia.com>
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
To: "Gary Guo" <gary@garyguo.net>
References: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
 <DK6CCQDJHK8E.1DZHVZJDLS97P@garyguo.net>
 <DK6DC28Y2CZY.2IOLKS3T81VG8@nvidia.com>
 <DK6DXU51V88J.23CVF9ARSSGT2@garyguo.net>
In-Reply-To: <DK6DXU51V88J.23CVF9ARSSGT2@garyguo.net>
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|PH0PR12MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8ff116-c58f-46fa-29ee-08dee921ac76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|7416014|1800799024|22082099003|18002099003|10067099003|56012099006|4143699003|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	O2xW5SVCh1yOxCYU57yZpfXRE6CpDrfiifjCk6LhyUPHcudv2Fdbxu+sTgcm++RHF1nWbfshLX70h6NgWjmjTYd0sCRlYzE57Ox7GrzIVGNaahrjbwmrjzqt6TTGCZEtWnS7/cLat+Vd9+BfcWUA2z91rFeRw4wQytTLB9gVwXr9Z8COmaXoV70SqaPVTwHDTJVT2lbi2GHm1U7BOetVFUBBhPI03dFeOunTuEVpUF1trOaBrHNdtcpb/pU3QFoVftTt5pREeUNuagqLv5/unIh5zetGh1COyHjU+jdZ/kmqGgJVhEm48LyYlG0iLh9sW8RD9bD2saFAUTKed+z5/UrVE1xD/T0DrM8s60BTe/RepVu9WGabyUp84jjy3hn5QaUVnbVNOFspYJfLeSCJ1cvXRDV7u53Jp3B+aEm+wYGM7/FsIj2j7cD1i8rs7EpwHaELieGKagOO+JEKwezh1LDQ0IMqx+N3YCgSremK+4ryJdKOTgb1YSEcBG12zfZVDKu/Z0DBm25NfaQOCN7cyt4XbdQ+L59cVTaMtI4KX6WHkOATgIqm5q0WFmmcrbG2Mdz68cYmAvlyvP2ipnt3C2RwzW0446ZBXTMnaNbZpKEaTGP63ggFuB0yYFscOCJgF02RVAvpuJSUWs0TCiglQ4Bui9gdfF9qJQX8q18i9+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFJXNmRDazVXOUVneEhLUitnVUlhLzU3K1RjaWhmMTljZTZFWHl2bE5kaHhp?=
 =?utf-8?B?SFdIZGJxS3laalhIaXBHYUZPNndqLzI4VStzM0ttcDB0dkExTytFVmVCQjhJ?=
 =?utf-8?B?WHVzTFRiRUJKelFZRmh3cUd6Y2V2OVFrWm1talcxUlBKUS90NjFBSFVWZVJQ?=
 =?utf-8?B?cTJRVzdRNHRKaWQxYUtlWjV0TGw4TVVKRmlUVVhoQ0lhNW16MGtOQ29DL2dh?=
 =?utf-8?B?YzcvNDRzTDRxRzRqcVRBd2l3aisrUTB2QU5UWnpYSkpNRnJyQTd5ZnNrWjYv?=
 =?utf-8?B?ZFFrOTJZOHMwaFI0YzVJNXY4WUZESjd6cThtS0NJeWFXck5SZGZaNy9VV0JS?=
 =?utf-8?B?NnVMMHBXaFhFVk5ERTNWQzRRRFZlcE1wMXZyQ0t0QzVHVzBFZzg0bVFDVFBE?=
 =?utf-8?B?Q3BLZHdaeGtZRWYwMmFIT3Nzb252ejREWitCQzRBT1RrQXh2Z2lXUTdvMnVt?=
 =?utf-8?B?WWtXTW1QTXMyY04zZlFFNTB0RDVyNG5PeFJtaUxQcTJJQmNicllCRmRsTWxw?=
 =?utf-8?B?eHhTbnBTRFRCMXNvRzd5eURvMkV6MnJzVEJKcUxSMDR6VWJwdzhOSnloN2hk?=
 =?utf-8?B?QWdUU2RSNHRmME5RM28vajZ5NHppSlRoSXVLZlZpbmh2TE84bjJtRXdGQkI5?=
 =?utf-8?B?N1B5K1lyWXUrUGl3RVhCSmUwcElhaUZIYjIyZjVzSmRHOUcyV1ord0RibGpt?=
 =?utf-8?B?dUhpOEdianIwNW5sR1cyeVFEdWU3S21pOFYvOWtLYUtlNFAvalNqYXEyb2d3?=
 =?utf-8?B?UGNpT3pxNEQvMjRKN0ZORWVNWU1HTmorbStzTDg0djRJMWZDSWNGVkhndysx?=
 =?utf-8?B?VUhvV2ZwQUwybU9XQXQwa1ErdmJnaWl1SDFhTmp5UTFOcTBmU1h1dUlyUUtK?=
 =?utf-8?B?UGJlUk1reFpIU2Fsc2x4YlZVcC8xT3ZNL3BxTFJDN2pJQXJYZTFzUjB5eHky?=
 =?utf-8?B?WlcxbEdVNW9LZTJSTWwwQ0M1VXdJWWhBYjhlM1BKNjlaWTd0QWVXN2xKVEo5?=
 =?utf-8?B?cDIvMytGYm9GaUZudFpadUdtdHJ5UFJMRUoydUFMV1lqVlltOEtxQ0hkdzRx?=
 =?utf-8?B?WVVvRXllc0pSSWg2WEp2dXlPdFZmRktPeFBBUzV6S2dORGdCRStIWFl5bDdl?=
 =?utf-8?B?allyMVFmQmViSW5XRkZpZ3FyTEVwN2JUWEwrZXdaTlIydXRqdWwrSFVJKy9Q?=
 =?utf-8?B?cDFLbXV3dVlBR0ZyVWoyU3Y5U21ndmM5TU9QYW5oLzliZU0xZCt2US9ncnNy?=
 =?utf-8?B?WGltTkdNNnh0U2paWHR6UkJXMnJyTFlEdlAwMWF6Zi8rdVV0QXJTVmp0RGJw?=
 =?utf-8?B?MVExMWw0UTl6L3Z0VzdycVlFcGtlMzNURVk4K3YxMW80NkpKQzBEZVRuSENZ?=
 =?utf-8?B?RzBnZ0NwcEk4MnJXQnJDaGJjYUhnNTdGTjBEV3lJK0J0cERaaitJTmlqZ0cy?=
 =?utf-8?B?NlpTOXk2cmFhNFp0ek82L1lZTnloL05RYmJ1Ly9WY1B3V1I1TnhncDlFYVh0?=
 =?utf-8?B?T2VOalRGaElnNXJnazlJdFhZcitSV1pLeGYyK3l3MnVmYlRsVXhtbnEwK2to?=
 =?utf-8?B?VGs5MkNjYy9ibmwxcUlUc0JUOUdtbzJlUENVajBkMEoxcC9VaDVNdU1LMVpB?=
 =?utf-8?B?MDhsQTNnWkZOelFGcVpFY0pTd0JGN1R0eFd6cEFaRHF5VWtua0xwNWpqUy9u?=
 =?utf-8?B?eHBUeTE5RWc5dlMrWEhRNEhwMGhiOEJQTmxzdXYzWVVhdFBZaXlydkovQ2hP?=
 =?utf-8?B?dWxkYXJiU0xVanUrVTZMT0lBQUhadms1M1pFblZJZ1lTNXl4OXZCc1ZJdFln?=
 =?utf-8?B?OU13L1p4ZWcyQkFaMW53dE92L1JWSkd5ek9YSVJMZlhlNGQ2MlhJTEFOcDVG?=
 =?utf-8?B?S2t0d3dpbVRHSjBxNm1kZHljbllOaWRnMDJCdTV0NkZYK2JuSUlIaC93Szhu?=
 =?utf-8?B?ZUNidmtKUnNrZEo5TG5Dc3luVWo4bnh6Z2psR1laRjZuZ0pUMXd6N0gwM3A2?=
 =?utf-8?B?M3VWY2Jod0ZDM2YxK2g0Rlo0Q01zMG5ZaVFoZnhXR2dDUXhqcWl2SUpDa09p?=
 =?utf-8?B?MG1OSVR1SzN2RXYwVXRMdEp3QlVGWUJWZTFuWVlPVDA5YzBuL3FlTnJkQTlv?=
 =?utf-8?B?ZTVNSlZBRkxxT0NxNFZZb3BJNUNMTGptZmZOdE9xa1d3M1pHejA5R1Z5Y0t2?=
 =?utf-8?B?Yy9XMlJhWUJQcjZGejVGSGIvV0t2MXlPRVRPV2dYVCtydVNvcno5RXJwR1Ur?=
 =?utf-8?B?Mk1WSHJqKzltQTU5S2FQT1ZiWGMxWTFpcDRublhnMXUvdVB4SVI3ZHQvZG9R?=
 =?utf-8?B?aDgrMHByNWkxeFJDUktLdGM4cXhabTgxdVcwc25UWDBtS01PbS9mZEc0dys0?=
 =?utf-8?Q?ZE35eowTAPpjzpDwApfcA/xoN6VQNyGJaxsiAocBr7lCY?=
X-MS-Exchange-AntiSpam-MessageData-1: nULQ9O/qngY22A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8ff116-c58f-46fa-29ee-08dee921ac76
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 01:19:58.0102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gg1J7WhpewI+d1DLx+4WYtc1L9snE2x92yBy0oSrZS2ET762oO7kWzfWkACXUfzUr266gPuxRcDMGIV/I67/sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7815

On Fri Jul 24, 2026 at 9:46 AM JST, Gary Guo wrote:
> On Fri Jul 24, 2026 at 1:18 AM BST, Alexandre Courbot wrote:
>> On Fri Jul 24, 2026 at 8:32 AM JST, Gary Guo wrote:
>>> On Mon Jul 20, 2026 at 8:21 PM BST, Younes Akhouayri via B4 Relay wrote=
:
>>>> From: Younes Akhouayri <git@younes.io>
>>>>
>>>> Coherent<T>::write_to_slice() calculates a zero-byte copy when the fil=
e
>>>> offset is beyond the allocation, but still calls
>>>> UserSliceWriter::write_dma(). The latter rejects offsets beyond the
>>>> allocation even when the copy length is zero, so a debugfs read past E=
OF
>>>> returns -ERANGE.
>>>>
>>>> Return before calling write_dma() when the offset is at or beyond the
>>>> allocation, matching simple_read_from_buffer() EOF semantics.
>>>>
>>>> Fixes: 016818513936 ("rust: dma: implement BinaryWriter for Coherent<[=
u8]>")
>>>> Signed-off-by: Younes Akhouayri <git@younes.io>
>>>> ---
>>>>  rust/kernel/dma.rs | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>>>> index 200def84fb69..36b72fb9ab46 100644
>>>> --- a/rust/kernel/dma.rs
>>>> +++ b/rust/kernel/dma.rs
>>>> @@ -1005,6 +1005,10 @@ fn write_to_slice(
>>>>              return Ok(0);
>>>>          };
>>>> =20
>>>> +        if offset_val >=3D self.size() {
>>>> +            return Ok(0);
>>>> +        }
>>>> +
>>>>          let count =3D self.size().saturating_sub(offset_val).min(writ=
er.len());
>>>
>>> This saturating_sub is redundant now and should just use -.
>>
>> Or even better, you could use `checked_sub` to perform the test and the
>> subtraction in one go, while avoiding potentially panicking operands.
>
> I think the code is clearer with separate EOF check length calc. This als=
o needs
> to return `Ok` so it's not like that you can use `?`.

Is it clearer? The `checked_sub` is efficient and makes it clear the
code won't panic. And `ok_or` takes care of converting to the right
error nicely.
