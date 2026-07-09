Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24E3B19AC;
	Thu,  9 Jul 2026 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783632600; cv=fail; b=eH7yFJHHwsqjT4rY625iPr3Ev8CJp6P/szw5T3sZc56VE938mVGMxgM4tdCCf5pJ3Lf6ZEpNDmqKskLSOWQ3926RL+zZT3bdlMMQ7eKbm6a69AoKUn/ePI2tdwsJwY2UwqkhrbbwY2L3kFKF7dJF8vcFfbsyuRH/sCXE2CYI+aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783632600; c=relaxed/simple;
	bh=69vVfkTLMjMi7lWToc+xHxMgg7zmGJpAr6VZd+UZJe0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NEbffgLMfvggFbl+hi77R0qnurBCiskELeBUZG7skP9TJN8xaTaIjFJlzSgU+lIcT1nX2YmocMDNF4cCPXT5TwtfRTVqEau21ya8WpHgAae6vzTY5nqRjbNtMIMNhYnO+PuW8AzT6pIa8BTvUWikBbCykCmQ3mM3Oa9pTg5Wiio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=boqltu3Q; arc=fail smtp.client-ip=52.101.62.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="boqltu3Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CY4fqSd0JIrAgFOZroJrG+K49ktMpzp/BulLSX4pOAiyCnFC21cBPFMQf/15BKNZ/gk02QXKoVNZIVERhCFE2vTBo7/ltHD9XdY9Qx36eSGnW6c9EKtXOyBBd1609xCNLv4IpXQI8QL9rP+ksTU+cJou4o6XgiCPpOr2qhvwTTmIpoSsHs3pAeksUv60pBMYklIbMutQNhICjf2DY7lsk3sYhXbvxtjkX7fExVHMBfxTu9Tyswv1pvP0AM5f/0lwVCR0kWXQq1jI5olOcyZvkdYZtkY/bKLqc50c6vKZftcCjAKzqcLvvKTb1OamaOaSyqaHuItnIw4FiiiLJz5dwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69vVfkTLMjMi7lWToc+xHxMgg7zmGJpAr6VZd+UZJe0=;
 b=ObAlQZCyyA5pEawS/woAP8BcWLzimoA+r8oJAM8sC/mIRKCJ3wuvaxhCvndeT6HCiTpWXQASv/Nvid4qdgZ8OJ5mnjdeoccfmHpgbcTF6t9O5U1P7HrzQL05DFZaq/rc1KSthfiyQM6UNrQtOfddzDAJlmw84IaBkrELPkyVP6MKKKGfHfmYpFZKBVxehqXBl/QSwaE2covqFwfKw5HPGtOUNpxVeEtP1ZbjxrK5+tJ4kWqdWyL7JGDgqeQlq8eEfC2VQId0DFI1I6+/2HT39Fq3L8Gshm1zzR8K4zJipsZ4TbtPn6yqWUJILl28U3F71zFG8/DDdQBzAujRE3tjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69vVfkTLMjMi7lWToc+xHxMgg7zmGJpAr6VZd+UZJe0=;
 b=boqltu3QDZ4zbift539yZei3gndclirz4Dh/qWV4uMNWVdBV3ITgVa0AL0cR0YK6PdNReE3pObuJPIJvBd9l1k5v66/YNet2oN59yaI7uPgxwpauc8tdrgROTMUjlZ84NHx1jtdBAL530FsvWp9BvydydfhD7K0EZLmSxYwv/DF+Pu3dpZbfoUpN+ljNIw9ivutYo8/XnM3Dp3D7zOWel2TGAucUP+vxgwz55JPaaideNTSvHHnm7aKPqjLuTbkum/08ujEnG4ikfT4YVM+6bHRS08kqNElrl54HuRBMCtJk1mHVW+YTQGJiRriZq1xvnApifNILYcINbGFl8abl6A==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH8PR12MB6721.namprd12.prod.outlook.com (2603:10b6:510:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 21:29:55 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 21:29:55 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	Eliot Courtney <ecourtney@nvidia.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Zhi Wang <zhiw@nvidia.com>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "russ.weight@linux.dev"
	<russ.weight@linux.dev>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware files
Thread-Topic: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware files
Thread-Index:
 AQHdCljkmvPX9pvAWkafavGTqyac37Zaof8AgAVrWwCAAVZ2gIAAJikAgAK4/gCAAFKLAIABKfYA
Date: Thu, 9 Jul 2026 21:29:54 +0000
Message-ID: <cac0e3f6cb3f46d0f2387aa5b36995addcca7ec2.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
	 <20260702192712.3450652-3-ttabi@nvidia.com>
	 <3e771bfc6b0c89afc7969755e340a5fa863bc7cc.camel@nvidia.com>
	 <DJR9ZP56YXX9.P8U6V298X5RW@nvidia.com>
	 <09d1fd87272e7c7dee79d1e0841f49de76ccd82b.camel@nvidia.com>
	 <DJS2YR1BBMPC.2X5MMLHOM0LL7@nvidia.com>
	 <e913d3a53361cd6b8b076f43d038cfd029cda473.camel@nvidia.com>
	 <DJTQAZCXYPN7.3Q0B4NH8EA8BO@nvidia.com>
In-Reply-To: <DJTQAZCXYPN7.3Q0B4NH8EA8BO@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH8PR12MB6721:EE_
x-ms-office365-filtering-correlation-id: 30b17374-721c-451b-20c6-08dede013810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|3023799007|38070700021|18002099003|22082099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info:
 vwtBOQBstVGVn2IICpLZZp5q1gIcDilnyX1Y+6U7C2AjKTdy2dluwV74sEE/lPAXT3z9alePwOBCqliyRDzJLBdIUCrmQ1DSkHeDhOWbtYW2Tn8734kaFrhqkc+QD3I/zL4egRv6cPuLJi2GJTKjKn+ayqV539BBpRjgOZ4ANp2wKt61kHIZGuGA3mZR+J2gqJf0h1vtJdhMrTXBoG4ifd3do9cnscNwbYoudorjcXU52kOWsVclvRAXe+/JMN/7BLw9sP9lkjuoVOv+31Qz6IC7Dq/EBSQxV9G5krlegAQ+/xJwyYDdYsPJsDFQfM9D9Dw7a9+4p0wc+7Mq6B42jdq++s6o+9Eq2Ml0vUK5J/E7OcFxF7sR5wWbh7sgLgA89nQ5GM5+ZXY/1o+kcXo5i5sKlRvYUmu4MHd2omyDfdmaVisELw7IhISvizurEXHf1RYczYSxflLDcm1mN0WbWo5tVU4qPXeEVrmEf/I6kH1esk7R37d5Qd1Hev+Nc21rdzY2g9o6rZEl9vhfUwb4leFWvZlos/mT0wnwRrlYTKor6+DwDcsPLlus5Grj9EZWuJf9Eyg21d63iteEsk9B6icj2XEYCPSmkEQmrJeb3GDpO217/E0N6NgVI5oouOsCwktwetgDcRa598eXcdz6OYAyZ2iqyT47o47s6gRWC0i0CuWh/2IG+DIWBsxo3AWLxTQYC9IavXPJPCVfjUgVaNyTPYcth7WKMCeKZ7vRmmE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(3023799007)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bEtqeXBDMUhBVnJmRVpCQzZiZE9kMXFlMVFuQkw1VzN6aUVrMGNQL21WVlB2?=
 =?utf-8?B?K0d3RWZsdE9aTXhMUGlKbjE5bnFjRzJWY0FFMEp3b2MwTGVidFplOGxBOSs5?=
 =?utf-8?B?b2ZjNllNNU1QN1p1RUJYdUdZMVpJYjNlNDlOc3hucUUwemhtSkl5bzZhSFZJ?=
 =?utf-8?B?VVdJY3BUdjk5eXJtMmVzWUQzeEpqbUFlL2F6aURBMnZoeEZJOTRsQXU1TU4v?=
 =?utf-8?B?N04ydjJQNWx4cWRRNmlSQVVMRUJvS20zSmhlL3YvQTg0aXpwbzFycXp5TG1i?=
 =?utf-8?B?WFJoZGs2S1k3UGRKdm9OOW5scDBvZW5hU3ZOOVU3S0xzbGl0NXY5WTV6czRG?=
 =?utf-8?B?aGpHdnRzUVp4RFgzaWE1YUdFblN3ekNKRFpnRzNCaVc3MllRZlZEZXBrUTQz?=
 =?utf-8?B?djZIQ25HVkhRRnpHdmo4UElIaXU1VXFwSFVtSWZTd3V5SlRzdUVBR1VRczNu?=
 =?utf-8?B?U2docEFvRFJINUZPc09BbVQ5cEp4UDFWd3BHRko0UEY1MjRsRjAxZW9HbCth?=
 =?utf-8?B?ZGwrMG9hVSt6bnRZS2xndnhnWk1UdUg0VjJESUc5OEo3YU5FNWdtM1prQ1Ur?=
 =?utf-8?B?U1luLzNlMGg1Sk5jcEdZREdpTkRRblA3SEY4dmE1OThxc0tIOHppUVZOK2Yy?=
 =?utf-8?B?ek9Nc2dFVnVIdjhqWUU1bGp0TzBHUXRzOGludDFwby9YMHlhYUF2UG1oNGRn?=
 =?utf-8?B?eEk5dkpFbFBlNHppVGtRQ2tvSUZJWlhDK3VrdndMbmd4eGxHLzBjVSt0Vjlk?=
 =?utf-8?B?VHc1ZHFMcmp3S2swOEdrNGJ3R3B2eENybVE3VWVqT2hsZnA3c0xqWDhVVTJ1?=
 =?utf-8?B?bU4vMVZ4Z3oyTXZneFdaNW9LQ1QveUtWMkliWVVjOXFDOGh5bHlRT2NHWGhX?=
 =?utf-8?B?U0tyUFBGSVVSekpqRkJvZ2JqbEZkWW00UEQvbGhtMmxDS2ppaUFzdHFUSlZo?=
 =?utf-8?B?Z1JweHRiVWk3bHZDTCtMbW0yR2NwWkYzVnZ3RER6MTdNdWxkQ2dvSS9peFVi?=
 =?utf-8?B?SUJpUnM3TnNOTWdTV1dDYlA4NTJtUlJNS2N6eXh1UzhQWXdJYkRhYy9mQjFv?=
 =?utf-8?B?OUFSQXFTcG5HcTFqSnY4QW1WU3VNSllvSzVPMTkweFdSVklRb2NtbzN0NDBE?=
 =?utf-8?B?TE9hTjVZR2hQYUoyVDBMUmIzdVY0ZEFQLzhBR0MwTjZzU3U3cEt2d3dITzlI?=
 =?utf-8?B?cWhNN05rZVhWVitTNW5XbmptVVFLUnh4SmJLUFFLQTJWUHJQVVFQY3FabXVw?=
 =?utf-8?B?OFNMUHcrbU5ZS08wTWZIaEMxU0tiN1dJTjNiS1Q3cWMvenNDbUpMdTFTSlpo?=
 =?utf-8?B?dEV4QXdvZUJtRzBsUFBwTGdGdTFIMWlTYUJjcldoMHpHZFAyU0I1YzllcUNv?=
 =?utf-8?B?OXp1TUhVMVAwSWJMREJlYnpNSjN4MDlDdG04bTZMeGx0S1gyVjE4bE5YVGti?=
 =?utf-8?B?RUhuQ1pUdVNRaGY2R3kwemthR2FlN3RkTk9BOXdBYmxHQ3VNUDJxTURDeWxn?=
 =?utf-8?B?c0VtVTByN0h5bmQ3THBzYmg4c1dLKzE0eWNjM3kydjJFVGQwYTlrTzZQM2p0?=
 =?utf-8?B?blhXeFlvZFZpbHZHcXI1U1pzcEplVHdmWWhPT2hDYUJ0dkR1Mmk2d3dkRFRu?=
 =?utf-8?B?S2JaUjl0M2Y5TDJLZEllbWtZckovdy82WXFsclZhMmlSb3JDNXdCZ1NHNUFI?=
 =?utf-8?B?UXlLMDBnOFZQaytuNWZQWkMxaU55WjFTYmIxd2RXUUxUa1QrL1Q5d2o3V2ZK?=
 =?utf-8?B?YzJjc1djY3VwNUdXQ09saHJ6M2ZsOG00azM1cGt3VEJXMG51cElFVmJlV1RY?=
 =?utf-8?B?RW9GMzNvbnNOSzkxOUY3WTlYNXQ2Mk9VbHJXS3pnNEZybVN4Q3hBVlhaVG5a?=
 =?utf-8?B?Z0FGOEJtWjRTd2FnT0E1VXVyS1BWL2lmMkRPZktrR3RRSk9vdXZwckdxbzFy?=
 =?utf-8?B?ZlFVeUhFSkM1T0pXM2ozbHhDYWh0MEpDOWorUUM3MEtLQmFsSHRGMkN0NFA2?=
 =?utf-8?B?QUhiSnU4Vm9ZVUNzMmw3WGNHSGs2bVZQZ0Y1UU9jbXZkY1dHOFBVeU94NFEy?=
 =?utf-8?B?Rm12dXBIeWZqS0pkckM4UkdXczZNS0FPM1FQWkJabSsyMTZtei9FWSsrQklV?=
 =?utf-8?B?Qmk0VldrVDBTR1E2Unl1NXZnUUhkVTVmVFIyVzBCM1g4S1crQXppOXhKNitB?=
 =?utf-8?B?cEJmdGdzM2pVTXVoNVhIZnJybjQralJFNnlRcE9KWDNhMFlNU2M0ZkNLUkI5?=
 =?utf-8?B?WEFrdHZ5OXlET1pvUUxMdmJtVVNzTHRSdjExZWZlSWlFUVNQdDV2aldUVWVF?=
 =?utf-8?B?ZUszVWxtQ0hyci9IS3R1cVdWYWxsU0YrelpaeHMxTEYvL3c0b3Nubm5XRmJp?=
 =?utf-8?Q?vs/vAyfMkvEzu3//hjTkpJ74G8ZiEcnPZMK+kgSs7ZuE4?=
x-ms-exchange-antispam-messagedata-1: eOd2rG6Vzviwfg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <782138A2333E2945A23629CD6C32663C@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b17374-721c-451b-20c6-08dede013810
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 21:29:54.9557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 286KQFkIVN1IUbXoOeItuqzNxfTyCAxS7IbQzk39jrNU0vjI3oqVbcrv8kcHxngU2HupaICXzSk24IKP0HSBGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6721

T24gVGh1LCAyMDI2LTA3LTA5IGF0IDEyOjQzICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBzaWdfYnl0ZXMubGVuKCkgY2Fubm90IGJlIDAsIHNvIHdlIGtub3cgdGhhdCBzaWdf
c2l6ZSBjYW5ub3QgYmUgMCwgYW5kIHRoZXJlZm9yZQ0KPiA+IA0KPiA+IMKgwqDCoMKgwqDCoMKg
IHNpZ19ieXRlcy5jaHVua3NfZXhhY3Qoc2lnX3NpemUpLm50aChpbmRleCkub2tfb3IoRUlOVkFM
KQ0KPiA+IA0KPiA+IGNodW5rc19leGFjdCgpIGNhbm5vdCBmYWlsLg0KPiANCj4gQmFzaWNhbGx5
IHdlIHdhbnQgYSBndWFyYW50ZWUgdGhhdCBgc2lnX3NpemVgIGlzIG5vdCB6ZXJvLiBJJ2QgcHJl
ZmVyIGlmDQo+IHdlIGNvdWxkIGVuZm9yY2UgdGhhdCB1c2luZyB0aGUgdHlwZSBzeXN0ZW0gcmF0
aGVyIHRoYW4gcmVseWluZyBvbiBhDQo+IGd1YXJhbnRlZSB0aGF0IGBnZXRfYnl0ZXNgIGRvZXNu
J3QgcmV0dXJuIGFuIGVtcHR5IHNsaWNlLCBiZWNhdXNlIGV2ZW4NCj4gdGhhdCBndWFyYW50ZWUg
YWxvbmUgaXMgbm90IGVub3VnaCAtIHdlIGFsc28gbmVlZCBgbnVtX3NpZ3MgPiAwYCBhbmQNCj4g
YHNpZ19ieXRlcy5sZW4oKSAlIG51bV9zaWdzID09IDBgIGZvciB0aGF0Lg0KDQpJJ20gYWJvdXQg
dG8gcG9zdCBhIHY0IHRoYXQgaGFzIGEgImdldF9zaWduYXR1cmUoKSIgbWV0aG9kIHRoYXQgZW5j
YXBzdWxhdGVzIGFsbCB0aGlzDQpwcm9jZXNzaW5nLiAgSSB0aGluayBpdCBhZGRyZXNzZXMgbW9z
dCwgaWYgbm90IGFsbCwgb2YgdGhlc2UgaXNzdWVzLiAgSXQgZG9lcyBkZXBlbmQgb24NCmdldF9i
eXRlcygpIG5vdCByZXR1cm5pbmcgYW4gZW1wdHkgc2xpY2UsIHRob3VnaC4NCg0K
