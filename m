Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2521A2264C7;
	Mon,  3 Aug 2026 22:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785794729; cv=fail; b=P+/ran+aQq9XYRPJj4SRl5qQn72tzXtkwYAfJS2TJrpjQ526VM2InMXqqdSEMYzbqu1HaY1MbicJ3/77oh3KeeUe/lMAIlyULkKpGtwxEbLsGI7NweCVcYI4qGBVABr3CKPhfQMCk5km7ZfENGyXgTRCHc5YrWjxFN3nfN6pHPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785794729; c=relaxed/simple;
	bh=FW/CIqmwbW9F+1ul8zk/HRD2qlan4UIVWXAZtBQ2/pI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WlTYd4epWfxmgqDDySEnbPWVN1QesUImKhsS6lnxwrGbLAk26WlmQeodjNpjstB8aPxxE83HNa/8dMOSRxtZWXDtFUNoe61lNbCStnyvm5iT0cXop1IalE45IdXx/cXeZMrqBRaHajV/huHs1XGd1hOXyGqKokjKvkK1C27Ee2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pH4HRw6P; arc=fail smtp.client-ip=52.101.62.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pH4HRw6P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8RvmFGrBq6RY3eaQHFK9RXltYr2yRNUFVckyQRX2lAFAUdSMH2qsRIgHWnCvUxYW2xaMeaVrkRIBkrbqjngYqZjBW0PdYuRb2sYHfQJJjT3rG0Kxz3eLtSobcJDzNmgNDxYsF3/M6jwiT2JdGEl4ReNMeen6XAxMIaIom06Li7mjkc2Hai/KWvXWnbQ/jsnMb5IceQT/0D8KjZYWQMsF8a+CYeprIGwowIvZNWrkoAOZRsu/QCYfJ/RqjKx40NCjEVfm3HkqO7/5281JTcFB/sG3xPDhJIgGltMKUbOyS6+wrOBrwaSBr+a78eP1BnI1Sht+B4x9gwM5++qATCGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW/CIqmwbW9F+1ul8zk/HRD2qlan4UIVWXAZtBQ2/pI=;
 b=Jt2ApRSNKABgVeWy/cUQygG88E0b8ePA8hZMOc4sNl6Sc1tii9TKcYEZmDKqRW8M2liuZKwW/ygQvEMDT491z1DooXd9jdRD2DfUbUlhmmk4mJ8vrsYM8a98NICKlNMRMuvG0lCZopLpqCk0GKSF+ia4DhtsTwrTV4Er6GKlJ03B1oVvK8epIx9KYebZj0MSgSoynf2zslU6esDkqu613lCIG4339ILM26IglouSkQvIkDaB6NR9Ok1rNSMdA9QuKwmUNlXuiFb6hkxxYdm7VovhGetL38VRd4EeN+Z0aL7+nBIwZum6ROnI0H5dSPB46dbE7JXj0PUf5T4sGJabSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FW/CIqmwbW9F+1ul8zk/HRD2qlan4UIVWXAZtBQ2/pI=;
 b=pH4HRw6PIkOC/UlLNly98oga1xrU8LkKbHz1wrOMTCokbKyeSmzshf2TG9zQG87USc7AxCxpTuPpKLC9qpiXhHev+CqVKjwYlSutPZKAdhaRASLDTm9rmjgnReYMu8hsXmcz3fbLM4dQjVybU3cCoBUwMyJO6mbzLDVTgGKHURldm+RG63wRtS3yozWDZXmi8izizPvthwAokak7T/TwBByIFE0d/Paus5+o23SZLEcy5ERi6Q8VXKJbHjiP3Ajps1zCOn/DLDGGgzgmQwdfR9QrG3EWY9d9fWP/ID4xXOZywTpbV+ugWzSa1npimubih2rcpYAMhpPFisjWCOHpEw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by LV1PR12MB999329.namprd12.prod.outlook.com (2603:10b6:408:3f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:05:24 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:05:24 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	"russ.weight@linux.dev" <russ.weight@linux.dev>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH v7 3/8] gpu: nova-core: add TLV parser for firmware files
Thread-Topic: [PATCH v7 3/8] gpu: nova-core: add TLV parser for firmware files
Thread-Index: AQHdISiuH+zd528kSE2WOE/KHyVDoraM3hUAgAAH9oA=
Date: Mon, 3 Aug 2026 22:05:24 +0000
Message-ID: <0c53c38adec26bc5df6b4658d3da53075001d93a.camel@nvidia.com>
References: <20260731201017.2580713-1-ttabi@nvidia.com>
	 <20260731201017.2580713-4-ttabi@nvidia.com>
	 <DKFMSHHGF3DE.2SUUP3FB7WXTK@kernel.org>
In-Reply-To: <DKFMSHHGF3DE.2SUUP3FB7WXTK@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|LV1PR12MB999329:EE_
x-ms-office365-filtering-correlation-id: 4530aca9-ac0b-4638-6201-08def1ab51d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|5023799004|38070700021|6133799003|10067099003;
x-microsoft-antispam-message-info:
 oDoPuaqZajAj3+4JePJoLIK3yMhVUs4gh98om/WtG+25WD3KGCZfpTxamcJFGRVA1C3MogwOZ1AxnrGvyxEoN+q8UY5UMpM/CYKee65IeH1P8nf6r76ppJrnaDjrrd4DqXtt7maFQKg64l4AU1O66YT4Fwk6d1AMmmu81g5xnIUNSxn9eAeEQK83ArC1p0xUwEK4CGF74e4k6fCS/+gp8uW7J8PpNKppoOXubsEtnjNAWHzyD7ACgWqWJjLs/u6bQRT7F/DlFh0J0UhQoDKouEHNpgh9zPQzLjR9oGTGplIEGTCNYGkdStd1Of10uMY0bU/ZbVGzMCzBqTaAce7dVl8VwNa1HbSYFdhcZEDPqCvK2a82PZgP75qw9cGrVs+hy1K8Qgaz7kb9skghLZdCSjWDoANYQIDloTb7sX9720SHP0cOU/x4NaZ6gYombYLhuzQ7KoBrcdSoNlQhhSgCGWGRfdwbzNsbORSOwntls6Nm0Lt91eKsiBg4uOzBQV8ywtQeF2oNfhuLN+riuIcxeMTH8FhoJLXt8E7q9i00Hug9LA9vCTjHeT6IRqy/u+WYghJ4ad5dvUTo8rYRqLjQ1lMlWd3m8U1bdm8gqnIHCvvbWDs4xz2cqhg+0Q1UytJjTm5GaVQMAWk7KC77T9x9NbD61d/lT5XGCDSD5wPDK243NBC+BBhms7zMYtoKPRWlOT9V8/ADbL7QGXxQJtYhZc6dreqiQndASorfqGHIU+8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(5023799004)(38070700021)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmFMb29Dd3g3V3greEdMbW94YzhXTVVZdjFuUVRGa1BES2J1Ky9ZbmNQUGc0?=
 =?utf-8?B?ait5RnE0Q0tGQ3Z5YkdCTHNOSzE0N1kwcjAzTGZzcHh2VUdRN0grOVI1dFd6?=
 =?utf-8?B?WDJON1pMZTYwWGxLelptQnhuaHNGQkVXZUFFdGxlS2VlSXRPUXdQVldQc01y?=
 =?utf-8?B?anVodE83OEM1Wi9YYWRodnBUU3BmNUpUSXFyZVYwVTBueXNMVjA3d3NlV0p1?=
 =?utf-8?B?LzdKRjlzcldoVmQwTVFROFVMTWR4SVdhTENoVnAwNExod1pNUjFqRzVyUXFX?=
 =?utf-8?B?ZlFVZEE4NmM2VElQWEd0SXp5SEg1Z1lDVlVka2Vubmdjd2RiOXRMUGRCTHhD?=
 =?utf-8?B?dzRTcnJOYmMvQ2d5eWRYaWNsV3BkUDlSbTlUZjBHckxtd2JaVktKQUlzWXE4?=
 =?utf-8?B?elp4czM5Y1dYVGN5aVFWQkYwK05XSG95WGV1MkhhM28rVGhKTEtnN2wxQ2xP?=
 =?utf-8?B?UGlrRlAwUTIzeWxGOWVnMkdvVDFTRWgrVTVxS2NTM3QvOHZmQXRqTTVHWUNi?=
 =?utf-8?B?T3NCZE16WUpRb3dxNGhpTFdwNnZvUXFRQVV5T2lQZnhqSGpEUGNoN01NK3Rv?=
 =?utf-8?B?UlR1RU5hNk12ZGppYlJFSXl0R2Q1UmFiWERpNW91dVlzQ3ZjOGF4YzMxN0xI?=
 =?utf-8?B?N3NVRFRUekYvaHI3d21RMHlEUG1LMk9ES3dNcG1zMWt1Q28rT3crQnV3OTha?=
 =?utf-8?B?cnBHUThRUFl5eXR4bkNTNi9jSjZrY2RFTHFXUnJuK0FNR05qUE1KenhQZmg0?=
 =?utf-8?B?UGZMSE04RVJHRmlZbTd1QVVSUERmdEhkWStWM3JpTVRPbFpjTVlDTlRtTFdl?=
 =?utf-8?B?NzBGSUcxN2U3ZnRNRHZRcloxQTY1djk3eU5wZzlQNWF6S2kvdlpaaE5yMEZT?=
 =?utf-8?B?RUJ5M1QyRisyYTBHMWJaNVRpckxvOFNZenBteTh6TWE0RS93cVY5OUdJY1Jk?=
 =?utf-8?B?WmtHWDZuNkdkQlppVU1OWEtzMm5jdkJBSjB2Vy85azg0Rmx6YVkwY21remNj?=
 =?utf-8?B?L3dPcThMbHZXVUoxTTZXVCtJUEJHTkNkZm54MXduVlN1Uzd6ZkVlWENyMGRZ?=
 =?utf-8?B?cFlld0luL0xpYzBuOGo5ZzFjd3VYSUNDdWNVZWxndGtqMk94UmpGS3dkNEdQ?=
 =?utf-8?B?SjlFTmhVMGU0YjNjN3hKdmxxamEzUkdYTmY2RXZCNEZxT0Rxbk10S0xTeUI2?=
 =?utf-8?B?NXRJdWZYZzdNd3VzR1NmZzZLaXVYNmVxSXFBVGgyWFlOUWpEbEZYdUg5MGJp?=
 =?utf-8?B?bDhSZ01OTmpuemprOG5iUE1YOG9SN2w5OXJqbVl6M2d1OHFDcmkxSW91Y3NH?=
 =?utf-8?B?Q3UyMmNUUldkdGlqZ1lMcklscW9lZlA1TzFDNGpQMFIyNmFGRFpHcGZrNzZZ?=
 =?utf-8?B?MzBFRTYrN0xyL2kwZTFuUGRDSnk5UDczQjUxRmxwTlRycjdXTWU3ckoyZEs2?=
 =?utf-8?B?Nm9oeXAxZTdSR1oyZVlxSjg1K1NpOElqdzRCaUZOdS9ORG5LSGRJYnlKWEgv?=
 =?utf-8?B?VEJzUlhMT0dQL3EwemgwR2xpZ3NNMU5IQk5tbCtnMVlHTmdUS1ZpeTNYVFNP?=
 =?utf-8?B?MEM1d0JrU3BqdHBFa2R2SVd2SHVORzJ2VzducXJLcHRRSVhNbWpDOFFhWWZM?=
 =?utf-8?B?ZnY2bDdwR3hMdU1EVzFCdDY0dUJBbS9USlRvM293ZjJEY05mYTBwRCtKK3Nr?=
 =?utf-8?B?MCtRNnoyTXU2b1EySWJWOFZ6TFRrUjN6c0RadHZwSlc1bkJtbHBESEQzN2t5?=
 =?utf-8?B?ZzAyK3VYMk5RWE1Fc3FqQ0Qrc0FKb2RZczF6ekEyVTdZSGo0YUpYc2lCOVo0?=
 =?utf-8?B?a1puOXZkWUozeXVqSEgwM0x2bStHTkQyZFBIOExNMEE5Z0EwdkdlV3Boa1lC?=
 =?utf-8?B?YVphRWtPRWYxcTIwc2o5bThqdXpKRkVmd1RGb01iSzZCd2FyTElxQVFEOHB4?=
 =?utf-8?B?UTNoQ3VnQTByVFVtN2krMUIveXphKzdFdExzYUVtYXAzMUIvSXMzOVlZTVJw?=
 =?utf-8?B?c3l5eTZ0bGlZbVVRTjg5bk81T0NpZWtKWGxJSkFOUXVoVm9mOWgyaTZTSDJu?=
 =?utf-8?B?Qis5ODBWRzlJSnRpZW1jeExYQTdIR3JpZVlTb0VXWHovQlJTYiswNVNEeFJH?=
 =?utf-8?B?cG95Zy8xN0tETkhwTjB5bWRaNkhGMFBGRmZTU1F5MEsvYU03NTFHUjFhaU83?=
 =?utf-8?B?N01uZHlGNUkvYTRoRG1iSk9XMWt6aWxKdEVpc05UUjY1VndyS1pOdjNqMkpI?=
 =?utf-8?B?TEFQbm1HQmtucW5GZFF2ZTZPU2pCWUlCZ1B3eklPL3RCcE5oTm9jZ3lmUy9a?=
 =?utf-8?B?YzZZTmYxelVvSWNpbDAzNXdQWWIvYy9JZTNiUXZpL05EWmVLaGxDdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <992F171546A3DD42B1257591BEC78039@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4530aca9-ac0b-4638-6201-08def1ab51d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 22:05:24.7367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGQdzlH6UQomZh+R05GR0f2/nT8GbxBuX0227Sqq0YZhAIo8WQYf2mnjM7OMCT/iKvrGceBzZ8YiWxsTVsFBAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB999329

T24gTW9uLCAyMDI2LTA4LTAzIGF0IDIzOjM2ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Ogo+IEBNaWd1ZWw6IE9uZSBjb25zaWRlcmF0aW9uIGZvciB5b3UgYmVsb3cuCj4gCj4gT24gRnJp
IEp1bCAzMSwgMjAyNiBhdCAxMDoxMCBQTSBDRVNULCBUaW11ciBUYWJpIHdyb3RlOgo+ID4gK2lt
cGw8J2E+IFRsdjwnYT4gewo+ID4gK8KgwqDCoCBjb25zdCBNQUdJQzogJidzdGF0aWMgW3U4OyA0
XSA9IGIiTlZGVyI7Cj4gPiArCj4gPiArwqDCoMKgIC8vLyBQYXJzZXMgYGRhdGFgIGFzIGEgVExW
IGZpcm13YXJlIGltYWdlLCByZXR1cm5pbmcgW2BFSU5WQUxgXSBpZiB0aGUgaW1hZ2UgaXMKPiA+
IG1hbGZvcm1lZC4KPiA+ICvCoMKgwqAgcHViKGNyYXRlKSBmbiBuZXcoZGF0YTogJidhIFt1OF0p
IC0+IFJlc3VsdDxTZWxmPiB7Cj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gVmVyaWZ5IHRoYXQgdGhl
IG1hZ2ljIGJ5dGVzIGV4aXN0IGFuZCBhcmUgdGhlIGNvcnJlY3QgdmFsdWUKPiA+ICvCoMKgwqDC
oMKgwqDCoCBsZXQgbWFnaWNfbGVuID0gU2VsZjo6TUFHSUMubGVuKCk7Cj4gPiArwqDCoMKgwqDC
oMKgwqAgaWYgZGF0YQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmdldCguLm1hZ2ljX2xl
bikKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5pc19ub25lX29yKHxtYWdpY3wgbWFnaWMg
IT0gU2VsZjo6TUFHSUMpCj4gPiArwqDCoMKgwqDCoMKgwqAgewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIEVycihFSU5WQUwpOwo+ID4gK8KgwqDCoMKgwqDCoMKgIH0KPiA+ICsK
PiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBUaGUgcGF5bG9hZCBpcyB0aGUgY29udGlndW91cyBzZXF1
ZW5jZSBvZiBUTFYgYmxvY2tzIGFmdGVyIHRoZSBtYWdpYy4KPiA+ICvCoMKgwqDCoMKgwqDCoCBs
ZXQgcGF5bG9hZCA9IGRhdGEuZ2V0KG1hZ2ljX2xlbi4uKS5va19vcihFSU5WQUwpPzsKPiA+ICsK
PiA+ICvCoMKgwqDCoMKgwqDCoCBpZiBwYXlsb2FkLmlzX2VtcHR5KCkgewo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLy8gUmVqZWN0IGVtcHR5IFRMViBmaWxlcwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIEVycihFTk9EQVRBKTsKPiA+ICvCoMKgwqDCoMKgwqDCoCB9Cj4g
Cj4gVGhpcyBzZWVtcyByZWR1bmRhbnQsIGlmIHBheWxvYWQgaXMgZW1wdHkgdGhlIGJlbG93IGxv
b3Agd291bGRuJ3QgZXhlY3V0ZSBhbmQKPiB0aGUgIWhhc192ZXJzIGNoZWNrIHdvdWxkIHJldHVy
biBFSU5WQUwuIFdoaWNoIHNlZW1zIGNvbnNpc3RlbnQsIHNpbmNlIGVtcHR5Cj4gZGF0YSBpcyBr
aW5kYSBpbnZhbGlkLgoKSSBmcmVxdWVudGx5IHN0cnVnZ2xlIHRvIGZpbmQgdGhlIHJpZ2h0IGVy
cm9yIGNvZGUgaW4ga2VybmVsIGNvZGUsIGVzcGVjaWFsbHkgZm9yIHNpdHVhdGlvbnMKd2hlcmUg
c29tZSBkYXRhIHN0cnVjdHVyZSBpcyBub3QgcXVpdGUgcmlnaHQuCgo+ID4gK8KgwqDCoMKgwqDC
oMKgIC8vIFRoZSBzcGVjIHNheXMgZXZlcnkgVExWIG11c3QgaGF2ZSBhIFZFUlMgdGFnLgo+ID4g
K8KgwqDCoMKgwqDCoMKgIGxldCBtdXQgaGFzX3ZlcnMgPSBmYWxzZTsKPiA+ICsKPiA+ICvCoMKg
wqDCoMKgwqDCoCBsZXQgbXV0IHJlc3QgPSBwYXlsb2FkOwo+ID4gK8KgwqDCoMKgwqDCoMKgIHdo
aWxlICFyZXN0LmlzX2VtcHR5KCkgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gVmFs
aWRhdGUgYW5kIGV4dHJhY3QgdGhlIGhlYWRlciAodHlwZSwgbGVuZ3RoKS4KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGxldCBTb21lKGhlYWRlcik6IE9wdGlvbjxUbHZCbG9ja0hlYWRlcj4g
PSByZXN0Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5nZXQoLi5UbHZCbG9j
a0hlYWRlcjo6U0laRSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmFuZF90
aGVuKFRsdkJsb2NrSGVhZGVyOjpwYXJzZSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVs
c2Ugewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gRXJyKEVJTlZB
TCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaGFzX3ZlcnMgfD0gaGVhZGVyLnRhZyA9PSAqYiJWRVJTIjsKPiA+ICsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIFRoZSBgbGVuZ3RoYCBmaWVsZCBvZiBhIFRMViBi
bG9jayBjb250YWlucyB0aGUgYWN0dWFsIGJ5dGUgbGVuZ3RoIG9mIHRoZQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLy8gdmFsdWUsIGJ1dCBlYWNoIFRMViBibG9jayBpcyBhbGlnbmVkIHRv
IGEgNC1ieXRlIGJvdW5kYXJ5Lgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IFNvbWUo
c3RvcmVkX3NpemUpID0gaGVhZGVyLmxlbmd0aC5jaGVja2VkX25leHRfbXVsdGlwbGVfb2YoNCkg
ZWxzZSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFcnIoRUlO
VkFMKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBsZXQgbGVuZ3RoID0gVGx2QmxvY2tIZWFkZXI6OlNJWkUKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoZWNrZWRfYWRkKHN0b3JlZF9zaXplKQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAub2tfb3IoRUlOVkFMKT87Cj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXN0ID0gcmVzdC5zcGxpdF9hdF9jaGVja2VkKGxl
bmd0aCkub2tfb3IoRUlOVkFMKT8uMTsKPiA+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gPiArCj4gPiAr
wqDCoMKgwqDCoMKgwqAgaWYgIWhhc192ZXJzIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiBFcnIoRUlOVkFMKTsKPiA+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gWy4uLl0KPiAK
PiA+ICvCoMKgwqAgZm4gZmluZCgmc2VsZiwgdGFnOiAmW3U4OyA0XSkgLT4gUmVzdWx0PFRsdkJs
b2NrPCdhPj4gewo+ID4gK8KgwqDCoMKgwqDCoMKgIHNlbGYuaXRlcigpLmZpbmQofGJ8IGIudGFn
ID09ICp0YWcpLm9rX29yKEVJTlZBTCkKPiA+ICvCoMKgwqAgfQo+IAo+IE5JVDogRG8gd2UgcmVh
bGx5IGtub3cgdGhlIHRhZyBpcyBpbnZhbGlkIGp1c3QgYmVjYXVzZSBpdCB3YXNuJ3QgZm91bmQ/
CgpXZWxsLCBtYXliZSB0aGlzIGlzIHdoZXJlIHdlIHNob3VsZCByZXR1cm4gRU5PREFUQT8KCkkg
YW0gZXhwZWN0aW5nIGZ1dHVyZSBOb3ZhIGNvZGUgdG8gaGFuZGxlIHRhZ3MgdGhhdCBtYXkgYmUg
bGVnaXRpbWF0ZWx5IGFic2VudCwgc28gbWF5YmUgaGF2aW5nCml0IHJldHVybiBFTk9EQVRBIGlm
IHRoZSB0YWcgaXMgbWlzc2luZywgYW5kIEVJTlZBTCBpbiBhbGwgb3RoZXIgc2l0dWF0aW9ucyBp
cyBiZXR0ZXIuCgo+ID4gK8KgwqDCoCAvLy8gUmV0dXJuIGEgc2xpY2Ugb2YgYnl0ZXMuwqAgUmV0
dXJucyBFTk9EQVRBIGlmIHRoZSB2YWx1ZSBpcyBlbXB0eS4KPiA+ICvCoMKgwqAgcHViKGNyYXRl
KSBmbiBnZXRfYnl0ZXMoJnNlbGYsIHRhZzogJlt1ODsgNF0pIC0+IFJlc3VsdDwmJ2EgW3U4XT4g
ewo+ID4gK8KgwqDCoMKgwqDCoMKgIGxldCB0bHYgPSBzZWxmLmZpbmQodGFnKT87Cj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgwqAgLy8gVHJlYXQgZW1wdHkgdmFsdWUgYXMgYW4gZXJyb3IsIHRvIGF2
b2lkIHRyeWluZyB0byBwYXJzZSBub3RoaW5nLgo+ID4gK8KgwqDCoMKgwqDCoMKgIGlmIHRsdi52
YWx1ZS5pc19lbXB0eSgpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFcnIo
RU5PREFUQSk7Cj4gPiArwqDCoMKgwqDCoMKgwqAgfQo+IAo+IFRoaXMgb25lIHNlZW1zIHJlc29u
YWJsZTsgYnV0IHdlIGRvbid0IGhhdmUgdGhlIGVycm9yIGNvZGUgaW4gcGxhY2UuIFRoZSBjb21t
aXQKPiBtZXNzYWdlIHNheXMgdGhlIHNlcmllcyBkZXBlbmRzIG9uIFsxXSwgYnV0IHRoaXMgbGlr
ZWx5IGdvZXMgdGhyb3VnaCB0aGUgUnVzdAo+IHRyZWUuCgpDYW4ndCB5b3UganVzdCBwaWNrIGl0
IHVwIGZyb20gdGhlIFJ1c3QgdHJlZSBhbmQgcHV0IGl0IGluIGRybS1ydXN0LW5leHQ/Cgo+IEVp
dGhlciB3ZSBqdXN0IGFkZCB0aGlzIHNpbmdsZSBlcnJvciBjb2RlIGluIGEgc2VwYXJhdGUgcGF0
Y2ggb3IgTWlndWVsIHByb3ZpZGVzCj4gYSBzaWduZWQgdGFnIGZvciBbMV0uCj4gCj4gU2luY2Ug
dGhpcyBpcyBhIHBlcmZlY3RseSB0cml2aWFsIGNvbmZsaWN0LCBJJ2QgZ28gZm9yIHRoZSBmb3Jt
ZXIuCgpUaGUgbGF0dGVyIHNlZW1zIHNpbXBsZXIgdG8gbWUsIGFuZCB3b3VsZCBhdm9pZCBhbiBh
bm5veWluZyBtZXJnZSBjb25mbGljdC4K
