Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5910A4908DE;
	Tue, 28 Jul 2026 21:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785275699; cv=fail; b=df5TdJIBv2vlgIuXXE7R4uCfjzIL31879UFFcnbxz3ASbCO+wzQcuicfpLUVanQ8MbRM4Vj5jWmSS4P+wTJrHqMf+ogUU43A7CXq8ZjJEcCqTymBPgHiIDBlye9xfJ4dFFz+H98lCj4tfc6QNgR1dsVpFBf9+4EB9kCtX8Nj8HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785275699; c=relaxed/simple;
	bh=mVKYGAT0xTA0geQnxv/lYjPmnbTm8mDXNd7HDQKyVSE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HTZ+i+QV/XcsFF1955NMB4cC0FqheUwj/Ah8V3u0X3XcGPY5Bnmd8QHqhczBHQyRzFCSS/6RsunwfSxwzqn4iV7vlXI5NkDCwqZ4e+2HAVw4T/+ckU50sfAk1MARr6EU8NHMzyi4/glpwToXmdpoCQKVlNpexNBhLrtYaPHJaBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RgaKptmk; arc=fail smtp.client-ip=52.101.62.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RgaKptmk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyCSimkYaXIPhgMoAwS2Ekjrz9CzK62OoWGwDphrFKTEwnHnUFvgqmggREFkO1sg5u+dtyt8yk8JZa5JkWC5y3gQmCPbcG4M5r+WsZWSa+FMIAZmoHTZjYggC+8EWb4t6m3YubfoTxuxJkk/yFaOYSYTKWzhsUmXjFDj5YRITDWUlGbaT671XG9qb8ewlD8xBc8zB/CDYl8pif9aZe9vUwHlBHJPhNNzTI97iJLxER0pU0Z6OFtKZymTH3mKKAsZiC+hx8y5x15theQX4NrZPOiYxtW45HaKgnhFfDXP/ycP3R6GChMpWbjtO6CSEEJN5I+0I/waz5oV87dtpchXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVKYGAT0xTA0geQnxv/lYjPmnbTm8mDXNd7HDQKyVSE=;
 b=evM2i7GHUkwJ8aAdica5BSbqGbDezC4/nJ6zVEX6ayPAlIgxCwYawje+dzCyAanR/nfEj1mXt8iUM1PNhXy85bz9wQnS0/K48pMcjBzdWD1N3Z941M4XrmX87uI/yf8EkY8dC0AtFcIgNpx6uKVVwzJdEZQM+wLa3CBPjhNaBEBRKeiFC2i7i0QrsPTF6vdw6A6XrOIkc/7P1e5sIsciu7Jj92rZOJm/LhUkkZawv2rMT/WW6M8nSLnnIdRRz1kc7C5GRzMVhZKUcfali92NyKyOMTEtgaYMRj8veX4ky+13U266hhAfCml5PzRPgvMLak/W2EnYN/46oV1mUBYQCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVKYGAT0xTA0geQnxv/lYjPmnbTm8mDXNd7HDQKyVSE=;
 b=RgaKptmk/419eFu6X/2pgxAt7fzMVXnKcvgMiBSWiuM7dkt++MmQuuM66avl/jrGgzk6uBCE4CHY4Anhybyp1XJ/yfPCruWzxxkeX3klQnljsq2KDXFRzbvo8Gq3xnPUIaFadKux7ti62/yPcyRU5/TP3PXaGtL2HsMNTOMmzVfzsORBmRHBvFf5JjgocdNiGaUsdyUjGJ8aLobPc66scuItx5jB0L7g0wOrSXCgdLOCDDtD+3vYVZdo8iztyuT0WhfaSxOxkdLmFkZ2e0dgrsvJv3ert+BP9cduA05Ei1wHFr+XcprUWnxY0QGySFEfGDV5owX2kjfIUVRbNIWmQw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by DS0PR12MB9447.namprd12.prod.outlook.com (2603:10b6:8:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 21:54:52 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 21:54:51 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>, Gary Guo
	<gary@garyguo.net>, "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>
Subject: Re: [PATCH v5 8/8] gpu: nova-core: update firmware module info for
 TLV images
Thread-Topic: [PATCH v5 8/8] gpu: nova-core: update firmware module info for
 TLV images
Thread-Index: AQHdEMCSL1/V0aeYFESjx7KBq9TE67aBHEOAgAJ5qoA=
Date: Tue, 28 Jul 2026 21:54:51 +0000
Message-ID: <51ad1719-c9a9-43f1-b516-aa04613c1e53@nvidia.com>
References: <20260710230428.865447-1-ttabi@nvidia.com>
 <20260710230428.865447-9-ttabi@nvidia.com>
 <DK976GZX46TW.2LCDS396N4EVS@nvidia.com>
In-Reply-To: <DK976GZX46TW.2LCDS396N4EVS@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|DS0PR12MB9447:EE_
x-ms-office365-filtering-correlation-id: c85c6faa-7c8f-4d3a-09f6-08deecf2da19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 ily9iGCcD0pAMzM5IkZ3U15Lge7owuTgIOAUYuJ8ZgUAUGFkbJTbmFsl1KUL5Ydqrc7zJFOHp1RHozOk4RyQJfdWmZE8tEYw5XsyyeXOowOSwVCrQVne3MkfmmtiqrJglTFiZsmVUEAZ6MVQeKcK+nPHITUnO8HL099r3effL5Hx3bA1zed84UiX2cHQS2SfFoZcH/+H22lUwuzswv7NtnRiqcIl1XpoFjgdPixzwl3DCjWU17IdrQ7+oI7ZudjzZ2cfqOsWghS+UwM/FUpktzLBV4SmXknTvBTBnP42skiJColaY7Sl+Muf+D/3DkVemqkT2PBTV60431wd82kWNHGYIRLNqcsGdWJ/RbWhOSMYTbattOV87nI5UqTC1W8bKvIN8jsEA3tooBYv2vzKBIuOjUS1hHJF+I5obLhVGe26uQc3Tei6auoT5ImP0TAg5DsqXUro+wR1bx9LEPl8MBg9+DG0ia/WWVoqMbv9qLpKAYe+PspQdIGRJEf17L8IY6fFd4V1bVbCnvmtaMOHrZV4j/pyQU4+m4DpXcAMhxhpR+aWbeToUg329rS6LtXk4yTJSEm+xifO/Dvo/BtpQuWgJPwmytPdAH1zgoJYxIFGjsvmHlwUz8BcKtfCBZ/8AcM0VFVr1devaF5ij+nbYjf8vDSEWH9f3hXmof1DkdqN7+FypLi/4NOyPI6OcYF1IToENn8+WEeL1JqgMDGiVntA911bvcaFEjAtUvgHDo0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXlMa1Mxb3F1SUkwQTNBZmNDd29DTC9nQzZRYUJOWE41TExyRzRESzNvZk1n?=
 =?utf-8?B?QUxFM2pNZktLbzJubXJuRzhyM3R2RlpkSTdKMlFrL3N0c0d0MTRSNmdTY01i?=
 =?utf-8?B?RW9taVRCOXNncWxmckpHVlpqTERzaDZWMHcxNnJ5dC9WRS85SE9GN0dSMjJn?=
 =?utf-8?B?UUVQOFltZnlKby9UNkVxR2pSZzBtUkxCSHduQTJ2OEtMZkdFOVdEY2lDU3h5?=
 =?utf-8?B?NEUvRDdTNko0QWFlVGpFK3dack53TFg2M2I2UGkxS2ZYSmxhNmRnZUFkMGVn?=
 =?utf-8?B?L1docHArQVdqcFVFMTgremxURk1OT1R4K2JrVGswMDY1VW9qZElQQmNjdkxS?=
 =?utf-8?B?L2Z5UzZpQ3NFRkwrNFJhV2p6U1l0dTVDdmJ3UVVRRWFJbmRDTWhRdlFjTEN6?=
 =?utf-8?B?TzVDUTYyMWswcENGNEhFM1pkYUhKZkk0YkRBK1RJU2dpRjduWXlWeWRaejNZ?=
 =?utf-8?B?bUJrVDRibjFXalZsOXR0UDV4by9oRFQ4VXlUay9CRGRBMDVXOUJQWFZBYzZP?=
 =?utf-8?B?aVFZSnk0b2JaWGx5eHNsMG9IZnAzeEwxdlNuU0piNXFrWnB1bGlDWm9sd3Fr?=
 =?utf-8?B?ek80VlFkOHc3ZmY3TEhkVVBkOGJZRk5ZMlVrdVZhV05vTXYrc0FxN3dhQ1hB?=
 =?utf-8?B?YmZOU2FNQUJZaW9DMTBab3VjQ1RzUURHSFREZ1JvVWRkbHVIMlZra3RuZ2Vv?=
 =?utf-8?B?MHBraCtOaTBBem1NMkZzb2U2TFBHeTdNNWhTMmV0alMxR0Y0UXNlWVFrSkMz?=
 =?utf-8?B?OVJUemgzZTB0clZuZ2N5YTl4V0NKZWp3WGl6NFp3bmNQUUVONU03Q2FIa3c0?=
 =?utf-8?B?WGhJa2VoYlFnc01Sbkd5VVVFWkNNZ3NPRThyRDlaamlZZTBZZTBtdmVPTjgv?=
 =?utf-8?B?OXVKR0k1Zi9sUFFXZi9XVjBYdkpsMlFjTUpNN0JyTS9oVXdEMDhDOW5CazZa?=
 =?utf-8?B?d2NTU0EyclV0NzNua0VJNWpjeUI0RVRpcWZaSllLTi9hNFArUUVCMktJNldp?=
 =?utf-8?B?dlpUWWhpTDJ4U2oydVJhSGo3RWNYcmFqYmxJQllNckp3V3QyLy9IWmd3eDRG?=
 =?utf-8?B?QlZSRlBya3U5N0oveHRyMVp3SDgyUDI1ZzhpQk9oNFFCcTBDL1laZXEwYjBH?=
 =?utf-8?B?NEtEQjJ6NGVrMkR0UHUxSzZURGtObzU0aE1PWU1BbEE0dGZwejhMTWEyd0lM?=
 =?utf-8?B?OUoxTVA5U2lLVUluaVdxaFJjdmRFeHBZOU5ianVBcVlrdUJLQVBpREFEb2VD?=
 =?utf-8?B?S0dnbW0yVUlDUkVsenIxeHdlTzJNVEo1SllPSzJJaWNFOGZHNVBDNDJMVnRz?=
 =?utf-8?B?WmJvQWQ5cE4wOU96RGZvSjR4R055d2g1TjdWMU5vUlYrdGNPWERLbXVmVTM0?=
 =?utf-8?B?bmk3ZDFDKzNPdlN2ZGV5dkJaSHczWWFaR1FOdEQxWDd1cnA3OTdLWXExdkI4?=
 =?utf-8?B?MGNPNVdmRWVYcXErRjdKMEJVZ2FTaFJVQU5IQ3RVWWd4MWMvMm9BdmxwZjZQ?=
 =?utf-8?B?VUF6R1RaeVJMSC9SUHQ0THRqWGdpbXdRSEFHN2pxTVRCb0JpR1dqUW56OHpU?=
 =?utf-8?B?K0JyS3pGc3pqWkM4bEQ4aXhRd3VvdyswZ1FVTWpWblF5eFU4VTJMdjlHMXVh?=
 =?utf-8?B?bHM4YnlWeHBnM1ZDOVNwQU5kbjJaRjBGcWxQc1VCU3ZQMVNqb3VxYitRNDR5?=
 =?utf-8?B?Z2RUVzNGNkFPNFI1VklUMkNTSU5yRWNKcDBScW1vSzdPV3o3UDNCa25CcjhZ?=
 =?utf-8?B?N211VFJVU1RuVkJZWHQ0emRRR0xadzZQZTN6WjJzam9DditYekg1RlY1Z3FU?=
 =?utf-8?B?cHJGMEtiSzlyVEhPWDVWRWJyNjVzQ1FrUWVrSjcwSDd3aUVpZ3AvZkE0blhk?=
 =?utf-8?B?SzFwbDlOWTNUWUpDRTgrM01YcktabjdkNmVHM1diTzV0VXk5bmJqK1FyVkVZ?=
 =?utf-8?B?Q2V1SUJVOEtKQVhMYUZnaTlUQ01JR2VQR25FcW50RzVCajBneGFwa0JFa2Ns?=
 =?utf-8?B?TzBWbWg0T25QSHFuS01CajFUVCtGU1o2d1dEUWZrYTd5QmkxSlBTQ3NaOFhV?=
 =?utf-8?B?Y0VFL3BQMGtvQVVQZVNURWJWNXBDeGxPUGZ4Sk0xZkN5UnROZWwzSE9pakd3?=
 =?utf-8?B?aDlMVythRkVOb081VjJxaHEvTHJqUHhFOFFVVCtQalU4aU1rVWRkTlppZmlR?=
 =?utf-8?B?USt5WEVwaTRaRTdHMFdLWFNKMjkwV1d3UWlFSlo3TGV5czg1MVB0c2c1OE1J?=
 =?utf-8?B?S25sNlZvV1ZNZW00Z2czUjlFMGNHeTJwVzBpMU9Xc0I1aUErS2lpWExBN0Uv?=
 =?utf-8?Q?pWSaSUpmqMXqQlVfXn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE607D15B24B4F42B11C41D89EEDD66C@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c85c6faa-7c8f-4d3a-09f6-08deecf2da19
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 21:54:51.7607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u6wSlccz7Y3TWKJwInJKV/xdMXwJ5q091zUx87WgqV3I3gw35GkojjgrNfHNn5o/9GbrZ8nBvIxm7bkxB56DvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9447

T24gNy8yNy8yNiAzOjA2IEFNLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToNCj4gT24gU2F0IEp1
bCAxMSwgMjAyNiBhdCA4OjA0IEFNIEpTVCwgVGltdXIgVGFiaSB3cm90ZToNCj4+IE5vdyB0aGF0
IG5vdmEtY29yZSBsb2FkcyB0aGUgVExWIGZpcm13YXJlIGltYWdlcywgdXBkYXRlIHRoZSBmaXJt
d2FyZQ0KPj4gbW9kdWxlIGluZm8gdG8gc3BlY2lmeSB0aG9zZSBmaWxlcy4NCj4+DQo+PiBBbHNv
IHJlbW92ZSBGSVJNV0FSRV9WRVJTSU9OIGFzIGl0IGlzIG5vIGxvbmdlciB1c2VkLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IFRpbXVyIFRhYmkgPHR0YWJpQG52aWRpYS5jb20+DQo+IA0KPiBEb2lu
ZyB0aGlzIGluIG9uZSBnbyBjcmVhdGVzIGEgcG90ZW50aWFsIGJpc2VjdGFiaWxpdHkgaXNzdWU6
IHRoZXJlIGFyZQ0KPiBwb2ludHMgaW4gdGhlIGhpc3Rvcnkgd2hlcmUgdGhlIGZpcm13YXJlIGVu
dHJpZXMgZG8gbm90IHJlZmxlY3QgdGhlDQo+IGFjdHVhbCBmaXJtd2FyZSBmaWxlcyB1c2VkLg0K
DQpUcnVlLCBidXQgdGhhdCBvbmx5IHVzZWQgZm9yIG1ha2luZyBpbml0cmFtZnMuICBJIGhhdmUg
YSBoYXJkIHRpbWUgDQpiZWxpZXZpbmcgdGhhdCB0aGlzIHdpbGwgYWN0dWFsbHkgbWF0dGVyLg0K
PiBDYW4geW91IGZvbGQgdGhpcyBwYXRjaCBncmFkdWFsbHkgaW50byB0aGUgcmVzcGVjdGl2ZSBw
YXRjaGVzICg0LTcpIHRvDQo+IGF2b2lkIHRoaXM/DQoNClN1cmUsIGJ1dCB0aGF0IHdpbGwgY3Jl
YXRlIGEgbG90IG9mIGNodXJuIGluIG1ha2VfZW50cnlfY2hpcHNldCgpIGFuZCANCmJvb3RfZmly
bXdhcmVfZmlsZXMoKS4NCg0KPiBBbHNvLCBwcmVlbXB0aXZlbHk6IG5vdGUgdGhhdCB0aGUgbGF0
ZXN0IGRybS1ydXN0LW5leHQgaW50cm9kdWNlcyBhDQo+IGhlbHBlciBgYm9vdF9maXJtd2FyZV9m
aWxlc2AgZnVuY3Rpb24gdG8gZ2V0IGEgbGlzdCBvZiBmaWxlcyByZWxldmFudCB0bw0KPiBhIGdp
dmVuIGNoaXBzZXQuIFRoaXMgbGlzdCB3aWxsIGhhdmUgdG8gYmUgdXBkYXRlZCB0byBpbmNsdWRl
IHRoZSBgLnRsdmANCj4gc3VmZml4Lg0KDQpBbHJlYWR5IGRvbmUgZm9yIHY2Lg0K
