Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011066.outbound.protection.outlook.com [52.101.52.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B4E3DCDA0;
	Thu,  9 Jul 2026 22:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635231; cv=fail; b=mg5+1oPV84e1TUKHtUziyXU1ZNRXAuOQjC3kyTkRI0TSIVwkLWSevhP5CEYxEg2xm6nHGD4DBmqndQOzf1Tx+VJ2ZZleCkNep6qCkO7E0yPOh9EVQRff91mL1LFQ0usG/ket9WZQX/SUXPZkrfK5PvCnLUtuL4dM3jvWcyua8HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635231; c=relaxed/simple;
	bh=4UsqQ5cyBIaIAHK0Spdh19MDvvSlGqcfnwvp/9jS07Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l5bPQs+ne+iItdPXAqg8KfcT9AQZIC2LWX1y4FJi1F5Vnp7PTNimPamkOJW7a9CoToVzeWPJAqQySmNKDGOI5T5ACmMxBt4dovEU0h34FMV1W8udKCmFj5/h2HcrXgpDPD78bn8+YFRQamykU1ykQoNs4rvUBH6j6i2jQ3f9q3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qSDEtEZ2; arc=fail smtp.client-ip=52.101.52.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qSDEtEZ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVy+6d8+CpRyFpeVq92W+S3wXDUoFtzxFjPriBDzFGdv/p+PZtI38XYWJjSbl/AmnyQUTNhhCcqLQzXWMc9EL0t3aYiDVcf7F2YAbNHvmQ+W+FJOjV68F2UjdFNmy99wMSjGuznhap+l7RSreWLPucmLD4AkjOeJhlQjdCGiJZq876qHAIAlacKvmC4u42k980oM3wYN6KJl9HOkY6KuqRXW7RLawHqI5bAo5j+dmXZ/Z/rb8YBoZaJi7kxSuMvovCXKCCjkwW2ryZHfrH3NMOL5N+c8cD5NwxJyTG4EmhiYIYg+XQdi+m78XCvMFbqLIHh10nVC2G7ydhpx2E6rtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UsqQ5cyBIaIAHK0Spdh19MDvvSlGqcfnwvp/9jS07Q=;
 b=r123oOMWYYxEKTgXwGRDuNfvgC7/vbDM0agxONFOHl91+rBnn5srLs1/XFeSD/BLDcjP1wihthdn1DTNvP7pcEa8YrXq2dp/TZisUuwGKPSbNFvM8n8EBzAb6sv14ySbTpsdrsrXqc28iZs/Z8X9GVHXwYGTkcBtZ5SLJ7/qgqxPUnJgUUBg+LPebofv7wqXYasEjHOd0eplWKd+FYrxhv8oIYLPlakFlPUZ7+kcw5GpNxyh0Aro/fVsHuKYhpuE/1FvPzmaa+52tbk8N01saIpT1/TD2DLjPXIgTbcmu0SCHirM7dH9GHy4u+0cvqr/Pxjav5OEke7IN6YnwU09vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UsqQ5cyBIaIAHK0Spdh19MDvvSlGqcfnwvp/9jS07Q=;
 b=qSDEtEZ2jKwXLtDqq1gNGvnqd1MlVhbrH5SKFBFyQKbe7bA1AwXhL2O8YkAqDwssyDSDN37/jfp5JQGNzm5h5kGv+x52b1/7o+ijKfdZIsYFJKUjC+3XuJfFMqMxBAQrCqzPAJ+5iOvulbv8D3lB2KkqbJRR8C0Y+rpTQUmVVquiKvRex9BDStEOO34WkSiyd7lI9CbB6ck5kv7+wc9Ms5e7AuTWc6bsoSUGyN9s3peHSGpYo36A0n32y/1Fg+svJ1+3NSRvDKRElYC0I78hAFG9Q6RuSn7fk1Nw6Oj9wFwRcnpS86OTz65ADbAq4Uc21EmaBF3h2zAHIN/ZiI9rVQ==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH8PR12MB6795.namprd12.prod.outlook.com (2603:10b6:510:1c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 22:13:42 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 22:13:42 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, Eliot Courtney
	<ecourtney@nvidia.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Zhi Wang <zhiw@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "russ.weight@linux.dev"
	<russ.weight@linux.dev>
Subject: Re: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
Thread-Topic: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
Thread-Index:
 AQHdCljkwu1+XAkqMkK4e6h+pSRGELZgDX4AgAQve4CAAEKSgIABP1WAgAAGGQCAAAa6gA==
Date: Thu, 9 Jul 2026 22:13:42 +0000
Message-ID: <6cb2d2292131615c44e03283092724a11b9e5619.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-6-ttabi@nvidia.com>
	 <DJRA02VV16AS.3W0QHW9YYSLXE@nvidia.com>
	 <79b4033973c675355a25d8fcc701cdedf8f30bc7.camel@nvidia.com>
	 <DJTOMSK9WVHH.GA7X7JR0PYIO@nvidia.com>
	 <09b1d5117a38726d216074d7e3d56d4aeaae2bb1.camel@nvidia.com>
	 <4fa55816-68dd-4642-aa7b-c7e6f3d528b4@nvidia.com>
In-Reply-To: <4fa55816-68dd-4642-aa7b-c7e6f3d528b4@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH8PR12MB6795:EE_
x-ms-office365-filtering-correlation-id: bedd45b9-0821-4d5b-1b26-08dede0755ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|376014|56012099006|4143699003|22082099003|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 svbtGA5/0QOoXTQ6K9bwP0Y+3gV8qmHsSALZyO98feX8bp+JPBIkYmV3DvyPYHkytT6+QcQlzu+HPG2TperHk5995w/7d9/VEVASZZc/HLi1Tymsw8EpK8TV9SAxhHebd6XOhaqxUZ5kQHvOxcKqPwFLYxM+eCHYmVBaYf72EL2w6uGg3+cE955nr0WL7Wslu0Nvo3luJLV0XuugyXZ882TnRSoYP465whl2V/DMKQL3x3aQO+2yYckg14Ht8eYdY54guuanbKZ8Lqc9yyeO/270yywwrOuEhWnswsxb2HjQnG2ivupE/Oq1I2S9sq4CZiv1i2BXAHjGwxV0cAN9Rwf14/DwlMwnZAxHL2hr67gVq/h8gpFnhvJxAqszUzAlw0fx/LQ+SxvqeG2M9CB//prVkfzTavCdv0VuY1fXdAAN5jKhg+m360fbRV/PPVd0gyXQ8TV/TAC/vXTdGP0S90VNNtd3nRbpwWZHn7vauD3Bj3UjvbA3e3HLy8QbDsr8cwPrdaFzAlUCpCu/1A0cdrXIya3g/n0UOadYyJIJkuMdlMa0qkaWSU7KKkPUY2ISrzSf+urw4bZFq8/8obDaYH69I6Z9PvBcKq7Wv5yBAG0z5Q8W52I8hTa1s3lR/+Zik/KaWJ0BMKpoJiONAv+u0+/CMzhjGaCU9bZnijCWPZcnNj4K6n67XRcGnKcQ/Soept/3WYIsKt7hnKKnS14/5jcXZ5Fr3Y5kgbPgct3ltq4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(376014)(56012099006)(4143699003)(22082099003)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUw0cExDVXEvS21odzZuUzF0TnpEMkljclVPdFFiUHR1cXZIQm9qM1h5SUJh?=
 =?utf-8?B?NU5ZWStHZkhmMUphN0lac25OYW5xRERnV0hqb2I3UHJYVGM4amVSOEZPdmNr?=
 =?utf-8?B?N2tQd3BNaThZNkVkMzNTeHVZcEJqR3Y4bFVVajJzRkpGazNWQXBkbEtKRUdT?=
 =?utf-8?B?cnlyTGZOT1hJRjNKY2ZneFZlbFF0MXBIZkhaSnRGMGY0aTRldDluVWZBMkpB?=
 =?utf-8?B?cGNtbllTamozSFc2WVlpK0Q5VjNqUTdiR1lGVEYwRVdTVHFtdVpSSXZRbVN0?=
 =?utf-8?B?YmhNb0lqRVl0YW1neCtHOVpuZVlxMmVpdWE5WDRRdHF0djI4MEhJUDVXQmZa?=
 =?utf-8?B?eGdEZEJKSzlzVFAvaGhXMWR0bU84dWlQem00cVNSTDFKNTZ2cThBNms5OVJx?=
 =?utf-8?B?d1ZyZE93NEkwZC9CYjhzT3FtMmx6dDU5TlBMYVpHRmNxZVVlalRIaU5GOFBt?=
 =?utf-8?B?ZlUyQ0NmNDRVZXd4RXAybi9vRHBiazFvSXZKc25hQllodnZ3M2s2UDdGcEh3?=
 =?utf-8?B?MnQ1RStYMGh6TzBtWVVsSmIyYWpIQnZrQkJ4ay9TS2psQ3JzUHNzWVJDdkVn?=
 =?utf-8?B?eDc5WkNQL1BoS2pOTmtyUDJ6SWIwRWl2bVl6ZnJibjNVVXFIbzlXdGgwb3NN?=
 =?utf-8?B?ZGZEVUdmSW4yWkRSTHMxMEsrbUFXcC9ZdU1nVzh1amk4VXFoWnRSR000MTZo?=
 =?utf-8?B?VzAzQnVLcXY3L1hjb2lpUGlkL1ZNZjhXOGljRzRkZE82cnFaVjdTRHBtdUYz?=
 =?utf-8?B?SXZkbTZFNWdKbGlpQWNSQ3RLSHdmeG1VYXlOaUV0bGNqVURvczh0cDN3dlUy?=
 =?utf-8?B?NVZSaXFMRmRQNUd1bzJKV0UyblpFbTZVZ2tpeFlmeXV2ZnMwd0w5VEhTbUQy?=
 =?utf-8?B?RXpHYzJCZ0hBbFNybzZIZXBGc0tqQUNOajNldnl5cVNQcFVCRkR1ckdPRU5X?=
 =?utf-8?B?K29TanVXVDQ0dEtQOU1CTUdEbFdrdHJlOEVZZGpLL2hNekNyVlBFNDFiSFlD?=
 =?utf-8?B?elhEMEMwVHlXUWZMQndma3BGazBvcGlTRjEvWWlIRHpENU14M3U3R0lCME0v?=
 =?utf-8?B?RytYNnVOeHVWZDRJRHVPaFZhdFk3VDIwaXpUWTIvYXp0VXM4SlBWeXByeUNp?=
 =?utf-8?B?ZUZUV1VPVFJBUCtrenlsTllWRXpPS1RNR3pnckw4cFFFSDJkRGJwRmFjeGww?=
 =?utf-8?B?L0h5Nkk2RXZFWmZKdHBhbVhQeHZkaUFtNmVDM3VtaHVqeDRLa0J2UFlkMVdt?=
 =?utf-8?B?c2lwd2I5WllzQ2FxK3liZG1SOFFWcnpmdDMzaDVDREl2czh2N20yQjRkckhT?=
 =?utf-8?B?TFliNG10NitKNElVeW10QS8wVEdiNjFsMXRZbnlZeW1IZ1B0ZHFZOWczS3BL?=
 =?utf-8?B?R0Nqcjkxa1NHNDNPMFduR1c0UE5MWndZWWFGeXdhaUpZRjBuUW1qUHVUS0ZM?=
 =?utf-8?B?NWRLQjN2T2dzUkxyMGhRK295dlVsV2w2bXJaMjBURXpQbFhwODk2Y3NEZFJa?=
 =?utf-8?B?VGZwbUpEQS94UkNZWlJabGM5NllvaDdYWElaVUs3bUd4YXFzcm9kaExHbkVZ?=
 =?utf-8?B?cm5OWXg3Tm40QTNabTNhQ21PT3Q0WHYzdG9UK01pUFltTktoNWdQZTZkUnAy?=
 =?utf-8?B?blJ5VGlmbVRRMmRITmNGR1FqTjYwUHIzZnEyaWEzYmRRS3lzK0o4akRFOWlN?=
 =?utf-8?B?TENDeUJaakh4SHdoTmx4VUtJNUVNMmhrTU5Xc2ZQNGVlbGRTejZMRVgwaDYz?=
 =?utf-8?B?V2dsbkliK0o3Y1cvNmRjVHJTbnZHZW51ajRyOUxHOFYrc1ozc3RqQkF6bnZQ?=
 =?utf-8?B?amNQSFlGQk5ReVZLQUtiZkFLSTRRek5sOGFlMjlGa3l6d2YvUXZGc0dLaFhD?=
 =?utf-8?B?cGhiR0N3Tmh5UDNBank5ODBVWS90NXpMaHdQS3l4ekIyR3M1MkV3dGFxWUcr?=
 =?utf-8?B?enRCbGxaQTRkMmx4RERkZVdTdlhSdXV2TnRUUnZXc0FUSlNTNUIySFNHa0t5?=
 =?utf-8?B?dHVWU2psM0xienlhdlBRaHhZTEVYU0JTQlFqRFJlbC91Rnl4RGxIT2tqZC9D?=
 =?utf-8?B?M25jTzl0N1gvckE3bjh3eXJmKzVnRVdMVzhoWlBiaTBkamVjOWNwbUxCdWVp?=
 =?utf-8?B?dHpVZUUrUzM1dEZ4WkxhbHZsN1JYRk55MzQ1MnFDbzhmZFlCK3ZEV1FDMk03?=
 =?utf-8?B?djgyclV3K29KMWd0Q1Y5NUlkTXZxa1ozRHY2dlFYSXgwSUxwa2U5SzJpSVZp?=
 =?utf-8?B?Y25Ia01pVUEvaEpCZm9USGxBMTFPWGtqWDd5V2p4dEJ4VjRpQllZdkVUUGtU?=
 =?utf-8?B?TEM0ak0xU0V5aCticzRtUXVmL1diTkxmdlAwcDlXTGJyNGFKRzJrUUwyYnhz?=
 =?utf-8?Q?uGdg7Ubk10tPE+eZduPIxz8tIjE3pHQUs+YD0nOzRu5RY?=
x-ms-exchange-antispam-messagedata-1: bJVuvlB6DRwCOA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAD872EAB9B80547B4A4C5EB55E42D72@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bedd45b9-0821-4d5b-1b26-08dede0755ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 22:13:42.0944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D0xmDtZyl4QgsLDsXqzX7hzk9ZNjpch8h4NYkVWTJ86KDYngyTpebAfJegEs7M8SXuJrXb0c5modhlpBpYQnaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6795

T24gVGh1LCAyMDI2LTA3LTA5IGF0IDE0OjQ5IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gSSdtIGdvaW5nIHRvIHBvc3QgYSB2NCB0b2RheSBpbiB0aGUgbWVhbnRpbWUuDQo+IA0KPiBJ
ZiB5b3UgaGF2ZSBhIHNwZWMsIHRoZW4gaXQncyBlaXRoZXIgYSBzcGVjIG9yIGl0J3MganVzdCBh
IHdhc3RlIG9mIHRpbWUuDQoNClRoYXQncyBhIGxpdHRsZSBoYXJzaC4gIEkgd2FzIHRoaW5raW5n
IHRoYXQgbWF5YmUgd2Ugc2hvdWxkIGNoYW5nZSB0aGUgc3BlYyBpbnN0ZWFkLCB0byBzcGVjaWZ5
DQp0aGF0IGlmIHRoZSBUTFYgcmVmZXJlbmNlcyBhIHZlcnNpb24gZmlybXdhcmUgaW1hZ2UsIHRo
ZW4gaXQgc2hvdWxkIGhhdmUgYSBWRVJTIHRhZy4NCg0KPiBBc3N1bWluZyB0aGF0IGl0J3MgYSBz
cGVjLCB0aGVuIGlmIGl0IHNheXMgInNoYWxsIGhhdmUgYSBWRVJTIHRhZyIsIHRoZW4NCj4gYnkg
Z29zaCB3ZSBzaG91bGQgZmFpbCBvdXQgaWYgdGhhdCB0YWcgaXMgbWlzc2luZy4NCj4gDQo+IE90
aGVyd2lzZSwgd3JpdGUgdGhlIHNwZWMgZGlmZmVyZW50bHkuDQo+IA0KPiBUaGlzIGlzIG5vdCBh
IGZ1enp5IHNvcnQgb2YgdGhpbmcuDQoNCkkgdGhvdWdodCB0aGlzIHdhcyBhIGZvcnVtIGZvciBk
aXNjdXNzaW5nIHRoaW5ncz8NCg==
