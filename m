Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012055.outbound.protection.outlook.com [52.101.48.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86AC39184C
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538543; cv=fail; b=N5lIB7qq0+g80FfJvHb9jVcATbs0hRNECM4Sty+us9xwpebUDd2+sPsSmojTFi4/9UZ/RY8K2DGV/RUAT8W2ti5yDo3g6Qpi9GgDIryHZu2KlBBqAN5Z11wr0tUitUSRf76jsGvAT1wilUU/2Sow8ttJSUirrWGGEoA7nEed8jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538543; c=relaxed/simple;
	bh=ZV8s19OXsEWIdype/PhYSV5TqNzstxKE9oGnOX41NBU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=XwFF/NGBamQPflugcxck4X8MXgEKhLg98yUOF8XB1ujhkcCOF/M0cneBAmWCFvQ61xJtyUU12qRWqkP9e0BoRA0400zD5LJ3EAVnhmZePLj0oORAWMmOkDrIhZ7efcF4YrocF9R6f52zgYDjcoQMvdrwZDRTST6+wDoCUdrn/Ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tXJYZGQL; arc=fail smtp.client-ip=52.101.48.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tXJYZGQL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+JScu7+fqxAC3sHtPwZk5BiunHgR44dW2fnd82HgtW49R0BBWh8Jrbr+CXolJOfQ5638tt6U70wq9WsA5Gd58Hbz0iDyjnWMXA4IAjKg7O8fxHZdKP1MEMn/RNbLjZoR0l/nbCHGGA97/or9H61lh+PN7CYFxiUGPVPZZ9ZzeTUtlPRoXw7fDfTcGnjk0ZQt/lyKqWQvr8OloLniIJtrbr2fJetKsemoYN6nLvXI4mtkOfNMGwFsHowx6HDmX43wSp/NS7T1WPnfC0UNBYdxB+gfkxhQLdmdWQzxKBNvpu1dyKR5weT5wW9yVwTm7J95SVFlZ8mIfSOjRbrc+B3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZI/wQLygpmctKI638Xg8HNoUI5xcKh7NuJo+YPnKwc=;
 b=uyq+jNwhi3vz9lWl4n8Vbeb0mBpyNWEs2LHNvGWGmxm09Gf4cJEcbyL/6GCgmtEENhnUP8i/hw2jPNRqdErZULnu5gD9gaUBbJUirPJqmi3BBiV5Bf/iPMuHNSwyJgaxmJFCh0Y4HH4tvz/fdLzjk18if3NUGrA2e766ARlZ9srms3Nso++PI8Sq0rqufB1kz+zV0QZIWSStTxazLrTlz9ViboxG5OdWj28+p4SOcqN26xSSm8kiWui8971/60wSVLUA4kR8oEuI1B/zvKbVcRTrVSZLfJiEYBkARwO4nXCzSpM9bC5MebZz4Xaz1xKX29IACSa38iggc31mIBcsdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZI/wQLygpmctKI638Xg8HNoUI5xcKh7NuJo+YPnKwc=;
 b=tXJYZGQLUt3z0+fwIWAvDL73KLB5/JmT+930LiXSB4W8ifbt97u8Wh3rcrSFjj1xNktQF7ojR3rybvwy+C9qgYxz4YaNIHoLZ/M86Jb7FK/mziKl+1+cdLUBS9jjdphYDNSjYx6sr1KnG4POT/VGQZdGR1Bvg12Lu2LDKQNaFgIgoRhQSpmxPeoIt1FewRHZDpsrJoErzX+r/Y7ZkQm0+Ff5LKHiHpBloU6H4HFVBLMa7yD/n8/re2xCGUp9FeDs2bJROiFv7w3hwSbSkae7f8E05U40HhcI7Gu26eIFhfn5pCJ3KsyO7RQUtH9te0dm8yaurQ05Vf7LkqJbwNcc2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 15:22:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 15:22:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/7] rust: dma: add from-slice constructors and use them
 in nova-core
Date: Fri, 27 Mar 2026 00:22:06 +0900
Message-Id: <20260327-b4-nova-dma-removal-v2-0-616e1d0b5cb3@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32PzW7DIBCEX8Xi3LUM/gFyyntUOazNOkEJ0C4ua
 hXl3Uucnnvb2dXON3MXmdhTFofmLpiKzz7FKtRbI5YLxjOBd1UL1amp65WEeYCYCoILCEyhjjd
 ATca4ASdtO1E/P5hW/727vp+qvvi8Jf7ZIUU+t//7FQkdjMsqDepxXafhGIt3HtslBXF6vAhMn
 1817vbCiBkzQb0Hvx0aaa2haSajevsMFChn3LvUan9kqZUebDta1RsNEhxe+XgljnRrE58r5/E
 Ld3dFZB4BAAA=
X-Change-ID: 20260321-b4-nova-dma-removal-a7e88d4a6790
To: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.0
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bb278d-153c-41cd-c505-08de8b4b7644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IJrb0Fzlo4GG5Uj+CBnSJs57EhJHn+j+iU8XSjEPPCJTebxT44yslXoupEEljPfk7eY73RJE+I4GOFxRoYj9l3h0FGyTJ3xZr34UpAA//RjBTg9qDMhVUqzVSn5YjNWOF7jxKwXPkpO4g7iAm/hGTqzllc2elFphcJUxLMa5LDfWP8do34vxBBnhyMt1/W8pTCAVP6pwpve0oVZ47a5yt5BaSuCI6iKYFTOOmeXjjZdMt89AZT91f+3rf/s8LIz0dIAnsGd/YUinPYQOw/6uJIQDxj9R/my5M8PY4kQFb52HAJi/jPLJf8asLtPYZsJXHsAvYkdjXCghiuTZPxx22wl2hZuDKVDOUydKwtK2ob7LgkvfQcMVOwdXjiysPdYLJN42JzBvcZh+H+2pzWjlYYlHnDi6udtdqXY0F4by4bM2yNzwkP84ZkCKxSFetB/WnWB7w3el56JOSYByFXRqlq5lvmBzsiiuKqu+gc24u07hgher2/AQGeyC3bTiIedCJa0sQLq7GkmXRuNCtd3lHKJff5qzk6+jpcmuC4dyvHxwtiMTlWh4pRC4xQfFZRS0gzMNT2FZTAKBctVWnl6Gg3LhipPICnv+dEa9CO1Bey+Ucr33DzyghNfb/1AZmsSSuCvmM01WLWGyfdSGDyQ8W4ztxgo55D8N9CzyL4wt4ikhqdpQXIwlnZNP5UvWtT64p/rXlbXeLIwHurnkG4oeecZ/URoH/d44SvLxvHfHDNcMtT+fhnWJXiwwXb1mO31pqS55VQN0SiiIE0F3lfJXsiyJoNohdvP1j0a2adyP5+U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU56cUUwZmVybjNPRm0rdm5GS0dzM0hGRDUyTmMwTnROMDFNa1pmVlB1YUcr?=
 =?utf-8?B?Zi9vRFZNcnRlekw5Q1pXRklIOUljWldSOE52cnE4ZjdrdnlKNGRpVHM5RFZZ?=
 =?utf-8?B?Sk5wWEZ4WjY2a0Q4a2RLalJHdmJZeUU3MzM3VXJ1TllRSjNVMkEyYTJyU2Fq?=
 =?utf-8?B?aHlkRDF4S0EvOFlSQldrMGJ5WGdjbXNsczJZREVwMk1ML3B6L0VrdHYvR0N6?=
 =?utf-8?B?WEFGMzhVRjFXU3lIYVlWTzdGMWpYa1lNbTBpMXBwK2hoMU1GcDdpcFRuT2Zp?=
 =?utf-8?B?cExqYVQwZUtFZ3Z5WWlOLzBZMjJhT29rck41bDcya2FiSWdnTTVhazBVNGcr?=
 =?utf-8?B?TlFRUlhqMVduVnNmNEtFeGZ3K1ZvZE9aWDRNUGFUVHcza1MxWEJrbzMwc3d0?=
 =?utf-8?B?akY1RnhNbXR0eXNiZ2FrcmE5cWlKV0NNM3ljNzRXSDYvZ3BKektPanNaU0hk?=
 =?utf-8?B?R2RnMDBZUTJlMkFISnVYSUozUnBCK3c3amNlM0xoUFFOSXVJbDl5c01KMUNR?=
 =?utf-8?B?NjgxdndoYVBlME5COFN4NWgwQTZwSEZsd1Z1bVZUVWJFZUlDREs5WW84TXlJ?=
 =?utf-8?B?M1VNMFFFWEgyakpiVzJnVVZRNU5weVJGVEtwWlVKeWxjOVpYbmJuSTJ5REp4?=
 =?utf-8?B?eksrL0ZYYWtHT0huZUtOalZvQU5mVTBMbitOdmRXWDg3Q290Yno5bHJMUUxP?=
 =?utf-8?B?MjFKanNya3NtcXV5YlErVVFzUU9SNkQyU1RULzZRditGN1NQd0VlOEV0YUpZ?=
 =?utf-8?B?Z0wzbjJ3NjZPNTZNSnRKUGIrc0xaYzdodGl5TjdYYUNsMlhHdlgyZURtL2ND?=
 =?utf-8?B?aFZoT1NTK2wwRnR5MG1weUlEV3VZeHFzNW45ZFhFcW1YS3BMdEtzZUFTTUtC?=
 =?utf-8?B?aUoxRjRsY1ZucDRmUWEzMkRlT29ZaklqcVVFNmJzS0VBa1ZYY2pjZEk3Q0R0?=
 =?utf-8?B?TXNDN05peTloR3JnVlp6b3VVdlBoeGZ6M3dJMXNGc24vQlZOdU45aVJmbHlY?=
 =?utf-8?B?WkcvbHZaVEZBUlJ4SUQxcDlweVRtbFk0QWgvQ3ZicTB1a1ZneDh1dkg1Zlov?=
 =?utf-8?B?SkdaNWo4TFI2TGhrTzhJK080V3R3bFJ6eUhad3djUWlVbml4L0IrbXpGakhN?=
 =?utf-8?B?NG5iUG42UTZsdWVicXJkQlBEUnRkWHRyUHNmWlZHTElhVkt2VGgzSVlGb1Fl?=
 =?utf-8?B?MS9zenYySG92RkFHUDhSQVNhay9KS2V3THM5VTkzcmFqcXhiMkh4ZkYzOGRQ?=
 =?utf-8?B?ZHJuZVdTWDl1WEpjNXAvRFlNVm1jSlFnTjdKOTRxSkxnREtxM01nMmZaWUVO?=
 =?utf-8?B?ZHBINWxKMUJHVjlkSHhNWnVhV01ONUc5UGQrNTJpRERVbnhXRVIxQ0U4c1pE?=
 =?utf-8?B?ZStnRWV1TC9jcFlIVkg5cnorbVdqc0x0cVk5NnpSNzVVRFFZdEUzbHFaaHJJ?=
 =?utf-8?B?b2NCVGp2YVBCNVc2U0xRQlVvNlFZL21oNm9yUUEyWmw5OFVucTJQeTFOVjZB?=
 =?utf-8?B?cnBvWEk4bGdiZGxiWTkrODVjTWFFWElKOCtMdGExd1ZCRTdhSWE4cnd5aHZK?=
 =?utf-8?B?Z3NQZ2gvZFVOR293c1FZZ1QxbzNGdkpaK3Y0QVpJZkxrdDViUWpxdmVJeXB6?=
 =?utf-8?B?RUFiUDE5M2cxU25ReUViNnNmZDNxZEE2d0dzZ0VGTjhHWlo0UDRoWXJxM2ND?=
 =?utf-8?B?clBCMWtzekY0TzRYd0gyZmJHSDhmQ09GMm1LQnpnV1c1UFZmVXUrd2I2dEVU?=
 =?utf-8?B?SHMrRUlNN3IzYmVVVVc0aVd6NU81Z2dDTmxQM0tUSEwrS1pycDBGbWNsWDR0?=
 =?utf-8?B?bGRwZFdSK0FjVkFPMFJKNENBTm5LMFlDOG5nalRVUDF4WXhmTWZDalowRk90?=
 =?utf-8?B?Tk9BUXZETmFPQ3lYR2Rld3VBTDlwKzRNYjgwMWFYajBqeDM5N3N2QmJGQ2R3?=
 =?utf-8?B?c09jU3ZRYlV3Q05HOUVIYU55STZCV1l2UXZMUWJJelE1Zjc5dk9FUWgrNXl1?=
 =?utf-8?B?THdBWlJ2bkNwR0MxQTRZM255bGNJQ2VWZXBIbkFHeWt4TVRRWHRqeXNDZ3Ev?=
 =?utf-8?B?MnBtVTVWanhCU0cxTnIxWUZoODBtc291UWc0QW1GYXBRaHA2V3htN3V6RTJF?=
 =?utf-8?B?RjNLd1ZiZzN2TTdCeFhJSUViN2haNDJ4YVZyWXF2R0RKRzhYQjNuL3g5M2Y1?=
 =?utf-8?B?OGNuN0Erd3NVMzJhRC9pdVBsKzRuVm9GTUpjbWttdXB4ajJlVm16N1dhU2Rv?=
 =?utf-8?B?M0xNNzhteXplUWM3dTNLaHZaNmlNalYxc2xVZlNqeUpkOUFMOTE0dVV6SU9a?=
 =?utf-8?B?TXpmNU5ERDlwSTQzVFNQZTg4bHRwa1o3TjlRQWkwaXprdTFKVzdwcE9jcFJI?=
 =?utf-8?Q?86zNudxO7zfB0AazO7zoUJr3Qok8Yi732P1tuMxVJLjJO?=
X-MS-Exchange-AntiSpam-MessageData-1: 6ex0Om6mELWNCg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bb278d-153c-41cd-c505-08de8b4b7644
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:22:15.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 052oN2kjBW4OBelxJH5kUyXD3ZMkiFpFssxpOgUxqdC7FXBWiMD3sLHLGTDBTOH6DpvFTBXTMCCu7yBbpHcOqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

nova-core's `DmaObject` type has been created to serve the same purpose
as `dma::Coherent`, with the addition of a handy constructor to create
an object from a slice of bytes, but without the flexibility of
`dma::Coherent` since `DmaObject` is limited to slices of bytes.

This series adds new constructors to `Coherent` and `CoherentBox` to
cover this (arguably common) use-case, and updates the nova-core code to
use them. This results in more consistent code overall, and allows us to
retire `DmaObject` and nova-core's `dma` module.

Based on drm-rust-next, with [1] as extra dependency.

[1] https://lore.kernel.org/all/20260321172749.592387-2-dakr@kernel.org/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Don't use `map` in `CoherentBox::from_slice_with_attrs`.
- Make `Coherent::from_slice_with_attrs` inline.
- Use `CoherentHandle` for the sysmem flush memory page as it doesn't
  need to be accessed by the CPU.
- Link to v1: https://patch.msgid.link/20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com

---
Alexandre Courbot (7):
      rust: dma: add from-slice constructors for Coherent and CoherentBox
      gpu: nova-core: firmware: riscv: use dma::Coherent
      gpu: nova-core: firmware: fwsec: use dma::Coherent
      gpu: nova-core: falcon: use dma::Coherent
      gpu: nova-core: fb: use dma::CoherentHandle
      gpu: nova-core: firmware: gsp: use dma::Coherent for signatures
      gpu: nova-core: firmware: gsp: use dma::Coherent for level0 table

 drivers/gpu/nova-core/dma.rs                       |  53 ----------
 drivers/gpu/nova-core/falcon.rs                    |   6 +-
 drivers/gpu/nova-core/fb.rs                        |   6 +-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   6 +-
 drivers/gpu/nova-core/firmware/gsp.rs              |  27 +++---
 drivers/gpu/nova-core/firmware/riscv.rs            |   6 +-
 drivers/gpu/nova-core/nova_core.rs                 |   1 -
 rust/kernel/dma.rs                                 | 107 +++++++++++++++++++++
 8 files changed, 134 insertions(+), 78 deletions(-)
---
base-commit: 1998e6be8239cd37817e05bdc21439de17b904df
change-id: 20260321-b4-nova-dma-removal-a7e88d4a6790
prerequisite-message-id: 20260321172749.592387-1-dakr@kernel.org
prerequisite-patch-id: ad10dfe64c9aedc9c68cba2c66101cd78d2d7345
prerequisite-patch-id: 110ca2f40bf7599083845eab43861331fe94faad

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

