Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795594636;
	b=qzo0oAQ8piSEAHnxTS6OzfsJV42iPJiFexJOA13SOZMDN+yxVmPLmppAN7rfPfgdQsAs
	 4ivUjM9dgHeCOTpU9P0L8+mzKY8tjmHG+dx8cweTM1ZEb6W2irZW6pl/JaRoWewZ7QtZ1
	 BpiO/zh2cB9svyeF+f7USn/VSW6WCkOq50bsrwuOwexidDoN0fqjU6DmBxX7X0o/AsZbE
	 b5PFVjm7tHjQ45TehjAB0Bb/hWRyO7vuJXNsxa9oWP64sK1WGyykORF6PowUVJOZZJQTf
	 qdirNHXxrVtjkJP7qF2QO+u1Uw/hYjYCPCY8nCLghtSz+P8ETrSf/27E2SeSg0g+BBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594636;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9XhOIV9r8f6FBYErVp7Q569PaN64NzZjl0QnfuWIqyU=;
	b=TyRR/0tybdQ9342PNesWBfykbJ2tZ8/qAEtx2d7hATf+Z/Lrpsy477Yuly0sMjr6VbaE
	 DKLb6FZ0MQgCJDCnF13DpJrFnxp7hqiGj0BQ3+H37pRtBRwjZlR6O+OXEPZU1JbRtB32v
	 BwcdeR3lJZZ/ZwzfZXxy0/YGFaHxpmu7ZbCNW7WbRcELmKPSb7cViyUf+REnj7y89T03o
	 d+pWUGZ+AUvL0bX5gL3vl99S8t8gkEOR0+DGc56VCAJcO+OUEFALwaHdmb/kHD84oFwam
	 W363T/0uTG1pIM+iH1ZCDyfBw98otDPRZMyFun0Pax47ps6avinQrsEfrpXKZMEDihw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NWAmVNeA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.15
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013015.outbound.protection.outlook.com [40.93.201.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD1606A323
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 08:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BD1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NWAmVNeA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQ2FvlyZ1fNbfpUPQqTsmS0SjLEqGtng9R5R5PjSIDIm2laQa7eNxvRSLoe2urhsk72AJQOTZ2hDgL8N4AstmV41TU7Tx35zfkDBkTxjXAFPI8Q12OwattSNnHPWB4/30nt83m/VFsQOyGPnPezxrBPWtQigNezoYln9z0bhs3XUoaV9zW9D4glSYPYscUX/lWnP0rytUWPmcH83k0Vls8uZsokFiDpbATZu45nSeN+I3AppT6ofbF7IGWAsNOb0lDD2dQr3br31aQprJPyvemAoJoPIpEcGcv/lSLirhA+Z9tz4wjBxfAJmYl5LhAyUMb0WiUtpVHBdjtCkB3NMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XhOIV9r8f6FBYErVp7Q569PaN64NzZjl0QnfuWIqyU=;
 b=L5KZ6i2Xc/1BquY/323IXbow42PSUTygliYRPdmYc8jaw3ryjWaJwpE1S/ZrNJ0tROrVN9a2K1fk2X+xTIIqziOUmXqfhIPm3zaeA7dpGxA1taIDRSmkgqXA6M1bFw4VnZPDhKJjoRXek8qPAUto95wYOdr/aJ1k0cAiYAbJFmaIPlZA+pZBWJAA8SHueQ1ZOuq/cQrlQWp7V6eKdA6xlgU0SYffTdlIJn0y2tL0m0y95DLscByw2DbWPgXUdH98hLuTZtBUmohEB2wlxsxlF+D0szeCxgjjaLZyswEpaNpb9IdlmEv5L2ZNJ8SY/iiperMoMxflrZlmlP9pVzon8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XhOIV9r8f6FBYErVp7Q569PaN64NzZjl0QnfuWIqyU=;
 b=NWAmVNeArrDUMYrDXJdy+cSP+F/did+EAdaJny1Ync3iwRlSZINb9moHOZlyDBkP+1yPqWR7DqurBNDCp7A/5U7vMdJznroErkQqvU1fjyJ905wqihkC2P6Dk5Gt60eM7Ck9WAeZM5vIKT6HwQFiMLB1m+0KU4P77HGN3RNe7iQvqUSUK/seHHO+J3/24sSrZuPKHUrE58J4EArhqXZ366Yr1Emzi20UoZmvElIxrtqFA9sLJwyzuqQc9IrPlhig448NFV/0Xa2r/I8NliDn+0LCYW+avfVO3w18sJn7olN78dhGEUgz44earzETYJ1orWN+Myi92gmvZ73KcKOWrg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS2PR12MB767817.namprd12.prod.outlook.com (2603:10b6:8:3c2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 08:17:11 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 08:17:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 17:17:08 +0900
Message-Id: <DN4568LP2RLG.2JSXGDQ8M5ETL@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <tamird@kernel.org>, <work@onurozkan.dev>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] samples: rust_dma: construct driver data by value
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20261122171610.967066-1-dakr@kernel.org>
In-Reply-To: <20261122171610.967066-1-dakr@kernel.org>
X-ClientProxiedBy: TY4P286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS2PR12MB767817:EE_
X-MS-Office365-Filtering-Correlation-Id: fc350f1f-0f1e-4593-2ce7-08df4acc8129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	fzr1VqY1RUf8osjIWIgIThNP/9ZR9TSvaC3ezdFQWWoXnAFRAf3jbia/3+HGt+GySu8GUwtoBfKOFkpsqAWtFpYkPE1GY6Bw8+Wx/7yKEgbbM2L8OCgIUq+UQroyaonabI230NRf10GmPaDW49nc/UWLXRePtKc1DtC0kFjoNH5KHZhV0iPhHJ/VrgiQblF9aY2/9Oi0NGAQzod4joPdMtzLDWs9UQKQdZN8dbIOcZkinJYpub5utk8ILHSr7l1JcgNXuqtuhYMSjO43vsXR/z4/dzJUqiEKR2B09vPIpOOufZAeXDCUtwnqfgMp5mqgVlnGRnQGvHwxKFe8R5UutwbUsMVNsmRS8udlr4p4qGftaslY5xbNXGTQP0aWHcNAJbZchS6geFBYNxL7ebUwomPBwnqDA6vEFOC0+a5Y6XUbEt82LDtzjkRNNxdCfnwOm/R6i0NmyPq25ckqfACEcHxc4Z4fynNxEda1Jx2aPFfTXj/sbI7XXF2MwXeZNeZlH5jGE//6kjCYzeoz7qK/GJxhVc3QF5iJhxPeRMcinfxpPWnm7O0+vMnTWvhhurjwFH37zh3zBqJ9p+KQf3Ayn8w2sgBcn5FXrQ4IDYmwtw5I8lxG2coZ8DKpxDgbLzU2rCSikqlkLBe1Sk6UE0wfyn9w99B+5RuRTEkmjKKqNS4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVVBZC93aEJMOHdXTEcrbHJmTHc1N0ZUeTVYZ3ZBSnlKeWFTcHM4MzhSUFJJ?=
 =?utf-8?B?SnpWQUljUGNRMTR2VEhqa1hLazV2cnVQM0dlVjdWaFZRaFY4eWdseUZDSlRj?=
 =?utf-8?B?V2lvUTE3WVZleFFWcFV4MmVkYzNLT21wQzA5MHJhZ0p1ZGJYUGxKNHNiK3R1?=
 =?utf-8?B?TFk0TUZMM1d1K0kwcHJUbndsMnk1cTNLV1V3YThXTmpwVkcwUHJhYnAyaitV?=
 =?utf-8?B?MDFzdlhITHNpUlRIajF5VFJWdVdDVGhzUlRld29uWkVmeS9JdUhsQjlGM2tD?=
 =?utf-8?B?OSs0bWl5ckVKTndTSHVmczJoRVY0encwWUtFd25FZ1NZTDBzZVZHaXlveWlW?=
 =?utf-8?B?Q3BGQWQ5QTB1L3ZMVWV3c0VxckQ2N3NCTUpUeW9nWXo0b081WVpURlFBQ0Ev?=
 =?utf-8?B?WDl1R2psK0l0d0RzU25YcDUyMmVzZVpPT0pxdlRhbXZBWHJWbHVDNTNwdk1P?=
 =?utf-8?B?VVV2dEJ4TkJ4Z3YyT2k3TWttNnc3WjVFV2NkUnVpSGlZMEZxNTVGWFVVRHRZ?=
 =?utf-8?B?dlBIeWNKM3JMSG0waXJ2eEd1WkkvY3ZjNkZDWkhHMEZOS2pKaS9QZ1JnTkg5?=
 =?utf-8?B?MWVteFQyVVQ1OXZRZWdFdmlwQ2NOaXdJRUlUcE5MKzBEMXhNWlA3L3p0RWxx?=
 =?utf-8?B?aGNvdlBzSVF1NWZRQUg0ZGJVajNNVE9EZUVyVjJBT3k5VUJWQm81SFFUNytL?=
 =?utf-8?B?N0ZRVnJrUG9UT2pnbHQ0N0tKeEJqTjhZQlFuRFQwT3M2T0MrUnQwMWpCQW5D?=
 =?utf-8?B?ei9qMVFvQnJnZFV2aU54cmVLcUY1TXl2TUcxb1pScEFJbDVIZUJ1Wll2cEsz?=
 =?utf-8?B?dmdvaFR6UDZLd0xQUys0TG5LZUdNaTN2dEY2dWRKZllFVEhtdDlrVU94eVFh?=
 =?utf-8?B?ZFdpQ3lTS1M0RHpMZ2xWa3JUS1Z4a010TllkWGVzQzIzWjdwT2NUdE9iZFZ5?=
 =?utf-8?B?VU0yRUFrbFZJZ0VPbGNEcXYzVHN2ejdudWVNbXY5UE40UFAvQnRYY3kyNjBS?=
 =?utf-8?B?WUhkY2EvVXhYaWh5OXZDQnJWQVFXcGlyVmE0c1lRNS9lUWR1ZWFvZkZHdEtl?=
 =?utf-8?B?OUFzcXZtaTZ5bVRmU3VDT2REbjlFdW56VDFPdXFlNUtpQUVLOXA1RWV0clRS?=
 =?utf-8?B?YVhuZ2ljdDErN3lUSTg3cHhpMnFNZkdHR2dGR0dtd3lBUHc2QWV0RVRaWHJP?=
 =?utf-8?B?UFhyU2tHbHhFMXZxMWRZSHpkd00vNUtQcTRxK0pMb1NXVW9LbnpUbXFxZ253?=
 =?utf-8?B?RjZOSDhXbFhEWkNrdWxoakR4dGE1Z2EzUGZaSFRpYVFTWFdEZEl4M0srRFA1?=
 =?utf-8?B?ZlVDb0pWZXBoYU1QTFBha1dPb3kzYmdHL1RRT3Fjb2krMGQ3L0hkb3FmNTlJ?=
 =?utf-8?B?ZVhKdDNCTno3Y0RmbG1nSmlnVHR5K1lYaUYyMWNVVnR5N0d3YjdCSHM1L0x6?=
 =?utf-8?B?bE44d0VSamlMNTBacVNVR29HOVFaejBkNGFRS2gzWHpIM3Ezd1NMRWJ6Qmo1?=
 =?utf-8?B?UHgzeXlSSVd6M04velZvSFdaRHRwdXhKZVhUVmN5ZzB2VHptTVJvQVZVYzRD?=
 =?utf-8?B?UFJacWN1YS8reWI4aEFSWHZTcXlTZ00zZUwyVG1KU0QxWUVaTzRKNE1tYXJi?=
 =?utf-8?B?MnBqSFNNMkhqVTB5ckxJUCt3QUZxN2ZJS1drc0tTLysvNWg3Z2RzakRQVTVW?=
 =?utf-8?B?eDFya2J6ckhnbVlFTWJDU2Ezd2I5S3B0bjUzUGN1Z2ljNUxUNEtUY25XZzVN?=
 =?utf-8?B?c2FpUjhwcmpGMitwZ0VrRGVhMjhzbThJUG1rT0dUd2R5VzQ4bk1zMjNjWGo3?=
 =?utf-8?B?cGVPd0FYSzVuNzRpQ21Ka3VLQmg0MlRNckQ1T0ZhZzIyZ3BHY3F5VUNvMkRm?=
 =?utf-8?B?UWJVeUtOS0R6UHpic0lhd08wTmdySHhmYVI4M0JWbnNOWEFLTmw1MEppZytv?=
 =?utf-8?B?ZU1QL1ZiSFVWRVFOZ0Z6Q05FNGNCdTV5SUp2dWxrNmpGTkpsRncxbHdjVWVZ?=
 =?utf-8?B?THBvNk1sNHNQM09BRzlaaktjTER6MDBtb1JVdnViV3pkNVMwS0pwaU94Wjl6?=
 =?utf-8?B?dkQ2clF2Q2M3UTM2V1dTeDJWbGJJSVZmVURUdGpvVVIwdGhSamJvVDFnb1Bj?=
 =?utf-8?B?ZFdsb0J2Y2w4SEhkL3M0cmFJbFYzdEZIY0R2VnU1SXh3cnp3WUl0N3VuRmwx?=
 =?utf-8?B?M0pCZUI4Q2NIeHBkU2k1M01rb1NkQzlxdExzZlZkdFpBU09DL3JZYzB0NlZF?=
 =?utf-8?B?NDlmTFdUdnBaVk9IVWhMWGtGaFNUR05XRUc0SnJhT3BUdWQrSHUyK0hLSzla?=
 =?utf-8?B?SEpUczQvcDA5M3VXTEQrRWxGdCtWakpMOXN1dkF6MnJZaGd4aFF0d0I2QjJL?=
 =?utf-8?Q?jF1v7GL+AunKbIGj/BEi+I6KHbQWD2V8c88dZPs7Ku1gQ?=
X-MS-Exchange-AntiSpam-MessageData-1: 6DvOKJK26bQ8pw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc350f1f-0f1e-4593-2ce7-08df4acc8129
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:17:11.2629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8dKXJ2XH5PCtbcSZl+e80SjlqyL2PwLMJ6J4WjlCc6vzYhm9qR0Fv67of657cGHBfq0S8kyv3YzRZZ8z7i9vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB767817

On Mon Nov 23, 2026 at 2:15 AM JST, Danilo Krummrich wrote:
> Now that SGTable no longer requires pinning, construct DmaSampleData by
> value and replace PinnedDrop with Drop.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
