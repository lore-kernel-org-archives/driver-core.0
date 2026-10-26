Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990563;
	b=NiztU4+3U38liOgKQqODnMNyRDhLTbZPOIc6ff6aTfWyJL5/OAnLw0hMrupB2fHRYADG
	 GJ7BdQmHKxeEVrA/bHsvUiG8lA70qEmYg8RL4V5JwwGrx8VKr07c2QruHkCPA9Bi2qKHK
	 pNfZ2jgYfNKFwWreM6WI1waTfoIv9+hqrhc3Nrv6vMni3aUDQy21NmvGZaTOQwNnKGJLb
	 XfXrlo02oxDsJ4vsaJqRs4g3gnu3jnjKgnsqv+UrDa2Z7WoZFQZ7pIHJQtGLeU7Bzdvp0
	 3Btt/jYTkd3VeWp+wwIjOKu2kktQUnLHmEmTq/fBmSrZPyvfJ5QfYvoeo62HRJ2tGTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990563;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=bON5Ji9d24QRvBIywYZD6r5/ivpnPalfqEfswM6mY08=;
	b=YglmvADT4gNd2MF/GMs289G2OaQ+dWLDLxkGZCBPRUO7WrLWnJ0BdsCJQSa7g6vnTA5u
	 S/Ij6Z4xT25UslL/2u21giidEiBaYz8VSiRWnUBArL3tjzeBR79xVG/dG7/Dkh9HZmb/m
	 O9/mikmgExQs6dBRkN7fu8L2tqXNQ7p8rRYwCuKaUL7YAle0CUNfR2FdLTS6y64SYfjlQ
	 FEZkBdLNMFkGk/tnEa5pw0oOEgG/HL9T2+61pc94wqYjqe34jozxzjwgmIOhXvcaJeRLm
	 Z4CWybt1jtzIJIf4GQ8pjW+vN3/r9SYDqld7FqE+DDLmrhuG3L3Xf1KKf4ch53lVcBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JmreCsog;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.52
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7153C606A31E
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 04:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7153C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JmreCsog
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nF9elfBrgunHELyANN7rTpc/E0t5J2XtwuHMlLiX9WafVghqV0BdH3UxM7dDPdfDZGQgIpIvX4RFAnVBsVyFN6ivJa7ZwSeN3vcdhl1Zn4HugqSwbsMG3amVKRdQza9G7FvuCo5/yn98h9shKlBPvtmL4AL/k80pN7Nfxp33wpBtCDRgM+NgTVcDrczpoQtQ2m0sJWGvCEC1y98zcI+hXNNhOxcb6FMsVi+yhnLeSX8v8KNFPOj/q2dS3rIFGJXNipw7QZp6Xu5lUrEO7JJenqlVCaBgmDU8bolpgBkYVgSukQI2+QokI01WZ+dFHy/qXWF9a9TUsD1MslcBzFF8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bON5Ji9d24QRvBIywYZD6r5/ivpnPalfqEfswM6mY08=;
 b=qaZkgQztDoM924eLal1Lk8c143p3k6Y32/qAjpMQtyMWaV9SEMlVlgdidA6QL9O17QHvAWlKuntd/x8OASxNgXqyMI4D/HJyTEdyN9k3q39sSmI+mOFNqdxAAcEz9E5RGSe70B8lMzEGoNHUsi+8ZBBSyJOwAurw1NLHQ0AWPnF6FVFOCPbZaX7BzTPd3785OBRrFmJ699pWY4RNFsDe5CWrwYvDwrtUq3CKWm/fQecYF2SNVrlJIi5miWU+XvRK5ipwuVT0QVC9IVCtHRQnqUj3w3ceLy36bXc0beQYzhPIpVoEzv0TUI5ay8adt3gXHw5wv7zRhQ0bWABG0eQiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bON5Ji9d24QRvBIywYZD6r5/ivpnPalfqEfswM6mY08=;
 b=JmreCsogx4jeh43zpIK6jDlocYtKXglrXW387MhjfMV3Vn5HGBY+AKCLblCh6oSL0p7qlaSSn7IpJp1jRGstZFJxSIWjben87WrtiYc6BCemdETBPKnUGSXCG7LJHB6c4H0j083gi1NMUNMd80bFr18vIKyN8LVe4GIWKqNIaA1YKqgQvbcgoDmod2PTDjkbpoOiuyfx/rEyhRSihoMKpS5T9zzKW7INIIQhQj3Uf0I9FH8qCXzzdE7ma3rlCvsJMKnnAOfyfovynE15Nby7gr6A/+wjWTO3tBDOCGVPTmmARhrXa25BvZLmUSYOKpCd+kJnof/KW5vL/Ikg6XlRHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SN7PR12MB8060.namprd12.prod.outlook.com (2603:10b6:806:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:55:58 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 04:55:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 13:55:54 +0900
Message-Id: <DMEI3TS04IWZ.17P49EAIOK3G3@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] rust: io: fix unused Flags::from_raw warning without
 CONFIG_PCI
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20261026-pci-fix-v1-1-a6a69ee584d4@nvidia.com>
In-Reply-To: <20261026-pci-fix-v1-1-a6a69ee584d4@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:405:372::16) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SN7PR12MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc2fdfa-c5d1-4010-c7d9-08df331d6ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|10070799003|376014|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	X99lVvRm2kRVGaQ2oRfeWkGdcJ0y7CWZfr7ZNt3OOLmh0aFESyxH0gvaBa7RJU8/Nvom4qrjp8De5eDs4lp2cxcvF6YNl6JebhwqIIhR7r2HUTFsifQkOkoA7/STGBxNa2kk5xr8RoxxcJlkhzaGblp81meMjjK+U3XI1PhZglawqgxXmiDppV+ScSSGWp4rbLw4La539j+HuUkAz3N5iKCf5dLPdZR/EzxXpsmjdIkiM8QFRLfC1S8c9DW8z8+aH+XC5YSVTlk5ZG0BfVdbuLpB3p2QStKkHmuLoTRvL5GsBvWnY4oyvjQfnioemxy3/fwfECl9eId4ErEEBUUO9Mk3prXzA1UzlKORFAuySQ85DOzV6cwVD3FrD/4bEV+l0icJWquH77rgFqcSGs012a1ajDwV5+sdbzjr5Isbd/sHX6R+iRAzvmImIwbh0OXlP3Fn+hpbBObTJZO1vSHXp0Mc+XS7662TVniYxKhcE/BgpJc8A/1tmLrXoJ5/ywLE35XMr3qSNMLQX9ngPFAoP1VC67i5KipmrVdHrsusEqE4Q02Fxf8J42XIJGLzZOX118njYOTBViPbtEYb5XmhfnN+BbN93+BumFLlGjN9AdNxiYzz148f7cUx5G6Q6tRDjXaXozwCbEnb/wpeo+EXebA0NfJ4Q7eRePdignSuWfk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(10070799003)(376014)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVdmcWpHNjQyZnVjQkNqbXI3ZlJKdDF0eFVBOXlOMmRLblJuOFZKUUNQSjhZ?=
 =?utf-8?B?d3FkU0VtdUNjNCtRb2R6bHNmUHZ4S3U3Qm9SVTRwaEUxeEVrY2E5Q05BRXow?=
 =?utf-8?B?WG5Tb0F0cmswa1R0T0NGd0YvM3ExKzIyNEtNV1RRc1FobGphbEtMdzRncURY?=
 =?utf-8?B?NThtcFRJYWw3YnFvN2FrM01UQUY2RjdvanN1c2RFcnUxcXhZOHp0eGFzMjlJ?=
 =?utf-8?B?b1hXV3ZCQ2hJRXNhUjN1V3BVcTBXYWM4UElnOGRrMTFmNkNjS1o5eVdxZFZU?=
 =?utf-8?B?L3NwcXRrc3d4czB6RzZCaEphdWJGMVVGSnA3OW9PNXVUcjJZM2p4U0ZicG50?=
 =?utf-8?B?TTRCTk1SOUY4S3dSZEhQeFEyKzE2VUhDN21VM0x2cGJKOVVBejNiUkxxV3J6?=
 =?utf-8?B?Lzl0ZzBtWUlDd2QzbnYyaWkrV1k2OXFmcllJby9waWxhMCswc1NDa3VNSmhE?=
 =?utf-8?B?TkptQ3VHTkExdU1SWlVsMUlzejc2blA0RkVwWDdrQU9ydGNKL2R1T1NqaHVL?=
 =?utf-8?B?MG9zQ0FZWGhYcEp6RGZSRFhjNkVzWWFMK244eXVIVFJRbXFxeUp5d2xFb2dI?=
 =?utf-8?B?UWMzNjNUcUU4N2ppU3VhM0IzUm9JYU9HUUF0ZnN4SnJkT3lhaCtkYTBxYW1t?=
 =?utf-8?B?NWpVY3UxOFM5cWhEdFR4SGIwL2lncktTVjlNRzcvSURVdXlneFhBaFZjZG1m?=
 =?utf-8?B?RzhsOUI5TFA2SkN5ZytVYzh0aUhhQWo1NGp2d2ErcFdGNjNpeXhEL0dPU2xK?=
 =?utf-8?B?Y1pSOWxFb1JwOFV3SVFVdTY4Qk92SXluRWtrK1ZYNmZlK2JRamhaNmpnWURJ?=
 =?utf-8?B?bVBmN01vOXVTbUd3U1dmcHZqbFB3SGFEYWJHN1RuV2s4cEpwZ21SdVBKSHNZ?=
 =?utf-8?B?MFNCZU1WMm5NTVd6bFZwdHNtV2UzeHBDQ1JCNTRPVDJ2SFR6ekd6NFNMS21a?=
 =?utf-8?B?U1BwekFSRnA4bFBZVmdEK3VuMm5hMW1vQ2J6UDhJRVhUU1BESHlHYnZXaWU2?=
 =?utf-8?B?ZFlIa1I2enhQcmk2QjBxZmEwWHBZV2xONndGdjJDa0pOcHdaU3BGTSs4ZEZ5?=
 =?utf-8?B?YXJXaWhxWkU2VlZKWXpmbnJIbWtCNXJpNjlEUUdWNCtYQm1Eek9vd08wTmZ1?=
 =?utf-8?B?R2psWlRpRmlTSWkyb1ZWbCt1SjgvNzBHVHllMjZhb2NRU1hraHBXaG5kUzUv?=
 =?utf-8?B?bkU5aGZta2lnMFBnVWtVNkRhVkkvSlN4MnVjUE1yeGF3OHJlWlRBWjQweDll?=
 =?utf-8?B?ZmRmeDJGakRFY3R1aHQ4N3c4THlWa1hhaExmWld5cXFSVktTQ0Q5QktXUytS?=
 =?utf-8?B?a0dtK1MzRGVHbEhDbUZraUtwNVFMQ2F2N3JoM0JVUjd6OHZrN2pNZlVQYUtm?=
 =?utf-8?B?MmM1THpLWFpFTjM3NENYaS9XeStEMVBPN1NSQWhjN3ZVUFFSL3Fib2thTnFR?=
 =?utf-8?B?dUFxVG02ZHd5R1NwcHBTNExMRUp1SXNSZHB0U2xVVGVMMnhkanVZWmU2bHFS?=
 =?utf-8?B?UWFHVHpwMzJYWWt4YTVWY0RIQzF4aUpXUWpZeDdlTnFVVWF4ZmYvYmtPaVQ4?=
 =?utf-8?B?ektFbzNkUUd6UmRleUx5ak5taWw5bk5XZ0ZuY3YvdGZ4dTFNVDQzV2pueTM3?=
 =?utf-8?B?WUJsSkMrVVhLbTZzZDlFRllYZWg2c1Nwc2o2dzRYZE1PMEoycHVILzd6U2lk?=
 =?utf-8?B?MkhGMDRqMmQra3Q4bkd2YWozeTBiQ3NGYkM2N3hHNmpYUlVKb2VOM1VYTWJJ?=
 =?utf-8?B?dStEdjE2a3hadmZyTXkvVEVKMjJRSzB0YndxK0twSmJxU3pWa1FuWE15dGtG?=
 =?utf-8?B?NDlkKzliTklQRW9OMk1oak15eG9LM1Zob2dwRDRwSVJLdjB5Um5aVUNSak1l?=
 =?utf-8?B?L1JFbXlMMEF0dnduVVNaOHR3dmVwcmVaMUZVSVZiM3lITDRkTzlRWEM5OVNP?=
 =?utf-8?B?TzlEdFEya1pRZlFJS1I1VmZvYkg4eGt1UG9Fc01DanQ1TDNkZWNUa3pWM1Z0?=
 =?utf-8?B?SnBuOWZIZkhkUjlvcDdNb2JqbGxpU1IwVGhHVVAxNUVVN1AzR1VyTkVSQ0pv?=
 =?utf-8?B?c05JMEp6cFBwa05ydVVFdHh5b25TL2VlMG5ucmNmMnpRRnd4WVVhNXk4Q2gz?=
 =?utf-8?B?WGF3dyt1aWx4bktPMEdwWHJNU1hUZjVRSUFRWU1RbUVhSSswYlNsOG1PZUpr?=
 =?utf-8?B?Rjd0RnlOcTZiOFEybVBFbGdjYlhOL3FTdmRrSmdpVTNESDQ2MFNEVlN4by96?=
 =?utf-8?B?K2lJM29ScVhoMkRXUnovN0VtS0tiQitnQWhTSHh0bXhTNVk3NXdmMEppemtZ?=
 =?utf-8?B?OWh1NlpjUnFHcXJ2REF5Vjc2UlQweUs1MTc0ZlNrTUhmdVlMRmlIOE5PM1Yz?=
 =?utf-8?Q?XmJRUpNHWX6BjCwPkVuM3cqLmNGi4vrdqTwgy4RRGN3DM?=
X-MS-Exchange-AntiSpam-MessageData-1: ZLHrH6/UP52npw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc2fdfa-c5d1-4010-c7d9-08df331d6ca0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:55:58.0738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dui9T0uN0Uj3UAwVt/9HCXkA/Rtfz8tHk4VY4g5GiYsrf1vLQQ8SC+bNUUj1x/pjC5+wTJuG3xsDhuvC/4xkTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8060

On Mon Oct 26, 2026 at 12:53 PM JST, Eliot Courtney wrote:
> Currently, `Flags::from_raw()` is only used by
> `pci::Device::resource_flags()`, so rustc errors (with CONFIG_WERROR)
> saying that it is never used when `CONFIG_PCI` is disabled.
>
>     error: associated function `from_raw` is never used
>        --> rust/kernel/io/resource.rs:240:25
>
> `Resource::flags()` also converts the raw `flags` field to `Flags` and is
> built in every config, so the easiest way to get rid of this error is
> to just use it there too.
>
> Fixes: 3f1e12fce16f ("rust: pci: add resource_flags accessor")
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/all/20261023154005.95904-1-ojeda@kernel.o=
rg/
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610241133.L9VWoFcD-lkp@i=
ntel.com/
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
