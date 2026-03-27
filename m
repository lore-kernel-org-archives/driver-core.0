Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570F73A453F
	for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 06:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774594673; cv=fail; b=juBdBB66NVdOYMt/Oiwa7zhZR1uc+J0cVXmxbr7B3NvCZIRMNi49OtH8rBdPGbWA7egnHzMqFb87ma6WY4aElIUiG9C7esaWo0TOV4M/VWEUX3uxPTXW+IeOBe2xaVy8echVDWhL8uPzTDj24ZF9m9BM7zQzwi6/5H7gQ4xm/yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774594673; c=relaxed/simple;
	bh=b9FCIwPMFi51sCHHCCeZuZUcEkaE94Lq42tbfkYNRqI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HdjpN4GKU8ZadAOsdklHgSiqA0DhjArYfTNjRUvNEs4g4NzGDPcA0b9UBMFskvwl/78r9yPVGnzIVF7pkimV9MVfOLpU5rrzmxFmwg5F07c3AkWKMrTan/dLw6Llm6egB2oqAhNMpaGMRs30520p2wlAnOIAcqEaDaFxZyoHuNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=awx+Ebd4; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="awx+Ebd4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJcZf9Zyn0QPEoe51B7hS2azEnEpOSELUq0y6uc9pBGd4NJa+MnSPEjEt8bJj6reewolgO71Z+tkIu4vBb8gohr7KgjvHgkqL9ojLR/mFjuJ/9qlfheBIFnRPOffCawKzWbInxlYf+HllBFimrGqwx0rrHdQIDPNaFPqqnmWgWXtow+NvqMWs9Px9ZzG+yDLRDM3blUdzAgstARCRKzpvlsre+qaZOckRU2hdiCNRrRnwG22pmkV5xJJRoautzd8lbma6ibeIH84/yD6AK9zN/BtiIsQ4cSYoxICCgvm/HPBjAdzXr2hlZUODup5gepXSSHT5FZq43r3pGyYv/DCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ln2Ipal6jNL3Sm17P2r7y6BeQVcnb2obdo38XcGXh/0=;
 b=CdM3opsVU7xg0vtb6zDEolGkM2QplmWdBoKK98gTT5mmILtMfC7WoUeU9RjFtfeJtMfaha1/iNsj3Z3iLEZTV1FF8zgsCaQMqGQ0nc9mXkpRHmS1LyIHs761EIIvRFvX4tQNt6BGnk5ruerUUiLKcpOy8Op/28H9uzu8jE11/xqrGqqAQIrprhQVMbRD7DJcxbAWx9IoNS5HZrwbatlULKIxzxJeOLagYo2G9kWT/W0/N0qklaIiv48da+rJVJhlShGywcYvw+gp1RZAW+e0pVOI8nE2ubqhXJkCR1AIMIS66pLP40KKor2K8lwpR5Fyjgm2V7WoKzEuOCQWtzk5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ln2Ipal6jNL3Sm17P2r7y6BeQVcnb2obdo38XcGXh/0=;
 b=awx+Ebd4HZJzabE8CvJ5M2UmL1/ZM3Md3/FQonvD0xidPEdOCyVXzsXqh1+nRXvH52mpf951KMgZvkFIWl2qkFSvTPTqp7ydo65CWGKjPUf5D4X6TUzQ959C0PCc00K7Al/I83EjyzM0om7sUVuHoI9z/ZN9T3bRGZip/5O2Tf98wre2r+WHbjAGoyOq4cXLLbEXjyF1emIinBuS/DmTUsPERrDK0kfDcakzHzpaqulw0Vxkrne7FvWA9o77cefzNtU3fQ+bpblUtM6h51wsaav33QVX7s2st60OANVbhyLeDCqxQbEvvkxkghEv9XiWMswdd/LSU2sXQ4gmZB6NPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 06:57:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Fri, 27 Mar 2026
 06:57:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 15:57:35 +0900
Message-Id: <DHDDAY4B5JXG.5FBC99G558N7@nvidia.com>
Cc: "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] rust: dma: add from-slice constructors and use
 them in nova-core
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260327-b4-nova-dma-removal-v2-0-616e1d0b5cb3@nvidia.com>
 <f7e39810-bcf2-419e-af2a-2ae0c4d5ab67@kernel.org>
In-Reply-To: <f7e39810-bcf2-419e-af2a-2ae0c4d5ab67@kernel.org>
X-ClientProxiedBy: OSBPR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:604:2d::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c22af9-f931-4542-1112-08de8bce2256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OFPTbIJAO11I0htx0kGnZ6Il+wZmoG9r7NYVxaTizBuo15Oz0NH96UgjQ5SF09zxq4hOKZHHyzVIs6d4anvcT8J85DC25atLpQ6fpNobtxhTUfonfXituusqXQsidTsxUHjMjp1hJ1yhAgHaeIVNZHyvLyn6sQGhxGBiJB4GlBRb0Jg+BQdxDZvEWaRTpWcoA+gBATxhYAxItXUudGvmGa0MK+TAhhM/ptqnswTSnq5griWSgFtIuxGySMPJFMWRsiLVSF6ROmnXqboRbMltNlOEMUOS4kZWe2TsQY5D5ceFr8OmIecK4dG+9TBldPZ8UgGri8ElwQtIj1muoXa+6rStgxg5LSIavv5eJ7msp3RNxmYEoHCheVD/T00nVCbh5J9gxUAS7Q4w6F+M1xXXctNpSuU26FMvrQzxpMSD+jxCE+UubFDzYiu41POSX/5jT0g/D2nttXA8lRDi+AKs6ZncYfZRMwf06STxHu8jMbYQ+KT5pk1I+WPm+RXAhGipPHxRni+TptystJ4YtZOGfnSfUgshfdeLl+wrI0U5KD4z5WYru8DQgGICjgDKB7bhVchuMXe+TUSRoqKCnnPbHF7p514bYKzeFEZHv5o/IVnEUbBeB0GBez36SZXygaaJk1tKTcDQSxEPdpMbMdxuTN7UI5ZyTB4uYPmuq3t97b5dO9sIA/7QLGi4XDT/Xglo6i5pN5wHdQOd47nVhNBO1vcikLRfj3bDdluFw+xlp2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE14UzEvdUx6c3hsenBVUDVZVUo2VXhrUjVJMUF2ZEZiRzRGTVJkcWRqWFBt?=
 =?utf-8?B?Y2RrWTNITlR4YzVqc3B2bFY3S0sybFJQRmxqS3psSmxYbHZWQ2twV1ptYy8r?=
 =?utf-8?B?Y3JzZWl6RkRyRTAremhwejFrSzI1OTJaOU1aMDkwNDlTbVp4YTYrZkl3RW91?=
 =?utf-8?B?QXpFVlpaOGowTjYxRXNQQnp6SDZYekdTWU9Cc1hkVCt4TlFGV0wyb3BaV0h5?=
 =?utf-8?B?ZWRtT2UyTm5SRFJHYUtCemFDbUFXc3hKM1hCYkx4b05tQzE2L3c5ZHoyTlRm?=
 =?utf-8?B?RVc5ZHhsejFXSkxMUzJheFpJbC9ESS9YRjFkZkZiRHNzZEhqajBxTGpVbUdZ?=
 =?utf-8?B?M2hSb3pSYnFDNE1WdURGQlppTkVnOU94MU5yZkxtaW9WM1Y2OEZDcGdCWUFu?=
 =?utf-8?B?WFB0OCt0dFF5NlhSQyt1b29yaXFWenlDdUtqS0N2bURqN0l2WTBKd2MySDBO?=
 =?utf-8?B?MmlVU1pITmNjL1pzeXFXN1hlTHZ1a0hldWNvUG03RzhabTBYcVZORFQ5SzNZ?=
 =?utf-8?B?aUxDZUpkQ3MzUTBVMDNTTmN4M2srQS9CREhEWmJYNStSN1Z3d2Q5U0lQRVVL?=
 =?utf-8?B?cU5ZVVkrTEVKVzVJWkFDdllRbDBpM3ZaT01MRFE1bXBBVDlHWmdPeDdrMVFR?=
 =?utf-8?B?SXFwbVo5elFMenQ0M0cyQjhhZlFLTGxrK1RyTjZ0Y2ZTZ1BsWmtPZmNGckpU?=
 =?utf-8?B?YmxkOVRRcVJ5UmtEL3JJMllGSkdIcXU3VUVDRU9zNUY2OTQzN3plOEE2ZmV5?=
 =?utf-8?B?SWFNUG9oTjZUUHVwbzRGODlTaXBEV21yQ2NTTVZOR1RvTElGWDFQOTlwUHYz?=
 =?utf-8?B?eEVscEh0S0FRWVgrcUE5OVpNK1NKTEdrdmNPbkp6elFHRmZIVDZ4bEZRRmRn?=
 =?utf-8?B?TEdNZGprZVMvRVZVRUE4Mllqa0d4ODlxOVc5ZlRtUjdCY1FtOTV5NHo1UUtt?=
 =?utf-8?B?MTZzamFKVW00b2pvOGhjRk8xMHVGdmtLZjlBeWJmQnYyQkpWeHVSZzhtSWlE?=
 =?utf-8?B?WWU3RVdweVpBS1p5SDRiaExlb3d1N1g0emY3VDQwTFdpcElLcUdzNmxNRTVO?=
 =?utf-8?B?cWN6NkFLTlJ2NTlNVGk3WFp5R1dNcDUrZk5UUldSb0dSVFExSjlFK3pCcVJt?=
 =?utf-8?B?MkR3aDJkUmtjL2xUOWJyd0VvQVdUNW1TTk5YVWNIZ1dFUHpZS0lsbTZNdHNI?=
 =?utf-8?B?TERtdi9WZnpxWnJzVHJSQ256U0laeFNOSzdrbVFUWC9Zb1NGZjlwdkdDNklh?=
 =?utf-8?B?RHdYU0VSeVBJYW41Nzh4aVVEbExkU1RLWWp0OGxJV1hlUXBnbmlWZGhuZmEw?=
 =?utf-8?B?WDgxUURYSGVRZENQcnYyU1dHNHd6THk4OXlURHpRaEd4ajVwUm1uUWFFaEZi?=
 =?utf-8?B?dWZKM3RxbXFiMGhSc3VWNGk1eW0xWER2UXhTWnF6U1V1STE1THpFOE5qNkIy?=
 =?utf-8?B?QmtmNSt6L0VHV0FVb2FHdVJhaFFZVnVuUkd6aWI2LzlydzFVeW9zWlFXL0RE?=
 =?utf-8?B?aExveHRUT0laQjVJNjNHb2hqMUx1RjNkditNRnFvazQ0WjdsNENyVGJ6c04v?=
 =?utf-8?B?S0c2clpXV2NpMHVDNnNXRE9idnUwOHRLQ2ZsUU5mY3RIWTd4L3lXRjJLWmpT?=
 =?utf-8?B?YW1oVWFVaS9YYVZkT3o2MkppaWpMTXRYWGdiQU5nV2x5ZWRwNlVZS1lVdDU4?=
 =?utf-8?B?V0x2d0xrOHc1OGlrSDN2cjhyTm1WS0VlVm5WZzBFTzBYd3ZhQ3BzSlVkVTBS?=
 =?utf-8?B?TXNRVFRYZDZQQWdMYXY3S1FpZU5Zdi9DSVdxUWxmWE43UitSZTk2dDJiQWN4?=
 =?utf-8?B?TmFQa1AySWN4MHJoWGM3VjlJbExGakR3MDF1YlhxRzFzN0RZZnhLR2FGaHAr?=
 =?utf-8?B?dlhoOGw5dnhkSVdrc3FkWU5nYnltTndjek82cFRvaEYvRlpOU0VyMlRMUms2?=
 =?utf-8?B?VDRJQng5c0NaL1JYMTJ2eHMxaEFwTUxERmE3Y24zWGlZR3UwZnJKUmw1RGxW?=
 =?utf-8?B?QzJWQ1hzT28yOUIzTmdsc3BCWm8wQ08wWkJuVDVwUTc4b0djY3V4S3lic0Vz?=
 =?utf-8?B?K3RiVHpHazJSUFlHWjRNZXllRitJMGhqcVlsejFrZ3BtSG55ZS9RN09OL3gx?=
 =?utf-8?B?dk9FakE0bCtxSDhRWjdVdWxna1lOMTFpOWFlcFlWRHB1SnBQdXFMRFVsa3dV?=
 =?utf-8?B?WW1JU3RqbCtuRWZJTW5oVW9LZWZpVWpMRDB2ZkIyZUtNUGRWSEVhcUVmRzNT?=
 =?utf-8?B?aURxSCs0VVFrOFdaNzFtd0FZenllRGwwOCtuWEEzdjI4TVloK2c1Y3BRUGg1?=
 =?utf-8?B?THdrME5NczhJSTRuaGM0bTlObFIyOWdLWXErWnFTUDk0dmxxeHJXUmdwNVhv?=
 =?utf-8?Q?smaj+fvMKFFPPzcFMqhwo5CBBm4HwVIUnEwvexbyjreeq?=
X-MS-Exchange-AntiSpam-MessageData-1: KCQV0dB3iB6X3A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c22af9-f931-4542-1112-08de8bce2256
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 06:57:39.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gle4XOsWAWz2Bc9nBvw7/c8u+eXIljizpXw4DhAmj/9xjWm+b/qEtT+IECVIrRivNfMhUN8jy2yW0pLHiDfsWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5979

On Fri Mar 27, 2026 at 2:24 AM JST, Danilo Krummrich wrote:
> On 3/26/26 4:22 PM, Alexandre Courbot wrote:
>> Based on drm-rust-next, with [1] as extra dependency.
>>=20
>> [1] https://lore.kernel.org/all/20260321172749.592387-2-dakr@kernel.org/
>
> [...]
>
>> Alexandre Courbot (7):
>>       rust: dma: add from-slice constructors for Coherent and CoherentBo=
x
>>       gpu: nova-core: firmware: riscv: use dma::Coherent
>>       gpu: nova-core: firmware: fwsec: use dma::Coherent
>>       gpu: nova-core: falcon: use dma::Coherent
>>       gpu: nova-core: fb: use dma::CoherentHandle
>>       gpu: nova-core: firmware: gsp: use dma::Coherent for signatures
>>       gpu: nova-core: firmware: gsp: use dma::Coherent for level0 table
>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>
> Feel free to also take the two DMA patches.

Thanks Danilo! I will leave it ~1 more day for reviews and will push
both unless someone screams.
