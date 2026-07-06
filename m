Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CBE3E4C6D;
	Mon,  6 Jul 2026 06:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319519; cv=fail; b=cf1VwvbMfrde59Z+wKrzYRJ7xQ3PImXrmnHBIEgjcCtPaiz4AYz/c4gDHWdUfq5/dSjbZh9/uHfahH2Z134XXY+83Jqei7mHvgbq/adb0A0OjN2zqqQE6qVKi8Z13u9yBkGJageSgO6t8krZkqUKdujxGST3NrW+/iTgY4b8TDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319519; c=relaxed/simple;
	bh=fnH1rTuQasqMUOms/j+Wuo+pSYdo4SIv/Cy01GiyQ4I=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=uMiT9TT2mWXGJQTCWZc67oMOKh6/hm123GIsqcE5A96O8/d2v9xkl9JCESHl4NU+QXjAhvfEcCO16lyYo7x9TG4rR/9xggSQNWQEYnfp8630c1pgBMBL0ie4UOlAbKT7JfO5i2HHWqikMCYNiLgpdZUnJTlMpe2yEBavYBzmbDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=foaGEVFG; arc=fail smtp.client-ip=52.101.85.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="foaGEVFG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQZ3w3qVVY0NOU7BOVQLctwkzkCVBQO+irxUqrEjZpzwF7K1q28RZvAyt60L8oqItEoxrRaHU6qqSv3cmcWT57HJ3VQ8aHeXnymFyJ1aWDgQ9P8Rt3Qz7ocalwTkNUDR8HQWT0f8K6XEVzTD/Cx9bDtk7QD6fwejd1ycphWBvrK+/tJ1orOl6PP25NLNa1j/JCIVRdXZ18/61HtM8z8AP26Mv/ilTUdllHEmNe37Pyonwm9Tn99xN2hhEg/Cvn3fSEirG8aAWfKgyTGRAKOGgJS/3dmqV1Bv5Ju+1rbr24g5cOgzdncpxNVui0L2YC7+v53OHti8VYTBwJ8lxrjWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/rgidCVNfH9z7jC+szi5fMwrBdx0jQEOAO+E9FkuME=;
 b=KbhpitwD6BhvNGSeGuVscEMTMrdVha2Aa9EcoLD4ZeWXgLNBE2oxTo1qm/iA6m/4TxEwyt3kpUia3LpBNibzSMrI+IWrpGQVhiSu8yEBQBLSk1qgAUOoQZNo5WlEqIBFo+pyYiwnwYCMlkGITsxaPa4PqwTQWRoZVRTGS/nhO6cvYdxPS1f1dOPfHQs8+YQ2KUak+KLIQ0xIM7mEVEqYnXAbdQu3HzLbANLZZm3ZHAXBOtDRH05meAM9HhYouvM4EOGErMKH01LMDBtmWQlw2EC/H43V8AMfX6+M52yjBvUWql/3EOyFkrPZRJzQgKjNP0ih7+NLJyBXHEeWxb42rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/rgidCVNfH9z7jC+szi5fMwrBdx0jQEOAO+E9FkuME=;
 b=foaGEVFGvk47QeD5dAAC5j0BRFT2mKD98Kn0meZnK5J7LngRj5Fl4hw8UNFHtrS/ZgpwTfJaLxhRs1wk0yFrQ44RkQ+IkStX11whnngQW57AjDhikRJwsEHlFymw6jOl1aL095d6dargy203xTh/r+4Z1CJknTKnERriApTOzNXMizSUogqOjDsmM6hv6gg4T1+NNHcrt65Z5ph1AIukW+4lPTAOM0/j3hEDu4SY25ACHQkfkMQYTY8raJtJLRNfCd1Es0pJ6/jJ3A04Uau8K9HEHUqgNNaBbfnjFibIzUKOAypvmaxsQlW0/+8WIBnY4TbMzt2yZ099zNLD2f463A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 06:31:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 06:31:26 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 15:31:22 +0900
Message-Id: <DJR9ZWAN4OCT.3GRDS8LGOZ16Y@nvidia.com>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware
 files
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-3-ttabi@nvidia.com>
In-Reply-To: <20260702192712.3450652-3-ttabi@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: e719864c-cd3b-4354-1026-08dedb28347a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	q8xFT1Lw1hTb+oiLEoxoxBEEZSJczdSpq7pZ5zILMnjraivjWRj49cjV5rpIkZs8cMoNKoGopJbidY8YojE+YW7fDwxjx0MQx83Qtwinnru2eY4lvs+dtfVju4P2vQ61ynb36d34TDsVjbZ4azpFKliosG7DIEJEY0Or5NWSWutZoiV++Dtl5eH/JfFeGllJMDdsiDCq69oyDkFwgQzirYq/8+Wx7JCPYZNHzSvapuMVKOp0R42elWLCHlm8VZckjHZanjMcVBIK2Bf0bbRX+AAzoTpisXp/daOdqP2gJekc7zXIvHm0qTnAYw8M3wGb0xxVQSOKQ7S0nvvILLiU1fezNqODfS/mvNPaJGVvnmb3JxEoh/qy0BtQae3O2pAr+XkX5qLld5a3quTQVY5jbm4iBvKjl+9cd7xl5uwzG7DGZjHLNDviI09Var7dy0hAmruQFM/5GS/3oXtpkxcUjYXkB+GSiNYxCw6AK8jOQ5bhNvDl+Y6X656fRK87yCuGsVkzREP5dk97RtiYkjU2Apt3NhTmy6jS7CjPpCP62aYjJ4Rm0lpgMS53lKyyF9XkVv3Un8Qf8KqOjJJwODtnG0F0aE6aGSu3Gzf1ZwKLwUn1A+biNcdNZswZfQD/Ne2O5SGWCG+Hp3w+1DKZcmFVLy0mid5j1d+zJaDm6k+wJQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3BUaFE5NmJLaEFTdXoycnRWK3NsWDJndWx4N1prYTRLUUl2ZnJmbS85V2hL?=
 =?utf-8?B?Y3hZcFM4TkV5eU4rQ3dmUjJnbmZCU1FFWFh5dVNpM0c3MUEwVGZnbUZJcmRG?=
 =?utf-8?B?Z044Q3htOFNaZGRDYjBLRThzS2w4NjAxNHlyYU42U3FFZThVVE9EQ0V0OWRT?=
 =?utf-8?B?cm1oaU5SVm1ubWNEcU45cS9tTTdkempTSjJud281d1NHN1RWNVlvSXFmNEJX?=
 =?utf-8?B?ZzQ4eXZsc0tSek5jQU1mems2ajdmcmJxNXhRWmZHczBzeGwvTVVLM1FLVE9m?=
 =?utf-8?B?dk1OdWFncFQzVDVlaXB1RGVZVlltSEIxL0hYS1FZQjc4c2dRK1ZrYTVnRDQ2?=
 =?utf-8?B?QWU2VmJZNlRSWm5pQldhYUFTVFZHbFJkZ0w4d3daZGcxTSsrTFdSTUFUajI3?=
 =?utf-8?B?WnpZbVY2aXZkK2NKSE82NS9LS2R0a0hVVUVnS0h4cGRTZVFyWmR0dFFiWVl3?=
 =?utf-8?B?dGluNng0VjdweVhreUgxai8wazhkNnhGUEN6UHhhR0NYSitiamZ0WXlEWVV1?=
 =?utf-8?B?TEwzMGFrQUoraElkT1hqTkN6ZnBTMGNzandqeW04TTY5T0hsV1JtRnVhaG1r?=
 =?utf-8?B?cHlsbDhOVUk3RU5EZ0Ura3dlWStoSFdVcGNldVp2ZmpXWC9vaXpseHYvZ2Zh?=
 =?utf-8?B?SHlIZG9pb3VPc3ZTQnhxQ0p4VmhPanRKZFI5cTZVdDhtWGNiYnp1TGFtdFla?=
 =?utf-8?B?aGx2ZmpzalRoWnRYeTlocytPanVLSFljcU00NWthYTREdnRyaWNTTTRRM3Az?=
 =?utf-8?B?a1h1em9OZ2F5cFNBOW9Jc0hiQlBnVEp0eC8vekROWVRSb1NWaVhJeGV6dnBx?=
 =?utf-8?B?K3dueEw2aUtnbXRRVm1LdzNsVmJCQlBQSy9xV3BqRWs4ZlhNSFBHbFlabkFa?=
 =?utf-8?B?TjB0V1JWanNPVUZRRHVXQmlGQUJzN0ZIVDlzK0FBaWZ1dExKYjJwNnFKMCtn?=
 =?utf-8?B?OG5DM0ZTKy9ndVFPbExRbFdBWXY5SVllanI1QUl3YkRKd0tEM2ZUUkNNZ1Zn?=
 =?utf-8?B?SFBBdUVQbnZDL1NmMm1WejhEajRNLzUyd2JjTlhXQ250dzFzd1dDV3FEVGtw?=
 =?utf-8?B?d1ovQmIzdUJvanFPN1U4WHhpSCtRZzVTQjdjWVI1SGFYTWVhWkF6T3J6MEtS?=
 =?utf-8?B?U3JYVmFhMWl3MnhaSzhMK1Z3TWc2blVzNzdHUDZjYStzcmZzYU9lVlYyZHBi?=
 =?utf-8?B?d2FjSEZiakRaSFN0NmN4ZmZETFN3dTdhUWVDR2RWeFd1S25VT2gyWm9wYXlX?=
 =?utf-8?B?Rmw1QXViN0lGZGtpSHpuanVJeGdSM1hNWXBHbEFMV3p5Z3cyQ3plb2UxNm9P?=
 =?utf-8?B?TWxnWjc4aDcvVHhxbUNGTEMyazBDSFpPVUZJekZWR2lhdHJGME9lZEpzYlRu?=
 =?utf-8?B?RkNQalRNNDIzRnZZalhQYmh2cFdWd05CZTJnbXBWdlJ2RWVRMEhRZGpRMTQv?=
 =?utf-8?B?Tzg0b3dRS0lCdnhXaUNLeGVwQXY5MXRqZW5FUUxFUlNJbWNkekMrUlo4cUd2?=
 =?utf-8?B?SE16RWZQcGlJaGFjWXhiRVV3Z29nTG1ER2dBZ1lYSHM2ejlMbXMwSThoMHAx?=
 =?utf-8?B?R29xWmpKdDFyYWQ0Wjlpc2t2QmJIWXd3aXR6VkdQdVdkbHFWYm9IZUhwOXM5?=
 =?utf-8?B?SVZINHphc3JSM01QdkZHZFUzMWVBWDFJeTVSR2Evc1JPakhsL0w2L3MxY1ZR?=
 =?utf-8?B?Z2RVc0xQZWdwdmoxSVE2R0haVU1OOTE2djdUU3F5RkdZWXBRajJsaHRocDhR?=
 =?utf-8?B?dmczRkd0dC9kWlJidUdiSUdYQTFaM2FIOForNEp0eUJGSlBSaW1vdG1uQUhJ?=
 =?utf-8?B?NUhzN2g0KytjVWpyM2xxa2EyRmk5dGVlT0hEZjhSZFdkVmw0M1NBa1hZZWtv?=
 =?utf-8?B?ajhJQkFMRGVzdU9SNHd3a0hLZFpqMmY0bDJra25wcGtVckFLaUU3VHJDYkpt?=
 =?utf-8?B?UkVoYnhYcWRzcHBuaWZmb3RjQkRuUWFhTHlJZ1IvaWpOcGdlN1A1QkdYQUoz?=
 =?utf-8?B?b2pLK3pmMmpzTWhYZFc4aVBoeDJhMlE5RFFjcWFxbzVCLzYrcjByLzd0L09w?=
 =?utf-8?B?WlhjZWVGY1J4SnFoTVllcFRoNStXWXlMK3k4UXVrY3VKNmZLV2xoYUtENUk3?=
 =?utf-8?B?YmVFZElGZlJQdXFROXVUMXVVcTNjZHdDU3g5OEZTcWwvYXVWYUhYc2RMak5k?=
 =?utf-8?B?WEFvQmpBeHEvMVpYSk5WMnRORWs1L3dBSWtlRHl2ajJCNnYwTWg2bG9OZXRO?=
 =?utf-8?B?RVVKQUVKUGkrQStTYzlDU2VRUWdRS1JnWWdyc0dyT0dUTy84a2c2d2QyelBv?=
 =?utf-8?B?WUxTckVudVRZQjBvZjVPbVB2ZGtjaHR5MkFqalpIQXZDSW9lVHlJVGd1eEpP?=
 =?utf-8?Q?RPRMe4VlLVHLV580h0ZFZIXj7J3TMXJHsKa9ExEocVCsd?=
X-MS-Exchange-AntiSpam-MessageData-1: CwoHBveWA2DZJg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e719864c-cd3b-4354-1026-08dedb28347a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 06:31:26.0111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMUEtE5TQyxe4CVWsko+NUqOFZXI3ZOKOUWk3i3VGZrdkim314FfXM8RfkkwH2a+hCvCu7QNDXhJPcAhFBcgwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220

On Fri Jul 3, 2026 at 4:27 AM JST, Timur Tabi wrote:
> TLV (type, length, value) files are the new image format used by Nova
> to encapsulate firmware images and their metadata.  Unlike the firmware
> files for previous versions of the firmware, TLV filenames are not
> versioned, and they have a .tlv suffix.
>
> Add function request_tlv() to load TLV firmware images.
>
> Add the Tlv struct and supporting types for parsing TLV (type, length,
> value) firmware images. TLV files begin with a 4-byte magic header,
> which must be "NVFW" for Nvidia firmware files.  This is followed by a
> sequence of blocks each containing a 4-byte ASCII tag, a 4-byte
> little-endian length, and a payload padded to a 4-byte boundary.
>
> Tlv::new() validates the entire image up front, so that the iterator can
> subsequently yield blocks without fallible parsing.
>
> Also add accessor methods for the various encoded types that will be used
> by the driver.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  Documentation/gpu/nova/core/tlv.rst   | 182 +++++++++++++++++++++
>  drivers/gpu/nova-core/firmware.rs     |   1 +
>  drivers/gpu/nova-core/firmware/tlv.rs | 225 ++++++++++++++++++++++++++
>  3 files changed, 408 insertions(+)
>  create mode 100644 Documentation/gpu/nova/core/tlv.rst
>  create mode 100644 drivers/gpu/nova-core/firmware/tlv.rs
>
> diff --git a/Documentation/gpu/nova/core/tlv.rst b/Documentation/gpu/nova=
/core/tlv.rst
> new file mode 100644
> index 000000000000..e4eb6ab6d02f
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/tlv.rst
> @@ -0,0 +1,182 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +TLV Tags in Nova Firmware Images
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Nova firmware images use a Type-Length-Value (TLV) format to encapsulate
> +firmware components and metadata. The TLV file begins with a 4-byte "mag=
ic"
> +header that contains the string "NVFW".  Following the header is a seque=
nce of
> +TLV blocks.
> +
> +Each block consists of a 4-byte tag of ASCII characters, a 4-byte length
> +encoded as a little-endian unsigned integer, and a sequence of bytes, th=
e size
> +of which is equal to the length rounded up to the next multiple of 4.
> +
> +The driver code that reads the TLV and uses its contents is called the p=
arser.
> +It is the responsibility of the parser to handle missing or malformed ta=
gs,
> +lengths, and values in the TLV.

I guess that last paragraph is kind of expected - spelling it out loud
without being specific as to how to handle missing or malformed tags is
just confusing. I think it can just be dropped?

> +
> +::
> +
> +    +------+------+------+------+
> +    |  'N' |  'V' |  'F' |  'W' |  Magic header
> +    +------+------+------+------+
> +    |  Tag (4 bytes, ASCII)     |  TLV block 0
> +    +---------------------------+
> +    |  Length (4 bytes, LE)     |
> +    +---------------------------+
> +    |                           |
> +    |  Value (length bytes,     |
> +    |  padded to 4-byte align)  |
> +    |                           |
> +    +---------------------------+
> +    |  Tag (4 bytes, ASCII)     |  TLV block 1
> +    +---------------------------+
> +    |  Length (4 bytes, LE)     |
> +    +---------------------------+
> +    |                           |
> +    |  Value (length bytes,     |
> +    |  padded to 4-byte align)  |
> +    |                           |
> +    +---------------------------+
> +    |         ...               |  More TLV blocks
> +    +---------------------------+
> +
> +Tags and Length
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +TLV tags are always four-character words, with all letters being upper c=
ase.
> +Duplicate tags are not allowed.
> +
> +Lengths of zero are allowed and indicate that the tag is a boolean.  Tha=
t is,
> +presence of the tag indicates ``True`` and absence indicates ``False``.
> +
> +Values
> +=3D=3D=3D=3D=3D=3D
> +Values are one of three types.  The type is not encoded in the format; r=
ather,
> +the parser expects a given tag to have a value of a given type.
> +
> +1) Integers, encoded in 32-bit or 64-bit little-endian format.
> +2) Strings, encoded as-is and expected to be ASCII only, without a null =
terminator.

"expected" leaves a window of interpretation - let's say "required" or
just "encoded in ASCII without a null terminator".

> +3) An array of bytes, for binary data.
> +
> +Common Tags
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +These tags are shared across firmware types and carry the same meaning
> +wherever they appear.  Unlike the firmware-specific tags below, a common=
 tag
> +is reserved: its meaning is fixed and may never be redefined for a parti=
cular
> +firmware type.
> +
> +``VERS`` (string)
> +    Human-readable firmware version string, indicates the version of
> +    the firmware.  Present in all TLV files.
> +
> +A TLV image must contain either a single ``BLOB`` tag (firmware embedded
> +inline) or a ``SIZE``/``FILE`` pair (firmware stored in a separate file)=
.
> +
> +``BLOB`` (bytes)
> +    If the firmware microcode binary is stored in the TLV, this tag cont=
ains
> +    the actual firmware image bytes.
> +
> +``FILE`` (string)
> +    If the firmware binary is stored as a separate file, this tag contai=
ns the
> +    name of that file, which is required to be in the same directory as =
the TLV,
> +    so no paths are allowed in the filename.  This tag is always paired =
with
> +    ``SIZE``, so as to allow the driver to pre-allocate the buffer befor=
e
> +    loading the file.
> +
> +``SIZE`` (u32)
> +    Total size in bytes of the firmware image to be loaded from the comp=
anion
> +    file named by ``FILE``.  This tag is mandatory if ``FILE`` exists, s=
o the
> +    size of the firmware image must be known when the TLV is created.  I=
f the
> +    firmware image is updated and its size changes, then the TLV must be
> +    updated with it.
> +
> +GSP Firmware Tags
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +``SIGN`` (bytes)
> +    Cryptographic signature for the GSP firmware.
> +
> +Booter Firmware Tags
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +``DAOF`` (u32) - ``os_data_offset``
> +    OS data section offset within the firmware image (absolute byte offs=
et).
> +    Maps to the DMEM load source.
> +
> +``DASZ`` (u32) - ``os_data_size``
> +    OS data section size in bytes.
> +
> +``CDOF`` (u32) - ``os_code_offset``
> +    OS code section offset within the firmware image (absolute byte offs=
et).
> +    Maps to the non-secure IMEM load source.
> +
> +``CDSZ`` (u32) - ``os_code_size``
> +    OS code section size in bytes.
> +
> +``PLOC`` (u32) - ``patch_loc``
> +    Signature patch location -- byte offset within the firmware image wh=
ere the
> +    selected signature should be written.
> +
> +``FUSE`` (u32) - ``fuse_version``
> +    Fuse version of the firmware, used with the hardware fuse register t=
o
> +    select the correct signature index.
> +
> +``ENID`` (u32) - ``engine_id``
> +    Engine ID mask identifying the falcon engine this firmware targets.
> +
> +``UCID`` (u32) - ``ucode_id``
> +    Microcode ID used together with the engine ID to query hardware sign=
ature
> +    fuse registers.
> +
> +``A0CO`` (u32) - ``app0_code_offset``
> +    App0 code offset -- start of the secure code region within the firmw=
are
> +    image. Used as the IMEM secure section source.
> +
> +``A0CS`` (u32) - ``app0_code_size``
> +    App0 code size in bytes.
> +
> +``NSIG`` (u32) - ``num_sigs``
> +    Number of signatures included in the ``SIGN`` tag.  A value of 0 ind=
icates
> +    unsigned firmware and that there is no ``SIGN`` tag.

Shall we say "A value of 0 or absence of this tag" for coverage? ... Or
not, see my review of patch 3.

> +
> +``SIGN`` (bytes)
> +    Concatenated array of firmware signatures. The size of each signatur=
e is
> +    the total length of the ``SIGN`` value divided by ``NSIG``. The corr=
ect
> +    signature is selected using the fuse-version-derived index.
> +
> +Generic Bootloader Tags
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +``CDSZ`` (u32) - ``code_size``
> +    Size in bytes of the bootloader code to copy from the ``BLOB`` tag a=
nd
> +    PIO-load into falcon IMEM.
> +
> +``STRT`` (u32) - ``start_tag``
> +    Start tag identifying the IMEM block where execution begins.  The fa=
lcon
> +    boot address is derived as ``start_tag << 8``.
> +
> +GSP Bootloader Tags
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +``CDOF`` (u32) - ``code_offset``
> +    Offset within the firmware image at which the code section starts.
> +
> +``DAOF`` (u32) - ``data_offset``
> +    Offset within the firmware image at which the data section starts.
> +
> +``MFOF`` (u32) - ``manifest_offset``
> +    Offset within the firmware image at which the manifest starts.
> +
> +``APPV`` (u32) - ``app_version``
> +    Application version of the firmware.
> +
> +FMC Firmware Tags
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +``HASH`` (bytes)
> +    SHA-384 hash of the FMC firmware, exactly 48 bytes long.
> +
> +``PKEY`` (bytes)
> +    Public key used to verify the FMC firmware. At most 384 bytes (RSA-3=
072),
> +    but may be shorter.
> +
> +``SIGN`` (bytes)
> +    Signature of the FMC firmware. At most 384 bytes (RSA-3072), but may
> +    be shorter.
> \ No newline at end of file
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index a94820a3b335..c0cd06579643 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -32,6 +32,7 @@
>  pub(crate) mod fwsec;
>  pub(crate) mod gsp;
>  pub(crate) mod riscv;
> +pub(crate) mod tlv;
> =20
>  pub(crate) const FIRMWARE_VERSION: &str =3D "570.144";
> =20
> diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-cor=
e/firmware/tlv.rs
> new file mode 100644
> index 000000000000..56e0d5cab580
> --- /dev/null
> +++ b/drivers/gpu/nova-core/firmware/tlv.rs
> @@ -0,0 +1,225 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +use kernel::{
> +    device,
> +    firmware,
> +    prelude::*,
> +    str::CString, //
> +};
> +
> +use crate::gpu;
> +
> +/// Requests the GPU firmware TLV `name` suitable for `chipset`.
> +#[expect(dead_code)]
> +pub(crate) fn request_tlv(
> +    dev: &device::Device,
> +    chipset: gpu::Chipset,
> +    name: &str,
> +) -> Result<firmware::Firmware> {
> +    let chip_name =3D chipset.name();
> +
> +    dev_dbg!(
> +        dev,
> +        "loading firmware image {}/gsp/{}.tlv\n",
> +        chip_name,
> +        name
> +    );
> +
> +    CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}.tlv"))
> +        .and_then(|path| firmware::Firmware::request(&path, dev))
> +}
> +
> +struct TlvBlock<'a> {
> +    tag: &'a [u8; 4],
> +    value: &'a [u8],
> +}
> +
> +/// On-wire TLV block header: 4-byte ASCII tag + little-endian payload l=
ength (bytes, excluding
> +/// padding to a 4-byte boundary).
> +struct TlvBlockHeader<'a> {
> +    tag: &'a [u8; 4],

This struct doesn't need a lifetime - it can store `tag` as `[u8; 4]`.
Same for the `tag` member of `TlvBlock`. Everything above them (`find`,
`get_bytes`, etc) can still take a reference to the array for
convenience as we use the `b"ABCD"` syntax, but for these two the
reference is just inefficient without reason.

> +    length: usize,
> +}
> +
> +impl<'a> TlvBlockHeader<'a> {
> +    const SIZE: usize =3D size_of::<[u8; 4]>() + size_of::<u32>();
> +
> +    /// Parses the first [`Self::SIZE`] bytes of `hdr` (caller may pass =
a longer slice).
> +    fn parse(hdr: &'a [u8]) -> Option<Self> {
> +        let hdr =3D hdr.get(..Self::SIZE)?;
> +        let tag =3D <&[u8; 4]>::try_from(hdr.get(..4)?).ok()?;
> +        if !tag.is_ascii() {
> +            return None;
> +        }
> +        let len_arr =3D <[u8; 4]>::try_from(hdr.get(4..Self::SIZE)?).ok(=
)?;
> +        let length =3D u32::from_le_bytes(len_arr) as usize;

Let's avoid using the potentially lossy `as` keyword:

    let length =3D num::u32_as_usize(u32::from_le_bytes(len_arr));

(after importing `crate::num`).

> +        Some(Self { tag, length })
> +    }
> +}
> +
> +/// Iterator over the [`TlvBlock`]s of a [`Tlv`].
> +///
> +/// # Invariants
> +///
> +/// `pos` is a byte offset into `tlv.data` that always lies on a block b=
oundary (in the sense
> +/// of the [`Tlv`] invariant): it is either the start of a well-formed b=
lock, or equal to
> +/// `tlv.data.len()` (end of iteration).
> +struct TlvIter<'tlv, 'a> {
> +    tlv: &'tlv Tlv<'a>,
> +    pos: usize,
> +}
> +
> +impl<'tlv, 'a> Iterator for TlvIter<'tlv, 'a> {
> +    type Item =3D TlvBlock<'a>;
> +
> +    /// Returns the block starting at `self.pos` and advances the cursor=
 past it, or [`None`]
> +    /// once the cursor reaches the end of the data or encounters an err=
or.
> +    ///
> +    /// Note that errors cannot actually occur because the data is valid=
ated in the constructor.
> +    fn next(&mut self) -> Option<Self::Item> {
> +        if self.pos >=3D self.tlv.data.len() {
> +            return None;
> +        }
> +
> +        let tail =3D self.tlv.data.get(self.pos..)?;
> +
> +        let hdr =3D tail.get(..TlvBlockHeader::SIZE)?;
> +        let header =3D TlvBlockHeader::parse(hdr)?;
> +
> +        let stored_size =3D header.length.checked_next_multiple_of(4)?;
> +        let advance =3D TlvBlockHeader::SIZE.checked_add(stored_size)?;
> +        let payload_end =3D TlvBlockHeader::SIZE.checked_add(header.leng=
th)?;
> +
> +        let value =3D tail
> +            .get(..advance)?
> +            .get(TlvBlockHeader::SIZE..payload_end)?;
> +
> +        // INVARIANT: by the `Tlv` invariant the block at `self.pos` occ=
upies exactly `advance`
> +        // bytes, so `self.pos + advance` is the next block boundary (or=
 `data.len()`).
> +        self.pos +=3D advance;

Maybe use `checked_add` here as well for consistency.

> +
> +        Some(TlvBlock {
> +            tag: header.tag,
> +            value,
> +        })
> +    }
> +}
> +
> +/// The payload of a validated TLV (type, length, value) firmware image.

I think we can just say "A validated TLV", as payload makes it sound
like this is the payload of a given key within the TLV firmware.

> +///
> +/// TLV firmware images start with a 4-byte "NVFW" magic header, followe=
d by a sequence of
> +/// blocks. Each block has a 4-byte type tag, a 4-byte length field, and=
 a data payload
> +/// whose stored size is the length rounded up to the nearest multiple o=
f 4.
> +///
> +/// [`Self::new`] checks the magic header and walks every block: tags mu=
st be ASCII,
> +/// lengths and padding must fit without overflow, and the byte stream a=
fter `NVFW` must
> +/// be exactly partitionable into blocks (no trailing partial header or =
slack). After
> +/// that, [`TlvIter`] only signals end-of-stream via [`None`], not parse=
 failure.
> +///
> +/// # Invariants
> +///
> +/// `data` is a validated TLV payload (the bytes *after* the `NVFW` magi=
c): it is the exact
> +/// concatenation of zero or more well-formed blocks, with no trailing p=
artial header or slack.
> +/// Consequently, any offset `o` into `data` that is a block boundary an=
d satisfies
> +/// `o < data.len()` is the start of a complete block whose header parse=
s and whose stored
> +/// extent (`TlvBlockHeader::SIZE + header.length.next_multiple_of(4)` b=
ytes) lies within
> +/// `data`. `data.len()` is itself a boundary.
> +pub(crate) struct Tlv<'a> {
> +    data: &'a [u8],
> +}
> +
> +#[expect(dead_code)]
> +impl<'a> Tlv<'a> {
> +    const MAGIC: &'static [u8; 4] =3D b"NVFW";
> +
> +    /// Parses `data` as a TLV firmware image, returning [`EINVAL`] if t=
he image is malformed.
> +    pub(crate) fn new(data: &'a [u8]) -> Result<Self> {
> +        // Verify that the magic bytes exist and are the correct value
> +        let magic_len =3D Self::MAGIC.len();
> +        if data
> +            .get(..magic_len)
> +            .is_none_or(|magic| magic !=3D Self::MAGIC)
> +        {
> +            return Err(EINVAL);
> +        }
> +
> +        // The payload is the contiguous sequence of TLV blocks after th=
e magic.
> +        let payload =3D data.get(magic_len..).ok_or(EINVAL)?;
> +
> +        if payload.is_empty() {
> +            // Reject empty TLV files
> +            return Err(EINVAL);
> +        }
> +
> +        let mut rest =3D payload;
> +        while !rest.is_empty() {
> +            // Validate and extract the header (type, length).
> +            let Some(header) =3D rest
> +                .get(..TlvBlockHeader::SIZE)
> +                .and_then(TlvBlockHeader::parse)
> +            else {
> +                return Err(EINVAL);
> +            };
> +            // The `length` field of a TLV block contains the actual byt=
e length of the
> +            // value, but each TLV block is aligned to a 4-byte boundary=
.
> +            let Some(stored_size) =3D header.length.checked_next_multipl=
e_of(4) else {
> +                return Err(EINVAL);
> +            };
> +
> +            let length =3D TlvBlockHeader::SIZE
> +                .checked_add(stored_size)
> +                .ok_or(EINVAL)?;
> +
> +            if length > rest.len() {
> +                return Err(EINVAL);
> +            }
> +
> +            // Advance to the next block. `length <=3D rest.len()` was j=
ust checked, so this
> +            // slice is always in bounds and lands on the next block bou=
ndary (or empties
> +            // `rest` after the final block).
> +            rest =3D &rest[length..];

The check on length and slice split can be factored out into this
one-liner:

    rest =3D rest.split_at_checked(length).ok_or(EINVAL)?.1;

It is preferable not only because it is shorter; the guarantee of
correctness is carried by the split operation itself, and as a result
you also don't need a comment justifying that you just performed the
check.

> +        }
> +
> +        Ok(Self { data: payload })

As mentioned by Sashiko, this needs an `INVARIANT:` comment.

> +    }
> +
> +    fn iter(&self) -> TlvIter<'_, 'a> {
> +        // INVARIANT: 0 is a block boundary, either the start of the fir=
st block,
> +        // or `data.len()` when `data` is empty.
> +        TlvIter { tlv: self, pos: 0 }
> +    }
> +
> +    fn find(&self, tag: &[u8; 4]) -> Result<TlvBlock<'a>> {
> +        self.iter().find(|b| b.tag =3D=3D tag).ok_or(EINVAL)
> +    }
> +
> +    pub(crate) fn get_bytes(&self, tag: &[u8; 4]) -> Result<&'a [u8]> {

These methods are simple, but let's grant them a one-line doccomment for
consistency.

One thing I'd like to eventually add (for the record; as a follow-up is
ok) is an abstraction of the `BLOB`/`FILE` distinction: maybe a
`get_payload` method that returns either a reference to the `BLOB`
section, or creates a `VVec` to load the references firmware file. Its
return type would be an `enum` with an `AsRef<[u8]>` implementation and
a `to_owned(self) -> VVec<u8>` method so individual firmware
implementations can get the representation they need without caring
about the underlying storage type.
