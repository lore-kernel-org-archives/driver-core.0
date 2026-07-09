Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010044.outbound.protection.outlook.com [40.93.198.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D893038F253;
	Thu,  9 Jul 2026 03:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783568618; cv=fail; b=V0ObrjiZQZVaRRbokG4P8VvxhTTZdCfUXrP49QsDU0xu3mqCrAJoTkO6QT1WENRtkphQqU8DtURHgeHBmZYwHuUb7VDzJNcSsSrSG9o2AOh7J+VwEW/j2OeiPMTIH5EYkceu3phG/xonWSApzIzpKKuWaJEcSShiHTIXwIQgynU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783568618; c=relaxed/simple;
	bh=xEl7rhN63JAR2vNz9SxqcCwQIAySrOGiCxWqKemh3fc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=QzGl2XtsYF6ibeJr7pdDFLW77sebZZJstAxbeGFFmwbkjjVdOAqbH/lILfFfZhfrrp/uA3D1DVMh0iljuuyTAJtTN9pXHqldUKjk6gVZEDYikmj+qj/RuM9Rx6LBt7RgVrYlXiKVtzpOTGVn/Sjo8LP+n6vFltRvTbSKTL9yw38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kTol4Sjn; arc=fail smtp.client-ip=40.93.198.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kTol4Sjn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUK4MsD44RU3W0cUOsxpBLEAzaGjVxANEKBD1gUHCffvVL4aSzdZW6bjT0YoOJP7SsikW3Ra/t9s9yhaHiBSa0Airji/7D3CXDfRgCxuAcseh9ghSFZ39mGrwI0d8U4Pdf/dotfSYHxaSuToA1lrtwfWlHXPUkX/CoCRcfglbuQfk1UHmF4IEmjhBhqGoraTpBfxbX9niTtbTh1Hl6uWDTGrHLEYoZMBLsEdSzoXzdXV9kCZ9Yrde03xCThdZKQJbP1wyOJWEWQrlLkxxl7Tf1F5nuJrlpF8QzbbcG2HFPYnD0W6kJuTQJ6yalUFNW2fdoFXmyiIyjPIQnUQuGitiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K99Ah/265f2JFakXmIB6UtG2Xjs4dOLZ1yFTmWRJeqA=;
 b=xF1+xVbuFvWC8posQsh79vW34fACGzywJZX/uUJb9W6wmuSydOxUgZU5gfAKawEubOHovGRZs1h7o83JKvcVe8gd6SUtJdpJpdsSLuyM957umb5EK3DbFuDIHYz1TgZPOBmt6m2WHDa1M7DWcnPZFAxub4zZBatKYVTavsdkbn3XZqHhftCLaYEUTZFGnfwUF3wD6pqg6uXHfAwb3ec15aGhgCmukYr4C84kt6HuxAuEEcIJ/tZb3DMm25uParXNPXzduywQEwJsk/GA3VTq9pH1RYjx1dRflnPIgKTQ0fwf+fJyFN5tnBZLrfU+EyGWeZeNVnFU/1GSkJbDcUjtWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K99Ah/265f2JFakXmIB6UtG2Xjs4dOLZ1yFTmWRJeqA=;
 b=kTol4Sjn+3nwa5OF8IpMIeHqF1g2t36rnL8icSKhw0skF/9pFzchk/JnKN4wZhw2y0/J+RTEvAv6RyxWFyowUtKpaZ+O+uJ6YMTUK6bDkqhpHzn5JI/BgbBEZTdBa8B0rAGoWI6RDK0lUQ0Ny+erDyEthdervI2w9pC0gebbNH9xdGuQb9kvQ1NibV0ZPpbOPIGMYRc/9nFQ0hf/7F2jsYx9AMYPkDI9ufq0XcPPSa3i0jLPgN9IuBiUyZGlpm5fg25gKDNkuYyD+tWBMVi4OWC+B4Qb/dZcnUY1Hzgl3lYfKklH2gd6C9uOYE/nQcmALNyMsZBhhmKd15kkzAGRmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6018.namprd12.prod.outlook.com (2603:10b6:208:3d6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 03:43:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 03:43:32 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 12:43:28 +0900
Message-Id: <DJTQAZCXYPN7.3Q0B4NH8EA8BO@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "Zhi Wang"
 <zhiw@nvidia.com>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "driver-core@lists.linux.dev"
 <driver-core@lists.linux.dev>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "russ.weight@linux.dev" <russ.weight@linux.dev>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware
 files
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-3-ttabi@nvidia.com>
 <3e771bfc6b0c89afc7969755e340a5fa863bc7cc.camel@nvidia.com>
 <DJR9ZP56YXX9.P8U6V298X5RW@nvidia.com>
 <09d1fd87272e7c7dee79d1e0841f49de76ccd82b.camel@nvidia.com>
 <DJS2YR1BBMPC.2X5MMLHOM0LL7@nvidia.com>
 <e913d3a53361cd6b8b076f43d038cfd029cda473.camel@nvidia.com>
In-Reply-To: <e913d3a53361cd6b8b076f43d038cfd029cda473.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7d4019-66c9-4c3f-ad35-08dedd6c3f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|376014|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	uGhXYGQIm0acCPEO5torfON5JPbG1RdtyKDAjvobTfL7/zZpljPkqtpK95Gb1qB5erbbqouUhEcOBIRosgKDF0EmdsgW/H+yJsfuVAJOKqz4u96eW1h8DejZpzCrmt3+q05yUNWyHzieNy08bVLefRIn2lnVJ3dlK3MULI6lPspCEjbYgRrsdgSf00q7x+2KXbCYHTpk6pD3dqBw5hEhElp+nIMF8kEa4ox6oOGQ1Aj7Sb5zSiQg7T7PHsDao6r4M7V0XvUS1JLT12sMuxJFUZbMvPQBPAhA1ezWNkhUtNI04ZSRCtF+RMlBoa39OEcigUWlLVocf1o9Q0JCTO9KpvHLKdI5CuapZzCZB843W2trHy0VecPmkke9OydVV4l4I5vjnO8mqptQb7GVwa70LfIagAjb4jNDGZegLHKV2VCT5FLOWiPPYK4gmM+xTRJPJj5OH/ad88Hnu6UkDyB+plCzmjXQHzL8EjB6x348XfWhr7MY8mrctdD/cMH1H4NKHW4ePk36MTchnLwL5lOlY13ebdfcVtnhg0Qfgo7JOVjSA5G7tXxfUBBI3GBkjuYVUEDoXGVtT2k1ah7JOHykX2kF4Q+/Ws0MpRbYSjUrfFqmjFJX+n8yg/vfaKUvh7RefiYvXpMyL0NkXaHPYzfyfYbHhtQj/PVxK9uzvoNBbhE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWp1KzA3WXZQZHpnZlV1Q25EeE1LRmZ5N1o0U2JESnVwNzZkODdkZDlDQjRp?=
 =?utf-8?B?djdmOFFlNXd2OXJDdk0xZUszNUtuUnBpdDVtZDlTWFdjOGZRQ0RDVzZwZDd0?=
 =?utf-8?B?ZmozamlweUwwd3lUY1hiRFg3SFN5R1hDdllYb3laQmxCbHVjV2xrdWg2bVAw?=
 =?utf-8?B?NGVKUWNhZ043V0EvTFJPdjdkTFVodGY5cU5sbTN6ZHdidkRPSTJqVUZJWE1S?=
 =?utf-8?B?aWhDdDVWdGNabW9UdUt4KzBwdCtwU0VhSWQranRpVHduaU15UlJEellQcGFB?=
 =?utf-8?B?VGlKdTIxUlpTUVk2WVBQMFJyVC9hdlk2K0Znb3RBMkVmSDJpU3hQSnpXTnVX?=
 =?utf-8?B?R3FUa2Z3Y2JjSWNpQ0NmcXNKY3RlYnlqek40ZnR0SU5BQjNlRGdYNTRoaDRi?=
 =?utf-8?B?NmZXWlZ1aG1DSm92bHBTN25PZnY5LzdCVFd2ckwvOStoSGxHZnNobEkvaEJU?=
 =?utf-8?B?Z0Q1V2FEYW1ldEZaeVd4VDZEd01HQUtwZGFPcXZEUkZCKzh5Ny9jam1FSjAz?=
 =?utf-8?B?cjZrZDJBcWlJZzZ6dHhXaVZhVTcwUnV4MTY1QnBEa0dSVE1Ea0hZQ25PanVQ?=
 =?utf-8?B?TElNQldLOGw5SDIyZ2hZanNSZHc0d2Z3NE1pWU1PWTl2aUFBNHZFbHRKYkNv?=
 =?utf-8?B?TTBtVlQwYzIrTXlHU3VkT0wzT1puVDA3WEM5TC9aUTBJalI5QTBrOHF0QUVP?=
 =?utf-8?B?U3lNcFBSRW5FelZ2bE92RmN4eERhUHQra2FSR0h2d0t5S1BManE5SlA4N29C?=
 =?utf-8?B?VFY1Z3RWclZZVURIQ2xIaDZtSUpsdUtGcWlybkhYbHVsQS8zb2c1NTRnTmxi?=
 =?utf-8?B?YjVsT05QbUxNd1pDd3FzMC9RSDNVemNnaW0ybFBsdVMwbHZtaU9KQXJ4MWpv?=
 =?utf-8?B?Wm9aamwyVFE4U1NuYXJ6cncvaTd2VHZYelNrYzEwQU43WkhqY0hWTm9PYlh2?=
 =?utf-8?B?a1lBZVJGUzFlYWpKanZ1RDhXdW5WUXE4RHc1YVRnUDdPNFBWUVl5eHVBbU5q?=
 =?utf-8?B?aUxCZUVsV2pmaWs5WFRRU1lkZEVqQWovWVdFM1VDNWhBUXk2ZnE1OXJkNnlZ?=
 =?utf-8?B?cFM2V3ZxOHNRNlhOOCtIRVc1YVQzdTl0MlRpRmc0Mnd4Sm9rOXZUMnZYWVNn?=
 =?utf-8?B?disxMG9EZGRSa3ZZemdaRXFhV0hKN29hRGJLWnNUdnVYODBjR0NsdHZXaWtQ?=
 =?utf-8?B?ckNyS0FPYlM5Yi9LMjVWcCtVZnE3bGU2WTFQRE9NMVRVdGcwYWhQV0dmRGc3?=
 =?utf-8?B?MHh3eHA2UjB6MkMzSlp0Y2g2QWlvY2xnOWw3QzFOaHRKQ293TVR1TWJVZi9q?=
 =?utf-8?B?US9icE9odkhxN1FKdHlMY2tUWXBrQmpaa0pQUHFrWlRJQWMzaXlKaWFYeURR?=
 =?utf-8?B?enZoTGxBdkVNbDU0aGM1L3RJTFMzbksySkhUOGg5c1RMUGdTRm45N2FyTFlj?=
 =?utf-8?B?MGVBdmFjWDVrYVBtWjI4NklLV0tiK1grN2tjVmVEZ0R1cWI1Q3BNdFcyUW0w?=
 =?utf-8?B?VmgybmNFSHVoNk5IYWhqdzZBTCtpN3RyU1RJK3Q1VXpuaHJqKzUwKzlhTk90?=
 =?utf-8?B?cDNxazdoRDREZjZwU2xvUmJwanhxL0loWk1Ra0xGWFJBNkZTRDlYdFIxQ1Qv?=
 =?utf-8?B?UldWV1d1bnU3c2ZlU3A1ZU11K25rOHNFZW9tOFprMCthbHFPUU40VUJ6MHhW?=
 =?utf-8?B?VEdQRXRzQzBpYUw0em96VHFYa2gxc1NDRklqTS9vRmpyY3NmZFlEU2p1bE8y?=
 =?utf-8?B?dWNvdGtyRktsNjJxYlUyUjNFdGpHMHR5SzNCRkYyNkJ3Z3FrS2dMUTFqckc4?=
 =?utf-8?B?K1BEOSs5am8rZGFPTHRGK2FyUXJKRkpPMFZNZDBGa3pWelN6Tk1Jckc1enVr?=
 =?utf-8?B?OVJFQWk2YVNUeVJXZ3dTSEY3UHZjcUcyUGNDODJDQjdhT1FOUWJXb1N0YzBR?=
 =?utf-8?B?YThNZmhSRXNwbUpUVFpSU2FwNGlhUW9hVC96cE5TTWJLTHN4dUJXZmZvVUo5?=
 =?utf-8?B?bHBlY3dCVkxuQVE5RDVMU1BncDJhZldyNlVRQmdCRkUrYnJ1V1R5VzFYWkVX?=
 =?utf-8?B?NGdDV2VwNE4wYWpweTJlNS9VeUhGaU0ybHFzVDRQUFhkaUFJczY0aDVMMFNK?=
 =?utf-8?B?QjlscnJlSlQvcXh0Wm5DclpBN1IvSWgrZ29UL2k1dFM1cVdxd0JsRkovMnlu?=
 =?utf-8?B?UjdSTXFyaGtxalEwdmdzanFtbHZTV01JTjBBSUQ4UTNhUGozQXpvWDVrTnlr?=
 =?utf-8?B?V0JNN3JPN09DR1B3Nms5VEVLckxnS2tmMDkvNkhYSSs4THUrUngvYUpNT2I0?=
 =?utf-8?B?Vk5aNWRDVmE1TVJ1cHFUZUhENkhkejUrR1BjaTlVSHhoMjY5L0VwYnJyVFB6?=
 =?utf-8?Q?Ucc8flt+7nyqNWl6AH7pxPOQ5V4+hUvuGpXJLHpIwX7tV?=
X-MS-Exchange-AntiSpam-MessageData-1: gdmXN4rTX6yceQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7d4019-66c9-4c3f-ad35-08dedd6c3f3a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:43:32.7523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bHi/ZaPsm9iH04K/zqui8G0IfK0lhCwQhv+3B4UPsQBA/I8g+Swlmxld984zITnucJL8/vzMoSrpwNwSJEmDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6018

On Thu Jul 9, 2026 at 7:48 AM JST, Timur Tabi wrote:
> On Tue, 2026-07-07 at 14:13 +0900, Alexandre Courbot wrote:
>> > Returning error on length=3D=3D0 simplifies a lot of code on the calle=
r side.
>>=20
>> Can you give an example of such a simplification? I'm fine if there is a
>> benefit to doing so, but would like to understand what we gain.
>
> Well, maybe not "a lot" of code, but in general, it eliminates the need t=
o test for empty slices
> every time. =C2=A0If get_bytes() returns success, you know that you actua=
lly do have some bytes.
>
> For example:
>
>         let sig_bytes =3D self.get_bytes(b"SIGN")?;
>
>         // Ensure that sig_bytes can be divided evenly into chunks.
>         if sig_bytes.len() % num_sigs !=3D 0 {
>             return Err(EINVAL);
>         }
>
>         // num_sigs cannot be 0, and sig_bytes cannot be empty, so this c=
annot panic.
>         let sig_size =3D sig_bytes.len() / num_sigs;
>
> sig_bytes.len() cannot be 0, so we know that sig_size cannot be 0, and th=
erefore
>
>         sig_bytes.chunks_exact(sig_size).nth(index).ok_or(EINVAL)
>
> chunks_exact() cannot fail.

Basically we want a guarantee that `sig_size` is not zero. I'd prefer if
we could enforce that using the type system rather than relying on a
guarantee that `get_bytes` doesn't return an empty slice, because even
that guarantee alone is not enough - we also need `num_sigs > 0` and
`sig_bytes.len() % num_sigs =3D=3D 0` for that.

All these conditions are spread around in the code, so I think it is a
good opportunity to gather them together, and use `NonZero` to hold the
guarantee we want.

Something like this:

    let num_sigs =3D usize::from_safe_cast(tlv.get_u32(b"NSIG")?);

    // Size of one signature - Booter is always signed
    let sig_size =3D if (1..=3D15).contains(&num_sigs) && sig_bytes.len() %=
 num_sigs =3D=3D 0 {
        NonZero::new(sig_bytes.len() / num_sigs)
    } else {
        None
    }
    .ok_or_else(|| {
        dev_err!(dev, "invalid signature count {}\n", num_sigs);
        EINVAL
    })?;

    ...

    // PANIC: `sig_size` is `NonZero`, so `chunks_exact` cannot panic.
    let sig_chunk =3D sig_bytes.chunks_exact(sig_size.get()).nth(index).ok_=
or(EINVAL)?;

This is more sound as the guarantee we need is carried by the type of
`sig_size`, and with that there is no need to make `get_bytes` return an
error on empty slices.
