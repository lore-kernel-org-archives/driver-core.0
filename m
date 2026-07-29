Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010051.outbound.protection.outlook.com [40.93.198.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40603C5540;
	Wed, 29 Jul 2026 23:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785366160; cv=fail; b=PEM9p3gIk3bEMO0HHfap+4dPaW//MpVRlWuHuuU9T2m8lln0qT27tKiSk5fUODv0jY33oja0s5kmDwjkjbs06EDrTN/HSWsfbCm+6WX3yghvm5canXaxbSkm8p35sWmSD+vJ1dK0yv25V6RoEJ1YTDtgLEqaTlyeBQpfHX88VmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785366160; c=relaxed/simple;
	bh=blkye5ABY3CvX+COVBF+NPCtZ7/jfitTVifKiRu0KwQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RC3oljfODUNXTDJL23g7fflVMGqJh1DPngpO7Rjqjph5rwaGWVOLzbCnhjHFDXBTnQPc2BA4Zt7B6TlVVgqGVJQEPBiw/PnxYUkpXQed5YeQ+x8r5U83ZO5cCtpj+N9ShyhQb4SSY7Dt07mFgg26PIVYn2AKjD1FU4u+VVyTBY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r1Ik+m09; arc=fail smtp.client-ip=40.93.198.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r1Ik+m09"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGaPcROwFwMxrFUECzabl4XaBspI3/JMCFMyBhzpznjSFF+YBsKz0SR3330XsNq/db+QwwUXsLxfYc58LvkbeSR9rBmQOhQXW/aPX4UHa81xYnTl2H+hyNI+XJUKkych8pgaCc7ns+oV8o4QE4JHQjDXJcEzoLkROap/F2VFydt+5JfgjWqOB0jAD0AIHF+FJTyjPQ94vMA3O2nXX20OID835EU5KwdljrSC8REnhVhSNUPtJDoeNC0Hrv97WF6ihMIyTCP8gQeFhATdbZlRqPQ6rLQ/8VJOKDfK0GUGirdvKWSZkBqAU3Xhf051nuQJiQ8J4CMDfOOu4I87NNGoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blkye5ABY3CvX+COVBF+NPCtZ7/jfitTVifKiRu0KwQ=;
 b=PTW64anqq73CJNpIGCUZs3i0yzkdTdDwmbLlvTz2VoA3EYpQXFuaLklotEI+bVONZelA3f5s2FjbEfc8wt6m8JepHgAlVg7/Woezb/l4uHOPD08pZ9ynLOeKi7NXEI+Q9fopHPCwW0LIgbGRBnQWi7us1qhRcOykDKKVZ2YTQr7aDtp6z/g/2X24xCpFZfiEZFK+HsmfacPfqjrkSCj+K1xm2DwBZ/KvgjCKX8VcZUgKNjPetGnVo4l56yzoJuQ5+Ltr47vmwa2QcyLiEPFQXpy7eJe9xO4O9uq0sdKSR7TrMJ4azsQfzMclw6UvjT/Snk8MjRx280OV+A/ykAkYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blkye5ABY3CvX+COVBF+NPCtZ7/jfitTVifKiRu0KwQ=;
 b=r1Ik+m09q1UNh2VggR9oqKpBGc5emfYaj8Y8/g2+4GAxjCUgLyIR78yhLf9p6G/ApVMUY7h5GxZeyvyBruyCCWxZBxiv6csv5GeVLsCfqGYAj4bnnvP0xK2j9WOrVX6/ZdvULz1IIqcXyA9zlmadboeuE02N+z6DFuKX0rOK8iRkWojx/oh+AkQ+cJXzeX95yqIN9sitOF71BCn3oYifsBU5PjnWESQGVVVB8i8gEMgGe2HEkIWZGwEZJ63UHI5V6ghpqhZJkT5mTB18T8S1m+UT8BFqf62LsSATPjI9jzxW3xyk3pAandLdwgzw3FHbpVwwmbVU73fk0NuNeF3njw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 23:02:33 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:02:32 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
	<acourbot@nvidia.com>
CC: Zhi Wang <zhiw@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Eliot Courtney
	<ecourtney@nvidia.com>, "russ.weight@linux.dev" <russ.weight@linux.dev>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>
Subject: Re: [PATCH v5 3/8] gpu: nova-core: add TLV parser for firmware files
Thread-Topic: [PATCH v5 3/8] gpu: nova-core: add TLV parser for firmware files
Thread-Index: AQHdEMCQ2jhut/KpAUikVCB3QFh3IbaBVU6AgAN6aACAADsBgIAAMHQA
Date: Wed, 29 Jul 2026 23:02:32 +0000
Message-ID: <7ab8f580-0bda-4295-bb98-07676f31557a@nvidia.com>
References: <20260710230428.865447-1-ttabi@nvidia.com>
 <20260710230428.865447-4-ttabi@nvidia.com>
 <DK9BISU6MPAY.EK5385QYWU90@nvidia.com>
 <ba791aaea02d5caf9254278e170b9deae5305e6b.camel@nvidia.com>
 <45a43838-0468-4690-b692-38500f4046e6@nvidia.com>
In-Reply-To: <45a43838-0468-4690-b692-38500f4046e6@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|DS0PR12MB7826:EE_
x-ms-office365-filtering-correlation-id: f2a1b3bd-6ca1-428e-8848-08deedc578f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 FqpFFmGEsO9pDo35m33s0BTnK4gL8yQpyvfmf0EJdfNDlLP4qyZaGR+xHKU/OTsuPXSlrl+3/Kw7XbsO93vqHDZkKvptxWEwxg4qSyIdB14jVhW/PkHhXV6jabSx84fWqix48bNlzW214I8gy9QP8oLLwFVQ5AnaEn0bxrju20+PeCSaZRbl+UGr+vZEwxtvPz4kjmODsI3x/SJnoKt7uj/nxFy+xIcsg5BCFp79PO8U6eImSvOtrpG0d7e2vh0oBulBCX6q7aOVF2RszaA1n/dWsIamK+Bx3JSN3ze0301EOmspZzjlOmPJ4E4AHY9JNW6PABgLA2lb0We1sTQ0csm8x5rfWYRgAEWP3voCFogz1wWdYK+pimElXgFqqEPDpLXkb63GNZieAmaqvY1AFa0IiJHd9/pZtPQAcBB431e1wj8F3Phsn+0NpeoRJ8HD9NH7l7Xo8sUH2HHQvkXaLCpCs1B5UwxZJ6HUmT2b0emZdHpkVy30ejVlUKsUheDhu4JHGUHcrY7fDC/VTN7/fTQSy/TRp0BkWMUjUk4kMGdX2FDEdtseUiXFvuQpzdu5maZIDSXMiH45k1ArX//UNdcDsqYNvQcXBqpftNDm5QW8+/fxlee2+9brTmuBxTs4SodAWVdOPJOySYgHg3OXdx84JR6v/eylrmGfgw3ivibFW9owjtD19wA+IGTWb+YNBv/mj0dklwkbhjrVuCv5CYjMV+Jki483oVy+vK2ZfgY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1JRNndRT00rUGhiTmVac2prUU1pTTBTNEJid2Y1bTNqNFZpUDNaSThDNHoy?=
 =?utf-8?B?bi9EbU5Mb3RsVjhCN1k4cC9PVUNsNDdjZFN1N1FhZCsxNjdqVE9sd3lQUnJF?=
 =?utf-8?B?UmFNWDRWWXdLbGJKbXNDdmVBNi9WM0xGK3ZrRTVFY3RQRlFzbFRlYkF4U2Zp?=
 =?utf-8?B?Y1RDMmFMWjBvdklVN1VFUUpMYWNidmIyS2djU0JFRmxCMjIwaWszMWZVOWNZ?=
 =?utf-8?B?SWZMOWhya2RNb2dDek0zMlBTbWVncmdOUVk0cXl1QnE4T3NORFlkMi9QN1dv?=
 =?utf-8?B?QnRTdDdQVmkzZWNyMGdTTjNnYld6ayttaUlQTGVFZFYzbW5lZEJVVzRXbVZF?=
 =?utf-8?B?djh5V0FrRm1lR0FKZGZWT2s4clcwZ3JrTEN6azh0Qlh0WUtqaXJlcUpDTW5V?=
 =?utf-8?B?STNKc3kyMU9vUFcvL0ZacWczK3VZZzZsNHNINUdzWUpCdC9nNzZsVEYwakFy?=
 =?utf-8?B?MVg5YnBud1RZYzRDSmF0RkhwUDNHY2RoK0RLZzhidnNZdDl0eUJRK2Y4S3E4?=
 =?utf-8?B?UUxKV3ppTk03YTZJK05oM0t0S0RzUnFDRE1uRXR2TVZua01zSzJERG9wQ1Yy?=
 =?utf-8?B?aW1vaEx6WUxScTBJa0pTcnFkb0VibkJnRGNkYVRwQnFqWDVMakxGU3l2TlRJ?=
 =?utf-8?B?TWJoR2RYM2RQYStTdUhxbE1ibi9GWDNNcHZFSUJvc3hmcmRjTmNlWlZjUUNW?=
 =?utf-8?B?OERvU1h1dURtYzJ3Y1dMWmFnSnAydGJSWHlXUzJtR3JZdEhqOGhud3M1N0VB?=
 =?utf-8?B?R0Z4Z3ZmWTFZZUs2TEg2TFBSMDJacjg3b0JCdGtYTmswbkJGYXRlSHh1bnMz?=
 =?utf-8?B?TElXRzdZZGJucWgxYlpSRks3Nlg0eFNQYVo5T1pRakZwNXQ0Z2pNbTRxNDQ2?=
 =?utf-8?B?NVFSLzhpUTJnd3Jqd29xTmVLTU5waXRydlZ2WGphaUJ6eTRXWU1sRU5OWVB0?=
 =?utf-8?B?em1EQjlTU2NkcHBTYTNMUEE4aDAwMzFtSGVMOHhhbXJnNEFabVlLMVFGdURL?=
 =?utf-8?B?OGczT1FPOWRrU2YzWFhLWUxsRWg2VFRPRzIrc0MzVmtaMGRUamRueWUzcG5l?=
 =?utf-8?B?YTljV3R0WDJEcFJGeEV5dEN1eG5oeUFYdGwvQ0Q0SmpQektIRjduU3JkNi95?=
 =?utf-8?B?TDJyN3lMK2VhOUFrSVdMTmpvUytyOWJibmVSTkI0NDQ2WW1DTlVLdytNZ2t4?=
 =?utf-8?B?RTRLalBkSDNYQm54SEEwMVpVOWtBOVJ0M29nc0xEckdiNDRaUll0SmNGQ0lO?=
 =?utf-8?B?N1dtVHlNWTJKT1o2bUxzYTA0dXZTeEpYdjhBR0hJbVJJa2Q5VEtMdWQwaCtz?=
 =?utf-8?B?OStValhoTmZUZmhxM1hTcUp0R01TOWJsc2lNbkR2aGd0eWdUd0xuUXZ5VGpz?=
 =?utf-8?B?MFEyU3JpR0hxYXBBMk03c0VDWitDTmF2OEZFZ0FIMkhoUERNZ2VBQ3JqOXV5?=
 =?utf-8?B?RFJNZVM0c0IrN2FpaTMzdm5aaHJnQXdZOUVhcVg1Y01sWWtmeE5JSWpuM3I1?=
 =?utf-8?B?SG8za1Y0dURvclhIaThYZkF0ZWFwR1JDZUlhcDg1YmtFcmg5anNZVTQzNnhZ?=
 =?utf-8?B?V3d1QXVxRDN5c2p3Nk9MUzRGT2tDZERZeEFPakZkYlBhbDZmcXBSckEyMUYz?=
 =?utf-8?B?WkxCU0h1Uk9sVXQvV2R2dkVYaWpsa3p4UmV5UW04RTVKT3ZZSGx6TEV4d1RL?=
 =?utf-8?B?M0Z0QWFqYVA4YnpBK0dsZWMyeUw0Tk84dUp5WG5seTgxdE5lQzFSbklaRTgy?=
 =?utf-8?B?MjlYaVdJanoyMzdQbGx1ek16TXRnVUN5NmJpSUluOFJBTWNVS3dJa3FmbUo1?=
 =?utf-8?B?MlMrZzAxY0t1eVI4d0xMUEY1UkFTUmQ4bWVpV0dIQ3pVZDN3T0szUGRPK3pK?=
 =?utf-8?B?bXdiRzhZbThqVmtvR2o3dHdHZmpiMkFYMEhiS1FDUHZyMVJpQ1ZZOFNIMGFz?=
 =?utf-8?B?aHFEZ0JITVBUOVZ6SW92Q3VpanY0NlV3K1IzMndPQkdRU2VnNGxWcGhVRmdF?=
 =?utf-8?B?UndYNWtzS3FMSlFNSGExSDVIbHVXMkJwYXFjWTQ3eW9CQlhlOHh5Y0RsaVhk?=
 =?utf-8?B?a2M4NWVRWEo3U0xXTlVtb2Nyc0F2QldYcU0wMVpOaVVjUytodTFlNVNJSmdp?=
 =?utf-8?B?enlzWWRYUitocldkMFZ1N0pPM1dzWXVWc3F6L3k4ZXN3MHZlUUdRVVpVS2Vm?=
 =?utf-8?B?MkZSc1dpb25uK3BVSkx6ZHlDUFpNSGo5czhSUXovQmVoYlB3Ykt6azgyZ3By?=
 =?utf-8?B?Znl1ZDV4ZXFzdmdyekxKVEFNQ0VWMFZnUjQ4cjdQRDNSdVBEdG5WSDUwMU5C?=
 =?utf-8?Q?xLiQ0NoKfH5yF+q8UM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65505CBAB5E5284EABB9A739D0530D8A@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a1b3bd-6ca1-428e-8848-08deedc578f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 23:02:32.6624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0qNkDH2GLSAxOg9EQNLUBHDEaPJgl7EfB4K6saBmWALUC9Ij//BLKq1I1GpkH5umU3bOJH63H/e4hd8cBq9P7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826

DQoNCk9uIDcvMjkvMjYgMzowOSBQTSwgSm9obiBIdWJiYXJkIHdyb3RlOg0KPiBBZ3JlZSB0aGF0
IHRoZXJlIGlzIHZhbHVlIGluIGVuZm9yY2luZyBwcmludGFibGUgdGFncy4gV2UgY291bGQNCj4g
c29tZXRoaW5nIGxpa2UgdGhpcyBpZiB3ZSB3YW50IHRvIGFsbG93IHNwYWNlczoNCj4gDQo+ICAg
ICBieXRlcy5pdGVyKCkuYWxsKHxifCBiLmlzX2FzY2lpX2dyYXBoaWMoKSB8fCAqYiA9PSBiJyAn
KQ0KPiANCj4gLi4uYnV0IGlzIHRoZXJlIHJlYWxseS10cnVseSBhIG5lZWQgdG8gc3VwcG9ydCBz
cGFjZXM/IChJIGhhdmVuJ3QgY2hlY2tlZA0KPiBvbiB0aGF0LCBidXQgaXQgc3VycHJpc2VzIG1l
IGF0IGZpcnN0LikNCg0KRm9yIHRhZ3MsIG5vLg0KDQpCdXQgdGhpcyBjb2RlIGlzIGZvciB0aGUg
dmFsdWUgaW4gYSBzdHJpbmcgdGFnLCBzbyB0aGVyZSBjb3VsZCANCmNvbmNlaXZhYmx5IGJlIHNw
YWNlcy4NCg0KSSBwb3N0ZWQgYSB2NiB3aGljaCBhZGRyZXNzZXMgdGhpcy4NCg0K
