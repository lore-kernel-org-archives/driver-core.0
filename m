Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299EE36405C;
	Thu,  9 Jul 2026 22:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783636797; cv=fail; b=ay9tzRP4yBTJwlkZBAihE0eGRKBc6JucoD+N1273HB+EZ6MgeFgbNNyPS2Atanz6wc2G3QeFMP21Pkt8SkKQhxBIFCuD39+fDPCTAATkOe1JpWaWUqEZHa4RNgK7f1KPbCzEzBW5oFwlZ65naEwOlWmMp/FKM1uoAgdOtsQ2glE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783636797; c=relaxed/simple;
	bh=VJr2INg4jEqwSCbw/hn/HQoonlM0VFrmN1KP5PBUmDk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qqtvtvY6vTDxPSsM0ncUpFz11mWQjSctKMiNi9LQ02c/HnFpLD6HwB+csTWmKn+Hm8iRDvAdBau77esoCg0PFLNrczXP8eRCd8F4Fufgk0xn8tQj4k6RgHNFiq2lF81Ovmqw8PA1AEQb0wdqgHdtu8pBIZFYAzgJMogLcrNjm2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TTCN6Uxr; arc=fail smtp.client-ip=52.101.62.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TTCN6Uxr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aW+nRCxg2Xjl/W4q/CVYrxYggIIPB1gqehl1hfZI8WJ02GFd3UDZjokY53vH41ke++O+zCEtViEoBnHT+2+B8RZ/4d6bLoBgg4FEMEZOERLuBHzmye72sAmAyG+AKaRa117yPegq1qIXXPuhFBK1sl8tLIuhh+6ATBkyBr7Hlh9b6+9F9DcZnNuhew5TQANvVH02uUz903kG7dSzbVJ7kdNGCCde9ClGZAJPBxJxBeDo3FJ/AnIXMysfNv0VMSh8WvEKWUY2A5GQG/G1TcSwiLFRFPg9lEtk4VMLjF9hzWD6fkHOnIssKoxsdE+KgzUrhhPr/l0ZuvaWVt0LoTuR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJr2INg4jEqwSCbw/hn/HQoonlM0VFrmN1KP5PBUmDk=;
 b=XvEUZJkLKXBFzrJMxExAa90fPSJ1DDhmSLZRSW19M46aeJZNcGinD+PFP+sxTne9QPi634ButtsixywurrnH+6GXdSGoCRdbIAH9IA2GEoHo1xjsul56cHBUUIFI+tbavCqRYJNzS3bzX+4mVS/ZBNjYm+EQ1ccEMOKkxltNI82o5R1W5kqsd0qbXmVEWJclnSTCIFiQc8slW1mjHLgxK4QK0g6JNcWAgHcghAk4lGdj3/+yrVoozT2AQ6Dr2tJu4ZujYrXHh9Sr4NUV4oyZT3+F8Z74lDyKy4v7BxNewQLfZ5ObZad2UL7V9BALW+F1LA+E6qPCp+TJiyQjGefZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJr2INg4jEqwSCbw/hn/HQoonlM0VFrmN1KP5PBUmDk=;
 b=TTCN6UxrZMtjkGTFw0JkgGIQ60vAtOn0nqHHT/ul2ugafSZ+6ofF1nf5fZeiEzf48GNj19z9ZaCQaYDgGyNAfon6+CYBEMiui+3z3RwwPiBCw59Mn5zflzEvT39HSo7tzZ5i4p4mu1/wx71VC4MVrRZEgwKrHlGeBlEllFJKpTpkWlWAAYfumipz+z4M9YUwmCQzznCGY7hPJ4viiqKIKOeBPfLhOns3J3WpaHBxhs1vjOOlG4lebkPYrAEiPA2zWFZQnG8gCk7lYU9iA3LReh6ngpb+XoHpnM5zDdHaA6x1ADqjMsHv7LZE9o6xl3LK6x8z6iOcduvwlP2FxSugXg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SJ5PPF816B88375.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 22:39:50 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 22:39:50 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, Eliot Courtney
	<ecourtney@nvidia.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Zhi Wang <zhiw@nvidia.com>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "russ.weight@linux.dev"
	<russ.weight@linux.dev>
Subject: Re: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
Thread-Topic: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
Thread-Index:
 AQHdCljkwu1+XAkqMkK4e6h+pSRGELZgDX4AgAQve4CAAEKSgIABP1WAgAAGGQCAAAa6gIAABHAAgAAC3oA=
Date: Thu, 9 Jul 2026 22:39:50 +0000
Message-ID: <e617f2a79322f05aa26d21492954c07f3b1b47cf.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-6-ttabi@nvidia.com>
	 <DJRA02VV16AS.3W0QHW9YYSLXE@nvidia.com>
	 <79b4033973c675355a25d8fcc701cdedf8f30bc7.camel@nvidia.com>
	 <DJTOMSK9WVHH.GA7X7JR0PYIO@nvidia.com>
	 <09b1d5117a38726d216074d7e3d56d4aeaae2bb1.camel@nvidia.com>
	 <4fa55816-68dd-4642-aa7b-c7e6f3d528b4@nvidia.com>
	 <6cb2d2292131615c44e03283092724a11b9e5619.camel@nvidia.com>
	 <fb1d6ebb-cb45-442e-bfcb-73d3ba82fbb6@nvidia.com>
In-Reply-To: <fb1d6ebb-cb45-442e-bfcb-73d3ba82fbb6@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SJ5PPF816B88375:EE_
x-ms-office365-filtering-correlation-id: 6aa2a26d-2f8a-4f49-fed4-08dede0afc91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|10070799003|376014|22082099003|18002099003|11063799006|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 x5dJV8314EUL1lYDkCOsIKNoBQxc3mLLMqb+esoTJiG+lYd9eqIuemete1QuY4TI16M2jKOahmzqYwykOm5BkAeEjHQyUkYyOlhXxKoVt/18qZBpHRBuUzIixSJNvQJLEGHatI9s5rQHOy306A8gPPP63Gcceyz2HLECmsBPLu8oj3kNd2CjHNpMSVEO8PiZatda6UPaUJ4bOb21R/9R9ZjsB06V2mMqgmic3FUIj6FsT/nxaWx5RCBiOvAlIakOiwHR/IkKpIAwdNv7AnbBMabEjHkp3XFlh76OVtrwNZN4kLvbEROFeTeaIJPtVDvuYxM7NPGy4oumS0ljtGVnSjGH/X+8wSn4DpNyO+ihiov40BxG+7v0MEnXYTQ+TmlMhoR0M2IvI/0pVKmR8yDU0LS2ndDPIxXgDIctyjT08MIXT1uS1gfdYKDE+UYMOGrlRaRO64KxVUePkJ+Imgrnc3XPEKSFr20smn3LgZ+0u3jatd+CeQgYzyNEqRVsjhCdRNvWgOThRzNk9Kjuodh0hnwglrfumvhZiQOLgQ9fp5oOtNLGD5X09H95vK/JTsP21BM8G3RKUptTQslcRxpOZenevyEp3odHyz1y+O9tyUMcM6Yx6BFV9TTXp9AoCtvtjbav41P0cFOQVUolVLEbaY/i9tWyiY3Sff1YS2xo1p2EqpiOVn/lLc1Q/nAdeGMJKCilq/4+mzWicooSLIXwuXZyGRIgUGroFvwoLJcPJTo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(10070799003)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTl4TmdYODhFRjhNdS84eHExckU4UGU3SmJmcmQ2OHIza2xqVHNBa0pLVnky?=
 =?utf-8?B?SDF3bTNRNWNxSFRPSGlrRlh0dXM2T3N1MU5LTVkvdnlFd0U4SVVTb1FQL3dZ?=
 =?utf-8?B?WEMrWTliSE5FWUtIdHdHOCtNM2E0bk9YajdROUF0ZkFiTGZLbnBWbjB5WnBS?=
 =?utf-8?B?OWxHWE84VHdpSzlSUXI5b083ditiV0Y3Z3hUL3MrNUVVY0FtOVRrWTJzaU5V?=
 =?utf-8?B?a25qU2FDWUNTQ0Yva2txT3R1RE41NDVUbC9MV2l4VS82cXZLOVJYN0NHUy9k?=
 =?utf-8?B?YzRMRStKbmFhU0VaVmJ6N2kydDF4S3BlM3dtSmJDNGhxUi9DWjhUTzhDb3VG?=
 =?utf-8?B?MnRBZHBaRkNBc2FjczhGL2d0aWo2NXFBNDNwblppeHRsRWJvYjJUNkdLL0JG?=
 =?utf-8?B?RUNFYVFoZUt0aDJ6Rm9saWV6WEU2SXJ3MzV5RVpzT2ZKOEpDcldzcVc5WHY0?=
 =?utf-8?B?SmgyaVhqZnQxM1V5TnE5NjAvZzRGUWdZNkNEblJmYnpYaUYwb0JVRjR5MEFy?=
 =?utf-8?B?bmR2WjhJWFcya2hNTU1FNWwzeUh5ZWw4VkxWUjM1eklOMWFjQ0FsQ1R2QkRX?=
 =?utf-8?B?Mm96aUMrM3JPVG1DZkRDTXZGRkhHOStaMXBTYzREUWlRZzlzZ2U4OWZnN09s?=
 =?utf-8?B?Z05yOVJKLzM4NllyNytrMms5YldXS2VtQnphNDY5SnhDdzNrVm8wQXFqbTdI?=
 =?utf-8?B?TVZ5K3pHeVhFWGVLVk5COEhyQ29zT28xeU9GeHZLY3RTeE96c05Ndjh1ZjRG?=
 =?utf-8?B?SWh4UzJWRHNJb21Tc1RVeW8wMldWZVd1WThaUHZtMldDTmpZNWY3UHFPb2pw?=
 =?utf-8?B?dERvdmtyU2lBTE10NnRBMUNlVWF5OWl6Y2xnM2FoTnJXN29tR0cvc1ZOY3Yy?=
 =?utf-8?B?bW15TlVoR0F6Qncvd1o4UjZFRVcwOFNGL0RLR3dGV1l6ZGc4cm56M0NwNzQ5?=
 =?utf-8?B?NXB1UGxMSGdVR3pzSU1iSCtnSjU0VDNuVVZTN1FDTHdDaFYwcVhnK05nQU9H?=
 =?utf-8?B?ZE9iNTU5YlQxcTM1R1YrVDl0UDlGLzhLYk91YkEvR2x4eWlYOEJ5VUhxR3h3?=
 =?utf-8?B?VVgvYUxyZTJWUVMvVnIrRlIvb2pJTW96dW9MSFNLL3ByKytzU3k4OFhXUC9B?=
 =?utf-8?B?VFVraElqdUFialNkczAzcnJkUG1KQVZrcFpDajBVM2hIbGx4WWZFOW82Q0Ir?=
 =?utf-8?B?d0FGbHZJd0o5dmgyZmp2bDdGUVR6eUFLMCtGY3NsaGhVa3hCcFRPaTcvQnk3?=
 =?utf-8?B?RDBoK1l4Zkd2cHJweFJOV1FWc1lvd1NvbDRZWStEWkUwTVJWMXBUeDZZSHk2?=
 =?utf-8?B?bXNhd1pUckxnTnVGN0FOUnlDZmM1aTNQSVpVaC9NOUNJYjdjciszYjM4TXVZ?=
 =?utf-8?B?Vncrak9FZzhoc0tuYUVvOVFKeHdqMmI1WFdxVDBQem9EVmxESXAvb3IvdEp5?=
 =?utf-8?B?ekJtL2RGM2hlSTh2ZWpjWko1aTZZQnNSbk9UZTF0QTBCaUZUN0oxR3dzWmlB?=
 =?utf-8?B?Y0lLVVQ0WGR4aDJ0a25BYm0xTERIU3RYZFBYU1Y1eHovbmdJQmN1elp3RG1E?=
 =?utf-8?B?ZExKaDFja2REeHZNMU5FeDRuL0E2dk1nTjV4N2x6OG9OL1dkRS9XWkJLMFZu?=
 =?utf-8?B?YzAxRUgrVlo1ZXpjTzdxNlpaa0FrVWtXUFpLT3lKaUpsSy9aa2ExdG9tL0Fi?=
 =?utf-8?B?V3p5c2xvMUVMS3A5QzM2VmkzMithSXZ2dGZLWGZCVnNUekFLYnJsWXZXT3dK?=
 =?utf-8?B?KzkwYzVDckpMZzY5VWlsWElmKzJYcERZbGhQajREMEZWMWJPeEFMbU9DZFhE?=
 =?utf-8?B?TjZodFJHblZWd3lrOTJSTUFTU3NaSDR5R21LWVBDaTBWUEs2cE9ZK3dnQXN2?=
 =?utf-8?B?UjFrTXh0cW9EMUdkWC9oVVNSMUUyTm8raWxkVUxncEtqellCZ1BEQkdCUDB1?=
 =?utf-8?B?Yk5xNTFzT2h4ZHE4OG9SU3BXRk5QY09Dbm5QNWVxV3pYeUhVcTllYitRbktZ?=
 =?utf-8?B?TnAwaVdPUXlBUERHN210aVBkeHE4U0NzbHExVUNVa3B4RkxzbUhzQ1VJOVJv?=
 =?utf-8?B?QUc4TUpTQjZJbG5NTkpOUHVtZmlqai91T1JMbzRGSXhGb0dDN1EzYWtPblE1?=
 =?utf-8?B?N1FOYkxVdVFBclZ4aWR3ellnbjZwMXhIcktnbTBNTm95KzhyTVVtRGNobGJD?=
 =?utf-8?B?VWVkaW1Fb2dOTUU4ZnF3WXNRb2ZLTHVxNU1ySEJ1OWt0WHgrdXJDdXFvRDMv?=
 =?utf-8?B?KzJCV2N6bE16cnFDOXBEWi81ZzUwVVlDcmtCVzJ2Qy81MHFnMnNvaEgyQUta?=
 =?utf-8?B?RC9DMFV1dnpwZ2pEVTZzUEZoNk9tVDlWb1o5bFYwTldCSXJhMFA2NUJ6M1dK?=
 =?utf-8?Q?dJY2BJ/kCcoVwR6V8XxKAbkJdGAqDNqfcWI5GEoWzBQxE?=
x-ms-exchange-antispam-messagedata-1: VG3S5gFm4nEbiA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB5936CFC6EB3F4F98C231195129EAFA@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa2a26d-2f8a-4f49-fed4-08dede0afc91
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 22:39:50.1381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiuMMq0BAh3m55r4iXMBeNc/uEIafDBHRHk43ZiWL+QOtIuAb+prT6b37CE5tMFN57JwWYj+YBYAuQWmDBDEaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF816B88375

T24gVGh1LCAyMDI2LTA3LTA5IGF0IDE1OjI5IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gSSB0aG91Z2h0IHRoaXMgd2FzIGEgZm9ydW0gZm9yIGRpc2N1c3NpbmcgdGhpbmdzPw0KPiAN
Cj4gWWVzLCBzb3JyeSBhZ2FpbiwgdGhlIGlkZWEgaGVyZSBpcyB0aGF0IHNwZWNzIGFyZSBub3Qg
ZnV6enkuIEknbQ0KPiBub3QgdHJ5aW5nIHRvIHF1YXNoIGRpc2N1c3Npb24sIGp1c3QgdHJ5aW5n
IHRvIHNheSB0aGF0IGlmIHlvdSBoYXZlDQo+IGEgc3BlYywgdGhlbiB5b3UgZWl0aGVyIGhhdmUg
dG8gY2hhbmdlIHRoZSBzcGVjLCBvciAqZm9sbG93IGl0Ki4NCg0KWWVzLCBJIHdvdWxkIGxpa2Ug
c29tZSBvcGluaW9ucyBvbiB3aGV0aGVyIHRoZSBzcGVjIHNob3VsZCBiZSBjaGFuZ2VkIG9yIHRo
ZSBkcml2ZXIgc2hvdWxkDQpyZWplY3QgVExWcyB3aXRob3V0IFZFUlMgdGFncy4NCg0KSSdtIGZp
bmUgd2l0aCBlaXRoZXIuICBJJ20ganVzdCBub3QgMTAwJSBzdXJlIHRoYXQgd2UnbGwgbmV2ZXIg
aGF2ZSBhbiB1bnZlcnNpb25lZCBUTFYuDQo=
