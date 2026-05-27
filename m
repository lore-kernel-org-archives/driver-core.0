Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021083.outbound.protection.outlook.com [52.101.95.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FB3375AC6
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 19:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779909947; cv=fail; b=m5h1lNnylmaKeF6eDwWrezoW1ismQfUc2F+qL0+inWa1FOo+diTcJlh9rF68pDdbFojrd4xqYCbPt74St+Y3qRRItGWVhI4/S8ZCny7j3lhM0Splt0PinNFGToElfxLfG++xgQeNXNWPNDiFR3ngwrvAx106midZzK52rMpAcYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779909947; c=relaxed/simple;
	bh=fP4/T16humoHUJfXWRhqK5kdWyw8kXcnKg1v66bVt9E=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=ApwrT8Sf3wlEy0NUANW9AEXLfJGP6nolgkaH9TAXzXaiv9iwgiekLA6tVQghsdMtgcM6ZRxGzsYkh+otMfpnkg2X+t15XxjEyQkK7UEyrWVzeqqETMYwNOYFeTieM1F5w9nZBbbsSQXWy5aJIpepfkB9CBDBjXEw+vI6FKIkfIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=aqp25B6n; arc=fail smtp.client-ip=52.101.95.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="aqp25B6n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzU8t4j5fRqqxDsJfgSTwYkZurgo3Bo4bTQ86Y/Ui0oxdVyTJ3lieMYfNAzX0pTlHrf3S8V3WGt7M8XT+OmPhq/uc3xxm3Y60e1t0gSgHFdpbFMj1hDyzjCftunNBKVOe9hqpMP88aL1lmzxhv5jlaBmSBYaeR6k+yq29ICXfn8/LYB3QoqxbPNv8ROdCULp8D/VdLi9d8+NWm84F1micid/H5s5scF40XUpqAATz80PZfjUiuls6c+LT6L+JBeECulggq/PfNIaWJjojzu8uAyFfPIlPzosnsGJB4L0fgEzDOsxHRMp2I+cact2SzMdIQItKmAHGtBlx+2i4agacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fP4/T16humoHUJfXWRhqK5kdWyw8kXcnKg1v66bVt9E=;
 b=VhQK2tKHrhh6CGaWAPdww/X3qbuIrfDXhdVVM5IL09bCgIJrYTgixoR5wIQTtUFiOH/1+I2iGvvj/opWa1+Mv29wqA+VhsWQPw+TdLzSRXezEMDXaQDFc0/1pmZXwlkV6AEtZhkvEYyFS/1Uos3IjkGOj5826Yxp9Z3I5DyJ2Q/1Ljo3aYbwOLtxjyfwdQKkeXjqBlTlr3706vVa9IqDQOPnWtY81cmcF+VTShA7T87Undsi3f5Y5v6XKYujxj0eLrS5mXUCTpN6e/2Hsdh6Gt3xtjZHpZUi/veTPUhMofWxUbNygGRBrpxxvSgqrScIGmILYVrE2TiLWew1lezlmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP4/T16humoHUJfXWRhqK5kdWyw8kXcnKg1v66bVt9E=;
 b=aqp25B6nqmZ0S/DwfeLc5sx8kXHxJIw1m/p3i+BCzWQChc8/EmTmifzwGvWD0ZVFrpwXHwQXNcmJjCWUGiUeSdgwTt1D/2ws4l0PhSYbr2YKfaiFL2gT7ATqlz+VvpLBBb+C//jr/Vhbf38MOUB5/GkLPgoWj1BZU97d4qc4V7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6728.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 19:25:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 19:25:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 20:25:42 +0100
Message-Id: <DITPEZ9TLM8F.3I808DKPCW4LM@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: devres: add 'static bound to Devres<T>
X-Mailer: aerc 0.21.0
References: <20260526000447.350558-1-dakr@kernel.org>
 <DITJFWVQH4ZF.1HYM0UDBMWQ2J@garyguo.net>
 <DITNP59XG4H8.VYHNILHQV05G@kernel.org>
 <DITNR1QTIE1L.3MTG2UJJVGFAK@garyguo.net>
 <DITNW1LVAJ16.2V0QUI6JAGKBN@kernel.org>
In-Reply-To: <DITNW1LVAJ16.2V0QUI6JAGKBN@kernel.org>
X-ClientProxiedBy: LO4P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c5f2f3-8d99-4a8a-7d95-08debc25be52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|22082099003|18002099003|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	+htuvOpebXo0/H9Is390cusVOfoo8MPjDpOCtmbl8lvfsp1hSdYF6EqP+ooCeW+8z/7D3QUnrfJ/dcH2oQraeVSrCF9gm23zmJ+hQX0GsDwa1i7ID98mX5Y2bnDwEV83KPTbwMPsD2Dftz3Y2CEzyjDhsUA6Cxgj2vUo2KyYs4qhKFPjiSY2wmHLKVtChZILWxe3xVN0vhWnk5EzgB/O3uhYqhn2s3My5Q7l7AasYnt0demH6aA9ipzWEWJrxb4n3bye3dEq749GnHEncEvLMk2bTRkBK9eisLLcy7niWYAK4LZoxmdzin/i25jf74kSvAAAb3LlqDKgI2ecTh00ugSvTXNEA7Ofdj8yP/Te5U26oRCUXfig0JEeF/zpMsGplIvbvh90e+0dGjbwrLlVyZtX1mR9aGHMuvA1wPq+8K6AtsRLyfAOHWr/vXZfdeQChF3pXU0i+AfeyZaJWgmPxu7rvrjCoXFkb8A5rhEcJ8DcAw0KVsDl3691Weq2vW+UNJRj2tqfkDwjB7j2yzcMamJWmPqka5f/AE3KMLcKi21Rb29DmYws1z4i3K+Wk1V/HhxrNBJi8p/s2fdvRXVAPn/bD+KuQHSEzplh0uHbpjKjW+TnT/WW081vHE52iu/zs62+dbK/L+1EtZwzf02yutMAA/fuKh+rGd07a9A/sC24uoKm9X5tLLV3onAuyqhU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGM3ZjlWeTJ0N2hsRTlUVjFXVEhGNE9waWVDbjlNS0RwVFpQUFRUVW5oRlVs?=
 =?utf-8?B?elRDdyt6Rllza25lRjJ1aW13MzhqZnJPRjBRL2xHSDQwaVdLYlpES1RoSEpW?=
 =?utf-8?B?UWlZWWpycXVIbG5hS1UrcDhJSjN3SDZjdmNESmtzOWVQeG9jbVE1ZUZYRC84?=
 =?utf-8?B?Y2dwWFl0dXZhREwrNTFIVFlCbFlJdU40d1ZuM2cwL1dVMXZMTlhZVytBM1Qx?=
 =?utf-8?B?K1FpYXdJQ1ZlRHMwM0pIVUFtK1FHandkZ0lHNmdBQ2l1WXl4MWxWaUlITWtJ?=
 =?utf-8?B?WFdRRWhVSXJSY3I1S1hwNTV6Yll4SkZzSVhianRhSUVJZ01CaW5vdGxlQmgv?=
 =?utf-8?B?aGdPWmVNT2RTVzMvZ0xtZHpRUzMydis2UHNqbENTRkl3NjdsN2QxanR6K3pi?=
 =?utf-8?B?NStNQ0x5VFlKR0F4b2hNeVZJbFcxamVoNHBuRDgyMVRpSTJaWkN3bHBPdmRP?=
 =?utf-8?B?MGtRUDNISEJnRHVmZ1NSWCtKV25FZ1RleHc0TTZRdzZFZEx3c0ZqaE0wdmlo?=
 =?utf-8?B?bjJsSkNZc3BKbWFRWDcyWXBhVlF2Y1UyYU52b1o0bkJRMTJidUlCdGljZ2JT?=
 =?utf-8?B?Y0hTK1BUWHQxTlpXYUFVV2ZtaTczTTQ2VTR0aE92aXJTN2Q1eXc0UXpJT3ov?=
 =?utf-8?B?ZExZU2VUYTZHcTRYM1JHZTc3TUExUjl1V3BSZmFBTURLd0ErdXdEWmlObURm?=
 =?utf-8?B?cGJtckxNQ2wxaGYxYllBUUF1Um00MU1DZTdHUCtGYXRQeVgvWWVLY0JRUmZn?=
 =?utf-8?B?K3pMUXFIT1hUazl1Nmg0K09QSjR2QURRWE1HVWJGQlVSSlVnTHJrYlllOEEr?=
 =?utf-8?B?S2VnWDhrY1JJd0ovQk1WczlmeGtVZFpJazhMQkJYZlRVZ1pqVnBiTjEzM1g2?=
 =?utf-8?B?amlBSnc5d1ZCZFpFSDdWekN2NFJkMnRSa3lUV085U213OXBiMUo0VHZ2RGdD?=
 =?utf-8?B?N3poc2prT1VYYzloK1E0dVh6UFo0WFI2anVXamVEQlJPQm1oUHdqS2FyWEU4?=
 =?utf-8?B?cGdVeTYrUVFxRHdLN0VWL2JpSThXSk44SUpuMGE5Nk03aUExL21xTURSRTEr?=
 =?utf-8?B?a1pVaGJGZkYrWWVITVVKRGFFMXpoNjc3VHlMSmNxT0V4STIvK3NpUFl2V0pG?=
 =?utf-8?B?bW1DS2NOd1Z3Q0t6R2JzNThRdTQ3R2FGMDVabCtMS2NROTE0SGlwL0NnWkxE?=
 =?utf-8?B?UXBxSnRWZTE0NlJEcEs3LzJOcmNkUkJtOUZYN3drcmVqNWh6V2YvdEt6QXhI?=
 =?utf-8?B?L3Y2YkorWmk0cyt1VTdRRkhHQ2x5eUlUVk5CRG94bUdUbkxaaFprMFEvdldB?=
 =?utf-8?B?SFVsT1hLeUZ3ZFZwd3lqR1lTZks4Y3lmK3ZQakdKTmxhaUQrdHhnYzdoQkI0?=
 =?utf-8?B?R05HY1FnZW1RckNrTEVGRXV1SThIZ3A0Y2lveU1QVTMrWkVHenpBRzNMeU9j?=
 =?utf-8?B?UzlvS2ZDdmNkN0hLdE8zUXA5ck5tM2JKbTJlUVRVSFJqQXdtUTdhZ1FQK1dX?=
 =?utf-8?B?akovazcranRtZTAxYm5zTENkL2dnQ0hkVXBjUmp2MWhZMzZTZXNjZytMVlJW?=
 =?utf-8?B?RitJUlRqYm0vcFovRmpraTZ3MEtmT0JEN3VVZWVhNUcxTE0zL214UlMyWitV?=
 =?utf-8?B?YUZuL3BoT1gxTnR6NGVLdGZKNkRpRHkwRGREeUJLaE04Mk0vdmRoUEx2R3Nz?=
 =?utf-8?B?c0c3SGNuU0FYS2NwWlVPVmZmdTRDdzdtUnVuV0h6K2tnUE9VTnNpMU9HTjI0?=
 =?utf-8?B?QjVPODJQbmRMTmpjOEhrWHE3cUF1bTE4YjNWUFU0TkVSMFlNdGVjMU5oa3Ny?=
 =?utf-8?B?WC9rdVZNL0ZmdkNjQWdqQmJwKzNieEc5bUhvcTNGbENWSlorQytid05qSnUv?=
 =?utf-8?B?NWFHYW5NNnFJYmg2ZlczaG9Eeko0UG53NzhoMEtXOFdoWTFHakNBY1dyQVpz?=
 =?utf-8?B?SGJUQ3hVMDRKZnN6dHRTVnBPOXhmdHdWTWIwcGV3L2ltZndYY2NKckJ5c1hG?=
 =?utf-8?B?cFEvN0xFMGJCWTNreis1UkYvY3RMMk54N2p3cGZROTVQVnUybndLYWVhY0tu?=
 =?utf-8?B?U2tzMm1JeDlSbVZkSzJTRExCTlJPZDcvbG5LdFVCZ2N4ajVTaTY4SjZCVUVu?=
 =?utf-8?B?cC9aMjFVT2RsRjg3WnNKcmpWejNIQ1dLMzZ5WVBrSDlMM21JdFVLUXpaVEVS?=
 =?utf-8?B?WkliNFdpc3UvMVhRYTlDR0J5a2xReVR5T1VzNWswVVNQeTgweklTczB6R3Zx?=
 =?utf-8?B?ZnhjME4rNzVrSDN5NmdDU1hIMUpnenYzVVZFRnhPcnJrV3RKSUxXbEpaQkZw?=
 =?utf-8?B?bWpUZkYxclBUUm0rRXJEbkc0YlQyQ0xBZDE2eTVLa1J5ZjRZVW9YZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c5f2f3-8d99-4a8a-7d95-08debc25be52
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 19:25:42.7018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QZNPcoQgvB8DtddM1tPyYvkK0/YQq58YS+jYo9sVS8Jl9dU3PycsOqjlTFPsJYaqZUk3ArLYBa5/mbqdnAY/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6728

On Wed May 27, 2026 at 7:13 PM BST, Danilo Krummrich wrote:
> On Wed May 27, 2026 at 8:07 PM CEST, Gary Guo wrote:
>> On Wed May 27, 2026 at 7:04 PM BST, Danilo Krummrich wrote:
>>> On Wed May 27, 2026 at 4:44 PM CEST, Gary Guo wrote:
>>>> On Tue May 26, 2026 at 1:04 AM BST, Danilo Krummrich wrote:
>>>>> Add a 'static bound to prevent storing types with borrowed data in
>>>>> Devres.
>>>>
>>>> The bound should be added on `Devres::new` instead.
>>>
>>> I did consider this as it is generally recommended to minimize bounds o=
n
>>> structs.
>>>
>>> However, a Devres<T> with non-'static T is semantically nonsensical, no=
t just
>>> unconstructible, and I think type level bound represents that better.
>>
>> Technically `Devres` can contain references to the registration, which i=
s known
>> to outlive the bound device.
>
> That's technically true, but how would you express "outlives the device" =
as a
> lifetime bound on Devres?

Just having the lifetime would mean it outlives the device (lifetimes that
cannot be guaranteed to outlive the device cannot be used in devres).

In a world with registration data, I would imagine all lifetime parameters =
on
registration data are also valid for `Devres`.

>
> Additionally, if the borrowed data outlives the device bound, you don't n=
eed
> device-managed revocation for it in the first place.

Resources that depend on both registration data and device resource perhaps=
?

Best,
Gary
