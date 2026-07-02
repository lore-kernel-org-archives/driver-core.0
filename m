Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D189381E9E;
	Thu,  2 Jul 2026 19:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783021542; cv=fail; b=ke8ttc+J5EQF/foIIJBuvGFk8Ya/ib+p2FIHHsQmczKq6Q32uyJpHCIXqGCqQ8ZCPi5VeIkybZyS09u9q425OIajmos/N7r96ScJYt6MaYAvrNcawD+QuU7Xkf0HAS9Ni/QjPp0qK1mxYYFiQ3VdB3Xcpntzd2KUaFMXsAeIRZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783021542; c=relaxed/simple;
	bh=8kl6XwnDS769kRDLGHuY01iOZ5NpaK7K5I2SR9IBfW8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ef30HywcMSffio/+DUrAP+N7pZrjTn7Y8FtuieSjgRxsEQ9sYl4ijw3ma/GEcFWNs6mH73TCa4BGrHjkdYLiAi6Nq1WCrZ0jgHFJIFt+/vBSdsWCY4nQTExrqrFGE338h7Fp6CxRkrHMmqpH4I3QR5LLsafEohscPsZYHKV0VOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QJgUNAtW; arc=fail smtp.client-ip=52.101.61.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QJgUNAtW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMlMTjfA76BxTFSCxf3i8NIQZsAh58DskdO4V1gIps6EHjvClohlOmo1VcdXyGzh4pdC1fRNxvryAfkhpRpiY2WhQl9Pg/z6Fh4ykfY7dSpsG6xp6x2VXX8f3UFQ7yggCJ9iDghb/xfnQ25+rmKsAzkfLABJPJH81Of7NX634EUnSsAUpDOsemE8aVX6WAjf/jXp+8Uc5UFhD51RDh/x+vcafg1xA+o8Y6qoCB1VdgNcbf8+QHglcv0LUJhJHwc7944D+AHK6+rn4uaZysaY0+FEfml4Fh7WINwAMBFBo2XiFCrXWD1zFlhOfq2mXCvaj89KNbt1cjaGMhZFkiXOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kl6XwnDS769kRDLGHuY01iOZ5NpaK7K5I2SR9IBfW8=;
 b=u6z06Mgb+oRsOC/MW8Ae3QFGWMzqtjWM9mIJdCi3Ban+paLBGN1STT2BmdhAaIVDTz505s2ct/k0IMPcAOge4OOecPs/EDt0pS3VjkhYEcMLipZW6WgI0yCG8PoMotRLA5lBSNOwPiPJBgm9GCUljo1VTEJVQcArVAIZ6w0euRQMN0b8ivmdPtsscP5ECrlKOTGrmAsIn5Gsowigxijy10o84revCBhivCt31LSrHi/Zlk3e/I9nd3guZ6jk/NQZmhdw6IeTmCwd9jna746qgmM/xilgGuy7xUoNb83TbxlkIOQBGzqk2u5z0doZGXgT8mgAtOvGmgWAzngPR6YV/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kl6XwnDS769kRDLGHuY01iOZ5NpaK7K5I2SR9IBfW8=;
 b=QJgUNAtWRgtFVKlqQXXfxhHSa3YXEbhd4sanAYFdl3UDU3tU8DUXHY9di8Hmsj61UtqEWdnP/OMTdY/FOy4kFWPZhVZ8bDRT8Ds8wgO/of0BJ6cg2xHnvyw/0fpzW3UJEfUntugtkGBX8h4qDMjROXJvVFrQb1QN+aRKiQzcapol8FVOpL2dqWdMx5c3Vw1NJYBbE4aO7DyuPSJwh6GHd5nBPZg1aMgnUAKSNHRZKPfc8xUCL4GKSbUmATqjDXftASaM5h7dlWjHQY3yD0pBfWQePB9hyDeuGzsZ6lPcGNcsflAJRLfEk4mZ+s5oPKhB8ldVecGcI5Rxra+ykL0eig==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 19:45:35 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 19:45:35 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Zhi Wang
	<zhiw@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "dakr@kernel.org"
	<dakr@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, "russ.weight@linux.dev"
	<russ.weight@linux.dev>, "ojeda@kernel.org" <ojeda@kernel.org>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware files
Thread-Topic: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware files
Thread-Index: AQHdCljkmvPX9pvAWkafavGTqyac37Zaof8A
Date: Thu, 2 Jul 2026 19:45:35 +0000
Message-ID: <3e771bfc6b0c89afc7969755e340a5fa863bc7cc.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-3-ttabi@nvidia.com>
In-Reply-To: <20260702192712.3450652-3-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|MW5PR12MB5683:EE_
x-ms-office365-filtering-correlation-id: 45f537ab-03fb-4b4e-1713-08ded8727c54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|38070700021|4143699003|11063799006|56012099006|921020;
x-microsoft-antispam-message-info:
 LzKcu9t5uxDSAiGqtGmSazGDJe/RXyZe5JPbdAL3mwZpSZHZm3WOhk8oS9CHrd7Ee50qcMiwrTFqoU7CWK3Lyw4fjIkp4j5M3cZSVAGDEUfwLr2Az3lP85kZp4o6vG9Pksu70p5KiyvYvvdg60Z6w6T4IgTJintoKaugi0tpBn8YYCfUEIP1cV5zBnloeIpFSaNEeYilgxbhkmU8cjIdqWniK6YmY2BE6FMh/rknzDGwxHtYcv/c1mxdv2SpfL6DrpkjoADOrhqjGLfq7Gf4BGTPjIyYStqSQQzBYFcnUm/3U3DJZLg1GYUvhwaF0Q25gVyP1qr7nDDr0UDKVRVTBQMgRdG9U0Usyc+bjonfzqgnw/R9s8Bj6RCW+LYD6OTrNNWKf6qqvsmtrjdQY0CJQP1Cv4R6I2+1BoxcjoEal8bHRiKAzOmzIpCi/Oe8BgE+tdHSekquLjEkdM1bVr8O8KWOcDZUkfVhQiic9Yas2ZSwIfThITADNYDqoGKomdw6UNGhAa6GjsXOed+cgmOJatlQmDpreKi7SFpWpTgWOOklFW/LfDyqMdI+clYUtXHmf2G8fYmVjZcahWAOwJi5Bpq7chAvLvR+WP4ef2Lz//o0TAdeUeVZpN98fpRcovdA5Q1QYt0pSbjwExwPoO57kZ0ybubZzyVD2Yna6eORghAT+0hAobdxoIJrxu4tLdCvUk4frIKfi9w3MMnrKkjjetrNOXTR+AjTOue2CgqGENx2crzG15a05fzR0IjgxNxQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVVLR3FiVXB6OWN6eldoLzlnSWVORTVxT24vVmlLZzU2a3haNTZYODdqUjdu?=
 =?utf-8?B?OFBhbnFEVnJGMUFSTFkzOStlTis1QjIwcWxiVFpqWFEvaDNhQ09pRkdjYzlN?=
 =?utf-8?B?LzRFOUdVeXVMMXJtSnhaamNKNWQybXpoNWRuV1NuU0xSUjU3RGlmbTFMSXFy?=
 =?utf-8?B?SG1rV2gyZDdzRnZNOFRTNDlrTVdQc1krdXdBUHBRNmU2VThOMWdoenJGRmNh?=
 =?utf-8?B?a1NNcCtKZDg5U0ZQL0dVd3dTSXh4cThqQW4wRjlCL3AwRGxkRVpaMDRjSWZU?=
 =?utf-8?B?MXIrYnhVaHh2b2tLVEQraUkzcEN0ZjQrWmpaWW9sd3BWT2Q2NWM0L3FjZGVz?=
 =?utf-8?B?NE5JWFNwNld6Yk10WWpldFY3TDZqemdzYVVuMjR6aHIyZEd5K0Uxem9tSkh6?=
 =?utf-8?B?NzNaMDVoUGhNVmJMU1VSUklJdnQxc3lFdTllYzlaSDFEYjhmRXBiRkZ2UEEx?=
 =?utf-8?B?UHVCdzdENG9JSHB4ck91cWVLdzJVSVM5UGRURzFzVS9kMHBLWkt1RTlHNURt?=
 =?utf-8?B?V0N6My9Xc2F6UXdJSEk5TWlicllZNTBrMWZrSFM3WFRlaWtQcHpFOTZWNXpQ?=
 =?utf-8?B?aWc1K1BXblZMQk9ocUdLcUFvYmFpZnFrRGhPWHZGZUg4WVNBUzFOSE9hSURH?=
 =?utf-8?B?UU9xdjQ0ZU4xb2pkZ1VSWDNDVTVLUDJid3JMRmM1TUs5czhWZVhQRlBhc29X?=
 =?utf-8?B?NEQ0d0ZMTFUyRWNacmNQcTkyTE5HZ2paUm1HSDluV1o1NFVPTnlpOXhsdmVH?=
 =?utf-8?B?R2ZMWUJXL2o3cGp3U1B4dXVRWnhYNGxuL1JPSFBheUFJenpsUUgxQ2pqOHpY?=
 =?utf-8?B?b0hCMXB2UU9xaDc5QTk3VWF4TE9wVjE4ZnlKb1ZZYXFWRG90L0VuL2s0VldJ?=
 =?utf-8?B?bGhEWThqY2Q3RGFlY2t4a2svemRuR1phaCtPZ3NaemlFL2o3ekUxMyt1NW5C?=
 =?utf-8?B?MlZaY2U0ejJxZnFxNVQwNVlNL2ljV0tSbHozaDVPSlBGbFA5VnZrdEpFMWtj?=
 =?utf-8?B?bzdHNE50ckwzT0pDQmZyTFNjSWV1ZTFVSFp0Y2xCQ00vYXBFL0VDTDJOU3VG?=
 =?utf-8?B?clFyR0JGL2FwcitRY2kyalJ5cTVCMG0vWldoTVNpV1VWbzlhb2RCQ2hTWmpV?=
 =?utf-8?B?a2xRUE55aElYcC85L3l0UE80SkJHR0lTeXF1eTdaK3JpcFVWY1YvRmtGQTR0?=
 =?utf-8?B?QmIxa1J2OXpyb3dzeU12SE1IaE1xcyswVWgzZkZHdmwvM09JL2tjRXpOWEdR?=
 =?utf-8?B?WjVjRm9NRWE3czkyNitKZ3dxRDdYWVR5aEJWQlFZLzVWcGZkTmI2SXZDNldn?=
 =?utf-8?B?SmxheXp2QU9oNGtkNDJheGoxOGtLLzZ5OFVXbWdaM0FoYjVRRnFESnBMRFhR?=
 =?utf-8?B?aVNnMXZVRlUrZmZIQXk1cGdmd2g3QmFQdWpqL0tuRUhxdFkxRnJMSllIVElx?=
 =?utf-8?B?WENJakNrR3Z1WHdvRlg0b1luVkU3NkZWellPTXVIRGF0VzBuaFhiK3JmWElS?=
 =?utf-8?B?WXkvT0MyTUZxSDBob1d0SXMyVUczMEpLNjlTdmpqS0JSS0lFWHE1bmZ3OGhO?=
 =?utf-8?B?MjMvWTdOa3Bkb2g4NmhJa25vay9zQ0p3NWFTWUVUNXkxeFJsd1k4MW9VbldY?=
 =?utf-8?B?dG9qY2VNL1JnK0t4WHBKRlJJYmk1SklTaGhFSDlyTmlHZldOb2hqYmpXM1Ex?=
 =?utf-8?B?bGRxOXZlTWd5c0FpTmxmSm1mbXBheEtqWGNiWVJFb3VqelZhZFEzYTVocXJm?=
 =?utf-8?B?SUxaMTd6TjV0RjdBRy9pS2dpRFVFVmNzYzcwMTMrMDdTaFlXSGhzcXVMYjNI?=
 =?utf-8?B?a1hFVTd1NlNLUmt2OHpWalZkRkptV1lnaFJpWDJhUUJ1ZTFTYmIyVXlXZFhN?=
 =?utf-8?B?MC9mMW9oeVI0ZllZMmV5NFA1dkxoOVZnajVPVFZYM2prNWRnTWxOV2hteGZT?=
 =?utf-8?B?YldnWGR2OGpyQVh4UE0yY0wzOWkwbXdLODFvbzJEaXkrTTAzUncwOU01WC81?=
 =?utf-8?B?cDkwWjA3dVN1MjhabjdWazdVbm0yWk1zQitQSkdMMHNobU0rZHNCTnQyaDJN?=
 =?utf-8?B?bmo4Um9OSE1ERG96RnMzb05qdmp3UFNaQnA0eG1WTmQ5cFJHZTBrdzdOaDZl?=
 =?utf-8?B?SFIwTlAzblRCWWhYcGtDYTFuWDZpb29RbGkvb2hRMmtSaHkxOUhXVDNxSzVC?=
 =?utf-8?B?dUZ1OVRNUTBtOHNoL3l2TnF2YWVUSm13enNJUzdjdGVOM0JiQjFHS1lMM3dn?=
 =?utf-8?B?Q1J5SW9RYlRSRWJ1Z08yeVVVdU5EU1owcDlnK1J6c25tOXo2MkxnMjU5bmJu?=
 =?utf-8?B?SStEWVU3cXFXRHlKQnkrRTJlR0JuZCtrR2lTaG9IakMrdms3bysxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38CC8107D210964AB356369297B32E09@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f537ab-03fb-4b4e-1713-08ded8727c54
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 19:45:35.6648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2wkEqDyszUZtsbWObQ9qZ2pmtPD+mEHIYE0OTSvyMllC6cnSRS8xiF5/HlzMaPEuEnVWWznYTm1LCzRmI0GKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5683

T24gVGh1LCAyMDI2LTA3LTAyIGF0IDE0OjI3IC0wNTAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiAr
wqDCoMKgIHB1YihjcmF0ZSkgZm4gZ2V0X2J5dGVzKCZzZWxmLCB0YWc6ICZbdTg7IDRdKSAtPiBS
ZXN1bHQ8JidhIFt1OF0+IHsNCj4gK8KgwqDCoMKgwqDCoMKgIGxldCB0bHYgPSBzZWxmLmZpbmQo
dGFnKT87DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgIE9rKHRsdi52YWx1ZSkNCj4gK8KgwqDCoCB9
DQoNCkkgZm9yZ290IHRvIHVwZGF0ZSBnZXRfYnl0ZXMoKSB0byByZXR1cm4gYW4gZXJyb3IgaWYg
dGhlIHZhbHVlIGlzIGVtcHR5LiAgVGhhdCBzaG91bGQgYWRkcmVzcyBhIGxvdA0Kb2YgcG90ZW50
aWFsIGlzc3VlcywgaW5jbHVkaW5nIHRoZSBvbmVzIHRoYXQgU2FzaGlrbyByYWlzZWQuDQo=
