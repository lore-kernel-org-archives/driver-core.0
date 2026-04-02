Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022081.outbound.protection.outlook.com [52.101.96.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD0D3D9DD3
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134904; cv=fail; b=UBdliL8Uokq5NaQYljueGPXok2vz+I1fCP2eTh0+IzaOio7X/tD8IeQXil2oCIvYkISlsEJyoF5dLdKBPFVDAP+FgqnfJYgmv63SxBBtkeC9EPyITsh3EisaF48sABuVv+ay3HXgjiJDXXZetCI7s+zrv4JVE6rSuvRdX9Es1WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134904; c=relaxed/simple;
	bh=CmhNfAxB/EbfU3Yvq8kOJxPPrGMiu5ax9Hjx+dtW9Yg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NTgwSBQNF2AprxVGqMHznDpTlOWJD1ERZQn3PogsqYvOl96NE2Foubod14e/1Y/knAIq0S3ALt7e61uvLL3IQmkCcWCvKGYylglnKqqJadbXg0FO0dLWn2uPEUQ3hmNsM10CPzi4FAdPaKnGN/U180V7bZWKerhtRhFKT4p62UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ld+nU+kz; arc=fail smtp.client-ip=52.101.96.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ld+nU+kz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihTjw5BAxq7ydL0vx0dhugfCjTBw6aeJaxs2ybtRAoakxkFuFFYmYBAOP+m7wAISCwhhZdbpTqjr7+kPKNpdGCLGZsr/s8KGyW0KQkpcsIxKBYNQUf5NjI8thCG/WUAKV/m6H+XV18XWDRFtvmKajTo4sVHuiZVjTAGylCm0HXsgS24n7gyhGCWyOKRW0Jdr4pLSyyB1U4onLIS0XoC93dqxvGZtkfw7YFgxjyBRoLkyAefn/wOElKkwWYOGgeyRt80ymV6KyP02U4bei/va3rRLOZ/yhO6ZuqjI0qF0ACHjukusF/yw3FNX575lCwCEWkN+dWVaSDTmpft7ZiTbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMGWUIsI9/TgYC3C+s7VPC9yaveFB5f77rsHJ5ubyH0=;
 b=ox768rzVy73Sk5ZrwndrtcY+ug27jDZPByAGBxuCoTtMyTa4/YXGPq7ZbUfQsNev2eUKBFSVXoEtn2i2QvC71c4Xa7Is4hejePTB0+ogIf87ezZFYznmLArYmrnWyYwxXsNhb7r7jQlsuD2eZGZJyVhGO+wFDIRtgQlBZGwOTyBHngVHuqBmROoMmKGjVsGzQDN8M9EaiSve3Ik4WgT6JWd58Bh5vIawx0hrW2U4SQqgmBYHeEZTsERcycPiaUibqbu+XwLcvKlLInAHrV/+tjq8ZObdQ1stciJ6iitxMPcXTcRe2UzaAXRahE4O9mX/JibnVzO/AhsK1nVUQd+otw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMGWUIsI9/TgYC3C+s7VPC9yaveFB5f77rsHJ5ubyH0=;
 b=Ld+nU+kzZAWpC9fSUw4NKwZddH87qGdTDFCN1sxHua0UT5s2isB8OrrqjK8B1G3/dmI/a9XFqwQdfaIvLlV/dwdtBLC0vGpg1GiTbOTcyHWiXPZWDmnx2XlHt9PbFwZhT0WrJ8Kf61Cz5chq4o5IuNOkPeU74PpwTFb20WvalrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6043.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 13:01:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 13:01:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 14:01:32 +0100
Message-Id: <DHIOSVI47UIV.10SV1TCUTM9IE@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] rust: io: add view type
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
X-Mailer: aerc 0.21.0
References: <20260323153807.1360705-1-gary@kernel.org>
 <I3h_hWnImlf7uTzEyQ4hvi9vJvrFgT9QHacWwuAA87AFC_Ye-dL09GYH_FKm6EO5NtnryM7bMQRIRHUL2r-Opw==@protonmail.internalid> <20260323153807.1360705-5-gary@kernel.org> <87h5q2y85c.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87h5q2y85c.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P123CA0410.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9404c7-94ed-413a-34ce-08de90b7f6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	eZyIrho464+kOR5YUSuK38PMzyQRaqgj/XFC0G3yKaZ1MPb1ht1KY5ne3T5CecjFSYK5tZms0jPmpBd3FZTD9eXsUl3jpN0Kq3rt2uZP4uWbJlYL64R5fOiXdkXHmuO/hViS8OfMRr04quNZrEaPhQ2TFLCr4N9B6e4FtsOsDWkZ7stjfvr0WRWee8u7/wvyMJCmU/PdbRtpoOxjElPada01Opz8Mv6paz0wUXYhutxWTuC4hLsZVmFCR+uuhTXs9jStPcjTtNdzN5W+//67mEMlA+dMDJA5advdMomEPIufT8FpJ3a3EAYxY+VobsBhw0wPZ95enijU/1mZ2M6jS3cuf/LDKvNrqw1TcojrvsHGy5PfG0MxjF2QiX6a+5wisg/Z5P7DO1yDosj76TLzBYLfgUZWj3rNzjiK4EJxN5fHq9HGNSLwn6w7m9ZHGV/38SV+LC6TbRrmVM7DZ2WV4yBF74rAIMQryD3usJAunRl3M3W9snI733LTW3xToqJMpE3ruM0ABpTEYy58UfvlPmZ1DcLxI8PFdVLUNHVus0M5//IHd3Q0z01MpjYLAnoO2/e9IR0+WMra4GSZbiRFdJPZUf3IxFq/tM+2ruMLqMPReTbErBibfZxFInN68xlGqtmPMM5YbWOxPxD1tWRT8nexxun7UuP0T4yrSV3Y+A9KuoMxFP3xTa+VAFwHgGMD833A9eebtqP0QxTGjWsntwZ5Ns7gu21dCaul12pH8IswnIE1W28puRtefNcl3zQbVORoDebXgeHvMKOOdfkwoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1d4Sy9QNHZLSDk1NkxvdEhuR2dEbHBrM3EzN3BFRTRqQmtsaFZGTkppSmFG?=
 =?utf-8?B?VU15eTNIQWx0ZkpHajFNcW8vYXlLVWRlMy96Nk9XR0tBbTg0cTBVQlB5Wm5P?=
 =?utf-8?B?c3hTSXdUTVhSZDJTQXNpWTFSN0R1bTZHaFJ5Yjk4alJiQlFEZWtGVG5Cb3Ji?=
 =?utf-8?B?MmJWVElzeXpjQnA4SWFlL1lmL1c2SkRPbk82Rnd3OTVMTXFYYU5TQllRaFN1?=
 =?utf-8?B?M3dsQVhVSmpwWUtUYnhuMDE4RmxsbnVwWUFiRm5qY1lmTkZ1OW53K0lwbjFD?=
 =?utf-8?B?ZkhLak9tTzE4NHlCNDhONmpabFZZczJreWZ5cUZiYzh3TlpPZXY2QnZVeFJ5?=
 =?utf-8?B?alpPNEtKL3BoL0RkYWN6azNiLzVEM20zQU81VEJxWUIvblAwS0dpNlFodWc0?=
 =?utf-8?B?K2hlVi9EeitVdlZzakN1enlIeU1PYWpDbXB4QUh2QXVlV3FkK3F0Y2kvSCtC?=
 =?utf-8?B?ZDZ1RHVSb2hseW12d3o5czNudXp3dXFXMGkzNzFDZkVvZzllT1RHRUFmRlpO?=
 =?utf-8?B?bG1ZZUxneTZBWTFpTjNFQWZyUTdOVHZDWTBnYzg0OHVrSDdUN2s4c3AyZkNF?=
 =?utf-8?B?R3dPRmhpcXdZZ2JTZVdMc1VQS2YySzY0TXlORDlFR1VhOG1VSXl1TFNKNkRK?=
 =?utf-8?B?R0pwTWtldVRuOW1PdnorOW9QMzdnc2U1cXdSVmowaWxtd1VRZVJDOURxdlRT?=
 =?utf-8?B?UEVqU2JIOVF5aFFvVVRpR2lPNXF0MzhjZkVGbUNRYUU2MVhMZ0NaY2lUa2Rv?=
 =?utf-8?B?VmV0M2dWR0RRSWNpbkNrSGpGZE53SkQ0MlZPdzA5ZlQ2cU15K1lneEVyeVpR?=
 =?utf-8?B?MFUzdUl5M04wZlZGSUJ5MXFKZGVMTFhBWFRVQklUck1RR2NXeWYraFZnRlZi?=
 =?utf-8?B?ZjVIcW92dDRTTkRpMnF5QWtNRW5tYkFEaFlxTGdVRXdEWXMyRXZhbGN0UGtQ?=
 =?utf-8?B?dDA1ekNiRmhTYXZhTkh0ZTBYMWNhNVF1WjFoV1duM3kvdkhoYWNsN1c5ckNm?=
 =?utf-8?B?cGpneW1GTSs1Tm9wYkxZcDlha25CVmFJTS9OL1hsRXRGZGgxMjZySDVKanVa?=
 =?utf-8?B?cmFwcHpMZDhzQ09neDRnejVzTmVwSmxlbERQaS9TZU0xa2JOU25VRTNINXAr?=
 =?utf-8?B?Rm10RG4rdzEvTlJLMjB4WW1tcnFYSFhDV1hRUTBOSW96ZDIrMzFaZVNtcDRz?=
 =?utf-8?B?eHhIblhyWDhYWk82RkpqWHkzL3BhSlJXRnZPVTc0eXE5dXhwbHNVM3l1MXFt?=
 =?utf-8?B?RXRLZis5SXViaHhIbU9tTGZoWmZrcURlbERMQ0dwL2lQOU9CUUNqQ3pzMjd2?=
 =?utf-8?B?NU93UnZPWDVJTzNOUmxzUXgxOTBPMkltQnJ0OGZBZW8rcW9WSWJsZkNFbEFX?=
 =?utf-8?B?ZWJMZkdVZlZBclM1aGF1QStKQXJKR1NFM2N6a2MrekJMaVRUSjdnOXA5b21T?=
 =?utf-8?B?KzhrK1owMXBCMUttNC9EUTA1UkFBOEVpdXF2WFpVUGx4ZUQySWJHd2k1Z3JM?=
 =?utf-8?B?aWFlUndxc1Z0OXZvT1drM21oQ0NlbGFVOG5TbzlSUURabGxFNVprZHBIMkhz?=
 =?utf-8?B?a0c1K1ZyTS9hazVKTGhjL0ZaY2d0R0tlVVdheE4vQVV5YUFtOTI2MHZGVVl4?=
 =?utf-8?B?cnBLbUQ2MHpYbzhxNWhXZVBhVlNpV1c4dDh4a3ZtM1FyMzdjUVR0SHc1OXhO?=
 =?utf-8?B?WWNLK0diQWl0Z280QXFrMEtCeUhFQjFyZlVOYm9QTng3b3FZQkE1eHMvNkc3?=
 =?utf-8?B?WDFGekEvUlRtbDM2cDRYWERRUk9UemdQc2ZjZjVLUUprVEFoWWJKSFkzc1Fz?=
 =?utf-8?B?RlhXVXgzdW9ocmNzMlFxZkpMK1lFVVpaRHRnWC83c2cwNHcxQlJDRjMyd2M4?=
 =?utf-8?B?d1krdzJ2RmV4SG83MGtncmp3L3JUcHVhMzN3WEdEdkZ1a2JuZ3hISFRoZWdh?=
 =?utf-8?B?ekJkc1JRdHovQlZBYVFoZmdVbm4xNGtEb0xmQUh3VlA4WklpcU5iSmRTWWRh?=
 =?utf-8?B?VGpaa2RycTVKRENGbXYwaXo0ajNhZHR5VW9IRzBXR1ZnZkZLWmxGTHJDbmx4?=
 =?utf-8?B?NHdVaG15NDJYZDVnUHQ0ODdGYWFrY2dISTd1clROSUpwU1RMQzJVWnh6VEFU?=
 =?utf-8?B?WXJlOGRLNVFOMDdiNkNQaEU5UmkrbjJxbGF1MW1DVFp0dUVCWXB0clNxc3Jm?=
 =?utf-8?B?aVR5OFNVb3d5c00xbmxxK2ZCU3ZFNDhGWDdzWUE2YkFucExnbG9vdTlwbFlt?=
 =?utf-8?B?RnBPMDRBaGpKU0VyaUsweVpMY1E2S2Z4K3NhQklPQ2tRMnBTTjJ4SVpyazA1?=
 =?utf-8?B?dHNqcUxVMklteklwUFFoUkU3NWNhSHNCeUZUYjBWMTJRQWJ6aUJMUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9404c7-94ed-413a-34ce-08de90b7f6ac
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:01:32.5877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXY7RiQt8noX/Lf+h597b/WDRngFn3i5qeNvL7yMU5UxagGh0Zr0NLzGqICOF/yeoo9nRN+bjIMo5yRXX7amHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6043

On Thu Mar 26, 2026 at 2:31 PM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@kernel.org> writes:
>
>> From: Gary Guo <gary@garyguo.net>
>>
>> The view may be created statically via I/O projection using `io_project!=
()`
>> macro to perform compile-time checks, or created by type-casting an
>> existing view type with `try_cast()` function, where the size and alignm=
ent
>> checks are performed at runtime.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>>  rust/kernel/io.rs | 147 +++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 146 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index 72902a4a343d..8166e47f1381 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
>> @@ -7,7 +7,11 @@
>>  use crate::{
>>      bindings,
>>      prelude::*,
>> -    ptr::KnownSize, //
>> +    ptr::KnownSize,
>> +    transmute::{
>> +        AsBytes,
>> +        FromBytes, //
>> +    }, //
>>  };
>>
>>  pub mod mem;
>> @@ -296,6 +300,13 @@ pub trait Io {
>>      /// Type of this I/O region. For untyped I/O regions, [`Region`] ty=
pe can be used.
>>      type Type: ?Sized + KnownSize;
>>
>> +    /// Get a [`View`] covering the entire region.
>> +    #[inline]
>> +    fn as_view(&self) -> View<'_, Self, Self::Type> {
>> +        // SAFETY: Trivially satisfied.
>
> What might be trivial to you is not necessarily obvious to others.
> Please explain why we are satisfying safety requirements.

This is what language model produces:

    Analysis: Io::as_view()
   =20
      fn as_view(&self) -> View<'_, Self, Self::Type> {
          // SAFETY: Trivially satisfied
          unsafe { View::new_unchecked(self, self.as_ptr()) }
      }
   =20
      The View invariants are:
      1. ptr is aligned for T
      2. ptr has same provenance as io.as_ptr()
      3. ptr.byte_offset_from(io.as_ptr()) is between 0 to KnownSize::size(=
io.as_ptr()) - KnownSize::size(ptr)
   =20
      For as_view():
      - ptr =3D self.as_ptr() which is Self::Type
      - Invariant 1: self.as_ptr() should be aligned for Self::Type - assum=
ed true from the Io trait
      - Invariant 2: Same pointer, same provenance - trivially true
      - Invariant 3: ptr.byte_offset_from(io.as_ptr()) =3D 0, and we need 0=
 <=3D size_io - size_ptr which is 0 <=3D 0, true
   =20
      The safety comment "Trivially satisfied" is correct.

I think the verbosity here is really because we have the safety requirement
listed item by item, rather than just defining a new concept.

If we, for example, coin an idea of `IO valid pointers`, then we can just s=
ay
the `self.as_ptr()` is trivially I/O valid.

Perhaps, for this case, we can use the "projection trivially satisfy the
invariants" that I've already mentioned in the doc, and just write

    // SAFETY: This is an empty projection, so it trivially satisfies the
    // invariant.

?

Best,
Gary


>
> Otherwise looks good, with the above fixed, please add:
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Best regards,
> Andreas Hindborg

