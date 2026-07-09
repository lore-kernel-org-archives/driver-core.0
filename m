Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A174E2E03EA;
	Thu,  9 Jul 2026 01:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783562146; cv=fail; b=aF5BP0UBaul+Zr7ABSXIA/774pyOWWaMhBjkC734L6ZPK3dhECxmaLkoO4wCsYwey+mg0llczyYjfgQfja6aqI1PpoF5dtVv0LIrU/qzlIAekAQSEwXVDe+XGJrFaBJk6vDIIowWS9dr0U+RdLO5NRts9zLkngwqF6OR8mwwDMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783562146; c=relaxed/simple;
	bh=C8QEoeXtRuCT3n8pDrVvSotchPORoss+TXVS4Xq+EZc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ML5ADrE3a8csMpDM3UFoRIwxMTwhAH87HnsU7LsJbjbL6GUxeVnDwxRKwZP2A5j0nPGAfWJB4Q8nCpWj2ndqjL32x3cEHVbwrZQ8p99vuhypc1zpHKFaLR3lsCXnWGDqac1zeTrNtUnU0aW43BgjR0fymEwWleXTK4LRnKEwdoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KmDbDq8j; arc=fail smtp.client-ip=52.101.61.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KmDbDq8j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkeXB+JDW89vMxc8ysPxmKiOofaiprAnh6TEThpEmMWOSFRYQHBWTtt+itcz2U6NcftJT954BBKW+FG4ArRM9F+48z0jSEHumUuWyZo/7j+WfP/YzkfrNMjw/ROZib0YzX6qvfoSLalDykLy8E3KrR91cWCuthIMSwiZwLfqcrg2344fXkjejLKVEyCLOfMJzLx+8dTY9qvf6vAtmbnM7TVJTLSOSPLUEwl84MUDixIHoAEPrtNYGsVQkZ6q0Viayol0wAo+Yr+IVBgdql8mlBeEXnE1JccYMwUSCgSG+UR3zQ/QHSLf5QYuxp2DcYJuWS25NbKCj047PS73MxGU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuxMePDL5+RHrOuD2xtPRLSbqe0SCw7yurOwp69JAXM=;
 b=DYtNQrLiqNeNn9EC7gysfJDMQ5RU5Xyh+UTKZWA2sDPgBXaolqf2UUKxbN5cr+PN1V5nEirUxAhh5Z/iEUlsYgvSXalC9ow4Q26gERVQn6rV/4HiGuNedwBooWtpaHlOfawLY/TGnUyDlPy23EqmLCxhyTcPthj9u1GckI+GozrT4aH6AhXQlrjZnTcf/LaAJ3OX7AvP/HFKqwCjb4FKVwKATdTH8OduayZt4gsd68a4Ulezsd0ZnOGB2moKDIYv4NRxpHPq38EIgKJ2KsX/gbwiL7V22qCaO2JoFDPTrb0C+EPSF++2gG/azYqL9gyCYSmGFyT0r6TpMPqY2F1zbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuxMePDL5+RHrOuD2xtPRLSbqe0SCw7yurOwp69JAXM=;
 b=KmDbDq8jib9wCkqmI5yMIYs04fEWusq94RezTwCYfO9d6CL41XQwvm6DTzpYpYHpC/jAve0MOkkyicU3HtoY41fCIesfWgLjytAor1eUXSyl8tZGS28OGytY3gXOvocW6rB3N6/fCQShvnjzVLPvL6ABmmVz3s11HZ1zdIT7BDeCugq2fsBfUrCwHIm6yhGUX6mqb6AiQNX7bVBI8Hb3Oenj8TAHEUaHT4hGrljSXHFpslwl0/+vhe/b3SMRoefgP5S0Do/dHUTsqIIMfJj3B4gPMmOys1NO6he/F0qXhLCtL39wOjon3hsc6yiY1YYN2M9wO8TEjC5F+NW8d8F+Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by PH7PR12MB7332.namprd12.prod.outlook.com (2603:10b6:510:20f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 01:55:33 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 01:55:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 10:55:21 +0900
Message-Id: <DJTO07DGI28I.2RB923IAG9IRX@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "Zhi Wang" <zhiw@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "mcgrof@kernel.org"
 <mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "russ.weight@linux.dev"
 <russ.weight@linux.dev>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware
 files
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-3-ttabi@nvidia.com>
 <DJR9ZWAN4OCT.3GRDS8LGOZ16Y@nvidia.com>
 <ffddffcc750393ca5f719abe27f8a3d6eeb6bf31.camel@nvidia.com>
In-Reply-To: <ffddffcc750393ca5f719abe27f8a3d6eeb6bf31.camel@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:604:218::19) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|PH7PR12MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb29463-2062-4ade-f41a-08dedd5d2795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|11063799006|3023799007|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	0AtPky5Munqhpe/9L/8uornS93wgG44hNOAhoM7ZTDycVokwQgJ2D6b/1Fr1cBeLTFCBOv0ecrnZ1Ju7GEBRnkND/lFT3RSJCoHZaMy+MMvNNqoVlSrKeoafJIvG6noJm/yLxb8mpFr9y3poOj8fHzk018/NiHvGMLIEv+49hMiyvN8pnVCa9VkENNT1C+gE4h3gLI6Gi5S8hSmoCtyVOv6Yb50YuS0BoDszI9qAE7q8gkdEluS8YSmKPr61GfoBkWVcg9VHuIWDgkfCB3WSFLzI2lgCoXVNuvws2HJ/1xiZfEdhjdcd/G11XFa8qH9XEYa1p/hFWsqPV6clJMS3UEAouPapmLBwT+EeRRNxfrk/kdn0vIO8Iuq+Sl06xD5Z00EMS0lfKhGQasTUUQl+P3r5P8cLGDvDW0/LvQ42JyIKq4Ua/VBges4GI8mqeIN3djXlg8zoo/LQGkyFHrCpzsa0r4f3IWIAoQxg6PkJ9JWCM7SpKLJMu0aDRp8APmh1kjAGhY1BcOo53KjoTAVCdn4JiAHe69VdFgdZqIFitauBtf1yzkNfoyfPjMQbWu1b6xPopqQstu1wa/5OGloloGtPYACp6LULyhkuFwcdryQHFWmlUAVjWiQ5f3Jm+rzm0ozuHjPB9mlB9goGqrdOQwUUdo/U56PosJ3X8mQ2tno=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(3023799007)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blpyMEdCMUI3TmJrSHdZSGNMaXc2K3JCbm5VenMvdHVBTkJ3Vk9hU0c2b212?=
 =?utf-8?B?V2l6ZDhpblYySmhqT2hNV1g0T3Rab29IaE4zMVdaQUpXaHBwQ1Z6V2tkWVJ4?=
 =?utf-8?B?dVhFdHhFM2NlWERESXhUV0ZGTXRjKzk5SmRYUHpVcnRrRVJEekNOMlVMRlVX?=
 =?utf-8?B?ZVEyS2FBMGtsdHdmVlhPNm4yUWk3Rm0xSFV2RDFjOWFCYkFEeWFvYldIbVpj?=
 =?utf-8?B?dWVUVE5zcWxCekdKVUJpQkhQK3BiUGgycTd4NzdRMVlyeGQ0a0NURnNiclZt?=
 =?utf-8?B?R3d4TEdQQUNoOUNKQTZuMGR5N1h3OFdodytiVk9KU1IrVllmMzVpU2hFcWJD?=
 =?utf-8?B?Mk9vL091T3VOejZMb2VMQnZaL2gwbUhuQllwSXVmV1RubzRFSk9YemMwQnNZ?=
 =?utf-8?B?OFlscWY5QUtCVlV3bkQwTXJsUW51OWxjUFU0TjZxSE1XQU9GWGh0VXFRdmFy?=
 =?utf-8?B?Y3FTOTROdVhZMnRKRlg1MW9UM2RhU3VmZ2g1YWVETG84bTZsbmhtSUU3TS9N?=
 =?utf-8?B?V0Q2WW5hVTROcDNOaUxlY2tqVHI1OEJYN3lRYVJNYUhIa3Y0TlcrVitoMHJo?=
 =?utf-8?B?aURPZnNkVWh2a2Zkb08xR3Axdmw4dEo5NDA5UytiQWVCR3JERTJqeHFyNHhD?=
 =?utf-8?B?N25DWmZ0QjNEd0xKeG5heGFYZHhNTERQZzFjUDBoUm9hM1hteEVFSHJQaGFP?=
 =?utf-8?B?VGJ1MllNL2VvakNxZlBvMVE2TmdxRWlsc2RaZmdUTDllUkZiTXZBYytpTnVa?=
 =?utf-8?B?b2R0L2EyVTlyZDdPZlRDdXozYzJrR2NNaUxrMUthUGp1ek5WSkprM0Q3WWtu?=
 =?utf-8?B?YmpwRmY0SWp3LzBlbHU5U3Z1dnBtN0JZWVRxR0JYUG1TVFR3cEliTTBPRXg3?=
 =?utf-8?B?VjFFdVEwblpWaWtwbG1mK1pPUGVrckhobGlzRU5BU2lEOC9EOWZZb3BDQXdH?=
 =?utf-8?B?Uk9pc2dxeXJGUnlLcjdtNFhjOWhYV2h0L2NRQlFNcWJOVWphLzRZaWozNkVl?=
 =?utf-8?B?SFE2T3hlR0w3VlFNb01NR0ttSHByNHFBVnBvazNPZ1BGT0JJQitOSmNJY1Jw?=
 =?utf-8?B?SGFYWXVxV0NBaWVlZ1Z2bENWaHd0ZW5Sb0pSSWZIcDBJUjhnYnprZ3BaVEJ5?=
 =?utf-8?B?NFJhN2VldWI0NDA0b2xRNDVMMnN2U3dseVJFa0NNK2wyZ1NMWWJiVVhoTnY5?=
 =?utf-8?B?WDNaUHp1b25DUURTaFllSE5tOGF3MjllTWFRVmNnOTI2M3RHN28vaU5za0hK?=
 =?utf-8?B?UmJ2K2xHbWJsQlNBQ1dybmVjMXlHSjc3eTJ2bGY5MkhZR3crQkpnODU3Ni90?=
 =?utf-8?B?ZTBBWktyQ1BvT0V2eW1seUZFN0FSOE1lZjBnYk5QUFFpWjlDNTJQQSt5WnFJ?=
 =?utf-8?B?QWlUUlVjQ1kyNEpGZlZLZko4dEsvQVpwUVZSWCtyYzJJeS9PRnh6UXJkYUgz?=
 =?utf-8?B?OG0vTXdmdTR0ZHZ0SnBMVGZFc0t4TXd3ekxiWElzODVrM3FidGJLQ2NyR214?=
 =?utf-8?B?TkFMRW5VcHFDUERPbFNsVjE5azBaYTFYZHFXTzdrOUJFZnVkWVdOM2JyVVhr?=
 =?utf-8?B?Y1VScmtaUnFESmcweTRNcjhRQlhGeWVHMmdoaXBXWTRsNjNxRGE5c1ViajVG?=
 =?utf-8?B?N2d0TDJwdWNFY2Y4TTBxMU1aSC82aVNjTU8zbmlFUWF5bVlVYnhJcTRlbnB5?=
 =?utf-8?B?WURRTDBkQUlrNXRYRkdQcDZRQkYwd3I0bG8zdjU2SGgveDJ5bTFiK1FDeDl3?=
 =?utf-8?B?ZTg3M1B1TExVVGRnZGJ3WDlibzVCVnhwaXJwdk41Z2NYclNodUVVNm4rb2xG?=
 =?utf-8?B?RHRGckFaRVgyWHlHeW5pVHE1TnVsZ3dYbGlVMCtHeHNtL1lpNE5haVNmQ0FZ?=
 =?utf-8?B?UzRXUlJTcDJPNTNnZU1BSjRaV0lHR2FsMVhjSm1Jai9IeUNZdFV5eWxSNkc2?=
 =?utf-8?B?RTJLV20rTis3Sk4rUWhpSS9uRVhKbWxEUUxhUksycjFPREIreUZ0RERaR1No?=
 =?utf-8?B?UUcvR0VtVXcra3JGT050WXZwTjEwdDk1cTJKckVWeTJ4UVB4ckNHajNoRlZo?=
 =?utf-8?B?NEY2U3lIR3dzRE4waHFkTzcyVXcwRXdIbXZoVTFCcTYwSUtjd1JCT3Fpb0hJ?=
 =?utf-8?B?WTNTdzRTZWgveHpMaUh5bTZBM0dCdmtsNVhPSVZ6aklOOUtKQkxoSVlzUUhz?=
 =?utf-8?B?NG5oVisvSVRxRDlFaHVkNjhxcFdKeUxQNzQ3T1J2djZMREF6NEJEckJLdEoy?=
 =?utf-8?B?ZjJOSUhxWFNQQnI5V204aXE0VWNiT0l5ZG1KN0dubEJGZldWVXRaUVozUUlC?=
 =?utf-8?B?Rnk0a2pma09hV0RMaWU5VWJXYjU3M0VsN3lqUjVIQUZma1htVXFsQzI2VW4r?=
 =?utf-8?Q?oMPp9efBKz6JjXWBAw0WPaV9ssE4q6bEqAo/kDhN5uiqT?=
X-MS-Exchange-AntiSpam-MessageData-1: 0AGq9kncuK8F2Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb29463-2062-4ade-f41a-08dedd5d2795
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 01:55:32.9651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJ1vkjwTE5HD0Q1Y+lqB6Ee80vqnyR/ZFsyNZ74RJESSbyQKx/7xe/8yLmLgd6J6PgGK0W40H1LI37U0YPB4Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7332

On Thu Jul 9, 2026 at 5:12 AM JST, Timur Tabi wrote:
> On Mon, 2026-07-06 at 15:31 +0900, Alexandre Courbot wrote:
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +TLV Tags in Nova Firmware Images
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +
>> > +Nova firmware images use a Type-Length-Value (TLV) format to encapsul=
ate
>> > +firmware components and metadata. The TLV file begins with a 4-byte "=
magic"
>> > +header that contains the string "NVFW".=C2=A0 Following the header is=
 a sequence of
>> > +TLV blocks.
>> > +
>> > +Each block consists of a 4-byte tag of ASCII characters, a 4-byte len=
gth
>> > +encoded as a little-endian unsigned integer, and a sequence of bytes,=
 the size
>> > +of which is equal to the length rounded up to the next multiple of 4.
>> > +
>> > +The driver code that reads the TLV and uses its contents is called th=
e parser.
>> > +It is the responsibility of the parser to handle missing or malformed=
 tags,
>> > +lengths, and values in the TLV.
>>=20
>> I guess that last paragraph is kind of expected - spelling it out loud
>> without being specific as to how to handle missing or malformed tags is
>> just confusing. I think it can just be dropped?
>
> I think the docs need a statement somewhere that "parsers" should handle =
missing or invalid tags,
> and that that there is no expectation that when a TLV is created, that al=
l the tags are there or
> that they are even the correct format or anything like that.

No issue with keeping that paragraph if you prefer.

>
>> >=20
>> > +
>> > +``NSIG`` (u32) - ``num_sigs``
>> > +=C2=A0=C2=A0=C2=A0 Number of signatures included in the ``SIGN`` tag.=
=C2=A0 A value of 0 indicates
>> > +=C2=A0=C2=A0=C2=A0 unsigned firmware and that there is no ``SIGN`` ta=
g.
>>=20
>> Shall we say "A value of 0 or absence of this tag" for coverage? ... Or
>> not, see my review of patch 3.
>
> Hmmm... I'm not really crazy about that idea, because then there is incen=
tive to make all u32 tags
> act that way.  Sometimes 0 is just another number, and not a synonym for =
"None".

Yup, that would make the absence of `NSIG` an error, but that's not a
problem.

>
>> >=20
>> > +
>> > +struct TlvBlock<'a> {
>> > +=C2=A0=C2=A0=C2=A0 tag: &'a [u8; 4],
>> > +=C2=A0=C2=A0=C2=A0 value: &'a [u8],
>> > +}
>> > +
>> > +/// On-wire TLV block header: 4-byte ASCII tag + little-endian payloa=
d length (bytes, excluding
>> > +/// padding to a 4-byte boundary).
>> > +struct TlvBlockHeader<'a> {
>> > +=C2=A0=C2=A0=C2=A0 tag: &'a [u8; 4],
>>=20
>> This struct doesn't need a lifetime - it can store `tag` as `[u8; 4]`.
>> Same for the `tag` member of `TlvBlock`. Everything above them (`find`,
>> `get_bytes`, etc) can still take a reference to the array for
>> convenience as we use the `b"ABCD"` syntax, but for these two the
>> reference is just inefficient without reason.
>
> Ok.  This change resulted in a cascading effect and I had to change a lot=
 of &[u8; 4] into [u8; 4],
> but I didn't want to change all of them.  Which is better:
>
>     pub(crate) fn get_bytes(&self, tag: &[u8; 4]) -> Result<&'a [u8]> {
> ...
>     tlv.get_bytes(b"BLOB")?
>
> or
>
>     pub(crate) fn get_bytes(&self, tag: [u8; 4]) -> Result<&'a [u8]> {
> ...
>     tlv.get_bytes(*b"BLOB")?

The first one is fine - and better arguably, as the callers don't have
to dereference the `b"ABCD"` tags. It should also limit the cascading
effect.

>
>
>> > +
>> > +/// The payload of a validated TLV (type, length, value) firmware ima=
ge.
>>=20
>> I think we can just say "A validated TLV", as payload makes it sound
>> like this is the payload of a given key within the TLV firmware.
>
> Well, it's the part after the "NVFW" header.  The "payload" of an actual =
get is the "value".
>
> I'll change it to:
>
> /// The post-header part of a validated TLV (type, length, value) firmwar=
e image.

Sounds good!
