Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDDC3793CE;
	Tue,  7 Jul 2026 02:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783392897; cv=fail; b=V/eaIrfaFTiDw51BFUKWJv0GfxJjHZGSBc7uq6X8BMgOCr+thMVFyu+8WlQQUjH0MFia8rrtLm+sze3xRxvdTekQJmYCmwLvU5yY196JzNOZ4Ar41WkatQIS+jdiKZKVG9Xrp5KVYyNcs0b9BJkxhHUeNKzzL7qFExVlUc4OZOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783392897; c=relaxed/simple;
	bh=jecjqB5T4mOpZ5+AcDTrEjs3YpUYqWusZSjum3XkMCs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I3+4XPDlYggEXbUd/AwiU92NCp1NPMeZWcJm9pUc311X5nBCtzSrl0ehZbOpMQPZ3YxUuJP7Gjrc9Ool3dlLghgQemDG8UDJrjD2nad+1eWSkmz+u+RB1i+8cfHaSMSbWjlMQ4Qe1av3FklgyQgayQ9am0Naz6w8/koVaenWYKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rUIwkWZb; arc=fail smtp.client-ip=52.101.48.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rUIwkWZb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpsU0KvvcxsSVmnGFc9NLJBxbJiLgGAxF/Anc4XDg2NlWn+H0ulHXV7h7OBlyqJK3ON3NZXViZjg2DMw4DH2lMeRVvCedKsk4eErrKyBsxwDcS0PnxNbtB0f1cdQzOd1sRhaacpqidIzCj0l1KwYQQqJ0xfVoGGai6Or1iNb6td9foGhbeTANSVjxF2R9Aus06aCxxAJ9nnf6ZqOyZ3jjVjSA6TJQc+5CQipwpaIRkIOPkSnNN5X7zcw9ND2EO2vwlrDEyKqO9yJ6bsToAVJq5wKVrMEQ3PPfhhvs7ZXhbo25/hYesnK5DkPTKTwe5PB1Lj4xK0sWu3o+9zxBKDtrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jecjqB5T4mOpZ5+AcDTrEjs3YpUYqWusZSjum3XkMCs=;
 b=C4v1aI7Tfri8OBMuqIz9r2TpVwOF9oBm4QqBUev7zGJ7LF87FI3yS7LrXm0JCX10stCYkILnHtIgttrxZt5xl4+zaUlGOp/E4+RzhCjQMfg2FGXftAYIDcY/BiPuF0unjzoQhu4CHByVbGaaEDPb0qRMjiLIgzZ0znRmH7DOMNIqh0CGsVn10/VhgUxqBj5bgnZGEnV3oAqqJZv0I76xwfnNjkstzj4y6BV7797T4sDj1KQpohj4Yc3IukJb7lQB95psf+K+VlNVKcy4SexVAt5EZckqd15sarOnGsW6Iu7bIkdl2zhaxjcfZdPPGiVd0SSNddTF8Q2+QboVtaG5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jecjqB5T4mOpZ5+AcDTrEjs3YpUYqWusZSjum3XkMCs=;
 b=rUIwkWZbww1eojQDMGsrb/3kvr5+E4Kk4Uh1BRqPOCsUaDkscQuq3qE9lGkR9HapM6JSxCRPBoHDFyCyS/AWGQou5CbByfYYijcnmZPNyhlACtAae8OtXA5fSTZIOLIaboc1Q+F9NUaG5NVJxIi3YEnH4EC41/1MWUxPJla9jjNisKLATj9cdgTBA9p4A881p6/X1QwlVVG1RxRB27wcm5SypaBrHnZlF9T22MnE6kdqP2gb8xVVh18F1eiv9JBgVe7zCLaW00mnewEunfFdzH749Tp6KsMxfcrIe8Znxswow1ok6Jl8ELlbGuJs5vnkhG/pb36Y9H0B+XckerOs2A==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by LV0PR12MB999092.namprd12.prod.outlook.com (2603:10b6:408:32e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 02:54:52 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 02:54:52 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Zhi Wang
	<zhiw@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"russ.weight@linux.dev" <russ.weight@linux.dev>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, "ojeda@kernel.org" <ojeda@kernel.org>
Subject: Re: [PATCH v3 1/7] rust: firmware: add request_into_buf()
Thread-Topic: [PATCH v3 1/7] rust: firmware: add request_into_buf()
Thread-Index: AQHdCljgIF44NKBP/kql8HnTzjet0bZgDU4AgABIhYCAAQ1wgA==
Date: Tue, 7 Jul 2026 02:54:52 +0000
Message-ID: <e1c7a5f2ca6fb05b27f76f8f1af2c11532c75ccc.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-2-ttabi@nvidia.com>
	 <DJR9ZKFB5WQQ.1CGI0N3GS1SFM@nvidia.com>
	 <DJRFIANMW0AM.2LAQJ114NJQYH@kernel.org>
In-Reply-To: <DJRFIANMW0AM.2LAQJ114NJQYH@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|LV0PR12MB999092:EE_
x-ms-office365-filtering-correlation-id: ebda3c95-c393-4d02-9c5f-08dedbd31e39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|18002099003|22082099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 xI7ZB/33JeXNfHPh/qUHrmGgmZJIB3Qu2qVup3KZk3zReZbYnFgJ0igUuGuKxuehXHNXciWSoZAZhIjwiOkPU+PhZRjUGVg4lRqFATDv8BOSfgXdYGPOxKDKuIaOmMXPddciotYDUhxXKpGFrG946g88CgV14yo9JBWVgybH0gprnTSqQBAoNnN9bd44AecEQv53zpk3RIBKvrRdXyrbidIuA/mBpISE+bQ7VPsntlbyAZ9D2Q7c6vyvgeFyaNhFpeAeSD5hyZBh36qMnU2/x3Lw9IuyTyFLBTW18/oSjnnBVVxze1O40/cUznqtNb0AZUf3nyNx5JrUi28H+mbTCssRrevFwBWDDtCJi3oEz9/KO/nxh4hKHVwDcFAOMKQ7uC0xc+ffMzug3f4bMMQhNvrE5uhAyB8WYOJX7q+bFnrJgT2l6dBPGH5vJM6LvwMfW2LK3o9Nk5J930h+INZCIkHA7whKSstdo8eCbVWKEEJ9e/JOzFvuUIwMn9b4NEJQ4ulPUqY6GEWS6wMu4+rTIq9r+XkbGuxLThXu/Lccax+K3118kwfGJHaUnoigxMEiPuWVxFwujwvFg0/5po60wvythkOb7Mg7OMST4U0j4cZVGweyrlDI4Yy4JDtbcw5grEMrhud2ugcI5qZxI5qgS4IjiRvQT1NjsEO6OFdIG5fViwPSmNngO4ANFnwyq3XEL0Yls2nJ8FdSGEVS9efcuTIQoOJ/4ENmlaQUp48SvvI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDdzeEJFVjNPLzhNR1JuZCtSYWtnNGJSa0VseGREaVhhL3JaTjJFclZDSXpx?=
 =?utf-8?B?QURDUmtObEN2Y1h3QVR6dFd2RzJwaEVhdnVYMDNsdFVtcjg0bUpQYWZQRFNS?=
 =?utf-8?B?QnlaUFZVRHhYcXFXekROZHdpQzJQZ0NUUWpZdEhIdkZjRk9FQTYzYk44djU4?=
 =?utf-8?B?ekQzRnVTTjdWSWVSNDJZNVdEaHRGaVhINDlhcFluUFJXMThJS3pkTmI3YmJT?=
 =?utf-8?B?MGhnSEhmSGhhZ3FwVHFGM0dvWnZ2SDJ6VnZYb2xvdk1DZkJiMWE4K1VIK2E0?=
 =?utf-8?B?RUJjMmViYW85clBsQnVKT2d0dksvSjRnbHZGNklnOFdCSFdjWE0zSGFnTi9p?=
 =?utf-8?B?V1kyQ0hZM1lDeDRZWTlaSGx6NllrYzFjS3hNNzVXbjliQVptdGV1MHJrUFZz?=
 =?utf-8?B?RmJhMms2NnQ0VHFPcDFRVElHQzFzN3dQT1l5RE1rYVJ2VVkwMjZPYnI4T3Zn?=
 =?utf-8?B?WEhiSXVoWExUenVyblRNNDRPOGtWU05tTXhJNDEzY1NHYnFLTWhyQzBEZ0tm?=
 =?utf-8?B?QjZyWmp5eVVFZGlUUEFyUTMyOFFZQjAwN2dxZjhtQUxDbWJYbllFNGFJdlBk?=
 =?utf-8?B?RlhnY1cwSy91cUY0MUhMU3JIaGh3d0V4WFlXbjJSSHZtdXVmZ0w4SytCaW4v?=
 =?utf-8?B?VkF1ZDVvTlRUT1NTbHZGWlBzMWZXWTZUQTVXWHVYcjR1QWRnZTVhUEgyRGly?=
 =?utf-8?B?dnBidUFLZWtZK2hXNzJZMUcyempTdnN4TzZMdlJpMHc3dUFsbk1PZ2tFc0o3?=
 =?utf-8?B?dU1jK2NJR0pWd2kzYXRGQVhySnVUWVNYaWJjaldkVjJ2cDJnSmxxcWlOVStJ?=
 =?utf-8?B?Z290eHMxSmxSckZlcThKRlh6emlSR0ltWXlSM283TWhoT3lnNmpLb2orcldl?=
 =?utf-8?B?R1BDUlBJdmczWENLYmlaZy9IdXFvckEvaFB1SVF1VHo1akZRSHkxQ2xvMnF6?=
 =?utf-8?B?c09GQXpMamJITldjQ05wczFTbDdSYSt6cW12bnVTOTZtOEV2OFFrblVGb0Vp?=
 =?utf-8?B?UDdtaVB5TGxmSExZeDRZNHFDWTVvZzU3emJTZ2NmTWF3cFg4QUhvcW02bWkr?=
 =?utf-8?B?Uno4UGdzZHZlVjZnOHg5bEZNUjNkcjkxMmhQY3ZTUWUwUkk0allqajFLbngz?=
 =?utf-8?B?MndRa0dsVDJNREcyM2JoV2RmVHgyMi9OQ3pKTjd5cTNWUXhBNnkyQ2FPR2h6?=
 =?utf-8?B?cVJxR0Z2VngrQ0lkK2pzSFM1Z2dtaDVjSWV3Y1h0SFRXT1ZvWjJSYlZycndu?=
 =?utf-8?B?MXljbWluNWNzajVFWTZVS0Uxak5zRHppeTkrbG9EOW9pazVSM1lwdXJ2QlhV?=
 =?utf-8?B?aDY4eU5yaEp6TEREcjZRcmVMbGtreFZ2eWx2QTFRQmt5Q3dzQ2dWZVZnTnZZ?=
 =?utf-8?B?dldyRmFHY2lSWUlqbi85MzlVVE85QS9HQlZnR21yYlZHNTFaanQ2UmwySFNw?=
 =?utf-8?B?aEw1RmluVFRQZ0VXY3REUnErUXR0Q0ZlbkNIN3htakM1QmJkMGdjZDB3akhB?=
 =?utf-8?B?NEc0Y3dndnE3clZEZDhQeVhhdnlOODNKRWJGS2RtOXNQeTFDWXdVR3Evditx?=
 =?utf-8?B?RFZzRm82dVN5MFVtYnZ3ZUN5QllSSHc0eGdsQ0hjYUhCUXlvVzFkMnFaZGln?=
 =?utf-8?B?NjYrdnBWMk1QTVd5bUZKZUJpSHdYQTg2aldUTTVGNnZybGM2ek5RMW0wdEh5?=
 =?utf-8?B?ZFk4RnJ4WFdmZ1IwRTRpR2hxTnFHa2p0RDZZU0MvT1hjSDFiMlYrb1JIZ1BN?=
 =?utf-8?B?QjlOOWEyRUZ2VVloSUFNSXVaR2JpVkFvcUwvanNab1c4SC92dldJNDRlN1Na?=
 =?utf-8?B?SnpnT01rL3NjcmtGNEFMSlhqWFVGTzgwVzRPSGtGcjV3QUYvUHFsUjd0M255?=
 =?utf-8?B?ZTNFZmZ3SkNNRVo5a09ZMWxPTWpFZlF4NTBJaWtTZ0R0b1B6cVZHV0pWQit2?=
 =?utf-8?B?TlJEZ2MyL1h1ZDJXR2Yzd2luSW9tNGlGdTdoYm5Bd3BPTk5yeGNTMHJZUE9E?=
 =?utf-8?B?NldPOVpOR2dma1pSVDRJN3NxRG15b2d2UUhVZjNaNzR1eFZWTS9aS1VINEVr?=
 =?utf-8?B?bGNEeEExSnN0MlVNTjBWNUg2clRNOUtGNmMxRGtsMmJqR3BWdlJKOUN0Zk1I?=
 =?utf-8?B?QXhCb2J4VXBJQitadXJJMTNySHFIOXA5WFEvWWJSUUxFMWNsVXdjeVQ0b3pr?=
 =?utf-8?B?TkxORWg0aHU2amRHOGV2V1Rnb1ZVTlRsMmhPSWllbjdCeHFWSm5NbDV5ci9n?=
 =?utf-8?B?S25DQy9WRXFZemxTdEtiajVCMDUvN1FUUEw5U0FXQnRDQ1NWRWJKcmF1VzRZ?=
 =?utf-8?B?RTY5TkV5cktldG1oTFIxcUl5MzV4UkhIT0VFbHhDQi90MS8rdU9KbEFuc084?=
 =?utf-8?Q?tntBVvmQGePpo98sNEtoc9fYVjSQNJ/HwNGphroQ8Z8fG?=
x-ms-exchange-antispam-messagedata-1: w4c751UJU7YSzQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EA1AD519E3B1D42B678688E4F91D445@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ebda3c95-c393-4d02-9c5f-08dedbd31e39
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 02:54:52.4609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQo2QDhoLUJCPTnG5kYtmTAfmd36yCdMOuCX0IhGGoBtf6xIWIuH7tBxwGmaZrdsZ77fOFIFRsfV+lOVQcPfUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999092

T24gTW9uLCAyMDI2LTA3LTA2IGF0IDEyOjUwICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBPbiBNb24gSnVsIDYsIDIwMjYgYXQgODozMCBBTSBDRVNULCBBbGV4YW5kcmUgQ291cmJv
dCB3cm90ZToNCj4gPiBTYXNoaWtvIGlzIGNvcnJlY3QgdG8gcG9pbnQgb3V0IHRoYXQgdGhpcyBk
b2Vzbid0IHJldHVybiB0aGUgbnVtYmVyIG9mDQo+ID4gYnl0ZXMgYWN0dWFsbHkgd3JpdHRlbiBp
bnRvIGBidWZgLiBXZSBtaWdodCBub3QgdXNlIHRoYXQgaW5mb3JtYXRpb24gaW4NCj4gPiBub3Zh
LWNvcmUsIGJ1dCB0aGlzIGlzIGEga2VybmVsLXdpZGUgQVBJLg0KPiANCj4gUmV0dXJuaW5nIHRo
ZSBzaXplIG9ubHkgZG9lc24ndCBjYXJyeSBhIGxvdCBvZiB2YWx1ZSwgcGxlYXNlIHNlZSBbMV0u
DQo+IA0KPiA+IFJldHVybmluZyBhIGBSZXN1bHQ8Jlt1OF0+YCB3b3VsZCB0YWtlIGNhcmUgb2Yg
dGhpcyBhbmQgY292ZXIgdGhlDQo+ID4gZ2VuZXJhbCB1c2UtY2FzZSBuaWNlbHkuDQo+IA0KPiBJ
J20gZmluZSB3aXRoIGVpdGhlciB0aGlzIG9yIGp1c3QgUmVzdWx0LCBhcyB3ZSBkb24ndCBoYXZl
IGEgdXNlciBmb3IgdGhlDQo+IGZvcm1lci4NCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9ub3ZhLWdwdS9ESjZKVjJRUVkwUUQuMVpLMVBSUkJONUJSUEBrZXJuZWwub3JnLw0KDQpH
dXlzLCBwbGVhc2UgY29tZSB0byBhIGNvbnNlbnN1cy4gIEkgaGFkIGl0IHJldHVybiBhIHNpemUg
b3JpZ2luYWxseSwgYnV0IHRoZW4gRGFuaWxvIHNhaWQgZG9uJ3QNCmJvdGhlciwgYW5kIG5vdyBB
bGV4IHNheXMgSSBzaG91bGQgcmV0dXJuIGEgc2l6ZS4NCg0KDQo=
