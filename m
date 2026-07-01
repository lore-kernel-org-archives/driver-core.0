Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA31257845;
	Wed,  1 Jul 2026 19:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935274; cv=fail; b=i/AZCoVLwjviaEayeTGqx6ManpD8mIb4Gbbx0fHbSkCIII56G2i6mbtT3SjzGogBwhdc7lemRwmcWceaFQdKyVyCFasAg1d9zxDtHMqyqyYkwVoVBOMv+lfvL8+cugKQVX13dIW/xr10EUQFHxCQaw4OUN6/fGmprjfPraG/hB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935274; c=relaxed/simple;
	bh=+QRbzmOPY1yUG+PN3WK5vU8XA++Fs0tECRQdgaii8NE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DOGZsBViOdKx7mID+wOKUyxlL+sL+N+RUW/7RQvk9c6lsT6JcPxK0lox+7FrIdSd8TN0qErKNtbVMnEDNW8pP4dHAWr9e9gdHEDrytPiy30V6HHO1gzP4ASq3j0QkIeeR3S4DsE9z3mTqY3oYJIuBRvdLyBGThRAxSRdfRjvWyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fL/EjY46; arc=fail smtp.client-ip=52.101.52.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fL/EjY46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hoi47sVXI/Eh8xN5Bn+TYdEaIBp7DbkkAGjRKaevlavbjHCbIyJ2d8hMyhSVatsQSZxuBe25NOkoLDG6tIbgI47ny46W1O9fCkqgOHQfclfoS9PcTCYntiyVEKQ0UMOhdc96PIYab/4d8QHORelI7uco353ks9ve+1j3NzUJqE8x8MbB+XqJXUTf0/DMq/j9/QR4WQcqMwbggJqgE1PYcT9jn+JANc1Uz2fE+mR0DP7UCjseEo+vS9uPOqWR8pHzOoVNXG2uzEnGmDNB9xP2631cnd+6kozXESdmAJr5500jlwFT6f+T1qIsqiFRXTXMXet3cD/ubeI0Ormum9q8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QRbzmOPY1yUG+PN3WK5vU8XA++Fs0tECRQdgaii8NE=;
 b=K16YtkxigTelW/68BkslIgJfVmOW0C5/XYBBgDzFiEkLEaR6uCCZzG1Tiuxnkpfa3T25B/uivP4O8o1HMzONC+p/EaTdr5mVefwcIXZat7iPBIt6LME7VoXPEuKhVH7fZ1CHC5oILZ87vSaclFKGg8LEn/iLYMOrtCx50kn5N2TBimjQIK7sswvYKgEySFqsaqt8o1B5A5oPb1PdJ6q35MA2JSJHmqgiM5TOC+1V2y18DjZLP5McxiL8IpxpfwFOJPCU8IfLMOHVcHGi1/rMSwABUvicCylbStPvaERiS7RK5UHxbod3boQ+kud9BvWJyVL2T6Ha7m5dTQDRG1PjRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QRbzmOPY1yUG+PN3WK5vU8XA++Fs0tECRQdgaii8NE=;
 b=fL/EjY46rSd69mqkYWErZt+yrP9lerAFANAiP+dtEFvl65sxl9vLeKep7mxeZXOCKrongthCf26fdi0FZKhICr4CQoJ2A60J9PNdwkDHm0VJZyqP25hNF2bMjFAmYSsK6KeO409BkpqxSCEmKSqI7HQn5ynFEjVKsw24GSR7xYh8SWqEtqJ6tA91xAjXtoM1tim39+Qyq1FGDUUL3tt/nfegCyMn/oKK6+EIZnXfbOSzdk+D9owKt4seE6A46rpZfocnmsok/2wbdiCPB3KVvlIcEdc3RiFhrREFF/ilz41FL6EIXDf9uJ7hnOlsqIw7oc8ZGQt6AEroJLu+35saKg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by LV3PR12MB9266.namprd12.prod.outlook.com (2603:10b6:408:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 19:47:48 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 19:47:48 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Zhi Wang
	<zhiw@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "russ.weight@linux.dev" <russ.weight@linux.dev>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, "ojeda@kernel.org" <ojeda@kernel.org>
Subject: Re: [PATCH v2 1/7] rust: firmware: add request_into_buf()
Thread-Topic: [PATCH v2 1/7] rust: firmware: add request_into_buf()
Thread-Index: AQHdCMlq/atRLi7adkeqnNFZdTpmrrZXl+EAgAF7hgA=
Date: Wed, 1 Jul 2026 19:47:47 +0000
Message-ID: <9eb3d571a40bf2194c018a54b4d0dfb1e173a6e2.camel@nvidia.com>
References: <20260630194749.1209490-1-ttabi@nvidia.com>
	 <20260630194749.1209490-2-ttabi@nvidia.com>
	 <DJMOWWJLKVZU.1N9RUO41QFAE@kernel.org>
In-Reply-To: <DJMOWWJLKVZU.1N9RUO41QFAE@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|LV3PR12MB9266:EE_
x-ms-office365-filtering-correlation-id: 0794060c-1f0e-4c7e-efd6-08ded7a9a0bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 8RQFj4PWreIvw4NCPhYwgT7y3GStdfZHgTiFcFYhUOu7wYRmu1eeCXgG+Y3BB9klaUndLQo/ayWnCATzyu2bTbqdNcpprUc4VwfGWANzl2SqyOXr/P/ciOmeD3z0yvZ+f2k+QpS7/+NoBGIGNi1RjJs1rc31OmdpG5eiJ8UrX9Ik2k8ZgA06mBWiER/6ANoFjINNO//5hZl39gPq3Yqbmb5JTLdYfCCZVh1T7yMPZbXnhj5ZFOs/Up3BVd0ouVUH7xKLCX86E5r5ImCS3j1rQ4LbOoapb2Oy0GqFKecdPJ/pumklfqcns7xnIcS9aAhnJVlXkA8CywLPVlyXkLsA4d9cG203GqhCjhCFIWQYEx4Dl6OppqYGufYqAhAA9JeEiuGCzP2DihI4HbT5RYRxlrj0/HV/fyN07jgOGcBLDFkeRM/B+ploRByzHVwzD5W+xEYn72QdaYu0Zl53mlCC/+0S5SgMhNcvwcnoslAR+pLJHpIYPD68cdAfcR8Y/YFg44Xu+eDYgK3o3mgmlzeJ1htJVoyzX2bf4Ygk7+o0jEDoQ9H058UycenoO0TM3QK8iRpW4SndjTFd/TVzv+1ECvMPWXmbS8+9uIv8Yr7GWHFQvEixjxeehutyKUNKqAC4idWbnYvm3ze1HRU3n0XFaQS86mVs41jT9Q1sNNgpWet9fJ2j+XUF2zy4PNEpJgPK6bO0MzTR5FNz/lHHucIKBSUrlSyda1WaWs2drxv6OAY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckI4VjBBdGpaZXQxVlZ4QkxXenA0M1cwMDMrZTM0YThrMGVDS0x4OVFhQm8y?=
 =?utf-8?B?dmZJcnRHRWs3a01XUi9kbXE1UURCV3lqbFJxQVBoWmJhWnpkSy9WU1U3dVFs?=
 =?utf-8?B?SXE3MHBrNnZTU01PVjdTRlNnRVdlM2JhZW1lVjlRc3Y1RjcyM1dQRXU1c21u?=
 =?utf-8?B?TWk0TFI2OVpBd0t3MVMwVEtuU2M4ejRUTWM4MjZ2VDhXYXNUTURsMzNMR2FW?=
 =?utf-8?B?enYzWStnWTdGYzNHc3Y1WmxOQlZoL21DRkx2NmNWL1NXUEc2U0QzallCZ2Z4?=
 =?utf-8?B?RUg2RmdhSEMveDN0STcwL3BPa1VJR1A3UE5GUGNXU3RyeHdtK2lZVUxqVXhK?=
 =?utf-8?B?MHJnZStnQ1VtSWdJQkFqK0dJSlVIMG5WSGtCVm4yT3hjMmY5YmdYT29EME1o?=
 =?utf-8?B?UGZ5SUpuaDBLNExDVTk3MDBJTWJVcXlWeUV4eXN6VldhUlhtM3VKVG9RNmZk?=
 =?utf-8?B?TlcxeHlPN01mYVAzQ1JrQkFoS05VZ2NwcmVCQlViV09sUEl6YUVGWHRYUG95?=
 =?utf-8?B?T2RIY0RtQnRoSmVqend5Qjhkd3JldXNmek4yenpzNnhpamRBY0VXU2hRcGpv?=
 =?utf-8?B?cDJsS3VVa3VrY2hKU21sbjdWNVdaeXZLQndYTTZON2M2aEJGQTZoeU14ajRn?=
 =?utf-8?B?amMzdE5PbEpZT2d2L01pLzhzZ3RjdjVVMHJhN05FRWFTU1ZyL2l0L01nakN3?=
 =?utf-8?B?SThVd05rVmZzRUkwa2tQY05aRnV2U01nV0s5V3o4MUIyQkFtRVpJYkZyaVlC?=
 =?utf-8?B?MXZOODlMUEFtT0dWMFdQZ1lwVU85VDFLblAzcWN1RXF2UWtlbXlyamVJNHF2?=
 =?utf-8?B?YlM2UzhxS001K2EwQjFIYXRpb3pqTzV3QWxxbXljNS9ZL0xwY0ZUTDNGYkNq?=
 =?utf-8?B?bGMwYlhFMU5KdDZBUkhTUDRjRHlkcUF6T1dPYkUvVnhleExIeEZvbk56RWNk?=
 =?utf-8?B?RVpqOFg0Q3NLa1Y4MDc2R3hzNysybS82Tjg1MGtpMFN6TTJrTEtyVHFuSkFF?=
 =?utf-8?B?bmlldXZXSnE2ZUltN3BOVGFRUHYvMzhRODRaSjFVTldDTEt1eDBkajBGRXZN?=
 =?utf-8?B?Vlc2V1JnV05wcUZreFQrRW44cWorazQzaHBYNlpONE5MVGo4YmVZZ1VRUTFi?=
 =?utf-8?B?RTBxcUxKWXdlSkZ0cFN4VXg3WitxdzR2S3IvTFIrdThGcms4cEo2L1ozS0sr?=
 =?utf-8?B?S1NncllJUFU5ZE0wWm5NM3RVVThUVjdKNk45djhCRGdNRmVCUVVlUkZJK2hP?=
 =?utf-8?B?UHFITmxrRVdjanI0aXRCdHV4RDVSSldGVFNoNlNsSUJ6M3MrbVVNcnJkbi9V?=
 =?utf-8?B?ZlkrWlhBYU9FSUlaeDBLSlZMTFNxRE1FVVB1UWRCOXRjeFhjTllPNVk0Uzhk?=
 =?utf-8?B?MHFma3RMU1ZXZ0Z1QW5pZ1Q1MHBZYSs2ZFhPYmptYmRSMEd1WnhuRTFkNDIx?=
 =?utf-8?B?WXZPc1ZwWlljT1hPUU1qQTE4R1crU1c5UGVaNUdkNmQ3bmtxZHA2OFlMZ3p2?=
 =?utf-8?B?MnREUm1yRVFrQUFTWkJqSk9ITk1JS1NGNmJoeDI5cHFiZEFpQkVWLzgydzF4?=
 =?utf-8?B?ZXlOS0pKYVNHK2pOT1VSS0swMHBXMzI3R3NBejNzK3NwM2p2ZVJENndvK3Vy?=
 =?utf-8?B?dzNPYkxaWWIxM1IwMGxIblVYWmdGVGRFcmtyNXJpOGxvVzE0emlIRVZnYmdY?=
 =?utf-8?B?MFRhblJCL2p0b3JvTUNBRVNwS0crdmdhanVTY0lnUG0vWk1QREZIMUhCTVBr?=
 =?utf-8?B?aUZqSUlOY3lZeTBSOW1MZ1N3b21xem1YSXlpWktQYUI1RG96VzQxUkM3RUlB?=
 =?utf-8?B?cXB4Rnc5a0NYcmltOG12VEVWU3JWUmZScThCMVVGRFozeTdLZFVTelZhc2dq?=
 =?utf-8?B?V3VJY2UxblRyaXQ1Z0FSQ1NWOFVkMmgzdTFGbVd0S2hzOVdnNnU5NGt0UUth?=
 =?utf-8?B?R2o4Y3Y4U2IxekR6aFk2SWJXOXpTd2JwbEV5T3hZK0M0K0VRR2RhVzdoYk1k?=
 =?utf-8?B?dkNBUWZaSTlLdHRwL1FleUV0QnBXZ0s4eHczYVVidjYwMkkzN091K3hjTW4y?=
 =?utf-8?B?U1RPRmdWTC9pclZWZXAyWXEzaGRZRDdlbmhBLzV0dk14aXRUSXQ2UENQUE5w?=
 =?utf-8?B?cllyb3VrcW16bVp6TjJVcERxamJaaVI3eWZGYkNDKzZRT3BPcHF6cGZQRmtI?=
 =?utf-8?B?VEFVcSsxcFVxUjVsMTBNSDZ5TE8yQ0FkY1gxbmhqK0JvaUg0OG5qL3N4dkdC?=
 =?utf-8?B?aEczSVVlWXRUL1RQejNVUnhBODR1S0dnVVA1bHdyS29xYjZseW16TzJqYmli?=
 =?utf-8?B?cjd4MjRNdGpLM1JubFlhaXNMQUZDOU5TemErUXFlSXNhMGhmYWFBQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9467B1432B6A8D4391D9D38B62F60C77@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0794060c-1f0e-4c7e-efd6-08ded7a9a0bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 19:47:47.9058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IAwknhl7mmHpwSfwNrDq/XHFMMQyFNf/wmCOV00bbYV4ivdhRfH0GREzwDhdI4yrGG/vt7+jUYcdu0wrKRDsng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9266

T24gVHVlLCAyMDI2LTA2LTMwIGF0IDIzOjA5ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+ICvCoMKgwqAgbGV0IHJldCA9IHVuc2FmZSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgIGJp
bmRpbmdzOjpyZXF1ZXN0X2Zpcm13YXJlX2ludG9fYnVmKA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBmdywNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1lLmFzX2NoYXJfcHRy
KCksDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2LmFzX3JhdygpLA0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGJ1Zi5hc19tdXRfcHRyKCkuY2FzdCgpLA0KPiANCj4gU2FzaGlr
bydzIGNvbmNlcm4gYWJvdXQgYnVmIGJlaW5nIGFuIGVtcHR5IHNsaWNlLCBkZXNwaXRlIGJlaW5n
IG5vbnNlbnNpY2FsLA0KPiBzZWVtcyB2YWxpZC4gVGhlIGFsbG9jYXRlZF9zaXplIGZpZWxkIGlu
IHN0cnVjdCBmd19wcml2LCBpZiBzZXQgdG8gemVybywgaXMNCj4gaW50ZXJwcmV0ZWQgYXMgInRo
ZSBkcml2ZXIgZGlkIG5vdCBwcm92aWRlIGEgYnVmZmVyIiBhbmQgaGVuY2UgdGhlIGZpcm13YXJl
DQo+IGxvYWRlciBhc3N1bWVzIHRoYXQgaXQgaGFzIHRvIHRyZWF0IHRoZSBkYXRhIHBvaW50ZXIg
YXMgYSBzZWxmLWFsbG9jYXRlZCBidWZmZXIuDQo+IEluIHRoZSBjYXNlIG9mIHBhc3NpbmcgYW4g
ZW1wdHkgc2xpY2UsIHRoaXMgd291bGQgYmUgYSBkYW5nbGluZyBwb2ludGVyLg0KDQpPaywgSSB3
aWxsIHJldHVybiBhbiBlcnJvciBvbiBhbiBlbXB0eSBzbGljZS4gIFRoYW5rcy4NCg==
