Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781F73C2790;
	Mon,  6 Jul 2026 06:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319543; cv=fail; b=s74FP1Fn4uTQkseKdWvhVi/eWsH7ArAzroHZT3AEcDEo0EDNrzUBTawhpliLo7T26NrenivWuAdIoSfO/DQnIPqXOSzSmkFseyy8ZoKxJoW0/bH/ULZr7z6XKcSitLa5cP1rnWpvtUt0DNRN1jAna451LhWS5/M8qkFmP8Un7VI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319543; c=relaxed/simple;
	bh=yCAb+Iqhce1B2p+FOu453YrkFgb3AvgKA9vtMM3urag=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ajJyP+ILpdhvtLD2idBm7fWjR0cYmM6CVaj4FgI3aeeOn1C/K+ZFtw+Q5NH/j9DZCK/MVyXNzXyDs2vgAMnCCHsULnue/tnWyBYu4XJj+6AxAl7rJh6mfrui/y+iSiXksHBD+JEzmsQ8be8Odm9hungSA1XEtuENWv6Q5f+3m2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mdOXNNW5; arc=fail smtp.client-ip=52.101.85.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mdOXNNW5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BriTr6Xd721LbOAUkRtyPmtjrFc6Q4HB2IkF3SQIBdRzjRjvcykEMs07yfJzTDwcLbzlwubkFdJfsur+cRDIej1ci3KMDw+K/B51Wmj4e52Tf8PGCTIigkszu7rd+ip5maRIy1vR7iN8lB1iMerQ+KDxoj1ltvR4ryFxRpv1oFS1y7FHM8qOKgcdkaizGXZLZJu5zRQfxx26gw2ek6HokMIYzPyAkGu3xEanoZY2Ll1M90Gq/AoBCOHSos3zUsGr/bPB+79DGh5bbOPoHRPiBAo38w+cUtF/fR1jx7Z1uP8drhjUFz7/5MCPg86/OhghFCEszB/xbhWCy+Cp3czRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QAUtVXtem4krGYvyAzCQeWnbhE0ncKm+L4JqLVenEc=;
 b=h5SrL6JcIS7WDTtIj8FuX4tep8MQfq9bHhmC3auoIFh/dbM9wlEnxC5d0GJIWviXhBS739YZymbG4DZWc0++LMi4uppMuQmX090XgliNpl9PvvFM48QgN+B34rNtLEmSeHjv9Olhxkb7WYZDpErmskL9XaWmAR7GJaNVh+AxJrGNC0Cq63451+4W86zHnPY5bVjrBVQDi5222t75kTo/mZBobspCuEYlG+RIpOsvYUPCCKrP+e0l2dvJa6THcjlLi7WwePxTBkP6ngCLGKuA4u5mshaooXLb8ff0DrY59FVvS/Pawor2uCiNItSqOCLzfiG9Syx4G2C59oA/9gklMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QAUtVXtem4krGYvyAzCQeWnbhE0ncKm+L4JqLVenEc=;
 b=mdOXNNW581a95d5781Xgqgr3KguakrY6lTCocU0gyZyQaky17HfkNyvqw8ospuZtbKi7jTNIQCM+KD1/1OpRIXoT3oZ3adJLPiAu9ZrIbqIX6RHfiVXYv+vHhUcrtkZJVWYKULow48Ou2wmrXmYUlGKUryJwEfzSvR+dd3iYDdSJhWnGiWKtYxanvIG1XeKFOoO5rWYs+cSHhKxnW3zV12qBO9ioQF8PSY3hmenUrx7tCi68g0uIGUb7uzMf+8KBQ9MvyxDZ+vSGDg+reHWfpklRI3JW4q1cmvIDHQYM5UeuHDuZJOWxFmyDAO3pwe5c/x2B3Sw3o129Hy2PYoN4ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 06:31:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 06:31:39 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 15:31:36 +0900
Message-Id: <DJRA02VV16AS.3W0QHW9YYSLXE@nvidia.com>
Cc: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>
Subject: Re: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-6-ttabi@nvidia.com>
In-Reply-To: <20260702192712.3450652-6-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: 871c4cc7-5cf0-482e-b0ff-08dedb283ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hC1Px06O66sU84DTo7stuxINQFqRF0yJ95kwZQokGMZ8JEcX+q4aXBMqwiwqjmGTvfrxkAs5KpSn/nFh0t2u1gyYmk8Tug/V8Z/c4wCedV43NXhEP8aUgRamt9aCmjNSTkeSpRb1Xkx0Tsm68ycVahviiGO1WVNiYOg5miN7JPmkn5af2ljsbvqeQjHVCDH/qbgGdMPJl1lFktDELuJNRJTUD+wKEn/T0Ukl3LKD6zI/Tgp8qQugIDigexGrAFwhLWUyjC0WWSzgAblkbpBeX8d/Nll+NLSyt6Wi/p+x8EBWb34Fj5AWT3RrabeewH09QHOIWaOchBlfZ91hMS/pBur67tSw0ZwKM6OWb30DhKS6cEzDkNE6Js0I5QmC82ZPqfqqXLZTrh+rSkp29blFoFlom0YEhKW1BFhvTD3g45VUmrPJC8AwctyLQJqjmbfYjsuUbS1wxwUbiO94jf4rg8pxX0IYqEkrweTgyfv6+dwIMc7KdYc7MmZ/ssW+X75C5rj7QAZ9Aig4Quuz7uyhlkJcNjggFDarZIKJhDp0/E62w/R+TXj2HsL4RHzBh4h8/h9U/B9OCFZVWwoh7b44BrLoZvy5/JG2hDDllXC0dJLyboEKD3TSMSbNI045rizp+w4LbyeGLx7wBl1jG2gzDJymgogMm1LAuURb+H5GaJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T09TRFNiNm9ya3BPMHdjdjM5cGpnN3BIbFFTd3N0RzhYRTRTOSs2WGhsdjMv?=
 =?utf-8?B?U3I5NGkyRkcvUzBBK2JGbTV1VmYzWmJEY05pekhoek0wSFlyMnJnS2tOZTNj?=
 =?utf-8?B?NEhaanFDZk1ibWhXeTluVXhRakhuVkR0UDF1NWNqQWY4cC9RRTdFUEV2MTgv?=
 =?utf-8?B?SlBiekJnMXdENHcwbzlUbWRKcUx0K2ZWV0UwUUhpSk5XOExCd2x5NnQ4cGVS?=
 =?utf-8?B?Q0hxTVdmZC83TmNQS0NnY0NlcFcxb1NyMXlKVWFtcDVmRHRpMStPZ2Y1ZWwy?=
 =?utf-8?B?RWw0MEx3NlFWa2VXdmZZb0VTektwL3BIMFVkYXJUV0VxcGJPTXlaelVta09D?=
 =?utf-8?B?eExFZDdldTlMZEN3M1I3NDRScEhqTnJNb0hlNzM2K0M4UGJQV1JhaEh5aHFt?=
 =?utf-8?B?eUNxbHZ1WDQ0THYrNlNFUXlFSXJRUDdtNEdBdHVBZU1Ba2NXaEo1dTNleXps?=
 =?utf-8?B?TVZaamx0S1VnQngyVFFkdUhLdVdBeGhkKytQV1NWWHB5VVpHVysrOEhXSms3?=
 =?utf-8?B?ZEtxbjdWOFRydG0wc1VmK2pCbU94RHBveFRmaG1CZXlQUlU4RERDQlp3LzVU?=
 =?utf-8?B?b0NKYlhuaXU5Z0FWdjhSSXRCVjFsWnRXOWY3TkNidmYxdThObkdMRzZMT3ZE?=
 =?utf-8?B?My9GZ2JtZVBwUXlGTkVIcEJwdFduazhTdnowWnRqSDZXT3VRZ1M2eVZCQ3RS?=
 =?utf-8?B?OERhbVBMSHB0UUpkb2J6WFF6K21UZjRoSHlzbjhULzRnNmVGSWdYWGVLZENw?=
 =?utf-8?B?TUMzWVF4dHBQdldlWkwxUkJ5Y0JQKzJzZ3hUaE9aMitqbTlycnZYeDk5UlA5?=
 =?utf-8?B?Z05vMEFjQWQ4WE00eEY4a2JSbERUclNYcTZMN2luaGRvVzZnZmdKUlk3dktU?=
 =?utf-8?B?MVNOc1V3QlFIL0lkUFdrNGtvRFVISk9pN0NGS1paZzVUMEREdllLU3ViMm9o?=
 =?utf-8?B?VkJXWHpqQTZld3lQT1oxUmJXZUp5dnVTYjhCd0U1VnN4YmM5MDdNUXNxSEJY?=
 =?utf-8?B?U21ITkNtN3pNSndRWW9XQmVUNGhXSHZPVnFiNEFxdVdBSHBHNE50bzg4eita?=
 =?utf-8?B?bWxPSkJTNUJxWW9GTlkreEtNZjBvbEdKdGoxZUYzZEpxZXE0TWU0YU0rYXZx?=
 =?utf-8?B?UEoxWWJNTHVKSFl5K2p6b1dObkxlRklvaHFjVkIrdjd2dGtZeTZvSEdvV0VK?=
 =?utf-8?B?K3JxMHBiVUhRaUs4UDlQdUx6MDJzTHJWaWRQbkxldHJNTndjeUluTFNYZ3Z1?=
 =?utf-8?B?dDN3dTRPdnBKQldTditsUXFNZXpPWFJueDVmcE01dzk5YUpvOW5uVWQrT3Rz?=
 =?utf-8?B?ai81USt1WUhEeG1oTkpHM2ZZY3RScWx4MGpmaDVodHIwWVF3L2ZhTHZaT2ZW?=
 =?utf-8?B?QU1QWDBNc2lTU09nbXkzQmJCV25BYjU2YjdYZldQY2tHKzRlQzQ3TSs3N3Yw?=
 =?utf-8?B?TFhrQ0k3bUhyWVNDVk9pTHA1bEdKL2JsdEVKRXlyMVdYeEFGekV3WnZ5ZlR3?=
 =?utf-8?B?ZVloZjBVemFhZC91c3BJVUhBMHFRUFR6NDdXQlU0S0s5dmV4Tm9pWTVpMlBH?=
 =?utf-8?B?ZVlLUGd5ZU9DS3NtZC83elJLT1YvdDRlREZXSXpCeVZacklSSmQxN2JRWWcw?=
 =?utf-8?B?S2NaSWRPaE1KYm9YWTNuU3ZzV0N6UVdXQUtXYjcyZDcxWUhNbVRMOUtkWUhj?=
 =?utf-8?B?UkZoUU01QmZCZkwvR2VzRDJDZWp4WGV4dlFLYmtzOXJVZjNlYUNHQzVZNmZx?=
 =?utf-8?B?Q3lFU3l4WGRHZ3kxc0dDMnhkaWFlNEFMZDRGdU5xYXF0TFE1N2hVK3FvaU5y?=
 =?utf-8?B?bkdVSWVyalFxdDc0YTNja3U5Qzl6MjdyMWFHS2VmYjcyOXBOS1RXcU5uQ2kv?=
 =?utf-8?B?ZjJNWUN0cHFWWEkyVmlDUjdaT0RHOVhWRnMxeVFOWmQvcjBlL1g2ZDVHbnNy?=
 =?utf-8?B?R294ekM4N1lsa3JONTBDZFJtWjBDNDJEeUh6azM0cUw5d09KTXRCOGNqbGQ5?=
 =?utf-8?B?V2JTNFRPalM4V1ltbFZpZkh6SFpsSm5leVgzWW56RlorSDZWUzdQYlhycHhp?=
 =?utf-8?B?V25uWnpnT2Nvd2VXUkRzTzlhQUcwWnF1NGhIWDBFQklLckJoVy9wejdMZmc3?=
 =?utf-8?B?cEVicVhSSnBsWlN3WnhUV3FSd3dWTjVmRU96TFFQNzZpMzlKY0h2SmUvd0pX?=
 =?utf-8?B?N3NRVThleHY1VlMvM1ZNdkRNaWliUi9HTFNYTVByNVRDWE8rTFNvNFBNVytp?=
 =?utf-8?B?T2VSKytFaVFDckVHVWRqVVd2aFdqU1FsT3ViNlBvOStqSEhuNk1WclViMkds?=
 =?utf-8?B?OUN0RzV3cWwzSzFtT0FEeG9oSEUwSXE1MXlyMnliYzdxcU8zeHA4a1FFUWI5?=
 =?utf-8?Q?KHeKvoTS3w0xMDaJagCJSKoE9bjWXevMbmpxWm/jYBtGi?=
X-MS-Exchange-AntiSpam-MessageData-1: ONKtSUyEXkvaxA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871c4cc7-5cf0-482e-b0ff-08dedb283ca8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 06:31:39.7510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJEeViZYtAZcqzrzj+vjQrL5tSlG2BHLsJmBmy+zN6r1hKZhnZnWoDkhvhNS95lWaAc8w8U0IZdp2nW9+bp7Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220

On Fri Jul 3, 2026 at 4:27 AM JST, Timur Tabi wrote:
<...>
>  /// Structure used by the boot-loader to load the rest of the code.
>  ///
>  /// This has to be filled by the GPU driver and copied into DMEM at offs=
et
> @@ -146,38 +121,23 @@ pub(crate) fn new(
>          dev: &Device<device::Bound>,
>          chipset: Chipset,
>      ) -> Result<Self> {
> -        let fw =3D request_firmware(dev, chipset, "gen_bootloader", FIRM=
WARE_VERSION)?;
> -        let hdr =3D fw
> -            .data()
> -            .get(0..size_of::<BinHdr>())
> -            .and_then(BinHdr::from_bytes_copy)
> -            .ok_or(EINVAL)?;
> -
> -        let desc =3D {
> -            let desc_offset =3D usize::from_safe_cast(hdr.header_offset)=
;
> -
> -            fw.data()
> -                .get(desc_offset..)
> -                .and_then(BootloaderDesc::from_bytes_copy_prefix)
> -                .ok_or(EINVAL)?
> -                .0
> -        };
> +        let fw =3D request_tlv(dev, chipset, "gen_bootloader")?;
> +        let tlv =3D Tlv::new(fw.data())?;
> +        dev_info!(
> +            dev,
> +            "loaded generic bootloader firmware v{}\n",
> +            tlv.get_string(b"VERS")?
> +        );

s/dev_info/dev_dbg.

Also, since `dev_dbg` can be compiled out, the check performed on the
`VERS` tag existing is not guaranteed to be performed. We should
probably extract it out of the `dev_dbg` statement. This is true across
the series; which makes me think it might also benefit from a helper to
factor out the request_t.v/Tlv::new/dev_dbg common sequence.
