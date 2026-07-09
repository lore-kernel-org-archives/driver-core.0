Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010031.outbound.protection.outlook.com [52.101.61.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614062376FD;
	Thu,  9 Jul 2026 21:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783632673; cv=fail; b=XHTvJ7z4gaBkamcoNPzzQzFKnpKyLiaANuS3kC8wrDY7DUADvU3aQ22ZqAe6P3uNTW5nPB0jwCXgxnOHJGPTiMlAggCiqxfdL6hQxRLEfKxZLDnaZ4F9YE5vgz21Ptwky0b5rh4/f0u1RgrfQdzj+6nHblqIC/bndeye8YDjBuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783632673; c=relaxed/simple;
	bh=woJTyM5kCSvDTIBYgiFk1cTO3N0V/4oKKOoQLvXejRw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HfuNPmFwgSt5jenNZ5+RaZ3qoc/mLS8rc/8pHuuhCzc5fLktrL7+SZYfcEQQI7wxmhjTBxza+zKv5GFhYqMOo9XEbM5mmGhtwT0KHrLu8Vn0dBBQ0HzJ5/q0T5LFI8/evqmB1l4Q8dpxiXbskAn/8zZ/KqnII613vWQR/AJiKdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=raiKAOS0; arc=fail smtp.client-ip=52.101.61.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="raiKAOS0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIaZWpT7Ylx6tMBSoGdfgZ2e6+jJm8wrfM/Qk1nje9ZcAUsPkO/A6OXKYYtHF/1uQII8LFbeooIA+Fs3WAUl6aB4kg0qMTQGOcWZexIYwWLN28j6ozvO12AGYz5ZgUrVAu148c0DbRlbifuHVrRBwtOrlxrzKGOrhCsCc7Q/qGAqATnriJAeIz6BcqXuS10+oKnDhx3SjhHGk5sryShrom+TYeVhuk1/NDXvagz2RjE0sUV9kHdvQVmMLk/0A3lZ4/BPDS+lsGETx2mH+VNsRJl/Y1vQj8NGluHxWju9oRZ5hNeWFMdlG8GHbE+yiG0yAJhAzXOff7dICs+U4Y1r2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woJTyM5kCSvDTIBYgiFk1cTO3N0V/4oKKOoQLvXejRw=;
 b=KfWtBo3Pp3HA9Vdtqb7qdCRUdwqssLKD76CUBdmumwEF7Xt+r/5zRtyY8rexuC4IanoHBPYNGkq11Cz8dzu9fiwjssHNjKECWYjUyqKQzUhudVb44YWvtxkzBCCmGK9ocalmaCPWogwCch6IC6btm8wEqJD70/548zKPIv88Qi0EyZ0/YqmbA2JmE18oo9R4PtoQrLotZmdDGBrDCe6AbUdJxcUZh+5G5G5T2pKzZl6BIfyI0W3UjocQ3hT5pxMnmeMdwDBeT6osSe6Jgxab4Tk3CRS31dU8PPLYU+4pn3XtgfNXJ8U+E0pMBS53DsflEkA/hVE4do6cBAiu9GJDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woJTyM5kCSvDTIBYgiFk1cTO3N0V/4oKKOoQLvXejRw=;
 b=raiKAOS0a3N3MbV/6/U0tPGM0SaG9JXb6fnF44rNh8mGgtDBdAHFd7eGfrWvMmnBcTTPvpbiZ4q5Gn/yKhUGe7yFdn8UmHSUZiWPdChfa6bVtPkC5l45orp1g4gsyD+Ro7Teqk/BGGF3NVNCbje/iWUpefUCBZ0qv7no0ihxwh33Q0XOtEsT6UAsnHbRhnmAALPlhTDY87Y/DvNpve630fHzA7JPHsYVK2g4jSOtZ/y3QJ3SVQwjb41sSll/hqvjo+VaxNIXzkKpGFgruxiHPZmDBA2xjFM8E8CKgOkGxUwtP3b3zABXY/Q3Y3mnn+hyy51SvKc1zJJAfhPDhMP61A==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by CY3PR12MB9553.namprd12.prod.outlook.com (2603:10b6:930:109::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 21:31:08 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 21:31:08 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	Eliot Courtney <ecourtney@nvidia.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Zhi Wang <zhiw@nvidia.com>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "russ.weight@linux.dev"
	<russ.weight@linux.dev>
Subject: Re: [PATCH v3 3/7] gpu: nova-core: transition booter_load to TLV
 images
Thread-Topic: [PATCH v3 3/7] gpu: nova-core: transition booter_load to TLV
 images
Thread-Index: AQHdCljpxvZDldRo4E6Wped2vogXPrZgDXWAgAQTroCAAHaYgIABKBSA
Date: Thu, 9 Jul 2026 21:31:08 +0000
Message-ID: <a689baa4d9aff1d93b89d0300382c5f18de5f13f.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-4-ttabi@nvidia.com>
	 <DJR9ZZLA72BK.G14HXKV5E8LP@nvidia.com>
	 <a3b7dcc404d857531972ac52623e63620d117cc1.camel@nvidia.com>
	 <DJTQH2CGKDMW.1LVUEN7V32OK8@nvidia.com>
In-Reply-To: <DJTQH2CGKDMW.1LVUEN7V32OK8@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|CY3PR12MB9553:EE_
x-ms-office365-filtering-correlation-id: 96642a23-3a01-4c64-8129-08dede0163a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|10070799003|366016|18002099003|22082099003|38070700021|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 3vftm3bsrJ1WalPYrEnYbyYCrR2mG4i0ib2rhlI9/MyrrUiNGDa8Fn9MYEvi4o1MAsuKaFFnwOUIWi+x74hT8AkcFMmKVcHsitqrrcyQjyE8tSYyUM8JAgHF4q1vBUH7a+WsR6//vGMSkqLL8RKKFO0+sEw4KF+4/ed7cJZqXUgpZPCXwwoTr+k0U0CQrYYbYE8UywsqmA7n8gufCGcX7MYsY3JUjfDIo+5GM4wTDY5g15RsvgsJcQFarBX9IL52LpT7azt0qS7Qv/1jYIlfx5yDfGVgUPdIoEsYinvZSLnR7EXh7C8vRmANqBcEyVRi6cKlTvsxG7KZyj9q0TJGuBG/5HSasssBbsMA8/R2L81w3jNGBuJUbh/aGss0KrLzbutAIrU0QiUHCfP1e9XAS4eXbLqpxRFZML2vLYBEvzoFziTINjIQ3Eim1hjvUGpaF/qaKgsbTj445Q7ZUzEo4rYSikC50GLQW5hjm68huWnCQzRoy4xjbKBlLD/OswQ2XnK/c/EJdRdhJOxvqmzpZIqcbJy4IyIib+INiiPoalpvwTf9eSCVMUobUMMQ9lfEQ7VISOhgkDdzvOvDIo7ww5OW0NL93AGj2tVqpCnFBAPBgqJxqm/3g9N2RxPZ16CQ9LwH15ohiqEcfOZ1BNaVmcHHdQTgtW1+XYkKpP9oQmnUhLLip6ngoKw+7M/dyHvp7Iqt0aooIhZ1wtUNOBXD2H7AN3keKmx1PX7D4y7tF/U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(10070799003)(366016)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3VHZ0VFL2UwS0NqSjFOWEZTZm5LOXFWdHpXTVF4ckw4ZXJjR0VSOHBlL1l4?=
 =?utf-8?B?eG9uNVJRVmREc0wybUhSMlBoSHB0MHdhYmFtL2x0M20va3FrTmtwMnlWK2cr?=
 =?utf-8?B?N01DS3NDaTZtT0wxRFVQSXY3MitJL3RDQU03endHM0duV1JVSjU0RXBNeUhU?=
 =?utf-8?B?c2VIZ0toR3F4TG9BZjR3SkhyTjNXblVpVVowcHd6L0NlYVpPQkVPdWhSYnVK?=
 =?utf-8?B?bFFqbk5ydVlaMkFUOEhSbXF5YVk1cGlsKzFyOFZBdXEwbVJQRUtSeWVGTW1s?=
 =?utf-8?B?UnJ0WU5wQ2UrckJFRVFnTlc2ZjJrYzV1NHI1MjExZm1MSlBrWlN6RlA3U0Z1?=
 =?utf-8?B?SWZHZWUvL3VaSTBRQTRmcm1oTTFESGswa2NLeE9lRDhyaDZJNkZRUlBleVRh?=
 =?utf-8?B?bFFqL01tS2FVT0NlekttUFFzK3ZvZmk3V2hqSVpzNjFXczNMdCtZZDExVSs3?=
 =?utf-8?B?MnNXNjhRcDdmY0s2b3BjbEV4dkdwTDZtaEtlS0ZUQitIZTR1K1FXMHExZ3pQ?=
 =?utf-8?B?ZjFJT295Qm0ybTZ5L055MFJ1ZFpwZ1VvSjVPakJQRTQraUdVK0pLKzQ3NGxm?=
 =?utf-8?B?WVVQNFpZZkw4eWRyNytuNTVLakxYZi9PYnJid0MyT2JSWUFhaHJXK1p1UW5r?=
 =?utf-8?B?MkNLZ2hSMzF1cE5MUWhSWnY2Wmtmc0JIMHJaWkR2Rm4rb0F1TjJnaFhWRU05?=
 =?utf-8?B?TjkyTXJqQVNXUElQTWtLUGNIdk81aEl3RXdyZWJIcWZyd29IaExNa3pwSHFl?=
 =?utf-8?B?cklZa3JBUmFQVW12TldZOXBLaS9ncUNtcDZIWjZzOUVveVZabDdyNmZDeEVn?=
 =?utf-8?B?Tit2NDBpRWpwbWFCNkdSMGNsWnlOdWRQVEJ1MGorS1pCd2xXdnJvNHJGbFRt?=
 =?utf-8?B?MEEvSjZhUjUwQ1ltTW9ESEZ4dXF3ZmFtMFFybjZHQThwZ0lxeDJhUWJiUlky?=
 =?utf-8?B?QWZuOVIwYXlJVU1QWUhQZ2R5Zk94V1dWM2JHZmdtd2lJbm1EWEViNEtYclcw?=
 =?utf-8?B?b3cxL2I0NG4yUktlMzFxTEJ1YmlsaVhRYUdTTFVKdXNON28ySElnZFV5NVZL?=
 =?utf-8?B?eTd3WVRxeXk3ckJidkF3bWNMYU1qWGMzU2Z4ejh3bFpVUTZvL04wZ0F3NUtJ?=
 =?utf-8?B?eXEzbnI0T0xYTTIxYUhLMTRLZlhhVjVMTmQvRlRpTE15czdaSXVEYTVUYWVZ?=
 =?utf-8?B?RjMxUC9tM3c1NmZPUVR2MzZnejVOcFhBRFU3K0loMUZTZHI3MlNER29aeWpJ?=
 =?utf-8?B?TC9xbUFxdXFqZ1FFVDFUa3QrMno4NnJDSFRqOFB5RGFwVmtrcytkU1VEWEY3?=
 =?utf-8?B?ZndaQWhhTEphVlVxZENhZ3kwUmRVSncrTDMrUVY2MU9tRGI2aGdLZGRuajNa?=
 =?utf-8?B?bTNsZ2MxZ3d6bS9DWHRKVnVuTVducTdMbXBhUHRLc1d4Mm9mU09WSDNRbXBY?=
 =?utf-8?B?cHBKeDUwMUVXSFBjZGpOTU02Y2VUc1p4aGNBelFENFprQVRlckVvQ1g2cEtY?=
 =?utf-8?B?R2R1WHh2WTNwTXBGREJqTWpVaFlEdklzNnB3UVA3dGFybFFuTytTc1VHQ0Nl?=
 =?utf-8?B?SDBiV1hJNHE5OFZSZEs1OXVZTnRMenBZQXVmMDQrK0JYQkp2VGYza05JeU1L?=
 =?utf-8?B?RG5LajNRYjU5VkVLd05EY2tna29DdzZNVGNtdFlYbnkxWFNieHlHcDRrMGRn?=
 =?utf-8?B?VFg2WFBEZkJlU3ZqK1V1K2plRWdJdDNWay9yZzRrZ3JHNXpLOVpHWWFSc3ZP?=
 =?utf-8?B?ZmpHQkJSUlBWRi8xMkw2NTVCN3FiSHNkSjQxNzVtRjBjQnJSUnl1RWU2LzRp?=
 =?utf-8?B?aWFDK3cwdDRRRmhaZUN1Yjg2QVJpOHdTSkV4NWZvWDdiNzBLSllQcXNvcGxq?=
 =?utf-8?B?eGw4ZHB2eTYrVzZVM1lJSkh0TFkzZ0N3eFBndkdoclFZNVNFU2IzL2pWbHQ1?=
 =?utf-8?B?ZTRUOHRydHZvU1FLT1JTaDhxVWsrZFRHczQreVJRMHhIVm1EeW9zZ0d0dU5R?=
 =?utf-8?B?Mm80Wi9jQWhTOW1HVWZkd0gvL3BvdzNZdUk4QmV3RjZvc2dJTlAwQVRrTThj?=
 =?utf-8?B?blNheXFvQkhhL2lCbld3UTl6VVFaUlI0ZDVzQVZOQVU0OUppZ0hLcWNFT0pW?=
 =?utf-8?B?ZVltZVEwNy9zN1NsNk15R3RrS00xa3g1OFRCRXhwZlFTenpCN09YVHgvY1ds?=
 =?utf-8?B?alBkNkZNNDUvNWdHS29PVmJURjlDTEUyQUVacW1ESnFrWlFjTmpOYWcwWlgz?=
 =?utf-8?B?SmRNaFQ1N3hlNGJEeUhIWisxaXRoSUw1S0RJcjB2bVdPemRwek4yMmRJd0xV?=
 =?utf-8?B?REo3WG4rQ1BvZnFWbGpKaVExVTcyWWttZ2hDZjNXaGpuak5mVmZ3ZnovY2E4?=
 =?utf-8?Q?hOKq2ZCwv9I4TtF8sZC/Jne/4/D6F7N5cl80Vtv668x8M?=
x-ms-exchange-antispam-messagedata-1: 5p6V9NHXorw9Og==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C92C7583E5B80419C058DA48E8457D2@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 96642a23-3a01-4c64-8129-08dede0163a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 21:31:08.0595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSbOsiSGVXVctEXZc+kMWKzlYEVIqxZcK9mnO76wLBouKS23b6wleU4UsI7CPiCH4O36Xd0fEn/cmmENn5sYHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9553

T24gVGh1LCAyMDI2LTA3LTA5IGF0IDEyOjUxICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBUaGUgLnJzdCBkb2VzIG5vdCBtZW50aW9uIHRoYXQgQm9vdGVyIGlzIHNpZ25lZCwg
b25seSB0aGF0IGlmIHRoZSBmaXJtd2FyZSBpcyB1bnNpZ25lZCwgdGhlbg0KPiA+IE5TSUcgaXMN
Cj4gPiAwIGFuZCBTSUdOIGRvZXMgbm90IGV4aXN0LsKgIEFuZCBzaW5jZSBnZXRfYnl0ZXMoKSBu
b3cgcmV0dXJucyBFcnJvciBpZiBTSUdOIGRvZXNuJ3QgZXhpc3QsDQo+ID4gd2UNCj4gPiBlbmZv
cmNlIHRoYXQgaGVyZS4NCj4gPiANCj4gPiBCdXQgeW91J3JlIHJpZ2h0IGluIHRoYXQgaXQgZG9l
cyBmZWVsIGEgbGl0dGxlIG9mZi7CoCBUaGF0J3Mgb25lIG9mIHRoZSByZWFzb25zIEkgaGFkDQo+
ID4gZ2V0X250aCgpIGluIHYxDQo+ID4gLS0gdG8gc3RyZWFtbGluZSBnZXR0aW5nIHRoZSBudGgg
c2lnbmF0dXJlLsKgIA0KPiA+IA0KPiA+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGFkZGluZyBh
IGdldF9zaWduYXR1cmUoaW5kZXgpIG1ldGhvZCB0aGF0IGNvbWJpbmVzIHBhcnNpbmcgTlNJRyBh
bmQNCj4gPiBTSUdOLA0KPiA+IGF1dG9tYXRpY2FsbHkgY2FsY3VsYXRpbmcgc2lnX3NpemUgYW5k
IHJldHVybmluZyBPcHRpb248Jlt1OF0+ID8NCj4gDQo+IFRoYXQgd291bGQgbWFrZSBzZW5zZSB0
byBtZSwgeWVzLiBUaGUgY3VycmVudCBhZC1ob2MgY29kZSBpcyByYXRoZXINCj4gbWVzc3kgYW5k
IGhhdmluZyBpdCBpbiBhIHNlcGFyYXRlIG1ldGhvZCB3b3VsZCBkZWZpbml0ZWx5IGhlbHAgd2l0
aCB0aGF0Lg0KPiANCj4gRG8geW91IG1lYW4gdG8gbWFrZSBpdCBhIG1ldGhvZCBvZiBgVGx2YCBv
ciBgQm9vdGVyRmlybXdhcmVgPyBUaGUgbGF0dGVyDQo+IGxvb2tzIG1vcmUgYWRlcXVhdGUgZm9y
IHRoZSB0aW1lIGJlaW5nLCBhcyBBRkFJSyBCb290ZXIgaXMgdGhlIG9ubHkgdXNlcg0KPiBvZiB0
aGlzIHNpZ25hdHVyZS4NCg0KSXQncyBhIG1ldGhvZCBvZiBUbHYsIHNpbmNlIGl0J3MgYWxvbmcg
dGhlIHNhbWUgbGluZXMgYXMgImdldF91MzIiLCBidXQgc3RpbGwgZGlmZmVyZW50LiAgSQ0KYWRk
ZWQgaXQgaW4gdjQsIHBsZWFzZSB0YWtlIGEgbG9vay4NCg==
