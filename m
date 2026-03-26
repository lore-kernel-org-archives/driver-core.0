Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963B73FEB10
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538574; cv=fail; b=CDadmVqC1oc4LenQ49apcIiU5EASWR14OJANQWvqSyLAgBJot11EJweBiMryoVuRrELsW64MsF+2oKmP/26mv21ZisWdxWBergk11+UKZGfeHeG7WycusUAVZEH0zk6F3kEsyaOm9y8gsLxN8hhVzIbr8cNCe6RQkirvUMoXgLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538574; c=relaxed/simple;
	bh=N9tOzynec3u59QnipEkvP+TqlTEyb0dWIunRBkJrbgw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CxaI+at/lP1vI27KHoUBtPxA8g6oLGic6rJLXZqzxWRsGt6nDRxrUe9horZKjwPiF7NjzYpno4OojUtoqqjLp9VPB5Hm+gk5VQ6SxAH2rbn4R4PqkqgUN3Yq1hKKZMcRxe3Q8gKYniTPfZxE9Cr9qqPkQzOoIXRuW+nE++EjWW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IVFRf2mX; arc=fail smtp.client-ip=52.101.57.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IVFRf2mX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1J7te6LxYoVz91VpandQKNTq7Ao28zDXAU4+j9Fna4+K48kt2vqxJEYvAJd+J177B2onoRjLTcxJKR8CXW2kIBavn0pXaQHyA3YRi6h9uan05LNUXWPRB/NJjsS2La84grfmX7lHXE2o3nymDc9f+H5KD6zHfoxcgtm4zMd4qu90fXuB4uY4qihSRWK3S7rojq/59u3x3ovZarNI2zYiX612y37MiqNFJt7P4cvKc2MDck+hqJqIvnn/+KJhKx0rWtkSzihl11y5aGazqQUwIsIlWlBNpFkW21MiVwpOqTiAdYGKO3gmCnnThOVxaPo4+9OfSNd8y6EQ2nn5lra5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISbY7jPRrk6ha1zZm5Mf4tfRAfsMOr2J0DvoSqCAo9s=;
 b=x4dfIb21J5ovPhEsEweXfjZpnbt7nAzOyg0YL4+iz82T9GLQokX67+YsHXTo+sxjMV+99m1t7Qystg6GUE6qZREw67YldrREYR8IimkRFQ++UnMSFMK/IPjkj9hCdVyxGweRhpZXLTcm8ZbwU+vd06gM+Luy0RaUlt5NblG8+6k8G0cgOaJ0HZDMPZh8jZIKtCwUw5rObs9vU8+NBGZxYl3ATvjK5kVGyDqMlsDuoxYDccGFm/zQWWsQ93P+ko1f85DijFbGIrjqEntV3k91VEwUy8R+nP3T8GmoaGBAVKi2ANDy6cwHsmohtBw27Awm7fPYnAJlz+W4USulTP/AIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISbY7jPRrk6ha1zZm5Mf4tfRAfsMOr2J0DvoSqCAo9s=;
 b=IVFRf2mXT2MPD9GHusJAx/9si3uD9VtKfb30PjpPeakaTDjgyEBLX0wBYoJZxRZM7QbfCig6gdM48nVbQnB4RRUKfwQWtAWHRYNBPCPDU3eUeezF3OpxadNWw0sRtodI7FdULgi07FXIUWwbuLk6FK6LtxZ/9nzJDjB/9WC98Lv/Nj9HjyJyNlvSYVNJrM1IbzkRDX+2fnV6OdNs8D94aLeuGb0FqoT1dgLThnxUTocX+9wtnNVhXFXdQu2C5WZHrYaJFM5zB4vUf3Raf1v9dn24YILmdte74Pb6Lqc/mJ4ySd+WiI+V72nsLeossBCozAxObMZaEGovqX0/aj8vfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 15:22:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 15:22:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 27 Mar 2026 00:22:13 +0900
Subject: [PATCH v2 7/7] gpu: nova-core: firmware: gsp: use dma::Coherent
 for level0 table
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-nova-dma-removal-v2-7-616e1d0b5cb3@nvidia.com>
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
X-ClientProxiedBy: TYCP301CA0044.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c2b25e-5931-4e7d-60bf-08de8b4b8690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jGO07/R+UYYwrLyfJDy8ZoNhtl0ts8nDgdmaWcofIGoWIecJvm3pWw4iBiBP2TcB/FPz/IIsO8ryfRdzmCToxKURrtKB4dYS1DWbaLArlBJ47ku31ciE4tBTEP3ZtDaRu2xtCdUeSzMwRB6VcNvoeJtWb+HEJqt4mI9ckhqRFYnXqGnlup2UDFU2yv+8WX7GcOiIH86WKCpqNSJ5E7Flh8k4Rq9ECard0cq0TBiozDpVnw24T0Wu3nKt/aM0feRrfHkp1VOmy8VQkUe54si1Tbz//80eDx/m1l7WHn0GhLR1H/6DaTOPypFfeX8aruSmj6WMfSbGGiVp+QP58lhY4mE8l16m8d6uU+MCEcsAo0KP0PPq06kx6Tj1/XGqZuvEwmWCWMdfr7UAXox/XVqcFq8tVrTW6EsI2rTYpTRp2JcctJZsZKKtZ5QpOs4ThaXYiDOqBQ182fQg/gYKz2TokjQ68mA/GWDTuj9kONGFypBK+T4ZiQvYlTVR3Bp5qZsHHZO6hC7nKn1MzEzPGGfR68wKJHawefqnzOjsa63pMrBKEAEK+Ju0qauS9sHnV8EqD/m0TZ6S51cTFXYHTeFFYtEfmJJO1yu0OlvjGlnUjKAtUrCQvAaMl0oRVVpoMb4PhKXVoRlQsN+E17PMgTriEC7mSw7RUxH3b5gcaxHZJ1eBRPF0q6SbFGFH8Sr45hqH38NxWSWFBl7yFrKUyRrP5WwHoYmHs23HsjkDoSDiT6riUq6n/0SkfO3INB3KuImwkSGbflBdEiVNunHoPbkkoQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUhONnB0SE5hTUR6YjZmcnpoT2pveXJhQzZVam5IZzhEaUJGcWUzSW96V1ZR?=
 =?utf-8?B?ckIzalhWQjFaYWZ0MnQrNEpBbElBeEwrV2IvUnhqWDZwRlF1cVRQcWlScnlN?=
 =?utf-8?B?RSs2dW9ySkNBQ3grWkdOSDUxUm9XcHdtSVo5MjBsMlR2cXF6UFhtREE2NjBw?=
 =?utf-8?B?cWwrdzhQSTFmRDFqUmRIVTVLWlQ2dTF6NTVPb3lIYXpEaXJJa0hVSW5Bdncv?=
 =?utf-8?B?Z0l0NVg3eGZrUENid0FpdHZYeDhZOEg4ZXVZSFk3bFE3aFJ6bzhkT2Z5Tjd2?=
 =?utf-8?B?RlJiSmpLTU9ibGdoUzF2TUJySC9TQlYwOTh2cUxYeUJPakhwZjUyNmZJSm9O?=
 =?utf-8?B?WldqZmw4cExnaUVKc2dpN2Z5TUNkc25ES2pvVElacXFheWFiNEVSWkZrb0JW?=
 =?utf-8?B?b0xmWFFJeEFPbmpMR1lRM1hJQlI4VXdOM0Uyck1sS01zUUNOZ2piTjlQUm1K?=
 =?utf-8?B?ZnlDbVVCOVpBWWVVSHhkcUFlbmdTdVc2dmdjNXVheWdOaG00U1N3NW9tQjZK?=
 =?utf-8?B?YUsrdVMrcS9jTWF4R1ZUd1lVeTQ0Y3RnampValI5c0RWNTJuSXlobG5VVFMv?=
 =?utf-8?B?cUlLNExFNGdZck52SzZ1eEFKUmZIZnRvKzVYazUwSHR3QXI3Q0k0TzZwQVpu?=
 =?utf-8?B?OHRHcXdoSzcrUmtNcThIR1FVUXdDdUI1OHhoUGZRSjY1aG1KNDFzMldyRUhE?=
 =?utf-8?B?Y1FEd3FQOFFvSjQ5RWxMTS9PdFFGdnZQcVR2cW5aQ2hPWXhKTjJkc0JYZEph?=
 =?utf-8?B?UGJsdkhaUDJ4akJ0U1NhM01zRlFwenNsbTJvSWFwZVlVQzlJWkY3T0ttU1pC?=
 =?utf-8?B?dXdzVVRIUmRVZXpJZ1lDZHlXUnhCcWI3enZHeHcwV0M1eit0em54ZzZMNDh3?=
 =?utf-8?B?OGxVbVlaRFBwa3ZoVExvdEJVMXRMUkJSM25yVzBYR09IZTRWSTk5c1VjS3Ri?=
 =?utf-8?B?SGord0xWTjgrSXZJZkI4VU9JcS9OWU0wSzFDcTVaMmRNK1lmME4rQTYrakYw?=
 =?utf-8?B?QlR4SjRnZExlRFpHQVZvT1F1Q0dqbmdGakVZVFpFS0ViTkJWQWRVb1hNbURL?=
 =?utf-8?B?dTVvMi85MmMrWGRyM0dtQ00rOFo3b0IrdzJNVW1NR1hkZDJHdnpPaXRKZlls?=
 =?utf-8?B?SWRyMTNPbG9QemtNdlVUcmtibDZxNmY3UHFTU3A5OWV3OVRTM3Z4TklFeGNX?=
 =?utf-8?B?TGROa1kxNjhMN2ZKL2dkaUZQM24vTGU0cmlXREhCODkxWERGT1FIQW5WSXI5?=
 =?utf-8?B?OWQ3MUJXMlBxMU5iMXJGcmNqeGxrYXBuSE4yTXhkYUlCSXk4NTJmeXhvTWtE?=
 =?utf-8?B?bkdUUm8rUHJTbGlCeERzV2dDaXNveHZGQlRLZXZ6SHJZNVBjVC84Tkw0eXJ4?=
 =?utf-8?B?U3ZncTNlY2NwckFuREo3V3NnUHE2bFVxM0pkUFFQYU1sdnZBQ1A0dmpnZ3Yv?=
 =?utf-8?B?N3JoVUNIMUc4L0ZnTDZkRHFoZEd2TGpqeVpNOEEvYUo0WWp1eDdmRGNmaElJ?=
 =?utf-8?B?KzlpMmc3ZENaZGR6VStvb05TbWQvMXRaYkFZSm9McHN0Nnp3VytoQ1dlYnly?=
 =?utf-8?B?KzRhMmVSZ1B3OFg5aUxqdEorK1hCdzh3UXNYWHdoNjhpNGtWZElHWHNpdkZo?=
 =?utf-8?B?dmRzcEhnL2dnZFdCN2FoRVlFRXBVcHkzREZUNFg2WHVRVjB4Y254d2NwWFJD?=
 =?utf-8?B?ZXh5ZDI2dVEvWUY3V3JSZ25odW1FV3QrVUtTMVJ0cE5IbzZZUSsvclRPN0Qx?=
 =?utf-8?B?cnBVU2RCemJuQkZrVk1tNGNIbTBoS2J5amc0bTc3ZkRiaHJVWFN6RFZUVnZq?=
 =?utf-8?B?anZ5UkJKdXJtM3lxazJhWUEyMng2ZGVPbjloMlVrSWEybGhXQUdLQ0dVZFJp?=
 =?utf-8?B?cUcvZDFEdndYd0MxcjVXZmV0aXVKZmVCWkpuOEczVkxCQ0RJTHJBMUxUQ25i?=
 =?utf-8?B?Z0h4TFFYMG9CS1ptYWdzcEJncjBjenFHUFRlejVQQ1Q5YTZsS3RiU1I4ajcv?=
 =?utf-8?B?UWVpT1FwMlNJMWVUTWVCdkc0UDQ4emd5ZnJmTGdBZXRwc3ZlKzdsdG44dVNR?=
 =?utf-8?B?S04vM0Jac0hWQkszdUNXL1dkZXYwY1Z5ZHBmU1h2QTdLWGdyS2hobW9HL2lZ?=
 =?utf-8?B?cDBWVDQxWmcwYUwycGlESzlQM08wSUoxVk95TWJJdHBtWExmZCtFT2YrM05z?=
 =?utf-8?B?UzhUSHZqbnV3dnhXVlQyZ2xnS1ZES0RvZkJPcmpJT3hscE55Qi9WTks2czF1?=
 =?utf-8?B?c0ovVlVVenl5bW1hYjNCWjBKam85MGV0MGZBNkRJT2I2amhscDAvMElZMlEx?=
 =?utf-8?B?bklUcDdVVDlxZTkwcUxQRHhOdXRGb2FtdzM4UVIyRW93d2dPOTRIUHhmY1Fm?=
 =?utf-8?Q?bFrFkMExVkKmIJ+AIMeirvtYX4nJ+1PObNtAs+7djhzur?=
X-MS-Exchange-AntiSpam-MessageData-1: w3ZWLpDPOqQ9bg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c2b25e-5931-4e7d-60bf-08de8b4b8690
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:22:43.1415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNUzbgXKF9bNHEvQb0SbK2erPMtVeZFIRZtJpx/W0xFSSQFTLCYiVSyYz2UMEHF+I3Usgv3ncV9MktFp8dsptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

Replace the nova-core local `DmaObject` with a `CoherentBox` that can
fulfill the same role.

Since `CoherentBox` is more flexible than `DmaObject`, we can use the
native `u64` type for page table entries instead of messing with bytes.

The `dma` module becomes unused with that change, so remove it as well.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs          | 53 -----------------------------------
 drivers/gpu/nova-core/firmware/gsp.rs | 22 ++++++++-------
 drivers/gpu/nova-core/nova_core.rs    |  1 -
 3 files changed, 12 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
deleted file mode 100644
index 3c19d5ffcfe8..000000000000
--- a/drivers/gpu/nova-core/dma.rs
+++ /dev/null
@@ -1,53 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! Simple DMA object wrapper.
-
-use core::ops::{
-    Deref,
-    DerefMut, //
-};
-
-use kernel::{
-    device,
-    dma::Coherent,
-    page::PAGE_SIZE,
-    prelude::*, //
-};
-
-pub(crate) struct DmaObject {
-    dma: Coherent<[u8]>,
-}
-
-impl DmaObject {
-    pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Self> {
-        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)
-            .map_err(|_| EINVAL)?
-            .pad_to_align()
-            .size();
-        let dma = Coherent::zeroed_slice(dev, len, GFP_KERNEL)?;
-
-        Ok(Self { dma })
-    }
-
-    pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
-        let dma_obj = Self::new(dev, data.len())?;
-        // SAFETY: We have just allocated the DMA memory, we are the only users and
-        // we haven't made the device aware of the handle yet.
-        unsafe { dma_obj.as_mut()[..data.len()].copy_from_slice(data) };
-        Ok(dma_obj)
-    }
-}
-
-impl Deref for DmaObject {
-    type Target = Coherent<[u8]>;
-
-    fn deref(&self) -> &Self::Target {
-        &self.dma
-    }
-}
-
-impl DerefMut for DmaObject {
-    fn deref_mut(&mut self) -> &mut Self::Target {
-        &mut self.dma
-    }
-}
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 1e0d545a74fe..86fb3f074195 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -4,10 +4,10 @@
     device,
     dma::{
         Coherent,
+        CoherentBox,
         DataDirection,
         DmaAddress, //
     },
-    kvec,
     prelude::*,
     scatterlist::{
         Owned,
@@ -16,7 +16,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     firmware::riscv::RiscvFirmware,
     gpu::{
         Architecture,
@@ -137,7 +136,7 @@ pub(crate) struct GspFirmware {
     #[pin]
     level1: SGTable<Owned<VVec<u8>>>,
     /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
-    level0: DmaObject,
+    level0: Coherent<[u64]>,
     /// Size in bytes of the firmware contained in [`Self::fw`].
     pub(crate) size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
@@ -198,17 +197,20 @@ pub(crate) fn new<'a>(
                     // Allocate the level 0 page table as a device-visible DMA object, and map the
                     // level 1 page table onto it.
 
-                    // Level 0 page table data.
-                    let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
-
                     // Fill level 1 page entry.
                     let level1_entry = level1.iter().next().ok_or(EINVAL)?;
                     let level1_entry_addr = level1_entry.dma_address();
-                    let dst = &mut level0_data[..size_of_val(&level1_entry_addr)];
-                    dst.copy_from_slice(&level1_entry_addr.to_le_bytes());
 
-                    // Turn the level0 page table into a [`DmaObject`].
-                    DmaObject::from_data(dev, &level0_data)?
+                    // Create level 0 page table data and fill its first entry with the level 1
+                    // table.
+                    let mut level0 = CoherentBox::<[u64]>::zeroed_slice(
+                        dev,
+                        GSP_PAGE_SIZE / size_of::<u64>(),
+                        GFP_KERNEL
+                    )?;
+                    level0[0] = level1_entry_addr.to_le();
+
+                    level0.into()
                 },
                 size,
                 signatures: {
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 98675c69d2b7..04a1fa6b25f8 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,7 +13,6 @@
 #[macro_use]
 mod bitfield;
 
-mod dma;
 mod driver;
 mod falcon;
 mod fb;

-- 
2.53.0

