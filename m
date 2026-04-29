Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013052.outbound.protection.outlook.com [40.93.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0683EFD31
	for <driver-core@lists.linux.dev>; Wed, 29 Apr 2026 11:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461759; cv=fail; b=Dkfif3qxTsxvverNV/lGukd7owv0Zk5G7vFhA/lBG5zNjw7alve4Ovin90MFKuZy9otDG8dE3BErQdjCpBFtIHImyJZ8cDYwJNezzIq7kBITrYA2Z1c5J8CYIBh1JburIf7tUsL2/FezohRUQNvPYdp18GrvVwha7w6evppHldM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461759; c=relaxed/simple;
	bh=+PAw6LHE20srM9SpQFU/3Pjx7qE44EPueOPWUkvzVP8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=h8//ecDDcUeNUhYk5exkxAs498KSCM5wV+/jXa/KOaHLhifOT+WrT+1Ng49wM//m7aHxjXROmTi+uCJtmT634TUJtTnX7EfzDqPjuJk45x62EC/slALA6PQMCUQjqFovMULce0gK0rTzQDPX6G1XVzmMCT8H+Zi3wya7dkIqYTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nyDQZ02V; arc=fail smtp.client-ip=40.93.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nyDQZ02V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qx2l+jZVPvLJobwUxFJyTVeIIZ883cBRSa9tai9DBrooUu+Tev82PJqk8khSHPtCpVkkhO+XdroTZoCxWXoFuxLPNfOznZD3kp1B+GvMmELWKU4UkomUFJ0HSFqyC59vHNRcVU6tyzB6xRX4nZTSAzSR4Jf/+yM0sWqj+tIrdhhsGdTZiuFyjjbgRf0Low3rmOdjTATZtK7gd8Ejm+TmO0ceVZRANr9WvUEFwYf2DpSofVBU9Y+EMz74W1bBsQTegh1ygD4FDgBsgRcZrmo98ej93e9cwjS3ZucKkNroSQy38nJY4IBZmCotIiEJVN9la33fkwKCOGmL1BlKfDp6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PAw6LHE20srM9SpQFU/3Pjx7qE44EPueOPWUkvzVP8=;
 b=Nxkic8OeuT8YcxebPvbeECCwS2M3hbCzKWHHlXThszDBFl4fqXCuAdU32jbqc050Wg3z4N0Voh7Dr8P5LTMuDjt1IIv+sDro8aENjBCvWK2dhQY5NFa59bl9k7ammBhXCAyx+CI9Sfc9z++im/PirLN8bCl+0fLwTo4wMdR8ciCpL2l9Nb0PwS14zpZeX/hqyxZqCcuY4yn3qGYHotk1qeVhnJJg0jvtYdc+rfpEf9OESWkhGBHFOAgY1iRKM/o8LsfZWYGGL04Cr37ikHztxgTd5KvI/dXBZs5pp7s5Q+y4d6wytcyqba7YLR6mVMH0/SWTjrGUv+8Q5GDGi6jxkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PAw6LHE20srM9SpQFU/3Pjx7qE44EPueOPWUkvzVP8=;
 b=nyDQZ02VIDhktXlzV2l7G16eiVqoCaycKDC39iJ15Q1gnINRh7URVt/44csoh0gPM9Mw7O/teuw13RgS2lXjbtvPAeie5ZONc+qzN0YDM5u76dB3UV4BK2T97U8bNGUwyRCRmNtClJc82PogKZZdZryhymJ0NaWoXoFdCFtM0TOIQLV2xMwckxkR8V8iw8pYI7pOkkppNaUjPHIJ9+8EM8TgPus2Ju6F699NSCVG9pxb1SLU2MW64fIYjSeywTtt9MxokuS0WvLLLwaUow4hgEVMvjxvZGURfhCYu+T1CQsK8yMEDsfH/RpVjSRUaR/VOmOL63cUt/Md1sIhHt4uIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8695.namprd12.prod.outlook.com (2603:10b6:208:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 11:22:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Wed, 29 Apr 2026
 11:22:30 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 20:22:25 +0900
Message-Id: <DI5LLPFM8MQB.1SBPWGWK68MI2@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] rust: dma: update to keyworded index projection
 syntax
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net> <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
In-Reply-To: <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
X-ClientProxiedBy: TYCP286CA0254.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 78797201-5e4d-45d6-949a-08dea5e199d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|10070799003|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yx3pnqJeWF1fIl/M10PUG1DhoWhzkMUk4C9TQGqUjCmNSfL+mS282/rObXtUR0npRANI27Wi3eV0w/UDV2awTZUoIE1W04TE8fvpunJ6W1XO0uC0sRaGI6TFcRenr+VDBWVppiFQiy/DiM084ooZz0XmgnGAXpUik16FKFH8zyx/hHVlLVgYxTT0zQaSfKl8dY6D8FNW0gExQdV8ehdOGh9TJpvxwY2D2N5tX8Pr2AMn8wQQTBQ+7abIRy6D3C4NDyJRFaLmlQU0rjhnPXJ+jBgEd3dwcjkXdrRIszvpFxVqqAO3BCkJf9SbSo08zcN1AKcsUBy0vECGE/lexXH+lAZhCvIl3vxSmLppbQzx5742MstuCw3kMVx7vXl7KA0V5cV4Vfzwq59K6Rx5jpsIGJ3IWU+3yKxqZS8fEBEospf/T2fAlA19MRBvkM3yLp38UMKcMyV6q+Wym25WQ2MWuNhk2N3uoq+FGquynImgEx7lLw1fZG54My0uwMiYVt89lggaluvmh7Eq6rLbMrpYSzAFAcz5JRHNkZtdn8rYnfBpm918pvFp14wYjGUm3m2uw6n5lWcSrkZdSjsCRcC/TRZT8S+wCw9yqMZEy1ocde550NmCVECmN9FgVOjEE7Se/ibFtI/ACzN21cBXf9ei0dBXtk/Rv4+b+YUV2JIVBIoZKfEPhCs7kXQew0PtPblZ6A4BkCIteyyvhQwhxtycMLD+ylSkdEJibJymX5adkfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(10070799003)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkY5UWJ5cGhBQXBzSnhnSUtWaHU1Nmx6U1NQVldySEttNkRkazRrTEpyelpa?=
 =?utf-8?B?K2M4cEV0Z1FOVGtTVE1nTEFNNXlKUjBlY2tYSURvdnpUOHVBdGhrY3htQUxQ?=
 =?utf-8?B?TXluTjVYbjl2OXc0MkZiYzA1MDJSelZhN3BCb1hOTG5PSGVrY3dhaXgvRzJj?=
 =?utf-8?B?cWtiWDE5TzJ5eUNMbDdrOUgxaUlzdW9uVWlsZy9MczVyNTN3d2F3UnNIT0NE?=
 =?utf-8?B?VThya3UyQ25jS05pM3hySVBrT1VtcGhaWis4VUZwd2pEVFZvaC9TYm5xNHZ1?=
 =?utf-8?B?ZW1XdHE2K21sK0lCZDlVWHYxTE1TNTRRMmIwRjRPd0ljM3RNOWg2eG5GbjdN?=
 =?utf-8?B?VXBnU3A0NjFuWmpnNmpFaGNicHpSWUpFbTBQYkpuZ1F1L2FsbUJnQWVjd01h?=
 =?utf-8?B?UEJVZTVLTVpYdEx4a1RCOWFGRUJyZVhQRVZvdXdVNExMTTg0djFYc2J0cWVt?=
 =?utf-8?B?QTkycUpCV3p4dXNBcm94MFBydUp3ZHEyQm1BbGY4eU10empvcG51T1RpTTVx?=
 =?utf-8?B?OUNWWkpmYXJyOEVVQlM5SjVyTXFqZ2Zud09HeStLNGF0NnM3bHFwcExWSWx6?=
 =?utf-8?B?RmhjRzhiOStWdjR4VW9rdC9zbjYzby9OSmxYZCtBVzV3UlloZEhrZFhvVXlT?=
 =?utf-8?B?NUxxa25rcWFCUzNkOGZGeW1NRjBuOUNGQnNzTVU0MzYrT3F4R0Y4cUR1YURr?=
 =?utf-8?B?bWY4WmFUWWFJcFZSaWp6Yk5pL0R2NlJhNEVIeEsyU1ltUXQ4S3h2aVJKQVJG?=
 =?utf-8?B?RkdZQlpzOEZZZi9JVTF6eTlRV0tLZnNMbkE2NXBhckQvK3dWaDMxd2V3Vmt6?=
 =?utf-8?B?N1pkK1EreHV4elhOZU1CSS94TVQwK3FVNytSLzVUcWZBQ1FoMnBkL1pzTGFl?=
 =?utf-8?B?U3piRXhyUzRGTDlwZ2RndC9BRStrb21qRHdoZ3lCclFxQmVKb1lNUDBBQ2Nn?=
 =?utf-8?B?SEZOR2ZyNHlSUWxtZXo5Ri9GVGtzMWF4VHZBMU1ndWdNZ1d1MStqQXZrZWZn?=
 =?utf-8?B?Y01RS0NDSkorUm5uTFQ5aTB1TUEwSS9sbWJ6R0R3alF5S2hlN1BadTRxK0c4?=
 =?utf-8?B?V0FVWGJXR0R3VXJKR0k5ekZEdUpwL3Q1a1hjbi9tR0lVdkZ3TGZtcGtBeHkz?=
 =?utf-8?B?UWlkL25xWnFac2pNcmJRMVNtRVp5UTE5eElqM3JzaXVBbXBIYnNNNDFmMTN2?=
 =?utf-8?B?OEdOamNxZ2lUblRiWEFoVlhwVlBGanZXTyswTzVjUjlvZERrMElBQmltZUpY?=
 =?utf-8?B?VDJTSUdORmF2QW5yU3FkeVdwRFE5d2NTbk0yU3JKVFpLMWRJUWkzQVZiRERq?=
 =?utf-8?B?WnduNXhHSDNKMGhhREFxdnEwZ1Z5OUFxQVlkYTJVN3U4VFd6TERFYXNHSlN2?=
 =?utf-8?B?d2gzaWFHRkFJL1ppT01WdXQ5MU40akNYVXRjUmRjbVRlQ3J6ZC9Kd1J4SUkz?=
 =?utf-8?B?Q2pkeUdXNVVyM2ROREdySUJabk1rakZHSmIyMEhIWWhnRXh3Mm1XRWU2aFUv?=
 =?utf-8?B?K29yU1ZFQ0loeDhnV3FOYU9qSVlIcHRrYTRWd3BEbXpGRE0vNmZyMzdPUStH?=
 =?utf-8?B?TStWbW02eVo0TFlzcEtlVWQxKzI4cUVCdXZWQ3lFdVJDT2d6aTdKbjA2RlA3?=
 =?utf-8?B?a2E4M0JreUk5RXlhSW9YMit0aDNjVWR0eUcrMFJpZnRiZmdHYzUwb2RTRmxj?=
 =?utf-8?B?VVJhRGl0ZU1WRDZtcFZGcFd2SlhsWVhNeldtZHVMZEdZUzltenVFTEphUWxV?=
 =?utf-8?B?NGJhZDE4M3Q2U3lEZ0NwTi85WE1DUU5MV0E1U1JXSVlUbUc4TXQ5cHZEQXhI?=
 =?utf-8?B?cVR0YXdkUll4cFNGWEVYSkNjQXl4dEVPY2tJaXU5L1RBeFp5VE9LWjdJV0Q5?=
 =?utf-8?B?WVFhTERFcmxISlIrTXEyRitTeFNEQ2lrWUpnTWJ4b3ZxUU4vRFNkRXBITWtl?=
 =?utf-8?B?QjFzZU9VOGNQMXlEQ2lyeTRYNHRhQ1FOTW9JNWJWWGtwaGdjejBHZ0lHdHpM?=
 =?utf-8?B?R3VLcGMwZ2lnSzVvNDFJNmZBRTVGZUMxTkY2WXgwenVnK0c0SjZRTTRUVUZ3?=
 =?utf-8?B?TjNVeFg4WER2dWI3M05PNEQ3MWdDd1ZSV3hYWnphZDMzSDByTzd0dEQ4M2Ix?=
 =?utf-8?B?UWRrWVVxbDlDV3luWGVGRVFxVjErUUU0YXIxSGhrS3hXT294eThlYWRtYXVn?=
 =?utf-8?B?cGFzcitQalpUejA5Q2NMaVgrcy9HSEwzTlpZcnhEQVU3bWpLTlhxRVg5ZFpa?=
 =?utf-8?B?Skg4WmsyaFEyd2x3L1QzV2ZwYnh4UlBOSzMrcTVleklyVXVWVFBRUHllNzFH?=
 =?utf-8?B?d0tNMzVZaXAxc3RoTmZwb2VXT1N0cDl2QVh2Q2FlK0lNTWhMaHZKellJb1Vu?=
 =?utf-8?Q?10fPDbXRXMkEm7BMPTbXsi+DfOaKi40wASqZOV/6YobyS?=
X-MS-Exchange-AntiSpam-MessageData-1: 6+DkqhOIPhdYGw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78797201-5e4d-45d6-949a-08dea5e199d7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 11:22:30.1736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IccTepZjKWqD8msn1ZeuSv/05RhAavFLjyl3EmI/dN/yld8/3eA/6fQf7en9wFTYRUdzsMWCtxqWmJFSyjTDLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8695

On Thu Apr 16, 2026 at 4:57 AM JST, Gary Guo wrote:
> Demonstrate the preferred syntax of index projection in DMA documentation
> and examples. A few `[i]?` cases are converted to demonstrate the new
> variant.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
