Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010066.outbound.protection.outlook.com [52.101.193.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A844035DA
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538566; cv=fail; b=BhD3dJNED+/T7rWbc4NFh3qgRCQABkJWZke2Odmm+XrpdW3+8j1EaINNg/OW6W+27GBoFkUc5CX3wYXg90OBEkpJHQOwxtUOo1aP8H3MWlZtGlB40IiSsgAabDPUKRHL1Tme5HSTKT6wHV/Nl+s6HIaeC/MxbSbvnWTntLJWOZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538566; c=relaxed/simple;
	bh=IiFuazPrFSiTwrAcnSyRvBlVitV9FD6C+KScjaRewxs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E6NjMldlDmG63VZsL+iAOwuaa+RHiV47Nl1vqMHRM6eoYogTnWJj78u/aeozER8bI9hG1yZdBwyOotCZkAbdq9joGnxrPRWjnbQZjVa6c1pije/0cRG7YcdxOx/FMKIPeDu5YKQYa9b7aYDRaTuy5ClktSkgeXm7t0TgSHWykZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dXyhYfUu; arc=fail smtp.client-ip=52.101.193.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dXyhYfUu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHeu5T564wJOHwm9nH6hiesl0rvsl6UjylfyGsLRhxZksK52RSNyyotpmbBQ29DOfvUClk20hMcOohaeGYSH4Jxr1fSgRhBFN6YTvUpb8/m2rHKPydVCEnA6MsCxxicEse2HFXOxWstWLPlylyGN36JdnsPedEknoXMpzMPtlTZGchWavrx7naaNIEEDDUvk3XKmoIVvTA9E12dXPFs62ay2qTM/5da2UnlH2Eg6hdtP6ttzm9jjJQ+K75oHxKKxf4ChBRNsBcomhECVt8esu4KuSWGX96DTsJeIK6f05vRi5omAFwzLacMmxnHEg5Y5H32YJKS7MIshT0xlmgwm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEgO/1iBQU1ZYeyITf+fDxAPsLrMzsxOL2d2oTeOM1M=;
 b=UFUsiI102eeyHdRXubqL65xwIVjYtvtriOnJEPs+JDhitEhLkZXLijFBZi3XpE+iNv76wa4HGg70hak69UQARzrkQ5/HXYb9w0eamdmFPjoXSUm6hldAjyUcMDiPFDFZBPjcKrHSLZxmiianWvmE+gUEHCtqM0hbeag5m8owXm/k5FOyhruQJzvP/ttseIaCIWj5olqxHn7qUlfLRRpErbmyxhPk1ykKMKxwDeeLBXls/G99Wu8MGTgxWCmL5gcYWjZyC68/q8T8obA3PJVqJi+JXntxHdsBdnDD48KgeveRgFoxYUehtoda1m692VZ4Y6xDKRZbwUcg4t/nlsaksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEgO/1iBQU1ZYeyITf+fDxAPsLrMzsxOL2d2oTeOM1M=;
 b=dXyhYfUu6Wi1NCU4f+a0rZdAuLlAgP68cywr76nniWNlAVLmu5lpItczlEvEVE1RqnDwycCeG643W/HWoun36C9UE9B8OYDwv1F8Wq0Mp2WGL2tqTq+eCoTn+GCAbrsYnXtkI+U4sTkCttGOkpkMHYHLs844Z0A5be2LtTta7JVrdxhadpJGuyA3R3A/wKaI91UaUh7RW7DtPhpsWOARwlkst/1QgrcTG9268Axal1bm+L3bJbNGMC0cnNHZeU0a3TC5+wqotZWvXogeCu3PH9Cwt1Jphl1fBG5zb4fnegS0VHnopDXq8ExgzY4n05T3eCSQdh2UvCTrUm1V+O2tJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 15:22:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 15:22:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 27 Mar 2026 00:22:11 +0900
Subject: [PATCH v2 5/7] gpu: nova-core: fb: use dma::CoherentHandle
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-nova-dma-removal-v2-5-616e1d0b5cb3@nvidia.com>
References: <20260327-b4-nova-dma-removal-v2-0-616e1d0b5cb3@nvidia.com>
In-Reply-To: <20260327-b4-nova-dma-removal-v2-0-616e1d0b5cb3@nvidia.com>
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
X-ClientProxiedBy: TYXPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:403:a::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc7046c-70f8-4ed2-0c66-08de8b4b81f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dZsWHvsd6L68Kg58AtBuBwx9uuvel3r3Gdm8KL6Q+zdx1gvRA0gerOSuOfF5qND5dwO+RbVOP9yWSFGPUOrBK5MMXhro9r7+nXlXnSbRhzWQV84/X+Zp0HokObfMsiiYGWIRVicSvQoLLPUe4Vq386uRAg8kXXtQjZlRQmMOHS1TeRIeZqhvhK+Le7covOltPQjto6aVtCK+Hzt3Hae0CqsbZqHanoVPQ6lEXnHsvamaDjHzb8viOLL+Pq0AHXjhE85ggkjDsSJyHj2RefOGE+CE2V5W2K7Xd+eMlKe/2jsZFPVNjm112ObaH3CZtwXaRwHyVfSj34+LTrWE4u/RqoQbI53RjWU91++AKh+SXXSlNKsyS/DTUSbgTabeDYTPXwc3rCUpRY8i1NxKKLWNgJuD6XohzIz/yLGQD29hYahtUQI66FdOeo4e2WBAr/0br2LTPPJbvgQzcE64il7GteKKLVoCYbpWp7vn/PnJOKyl2UaByvNWecsOAhcIyfLD5CB0cRduEgQcJrKGm9E9ZospG6kkgwZpgu96DtBk/w5D1/Xb9WqxJ9++vyYtKX8ukfQOxt1Cbolp5t4feZNoNZaXTkywUWs+yeO4RY0DQ/IJL7QBfpR7TOEZAMGQIzVtZn6TZz7SaHEf7FXcv7P5OI3/X6tuBQAYQw+gqzdfYcaBYG0hLs1dICu6Jp79ibFRwDgJjP0RPuCq9ZjDV5vpeRq0M/8byqwnRVm4nGvoU/D48EzSdWQNo0IOqaXeUXS5r2JxOc1hPEak0ZYAY/cdAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEJJOVhOSnVZdVY4UmhPVDl2YWgwWDE1VHptbzJ1R0JyODRLSkVvQkZhZkp1?=
 =?utf-8?B?UWN5eU81R2F1andhZUk3UFc2bzRnc3EzKytpSkxBMXV6Y2xwaGRVa1BNcVlW?=
 =?utf-8?B?UUhkVDMwbWxRYk5aSUQzSldtZVFoZ3pnY1NkYzJkZGVzT1RTc2dBNVNGRTBv?=
 =?utf-8?B?UVd0YW5ObFREbWg1dTN4c0lJZ0RsNldhc1NpdlFSU1RFbXRNaURnRHg4L012?=
 =?utf-8?B?L29HaHpFVW4zc3VoejVoem9YU0M4aE9Hd2kxb3laNXRwUjYzc1NvWGozN1Iz?=
 =?utf-8?B?R0tVbXA3TEVkRFBIaEtZNVNKUWFKU0kycHpFWWk0d3BLRGlva1B3TEdhV3Vv?=
 =?utf-8?B?ZnBGaS8rNkhlQUEzTVZUbnc1LzBKU3UrQ2FqTTdONDlaWUNUWkh3Ky9tNkc1?=
 =?utf-8?B?aDZWQnRjWENKbXAzQmQ5anVoNEVzWFFQb0hDOTZRbHNzMWhoRGFJM01Id0k0?=
 =?utf-8?B?anMzUlcrMXlCdE5xTUVyaHowaHRGUkI3Qi9SeHFRSTcxakFBRi9GUjU0ZG81?=
 =?utf-8?B?UjV1KzVma1BBZEtYQ0c3Kzl6RkhSanowQnZ5YU10TEZJUnd4VVN1T1EvdElV?=
 =?utf-8?B?bUJNcVdlYzFBK0pJK1d1MmJncWUyQXI5eGVHZ0d0bFVEVTlZci9XK0VSSTFX?=
 =?utf-8?B?cVdkWDUzUzRUQ0lPR25Ba2w2WEh1allMaVhLK2hSa0loTllOYzNOcENaNWov?=
 =?utf-8?B?R2RvRGR3OUdOWXd5Y3h2ZldzZ2k4Zk5CRkxQVHZCR3VITk91Q3VTTnRHdGVj?=
 =?utf-8?B?Qm1xMUhyQmkzcE9OZ0ZGM0ZnalBCWGlKRGswRHJ3YXROdXZRY3VERUJFUmJn?=
 =?utf-8?B?L1ZVSytyRGtmOWxYNVZza3pOVG54S3ZjZ2tLMjAyenpIOEg3NkRvdVVRUTR5?=
 =?utf-8?B?ZjNUUm9SOWpoNGpiVjZYVEJ5T2kraGNqcUZVSUNGV2U2TnFzRUhZQXhVajJW?=
 =?utf-8?B?UGgrVUhhSWxhNEhRdlJ3RGVrdEZ3K29WYjM4U3JaQ25vU3Z3dWpLcFllS1d1?=
 =?utf-8?B?Qmw1SzFVT1lqZ2ZhZ3VqamZtMlJoZzhzUnM4Tk5FZlF1S2lqQ2xUZE04aU5K?=
 =?utf-8?B?OXFxYXFaNVlhTmNRZnMwUFdpSlZHYThlZFNVcURhT3g0Z041Nll6ZFZYRWlL?=
 =?utf-8?B?YmU4L3pWYnlnNVJkeStrM1doZVdhSVgwRVJOQ1dKN3EwcVVCeFErS0JRVjZX?=
 =?utf-8?B?VUhNcUFVUldnOEdjQU1pQ2pzOStGcWhkV05wTmNOdDdBRkVxODZWd3I2WXpp?=
 =?utf-8?B?NGI5cWgrdDdCT1l2SUM1ZkVLNThSRVZtbGJDS0daclFkZHFySW5HYkRzbGth?=
 =?utf-8?B?TVlvYjBWaExNRFNnZGhjSnkrM1RWNmU5MzlCemMxT0dFRm93ek8yUlBkMjBu?=
 =?utf-8?B?aHpkYkZRcUJ1VFFKR2V0WEFQN3BEMnRBZ2puMk04SFlFblY4enU5OUhaU1B6?=
 =?utf-8?B?VFk2ZDAwakU0TzVCRmgxeVNkNGlQaVJPT3cyNjhmbVRwblJCMytNcFVYVDJt?=
 =?utf-8?B?bVJqZ21ESkJGMVl1QXBaZXVXOUU1bkRYWDZzUmhSOGRzOGxCbjZURW9UVHZS?=
 =?utf-8?B?UWYrblhOQllkVVdVblZuYlUrelVQaG1HRmdUU08ramFzUm1WbE1XZm1IY1Ni?=
 =?utf-8?B?VGxwRm10YlZIRzBNeWc0NVNxN2ZBSU5Td2NOdmszRmFvaVMwRTd1aFA0T0di?=
 =?utf-8?B?amNVOEJsM005S0JaT0o2bGhyRmlRUTY0cEs4a3BUZEoyM2UvZGJtRjRkRlR1?=
 =?utf-8?B?Y1RSUU85QVlmWHFJMG0zcGFKcnBNVk5WQnEveDQ4Y1ZpV25wRXBzaDNURDNL?=
 =?utf-8?B?ZWNwcmw3ZW5scFBTcTNxQ2tMWGZKdXBNZk93TldpSTZSOU5oeitCZkZZT1ZK?=
 =?utf-8?B?RDJ2dnNrOVRGa0lzbEl5NXpURFg4dnBHYVl6VDRBeU5SQWMxR1IrYXVHVVRI?=
 =?utf-8?B?TitLUzVkQlFsMkQ2d0JyY3Zib3FvK3Brb0hnV205V3E0M0xhc2RjWk5hbU1u?=
 =?utf-8?B?UzNhQXF4L1N4bUQzRCtCRktEQjh6RUJPZzl3RmI1WWdMbXAydHNFdmlrZEwy?=
 =?utf-8?B?dzdGRlcwZ1FKOVVLUFdHejJidzA1SmNnSFdLdzg5OEwyaEIyeEhjOFcva1BX?=
 =?utf-8?B?SkRoTTJUNGsrMncydDhndUNZQW14eUt1ZXBRSjNEZzJhdDVrTThpWmZWQ2Rl?=
 =?utf-8?B?VFpETDZZcHhvS2d3a2lIR0Y0YlBKTVBYSGhpTFZPYTc4dE4ra2FvUThlQnFC?=
 =?utf-8?B?LzBNdCtuWUp2Z1FZQlZQZHE4VVZYL3BOUkxXZEVGSlBFOS85SnY0UkJTUzJo?=
 =?utf-8?B?dFZOZmRQRGliY3ZSNnYxakdlUzJUWXFOMGIyRWdOMEtMZzJYL3Y2R2cxNDZ5?=
 =?utf-8?Q?zYszcD+emp2ZFoQs+Uvvi0lEjgs3jFaBvaTOiMVnzFKIX?=
X-MS-Exchange-AntiSpam-MessageData-1: lrn4Vc25tklzvQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc7046c-70f8-4ed2-0c66-08de8b4b81f5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:22:35.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7opoMUzE72E6E2r8WPCBGMeonEdO80OOVoDfN7xuZGTTrMJ7pJgpNZJqA1pqtlgrKSg//EhfgRxjtEjin+tIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

Replace the nova-core local `DmaObject` with a `CoherentHandle` that can
fulfill the same role.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 62fc90fa6a84..bdd5eed760e1 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -7,6 +7,7 @@
 
 use kernel::{
     device,
+    dma::CoherentHandle,
     fmt,
     io::Io,
     prelude::*,
@@ -19,7 +20,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     driver::Bar0,
     firmware::gsp::GspFirmware,
     gpu::Chipset,
@@ -53,7 +53,7 @@ pub(crate) struct SysmemFlush {
     chipset: Chipset,
     device: ARef<device::Device>,
     /// Keep the page alive as long as we need it.
-    page: DmaObject,
+    page: CoherentHandle,
 }
 
 impl SysmemFlush {
@@ -63,7 +63,7 @@ pub(crate) fn register(
         bar: &Bar0,
         chipset: Chipset,
     ) -> Result<Self> {
-        let page = DmaObject::new(dev, kernel::page::PAGE_SIZE)?;
+        let page = CoherentHandle::alloc(dev, kernel::page::PAGE_SIZE, GFP_KERNEL)?;
 
         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.dma_handle())?;
 

-- 
2.53.0

