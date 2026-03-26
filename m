Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A2A402436
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538546; cv=fail; b=qlsCPUvMgq6gMQJL6aMibb5yArI5b7uF8qtH3XYLTdiMYG/dMJ50XVALxsZ/5yz4VqzD6ZLu2mk/bYsUQbw0UtFySYytDdLWRuiDxNghagGnDUtvCUzn3khWr9DoQAt7aPhB9w4fNNu9xB7KQUZsq6N73L9vkybVcvBBOcdwOJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538546; c=relaxed/simple;
	bh=oRvEojYWqiVmqA2SsbYvRsX2wSHF08/J0m73i2njv4s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DKYBy0kKuwJkWYb0BLd9BwJPJKboj00sOo6kwXR5zpN2KrkRTlHiXhGISsoZb77u62AzSqk5Z9Mus+3D4tfWwUtcSl26jGng/PYCpzCgQriKLXxKWm2kMyiryCv2iADUf3shj0y2qSHPBltJpYhB0bWgZzbf32JdDDHgvOMzt5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZvhTKHBI; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZvhTKHBI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXDndl7hojGhHQKFoEHTUhE10aBU1hgzqJtmKrAlm+bxYwlEC1R8P7yNRhl4Y2AsLKWpfqSaSijbg6svTav5WTePG0oY3FulltQBrDfntFwZ72Vf8oR1VZPa+WDBoMjZzkZdaqok2gu9J90UY+Nt9WjNx5krFedzy8sweuNrmLGPWlWy3i/A2Q9SIraM3D8JiTbAJ/9N3yAOY6HfiNUnojQq/EQDbQ73mfT52WMCIDxDT8kRWudQ2IOZeUyzZa77qXUvW6hQryHrmCu7VxEYsxn83epe5uvqwJXCZcwJSMWJDjMPEIoWz2FUAmQdUdzVpN6zQIvnjD3QOxQuGp7tRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3I017rWFlcUiqECWKqv4C3wiCUF/u1SgALaw9fV9Qw=;
 b=N2fudP/ZVy8ofr0YiSMUpw0b2lKrNpxD+immFbXeVYQMq3azi5CjnuC3H628+14VKYp7NSWZmqRWq05sYjtkFnHDF8O/00/KV0ZqfhzMVgkGG67FkGsm9RMqDbR3C/bSEgRR4gUKRPZotsS46bLR8El0vi/y1xZg42mJkgy7BxFHkP9RJs0bPuYBWGB7nOeBm8DiUb3PYFrkovGgf3BX7Dmul9nF6/KeUymULGzZkXZPx+gAf6PHSbRNzuukoxLofiVB2EtSRd97NImfd1aR2TvUIWcZ4BGzKaHuNwMRvIVXtSHdm08QSOtnjER960+YQMXHzjwCfDTyZoc35Zw41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3I017rWFlcUiqECWKqv4C3wiCUF/u1SgALaw9fV9Qw=;
 b=ZvhTKHBIe2MZzhrzrcXaPow+CUaslX0KLNR99AmSSS5jAWJkwqHDZinv2P/P6p6PGAWqwA6jBy4nVRWTSEpZ4mUIlMLill2oXJ0icbzJ2U9fHFWCpwZzPRBDrGYZphye4Rwveiq1w2hk9otXGPG+zEtVC8fohR3QFb5hMveqF7sioCQezwsXEAhBSZpBPeciv4bWCPc7gFPcEQMLSiGfYJ7yXNfA+ebO0lxSRl2chFSzEbX5JonAKjBw83M1CGzLlblm56oQz09k+PjMTrsY8Z2kxgHj/oF5P/M4assk9xYtj3E0I66jyvNRt0Pq8GAqnoPzQXGJnGUTslYXtvn3Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 15:22:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 15:22:19 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 27 Mar 2026 00:22:07 +0900
Subject: [PATCH v2 1/7] rust: dma: add from-slice constructors for Coherent
 and CoherentBox
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-nova-dma-removal-v2-1-616e1d0b5cb3@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0069.jpnprd01.prod.outlook.com
 (2603:1096:405:370::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2796b0-e1c0-4697-ed84-08de8b4b7881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TbHT8/mcBMQJcoO//wGf0cNw+AGx639jhkmXnyh4zu2MqTeDscWTt2ChuVJur/5Gt5BAb6Zga4agO9BwoE8fkWr40Qy1+pWZa7b2u/g7OSgywSAbk3GDGG8ea7Q3z3vxJLMa752vmYZ5oVvIkkDlKoD852XGEo55s48w7lkAILwz18+UE6bsYegmF1I8cJ3ZIpqeRmqqUxlcumr2BL7Qb4hK98YIiHynCjS5VXe3khje/yYgF/AaU1qnqcFTPXqcFX5WfL2QoPAnxiykSuR9Y/EnRsh0F+GdsW6S+T5JEARzv0JSngbOgBRdECUe0opVC2b2q2Hk8fx5BI+xamNcNrpZk7+1rdWbuXuHDR6IVud4lzXxia1leY/Eh9rLGJQCsEd53mVP+qpYF5g6Iiygz98/WJUOieq1oYOuWW4cET+OXUNtucNImX012VygWaZwxQSZc0cQXEAwlWfSS3SODk3/6SOuy905ReJSX3nWRpo0NhRWd1Z99SZPvPOetnwcvSsr6K9OrmSB3fopFCn9l0/b7V9SBVLpQ2MnNybGBcn9NzwTa1Gkv/r0c6jut2F3Qbssr2IBaKI18B2gQ8jLQjBH9aySzx9SAqpf1KQ8DESce2N6tj/XAGfYUSwflLWi3DOaKrADip1y7kSzDZkLgoH/SmXjuGVAwh44/HyyfTphGvA29KUt+NKnLFKi2f4XNd3SSi+DVzAj5JSyde966MErlDcEoTzqvVFWVdS7yEXDW4ZQ0WJlCLVGplyu9CPSHqi11XG9/GE/yW/+ukMNmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXk4ZUhIU09oVm5iNlYvekRPc1dVdUwxUDJMa21JUmFEbVB4YTZMdWw0Rkhv?=
 =?utf-8?B?QkM1YXpYaVBzbTRMUHdnZDd6R1Y0VGZRSjBRK3ZQVURESVFXa0FPU2lFYjVD?=
 =?utf-8?B?UllTbGNzaThNeXppTEMvVWo3ZFlNUURhKzhETG1WMURqRzQrdnl0bnZaUW5P?=
 =?utf-8?B?aHlUSXNtdGVnaG9KeVhCa1NXWGVscytGZFFsdHBtbTR4aC9leVp2MHRKcTMw?=
 =?utf-8?B?UFhFQWltenFnamovYTJlNG5mZHJORDRzRDhmY2JjRWx3Q1EwRTJXVDBML1ds?=
 =?utf-8?B?dU1pMmM0NXY1bWtzOTFpWFNyOElYckNQUGdydlFaU1VxMFZXUEVUdFVrcEVo?=
 =?utf-8?B?ZUVDeEZQWnhKL2luNks2V1dSWXFQMnpSam1wdkNwVjNITGJzOFIzTzBjWHI4?=
 =?utf-8?B?ZlQrUjVtOVJiano4VFBxWDFDS3hicTlubnhVRmtKaFNHWGNTZVpIeGFMS0I5?=
 =?utf-8?B?emI3SUFybEdFV2dyaW9xMzdna2pMNExlWWlnQnVVVFJqVk13cWhKdmZXVVht?=
 =?utf-8?B?eUJEd3BRVHlpaWJpNks5ZUxmWHQ3VXR5Ti92QUNhN3BldmZDY0dKMXAyZk1G?=
 =?utf-8?B?RmI3VUh6Z0RVNUJYbmxEZzIvL3NZTkpNUmFkYVRMWlR0V2tBSGRneldNYytt?=
 =?utf-8?B?QUtWdmFva1NFaXNnMElyaU9TcEJqclY3NGo1TVhFU3ZJUW4yWmd3MFpodlhs?=
 =?utf-8?B?SjJCcnNIVTE2RVFXRHUwVEQxaHhYRW9CYXJEQk90RWJ6OElNSVp2WjU0YXVN?=
 =?utf-8?B?T3BNblN4WU52bWdBQ1R4SlRKbHdZTUlYVUYzNXBKVG13MUpyejgrQWNxbVJL?=
 =?utf-8?B?aTIvNFJzOTN3RUx1U1R3Mk5qZmwxUGsyZlpGZzFNTTFoSHEvQ0I2ZkZydlU5?=
 =?utf-8?B?Nlo2eHdBbUxFN1pGR095ZnBEd3V0aVB4OHFQOWtDUldaR3BRcWF6S01FK3kw?=
 =?utf-8?B?K3ZnSjMzUmZHcmdHUjRiZ2t0WlplOExpNjZ4MGhpaTdPQm8zU3hIYWJGM09y?=
 =?utf-8?B?cm1XVjJEV1NKYUlVNm9kemVMRlZtR1BjaWtVTU1xQVJ4b2hzOE16Z2ZVMys5?=
 =?utf-8?B?TlBxS2FxYUgveWVmQkNnSFgrS1I5aFJQWEF1Ui94cUxpYUVxSE5DcmROWnZs?=
 =?utf-8?B?S3FZTXhiNGdFQTJOd2dOUlFzYktaVjJzTVdHNlkwOHE5bGJXaVZiL2hac2Yv?=
 =?utf-8?B?K01LNHFRMXBKY2RYemV3d3I0N1N2Y2FIWDlaZGtkY3hiRDRBemwzNFYzNUkz?=
 =?utf-8?B?Z2JiTGF5ZlB3NCsrdThXdkxjQW9qTTBKVTZQQnZNbENiUGJ2L2RlVGN5ZExP?=
 =?utf-8?B?V0E3elNtUWpoRk9kY0FQd0NpWU51R1V4ZUlEUG5oY0xTQkFqYlZvbXIvU0Zk?=
 =?utf-8?B?TGM2U2ZRYU5SWEJSeFhhcnJMSGdnWUJTVUdHeTV6QnhlMDU4dVhnSS9OSTBy?=
 =?utf-8?B?enJ0eTZMSDg2S2VHT2Roc3JrajJmQmFoR2ltL29WbldXTXEwRjhML1F6eG1R?=
 =?utf-8?B?d2NnMUIvRkFiT3BtWFZRZkZHZ29TdWFEOUNRWEZ3ZFZWY3ZyOUwyQnMraUhz?=
 =?utf-8?B?L0k4NkNpbUMvbWQxZ0JTZ1g0U0tESlExVU9sK3FZaHVQVDNFTFNGZ3pveUpX?=
 =?utf-8?B?Zkw3K1ZFL1R0U0NOaUNBMHdWbWxxQmJRVGVQRFRNeUJ5VzdlSU5RZnpTUmRu?=
 =?utf-8?B?RE1QK081TEJUUzhKcm1DbkxHV3JINHV6Q2l6K2FVUDc0MWdPMXJCY05Ca0xh?=
 =?utf-8?B?cnZTM0FrL1EvWHdRUWJmTFJVVml1Sld0eWl5V2Y4a1BsVFlES05SY04zNjNx?=
 =?utf-8?B?dTVkdmVqT05HdG80cnpNQ0N2dWFEeUVkbVBJdUFWVHA2Wm1VK0Z3RXZQYmFE?=
 =?utf-8?B?V21rWDFDOWZldy9pY0xMVGdvbWxxSTJUNHAwTjRBRFlMdnBybFNpZXFvYm9m?=
 =?utf-8?B?blYzVzcwUlRGNHhEZ25JM3YrUFhYc0VINEwyL3pQYUlqZ2dLNWI4aEF2ZHUr?=
 =?utf-8?B?VXVLSGRMcitXVGRJM29xMzZCTmF1Y2pxdzZmSTA5Z24zaVlSS2I4R3RwYzFC?=
 =?utf-8?B?d0Z5enh0UFdIdG1HbzBZV3RhVDdFVE1jR2t0aElBa2tqS1BTaEc4TkduTkVh?=
 =?utf-8?B?b3dQM0FOdys2WXk3N0VTbmJ1OVdUZi9xZWFDOER6NVBLZnpKN2llSEVXYmNN?=
 =?utf-8?B?c3lQSkQyUWdja0pkek1IdFRZUjc1SXo2NnJFOHI0eUthVnpEamxUcUlUajMx?=
 =?utf-8?B?Q2pKSGJGSE1ONGJ1c1RjVDJNY1JTQlR0cGJxUjVZRzZLRnNNL0JZVmJOcDdD?=
 =?utf-8?B?dldFSVJ4UUduVkl6R3g0aExUbXp1bm02NDlpb2MxdmVWNkFORENqc2ZWQkVq?=
 =?utf-8?Q?8Y+0AE93FEDFIz6zDhz0AuCaSNw2d1KwD2fE46sSNI8Tu?=
X-MS-Exchange-AntiSpam-MessageData-1: AgXrt+dEECtmaw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2796b0-e1c0-4697-ed84-08de8b4b7881
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:22:19.6370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64dHzJVatRy7UeB4ewWLG/4NUFpbngeZebiGShBMfwEkXFCz+bwYJS8b46JfRoU/nUXLEvoP3TpzQIdsav4I2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

A very common pattern is to create a block of coherent memory with the
content of an already-existing slice of bytes (e.g. a loaded firmware
blob).

`CoherentBox` makes this easier, but still implies a potentially
panicking operation with `copy_from_slice` that requires a `PANIC`
comment.

Add `from_slice_with_attrs` and `from_slice` methods to both `Coherent`
and `CoherentBox` to turn this into a trivial one-step operation.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/dma.rs | 107 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 8b7a9572ead2..40799fa418d6 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -453,6 +453,66 @@ pub fn init_at<E>(&mut self, i: usize, init: impl Init<T, E>) -> Result
 
         Ok(())
     }
+
+    /// Allocates a region of coherent memory of the same size as `data` and initializes it with a
+    /// copy of its contents.
+    ///
+    /// This is the [`CoherentBox`] variant of [`Coherent::from_slice_with_attrs`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use core::ops::Deref;
+    ///
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{
+    ///     attrs::*,
+    ///     CoherentBox
+    /// };
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let data = [0u8, 1u8, 2u8, 3u8];
+    /// let c: CoherentBox<[u8]> =
+    ///     CoherentBox::from_slice_with_attrs(dev, &data, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    ///
+    /// assert_eq!(c.deref(), &data);
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    pub fn from_slice_with_attrs(
+        dev: &device::Device<Bound>,
+        data: &[T],
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self>
+    where
+        T: Copy,
+    {
+        let mut slice = Self(Coherent::<T>::alloc_slice_with_attrs(
+            dev,
+            data.len(),
+            gfp_flags,
+            dma_attrs,
+        )?);
+
+        // PANIC: `slice` was created with length `data.len()`.
+        slice.copy_from_slice(data);
+
+        Ok(slice)
+    }
+
+    /// Performs the same functionality as [`CoherentBox::from_slice_with_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    #[inline]
+    pub fn from_slice(
+        dev: &device::Device<Bound>,
+        data: &[T],
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Self>
+    where
+        T: Copy,
+    {
+        Self::from_slice_with_attrs(dev, data, gfp_flags, Attrs(0))
+    }
 }
 
 impl<T: AsBytes + FromBytes> CoherentBox<T> {
@@ -839,6 +899,53 @@ pub fn zeroed_slice(
     ) -> Result<Coherent<[T]>> {
         Self::zeroed_slice_with_attrs(dev, len, gfp_flags, Attrs(0))
     }
+
+    /// Allocates a region of coherent memory of the same size as `data` and initializes it with a
+    /// copy of its contents.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{
+    ///     attrs::*,
+    ///     Coherent
+    /// };
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let data = [0u8, 1u8, 2u8, 3u8];
+    /// // `c` has the same content as `data`.
+    /// let c: Coherent<[u8]> =
+    ///     Coherent::from_slice_with_attrs(dev, &data, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    ///
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    #[inline]
+    pub fn from_slice_with_attrs(
+        dev: &device::Device<Bound>,
+        data: &[T],
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Coherent<[T]>>
+    where
+        T: Copy,
+    {
+        CoherentBox::from_slice_with_attrs(dev, data, gfp_flags, dma_attrs).map(Into::into)
+    }
+
+    /// Performs the same functionality as [`Coherent::from_slice_with_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    #[inline]
+    pub fn from_slice(
+        dev: &device::Device<Bound>,
+        data: &[T],
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Coherent<[T]>>
+    where
+        T: Copy,
+    {
+        Self::from_slice_with_attrs(dev, data, gfp_flags, Attrs(0))
+    }
 }
 
 impl<T> Coherent<[T]> {

-- 
2.53.0

