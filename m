Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8C93CB2E5;
	Wed, 29 Jul 2026 23:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785367456; cv=fail; b=rPRnM14qM7KdTWSa5htXlAL3IuW2IAfrOgBS3m3ZfpRpakMrg1B+Y2zlIhzJJCEGduwuRqfQ7gkXt2wyglnMgIgT0hQsrYjgWBTp5ovbc1KZLf46Fx4GEMRpfNcHiAjHgp/9oPhrW4iJaV4Ddig5N6ae0V2iqiKkBIWBHrNOm6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785367456; c=relaxed/simple;
	bh=wJ5CEARp6fQ7DHx/dM7UnS6Ju3aDDCE0VP4TZf2xrm8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QIMEZkUXmLzbDG4T0eGMBD5dvNiTyL07TBpx57Ch7vC+SLtJZ5jxBTHCgGgjJrzXW3xHsNJ1msT+r6OLbBkdXMozI9XjmsV7sJ41pcZp2PsrHzGGYMvrtFqY2hw4a447XMfgprWFVAyOfo7WxdM7axL+paXSevtz+qVsRplEb5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lp4LUT2H; arc=fail smtp.client-ip=52.101.193.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lp4LUT2H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtHWeXNRx2ORB3TjlwBcJNwmNdfFdGu7FJR2mmVYykjH0KiVSjcRW5cXbyKICOmhZCv0d5kp9x633nSdUpK4yGwPGa+Nlf0K/uMar2z/6paxhflaOUsgPWkjOk1yHrglsJOB83lmokQ6VAb88ndRw7cLabZkebKKVWoqVLAEoQ/79IWuEoP1X7kvdeM3Rpfmv42KYhnuPXJNpgnSMzqLbovB2mnmPDdRGbG2GUZB9LE+vyrOZjuoIVVCCw9X39LPNSVQMmnjv8VT9R/KbUlikk4Uu6vrgmNyBLohmCR41DzRy3Hf3Gb+h7MXsu2FeOYb1eQtpYwipNi8qDVw3QgnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJ5CEARp6fQ7DHx/dM7UnS6Ju3aDDCE0VP4TZf2xrm8=;
 b=AALMGRe0ZBb+dtWaRZI2u0C6njGYFrukMQbHACujZa7TM+zzAYimEyzEHybazSkCO5V0dcjnXTLMRqV5kS4/h5j0EA7DNsgwSNfmbojtwkMaanyCO1sqbgema4vWX4/7V00YF/Xmpi8rWXj5Uisd4elGmAunAla1Q5xXxpCoWjPrF26uhOBbjqha+WtNrjw8fQPF3xZ+bqbsaS2YanOS5kVHNvb28rEYlz6E8pLI+EcAT88DgoFlcREP9Q27c+WAPPnMWsO/P+H2+5qFfA/83S3gIx+8/FqRtyuq+CucG3ImCGvNTiGBN5joJTCr32vug908Yiyo7OhkYbxK0bGTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJ5CEARp6fQ7DHx/dM7UnS6Ju3aDDCE0VP4TZf2xrm8=;
 b=lp4LUT2Hscr3KWuGGfY5b0c6U24m1VoXgVGkgmFVXltzPy+mm+fVsGpsC8ruJnt56wl7R1t06b4JN1NwKVnXHVrN7+tE8WY6Csmk0siEDneH9cOFEYAKr5PIoFyl80m9G9XUgAiqyOiA4U6cpTAVaSO3v/83Q517bW8FpFadRP35qeFYhgjK41FT4mql3vxTH5c0Kx7vgiTDd0R6CfAEM4Jr9ckmVasqJ9ZwZKC0v4bKfnUV0WSmf2HoYNQTqjDYqx7BsHLwG2RyI+EGWYHYI95LBWc8XxTw58RGjsEfD9dgmf5JpGByOIdSV8uW3ZYgmNQ7K70JrHimr8pXx0GEfA==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SJ2PR12MB7867.namprd12.prod.outlook.com (2603:10b6:a03:4cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:24:09 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:24:09 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, Gary
 Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, Eliot
 Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Zhi Wang
	<zhiw@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>
Subject: Re: [PATCH v6 5/8] gpu: nova-core: transition gsp to TLV images
Thread-Topic: [PATCH v6 5/8] gpu: nova-core: transition gsp to TLV images
Thread-Index: AQHdH615fD0EkF+/6EKG5kxrrMOGDbaFI1oA
Date: Wed, 29 Jul 2026 23:24:09 +0000
Message-ID: <4ed1cd65-a2e2-44e5-9c4b-5269cc780728@nvidia.com>
References: <20260729225534.2046933-1-ttabi@nvidia.com>
 <20260729225534.2046933-6-ttabi@nvidia.com>
In-Reply-To: <20260729225534.2046933-6-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SJ2PR12MB7867:EE_
x-ms-office365-filtering-correlation-id: 9537c11f-5925-4ba0-ea77-08deedc87db3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|921020|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 RHbM8IIa03mR7F4K+gqUlGuL7Fe8JOQ/GaOqyp64kOLi/wmg1vJUH4prvP/yNr0C0ImY0fsLVaWwRORU8tyZAhkEvvfPvay1YU17YJXVNY/ZuG0sEmF3D3XkJm88Qv0hf9opUNcTDyK02Nm+0fp2u3dPErzi1ishhZ7N8Z1qd01+2GHD03cDCaHc47ZGqNbC2U7nbng7THyR1pf9fJfcqyw6ukJQACDBrevvOr9n/PMMkpxBsBiyhiSAcWs46lfbdZsJ4ulPlEDMfHN0+d2bvG725ABJZxqRJFoyVTNMHE6UhuKx92uBcwSnGjwsyhqYBIORuJAGVDoiZEqr4aDiyF2H7Qc/M1ii+cZdpvO1pA/RBvo3vuG1Y+Bmnzl1/yOMXbe+k4/iO+ogxjKh5j2cGFTag3O7UQF+VztL9r8Hvrg9+xBtsYNfzN1wYoHONSn+GKj+Zb1Efy5NyuihANdqzbAvzamLEyrJDd/lnU9kG86Kggx6QDc4t3d+/DRtTR+seZaRwT+5it1Ecfw1wM2DFhZN7K+LslyeyO7WDOQOpQFKjFApTzjJjHdBwchMoPJS8Ex+P88+kxUE/IXSHasHI9wESWdBPge2k2fQPCxgdakqOWlDaAn3LrHQcaX48pk2nE/DwPZPO30oomc04JwB+cG6zYdxiwkgAkiLJnx7snOW6rr/4NZvsumjrjf+3J6lDSEXQCfZcjDWR5oNBU9/6CEZVD+XKf/Jenppy33fwzf6eNPHGxjqdYnx6O1VLnO9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(921020)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3ZUWXhFUyt1TWYwYXdRUUwxQmFOc050RWNDbEtKWWllQ1NkeG1wMjcvNWpN?=
 =?utf-8?B?MklNWmNBUGRobk5xZGVKVkNyOU1nbkg3Nk4vb2orcG1VeDZGWW9IamRKSzZ2?=
 =?utf-8?B?aXk5cWZSb1FZWFkxT3pQa2FNUkFhUUNjM2VxSlJYS2RVYTFrUUtoVElEQnRP?=
 =?utf-8?B?V0tYSnZUYnJBcG9ZQWxUVHJZQ2dnMWVZMlpFVXRnWEp3YThVMk5ydmxOL1RJ?=
 =?utf-8?B?am9XTnRLZ0NlN1A1NzU0RzRHRTBGelNtaHlQK3JLRHUxb21aaUZrSitHZ09l?=
 =?utf-8?B?ZlJ2enpSNmV1R1lHNVNTSFlhZnd5YWtJVGpPTmQ1Ym5jREJPRWRYWCtLL1o0?=
 =?utf-8?B?TzR1Q00vWFJiRkVmVFpIc3lzOTRxcEQzcjNEV1NJa3plbmNheGhtNzRRcXhp?=
 =?utf-8?B?ZW5kb0MrRFV1TU55bVpJWTNjWUh2U0ZVS1ppVW9HZk5jYS9NZEJFdFc4QWY5?=
 =?utf-8?B?dXczaEloZjlMUGdadkZkMFJTN1pqdE5OTDJBQk5TL1diVmVxMkdCYkwyZlNQ?=
 =?utf-8?B?RFQ1eXRCMitMSU5wNFJuMU9UUXZEY1hZU1h3UVNqaENJYzBNVUEyZnczZ0RX?=
 =?utf-8?B?WHloR1FEQjlZaENsbDJBV1I1cGRpNFdkNitFYjNrRVQ0WnJUTFRpNkgzc2lx?=
 =?utf-8?B?WGdidTgxZnhpOE9JcFVUZzJGY2Y3czc4OTZHTlh6ekxjSkR0SjFpZzRkWTNs?=
 =?utf-8?B?a1Q3QTZ3dFQzTkl4R3VaUWFuZ1M0SzZSWDRmcGV3OStJY0tYaERBeVVGbTFv?=
 =?utf-8?B?WU5XNFZ1SE0vcVRlbUpwcGlxbnp2TVFZTG0zREFLZ1ZkYTFISXB5S09CanFU?=
 =?utf-8?B?cUFxMCtzTlcrRnFOS2I5UzdZQTZNbWFyVEVJeEJuQlFnZ29qV2Y4ci9ETjNl?=
 =?utf-8?B?WEVKTmw4dXBQRTJPQW9xeDRGOVBkSCs1NXdzb1FsWVlrWGZJZVZSbU50WHlI?=
 =?utf-8?B?bzA3M1Iya2g2NUlCQ2hYcFE1R1dremJLTGpsZzRIUGZKeC9hOUpJKzZBYWRX?=
 =?utf-8?B?UTBiZWVQRTBtYXk0b0FNWFhJSEUzUUpxL2w3Q3hxN25FSDFBQlREMnlwK1dK?=
 =?utf-8?B?S1ViN1dsTzM3dVFQVVFwb21XWGRDRWI2cHlWR0RJY2VIQ3hSNHp6bDZaZWNi?=
 =?utf-8?B?SGlERWcrbEVsa29FK3JaT0ZwUUg3RHhCTkxyTHRvLzBUcXphQ1R0Y0ZONWpl?=
 =?utf-8?B?QUE4R1l3N3VFcTFyc0VjVnRobjN5bnljbjlIZ1o3OVhOWXN1YWtIRWxieWFI?=
 =?utf-8?B?RkRJYWFoRVowaC9UL0JkZXlJRWt6bm9PdythMWxudXorTU9jRFFndmdOeUYr?=
 =?utf-8?B?S0ZDZkxFamZzVVNaY1V5YlFNSVBsZVJBMDdnSStacURVbUdqOHlKZlFLWll2?=
 =?utf-8?B?alUzRFFwYUJtclkxTjEwS1hUb0ptOHFyZEdEZUNHM0p4bk0rTE1qVDF3dXdX?=
 =?utf-8?B?ZmlveDBLeGNtQ25Ob2RLVmxNbE9CSUs4YzdpUUR4Q3ZzNmwwUm1TRHlJd0E3?=
 =?utf-8?B?UTdERkx3eDBVRFpXdzhYY2ZGd0ZJSTNicGd5SVVOZUtnVm9KOGZYT29IZG94?=
 =?utf-8?B?QXRrTG1md0N4eGNPMlQzMi9QWUZIWm1wOXNQQ3Rnd2ZWTmJzWG5MU25YeHpG?=
 =?utf-8?B?aXhRZUNWd3IwNDIwRno1UTUzWk5BWG13QmdoTXYrL1dMeFkzSC9ERHdHVUd2?=
 =?utf-8?B?QzhPdHRPK1ZHbm9ESEtMTXdyalpjQmhHUW85dFpPY1kzN3hKeE9jemNmT3Jr?=
 =?utf-8?B?Y0FhZWRTZkFJYURsM1FFaStOZU1GeSsvam1wVTQ4NlViWnFoamNEY0lsOStR?=
 =?utf-8?B?bWhCMk5LcVg2WmxqNFcwdWdpSGZpa2VmcVZWam1PLzk3endxQ0dzc3FUckxt?=
 =?utf-8?B?TmRUZFFvQVpCYVBuWm1JOThEc0haUXhQOFBueDg0SWphVk5xcUJ5blRUYnNJ?=
 =?utf-8?B?ajdxQmt1SDVkU1J1NFBnbllFN1NETDd1Nlllc3k3UXk2S1Y4RjB6NU1qTlQ3?=
 =?utf-8?B?dVhqOXVjYVBNOUkrK1JMUjRzN0lubVhRZzZGOTVqOUlFTStGcjJsdEZvOGFh?=
 =?utf-8?B?UVVPQS8rRm9SSzRZQ0o2dVAwSHd6MnRDZUpiZCtIcG9BKzFvTFZtNnAyTFBh?=
 =?utf-8?B?T1FyZ21kOHNTMHpucnEzTEpmdDRiQnJXRS9aNzVJcEZZc3d3Y0xNVDhaQUQ4?=
 =?utf-8?B?ZXNBZGQ2ZUg3Y0RzTjhVRFlnVlNqMmp0R202MkdGVFpsckhqSVhGcHlGMkpQ?=
 =?utf-8?B?MHJSQUgrOWIrQ3A3UElRYUxFbVlLNGRzK0twbm8rcVZkRG5ZUWVCalJJMit1?=
 =?utf-8?Q?2nykH7NBoOIzKNDlwO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE124BE558B6BA4E96AC1EBD5821FCDF@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9537c11f-5925-4ba0-ea77-08deedc87db3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 23:24:09.0764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rtCDuqxj87N9sSVJMPtVT9lTofxyh+dkZxUxRcM4N5c6pfEJi3yo5POzY+2Mk+79FebF1vBdx1l7xcx/2OKDWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7867

DQoNCk9uIDcvMjkvMjYgNTo1NSBQTSwgVGltdXIgVGFiaSB3cm90ZToNCj4gICAgICAgLy8vIExv
YWRzIHRoZSBHU1AgZmlybXdhcmUgYmluYXJpZXMsIG1hcCB0aGVtIGludG8gYGRldmAncyBhZGRy
ZXNzLXNwYWNlLCBhbmQgY3JlYXRlcyB0aGUgcGFnZQ0KPiAgICAgICAvLy8gdGFibGVzIGV4cGVj
dGVkIGJ5IHRoZSBHU1AgYm9vdGxvYWRlciB0byBsb2FkIGl0Lg0KPiAgICAgICBwdWIoY3JhdGUp
IGZuIG5ldzwnYT4oDQo+ICAgICAgICAgICBkZXY6ICYnYSBkZXZpY2U6OkRldmljZTxkZXZpY2U6
OkJvdW5kPiwNCj4gICAgICAgICAgIGNoaXBzZXQ6IENoaXBzZXQsDQo+IC0gICAgICAgIHZlcjog
JidhIHN0ciwNCj4gICAgICAgKSAtPiBpbXBsIFBpbkluaXQ8U2VsZiwgRXJyb3I+ICsgJ2Egew0K
PiAgICAgICAgICAgcGluX2luaXQ6OnBpbl9pbml0X3Njb3BlKG1vdmUgfHwgew0KPiAtICAgICAg
ICAgICAgbGV0IGZpcm13YXJlID0gc3VwZXI6OnJlcXVlc3RfZmlybXdhcmUoZGV2LCBjaGlwc2V0
LCAiZ3NwIiwgdmVyKT87DQo+ICsgICAgICAgICAgICBsZXQgZmlybXdhcmUgPSByZXF1ZXN0X3Rs
dihkZXYsIGNoaXBzZXQsICJnc3AiKT87DQo+ICsgICAgICAgICAgICBsZXQgdGx2ID0gVGx2Ojpu
ZXcoZmlybXdhcmUuZGF0YSgpKT87DQo+ICsgICAgICAgICAgICBkZXZfZGJnIShkZXYsICJsb2Fk
ZWQgZ3NwIGZpcm13YXJlIHZ7fVxuIiwgdGx2LmdldF9zdHJpbmcoYiJWRVJTIik/KTsNCj4gICAN
Cj4gLSAgICAgICAgICAgIGxldCBmd19zZWN0aW9uID0gZWxmOjplbGZfc2VjdGlvbihmaXJtd2Fy
ZS5kYXRhKCksICIuZndpbWFnZSIpLm9rX29yKEVJTlZBTCk/Ow0KPiArICAgICAgICAgICAgbGV0
IHNpemUgPSB1c2l6ZTo6ZnJvbV9zYWZlX2Nhc3QodGx2LmdldF91MzIoYiJTSVpFIik/KTsNCj4g
KyAgICAgICAgICAgIGxldCBtdXQgZndfdnZlYyA9IFZWZWM6Onplcm9lZChzaXplLCBHRlBfS0VS
TkVMKS5tYXBfZXJyKHxffCBFTk9NRU0pPzsNCj4gICANCj4gLSAgICAgICAgICAgIGxldCBzaXpl
ID0gZndfc2VjdGlvbi5sZW4oKTsNCj4gKyAgICAgICAgICAgIGFzc2VydCEoZndfdnZlYy5pdGVy
KCkuYWxsKHwmeHwgeCA9PSAwKSk7DQo+ICAgDQoNCk9vcHMsIHRoYXQgYXNzZXJ0IHNob3VsZCBu
b3QgYmUgdGhlcmUuDQo=
