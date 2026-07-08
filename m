Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013011.outbound.protection.outlook.com [40.93.196.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC8F3E8C5A;
	Wed,  8 Jul 2026 20:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543631; cv=fail; b=A7OKpr7CZKlao3TjWHFBWaROaTIgTe0vRFwiE0iEIacwFoSh3Zaa4U0jJkNCORnwAHAH3czBurmFSlbvvSvOiH+iw/7D3dq2ewX4dk8czN+kTYdkMNGFiLyIcIv5L5j2cd2CKiyig+7y5VKA/8lJeWv/FLobO8maEdu+biBIoTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543631; c=relaxed/simple;
	bh=dGISLi4HVe9k2HXAX4SxTvL+XW87RRg/64v5Su1x2rM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fszxwXcyfhDGli5ri/k4ipUeO7N9nhzMFBSrUKUzkNe3efYvaTKGWjod4qM8m49/QBC6A7b1eIMkCfLgEP5Li+gqvk6i1kez9nv0TxXHgPJ+EwQmO4nl0nALbIxsSdMdxmRGF9DgWkYedb5m1Ym3doQ7SMxk6CBTdSLkHc0arTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BtSf+3L/; arc=fail smtp.client-ip=40.93.196.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BtSf+3L/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAeFZHINTW+Ev8A4vh6E4yEdq3toaUHvEJ/MNi8DoAIkGRNpQavZuf0A4bB/rUoJknjDtenYuDRKgOib4MMJygDZHeUhDidSAG6tuZ9A0G5lRboByZ5ZB8NszrZ7uNbHxDRumpSJd+mkdgWXUscGZvB8ZkE/IVzUE8SqJ1i8l1pIXXd+xGGQXblyKTOWE6a5ED5PypQ1qblF/EbypNwYuOPpas+x0WWIz5kys9DFMSiPmt01UPn2zyUYLHEW0O7uAd+HD6w1fvvCrCR9N49AxFSiiDokCC/8zp1Z5NrNUhHM8kjKm5n/3M8LSagY7CgftTGuzSM7/5p4TNLeL2b+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGISLi4HVe9k2HXAX4SxTvL+XW87RRg/64v5Su1x2rM=;
 b=YkA+jmaqd/deqSrNcb08M1BQlLYWhXFQm9AG/i6Bf0yFrw4uxxSB1iViOrCiNH05X9ssJ9VDEHinnqgn4SbjECFRPCWx5QoCXSXIss2MWY/DvyHOdtJteqweCzs4+jMqHBso52NvPEUkEnl7JLYHMQUZaxGH1Uqd/PhEh5q3oRLQO8XwexpYnaQO/jOLyWhXLuY6buwGSQgLGVgrtS0qkjKiAt2c/O+jcw8X7EmxcbusfZTc2AtJKf95hORRQQG3ZMRsemYCdC0tv1e0uWn+z2UQPfIwfhwNGwhwS6J2zedDjwFY3E5TfFHIeQhiY8ogEzyHaWMo/Hhg5YnkSszQww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGISLi4HVe9k2HXAX4SxTvL+XW87RRg/64v5Su1x2rM=;
 b=BtSf+3L/M/xkzftvRC+3hCjKgghjkbFBUcUlZoPDYWvd0KEuGoTjPnvPMOwfb1UFNXLcnnkDseFShKsgKV3wuMu3diA/fhmmN6UsLBB+me7luZu0gDy5R9tgdnvXwhfCXtkEDV+Q+QrjjAUp8LUFxKtRW9pQ2kv8m3krm/LRRR2vCt5UZvS3a6bPWu4DvdTFrGZD3NY7gpbSa4k6tB9npGyGl1XR4ZHw5ShVAgJLqVJPK4PDFQOvPGQ9or0WHxO8uxtxPjmoW1S+B5a9rb7/p9VC8FcYU1c0oFV2aeww433LGNc1yMcX2MdZbHzK7CBgqy8STQGD5tplcpuvwTYgeQ==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Wed, 8 Jul 2026 20:46:59 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 20:46:59 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: John Hubbard <jhubbard@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Zhi Wang
	<zhiw@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "russ.weight@linux.dev"
	<russ.weight@linux.dev>
Subject: Re: [PATCH v3 3/7] gpu: nova-core: transition booter_load to TLV
 images
Thread-Topic: [PATCH v3 3/7] gpu: nova-core: transition booter_load to TLV
 images
Thread-Index: AQHdCljpxvZDldRo4E6Wped2vogXPrZgDXWAgAQTroA=
Date: Wed, 8 Jul 2026 20:46:59 +0000
Message-ID: <a3b7dcc404d857531972ac52623e63620d117cc1.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-4-ttabi@nvidia.com>
	 <DJR9ZZLA72BK.G14HXKV5E8LP@nvidia.com>
In-Reply-To: <DJR9ZZLA72BK.G14HXKV5E8LP@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DM4PR12MB6446:EE_
x-ms-office365-filtering-correlation-id: b86b31cb-b369-4530-d7d9-08dedd320e61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 p05nSOh3cXppfaoAq0FgraKL2862ETiAuFo1Av/GKXvs380x3ggRE26zd/Z5du/OGbwRjvDa7MXBPbZ+BSOwRq/Vjfn4HBV6EpFP8MRPx5Y5UC+b8nc7/vIdXZCbSYF8mdY4O37zVFpLBbt7BpwvTM0jV3T2Yg9G3LO4AqRfMgufksIGiVFInPNzhT2GMkJ3oK7Dl81j864amwIYxXzkVIPgJdmWz8ZfI7cCxVNsRgbRSUxlmK7VOJffljeYqFA0WCa/nKDGRjgLru/xxfKMjgl5xM49mTaBSxtCeiGRQxqYcquHBwGkMlU8tUBBsqXKvjw85b3VoYLEZoujzVDTkc7P1wVr44qZiSxJy2bnTP+a2XPHQg/oHxiV/fJiFEFscihBF5g2HSyGNscJK4X3p2pBcY41QM9USVZJpt9BIv0Fn4wWjB6vzDJ2EfLnQ+ka1YhY9EWPYQxZ7AqdAfDoGtCgjx8thgpHGCvz8TO/2NfLviN/S1k3RDeh35ynsFZx3qUMEprwDcRxG/sMMqZQQvwoKEbl+Unnj3vrfbse9yUFYn0KlgpuaKIGpDNNVWlvDu+8W9DBdbtTnGcvO92mtICa4SbJFZuV/IrZ6lHDj+gTW66S3d39YcP0vp4K+HoIyDmfh2BujXwt2KbTOX9zYZtVA5il5xg0nkSC9qX8kKXJTtvn5kLsD8hclb43LmL+4iyZoqv7rTld71j5TOmH10we4ZtOL/XiFFqXnFpAGCo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjhjOTZSeXU4VmJlM1NhS1p4dXZuMTQwV0phRmlkbWpzcmxpSXBXSlFPcDhr?=
 =?utf-8?B?OVI2U251U0JYRmlJc0pKa2xLeTRmSkVwSDlYT1NTMU80aVRkblJnMmMzcTl1?=
 =?utf-8?B?cklCS3lQdzd1UnpFdUg3V3V4WUVqaEZyZ1Ryck56TkVuZWJUMlkxM2NTU25K?=
 =?utf-8?B?Z1RnajczSXBJdVBDenp1QmlrK3poK2NvQ2xSZ3o3Y0lzWnlNMVlsRUhGb3h6?=
 =?utf-8?B?UENKWHFUMlZZM3VCVkNla0d0eS8zV3JTYmlBL0taQllaZXN0NkZ2RmJXeTVu?=
 =?utf-8?B?VklKMTlYbmlhRTBHeW5Rd0ZUTnBoQk5Yb0dqQXBiM3lUVGxYTlJqZmtLQmFH?=
 =?utf-8?B?OVlHRUY1TjhmQ0F4K3FaZlF3aktacXpxUGpaT0xzVUZPTFhLemk0cDdlTmFY?=
 =?utf-8?B?RGFWWUhtb1pWNUgwbFhvajR0aklNeEJOd3RZTlByWmwxRkxXODJyQmZCcnRy?=
 =?utf-8?B?UUx6QXNXZkNpN2lpMlVubFpZSGFKdUp4UFIxQ0h0OVdoRzZWdm9ib0RpS3c0?=
 =?utf-8?B?aTQ5NG9jRmRXZktTYjcwc1VTL2lTOWZhSUx6ZUpUQ0hFUlYyb0xNWGVYN2Iv?=
 =?utf-8?B?RVlPOWZOc3FOTDF0Q0VRakMrQ0QvcTV0bTZBRkNtaFRHeUN4TlU5RzRlSVNO?=
 =?utf-8?B?NmRXVmlVM1FSOGp2eVlHUWpKU2M4WnF6Tk4vY3M5M3FaZy81VnhYdzEveHZK?=
 =?utf-8?B?cDBxNEN2ZzZQbWlCc2Roa05YV1RUTXgvVUhPNHNoZUNHOVdWOW1TL0VmYlh1?=
 =?utf-8?B?WXhyejJhTHR2SUdiV1ZQUlUyWk5lSFByVTZ2cE43eFgzQlpMRldmTmt1azdJ?=
 =?utf-8?B?MGRxV2wwZ0d3Y0F6cVZMckRQTHFMSCtaUzA4WFBNeEdmb2k0TUpreHhEZ0F2?=
 =?utf-8?B?REhXQW5kSXpTaTFyTXJZQ3UxMDFPM25WZTg2cG1wWlJ3Z25yUTFQOGpKT0o3?=
 =?utf-8?B?b0luTEJ1ZVprWStQV1RBV2lsMndCWERaL1ZzRWQveVlza2ozUEF3SUFiT3hu?=
 =?utf-8?B?dmZSR3pQWDBKTXQyZldCMDh2cmxHUlZlR1J2UUpkZ05PRWZJT3ZXSUxMUXh0?=
 =?utf-8?B?VC9qQy94eVdCQ0tsYWtPeGdWcGgrSmY5c1M3Y1RwSGFHRGNobEpZRURkSnI3?=
 =?utf-8?B?VHR5Z09pT2xMZWhMcG5vWDY1TEt2QVBzclQ2b1FNUlo2NGdrMHhucks4OVQz?=
 =?utf-8?B?ZDVMU2lYK3YxNTlzU05aRGZzRUZqR25kdG1yUFpmUm1IL3hROGFjeThvc3pv?=
 =?utf-8?B?YU41WDZoNldYTEl5TTk0cWtxWnVQTExpdWltUUdvOThRVW9hVy9wdHFoQ28w?=
 =?utf-8?B?M2t4MGRSNXFTdDNpQjZjSXhSc1hUQzVmamlHZjF5NXM4Yys1eGhyVlhYN1Rs?=
 =?utf-8?B?cFZYbmMzWExNTWM4RkJRVm41WkVyaG9JVzNPR0VvSlp1U2IzZXc5Q2pUbENi?=
 =?utf-8?B?RS9GWUwrbGtBc3ZiQjRSdVpETlFtYWFYckdsejJrUFF2NEU4U1NOWlFqVm9Z?=
 =?utf-8?B?ZUN3cE5jdTZoOVRWQlBpaW1zMCtPam9tN0xLNGUzRzRvOVFuYXQ1QXRDSEVX?=
 =?utf-8?B?OVhQd2FoN2pzOXRDT0ZMTzk3YWpjcm56WUFJNjhKWCtWNGJvRUY1Sy9GTXBU?=
 =?utf-8?B?dEtraXpIUmhGbStYZ0RUTUFmWDZua2VyZW1nWW1JRlVWMlF4RUoyazM0SHFv?=
 =?utf-8?B?ZjluZ1lULzJnSWtsWUFqMjhzMkszMSt2S1NzTkZydXMzamVVSzRRKzlxVDhV?=
 =?utf-8?B?K1B3V0diM3htSFpodUpiY0ZFMVp2TTRaaFM2SXIwb09nd1R4cGNmaVV4N3BQ?=
 =?utf-8?B?ZVo1OGdPVG53VXBZMDNkcjJSY1c4bGFFRStRa0dmOEtyTlN5OUtZejY4b0Fu?=
 =?utf-8?B?c2doeG53Nyt6M1FWMkhMSkhaa0ZXU3dBcEJ2VmJLeVdQaENrc2d5Y3dwQlRO?=
 =?utf-8?B?czMvRDJVa3YyYmRwWVVyRktrWkhQTVZLYXQzNEdJRnk5YjBuWHNoREJxekFQ?=
 =?utf-8?B?Y2tsV2Y1WkZVRTB5M1I0ZFNzd2ZPRkNGM0N5R1IyOTJRSHZOUjlNeEtnbnFo?=
 =?utf-8?B?eTJkY2RQUFd2bGFWRGxOdjVYekxpWU9pVFp3V0ZuTExkY1BaQk9BZXJsY0Ny?=
 =?utf-8?B?cTZLZUxVYlJodkFKb0dJN1FsME1RbmxLdkErNzZPRDV0dlFqM29Rd1BWU1V4?=
 =?utf-8?B?dUU4dU5NL3I2Mm52UHZQdkZyUndnNDZscWlNcjV6TmFGakloV09XZDd4RXU2?=
 =?utf-8?B?ZnZuSSsxaVV4TUIweGJHd2pEMWZCYWx0U1AxYkVnbTJEVWJ2Nmd5Y01MRWQz?=
 =?utf-8?B?VDZkSTZPWXR0aXBTWThWTnR5OHhFanRlV1J5bWREUTZoajROM2ltdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1288E1F5945AF7468B6645591045F0D4@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b86b31cb-b369-4530-d7d9-08dedd320e61
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 20:46:59.2342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xo9ZTizN3DUu9rjYbXCwHc8qwj7CcxqcqYoSGUNDsve77SwwmHrw9ia7gHKGJy8B+inzKsCY133lEZXu9zJtMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446

T24gTW9uLCAyMDI2LTA3LTA2IGF0IDE1OjMxICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGxldCBvc19kYXRhX29mZnNldCA9IHRsdi5nZXRf
dTMyKGIiREFPRiIpPzsNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IG9zX2RhdGFfc2l6ZSA9IHRs
di5nZXRfdTMyKGIiREFTWiIpPzsNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IG9zX2NvZGVfb2Zm
c2V0ID0gdGx2LmdldF91MzIoYiJDRE9GIik/Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoCBsZXQgb3Nf
Y29kZV9zaXplID0gdGx2LmdldF91MzIoYiJDRFNaIik/Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoCBs
ZXQgcGF0Y2hfbG9jID0gdGx2LmdldF91MzIoYiJQTE9DIik/Ow0KPiA+ICvCoMKgwqDCoMKgwqDC
oCBsZXQgZnVzZV92ZXJzaW9uID0gdGx2LmdldF91MzIoYiJGVVNFIik/Ow0KPiA+ICvCoMKgwqDC
oMKgwqDCoCBsZXQgZW5naW5lX2lkID0gdGx2LmdldF91MzIoYiJFTklEIik/Ow0KPiA+ICvCoMKg
wqDCoMKgwqDCoCBsZXQgdWNvZGVfaWQgPSB0bHYuZ2V0X3UzMihiIlVDSUQiKT87DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgIGxldCBhcHAwX2NvZGVfb2Zmc2V0ID0gdGx2LmdldF91MzIoYiJBMENPIik/
Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoCBsZXQgYXBwMF9jb2RlX3NpemUgPSB0bHYuZ2V0X3UzMihi
IkEwQ1MiKT87DQo+ID4gK8KgwqDCoMKgwqDCoMKgIGxldCBudW1fc2lncyA9IHRsdi5nZXRfdTMy
KGIiTlNJRyIpPzsNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IHNpZ19ieXRlcyA9IHRsdi5nZXRf
Ynl0ZXMoYiJTSUdOIik/Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gQm9vdGVyIGlz
IGFsd2F5cyBzaWduZWQNCj4gDQo+IFRoZSBgLnJzdGAgZmlsZSBtZW50aW9ucyB0aGUgbm9uLXNp
Z25lZCBjYXNlIHRob3VnaCAtIHdlIHNob3VsZA0KPiByZWNvbmNpbGUgdGhlIHNwZWMgYW5kIHRo
ZSBjb2RlIG9uZSB3YXkgb3IgdGhlIG90aGVyLg0KDQpUaGUgLnJzdCBkb2VzIG5vdCBtZW50aW9u
IHRoYXQgQm9vdGVyIGlzIHNpZ25lZCwgb25seSB0aGF0IGlmIHRoZSBmaXJtd2FyZSBpcyB1bnNp
Z25lZCwgdGhlbiBOU0lHIGlzDQowIGFuZCBTSUdOIGRvZXMgbm90IGV4aXN0LiAgQW5kIHNpbmNl
IGdldF9ieXRlcygpIG5vdyByZXR1cm5zIEVycm9yIGlmIFNJR04gZG9lc24ndCBleGlzdCwgd2UN
CmVuZm9yY2UgdGhhdCBoZXJlLg0KDQpCdXQgeW91J3JlIHJpZ2h0IGluIHRoYXQgaXQgZG9lcyBm
ZWVsIGEgbGl0dGxlIG9mZi4gIFRoYXQncyBvbmUgb2YgdGhlIHJlYXNvbnMgSSBoYWQgZ2V0X250
aCgpIGluIHYxDQotLSB0byBzdHJlYW1saW5lIGdldHRpbmcgdGhlIG50aCBzaWduYXR1cmUuICAN
Cg0KV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgYWRkaW5nIGEgZ2V0X3NpZ25hdHVyZShpbmRleCkg
bWV0aG9kIHRoYXQgY29tYmluZXMgcGFyc2luZyBOU0lHIGFuZCBTSUdOLA0KYXV0b21hdGljYWxs
eSBjYWxjdWxhdGluZyBzaWdfc2l6ZSBhbmQgcmV0dXJuaW5nIE9wdGlvbjwmW3U4XT4gPw0KDQo+
IA0KPiA+IMKgDQo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIFRoZSBzaXplIG9mIG9uZSBzaWduYXR1
cmUNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IHNpZ19zaXplID0gc2lnX2J5dGVzDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLmxlbigpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LmNoZWNrZWRfZGl2KG51bV9zaWdzLmludG9fc2FmZV9jYXN0KCkpDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLm9rX29yKEVJTlZBTCk/Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAg
Ly8gRXh0cmFjdCB0aGUgbnRoIHNpZ25hdHVyZQ0KPiA+ICvCoMKgwqDCoMKgwqDCoCBsZXQgc2ln
X2NodW5rID0gc2lnX2J5dGVzDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNodW5rc19l
eGFjdChzaWdfc2l6ZSkNCj4gDQo+IEFzIFNhc2hpa28gcG9pbnRlZCBvdXQsIHRoaXMgd2lsbCBw
YW5pYyBpZiBgc2lnX3NpemUgPT0gMGAsIHNvIHdlIG5lZWQNCj4gdG8gY2hlY2sgdGhhdCAtIGFu
ZCB3aGV0aGVyIGFuIHVuc2lnbmVkIEJvb3RlciBpcyB2YWxpZCBhdCBhbGwuDQoNCnNpZ19zaXpl
IGNhbm5vdCBiZSAwIGJlY2F1c2Ugb2YgdGhpczoNCg0KICAgICAgICBpZiAhKDEuLj0xNSkuY29u
dGFpbnMoJm51bV9zaWdzKSB8fCBzaWdfYnl0ZXMubGVuKCkgJSBudW1fc2lncyAhPSAwIHsNCg0K
TmVpdGhlciBzaWdfYnl0ZXMubGVuKCkgbm9yIG51bV9zaWdzIGNhbiBiZSAwLg0KDQpCdXQgSU1I
TywgdGhpcyBqdXN0IHJlaW5mb3JjZXMgdGhlIGlkZWEgdGhhdCBJIHNob3VsZCBhZGQgZ2V0X3Np
Z25hdHVyZSgpLg0KDQoNCg==
