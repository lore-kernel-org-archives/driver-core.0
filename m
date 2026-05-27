Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3184403E9A;
	Wed, 27 May 2026 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886340; cv=fail; b=S/keKDGCy7k1Cr5txKlQfsCO2iWRZ433jpE6ZJPky13Fzm1UiLRxYRJyltXylRjj+6T49Rijx6wUvTF/jIoqqZ/E+g69GdbdvagF34UsPOBzW2K2KuCco8nJIix60rWRokX3tE/DlkwnHj3uyStejsyVdPiX1eVfW5a+uSHNj/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886340; c=relaxed/simple;
	bh=Vpp6KwTE6ElBsTtAHNwNvm2tozvVtI6jDMkeJsytC30=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rlfkQEGRIkuNRwZj5Uwf+5KdSt4ALZMKmu0hWbANINaGp0rmCXz1rZIG86hGcFr4HAxqaVoC32oR8m2yUKpHAM+irwHwUSpimI22+2WUwTDSXP44NvieBACcydTCljp4D76QOk1BFesat5Sz3IgD4q+S2Mij6wa3/3cVYSw2Gq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VtftvHV3; arc=fail smtp.client-ip=40.107.209.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VtftvHV3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmDyP0q2HMq9CDomaswLM4Ou3OP8mCiDSWl7YAoXJmcADjmF2cms+skKx9/e8oCZaLevE0PNQKm+KsPScgYTtmfgjSYCNgfdni6YvtvjPHgmnDZIAjvEYEbix3kAHid9zBCXDCMLN4WlbG8QT/ol3ZuFwqYvOjwFFclSu0YuUMPdlyhUQsdsBtIQT0lLTB4XJlJ5ysdw1IvKzzdjHmNInjdDY9kLR7bx3/vG4x30+4mIk7c3MRk81Tz/udO5WqFIZ/TaPFCm5SBRASW3TZoy2+jEFQ9WIvLcuYM7TUR1Kmpe/+sufPegJPKPiEXcl+V3Yes0Q+p2TFto9SUZSjm/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1g8t0NX1jpXPWoVuBsE6i8k1uacAw4ctoYC6K5+ClT8=;
 b=ZJQWQ4gyUUOCsijs/fRjqZgEMwiFJwEsucf1Bn1xRiXheBjMd0bA4yJ2jlzIJxLyHY2r+aW5YGtnCQSPxmHpK+NmebcGJh4ON89XAIqiW0faCoZAD39ljlHGzTDZemclIOnoEV+8AqhrSxlwntlDNc3VsEoqpOsxFHr7IYqa/KLhvc9IZMwHy7UMZ7ZVi4s3QUxSUSW3iVVqzmFmWZOWT4I7nOnaGVuThgtliX97q+ekdc0VM4+LxDIXmh2l2KxyLy0AjiAODMJbVoFQfAy725vzq5olaUC8/kvNcEAaWasbIoTeUpnEcUO0qeZtzrowhijhj2U8KffX641z6T0rVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g8t0NX1jpXPWoVuBsE6i8k1uacAw4ctoYC6K5+ClT8=;
 b=VtftvHV36mYoyqih7MElyHs0Y03J8EvtCGT/3d0RdzS5LsnJPT/azP4fpD2T/id7q8gd6eG2TcxoumIorVBcGPAqX6klLV9jBlHnXvP7Fg2/0n1cjdcq6us+q7UYtsroSYePWJRz1D1SojYsgFYhu8AB1ELeKEJNtzvzzv+6HUdY0B7xF4myeEdm9M1DSsbngaimaPRoSt4TVTeEdjlP0YMRCgxCd6Is5iYkGU5jwaqtq60zq52jfpQqqVwcrzu7oUACq7yXuyDTf3TL/P5GinYzd5toZeiNjj+bqIq16PGOO34KlQIdIRay8WuhgeE4/UU2otDgcchVA+d7tGadtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 12:52:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 12:52:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 21:51:56 +0900
Subject: [PATCH v4 2/7] rust: bitfield: inline private accessors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bitfield-v4-2-e8821d4efbde@nvidia.com>
References: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>
In-Reply-To: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P301CA0116.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: feaaee51-c7a6-479e-3113-08debbeec64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|11063799006|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	kxP7De5s3Lta0DvRlgBov3DJKfzu7KezE6fQGADVgiEcsp1iPy9MiHiDW0zI69SkbebgSlctcv40QCZHqyId89T8f+HrbzRQkm2uZJZlYZKqY2VNE3P4jL7780f1PyDcKV7AImG5eIYSswYAskAJZIKsP2RVI/aRQYCD9DpXXhH4WN5ZzHL4XWw8tDiZkQ94IMdrHyFMpdbVXxvZBWlDjyExvwsJhFPR9YAvVilNOvP5dRUwD6bcmtaCSvK9KgDRstP39+Azx5Pt7vVwhHm9Ol7rB6l8E1Wj1a9zYzxTQ7k5rVRMZBkda6IrDg37ylobHYu/3hgGybGdjNLg49t3iKIBlDGeldVpG/Z1MvUx4J7BxVUNPNlE/Nvr7WUdIy31VDsULYARCUHcyJlVczLKGJZk4Vk+ch80QZPXPpyWBsRX1pGgVpK97dQ/cGCnzUksg2/fxpEcxYDJDXMpj75FgUc18GGIivZZAs/CaXGZwg+sUfqKwKoIDJCc5I75FgCXRtKCdoNLn4+rMhG28s0979QdKAPvZw7n9jIf42v3ulDhy2OCdDTl2YskbUWp0uEB/OAx49ZXA72onChURSa6D0cU8xbLA1VOjM7D2ICncupbl+DVOCDbTur3YkfQD93gJzIxpxOzEernQzEEtdA7obNSlpl1HVq/ZIro5UYCqC/o+Trq1kLFXt3ZX8a9YGvMibn4dx4XynkmCEV8/dR+GHnJe40QXMVltxvIeqrekkwP5Bfr0KlWU+KmeJomt7iv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(11063799006)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjVjeTVTOGRiK3VOM08zWktiVUUwWWE3YWx6V1pHTjZsV3YvaWVCMUV2SlBw?=
 =?utf-8?B?NXdpaHRoMXM2SkwyYmcyT2xLQmE2SllRZ2NwVDVNeUdvOFNkYUtFKzZXNG9K?=
 =?utf-8?B?M0pHKzRzMHdyeFNCaWVEalpQTUpTSGxqdTdKVUZhZzRIaW9WZklya2duelYr?=
 =?utf-8?B?MllsdEQ3YW56T2NvMk1kMzQ3N2psRzlFQm5uMitpbno0YVdRVUUxVFptalNi?=
 =?utf-8?B?a1gzOXlNS1FKaDlpeXJuQmhSS3p0RDJyZjI5azhSYlpEZERkanFFcTNuaThI?=
 =?utf-8?B?bllBM0lsclUray9GR3BHd2RNM3V1ZFhNQytUV0ZhVnF3MHVZMWtrUXJCVHRP?=
 =?utf-8?B?bmd6MlFGSnVvN0JLdVFKbW81YmpzVTFFNllrSlQ4LzZ3aHBLejhPdUxIdU4x?=
 =?utf-8?B?SGdob0FkMzRyc21wN0gzRTVjZDk2eXgxNlhkOStEN3N6U2VlWmhDQzU3bjVj?=
 =?utf-8?B?bnF5UGc1SmgvOFcrbTZybzllZjUyZnZOK1RHU3p4ZWUxdUF4K3VtTm5KdjRD?=
 =?utf-8?B?em8wZXZ3aTkvNEt6OXRJK2JiQTRBR2NJQy93bkJVbE9rcUZXN1l6elNQcEJ6?=
 =?utf-8?B?TmtXWFdlSTE2WnpIRHRTOENoeG94VEtTczhBT3JDMG56bEtxQnh6UXpkWkR1?=
 =?utf-8?B?V1lhemtjVm5qZzF0aE8yNURnZjZKbTBUWHRJcjFlbGs4c2ZYOXBHdk9Ucy9r?=
 =?utf-8?B?TTNHZXJPdjJXU2I0a2R0OVBkZmM3b3pBekNZa3VwWGxvYzN5Zmw1amFoTE4w?=
 =?utf-8?B?S1pQZmd3VzcwWGI2WmhaK2VPQlhOekp2QUkyRzB2RkpBYkt2VnBjRSsrdW9j?=
 =?utf-8?B?TzZDcjI1UkZ4MXBCUExyelFwNnhJNExWdytsSjlTWWEvMzUxTWtGaUdnY1BP?=
 =?utf-8?B?UHQ4dVVUbzRrSitYTlRKak1oZUxoQnBPU3JoNGp5Ylp0aDV1L29LaytSRXZ5?=
 =?utf-8?B?ZlFoSXgrRzZOSDNOUkJVUGJmRGZEc090U3dBMEtsMUNHVkRMS3BrdFBkclhI?=
 =?utf-8?B?bkZtdk16ZTNORDVIYVZ6WmdxUFMvaTdxNUZUNVZYWUxtMkZnTmdaUFRjbVNi?=
 =?utf-8?B?andOOUErbWtBSGpTR3EyNS9YUnh1MDFYZlhQSlBNQTFudFFpNE8wRUYrQjNN?=
 =?utf-8?B?TytpZDlmRVZXUFlpRE5OWndSOW9peHFmalFvOTgwOGNIaXpKQ2xPZDZaUWdP?=
 =?utf-8?B?VHAzcmhOTzZwNlRTYjZUclg5SE5TVUJrQ3paZEwrTUtzdlBVWEdISlh2NFh2?=
 =?utf-8?B?WU82Z2Q5MHNRYk1CVFVIU2RFSXpqczQ1NERyMy9ySGdoSmxhQkVadG51SlNW?=
 =?utf-8?B?dnlVQkp3Qi9rd1Y0eWZoRjhmcjh5SlZQa002dkFES1NaM0RlU0xONXZHR1Fs?=
 =?utf-8?B?amFVenovY0Y3ZmFKUUZSRzhIc2k3ZDVJRkVJcEVPemZ1K21wQ2MyNFRETk1Y?=
 =?utf-8?B?ZjZOenBOckhoSnZUay9INTlIcFpxbC9wdnFRVU8xYnNML3Y3SU9CRXdVdllN?=
 =?utf-8?B?dERjbjQwRXZYVklVY3ZZeVNtajVXOXNDN2pqVmg0MGVPa2FNdnlkZU9DRm1V?=
 =?utf-8?B?c1lnOWNwWmp2L3l0RmJLU3NnT09WNnFUZ05MN3d5eHJ3WUZZNmRwZ2tseFJa?=
 =?utf-8?B?Q1NKQ0VqZFJKdzR5TU5yamZIeGx4YkRDeXRTMDNhN3QwZ280VUg0cllnSTlh?=
 =?utf-8?B?N2o0YjNyYTZpaW1NM1RJdXRhRmxEMzRnQ0lNRjRyWEJTNkJ3Z3RTRkdpSVQx?=
 =?utf-8?B?M21OVDhXQmdUdFRkckFwQUQ3aWpMV25hazBGM2pvVE9YaEIxdld2SkVaTStw?=
 =?utf-8?B?RmRUQ1VKUS91bkZQcnR3RC80QkpsOTYvT042bmJiN1JYVHpHNjV2V05OcnR1?=
 =?utf-8?B?dTNOMGh4U0Z3UWZaZ21qSm5vTmk3YW1ySUgySjYwblhWWVZ2L2s0V3plSWlV?=
 =?utf-8?B?L2ZKakVMUHFpeFZlaE8xM1pWQlFDS1gyVXRubXFxdFgrUDBBNkpLU0h6T0F6?=
 =?utf-8?B?WkpSZG9lVFA1R3FLbEZtZDdaVHFwOFNFeERuQUY0RFo4MEh0blhYTkNUOVZw?=
 =?utf-8?B?cDZzRGxMd1hVUlVFdzlZUjBRbzB1djBCVWRyWTZ4NGhoeW85b1dudmVZUm9N?=
 =?utf-8?B?VXgyWnpqTGIvNkxMRExkOVpGWmZjcmowRlBNOFJneHRiMHUvLzY4Ujd4SThp?=
 =?utf-8?B?VUtORUZiZjNMeFdKUXE1bHJUTkdKeDRIVGFwZzJFSlNGSnRUY0pwL29PblB3?=
 =?utf-8?B?Qytlams1dU1yODZQcFY0NEFWdlpQY205L0ZxUmhOSnVSbktPZC9hMnFkV05j?=
 =?utf-8?B?U3JVNVU0a2EzYXowcEdvaVJLbkEzR0lrckFNM2w4a01kNk02SkxvT0VjakFq?=
 =?utf-8?Q?ErAhKtq+ASvrsaC1XwY2iMC+J7AuQO9CsQ0ZCnvt3ovna?=
X-MS-Exchange-AntiSpam-MessageData-1: nKGEvSOw0ckQPg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feaaee51-c7a6-479e-3113-08debbeec64d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:52:14.1570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfh6B24giNwq8qpHmixTnXx7YfAfNyM7nLmzOh/JFwQrzh3xev/YR6CBbq/1vl1GKSqbuqericnGdsvP+RDfug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841

All bitfield methods are inline, except these two ones. This is an
oversight, so inline them.

Reported-by: Gary Guo <gary@garyguo.net>
Closes: https://lore.kernel.org/all/DIFZRBF3LYHN.19Z6RBMECXDVM@garyguo.net/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/bitfield.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 4083e7b7a307..b3ad5fdbfb23 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -385,6 +385,7 @@ impl $name {
         );
 
         ::kernel::macros::paste!(
+        #[inline(always)]
         fn [<__ $field>](self) ->
             ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
             // Left shift to align the field's MSB with the storage MSB.
@@ -400,6 +401,7 @@ fn [<__ $field>](self) ->
             val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
         }
 
+        #[inline(always)]
         const fn [<__with_ $field>](
             mut self,
             value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,

-- 
2.54.0

