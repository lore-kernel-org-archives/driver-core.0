Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23906347BDC;
	Thu,  9 Jul 2026 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783637192; cv=fail; b=kxUHWLqs/J4Q/xPdb530qj0qS+G2JWWBdUfNOKg+Fev6IdOCqn+dQOtCDBrtV/+zlFJ1yWsZ4tj/Mlgn7vemQVB5sh9DUHEAB5+0Vb6rDWErBWUWd1ZWVyLMNHroqquCfaH+ExbN/We9h22Xi0ifbmIF9o/xipkE2flCaD65Hdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783637192; c=relaxed/simple;
	bh=/EtHlwbE1GU0HXiH4aHZ9MK5b0qPi+r7xXFsALmc6DI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WT3s6ZBEzF3St8q5hz+DabSfADt9xz7vuLCHdUz9h3YIQfMKQA3ttTTqGTS5BxqPGwzZfJASMBnl2WtlYMQ4q5sseFeekL+ubGSThgDEnSUM8KxwmuexjXnVHDlajY3bkbZYgooPyCY2+TY7TYL9OmoaDp9nfSHqGdadGFM72zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EOFTxD6y; arc=fail smtp.client-ip=52.101.52.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EOFTxD6y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BInMvTRA0B8QO3JUsUyUuYHUXfRkd8qeRiQ1Y3Hj1F5Y/z5bh1RB8Xs4ykW5ivnA0gM5++HYEIYI6RlwtzL9wTzjJQAQJRHeIPHwatX8TDwuyYPIOWONCzYhi9PGn6mHTZfxMW2lBPe42G22ptsMnTdyiRaQpx8/itWBxbsUTDDuxrcU2Nqe6ZZiXWeQ//C2e4cSBE7jyIHwW6TBewuTgiORzKR6a4NED/OYoxgPf2lwn+sT8uo1mfSx3TxDI23EWkGdQPYMJJfDXg+Ze+x0y1ERDwyKmx7xpT9/q5OikRMnJSP0fDgwWO2cjADeg8oMuCaN9Njtete5ns9kM3+EAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EtHlwbE1GU0HXiH4aHZ9MK5b0qPi+r7xXFsALmc6DI=;
 b=CzbVDusErOpBH5uacJuz/L5U9UNb2WFwES/r2X1qEgvPqy2sEHvnNkm181XKeHCvy1+iUeBWXzSP+SpqewOYweVAeemVObRBcMzCbhrkOvDZ0LvV6W8I7p9tCO+aThhcnrCRGo6Z68gfaklLizqHMBWDQug9ZLEs3QkOoXp/+a7vTvSphS5k7wClHdYc/RzIAuHWkVZ319lWVEQ9g91AzsUAn+aBxlQNVaL4JjftXfuZp+3DqnUrSBxtaDtUnRq+pb/0ZpsFpWcwj4HAX6jRszh5fUN15oDgogjdN17DVJbkyNAFFCg85f+SE6ByILLeRwgrbt1cqD0XLQWqI8QHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EtHlwbE1GU0HXiH4aHZ9MK5b0qPi+r7xXFsALmc6DI=;
 b=EOFTxD6yApoCRz/SwCBj34zoWieUuv6DXNbzh5C5GalBgmqRuCbxhyZfbWQD1LRXweA9j2ytJZU9JAGYBX1Gw8xnlupLbJGLpqpV5GzJkreOQ20eZEUHUc5rX4THn8FDepvLgyg1OzBk3CB5Evdf3U4ADXi1BmxiPwWQedh/YBtwR2LQnLt/9+Gknteri4aC+EfPpZ6PNXnEDHvqEtYl8m8nDTgAjR9WYyNusSTPlEOXuJwWvsiRj1lpbsHmRauz+tila5pGSd9R/HRQzoyXJgSn2wT4Wnc+o63bxd/y93JFwHJuweceTeg6bRB5sE6l/XpEd+xUo23RCJZF90PmjQ==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by IA1PR12MB8496.namprd12.prod.outlook.com (2603:10b6:208:446::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 22:46:26 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 22:46:25 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	"russ.weight@linux.dev" <russ.weight@linux.dev>, "dakr@kernel.org"
	<dakr@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v4 1/7] rust: firmware: add request_into_buf()
Thread-Topic: [PATCH v4 1/7] rust: firmware: add request_into_buf()
Thread-Index: AQHdD+t7m3Ilhcer60+JLa52Yn6CNLZlybIA
Date: Thu, 9 Jul 2026 22:46:25 +0000
Message-ID: <3449b6a458c3c95041a51281ea4bca8964ee0dd6.camel@nvidia.com>
References: <20260709213915.520109-1-ttabi@nvidia.com>
	 <20260709213915.520109-2-ttabi@nvidia.com>
In-Reply-To: <20260709213915.520109-2-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|IA1PR12MB8496:EE_
x-ms-office365-filtering-correlation-id: b661cd5f-68bc-4db0-bb05-08dede0be816
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|10070799003|366016|1800799024|38070700021|921020|11063799006|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 eyrGNPO/IqN1XTO/L9ySE2nWXguWER9fNCvj5GOntjm12ZI98/gK1fixf1R1sLKCaL6Gi+9Tgmsa4CR/kNhTmVDQwN1NmKNN4P+FipEMGZrDKr4fCaaNltsNc7Ys6j9wpDw/3HBbNPFDgmQxHNlPRNHyod8e4cbf4VWbhsyfgDzPABg6/tnp/LwfoPpEscoulPjzuuQbBwkkNi1Y3ADgmeQ6FKfv41nyC0YPalsuDyswWjbMeaFoqsySs1voyyvnhwkvHX2ndqY62jeBvWB+gjrNOjfDXLbcoXFWQWj0bsE2JZI3rdAZzBL4FxSFs/Nx4TbdId171N5h8ZtaAd7rhaOF0tGSrzT2+XBD5VTDBnbhYwzxV4zWC2hyM6aQpeOdsE0IIKzy9fEZAYEZ6icwytlu0uH05S0ZqWzuBqJMr2nKm81wjpH6Ty0YORrEgPNxIbyqgWHm1HUio5fE0y4xkKM9/VK+Uj3wZ6Z5NTCEHXceujuI8BIlpy+0ouOJ1IrviNLzFymLJFHBPfw1GoCsbNCLHgZXszrBBlkq1oSAHkKa/C6pfCdhTZojH7aPxnzM5yyD1MsIrH8z1Fu5hAC6rYkaeblCkcnI5LjNWzDRYjnXSH5ivxduvo9oalI71ghRrKVA86ubKlS8T9AI33ixyelrJblMZt5dre4HJ3nGunLUuTI5o2/qIegFWwwSnxrEg1qraDjO4jy+EYHFPfD826hhogqdUURlKhPC4MKZt/234Dx72js4mdHrV/SFwPyS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(366016)(1800799024)(38070700021)(921020)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDd5RkE0dFlJNGpvK1pqYnEyS0lNYUdYb0FJZ0RGTHB2UFZaNERQSFJjSnFG?=
 =?utf-8?B?NWcxcFRXY0duMUVJT1hlamZNK0Z5K2RnT3JWelcwaFBYMm95emtPeDdFYU0r?=
 =?utf-8?B?NmdQbVRIbmtqWkNIeXI3SmRVVEtwMEZyN0xUd3h5UnFJWXE1dUtpMTFKa2hX?=
 =?utf-8?B?K0h4VlQyT2pSd2lCZDdSYmNhN3ZyTTYwWHljanQ5S1FFK1N2dDFMRlQ5RHpW?=
 =?utf-8?B?VzluOCtJZ3BOc0pYN1VuVDQzU0t5OElSRWwzdGVGbFlqWTVQZDdvTHRBYll1?=
 =?utf-8?B?MzRTbnZKbjYzSVNYbUo5SXNMZktjczNKR2REa3lsc3ZQZnFHWUtVRWkwZlFq?=
 =?utf-8?B?QzJUdmJwaTl5d25nNHJvc2tjT3NXSHpZZGVhdmtoUFBwVTlZSXo1dkRpN1Nh?=
 =?utf-8?B?TnZtZXh0NlpqdUgzSlJwOGU1SXlMK2xyR2t5d3FnVUF0Nm5xaVdVYlZyczlt?=
 =?utf-8?B?VXJHajJWN2V1cC9nWjExUkdKWlRuNDhnNnFwTUM3RXhEQW5PUm5INExYNGp4?=
 =?utf-8?B?S2RZSXJCZFM2elFhVlFrcVlWMHRjKytSeTY0Z2xQNW1zRlZlcm1rWlFXemlW?=
 =?utf-8?B?N3dDbXRNeHJjUnkvbTlYVWowRndYU2o5a1RjSkhmQWR0NVU2REsxeUt3Tklk?=
 =?utf-8?B?ZUdxTzJPeUl4Sko5QXIwbk9JbjFiMlZaTDVSYUYzdXNXL3JzY0tLZzFYbllQ?=
 =?utf-8?B?TVVoc2d4QVBUTkd2TXpUN1lzQ0xTNWp1UlU5Y0ZVR2d6b3VJZ2JNS2xKRmVP?=
 =?utf-8?B?UU5ldW9GQWRxQVkvbnZRellvUE5TY0tQUUdxR25GdENIblNzRkpVc2x1c1U5?=
 =?utf-8?B?RXdUZUMxRE5ObDRMYm8vS25Jc2NxTkxpR3JyMUdqdDE0ZHFZdTFlcytnZTdZ?=
 =?utf-8?B?TUdrQTlqQmg5bEhnVGp3dktxNjg2VEZheFByZm50K3Yyc3VvK2ZzelV6ZEJP?=
 =?utf-8?B?ejZmOURkL1RyQjUreGczbS9weGdIcHAzYnREOXJMejI3NThhMW1ZQ0pucitK?=
 =?utf-8?B?YUJxSGwrVjNlaDAzdko0b2lCVFRTUWd5WUwyUTE5cVBaQkxpdGVPVkRobThN?=
 =?utf-8?B?RlVCSmNRd1JweG16THJlUTEybFhrQ3lkdSswd2s5dzNPMDZ2VHkyYWp2Mkt4?=
 =?utf-8?B?b0lwcUsxUlhBbFdWZ2NGMDVtaVdjVHRpV0k4emI0Z1ZUdm91RDlNby9wYWxp?=
 =?utf-8?B?eVJRS1FxbG9jMmx0T016cHFTRUE1L1RrWnoxOWQ0b21kWGJFc0tOU2JyWEx5?=
 =?utf-8?B?MnhxVCs5MTBQWDQ2bFhaUVVpYTdKdGlOR0p0WFlQRlFGanAzTmZzVUhtTzRa?=
 =?utf-8?B?TElEQWl2dkd6RVIrYlNDRXIzWGg0KzduQU1IOTNYdTVuRDB5cUNPOWRXeXpn?=
 =?utf-8?B?Ty9heFBXVDMzRmMwY0dYNUlVKzQvNjBrVXFxZ3JQb0lEOG82N2QyZXdSc0dV?=
 =?utf-8?B?WVFqTWVpQjVUZ255WEFmQ2VvUEpJbTdkQUJBdXBPY2pDRlBaVUk1VDQwWjJn?=
 =?utf-8?B?WWFqTEhlcGZvNUd0Z2YrWVZFUmFzY0RnaDNPMjNTTW9xY1c5TVdlTFRKeWxT?=
 =?utf-8?B?TDJSREFjbjhKd1hzditxV29KWTJGSTFEOGFBOWprTUMzdXJIYkNuczJTQ1JS?=
 =?utf-8?B?OEhzdVBHcVlNS1cvQWc0d1o3N0lJN05vanFaU3NIb3VvMGhYNm54TE1OOWtD?=
 =?utf-8?B?NWJRK0QwZTg3eUpTYjYvS3lCV21nSGZYU0YvRWs1OUpKekdQSlhZcDg3aEdE?=
 =?utf-8?B?bGZJTFRkRG93Nm5vbG44SVYrZW5DcnRjTU9DcDBVTFJ1SVUyb3RNUTVrRSsw?=
 =?utf-8?B?UW0zZStKWkVldUhFWWFLbGdkT2pmcEhYd08wclBxdkN0azdxY004bnpRVVBu?=
 =?utf-8?B?S1YyWVlTMXNka2pYaS9SMlhpdHRLZUZROFIxS0dKMWtEdFpOZkVkZ0ZYajFk?=
 =?utf-8?B?VjdUQS92THVZb2VLa25DcDBOTmlscTNkTlo4bmdBQ25HUDZEQldVazRseXVz?=
 =?utf-8?B?RUFoOVoxWmNuT3M1ZnNJM2pIVjBSNEN5S1hlMHNQSkNwbGN2V2p0Zkw3Q3hw?=
 =?utf-8?B?dVVmQlpnOFlCK3RaRVpaZFd2d0x1RzBEdExZaDBBYzV0LzJBWURGRVFWaTF2?=
 =?utf-8?B?bHEycjF3UDRic3JSRE1UZE1DUnVOb0liT0d6bU8xU0J2ZXoxTXF2MTA1aHBD?=
 =?utf-8?B?cmVFNW9ic2RFcHNrNGcwakt2bmRUQSthUVBQS29EMVZWRUN1OHp0NGR2MGo4?=
 =?utf-8?B?NTYwQWlNTEc5VTVGMlZOblZhRFloZWZBYWhRTGlBWnhidkJ4VkU1WUM3VGZD?=
 =?utf-8?B?MmZPT3NrNGRFenhDQVZSeWFBQ1BVTWVsbENHZVNiMklZckMrZS9teGRGOVpn?=
 =?utf-8?Q?1U/m6On3iUXUGVSxc0NLvULt8GreMD5cDuIKNkT9yPeR1?=
x-ms-exchange-antispam-messagedata-1: IGkm3ZV9jbNK6Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <17211A1B799399428514D7D87413D631@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b661cd5f-68bc-4db0-bb05-08dede0be816
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 22:46:25.2725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFssUhCCQ00ezSREe09id6ZMVUTRG6qr7GR3l0TUrbd4MKFzuTTLGNmvSI2gmiT3zCh0T0ClOhibMxqUBhzIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8496

T24gVGh1LCAyMDI2LTA3LTA5IGF0IDE2OjM5IC0wNTAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiAt
wqDCoMKgIGVycm9yOjpFcnJvciwNCj4gLcKgwqDCoCBlcnJvcjo6UmVzdWx0LA0KPiArwqDCoMKg
IGVycm9yOjoqLA0KDQouLi4NCg0KPiArwqDCoMKgIGlmIGJ1Zi5pc19lbXB0eSgpIHsNCj4gK8Kg
wqDCoMKgwqDCoMKgIHJldHVybiBFcnIoY3JhdGU6OmVycm9yOjpjb2RlOjpFSU5WQUwpOw0KPiAr
wqDCoMKgIH0NCg0KU29ycnksIEkganVzdCBub3RpY2VkIHRoYXQgdGhpcyBpcyB3cm9uZy4gIEkn
bGwgZml4IGl0IGluIHY1Lg0K
