Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022108.outbound.protection.outlook.com [52.101.96.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE6572617
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 02:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784859143; cv=fail; b=FOnhaP9sv3D6aDNUgOlhaBvpjrQjofpar1gbhvNBd2cPZAnSgzuxFrYOpzfxY5ZazKG2zzhhNDmsUsupXf+MVV4b+oQjQOXY5/cJa+7Ohi4WMHZUG45I4KfknXJICqvkU7sQUgm6psvxXYiUTUeZuBFZdsyrehFZTyaD6oLIjZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784859143; c=relaxed/simple;
	bh=tdyT11Ak/f6vs8X+zMVfiO1OXUlveSelPhQoqVKhvdo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=upGUKGmSAn6udB31MV/oqdNL9xWdpUupakcv6i+coYptZe/sR+6E5ZkImO5oQAShtWxWKf/3lB2ukk0LPFHIzFi+Qy3PFGP2h86Zzk/JW/X32ffwrHG0oNUQFIWfFaKpw111J364Ay5fuELu4+ro/ya8wEWfkGI97YpEz87xHYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nHhkjVeb; arc=fail smtp.client-ip=52.101.96.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nHhkjVeb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLMB9WE1gEBKhNULYr+E4YxJdJoZM5RE88fL/5S6o8n7E7ijtueX49vuXRFbL4PGuC80HMzd0JrNtZhjq4oyhu7S3vQ0bV1P52vckqboitATFRAS/YxQdC5iVj5mp33Xq0iiVG4vLhyu/xRDfUU8fSRAnq3QyK2l6dxBLT+K0WVVrtdaV6I3iTwtRo8y3HZPFcrmiO/yWtZc3SHJsI+ZghjIpJ5FCUo12AAp9ItfKAJW9y2unE+z4z1V9oxBDK/8RBUKaRLDGuCErgeDKwGzu/NiqGLC8ODI+XNXWAsiCOqEw7btbckdhHIfSkQkQM3C6h94Ca510DPBEGJf/coaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XSnpm7VdU7dhvvYps8w6kAgUxVNiPsigMLbDwZdHaM=;
 b=OZYZw4leoOwUxS429GA+FbTODn+lvL77cshrcWRKY3g9Zjy+td4T+x9aWvU6Bu2rdRyechDsI0emSfaQNxWEfmNGYbqI9EgP1ComhRs94QPqAMZpak8mgf83V2hrTJ28ke5xA2wbFWu3JWotAZjLbmofvO3ENWBZR+rm4NSNMU0R1B31RAniwpjFrpKvZ7c9DTrDxOtwFiwgQI4OsnIGciMC49ZcylAbwrOfgnQV6E+ASaEUcmdyk4vTQjFutzC47RkUJ4Y48xTEKIMLjCbeUAUe7zhkpOZBSKLqjgaG4CBCoTtMZepGi4f18rjB7mXHP7mGOQaA/YUDSNxNse/VDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XSnpm7VdU7dhvvYps8w6kAgUxVNiPsigMLbDwZdHaM=;
 b=nHhkjVebqwjO9ePYERYGUVpUwbhDF2XlIVHwfJX1znr8Z6KBgS+jkgc8ueHm0zpZ2Pzd5ia0iEdTLd9cjZudcmSMOb+g8Rasxmq0vj4HVqLyWlhzQcaKro+szK6WNBosJgPjwNhyF4KI/ahAuzyE7yBqqu0RPFTTgmXYzA0/yZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7088.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 02:12:17 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 02:12:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 03:12:16 +0100
Message-Id: <DK6FRBI877L8.1I9EEYPFR9JEP@garyguo.net>
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
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
 <DK6CCQDJHK8E.1DZHVZJDLS97P@garyguo.net>
 <DK6DC28Y2CZY.2IOLKS3T81VG8@nvidia.com>
 <DK6DXU51V88J.23CVF9ARSSGT2@garyguo.net>
 <DK6EN7URPZ6E.1OGM4A8LHLRV1@nvidia.com>
In-Reply-To: <DK6EN7URPZ6E.1OGM4A8LHLRV1@nvidia.com>
X-ClientProxiedBy: LO4P123CA0621.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: ae47d317-3537-4f7f-0772-08dee928fbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|23010399003|1800799024|22082099003|18002099003|6133799003|4143699003|5023799004|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	gvpnY+1tVODLFR9JbJkkyBX7LSZjSWQorNAU7HuODV9XZe5hIjfFY6fJsP8AeYV7fM0pSrr1aXlWTJMkWUyjxv2sYzg6Krtzg7tAGyIdOUU6rJlnUmJ0n3o9oLWdZETkyqB6tRE7488iEGNfBJNVqpD8cUUfReFSYk4VsxLiBESDwbNd4mmzUncB+0P32PMmgO2uc6wCUZ+vpwW2OCnyIpc+9XOrXvCVleGD+NVoA77P0Safq8oiyu+XpH0yzyKqUVYFwXQgYE+9DeREsJoBoAdu4GdRVfVhHcXvN85ro8+1gjZJTR8SRAf4vShX1aeUvHaXtArkQH3z7sRBC4PlZq6uz8UhKNwGW0djIG6rCK5eNehux6aPmeNLbca350D0K3x4vatkbBacVtuD7MnlqEUTy7nq/aDcpg3GXbzXjVfbtQ4CxChPK/DlEyQns74GW1Nj+XcRuLqaSD/qEgzzqAvGEFM7qWt01MfOz8MILKdqSSKFrRd5zp/IsaiZLCL8uSEaOXkpkNl7LEbulpFdTTxQ0oKA9r8tBRnX/zBdbcfqBNpOV3gldDa70EZLtb1YE/G/YZuERc4ljpZtbQqebMh2lIMP9rqHf9fApBICzodOnVIIzgDK/zzVFq/fLKaCViicPanLIHv1BVmpQLRV35mRY8WPbCfIPEKzE9kTTDc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(4143699003)(5023799004)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVBKdzBWcGhBN29RdVgzOEkycXRSN1I3c2xqSzZGV294T1ZxUDFHblZTS09j?=
 =?utf-8?B?UlFzRlhHZHpSbzgyODdHdzJXWTFZOTNJZUhDYkFrZ2VDSllzQ2dmc3pnT3FW?=
 =?utf-8?B?UVd5cE1HeGNHRzhWNW9nYVdsTFBRdXJvUDU2Tlg2dXZYdE5YNEw4a2d5VWV5?=
 =?utf-8?B?cUE2bmh4ai9xUi9OTWtWZ0xUeG5nMnZQcU01RzBRT2MxMmhtbVJ0Nlk0em1o?=
 =?utf-8?B?VWh6WThDWjBQVkhLRHRnVlRhNzFWSUxuWXZRUjlZU0FJcVJNOGExckZGMWhJ?=
 =?utf-8?B?WEVxYUJjS1V4ZUxjQnVPd1JZaVVMNkJ2aVdqQ3NuWkJQVUNQUXRMazNSMHVV?=
 =?utf-8?B?bndQanZJQ3AvR3ozdUZzM0ExV2VCdXVZczJwcFZuRWwxdDFUbHpOUEE4KytQ?=
 =?utf-8?B?M1VpZEpsQkpLYWxzclhGVE92enJ0NDRvNWlvTU1VNFRGY25vcDAzbWRnb1F4?=
 =?utf-8?B?WGxaSmpWL0p3cm5ZZzV1TzRKNVUxZVdsY1lKT0VFTERwdFNUU1lCQk1DcjBW?=
 =?utf-8?B?VWJhMEM2eENUK085TmhHbG9MdXhqaUZJWlZsZy9PSEFkL3Vuclh0TTVrcEIx?=
 =?utf-8?B?SjRxUlBwaTF1c0VZbnozcFNEZ2xLQWxKallEMVplOWhjQXAxc1A4RGpyRHAr?=
 =?utf-8?B?dDVwZU1CbHpSTEJYYUFJa0RpV0RWSnZSTnJtbzhZYXBsY0FyY3UxVGtWbjho?=
 =?utf-8?B?T3pjOVZGcjNwWjkyNUpkV2tWRk5TZjlCM1V6WVVOZXQzcDNsOVRYam5FVHhv?=
 =?utf-8?B?cVdGdndJWFdBdmdwTEppOGdpYW9SbFVQYi9VRzRaRVFwVElXNkRKTHJ0bkhw?=
 =?utf-8?B?TXphcFQ5SE5PTWJnL0dtSVlQK1JvZHY4dS9iYmdzUXVUUitHcnhaekU2ekdW?=
 =?utf-8?B?S2s0VTRHa2Uya3V6YmFBajd5dlRBVDM2cFZrYTZXOTRIWGJSZlQ3bjUwOW5E?=
 =?utf-8?B?VTN1VHFVUmR1eFBxUitjU2hPNnE3NFFrQ252ZnFST3pTUitXWUowWWVTdGdi?=
 =?utf-8?B?UDhVSk15c0tRRWt5NlBvNkhhTExiTnFybDhBTjdJaVZ4WDVwMW1sZzNRMUU3?=
 =?utf-8?B?anNVd25mQVVZblpLM1d5RnRsM1RXY3FiRngrMnd5NU5nNkFGZEZBcGdYNjlv?=
 =?utf-8?B?alBocG0wSG1CcjFYQlVWRitOWjF4N3hiMEY2TlRhc3JqR3p4WVBjOEt1Y21M?=
 =?utf-8?B?SkpjYTVhNEhPSkhyd1dVRDRaZWJMOU1kQnRRelE5Z1kwdlErWXVjODFzTnJo?=
 =?utf-8?B?Q1g3cnlIQWYzSklNbU5jbFM2RG4wSlNEZlFQZkdScUtXMFNjZVdXREgvMXV5?=
 =?utf-8?B?LzVzM1BlNkhQVWtzQ2pDTzlNTU50N29XNE5RZVVCTk5zRE5oUUlGY2Y2alZD?=
 =?utf-8?B?OEFMc2pvQndGendBN1VuWUROY2t1NzJCTkd3Yjc4azVPbnFSMDZJMEVYRnI4?=
 =?utf-8?B?azZOb095KzE2dHpIRlprdWU3U2wrU1hwM2V2elZQVDVHck9Xb3FYUStwYzhU?=
 =?utf-8?B?NWtRMkg1WEZ1aUIxTi9CV2VjYnFUdENmVTJPRy80L0psenZleTNwcWZaTWxI?=
 =?utf-8?B?NDFUQU4zNnFjbmRVbk81eVg0dHlsbUVtLzErWXFrNmlJUTFubGRaVzgxTEpv?=
 =?utf-8?B?SHFHY2g5TVhxTXQ4SWVhcFdVejZnZlZyekZsNmh6Snc2YjlCOWxWUlhpekQr?=
 =?utf-8?B?UmhpYm9uTFZxOC9WVENGQWZiampnT2ZWV0p2NGs4SDBEcy9JTXVlYk9oZVAr?=
 =?utf-8?B?c2QxMG9ISjVoTHd1UVQyUVE0VVl2YmRsL0xEUUhCRytKSVA4QjB5bnRrWFk1?=
 =?utf-8?B?NEVEVmNXSjZ5amhVYlZLTStFRFRldmNaeUVrdVI5MWlCVEt0c3pCbFJYTjJD?=
 =?utf-8?B?c3NIQnlTMWZnKzhjL2lBR0tWNi9xU2tESFFTMnBIVFR6cGRjSDdrWkRKYTEw?=
 =?utf-8?B?YjQrc3JQRHAveXdQM1BsYUVmRWpUYkVWQXJva004VGwyRjdUU1RNdzdBb3Y3?=
 =?utf-8?B?L0dJNTRTTUVOK0svaTd0eEk0ZnRYT0EweDJDaXJGNTBIUjZFc3dLWDFEQXNE?=
 =?utf-8?B?LzNiTVpyOE1TaXcvdE14UGUveFFEeHhpZXlMNVVjVStrUk9WeTdIZmd4OXIz?=
 =?utf-8?B?QnBrQWZPN2xhL1RlVUJ6WVpodzhnMm8vTU8wSU4wTUExM3RHQThxT2VjWDVM?=
 =?utf-8?B?ZGpuRDhXUFFCb1p3OWI4TFhsUzNQQlNTWG4rc251NDI1OUZBY1c0eEVaRUlW?=
 =?utf-8?B?Y2NaMk9oV0Nqb2dqT2wzejJzRjY5TFQrb3YxdnhQOGpGTWtYM01mTGdDOTlC?=
 =?utf-8?B?TVM0aCsxNkNBYjAzL2gwUk41RWJFbjVjN00rL1QyMGxYeUx5eG4vZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ae47d317-3537-4f7f-0772-08dee928fbf2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 02:12:16.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dHPLhUFF0jD77YcusdhNrNst33h+9GFDCwXfjUnm9m61f2prt9cmmcP+HcjMDWdBU3DLVLs8hSrxMsnFuRbxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7088

On Fri Jul 24, 2026 at 2:19 AM BST, Alexandre Courbot wrote:
> On Fri Jul 24, 2026 at 9:46 AM JST, Gary Guo wrote:
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
> Is it clearer? The `checked_sub` is efficient and makes it clear the
> code won't panic. And `ok_or` takes care of converting to the right
> error nicely.

There's no error here.

Best,
Gary

