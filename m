Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187E4854FA;
	Tue,  4 Aug 2026 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863441; cv=fail; b=m1nOjGHw5v0W549ceIcHsH/cnE38sNl7i5seUvaq/HhInhc2A0kZEc4WyvkQltRcxQoyIHMKCrapAdiyNwIY5PflwoaCXwtT48y1QMQoxhFqxY6X9tTOhUb05CEcgMewX34+EWhnClFhL3UDYHAGtfRZwWhJ2mJfNyQnYP/XN0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863441; c=relaxed/simple;
	bh=2qukNbfz6FlFrO/E0ioWZ7g2A06Ty7zxne0mcyxDZwM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TxEXmGYFO7HQ5aJj8MQayfD4LsaVVXCvGEKLWVHewjamz29gRZV3FEB52Ed9TOjVJ1v0QZYHZlnudwCwXwq8h7fq4QpruDzhTuqHHmS7UJYSxfPvnvh4Z5LdWGh06L5lkRbfFn8HyY0Bxs+5lXo0Y8Plz6UfRpTBkMLMuUHq6I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oUlWnFoS; arc=fail smtp.client-ip=40.93.195.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oUlWnFoS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh2fDBHbeuQlAd77a+tNGAQBWNw+BH1ZmoyozECxKHfMOfOvK7EBf5J6ycJTpommbvyDWjd/TeM0ropZF94Jt0kYPF+QgrXIg0d2dAp8ToN72ZS6hPkl9vNug2o1vsLEJy4nfd20p1DqsVpqgbQzzUIMJTED2cLpyKvU8mPyZcWBhWCngrIf5bp8PVhon9If/uOaf43uO/9n/mhmEGc0HLVwyzngOluQfClekPFKEborPGTDNq7R/UC7tUzOLNIQDgbbraIEEW+SyCUtwZGRUtAP9OBdsb7RO11wqjXB9rglhvjewNtZFbkrWBKdoUSpFVwgbNuw97T68NaJc4TQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qukNbfz6FlFrO/E0ioWZ7g2A06Ty7zxne0mcyxDZwM=;
 b=Pv+MnapMiWkGu+pQK2oTOx7B4NIdJ7dQaFC0iNS/DhI2yXDzT7dnV5bnFnRyUu20akPlOxxCRjDmio7MYhsgdTqROxzBY1u0VPAIZ8219jA9dcNWiIqdVZd1Pw4ZCKFJk1zbe4hkLW10ZzvRTkgbpP30qkBsXok/5BJXBo9sZ8Votl8kZL695q9A+lbEssCBZDlxU/KKj/xewnIyuUoi5MuuZjIGCe6S9slRVlgexgM7Z4W3fJUz5nudUdu/A6L4ACzq8J3H+MxS3BFjoSzTMoZtGW5WeE7CoUScLUgQEZBEcrHtp5qcTPVW2Xf1DIcyQeSQm0ih9lF894qDvaFjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qukNbfz6FlFrO/E0ioWZ7g2A06Ty7zxne0mcyxDZwM=;
 b=oUlWnFoSvX+Kow8qDHHquP4HxS6l9t/ydBOpDHZHuBA2lYAlfMyEIgfP1EXdG1bjZACsnIC68NQ0lQWwHSDmnKCYSO+wgnUdlseK0uzdDngoAUiU/XN1x5aEWLLdlUmWz6CpdG738NNBofN1qSUg6Jkdf9GKn0wF6rfwoLTrvlKM3ZGnVaX1oaen8mSANu7oBeNi6xc+/zI0YpM/LML/rP2ypU1yqygK0MQYxIHPsKR76Kt8fZ8OtcRUbRV7mODXN2dFsu+DVur7GTGWXA02bf9Dq73u+k4Enid0KUiuKvm+x/QyOsVicl5FZQlVpdcPZzx3XijCTGvD+3kCF3YC6A==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 17:10:24 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 17:10:24 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>, "russ.weight@linux.dev"
	<russ.weight@linux.dev>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>
Subject: Re: [PATCH v7 3/8] gpu: nova-core: add TLV parser for firmware files
Thread-Topic: [PATCH v7 3/8] gpu: nova-core: add TLV parser for firmware files
Thread-Index: AQHdISiuH+zd528kSE2WOE/KHyVDoraM3hUAgAAH9oCAAARyAIABO3UA
Date: Tue, 4 Aug 2026 17:10:24 +0000
Message-ID: <2eb350edc7f3b3b851304f87714e9e1eb746ff6f.camel@nvidia.com>
References: <20260731201017.2580713-1-ttabi@nvidia.com>
	 <20260731201017.2580713-4-ttabi@nvidia.com>
	 <DKFMSHHGF3DE.2SUUP3FB7WXTK@kernel.org>
	 <0c53c38adec26bc5df6b4658d3da53075001d93a.camel@nvidia.com>
	 <DKFNQH0FLP11.1JGXFSKVTOBMF@kernel.org>
In-Reply-To: <DKFNQH0FLP11.1JGXFSKVTOBMF@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|IA1PR12MB6601:EE_
x-ms-office365-filtering-correlation-id: 9bf6e410-60a6-4a1d-c6e7-08def24b45da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 YhxGSrzQioGvH+N4m/AkdjnijKJgy313sNBw+2e0E7z1XUC8XuYjgvLEx/JEQn+g26HBdoFvxi6AOTrbXgVzhGvhEjT/JCDYPCRnHM/BXdVacq0rSNRLJTngma83XK/bhwsohdYROhk6l7uoaU+Ef+VLkcRpztxLs8bxQ7ZBb8DGj08g7zw39L9WooQpiRorUsEWdhrW1q3ihcGIENUx38C4u63hKgZRky8m3LuFIkbsh+replZnmjjQga8lHrmYtIPJtHCmQteFYQlCzRuYUB/8ewN8R2+txe6uYGrth+Zt7OKrLMyorle1aw2RcsXSIFKxUO+OJdOZmdBe0UBOVIve2MXFqgyb40uLO4oi2UMwkhptFbhALWEo7nqk1qwhH0w4AC4lhTspkO8gAQNinBfsWom0jSgkwt8cxEdqnqT1PW/t1o2aT0JkVTxEW7TZ3BFf1xxkgNEax1Q6OlcQtgfD32Rr+E5BRaK6xDtX0ZYZRJcwLXNUfCzroiWvCSCGT2ECUzNC3NcLDlZDEAy/JseB2fPobVqE/hduYa/KNJ2DnhDTd7PT+idBfVTYQEuGQC1M6z1mfaKCZqiCQcyEwte7O2chq0R9ETFYurhIGVWORwoz+EroAxY2MNoI62fd37+0HA7NADsZymBs2artGbl1K1YqKGD4b6QazPw4tc80kSwq6kmV0p4ZuU8cVWwTSbGbsnLksYHw+OXr1okYQ5RqEiADcm3aHxWAA4m80+g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUZNZSs5Qmpld1U0ZWF1R0VzY2t2VjdzUmRwVjI0cW1YSTVlZEZFVU5vQVJ2?=
 =?utf-8?B?dHliTGZpTEhjYnJiUG56VXhGZGMveDhva0VZUExQSjhGV2FBUnlHV1FvblRY?=
 =?utf-8?B?VHdVdldOWUpwdGhpeHlDQ2J6Y25kVm9IY3JOMkhzZkV5aWd5YVJhQnN1dlQ1?=
 =?utf-8?B?Yk03L0YzYmNKYXphd2srTUhsU0ZTanJ3TGtuL0g3Uy9VWFJnTjZtYWhFQnFQ?=
 =?utf-8?B?NW5iL0FCNE5oNDVxanNJalUzQVRwNkM0SzluakczNHZJWkIxanM1U1ovSVMv?=
 =?utf-8?B?SmpTeng5bXU0RDBidDRPc3lBMFdwTUZDQTZOcXhpQWV5MnNSR1lIT3V6akpW?=
 =?utf-8?B?Q2tVY3RjUjIrcjNzZU84UjlXOWsyV09Eb2lsT0NBeVMwSkMrY3BSanBFK0lj?=
 =?utf-8?B?UnVtUWFnUmNIR280MlQwaXZUOEc5SjRPbFAxOHh3SHF2TFJnUW5tUGlsYkFY?=
 =?utf-8?B?cnkrWHYzaVM1TDdtN2pGWUJnemw4U1VyNnYvSU44Y2FRY1JPdzVKOGNKejVk?=
 =?utf-8?B?blFtWVkxMVl4VTBaU2JVTTRZUi9ZaFZYRXd2ZkdZTzJBL1ZBN2RIeEJuNGNi?=
 =?utf-8?B?andxM3lkVThiNXdUeTJmU2l4TVpqOTVYdEVRNVdlelVBUE92WDQ1WndKWlFO?=
 =?utf-8?B?NEdmbEx2VjdMUFIyNTZaeXVSUFZ4N0cwTUtLd0MzZWxYMEpqdXRsWXFTVExu?=
 =?utf-8?B?WHoxNUdHTmNQaEhmaytoYTlDTk5DZUJVR095QXoxNjVtbTJuM2w0dTNCS29G?=
 =?utf-8?B?a3dSejRnY0o1QmlSa0FKSU92L2hHVGhFbDlkaURBS2N5K0ZpMDNKcDlUTUdR?=
 =?utf-8?B?ZDF5RkVwaU0zYU1MdjB6NUprTm01bTVORTBoRzhrQTVYYi81TjNvOENqMG1h?=
 =?utf-8?B?aVorY1JmdDlxaytRUUhVWnpmM1ErQ0NGTFN6c25pZDRTaDlBUmNnckVuUHdl?=
 =?utf-8?B?WGg4cWt2R095R3VsbWNDV0pWUmlPNWpzdzNCdERKSTBwZ3RJNkN4eVRLTUtE?=
 =?utf-8?B?TXgrSGxFNWw4UVd2TlAwR1lpRVJBNzBhN2gxRWxWNkg0TG4yaHRKSHAxaCtz?=
 =?utf-8?B?VkJBU2tLaXVFSUdxOCtwY3dYa29XTS9rODI2OVpvNWt6WVQ0KzROVUNnK0Zs?=
 =?utf-8?B?MGNCS1JmOHU0bURuSXNxRHA5RWZ4ak13NXR3b1ZTUnFrNjV1dGxlaTFkVlVW?=
 =?utf-8?B?NWlERkpSeUplNHU4dEt1cWFpbWJ1R3ZuK211czNmZDd4b3Y1czVoZysrbUZM?=
 =?utf-8?B?WjFrRVkwZkRycHM2Sk1GQ0RtR2t3a3VsT3ZuZG4zQUNPbzB2V1BmTkVRYXlm?=
 =?utf-8?B?bThSME9RNjJFSy9EcnhSNmlwMU1DMk1xUlVDK2RNVkZoSFlpRnZwVTErejRD?=
 =?utf-8?B?ZDFyZTVEZE4zTW9sR0dJeDBEOEU1QTRGRmZYSnUrdXhTNnptUXpwU24ranF2?=
 =?utf-8?B?R21sRCsvSnArN0JybkR2bHhnSnBkTk1Pd21McVdJTmtaTEw3QjJBV3BUWmxz?=
 =?utf-8?B?QzNFWEo5eTBVUk5TUzg0QXIyOURlbytuMjI1OVJSZHk1RkZsNUJoWVRGS3Az?=
 =?utf-8?B?Mk82cEhWK3FqUlhxZUhHczVKdUFNVi9TRW1rU2V6SHJzeHhXQjZwUWoyL0dk?=
 =?utf-8?B?M21MdG5oQ2t2ZHUxNGt0YkZxUVJ2KzdDd0FtTlR3VDQvc2YxR1hvWk55WHRi?=
 =?utf-8?B?bDBUV3orNHNMbDZmUW1rNW5GQ2l3WXU5NHYzN1p4S0s1VGE3UTNrRWVZQ1Nj?=
 =?utf-8?B?S2haRjhaYytVTmdDeDEzbWIzYWNtbkdXYVc3eEprTzFvQklKQWN5N2xDTmly?=
 =?utf-8?B?aTFLOUI1YWZxTTZyTG0xS1RqNWlCTVJBWU9xWU9YcU02MytrOWFEUUJhS0ky?=
 =?utf-8?B?WUFCMXc5MGFwMHFMbGg1eU5hTmtscWZIOGNoYjRpN3d4NVNDMFZIbzJFK0lL?=
 =?utf-8?B?NG9iRGhqMmREcUJxRE1rUkM0OEZLWmhNejBNZEhGK2M1Ymh5cThRVnRHWUc2?=
 =?utf-8?B?d0ZjME00S3dWTlpKT3pJNnAyZ3pzbFBpR1VGVklGeFNXNzhlMmJGR1BtenZG?=
 =?utf-8?B?SUQzR1NMQS9FbTlNYXk3dHhoelhDUmVsVW5kVjZxR28yRFBYS0NkR3BEK2Zm?=
 =?utf-8?B?RWJSMG5mc1pVV1NHNWdncWVsQnFiNlVSZ1pKRktXdE9zcnF6NVoxUjRpNW8w?=
 =?utf-8?B?VUxsc1ZVUm5DQjUrRWk3TDRrZEtVZVVWNk9WeFhscVRwTXJ3RnY5RjBNdi83?=
 =?utf-8?B?NHRoQmJVcTdQSDEwZ29rc2lkVXlQY1hodHdyWXpzZ3FsMzdveTBaSlFXYXQx?=
 =?utf-8?B?Q2gvTlBtRmRBYzBqVW9IREVqS2g3WEJGKzdtK3lGM3ZqQlhDUHpLZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8820EEF6902E3E4C8FC979A319984A1B@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf6e410-60a6-4a1d-c6e7-08def24b45da
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 17:10:24.0642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1r9JddmOAC7SCko9khmRjXMErEmR6n8j6qIsMgpsHQek3Leurjh6nMc79i4P9Ba3yhwzMwhFc5JOhwvX18NBiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601

T24gVHVlLCAyMDI2LTA4LTA0IGF0IDAwOjIxICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IFdlbGwsIG1heWJlIHRoaXMgaXMgd2hlcmUgd2Ugc2hvdWxkIHJldHVybiBFTk9EQVRB
Pw0KPiANCj4gT3IgbWF5YmUganVzdCBFTk9FTlQuDQo+IA0KPiA+IEkgYW0gZXhwZWN0aW5nIGZ1
dHVyZSBOb3ZhIGNvZGUgdG8gaGFuZGxlIHRhZ3MgdGhhdCBtYXkgYmUgbGVnaXRpbWF0ZWx5IGFi
c2VudCwgc28gbWF5YmUNCj4gPiBoYXZpbmcNCj4gPiBpdCByZXR1cm4gRU5PREFUQSBpZiB0aGUg
dGFnIGlzIG1pc3NpbmcsIGFuZCBFSU5WQUwgaW4gYWxsIG90aGVyIHNpdHVhdGlvbnMgaXMgYmV0
dGVyLg0KPiANCj4gSW4gdGhpcyBjYXNlIGl0IG1ha2VzIHNlbnNlIHRvIGRpZmZlcmVuY2lhdGU7
IEFGQUlDIHRoaXMgY2FuIGJlIGEgZm9sbG93LXVwDQo+IHBhdGNoLg0KDQouLi4NCg0KPiBUaGlz
IGlzIHdoYXQgSSByZWZlciB0byBiZWxvdyBhcyAic2lnbmVkIHRhZyIuDQo+IA0KPiBTb21lIGJh
Y2tncm91bmQgb24gdGhpczogV2UgY2FuJ3QgaGF2ZSBwYXRjaGVzIGFzIGR1cGxpY2F0ZSBjb21t
aXRzIGdvaW5nIHRvDQo+IExpbnVzLiBTbyBpbiBvcmRlciBmb3IgbWUgdG8gcHVsbCBmcm9tIHRo
ZSBSdXN0IHRyZWUsIGl0IGhhcyB0byBndWFyYW50ZWUgdG8gbm90DQo+IGNoYW5nZSBpdHMgaGlz
dHJveSAod2hpY2ggaXQgZG9lcyBub3QpLiBCZXNpZGVzIHRoYXQsIHdlIGRvbid0IHdhbnQgYWxs
IHRoZQ0KPiBjb21taXRzIGZyb20gYW5vdGhlciB0cmVlLCBidXQganVzdCBhIHNwZWNpZmljIG9u
ZS4gVGhlIG5vcm1hbCBwcm9jZXNzIGZvciB0aGlzDQo+IGlzIHRvIHB1dCB0aGUgY29tbWl0IG9u
IGEgc2VwYXJhdGUgYnJhbmNoIGJhc2VkIG9uIGEgY29tbWl0IGJhc2UsIGUuZy4gc29tZSAtcmMs
DQo+IHR5cGljYWxseSAtcmMxLiBUaGVuIHdlIGNhbiBjcmVhdGUgYSBzaWduZWQgdGFnIGZyb20g
dGhpcyB0aGF0IGNhbiBiZSBtZXJnZWQNCj4gaW50byBib3RoIChvciBtdWx0aXBsZSkgdHJlZXMs
IHNvIHRoZSBjb21taXQgb25seSBleGlzdHMgZXhhY3RseSBvbmNlLg0KPiANCj4gSG93ZXZlciwg
dGhpcyBraW5kIG9mIGxvZ2lzdGljcyB0eXBpY2FsbHkgb25seSBtYWtlcyBzZW5zZSBmb3IgZmVh
dHVyZXMsIGV0Yy4gSW4NCj4gb3JkZXIgdG8gYXZvaWQgYSB0cml2aWFsIGNvbmZsaWN0LCBpdCBp
cyB1c3VhbGx5IG92ZXJraWxsLiBXaGljaCBpcyBhbHNvIHdoeSBJDQo+IHNhaWQgSSdkIGdvIGZv
ciB0aGUgZm9ybWVyLg0KDQpIb3cgYWJvdXQgdGhpczogcmVwbGFjZSBhbGwgRU5PREFUQSB3aXRo
IEVJTlZBTCBpbiB0aGlzIHBhdGNoIGZvciBub3csIGFuZCB0aGVuIGFmdGVyIGRybS1ydXN0LQ0K
bmV4dCBwdWxscyBpbiBteSBlcnJvci5ycyBjaGFuZ2UgZnJvbSB0aGUgUnVzdCB0cmVlLCBJIHJl
cGxhY2Ugc29tZSBvZiB0aG9zZSBFSU5WQUwgd2l0aCBFTk9FTlQNCm9yIEVOT0RBVEEuDQo=
