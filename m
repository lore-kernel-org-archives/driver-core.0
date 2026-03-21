Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D163638D6A0
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100215; cv=fail; b=EINkWSVLlhoaaHzY+L7+PThYgP/2F0HuQgUcPazl5+vP1CKakP0YdXHaTbjuqv3OXSCEbOJbnNQhy95Po6YQo88eAqwKZt7CH0F1agkQbCZOCJXtc+jI/zgT16mqGiRcbzjBBEyjOnR4CKvWjELwrB75CiUu9IU4TmV4SecBuMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100215; c=relaxed/simple;
	bh=IdxllsPhyrLEJfv5MoRH/1+R7KfQ3geA3hX/scpjdDI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UGfhvFZXFeHMCjyqnA/zaXufL8PIExPoDg/ep1nHBNIW+jSpVdyyZCKiMKCdRC/abv2E/wm3Bwba4RuzOJb/fruOMNJPYxwS1TXsJzY9RPC+KOZpE5lgYpun8cRrX9i4pJYpb35KeinKeqQNbhSFRXHvexfTIO815kOLXcoruXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N290Lyx7; arc=fail smtp.client-ip=52.101.56.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N290Lyx7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a66K26YLZ+WpO//WkVN8/L8rKsNXVMk65+ttYO2koXSFFgR7wb8NsL0VAWp+qnQL94BoyPEtywFTIH4nocRdHV2LfNXPCn80qIn3iUU5qj5fchYF1wdup/tD4pS9xn22qcZtQWdhWyspxbI+YBZAe8fziVRDjbGw0CoOuNDJtVqM3lnyYbcUik/46rZH9Pnp/TsHzT+Rviapxx+XZ/Zy6FdOkD4Lx7XomqojmV6aBh6mpjK81o2QkTlCJP7w9im2TsZdbrNN5Q2DtKX03simZEaRSkU898itqvZs+kcql0bW7DUOYptgQ6ZMdeD31NEV6c9PSLh2EMau0l6oCJgKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOBhWp3EEjcINfeYaFkhyoM2F/eV2eYv28mFVaJpLg8=;
 b=awiywY5/gb644dW44zCZDLyABnlHZw23cpTCeGuTfblerN5edUR46HdaMGkZQ+CW/iS0vr+mIW4WG330P+9Adu4Mhx6mvtuHs6xCrA1uhniM7eeQcGNxdYUlqXwdlFVjukm1mqcYVF60x6P8gHpQT7gb6EwSb1jELnQjenUmrIWz4vz3Vyse+WmgdCqpoYMu5nuXKWqgRAK4peMtZhCOzVeg4gUXbh7f54J8j6NoeVj49FI6WWAwvOjPNMA3YRhPYngD+seJohybDAf8AOPCaDn94+yixkZ+U+p/Y+KQhZgXVHyPdvD8Wl9OMU5Is2fdr7/fNuWP8z9kPebiR4hgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOBhWp3EEjcINfeYaFkhyoM2F/eV2eYv28mFVaJpLg8=;
 b=N290Lyx7eUJJWe62DEAWr0nWiVnFtByEQIpcgqWBdtI2hsp1r3dV05JeWoV3ZeCBYkPc1zJEEYmvtl+MPGFLAiozTYUVtCCJW6MFoqAERKlanRYv007AK6+6zBbBQllECgDyec0HQ+LY0gRZ+lrOyouEKsBTcYYEY7+PcmkOFOuBOFZ58FztDUxCiKvwLiwLAk38PQk5LEUJXtXqZy3zCB+vuD86444Sz58CMzjMuL8f73qo6eAIayNZVGetzsy6DPTfAXkgsxFCFbGWeQLceOxEXHfhZeiX14FpO83s9o5bDTqNGMO9kDj3+Z72scGaVNpEFyYOVukRITl0LnXuEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 13:36:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:36:48 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 21 Mar 2026 22:36:24 +0900
Subject: [PATCH 6/7] gpu: nova-core: firmware: gsp: use dma::Coherent for
 signatures
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-b4-nova-dma-removal-v1-6-5cf18a75ff64@nvidia.com>
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
In-Reply-To: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
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
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0176.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 8679b865-aec8-4b35-9cd6-08de874ee695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	hbJSZkQbqNLRGgiMwwMtJ5Zhz6SUqB8/Epy2IWWzBCnkmhpHrEpMrY5gZWu+39039Vcxuooyl3ucLS88OGbxt+usqTyePXwcJV/fW+XNw2IfwMXF4YnirKQQvsUiGYAxZ8WjqsVxs27aTWnzntbgP3KuUVU/Z9FtADNYcPw8FLq3PmGOWpax8C+pqoGFTLcjclledpZm02OlLnsMoGpVyZjR7eZQCwyK3blepTY+x8v5qHl6BEt5xyqEXmRoeonLp9+mtFZJUCxuUfWCqKqV6v0EQM99rB8TeIAo5NdwwTwSP+CIOJbWhUJQT1rS0n5N9kzR17DNA2h7pfNHc9NjM5vLFo2xCRVGGgr1VPrr0ECLkTFlRn1r9C6BS6lqUCH4Os+nGzOCaG4pxIdGm80sg95InDrRgO9wn3thfJz9SqmUm/OczbobwJkvRWpwSJOrjxauXpEoWMEoxS46A2L002hM3DEQlysKPpanRIw90+cvBG7algrRmYpJwXVw2MJZMZe4jzwchEfzyQNGKlm9hCbmBNTf7n4KOkkYDd/O9+OwFhsMyFwjpqw0CvzOgufk/JTd5wuo13Mcn32td5gNPLTMFRk6y/td79J3iLVFv+6FVgRkUnzrU5M/mu+fopRr2JlE+9D2z8OpRLylFAbvS3H1+Z53yhEvz9X1FrzzyW1hVKQBUZ6toeDQ78wLpCDCAfuI2CI7YuoeR4ULJyaRVD0xWZInIoJRVa3PyXtukF1QvDTykPIVs0HD5I+tkS5w1Js2jsvG9kU2f+sXlhXweg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnZGdkVzbkpNSmpKekswaG1DWFdLN1g0MTluQlJMRjlPWWlKQ2lqa081NWUz?=
 =?utf-8?B?dGY0SGtwVUlac0VaaFpyVnFvYi9MQUwrR25uQzlEY3BTTFcvM1UycWJsVFE4?=
 =?utf-8?B?cDhicjBDenVydmxVeDZmeWhiRWUrd3hRMVRsUkR6azNaMERYdlh2RFh2NW1G?=
 =?utf-8?B?MGVYYWpoTWR2UE9lbUJJdmliVTFrbVNMeU1HV3I4ZnplMFRiNGdWK0JhaG5r?=
 =?utf-8?B?OXJSSVpqSmdzOWpwVUlURlRVZXpKcEZ3TmIyMjNsK0hEL05IalhLRG9BdEJa?=
 =?utf-8?B?dE1JczlOMzd0cTNRL0dGeFYwME9RNEFkVWNZakJFU1dhTE15TFR6MUIvekgv?=
 =?utf-8?B?NGpnVlFDOVZNTEVKK01NQ0t5OUhEdTNZWE82bFpPWElqK04xVlhhaWtIVlE1?=
 =?utf-8?B?eG40NXpjV2J0em1GbEUvekphdWdRKzZJdGYyUEErK3VkQld5STh0ZkxOaFpo?=
 =?utf-8?B?N3V2NU1NT0QwK1haSGlPWFJXUm1RMU43VTZYaWFRTFhvYVV3b1gwN1BsQkpW?=
 =?utf-8?B?b3NXcmVaUHA2cENuVXR6clNFdTRnK29iVmcwMWxnV3I0c3FIaTVneklMMVpS?=
 =?utf-8?B?TlNGajlITGZST3lzbnYwRXdwR3JOZnM5aTRjbTJaUThYd1hEa2VYRGdEVmFl?=
 =?utf-8?B?U05PYWJ4NGljbnFLWWZpczgyK3l5TitzVEZnMkJmNU5rOUl5Y3FocExaWG1G?=
 =?utf-8?B?SW96SGVqclBWOTZXL2dBRlZkeUNmQlZ6clc0Yi93djMzWHFIUlVaRURLbTJ5?=
 =?utf-8?B?TDVUMVNWWWZGcW81YkpHekFqMTY4RHBlZ1pJMDdCUkZRR0IvS2xwUUJsOG5B?=
 =?utf-8?B?THU0MXljZnl3M2pkM3pLelhIUFFNWEdVWXRiejZrak9zSHNMaUVKS3c0b2N3?=
 =?utf-8?B?aXNkWTJ5alQwaTR1aENvWGY2K25xeDMvZG5BZDE4TWFnWUl6RnpIelF3dHZz?=
 =?utf-8?B?WDY4aXFWNVg3dkNHem4xSGJ0MTVCd3ova011ZHMrMm1BNkwzbVJSSksyRWNN?=
 =?utf-8?B?Vm5NT2N1eUhiQTJKcjM4RnVFWlE2YjVyS3YwQWNXcUNQblo2K3VyREx4ZlpT?=
 =?utf-8?B?b3BCb0tiS2J6K3p3QjRtUmJuc1d3Y0dBQXhnNUhEeXVYbEtCeklpbDJlMWJM?=
 =?utf-8?B?a0ZYaXc5WDJZVS9YQUZzdENEd1NuMFpoTlFVVVV6WXozSFliRmIzZ2Y4UVhI?=
 =?utf-8?B?UkJ0UTNBeUFjV2ZtbU9RcXo0akpLK1BjR1pibnlLbzBwV3hkcnFMVWEwVHlE?=
 =?utf-8?B?OC9lTE50TEh4b01PKzNhNjZoTjY2Nm9VNzhFdlIzdmNtVUwzdmVOc1ZmNURD?=
 =?utf-8?B?Q1VqeXJKc25GblVyTWdFSEoySzFRNjE4WkI5WVpacy9rT0pLdjEvanBFbW82?=
 =?utf-8?B?Sld1clZKbDVlb3RLYlVSdmRKRDAvUDNvR3hleUhkTkZNTldwK3pCRkhRcXRh?=
 =?utf-8?B?YVNlSHl6a0MyRm1uTGVtWkpGeE9iKzdBNnVIRjFQVFp5ZDhsV2Y3R1BiUXJP?=
 =?utf-8?B?VTZWNlJ5WTFmRVgwYnFxQUNoUE81TzloS3ZobTBoaldqcnBlaVJTZDNNVWxF?=
 =?utf-8?B?Y0M4N1oxSUFrb3NQTExxSVQzVUVvSDBMQTdwa21CU1pQd1RvNi8wOVBnYzI4?=
 =?utf-8?B?eTNNcURIVFJEQUlGc1lreU1rQXFBckVDSjJBL0JHelhOdTJsYnpSOFJ0Uzhq?=
 =?utf-8?B?UE5oUTIwQlQ4bGNCVzFZQ3dXVHh1eGtHaCtOZG4waWV2OVFFbk9Ld0Y5OTVx?=
 =?utf-8?B?VGQ3SHJaRzZVZ0krcGZxV2RGbmhiazZQSFBNbk5HSERtZkYySUpZZUl0aUY0?=
 =?utf-8?B?R08xMHNCWHQ2TTltMFdTNGhZVzV3aEFxTzJsbllmcHhZZlVWcHdFMjRqZjVF?=
 =?utf-8?B?MnRsVmpVcVlUYmplWExKdDJQbmlKc0V4NzdBaUlSNVlJK2tITmJuRmJKb21Z?=
 =?utf-8?B?RVNKTnBhcE1hQjBUSE5TZVV2dzF1bDgzbHdEWGpoK2Fob29neEJJdkk4cDVy?=
 =?utf-8?B?OUo2akdDYmZDbUNKSVVBUVpGUm9hWXVPSk1WZ2RKYTkxb3FTc3VYbk01YjE1?=
 =?utf-8?B?VDk4bzBickFxVEpiaGtEN085ODdvU0JoMFlGekVzcTB6dC9neXJ5OHBBdERE?=
 =?utf-8?B?K1VhTUZLSkFmQzd6WmFWNTZhYmVtTmpaanBpSmdSYmlUYnFoOEs1VEtVWEEy?=
 =?utf-8?B?VW1NcU5FNTM5UkJyZ0dmRkd3UUZveW9pU3I5c2NiWVFZK0UvQVlMcU5Wd2Vx?=
 =?utf-8?B?akMySVRVbVN1ajloSERJQm1vRjlWOXpwbVF0SHRpNlhVYUtPOXhIZ284V2xC?=
 =?utf-8?B?NzRxNG81ZTV3YVNEVWpMWWR3bzNXeURZVEU4dnpxVkVBZnkxcVI5NW5XUGFj?=
 =?utf-8?Q?ij/hyMJoeL0HUNH297bqp6I8oV+u+vKrJfLgOMiaHBMCr?=
X-MS-Exchange-AntiSpam-MessageData-1: YTY/SeEsgL2wlg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8679b865-aec8-4b35-9cd6-08de874ee695
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:36:48.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u4W34z0HVgzwbq8l0iUquK3Y67ROO1g0OBZqzX1b+DjsHyOF/0bUQiYcbKJQmNa6f2U1BKr2Vir9pITqyU/6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133

Replace the nova-core local `DmaObject` with a `Coherent` that can
fulfill the same role.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9488a626352f..1e0d545a74fe 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -3,6 +3,7 @@
 use kernel::{
     device,
     dma::{
+        Coherent,
         DataDirection,
         DmaAddress, //
     },
@@ -140,7 +141,7 @@ pub(crate) struct GspFirmware {
     /// Size in bytes of the firmware contained in [`Self::fw`].
     pub(crate) size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
-    pub(crate) signatures: DmaObject,
+    pub(crate) signatures: Coherent<[u8]>,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     pub(crate) bootloader: RiscvFirmware,
 }
@@ -226,7 +227,7 @@ pub(crate) fn new<'a>(
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-                        .and_then(|data| DmaObject::from_data(dev, data))?
+                        .and_then(|data| Coherent::from_slice(dev, data, GFP_KERNEL))?
                 },
                 bootloader: {
                     let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;

-- 
2.53.0

