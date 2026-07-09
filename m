Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012005.outbound.protection.outlook.com [40.107.200.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3CE1A9FA8;
	Thu,  9 Jul 2026 22:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783637071; cv=fail; b=BLJxbtkcAclf/m7Af/4QpB8TPwCr1EZzJC8sTOL3lCiX6z7NYs8gI6nK/6B7pv2JEMPS88CZSUclZF6PmkwTAIK/pTlJU60hWqmOxv5jFqvxS9V2GtcKDNZ/wNXmxbBYKJMMsFo5Mll+Iw0kakGkOxFtyRliGLFu47OLcPVPxy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783637071; c=relaxed/simple;
	bh=ga2UTzKjrxkW2ASvNA8ap5+tpO2+dGnmDCrRszostGw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EpSwe2U42752zNoi+UQFio0LMJZQqV0+Iu8oUrF9UL4yw5q4WH0FxCxlVtMEYOt6cbZCyhjovr7bWC1l5SB2WS8jKoCO1GhQUOwKyYH/ot3j+kv84xGK2/7hz3OnTzyGqEde8PpSJixnvhasu6Cf/tgbB3cD4/7SPOz9O39FqiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cQj4NvlG; arc=fail smtp.client-ip=40.107.200.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cQj4NvlG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5USTy0x1asWhUg5aw2IkRoQ+rM2lyUzTVXB/7pqqKtO+l++j681o+ErC9ySZJV+DTb2pQcjdT4KAt7NTLYr1oz+FeHTBtigyTnSaOuWNqLqjnv8vKRrFVh8zQe6i+QAur7xZSWWBlOWqCtWTKQwsX7IbvSX5y07Ykj5sMnx1kzF2u/GXbVjr4R9h0P36YI7zFzx8kMDgbqPxjYRs7fnGHmeXo/fQrIwgKYhK+Eq4zuomsr/+eo6VtnsdrUQJNXj2qpGrO5QVEqbuee+SdezJTGdh15g9o/+v9I+vkHEHohaCZfF7yizCZvN+we/aCR8G0tVScl7MAQewg8Hk6T9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga2UTzKjrxkW2ASvNA8ap5+tpO2+dGnmDCrRszostGw=;
 b=ip+IT2X44YJK2pfdKX09RHWiNaYDNGcemuyPdxh5VE7MWCrylMs2kfnsiIQj9mh/EzjBY4g9O22SgaS7gqYLwEFrj2JhCcjnDvHe5hjO5Nl/51+BwjQqUN5iqr+f3x6ZnjXwZFrDGa/mZoyOtpT8K6c8g9UiQhN4vxcZWLJnmGTykuZg1ACQNbf5iKB8bmxUYQroomG3tQZUweicwNPV1kbP3G5K9k0R98nJiXI+rzlQhInLoTmeR0EgENfO0uynsmDe2kOtDoSy4efzouIyKR/gB0zOQv2xcUYbRYzQRCVm4VCkQzcnFY03DIe75w23I6RQPJ5o+sodLRnNmza50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga2UTzKjrxkW2ASvNA8ap5+tpO2+dGnmDCrRszostGw=;
 b=cQj4NvlG/PSpC1gJj7aqukvHW4LIXQbd/yABTctzFW+ZDBTDas2MAZAXAKD6MGyOs/hCBm5FtWhZnn5qZo3MhLBwXexs4v6oCSRPiVfjuxh7ZmKfSS5W/2Tu5XdovJoJRJdjR/1i0c60+7REHn49NpH7jdfFioq09DMkC9Ytnb6tLE5SnLBI5r9XOPbxLSL7G+MbwPDEyg4FdXExeR8Rut+Yw5MWSp04Ig1VJhr7vVpNFzSDJj3WOVOTtw9Fes9CPeOvYfvk4ZCi+ULZNc2rNRdeTDFvwGgRWt8ITASolV4JOHRQrL9s60macZRrAA+q0JP7WvLiEiWCCUO2bJNWMQ==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by IA1PR12MB8496.namprd12.prod.outlook.com (2603:10b6:208:446::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 22:44:24 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 22:44:24 +0000
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
 AQHdCljkwu1+XAkqMkK4e6h+pSRGELZgDX4AgAQve4CAAEKSgIABP1WAgAAGGQCAAAa6gIAABHAAgAAC3oCAAACZAIAAAK4A
Date: Thu, 9 Jul 2026 22:44:24 +0000
Message-ID: <a0db76e5c083ea82b28c01e8a5728ed3183d76b2.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-6-ttabi@nvidia.com>
	 <DJRA02VV16AS.3W0QHW9YYSLXE@nvidia.com>
	 <79b4033973c675355a25d8fcc701cdedf8f30bc7.camel@nvidia.com>
	 <DJTOMSK9WVHH.GA7X7JR0PYIO@nvidia.com>
	 <09b1d5117a38726d216074d7e3d56d4aeaae2bb1.camel@nvidia.com>
	 <4fa55816-68dd-4642-aa7b-c7e6f3d528b4@nvidia.com>
	 <6cb2d2292131615c44e03283092724a11b9e5619.camel@nvidia.com>
	 <fb1d6ebb-cb45-442e-bfcb-73d3ba82fbb6@nvidia.com>
	 <e617f2a79322f05aa26d21492954c07f3b1b47cf.camel@nvidia.com>
	 <8f7a9763-1e96-4bab-92a9-708eaa526986@nvidia.com>
In-Reply-To: <8f7a9763-1e96-4bab-92a9-708eaa526986@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|IA1PR12MB8496:EE_
x-ms-office365-filtering-correlation-id: 4cf01b40-d1e5-41a5-49de-08dede0ba025
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|10070799003|366016|1800799024|38070700021|11063799006|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 C4cau92nS+quZqhIU+8KLl1YeHkjBPMW1OjuJ7iOet4MIknlqBdJ6n6syl7cnL8xm/fS0i0HIT3xpAJ2iHmDUIHXDyqTf9krOHVjoFmxq0BhA1+o9PZ8SFPW/mS7BT+rVWcQpDJemgPgHDR5QvqH+OlnRjSoNOQGx1PC5fplS/ddm+fPWqkts7qqakkduRQXL9/79s/L5UoYhDL6KLvFMmfa6l0rnS55ChhQ1wn/cxrWc0rgRiEW5phZ1/sd3asnQH62oui1JbSyF1/iQPUb5V+TaDRPPf7cCH346DHvsNnfPnpVgO2KrE9z5rOjtPqehn7ru1Q0/3jG/M2C+LgPvax8IcTB8lnGEFibMkxdh8q4WuXQAXc07Iab8uHnyMjVnKykQZ4Fzk0F1wj9p7YtUg66bniRhnDFvmG5OviLNZX2nzJ+jQ/1McLVE0dCneUIq5Q1BKQjvlTBaOKdFYJ7MkHvk4bm2RXZywIuaJVl2a9aEal9JLp3ppg8Q4JQbDczM/T3MfT6UDxPIAvErLDOW9v1f7/SvA4HuQAzN+WqqzmRlBfv1WP4g8wf71NB+CZORzHF3aJfLRrJNrrnUnPlKTyN3s0vo+/mogvVxtgKSIgOVrp47NDTZ39SY2HJ6F7lCz6ANlHQTMBj0fG3qYhbFns2tcgAzG7nFrzVPtJ77ARCdXM7tzwx8DHnguvJ5N+s7QbbuVKrXEf6i3WIWV20eA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(366016)(1800799024)(38070700021)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1piUnF3VnZCVWxLNmdVUzFRNC9PdnJWY1pnUmlhODhWYmQ2WWpNdTl4bkg0?=
 =?utf-8?B?U0RSbVpCM0x6NE1od3ZhU044ZzB4bmlweHBabUltSGxia1NJUk4vOTBTaVN6?=
 =?utf-8?B?OE9iY2J0amNuT1lZemJjc1ZsRWpyeWprd0JKR0drTDVvd0Vob0VMT0VhWnRX?=
 =?utf-8?B?aHNaNWtVdmRMTlZYa0dxNEhER2RBK2p2clVhbmJxQVJmWG81RmxRNjN2ZE1C?=
 =?utf-8?B?VnNVa0tKSys1c2Z1K0VtenREblFKMWJZMmNZOEVRVjBZZzE2MlRrZDVkSU1J?=
 =?utf-8?B?c2VOSE9jT2d2NlRlL2hVeVRqbGdEQmJlQzA0eEp2T1JWTGYzaWE5eEMvV3c5?=
 =?utf-8?B?Rk8xbXFLTU1sd2o4cUp0YkNtMHV4dTMwWUVoVm52N0ZDR1NKNEFwN1htWVRJ?=
 =?utf-8?B?M091SStmcGJIN1dVemVHaTlJbkdDMW9TeWZVV09VSmRmV1NiYlArUHlVaVZQ?=
 =?utf-8?B?b2FnWmRuZm55MDgyMnVIUSsrNjlLalFmY25rNm9ZZnNHenV1T25XOXF4ZDN6?=
 =?utf-8?B?V3Q1TmcycFlidW9IVTlhdXlvM3FRQk5wdEM4T2t1TGtDRHh6MStzRG5Edkg4?=
 =?utf-8?B?ZklBQ2RnK2laRmVVeC9ER3RpWWU1dngvYk9yYzk2WDU1U1RUeHA3dkJPbVl0?=
 =?utf-8?B?VzRoUE5vTXVoVWMrbEtoT2N3a0VNbGZlZGwxQ3R6S0xFR0llQk4yWllndnBr?=
 =?utf-8?B?MmpxVUU4bTNYL3RhZkQ4SVJpcVlXbUQwaCsxZ1NFRjREbTUrMTRDTGN0MzNT?=
 =?utf-8?B?dENtVFlOK1cyRlhNcVIzSkU0L045VFpET3A0YXFMSEpRdGVpVzFab09FRzl2?=
 =?utf-8?B?aVk2VForTllKZmNXRUs2eStlMEYwYWZEcmVYeVRDN1owMHdJK2JyelZBekxj?=
 =?utf-8?B?cWIxTS9rMUx0VnRUUjF3ZDYwZG1rMWRTcmhZV3QvL1hCemE1ZmY2Rldmdjhl?=
 =?utf-8?B?S2ZxYjFBc3ZZS3NSNlh2a3RiVHNBT3pBMUdRM0IwRkdKdVdrVC9xSFA2UGpU?=
 =?utf-8?B?WnlPVnFFVGFYREhJS3BDZ09JUmRaKzhGZFp5OFIraFAwU2tSR1dLSzlIUzQr?=
 =?utf-8?B?dlY0TitpeE1BeC82Sno3bkRWYUhZZm9QV3JHZVNzbWJCVVhKanM5Z1VBdVNT?=
 =?utf-8?B?SXh5emZsVWJsTDVZMGZnVTZtN2RicnEyZ0s3ZXl1aGNmT3RUMFJkd2ZsUkNu?=
 =?utf-8?B?bENQZHA4TTRWayt6a21tS0VXWVZma0orNThvUmZ6dXg0eVFXU2VLWC9HaUJl?=
 =?utf-8?B?ckwxUm5FclhXYW45NVoyalhXRG82T2tWdWY5dm50dW9aaEtjdU43ZVVnYVY1?=
 =?utf-8?B?UTg0UTIvOEJvRmdPcDRpN3VXblNZT0xPNDJTeTQyWDBOSTRZNGNRODNIaUdv?=
 =?utf-8?B?MkRYNFhrRml0ZHhibzkyc2U1Q2Nad2VuS3k3d1RqUzFlUThrWmx2aFovOEpu?=
 =?utf-8?B?RkZOaEs4dS9jb2FpZ0E3a3JxSjB4ditnTWV0V0gxVnhWYStadThaQXBqMGM2?=
 =?utf-8?B?Z0ZJdUtTbTl0V2ZaVndFM25YSjE5T3NiVW0xaHNITm9ZUnBFV2ZpOG91U0pG?=
 =?utf-8?B?UTNlaTRHRVUrRlY0R21rN2htdXArYkQwdFFlRjhCNFNrOVVJai9OZG5zUnc4?=
 =?utf-8?B?YXVyVEMzRWdvcFhqSG9ybkU4blZCZ2tkYXRVaU9kaFRsK2UxUk90VDdDUjJ4?=
 =?utf-8?B?TWprZUZRR2ZySEkweHZrSkFqaWJmZUw1eTl2UURya3Zhb0gzajJHbzNZcFJK?=
 =?utf-8?B?dy90WTY2ek1IbmxXdTMydEgxVGhEUHFxbFFvUmhibEVVREV6STllRS9WdnVG?=
 =?utf-8?B?YjNFTzVLc0poOUdaTE5idjdhVlNUbFVxOG02V20ySmhLWVpzbUYwUWhBV3E2?=
 =?utf-8?B?Tnp3cHdJSk5NMXFxSHlscmN0SWx1VFlxMHBHRGR5WkdvK2ZFc1ZydWpneitS?=
 =?utf-8?B?NkNSY0xDcSs1YkFDam1wdkpBVEx4c0wwQ1NwMVZOVkwxVG9GRHdVbDFJdGk4?=
 =?utf-8?B?SFJiKzlBNzlDWVl4bEZsK0Rka1FNRGdGNTJrWEhHNDVteFhYSlduektqMGkv?=
 =?utf-8?B?R2thQTZadXl5YXlCTE1NRE0xNFlIbFFDUjhiZXBLUEwrQVJkcElyUmZCUGZZ?=
 =?utf-8?B?cjFJblB3RXBRSTVoRUxVVW9BUGs3WkRub1R4SmRUVzJyZ255RFlOSFJBYTc3?=
 =?utf-8?B?Y2R2QWdSaXJUQ3QxTVNucS9HNU9YNnJvU1hTYU1URVhCMERjN2tnOUNVMkdT?=
 =?utf-8?B?UTZKMFBJSUkwYnJyZE5lRTBNK3Z6ZCtHTVpZNG1oRkgwWFVZTUd5VDNOZVUv?=
 =?utf-8?B?S2hicXA4S2tuRW9lSEc2N2syUjhJSGljZkNFcWdUV1NlYjBqUXBRMDRSaW43?=
 =?utf-8?Q?ew+lFCzqxfO25av59IMvRbxKK9jXWc/6BnAQc278iYYo2?=
x-ms-exchange-antispam-messagedata-1: oqjh6ktzbts/FQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <92D08AD6A803144D974D14787F86AAB2@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf01b40-d1e5-41a5-49de-08dede0ba025
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 22:44:24.5592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8TogVBIYIaJZkq10bBuCCquah/54sNeKkrPvt1Fnjd5JS+i0A55FjQX+xR3CRZh5MA2qARMlC0Zs1OxyHKB0Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8496

T24gVGh1LCAyMDI2LTA3LTA5IGF0IDE1OjQxIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEknZCBzdWdnZXN0IGtlZXBpbmcgaXQgc2ltcGxlIGFuZCBjbGVhcjogdGhlIHNwZWMgcmVxdWly
ZXMgVkVSUyB0YWdzLA0KPiBhbmQgdGhlIGRyaXZlciByZWplY3RzIFRMVnMgdGhhdCBkb24ndCBj
b21wbHkuDQo+IA0KPiBJZiBzb21lb25lIGNyZWF0ZXMgVExWcyB3aXRob3V0IGZvbGxvd2luZyB0
aGUgc3BlYywgdGhlbiB0aGF0J3MNCj4ganVzdC4uLndlbGwsIEkgZG9uJ3Qga25vdyB3aGF0IGl0
IGlzLCBidXQgaXQncyB3cm9uZyBhbmQgd2UgZG9uJ3QNCj4gaGF2ZSB0byBjYXJlIGFib3V0IGl0
Lg0KDQpPaywgSSdsbCBhZGQgYSBWRVJTIGNoZWNrIGluIHRoZSBjb25zdHJ1Y3RvciwgYW5kIG1h
eWJlIGEgZGV2X2RiZyEgYXMgd2VsbC4NCg==
