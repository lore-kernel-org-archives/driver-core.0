Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710AC1D5160;
	Thu,  9 Jul 2026 21:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783632473; cv=fail; b=QSAwQQe6AOO2LOw+VBbuCzZ4QCOnqkYlP0cNnwovKMwxxKvwYE7hdnzrB++M8j9FMytKNEeySdnIV9YHiG/chSBKDtYZkQZkxtwJXW37XVy3CgM7a04BTQ83fTIHGqfOQ6E7B+OLnRZekG2o9D6DgIyh1UCUEhkR7u35tRh0r8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783632473; c=relaxed/simple;
	bh=qDAawEwJAAuIRQKWOJvkE9prf9gWszR77qp0J88S0FQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T29vKW4OHnOkKf7XPlv+cmynov39Ok2G0mpbcm4r6aCTWruiNC/qmpfl2rdj7h+5SiqPDHPijzFMP4thSEWq6tk1W/NQYp72KOk2TppnWCXzhm8XBMV6nDGWjmtsdpyiEKuZ51My1alu0Com5nnBDdHYQ1DMEvHK1TsOz5WEjiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fpDe9/WM; arc=fail smtp.client-ip=52.101.43.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fpDe9/WM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXnlIZcHPhjskmrk4AYTnnrgr3Ks1PdGYnIQDoAdkLnVPAu725z9UMTlqvConD/H21dxESAHT08H4IiPmpUeyyRaeCftgiYZ+LQO5oj8qQQCadwpoenA1zmHskP6yk52gdVP8o3fOje+hvox5FHot9ZLOKH10cyZYnZvfNqUEtmAO2mBAkwGtn2gaikzpH5JQZy0np21SCGuKxfu7RNjyhrcbUZDK+6LjrVeXyZ1q5pYN225Rl73ZakHXqfi8l8nMRuGPiCLF/hcDyuB9ezgdnVJutHjVB2oGBfeO282aHbqasUol1hXZ9X+OsCUvPgHcgBNx0gvMDgZscwOTtg3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDAawEwJAAuIRQKWOJvkE9prf9gWszR77qp0J88S0FQ=;
 b=HElMcmpf9mL05i+/3+h9+r4VJhlCAMZNevrocPPnWorua8wFcbGLS9+yCWmJ5gQRKUBZzy4WBZj3UjtEkWPpJHVDH3kPiOj07Qp3Cxo9Ripq1nyaBd/IOXi+WLc0ilXmSCigH7S5Txz9UxwXvfUgvm31jwhmQSm1PakaVpMWOIt2ukj6uqCDlgK61mY2vZs2LohcYaNcpw+x20v8A8+Dq0t0N7cegOQzgd1CBazKiar/i9d6RcplyzCT8bpzK97TvBVPgePOWbQSKP0U02h7VFcqOVNC9GiJS/kddb3abFlnDxUFt6rdTiul4zdRBukyebs5BA56GmpDNzCgcIK27g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDAawEwJAAuIRQKWOJvkE9prf9gWszR77qp0J88S0FQ=;
 b=fpDe9/WMqmTyXemwQptD8q/1C2US/Pdk8KMAh9S0dcDuvz1BpjAFZokH4ASIp3F7WbDdObkTyHNFvvJsSnTixESAdIIWugprWQTADR3GLz7qP56Kr7OHIrV02arlZ2ad+YBRxxLBAVAQZlPNHGzKSgxCac4QJOcKbRb59xgOesf4F/WrjvofFadjou+7D2mGp+AdNiiG4azmBpc5VCSy9oiez+6BGK5kn5NHwb+Skggituwg22NpE65aYkkrEJgsz6QsaJTphBEF4wRjFfg7lRl12aB/okmGT5UF96Adb7+dqo4pfJPjrlcdrXutSDS3ASf8HQovjs+j8+pIQnyDVg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH8PR12MB6721.namprd12.prod.outlook.com (2603:10b6:510:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 21:27:48 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 21:27:48 +0000
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
Subject: Re: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
Thread-Topic: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
Thread-Index: AQHdCljkwu1+XAkqMkK4e6h+pSRGELZgDX4AgAQve4CAAEKSgIABP1WA
Date: Thu, 9 Jul 2026 21:27:48 +0000
Message-ID: <09b1d5117a38726d216074d7e3d56d4aeaae2bb1.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-6-ttabi@nvidia.com>
	 <DJRA02VV16AS.3W0QHW9YYSLXE@nvidia.com>
	 <79b4033973c675355a25d8fcc701cdedf8f30bc7.camel@nvidia.com>
	 <DJTOMSK9WVHH.GA7X7JR0PYIO@nvidia.com>
In-Reply-To: <DJTOMSK9WVHH.GA7X7JR0PYIO@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH8PR12MB6721:EE_
x-ms-office365-filtering-correlation-id: b6899462-a472-4da0-611d-08dede00ec6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|38070700021|18002099003|22082099003|11063799006|6133799003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 FUz9cgqPlbuElTGIsHTAvZsz9NbXa7aVmg2z+N/jiQTmqke23ZqfXRx5UFyGNVTi61u4V87ObB30GmImw7vPsNkiq5JrTrH8qEevBhTZs98oRz5R4UqToAshQiKI0Xww+tGPHatNiwuj2Lo3eEkWaa67y6eBRznN64vCbqf3+n8d/75nsQetBBDNVbpBaNMpCuG/Ybm9rY55nvsIMAltH1MavCER0hlpQ13k8Lf3ORBl8+eyAvoM8WaNKqyoaBs81Zn2YRY/1CFlJLTSOHoIw/bxTt+Mn9nJ5n2PbV0zhJnxuOsEQTW65Tt0ji64ez2LtLcM4atln2byX5Y8bYB+uYab+sPbEMK2QWyH3XEC8Q/2ddVrA+XZMZzcuC0V9dXTXWlUcnDt2edTgi6aLhQMvKhRPd9wFPU+Vf+kz3QcWNBJLxRRJDP3L9z1SgwXoTsT8Ju2AvLvzGdfvhcv2iZupDAeoRQJ/UZl9PllVP8n0pdGwW6qT7ElwOwRB/ShFhgMG0TfBGGebLuj4y1h/X6WoC+Ej/HSgxTIdY+dMRAC650SZ24I7ztIYU2TjfqnfCuuqxz3IyIsPRFrTcCDf5xiBx3pxqfVsiM5wyULzqeID9JaVhHvIlkqg8vGWqYI7gn6f2dE12k0COZmk5+VS6X9b5USMItNMy2CBC89gsZIK/066+nJjM7KMNsLuzuuoV3ppwWvcOeFjzawE/XEjoKLirh/o6TRumU8sdA0DPxHniw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(38070700021)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXU4UVN3NU5uRXNOWGozeURwVjY4ZWw0U25OaFBMNEJvR1dDSzk4Y05hRVVU?=
 =?utf-8?B?YUc5TUZCWG5yV0x5T1ROeEdPK2lEREhxZW5xQ2ZLa0tpRlNwckVaUStaNWU4?=
 =?utf-8?B?S2ZwWklmaGpiUnJkZGJxN0pkV01iUGFMM1locTl4dHNMblc2MVJoMEh1S2lH?=
 =?utf-8?B?T2EycldIQjhXNG90S1gvVDJzRnBrSUpiRlhrSTZhd3BrYzhsdXpvVmhTSjEx?=
 =?utf-8?B?S1FrQnhnVVZHR0tjK1FldE5EaWkvdXJwaFRzVEl2QkVVN0p3N3AzekVpbURn?=
 =?utf-8?B?UFZlQkk3RG5LZjhCd1FQWGtuL0xYbVZYdmRJMmpFWXhDTjRYMFdtUWUvaXBJ?=
 =?utf-8?B?MUZXNVVOK0ZXVUsxejhNQ0xueHhGRmFSYStRNnBieVdoNmt4UjdOb1dOek1z?=
 =?utf-8?B?K3VGVFFGbGIrRnVIck9pMHA2ZWZGZDRQYnpnck5kRnhrYWxQQ3Yva2wwMVVX?=
 =?utf-8?B?RW13R01DdUluSTY2UTZVMEtsM1k1SDRKazFYL2NBaXpZVmdRaFhPOHZZK2hD?=
 =?utf-8?B?RUM3ZzRUY3ZmaVpjaDZ2cklvY3VIM01wZXdiSmhHYloyVWxlV2Ewd1U2cTNY?=
 =?utf-8?B?ZzNGajFOM09LM0xmb1dPcWVaV29KalNadFZYOU1uNzhBOGlQOGJQcHpnUTZY?=
 =?utf-8?B?c0RaSjR0aWNHblhYOExoNVdBN29IdHdDR051bmFGdGFhWFRYMXVRaWN5aW8z?=
 =?utf-8?B?K25RNjkxL1hjYTJuYXc0RHUwUFVVT3JWMnpFZ1hqRnJZQWFYNm5sbXFrQXoz?=
 =?utf-8?B?ZzJVejZLbk13VWVrVGNUbmtlTEJxSlhpaVp6eE5xSUM5cE9WQ1ZFQm1PRUlq?=
 =?utf-8?B?YTEwVUpJc1NQOEppR2E0d0RQMW9CVkNjTWhmb1l2cTR5bUdyUjB2b0hpMEFV?=
 =?utf-8?B?b2tKVzhjMHIzdWVzUzFqbUlXTEx2Y0piKzl0TWpZUXpwZ25WVElaaU5yOGF1?=
 =?utf-8?B?NTY4V3lrN3NWakVyN0VHOWcxdGpkT1dmbHpGN3hYT21TeVF1cGhDc1VOSUlS?=
 =?utf-8?B?bkgyV3lhaVFSZkd6cTZnKzBwUnAzeVptMGNWeFEwUDg3eXhYY20wQnl3Y3BX?=
 =?utf-8?B?c2kzS3FmcU1jQzlPZzVqYjBHK2NFeUZUWmpoajJPU1FVQVZjRVR5TFRqdDZJ?=
 =?utf-8?B?SWpVaVBoeW9QQWJZNm83bnIrTExtWjRaNEpnTjZ4eitMeEx0MzNFRnU3Qlhy?=
 =?utf-8?B?YTRlOFZJWFhuVnR0NmZMa25NeURGeGpSL0l1b3lVK3pqVUFEbDYxK2Zadlgv?=
 =?utf-8?B?dzZra09HWStjZVI0YXlkcUpabXVGZEFNbHRDVUJiNS9tdXUzRXlCOEt0T0g2?=
 =?utf-8?B?eHF4UFZ1UXhNM0ppaWRSL0Y3TWtBVURtMHJmZ2h6M1ZoRFVDRlZUMGM0U0U1?=
 =?utf-8?B?Q0RnbkIybHpETDg3em5udy81KzhOTmptR1NaTXpGTGNjcUwyYWMycTNXT1lv?=
 =?utf-8?B?L2UxZ2YvVG96amtVbmdhUlkyc1pHaUlodVVWZ3hScC9ZQVNGR09HQnVRd0dE?=
 =?utf-8?B?N1pjNUdpeFJSUUNiUTloanhtMmJ3WEtlcFowU29NdTRLS09jRWN6T1Uzemts?=
 =?utf-8?B?bVE4MzV6YXJhQzQ0b29JaEgrMms4dU04UWhRblpRV1ErSGd4WjdLTGtIRTV3?=
 =?utf-8?B?TmdCWStQaTg1a0RxZE4vZmFOYXdVZ0pnSjg1VnRLZHNJNVBqQ2g4RHkwcU1P?=
 =?utf-8?B?QlVCUXg1Z2Vta1hucUJHUzgycUlKSXpJdXQycXFtb0Q5SDVoL1k4VGpFTkxE?=
 =?utf-8?B?eDAwTkpvSWZDV1ZyQ1orYnBHcURjdkZ2Vld5VThUWDFCMHIxTll0UGpqMkVV?=
 =?utf-8?B?RmluWHRZZ1FnQ1lKbGhjM0tKRkQySG1oZ0IzQ2VqbHNyM0o1RVVZZDRMa1dD?=
 =?utf-8?B?aWZYOExkTGtqOHp5YnlrakE2cDRHcmh2WVJwSER4Q1RCS1V6QVBHWGtkK29X?=
 =?utf-8?B?ZGkyUUk1YnUxNFhLdlczTUhsSCtTQ05lTVRSRTJ2Sm14L3paTHpjMkJiYXZh?=
 =?utf-8?B?MmwzNEpSc054Z3J3cjZEQ0E4enVGdmpraWdSS01vMlc1R2VnSzdLNCswTzlK?=
 =?utf-8?B?eEZORWRZSUlMdTRmSkIzQ0Y5UThnR1lVNCtzV2pHNUpIaUVSMUU2RTV3RXla?=
 =?utf-8?B?U1ZpNFJ5eStkbkV0bFZUMElXekg5TDNBN0djSGpUWXpwajN6bEZWZkZCSnI3?=
 =?utf-8?B?UlcrbWN5cnhUWUVNNGZKQ0wraUJQYnlpRTJEeXl5alBzSVUxNDZ5dS9ZOFlQ?=
 =?utf-8?B?MjAyVVp6SkRaYktCeWRhZlBheGxVbDQvTFRtZFVxaDV1ZzhaNERIWUpMSGR5?=
 =?utf-8?B?eDdPQVNOeXRsYVozZ1Bka1pEempvQjh4cDBhRVJvSXlrMk1EUjI2OXpFMmxO?=
 =?utf-8?Q?7cOiJOD7Im28CVBSv+UbHZ6kB+bN1pzo4KNLxpaAF0M4f?=
x-ms-exchange-antispam-messagedata-1: jBGQE/nayVeyWQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <68EA93E09ABCD34AA19BD3F3050C02CB@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b6899462-a472-4da0-611d-08dede00ec6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 21:27:48.0835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ru10O/ilkWK5YqZyWlcdS/k7RqhWxY8FFlALfy/l4RtuDCzCCg9ltBU65HqYDPpEGaA36IrRhQtZJVCOO3ombw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6721

T24gVGh1LCAyMDI2LTA3LTA5IGF0IDExOjI0ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiA+IA0KPiA+ID4gQWxzbywgc2luY2UgYGRldl9kYmdgIGNhbiBiZSBjb21waWxlZCBv
dXQsIHRoZSBjaGVjayBwZXJmb3JtZWQgb24gdGhlDQo+ID4gPiBgVkVSU2AgdGFnIGV4aXN0aW5n
IGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHBlcmZvcm1lZC4gV2Ugc2hvdWxkDQo+ID4gPiBwcm9i
YWJseSBleHRyYWN0IGl0IG91dCBvZiB0aGUgYGRldl9kYmdgIHN0YXRlbWVudC4gVGhpcyBpcyB0
cnVlIGFjcm9zcw0KPiA+ID4gdGhlIHNlcmllczsgd2hpY2ggbWFrZXMgbWUgdGhpbmsgaXQgbWln
aHQgYWxzbyBiZW5lZml0IGZyb20gYSBoZWxwZXIgdG8NCj4gPiA+IGZhY3RvciBvdXQgdGhlIHJl
cXVlc3RfdC52L1Rsdjo6bmV3L2Rldl9kYmcgY29tbW9uIHNlcXVlbmNlLg0KPiA+IA0KPiA+IFdl
IGRvbid0IGNhcmUgYWJvdXQgdGhlIFZFUlMgdGFnIGlmIHdlJ3JlIG5vdCBnb2luZyB0byBwcmlu
dCBpdCBvdXQsIHNvIHdlIHByb2JhYmx5IHNob3VsZA0KPiA+IG5vdA0KPiA+IGV4dHJhY3QgaXQg
b3RoZXJ3aXNlLg0KPiANCj4gVGhlIHNwZWMgbWVudGlvbnMgdGhhdCB0aGlzIHRhZyBpcyBwcmVz
ZW50IGluIGFsbCBUTFYgZmlsZXMsIHNvIGl0cw0KPiBhYnNlbmNlIG1lYW5zIHRoZSBmaWxlIGlz
IGludmFsaWQgYW5kIHNob3VsZCB0cmlnZ2VyIGFuIGVycm9yLg0KDQpJZiBhIHRyZWUgZmFsbHMg
aW4gdGhlIHdvb2RzIGFuZCBubyBvbmUgaXMgYXJvdW5kIHRvIGhlYXIgaXQsIGRvZXMgaXQgbWFr
ZSBhIHNvdW5kPw0KDQpJIHNlZSB5b3VyIHBvaW50LCBJJ20ganVzdCBub3Qgc3VyZSBJIGFncmVl
IHdpdGggaXQuICBCeSB0aGF0IGxvZ2ljLCB3ZSBzaG91bGQgdGVzdCBmb3IgVkVSUyBpbg0KdGhl
IGNvbnN0cnVjdG9yLiAgTXkgY29uY2VybiBpcyB0aGF0IG1heWJlIG9uZSBkYXkgd2Ugd2lsbCBo
YXZlIGEgVExWIHRoYXQgZG9lc24ndCBoYXZlIGEgVkVSUw0KdGFnIGJlY2F1c2UgaXQncyBub3Qg
YXR0YWNoZWQgdG8gYSB2ZXJzaW9uZWQgZmlybXdhcmUgaW1hZ2UsIGl0J3MganVzdCBzb21lIG1p
c2MgZGF0YS4gIA0KDQpJIG5lZWQgdG8gdGhpbmsgYWJvdXQgdGhpcyBhIGxpdHRsZSBtb3JlLiAg
V2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGVzdGluZyBmb3IgVkVSUyBpbiB0aGUNCmNvbnN0cnVj
dG9yPyAgV2UgY291bGQgbW92ZSB0aGUgZGV2X2RiZyEgaW50byB0aGUgY29uc3RydWN0b3IsIGJ1
dCB0aGVuIHdlJ2QgaGF2ZSB0byBwYXNzIGBkZXZgDQphcyBhIHBhcmFtZXRlci4NCg0KSSdtIGdv
aW5nIHRvIHBvc3QgYSB2NCB0b2RheSBpbiB0aGUgbWVhbnRpbWUuDQo=
