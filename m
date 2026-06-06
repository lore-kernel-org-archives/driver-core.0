Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012065.outbound.protection.outlook.com [40.93.195.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BC73AD510;
	Sat,  6 Jun 2026 12:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749802; cv=fail; b=sFkpH/dcziSfvQ28YYfUFKUHgNtci22IMl2sNPZlDvtM9XOOM1VwhDV62iQdtSYYPHqhCYRQB22bi+U+MLoXM4GAxUJ6ayApCi5MDiVyos4O21WKxi/JpCGhl+BSxrniZghbZxTNYXJfhay0n2rexOuVOZbEv1wBspsbaulAmMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749802; c=relaxed/simple;
	bh=Nf/52pr9rA7vA807j6tc2kh6caKvRuATM41SD03VaLo=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=FPmX/C0k1peHXwXD8CbKHLPHpgryXrLsNzA3VNRLmNtljVTHsodpsXPry4y5HsFSn/ApvHZxvKUDN+dPgQpxa0UyrmA0t0w82+4fP7FvPH9Ckxi6Zi21aIJa9whUwP9Eqjsj5QEenN+KNfHaAw5GvuK+EXNMpMebIAoC8M7G7+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WDQkEWHk; arc=fail smtp.client-ip=40.93.195.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WDQkEWHk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEdmvz6HqWE6vDmaEtY4MJ1dS36eUT04BkRDr0qfVrov9DWFfZCjK3YU6aU4eVfTDZON4VHq+PERTsdzd5ZPf8OcDC0a5rIry3ZwlunqJeABHyymf/viDovupPjcwz4XTpLLZ27nKtvEgNhpX7oJdM7u1eNK2d+V8khbvigMrQdOsUJRcI1a/caHagiU7wuWuMBi1NR1bLlwQ4ELDZZ9jTLfZu13lqxjI+kMaDEun4W53IG/ziQ9vJpYF3D/0ZEKgNBa+1vBq9JkEgaP/qfglOk7uADfUk7wDRE4J45CkLC0wnKFmsuzGPEOhFWqM1xHtOTieDN35jR/2UCAEWl9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfC7eFiqX1flKtkDTgy2X5XixdosJlS6O+Ra6HNDA6Y=;
 b=MVaTnuuUI74VtntYeR5CN1/FVWaswQFnmBmcMqQyvFGPD1CMA5pNHhvf9W5PYG86qgbTMesC1WGVHzELrhrBNEtamvuuCo+30ZZCc2piwrBuUS80XxZ5i1wKO5fSMk8HCLphIw4n/Cvrhd+p9TDKHTNyCO0XtrkrZibh15lX9x+FubLoFMs/MF4zeV742BSf+SwUzFGx+Mg5SP9tAnBbyO9we1sWFPIsXcMO5VRPnrXldm0q34taUxGanZoBup6PBVhJ6hJ/BjC7QgRDndJh5ow18ZykfHvE76luglu9jctrUzwPetdU9oCBOOPJg0EuSdEWo0FyQMqHRpn7YpPHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfC7eFiqX1flKtkDTgy2X5XixdosJlS6O+Ra6HNDA6Y=;
 b=WDQkEWHk5GWiZf9vXtQj4e2kBJR/BnOz+4IJzUAJXlKf3f0KgEO2JbySUcoqKpzuh76k5newCscsMrCTwV82BeQkNo+4JbTFxlpzjkuTzJQfr7los2davg+eGvHqeepMh5YAYFTwBX2iu8soCLQmvYHgImbp7bBaML9HO10fAJc15oHSdvuqNc0yrsnI5RGrXOjZPr3wEy0fyZzeK6hjcJLZZN1Ias4EgSClnG1/lA22kx7izXyJXoK8dKRhfmw50i1nQtNcRhTkaF49ZPtnmYI74t+A4BY5KEJfahcV/GtUDMl8MPoHGu48F5Prc3KqUF+WPOb6gBzfBoE1GeRGqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sat, 6 Jun 2026
 12:43:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 12:43:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 0/3] rust: add `bitfield!` macro
Date: Sat, 06 Jun 2026 21:43:03 +0900
Message-Id: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WQzW7DIBCEX8XiXKJlwTb1qe9R9cDP0lA1dgsOa
 hTl3YttVXHUC9KI+QZmrixTipTZ0FxZohJznMYq2qeGuaMZ34lHXzVDwA4UaG7jHCJ9et6R0Ni
 qoIJ3rNq/EoX4s0a9vm06n+0HuXnhF8cx5nlKl/WtgovvL/b5HluQA0dpnAKAXjj7Mpboozm46
 cSW3CLvZAtiR8pKGiOg75yUsvf/SLUjsd+RqpKkNQqvKFhPD+RtK5Po+1znmbeGzJpMvN6f4jw
 0PXoprbaBjLN1DxfQeaO6FkgTAHoKILuglxVOlLNZdx2arb7oQYpWikM9UQsu+GWc0lQef3H7B
 QFFyf6sAQAA
X-Change-ID: 20260408-bitfield-6e18254f4fdc
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nova-gpu@lists.linux.dev, driver-core@lists.linux.dev, 
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <ynorov@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0134.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a04ee4-180f-4576-097c-08dec3c92d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|18002099003|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ro9Hacze6Ubn7V/XsAV3usEt1qw2tE7m8A3XI86CeLcD6knxvS5bkDFsZmoqI4PoH59C4g+xTiF7/N0ceWySkUA7RkvKNHSgDch8CMGzHL4VBP0hAkhpRL1UIqi4Jo4gdsMIfsCiF9sRfZctX6fkHnGw35+IWciRjRveMVfFFsxmd/T+1GLDE2h01pKXE2FrqpX1VfpA5dhyLBZAeLRCdfnXUHHqGX3EeaOQ9XhUp3tb8+FK+95WR+dI8io8WJo0MbUNTYXW6IuDFlCWTHvRLXlC6Jfp1YTL4HqPM6ySIhXBMXIX4jp5WawHkAXYGrG0J3KxiJAx67rmh0tOmubKHb76VB/dEFlD3x7zmtZ6kuVUWIrzB0OqOB8GeRl4dPbGiQnBe6wXeflJB/Dnwhm7fhUkK0ld/tHdkiu/WMA2GaIhS7ND1tiKMRz83oS/+U439IWWwVJCvyRX+0gOAuVBK+0hDAI2tCGTdB/Jt/WMlQV0dHMD8sPFGtJCYn/yieePI6vdw05lNJl6EJamkBuHViMZ0kYag+0xjCnJ+VQoNcVxxyauYlqueOP35ESEr3Vza46b1L80lbQMVvm3/5DTDRabBc2CbVt5qHXVUbTMqj8mAXrgLCb6NOFhbjl0WRxUTuABd8ptE7IhJF/DiEq+pklrkDOyg1NVgwL8XMqTvxABmWpwPypbWo2uY/njZ8W7XsUt8tROtJ50cMMQEya66xtcOPkZTJ2dCv73rFryFuEd58fVwDZaLttierVu0Zch
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(18002099003)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE5xTVVUZzFqUTU1dzlnOUg1UlROOHhwK1orVUt3NWFSSXFhZGRyL1REQUdu?=
 =?utf-8?B?Sk44WUFLMXNoaFplb1F3NEszWm1ScUN1UG4xNm5VaGxWL29vN1F6M294cUxM?=
 =?utf-8?B?YWVGT1k2dHp0clYyWVhqazhuU2J2R1RKMEFwYm5YR2tzd2tOeVlGdHFEOWlX?=
 =?utf-8?B?dXB4aHdJNW05TEo5aXU5R2psSUNGcTFmRk1RSkUxUVkzTG1KaVpIYldQbElw?=
 =?utf-8?B?cnVmMlgwRTFCYTkzdXRid2hoRzUzNGdiUTRkSTRId2FySlY1S3lJRUpLODNN?=
 =?utf-8?B?L002dWVodWg5Y3hFdnpvR24wTHorNmpSTVRuVXp1UWNrMkNiVWdYRmkvL05M?=
 =?utf-8?B?d1ljZEhCdlJNd1lEU3REOFRrYkdQSW1RYnlqQ3lhUHdrVHlmdFRieDFGaXhp?=
 =?utf-8?B?eGk4bGlyV1dwNjBrMG5kZXU5UndTMzBjQjJHUGNQWjFGRnFyMEtFbk1mSCtL?=
 =?utf-8?B?cXAwdUxlZVlQc3FRRDlZYU55cnNSYlJweUJtVGtyWE9leWo4UnpaeEFVVGhB?=
 =?utf-8?B?c25UL284TXpRTVpQb2xwcHdDL295S1l6Y3g4b2dHbTdQK0JvV256dnI3LzBp?=
 =?utf-8?B?dE5JaUU1T2hFcHU2aTlEQlVXWUtaM2dmNDBVT0kwK1RIQXM4V1JJamxTQzVX?=
 =?utf-8?B?TE5RdWN6all1dThsaDMvbkNMeWNPSkpzM1J2WC9CbTdTMXhaL21FRksreURW?=
 =?utf-8?B?ZGM2T2VVSkdYckZTcGphQ3FCeEt4UDR2UkhaNXYrRzFHQXNkaG1wTno2eGZN?=
 =?utf-8?B?NDNYT3Z3OU51aEw3YWtVbGpEQlhSNmFQRm5sNDFaM2lLYUhqRDlZS1QvZExD?=
 =?utf-8?B?M05yakJRS2RPVFNIVENEa3pTM1YrMHp2dE16c002VEQ5TjVNcldRbjB2VTlH?=
 =?utf-8?B?OS8wOWxMTk9QbHl4cHNEamFIL3BGWjJ2dTZtUWRodEh3cnZjejl1eDBhbGtl?=
 =?utf-8?B?SCs4UWxxdnZDWG14N2hQdzFxaXl5T1c2NldMcDhsRjNudlZWbVEwb0dLclND?=
 =?utf-8?B?TlFxbk12RWtsR1V2QjU0UDFlQlJRTVJIQ2VYaWZuTWlZSHB4RStoSW9xOVAy?=
 =?utf-8?B?SlZPZ3pVS1JKZS90bjErUFFlNDYrTDhNQjBGUWUxQkE1OVgyMllFa0w0cDRN?=
 =?utf-8?B?T2NPQ1UxSDV3TmkvVWVZV0FoT3lCTlJpTVZmcWdqT2F6ZXU2YXBEYzh0Wmg1?=
 =?utf-8?B?VFpobWJ4cnVKL2FoNVR2c0lhaWR5RWJNcmZkcmR4MmtScERmTE9JanAvN2xW?=
 =?utf-8?B?NGU2bThyQ1NJaVlKMUtZTEZ3ZkdGTzNXNjJQMXVlRU9BaGNUalJoUjFtcCtY?=
 =?utf-8?B?dzJnS0hkVFBpTjZHdkw4alN2NC9DTzA2T2NreWw4YWdia0dtdndXamZCb1VQ?=
 =?utf-8?B?QURPWFFtckhMdEZ1WWNMMktpN0xzZEwvMHhIVjVUZFVjK3g3L0hlcTJXaWhF?=
 =?utf-8?B?TVlvRG5lOER3RzBwTjFBVWxHM2ZGZER4T2dMSm1LbVBFV2xsZEM1dE54Y1Q4?=
 =?utf-8?B?V2haejlJMWdZU1FFdHh3QWNxa01EZ3NCcGQ0QnRJWWZKajRiSUlucGZINzZo?=
 =?utf-8?B?SGVKWmpVbTNYUVRNK1ZGWExRdVRxZjdtVm9jOVY0TjRtRDAwRW5yVk5iUGhy?=
 =?utf-8?B?WTJRVXJCaG95V0JDUjA0dDlKQkNRcy9pOExvWHNJUDRSL3d6MG9oQnFhaEdm?=
 =?utf-8?B?TFd3YSs0V3QzMktUWGJmMlpCOXpkKzJybGovbmlXQmRxdXg2Ty9XZzBTY2pD?=
 =?utf-8?B?bTVRZ1BpRU8vOWc2SFRWTnBaOEpMeStnT1J5cUMwVmZlOERsTnRXVndqcDM3?=
 =?utf-8?B?YzJ4UGdhWlJjSjA5ZHhxSTBEaUliN2x4VkJVREZoeHpaKytMZjV6UW1WMS9X?=
 =?utf-8?B?eHhYQjAxSmhHSWxrN2UxVkNRQ2N3ZnVRWDNhMGtia09HdzNuVkt3NXhoNjRy?=
 =?utf-8?B?Sm9kTHRpZm1DakJaQzF0M04welVnYlphOFI1YVR2dWdoRncvWmV3MkxIOVlE?=
 =?utf-8?B?dXFZanJyREJBYzU4aklrMlkxMDlxMDJRQ1RCSnVsNUhielJpbllwM1dkSkJr?=
 =?utf-8?B?Q0hrZ1YwN3ZZQ2FySXN4OWZyaWV5Q3dYVGlBYXZVb2M4dFZRN3VjN0RFYklF?=
 =?utf-8?B?em9ITG5NcHJWUHBRM0tZQmhEWFlRMkQ4ZVllZmswWmZSV090MjQ4WS9QWFBz?=
 =?utf-8?B?cnlvNTBHZFdUMEhvMGNiQ2JJamNWZXlwbU9OVE9odTZNbU9qZlhWRjQyUVE0?=
 =?utf-8?B?RUlGNUZqWm8xTURiNzZpWGhkMVU1MlE2SkFpYXpDeWt0V3VVZ29HNGpld3kz?=
 =?utf-8?B?WDJSOFpneTdoZXJwTUViKzVrNGxsYzhvaERlVUx6a3V4aXUzKzVYQnJIMS9t?=
 =?utf-8?Q?Ry74uMnC7MJ5ec7dA9U8wAAfY4EtEEwS+DaBX2mMeCkyI?=
X-MS-Exchange-AntiSpam-MessageData-1: J9VLM2MjfVR1kw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a04ee4-180f-4576-097c-08dec3c92d0f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 12:43:15.0026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCfgu44Hzls1lA5fhwL33LmYgoF6lYt6UxXpnoqw9qlnr7VTel9zfNVcMSCRn4NlWhLBQHKq9kpBTc1oCJ6VcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730

This is the continuation of the `bitfield!` macro which started
alongside the `register!` one before being temporarily integrated into
it [1].

This series extracts `bitfield!` from `register!`, adds unit tests for
the new macro, and replaces the `register!` macro rules with the
extracted version.

I have removed the `nova-core` patches, because the Blackwell support
that has been added this cycle (and thus not visible from `rust-next`)
introduces more uses of the Nova-local `bitfield!` macro that this
series intended to remove. If these new uses are not updated, then
`nova-core` won't build, thus to avoid conflicts and/or build breakages
I think it is preferable to merge them during the next cycle.

This version is based on `rust-next`, with [2] applied.

A tree with this branch and its dependencies is available at [3].

[1] https://lore.kernel.org/all/20260120-register-v1-0-723a1743b557@nvidia.com/
[2] https://lore.kernel.org/all/20260417031531.315281-1-ynorov@nvidia.com/
[3] https://github.com/Gnurou/linux/tree/b4/bitfield

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v5:
- Squash the fixup patches into the one extracting the `bitfield!` macro.
- Remove the `nova-core` patches to avoid a conflict/build breakage on
  -rc1.
- Improve the unit tests per Yury's feedback:
  - Use a consistent test axis where each test focuses on a single thing.
  - Rename members to generic name including range for readability.
  - Add test exercising `try_with`.
  - Add test checking that unallocated bits are left untouched.
- Link to v4: https://patch.msgid.link/20260527-bitfield-v4-0-e8821d4efbde@nvidia.com

Changes in v4:
- Inline private bitfield accessor methods.
- Fully qualify types in `bitfield!` macro.
- Rename `RUST_KERNEL_BITFIELD_KUNIT_TEST` to `RUST_BITFIELD_KUNIT_TEST`.
- Link to v3: https://patch.msgid.link/20260501-bitfield-v3-0-aa1076c3337d@nvidia.com

Changes in v3:
- Split patch 1 into the addition of the `bitfield!` macro and its use
  in the `io` module.
- Mention reserved field names in `bitfield!`'s doccomment.
- Properly order fields in the KUnit test.
- Add a Kconfig option for building the KUnit tests.
- Document behavior on non-covered bits.
- Document support for signed fields and storage types (TL;DR: not
  supported).
- Move `nova-core`'s `bitfield` module deletion into its own patch.
- Link to v2: https://patch.msgid.link/20260409-bitfield-v2-0-23ac400071cb@nvidia.com

---
Alexandre Courbot (2):
      rust: extract `bitfield!` macro from `register!`
      rust: io: use the `bitfield!` macro in `register!`

Joel Fernandes (1):
      rust: bitfield: Add KUnit tests for bitfield

 MAINTAINERS                |   7 +
 rust/kernel/Kconfig.test   |  10 +
 rust/kernel/bitfield.rs    | 862 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/io/register.rs | 246 +------------
 rust/kernel/lib.rs         |   1 +
 5 files changed, 882 insertions(+), 244 deletions(-)
---
base-commit: 72d33b8bfeacbfdccf2cda4650e8e002def036f8
change-id: 20260408-bitfield-6e18254f4fdc
prerequisite-message-id: 20260417031531.315281-1-ynorov@nvidia.com
prerequisite-patch-id: 403e34bb92b42d3f31ed972e11896d18902585e3
prerequisite-patch-id: 42ae775aa6762a9e28ff31c5f69a0b65a7b40dcc
prerequisite-patch-id: 19b3e535962348f7627ede57ea829b34abda08c7

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

