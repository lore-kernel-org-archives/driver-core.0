Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61395172D5
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 15:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906094; cv=fail; b=GArBgjHFTARe/vM5u0X3LLuP+QNcmU8cK5YOBQEq2tYZkFFtBiJHLN66FDUtO73BRdI6jIV1NQpVwfp7RQgeQptGH1FETPeHysNqBrIfA6PS284zFB4yntAl/h2BSAar3LrKon7ow+ZgB262V44BdaMYniKTAYMSTeKQ8O9QZwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906094; c=relaxed/simple;
	bh=wbUrgRaPxNRiLxjwUd1IDdx5zSN8CnXJQiKgdkjqnyE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F15gTzJMx/4uRhRIZM1RkL+QzGcxUV4sVeTi3gYsZaiPSU43VU427+4Zr6z6IVbTYI6nKc9NMt71NUGtlfFN0qsqD4UHaVnWCaI8GlT399qsjIlQw6LiYBZMLUr/IDGPIwIoUbtebe7NMu7Y5Sgquep7do9ziBg/aGjjYjBVAtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=SSkVMxBJ; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="SSkVMxBJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVztI1e8Jpww1TCJYz2l98vpAbe+/DOjztzLX+/ND6f8nnNTLENS/P46rFZmvAY7jUSTb+8kq+4DpUiy/itNv57OeleVPXjPty98TO5JSaob/55sdla6EPhuQBoF/HlHrQe0TxlyvHaNCWGG+SCXnjVdHb6Uafdz+V128wuJfCjTlbsUlFLZ/2w5AQxtttGZ0zwFPa1tS3rrmruUFSNBxqiyhZ8i4VMkGf6FfCiVTXnvYBI6iK8wHlJVBM4WOp214jGb/vwr08B2bKBIAxkzH49TPTQ7BEe8NFBvdgM7MS35sljkCg3X7BUSvhcjv9w+hvE8rLTQ8D0gj7qcriLYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbUrgRaPxNRiLxjwUd1IDdx5zSN8CnXJQiKgdkjqnyE=;
 b=HWbR7DaGsstHbgaLyVxo3P5TJq+fLmVG/pKPFxGDUsn1g8KFSOC2uIMT1/k/sP2bzdauTsHhcV4jcChFpta3fQGbjOzZkEM/RPPAyXTOf8sY8MF3oJPXGDu0ChMjyUQOZuyDDO1nTJJXjOh0rSkJE1ovJTOT/pKxgXGfFE5Iu56p/sGQQ/e/ctkPGBTEsOxDnOPFnwJmX2G7TNKtJwN3RMF2j4e9JeKPKyuHCqSa6qy83fhFh/30RVjIkYoAAL7XdT7IZyQUrUSLvXEX5cqHFI8CNW/uymbSVTqIodZoUhIHdEDVfnojlgzUh8L2xjkRvFk4gTFXHodpihgzI3YOBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbUrgRaPxNRiLxjwUd1IDdx5zSN8CnXJQiKgdkjqnyE=;
 b=SSkVMxBJMdxzXp48XyZCgczRdtMTY52wyx8HiIi3ibbU+SjsYK0gJq/g9kyu6BGy8EFOSChx2s8uF2sVq9rwlhjDaIfIgsofSIbM8xXhI0MdCREI9sORb/nSY4SYZeqkLYESJnMPw1U+AsSPBxyjFYjMcosgzKFgS8+In8DUQjs=
Received: from AM8PR06MB7602.eurprd06.prod.outlook.com (2603:10a6:20b:363::19)
 by MRWPR06MB9925.eurprd06.prod.outlook.com (2603:10a6:501:73::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 15:41:28 +0000
Received: from AM8PR06MB7602.eurprd06.prod.outlook.com
 ([fe80::a651:a30d:d0eb:cd2e]) by AM8PR06MB7602.eurprd06.prod.outlook.com
 ([fe80::a651:a30d:d0eb:cd2e%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 15:41:28 +0000
From: PETER Mario <mario.peter@leica-geosystems.com>
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alan Stern
	<stern@rowland.harvard.edu>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] driver core: take parent lock in async device attach
Thread-Topic: [PATCH v3] driver core: take parent lock in async device attach
Thread-Index: AQHdWxvVh/Zj2N0VD0eVf/G9N/H/f7b7nGcA
Date: Tue, 13 Oct 2026 15:41:28 +0000
Message-ID: <c465c6a3-d189-4304-a7ea-feb3eea33674@leica-geosystems.com>
References: <20261013140408.1226841-1-johan@kernel.org>
In-Reply-To: <20261013140408.1226841-1-johan@kernel.org>
Accept-Language: en-AT, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7602:EE_|MRWPR06MB9925:EE_
x-ms-office365-filtering-correlation-id: a5b7744d-8ed6-43bd-cb33-08df2940727a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|261009223027099003|38070700021|11063799006|6133799003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info:
 l7in4cW14cmPBfFtMC1ESxyB8+6f2hLz8Bz2Kh0/ZDhCxjuKrXqMMFMeC7W1LKJtTAGlnnDG2WLTfk2e4qzdkE8SzniLgl7ALSQJnWeU/l2/+s3mLOa5r6iIL/CuPV2XXYPEJZnZerDM2rsec0wK7/5aZ2IvG4FVIL2wuCLEn55dRFB2Ilt4z/MLqJUqULPGz5thHsTXr9j1A3zGNnfrKm/NL7CG48bGY/DYiUg6O5RYv0qeoHjJmZXYhFGGK7gqBlK9TrHx2D3MSoDZW1jrx4rixjRXh1n2448E07fM9mPC6PLFx5GydlwwljkOvflXki6f97tLwfqJA3188QGss4M7CygEMjaG+tVxd7bUOny06yLKuKKgie9kbjuIlRzK0LZddezR4VOnrScdUE8/rbfp47zPVwlh022NF7DmL8e+pBIMac4t2cNwqAgyfS2qUBuuBGDlBapC4//EPclqs5XQzwqrLQJAp1STQl6h19jSsBl+5iy9VEYKaWwTg6iOdhZvmQxpIr7R4elnPJcTYlwYI9QvKkN4tTYF2RabMPQ5Rq2w4Ege5AyTRpkamgUez8Yl5GUb+7+7MTLgzMEUr10Qg/nJvS6IPzi/IvZ0evimqcLSOI1FBei4sHcCEnYxodwYTlG9tYzdVxpNFc1JC4uTBYpEiv02coXXVfTSYNhTPNCt7zpMiOzj6lqmCae6bOif+1QP5AumnWBN11uf3MtO6n768j/YYPQmCN9H/uA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7602.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(261009223027099003)(38070700021)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDBYd213a1FsUmVUV2tJSFE3REJsQTVnb3lrSG5mS3Bhdk10T1RLVG1WYi9U?=
 =?utf-8?B?Zkt5U2k4LzQ2dmxoeEtqS0hOZjRFeGJ1SGtCZnFxVy9lVll1RTFHQjg2aDZR?=
 =?utf-8?B?REQyTFppSk52d2VvK2RwemFsT1ZiS1EwaWsyN200NjhPVUpaMVhtK0lBTExo?=
 =?utf-8?B?Vm01RDNDT2FDei9RQTMzdkxIRy9WOHp2SG1lckFvODA3Y1MwYlNiUkpyNmFD?=
 =?utf-8?B?VUtDVVRnQ0NjWjI1aVpjNVQyeHBmYysvN0JPNkxZTDcxSWl4QXZ5ZzFFU1Vk?=
 =?utf-8?B?bTRaQXY1NmFPNXFSSlpNc0p6NEkrZ1RlQ0x5U1JMRlh4Um84cHl1N1hVcTZi?=
 =?utf-8?B?eHpWZXA4M2dXenJ6L0RXRmNsNmFxSU11Wm9NUTZjU0Z1NnZIRXl5TExxVy9X?=
 =?utf-8?B?VzVLWDArWVRvNzN6SnZjZDhrNlA5dVhGd2tTYktNZkxXdkFyTFpNYXErRU9v?=
 =?utf-8?B?OGtHMHBPRTVGaVV2VnpTaU9uc2V1N3hhWGdOSGJrNkh3amtLeHdRUXMxMHQ2?=
 =?utf-8?B?SXRqamxIVFZ0dVJrVVRrRXplQ2kyNWd2NC80RnFmUHRab0Fjb05yN1Q3c0pt?=
 =?utf-8?B?dDNRbWFhYSt3QlRBZ21yWndQWW9wSDhDRnFicGw3Z0I4MnVCa3FyYi9wdjVI?=
 =?utf-8?B?ZjhPQ1d2ZnFyVUM0QjhvRWsraVZEVkVhd2g4WktHd0llUUZDYkg1a29JMnAy?=
 =?utf-8?B?aEFsNzc1UHM5amp3VFM5R1ErU1Z4bTQzbTFEdWVuaDZkUjNLYm84RGN0b2tD?=
 =?utf-8?B?cGl4bjdUVG1kMGgzSEQwVDVKNEp5ZkN1a1p4TjF4ZXFrTWF4aVlTMzd3Q0NQ?=
 =?utf-8?B?cWRBVHU0YktzaFFVcGR3TzVlN21mV0hWV2IyemJyVWxOWmtwYktlaUhoSmQ5?=
 =?utf-8?B?RmdCUkdOZ1QwM3VMaXQyeXY5Uy9oQnV4SzBJNGZKZy9NQUhJY3RlOHJOWDUr?=
 =?utf-8?B?YW9JTXJzYWU1VmFDQTRlaDNqeXJnQnNUOTJTMkdsOVc5aVpoQ0dUWXorMVFM?=
 =?utf-8?B?bE9ONDRTbUs3NTF1UmJyQ2NoOW5EUGZWZVNvcFRsOXo4RmkzQm9KenhjVng0?=
 =?utf-8?B?KzJoQUpMMCswODdQaXhpelRFTGo4OG9mQy9mN3JzcGpaMFJFR2ZVR0ErVEk2?=
 =?utf-8?B?anZuMk5IQXZCM3JBZFVSemVPdVBZV00yV3NuT2JxcE5nUGI2U01qWHhEaXFP?=
 =?utf-8?B?akN5QmRpU3BpUUVBY05yd1Z0aUswRGFjLzBsRGpzdS81dzVhV2hPdGxxc0R3?=
 =?utf-8?B?a0tEeUxVZEpFRExpekhlV0ovQm9wQm9kRFRLeFZFdFYwT3lwWTZ6OXVwa05J?=
 =?utf-8?B?ZjFmRTRzR29NVzNoWng4R0M0bkMrRk1vaGlFTEhCbjRFUUQ4UnNzSkFKcmtT?=
 =?utf-8?B?OC84YTlHd1hmMk9tMzZYMFdDRElWRTB2V1AzWmxtR24wQjRSaWNKV05USmlz?=
 =?utf-8?B?dnNBeDcvTmxBNnNtMnpLZFRpc0pCanFsbTBBMU1DZFEvbzYzWnk3bFRXeGpm?=
 =?utf-8?B?QlAzek5aQSsxTUZKcEgyb1ZBaVI4VUdTeGlzTHRvNENBQzBzeEtPdTRCdnhv?=
 =?utf-8?B?TkdsTlhlcy90Uk03QW4yWlhyYjcyUTg2SnNOMlR5VGNzNCtYT1lCTXJkQU8v?=
 =?utf-8?B?NVlVSmFWTjVCdzlSa1VGdHlQUE5JdTllMC92K2JDNVQyakFZTVU1UjFsUFNs?=
 =?utf-8?B?UjQrN1RIVTVDYXJxMkZ4cGg5b1cvSmYrV25KLy84NVJXT0pnNGxGdklMMHgv?=
 =?utf-8?B?Szd6ZkNYKzhmaHhFWk4vVXJsSUZrdzZld0RRR3R2cFBvYWR3c3A1VWpuTjZE?=
 =?utf-8?B?aDBYSlhOZjYyZ0kwWklBNFlDVTZRbmJIU0dYdW1aR2ViMnNmZVpack1Lci9q?=
 =?utf-8?B?STRwZDRLVGN6dnYxVFlHeE1jYXFwcDZTTS96QmlQVmh0QTBxNkw0c0xYb0lL?=
 =?utf-8?B?RXU1bmZ5MXg2ODZMY2lFRkJ3WHNGeE04K3gwdDZDZHhsdkN6akxOU1NXemZu?=
 =?utf-8?B?TStUeDJmSHpJc1lrWjlHNzF5NU1aSkNnL0Y2alpjakUyOWRSZG5ZV28xeXBE?=
 =?utf-8?B?NVp5endtTndiK25aOVZTWHFxa3BvN0hVMnhuYkxMdldqbktkazlHeFh5d0ls?=
 =?utf-8?B?djR4ODVYUVBWTzAweXRWRk1VdjJXSUU1bVRGaU5MR0I1TnJTZDZxbGxZMFlj?=
 =?utf-8?B?WHltMVhFSFlWT3JJQmh0akhtU29hVHRuZ0QwUGd6ajRZbkpmT21KcFdlWW9U?=
 =?utf-8?B?SVhwSGhJVkdzMjdzU29PdjIvY0VDbWcwTlozbXkvZ1lOajJobThHZVFhT2VY?=
 =?utf-8?B?U0VuTXRzUjN4OWcyaGgycDBCTFlrR1RER1gwdm00ZTZDaTE4aGhjQXQ1ejNw?=
 =?utf-8?Q?e9U64TbmnvUulYwE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22D87A2B12586D46914053B139C6E429@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7602.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b7744d-8ed6-43bd-cb33-08df2940727a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 15:41:28.5020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6rdQQbYPZEuleYhhNh3TX0p1X8Jek7O79WJLGnJHPfXhjNEiUQ7YdHYWqge9WsardVMJR4T7GLH3sXlLJ0Y/DmzEfRJ8Ns8EvxqSJYXiNGciRNHx1wwpvKGY2XXcz53
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR06MB9925

SGkgSm9oYW4sDQoNCk9uIDEwLzEzLzI2IDE2OjA0LCBKb2hhbiBIb3ZvbGQgd3JvdGU6DQo+IEBA
IC0xMDM4LDcgKzEwNzAsNyBAQCBzdGF0aWMgdm9pZCBfX2RldmljZV9hdHRhY2hfYXN5bmNfaGVs
cGVyKHZvaWQgKl9kZXYsIGFzeW5jX2Nvb2tpZV90IGNvb2tpZSkNCj4gICAgICAgICAgICAgICAg
IC53YW50X2FzeW5jICAgICA9IHRydWUsDQo+ICAgICAgICAgfTsNCj4gDQo+IC0gICAgICAgZGV2
aWNlX2xvY2soZGV2KTsNCj4gKyAgICAgICBfX2RldmljZV9kcml2ZXJfbG9jayhkZXYsIGRldi0+
cGFyZW50KTsNCg0KVGhhbmtzIGZvciBwaWNraW5nIHRoaXMgdXAgYW5kIGZvciBmaXhpbmcgdGhl
IGRlYWRsb2NrLg0KDQpUaGUgdXNlLWFmdGVyLWZyZWUgdGhhdCB0aGUgQUkgcmV2aWV3IGZsYWdz
IGhlcmUgaXMgcmVhbCwgSSBjYW4NCnRyaWdnZXIgaXQgaW4gUUVNVS4gV2l0aCBhIGRlYnVnIGRl
bGF5IGJlZm9yZSB0aGlzIGxpbmUsDQpkcml2ZXJfYXN5bmNfcHJvYmU9dXNiLGh1YiwgYW5kIGR1
bW15X2hjZCB1bmJvdW5kIHdoaWxlIHRoZSBwcm9iZSBvZg0KdGhlIGVtdWxhdGVkIGh1YidzIHVz
Yl9kZXZpY2Ugd2FpdGVkLCBLQVNBTiByZXBvcnRzIGENCnNsYWItdXNlLWFmdGVyLWZyZWUgaW4g
X19tdXRleF9sb2NrKCkgY2FsbGVkIGZyb20NCl9fZGV2aWNlX2F0dGFjaF9hc3luY19oZWxwZXIo
KSwgb24gdGhlIHJvb3QgaHViLiBBbiBpbnRlcmZhY2UgcGlucyBpdHMNCnVzYl9kZXZpY2UsIGJ1
dCBhIHVzYl9kZXZpY2UgZG9lc24ndCBwaW4gaXRzIHBhcmVudCBodWIsIGFuZCBkZXYgZHJvcHMN
Cml0cyByZWZlcmVuY2UgdG8gdGhlIHBhcmVudCBpbiBkZXZpY2VfZGVsKCkuIHYyIGhhcyB0aGUg
c2FtZSBwcm9ibGVtLg0KDQpNYXJpbw0K
