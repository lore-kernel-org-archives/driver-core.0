Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011048.outbound.protection.outlook.com [52.101.57.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F692DA765;
	Mon, 13 Jul 2026 02:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783909300; cv=fail; b=kRrmCxoj+o9t/PMa0vGCnVBtiLAyH29l+yJL78W/E7/th3NbLVWpHtY9hgzxkqH455MN6HUbxwPXKPlFw1cEMbqSk30erDGQpMGDppM44x/MdDgoNixLSBcEd0/jHM6+n/Pn+s5G82LP9qVDNVTq28r/5QSMjqxv2gU628uhcyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783909300; c=relaxed/simple;
	bh=ESTlwbwDth0Vjx9zO1aK4DL95PLPyfxTpuSwOpWAQMI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EWY6n9uXHWgi64eCszC1r9egMOzDh1JIG4mDt9PiOUG3xJPCohg99OUNzmMxacM5NT18Fmf+fr4kD5FdBz6R0/fMNNCKf40Ijf2Z/sC33WBnkuiv090g4N5BkdAlHWmfYiJawaYVQPOXYKBEvOP4MY82hwnYRbMzdwZUObzqwho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fHbcP5wR; arc=fail smtp.client-ip=52.101.57.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fHbcP5wR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjSTyUW85EwrmmHlwy3DgcV3Bx8TWDQFoGcyreTMmeRfpgiPeDaMAHBawu8Xyb9vREoaPWFyC/HQPTdGOrfZtBu1b8eBGwqyr6GibYwoKkfLbTRaN+p6WYWwulSHpTWQPX4n3IAVd6UZSvDhHoLvhGpnujd03BeCCAylxfaLxbsBTiVq9NmSp4tTr0PAd4yTMb4w1NNZ7XnfxqlvHrNdTDepBY3VrmTxB8ZzFmCn2oFeR1MlvJkhAF+mIQf/3uO7RQZqDCWnUrwo++xTCsSUOatyQDd9msvxUG0ByuC81e6j6UQj6TzEy9+ePZ+E7cmnvi6ZC7h4OgsGZ3zm1rf5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESTlwbwDth0Vjx9zO1aK4DL95PLPyfxTpuSwOpWAQMI=;
 b=w38u31iN1YU0zru+gz4SIVpGSemEs4oFUwDF+0DGlIQoc3lT6QjFb4cqoW+cJHoUlglw7MUvGuwOJXAcayXHnCw8i+cESyZjUEfETMB1dZM/CkCnd3/3GYpaWXBsOuhgdF1IUKlT+QeJljEjE5UlfCd3rvPYxi5pwcGA59WKuTwUeNUyZvsbvv6+QdTwXgJPXd2BDCygzPIoPavmNcsbgMY+lfJsPSF1TLM/Ww/HYckyM4K0AWkJEfqb1GECHJzNEPjm2XDOl32GgdTI8xngdEn8BzrkF4QOr/71dvmD+Tw7/Q592eExQ0OHG2l6NnUUL66tEi9v1Z5P24e+MEupLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESTlwbwDth0Vjx9zO1aK4DL95PLPyfxTpuSwOpWAQMI=;
 b=fHbcP5wRXOR3G01vldT1g0XDKmFSp1YVK+4FS7kE2oXsSb4leyrhub0cYt4z3QkvrmypgMVhTZ+fKzXWPk2okpEZ9so6VLl4gso6m8aNGW2zka3pW14EbPM0lmbFY0rxJP2G5iigiggP+pRuWaAbFKGwc+KU3ANHADCgeQWYjS6xOsYS0G0nOCJI/6WEUyw5y6nIPLXKtVFhq2BYJr3NmDyML4CRJSRoZFwLh6Wh9hlpW2GIXhmQOR0YOkPT/4R4iEpW2kE+08etP+1o7lCZXi1AaQNEF3YC2/VAenArtw6GLs+aAuUH7ewevE6G/kMj1YnJL157NNp0dQgpI4jZ5A==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH7PR12MB7306.namprd12.prod.outlook.com (2603:10b6:510:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 02:21:35 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 02:21:35 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
CC: Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"gary@garyguo.net" <gary@garyguo.net>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Eliot Courtney <ecourtney@nvidia.com>,
	"russ.weight@linux.dev" <russ.weight@linux.dev>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, "ojeda@kernel.org"
	<ojeda@kernel.org>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v5 1/8] rust: alloc: add Vec::zeroed method
Thread-Topic: [PATCH v5 1/8] rust: alloc: add Vec::zeroed method
Thread-Index: AQHdEMCLO148PrPt1EGXnCsLrRZgMLZoT/WAgAJrMAA=
Date: Mon, 13 Jul 2026 02:21:34 +0000
Message-ID: <1ecf1c1235ab8fbbe884ec42d72cef1a9878c8b9.camel@nvidia.com>
References: <20260710230428.865447-1-ttabi@nvidia.com>
		 <20260710230428.865447-2-ttabi@nvidia.com>
	 <CANiq72nENzJejiO3pmV9FhRA+H+zvCtfzWY0=wbTERToceiu3g@mail.gmail.com>
In-Reply-To:
 <CANiq72nENzJejiO3pmV9FhRA+H+zvCtfzWY0=wbTERToceiu3g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH7PR12MB7306:EE_
x-ms-office365-filtering-correlation-id: b94140e4-00d5-4024-e162-08dee085761a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 hAs2K+Q1TwEV/E1QbKCHG7H06HhB7Q8PWCUmz1+nCHWYnKQQHZPAFuLqODAFWybErSq1gdrEt5Q3wRvT/rveqnVrmoJZ2/iUJmyWtZC1O6ljQi9+axzaNMiA7X2jvfMZcc+YUFJlP7Xwroe7+k8FFiXA8CFBbEauhXkiMFGPCF652lFIuminkWUPmMnlgELTILo2MefoZevxccJ9SCkQRdcFU/YHOJFLkppBudeg0C0XhXh0MorgebuQCPGtCbID18kPm0o2Z3Cilh4T5FaegvA98MHQ6YCxuOsvjbUHTls2tFbhVtGZONd9ikeI6QOPSnmRY5L1AKVq4oIiIfGEPDPKkQej1j1w7skm2gfWXQR9x8x1nCEzaIUogzzYMGfPcMAIPiBsMZQ5CJ5S7uQO+mh11RLVapErnjB2qPjE+1I+F6QuoTrTkJVkUVi1+vHHTl5IS8c1oPQwjJAyso2vQpOwP2GUqz3Ai0HbBSTje6klX9txwLXgmRTNkdIpAxhtmeOAPv4nUFqm9iDpo5EfYL8zyoCzj6foNRAbchzmEcLCTFzxFIIXoMsjgUlIs0dbzdAgm5Zi1LOPXR0BLQxCILiKHcrdKkDh/ljqTJ3esPmLbihDLDFj5FAzqGruYGjw2CCBwVDd9sfojKuF7H4/alE0lTR7PzSxnw0u+McxDVe8Z2UlJZz7Dl8Z4RO6hN8L7gWxtrAA+QberYBOwatfyNxGeHwydnnqJw+BP2EK8yg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0RaK003RWs4S0ttRVcvQkcwTEVDenY3Q3NhSnVYbkkxMHdFVkNhQWFxR2dD?=
 =?utf-8?B?blNhOVpXU2ZLTkN6aExHdzV2Z09vZ1A4bkJsZ0RCRDRDZ1UxZnNzbTVHcHlW?=
 =?utf-8?B?THU5UHFOY2YyUnJXL0pKczN3ejROazhIeDRKSmVLN2FJeDl5dnBNUFgvRldW?=
 =?utf-8?B?TUNSN0V1d1o3NEhENXpSVEY2cVFuUlpjSXVNbFh4djY3ME5IUk03blhKd1ZJ?=
 =?utf-8?B?YWdObFVYU2U2MHJjYnloT1V3THBKaGpVUGlxU0JYM0owUVZmZWpOWVdld2Jo?=
 =?utf-8?B?MlFQR2FvSi8wTFMxQ2gzTHh2eWtSRlN0TUxEN3pnZ1F3WlpYYVowQk5aSlhC?=
 =?utf-8?B?YnJyVWxiOU9qMkRNL2FobmZMY093UTl5enh3WlA3cldNZ2lRNlZ3VEp4OEVt?=
 =?utf-8?B?TXYrODJURU5pbEZRVkNqQXhMMFZZWThmQXBKR0tyay9MZ21XK0h2SnZIVWxl?=
 =?utf-8?B?NHBHTTljajFzbEF5ODhJUGxrSzdvMFhQLzNENXlNcUt2TXBMb3I2NTMxaDZT?=
 =?utf-8?B?U2w0OWNMMUtUWjJLV1h4Y2NlMEFaNzNiQ09tUHFhYmdJUlloREtZeFduWENF?=
 =?utf-8?B?Q0I0SmVzNDJ1dHl4R2RKcjNoVGJ4YXlxNS9sZis3M0JpQjV5Q0tyVUZmREgw?=
 =?utf-8?B?a1pzdXBHeHY2ZE4yWmIva0R4dHJnMG43TFB6K2xOeHp2NGxIOHpzY1JjMHMy?=
 =?utf-8?B?Z2RjVkZsMTVieERGRklSQm83MTRkYSs5d2xCdUlYMjJ4U01rQ3dpcVc5QzVa?=
 =?utf-8?B?VWZnSTlVZkdsYWVsKzZEUjVLa1J1TWFMYzlUd3U2ZTlTTTUxM2JZRTNnL3lQ?=
 =?utf-8?B?U0U2cDhrS0ozdnFtaW1XK29TRHdVN1RaaWxQZGtkY1JJSmpYTy9sYnczWVE5?=
 =?utf-8?B?SGtxVTVleXBTUEN0V3VJSjF4ZTdHNDA0eWlva2VCdWx5cjNmMmlheFVVdmZ4?=
 =?utf-8?B?ZE1NVlRRZVFwMXZSRmRsdWNYTzdqcndWVSt0MmtZOWRZTkF1Zkxjdi9maU1v?=
 =?utf-8?B?Y0JRc1I0bEs5Rnh6Z1JlYlFDOFY3cjJLWG1zQUlBbFBVNGlUeWNSSEhlR1BN?=
 =?utf-8?B?YTJqSUNONGQwQk9GZDBHVG5yN3daR1N5b21hdjhHSm9CZHhxc1d1VDkxd2F2?=
 =?utf-8?B?YlZnVnAyWWgvSkg0QUIreEExaEQ1dDVDVlVxaHpGZXpub2Z5NG9VcCsrdGs5?=
 =?utf-8?B?QllDaFJSN1cxU3pxMnlieHFqNE5JZWYyTzRyTjkxS29kTkhNSjFSNStJMGZm?=
 =?utf-8?B?QXNCVytBUDA1RlJSRktCdW0zSzF5ZkNxczkwRTdoYWZiUlRjVjdsa3UwdEJj?=
 =?utf-8?B?TjZPMm9hVitrV3RhQzJDQTZtRm5adFJ1dHlTWXA4cGVPZjBMNlRvZlBmSEc5?=
 =?utf-8?B?T1BjRW13bHk5ZlpJM2ZkODA4N1Ftc1Q1L0Vubk84UEdxdVRBUDFkeGEva2lq?=
 =?utf-8?B?ZCtXakFmOHZiQUNFUzFlb0pjV1lKNHQ3TjRtVEIwRkxURFJHb2FDRnZ5bVRF?=
 =?utf-8?B?eTh6TDduNEY5Y2hsQmlLekRZZWpHSDJvSmpRQlp6eStmdnpKTGxxV2dtc05B?=
 =?utf-8?B?bERFWGlkVS84Y2VSYmNsdlRnOHNFbXZVM2pvNDllbDIwWWJqSzNqUHhYTkhw?=
 =?utf-8?B?NTA4UTRMNGU5aFl5RjQ1UzN4MVFTYk9YKzg5ZDZ3WWFBVUErc2RMTTBTKy95?=
 =?utf-8?B?Y1FROTR2UWNWUWs1LzdEK3I4TW1tOWJHQUM4WXkwOFFtbUtIK1UyS2ZoT3pQ?=
 =?utf-8?B?SDJKT1g5M3BKVjZQMXJNc3MzQk8xVURUV3FLOHA4dUE1bHZSUlE2VFFlNFc0?=
 =?utf-8?B?dDNJODd3RjdIa1ZEUFdrT2x4UUhnM3huVGh3Q1MydTZEQ2JwcHR3dHR5TDRL?=
 =?utf-8?B?ZG1QakUxNUEwQW5EK1E2OXgweEdpOHYzWk5tL0o2MlhuWGJacEhiRHpvWkp5?=
 =?utf-8?B?dlNlZGpMWHlwZWVyaVRGTUkrczhMaWlTTnRmOFNVTzdDL3hjNFBITGlia1B0?=
 =?utf-8?B?UGNrN2pNb1AxU1JqMWpFSEE0a2pOcVQ5ZjRVNnljcXJ6bWlTckx6S293SVY2?=
 =?utf-8?B?MkhpdHErUTZ0TDNVVlh1VWh5eW1VYTFCK1hPY2Q4b1FIRFRXaVZPc0ZPak9M?=
 =?utf-8?B?KzBQSWFGdnMyR1NvN3JIWlJQaXJYb3ZESm5HcmRjdVBueThrMnFvdFJzV3o1?=
 =?utf-8?B?bHNnZTdjTE5EaEY2ZnBScnYwYmRTbDNtcUIwaGlZcGF4WXhOQW5XVVZOakJu?=
 =?utf-8?B?K3Q4cGhCdTJGT0RZRlhCSS9OZE1wWTBiTER4cy83c2RBLzNwMG43SXhtUjZu?=
 =?utf-8?B?YlQzODgrbmJFS1pwOTh2M0NFOVFxdzh4UUU0TzcyTmdCcDJUM1BOM3QwVTBh?=
 =?utf-8?Q?KgpnlIsfYPT8XI/TblnvGx+7xymBNaEcbagzp61aJn4Gh?=
x-ms-exchange-antispam-messagedata-1: 8cJSVWnJhiAzqA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0781C4DAB19C54B97B575B9FF36EEF5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94140e4-00d5-4024-e162-08dee085761a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 02:21:34.9781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eCIrLaMfJ68Ux7qycr7CpvLH7ae/cpt830PlHD09YDAMBnAq9SyeV3CDNtlYVQRmIDBD8b3nlRdKOnjQdYRixw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7306

T24gU2F0LCAyMDI2LTA3LTExIGF0IDE1OjI1ICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
ID4gK8KgwqDCoCAvLy8gQ3JlYXRlcyBhIG5ldyBbYFZlY2BdIHdpdGggYG5gIHplcm8taW5pdGlh
bGl6ZWQgZWxlbWVudHMuDQo+ID4gK8KgwqDCoCAvLy8NCj4gPiArwqDCoMKgIC8vLyBOZXcgbWVt
b3J5IGlzIGFsbG9jYXRlZCB3aXRoIGBBYCBhbmQgdGhlIFtgX19HRlBfWkVST2BdIGZsYWcuDQo+
IA0KPiBUaGlzIG1heSBiZSBvYnZpb3VzIHNpbmNlIHdlIHBhc3MgYGZsYWdzYCBhbmQgdGhlIGZ1
bmN0aW9uIG9ubHkgZG9lcw0KPiB0aGlzLCBidXQgdGhlIHNlbnRlbmNlIChoZXJlIGFuZCBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UpIHNvdW5kcyBhIGJpdA0KPiBsaWtlIG9ubHkgdGhhdCBmbGFnIGlz
IHVzZWQuDQoNCk9rLCBJJ2xsIHJld29yZCBpdCBpbiB2Ni4gIA0K
