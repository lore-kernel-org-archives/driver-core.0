Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AAE322B8F;
	Mon, 27 Jul 2026 11:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151875; cv=fail; b=hTTM0bQaQcKvOAvCpf5YfVjIm2RwP+1HChxyumVZw2f3ieZ3i3Jfy0Ec27KG09c4m8ZFDi44Aiejdz8zhz9nEc31lOGvsHDVaU5C7dmF7Icm9034dR7kOl58t6Fl2zjE3fLGDKQzGXQnof95NZfxb7JoouU9KJXrLz32MzLbjvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151875; c=relaxed/simple;
	bh=W9ToRok5VmCt5mKpD+zkJjPJ7rHg50hxzxgxPw79qV4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=SiQ6YnugDLAmhhNnLtZfjVJ7A7bIIeqkgoroA018alZVlBmiVeH+xrU4AiSKWBxmnnDzNK9h0CrggOrDUy4CT23+nF07eg7KrfvTnAnuxt87i08Dfg2h7x1Bob1PLSGzXvGtdgCMhxzbYGeZOaA8AzCjEDtSmdXHDdpopdtZ+TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ll+Q4Vy+; arc=fail smtp.client-ip=52.101.52.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ll+Q4Vy+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzTT0yNaqj4OrIsSV8OxVpPptnm+JXFtQ0WBnEofsjO2VY02aQ4V9T3PYMaPOCY+w1jTWMG57ncL1O8K/2iPASM9J4gq0IUu8CwT3n+p8h8WTTkwcmcGY0/e7iT+36+0kjzGi+t9l7zrzlOLBb90ajnkAaZ0WXwNIdaERTsS3ULjmJmLTTGe6s3pg63pCxfow0wbqzatsbv4JxAxCiue2wAFqq6HbPLh2oq1IklVTgcB14D0mrhwASJ5tBwEvz/ROJu3bPaE4Cr2P9EgqTF2JpRUOou2mqO+J5pPvMxeyO3/l26T6hXXe0yR0Xed7YgVLMIocmkpqaW//U5TDoW+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ua8tiRNkqXp5shSjxCEVSO6AVxBZ+Y0wUaRN1Nl53lU=;
 b=i1E2bx+gvCKTmVPvidzL493x5yiXMPYXQk0vvurXbW/1Kkbw8DFBrQXa3BePRrWmVS1pYplWH3EshIkeGYMDJAhOSqs/I1bKKFMO9jfRghGyitazeZJf4SHQfqAHhbPT/Tr+AhV43SdTM90UUALGTctPaQqVT4g7qDhBHRRtSH3ZyPFq4/DzfGL65hwJv9nugPuR9grHA955yAdXebzCFrkYe9idpAK5mnNoJT9haVSchTnY9A7TVxBY/aCNfuPCLSbumw7VR3lJQKo9TY4qkV5HSDClfGcQW6PNnx7ECnqO3FM2PkgbGyAAlRKfAd9GFg7uIM2a8Y90idtuW5yfnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ua8tiRNkqXp5shSjxCEVSO6AVxBZ+Y0wUaRN1Nl53lU=;
 b=Ll+Q4Vy+olwaG4cwnxQ5AoNdxIuCy8zSHioL3lZuzq4wEtMK6UnRKjHm2m02f2XI1OMeqnUOt0O5fHAtRElM8AF9RueQbKQRuka8K4pCF+4jU3SU0LsSyc8rf4XQbxIfYglGZXyEH8Osb9U8UBHVyxW36zFMAWUbjii/rzfUPSkMpZAucBTbAypVSRP0z0hV+Np/G5PJh+Dc3Z2aSwBpb2rfkcgA4V3wcmRM1FtLPZPJfRdAegcZEJ5+bkMq2FU9HtSoMRb+c2EHoj0CSsihpRuPxuhAms7W6L0UgWzNXRvU5S20P62AobINGTAoutIfnXI4Q6cPoH5BMjEC6fy0lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 11:31:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 11:31:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 20:31:03 +0900
Message-Id: <DK9BISU6MPAY.EK5385QYWU90@nvidia.com>
Subject: Re: [PATCH v5 3/8] gpu: nova-core: add TLV parser for firmware
 files
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
 <20260710230428.865447-4-ttabi@nvidia.com>
In-Reply-To: <20260710230428.865447-4-ttabi@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:604:221::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 41813092-33f9-4e8b-e0fd-08deebd28d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10070799003|11063799006|10067099003|56012099006|4143699003|5023799004|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ORkc+tCSRAKe+R9tIFzJc5rBF3Ez0EXsZjofgZSIHGotyFO1GkxDz8wQ58xHRmDexE9Ea8NFuZJPMHUzD2jMoQf/o8DqLXaYb9WorXT6xO4o8yFpvl1rC5FCAxJhuhe2dbgArl3woIicR/wtI5bIaY9GdpFIzltFyfT981apMMR+3NNGxEXol1+XWcsFkvMkMIK+ofcHtQCjzBwApqWV+uFo7FquGR5Nu8wWIhtO6spW4R9I7JQjtGSYlcjN/CuIkYQyHBr4oXgwfEAmIWCS1j0v98A0kBQQpELqLoXyOVrchwxpjYE8q4NhoYSrNZYJPj7Q5157YZHKzoFfIhNpd+de0mAuFSlbJE49eRovHtNgwXQMuWCupiONt7d7YeL3t3LLM5cNrMHnQZj5Y3WbsfVJsJDJW2VfkBt7SwSq6iqQYsAdRnlkEPpQay/umpsdJdhxUpjpytE6HnEkmyEILQ7CnsLf1dVwcFA/nJd6i+LcF+9yqZ0Cdrrvd/ufJo0syOkioUS33WJUgarKcwe0WEQt9LWygKOlU/Il8yrpNnSFOcm2rnX1Bxt7Vmd3QM0r3CRg7kJzsBS418yr6kUCHBCfJIHPXqcNXh0xRznhHHeqxb/g5uH46hU/n97UjBtW5lUDrha2WgOwrj71Bb3leEjh9ZDJBM8eebgQFnnfH1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10070799003)(11063799006)(10067099003)(56012099006)(4143699003)(5023799004)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2UwbHg4b1hwQUxZWWE1UE9yaEQzVUdyQmJrcEl0WjJBbXQzV3VZUEhEQWpD?=
 =?utf-8?B?MlJ2VWN4RU1FV1BFV0RrV1BNS09wRmRjZXFMUkRLUmxGQ0tLaFg3UXdSaUp0?=
 =?utf-8?B?QjR4QkxMcWRnVkVDVkNoM0RMQ0lnVDBRaGtnZ0Z3QmtOMzVsdTJYZmNHSHlU?=
 =?utf-8?B?VHkyUEFRMFVLTlRjVkFlQlUyakdOVzN5NEV2a1N6aUZqM3dMN2hEWFpHT0g2?=
 =?utf-8?B?eVgxZEI2eDNoRzg4dkJnWFR3RmRNVEt0NjBTUHJFNHRWUTVMbEtpNDJORExy?=
 =?utf-8?B?enBTTkZLcmtYdDNmZmZHMzFGY25aVE5iMzcrMVo5bFZ6SU9hSWJ0THlvOUFY?=
 =?utf-8?B?dzlHRWxYaVUvU2c4ZGlMRFEvTG9HeVhtd2dBemIyTnZXNDNZTGxGVTFQbUtR?=
 =?utf-8?B?TmkreUZtdEpjRGNXTE0zQ0psbzJnREtrSDg5aDJ4YmErMWZScnNmZGFiWWcz?=
 =?utf-8?B?T0VtcUVyeDFTS1Q0WW0za05BZ2NLY2hEc08wcGxLclJtNWpZaXVITTZVenhq?=
 =?utf-8?B?VnJVRExIdnM3L1pHaXdJSjFDMDdab0xUZngxbnFjM2V5NWxlQllJN0JQTDRp?=
 =?utf-8?B?RHdMT1NaQVRvdGdvQUI5MGdPTXJSZXpMRlF0dzBSZ1VuaGpKNjVXU1RIZ2FH?=
 =?utf-8?B?L0lvUFBlamp6VlZvWjViNUYwQjJoSEw3R3ZzNmIyeXEyU3F5WjI5TFhmaWYx?=
 =?utf-8?B?d2JtNVRhaXZsZ3hMVC9tWjhzTlkvQ0V0Wm1RY2JVdmdraDBvZ1RVRGNIaTBh?=
 =?utf-8?B?akZlWGlWZi9tdm43dG94a0Q0YzBNdUUwM2xJeGdIZ2tXNFd0ZGlvZEFuY0Vs?=
 =?utf-8?B?MHNNR1Jmd0tIY3RCd08rVkNMS2dna3liOWw3c1JNNEl0R1hreHN6K0FXYysy?=
 =?utf-8?B?WUE0Rjg2RFNhVm5idDB1VmQxV3h6RTNKZ0k3a25nMkJMUUxCQmlNT0FBTFk2?=
 =?utf-8?B?bTB6QjdqQ2g1SWZRd2k5ZktscXg3MWtsUit3WFhmUCtBOE9lUWFidERJUXlh?=
 =?utf-8?B?VkJaeXQyeDlOWEJmalhwckNsQmV6NDhUUWtKcEVCNmwwVTRuUWpZNVZUaHpy?=
 =?utf-8?B?d2dLTzVQcWpDcXdGWkNLaTlDZmRhYzgzYW5iSVBoUmpXQnY3ZmJYbUhwNDVN?=
 =?utf-8?B?T1pWOS9wczJRL1E1cXpEdzhEZGp5U0ZnT2J1TnJaRWszTGgxMFdHcy9JMFp5?=
 =?utf-8?B?RndvdTNBT2ZnNTRUZGREY2piVm1wT00zVHQvaUhLbk1zS3owYWtNZVlLdmo4?=
 =?utf-8?B?V2dOckc2Z3hsV1BqaTdlenROSjZrWlMwM1ZYdlhPaGJsV05KcTBiTjBxeita?=
 =?utf-8?B?UnRRNG0rZllxa2FmbHE0eUFGNVovY3Y4ajdzclE5ZFAxWWtEc0kydm05a21L?=
 =?utf-8?B?TVYydm5EZkhtTy9ZcWpUR2t3QkVQY0R0bXJkeE9FTHUvVDBzMmpLL0ljbDQz?=
 =?utf-8?B?RXQzTC9YUER3VlE4OE51cUtMWDR6Y1Z3bTZKVmVUQ3JvY0lPQ2J0czBITWJW?=
 =?utf-8?B?WUcyd1p6bnBoWGdFSnFscmtqNWVsb3B2eDkrd3JyUU56aEZvVklDTXV3cVJR?=
 =?utf-8?B?RGpQMmdJSks4OGRFaDVHSFJMUFVMd0FiQXhMUGREWkVIcXBoamdtSG91THFq?=
 =?utf-8?B?ZVVtcjZvRXVGRitOcFJYeTVaUFJiampITk81dmwvdExrZlA3Q2QyOWZtNDRG?=
 =?utf-8?B?Z0d1MElIQUFUN0lRNkFBTmFmRzdEUUhzNjZzVFpEdUdRd25PRE95ZERVM3Ni?=
 =?utf-8?B?L05TNXRSZ3dzYzZSVzZQSjYxaS8raHNaTUQ4SFU0cTlBY2VQVUhBMitJZXh4?=
 =?utf-8?B?ZFo4NUlZWWh3bXllRTZtdTFuQzJtWlBjVzNHL2RUbjZ3cm82ZEpJQStIT1lZ?=
 =?utf-8?B?RkxyaDIrS3ZvakZIRWhkdVJlTUtnWFRrL2JmbHFnelk3MjVtWjJ0eTZoNjFO?=
 =?utf-8?B?VERTanlVM1lmb2cySlQyb3VSRy80T3dLdjBHSW9oMXZVYjFlZjlVZ2pSckwz?=
 =?utf-8?B?NXVDTEppbDlaYTl3YjJlVXlZb1NhM2xLUnFIckZiWVQzanhnNVlqRk1Sblhz?=
 =?utf-8?B?VDU4N3lSVXpZREhUS3dEdDNCLzhjVCtBY0VENlBSNVZvSk5sUmN0Z1ZpR1U5?=
 =?utf-8?B?MXduY3lDdWFaL2ExSVpucHoxeTFBakVwbytNVFpXb0hzekpXeTZGN0RHSVVG?=
 =?utf-8?B?RXlzbW0rRldjWlQ5VGtxd0pUb2l6d2tkN0h5azB1RjdNZ2plU0tmaVFXYVA5?=
 =?utf-8?B?bC9jYUFoYkZYdjV3dCtmaHhvUUFJS3JCSnZ3elUwZkU0RTBvcGRBVjlnUG43?=
 =?utf-8?B?aFRoT3h4TktjL2F2aXpCSldKRHZNYXk4VjdkQVBiQzJSZ1IzK3JITENMdnRW?=
 =?utf-8?Q?1UAN9qSMizVuGcZb1Oad+JcXsJ6zMWES618M4iJ9MO1//?=
X-MS-Exchange-AntiSpam-MessageData-1: 0fvc/LsPmkNtDA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41813092-33f9-4e8b-e0fd-08deebd28d1a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 11:31:07.7858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnCwLn+ViBZ7rAagYeyqgTo0Fj/WKkbqTBcCv8B8votIIOofJoQdJO7pzKmTTgmssxu1+84urU6V1nlHN9GVfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6326

On Sat Jul 11, 2026 at 8:04 AM JST, Timur Tabi wrote:
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
>  Documentation/gpu/nova/core/tlv.rst   | 187 ++++++++++++++++++

We should add a link to this new document in
`Documentation/gpu/nova/index.rst`.

>  drivers/gpu/nova-core/firmware.rs     |   1 +
>  drivers/gpu/nova-core/firmware/tlv.rs | 274 ++++++++++++++++++++++++++
>  3 files changed, 462 insertions(+)
>  create mode 100644 Documentation/gpu/nova/core/tlv.rst
>  create mode 100644 drivers/gpu/nova-core/firmware/tlv.rs
>
> diff --git a/Documentation/gpu/nova/core/tlv.rst b/Documentation/gpu/nova=
/core/tlv.rst
> new file mode 100644
> index 000000000000..9e8c08727977
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/tlv.rst
> @@ -0,0 +1,187 @@
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

Let's mention "Payloads of length zero" to be precise what length this
is about.

> +presence of the tag indicates ``True`` and absence indicates ``False``.
> +
> +A TLV file may contain additional tags not described in this document.
> +
> +Values
> +=3D=3D=3D=3D=3D=3D
> +Values are one of three types.  The type is not encoded in the format; r=
ather,
> +the parser expects a given tag to have a value of a given type.
> +
> +1) Integers, encoded in 32-bit or 64-bit little-endian format.
> +2) Strings, encoded as-is and required to be ASCII only and without a nu=
ll terminator.
> +3) An array of bytes, for binary data.

I guess booleans adds a fourth value type?

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
> +``BLID`` (bytes)
> +    The build ID, extracted from the ".note.gnu.build-id" section.

Should this be a string by any chance?

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

In patch 4 `booter.rs` says "Booter is always signed", which contradicts
this definition. We had a non-signed path in the original code; why not
preserve it? The current firmware files do not make use of it, but the
point of specifying things here is to make the code future-proof in case
we introduce or enable unsigned firmwares in the future; so let's make
the code religiously follow the spec.

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
> index 000000000000..5dfd2dd814f8
> --- /dev/null
> +++ b/drivers/gpu/nova-core/firmware/tlv.rs
> @@ -0,0 +1,274 @@
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
> +use crate::{
> +    gpu,
> +    num::*, //
> +};
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

This is missing `nvidia` in the path. To avoid issue I would suggest
building the `CString` earlier and using it both here and in the
`try_from_fmt` statement below.

<...>
> +    /// Return a slice of bytes.  Returns ENODATA if the value is empty.
> +    pub(crate) fn get_bytes(&self, tag: &[u8; 4]) -> Result<&'a [u8]> {
> +        let tlv =3D self.find(tag)?;
> +
> +        // Treat empty value as an error, to avoid trying to parse nothi=
ng.
> +        if tlv.value.is_empty() {
> +            return Err(ENODATA);
> +        }
> +
> +        Ok(tlv.value)
> +    }
> +
> +    // Return a little-endian u32.

Doccomment should use `///`.

> +    pub(crate) fn get_u32(&self, tag: &[u8; 4]) -> Result<u32> {
> +        let tlv =3D self.find(tag)?;
> +
> +        tlv.value
> +            .try_into()
> +            .ok()
> +            .map(u32::from_le_bytes)
> +            .ok_or(EINVAL)
> +    }
> +
> +    /// Return a string value.
> +    pub(crate) fn get_string(&self, tag: &[u8; 4]) -> Result<&'a str> {
> +        let tlv =3D self.find(tag)?;
> +
> +        let bytes =3D tlv.value;
> +
> +        // To make sure the value actually is a string, ensure it's all =
ASCII.
> +        if !bytes.is_ascii() {
> +            return Err(EINVAL);
> +        }

The spec also says that NULL characters are invalid; we should test for
`|| bytes.contains(&0)` as well here.

> +
> +        core::str::from_utf8(bytes).map_err(|_| EINVAL)
> +    }
> +
> +    /// Obtain the nth signature from a SIGN tag.  If `index` is None,
> +    /// then return the last signature.
> +    pub(crate) fn get_signature(&self, index: Option<usize>) -> Result<&=
'a [u8]> {
> +        let num_sigs: usize =3D match self.get_u32(b"NSIG")? {
> +            0 =3D> return Err(EINVAL),
> +            n =3D> n.into_safe_cast(),
> +        };
> +
> +        let sig_bytes =3D self.get_bytes(b"SIGN")?;
> +
> +        // Ensure that sig_bytes can be divided evenly into chunks.
> +        if sig_bytes.len() % num_sigs !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        // num_sigs cannot be 0, and sig_bytes cannot be empty, so this =
cannot panic.
> +        let sig_size =3D sig_bytes.len() / num_sigs;
> +
> +        let index: usize =3D match index {
> +            None =3D> num_sigs - 1,
> +            Some(index) =3D> index,
> +        };

This can be a one-liner:

  let index =3D index.unwrap_or(num_sigs - 1);
