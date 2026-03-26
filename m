Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013041.outbound.protection.outlook.com [40.107.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697B390CAE
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537457; cv=fail; b=sk6fllvL+osZrpjumzikFEGjQ1FMJei+DhDTSIkzobblNpUZMCUFv7yYnEPRf2mhn1fXpoASrUezZLo8S0ImqXUYxQJOJ4LaXr2TrsEM2P13UmaX0xTWPxgDDnWug1yOqnQslMXhZxVBDO4vPoRqWeLIYAQx1b4zVII7EQb3Xqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537457; c=relaxed/simple;
	bh=yR2sKmbvFzHLrZe6/e7tohSwFJU255cEdpujabLVHig=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=E3GHftYz4prjgAopzi3LwvGh2W5PK5KnZ0JIN4j+vCJrlrHvMYs1voe5UKuB4LNuKky6lSys7xe/RGRfPDEVG8umLROfwJ4yDX8sWT1MVx92eDiJ8o2rjmc0O36G4LTQYzdo5OLd/ZHkk6mZeOVRqhwqL78Kbwkhtwvv+jsCWCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=chfckf9q; arc=fail smtp.client-ip=40.107.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="chfckf9q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHKwMp+2UgwzHO90QMjKC0bjUfvJUTQm6jY4qDhBpgjQEZL9qdjrJDIWt5xmIz1Wi7LJ3MazmJBxL/5TBaEnRu02cKmE10z1aLWshHHpb7REQgXRxAqa5cTlVfN1VnnSpIZSQ6wnfdvazjiF9HRrwOvCDQWeveQmYATQGQnhmqLdHMWlRLjQhv8YtwTdnIjuLW6ZLpnT6y8lbAwtzqINcljr/7MGY/xwvN1y/UDU4J0oBrJeZnbZ8GeH3xSKRI7uauv5AD+TzfiffAbo3m/hNNGQoH6ANJx06bnFlJVPi0ptyUIEVWcVYTn0fo2aLAGo17jOOMzmQ3HjlxGqohibEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFu1k8MyGSnm/nPOIz1ja0TK+aXXOqC9nA3WhbjfExM=;
 b=VSmfSwcglONr2k4JCRpYCs1GY+5QL0edBMaS/QtSFkbkA/SNNHcvd2ZqM13DjIc3yhH+5RMzRAGmmQ+SiyCm8bxKOTxAHZtZ3YDLhVy/ycmo8S6Sn2VayEd1UCp4nLxgcCieWS/V8uLFEiztVeJ5oV8vgcFw39RmvQ2yvhUtJWbdAh94AC9xtRVmJo7FE8jq5UQ/TVOfFM91oCBvn1d326bfHQnlcuqNuD6OSERnuVxcjSNWEpABoEEiBg0mBOpHqdACaBf2QFG9YnbKyyQZs13MoVtcbukS06OhMDeisvBx4aEs/FM6TZUnCH+OEoiWlDXa+yRe85xolApFvm/dqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFu1k8MyGSnm/nPOIz1ja0TK+aXXOqC9nA3WhbjfExM=;
 b=chfckf9qdXMHOxpZpn30Ci3hJc3m330kbwvmot2zRW+W5IzzgCecGFNXNczqv6fLpOyTjldlo0K/1CGQYXMq1HVySDxgAkCMSZvfoPnMzCpaB/A3BJp5Cve65z4kxHHqsiv70kUfWuX6Jiw5e+hM29eMzokQtD2V9DYW3ShjAPl0NfnSud7b43YEmeFwJJ4g7oQZ6+a4SMvHij8zZTvepEzuG0m/C12etDR533QczOHooScYdHUTrFDPsvgHSKrrN/bkCWVqhNr6vQBxq+uuwKMujlUxyvHAo62uTPVajrAFNkb6YFqxtNlfFvYDEU9GV7N/bI1DYYQ8X4HrBBkaiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Thu, 26 Mar
 2026 15:04:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 15:04:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 00:04:04 +0900
Message-Id: <DHCT0W1KW2YP.32CR750RI9AMB@nvidia.com>
Subject: Re: [PATCH 4/7] gpu: nova-core: falcon: use dma::Coherent
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-4-5cf18a75ff64@nvidia.com>
 <DHBI0S0S5II8.46GSKUPRD2X8@nvidia.com>
In-Reply-To: <DHBI0S0S5II8.46GSKUPRD2X8@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:604:24e::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 112996a3-324c-4d6e-5350-08de8b48ee5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	EUGJIu1Wutq1P/WwjvUaV9zvrvCm04zky7FMM/iqoAVZ7V/lj8Z7NtL8v0OvNjruTQ8hEjEu2w2I+M8+JqkMdEZgv+eEapkopZa1sAjWdDOPm5kGMYrShnfFI03t722CLtYGQOEnnfYeB8TFQiktbjM7ojRRvivgIXxttPPoG+SoYvSu7rwy7RWmKl3JDBy9n7T9VVZ9aVqdhq8d7oPOksmNuruDonAOHqjpF73LZevZEK0aMcZ90JOvaRQ7ivsUn/n5PqGPX5SCs2ss+RJfvIncsTql/tLyXdpTgY4WjqHPzZwGKmTO+YWLef69MIy3kv3aTXNKB7J6w+ZExnm3pQNXoXvXgsXWL2XxGub4ir5stQR3C3QBaoZFyXKaWSrNel6Guo7a25uZHbaKt87mViyQQZvQaNojzbsjjnlWBFvYTjECHwAYu9mhoQymrENJSLHPox7cd07SKk/NSgMIqlpisj5cOoo2ujtAl3anZDfLZmwXRHdnzqnKPPRsERacWJF7ifNpOXAzaj8+xl8BaWi3+MYziXKPHvgJIMSqu5Rw9th1u0bKl3GBnjcC99zVXfaSk2WANqS91hUgUSOmjET43YYuGxu4fjxaBjhMLa/pk9vmBd/F94hubhBEgANKvonS7iJS3h5tL6hTfgG6L7jHVznQQt0xk2SZuBwOeB/syMK+lfCfkVFs9LKEp+U7BxxPnqR/3IhWxdUqDtCyCrxKWl110E8Wyl1qnda6tUQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHlrd05qSWdpR3lKQmF4ejEwRm81YlRSeHlKRXplVDc0T09rbjFGYlFnT2w0?=
 =?utf-8?B?cXFKeEg5ZU5RVHJ4UUU3bW5wdS9Od0kwT3EyUG9hdDFBeGhzaTZVRVp6SHpG?=
 =?utf-8?B?OG5yM01LeC9iRW81aHNqS3h1Rnp4MGN3aHJwRm5XMlBITXc2MklnUXduWnVE?=
 =?utf-8?B?Ymp4TmtVdU1nWWNZZ3hPL0J4STdJUHB5UHp1Y1J2WXdHSEpXSU1BTFZGUVpG?=
 =?utf-8?B?eGJhMnYyNXFPQzZ2NDc1eFk1VG14elVBWlo4MlRab1JnK1R0R1BuRVE5MmVi?=
 =?utf-8?B?bmVLR0lzRHVaeFdiZnNPS1pGcGhINlZjSXVxc3ozellOUS9sbzE2d3BkT0ta?=
 =?utf-8?B?a2lIUENJb1kxYm1adE5SSzllWUJOS2hFQ0RUMHg5dEhRTUQyRmYwUllPYVpa?=
 =?utf-8?B?dUU1Skk4SHN4ci90NVBBSnRrWDVEdDJ1c1gza0hsVitOK1VjSlg1ejJUUlVr?=
 =?utf-8?B?MWRTblMzVEJJNGVzOG04QXJKVENTMHJudVREdXpERFlpSHZub0lnaWFmUnUr?=
 =?utf-8?B?eUFpWmk4c1FqTUxYQ1k0eXFJeWQrNFRqOXoyZkphSnlQYUpMZ2pQQ0dENWIr?=
 =?utf-8?B?SUFiRHJrcnVFQmtXdUM5NFpOeGNjZkJqRktuL0VySFR6QWt2NEp6YXV2VThl?=
 =?utf-8?B?K1NnOGN0cC9pZjBhbE1FaGE3aHdTRlJ4Y0FRT2pRMS95YlkwOHc5K1EzbktO?=
 =?utf-8?B?enlnbXBUYk1QLy9kcXBiMnNyUjE1TnRTVEFRdzh3YzV5SWh6cE5FV3FMcDkz?=
 =?utf-8?B?S2Jhc096TkJueHJJc2RuUTczMWhTZEdCaDZwdHpOc0dGRmlKRVJCenljWmxG?=
 =?utf-8?B?TmNkanEvREVEYlZvYTNCN3JCMzRSTFRZalVlNm40aWJqdWdjcUdsS2xPcVpR?=
 =?utf-8?B?VENsbHZQcWkrRWZvY2xCN1I5bi9hNHhMMFhISStqYWlpT2k5cFA1T1FsVC9m?=
 =?utf-8?B?OWl3MVZlVEZTdGVLZXptZllmVDBrK0tib1R4WGZoMW5WNWJMeDVlTlhURDl5?=
 =?utf-8?B?V0lIRXp1ekZvWVJRcHpwZG9TS2xYVmdIOFIvV3NJUE9XOS9icndNZTJaaEhD?=
 =?utf-8?B?Vjc1WTRORHpicW8yVE9xY3crbXN5YjZ4V3hmTmQzcmFwdkdBWURmemNWdlBp?=
 =?utf-8?B?VnVzZE0wSlFuMERla3JaeTJPQmNzVXZNWU9OZnVSNVlCUzV6alJLaE5BYlpy?=
 =?utf-8?B?SUVLVnFWUkxTYmdROVlsZ01mSUQ3RWZIay9nSmdEM2twK0VNRzF6a2gzRCtE?=
 =?utf-8?B?SklsekllWDZLZ1RWKzhrbHF6WmpqNWs5NVN0NXBML1JFS2RIQ2k3eVRwRGdD?=
 =?utf-8?B?QnRzU1FOMDRGeFZvaUlMVDlPb09iWnUyUzdwbHlJeWljUW1jdWtrMitNdFY0?=
 =?utf-8?B?clJpdUVqSjNxQnpSaEltUDJ0ZFBFV3dUN0k1aU0rN1BTMjBJYXlBTVh0ZU5j?=
 =?utf-8?B?V04vSk43SmxNL1BlZmd4ZmVNQ0ZXRk43VXBNa1RMQkhRNVNqYWRUWGdzbm5L?=
 =?utf-8?B?bUhMbU0yUG9lTDlPLy85bHZNaXllN3JVd2JONzkxWmQ2YU12eWFSMzI4bTJ5?=
 =?utf-8?B?Rjh5OGZYZ1NidWNtTUhhVmMrZWx4RHpDZ3FvSTVmL2FBV3p5TUFOc21iRlYz?=
 =?utf-8?B?QjR3R2Zqb0dSTUVEVWFkSklKa09PL1ZiYWh0ODU1UGZYaWgxN28ySWROczFR?=
 =?utf-8?B?bHFwNkZQLzkzRWZEbUpRMkdzcHhkTDM3S2xKeWl4bTVkVEtxWXJyQ0hyT0dr?=
 =?utf-8?B?bUpiN3BWdk4zWHlRckt4VTJyVlV6TjN5QnZPU3I5QnQ5S3ZSd1phbDFoVkxM?=
 =?utf-8?B?N1FZaExWZ3o3Nk1jVFkrREVLcElEQXRmUXdDOTlubmt6WlJ0ZlZVTUQreGVN?=
 =?utf-8?B?dWY3cURhNDBGZ2xEbnZGbWJiOEljemVka1c1YStZU21YZ1JOdmlzU0x3dGRI?=
 =?utf-8?B?ZnJ3T3NYNWJnRG9jR25wU0hvMmd3amo0UTlMV2hubTQ2QlhKNERsVU1WQ1Vo?=
 =?utf-8?B?SU9uMVNFM1FRNTVBYmdkWkNkQ3VYL0dhR1pxUnNYVWwvQW96cmsyNExnRFNh?=
 =?utf-8?B?eUN3Mmo4ZjZWREdwQVdUbVFGVkM5Z0hGbDhmUjJzUU9CeUlTRHNIWGJQdmN5?=
 =?utf-8?B?OHlmTU56THJoZXVGV25HM3I3bDBMVWdHUGFMemtKN1B1REpRV0tzZE1ZUys4?=
 =?utf-8?B?SlZZQnp4U1FPNEFmS1BkMTNTRVRnRXpBalVsdjgxbVVDTktzTTdSZGl1T1dq?=
 =?utf-8?B?aVcyajI3bkMwSlRySUU4NlR0MUtqVlhKR05jWEMwMWt4OTNwN3hpVm9zcVBz?=
 =?utf-8?B?dzZRTTBSSi83bDVXMFBNV01pRDFGdnBTbXJtM0o3S2JDdVVkRm4ya25kMjRS?=
 =?utf-8?Q?GwvV+0JHcd3kwLuLa/j08hJNYBtzOQkpBpzf7V0fTihZK?=
X-MS-Exchange-AntiSpam-MessageData-1: W/cx8/m1udBpNg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112996a3-324c-4d6e-5350-08de8b48ee5f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:04:08.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDIgJq85bDoPmHWmeKIFgRf9+BFHD0j+UpyVpQMjnxSNp/oEVXyUx/9EShFmtvF5RDWa9goS4UBy1fVgPvKdfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418

On Wed Mar 25, 2026 at 11:14 AM JST, Eliot Courtney wrote:
> On Sat Mar 21, 2026 at 10:36 PM JST, Alexandre Courbot wrote:
>> Replace the nova-core local `DmaObject` with a `Coherent` that can
>> fulfill the same role.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon.rs | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fal=
con.rs
>> index 5bf8da8760bf..f6239c44dd80 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -10,6 +10,7 @@
>>          Device, //
>>      },
>>      dma::{
>> +        Coherent,
>>          DmaAddress,
>>          DmaMask, //
>>      },
>> @@ -20,7 +21,6 @@
>>  };
>> =20
>>  use crate::{
>> -    dma::DmaObject,
>>      driver::Bar0,
>>      falcon::hal::LoadMethod,
>>      gpu::Chipset,
>> @@ -636,7 +636,7 @@ pub(crate) fn pio_load<F: FalconFirmware<Target =3D =
E> + FalconPioLoadable>(
>>      fn dma_wr(
>>          &self,
>>          bar: &Bar0,
>> -        dma_obj: &DmaObject,
>> +        dma_obj: &Coherent<[u8]>,
>>          target_mem: FalconMem,
>>          load_offsets: FalconDmaLoadTarget,
>>      ) -> Result {
>> @@ -740,7 +740,7 @@ fn dma_load<F: FalconFirmware<Target =3D E> + Falcon=
DmaLoadable>(
>>          fw: &F,
>>      ) -> Result {
>>          // Create DMA object with firmware content as the source of the=
 DMA engine.
>> -        let dma_obj =3D DmaObject::from_data(dev, fw.as_slice())?;
>> +        let dma_obj =3D Coherent::from_slice(dev, fw.as_slice(), GFP_KE=
RNEL)?;
>
> Is it guaranteed that fw.as_slice() is a multiple of 256 in size?
> In `dma_wr` it breaks this up into 256 byte transfers. Since this
> no longer pads out to a page boundary, it means that it could now error
> (around "DMA transfer goes beyond range of DMA object") if the Dmem=20
> section's size is not divisible by 256. But tbh, I find it odd that=20
> `dma_wr` doesn't check that FalconDmaLoadTarget's length is a
> multiple of 256 anyway, because it looks like it'll write a bunch of
> unrelated bytes (since it rounds up to the nearest 256 to copy).
>
> Maybe we should enforce that `FalconDmaLoadTarget` length is divisible
> by 256?
>
> For this series if for all firmwares it's divisible by 256 then I think
> it's fine to leave this as is for now, but I do find the lack of
> checking in `dma_wr` (or anywhere else for FalconDmaLoadTarget) a bit
> odd.

All coherent allocations are page-aligned (and use full pages), so we
are safe in terms of overflows.

Also `dma_wr` uses `div_ceil(256)` which will skip the last data block
entirely if it is not a multiple of 256. It might be a bit more robust
to explicitly check that the size is a multiple of 256 and return an
error if that is not the case indeed.
