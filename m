Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020115.outbound.protection.outlook.com [52.101.196.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B7E43F092
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 21:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236172; cv=fail; b=RuoIhX6nS6uWZEmv75tP9pOd4yaON5okfnfarv5xH3sW7+12MAHjliHjHpFL7NglnYZKWQURDc2iUbzVxcpn/I0Z0n2PjbCSpSjTT/8bPdt1TA6EqwR+VPqNnn4U6ni4p2wX68cy2ZD/DTtp5dVt1e40HCDuOAcHS7Za5VdBcXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236172; c=relaxed/simple;
	bh=roCbhJHpm3ac102o1LjC+L3I5RFrX1LB0nym0oKdLgA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ut/qybfqti/1Bgnk91RDFglNGYLwo+JFveZiOLfYetdkEBynBHewq8YFD+g3Jfiw3MTjkUJLFcUikyTuyVRkexmhzE2ZU2JnmqFc92Ov/2UL0yHpV2TIkCEDcIVLoStN5Q5NLVRUbeGMq0RXhCBBv2dzEB3VGeCZljv9qgmuHyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Xcfg3VGK; arc=fail smtp.client-ip=52.101.196.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Xcfg3VGK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSscVJ1mPqQrINFEze9PmOrQwOphrslxUYSqjVTBu3wb6JrYVBddENtXpol3R38kNibNPElU3DTt2i27A1m0lB4vMRRYrrJgC50MtBD/04wIRtVOsYeN3eSXBBdvGyJB8jqrgP108cMg++p+PDMDheiA93+a2sCxAt/nb2R2Bb/iD05xlikvY9gxN+DmoVG9ZkvhcmPy3Hg2UPwsn8MAn06TnqR7rEZ3sXUMNGK9CbmG5h+6U1SuE/ApoEPhez5ssRomiupxpr5+m74BxXTFN7Wwnknv2CjBRxx86bOihyL6dGnaBHZHWxNTnplop9qylBvdN7ByxhEGxnauKDSs2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEH3rRVheE/CSqh2k8rs0xFNX9kSuTBl/AfizH2qYzU=;
 b=M1YBVC9RNBXNOnsfOFAPTbWnlrXwML1pSwqoojQ94z1QUPWcW82sntKeBmlHrHbiwL8RRYLS5Vn5CFCS5TtJjEEI5cUI1bY6hiinzTYYh5mdCuE2foRARILtVW+rI4QFK0a63RvBT/aWW7A36SbZgAHA3P7WHCYvc25QWhbLGNsIn5fVWSOyG+KROGm5sibM9FQPrZNfT7yxUoYQreyhVroHnvAU4ecfQy/pmpk2DOLHJ+Ybl03BLJUoQZGFqhVxxHSnLjGSusKhu1s1Ll3CBDjapF0C2XomKQlIIcEvD59hddCfGS6D9vqTyp31CFCX53CcU24H512NdJZd6FqzKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEH3rRVheE/CSqh2k8rs0xFNX9kSuTBl/AfizH2qYzU=;
 b=Xcfg3VGKaIYlGY3ZlIvSqsmatigNOoL9uh4p2sLGTQJYyJZ6gHoeeE8u0JRzc1N0ndbFKwDrqezqvEYy4EKwaVzMB9oATov63sfRs108sxFtPzA+PHushAJctUra/gbUOJEGUy9d8qzvNyV2x76Y54poXQyZhXyHFksS/34IV4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2055.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:09:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:09:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 22:09:24 +0100
Message-Id: <DK0AXMJZJPFI.29VNUQXIEJ736@garyguo.net>
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
Subject: Re: [PATCH] samples: rust: debugfs: fix excessive stack use
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260716144144.3665719-1-gary@kernel.org>
 <DK0A6FE3RARB.7ITJEIUVGTGP@nvidia.com>
In-Reply-To: <DK0A6FE3RARB.7ITJEIUVGTGP@nvidia.com>
X-ClientProxiedBy: LO4P265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2055:EE_
X-MS-Office365-Filtering-Correlation-Id: 94787852-c212-4e90-908a-08dee37e844f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|7416014|3023799007|10067099003|56012099006|18002099003|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4wh/0my6ejNBP31wrQrhEkfufbOTMQ3BHCAqxBYQQfh/qu616am81hbATZ/dxnCrksXuhaqV+04GwL+91+mk+7GcYn33+HYzxd/ar91SK9pUC3UniinODp2OuPqj7h6+wpQsES7vKfDTGBIovbxDkQBzRzKrRdFGXljJZ+HTUKGxSmbBV5qZdeknfaNKS4R2wnHoA2lk0/nIfzyAGiaCU5tt5m5AmgTJEK7dbUBffUMnriTmE6gqQZ2qxBU8O6/+FtuIOpkPIXIYni9QjvMMaXGEzQsBj/Egc3GwkyxdrftVAlTajq26dXbB1eMwLoPDExV/e6wU1WZf0uYSsJuTyy6x74/jbsorkiIkDgakJUj65hRVgtatpwvn+X9zVQ9WHXqarT6F9cvqZT0ECR8mmoWlvzxbY33cj8QlJ8vACw+6qwF3LCrTWnFQ6gmadcxpdWDWBItLjo7wId5qzcMVCCUJmpxn0v6xjMHtf4i/shstmApX16DpgdcarfH5LRkxPxxJVQRpGUgb5SBk/6h7iX3yFQ5/k5Fg+ahLg3Zd0sRr+hdXxO36cxaylCuO1WJ6WSsNrX5B6mnGyVmMRQT3o9ZecNoiW8fyfJ4StNwvN2OiZLnEZMjUxCd/YI6chraTDIoI17jc80+1OAD5K4IvRonMXPyzj3YCseKDGEkes/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(7416014)(3023799007)(10067099003)(56012099006)(18002099003)(4143699003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkZJRUJvbFRrMksxU3dJLzFTUllsT2JwRms2UWJpWFFSeVJnRndlYTBkVkRm?=
 =?utf-8?B?Q254MzdVY0crb2tJRVhXVXh1VDB4T1EzMHhMWE5tb2FhdGVRb2lUUmFQZDBZ?=
 =?utf-8?B?ZklIL0pzcFdXY2ZxYy92bHdrN0lnZjU3emVTQlZJTkNMcGhiWmxkanF6QUxQ?=
 =?utf-8?B?aytkamZ5S1NHbDVqM3F4M1ZYNktmMXZsWEQ5WElCa1o5ZC9RbE4vSXhQT3R1?=
 =?utf-8?B?MWc1UkE0eFZuVk1NeTVOL1p2UzR4SnFZK2JSMTRnLy92ckVoNjlodEFSbThP?=
 =?utf-8?B?VVhUbG9Zekd6YzBnNHQyRUJBQ21FcUxRTVIwNGFzNGFraTBtLzFBK1FVbEgy?=
 =?utf-8?B?NzRjMi9Ua3pBVy9QdzR2dFFhajR6bG1aMVNZdE1mNUFiUXdGOHM2amFCQW9q?=
 =?utf-8?B?MnJ6UDlFQklHQmVJYXlIK0tBQTFwZSs5bVhEM05pbENMYjFXTlVSVnFsZDJo?=
 =?utf-8?B?VnJiR3dRSW9EakVweEg4TmNyQjlKMnF0M2JFRThmQWE4TTR0Q0tJeStNQnN0?=
 =?utf-8?B?MjB2cVRiMWduYU8yamNSbGVHMStjZklIbm90R09LUms0UDZ5T1lRYUpva21i?=
 =?utf-8?B?amFGeWlwNmhQMXc5aVd0dExhcEJibCszcUtGLzFQajQwb3VnL1JZUkozL2pE?=
 =?utf-8?B?bHBiVmhsR3NPQ0ZwdXc0WG5mbWZiUVR5b3J3eU5EUjhtbVpBUlJQcU5aK0Ji?=
 =?utf-8?B?MTd6OVdlcHNCS3E1azFJTE44UTFqcmpsTnUyUUI1SmVjbENydzJpTHVJeHdj?=
 =?utf-8?B?T0NDRHBVdy9IK1dUd0NZUnRjQk5TNXZ5dTBjSmZSSmszZVdIYVlhd0FhQ1E4?=
 =?utf-8?B?U0ZTWFhwbTYxOW1WNHVXYzFoMTJyYkFXR1FhNEptZXdDUktQUE51OGhMRnpu?=
 =?utf-8?B?ZWVITkdjUXA0a2t1aUZJa3N5YVpKcEJJMFlUblVHWFA3VEZRV0FNVlV5cnRT?=
 =?utf-8?B?dVhTd2V4RW1SWVAyUVI2dUtycXh5Z1YwN0xyVy9CR3NSNGIxTm5aVWtDcDFS?=
 =?utf-8?B?aERmVkYveEVyYUpPdVR5ckpJVHVwMW5GSUJMQXhqUzlUUHlEOWpuWDdOTjAv?=
 =?utf-8?B?VmFhNm9Id0liLy90bW5JcE4xQ1ZYVGgyNThteWtlSlVRdlVhb3RPU1B1bkNn?=
 =?utf-8?B?eE1qMTExS0d4c2RuRlNHTEVuUzNPTEx6bzFVb2E3N3RnTGNFTlNxcDJoelB4?=
 =?utf-8?B?Vk9QenpCYjZKb1hXY3llTlBha3NXcFg4d2QvcmRXRGI4SjVpUUdZOG9TTVRT?=
 =?utf-8?B?Vi9JYTBHM3k2dXV4K29oV0g2azhBVWRkbCsrOC9VMFA3TE5YMk5kTTdkRkx3?=
 =?utf-8?B?TjV1aDBWT2dkT3RtTSt0NWcxbVJGaDVCeUM3MlkrLy9jalhqVzZrazE2THd3?=
 =?utf-8?B?WThDdFIxNERqZVl5T0hWenB1bWpMVWkvYnVKbkZ5N0duR1lzWjBVMXRXWnl4?=
 =?utf-8?B?WUxZY0x4dVdVdVF1U3lSeDNtU3hqVXl3eHFDdDF5VnczV01LeU8yaFlNUGtV?=
 =?utf-8?B?SXh5UjBrYUxlSXJ5TGRYSnh3bEI2VDRKRHlPTmc0YjZ1cC82ZWpOdjIvMGdS?=
 =?utf-8?B?NnFVR25lUGo5MFpwMTZnZ042RFM3eUE5RncxRFo2ZDlnTGtXUGFjK3ltcGNZ?=
 =?utf-8?B?UElDdi9xT3FobGpGTnhIa2JQM1VsMnAzNGovaW52ZW1rSlRzL01NWENSYmF2?=
 =?utf-8?B?cjdkL1M4Q1I5dFk2c1pNV1VCam94UnJaekVSVE9CNjJEWTZKL3VUN0RSRVg0?=
 =?utf-8?B?eTBVTW5ocWZHT3kvYVhDQnVWK3doZitveldLZmhhdnlBeW5BSytvZGFxaEtO?=
 =?utf-8?B?TVJFMEtqUFFLLzBPOEM5cm5ka3hndEdlZ0JnbmRsWC9hdmdBOXA0M1RMSXJq?=
 =?utf-8?B?aExGTmFkY2JlM3dqVFJDV1BTTUR2b3FFU1JndmszcTRrQi9lVU9XODZBcE5N?=
 =?utf-8?B?MmlvRWlVUzZKL1hjT3JKeVJhS0Qvb0pheHRCRG5hS3ZlQjJzY0lzOGFHSnRJ?=
 =?utf-8?B?YmxweXJaZWZ3TEp4bHNoWWJoajRzQ0h1T0tqOGwxN2w0VGpteENPNm80U0Z0?=
 =?utf-8?B?UkFoS1VKY29mekNNWU5vci9wSmVIZTdMdWd5dTNIbDNXaEI0NnZrMnhnVU1i?=
 =?utf-8?B?ZXROeHpRMWhKKzExdmNrRTFVY2I2WGIrOVYxcHo1dWRLcm5WVEh2M2xsR0Rv?=
 =?utf-8?B?Um1KS1RTODkvc1M2ZTI0WDZaeVY1N1c5Zm9UUXpOZDh2dlFkYXg5MlZ6MzJD?=
 =?utf-8?B?YmFGYzhSVTZEL2RzNlVBTGNyQnpuSnNVaWh6YkpabWlWeUFidzVZZjVLQ3JU?=
 =?utf-8?B?b0pKNzVTZzliTHZ2SlY5bzI1MFdYUHpGVXc0NlR0RTBWeGtiTHdYdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 94787852-c212-4e90-908a-08dee37e844f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:09:25.9933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ep2+M1UixYKr7Uyfm51xmiExz18mreamE5Z9Fgsju2yoAR5KMK8CDOazEWcHua/GlNKnTCgC353cjdn/zgRqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2055

On Thu Jul 16, 2026 at 9:33 PM BST, Alexandre Courbot wrote:
> On Thu Jul 16, 2026 at 7:41 AM PDT, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>
>> The current implementation creates a 4K array and move it into the box.
>> Klint reports that this causes excesssive stack usage:
>>
>> warning: stack size of `create_file_write` is 4472 bytes, exceeds the 20=
48-byte limit
>>   --> samples/rust/rust_debugfs_scoped.rs:54:1
>>    |
>> 54 | / fn create_file_write(
>> 55 | |     mod_data: &ModuleData,
>> 56 | |     reader: &mut kernel::uaccess::UserSliceReader,
>> 57 | | ) -> Result {
>>    | |___________^
>>    |
>>    =3D note: the stack size is inferred from instruction `sub $0x1178,%r=
sp` at .text+2205
>>
>> Use pin-init to create the array in-place instead.
>>
>> Fixes: f656279afde1 ("samples: rust: debugfs_scoped: add example for blo=
bs")
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>>  samples/rust/rust_debugfs_scoped.rs | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/samples/rust/rust_debugfs_scoped.rs b/samples/rust/rust_deb=
ugfs_scoped.rs
>> index 6a575a15a2c2..33a4a0865f5b 100644
>> --- a/samples/rust/rust_debugfs_scoped.rs
>> +++ b/samples/rust/rust_debugfs_scoped.rs
>> @@ -75,7 +75,7 @@ fn create_file_write(
>>              GFP_KERNEL,
>>          )?;
>>      }
>> -    let blob =3D KBox::pin_init(new_mutex!([0x42; SZ_4K]), GFP_KERNEL)?=
;
>> +    let blob =3D KBox::pin_init(new_mutex!(pin_init::init_array_from_fn=
(|_| 0x42)), GFP_KERNEL)?;
>
> Since this is a sample, do we want to specify the size explicitly as it
> is arguably more readable in this case?

It's not easy to specify size with `init_array_from_fn` because you need to
specify additionally Init, T and E, so it'll become

    init_array_from_fn::<_, SZ_4K, _, _>

which is ugly.

Best,
Gary
