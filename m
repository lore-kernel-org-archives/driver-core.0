Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9269733509B;
	Fri, 11 Sep 2026 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136017; cv=fail; b=Rzf7i6jbbvRms71wMnpezNS67HGkhxeXSDPr7xhaYQZWxaL7n86yYvGKXgo8SZiETfkysf7V0ca/MOkcdm86PFPKRPUu3afyAjcwbAIxpFf1diKLG8nDycamahysJDIIpeng7cBeA6Voiwv7xdUdwop1pYR0GjkqXPc9gBELqs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136017; c=relaxed/simple;
	bh=ajvH/d13mv28oX8MuNnqLzbR/FjMXiLHqt+h9QkuzNM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Wb7QAS28YV1dc+jWPUR9CGrqgvHyuU3EwwC4HanGX2q143x1T4ZrbxgjVZhOLxanqqpPn+FaTzJmoSoDGC8JpRgag9cV7u2dJ4uYyQors/ll9IU3KKegyokvQ7kYMdg1T3sf0XZ56+1V/BOeRpJUMM8h0MRn88Q1yMeSWJrXNSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e42CRzRj; arc=fail smtp.client-ip=40.107.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e42CRzRj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzvG5b1O0nYXOYKHMxxfjzIy1EYFCYUjcUgP5dz+Y9W7w/LXeRV+UEU/nu8No5I997DxUBzpK+jcqpsMUbnNezakOlKDiEyHpdKfvndCQbofm96tlK8VIQg7brvzbxkQfBve1V62GHEsTnaQa0/k3e1+VnLqKZZHGL+i5B3Qezq9VyiHJzJ5j7o+YrcLtd7z2pdgTTy0EfvdFlsDaWQyV4JD5Fp187jITjqvO6TV4Zq1ry3KeoiaeEUmNebe3Q7TtiKVSmOTXO+3WzdKdIiCoMsbtkKKValHrfFGAovq4y7o9gmPKxDfZ5wMFka1JUd4sjP9IeseVpxMwaanIeDEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJGpA/VU8QwMMIao+hKP1I7a0ayBGLaaDQDt0RhdbZk=;
 b=szh4HWqp1E/Lca9mZ2y4jotwiYSEEkHq6ZlzGB+J/w7n6q+/WU6Lhr8gH4UgwQi1NdcGVqknuYfhJ0KXhpRKYZvQCZ9hTTKqBPsEJXDqTCY55dAKNdh4+vScoWBLtF0g0fYr4rckaSbG5xl3bTFPySUAvqi1zilw0341Y0dTkP1Dkf8Zll8J2SY9WInj0gilVmCnzXumd+S5DQIPTnwMYr8g1n9TS8RRDrEjDE26+9fzAFwSDGUjwTG1tES0/evsCK/0FMwUXxyU7+nAMgppL02YSZskEWTPjt/x7Fw2TMFSZoM5tUjEL3EhdcSMEnwcVinfHOXmFLUHV0a/kNifhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJGpA/VU8QwMMIao+hKP1I7a0ayBGLaaDQDt0RhdbZk=;
 b=e42CRzRjHVOXLt5NDD1sT07RBGPu/JGBDqluMOHi+fCYo54GGQ7y2aockSFm+23uhZG1ThzXWpgUGWqJ+4Dowu/EP/n7A92Muzx6HuoR4uRwaayWQtMHPbQ3Qx3+gUYDYhNNpxrmFGJ5/dZFhvT0B11NT9Quww3VPkx8T1YhjnQpbvKImopX+dPg2eZ/ouuMMmqfyrwmldHbZsiggyTDrwCZ+lFMZzi9HEooymzEd6CrYKURsjPj6G1mAp6XIm1uKBAFhL53ykOn0HXCCOWrBFd1R1mZ3aCAdGPCBv7vAVVBWlv/qJ4v8PuJP21b4X3Ix7xDaCB+6mqAb70StSkL+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 LV5PR12MB9802.namprd12.prod.outlook.com (2603:10b6:408:2f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 14:13:30 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:13:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 23:13:27 +0900
Message-Id: <DLCJS7B2P5Z4.20ZKVSEUW9H6F@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH] rust: pci: add resource_flags accessor
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-pci-resource-flags-v1-1-269f29f81de6@nvidia.com>
In-Reply-To: <20260908-pci-resource-flags-v1-1-269f29f81de6@nvidia.com>
X-ClientProxiedBy: TYCP286CA0082.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::6) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|LV5PR12MB9802:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba3e756-005c-40a0-84fd-08df100edb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|23010399003|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D78a/k+dtduHtc6iDJX2WaEnsVEzKAo4SV6Ah+4WtJoyhTgZfGUv5JRgSiXzIzuJXNCOQ6corsLvIBOUScrf2MhSurob7ZyAb+J2RF6j1zQIPaiuDp1Ginr/Vpt1BPx+AXyoAW5Q/tCfSAjFmSMifNT3UUwbwVwOH4NzvgOMtlOYzsMZ1oR3YVJRIcoHL5O2DmnwVRIXGOEAUamgagZSunEFWpLEGOA9zyiwhO3dIyq7LHDsXC0tXGdpK77C0GyUjbrgybwR1KuO7mFLYL4O48ts6TfQLW9cX1kcoFMPJHpX+YOHxwAzGME9CQEx3BiXBwuqc9a1EgfDCyXSMQLUWbJ8V1ZSc9Qwc3TTmHFPr2L2IEhwFmpDJv6TBWdMBUABAoNXWNOErQmS3BzY2LKIneWPABwSjnHxFLOVUbwgTgJw2j7udfCwOdG6tjB226mtksa8fGPAM9gXL5TVeF4kqPN2Sf1A3dgiIdKYa1GPyNUku7o5ZJMOXaYfGHMxVKvSxaUFxO4GoJl39ck06RdxKfCw9RHMJV9owLHE10rEz7jCjNgpJp2Y2H1Nz0763Kxc55L6+/9KDMal7BgIuLbdudyXVUkYieykefmhQEtLjJzThTdl+UZvletr1I1RmXLLBChslkGv7i3bsWK5CUXLsADTtsaOARUe/d7ugpEp8Ik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1Nac3pzbG5TRytuK1FOTElFRkt3bnVuSmtzVENGS1NEWWVlOVFsRWJUalk5?=
 =?utf-8?B?Qm8za0xEZzZCcksxdXBFdlFON1J5aUNhOURiZkQ3TzVkRDZtcTNrVXk3MVYy?=
 =?utf-8?B?akFsajBxeENsSHFadnZGdG1sb0pxY1RFTlFPUjM2VTlPQzFodXJBZ0NFVTJy?=
 =?utf-8?B?Nm52SWpua2JwZmE5WUYxZDVtQ0FhNjZWd3BhdWYrSWpnUVB4bU1rY3ZtN3Zy?=
 =?utf-8?B?SUpKL0FTMCtidTVWWmJBS3FWc2hCMDlPcUVua2d0Z2xQa09td294UlRrS0ZB?=
 =?utf-8?B?czE2NStRTUdpUG9HY2ZPNUFuSmxxMUM0bGlYV3hPVG1YVks2R2pCWkhTbVNP?=
 =?utf-8?B?eFJKZUs4Z255R2p5c3k2dVhpbG9nVFkybVhqUmVnNFVkZGt2MWxZa3ZMdU0w?=
 =?utf-8?B?ZmZteTBjeFZJRnhydVdIVlN5TjVFdE53WW54TktDZ2V1Q05MSERVWkRYUW1X?=
 =?utf-8?B?RmNpM00zdWhBeElXYTVyUW5lSFRIZ3prRDJvdXAvZmRSVWsvalFVMzFoZkdI?=
 =?utf-8?B?Wkx1cm82akl4YTVPQm1YbWJ1U1dGTVdHSnZFZktucERpQWJnbnVpNVBwaTVn?=
 =?utf-8?B?N0NtRWNOY3BuaUdBdzN0QzRlQ0NwTUVMaVlSRTFMdUUwRlFnWXdETnVIM1hX?=
 =?utf-8?B?UmZzc0FkbWNtRTV2blFkT213T3dlRDBvdkZBVmJhYlJNRVRlY21yUmtzb3lt?=
 =?utf-8?B?cytkNmNNUXBxOTNMeGNyOG9rODJwemFJd3FQYlJTNGtlTy9PU3NGNHUwblNy?=
 =?utf-8?B?YmtQWVZ6WHQ3Q3ovNm5FZmZyZTljVmJKbW1yYnpBOXJMWDZzYSt2TDRESkIy?=
 =?utf-8?B?L3ZHVXNOaitlcnc3QkRKazNTNERxZGNBb3Z4SWlVQ21SY0dRRHFoYkxCRzhF?=
 =?utf-8?B?eFZpNlhxYVlkRkhOMS9PbFpyZjZNcm5WdTJZWW90ckVPMHBqcnZsRVhNTnZT?=
 =?utf-8?B?RS85OE1RN3lueXlXQVBjeUtHU3k5ajQ5akFpak4xL2FYOWovcUsvL29Sdlcv?=
 =?utf-8?B?aWtHbS9zMXM3WjgxT3FNbmJ1bEw3Wjc2WWMwZlZLUmE1ZXJQd05OYmw1ZFR3?=
 =?utf-8?B?Sk9HbUloM1dYVUV2Z09qc1Vhb09qaVNiS1RRZUtKZHdCMVZ0Q2p6QXVwa2s5?=
 =?utf-8?B?K3IzS3NuaEVXWDh2OXYvQlQvc2UyL0lRNWxFQ1Q0eHZTcEZQTlVhRytXOVVN?=
 =?utf-8?B?TkVMWkJXQXpFd3pjbUJZR1lSdzhtSklMdWc5QVltYW84aXkyRDd2am8rSXVn?=
 =?utf-8?B?cTIwb296MHNtY3A4aTk2azIyS0I0UC9Ody9TalQ5MWZvaDQrRDlCWmYwWXJa?=
 =?utf-8?B?QW0zMzlQbU9XMzZMbEgvZEpqeHRtOUExMFAyTHBHeW5sZVgyZWJXWHhKOWMw?=
 =?utf-8?B?dkFYUlZXc3Q4OGIzMW1yRENvQnhPR3phZUpYQ1pKMk9VTnJBcDhub2dEdUhC?=
 =?utf-8?B?NFlUVW9VbkIvTW82ODI5cTZpc3FzNnRNQWIyTWNCNytPcmJmaktKaCt1WGtq?=
 =?utf-8?B?azJ2bXRQbEdocE0zaFZqaVM5cDZtb0taOEMycmxlekZQRmV6bitjekpvVzJK?=
 =?utf-8?B?eFhzRm1EMlRibzVEeTJibS84VEFlS3d5dnVrbGtJNnFwTTlldC85Y2V2eU5n?=
 =?utf-8?B?TjllSVpvdnM5d2RaYUxPNDk3d3RWTlVmVTE2cUpqVkhrM1VnVFgrdGZnTVl2?=
 =?utf-8?B?VEJvTDNGMU5wMmRia3NsZHdad1czc2lkb09aZklHUkY3M0x2RW1CaHpRd2tx?=
 =?utf-8?B?WDU1S2pVK1N5dkFXMUIwMWdXSFBhUExkR0tUWWpTQS9JTjR4NnVLZS9lUmFZ?=
 =?utf-8?B?TkZQSkFlQ0lodTZ0cEJtNXh3VlJPSzBqZytCRks2ZlNsVjdpZ1NtS2lzbVdw?=
 =?utf-8?B?VWNJRUlYQTVFWHZpWEJBUm4wbENhRW5wVERHR1dhTGQwWDFGMGo3YzdoVmNq?=
 =?utf-8?B?NDJEVFViSUh6dTJoY0NGS2syaU5FWFR1Y2FFSW5yenI0ZGtOTHpSWk84V3dw?=
 =?utf-8?B?aVo0WkhmUkc4a2NVL2xESEU0R0dHcTNPYk93SzBCNUEwc0l2Ylp6UVd5UHc4?=
 =?utf-8?B?c05OVTFWejg2aEQ2R2xuTnRTL2IxTW9CcUtoaTVrcU5oUjdBZUVTeHZIWGpR?=
 =?utf-8?B?aEdlT2E3ZkNMa2ZZc2N1Snd6eHU3QVhLalJTWjZtZ2haMkk1TEdFMm14SGtG?=
 =?utf-8?B?bjQ2emZtajZhZmVTaE1BdXhjQVp3dkwrLzNURm9PZ3pyaFJ5R1RsTmg3bnZv?=
 =?utf-8?B?S2FBQnAwOE4zUC95bjUvNVVQMFZ1bEF4emNKM0xEYWRiTjBUVmFFTStCZGNl?=
 =?utf-8?B?cC9pVWpzR01kc0lGVUNMcm5UTy9zSXZKUk5QTUFJUTlOTStJM2UySjhwcVFY?=
 =?utf-8?Q?HW4xSnsiMueXqSdangoWjwFqoVC/I+5UnRBhmCt/txhXq?=
X-MS-Exchange-AntiSpam-MessageData-1: J6f2Lr1+v8vSyw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba3e756-005c-40a0-84fd-08df100edb35
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:13:30.5947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cm+qUEGQUaTwSzSVbYhJgncihWcfVA3FVV42x64bDZ+aj3g8UftTpARrcwnh3MeFsqdk82N2I8zfXh+4NuA8Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9802

On Tue Sep 8, 2026 at 4:51 PM JST, Eliot Courtney wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> Add a `Device::resource_flags()` method to the PCI Rust abstraction,
> wrapping the C-side static inline `pci_resource_flags()`.
>
> The flags returned correspond to the `IORESOURCE` bitmask carried by a
> PCI BAR's `struct resource`.
>
> The immediate motivation is BAR layout discovery on NVIDIA GPUs: a
> 64-bit BAR consumes two consecutive Linux PCI resource slots (the lower
> 32 bits at index N and the upper 32 bits at index N+1, with the latter
> having no flags or size of its own).
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
> This is patch 1 of Joel's nova-core mm prerequisites series [1],
> reposted with no code changes. The rest of that series was folded into
> the PRAMIN series [2], which is now in drm-rust-next and didn't carry
> this patch. The upcoming nova-core memory management changes still need
> resource_flags().
>
> This is based on drm-rust-next.
>
> [1] https://lore.kernel.org/all/20260518180342.2387845-2-joelagnelf@nvidi=
a.com/
> [2] https://lore.kernel.org/all/20260827-pramin-split-v3-0-24b24d7afc52@n=
vidia.com/
> ---

Applied to drm-rust-next, thanks!

[1/1] rust: pci: add resource_flags accessor
      commit: 3f1e12fce16f6e88fbaab3404df33f65c8f4df87

