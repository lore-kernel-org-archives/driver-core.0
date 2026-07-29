Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013048.outbound.protection.outlook.com [40.93.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA6A4C0420;
	Wed, 29 Jul 2026 16:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343093; cv=fail; b=pPpCxdtxD1fFNVLsKJk2Fxd7997X9Tzpr8FGNMK5ky4jnktzVgAMBLnBkhWlQA5vUDXhworuRrqLWMEChkAU2BVFTX11vScbICIdAbmjQIDIXrzf+BxzdTSLvRCm0kli1EHzo0WDm5iyAd7uF80oJB6BpczOUB5H530vbxtlpq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343093; c=relaxed/simple;
	bh=DGD5m2b1c1wq+B8mS1E9Jv+m5xSsABtfYtRsMlTJMxk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=huH5C1Ag1O3FNpKX2m+czCGzpDuuAjrqNYEAj9OVm6woPhT826uiaPvZOF7aiKr7req0HxBBmQrWNvsgLBhtYNQQi9mDWsUlOC752xdhan1shNqHc1Z0KOJxoYpx64oCPP+SVtQAL1gjIoTZEym+zs/zoZWQ5rxmdA2tKBdBMrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ny3nxO4k; arc=fail smtp.client-ip=40.93.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ny3nxO4k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itsg28T5KG3dtJDvoUJDOD0ZVYti6Y6UzoAuxuucPRKr2VdcqASXGOCE+fu+T22/VCs8Tm3vZVt2z+BIuEYV33j1Otq4MVSbytMldeQVrvd21psMHmufJAqQz54MHb7OrnC37/Lg/oaRXNTVoEl5Qk/Aq4BXYrQCXF2mUzjeVbFGq4MphXsCEIrY/c63B0Z2hr/we0c/sgJc+DUH9nwacRN16JEfRjJ6m0fJrf6Qi4M4HlCBooaUeh452/16Jn1cvM2WRycNerQ+J5TWzvuJPCBQEciV8x5d4wy84/4FYR5SgrMo9FyrT02XgWOYkv2+rL3bCgE9OjrY0NWNDXPOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGD5m2b1c1wq+B8mS1E9Jv+m5xSsABtfYtRsMlTJMxk=;
 b=XmNd/r8MK2U1VrxtV+gq8qw7zJYHFdb+mFYCgrRC+JmiL5BqrhvIGzK1K6p2oGCG6hNQN8dnFUpsPdjiBWoA8P1/MtfAxgcy5l14KJAS3WOmiZ7Tv/KZpFyUCpDDxdqvCbR3exDscsRbtFU11Sfj5/RCmzEoLP7v40mt9PCew4lw1bNod/FR1Ahit+Vw8bTVnMVyUkmFw40hmTsw6zIBRd6688zt5vPlZ26x+FaTmmBZdqV8pa+JQW0KllqZ6YPUOictvTob/uFBY9bILHeLCwtgr7btmAO8n0ne0YcJdx33TnCA9LFPepUGl31UzEjPvOCym9UJvIP+Ir8kj0Hhjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGD5m2b1c1wq+B8mS1E9Jv+m5xSsABtfYtRsMlTJMxk=;
 b=ny3nxO4kXeezjkNyO883xKBHOczsFuyVMj3nNS2R+iMaPN41xi31VfmRCN1BnajYy9Dcf256chQdW8Tf7WD/EN9AlBbEVZnzoQxOznN8mHI7OTe+NQsYUyYpdN54rBMIuyE/tw1E17jQsEt24JMKaod4xAiHSLB3Ep37Jy4+xdy526czloV4yngIN1/THUei4X6HtsCVIQmqhjbKWJ68+Ih+fe45Aw3i4/UhSEFumgBpZsCqJuyiQ+CyGyKprhm6nmnCX95A57sk1Et2WlMrxM8Ud6gUFD7OFPCt05+5aGxFkVYXzfP61Q2fQDfN4n0CewOeGhjjUVdqLeoX6hFhxw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by LV8PR12MB9619.namprd12.prod.outlook.com (2603:10b6:408:2a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:37:57 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 16:37:57 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"gary@garyguo.net" <gary@garyguo.net>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Eliot Courtney <ecourtney@nvidia.com>,
	"russ.weight@linux.dev" <russ.weight@linux.dev>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, "ojeda@kernel.org"
	<ojeda@kernel.org>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>
Subject: Re: [PATCH v5 3/8] gpu: nova-core: add TLV parser for firmware files
Thread-Topic: [PATCH v5 3/8] gpu: nova-core: add TLV parser for firmware files
Thread-Index: AQHdEMCQ2jhut/KpAUikVCB3QFh3IbaBVU6AgAN6aAA=
Date: Wed, 29 Jul 2026 16:37:57 +0000
Message-ID: <ba791aaea02d5caf9254278e170b9deae5305e6b.camel@nvidia.com>
References: <20260710230428.865447-1-ttabi@nvidia.com>
	 <20260710230428.865447-4-ttabi@nvidia.com>
	 <DK9BISU6MPAY.EK5385QYWU90@nvidia.com>
In-Reply-To: <DK9BISU6MPAY.EK5385QYWU90@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|LV8PR12MB9619:EE_
x-ms-office365-filtering-correlation-id: bbd1189a-615e-4ee7-0ca5-08deed8fbf0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|10070799003|366016|1800799024|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 9Hc/rtiFk8dE3sLivmrdf/V2zr8P6leFwaVgBeJB2PpzomovQHgtEDNvTbbuo5vgW9stCzvuCvtinIK7Hac+CkIA9y0Xp9BIUChF8A0u3jWrcZMBRHMPxA5Y5ZeCidVQA/jPHc7TpblkVsOpCwyqdA5/vrZ0497JxZVDAVNFDxPzH/iesJuDkrYhPUlB9i5H/84B5dTvV3LZEkLMTUnkP1PY0nn22cIZMBPnuRRD/3hhZoQPmpUbKZQs3LZpuehMlJZ6ZSFYmjY3z63Xa0iAZxW69/L68ZMzofCMcuaBua4pY3u007ZmAW1e1/8CsoI1zhWQ22YWziKYgwuQ31zwKpYY/kAmdIoFdY9BO4tsPVTF6EqmAMEmhIt1GQx7pq6NZfDtlpq6crf+APGuiYEi8dQ0xwhgnleL9x+iXQ0GTxQcqnfCfBQWK8DR4ImjhIj8o2VEgPxFFzz0eqqfTINNfzZDS6gbZI+guklQyxHcp74fC2HPPbDIvQXYEG1klBOs/aUeNRGau23QGfkFtDmhwip5Ac2QebkXN4d5Y89zqfU84HzQ2gmye1Gu/wIpMXoUPFLBM7Ok/AhG56xn5g9/g6TMnKhYFdU9rp9P9Unlj4TtA8FVu7kWmrkrv2uE8HnPToll3TGKBcbCuN0YRDrs1qeCCfFH4KI9KzS1EWT4YyGbakcdm+ZnWE0Q5Pu79K1uJqgu13rJpi+Lx0MnAEFUX9N1nZWyT0KGcYgZhM/CfwQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGovZGRnTzhNRGRvK0l5OTFZS1gyemk0NmJ4K0RFZDhjYkdKelpkOHF0WnZw?=
 =?utf-8?B?YmhoNXI0VHJEdWZiMkdtSWIvS1M1UkZmSDJHQjExYlFZeVZEcmxzdlhDTUsv?=
 =?utf-8?B?OE5maEQzc3JqdE4ySVhEOWtQWUZtalp0TFRPeXdBa3BRME9Mc1BGZGtsUU5j?=
 =?utf-8?B?M0tGbEVBOU16cDM2cmc0aWY5akxJSk50OVYyTzVOc2U1L01hK3pZZHNHbFk4?=
 =?utf-8?B?RmhNbS8zeXJmRjBKUG96U2pKNFVHSi9Yc09FNTNpRXQ5YlFWb0h3bjVGODJW?=
 =?utf-8?B?cjJCc0ptV2YwM1d3YndkN3ZvUHp4a0Y1Ryt6SGNEVVhVZ2dtb1IvdmtMcXZQ?=
 =?utf-8?B?L3ROd2ZFK0NFTDJZckRQMFA0MkozQ01HMTBoaHB6SDI5MER2dzJWL3lJMFd6?=
 =?utf-8?B?U3N1ZE1zQlRwKzFIVWJ4NDllTE1Dc1lBVUxiSVIrd242akg0Q1IzMkJCM1V1?=
 =?utf-8?B?MllPTm9HelhYSFFtSlhOekNMTllRSDFPQjM0QURTWVhkU3lYU3VJcTc3MnVY?=
 =?utf-8?B?dllYanBKUVBIOE8xMjZaaVRjZTRFZXJNcFdnSVAwSCtEb0ZzWStzQUttaEpR?=
 =?utf-8?B?UHVLbFdNb2tHSGtaUVF3K3lBdUNOZEZGa1gzMlV3K1VEM1IwbUVyRzI3NXZQ?=
 =?utf-8?B?UHFEMW5pUkNOcUZtTnJXbDhUQ2NWT3plQXJ5VmI4MmhLZ3hzai9UQ3Z2WHlo?=
 =?utf-8?B?TGU1RWtsdDYrVHZmQ01UTERKQ0VmTlBoSWFpRk5IL2ROMndwY0xNKzQxbmpl?=
 =?utf-8?B?OVJRekRQODBWRGVHYlNvK3JvM2xobTVkRFdTN01YTEd1VDQ4MnI0MEJNUXdM?=
 =?utf-8?B?VnlkSUVvRStyOUtzUDI2dy9ETWhnZnVDdk53ajh3SjVLTHFLejR2Uy93ZktS?=
 =?utf-8?B?bVBhZDFrMk9MTWp5Mzd6aXBZSC84QnlrNDU5ejBTbzN0bEdrSjkxK093ZkhI?=
 =?utf-8?B?YmwraUdRemZiUTZPc2RWYVBKVFJ4UTVtcEYwdGJSelJsdGw0bDVLQmVjQklp?=
 =?utf-8?B?bmEzUGd3ZWpsS2dycTRGU0hrd3RncGxoekJTeHpSZjloWDdpQkpaYjh4enRz?=
 =?utf-8?B?VDBBU2w1cEMrRFFUZUQvd1Z6aC9qeDdDQVhUNzdUU1dQQmk1eTRzcGo1bGwv?=
 =?utf-8?B?ZzgvamMrWENaY3B2M01NcnRURkYzWkZOQmEyMUJwRVB6bGtoaGFBYVpFMGRC?=
 =?utf-8?B?OXRJYzVzTURsYk5Ca3FybzhGdkcrZVhYbzhDdUcrc0JxNndObGIwVFBOaWpy?=
 =?utf-8?B?LzNtU3Q1V2JYM2E3cWJxVGVyV1BOdUdnT1E0N3JRZXJaYVBIdEtldGlrL1BH?=
 =?utf-8?B?R1NhdHJuTVhuVHN3K2VacTZJUksyS1V4QWo0RDRQVW9xQnpYcnEwWnNFeVpl?=
 =?utf-8?B?b0hCR0tSRHdXZ0hobHlGM1RJWldJM0trczg4OExQZFFKWStkOEh5U1pqanhY?=
 =?utf-8?B?LzJBMytWVUFFMjdtaXNCQWlXYWc0R0RrL3dWZTM0OUg4RUNqV1FkNldPcG5W?=
 =?utf-8?B?OFlkeG51U1ljNUI5RVU1SHVuSk9CeXJOVk5ZYk1SUDczdjR5REgvc2dmWjJM?=
 =?utf-8?B?VzZQYXJIdkVLTmdqQ0ZYVjA1NHMxb0hmWDIvWXdXdHF4UW5td0pXenc3QWFZ?=
 =?utf-8?B?K0Z4YUltVnNvZzQ3b1pxbCtpY2djRHI5WTZMaFdBYytFSTdLVEFvYWNBMTV6?=
 =?utf-8?B?dWU4cEVobFJURXhjR1hlUnY2Y0hTY2d3bWNnRXNKbXBIWC8yV0d0NlNDVmVN?=
 =?utf-8?B?QzhCOWpQUms0N1E0dnNnRHpwcTAxaTRkOTc1WU5hSXJGKzVYdmVxcHkyRHpX?=
 =?utf-8?B?cVNPcjFmQkYyWC84ZVpNNkw3ZS9xdHJWVFNFcEtoL3B3c2JOc3R0V0JXT3Bw?=
 =?utf-8?B?bERCT1BiRFA1M0NCVVB3dWNSTCtxWU1mNmNBQlZDdWR1UDVUS0MxVHBWOWVC?=
 =?utf-8?B?dWI2WklFbzlSWnJyNHFzZU9iWVpvS1pPMjUyZ0h2NXUwQnhOdHBKZzh0aVNq?=
 =?utf-8?B?VHNlU1A4bXJ3Qk8zMjRQVytEb2FRbm04dUVYWHptYVFLQ0FiM3ZpejlPQVkx?=
 =?utf-8?B?L3V1c3ZnbHdGV3pRYjRLYk1xVjgwS1RyVUhSTlpiTVhZajloQTEzNWJ3VFJH?=
 =?utf-8?B?OG50QXNQd3kyOFZWYSs4R2VkcllRMkwvWDhsZzZrSFQrRDN3NkE3ZVpKZXds?=
 =?utf-8?B?NVNwaTJibEVmcld3MjhndW4xZ3hUTTNGbzRXNVVnTHZpY1BQd2h5RlZrQkJj?=
 =?utf-8?B?YlU4WmVrNWt1d0dLdW05dndqTnJXSVF5d0M4QTM2UG91YWpZd00zMnAxK3NN?=
 =?utf-8?B?eC8rc3VrTXljM3NyRGU3MmE0NUFWWFA2a2k0VHFsVld4NEZzVWprb1RjUkVY?=
 =?utf-8?Q?6sm2kd9yQN4SVRucFwJ1TZdvtUZJJm903OoCU9NIaVKPa?=
x-ms-exchange-antispam-messagedata-1: VVZTmKUAD1nqAA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <942F3AB883D4C040BA3A1B5CF6C45370@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd1189a-615e-4ee7-0ca5-08deed8fbf0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 16:37:57.4345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4A1+vz85dhbmK5TvxSyiYLvxECzRwJcvgVBbctkYlZE0i7/8f3haBZXoaRx94eBGpB6Zg6jzHDU8GifecmURWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9619

T24gTW9uLCAyMDI2LTA3LTI3IGF0IDIwOjMxICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gDQo+ID4gK1RhZ3MgYW5kIExlbmd0aA0KPiA+ICs9PT09PT09PT09PT09PT0NCj4gPiAr
VExWIHRhZ3MgYXJlIGFsd2F5cyBmb3VyLWNoYXJhY3RlciB3b3Jkcywgd2l0aCBhbGwgbGV0dGVy
cyBiZWluZyB1cHBlciBjYXNlLg0KPiA+ICtEdXBsaWNhdGUgdGFncyBhcmUgbm90IGFsbG93ZWQu
DQo+ID4gKw0KPiA+ICtMZW5ndGhzIG9mIHplcm8gYXJlIGFsbG93ZWQgYW5kIGluZGljYXRlIHRo
YXQgdGhlIHRhZyBpcyBhIGJvb2xlYW4uwqAgVGhhdCBpcywNCj4gDQo+IExldCdzIG1lbnRpb24g
IlBheWxvYWRzIG9mIGxlbmd0aCB6ZXJvIiB0byBiZSBwcmVjaXNlIHdoYXQgbGVuZ3RoIHRoaXMN
Cj4gaXMgYWJvdXQuDQoNCkknbSBnb2luZyB0byByZW1vdmUgdGhlIHN0dWZmIGFib3V0IGJvb2xl
YW5zLiAgV2UgZG9uJ3QgdXNlIHRoZW0gaW4gTm92YSwgYW5kIHdoZW4gSSB0cmllZCB0bw0KYWRk
IHN1cHBvcnQgZm9yIHRoZW0gaXQgd2FzIGp1c3QgbWVzc3kuICBKdXN0IGJlY2F1c2UgYSB0YWcg
aXMgbWlzc2luZywgdGhhdCBkb2Vzbid0IG1lYW4gdGhhdA0KaXQncyBmYWxzZS4gIEl0IGNvdWxk
IGJlIGp1c3QgbWlzc2luZywgd2hpY2ggd291bGQgYmUgc29tZXRoaW5nIHRvIGNoZWNrIGZvci4N
Cg0KVGhlIHVwY29taW5nIG52b2Mgc3R1ZmYgZG9lcyBoYXZlIGEgYm9vbGVhbiB0YWcsIGJ1dCBp
dCdzIG5vdCBpbiB0aGUgVExWIHlldC4gIEkgZG9uJ3QgaGF2ZSBhDQpyZWFsIEVUQSBmb3IgaXQs
IHNvIHRoZXJlIHdpbGwgYmUgYSB0aW1lIHBlcmlvZCB3aGVyZSB3ZSBzdXBwb3J0IHI2MTUgYnV0
IHNvbWUgdGFncyB3aWxsIGFwcGVhcg0KbGF0ZXIuICBTbyB3ZSBuZWVkIHRvIGJlIGFibGUgdG8g
Y2hlY2sgZm9yIGEgbWlzc2luZyB0YWcgdnMgdGFnPT1mYWxzZS4NCg0KPiA+ICsNCj4gPiArR1NQ
IEZpcm13YXJlIFRhZ3MNCj4gPiArPT09PT09PT09PT09PT09PT0NCj4gPiArYGBTSUdOYGAgKGJ5
dGVzKQ0KPiA+ICvCoMKgwqAgQ3J5cHRvZ3JhcGhpYyBzaWduYXR1cmUgZm9yIHRoZSBHU1AgZmly
bXdhcmUuDQo+ID4gKw0KPiA+ICtgYEJMSURgYCAoYnl0ZXMpDQo+ID4gK8KgwqDCoCBUaGUgYnVp
bGQgSUQsIGV4dHJhY3RlZCBmcm9tIHRoZSAiLm5vdGUuZ251LmJ1aWxkLWlkIiBzZWN0aW9uLg0K
PiANCj4gU2hvdWxkIHRoaXMgYmUgYSBzdHJpbmcgYnkgYW55IGNoYW5jZT8NCg0KWWVzLCB0aGFu
a3MuDQoNCj4gDQo+ID4gKw0KPiA+ICtCb290ZXIgRmlybXdhcmUgVGFncw0KPiA+ICs9PT09PT09
PT09PT09PT09PT09PQ0KPiA+IA0KLi4uDQo+ID4gKw0KPiA+ICtgYE5TSUdgYCAodTMyKSAtIGBg
bnVtX3NpZ3NgYA0KPiA+ICvCoMKgwqAgTnVtYmVyIG9mIHNpZ25hdHVyZXMgaW5jbHVkZWQgaW4g
dGhlIGBgU0lHTmBgIHRhZy7CoCBBIHZhbHVlIG9mIDAgaW5kaWNhdGVzDQo+ID4gK8KgwqDCoCB1
bnNpZ25lZCBmaXJtd2FyZSBhbmQgdGhhdCB0aGVyZSBpcyBubyBgYFNJR05gYCB0YWcuDQo+IA0K
PiBJbiBwYXRjaCA0IGBib290ZXIucnNgIHNheXMgIkJvb3RlciBpcyBhbHdheXMgc2lnbmVkIiwg
d2hpY2ggY29udHJhZGljdHMNCj4gdGhpcyBkZWZpbml0aW9uLiBXZSBoYWQgYSBub24tc2lnbmVk
IHBhdGggaW4gdGhlIG9yaWdpbmFsIGNvZGU7IHdoeSBub3QNCj4gcHJlc2VydmUgaXQ/IFRoZSBj
dXJyZW50IGZpcm13YXJlIGZpbGVzIGRvIG5vdCBtYWtlIHVzZSBvZiBpdCwgYnV0IHRoZQ0KPiBw
b2ludCBvZiBzcGVjaWZ5aW5nIHRoaW5ncyBoZXJlIGlzIHRvIG1ha2UgdGhlIGNvZGUgZnV0dXJl
LXByb29mIGluIGNhc2UNCj4gd2UgaW50cm9kdWNlIG9yIGVuYWJsZSB1bnNpZ25lZCBmaXJtd2Fy
ZXMgaW4gdGhlIGZ1dHVyZTsgc28gbGV0J3MgbWFrZQ0KPiB0aGUgY29kZSByZWxpZ2lvdXNseSBm
b2xsb3cgdGhlIHNwZWMuDQoNCldlbGwsIGJvb3RlciAoYm90aCBsb2FkIGFuZCB1bmxvYWQpIGFs
d2F5cyBpcyBzaWduZWQuICBUaGUgc2NyaXB0IGV2ZW4gZW5mb3JjZXMgdGhhdC4gwqBUaGUNCmN1
cnJlbnQgdW5zaWduZWQgY29kZSBpbiBib290ZXIucnMgaGFzIG5ldmVyIGJlZW4gZXhlcmNpc2Vk
LCBzbyB3ZSBjYW4ndCByZWFsbHkgc2F5IGl0J3MNCmNvcnJlY3QuDQoNCkkgY2FuIGNoYW5nZSB0
aGUgZG9jdW1lbnRhdGlvbiBoZXJlIHRvIG5vdCBtZW50aW9uIE5TSUc9PTAgYXMgYSBwb3NzaWJp
bGl0eS4gIFdoZW4gSSB3cm90ZSB0aGlzDQp0ZXh0LCBJIGhhZG4ndCBub3RpY2VkIHRoYXQgTlNJ
RyBpcyBuZXZlciAwLg0KDQpXZSBhcmUgbmV2ZXIgZ29pbmcgdG8gaW50cm9kdWNlIHVuc2lnbmVk
IGJvb3RlciBmaXJtd2FyZS4gIEZvciBvbmUgdGhpbmcsIEhvcHBlciBhbmQgbGF0ZXIgaGF2ZQ0K
YWxyZWFkeSByZXBsYWNlZCBib290ZXIgd2l0aCBmbWMsIHNvIHRoaXMgY29kZSBpcyBhbHJlYWR5
IGxlZ2FjeS4NCg0KSWYgaXQgdHVybnMgb3V0IHRoYXQgc29tZSBmdXR1cmUgdmVyc2lvbiBvZiBH
U1AtUk0gZG9lcyBhZGQgYW4gdW5zaWduZWQgYm9vdGVyLCB3ZSB3b3VsZCBuZWVkIHRvDQpjaGFu
Z2UgdGhlIHNjcmlwdCBhbmQgcHJvYmFibHkgZG8gbW9yZSB0aGFuIGp1c3QgY2FsbCBub19wYXRj
aF9zaWduYXR1cmUoKS4NCg0KPiA+ICvCoMKgwqAgLy8vIFJldHVybiBhIHN0cmluZyB2YWx1ZS4N
Cj4gPiArwqDCoMKgIHB1YihjcmF0ZSkgZm4gZ2V0X3N0cmluZygmc2VsZiwgdGFnOiAmW3U4OyA0
XSkgLT4gUmVzdWx0PCYnYSBzdHI+IHsNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IHRsdiA9IHNl
bGYuZmluZCh0YWcpPzsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGxldCBieXRlcyA9IHRs
di52YWx1ZTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIFRvIG1ha2Ugc3VyZSB0aGUg
dmFsdWUgYWN0dWFsbHkgaXMgYSBzdHJpbmcsIGVuc3VyZSBpdCdzIGFsbCBBU0NJSS4NCj4gPiAr
wqDCoMKgwqDCoMKgwqAgaWYgIWJ5dGVzLmlzX2FzY2lpKCkgew0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBFcnIoRUlOVkFMKTsNCj4gPiArwqDCoMKgwqDCoMKgwqAgfQ0KPiAN
Cj4gVGhlIHNwZWMgYWxzbyBzYXlzIHRoYXQgTlVMTCBjaGFyYWN0ZXJzIGFyZSBpbnZhbGlkOyB3
ZSBzaG91bGQgdGVzdCBmb3INCj4gYHx8IGJ5dGVzLmNvbnRhaW5zKCYwKWAgYXMgd2VsbCBoZXJl
Lg0KDQpIbW1tLi4uIEkgd29uZGVyIGlmIEkgc2hvdWxkIGV4cGFuZCB0aGUgZGVmaW5pdGlvbiB0
byBleGNsdWRlIGFsbCBjaGFyYWN0ZXJzIGxlc3MgdGhhbiBBU0NJSSAzMj8NCg0KSSB3YXMgZGVi
YXRpbmcgaXNfYXNjaWlfZ3JhcGhpYygpIGJ1dCB0aGF0IGFsc28gZXhjbHVkZXMgYmxhbmsgc3Bh
Y2VzLiAgVGhlcmUgaXMgdmFsdWUgaW4NCmluc2lzdGluZyB0aGF0IHRoZSB0YWcgaXMgY2xlYXJs
eSBwcmludGFibGUuDQoNClRob3VnaHRzPw0KDQo+IA0K
