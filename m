Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A9A19E839;
	Fri,  1 May 2026 06:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777615461; cv=fail; b=nMGkuO7R4BGM3olPMWHoWEoD9Pglz/URcTfOOvoDLxU9aFwgYJTgDnZFa0DOetbMwlxFDQkBuSfSM1BUmUOneBWAaohenPFO/nv/2ZJlHsXnkqHIWlDGBeV/oIRhuQZDTPHFCQHT1oqSJppX8w27G3qQ8E+sFnjcEqOzW8KnQz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777615461; c=relaxed/simple;
	bh=uopLi0v8gQZAKh4OhJbhBDBLte+CAmXccP/dtmfO1Sk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=NyN89Gd1MhBIWCdKtsfKEPfzQw/L5xHNQdfh3yO25Psxq2TqHCNuydAqjI6xiCFeOXTuvgO+Ra9ZTabeGvvjbVl/lj+5VJN+vviBAdU6sGvXIqpXD8muZPu2gDFNeOxZQyW2tj9FDBU2BMz2M/VNUBNFQk0dRjhvlvalq9TkXmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lDN2vOSI; arc=fail smtp.client-ip=40.93.195.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lDN2vOSI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ag0+N835SIZH/U8K4rPTmwsDxgb6IMy64fj6vnwDberygiP5iWVGKdRoXWLf8XudilreTaJVqWTFsca8YKCUpHDrAFHBDVvlkQURTRvsCnrSgeaoi8FYcSw2BLldUy00izD1IFcehktPnF0Jr9UbKI+u5xqK4cXMFrYNdBdsnsVhLe5OwkSdAtzJgvvSnY9jDigX96hoA7uWQLTlAsaXU3A1pG1y4HE/ICp4Cyj3Wwf5XQmi8fPQRghvraB/b2uxPdrHVW4cll7H1c0lqdT62gLNqnnrL7BCMgFTrBxd53KHTKxlSqvV31HwnuWnAWoaEt3uDBjbG6udcKBQlaeBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyYX5pUzlprjoLTKXAfSs+VSSaYbopJUB6NW4kTDmf4=;
 b=LmCGeeL5bTpdfM04htuHUdHKDf6QpYOUA6LkgWWhXbUBoL9rOjUny9Jigh/ifr3ErTOWbhosxR3odgosHWHCDxvK62aWvKlisBwhd2Gp/sMML4rsz0okthvD+zGXU5X8ubbMTsutY6caGB0uu+zTZXKOb9MhOoGa8pahDNMaTU/gNduqwLyBBdm88K6fpw7R4MgVE0nLyepGNgB/a4zMsgPvvTkSWpD/AXLBxiSPGD1E7yld74by8bBE/PY0aa1FOUCFvLzgHZCjDbxdY15olm2SwZvXhl08b/cjPgT+HqYF+m47epzxZMt1A5SP6BEu4oDwaLNc4SRRt6GH6U7xxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyYX5pUzlprjoLTKXAfSs+VSSaYbopJUB6NW4kTDmf4=;
 b=lDN2vOSICNsZ1EMtFH3aevIZBwscv6HrjzZmV1OfgOstqiej8dbG79JlAeIjjtN0hLxI1juwGOPf7K0oiW4ryODdzYcE8vdkgOCv7MECk5pM8NeD+aah+RUA5Hgxn+KoomIhmTJje6KX9mBhoL79KkFgpVFKygCwr01IRbojCMr3zuYb1eJdjj83BqkXRTQ8gimAhdEgWXBCsKFcDaZMgNqWoAGGDCMttOlBnoQOghzePAQeYAn9cW7FyGGBi9fksT5/bivYThSjo/yOP1gb9NMcjA9n+CCWDGr9Lz/YTgZhSjkagNRLJwpeuXwo8nurTMNAP+nX1/5/Q6DiyJ/C/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 06:04:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Fri, 1 May 2026
 06:04:12 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/5] rust: add `bitfield!` macro
Date: Fri, 01 May 2026 15:03:17 +0900
Message-Id: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNyw6CMBBFf4XM2pqhVERX/odh0cdUxmgxLTYaw
 r8LGOPyJOeeO0KiyJTgWIwQKXPiPsxQbQqwnQ4XEuxmBomyRoWNMDx4ppsTNZWN3CmvvLMw649
 Inl9r6tx+OT3Nleyw7Bej4zT08b1+Zbl4v+zhn81SoJCVtgoR96U1p5DZsd7a/g7tNE0fHj7e1
 rMAAAA=
X-Change-ID: 20260408-bitfield-6e18254f4fdc
To: Joel Fernandes <joelagnelf@nvidia.com>, 
 Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
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
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <ynorov@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OSTP286CA0076.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d7b15b-1afe-4f4d-a144-08dea7477709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|18002099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	p8z5KMvRpt8VoCsfSFMP7RH55rG/SBfW5a96qVcN4w00bEKaOIUX3te9k8CBcVfVbB2Rvwww5S+02bXXT91ixE6m+QOHq19/9rsb7wZz11uIQpk1MmO2L4+S0Cgcy7PKXKgbqDMwPCg8jsDKS1U9ZvzBfYL42JZejPkXtJ71/ViuxOLVV8ktpiKgDyULkpHY35Ic6swpm7eOTsddL5XeAcL0NUSnb1DoCH82BRuyIUNd33tOywnkWS4x10d8nJyEhcW5VUKzuzDutZorgZJkn44VbDlNSaOEUq7h1GObPNDIE6WBkOxCLdBLazM5EEwKPEJwCJG5N6N6DMdHd50imPJIhNU6gWwtol2+dZn845Z3eMelGJxsUdbh4Or8tUxl/PPFYRYkYjPm5EP+jqUh3wYOjz3ogg7g63rpI+qmZWrK07fMb76ILH54hpv6tbDx1AKacGxlItDlt2dBngxIMwPJqZczKcYuTRYtmSZu0BOZTekyY8Ol1O4g6EUav/t/JjMuim2mEKibw5Ix7KZgEN9yvVujVGJGsuzDOi9D6jf5T9TQrBZjkK3x7Bijpa+2jm84Vgr+GSW+ffcg3S+ZLNicggm+3EB+FQHnuvIEw+vAztyqDnhUEpB8OQuY3aNEifbMLqCCXRKCq2s74FEFSFrTyK4g87YQlui9G2AS4fuUsbBxFFEt6JCnts0TSrO1H2yn1BUbT79edln9/ySaz56ryhoTMNfNX+2wAdMg6ZjNTm/ekzEnYOoWCLhtw49E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(18002099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXBWTVV1aTgzSDU1RzkzQk01SHc2eTdPbGVIZG1oeS9uVWlFRTVVT3N0NmVR?=
 =?utf-8?B?ckp1TTczM1g4cDd2d0lHMm1kM0w4Q05CODF2VGJqYkdHVmVYT29YV0NwTXQ2?=
 =?utf-8?B?TEJseDhVKzY4cTVyRDhTYVhCSlFkYk5jYStaK005U2piM1EzWkpEdW53UG94?=
 =?utf-8?B?L2VLVjh3NGdBTm1JNmhSd3VmNXlTL1lhV1JsVzJjZEZoOXBCek5HK3FuRmFj?=
 =?utf-8?B?enBNRzJTWTM1T283UUdDM0FnVi8yQkZDRUdpc0c4Ly85dWxlb2xPUy8zZkxN?=
 =?utf-8?B?bGpNTzdla3FRci9wQktva3IvWDJIOVllTGtacEhsMEdHOFRRZG1SVnBEYUdn?=
 =?utf-8?B?MXpERk5kSUdabTFsU2ZiQ3JRNEpoclFqbGk2RVVKakNFQWNRQTZVcVVwQVg1?=
 =?utf-8?B?Q01qbFIxVnB1NGN2a3BZbEVWL3Y2MlUvaXc2MFRiMGtDTXFCODJsckVpUDQy?=
 =?utf-8?B?Tm1Jb01RMVdncno3a1NONXY2Rk56bUN5dGVidHk5RkVzbFVjdGQxb1lmUHpl?=
 =?utf-8?B?ZVFRRjF1ODRCbkh6UHk4cG5CMGtxVjNnME4zam45aTFNa3VpQlluSEdjQ0pD?=
 =?utf-8?B?aG9WWEQxT2V5eG90WGlEUG1wVzVSbWdtWUd6bUhNdVRoWEZ3SzZGMTlZVVNZ?=
 =?utf-8?B?a2h3TndaTCtudnRRV0NyK3hibWtuQUZuL3BjNGMxajlnYkRodWJBWkYxMCsv?=
 =?utf-8?B?eHJHQUFpRkc0SE55V3B5Zkx5VWo1aUZVejFlRVdsRGhMM1BscUhrSTY5TU10?=
 =?utf-8?B?OExibmlJVXJnSEpTcGE3Y3RPeUVwanRPNXBEVzE4aVFVSzBnSnlvcTRjNzlW?=
 =?utf-8?B?aHYrRjg2TU5WT29HdlpJalh2K1FGYWdoL3RmaGdzb2thUVFIbWhzSXNpUHNO?=
 =?utf-8?B?SENBVG1hMktDSGVmc29yUndhN0w0SFpJNUFEcFFRbTgyUHIwYk5HSVlEWVRy?=
 =?utf-8?B?V2FKNlVIQS9mb3dzSVFzVHZXRFNzSFJlcFRaaHhqbXJmSklDK29NbVQzeENl?=
 =?utf-8?B?SXdVUnJmRDR3bnl5N2kraW9NRm9jeS9Zdlh6VWNUY3NpMG45TkhIa1YyTEVD?=
 =?utf-8?B?UjYxbkI0UGlLOXZ1OU9teWlKSXdHSEdBR0F5TDQ3Q0haUmJyYW9VMnNYb0d1?=
 =?utf-8?B?QzZQMWtza0ZMOUtrR0pjOHhQVmN1ZkVrcStDTzdOWFdEcWNvMnJzeHZSZnJP?=
 =?utf-8?B?Wlg1L0Y3a2lmRmdZTDZtS043WEErU3RHUzBSdS81azdQTmZVWFJhbDlpek9D?=
 =?utf-8?B?dHpyK3g0OEJyWGxnM2pKZHJyMkpBUkY2UXFDelluMHpRRVJlV1ErNjFSeDlR?=
 =?utf-8?B?czB6UDhWeGJ1R3laSWhzMWJGK1hsaHpsVHM1NDlUVkZ3aWU2RVBrNHkrSkNV?=
 =?utf-8?B?QlgvUG1RL3I4U1lwT1p2OWNXWUNYS0VScDFiNGVxU3V5MmVNdm54Mk1pODE2?=
 =?utf-8?B?eGd6NVZXRjJ2QXBRZXZqZDZ3V1dLOHFWRUFhSEMxVHFQVWpTVEt3MEZrc3Zn?=
 =?utf-8?B?RnpSdytERWVKNzhGVFZlUjczRklqSTN5cWlCM0RacUtuK1RFVElRTVZTbFRW?=
 =?utf-8?B?SE5LYmwzL1B0ZkRrSk5NK1dURjJmd3k4NFBVUmwvZ1lJQXlyd2tCd1NKYWZw?=
 =?utf-8?B?d3I2bGh2WGdyRzRYU0oxb3lWMm92c1A2SS9nOVJLUjI3OEJrNkZKTFM0a0NH?=
 =?utf-8?B?L1c5R0hsdW13ODQrU3ZtZng5Zno5Y0NvSENkd1AwZWtoOWtWVjBpMm94Qm9a?=
 =?utf-8?B?Z2VlbEdzZVJNWHJhS2dWeHhQSlpiQzNsZWIrWTlqdzlEbVNESnlRMDZCd3lk?=
 =?utf-8?B?SXd5OXFJV2xDdG5Db3FUYWlyQWQxSEg4QkxDS2pHT1diYkd3RHpLSTBKeTh1?=
 =?utf-8?B?bUwvcVh3L3dNL1h5U2tOQzlQbW13ZnFxZDdtOGpUd3dmMHRmNGhid1VMOVZZ?=
 =?utf-8?B?a0xXNE9IVHVSS0NWMDNPUGpTNEsvT2NoSDgyTVppbFk1U3hybU80YytYbFRW?=
 =?utf-8?B?U3NPODJYL0FxUDlPc3B1Qlk1ZkhCSk5FNXlBQzdUeGxZcnJWMzJPV1B4RXhh?=
 =?utf-8?B?VDQyK3RVQit5MGxTckFsZVVMSk95QXRRdkE3OWM1T1lKckJOcnNEK2I3VmlR?=
 =?utf-8?B?aVFieUlkRWtDWXpkeHJNelRIdkRVSmk5czVscDJMSFp0azlyNyt2YlZDNmZU?=
 =?utf-8?B?aDhhZnY5Uy9aeUxicjhMalh3Y2hNOGlUODJnYUxpd0VNWllKamd0aW5YeG9R?=
 =?utf-8?B?U0ZlMXFHeUFNVW9zaU5BU3laYytUNHFjZnRuQlNJNDBkM2dwMXEwQjFjalgy?=
 =?utf-8?B?NUIvcndXY21XellZQm9CQU41eXlSWXplRGVQMTFHNHRpenRMY2xBSjBVZFFH?=
 =?utf-8?Q?2hhqOJWVMHEdAxfGDL625hTiqZBNzNWN90ImWJflkRC72?=
X-MS-Exchange-AntiSpam-MessageData-1: VzrXODEFiDRWBQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d7b15b-1afe-4f4d-a144-08dea7477709
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 06:04:12.1556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEn4a9nvuLbkZR0O1Z5/LUohIqfx460aYh5plWrjU6lDtxaTQ8BUHFAJroOo9uzvbDiVhX6KhSMBHEN8xPwZwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584

This is the continuation of the `bitfield!` macro which started
alongside the `register!` one before being temporarily integrated into
it [1].

Thanks for all the feedback on v2; I believe this version addresses all
of it, modulo Eliot's suggestion for more explicit range error messages.
Since this is not fundamentally broken, I'd like to address this in a
follow-up change to keep the series focused on the macro extraction from
`register!`.

This version is based on today's `rust-next`, which happens to be
`7.1-rc1`. If review proves satisfying, I see several possible merge
strategies, the one with the least friction being patches 1 and 2 are
merged into the rust tree this cycle, followed by patches 3-5 via the
I/O and DRM trees during the following cycle. This path would not
require any signed tag.

[1] https://lore.kernel.org/all/20260120-register-v1-0-723a1743b557@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
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
Alexandre Courbot (4):
      rust: extract `bitfield!` macro from `register!`
      rust: io: use the `bitfield!` macro in `register!`
      gpu: nova-core: switch to kernel bitfield macro
      gpu: nova-core: remove the driver-local `bitfield!` macro

Joel Fernandes (1):
      rust: bitfield: Add KUnit tests for bitfield

 MAINTAINERS                        |   8 +
 drivers/gpu/nova-core/bitfield.rs  | 329 --------------
 drivers/gpu/nova-core/gsp/fw.rs    |  11 +-
 drivers/gpu/nova-core/nova_core.rs |   3 -
 lib/Kconfig.debug                  |  12 +
 rust/kernel/bitfield.rs            | 865 +++++++++++++++++++++++++++++++++++++
 rust/kernel/io/register.rs         | 246 +----------
 rust/kernel/lib.rs                 |   1 +
 8 files changed, 894 insertions(+), 581 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260408-bitfield-6e18254f4fdc

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

