Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022080.outbound.protection.outlook.com [52.101.101.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182AC57C72B
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964055; cv=fail; b=q1yeiEbC2SSb7we25LGYvPjfZXiuw0dsE3byBdKuaNc5QCV6ZPG1eUumtUAMr8iWRD+pauYZWQm+6wSP1fxLV7QZJUOZBa/RSUtcBOY918AyOySjPSaRng/Gz2rfqTu0RJeU5aQrNARpLIrkj3E6IWEq+to1p15XgztfVWS+Bdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964055; c=relaxed/simple;
	bh=NAxMHPVkYMpKuG8nm+dSQvNYDP3TrIMajQ0ZZJrXQcY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tI43zBZeghhbn9/48IqN/6EpARQj/W/xyfsczZQcUkkynM6riXzlj43Q01lcK69mKRtjhtLLejHZRwH+EU+gfrHXg7g30IjJ7+3Xyp4pzbIp4Xp8KlUA9vLicNAobqVQdMRY8D3wZUq531WWXd/guDhXuzQYOlEvP0SdP7lV+Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=veh6BxPU; arc=fail smtp.client-ip=52.101.101.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="veh6BxPU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiZJkS4bHPfqcwv2ao7b7oyG5tXXU5pZVv/0kCnONPEobmRQpiKJEl49zVYmmKC4xD7G73UCrG3TjekqXxmQOJW3em1x2FIaXMiZHb1X78TAYEwlJrXzDiILTNuphVc6VNfpoIxheFyd0mfH8vErXm8eRuaWFZjyXt8hzIEomXD7nesTl9ue4br7fDVte01uxotNgFM01hz3Z4OhCXh6wjqm1Ooks2jnvEGkD2nJ0qd1D+Rvr2usTpzl8WtdHxKbjmUck/fi226qIp57wugHevujKpM+L0pi4ErTvUbUdSt2EOKRMmeMZ4hP7f7nv88FV3+y7VeZLs4V0gVSLJ32vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICdaOXurcO8yokYU8VvslJnbNAsfHus4vn8G0lbY/SY=;
 b=KJnigDquQfuFsqtkdb8JD+8JDZGNOqJ5uCWfa0oTbQTT6xYG3jsJ3FRU6ev1bnw42cpcBmdqZldSlJ5OHlr2ZOX7dWIS9PaGUda2sCR07miKJVo+AhXxG9NEwtdsS2ejD6CPVI/5sEt1VkbTNXg3mEXKe/3/6TscJIxuYDsVsgH8g5QMLOX13l6uv0CG0JCf/jhzzu8tuCWMcEq8FEsUxret7tl2ntlhmIBaqIsUkprUZ6YB6XdBuw0ReNnySKSvZ9qPnlWfT4el+lXuWhSRPo7yFEer9DctGXGAEmf0r3VUfDJ3v7v93TIIBCuQoLG+TltoChVxPIzLLIgEVRxvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICdaOXurcO8yokYU8VvslJnbNAsfHus4vn8G0lbY/SY=;
 b=veh6BxPU5rPz0g3P+9/p468TkGYnxy+bw96kBM5Kox0/ocvIQwsNTE4IZesCNoRzwAaym50bDCbIm28IZkVcSc1Wgpc/IQz7FcSmBvma2u1ziuil9kDNGBLOE9S7fQFO9a94Jqo2BolDpgjIH/ZL3hWzwDY0Xgrtkbj0WAVsyww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO9P265MB7566.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 14:27:30 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 14:27:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 15:27:28 +0100
Message-Id: <DLAUTUHIBW2P.3DI59ZSIQRI8K@garyguo.net>
Cc: "Georgios Androutsopoulos" <georgeandrout13@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Dave Ertman" <david.m.ertman@intel.com>, "Ira
 Weiny" <iweiny@kernel.org>, "Leon Romanovsky" <leon@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.22.0
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
 <2026090955-lustfully-fanning-33f9@gregkh>
 <DLAR1ECFC1WO.8NOBWPL6WM8E@nvidia.com>
In-Reply-To: <DLAR1ECFC1WO.8NOBWPL6WM8E@nvidia.com>
X-ClientProxiedBy: FR4P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::6) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO9P265MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c902c6-25f4-4de7-a8c0-08df0e7e7b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|7416014|1800799024|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S5cykv89jeLIkSZ/a/+AWL+K8uIX1KCSztoZVNpGbJ0sOJksKxdWzT/8qQnlGiXGe3kOyhKKK/yvejGMVbNxJcBD55oD55R3Yd+sDLVIRhxhjocU1jbth7Rkp3HczlQlA8A6ZWFF8dQ3uyyOsLYhOpM7d1nP/KCONlPCW3HoZbvHjSYYITksSA5iUh8Ks5nv0VgPPw2KpNI1sN58OrjMBHnSTLwl6S/AR7wqZPMv5srmzPwv8m9LHzRxBVGqTxrpdCpxIi9m/sy4a/yEHaIIrIGRvu1oG10fjvf+t03VwEKTi4aT6Nyol+4P7/PZ4/wOILKrxR6veuTcAXwQnZXbhYteFqgBgtiVrbXxdFIjKOPSz/mBk2qm9eI19mAgJwqw/YJg/TavI2vUZPZJ1dDMhRDq8Q6rpVh4Z6lnlOnMwoqsbVsCvy9H4bSuqyyXtSZ6wgDF2R89yJ1pX1DKxAa6p+CH8au60HDcFW4Pd7pyWJp7N7O83genLV5K1RDbyxF7JxOU2Pgr8CpUHgDAp3Qxc1f8jIYfEBFr/8qAdj2/OgtZGgFESskeSSjNVxNSj7l8Brhyzi5YFPBvB6eKyzlGskmou7CgAtZad5TL1wY3eS32I2aR9nwsHlVHdMcRFjqbCudoJSxuKtGbIRSktOsCKHIjVCEP3fgJiIb5bHuAwi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(7416014)(1800799024)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2dWczhWMGovTlJoTmhBbnJzL2N4REJCOHgyRXpXTE10MFNCcVFKSGtWbmdB?=
 =?utf-8?B?eUllMzVOaGJMSk55VVZvc1k5R0VvUnB5ZWsxN3hFK0tkVC9KRUVxR21ZQmFq?=
 =?utf-8?B?Um5jaW1GaUZacWo4VGhKclVLQ0UvYk51ajVuK2lEM2hnU1JmYStOZHFDcXZj?=
 =?utf-8?B?Tm1tTVRCL3l3cjdCblhla1cxRjF4TDh6dkg5UzBsQllKQ0FKSko1WGVsWmRv?=
 =?utf-8?B?eGxXbkRkQit2OHpIZW84RGl3Vmx3dExKK29QaW5aQlYzUFNHYTVnU0JNS0g4?=
 =?utf-8?B?bjZrbEhJY01wK0I4eDRQOTZNUUg4b3JTTUx5b3lwcVhRZ25WRGJHTldTNFVq?=
 =?utf-8?B?UzlKa25kUWp2RkdtcGh2YkwzbVdIUEhtRGcwOWZUY3ArODZzK2VvNFlEZEph?=
 =?utf-8?B?amxSZWhBMkp0TEZTMlhCYmRXM2JNcTRicG9OVXhLNFZCRVVBbGZhbnVvVzl2?=
 =?utf-8?B?MFdRQ0grNURNeWRUTU5Fa1ZrZWhTOVM0OXZ6UFBOaXUzWUVWUFRhYk9xZU5y?=
 =?utf-8?B?T2c0RUtWU1R6RHJqbUhqdE9zbnFhSzBrNGFreHRRQStiTDc2LzRlZmJoRUJw?=
 =?utf-8?B?N1ZKcmtRNjVCeGk0RURzdDd3Qk85K3dNMjVmdGZXTzV3ZnhJaHZ0ajM4ZmZ1?=
 =?utf-8?B?a21VTmpMQm1PZ2FxSm1lZXhjZVlPK3FkdUpmWGdET1BjYWViS1NmRW1TZHdv?=
 =?utf-8?B?aXBpaUVPWWhhMTNqNkdqSkFvNU80dGFHMmtPMWlPVzM4QTg5bHZFNExva0tI?=
 =?utf-8?B?cFMybUhCVFNMYmRDQVpXbStSdjJXWE01Uk11S3BVUEVMOHVVVCs3b2F3bHdJ?=
 =?utf-8?B?RTBhNWNodkFoRDlqdi9yaHNCNjRIWnBnejVnN05Wc3BCejRiN0VZbktGZFIr?=
 =?utf-8?B?U2JaaTNnQzNPSlI4K1dWZk8xYXd0OHN2aWpCV01Dc2RQbnFGUDcxaHdZZHBV?=
 =?utf-8?B?bXcxL2p5UE54M3I5ZHphQTZOVk1MZWVRck5Cc2xwSXJSRnpnUWdaRENkNHlu?=
 =?utf-8?B?aUwzRlExTWlmN1BuUXBVb00zRUVIbEp0RzdsWkp2UFo1QlZSbDJBbDY4UUt4?=
 =?utf-8?B?ZFpSaFM4V2JiYUJqVWlxVU1QSWI3dklVNHoxUEVjZnQxc09aajFmckFhTkVM?=
 =?utf-8?B?NUlkUDRibktPOHFsTDU1c3NlTFFTSUY4c3lwZEV0TjZTd1diNFV3d2lqbDNL?=
 =?utf-8?B?UXFzNGRRKzFjdXBTd29VMUlCaTVIY2R6QXIvcTJZMVdUeWtTNXV1eEhCQ09y?=
 =?utf-8?B?Sm42S2tpd0JpdlNidjJnQ1hSYlJZemFQVm1jQ3ZPMDN5SXFHOEdqWWU1KzZV?=
 =?utf-8?B?Zzc3bkpwSFBOeWozazM3MHVjWmJrWVNJeUhyZ2tUVzFMc1NTeEU1UXRYeFVr?=
 =?utf-8?B?VURXaldVSGJiS1FDdlVLTHo0b1VOYjFMUkVoUDErUVROdEUxRnJVUmFUS3pI?=
 =?utf-8?B?d0N2WDhxbHRMTXBESW94c3BUUUp5Q0pSb0xHdUZ3WWRyQUJUcEp3UDJDQmkr?=
 =?utf-8?B?NmZEWnBRS25xZDFyTEVkMFNtbVkvZlRzMnpvWTB3Vy9FMDVBSE9FQnJ4UHNu?=
 =?utf-8?B?SHFrd1FRNzg4VlhUKzEzSEVnM2twMUJRc3Y2L2N5YVdrYVNua2tOam40ckxi?=
 =?utf-8?B?dnB1VlByY3NSVDdBYnN6eGU1S3k1MTVoMGh6VTY0OTBPUmlsek5sTHJvL3p1?=
 =?utf-8?B?VTFXUHJ0NWxyR3NmdlY3RUJCYVpPcFh3YXlybnNHdElzVTI5WHRnWVhITVg3?=
 =?utf-8?B?MUNYUG83Y0orUElPd0F0OHd1TUhsTWFDSTJjYlZxNDRhWXRHWVJaUlNLTzhi?=
 =?utf-8?B?b3dEWFlZYU9wNzE2VlRLUDUveDA0SW5LSEtVTlJNN1lRMkUzQzRjNERyNVRS?=
 =?utf-8?B?N0Z3azk4TUpnMlNkY2plVkFLbHQ3b3kySkxzRmhSYlNCME9NZUdkTTZkUExO?=
 =?utf-8?B?c0ZXS2daZHZ0azMxOFVKdlQ1UGZRWDdVQ2l5ay9oRU1MV2s4WWZPdTBwekhk?=
 =?utf-8?B?R3duVVc0WUxMQXJzUzRYZS9vVDVJSVlDc2F0Um1LU1JrcmtjSlFua21VbDNz?=
 =?utf-8?B?N2I1cE9IRGdZYlpxWWs3Y2lzeTFJcGl6Y25ITk5ldDdyT3RJZFZseVVYNTdw?=
 =?utf-8?B?QXM5RGZ6akdyQitweWNmY25IM3VaUjd1M1JyRUFxZ084dlREdmVmWWNXN0Iw?=
 =?utf-8?B?cTR0NGJFMnA1eHlrL0FTaVlORXpaV0c1MWZLdC84cTZlbUVZLzVSSEpaSFlQ?=
 =?utf-8?B?SHJqeW9QT0lscHAwNnF3cUVtZEJ1OUQrNWkxOVk1a3h2aGpMdkRKclJ3cG5G?=
 =?utf-8?B?N3MrYjlzUVNFNTMwejVKMDJ0V05NeDExTEpCekxWZ2FFRit5U2hrdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c902c6-25f4-4de7-a8c0-08df0e7e7b02
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:27:30.3086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKZLbEmB5mzwwpKLtnpJgU3dB0jyNWZeU2QyGKHQzIfPKSv67zClsU9VD4jmVPDdUsXrwD2ag3B7Tb0t1l3GMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7566

On Wed Sep 9, 2026 at 12:29 PM BST, Alexandre Courbot wrote:
> On Wed Sep 9, 2026 at 4:19 PM JST, Greg Kroah-Hartman wrote:
>> On Tue, Sep 08, 2026 at 11:32:46PM -0400, Georgios Androutsopoulos wrote=
:
>>> `DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
>>> `auxiliary_device_id::name` array without checking that they fit. An
>>> oversized name is caught by the array bounds check, but the error
>>> reports an out-of-bounds index in the copy loop rather than the
>>> constraint the caller violated.
>>>=20
>>> Check the invariant explicitly instead, so the failure states the lengt=
h
>>> limit rather than an array index.
>>>=20
>>> In a constant context exceeding the limit leads to a build error; at
>>> runtime it panics, so add a `# Panics` section for it.
>>>=20
>>> Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver ab=
stractions")
>>> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
>>> ---
>>>  rust/kernel/auxiliary.rs | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>=20
>>> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
>>> index 60dfbec8f330..1f3ba86d6d96 100644
>>> --- a/rust/kernel/auxiliary.rs
>>> +++ b/rust/kernel/auxiliary.rs
>>> @@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
>>> =20
>>>  impl DeviceId {
>>>      /// Create a new [`DeviceId`] from name.
>>> +    ///
>>> +    /// # Panics
>>> +    ///
>>> +    /// Panics if the combined module and device name, including the
>>> +    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` byte=
s.
>>>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> S=
elf {
>>>          let name =3D name.to_bytes_with_nul();
>>>          let modname =3D modname.to_bytes_with_nul();
>>> =20
>>> +        assert!(
>>> +            modname.len().saturating_add(name.len()) <=3D bindings::AU=
XILIARY_NAME_SIZE as usize,
>>> +            "auxiliary device ID is too long"
>>> +        );
>>
>> We really shouldn't panic, we should error out and fail the creation
>> instead.
>>
>> But what is placing the constraint of the name size here?  The C api
>> just takes a pointer, it doesn't care about the size, why does the rust
>> binding care?
>
> Note that this is not a runtime panic, this method is only ever called
> in const context by the `auxiliary_device_table!` macro, so a panic here
> translates to a build error. The current code also panicks if the name
> is larger than the target array, but it did so when the array was
> accessed out-of-bounds, with a more obscure error message. What this
> patch does is provide a better error message for a condition that was
> already checked.

Yeah, I think the message is good, however we don't need the panic annotati=
on
for const-eval-only code.

Best,
Gary

>
> So while the patch is arguably an improvement, I would suggest to drop
> its `Fixes:` tag as it doesn't really fixes a condition that wasn't
> already checked. Also the commit message's "at runtime it panics" gives
> the wrong idea of when this code is evaluated.


