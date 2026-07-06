Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9EA3E1230;
	Mon,  6 Jul 2026 06:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319476; cv=fail; b=h1GDOjPJU3NjhzzU8Upsk4Zdjrab1iDroF8f/XI1bDLqd7Msavbn4ZAxAj0TuG8/s3vsAQoEEwXrQuZ9mcFSY4g8MlYiUivMeUiUrPLurrtfv2wWp+J3Q/QDlkU2GUP4qG4CMBZ2Sj2hmxHzOlNDddxP/txBIb2IT/wIIpvxx1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319476; c=relaxed/simple;
	bh=1tcdRoLF+nAib8Z5l8cgcM4netLMvE29lDnE+TYMC8Q=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=V724VGxAlt2msDqu0/ihpoLh9yMS8l0vOSTtPY4RNvBvkPVLSupkjgj9n7DA6IPvhTHIEK4l+A0FyzjoDFrceMHznz1DvDK98fIHxVsTwPONYselx+NTEzwF4kqazFM2rEZ5Jnh5w/H+MTggQc5kL+yoxo5s6GhoEsrLsSUHgZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WFT7Eodp; arc=fail smtp.client-ip=40.107.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WFT7Eodp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkVr71aXeVcnzsg35Jykd0gyX04Xd2+sIIOaH38Ii/0lOFmFs/6DuJay9EMdykXx7VMmd1qJXQCk2TB2QdxQDiF3KoYhxNkU8ufZsShHsuyDviPjaq9qUORnGM5eiWd0t0R9jm1EsQvDqqiqfveSDfepPYTUFe+h+gbhESG9i02r0uchKnJakTnH4aDb/vxHWboxwBYZhThmNwIgQBtgTHvMj5mB9vwuNkgGcmwV2bNUhclaCpp3vfV5EBkR+c+EHYiCpPtgAY6qFzU+7ityez8MFZS75ExkVx5oSYTaI1XMwT4bQFQ85OSkn3eDEmDSof6iwfqb5ijZSEQ49BLQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KA5spbU73hPSRVwkWUMp0dYyaHpqDnslcWInf/ly394=;
 b=ryCS7nQK0JpgGpOrlT2cS8qKuYlzUIOSVKVLfoybIIicK9vrdUHlm+acekHtg+Gk+Nj59zd63gwJrVaS4Nnx1gFPVFMa4PPIs74MxQCwoP8TSqUcmIeh24We5uwwHM/Reiy7LzEeeoDeJSdlyepjZwq42ykMZ3Ce+IpNkAd2y43AyLaJVL80op8Wgd3aKUUw+UC5dPluZdsrjNNSH6ZP+9VWMRYHZLVGlKeZo9J6hX0kwJu/Uib9bXamkjE6nP8tzt6uE0a15Q/QjX8uSnDC8xW0ZGFro1DpOUi6Hs4RGjXnLJApbz5ZxDhYeKFjMVDuiQ0Qby8C30HITNrEy/Skwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA5spbU73hPSRVwkWUMp0dYyaHpqDnslcWInf/ly394=;
 b=WFT7EodplS6WNKa9J6/h52tq7SBcXB3L8j3CFO7/p/5Ib4xnn6ollAsBj4D/CTZ18dq5ADa+o3WoIA+RvLL34GUDBohlD0PEUhMSVyCuJt0I2Wf94zNOSUD+Na3e8ssiL+LVOSY8nURkQbHLoptnkj/TdjYZlYe3ljcnVx0gJSh0S08705bIRPd/UDuZD5lQ78rTirnL7UCpTBIxstEspcLNg2cTByKZdps5RYGmSh8YlyOQg5DVLlyExvSUdsUey8SjaXM9FuX8KxUBLisqVv4nm6pPlTrJeSJBoPDwba+aA7rVFYsV3kzWaXYd+8kUCkbCslYNmp3H2Y0B063atA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 06:31:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 06:31:00 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 15:30:56 +0900
Message-Id: <DJR9ZKFB5WQQ.1CGI0N3GS1SFM@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>
Subject: Re: [PATCH v3 1/7] rust: firmware: add request_into_buf()
Content-Transfer-Encoding: quoted-printable
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-2-ttabi@nvidia.com>
In-Reply-To: <20260702192712.3450652-2-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0169.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fc28e6-c7e8-43f7-d099-08dedb2824c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	obV7lzhUYkYgyxU886vVbB/eG5QbCuCJn6To1IML7c3aElYvH3Ow16mbcsOrc4qCKceZ2jlWqPS9OLiM2WnX7ko1M5eOlQVYqBbW5J36hbv/h+QtulO0F5rG2XlnFRvTdp2T/etXHuxPiADblJuvwvi/3luIrt6ujF8/4O1x6cbaOV4BUEyL3j/V7HM2IJ6hecFlWyAloQ/Y+meaJ8zktFteJK6swTP/zyferQdLOlxju9nf6fLgWoEA2cDuCvBPZlQ+qICMdUdCfNJielFhfhFBERDQ6udHAhBKvZWQmjJO1U+GUWjFGUnqz07O84CJP9a3RWfzoRB4yUvgWC5x1p5DV+39ebimg1F0KUxGepaS6XnGj0LO+G0iKH6S0KEq5GfFOW41iKcNcxfqgfGypOyOUR0ChwuGK+bhz3+w6N3BuHAmH4RR5Xq4dCVQyQghqPmr3kLJfmCucuSQskNc2sptldM1DbTqQUivJW9cdJDfNCnaMoUcGF6XT9wvHVm0utgXvRM+W38ozXe4rSHHKBOhxw5LykLOzfh3/R82MZnPe3ajPANRo/ci+Pe1cMvDW08BuLU5vDi740mStvr/shlcGG43IvlhOgxQp+ZYCKuBJlhL+De1/7Rq81lMc1LM8RmwNbT81uiFeSiXxAhF3lWythcEi5gs6NdN0Ar5kZM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjBBUnJ6R1RUWnZTY25OMkpOZStCd0VtL1hXa1h0QUQ4Wml0VU8rN3Z4b3ll?=
 =?utf-8?B?WEpsUXJ3TEt3MG9rMEVTQUZoeHhDY0Z6TTF0ejlkTHhkcDdaSzB6MHprR1Zj?=
 =?utf-8?B?cE02aHk1MWJPMXF1ZEFsTExvVTRacWRRSjNMRGJ6NWJRR296OFpXY1JNSzZ4?=
 =?utf-8?B?NWhoc2VaazNUdlh4dzdaREI0czBNSi9sTk5QcEpQQytjUWVORjdxaVpEazZN?=
 =?utf-8?B?RklWaDNTZU1WYThSZHhNTC9qVlVJcTNXT1pQenRHa2craXF4c2d3SEF3UTl0?=
 =?utf-8?B?bmpIcUNQTFhWSWFrUVVhRGF4TWpjU2xyMmk2OGFUcGpKVzFoQ1ptcFV6NzZk?=
 =?utf-8?B?TDBXekNnL0Rzenpjb1AxNTFMMkVBUUhmTklCSit1SGtidm51QWJPNEhCd0li?=
 =?utf-8?B?Y0tHeDJrY3ZHbE9tNndaZVlaSXV2TCtLVzl0dGlWaDZPdCtGd3pERXNMVVAv?=
 =?utf-8?B?aUtRbFBqTjl6c3JCOFZ2dlRRNi9CQ2tUcmpFQXlDcituZnRhaWhWTEFvU3Rv?=
 =?utf-8?B?RFJxY3lkc2UzSTJjMmFiUWVvaHNOS3JIY1gxK3hqTVIwcXFxbk9QeDBhWWxC?=
 =?utf-8?B?TkFTWXNZUGplUU1jbHc1T212SFJMbE9KZnRkY0xaTjhGRmpmSDNzWFp0c2ZM?=
 =?utf-8?B?NWJEN2hodCs5VnYxb0x2aGM5S3NxbVZMVXFUdDZERjBvVjdUbS8yQlJzallB?=
 =?utf-8?B?V3FObHFOSHNEL2pGeEJ0OGJUZFFsUnI0YndCeURwYjN6d2l1WFIvUVZjdnA1?=
 =?utf-8?B?eVZ5UlZQL2NBcUo0bW0rd242MTNFV2krUnFKVGd6SlF5ZXJYNG9kanVVUjh3?=
 =?utf-8?B?Z2VSZitTamd4Zm5yNHNVd3dtZjVjOEpKS3hhL0Z2QnRwMVVzanM3VWI3S3Vh?=
 =?utf-8?B?Z3QxUVJ3SWdmbnBNYmVZdGg0ajg3NnRXVEMxYWhWVFZOejFpcktWMTBUUjAw?=
 =?utf-8?B?cFpQVnU0aE03MXVUN2Z3MlVrZ2tLdDhEK3lJclpRazEwRDEyTHduNjVtSkVv?=
 =?utf-8?B?UVpQZzZ1ZWRYUEswWHEyQWc4ZXJJOWszZmxBZkVCSEtVczMrVkhQcGJxZzk3?=
 =?utf-8?B?aHJFVXJJYVJRWTdlYUY0cWhqT0VJa2o3cmVPaEc2TEZQNUlPWlpZanBmOTdO?=
 =?utf-8?B?NzBWT0VGcUFNbThra29Lb2tEMFN3bDVDbjB1RDRzc3MzaG4wNDZuQmFoVzJD?=
 =?utf-8?B?NEpLVXFJc0lTU0pmWTJiMjNtYldES1RpZElvVThOeDlJRmEzUG43am9Ra3RR?=
 =?utf-8?B?WE9zM2YzUXNlV2NkT3M1NjRRN05oOEhDb1gzaS8wYzJKL3BwOHJqN3FIbTRt?=
 =?utf-8?B?UGpFcmw3bzF3QVVlZmpsb0J6VmdLeHc2L2tvaVk5WUViN3pmQzN3bGM5YmFH?=
 =?utf-8?B?Y0tSWnJzQkRpSEYrT0QyZTF3cUhrVmFtak1WbE4zWHZ5dUh3ZE8vaDExN2E4?=
 =?utf-8?B?Yy84bnM3NVZveitMMENRd3h0YUhCY0RhTUVuanV5d2hld3QyczJKRWFJa2dt?=
 =?utf-8?B?c1czNjAzZEYvL0JvRGxkQXplMjlqdEp6bW9YTURJejlyQ2JSQTNVVDkxWGZ4?=
 =?utf-8?B?dWNHdXJEbmhXdTdpcjI4ZW15UUFRWm41MnlhSy9teHNGdUNyNWNxNjZNUDdq?=
 =?utf-8?B?YjBkRlJRb0gvT1RkVTNCMGlGekY0SXJnem85c0ZhWW9LZXZHRjRjTGd0eXNt?=
 =?utf-8?B?MjR3YkcrQkNaYnZZWjhmZjkrc2tkM2xwenhOMW55QzIxQmxjVTJxamgwZklt?=
 =?utf-8?B?TlhPTG5QOHZLTHRPQkFleTd5SUdVWFNhZ29TNzNJWi80SVRPVjlKeVJnZjFl?=
 =?utf-8?B?OFpLT1lJblBwVDl1NDdvVkZIektyTFdvMDlKOWtDU3BMSkczbFIyT1pHUnFa?=
 =?utf-8?B?U0ZLbFNWVzhjb28wUS9pRy9ZTmIvSVh5L1o0RG1oZDZsUjNzeU5JVlNCOWR4?=
 =?utf-8?B?VDExMVQ4aVlUb241Q0tRaEZzbFREYzJhUk8rQjJvcmdnNWpaZk5yWnRpajYx?=
 =?utf-8?B?SW1BZVg0ak9Dd05PVHUzenFYQnI3WkhRTWJJdW5HeDdCV2VuWjlWZU1BN3BT?=
 =?utf-8?B?alBkS1FRK2hWdWMxVUh0dUV1QWNHUWU2WDlibXJMY2VHcTdMd3YzalBNWkty?=
 =?utf-8?B?eXhLT1RaZmZPN1llRTJ5QWFzTmdZem54ZlMrZE8zUzlrZlN0OG5zZS9RWlZ4?=
 =?utf-8?B?ZXVLK2ozNjJBUHFvWWxQTnA4RGNmL3g1dFVVTC9CdFl5SjBUc1o4dmZkeXBO?=
 =?utf-8?B?YzJ4ZWZUVi94SDdMTVlXZTdqU0kzVUlJTHNXTFQ2OHV0RWtKejd4TnNHRG9H?=
 =?utf-8?B?SjNLZWNsaVpBTjRuN2YwV0h0U3Q4dXA5SmFvT1NNWCtZUlU4MGVZU0l1ZGp2?=
 =?utf-8?Q?8Fh3WfA5334dtKDdIdRIMik1Hasz+telQuiR9MKg4owIO?=
X-MS-Exchange-AntiSpam-MessageData-1: bLdPYcZH5qPQJg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fc28e6-c7e8-43f7-d099-08dedb2824c7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 06:30:59.7466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCPmJrUQVNr2TGNU0Ns2cdLrVx+R6NLoY5Flwsd3tzjlPGul/3rT+a76YKFsMCH3zMRbSABULDmBOJrnYC90jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220

On Fri Jul 3, 2026 at 4:27 AM JST, Timur Tabi wrote:
> Add request_into_buf(), a Rust wrapper around the
> request_firmware_into_buf() function. This variant loads the firmware
> image directly into a caller-provided buffer rather than a
> kernel-allocated one.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/firmware.rs | 47 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 71168d8004e2..4460fb2cd5d8 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -120,6 +120,53 @@ fn drop(&mut self) {
>      }
>  }
> =20
> +/// Load firmware directly into the caller-provided `buf`.
> +///
> +/// On success the firmware image has been copied into `buf`; the caller=
 accesses the data
> +/// through `buf` itself.
> +///
> +/// This is intentionally a stand-alone function rather than a `Firmware=
` constructor. For
> +/// the `into_buf` path, the firmware data lives in the caller's `buf`, =
not in a
> +/// kernel-owned buffer, so returning a `Firmware` would expose `Firmwar=
e::data()` as a
> +/// second handle aliasing `buf` (and `release_firmware()` does not free=
 `buf` anyway).
> +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Re=
sult {

Sashiko is correct to point out that this doesn't return the number of
bytes actually written into `buf`. We might not use that information in
nova-core, but this is a kernel-wide API.

Returning a `Result<&[u8]>` would take care of this and cover the
general use-case nicely.
