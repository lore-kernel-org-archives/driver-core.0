Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EED30D41F;
	Wed,  8 Jul 2026 22:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550891; cv=fail; b=JRzXsHfgofnVqLAzFPxjn0iMsu3Dn8ve4zGlmCS3uq1vjxrCbqLfoO1J91nm39mkVUuZwLO+kVRGY3cGdK0mqyB1PKY2eF+9Jjep/qGodtlCul3lIx+Mhq4dZSEHlMdldO+zDUS8G5ipkQZ9ooO++RXg+1kmf5zmUT2u498igEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550891; c=relaxed/simple;
	bh=hwyuqFtV7XGiyhh+1V64FuEw297Iy/vR9v9wa6CktcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QShZJlAiNZhSph6BUgxCJqQFZ8XXH0Us99Bo1snjj5zwBpwRiIL9UVpU8FfZQ7CkIL3ifUhgL+25ZgDS3LHpCXn76JrX8uDt74gZifBQRKTNL2E99b2q9LB+6fpnljlmVyp7WRFUd5pRcmaX9jkZABU133GgViaTnNZU84KEc20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PZJU9ENI; arc=fail smtp.client-ip=52.101.52.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PZJU9ENI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmFcDSJOtFe4/LpZXryGEJxjZj+R0okfRVDw/YVB8r8GYBnnzK5Y4vPN7m4z/uLS9F2BmgCBkcnCDPKHeSZv3MpV/SXv74UGQtZrYMVt+E/S4tfe/LurlJjeKcColbLESryQkTiBi/J0zsjMuPVshc2hmfw22Q4KV9h+OeAJXaEKmrI38oglhu04KyFg2bQ1dvOFVndlPqLatA+eph//D/tmeJF7Cf3NbJA2XHZBc11496OCBll8l0S7bL1tUxzSXJU7t4yX9vYOZnS2gh+4tO872qDjjQ5HeK/K2UBgwJdiqcBd+wRuuyVT8fCx6+bVR11ZTFNMwXJ+hySruf24EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwyuqFtV7XGiyhh+1V64FuEw297Iy/vR9v9wa6CktcM=;
 b=xv1pbR2/pCnlr7ejkliW7pk3tpc/aR8EgZlkvl6D0DmqhEpxHawn0Ar43nB+AjuzS+XCv1C66lVf9DyJflhJBo+5Kb6DqlcRz/7VQxklqzhdUbT4yz4KbBBVsX5sme9aD+5h1jJP867HcIEry5VdcU1XPdigARmjSRz10k2r5e+wrPG73Dcdry/Wt1lEL4g0MnNRr8eAMLPFNMySxnW06okj/yi8FxFL3oonkfP0ZCLEcirZTYUgrrQuDLuZsB5V/RdPvdUOhgm1yWI6CsXtEoHzaFMFuqS/pzuWWF1uxQtnbLuNNR8FUDcKw6P+4joNNl6zLj+tye5VGm6pFIi3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwyuqFtV7XGiyhh+1V64FuEw297Iy/vR9v9wa6CktcM=;
 b=PZJU9ENIkwQP0g7K8H117dWMC8QfZZv2tkB+m/iLWouujjlUZ/CYyKryj0qVXIi5c8txNORK4SPXvoueb/ll3n4/UJVwioRXtaBoTf7ez/6ZrdyKxfffsh8qXg9X7eqY0lamoe5Jv+fA41gn8kRWtVDz3LWbNITUD5k+qYGOahTlsF36OqDXGcWFLurl7Q7hYkSnYltRQA21m5+U12KtziwgVc/4egzNf5qXs7dClIRwcP5Ks3PM2lhmPZl9FmdGOrRO7IfxERzn1jtDRLrBIYXTRC/eKnSj+W8znkCEU2Fa1q8+4aFFdJE8YPH493lqMHdBfLW/EuS3gQ3gb/M0Ew==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SJ2PR12MB8806.namprd12.prod.outlook.com (2603:10b6:a03:4d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 22:48:03 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 22:48:03 +0000
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
Thread-Index: AQHdCljkmvPX9pvAWkafavGTqyac37Zaof8AgAVrWwCAAVZ2gIAAJikAgAK4/gA=
Date: Wed, 8 Jul 2026 22:48:03 +0000
Message-ID: <e913d3a53361cd6b8b076f43d038cfd029cda473.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-3-ttabi@nvidia.com>
	 <3e771bfc6b0c89afc7969755e340a5fa863bc7cc.camel@nvidia.com>
	 <DJR9ZP56YXX9.P8U6V298X5RW@nvidia.com>
	 <09d1fd87272e7c7dee79d1e0841f49de76ccd82b.camel@nvidia.com>
	 <DJS2YR1BBMPC.2X5MMLHOM0LL7@nvidia.com>
In-Reply-To: <DJS2YR1BBMPC.2X5MMLHOM0LL7@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SJ2PR12MB8806:EE_
x-ms-office365-filtering-correlation-id: 50c38b08-833e-4e90-dec8-08dedd42f859
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|38070700021|11063799006|56012099006|4143699003|22082099003;
x-microsoft-antispam-message-info:
 wbz3zfRUM5s1kgzQTSSpwuf9aO/Rpvdog36bGAArcFyXJSXoVmkOv2W3xxdQK1pUk+cCukjS6Sdkhzdq9ABgf6VmXwXI/Vsecphlgw6M7Kyr5dclF1R3vi1xWXxUFqnpgJjTlYqsmwIlfuIgmDIFfS/heZQn5ZeFTmAEnTHz2S4z2UN3H1a5kmQ82TYVbwoBIbXZBtmTyV/GlM71ntaDKBEtATqdLW/oM+gEaM3aI9UkmP0o3+5GP9tl64N7LNZG0BjtLGgWRzukmCOd1E4OwErGN+PzFZjAXhxsHMvf3YZc16JCz1molH9zrYyvl/kqROjji4I6t9JsMVOIQxjIJ8+368rmnc/JTbGmg5wsq4lOKoQX+FcVHOvZ24EIdoIajHkXUXwr28eFmQ9QN19e4EXcvdtPC+6eiDLMDz8mVY5kJ940nGDNqsF0Ar7jJepedJoCdktgLlYQ12vey68AQhEADvyewjseXRv7Z8ba5jX5VSi8bN699CT753+g4tOB7+waofYd4m2mhbXDtr4Eq3qFRPU6T8rnPkuNYdvgH8tyOm6Y9BjKRts7sCyJDg0xypgYBEnI50PLz+xJKXDm/kBbqcVboHgC49BcCQ0ElJEEyAPgKNtEMe4L+4dYigHb6bwDvMsPvGZ5bhDk0oqol0cPC+mnD8irC10ofGufziB8ty88m9Ef/QZRLoTH/bw2VBvQC1i9M/LMgH9XTssPL2SCOr+lpfD5HeExwdKK1f4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(38070700021)(11063799006)(56012099006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWFvRTNYOUxIK1lidi9VSXgyUi9tTEtCZzR5ZjJmUm1DTkU2VEljZlNjNWND?=
 =?utf-8?B?TUkwNWNQOHRTeHQ3ZWNYbXRuVnR3ZUxNWWZkYjgzejVkLzN5NHNMWmNneFBJ?=
 =?utf-8?B?RGlHaWFmcUI1ZkN2WWlPZHRZY2lBNnRvUU5XdlNmV1pNTWxLODRKMGZCSDJV?=
 =?utf-8?B?YzlNTm1mV3RJTHd1SUlvdzBLK1k2eG5hL2l3T0VXY1Q3TmVsR09Oa3o2ZEVM?=
 =?utf-8?B?ckIxN2VpTmcyNGNOSzN1YkdJNUNRbVNHMU1jYUZhY3pOdXJ1VHVGUUlFMjZR?=
 =?utf-8?B?amhON1pDcHhsRmNMckI3Z0V3aXdSUGJ5V3FyMi9heEVVaHp5VHpnRlNReVYv?=
 =?utf-8?B?UFVEQitlV2kzMjQwckNmVlVIQ2JxSGNWOHZvSEJZbUhxQ0FVMGNiTGNFY1gv?=
 =?utf-8?B?ZFE2dGM3SE92UjJuWHJ5SXhBOGQ3ZWQ4Q3pLelY1amJyYlY0SUZ4QXMvNjVs?=
 =?utf-8?B?ak9uWnluVE1HcEUyeGpVbTJJOVpTVnZ5Vm5qRjNNcGswMjBpVFdTY090Tkth?=
 =?utf-8?B?a0ExME51MzVoMWRtakl5ZWIvbFRhaW5TNXNNQk0wRmFLOGcrT1BmOTFQL0Rz?=
 =?utf-8?B?Tm9BUTNpOEdQTHM3MjNVNGFsZDZGMDN6Q1p0d0pib2RCTkxucURyZ1QzWVRz?=
 =?utf-8?B?U1VLRkE1YzZqWEpTbTZ4VUkvYllOQ3ZTRzVVZWk4NjF0REFjaStrSHB1VmNB?=
 =?utf-8?B?Q0lBUXAxZ09yWHVqaGh3R3oyZnZ6UWZvK2JEQTg0bjdIcEdNWHBRd0tCOXUr?=
 =?utf-8?B?R0cyRkJ0WmdzMWxvSmtHOGlHM25pT2tQZlRyZDBQS2d1elYyQW05K1NEbDd2?=
 =?utf-8?B?a3h5Vit5Z3RITmowTHQrZFdSKzBOM2l5eHB4RklDb084WW9ZeDgvR3F5SEFz?=
 =?utf-8?B?RURTRVY0aUtwSDVtdk1mMUJCY3cwd09ZOFIvMmJ3dER0YUUzOWNtV203WjBP?=
 =?utf-8?B?Q3ZGbk02N1NPSFhQVFFwZWg0ZUdZMWJZOWxzcExPRUxRbTlxSGlEQWFNSjdL?=
 =?utf-8?B?YTRORkRnZVI0ZlYwOEtUb0RTVTdrd1BJUnZjWVBXQXg4bUxiRXJSVGFjeSsw?=
 =?utf-8?B?NHNYWEMyeVc0aGgxbSt1ZXBHNUdGODI2Zm5YaUxmMC96NDdIWklSMHNXVU81?=
 =?utf-8?B?aU84amdJbnVJcDdSVmpvTHJ5L1RIM1IvMG5LOHFFNTMveFpydS95czV3a0tU?=
 =?utf-8?B?RGxjM0pZbGpWQWVmY2hrT3QwVUR4VjYvTzBWNDIwRTBPRlJWZm1zV1ZvbnZS?=
 =?utf-8?B?MVM4TWtkbWhITTVKZm5lS29iNlh4S0lWZU44U21BRDRDdlkvYk13Ri90bU5U?=
 =?utf-8?B?eDdrVUtOeE1ROGx0b3phQ0RYS0RtdlovL254MU9qdFRBQVlRLzB2bzU0R0xl?=
 =?utf-8?B?dW5WNXNBNVVVdGYvQUNJZUcwR2t1eC8yUlI4djJPZEp1MGg2dUg0RzBjaGFR?=
 =?utf-8?B?eGpmdEZudTZVb0N5RWhUM3A1M1ZPbmJVVXc1SnkvdnNQQmU5QXhLamFUZkFk?=
 =?utf-8?B?K0xxeXFuTFlSRWpQMGY2R1I4RjdxOWdhZ2V6bk1jRTVnM3BFY0NLQ1pZMnlo?=
 =?utf-8?B?MlpnMWZ5ZWYxQUFlcU9jaUg1ZHFTcmg3MzR1MGh1TjBoYTZ3c1IvVUR4cHNL?=
 =?utf-8?B?b2pRUlB6ZVA0Q1RzSXZ1OTRiS2YzUUdoRFNYOW80dXRSSVplK0ZSckJJbDRO?=
 =?utf-8?B?V1EvS1VnaWJNSkR2ck1XVXJ0TjErd3hMWXlFdzQ0c01jdjJlTG9MUGR5VzNs?=
 =?utf-8?B?LzB2QVk2VkJmVnowSjdKL3FBcnFGUi9ISXAwQVQ4U0pXeXh6MTBrS3h3Si8y?=
 =?utf-8?B?UEt1d1BSbXdEODZqTE8zZzZES2JlT0RRbGJabnNqbXFIZnd1ekNHSjRzbFhQ?=
 =?utf-8?B?N2JhcklDcDlSczZwc001cTAyK1Jhd1JyTCs4em8vVElwUFdrQU0xc1hXL3lG?=
 =?utf-8?B?NGcvZGV2SlpmTVRoVTM1ejJKb25mUmVHaEhIa2QzUnNHV09ZaU1xZEhPUnZE?=
 =?utf-8?B?QkJlRzEwaSs2ZUhlamx2WlRGS1FOaEVrL0t0cWg2RWl3NmNrS2tVQTEzMWRO?=
 =?utf-8?B?TGpxS1RJWDlpVmFwSzloTm11RHlVVEhEMTVQeWlnYWtCaE5URWNEL3F2NEkw?=
 =?utf-8?B?bTNEM3kyYmhzRFRtU1pBVEY2dk13aTdIVlhwckpNQ3FUWjFnd1QrMkhpdmhX?=
 =?utf-8?B?bDJSaWQyZzdnd2tlbkI4clV5SllHcW51RHUwcnRhNXlnUTl3M0wvdG9lOVdy?=
 =?utf-8?B?NkR1cUdzZHg0c2I5bzJZUmliazg1UnV3RllCL3o3ZUZmOE9hOUlnWUdDc0lO?=
 =?utf-8?B?QXRDVFBFaVBVeE5aWWI4NnA4MVA5cndDQnNadHEwbmdXd1JlRFJpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B711F01AFC9A44382FA7F72897F1439@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c38b08-833e-4e90-dec8-08dedd42f859
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 22:48:03.6966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+mMwdGgrzBoXB3rZ8ARyG+yk4fZASsgJiEHKl2u85NBVbcdcgoTiBOePveC8t45hemJBVIWRyO686Xs4MJ/DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8806

T24gVHVlLCAyMDI2LTA3LTA3IGF0IDE0OjEzICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBSZXR1cm5pbmcgZXJyb3Igb24gbGVuZ3RoPT0wIHNpbXBsaWZpZXMgYSBsb3Qgb2Yg
Y29kZSBvbiB0aGUgY2FsbGVyIHNpZGUuDQo+IA0KPiBDYW4geW91IGdpdmUgYW4gZXhhbXBsZSBv
ZiBzdWNoIGEgc2ltcGxpZmljYXRpb24/IEknbSBmaW5lIGlmIHRoZXJlIGlzIGENCj4gYmVuZWZp
dCB0byBkb2luZyBzbywgYnV0IHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aGF0IHdlIGdhaW4u
DQoNCldlbGwsIG1heWJlIG5vdCAiYSBsb3QiIG9mIGNvZGUsIGJ1dCBpbiBnZW5lcmFsLCBpdCBl
bGltaW5hdGVzIHRoZSBuZWVkIHRvIHRlc3QgZm9yIGVtcHR5IHNsaWNlcw0KZXZlcnkgdGltZS4g
wqBJZiBnZXRfYnl0ZXMoKSByZXR1cm5zIHN1Y2Nlc3MsIHlvdSBrbm93IHRoYXQgeW91IGFjdHVh
bGx5IGRvIGhhdmUgc29tZSBieXRlcy4NCg0KRm9yIGV4YW1wbGU6DQoNCiAgICAgICAgbGV0IHNp
Z19ieXRlcyA9IHNlbGYuZ2V0X2J5dGVzKGIiU0lHTiIpPzsNCg0KICAgICAgICAvLyBFbnN1cmUg
dGhhdCBzaWdfYnl0ZXMgY2FuIGJlIGRpdmlkZWQgZXZlbmx5IGludG8gY2h1bmtzLg0KICAgICAg
ICBpZiBzaWdfYnl0ZXMubGVuKCkgJSBudW1fc2lncyAhPSAwIHsNCiAgICAgICAgICAgIHJldHVy
biBFcnIoRUlOVkFMKTsNCiAgICAgICAgfQ0KDQogICAgICAgIC8vIG51bV9zaWdzIGNhbm5vdCBi
ZSAwLCBhbmQgc2lnX2J5dGVzIGNhbm5vdCBiZSBlbXB0eSwgc28gdGhpcyBjYW5ub3QgcGFuaWMu
DQogICAgICAgIGxldCBzaWdfc2l6ZSA9IHNpZ19ieXRlcy5sZW4oKSAvIG51bV9zaWdzOw0KDQpz
aWdfYnl0ZXMubGVuKCkgY2Fubm90IGJlIDAsIHNvIHdlIGtub3cgdGhhdCBzaWdfc2l6ZSBjYW5u
b3QgYmUgMCwgYW5kIHRoZXJlZm9yZQ0KDQogICAgICAgIHNpZ19ieXRlcy5jaHVua3NfZXhhY3Qo
c2lnX3NpemUpLm50aChpbmRleCkub2tfb3IoRUlOVkFMKQ0KDQpjaHVua3NfZXhhY3QoKSBjYW5u
b3QgZmFpbC4NCg==
