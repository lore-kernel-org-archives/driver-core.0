Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBA53FD127;
	Wed,  8 Jul 2026 22:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549602; cv=fail; b=j7rPakww3+x9ku/1zUbanqaefdHTgBxaWNDKT3vTIAfewQCh6b8YfakedOkLQw6sN4o0iV4W51EN83/IQ75bsL/x1HpVoRaZKX9busqa5kuoqwZd/WRtT2idDQNLd020l+bu/uJRUgV4LLvLqd88E2PON30euh0tr6wWrDV//+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549602; c=relaxed/simple;
	bh=jb9G1++6M9bm5H1drrXl43cpskcMK64Z3zuVpmZtFS8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ka6WtSPnkg5z53AbogJoXYxm4f58pOnE0MN++RSU+5AWwFye7jvWoIBIYOFw7Gb+n+1fJYGph8l0PX2GZlDIzaUHmfIK/Lj9zJOUorpMD6zBuzoFX8adnSN5cMoQqAoMphvbLCp45bofFis81135X0GUYIoOK0lJxvHWHeZX6Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MltbxbVY; arc=fail smtp.client-ip=52.101.53.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MltbxbVY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3AvOH4eA08OVnn8Ut9/4c1bc4aZdYzasIMRU94HoZWvKmazzZHQUblI4hXGy9SpnA0Hi7Hl8LZqqafaGzGQkvaXFCrfEgMh6s7um2hMqC+5UIKoiIiplVvJly30iIz3LoT+yP+ng1UwVQ8G4986cHr5zvcR7k6SfuDwpEbJ4g/PyNALLGH61Rs63YTau/tEHGy1KVnjI/GuB4/pD56s2cAl0MyZ319utl77Zl84aUewPMl8mrCY4Fv8DDKCspx+Vmeii5xSHwcSO2tYcbGCupUSo6clzZpEnDI2qdJFSgK9AKCFl7deV+LxBS7hPxScTU4Te7FDU6hBDBsDddwFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jb9G1++6M9bm5H1drrXl43cpskcMK64Z3zuVpmZtFS8=;
 b=JLxpWs9T8/kgp2cSK1iX16oksFzLYpRhH7BBrl9P8a5HMMe534Oq2VYupfEoU0P/2vFzMTVx1AK2FQwbYL0wptT7xL+rZsg1LGVwdEbB7emLCrkwV34JoC4TNHJLGfeEewBMIHR3xTvIUlJHqCePN5QNM3QI7cQRTRXG3PtAPVTx4TzHac5AgaIJaTz+ZQBsUA9unuu1byYaeTHHCNzhW09fssnvFqGCMctONo6I6sAcs3AaDBmwyCxWFZBTJcjxRIKou6qLt5xOx4e55Kzcpt2q1gu+9xmqGUIndqkXDA26ckxbBLba73JvGqp/ClfLh1BCmoJ4ArYn308pxf+N/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jb9G1++6M9bm5H1drrXl43cpskcMK64Z3zuVpmZtFS8=;
 b=MltbxbVYkkFIKdBd2Oluf6DtePCB8fVDVK248GqPcKqzd6236rY0WwZzCFVUvkunRy0yaJk3h5lh9m1tAyEAXyLIxcsqsLSqMRiiHr4wOIH1x15/gLXgWzFAzQFcCezCnHIJsVvXFFGO/pGCcVmHa3Zull27628Lkn2rtMa1bTo9T+2au/sh+wo3jiw0YJAOqBCa6Y6A2u8UwJZoLdxqBvzGl7TlDNJZ3TGNhCkynZc+WXvPH3r7eSE9MXBXb2aCKVxYHx7uOewX5RLByhiuaBK1cs6zkPaiCT1mVMgcNYaeX70qO+nrzl/irwnkgxGD0GnjdHHs70UrIvbXQb+Nxg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by MN0PR12MB5836.namprd12.prod.outlook.com (2603:10b6:208:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 22:26:36 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 22:26:36 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: John Hubbard <jhubbard@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Zhi Wang
	<zhiw@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "russ.weight@linux.dev"
	<russ.weight@linux.dev>
Subject: Re: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
Thread-Topic: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
Thread-Index: AQHdCljkwu1+XAkqMkK4e6h+pSRGELZgDX4AgAQve4A=
Date: Wed, 8 Jul 2026 22:26:36 +0000
Message-ID: <79b4033973c675355a25d8fcc701cdedf8f30bc7.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-6-ttabi@nvidia.com>
	 <DJRA02VV16AS.3W0QHW9YYSLXE@nvidia.com>
In-Reply-To: <DJRA02VV16AS.3W0QHW9YYSLXE@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|MN0PR12MB5836:EE_
x-ms-office365-filtering-correlation-id: b66a8e22-b4ad-45c8-ae18-08dedd3ff918
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 gXlYLk8fKcs5JALT1Ff8MtgfH4kYnyeyJMjK75Lu7qXSn11rOa0iE3tbxarQ4HOPTHy97Wm85h2ecZLgiyAPWmj6g8+EEucnLwM+ypkxuiPDy3V2DVd+lAG+vJQ6bn1aJXYwPeXR5AofvOeN6rESZSevilorfZTE65C3R8KwrFiTIN2tui3p/PdoiFFQG7AN6ZVr7V4qGpZyUQ6AFDn2vZFtNvQpkS2NPIjN3kpyT5SMwpaJ01fj2Qs1V6HNo/nyGghaqNZJI+dmXuK9HU0igLvI9tq3zU7BjMEMuJcgtfC9jpOZraTBRd4Wy0orDO4+5TPGmxaFrZ+pEQRRT64YFP9g5oj8z2DkkHhv0eWETIPQVtfO/zwXKKmZbQZNOwvI2iUQpUgQBDCkJOuJTgWKuFXNGpt8LIRWFvusUQnTRUjVlIkN/WflLuuDjaAZkrOtq0Rt+qgYHzxXuHbcajr7DR6F1aB9/qwLgId8M7iUBJ6RJqKLfFmF8pPGczCtDtd2fyBlz5bJWGrvM/NF8uRJ2ybOFjPIZ9XA65a1XwGpDn2kqG5wl49lJBJR4EgDGSASRqcCoCUAH4eUUJoyJUZnZEnGRUblwMbrcT3it3kThKs8dDbWGTjsRb30urdTw4V0+Tx4KYC3hWOyLX8IfSoHkGPrR3eOls04cpFgqfWPTmazmnLjgcuBir0RNAYuwFjRnbgHcQid9nrBiu78VT4Kcf/OA/IVb7NZhOTUMcBxGsQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnI1RFlmRVVnb3lvSit0SGJQcC9XRXYxMFNQRllobmUrek0rMnp3WVNaamZB?=
 =?utf-8?B?UGFhMUhrNmwxamVxeVlmNVRhM0hyYWgwOW9MbjYwNTBOZ2VSRkJQZklzbEl0?=
 =?utf-8?B?L3hRenVWVHBDSTFMYXN5Tk1PeFhlWFVxSXY5WTVIbDVYbzJCQTR5TVpuMHMr?=
 =?utf-8?B?Q1RRTWUrcGMxSkE3QjVVVUZSVytHMDUyYjAvWGlrMitTYkFVd3ZsSDhRbWh4?=
 =?utf-8?B?bWxyU2ZvYzUvN0lHV0hxS3FMZFFyL0NZWHkzVnpYWHdUM1U0K2lFUk9BaWhh?=
 =?utf-8?B?YWg0S1hIMlFuQUdqV2ZjS3VlMUxqMW9Hd3VqM1c4cTR5dFFZdS8yZ3dEaHVx?=
 =?utf-8?B?UUtpT21XQlN1QkdaSHhNd0ZIVDdkVlN4YUZZQkNZRTdhMXQ2WFFhb2ZqWXJy?=
 =?utf-8?B?YUEwNW9tZVprbmI5VEFMZWF4Ylh0ZVlnWjNOSlQ0czNuTDNadzhsK2NkUUdL?=
 =?utf-8?B?MzAybDYvQk1MSml6eHlxcUs5ZW11REY4UU1UZWdhdDdoUG1kK3hKck5qbFBK?=
 =?utf-8?B?MC9nZ1pPNW1HWktQalZNcFdBaWY1V0dNY0FxME4xRllnZmNXQXBIYXAwQUNR?=
 =?utf-8?B?eUwzZDRnUlZjRUozMXN5Z1R5L3A0dlFLU3psSmcxQjdNV01TRjlQVFFMUWs5?=
 =?utf-8?B?NXptcUx3UnZXeDBGazRrQkxSeG5zYlJ3ai9iNHZNdUdRdHFrZUlGbEpXNDl4?=
 =?utf-8?B?TmhOejVNS0RVbmxaZ3BleTVhMVA0ZkJFd1JzN2VJcGRwOGhhWG0xeGtmd1gy?=
 =?utf-8?B?d2dQemVPQStCaWFJN0JIclF5cmFqSWhxd0cwVXlwc3FIV21WblVHQzREZUhk?=
 =?utf-8?B?aUtpRHc2YkNyZUE4c2NXZUVNZ0hMOHVhM2wxQTRMenVmb1RMeGZ6dFZOYk8w?=
 =?utf-8?B?azR1QVRLQllpdjhlNkVNaW5yS2czYnV6TlBrVzdnQjZoaDlSa1NSTVltaVo0?=
 =?utf-8?B?TExVcmNGY1poME9JNEsvQ2tLY3dxUWxGNUVnbkRQZURHV0J6VSs2T3lCbWZY?=
 =?utf-8?B?V1pkSVdHdkFhaVdmaW5zZm1SWGhndTBzdWMzWUtreCs2Sm1QbVFYZXFIYkxk?=
 =?utf-8?B?VllhNHUvbDVzY0FRSlREWm43QjUraEhVcllXSVBMYnl3am9KamM5dU5WNzhL?=
 =?utf-8?B?clZ4VVNDSUg1dG9uWXZHVDFyYnkwMit1eDR5OWpHenJsRGdSc1I1VHFGSkk0?=
 =?utf-8?B?Q3RlV0h6d0xpUkJrZHQvUXAvVXBaRlIwSWptSDhDWlF0TEo5SWZuYVFweDFx?=
 =?utf-8?B?dSttV0FBbEF4UlB0bHBWaHZaWXBEYVptN2JIaXgxdWxZOXQ5UjNoN3B6WEE5?=
 =?utf-8?B?VXkrazk3ZU1yaUZoOTFIcEtteGVIdm02eTZtWGF0eGc5dnVCM0l3aUlLS0t5?=
 =?utf-8?B?cHE4TmQrcStRWTRIZ3NMSi9ONW9sMGlMMk5tV0srWEF1cWQrNFNmOWh5eVps?=
 =?utf-8?B?dElSRzZnTkc3UHpzS0pZV05GN00vVko4K1VKSkRGaDBJakU4THdvbHJ5ZGtk?=
 =?utf-8?B?QTZObVlmYUY0NWFHNjh2dGt1a1RkeXFIWlZHY2FuVXNsb0oyS244MTlPdnBW?=
 =?utf-8?B?eEdmcUZsTnY2L3VNcng3bGNtT0VGTU9CNzFRK1JEUnpidEhsT2dDQkJYTnJ0?=
 =?utf-8?B?VFVoZkZ1RmlacDRCYWh4T3Z3YTF5aXVQYUpONUhWSC8wR2RKMzRNMzNiWTVX?=
 =?utf-8?B?UVlnK2RVSHgxbmQ3NTdkenMrcDV2UlJ2YzcvZFlDbTFSMlB5L0NCcFhiblJX?=
 =?utf-8?B?NFRZN1U1VGdqc2Z6aTIyWCtSZUZYOTBzbHB4L2p0QWF1dDU1THZjZ1JxQ3hp?=
 =?utf-8?B?ZVVhM1I2clczVFB2K0U2WjNEbXRzS3Z0Vm5RNU5oZGN4UFBmeHdoSUV1MEhi?=
 =?utf-8?B?OGF1NnFxK0M1UVpremZnMzFkS1NzS3pJQnVTRisvZUxIZWkvWmVDT0lkbTB5?=
 =?utf-8?B?dktDSlZPSTdlcm04UXNZL2sxcm9QMkVPai9sR0UvazB3TTBaTFNvRGxSQUF4?=
 =?utf-8?B?UjlsYnJPZkZRNit6WEwxZVlUcFM2Q1BXSUptcmozQlphc2I2MkhORWtDbUFq?=
 =?utf-8?B?MGlBcWZ6aURGc0xRb1hSQ29wRzBQY1NEZ0lKdUZpT24rKzhGN3E3UWozOFZQ?=
 =?utf-8?B?UDJHaXVRVm9SbkJveGRVNnVmWVRoWlYwMkQ2ZUtpSE1lR1FoeEhneHc3RVFW?=
 =?utf-8?B?UlNROHVUQTVHUCsxQU5lZDVlUzJqRmtGemwvUS8wNkZrS3lLWTkwYVZhZ090?=
 =?utf-8?B?OHFGd1dPY3ppaC81UDhvZTJhVHZnVUVuQXRoekJYcVpsVUxiYUlTNHZQajdO?=
 =?utf-8?B?U3pwZFJPUnNUczIyUlZFdTc5Vkx0ZzNOWW5QWno0M0ZuNTVvUDMzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FE88E356FFB1C43BA03A71E2D1394B9@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b66a8e22-b4ad-45c8-ae18-08dedd3ff918
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 22:26:36.4811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kTbnqiVJcMnVMu3RfscRkiODjh5tvSH84jCefeHXLZrSPIT3mUUP4errCEJkkd1g/Xog6q/dFkhQ0c1wpL+kqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5836

T24gTW9uLCAyMDI2LTA3LTA2IGF0IDE1OjMxICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiArwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8hKA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRldiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAibG9hZGVkIGdlbmVyaWMg
Ym9vdGxvYWRlciBmaXJtd2FyZSB2e31cbiIsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dGx2LmdldF9zdHJpbmcoYiJWRVJTIik/DQo+ID4gK8KgwqDCoMKgwqDCoMKgICk7DQo+IA0KPiBz
L2Rldl9pbmZvL2Rldl9kYmcuDQo+IA0KPiBBbHNvLCBzaW5jZSBgZGV2X2RiZ2AgY2FuIGJlIGNv
bXBpbGVkIG91dCwgdGhlIGNoZWNrIHBlcmZvcm1lZCBvbiB0aGUNCj4gYFZFUlNgIHRhZyBleGlz
dGluZyBpcyBub3QgZ3VhcmFudGVlZCB0byBiZSBwZXJmb3JtZWQuIFdlIHNob3VsZA0KPiBwcm9i
YWJseSBleHRyYWN0IGl0IG91dCBvZiB0aGUgYGRldl9kYmdgIHN0YXRlbWVudC4gVGhpcyBpcyB0
cnVlIGFjcm9zcw0KPiB0aGUgc2VyaWVzOyB3aGljaCBtYWtlcyBtZSB0aGluayBpdCBtaWdodCBh
bHNvIGJlbmVmaXQgZnJvbSBhIGhlbHBlciB0bw0KPiBmYWN0b3Igb3V0IHRoZSByZXF1ZXN0X3Qu
di9UbHY6Om5ldy9kZXZfZGJnIGNvbW1vbiBzZXF1ZW5jZS4NCg0KV2UgZG9uJ3QgY2FyZSBhYm91
dCB0aGUgVkVSUyB0YWcgaWYgd2UncmUgbm90IGdvaW5nIHRvIHByaW50IGl0IG91dCwgc28gd2Ug
cHJvYmFibHkgc2hvdWxkIG5vdA0KZXh0cmFjdCBpdCBvdGhlcndpc2UuDQoNCkkga25vdyBpdCdz
IGEgY29tbW9uIHBhdHRlcm4sIGJ1dCBJIGNvdWxkbid0IGZpbmQgYSB3YXkgdG8gY2xlYW5seSBj
b21iaW5lIHJlcXVlc3RfdGx2KCkgd2l0aA0KVGx2OjpuZXcoKS4NCg==
