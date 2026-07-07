Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020123.outbound.protection.outlook.com [52.101.196.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA274229AE
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434614; cv=fail; b=gmYnhuzYPsBgQDZQ2SmITz/BRRKBCif+sSg5lpOeYI6e8zS7CXy0uacd4qeoosbxZvBwNMb0FNWE6K3TFFJwDDp7/l2RESO9CpXjFdnCVW1T9AGYj7JRvnobshV1HKy21uPXVM0ggTENTAgIkCEbn4t4QcabKpKW0q8SJo7APFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434614; c=relaxed/simple;
	bh=HOzkUX9/b8cxWAdAvKmsi+rInx+nc093OKZNirgxUnE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=QsGESxoDJXWUJv5h2g6beW7I87VCpuxJrGJOnqTVud8MaxGURMvd0GcKAr64nbcDBcxZCOk9KAQIq1Av6O0cGsKXHyvXy3AHoy6DPhIUNFfVFJldN30qa2rFUwJ6VqPh0xfI6pQPLTG+fus2eTD8hrO7sMAEt+hbRNQRBB3G+hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=tMj+1PFz; arc=fail smtp.client-ip=52.101.196.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="tMj+1PFz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teN8VnqAMNtOGpvQ07CCZ985MmPqkSyiHysNxOpgf+ocfohl36AfQIKhpMMlXSgfEuFGZ42EPvsZAbMYC8+G7IJU54pAQ/mZX1i5y05TnheRVFJDcvaaQVJaTKrRvXzfiEI7qlr71qxWNcQo/cu5AUtUxjJ11V++V8n868gbPndWJq9fbKj4KX+DLW2F+mqVgqZ6mt1WbjPFDQckdSn75bfAXfz2ZCQAdOHxbV18NdZSTSr+FFBmOdLB5x7Gw2bc9a8b3HorK4aydALOfU+pQWOYLGZoSaaj+g4jYG6ISuIvpMVjuHoVhrVdvGK3YfBX4vQhBn+sGQU0V22ZH+G76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOzkUX9/b8cxWAdAvKmsi+rInx+nc093OKZNirgxUnE=;
 b=G3oYool+L4sTujepAq+5XY8PB9mEbxCouQeTdpxLx8nupcmPZknXIESZPIGTJgzaVW38c5LKF852a/SWhGn1PJ501mymcsdAe6xLstWQkc3o0W8iI4IPDk3etIeGz36xc5gL0fly8EJfi6e1r2aYMfyZ2TGmFM9Rqr+dlXkc70lYmgb+WP9VnXFUpNqNNgJC9GxfNFzCwqpDbSEXHsNgf61JwMMGqSDfNPExmVFkTJIH8LCv+nOPEMexjL11ur5BFPptloHLEl11OrfoZAWPaU9RZX5gOO7WfyDxl8nsfQ3D/626/3OIJMsxjfUH8uD5Q4PvMHOg6Cnx3FMli/f8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOzkUX9/b8cxWAdAvKmsi+rInx+nc093OKZNirgxUnE=;
 b=tMj+1PFz0nzaZMJNHvFhBQnq+WbwOkq3I9nvy2JMvBUmHafB3ptqPJlmB1p/34+pDiB7osoBQtverzeX0RFHkx8N5V7TEdBJ7kcrzoWo12g2sSZYjnDw4wrdeVDYLmYhV2zFbmNBFXI+mhspYUkscC2ZXKlw1IH4uqiZG2W/70g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB1995.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 14:30:09 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 14:30:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 15:30:08 +0100
Message-Id: <DJSET0S73YYD.2HCX79F9XAWF3@garyguo.net>
Subject: Re: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
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
X-Mailer: aerc 0.21.0
References: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
 <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net>
 <CANiq72=Q7aR51uvwKXUh2YWJmDuBAHPECA57qG3Hr20xWCt0mA@mail.gmail.com>
 <DJSEKYNY1LJ6.3SWGGDXKIURC7@nvidia.com>
In-Reply-To: <DJSEKYNY1LJ6.3SWGGDXKIURC7@nvidia.com>
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB1995:EE_
X-MS-Office365-Filtering-Correlation-Id: 453907b9-9ac9-4fa5-ebbd-08dedc343f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|23010399003|22082099003|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q6yuAgtO8eUwgF+hbH/JAM5pPb9zkcqxKs8b1m+Mlf5T5Jn+sbAm/astk7iFan45bdZ8ZQEiUZQBbm4AgLYaG99mBKaHKhdjK3TVMTikl0q0quj86klTCrbPNwQVRtZrKjq1uOXs6SBS+oetE7VAYWzYx6TsfMMDBNd+jKf+OUpIVkazvgGY5BnPOjSMusPHda5TsBtl7iHhhNYuSdm66n2VeJ8evsvA0OcWv1Thd8AxXFdhg4tyU+w8DwHrhrjCFEOmIMZLLhxi6oMODT21UiFsPcPTq99NrJuK2aPj9cN0p1za6dXzSkFaHrg4+rQzhQIFp89PJ1zos4wjx3d+TXuD6eMZbCuOKv+APQrYLRtK/h76k87bNTJ0ScNaLuZj68WA4CEPLsIS4TT/3HVXMiD5jNzAWZr8wtAtAqhgOhhoDAzYpobV19bXMQqNIasO/zDkJ2zGusKBCv+a//aRxw6ae/TbdkE/IEKcpiJkGMKKZRdMt6grjlgXfyXh2qcFJ0511amam5qN52FCZen+DRENHVg8jNbL2FJYjg/ymr8q25IIHCe13VGHwrIIsJCQjpJ7GaySlvw5IDfDEfRNO2XwYqSnotnYoNXIYAIUkiRvF25QqGJ9CunVzIsv05A2edO4cd6S5qQcUcGjSNHe9PuzWfapZNHj4ZJ8ScbLWwI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(23010399003)(22082099003)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3NpVHFmNVowMDliRjVuSnpUS3BXTVlQaGxmbVVhU2dYcEJJWm5hQXpDc1Nv?=
 =?utf-8?B?UGduVEl6WVJhWXJPRXJzWVl6eDlna3ptRTRGUkpDV3BOb0Z4dnAxSlJEa20z?=
 =?utf-8?B?TmtoaXpVM3pKWkQ2N3BsUnBsYWt6NXZUOEZyeUthZDVqbHJockZWU2JKT1Yv?=
 =?utf-8?B?MCtjYmg4eTNwRkdFajBPbTQ4cUppRUpNNDV6V09pcXQxQm9tSHNWakJVNXE1?=
 =?utf-8?B?bE5jVTJrSHkxaVRadURiZ1pMWmlpbUJrTzloaVowUEtacEpLdlIzMUs2a2U3?=
 =?utf-8?B?bG9yYUF1QUR6ZTd2VGFhK2JSY0plN0ovZGw1THlqNEgyNGR5eUNsYXNvYXIv?=
 =?utf-8?B?ZEoyQ3V4bnZNaEVQM0gxNUpMM0ZNdHZxbTBFYzhPR3Q3WXVCc2NGZ2EraHdu?=
 =?utf-8?B?K3JaUjVjdDZqNEJybXhKWlFhc0dObkxiK0pBb0pLbU5FeFRGNUFHbGlxNHgr?=
 =?utf-8?B?UysrYzVBaCtiaHhyeEYwZzYwMURpbWE1cmVzNnNKdksvY1ozMDUrVG11ZXRY?=
 =?utf-8?B?YTA0NGoyUGdMVGEzdjQvODlTY2RnTmNrOWl1SDV2ckRJR2JiV0lnck9UdHEv?=
 =?utf-8?B?aENJYVM5TjQybmc5bnMxalN6MDByWEFnOEYxUU84NGNMSUZoaThJK3JNaEND?=
 =?utf-8?B?Nlg5TU1rNmo0UUNsN2N1K0xxcWxqc3RsTmIxMUR4OG9jaTdYbDRqTDNpRWIw?=
 =?utf-8?B?VjYxZ2tkRWtHcEZVZ3kvVG1VUTRQVERscS9SMU1heXJ2RVJaUlJBL0IrTDR5?=
 =?utf-8?B?aGRqODdKa2l6bUhaSGU2b2dDUXhlU3FMcHhWUW5yTlRFQTJLN3Nud0hqZGZJ?=
 =?utf-8?B?MnB5elhndTZIWnhjUHNvYXIyWGlTWGZ1aFhzbDVpK1owSUx1KzBRR05SbWdI?=
 =?utf-8?B?NzRVenJvcUYwN293UDB5RXg5NkxXRDN2Zy9YK0x5b2QvNzBYdUhNSDRtU3NC?=
 =?utf-8?B?UWpONGMrQWI3cjd6bXpoYy82VjBGWWZmUlhtM1VxRGU5RzZxclhDUWlleDdq?=
 =?utf-8?B?U1Y1Ty9JV3p4RlJzK29GT1RJTjBZMjcvYzU1OGRMK1UzZktDU0ZjaTlzb3VF?=
 =?utf-8?B?M3dEN0RBMDcyb2t4UzNyZkVxbloxRDdzMHNiSWRqQVNlc2VNZ2FaTGZISStT?=
 =?utf-8?B?UXQ1U1dOYU85S0VyZHo4Yk5pR0hhMzQwMDBRbW55MmVuMWZleUwxVXlDN2p2?=
 =?utf-8?B?UDlnOVRGSnZ6UWhNU3dtSWhmRHQrZ2RrNFlSM0x5VDZOZkNkS3hWbGdsRXFx?=
 =?utf-8?B?eVA3WTREU3RudzBBaFhGSS8rU1lKY3lpL01Qbk5mc2JMNVlZcU44U1laOEhl?=
 =?utf-8?B?aGFCc0hXd005cWtPbDRNOUNTWGNsbFFZOUE2QXF1bmkraU1FS0hDRG56Vmhr?=
 =?utf-8?B?VFFwbGJNRWdHWExlSmtJc3c5aERORE92d1I1ZXFERGUrbnFaekM3RXlKSVFG?=
 =?utf-8?B?SzhSUUNseHdMKy9iMkRGUG8rNmplc3VkcG5jZDA5bEVYeitINzV5VWMxWnEy?=
 =?utf-8?B?Ry8wa2s3ZTFlcWIrZmE2MVU5MWh3dW1ZNVJXczRmRUtnajhXZlAwS29GRDNa?=
 =?utf-8?B?S0dvL2xGa1Z3M0RvcXJVNUs4TkRxOU5CU2M5Z0pKKzhia3hGRml4Wmk3VS84?=
 =?utf-8?B?T1A1YjFXZG94dGR5ZjQvRFErQ01nR09VaDVVMlkvQ0o3S2VZRnV4cWNsbWZQ?=
 =?utf-8?B?QTQ5T3JzWUtEWmxYYStFSlBzcnM5SlYwOHpMMlJjT283bVYwOGlGclllaWNZ?=
 =?utf-8?B?TURZUFhiSFBna2hiSS9kdnNYYzM4dGFpTVNsdit3N3Ftb1BVbnNWZTk5UGFq?=
 =?utf-8?B?Z28xazBqRi9SN0JRTnAzaUNyNHpXb0VaeDhORlNwbXJSd1BEWGs5RkI1dDFJ?=
 =?utf-8?B?V0pIS1QxOHFuQ3pOaEo5QzRkaW54WktEdWhwSzI4eVo1V2FOTGxTZGRyZENQ?=
 =?utf-8?B?MEd4VkRURGVSTm1nWE9Vbkd2SHVDRjFEZ2RnY2xvLzkzQ2Zwc2EzR0ZVV0xu?=
 =?utf-8?B?V0xVSG9yTjBOdU8ybmdsWHNrTHBWWlRaNFdZeXdpSDhiWE5kbXlLeTVlT2xX?=
 =?utf-8?B?V3JZeEdmWnJqZGZlanY2R2I4Nmw4V2YrbzE1Z0RqZUJxYXAwT29VbnQ5Vnhs?=
 =?utf-8?B?YVZWc0s3K3l0bWlkL1UrMDh4bGlhNEE5K1MvQjEvRlZZMjNGRVFBRWVkb1hC?=
 =?utf-8?B?S2dvS3QvQzMxa3ZtdGR4SU5sT2NpYW56N2hkRmJJTzBWZjBmK1NVR2poMGNm?=
 =?utf-8?B?VXlud2t6L2tVNldiQnpuNmg0UTdlMHRkalFFQklmbTBvTXhZci9tUmtUWlIy?=
 =?utf-8?B?R0dpUFRON0RkY2ZJekZRVGFIUktXVjc0TEZkQnZyQkQxVE5NVjhsQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 453907b9-9ac9-4fa5-ebbd-08dedc343f6a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 14:30:09.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHPBDLqU6efV6AOqdYlei/Fqpx0ufXIBrpW8CN1PO1tYAoAbHcWbV8hH0M7UdglgLHHMvCL1pNvLO/zV7XyjtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1995

On Tue Jul 7, 2026 at 3:19 PM BST, Alexandre Courbot wrote:
> On Tue Jul 7, 2026 at 9:12 PM JST, Miguel Ojeda wrote:
>> On Tue, Jul 7, 2026 at 1:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>>
>>> We set `msrv =3D "1.85"` in our .clippy.toml, and my local testing with=
 1.88 and
>>> 1.96.1 doesn't produce this warning.
>>
>> Yeah, I was trying to reproduce it locally too and didn't succeed yet.
>
> Ok so this is nuts but it appears to only reproduce when
> `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy` (and `CONFIG_SAMPLE_RUST_SOC=3Dm` to bu=
ild
> `soc.rs`)

That's crazy. Turns out that clippy's default equivalent check relies on MI=
R:
https://github.com/rust-lang/rust-clippy/blob/60f8c3a019cfda37e07de60e9cfd7=
ee77b290fb5/clippy_utils/src/lib.rs#L570
and somehow this check misses `null()` when opt level is high enough. There
isn't a check for MSRV in the trait impl.

Please report a clippy bug.

Best,
Gary
