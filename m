Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011038.outbound.protection.outlook.com [52.101.57.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395192BEC45;
	Wed,  8 Jul 2026 20:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541581; cv=fail; b=FLeq8SQjkoClRXnPXRwMpb7lwBKWg1j9G9qNjX3XcmQowgDvXvybCd57nBsb1ty0K0eTfz5YP1xw0+DhDFRGOXTkeEuCMiEmB0Dj1AoPVivPjGiNYO0vuQ1xmpo+fRC1uAkTdHHbGzm72wF420a27GSxcI0Q6SwhJmISp6pkn2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541581; c=relaxed/simple;
	bh=5Reg7heNe9Gr1DMKMr4PM3Srfy1Wa02Ea4MtBcA6bPM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Po+cqJ2qJxrHGHPKhnF9w5H0s37kN1lcLNgGHwusVCpKHHn2Km/efM/D+1KRGTH/bO2TgHjWNY0TjlW2jHzXlhabS9iUaqhm3HQD2cmSJuAeN0inUWfj12hTSWS4ooR4Ivqk5UeZihsFvKm67TGXUI7aM7gGDQivluvinaITldY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JygyShv8; arc=fail smtp.client-ip=52.101.57.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JygyShv8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfEsFAMcclKiYLY9RURD/BHOMX1uWaJ8mNfc56LLzB4Nya2ABAOhvNwC2ODi2E3Nweqvrcmaw04wGSQ4FObS8PJOVf99hWkWRIx9dJsMdKAS5wq8WqzzgNA9HApa+ta6hEmJrZ3Y1dXREnTB9is1Da5BXzRd6IPA64YfNOE90WJzPGgYBkbo7dQCqKXbMGBpgVRgWMm8ZUyddhK+Pr0fsq8eaKRilPM00wGqvaO0+t0i5i9U00+YXlK3769psTbMJOhIJ3/fe/7MgXui1jtjWPw712STXrAmdydBJj3vDHYfOm+LAM7jPBVv20//KDEkTQDL6uzXNzQkgqTtHGVWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Reg7heNe9Gr1DMKMr4PM3Srfy1Wa02Ea4MtBcA6bPM=;
 b=Nsorn0oP8vjTMSZqRYa1gnIsNRsFJvSw0oppPK9q3s9bILXQoGcX7NylZD4bYYaQyEFR1dwkQeWnaZe1WmW6ALy09exrKYNFlo/K7BuDpVDz8ZzjFwkC+o1UitBTuodGHSzM0JgfVBIr2nmw0OoQjB3OwN0VFh4C96cmeMJ8N5ffqQKmehq5GTQGxns4tUvH8msSqh8cfnunQxUg9nQWUX26G/i876u7FzFZePbchDGmuZfuUM0fxlwlBJU1QUx+UI7AvJFzVJIh1NpKZFti1lZfp9sbhdBxL2lB4beGXzwjzkaMQo3oEZM1geE4n0danMJ84kZGxsY/rJ2eUVepdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Reg7heNe9Gr1DMKMr4PM3Srfy1Wa02Ea4MtBcA6bPM=;
 b=JygyShv8EvLmBjDy4M+E6d/rjp+UpAT5b30XhiHbbn2L7uO18XE18vOAxs0yTMwFPAFaufNBwRMjx0vXNcNws5KLhp9JqpSXmIr/PTqEWkbm8SmmlMAKbT9ekNmleaork8E0lxwiGJ9m65vAedIGbhcYkBZuKC5fwpABoc3bJr4pz7eaRAnKhZYuRC5gdAnJALHn8zpoqMXYsMrWLykHhv4oy3/hxBA+TKJdbyFyH6Qis0NdHvVn83meAr1dXYPebegWkCx81ZC3QkUQjElDBAATJNYI0QRSqk1omOQJxv3AdeTbs0j+yu4WTcItB1a58Ogdo9W3ijQJNIyLROC9MQ==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 20:12:55 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 20:12:55 +0000
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
Subject: Re: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware files
Thread-Topic: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware files
Thread-Index: AQHdCljkmvPX9pvAWkafavGTqyac37ZgDW0AgAQKMYA=
Date: Wed, 8 Jul 2026 20:12:55 +0000
Message-ID: <ffddffcc750393ca5f719abe27f8a3d6eeb6bf31.camel@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
		 <20260702192712.3450652-3-ttabi@nvidia.com>
		 <DJR9ZWAN4OCT.3GRDS8LGOZ16Y@nvidia.com>
In-Reply-To: <DJR9ZWAN4OCT.3GRDS8LGOZ16Y@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|CYXPR12MB9426:EE_
x-ms-office365-filtering-correlation-id: a826029e-7cb1-4bbf-87b8-08dedd2d4bf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|4143699003|56012099006|3023799007|22082099003|18002099003|6133799003|38070700021;
x-microsoft-antispam-message-info:
 NlqiM0ZMuxKx6rQflCPyT+Tnca6vbhoBiYlULYjEM46OXMNdtgf8ltLeV3ev7mACMMwI162pQOVdpc3cTQNRVlSGDhuivsQD2GEkmaNvwivA4dJDdwaVwSA3qt0NRRyWoav/ZBllmwzJGJwJMA4aUG9HGJF48ipPD22HlWkJx4eHUYqEK5A2gD4UacZAaZHkJuk7uu1z1BmlN/geY3MDaMaXCMVA0dGa1t79+RNZMBGsNhkUOx8oUTy7bpP4HKSVWGXaAA+CNOPVrPMNXGVIv4U9q77cknrB1elbb3crzTAvXROpwzjy1ApWgAvnemSAN95UH0Lr3RdfSpNNQoW9vXdA422Hj3Izrpo3vnWITGJOZJQPBi6pZii+dDz+dX1t3vfx0s1lBVLwkmeInYPEfZ9krp3RzgsC/1Wg6o9hf5qL37/L0pCOy2QF9QUugO/OUEw7KTOgCImw+5J+SJoh0dTCDXSkNvaVndJRNdF/LyWyju7m5zAeDcyJeDqcgCNxjo4Zo+hPv380pzz4xYJ0ukxNsdj7XA096zLIzqoZKSxBxBeisE7g2HBmd0jFmR+NdEBiw9mqoBSFySfgqtWzEK1HgqppXsU/DQ3LWNO2uJMx+vB4plMDdEv+3uH4lZg9UmZGfjQzgZeXLyDj2R/xU4l//3upq6IChiHPexQyskFlBLvPDKEsKCCqOw3A0rARh2YGKIkQoFwIHvObqznfmqfsmwjOPRJMt+Np8svq4nM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(3023799007)(22082099003)(18002099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVY3TDZqWXN6ZGdkRlNkbzYyd3RzbFJBdkIyejk3OWJpRk9NUjM4NThqU2ZC?=
 =?utf-8?B?RlBMT2dTRklVZlZmclAvWVhPSVlyWnZyMVdCeHdJMTVKUDlvU3FHQWlhSVVl?=
 =?utf-8?B?WGtWeVIrMm5oWk1QVnpCT2xpa05uL25OUHh5aytTSFpOYXExUDlGdGM4YURM?=
 =?utf-8?B?SFEyU09ybCs1aFRzaG8vSFNDQzVQZWZIYlJBS1diMXlBNXZxOE5ZQ3FpNy80?=
 =?utf-8?B?SHFwRTI1VUVtVjd2UVV6TkFMUmFoaFRpNjJRckNvZzFmTnp5clVubW5YdFQ5?=
 =?utf-8?B?VFVzRnQvY2F6S0NDWTRiVlY5RExxV1ZvdnlJZEJ5ay9aNmZmckxXU0JIeEF6?=
 =?utf-8?B?SE1lT05mZkROcHRLbkVRT0ZrT1pCLzBhbEJXR0RSM2QwaXl6TVNiSlNGYU94?=
 =?utf-8?B?YzlxLzBzMEdISDJSZTFVYmp0bmVodWN1dlgyZmFOT2dOd0I4QS9zeVFoQlBZ?=
 =?utf-8?B?dU9rQnFFcVV0VDRTVFVzNkphNklwUTY5TXBsbWhZdGpmVDVXRmtyUFRFZjZX?=
 =?utf-8?B?TU94VVlRMXh4TWVWZEVnVGk1S2FCUTNMVUNIejNyamVsMEhXUXMvQy9WMHY5?=
 =?utf-8?B?Vkp3bHNWWlpId2o5UGgwMFJFZGdWQUtEWFBienBkOXE2ZkNJeXlOclBwQ0t1?=
 =?utf-8?B?TVBLbXVORTA0eUNNZGJWMVFqQ05PM2g2am11bXRHcXNsMUpQWlNJeVB2SVYz?=
 =?utf-8?B?UmREUWRhM3RrMmpzVnRhblFSZmlpUExFZFUyYW1WRE90cExZMDluZ1F3YnhP?=
 =?utf-8?B?ckN5M0lSUWFvMVBBMlFncDVLSWpGUjJNaVlJV2VoVzZKMGVkeldXL0JMQmw2?=
 =?utf-8?B?V2V5ZkhSMENiVDRYcys5RXhpQ041YmRnSExkTkJoTFpLOEI2NlFNVmh0Y0N0?=
 =?utf-8?B?T3lEVFhNZmRmcDhxY1l6RGkyQlNWRVBtWUZnMnRuOFhmRFIrb1VhamFZUnpR?=
 =?utf-8?B?V2RoQWFRRnZXL2NDdTNoOUczNURzd0thamtYU1VuLzRjMGc2Q3pnaXhZOGtJ?=
 =?utf-8?B?WGtKUDRtZFE0VnpmS0FjcVNPY2xzOU5jNnVpN3NZVER6WFlmS3lFTTRPU0l2?=
 =?utf-8?B?eGNDMGlpRy9COWIxQXgyTzA4Qi9ncmU5TWN4cXhRdGpSQy80Z0pxVDBHTys2?=
 =?utf-8?B?ZHAwQzBqaFZJSnEraUY1eDdKSUdkbENaZTl0blhuY2FUamRHMFYzL3VXSXoy?=
 =?utf-8?B?Zm5NVG5BK2VLdHFOR0ZyRzFtaDQySGxiRlMvM21wTjVHT2srajA4cG04MGRU?=
 =?utf-8?B?ejFzeTcvaEhqYURSYXJxeDRGdFRoakFUT1NMU2lhMDZpYVYxMlZKT2tkekNN?=
 =?utf-8?B?OGZjS25TN0QvME45RlpHMWliNWdNWEtYaUlBRjRUeWt4L3BwTnhYc3Mvdm9P?=
 =?utf-8?B?TU9kc1lrWFBxdWIwVHFrMjFUdTZZU3ArTzRjUjNnbjJrdnQ0N0wwWGdUSFA4?=
 =?utf-8?B?bHczK0x2ZmllSEJiWmZNWGFwNDA5YW05VDBjdTRab3RsUS96NFYrcGM0ajI5?=
 =?utf-8?B?dWRJZHpVbzdFMWF5YWhSN2gyY1hEVHBFVmQxeW5MUlB0K2tRcXhvLzZCR3Fh?=
 =?utf-8?B?MzRJTHE2TFdWQzVBWHhNaUFVMCs3bCt4eXNRYTlIbGoyMHBYa29ybWxQWTh1?=
 =?utf-8?B?YUtvVEJiM2RndVJRZEdLajZtcDRHbGRIZmtnYXYxK1d0MlBLdCtUeFhPN2xO?=
 =?utf-8?B?bE14QnZnK2FFeVdTeEl1bERuWEdtVFRNT2MrYXgrd0gvQ0JtZUdxbTVpQzR6?=
 =?utf-8?B?WFhURFFUbVAvQjlFazV4K2JCSnJaR0NrWUZMY0djQnN5SWljamtvRlJzUmIw?=
 =?utf-8?B?Y1gvdUxEUStBN3ZIV1hXL3dmWUYzalA4Zldkc1dOZWw4RG1oc2JZNVpRZzRU?=
 =?utf-8?B?RGU4NWxqTzhCeis1Y1dzdmptMXVUTjJtaCthS280RWJlbjBWZnd2bk5yNll5?=
 =?utf-8?B?YWY1czRTRVJKblpYQm41Vm9xRjFiSTlGLy82Ynd6bTNYcDhmd1NtNFZaa2RJ?=
 =?utf-8?B?L1Q5TFlDbzh0eWJ6MzBvVW9yNmVENVBYcVdtbGplWlh3M1FvWFBaTmRFUnRn?=
 =?utf-8?B?c1dBVTEwN3gxSnZOTDhtdE1zeEczY0VHY2Y3Vi8rcWU2REFyYXppNnZENnBi?=
 =?utf-8?B?VkhsYjZDWkVuMG54SFZaNEU3MEppVFRmT3g3ZkxUbkh5VlJ1Smk4UWlUTkV5?=
 =?utf-8?B?K3R2dkdzV3FoUHU0bm5GWEY2bXhSa2Q2enRqclFkcTZZTXRkRUxPeEJObWVN?=
 =?utf-8?B?cGFZRFFCNkJsMEdFTGIvQ3BEa2VBZHMwZXpFYkdCL1B5czhxTVNkUWo0Zmt3?=
 =?utf-8?B?Y3g1YkQ5UlN2bnkrem8zRmwxSjd3MGdJYTM0Zkhrek9aWS85MVlnUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F1BB0EDA0DE4A43A83020E97E364635@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a826029e-7cb1-4bbf-87b8-08dedd2d4bf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 20:12:55.0522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n05P9oRS5q+PvUU7HzrAL9XqGkonCiffCeXAX8nugUxMMN/yj5wtrZUf3P8ksRw4p3CcZ5Y1Ot93T2rUSnH2vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426

T24gTW9uLCAyMDI2LTA3LTA2IGF0IDE1OjMxICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICtUTFYgVGFn
cyBpbiBOb3ZhIEZpcm13YXJlIEltYWdlcw0KPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09DQo+ID4gKw0KPiA+ICtOb3ZhIGZpcm13YXJlIGltYWdlcyB1c2UgYSBUeXBlLUxl
bmd0aC1WYWx1ZSAoVExWKSBmb3JtYXQgdG8gZW5jYXBzdWxhdGUNCj4gPiArZmlybXdhcmUgY29t
cG9uZW50cyBhbmQgbWV0YWRhdGEuIFRoZSBUTFYgZmlsZSBiZWdpbnMgd2l0aCBhIDQtYnl0ZSAi
bWFnaWMiDQo+ID4gK2hlYWRlciB0aGF0IGNvbnRhaW5zIHRoZSBzdHJpbmcgIk5WRlciLsKgIEZv
bGxvd2luZyB0aGUgaGVhZGVyIGlzIGEgc2VxdWVuY2Ugb2YNCj4gPiArVExWIGJsb2Nrcy4NCj4g
PiArDQo+ID4gK0VhY2ggYmxvY2sgY29uc2lzdHMgb2YgYSA0LWJ5dGUgdGFnIG9mIEFTQ0lJIGNo
YXJhY3RlcnMsIGEgNC1ieXRlIGxlbmd0aA0KPiA+ICtlbmNvZGVkIGFzIGEgbGl0dGxlLWVuZGlh
biB1bnNpZ25lZCBpbnRlZ2VyLCBhbmQgYSBzZXF1ZW5jZSBvZiBieXRlcywgdGhlIHNpemUNCj4g
PiArb2Ygd2hpY2ggaXMgZXF1YWwgdG8gdGhlIGxlbmd0aCByb3VuZGVkIHVwIHRvIHRoZSBuZXh0
IG11bHRpcGxlIG9mIDQuDQo+ID4gKw0KPiA+ICtUaGUgZHJpdmVyIGNvZGUgdGhhdCByZWFkcyB0
aGUgVExWIGFuZCB1c2VzIGl0cyBjb250ZW50cyBpcyBjYWxsZWQgdGhlIHBhcnNlci4NCj4gPiAr
SXQgaXMgdGhlIHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBwYXJzZXIgdG8gaGFuZGxlIG1pc3Npbmcg
b3IgbWFsZm9ybWVkIHRhZ3MsDQo+ID4gK2xlbmd0aHMsIGFuZCB2YWx1ZXMgaW4gdGhlIFRMVi4N
Cj4gDQo+IEkgZ3Vlc3MgdGhhdCBsYXN0IHBhcmFncmFwaCBpcyBraW5kIG9mIGV4cGVjdGVkIC0g
c3BlbGxpbmcgaXQgb3V0IGxvdWQNCj4gd2l0aG91dCBiZWluZyBzcGVjaWZpYyBhcyB0byBob3cg
dG8gaGFuZGxlIG1pc3Npbmcgb3IgbWFsZm9ybWVkIHRhZ3MgaXMNCj4ganVzdCBjb25mdXNpbmcu
IEkgdGhpbmsgaXQgY2FuIGp1c3QgYmUgZHJvcHBlZD8NCg0KSSB0aGluayB0aGUgZG9jcyBuZWVk
IGEgc3RhdGVtZW50IHNvbWV3aGVyZSB0aGF0ICJwYXJzZXJzIiBzaG91bGQgaGFuZGxlIG1pc3Np
bmcgb3IgaW52YWxpZCB0YWdzLA0KYW5kIHRoYXQgdGhhdCB0aGVyZSBpcyBubyBleHBlY3RhdGlv
biB0aGF0IHdoZW4gYSBUTFYgaXMgY3JlYXRlZCwgdGhhdCBhbGwgdGhlIHRhZ3MgYXJlIHRoZXJl
IG9yDQp0aGF0IHRoZXkgYXJlIGV2ZW4gdGhlIGNvcnJlY3QgZm9ybWF0IG9yIGFueXRoaW5nIGxp
a2UgdGhhdC4NCg0KPiA+IA0KPiA+ICsNCj4gPiArYGBOU0lHYGAgKHUzMikgLSBgYG51bV9zaWdz
YGANCj4gPiArwqDCoMKgIE51bWJlciBvZiBzaWduYXR1cmVzIGluY2x1ZGVkIGluIHRoZSBgYFNJ
R05gYCB0YWcuwqAgQSB2YWx1ZSBvZiAwIGluZGljYXRlcw0KPiA+ICvCoMKgwqAgdW5zaWduZWQg
ZmlybXdhcmUgYW5kIHRoYXQgdGhlcmUgaXMgbm8gYGBTSUdOYGAgdGFnLg0KPiANCj4gU2hhbGwg
d2Ugc2F5ICJBIHZhbHVlIG9mIDAgb3IgYWJzZW5jZSBvZiB0aGlzIHRhZyIgZm9yIGNvdmVyYWdl
PyAuLi4gT3INCj4gbm90LCBzZWUgbXkgcmV2aWV3IG9mIHBhdGNoIDMuDQoNCkhtbW0uLi4gSSdt
IG5vdCByZWFsbHkgY3JhenkgYWJvdXQgdGhhdCBpZGVhLCBiZWNhdXNlIHRoZW4gdGhlcmUgaXMg
aW5jZW50aXZlIHRvIG1ha2UgYWxsIHUzMiB0YWdzDQphY3QgdGhhdCB3YXkuICBTb21ldGltZXMg
MCBpcyBqdXN0IGFub3RoZXIgbnVtYmVyLCBhbmQgbm90IGEgc3lub255bSBmb3IgIk5vbmUiLg0K
DQo+ID4gDQo+ID4gKw0KPiA+ICtzdHJ1Y3QgVGx2QmxvY2s8J2E+IHsNCj4gPiArwqDCoMKgIHRh
ZzogJidhIFt1ODsgNF0sDQo+ID4gK8KgwqDCoCB2YWx1ZTogJidhIFt1OF0sDQo+ID4gK30NCj4g
PiArDQo+ID4gKy8vLyBPbi13aXJlIFRMViBibG9jayBoZWFkZXI6IDQtYnl0ZSBBU0NJSSB0YWcg
KyBsaXR0bGUtZW5kaWFuIHBheWxvYWQgbGVuZ3RoIChieXRlcywgZXhjbHVkaW5nDQo+ID4gKy8v
LyBwYWRkaW5nIHRvIGEgNC1ieXRlIGJvdW5kYXJ5KS4NCj4gPiArc3RydWN0IFRsdkJsb2NrSGVh
ZGVyPCdhPiB7DQo+ID4gK8KgwqDCoCB0YWc6ICYnYSBbdTg7IDRdLA0KPiANCj4gVGhpcyBzdHJ1
Y3QgZG9lc24ndCBuZWVkIGEgbGlmZXRpbWUgLSBpdCBjYW4gc3RvcmUgYHRhZ2AgYXMgYFt1ODsg
NF1gLg0KPiBTYW1lIGZvciB0aGUgYHRhZ2AgbWVtYmVyIG9mIGBUbHZCbG9ja2AuIEV2ZXJ5dGhp
bmcgYWJvdmUgdGhlbSAoYGZpbmRgLA0KPiBgZ2V0X2J5dGVzYCwgZXRjKSBjYW4gc3RpbGwgdGFr
ZSBhIHJlZmVyZW5jZSB0byB0aGUgYXJyYXkgZm9yDQo+IGNvbnZlbmllbmNlIGFzIHdlIHVzZSB0
aGUgYGIiQUJDRCJgIHN5bnRheCwgYnV0IGZvciB0aGVzZSB0d28gdGhlDQo+IHJlZmVyZW5jZSBp
cyBqdXN0IGluZWZmaWNpZW50IHdpdGhvdXQgcmVhc29uLg0KDQpPay4gIFRoaXMgY2hhbmdlIHJl
c3VsdGVkIGluIGEgY2FzY2FkaW5nIGVmZmVjdCBhbmQgSSBoYWQgdG8gY2hhbmdlIGEgbG90IG9m
ICZbdTg7IDRdIGludG8gW3U4OyA0XSwNCmJ1dCBJIGRpZG4ndCB3YW50IHRvIGNoYW5nZSBhbGwg
b2YgdGhlbS4gIFdoaWNoIGlzIGJldHRlcjoNCg0KICAgIHB1YihjcmF0ZSkgZm4gZ2V0X2J5dGVz
KCZzZWxmLCB0YWc6ICZbdTg7IDRdKSAtPiBSZXN1bHQ8JidhIFt1OF0+IHsNCi4uLg0KICAgIHRs
di5nZXRfYnl0ZXMoYiJCTE9CIik/DQoNCm9yDQoNCiAgICBwdWIoY3JhdGUpIGZuIGdldF9ieXRl
cygmc2VsZiwgdGFnOiBbdTg7IDRdKSAtPiBSZXN1bHQ8JidhIFt1OF0+IHsNCi4uLg0KICAgIHRs
di5nZXRfYnl0ZXMoKmIiQkxPQiIpPw0KDQoNCj4gPiArDQo+ID4gKy8vLyBUaGUgcGF5bG9hZCBv
ZiBhIHZhbGlkYXRlZCBUTFYgKHR5cGUsIGxlbmd0aCwgdmFsdWUpIGZpcm13YXJlIGltYWdlLg0K
PiANCj4gSSB0aGluayB3ZSBjYW4ganVzdCBzYXkgIkEgdmFsaWRhdGVkIFRMViIsIGFzIHBheWxv
YWQgbWFrZXMgaXQgc291bmQNCj4gbGlrZSB0aGlzIGlzIHRoZSBwYXlsb2FkIG9mIGEgZ2l2ZW4g
a2V5IHdpdGhpbiB0aGUgVExWIGZpcm13YXJlLg0KDQpXZWxsLCBpdCdzIHRoZSBwYXJ0IGFmdGVy
IHRoZSAiTlZGVyIgaGVhZGVyLiAgVGhlICJwYXlsb2FkIiBvZiBhbiBhY3R1YWwgZ2V0IGlzIHRo
ZSAidmFsdWUiLg0KDQpJJ2xsIGNoYW5nZSBpdCB0bzoNCg0KLy8vIFRoZSBwb3N0LWhlYWRlciBw
YXJ0IG9mIGEgdmFsaWRhdGVkIFRMViAodHlwZSwgbGVuZ3RoLCB2YWx1ZSkgZmlybXdhcmUgaW1h
Z2UuDQoNCj4gDQo+IA0KPiBPbmUgdGhpbmcgSSdkIGxpa2UgdG8gZXZlbnR1YWxseSBhZGQgKGZv
ciB0aGUgcmVjb3JkOyBhcyBhIGZvbGxvdy11cCBpcw0KPiBvaykgaXMgYW4gYWJzdHJhY3Rpb24g
b2YgdGhlIGBCTE9CYC9gRklMRWAgZGlzdGluY3Rpb246IG1heWJlIGENCj4gYGdldF9wYXlsb2Fk
YCBtZXRob2QgdGhhdCByZXR1cm5zIGVpdGhlciBhIHJlZmVyZW5jZSB0byB0aGUgYEJMT0JgDQo+
IHNlY3Rpb24sIG9yIGNyZWF0ZXMgYSBgVlZlY2AgdG8gbG9hZCB0aGUgcmVmZXJlbmNlcyBmaXJt
d2FyZSBmaWxlLiBJdHMNCj4gcmV0dXJuIHR5cGUgd291bGQgYmUgYW4gYGVudW1gIHdpdGggYW4g
YEFzUmVmPFt1OF0+YCBpbXBsZW1lbnRhdGlvbiBhbmQNCj4gYSBgdG9fb3duZWQoc2VsZikgLT4g
VlZlYzx1OD5gIG1ldGhvZCBzbyBpbmRpdmlkdWFsIGZpcm13YXJlDQo+IGltcGxlbWVudGF0aW9u
cyBjYW4gZ2V0IHRoZSByZXByZXNlbnRhdGlvbiB0aGV5IG5lZWQgd2l0aG91dCBjYXJpbmcNCj4g
YWJvdXQgdGhlIHVuZGVybHlpbmcgc3RvcmFnZSB0eXBlLg0KDQpZZXMsIEkgZGVmaW5pdGVseSB3
YW50IHRvIGRvIHRoYXQgaW4gdGhlIGZ1dHVyZSBhbHNvLg0KDQo=
