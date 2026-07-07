Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637213793CE;
	Tue,  7 Jul 2026 02:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783393014; cv=fail; b=g02SmdYDDV86+zxkiDqSjuC6NOriGvy/pmtj+bJaT8SM/iRuM/5EFS/VhNg1E+qb5+1J8xvNE/mljsf/5a/WU4lxj7f3FfuKhuVdXeqzXYpH4E6JMHdPnsKNxQYRZ/WTIAI6hIjs6pMou3hm/c4q7WzTCGlrY9sW5oECvBQ4VR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783393014; c=relaxed/simple;
	bh=A7b6BYoUceySgErhQy7yv8kN9pi5dvvVlJl8LULBRdI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FUwHKsY4v2cZrk9LYuygtw9SnZnDAJZAOKVE14zrHmSvAjQwSjgamdhffSBqSBgyEN8DpO2iZLqwYGeFpRm6/XCJkWCqUg+lJHg0hFqD9H895CiPUCXlNbjlp6thn1Imq+WV+PQu7jr7LhMUNL6tW4PXBwLldEyievj8LONqfeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IGfTfip/; arc=fail smtp.client-ip=52.101.57.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IGfTfip/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHRE/Rx4SEjrHeTCp85BDR9fslrv5RLQv2092aeN5RcCPzg+IEZhlfd0jnit9UeS61SHUep7M5A7/KOMABQF21sXt+lTMHQ1QItIZ0m4wTYmeOsUlNgX7Q/GFDDSq5Ixn2X/2G/mKySDsLvHfusUPheXvbwCMTSvvPJK8ma0N1Dcy1rR2c5hneK3Vw9s3c97HffOqIPwG+E5IGMg3pILyXfiM83ZSCs1KZ5OxULK7pky858AhBnu2yepp3FSPodnbVFRFPV3HzvnCiXpe4nmEX3/82HG70754n9+lFcc8+VoMdsdonfVJziy20PKeWrp9HUumbCyC6J3IJjReWSHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7b6BYoUceySgErhQy7yv8kN9pi5dvvVlJl8LULBRdI=;
 b=hBMrJZdUoJEkgamCMdH7TApOSUESj76jr6VibFU4zwkM1F57t5myoBqBT0x07ljmIFmgME8H8mcI/+uk2DeRdY9FAMRoIUqMGf3Hg6CXGw9I3RpNTt6+xzcetXnMrze2P7baL1PBl8++fkclAIagMjWC5qUuORbRUSMdCQ0T9iuO0/h2Lr2sHrZzgsz3xMO1Bj0qDjnLIPtXVylODRth6hPMg8oUGOA17CUbEwWDN+Qv9ACLh9NpTwMmL+ZPTTiCLXeC0/ymfSSZdSJxL/DUARPnQb4p5PREFFPxNFqtCWolCdko2vTI3s58kJFP7r7w8MQQGIt4QDjQqXBNb4eoIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7b6BYoUceySgErhQy7yv8kN9pi5dvvVlJl8LULBRdI=;
 b=IGfTfip/EeLdKQQhBA3EQs/YeFMHBRMoqMhEQR0xucI96mPhKf6ZOP/3SeNLsF3KQrIC2KaTxEOVvEDgoiSkFn5gY0qBplzEKrjkMIm2wUmoXsQc6nGFJlXKTqJiIcco5elyC7w/sKt/bzn8uPY8+wSJkW9pw09OoV/p6APiSuNpGfg9yGe3I8RrXa/5/JSb0KOVIVcNNJvw2myjLxs4axwrepBg1eTaYm9+/EDEqXNR95yliTDhlg2UMQ1DAttffBtoCmKfz+gXUJYt+xxghV7J8kmCaWoRvQGm8q+qpNzWtcYzn1GxL7USHquGLG1EuRDCXUWjTK3oTuG3WYe5Og==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by LV0PR12MB999092.namprd12.prod.outlook.com (2603:10b6:408:32e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 02:56:50 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 02:56:50 +0000
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
Subject: Re: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware files
Thread-Topic: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware files
Thread-Index: AQHdCljkmvPX9pvAWkafavGTqyac37Zaof8AgAVrWwCAAVZ2gA==
Date: Tue, 7 Jul 2026 02:56:50 +0000
Message-ID: <09d1fd87272e7c7dee79d1e0841f49de76ccd82b.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-3-ttabi@nvidia.com>
	 <3e771bfc6b0c89afc7969755e340a5fa863bc7cc.camel@nvidia.com>
	 <DJR9ZP56YXX9.P8U6V298X5RW@nvidia.com>
In-Reply-To: <DJR9ZP56YXX9.P8U6V298X5RW@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|LV0PR12MB999092:EE_
x-ms-office365-filtering-correlation-id: a9d44e3b-2cda-46d8-df1f-08dedbd3645e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|18002099003|22082099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 fCzhMjw9Bp0WecGzhxIlMv0483y6g61Plo/YREsgCn56Dxdk09BnGgtfc2FVlPFXm+ob5huXaIU0CWkQcfqnPaE2reZixZiOEak0foAYdfV5u5aDgFmWR4OyUH8ryAahMMZfwpDm8bGHaDWfgouWdevbJodH5NS+awAeDvi+QAQX/siP5g0wZcgdjRjghuwjCKNXMVVcxjAh9f30WtzG+1uCO15hHC5T1F+FdBOM0Exv8sFFik3oXVqNnPfd/f1NMEeFY0vacYIWkMuDA/E7A492NcxMgILLsUBj9NhTgr1T6diVLa8Nh7m0eFEi6oXQeRkLv+wrZeoZkIaxC6jOs1efVslJVznPxN6gSN57a427sENjfsuueoLD9wLU0V9AZncPSiDd0n2gAIg3YwCvwooxTcTXFm47okwJfRWRJLLl5n/olHTGekBvTXDE4QHx9y683lFJggDTtGkrwIy7ZFcPeaTrfBGv4NcODIP2AAkJn4UjJKNvwGIflOA7s2e35djlyI/9p/vUNEvo28NRJd125fYA8p45Pw+h4shspI7zyTTfd0A/3C96mnREQQAMCMVw5uSdEN278jC9PzqqVOyXqUGdhKOPJBhZcmICfZhnD4dFbuNoE/cfAt7Guyy5hl8IeatHifD4wvgKfO9FwzQmB7GDydAfrY9tYt/Vrcgaj89Q9U0FU33ZwH/yg85sSsA1zD2aTKBdlEQLgStFTZ9T4LJlYQyw/1ic6/UTU3o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?elYzUHFWSXY0YUlERTdwRStqOUZDSzNpVnlkYng1M0JIY2VYZHlQdDJHNlhT?=
 =?utf-8?B?ZWVpamVyNHRCQjNZV3phb3hRdEVzTm9MMUdVeUwrSVNQdzBjTktzREtzcnpu?=
 =?utf-8?B?RURpWFpoQ0x4U2Nsc1B3UEQ3djZ6R0lSMTd5Mzgybi9kSnJud0ZOdnVxeVo4?=
 =?utf-8?B?SjlTQjZYOUVGYmF0L25SSTRPWnJSVHhrL3BObEluOFE0SUhFVVV4ZDlYY2U3?=
 =?utf-8?B?cDZRMWczTmFqRXgvYUtqZEU1anRoNzJmb0FRYmIvUklKaGpuQzZrbVErU3gr?=
 =?utf-8?B?UjZjLzY1OTJvOVo1dmpqY3p5bHZXNVMwUFYvd3R1UDNZSVJ1TktiRmR1R3ZQ?=
 =?utf-8?B?bWUxUk93Y2Z6SmQ3Y3BjeG9GaEZFbnphd3ZOY05kUVlCb3ZoWmQvT0Q0dW5E?=
 =?utf-8?B?OWZ2TTFYaUFSLzJuQzV5U0dlRTBqNlJ3OU0yd0xDS1FVczRLVDU5L09VQk1E?=
 =?utf-8?B?YXIrYVp4THBOT2hwZDQxekJlOEtac3lNaGQrbjVKelBMUm9QNy9JYWZuQWtV?=
 =?utf-8?B?bUdYK3RjTGhIQXBPa1BHZEJnLzVFZ21pUTFNMlV0SUFxNUhwWi8vdmUrUEp2?=
 =?utf-8?B?cXBwaUR4MmlVeFBOU0grUG1MSW9HYWo5Y0dDOFJrbjhCRWxFbDVFdFNjS2hT?=
 =?utf-8?B?SHJBN0xFWDRhdllzV0ovcld1TXFvS3NZRmNKS0lwbGgzQ3M4TkhUejlmRmtE?=
 =?utf-8?B?eVpnaVRJZk10dVNmMER1amJoNjlJc1U5T2RmQkVVajlEaitYZVlza2J4eXJy?=
 =?utf-8?B?OXBQU1ExcU9iSnhoU0hLUlBwZDgwY3NlRDIvQjlwZXpjY01NdTlqQStheTJo?=
 =?utf-8?B?TXlzNEVGZGhiZTlOell5MHlpWXhKaVR0ZnkyajlNbE84cjdaR1llV3oxbldB?=
 =?utf-8?B?TzYyeEFYTHMwU2xxL3g0eWc0dzlNWDFXcTYvaFpkbmpYTEFrVlZST1R2TjFp?=
 =?utf-8?B?ZjdmaDZ2cmM2S0hpZHo1Snp6bDQ1YWN0cFE3NUFkMmIvUWdPcnhVdEYvN3pz?=
 =?utf-8?B?cVVScWpJM3BMQmlZRzdKNU9NL1NWMVJMQnVUd2xGZkE0NDE2OUdYYWtjL3hZ?=
 =?utf-8?B?TUpPRmZMSUNKWnE2RzJjdDlYQnBXMTlkT3g2c2E1MTlQc0hwdllNQnhHRXRT?=
 =?utf-8?B?THlWNkNWaGNrSkpLdGFsMGx5eFpVTHJzbVBiK0w1TXdySWF5L0cweFhmM2Vy?=
 =?utf-8?B?bzloSkxDVkJGU3V0VHR4cWRiQWk4MXZhajlZY1NQaVBabTRQbnVZbWhyd1Zi?=
 =?utf-8?B?M0l3QlBVMFJ3U25FVjBUUXVBZW1PWDVvZHRNbXVpc1BDNU5Wc3RPeXppTmJj?=
 =?utf-8?B?Y1NPTEUwYWpacDNid1hvN3BGdzBiMGloOWQyaFNKVmxUbnRRcThUUUYzYXR1?=
 =?utf-8?B?NDU1QmZESzY0TjQxMFVIR3RPNjd2bTlYV1g3cFdTTm9uNi9GTTFqM2ZsUDNu?=
 =?utf-8?B?OUNMN2FPUjhuaUxQb1JVS082aWpzZzZoekl1VWNRbEt0d1Z5VU83SUdBWEo4?=
 =?utf-8?B?T0lQTEtCY0pnbmp4TjRmR0h2STJVTkMzNGdGWU5Ta3duS1ZuSm1DQVBWRlBK?=
 =?utf-8?B?QWdCVXljcXd0S0YvREYwWUg2ejg5QUthSFM4d0grOGtyZXZxd0gvd3hJRWVQ?=
 =?utf-8?B?S3ZZcENlZy9kbStNRHAwMFhRdTVpa2YvNTVEcW9sNXdjOG53MTYzSFRQWndG?=
 =?utf-8?B?Ly9YSU9zV0hPaC9qdnp2TVQzYW1oTlpmT3BZQWxoNHBoU25LWUVpUkZPdmcv?=
 =?utf-8?B?bDlUdlpCd2orcnI4cmZoSDcvY1pXc1JONU5ndy9qc25nQXFCZEc1SFhUZDhj?=
 =?utf-8?B?UExrSGVIZ2pQQkZFYVhHU2xVOXhxdkExa2hxYktCN3BYcWRXYU5tRTUxaTRL?=
 =?utf-8?B?MUJGTXVXNzhhLzhadzFtelJkTENvLy9TSWM4WmxUNDduTG40Nmt0UjVmTEFx?=
 =?utf-8?B?QW0rZzcyVEJFWWJVTWZRVVFUMUZWZThWdFpoQW5LY01udEpld0ZpNlViYURF?=
 =?utf-8?B?TmsweVhUWksrcXJuWFJrOHpjN2VBWWlESTJLVXJRaHZQY0RFTU1GbkR1bzZY?=
 =?utf-8?B?dUdZRFBFNTJkMjV1WkxXSStucUUrUjAvMmhRWTZ4ZFFGdk14MlpsKy9YZHMx?=
 =?utf-8?B?V3NMUG52M0hpcVltanVNT0lsbGZMZW4zWkhIdzQ1bmpMSkVFUG1LT2ovdEMx?=
 =?utf-8?B?cExNUWpiT3BzQkg4TjRQbFArSWVKODNCNXRmeXkzbFVzMHN2MFpwdHdHdm5P?=
 =?utf-8?B?MjMvamF5UUpPVFFiNXlhcGR1RmE2MzBoUXNRRFFWcTRsR3cyT2JDV3pSSjcr?=
 =?utf-8?B?a3NxZC9MeTNUa3I1bEloZEhwZlBFWkJkUXNxWkMwSmdBZEd5Q3o0RndKRHo3?=
 =?utf-8?Q?24DkHSkKU/iqqSEHRCePEPJpB/kgFdrPyHnkU62AaDWxF?=
x-ms-exchange-antispam-messagedata-1: 0lqsLtMsQ4kV4A==
Content-Type: text/plain; charset="utf-8"
Content-ID: <E240466153410F43B93603F880F3B16B@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d44e3b-2cda-46d8-df1f-08dedbd3645e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 02:56:50.1432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MU4VgAOLEypPNT17gzRNxgEO0dCajVyGYHJ5K0Cb6wkxFBVf2Pg3eBVsnL11bg9m076VszvMYDP5IEzrg+sL9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999092

T24gTW9uLCAyMDI2LTA3LTA2IGF0IDE1OjMxICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBJIGZvcmdvdCB0byB1cGRhdGUgZ2V0X2J5dGVzKCkgdG8gcmV0dXJuIGFuIGVycm9y
IGlmIHRoZSB2YWx1ZSBpcyBlbXB0eS7CoCBUaGF0IHNob3VsZA0KPiA+IGFkZHJlc3MgYSBsb3QN
Cj4gPiBvZiBwb3RlbnRpYWwgaXNzdWVzLCBpbmNsdWRpbmcgdGhlIG9uZXMgdGhhdCBTYXNoaWtv
IHJhaXNlZC4NCj4gDQo+IFRoZSBzcGVjIHNheXMgdGhhdA0KPiANCj4gwqAgTGVuZ3RocyBvZiB6
ZXJvIGFyZSBhbGxvd2VkIGFuZCBpbmRpY2F0ZSB0aGF0IHRoZSB0YWcgaXMgYSBib29sZWFuLg0K
PiANCj4gdGhvdWdoLCBzbyB3ZSBwcm9iYWJseSBkb24ndCB3YW50IHRvIHJldHVybiBhbiBlcnJv
ciBpbiB0aGF0IGNhc2UuDQoNCkp1c3QgZG9uJ3QgY2FsbCBnZXRfYnl0ZXMoKSBpZiB5b3UgZXhw
ZWN0IGl0IHRvIGhhdmUgbm8gdmFsdWUuICBJIGNhbiBhZGQgYSBnZXRfYm9vbCgpIG9yDQppc190
cnVlKCkgZnVuY3Rpb24gdG8gaGFuZGxlIGJvb2xlYW5zLCBidXQgdGhlcmUgYXJlIG5vIHVzZXJz
Lg0KDQpSZXR1cm5pbmcgZXJyb3Igb24gbGVuZ3RoPT0wIHNpbXBsaWZpZXMgYSBsb3Qgb2YgY29k
ZSBvbiB0aGUgY2FsbGVyIHNpZGUuDQo=
