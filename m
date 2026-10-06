Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156934503E1
	for <driver-core@lists.linux.dev>; Tue,  6 Oct 2026 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300592; cv=fail; b=iJZAIlgaRKB37f1G3s50urszWIKorr3WRq9+AqbgrnpTMAC6RAH+tVmh44oZLNZu7Q9+5DoghJQhxPqNAovRnygaEdUAsBMR4tgLGHvH7kfqwut6+pfN/xO1s/qlt0pJfUSdjBSCNmUL+j0KLMQXnxpNHcioXUNjUBHlDdLH60U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300592; c=relaxed/simple;
	bh=CD9H0f9IxTBHYq/vpfk+5+YX5I9vx4vJeV9Es6ncNUU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jAuihQ8WhNFEXHMwBMPzuhJb55pOakrEV/Mva6kL3+Gk4VjZ2+VaiJxT9PQWHOAlkAw5HLFHsO4JNjSX3qyzXzc/LyDEp2oAWsAbq0u8Kn6TKaO5ytXmf0O2Zx1LX0AefeFcK64kyqIOn8A20fg5TLFHSQH6Y/jdtrFPYmDgxlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=PJMbFEQI; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="PJMbFEQI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+PGYh7WP91jipjL/RxmPR4OEeCt4y1mTyyRQnkc7b/xZyH7ue7slbIul/euJY7rxB+WcfXV0Dbbzhap6FjEincQ+dqYkPNDumKttYHn+p2Omewdkv/GHOdf/MDhESahmPotmQLCrlqv9rJzQsYrwaQH/GitujI8jmhVJTxIURUsvsmFLwqT2DZfL3JErV4IwRrg2b8tVx6BpkMEoztkUjUcJxlJprc8HLgMNb5glp2B59iGpdE42SMV4lmF6qfnQeeSNi+Q1FGm21pi+kPwZzpSpVVUEpoQg0iI/ikGAmg97USiuoJkaVWhB87YgzTN3uQxUWz0pVFQdG1ASEzFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CD9H0f9IxTBHYq/vpfk+5+YX5I9vx4vJeV9Es6ncNUU=;
 b=Bz6mhGyq3aRGAUVUzMkFVkO5aAJgD9kzz1E/UizZI6NQ6+X3PvY44CnqDTXaPV8avV8lhmT6NbRHV8aVzEoSfGLJMXpIMVBhFsa6DqlSZw+3uEcf+bVPa4dXjOAqFzqSooF3IAWgLLc5t+jRn9A92G8b4SS4Zct7QnocGtOL0QLf/ssPkUs88E7ENfSUcyBZ4Ifc461NX4YKuDMQQS37n72CcQFFMz0SpbmYv0K9BCmCFHqZHKLVcq+HfuWT7hcV9MAiuVPeF3XPATPsCSYvqJcIZi7AQtLnqW81ehVJNW//Im9ouRYApgkxSuboQ80bGgsV9jBPUIf2YXqCceG8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CD9H0f9IxTBHYq/vpfk+5+YX5I9vx4vJeV9Es6ncNUU=;
 b=PJMbFEQISdpUy1aKbT0KAkAx7sQ3WpCrwKZwVnQRuwOHq7lqY+FQsKuXstpsjApw4OJdpvZaqOXXNk5TtqEWScLObJkaH1/0pDvrf7rnVvVljGE3RQQJi6VQf0OAAQrekTsO3oFAj4P951VmGGUkxX44ClRjI4cUq+3O8m/iKZA=
Received: from AM8PR06MB7602.eurprd06.prod.outlook.com (2603:10a6:20b:363::19)
 by PAXPR06MB7869.eurprd06.prod.outlook.com (2603:10a6:102:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 15:29:48 +0000
Received: from AM8PR06MB7602.eurprd06.prod.outlook.com
 ([fe80::a651:a30d:d0eb:cd2e]) by AM8PR06MB7602.eurprd06.prod.outlook.com
 ([fe80::a651:a30d:d0eb:cd2e%6]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 15:29:48 +0000
From: PETER Mario <mario.peter@leica-geosystems.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
	<dakr@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alan Stern
	<stern@rowland.harvard.edu>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] driver core: Take parent lock in async device attach
Thread-Topic: [PATCH v1] driver core: Take parent lock in async device attach
Thread-Index: AQHdVZYN5T6CSU35wUKBI6wa1yownLbwlYUAgAAOWgA=
Date: Tue, 6 Oct 2026 15:29:48 +0000
Message-ID: <eb845da3-5799-4b0b-87d8-266ff57e84f3@leica-geosystems.com>
References: <20261006132335.4014316-1-mario.peter@leica-geosystems.com>
 <2026100658-stoic-unread-22c6@gregkh>
In-Reply-To: <2026100658-stoic-unread-22c6@gregkh>
Accept-Language: en-AT, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7602:EE_|PAXPR06MB7869:EE_
x-ms-office365-filtering-correlation-id: 047836f7-29d6-4151-cec0-08df23bea839
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38070700021|4143699003|6133799003;
x-microsoft-antispam-message-info:
 ZnOMm6VzhZI0AfeMj23KjB1th86s1+HsrD9uzD3Twq5EosQLoxzz/A4ax4enntURsiaTUV9Yx9Zt/6MYd1vd5qN7Rclk25wo5LJMbAXubCGornnmyHNUfyGF1c2ZFghIUQ3wNVFr/WO2f1VZExneANdajh0n8bTFerEvqUy2gGgs4o/4ocY76POP8atCszRK45M09hYTkednUD8dG4hGnmFirYO681poC/6u6YNKJuPTiJhEdyeUluhsM+cPM8yRcteAoMrZlcttfkUClb/nN8sXEnYqNERwp6wmQK+Pq/X04xtcT76a5dli7TPBEwpBnPe6q3GlNPjw/ab6y8JZ+drOjFtcZtfyybBa0qkEVuz5JQRVt7WVzOV19ia/XxtmBO2s3W7jeRDpRLlq71Gw90nUnSJ0It0YqRXAFFXqwX8cFGe88AoANxUU4N0IIqx4d9q0ExquQHEbq9/IhuLkViG7sgFUoU4618bc/foJN0KFCQ+Z12EtriXcmYQlycvbtLQMtfBkC8b1Luu3rDIAxXQ7f0rUGCO0XJ0uRB7YFs/l9eRrthpPVjapk6zNFxnWz5/8bgRe6mrIGrbOJxlHupJzA8AgsEN74TQWU6IQCCrNjEMDiGAdf3Kkn3oSvpxpafFeMLFAC8xvuG0QRGcZHPDjFKHTauukSdcrFGlIgsL6nLrjOL3lvKV96M+2rXWCf6rrorgynRMspxVxDVjKWdFpNWdFZF1rUNNwja/PkhI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7602.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38070700021)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2xTYXZMRWtZOTdHRHROMlp3M3pUMlBJUWJtN0o0MVViOFVOSHprWXVNNXZ2?=
 =?utf-8?B?T0NCUTVlVFV2WmpmMEJROTdCQk83V3ltYStlL1VtUzExbUlMMDIyZStTemZ1?=
 =?utf-8?B?blllVUMyVUk0ZkQ4a2FuYnUzckpDSlg4ejlmMGFHU21oNVhaTHNEaXZBVlQ4?=
 =?utf-8?B?NlorVmJQU0R5dTRMTWJMelVjU0FHTldDV0hnUUcvb1NHOUJ6SVBUTW51R1Iw?=
 =?utf-8?B?ekZWQ0VVWngwblRyaDNFdUhUYnRDVWZQWXVTcGY0ODFHMHBFMERLaHRlTURC?=
 =?utf-8?B?MWJPWFZmUFlKQjdnTHY1UGVQRXNzTUY4MERYU3ZPdFdERDVsZUo1OVgrczdT?=
 =?utf-8?B?Vzh4VmsyajN1LzFqMzY4WG5LWHArb2VhaXV6c0tnbzVTOWhGYTU5cVk3U2do?=
 =?utf-8?B?RlNQd2MvRnB5Vlg2K0xKYy9aeUZBL3hDQzhKVXhSTjhybUczUXdmOVAwVFFH?=
 =?utf-8?B?cGRGWGNZeHlGY0Z6ejRUWDJHWEpVYlgrYnM1RUFIdXIwNjJYNVVhSkxLbWtS?=
 =?utf-8?B?ZnhYcGZ4K3VUY1E1YUlhZ3RISzdkdlg0U2N1ZWdCQVVVdkhVVGxrbmNBNGh1?=
 =?utf-8?B?RGdBcllGVlp2SitWTm9IcVFFSHVXdWxPVVZybU9aQm9DMUxRMjE3aWhxYm9R?=
 =?utf-8?B?WkNjckhCOG5hdHBrOFNYKyszL3NOZWVoL00xNHBXQm1MZlZ3TWlvZjNFRXRW?=
 =?utf-8?B?Ymg4aGMrRmRYWlczbGxnMXkzWmo1NVhnL1FJS3hKUXllYVlHVDZkdkhIbi9L?=
 =?utf-8?B?Y0ZGaGdQWkloSS9YS2VXakZIWHhDNEpBVnhCWmpHWHpnMEZ2UThSbGdhRXhr?=
 =?utf-8?B?d1Q0b3lYemhNRDhWTDFyOWZ0SlB5a0FyRUtRanN1R2FDWHAxMDFiUzNDQVFt?=
 =?utf-8?B?aGV0eHFSOVp5eXZBYU01cUFSa056NmNDKzlTRHJmWVFraWdMSjNZb043R0kr?=
 =?utf-8?B?aVhFdXFhdUVWTC9hNVpJMUNYakI1bktqK0g0NHVjdzZSWFBTSnZwZ1kzTHZP?=
 =?utf-8?B?TFF6V3RNMmpSWm5qWVFTZlNvRnZYdmVMV3cyUFp4SW9kdlFRZlY2Uy9DM21C?=
 =?utf-8?B?SUMxWGRiR2JldjB6clBtR1dackhzWUFYWElvMVV6UGdPcVZpL0pPUFZ4K0RV?=
 =?utf-8?B?RkdlQzdKdUx0NGx2aDRGUm5FelA3UHJkcmdNaXJxZVlGb0hqRXZzV0JhaitC?=
 =?utf-8?B?MHVMS0VSc1VEWCtNUnhUdGM0NzJNd1gyeFVyZUlVeUZtLytKMVdyaVYveUY2?=
 =?utf-8?B?WUt1VFhGRGYyZ2R6d3QzclZBRGk3cGt1a1FWRlF1RXU1c2Y5YWF6b0ltYTF1?=
 =?utf-8?B?MmordytHMTAxOFE4cCtWOG1WbFhuLzhuWmkxZ2Mwa0ZoVlhHTWZFTXRJTzNx?=
 =?utf-8?B?aVhTWnkwWFluM0NERXM1c1dwdVptTzVzcnpPUEFRV2MvSjhONkxLaHc1UG5R?=
 =?utf-8?B?MGo0KzMxa1FSS2M4akxsY2J1SmNxaEpnM2hNZnBNNUM5TlBnQlNuUDNYM0V0?=
 =?utf-8?B?QzdNTitlbjNMQ2JYdlR1VlN0Q1BCZ094MmpDOUtDTkFKUHZFeDZsYVZIWmlj?=
 =?utf-8?B?TjVseWdhaWloK1RpdG94L2FoQjA3aXdaWWNLb042WW9EdUdrYWVMNDNjaVF0?=
 =?utf-8?B?Ti9aVWNOcWlzUkRsOEptTEszeTBtd3RGNjBjYjdIRC80OEJzTU91R3RWcHhj?=
 =?utf-8?B?RmQ0SkFjL0UzcktWTngwUjc3RG1laFpZK2Rkby92SDQ1WjBldU8rRklMQjZL?=
 =?utf-8?B?cjRPRTJpZWdrTFZzNVNaUWpoeTFsM2xtamplb283QUUxTjlBWnpVdC9LSDFH?=
 =?utf-8?B?dnU3NU84WlY4QndobTExNVcvZTh3NXpiY0ZYcnJrRHVkd3h3WkMxMGR6WVhp?=
 =?utf-8?B?L01ZT2dReTlRV3U0bUlCUi83cmU0ZzUzdEIxRFNMMWxpTERwdldjbnlzRlRs?=
 =?utf-8?B?V1YrUnRyK3hKQUFvQWFPYy80YVYvQzVkcFJ5MlowdDljSmtyWlB3Z09uNk5n?=
 =?utf-8?B?STlYeEZlOE1XUVEweVdUWnV4RGUyK3FYbXlSZmhocmQyNlpEeXpwY3FZQ3pu?=
 =?utf-8?B?U2p4djJYSmk2RytTaGJTZGU5UUhaTVJsNnFPYVRYdWRTTzB6QkRkcVVmRHpu?=
 =?utf-8?B?Q1hFU3FHTFdKekxQSStjL3luQXVwdDU5b1RwOWk1VFVGOXhtcmNDaUp3Umt4?=
 =?utf-8?B?dFlxeGdkZmRtUlRXZjJzMGpvS3ozV1NtekdJYnJNay9vRjdFS2hvT1RzNjd4?=
 =?utf-8?B?aE1JVzJ0Y2pDKzJvMlluZkRNWE8vQXVFbTFoNGhoMW84cE9hVWtMelpITnVO?=
 =?utf-8?B?YmF3V09uRFFnZytKOXlJWUUwREZmZjhyTmJyRGdoQWZhVUV1dlJDU21EdXM1?=
 =?utf-8?Q?V1lGG0+6izG/EP3s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <508AA963814F2A49A2FAAA0BF2FA8191@eurprd06.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 047836f7-29d6-4151-cec0-08df23bea839
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 15:29:48.2858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cpNWq4mnbar1coDAdzu2eyjwMDzORf05Jp620PKfvMVkDt34r1NvStZNZFLh6tpyRZEIbDG2f1hONGNKo7mE0fcnZi9txIOURqoGhGZubTT7ZVF8fnCwFg7Id6WRL5fN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7869

SGkgR3JlZywNCg0KT24gMTAvNi8yNiAxNjozOCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0K
DQo+IE9uIFR1ZSwgT2N0IDA2LCAyMDI2IGF0IDAxOjIzOjM1UE0gKzAwMDAsIE1hcmlvIFBldGVy
IHdyb3RlOg0KPj4gT24gYnVzZXMgd2l0aCBuZWVkX3BhcmVudF9sb2NrIHNldCAob25seSBVU0Ip
LCBwcm9iZSgpIG11c3QgcnVuIHdpdGggdGhlDQo+PiBwYXJlbnQgZGV2aWNlIGxvY2tlZC4gQSBz
eW5jaHJvbm91cyBhdHRhY2ggYWZ0ZXIgZGV2aWNlX2FkZCgpIGdldHMgdGhpcw0KPj4gZnJvbSB0
aGUgY2FsbGVyLCBlLmcuIHVzYl9zZXRfY29uZmlndXJhdGlvbigpIGhvbGRzIHRoZSB1ZGV2IGxv
Y2sgd2hpbGUNCj4+IGFkZGluZyBpbnRlcmZhY2VzLiBfX2RldmljZV9hdHRhY2hfYXN5bmNfaGVs
cGVyKCkgcnVucyB0aGUgcHJvYmUgZnJvbSBhbg0KPj4gYXN5bmMgd29ya2VyIGluc3RlYWQsIHdo
ZXJlIHRoYXQgbG9jayBpc24ndCBoZWxkLCBhbmQgb25seSB0YWtlcw0KPj4gZGV2aWNlX2xvY2so
ZGV2KS4NCj4+DQo+PiBXaXRoIGFzeW5jIHByb2JpbmcgZW5hYmxlZCBmb3IgVVNCIGRyaXZlcnMg
KGRyaXZlcl9hc3luY19wcm9iZT0qLA0KPj4gbW9kdWxlLmFzeW5jX3Byb2JlPTEpLCBodWJfcHJv
YmUoKSBvZiBhIG11bHRpLVRUIGh1YiB0aGVuIHJhY2VzIHdpdGgNCj4+IHVzYl9zZXRfY29uZmln
dXJhdGlvbigpIGFuZCBib3RoIGNyZWF0ZSB0aGUgaW50ZXJmYWNlJ3MgZW5kcG9pbnQNCj4+IGRl
dmljZXMuIE9uIGFuIGkuTVg4TU0gYm9hcmQgdGhpcyBoaXQgMTEgb2YgMTAwIGJvb3RzOg0KPj4N
Cj4+ICAgc3lzZnM6IGNhbm5vdCBjcmVhdGUgZHVwbGljYXRlIGZpbGVuYW1lICcuLi4vMS0xLzEt
MToxLjAvZXBfODEnDQo+PiAgIENhbGwgdHJhY2U6DQo+PiAgICBzeXNmc193YXJuX2R1cA0KPj4g
ICAgdXNiX2NyZWF0ZV9lcF9kZXZzDQo+PiAgICBjcmVhdGVfaW50Zl9lcF9kZXZzDQo+PiAgICB1
c2Jfc2V0X2ludGVyZmFjZQ0KPj4gICAgaHViX3Byb2JlDQo+PiAgICB1c2JfcHJvYmVfaW50ZXJm
YWNlDQo+PiAgICByZWFsbHlfcHJvYmUNCj4+ICAgIF9fZGV2aWNlX2F0dGFjaF9hc3luY19oZWxw
ZXINCj4+ICAgIGFzeW5jX3J1bl9lbnRyeV9mbg0KPj4NCj4+IFRha2UgdGhlIHBhcmVudCBsb2Nr
IHRoZXJlIGFzIHdlbGwsIGxpa2UgX19kcml2ZXJfYXR0YWNoX2FzeW5jX2hlbHBlcigpDQo+PiBk
b2VzLCBhbmQgbW92ZSBfX2RldmljZV9kcml2ZXJfbG9jay91bmxvY2soKSB1cCBmb3IgdGhhdC4g
V2l0aCB0aGlzIHRoZQ0KPj4gd2FybmluZyB3YXMgZ29uZSBpbiAzMDAgYm9vdHMuDQo+Pg0KPj4g
Rml4ZXM6IDc2NTIzMGI1ZjA4NCAoImRyaXZlci1jb3JlOiBhZGQgYXN5bmNocm9ub3VzIHByb2Jp
bmcgc3VwcG9ydCBmb3IgZHJpdmVycyIpDQo+PiBBc3Npc3RlZC1ieTogTExNDQo+PiBTaWduZWQt
b2ZmLWJ5OiBNYXJpbyBQZXRlciA8bWFyaW8ucGV0ZXJAbGVpY2EtZ2Vvc3lzdGVtcy5jb20+DQo+
PiAtLS0NCj4+IFNlZW4gYW5kIHRlc3RlZCBvbiA2LjE2LnksIHdoaWNoIGhhcyB0aGUgc2FtZSBj
b2RlIGhlcmUuIE9uIG1haW5saW5lDQo+PiBvbmx5IGJ1aWxkLXRlc3RlZC4NCj4gDQo+IFBsZWFz
ZSB2ZXJpZnkgdGhpcyBvbiB0aGUgbGF0ZXN0IHRyZWUsIDYuMTYueSBpcyBfVkVSWV8gb2xkIGFu
ZA0KPiBvYnNvbGV0ZSwgbG90cyBoYXMgY2hhbmdlZCBpbiB0aGUgeWVhciBpdCB3YXMgcmVsZWFz
ZWQuDQoNCk1vdmluZyB0aGlzIGJvYXJkIHRvIHRoZSBsYXRlc3Qga2VybmVsIGZvciBhIHRlc3Qg
aXNuJ3QgdGhhdCBlYXN5LCBhcw0KaXRzIGJvYXJkIHN1cHBvcnQgaXNuJ3QgdXBzdHJlYW0uIEJ1
dCB0aGUgYWZmZWN0ZWQgY29kZSBpcyBzdGlsbCB0aGUNCnNhbWUgaW4gdjcuMy1yYzYuIEluIGRk
LmMsIF9fZGV2aWNlX2F0dGFjaF9hc3luY19oZWxwZXIoKSwNCl9fZGV2aWNlX2F0dGFjaCgpIGFu
ZCBfX2RyaXZlcl9hdHRhY2hfYXN5bmNfaGVscGVyKCkgYXJlIHVuY2hhbmdlZA0Kc2luY2UgdjYu
MTYuIE9uIHRoZSBVU0Igc2lkZSwgdXNiX3NldF9pbnRlcmZhY2UoKSBhbmQNCmNyZWF0ZV9pbnRm
X2VwX2RldnMoKSBhcmUgdW5jaGFuZ2VkLCBhbmQgdXNiX3NldF9jb25maWd1cmF0aW9uKCkgYW5k
DQpodWJfY29uZmlndXJlKCkgb25seSBnb3QgdGhlIGttYWxsb2Nfb2JqKCkgY29udmVyc2lvbnMu
DQoNCj4+IE5vdCBjb3ZlcmVkOiBkZWZlcnJlZF9wcm9iZV93b3JrX2Z1bmMoKSBhbHNvIHJlLXBy
b2JlcyB2aWENCj4+IF9fZGV2aWNlX2F0dGFjaCgpIHdpdGhvdXQgdGhlIHBhcmVudCBsb2NrLg0K
Pj4NCj4+IEFuYWx5c2lzIGFuZCBwYXRjaCBkb25lIHdpdGggdGhlIGhlbHAgb2YgQ2xhdWRlIENv
ZGUuDQo+IA0KPiBUaGlzIGZlZWxzIHJlYWxseSB3cm9uZywgd2hhdCBidXMgaXMgdGhlIGhvc3Qg
Y29udHJvbGxlciBvbiBmb3IgdGhlc2U/DQoNClRoZSBwbGF0Zm9ybSBidXMsIGl0J3MgdGhlIENo
aXBJZGVhIGNvbnRyb2xsZXIgb2YgdGhlIGkuTVg4TU06DQogICAvc3lzL2RldmljZXMvcGxhdGZv
cm0vc29jQDAvMzJjMDAwMDAuYnVzLzMyZTUwMDAwLnVzYi9jaV9oZHJjLjEvdXNiMS8xLTEvMS0x
OjEuMA0KDQoxLTEgaXMgYW4gb25ib2FyZCBVU0IyNTE0IGh1YiAobXVsdGktVFQpLiBUaGUgaG9z
dCBjb250cm9sbGVyIGlzbid0DQpwYXJ0IG9mIHRoZSByYWNlLCBib3RoIHNpZGVzIGFyZSBpbiB0
aGUgVVNCIGNvcmUsIGZvciB0aGF0IG9uZSBodWI6DQogIA0KLSB1c2JfZ2VuZXJpY19kcml2ZXJf
cHJvYmUoKSBvZiAxLTEgY2FsbHMgdXNiX3NldF9jb25maWd1cmF0aW9uKCksDQogIHdoaWNoIGhv
bGRzIHRoZSAxLTEgbG9jaywgZG9lcyBkZXZpY2VfYWRkKCkgZm9yIDEtMToxLjAgYW5kIHRoZW4N
CiAgY3JlYXRlX2ludGZfZXBfZGV2cygpIGZvciBpdC4NCiAgICAgDQotIGRldmljZV9hZGQoKSBv
bmx5IHF1ZXVlcyB0aGUgcHJvYmUgb2YgMS0xOjEuMC4gVGhlIGFzeW5jIHdvcmtlciBydW5zDQog
IGh1Yl9wcm9iZSgpIC0+IHVzYl9zZXRfaW50ZXJmYWNlKGhkZXYsIDAsIDEpIC0+IGNyZWF0ZV9p
bnRmX2VwX2RldnMoKQ0KICB3aXRoIG9ubHkgdGhlIDEtMToxLjAgbG9jayBoZWxkLg0KICAgICAN
CmNyZWF0ZV9pbnRmX2VwX2RldnMoKSBjaGVja3MgYW5kIHNldHMgaW50Zi0+ZXBfZGV2c19jcmVh
dGVkIHdpdGhvdXQgYQ0KbG9jayBvZiBpdHMgb3duLCBzbyBib3RoIGNyZWF0ZSBlcF84MS4gV2l0
aCBhIHN5bmNocm9ub3VzIHByb2JlLA0KaHViX3Byb2JlKCkgcnVucyBpbnNpZGUgZGV2aWNlX2Fk
ZCgpIHdpdGggdGhlIDEtMSBsb2NrIGhlbGQsIGFuZCB0aGlzDQpjYW4ndCBoYXBwZW4uDQoNClRo
ZSBVU0IgY29yZSByZWxpZXMgb24gdGhhdCBsb2NrLiBuZWVkX3BhcmVudF9sb2NrIGlzIGRvY3Vt
ZW50ZWQgYXMNCiJXaGVuIHByb2Jpbmcgb3IgcmVtb3ZpbmcgYSBkZXZpY2Ugb24gdGhpcyBidXMs
IHRoZSBkZXZpY2UgY29yZSBzaG91bGQNCmxvY2sgdGhlIGRldmljZSdzIHBhcmVudCIsIGFuZCB1
c2JfZHJpdmVyX2NsYWltX2ludGVyZmFjZSgpIHNheXMNCiJDYWxsZXJzIG11c3Qgb3duIHRoZSBk
ZXZpY2UgbG9jaywgc28gZHJpdmVyIHByb2JlKCkgZW50cmllcyBkb24ndCBuZWVkDQpleHRyYSBs
b2NraW5nIi4gX19kcml2ZXJfYXR0YWNoX2FzeW5jX2hlbHBlcigpIHRha2VzIHRoZSBwYXJlbnQg
bG9jaywNCl9fZGV2aWNlX2F0dGFjaF9hc3luY19oZWxwZXIoKSBkb2Vzbid0Lg0KICANClRoYW5r
cywNCk1hcmlvDQoNCg0KPiANCj4gdGhhbmtzLA0KPiANCj4gZ3JlZyBrLWgNCg0K
