Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011069.outbound.protection.outlook.com [40.93.194.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842E22BF3E2;
	Fri,  3 Jul 2026 03:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783048028; cv=fail; b=WkWaiD0bFRyqA+UdAb2dzrZOTnTe4l3ObDZ4CfMecSWtWh/Cj6qIw0o62zTy2AnVHha5yoeMWzj8YCEx9yjErPUBYBseprII/RYizjnEJs7PbOqTLH1+/QdqHqylbPRIiwjC40aGIvjOo5F9/BgiJJL7uI6bQOmelaOTwQ9txfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783048028; c=relaxed/simple;
	bh=q784+daXfuFkQyG1+JBv0F2LVQI6JXPMApoxH1q3ARs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cvc+yZ1heMzkY4pPctuvXNXJgn2kl0Bam0Eyzkao/3zPce8laCcZ/7Ym8er6dZH+iPzwSHQajM2AmxSgB94QQweVFmMyBMdnBehaFZNxDcmwTBWVD0YjtSyGjffZg94x69mQamj2f7tIYi5u+jZsDEl6m7bRfVydXAFNvfRXHVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qktas83O; arc=fail smtp.client-ip=40.93.194.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qktas83O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0PRZlSGjeJCbA3EI5qQ8OeFc8g2lXPO+EDnWJ498Bks9EfLYkgOSVnvOTlKq+vP1zdz5bcBjHaU3LXE9w7/ysCzXwCE8kxrN8nW4/LZxv/1dL+3Mdd0Ekr5qcOsWTysPzuDZBxc1qkt7GDvyqP28cz/RgG7l3TmlfanurNEa2ytPCFIzkRdh3o+63Ve/SNqg9CFuF4Ck3AuH47JNaCNizw2JxVpvAHKnSQ7LMW6NGTjN3riXBBPIpno1mMfXEEQzRWR5Mrs34/8qFE226k09jpn53qe9OKI6GkR29LMzrjfXU5k7sKVaKXVzS7J6ts6lB66+LbRMSI3Y6zKagQuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q784+daXfuFkQyG1+JBv0F2LVQI6JXPMApoxH1q3ARs=;
 b=XDWQ6TImrq/B1knJY/jh3zM16cTnLeqxLu8CjtETukyP8ignz9co4/Nd3UmJ2Ogmm/pMZR3Tb8Nf8jWxVEbM2NjvjGTm8ieZ3FjneHZw3fpa/O4e7NLrO5yHwZoYwIaTJ95jsK9qOj8LUoWR9te+5juXa7w5168d3vLvkZtzFL6YNWO951tF5rJl5AcVNCxrGoomH6PjkIXjUVsBpMn2VgoeYyMEXSxx0tjZNXQUOBUUZ/Ugc6UW2ZmXbYXBUiznh7EBb0lcAf3O1Oxg0IMv9FOMc4GYBH3YqTv5Dc65VzoHqY5lo4C88LxmEeVJmvbd2bOL3iDjLdUVZa/RMA8VVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q784+daXfuFkQyG1+JBv0F2LVQI6JXPMApoxH1q3ARs=;
 b=qktas83OYe4mcy4AmpYQwxdX7WYf0qOGY70fRIHgw1BDE+NDJNikOrtvFV6TNf1U2R7NYTSXM5eGJVS77FJHBuSkqfic8gaDdb4asAqRBdxWIJTu220YQsOWoyQYlPVFLdo+OJKOU9r+RLEasqXRO1ZbtUDOXlImfep8gw8Th/67sUQbZ59PY65FlfNjRKgOCh4WP8fS9Q599n+V98hoqsLctwmoFTqfQ3nAH3Q4BIFmKio65TNxHm/dG9zI28gYKBA4u1IrsrurX8Ore1QZiIi97Qdk2Dt/dguEd9uaT8Oq+zu5/HVi2UQNEOb/Oh8ZVR0e+r4bI1RbDnQV9JdMqA==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SA3PR12MB7783.namprd12.prod.outlook.com (2603:10b6:806:314::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 03:06:52 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 03:06:52 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, "alvin.sun@linux.dev"
	<alvin.sun@linux.dev>, Eliot Courtney <ecourtney@nvidia.com>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Zhi Wang
	<zhiw@nvidia.com>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "dakr@kernel.org"
	<dakr@kernel.org>, "gary@garyguo.net" <gary@garyguo.net>,
	"russ.weight@linux.dev" <russ.weight@linux.dev>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>, Alexandre
 Courbot <acourbot@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>
Subject: Re: [PATCH v3 1/7] rust: firmware: add request_into_buf()
Thread-Topic: [PATCH v3 1/7] rust: firmware: add request_into_buf()
Thread-Index: AQHdCljgIF44NKBP/kql8HnTzjet0bZbGReAgAAENIA=
Date: Fri, 3 Jul 2026 03:06:51 +0000
Message-ID: <5515b3a5d405dba4d04c628b435065b5e3b631bc.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-2-ttabi@nvidia.com>
	 <a87b3b29-3dcf-425c-b700-da957400daea@linux.dev>
In-Reply-To: <a87b3b29-3dcf-425c-b700-da957400daea@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SA3PR12MB7783:EE_
x-ms-office365-filtering-correlation-id: 89680a49-0765-4e3e-819e-08ded8b02170
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|23010399003|1800799024|366016|38070700021|921020|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 oV4j6phXOd1pNRkOrmUZuyrh5czBoqaqFW4IfCUvdkQT9vMLrVeKRtqhIxIqX4cH9VubQiWKEmVm72ZaCiLgep7Ez425ui+sYTtmhoTpNAYBOHZIvDPEVewFsDQ+7gbM2ZvJ/wGkhPQ1Tpo+C6Y/5o6QZF3HU7Rk7RexD0YMuMgM0TF5mgxshBTlkQTM8RuYhqBUL3KLWe5msr9ebFZMAOcV4jVjCDAwlYR+XoOoYV+DXk/681VVYO+Q4WUzAN3nKFNRQfGO8W6HOPYFOcB7Usx0lMCQMlNdThCcJYz3yVPLTOI5eEQineIavDNzROk3RRUhG8hhwiO7dlQNNzMw8OlAn/4qwaUamHeF2M7OdHo2A7VGi2qYYm8z23RdnKhbBFBzJvlqvn/U7sGJGrC02t4iXYehb6lLuKLb4nEv0RAUsdu72+yRXBo5IFcsxzZjg+QjeUXhrtwp6exEEU3LZFh1w5U7BkE8FBtylaTVX3P/QTQEPrb1BoHB7U0cSjqEAnYLvWevYIyTbQgPES5p4gHYGA5Jz5IkURTXx78IwTm3k0nwQoY5Y/tsrwvDIq3Yhx8vUpLhUy31g2xgaNzyDqySd3L7wcDENdTz0TSLXXcYrdqXk9HIQDkODkOXGQwRUxZ1R43T/glgp6hhp1yl0ueib8+9E5nGkyhnp+0yGrGj7yL2ICbSZqTH+zfomfzTbHuxR6TvXx8zPEE3ufLckr98UP4jzT+DhCTZr7QOd4s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(1800799024)(366016)(38070700021)(921020)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3kzM0ttTEtLaHBFOEJPS05WZVUwVmNJbmxVRndTNUpLVnVNd1hmRVBXcU5L?=
 =?utf-8?B?L0EycFpoOHI5MDJNaW1rc1hBelc2WEZocUhqY09jdkNlQlRoUFVSWU1SQ1B1?=
 =?utf-8?B?TC9veGlXRDVwQkE5TE9GUVRoQno3VzFmZlVjeTJ4MzNiaW5IcVAzYVVIRDB1?=
 =?utf-8?B?WHQ3N3VaNUhoeENCb2xqVmJ4bllLYUllZDRQQ3VtOWU3ZFhreFY3eHhsWHl0?=
 =?utf-8?B?a0V6QjZMMFIybmU5ZzlJbVd6WEpQM2VNbkJXVVk0K0orK2xJSVVaTW95bkxR?=
 =?utf-8?B?dU1uWFp5bDZybmxqNUNKKysxZnBnaUh0UmpTbGtUc0pUUTFtR2ZlWnRkTTdR?=
 =?utf-8?B?U0o3b0tUT1lHU1VDN0o2VzVaVk9OUUhIWEtZb0I5dzhxS01uM0Uwb2Z3eUwz?=
 =?utf-8?B?Q0ovcE5jemFtbzliWVNpNXdBQS9oQkJOQTg2TW1veUN1elhCb1RnY1AxOG5v?=
 =?utf-8?B?YWZnRGluZnR2SVE3QktiMUJNc1JjZENJVWt5eHhpUFVnTzdJRTEyZXFiT1d4?=
 =?utf-8?B?a2txRmhNbUxDbm04VnBlUTN4NmU2MFdUNjlXSUhvQkhzUkVya1FxRk5RdEI0?=
 =?utf-8?B?NEJiaUdIcEhTYnkxTUlYMTE1dUpFd0poZ2ZMYXZmV2RDaGxDZEF5eU9RZGJ5?=
 =?utf-8?B?MUpZcXdMSVhSbi9TbjhTd2NLV01aL3FhQjBON3NIT0s5ek9FbUJTSnRaK0dl?=
 =?utf-8?B?eWNKcEx0YUdOS0hQVzY1SmVNeHhLS21mOHYwWGZzaGFMRWVLaFJVbDdvdHcy?=
 =?utf-8?B?bHNFeFpzMkpMVVZ4MDBwYXNXVDVyb3duRjRWTEdja0RsckRQamwyeERKTDFT?=
 =?utf-8?B?UUZRRTlJQWFRNTNtaTluQU5zT0dYYjJyb3ZFZlRTUDNId3ppdzV6c01mbzJo?=
 =?utf-8?B?UitsajF3UzRWZUt0YXJ4RXBKeTVJZUxZMnhmS3ExR2NuNk5zcDd2WUdxVUhn?=
 =?utf-8?B?WGNmUitRdlJ3R2lEMTFaSW1hZ016NDhiUksxY0RGc3ppL3RjS0xlSFNDL0R4?=
 =?utf-8?B?ZmU0NHFXM0hhSnJ3dFUzYWZCQzNLQTZkNW1Cc2hiK0FJZ0tqSHUxWU1GYmw1?=
 =?utf-8?B?dHFxK0txV2JmbDkvQ2pYaDArVHBBR3RCL3JGYTVqK0ZuOGZHK3B3OTZSdWhM?=
 =?utf-8?B?d2dlNXk4OFJEbmM0Vnh6WkljcVRKLzZ3Nk5vQ2J6TjRXOW1ldnUrY0ttdndT?=
 =?utf-8?B?cFJZN3hKYk9kOTRwK3A5STk3Y095RTlXOXJTamdVNmNQOW81eXZaYUYxbW9t?=
 =?utf-8?B?cG9ZUzVqRkRrTi9Fc2J4Uk5SeEhUUWtVU3lnT0ZJc1ErOFJtc3lIQXVKaGxm?=
 =?utf-8?B?WFA3YkVJTzRsaWJIcy9seVhldlY5QTd6UzFtWUdVTnp0VmpYTklHanNaUVdh?=
 =?utf-8?B?OEJCU040UWduNUZwVW51aUJLQjQxRi9nMkZhanlZUFRxdEFKc3NTd29WZ0RT?=
 =?utf-8?B?Vlpyc3JFZGx5ZERNei83ZWI1QzBLSm9YMUlYVzFJakpQYi95REJESDQ1ejlF?=
 =?utf-8?B?S3YvOVZObFpHR2JDTThtQm92bGRRRE9rRWczbk5MMTZMY3gwUC84OU5JWlVw?=
 =?utf-8?B?WHBYYm9Ub3piZWFpRloyUHA5TmZ4V2xJYUM4VWZmR0JKUTB4ZVNlSDJPZndv?=
 =?utf-8?B?MWVLQTZGc0FnSmttUVNqdTFWM2NMbGJ2cVhjY1lmM1RlWTBJRThvUFVrL2lD?=
 =?utf-8?B?SXVpSFArczltOXJOQVhlaFRZZEJRQ01UaU5Ec1UwcFBuS2h6MTkrQjR5MHl3?=
 =?utf-8?B?aTMveEZ0aDZWekhOam11Qjh3NkcwbXBKQW5uaVl1dHBOMTcweGVRQzlGY3ho?=
 =?utf-8?B?N1ZkOU0wZFVLVkNiQTc1am5LQ1FEODFudjkzYW9GQmR4b1Z6TnlPNVFGSjFj?=
 =?utf-8?B?WmlTOGlnNW1JalllaDM2bkR5YTArRGFzQjVNY290OXJ0Z0RRblVFa3M2UnhC?=
 =?utf-8?B?RnVvSHdpUXpWVnhCREZJZFlXaE9HdGtNbGtXSENsN0p6VU4wcHBOVmVZUmZC?=
 =?utf-8?B?RVdDU1d0NVVJR3gwdVJXNHpnN3FlV0JHcW5yWDNpWVBuQWFYMUdLem93T3Uz?=
 =?utf-8?B?OG9ic1g1UUVPRmdUUFZwZ2I0VU5wWERyMDZVVWkvVkNHWEVxQmdQVEhUbHF2?=
 =?utf-8?B?TUlyVGg4YVFKcHNaOVhlTGNxL1Q4ZEZjbDR1WkloTFg4M21WS1Q5dXZxMWJm?=
 =?utf-8?B?eE95MUEwTmhoR3o5WW9hVGFqYXdpRGc1OVY5Z0ZaaW5abENjbkN3ZHVWTity?=
 =?utf-8?B?YXpTREd6dEZVaTNjVVVsSStsQ1NiR091dWNidmhrSnE5UzlwMlhsY1ZnQzRm?=
 =?utf-8?B?N2c2aDk4a3Z5SlNEc2p1NDRkMTJjQzZwK09tTE1DQzMrU1FaMzNzaDhRUXZZ?=
 =?utf-8?Q?3Tl2y+J2AG0hl/HFxpesRI7LnK25O3lARl4SMMWytVIFV?=
x-ms-exchange-antispam-messagedata-1: BxCrquwhmKzVjw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <C30714C83E513D4B81F24E5C797F4615@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 89680a49-0765-4e3e-819e-08ded8b02170
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 03:06:51.9511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oy1PR+dPi9Mb3ljlVkqir7JhtEpsfk4Th0lyHkz86EfMi2R77Q0Orvz4Qmto3/56TrXhYlzoypG+6jxZVA61xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7783

T24gRnJpLCAyMDI2LTA3LTAzIGF0IDEwOjUxICswODAwLCBBbHZpbiBTdW4gd3JvdGU6DQoNCg0K
PiA+ICtwdWIgZm4gcmVxdWVzdF9pbnRvX2J1ZihuYW1lOiAmQ1N0ciwgZGV2OiAmRGV2aWNlLCBi
dWY6ICZtdXQgW3U4XSkgLT4gUmVzdWx0IHsNCj4gPiArwqDCoMKgIC8vIGBhc19tdXRfcHRyKClg
IG9uIGFuIGVtcHR5IHNsaWNlIHJldHVybnMgYSBub24tTlVMTCBwb2ludGVyIHRvDQo+ID4gK8Kg
wqDCoCAvLyBtZW1vcnkgd2hpY2ggdGhlIGxvYWRlciBkb2VzIG5vdCBvd24uIFBhc3NpbmcgdGhh
dCBwb2ludGVyIHdpdGggYHNpemUgPT0gMGANCj4gPiArwqDCoMKgIC8vIG1ha2VzIHRoZSBsb2Fk
ZXIgYmVsaWV2ZSB0aGF0IGl0IGlzIGJ1ZmZlciBpdCBhbGxvY2F0ZWQgaXRzZWxmLCBzbyB3aGVu
DQo+ID4gK8KgwqDCoCAvLyBgcmVsZWFzZV9maXJtd2FyZSgpYCBpcyBjYWxsZWQsIGl0IHdpbGwg
dmZyZWUgdGhlIHBvaW50ZXIgYW5kIHRyaWdnZXIgYQ0KPiA+ICvCoMKgwqAgLy8gYnVnLiBSZWpl
Y3QgZW1wdHkgc2xpY2VzIHRvIGF2b2lkIHRoaXMgc2l0dWF0aW9uLg0KPiA+ICvCoMKgwqAgaWYg
YnVmLmlzX2VtcHR5KCkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gRXJyKGNyYXRlOjpl
cnJvcjo6Y29kZTo6RUlOVkFMKTsNCj4gDQo+IGBFSU5WQUxgIGlzIGFscmVhZHkgaW4gcHJlbHVk
ZSwgeW91IGNhbiB1c2UgaXQgZGlyZWN0bHkuDQoNCkkgd291bGQgaGF2ZSB0byBhZGQgaXQgdG8g
dGhlIGxpc3Qgb2YgaW1wb3J0cy4NCg0KPiA+ICvCoMKgwqAgLy8gU0FGRVRZOiBgcGZ3YCBpcyBh
IHZhbGlkIHBvaW50ZXIgdG8gYSBOVUxMIGluaXRpYWxpemVkIGBiaW5kaW5nczo6ZmlybXdhcmVg
IHBvaW50ZXIuDQo+ID4gK8KgwqDCoCAvLyBgbmFtZWAgYW5kIGBkZXZgIGFyZSB2YWxpZCBhcyBi
eSB0aGVpciB0eXBlIGludmFyaWFudHMuIGBidWZgIGlzIGEgdmFsaWQgd3JpdGFibGUNCj4gPiAr
wqDCoMKgIC8vIGJ1ZmZlciBvZiBgYnVmLmxlbigpYCBieXRlcy4NCj4gPiArwqDCoMKgIGxldCBy
ZXQgPSB1bnNhZmUgew0KPiA+ICvCoMKgwqDCoMKgwqDCoCBiaW5kaW5nczo6cmVxdWVzdF9maXJt
d2FyZV9pbnRvX2J1ZigNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZncsDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFtZS5hc19jaGFyX3B0cigpLA0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRldi5hc19yYXcoKSwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBi
dWYuYXNfbXV0X3B0cigpLmNhc3QoKSwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBidWYu
bGVuKCksDQo+ID4gK8KgwqDCoMKgwqDCoMKgICkNCj4gPiArwqDCoMKgIH07DQo+ID4gK8KgwqDC
oCBpZiByZXQgIT0gMCB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBFcnIoRXJyb3I6OmZy
b21fZXJybm8ocmV0KSk7DQo+ID4gK8KgwqDCoCB9DQo+IA0KPiBgdG9fcmVzdWx0YCBjYW4gYmUg
dXNlZCBoZXJlIHRvIHNpbXBsaWZ5Lg0KDQpXaWxsIGFkZCBpbiB2NC4NCg==
