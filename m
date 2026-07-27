Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E3936DA03;
	Mon, 27 Jul 2026 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151793; cv=fail; b=o27dmU/eLvFB9307AziYbdoPXwZiU4SukoI180Uq9dQy/j4UAzpXbKdnSAxxtxB+ID/KQZduBoMU6ULa21R0g1gDpjL+0HzfJAn9NlfaQhXPZpATdorHiMkZm987pzrUEaovtdJ87Gl+TMlSlvaVjSV5N7FmHQ00svYgblSWlhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151793; c=relaxed/simple;
	bh=kQE40C5ATtjrMcJEH29/KVs3haXUjVMFDWvNo6t1djk=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=mIveiRPCVR08usZ81L4ZwrmiFKmIdLUszKAC3QpdHpjUP9hn4OESzkpMdb4ed9j7nTgTIF7IcdpgmbWa6sFXjW78Wu5WGtLkg5Q6sVmjgmBXrx3+JIBo3VEMcMffQSeRwLIgteNBjIT6txhucMwitTy3u8UYj9i+kd4dzN41UQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rNv8FQPv; arc=fail smtp.client-ip=40.93.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rNv8FQPv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+LC5w7MvTvLXi/GYOvm+oHrVFPwKs9UlwMqyObuBBUJLIxFONL2e9CtJUc5ITjCKJ9U0+9VhMHSQ4XIhr+N6/foZSS5bGNuZBNsCgkT6VfALeXLj0tJBGt6/WNq8qfHzJGGwKrXVIfoyqQlC6ubj3+ROKEIaLSSePr2RzLdszDwVBzlfAI0dxlNueUY5M3twpLqlCbCiCf16v3C2/W8r8jA2P/wtK7rjWLh2LxULzVnbsCIK+TUKpEo5i7zJPUcrsPsP6jUtacDMvni/QXeZ6laQ3weq8KczPA1JfEettwOMGaEzixzKJqUCmZRgjpVQjJwYQGpSfPubMDcgsNGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htskUrv9j8xO4i2SPHFHK2PaG403ZmE583/evso5658=;
 b=UEQUtxKEnHKx1yDJ3I0bMu2jHtqUEdC/o6vyUzf5TwsdagqvWhUekFCugCBU7GbPakhK2JauOHGLS5gDKd042Sva5F9eAYuTwZHH6UmfQmndmLzfG8G5/WgJtd8wNQ8eIlsTtaje4TyYrtl6kbojEpNt0fUiD39TbY8lG7MmykGnp2hAHcIvg+pXC6BcvhohNiNJojqrk1ylFbkiJrF92oqcZ9Aat6r09xjHWqPepwfekqeAoAAKENnQci0Zor73gv6vpsLkPUI8LarxW3Zh2cBcO0C7plV9p0DPKbyevNfsPqEL74Hh8be24Zw6nY+p+9dLku73HOkyKysrTuH9OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htskUrv9j8xO4i2SPHFHK2PaG403ZmE583/evso5658=;
 b=rNv8FQPv/Zl3Es5k/aGxm0nrxd0+7K45x+r6oDrQyG0cKgTKIL3keYM0nbPFkJwGwt35DBkltYbD5A1EXtvOgjvJunNUXzxHXplaUufV5Jq/XFRRnmg2eZGVOrU3kQpVX9dLSoChuxNZpC07Fen0r5p2gpUyIf83K0R2zzERoFzOdUEagMiQCS3ecZDP7LHukifl4TIr0hZew4IbRmB6qe6l5QeaenFyouPcXrn7XJGDa04AAGCjWAFjtn7igGOvhgiWhfsgeBojpvYYOxLmZi7tcMsZxAkTwWSEU0+5916XMSbHN6GdAUq6W7I6eESzsBodTDv/inwfhjBLbM01+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 11:29:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 11:29:47 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 20:29:43 +0900
Message-Id: <DK9BHROP1DG7.20GSNM4VA2OIW@nvidia.com>
Subject: Re: [PATCH v5 5/8] gpu: nova-core: transition gsp to TLV images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260710230428.865447-1-ttabi@nvidia.com>
 <20260710230428.865447-6-ttabi@nvidia.com>
In-Reply-To: <20260710230428.865447-6-ttabi@nvidia.com>
X-ClientProxiedBy: OS3PR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:604:db::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b44969-757b-45f8-d5e7-08deebd25d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10070799003|11063799006|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jGkcQSAq2XyXIhKo714SofjmEl3POKU+a0s8rZJXKVdX3OM/WtH0cN4Gn65GVGj8dxCXWxcLQn6dospOqvmu08XpEkhDXfiJ6qhQTIgVseg6BvMDs9B8BrrKx6plgYiVYmfu3ORN0yFaZDeYAMDKMBz6XPXfTGelYuxCpYhyE1QJmFW0VX1f6ILOdckKirco5A9OzOv4Fh3nrAgi9nOtuuz8NLVl/xNIeVpG+JAzWI+K0nd02BEbnuXYPOY5zKWnOO6H5VBJHldZb6Pl6PeVv1K/MS+s0uumJ6XzX4TSj6ZDYFGM7CS8F3pyVooYTZw83Az6xQpnxoh1fpVZXFxAmH/Es+1YLk4CdF2QA+LQ6U6w4vdNJpLbQz60+f7S3OkCf5TJK0Oqb3pb3k0qvn+LTXmPFjNOYcqGbe3W8m/YP9N4jlfxs0jlyJyXAdhSDftGyh5695s/ImDGYgAxZHio2rQwkqlEwOpEGgwddXTVTfffEOE5EtrpVKTdrxqWOCJwOfUoa5RcfF8widJBiFfIFowiQfyLLc6zKoichlhEYlUH1ylxkyhRdY5UgFtaIRrSxPTZ8jWIyXz+YXx+IrMSdkFkJEfADs16kVc1CY15R2H9pKTBy8Tx7GsSAkClFw/RAxRiDBcCdmKX4O3xhtiR0DMYH6azezonfhUGiU4mNjk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10070799003)(11063799006)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHdkU1VPem5jVFZDckU5dVhYdysrWnJNQTcwZVFBeXlNemRKMUtJNWZDTGc3?=
 =?utf-8?B?bW5rYnFZZUtJV25TTiszTDBJdHdnZm1nd1cxdUlqRnJZZGlEeFYvMXovMHRJ?=
 =?utf-8?B?VUpPQ1BiSVFuVEZ1dCtBMENKMWxmUExDSFRzNFB1TDNpNThPdmJxYW9yVEw0?=
 =?utf-8?B?Uzl2SFQ5czRGTlBzTCtxRzdINkIyeVhKVTlSNUpBcDUzNWlTaGl3cHdZaUVu?=
 =?utf-8?B?TCtGb29PKzZaUnFYeFZWUHFWQlRRN3RLbnkvbWN5SzRoMi82MG1RV1B2RVpr?=
 =?utf-8?B?MHpKV0dReExURmgvczBodURXUXdiNjVrQnp5dUlzbGFlMFkwZ1cwSHVIUGx4?=
 =?utf-8?B?OVNqZE9MSnNJSnRhMHlBSFRIODlsUnAyUTFwUEhJb05wNXhyYWdWY3kzTThj?=
 =?utf-8?B?OVVjNFNPTUZxMWxJbUcwVFg0VW5wOTEyWUNlVW1HaTcyenAwdlVKQk9vQ1h4?=
 =?utf-8?B?NEFJamljUy9pYTBwUklZaGV3dDgvdXNwaVc2Z0ZEQXk0WUU3UDZ5VnJLMW9Z?=
 =?utf-8?B?VXBTMmVMUE9oTUZ4cEN2MnVsMnhKSUtoZFdPWmtPcGpiQmlzMGtsTDN4NEs0?=
 =?utf-8?B?VDdBQzhhUXNQa01Lbm8xN0xob0JRY1NxMGRXNzFBVWNJRHVENk1xWWQwQWVV?=
 =?utf-8?B?ek1McUFqa2krMzV5QXZ4SXZQWlBXRFZmM1ZZNkZtQ25lNkxHNGk0N0VISjd3?=
 =?utf-8?B?MXp5YzFqQTlpdlh2MXR6N3lCVzE4VTFOY3JhMVlBamxLKzEzV2hhWmQ3WDVr?=
 =?utf-8?B?Uyt3czV6b3MxVEFCRXlwdHVzRDBmUitKbnY0MjJCbWVRODFVMkRKK1BCVnRQ?=
 =?utf-8?B?YUZIcno0d3FXN1JiYWs1c1B2MEN4blFwM1haWFUrdnhwSkZna3F0Z2tWbXpZ?=
 =?utf-8?B?YzE4WEdwenJ2eDV6S3l1NVBraStZbHN0TWhROCszTlRJWUxQYUNvMW9ndEVu?=
 =?utf-8?B?N05TelFKUENtTldNL1JWZWoyN1VhcGtBT2pQT2FLRGNiQzJaNUo5MjA5Y2tY?=
 =?utf-8?B?RC9Kd1hmUkk1MGN1Z3lNcEUwNXpjcW1RMzNTT04wOTJKMm1jdWUxdzdzTE5I?=
 =?utf-8?B?aURUNHBVYWpTbDNQTXVqV0I5N0Nsd3lsSWZ4VTRIZzd3Vnd0M0hQYVZrOGMy?=
 =?utf-8?B?STdMbkJXRFcrRjN1UWZQVU94ZTRKRmZGSnoycXlWa2dCWjAvcUNUbThDQWNh?=
 =?utf-8?B?cnRNOUcwcGo0Z0s1SjhDaXViMTJCTHpta1M5c2poZ3pQMEdJK3Fsc051amxr?=
 =?utf-8?B?Nm5uQzB3cFJIb3dYMm5pN1YrWnFmMEs4RytwRm9uVFd1UEJidHFqbzRzK2Vs?=
 =?utf-8?B?aDRjZ08zeU0rREhScVk2UFJ2NzF0a1JUdmEvY1JFWUtHb0ZjRDNNQzZYaGNN?=
 =?utf-8?B?SlQrMUE0V21FUFhKS2Z5S2l4RGl4SXBaZDJ5VkM1UUNBMHQyWXZQbm5PUlhr?=
 =?utf-8?B?RktQdktPdVh6VHdiNjl4K3BYSktqMHJJR0FsK0JDZ09sZG1yWGcyTmdkWS9J?=
 =?utf-8?B?ZzREMWhJQmZHK2pucWpWcEk1MVQxaStSTlNoWTdUZUJzZE9nK0l1RUszcG93?=
 =?utf-8?B?a2tGRnNuVWNxSHBJOEJFRk1lRFp6Q2MrbFczT0tUeG1ldTlXc1A1REwyT3Yx?=
 =?utf-8?B?Rlovc2JxQ2MvcjZpaERRaERuRDZWN2xYeVZIN3RHM0VKMzErZTlldXZpNHpj?=
 =?utf-8?B?Mk5MRjM5R0RpOUlsMWRua0I4b1ljdkQ1S2ZlZzBnY3kybCtCYzNhRWtrYk1F?=
 =?utf-8?B?ZlI4ZzRmUHcweXVuMlQyUGxBUitCRTFMaWJlbG1PUy93ZFBXb2ZJS2NwQlB3?=
 =?utf-8?B?M2FRY2x4c3ExNzAvRHlyZ3J6dXZSWU1TRXkwTUswYStPSzdkTStQQTFvWFBO?=
 =?utf-8?B?L2ltdmsxdmx5TXhGS05zWElISnNnRmpWZm1uSzcyZTNGc1NmbEdpM3JTK1hw?=
 =?utf-8?B?QUM1a0hReERPM3BSaTVpNmRueDR5eEc4VUlESStlTDR1am50QVNuU01wY0c4?=
 =?utf-8?B?bGE5MlJVZm95WjJoSHltUTlTOTd2cXRsNFY1VDdoUFN0dU93NDF2bWVsVXJt?=
 =?utf-8?B?YWdadjFqLytvRTFNUURVeXBScDdwQnFzSnRiUVNhTzNXV1lTNmhsL29uTk5r?=
 =?utf-8?B?Z0NxVHlxMGNjQTV5cnlURmNEa1BvNExWeGN6R1E0TUVKVTZ3bzFlRGJ1Uyt4?=
 =?utf-8?B?bENtMG03bENIYWNQdkZ6VzVPZTZKU1hmOVBOck9tWVNjcGtPeUpObFhtNG5H?=
 =?utf-8?B?TitVTjRUbVhqa0t4UUI1TXlpNDFVekR5Z1NYWGM4dkJUclRSeEJvZmJDbGI0?=
 =?utf-8?B?QUE0VWpkZkswdUxURExVRUJScFA1VFJpdFYybWNNTm1sTkIxNVU0TkkwbStX?=
 =?utf-8?Q?Mxp882ssgNK5lbWDFrjAqmD6Yl0h15/QA4CpijlnEY+jA?=
X-MS-Exchange-AntiSpam-MessageData-1: p7DYLVzgfFq0+A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b44969-757b-45f8-d5e7-08deebd25d16
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 11:29:47.2579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifvLe+gmZ+NoO0APJhhsJh7tXeFQEHWEwKAJsF65TmUW+yfSnAa4sy/oTLBIACQ+SgeUDE+UGE8ItULJG5aYLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6326

On Sat Jul 11, 2026 at 8:04 AM JST, Timur Tabi wrote:
<...>
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 99a302bae567..185cae0689a3 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -8,6 +8,7 @@
>          DataDirection,
>          DmaAddress, //
>      },
> +    firmware,
>      prelude::*,
>      scatterlist::{
>          Owned,
> @@ -17,13 +18,14 @@
> =20
>  use crate::{
>      firmware::{
> -        elf,
>          riscv::RiscvFirmware, //
> +        tlv::{
> +            request_tlv, //
> +            Tlv,
> +        },
> +        CString,

`CString` should be imported from `kernel`, not `crate`. I guess this
only works because `crate::firmware` also imports it and we are below it.

<...>
> -impl RmRiscvUCodeDesc {
> -    /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and =
returns it.
> -    ///
> -    /// Fails if the header pointed at by `bin_fw` is not within the bou=
nds of the firmware image.
> -    fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
> -        let offset =3D usize::from_safe_cast(bin_fw.hdr.header_offset);
> -        let end =3D offset.checked_add(size_of::<Self>()).ok_or(EINVAL)?=
;
> -
> -        bin_fw
> -            .fw
> -            .get(offset..end)
> -            .and_then(Self::from_bytes_copy)
> -            .ok_or(EINVAL)
> -    }
> -}
> +use crate::firmware::tlv::Tlv;
> =20
>  /// A parsed firmware for a RISC-V core, ready to be loaded and run.
>  pub(crate) struct RiscvFirmware {
> @@ -70,26 +27,27 @@ pub(crate) struct RiscvFirmware {
>  }
> =20
>  impl RiscvFirmware {
> -    /// Parses the RISC-V firmware image contained in `fw`.

Why remove this doccomment?
