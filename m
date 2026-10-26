Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.46.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792986918;
	b=dvFIn5BIWEFG2BKed/d3My2EcwghuoE5KehmBd5+jIj1b4KtcKSM0AojAKhrwVZeLuwD
	 TM+Xmj0eMwIs047M9dNUqEw9+GyfSyZX08AH6T6zpwo1EAQwvyEEiBoR9NzIXcNGTeQcF
	 9N4MRVo0o+icBMu62QVX6GuSktdNzFw3/nz5q6HHq6EktlpgYd5JgqAZYv2pHWQWSH6ye
	 LrX9rOFCWLd+sIOL9wvc0DLyhRc2cr9PneXgfyTeHZ6m0vrmBXGAt8J6w4q/Mje4b3u13
	 SiOv/ZZEFT7KhwBUOLQgQrfhPq4AyYYl/o612SzGP63znkKhrNJDXJahQTLNWxvBDqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986918;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=RsByG2zwyvZaa6B5lYBzhO2JuewYlfocVhtYm18KEd4=;
	b=5AvEYk2b3QG0x+JNsiyM4EQI05pSQOtmznVFqYLNLOex1XKBOep5CpkKtFREbTK1LhUq
	 y+aEDyEiO+/d1ZHgt5u+iD1XbNwIRvziQUuukWo5dqMh4UAu968aiAfsrJDke7+IO9wgg
	 F7m036mlWUpCxsVhAGbU4xwBcL89mnzStSk6bY1qWzTxfyjadxCQZhAp22O275QIeSX1s
	 /8cUxNc2CFcn0FarKnLTcy+YRiATJ5FErKuygBMlwBrd+zrghQsyAvwHvHyEQh9nmN8m+
	 SmTkzzCodwSnhtjmeKs2l/VfaMxlTMzUhihaa6TCvAQD0UcbIb5M0KVOwaL23UcvUQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="GRW1/i0U";
	arc=fail smtp.remote-ip=52.101.46.69
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2747E606A31B
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 03:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2747E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GRW1/i0U
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb3yMQTQt1TvFeXLUBCceYNZSjf9jgwz9Tca1BWPRj3Wa8LHBDiHO68Yb9AcBrqvCEUjEtFAZICYAxUUuEWz9kfVsTYwJ/LPWDBX+CUERrj7eVJYRR+qdQ62F8s0yKyHiWwX2/UvX+oTtoKVvB7yD97ixbUrUmYjuqWiOeKEki1UikuPuYYxAvhsszhsvjZ/C5yXI+VjQ/XemB93UC3YIxJfSTdEiFdADcpLucwmHJSPW4uh4y4RJSm619XYNAknF4TMMZACdHh07Yc7Z7Lywd0xtvO8crXwzblAu1PmTiMCTidWEwYb+N5YYgpkqk+M+OTsHVslUQH891PMwuyQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsByG2zwyvZaa6B5lYBzhO2JuewYlfocVhtYm18KEd4=;
 b=G9uKoD4qnRyJ1rAZMOFYThBAbO6VB7L4Zj9befcUp0ifidfQr+q53C8M5vKnEQdLe8JXh67P48GkrW6qKbrCDlui+YQZcvjVgjEw2T2NHkg+ZJvqOeb60qQ4Bfmx3hX2AWeAe8yhTjzZIxYCUuFvfTNGLIzlLPz50guzBJMYzKKCioOdjksJl66Qs/Kgvb2I4TY6zwot7wBvZCfmbMBTmeUd/FAxQMr1Op0EU3Ph7GN/e7iVSEU0Im0/AWYYYTKj1Rt72GxO68fB3KNVJFprRVdXTmUywrtzBcgHaRszVjDRMrZN9HY7kDg0HiB/X8Jp8a8SszyTK+YHJgEp6qcceQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsByG2zwyvZaa6B5lYBzhO2JuewYlfocVhtYm18KEd4=;
 b=GRW1/i0UVB0VHnMqAKVYS4BPnXvAfcocKC/db1VTtgu9olnrT6b2u2re/PsUKm5c9svC1/uLJZJJEBFLckVYJ8BhH2kwP1U/pVjsPsdjAypJHLPB1bGq5rsBrvSDwrCR9TKFgi6apRt7ycxbqkF3SejcYjewHuO2BOCBrMkRrAN20svER/gL/WBZTd/50bmt98eOH2pL6CDx6Gb/taRwvKDA/ohiKlSX893Namoji036XbgpQe1lshnKaYPaGvhdRDkAegkJ5ugo+cOkhNWht1lOZM2DknZcKcclaxEOGOebg7l7loTrjWk5sT8kGOMndS9CG2Nl408OoGsVqGUcNA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 03:55:13 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0546.016; Mon, 26 Oct 2026
 03:55:13 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 26 Oct 2026 12:53:20 +0900
Subject: [PATCH] rust: io: fix unused Flags::from_raw warning without
 CONFIG_PCI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-pci-fix-v1-1-a6a69ee584d4@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINYtSM7UTcus0DVNTLZIsUwzMzFKNlcCqi4oSgUKg02KjoXwi0uTslK
 TS0DalWprAaQbEO9rAAAA
X-Change-ID: 20261026-pci-fix-5ac8d9f642c7
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::8) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CH3PR12MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 1923b827-3f84-483c-2e62-08df3314eff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|10070799003|7416014|1800799024|6133799003|18002099003|921020|56012099006|11063799006|261021121427099003|10067099003|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	ApQEJSeV437jjxnRn9YRGxmHcR4mWYbmBVvCYIfu1k4A01TNg/GstIqbIlTkfbW6/Yaakc90kOUjI/bpRg/4Rx20ledHlE+230o2rzd19xyem5VsZyEicr588S5FW9M4Z4Ah27KTMOkdZlxn3RWs/n3lIZ2zElcpsXOMHpgOtlTUJKd0DMci7l+9VBxlFPJbbpSChI3LXKvcT4hJHcoRAN1Cp/ZQ6enmLHB8IvYvlsAEG0qpwYvl6g/x+6dXFPolmK1JC+nvNat8yF9EapJhK7LmmAc8GE/I6cqjbIQeJrkyE6Paca8rtAx0udWw4XuqE3qYPOQubE/xIVMZZ/ByQOzkNHqh2BQupsAQJITD99sjPPa3LFJDQQig6+ikOyvu2QQoF2zKymogcF6haaGOJ8+H01icOI1JLfMMAVTkfsd3Ivepoxrg5xFTE/l8V9Oawqnku8b5WIr6t1BZEewuxPSszAPtERA3QwDjon1fA8lOCustB2/mIh+uYmBFi8dAXZGVzAwfI3J+R0/hwW6jRdMm9GwMw2j4Xvqzs7uhLhMBp5Mf3Bb2U/pXShso9lhbTyFiavnUPpK62ZwDYamSD5+DLmzMxA1/fX8S0zZIDlDqGj/X0zUENUleB2t56/jf4GwG8fFUI93YYeXgS7W06FimOfCdeN3oL6uMlW6GQreAWoksSdAAOu0sqCLW5ErMydakOG5XDHg00f4Innc79A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(7416014)(1800799024)(6133799003)(18002099003)(921020)(56012099006)(11063799006)(261021121427099003)(10067099003)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWk1TEhhalRpS1FIdkRFVUZhZEdDa1g1eUZ4SDI1MGFXcU42TGRBWVpXNFlz?=
 =?utf-8?B?SVJIT0dNK0RDZjYwcmRTcEFqeXh2Zy84V1gvSmViZ3U4aEV0bDdRalF4ODFa?=
 =?utf-8?B?bU1wVmhPYnAxQ2F2b3lCY1hYem1tQlg5UWdJdENvNE0yVnJUeWNhQ0F2Zmll?=
 =?utf-8?B?RlhPM2pMKzZraENEYmRxQkZsUFhBYVlTS2pybUhXMWlqN3d3c1d4b0RMY0dl?=
 =?utf-8?B?L2Z2aDc4VDl2c1BFQm9tQUN5WXB6TWhtMjVTUU1QTU5McTdHTnJMWWR2Q3BI?=
 =?utf-8?B?eEZmbms1SzNJcWlTMDgvTUtMRFR1NVZlY1cwaGJKQWNiTkhScmpRYWNwM3Rk?=
 =?utf-8?B?eit0a0FOQ0IxcDJlaEk3MDFaSUVkNHN6dThDRHZJQXVITy9TVWQzNjdxZ3Zh?=
 =?utf-8?B?N3krTEh6VTVjSzI0S290NWF5UkVJTlQ4NXMwTU5rYUhHMEE3ZXhpM1kwVlFZ?=
 =?utf-8?B?bmdxcUJldldsck1sVlBLa3ZhejVJWHZXQVRjMWhORlhzdDFBc2NKZWdPNFgy?=
 =?utf-8?B?OUNFQS84eGR5MGxUek9FQmhnT2doN1pjaVlTRXA4d2R4a2JrWmtJRG13Q2da?=
 =?utf-8?B?WUdsWFlQR1FKK3liQmNlZXZVWTlxMG80VklrcEVWZXY1RWx4LzlKRXdhOGRS?=
 =?utf-8?B?eUFMdjRVQUJGYmtDN2ljbWc5SExGc0t2VEFvVDlIMDVRTEh3Um4rVS8vbzlm?=
 =?utf-8?B?RTlzUTRnN05CTEJDWGphT1FFZ3g2Q0tHamU2QkE0SlE0UjFyMTJTVnp5NDcr?=
 =?utf-8?B?WCt3cmYwSC9wRWFkV3lKaVRzVGMwM0pYUE5oeFJ3M3EvK0VqVHVxcjlzaFYv?=
 =?utf-8?B?bXNqS1JOY3prRVZKblpHODNrUXN2T1dzSkFyU1BKWnpkWXptTU9HTmdVZmw3?=
 =?utf-8?B?ZXdJazFGNHdLdjE2Y3UxZVkvdzlFSnBPdUxud1dzemNSRGd3a3lKYUcyWCs4?=
 =?utf-8?B?cU4ySEJRejFqM2hkd3JoNWhIQVlYU3lHSDRWZFJtWERFNnhmUVVQdWR3T1Yz?=
 =?utf-8?B?cnQzRnJSMFgxUmU4RUVSVUozVDgwNWUvVEJkbGROU21BaUsvTkQrajY0bTBP?=
 =?utf-8?B?bURDVS85cG9ZdnJ4SVBxOEtUUzhYSG9qK0o0WjVFbFhVRThxVmpVWmdsaEg3?=
 =?utf-8?B?NThqRXhCNmczb095TEFNYyt0cW1vV2JURkxUVmlod083MUFTQXZXKzFKK1Ey?=
 =?utf-8?B?UmxQd29vSmxpZ1NZeTZtT0tLSGxFTktuZTRzUWo1OWVHUXAxeEZCQ05PMG1N?=
 =?utf-8?B?UGFnM1lOVHR6WDZ6cHlLYlFFMzRPY0gxNzd1S2pTa3paZFZlbUR5VTIwbDZr?=
 =?utf-8?B?SXA5aXFqUElTdllSRk9xcVg4RnJUM241RE5kekh3NmJPaXpkUmNWQ2tKU0pM?=
 =?utf-8?B?MkhIaUhaZ0xicXc3T20zVlBWMXhCSlV1S2REK2xJWURwOFZQN0lUWFZKVWlp?=
 =?utf-8?B?OGttSVhKOUhVa2lHUERScFdFemlSaElBNkNuQnMvTjkrS0ZESW1lM2ZzSVpu?=
 =?utf-8?B?MGt0UG82bXh4ZE5XZXR0RzZwbEd1QUhPaUxiNzVuVlpHcUE5bHlxNmVuRXVE?=
 =?utf-8?B?czY0cWlBVjQ5dmtaYUVLTUlnVE02TGlsMnE3M3ZOa0gyUnp1N2Z1ZWJCSkcv?=
 =?utf-8?B?RDNBM3ZIMUtyUnM5WSt5VUE4aFNqNHRuSUk1c2RjbkZDNUZ5UjFvZTJRTHVR?=
 =?utf-8?B?cmsyYUtVWVhMUTZRbmpqVXRqZ1pQMEhITWMwZ0Y5dlN5MTFXanV1a2NobUti?=
 =?utf-8?B?Q3kyeGt1Y2xJNjdZaktCTTRqa1ZVTHVkS3M1V1BmT0ljMHNaRlpraEpZbHk5?=
 =?utf-8?B?R01HVDl0K1VPczYwR0E3WVFTd0x5TXNYa1dsTzhkOGJXR1JKZFZGZDVoMElI?=
 =?utf-8?B?VDhKdkE5QVoxTW5JYkhSWWc4UnlORmt5QmljYlVjM2JqK2x4elZRdk1qcU5r?=
 =?utf-8?B?ZUdqU1M4WTZSSEpQREdmQVhZR1hsUnoxKzRaTGVHUWNDemV3S1V1blRaRG0r?=
 =?utf-8?B?SEZzTGdVSHZndlNCSVNaMXU0SkRTUXhVSTNEdjVCWTNtZFh6cVVyMXZ2WkFn?=
 =?utf-8?B?RndwT0dxcDlyUFlsbmNMRGt6aCtHQjByYkFqQXhmQzc1dStZZ0hpNG4zOStB?=
 =?utf-8?B?L1UrRy9scnJ4bU1peVkrL0VtcnI5K1VnMnBNL2RoWEZpUGlIMjhRVGRlcFNi?=
 =?utf-8?B?UDJ1cHFIa01vNTRxa2wzZWoxbFphdmZNZ256MW4rL2RDZ0xjcW9uTDdONGcz?=
 =?utf-8?B?ZDVqeGxySlhMRWhCenJJdDFRcW9wUFVVN2hDRWgrZEtXQzBrWWlRK3F3L3BF?=
 =?utf-8?B?YjBjcVZZbG9RWC9CMVJKM0tmeVVzVVJ6cG5aOVFDUXpsOFptck4xSkVPNC9K?=
 =?utf-8?Q?0sFa4ffHcdsRQ5miMwt4EdlYswNEvFPOmR0wDdQl/seTw?=
X-MS-Exchange-AntiSpam-MessageData-1: BEd827OZs5zfUQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1923b827-3f84-483c-2e62-08df3314eff7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 03:55:12.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSMP3R5Ed8Hv6GEHcXVYB4E3FP1qNsFr8+o4VDFFYVPeYnE++7x7mnkNZD4bRNdKmG20n1WRMrsFWuPvxwL7IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233

Currently, `Flags::from_raw()` is only used by
`pci::Device::resource_flags()`, so rustc errors (with CONFIG_WERROR)
saying that it is never used when `CONFIG_PCI` is disabled.

    error: associated function `from_raw` is never used
       --> rust/kernel/io/resource.rs:240:25

`Resource::flags()` also converts the raw `flags` field to `Flags` and is
built in every config, so the easiest way to get rid of this error is
to just use it there too.

Fixes: 3f1e12fce16f ("rust: pci: add resource_flags accessor")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/all/20261023154005.95904-1-ojeda@kernel.org/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610241133.L9VWoFcD-lkp@intel.com/
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/io/resource.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 758ce62b3cce..29771355cfce 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -164,7 +164,7 @@ pub fn flags(&self) -> Flags {
         // SAFETY: Safe as per the invariants of `Resource`.
         let flags = unsafe { (*inner).flags };
 
-        Flags(flags)
+        Flags::from_raw(flags)
     }
 }
 

---
base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
change-id: 20261026-pci-fix-5ac8d9f642c7

Best regards,
--  
Eliot Courtney <ecourtney@nvidia.com>

