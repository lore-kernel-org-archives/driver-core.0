Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1034372EFB;
	Sun, 26 Jul 2026 00:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785025932; cv=fail; b=MZfmHn/5jaS6AQ26CVuh2/IFmcE6nVFzQUYSl+dBAsQG0GaYAlVEJImpviZrkYXC/0klVaHhxg/rYZWM03+nT2+8kzLXYnuEAZsvYRV2nOnVwABjcWblBxnEGhaNsIYQDzXZ6hqCkrT8My5hBUQS2zVQEzY4yxaPw1CF2esj0f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785025932; c=relaxed/simple;
	bh=CmsnTLfskz0qln/h0bN4DZtn6eAkUI21WZ91IVTFIOk=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=EtJdy1Kouv80dpY2YhRuEtnAExFmDkOrN6EiNz46DFB1lQAZUM4/zqNKgkyi0sclR4UWsjXcZu1wAQn3dRkq3cuOb5oHvoX5ei65H+0MioGWqvGW1Z4BJ/yKjVbt2OFHgSrQvrkuxsvnr+Rew7SOL4xn8g45VTrMCJsbclvR35Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cCsRVqAr; arc=fail smtp.client-ip=52.101.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cCsRVqAr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pe3NU4YyNFALeYBbFa/0CCfz+IMn8lORNVkrj4WoANU+fMAhgjCGh1eq3X5U77ttJbuilGtMcGxZGmeZoKdlrlW26vYykgPHhci5oMr+Xd0KZrwhIE1u8dPEe4XYto6+OwKIsmvZBRWY4Tl0aKMGFg6PjDKjBA04M1pedGu9bDA2ANH3yBPy4bNj8FKJJ1aB6fID67Bo7bQ8MrunZgnl8EvqUKMEhyedfjXLojZUuSfbyi/+Me3tJj3ujny/MZXVRBrCYUoye17XWYcysyS7ARGQqtFwrJNw0EGFH2ZcEyOBum5mLHfqVnTGT9QG8m8HhkaxUuMGeDZ6FM+fX7J4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=catbcoFqrkoD95qggxkSdJhKX2797kMi+cIIle5cXDU=;
 b=ANIdMZZIUA3NkOQmUNhyLSXNA//KWFWD2Vj84we+PP9uaYEWPKnmQMsqP0XLl/qfbThVSqnzq3N84PHGvxONnkYuOJ+LcWex9K1NTz82GQLOOlRzqraHsWwbeq6UmdeeREPB8S4t6hQ6+9pKZF62qemLCzs1rJXEBBFkiOhIBQMye5CfPSNT5PbXIloKRhbCEJoIVLqibA6OG/LkKE+IwSZpShwe96iOx6nflTEhL1WcUkkkl5mu9NjQjGE1abhmveo5R1fweGYl7USRk36jpwZMNOF5g8WQMLkeQ4QIVOzydL/ewVqe0cVEviE4JrQaE9iDmC+lh+F/znI/x12eTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=catbcoFqrkoD95qggxkSdJhKX2797kMi+cIIle5cXDU=;
 b=cCsRVqArvRssdetNDN6oPYYDSe3g8yyqZVzouCfZuDk7V1KHocnRowmSFcIkj/JNky3jgYUiOB2fij0IwMygu0tE3TDFJs55OwkZEVCfSSoYLEpWeN8mah2uujm4Rrz4VUIGijrvB6ohVsJJJfu7/LqsjVR2F3De3c5rHe4mjMQnuZ7XbNK5w5tRCHj7/aK5fitFlsWSbtLxbFvq3PDnDe2g98uxWydQJ7QimwWlSq56nV1g9SX9u6Wvu2W4nzhBRpPiALY8srdx0Hb8GfJ48U+W+N8kzQcbhV68Db6aFrB9zW016bOzB0ZGJHvp+wPLkEgjOnfKjHaGakehthFxYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN6PR12MB8516.namprd12.prod.outlook.com (2603:10b6:208:46f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 00:32:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 00:32:05 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 09:32:00 +0900
Message-Id: <DK82VNBOLWA7.1RFTZQWWNHIEH@nvidia.com>
Subject: Re: [PATCH] rust: io: convert ResourceSize into a transparent
 newtype
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Lorenzo Delgado" <lnsdev@proton.me>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Robin
 Murphy" <robin.murphy@arm.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <nova-gpu@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
References: <20260712113602.389060-1-lnsdev@proton.me>
 <DK0BPAHR8IS3.2KLSLH7K448RJ@kernel.org>
In-Reply-To: <DK0BPAHR8IS3.2KLSLH7K448RJ@kernel.org>
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN6PR12MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 353fa27c-3027-444f-d3c9-08deeaad518a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|10070799003|5023799004|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qz2TttZBXvcbili6+XRoN2eKMr1CV7b8WgorCviI5S+e5YX+fhYWQ1Gh/H8g6SDvW2TJqWiGU+0ZzhhtXBfiu5/TEESgjqO/EsJxuLs4LU8CvZdaz12cBBQkTjLD1pq9yBsAUW8v1Li1wKZmBIXbeABrxnk7RiLzs61AVkf6wF0MFNyNQtTqJAJ7x96M0Z53DfTnsNFdpuds5LKrMxHVdm/IzY1B/NAw75bUY+aZi0tHfaUCixgYdehSjws67rM/UO+Hat6aBugOmO8WT4n8yhc2rEEinPLqXCIsprCIFFpN69DeADp8eVE1r7Bury436Dbfhff/kMyHQSd4XkqeD+Y+OH62+TKGUHfsVHjUfgw5YomXkQi9e+yDo9M5fLutf4dIjRHuYm4q1cBbjjrFaIs4WJKoHsEJtzAYyc82GHsD2kbPVRnpNm+9a5j9tmVEuClXI1gBzYXnxMN6MDXLFnhy6I/2D5zmzOfFROLFycysDvjrmp4e+e27tMMZRaK2dgj0VoQwoFnDAPuSgLtrpTRl9P1CRKmne/PyqronbM6VXpE/MSFB2crq3Vg9NS6AJKsgS2IzYEkXmA7wZnlEdC63Dgj9F/t7hifhJPH+eheoDch/YyuEZjYp4ucbMIycYjULzDb0l8XRflsYn0+l9+VSTk+1Tx4q6HVnXQDGHcI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(10070799003)(5023799004)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU5XVVNsN0VHWi9uMXVLd1JIdDduOU4xakdqM1p6SVZFMUJodXRRc3JlUWRz?=
 =?utf-8?B?bVYzc3hmVWJGQmRhaEdpeXRNOTdTYldEZ2dMd1UrZm5PSVphSnpZMnpGRlEr?=
 =?utf-8?B?YlZ1U1RvdGY4VFF2SUg5MllPcTBad1JwQkFiNjJnYitSNHVTcEoveEZadmhS?=
 =?utf-8?B?SHdMbGVmMGRvdHRuSXNaRGU4THpRZ3cyMVVLZHFjMVo1cTB4VTk4cVVjOW1F?=
 =?utf-8?B?LzJ0MlJnaFQ5MDA3L3p5OGx5YmRPajlyUDBRMUlGZWpQMXYrR05sZDlpU0Js?=
 =?utf-8?B?S2Y0YVYySkl6SlZkWmtkNFZBUGJqVmRmUm9tcUIzM1hvOGlNS2NsV0tEd3c2?=
 =?utf-8?B?ZFdzN0ZreERLa0lZYzFSKzlqemdsRi9Cdm82dllJR01ZT0NrQXhBZ1lOajJs?=
 =?utf-8?B?WTVWQTA2b0JnSWpSMUtJU21uZENueGh1SzExSUtKYi9vZHhzNXFsbFV2cXpx?=
 =?utf-8?B?VDlaZVVuc3MvcVNIMGdwcTJRUkVYREJnQW5FUDNOb05JYkFDcTRwT25xM0dQ?=
 =?utf-8?B?cnl5TldPMHoyUDBnam1hVDRuclVDRXZEU3hRNENFNUpneTZQNXZ3SzJZbnUz?=
 =?utf-8?B?d3RRL1NBKy9yK1Rkb1Z5TXpEc2dwclBVVitocUE0Vmh0ODZXQUlUbWtUNnZZ?=
 =?utf-8?B?bndDL2ErUkRhT1B3KzNZdEYzQjB1Tk5vNUM0eDMyc2Q3ODlLOWVQZHUyQm1w?=
 =?utf-8?B?YzRJcVgrOTJUU3lBL1JzbG8xRUt3aDVaOTE4Ykd5S3JMRUJUTHRrQUMzVXJY?=
 =?utf-8?B?SkR3VFJLKy9ucjAvTjZXYlNXQ1g2dFF4VWk3V2RyZkFVNGtrVG1uR2o1WU4x?=
 =?utf-8?B?d1lqc3NtSTVGVW1vL0JISTFnYk1mblBzRGllV3EvZVQwc2RKbjBWclBOSzBJ?=
 =?utf-8?B?TVA3VXVhcGJQTEVJd1pmR0h3dVd6dFdnMEsybWJ0dUJuWllPbm14U0hqM01u?=
 =?utf-8?B?UFhmeDN0RmZsQWVXalhBS245NitkdGdHcHJNSmJIVUlKYk02cUdWUUM3TDVz?=
 =?utf-8?B?Q0kwZ3BJM1pzQUtnNUNQelYyS2pEd2ZvZkFkTTFPdHg3YVVhV3Q1ck5xdWxR?=
 =?utf-8?B?anpLQzJhMzhKa0JIaU1aRldnMUs5UVp0dG80V2R2VndnMmI4cGdLTC8rTjhB?=
 =?utf-8?B?YXdQOEpsbnBmRERaVHQzYTR5SkplcjA3UDk3c2t3QVJtM0JvWHBHMlRqNHgx?=
 =?utf-8?B?QXQ4ZEVnSHpjc0xzV216MkZEUVZsRTBTQWdpQjFRVTFDMHBub3pxSjVYZkha?=
 =?utf-8?B?dTBrMEx3cyszMzYzdjlGZ1hFd1h1UnZ1MkhXcjFqYVFQU0ZwZ2FCNGp5Q2ll?=
 =?utf-8?B?dVhGeGF4UkNieStBcTBHVk9lUERZZWNDQVErMWpFR0tibHJSWDVjL3VSUGs5?=
 =?utf-8?B?SE9Ha3VlWjRZRzdsd2JjWVp0OGx1NzBKV1d4ZHpRR3p0c1BGdUdyZ3U5Mlpo?=
 =?utf-8?B?dGtBem04a3JOSHhseGoyakxrUGlWbnlwcHZFRDhvcEtMcWp6bWdYUVhnQzZk?=
 =?utf-8?B?OXpSRmFWckRnTFZUdHg0cjhPQWF6b2ZlNVRoUk5zSWtoZS9PZE0wazhibG9U?=
 =?utf-8?B?NmFFTHN5L1JYb2FMRzY2QTY4VEtYQzM3cytqUTE3UlJvdWxNVzFUelNRRDlv?=
 =?utf-8?B?bnc1V1BPNkg4WTNBMnVjMzRnNG9JakhsOTFyZzZZSFIwQkJIZ2dyOG5pT3NN?=
 =?utf-8?B?S3E1YVlraXRUeWF6N2lycVVHbUhRZytMU3RjcjZPcklRUWp6aDBvYnhwd2hJ?=
 =?utf-8?B?QzdPcnFXRnpoZElxUCt6a2laMjVVNG9aYmw0WXQ5OHV3bGxLbFMzNUxCUFkx?=
 =?utf-8?B?bGlpRzFKbmJ3Vjg4dTBxTEJwbkMrVmVEbjBSL2JJZFowZlNVN25NNFRUVitF?=
 =?utf-8?B?WVAyaGhhS3hYZVVnNkY1SVM0ZnRsTHhFeUt6bjBNMlZkSTdvUytjbkh3KzNm?=
 =?utf-8?B?eDNvZFBOSXhQUnlaRTRRZ2ZOa1ptNGU1Q25wVzlqdHYxYXdUSEgvQ3dreXZT?=
 =?utf-8?B?ODNrMFdZSGhHTUl6SkhsSko1MUFhWFdZY3lBZkFrVTFjVEdmeSsxVCtXK2hK?=
 =?utf-8?B?RzJpSlRybVA4YWR4N1VzLy9oNDZ0VjhRR0ZLRWo1angySDRYREtBb1RVWTA4?=
 =?utf-8?B?aU9YZFMrWEk3Z3JNMmFJUmNTQ2JNeHRPWjdzTmRGNU4yL05LVDVVTDV2TWpX?=
 =?utf-8?B?R3NhYW82eEtua05kdk8xVHhSVnlHWWdpREszb0pJb0JIK2ZCcldRRURJOVZw?=
 =?utf-8?B?TVlmMzMzTFdPZmZQc1ZvSzRWZ0c5NUhOOTdVbzVyWTd1NDZKRStqSGVReWxz?=
 =?utf-8?B?UG5wWEZqVElEL2Y1TWllckNMaVYvN2FVeElvU0V3Y1c5anpCcTNhbkRUUGdx?=
 =?utf-8?Q?Q2OSxcuF/FIvDpov4F9x6+tInl0iob4PAM4CdPCvDosib?=
X-MS-Exchange-AntiSpam-MessageData-1: q/cB1OSCCeJ0pw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353fa27c-3027-444f-d3c9-08deeaad518a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 00:32:05.4059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZBZrf1lj1Gpge0bP/eKfqQzMzpLGH8XTBoiA8EDZb0/cpc4GXai2AwE8bKwDDeQXJQNsUldX3aAhE4pUasl0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8516

On Fri Jul 17, 2026 at 6:45 AM JST, Danilo Krummrich wrote:
> On Sun Jul 12, 2026 at 1:36 PM CEST, Lorenzo Delgado wrote:
>> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-co=
re/firmware/gsp.rs
>> index 99a302bae567..d7593888e65b 100644
>> --- a/drivers/gpu/nova-core/firmware/gsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
>> @@ -175,7 +175,7 @@ pub(crate) fn radix3_dma_handle(&self) -> DmaAddress=
 {
>>  fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>)=
 -> Result<VVec<u8>> {
>>      for sg_entry in sg_table.iter() {
>>          // Number of pages we need to map.
>> -        let num_pages =3D usize::from_safe_cast(sg_entry.dma_len()).div=
_ceil(GSP_PAGE_SIZE);
>> +        let num_pages =3D usize::try_from(sg_entry.dma_len())?.div_ceil=
(GSP_PAGE_SIZE);
>
> I think this is worse, as the conversion becomes fallible.
>
> You could implement From<ResourceSize> for u64 and then keep using
> usize::from_safe_cast() in nova-core.
>
> Alternatively, we could also consider moving the FromSafeCast trait to
> rust/kernel/num.rs and add FromSafeCast<ResourceSize> impls for usize.
>
> I originally proposed the approach [1], since in nova-core we had a lot o=
f
> fallible conversion, while our Kconfig mandates that they can never actua=
lly
> fail.

Back last year (!) I sent a RFC for this [1] but never followed up
somehow. Let me send a proper patch as it should be useful to have
globally.

[1] https://lore.kernel.org/all/20251104-as_casts-v1-1-0a0e95bd2a9f@nvidia.=
com/
