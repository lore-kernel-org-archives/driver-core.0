Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADE338C2C2
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100195; cv=fail; b=pTYIIz5yNct/cEc8i6Fm2grO9guicsGpyGwyoW/GUepsDEZufOkNnfRtnBrT8N46yDk0/gfJUDo8xAQspcckGOnRPsai5Gz0hOEgOWUbMlJ2FocHDmt7XWGGyZjYHMfI+0t4ITt43LJKrBe/tD1EYJXCFchOxVy1KV/cbVMon9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100195; c=relaxed/simple;
	bh=4iA94iQCNqQYHDcOhPZjnXo54o2knSlIxBbqToIAYBM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=L/SBD81NHmBc0izLQtCTu2gqagfABFnIuX0gD+Dv/+bJU2Ob1bG1/M3Xb+4GwFSBnPjHegNz8dtV/xmc0xcpNWKziJDwclvNbMa/N4LBHhOoKEeXh7WGYdcwUpOEdwI/KFAldT/f0wB3ZQyhHtCrY7XFQifEYkzmKeI8GX/x9eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qm4cj/xv; arc=fail smtp.client-ip=52.101.46.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qm4cj/xv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIg9E9a1lVh93UNH//R34rfFcgiKUxNq4DWo6PusdVFm5x7xHaqCwTupVpT5CuimwPRRuJpEvwGshn+OSP0yr9QmGo5Y3C7zK8jV7gBis5iqrbjOp6yViSxT2itE/2JPf8spCUpcLxfI1imRwbElhE7/QxXxElgivlO4P8Vay5eaXfywzpMounbFqNhFctFKWls5vtA59A37urKBz3qnKI9ZX/WEHkvRAJ311Eo9FWoNnppMMSLX7YYbdwENliZxQVKxiCuGEgYlDfWvf3wUWPNNSHsvh3PuZd3CLZzGD1LbqHjT/2sG/7H6Z5Nak8bey9QZbnKQ4p8hVhBtmnZjug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37Vn1KM9QUA/tXIucSkzqGP/5/PEZk2QyHUuGxYFo28=;
 b=lRSWmRVKqScVuryBlnVcBVtmwwW2U26pNbay2S4BQUcIpYan5XL51K7D0RGAKzabkJbDziY+uD2Y/f9OrrrKdxXG5YNgXPwgft8cKYHlgPPjmJ0+qs5IdjPoGwCRFJM2eZUXV5KX6ZkR1GyF7InzEwisz+lwmQf3yZHahXvvY3lsCJE1cDyZCbjT4pREQspdy+JIRZnF92iOHDblRMu6kjdrMFCyCZU2OL7GcpQVSct+a7+ftd09U7EYVD9jo7LfE04OGctGgs0LKPx2dwgHfQxyHndJGhPOVsKGsueZsDYDsELA1RWOV8lFGM3fhqR6oKrDpXksJWSTMexYfj55ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37Vn1KM9QUA/tXIucSkzqGP/5/PEZk2QyHUuGxYFo28=;
 b=qm4cj/xvpWeBKWL3wuQCcBR/+psmDvusFD8Y+DRHbPEpATd8c1qDx6PkfwNxkTj9QVTZ/fAGu4wZvq/Z1HX8kHgfGXof18GnO9QjA7DpeE3bz/3YzJufYHODINPdvNTZw4MwI9h+oXmnttNo06xrpgvVidW6wqjsGOKt4bXp7wtgv8MavMIkNtm+RmeHIohwkrLnepkWkn7BW5lEiYhQawmNwsV0dg9Gp7ToRFHzSleAya39leRKohizLR7MMM9CPAglunPhwKR865dVsNsyQ/oQu7CJ8lu4vEI/qUv/2WuSfgpQ8sVE9G0V2nbnZXdpnc8iz48UcXQkmNZSw7ADzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 13:36:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:36:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 21 Mar 2026 22:36:19 +0900
Subject: [PATCH 1/7] rust: dma: add from-slice constructors for Coherent
 and CoherentBox
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-b4-nova-dma-removal-v1-1-5cf18a75ff64@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0375.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0465bc-6f3c-48b3-f241-08de874edb46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	iiLT02045/DFqr3AuWZQ+CFiV6+8/wRuMbNwFUFYKbE7iNRKS+HBHIyabaJWcy+mX0r97PNTd1HWNOzikWDkmrU2VmzuMN7craSD1/mPmNOlJT0PybKOrE1Y1N4bLvS9jrDPcoghShmVVlLuu+UdZrfJEyUgKgeceUVB7B0iWhcpfKtqA8N60m6RZd/3fCdCFcCCGXcFZH+leHw09dUkDC+O3Xbgt/q4JUz85CBzlTL+r1IyrAmnKvKmWlbOcbpP0AV0y9DX0wilyY87xRBevJauPs0d3CN6b4RABhOAnCTtFTQKGaq6gaxB6vgx8auy75pvFH4iAFdlTg1+rR+QqXYawaGdfRUhwTrClvr5HFBCgzjvFSrq8MHmG+ZCL53podPLUMTigBOmsq1cfBJNvI6rDfoGTTPRUACf5rdvpAJAd99zM6qAuaLY3B5WOSSIFlE+1xn/jgSE9Q/SVzUub8U7MmtZ3+el9GJ3aNxs6st/4x++wfGsAe5px6q6SyD5gKHuhiAItRhzv7BHB8Gj/Yf4PrKtRK12cI2hpQlEDJ16/pYNOyYukobhsHjHPC49gQZ+aZJZ19qxvFB23hZbJ/YOUiql5zil1fnw7oWTkno6NvlCTt7GBaYhtNmCCBfBlkje216BOyev3EBLSFYTCLC2TKESufK59/oMgSSSOaQQbmO4aS3p5Y5NbqmhGvDkZ/TlsG7YjQVlZNVkfwFQDJ6E9kJB/MIZYLoOWqaVHM9o4S8G/LQpJMgDkY03zAI9V/FV982eP9OS4wegV5qeGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUxrbnVoUWRnZW5XL1ZtWm9DVlFsRVdiS3RHNFl3YkNQR3dyNHRvQmJsV2x5?=
 =?utf-8?B?VVdZYW9uNXlBVVM1cFFSMi9iYkdIVFhtTmF2UXdSbHJ4RERyUEFCOXVlSFJP?=
 =?utf-8?B?QmR4RDJMU3RZRjRVWnFIN2Y4TlNiMExnanlFMnNQOXFiUzVwRjczR2JHRXNi?=
 =?utf-8?B?Q3ZXYW5FRmlpRmdnajN2bmdqMEZabUZ0SHY2YWdiTWoyVEtzWDhwQ0RQMis1?=
 =?utf-8?B?WE12M1RENUtEUlcrcFJGR2w4NlZRa0ZucTBjRVU4VkQ4OEIrRFBRMXlMOXo0?=
 =?utf-8?B?TGl3M1M1LzNoRllSdUxaZW8zc1FwUTBaSXBQN0xQcysyV2dVdkxXdzJnVWFS?=
 =?utf-8?B?V3Zsd0VZMzFSU1hWS1o0RDJnSUpLSU1vbGxKamM4ajFaRndsZjRXTUlTQ1FT?=
 =?utf-8?B?THVlc3BjRms5bHZjOUxpcDJQUDNoYVFIQjdOayttbHV2S2hwVnRERlREQWdx?=
 =?utf-8?B?cnM4UDZaeCtkTDRpM2gvY2Z4RDVNTVZhck1Cb2hWUHA5d3lEUGt5UFM1K1hr?=
 =?utf-8?B?TWNKUjRDckxKTDRNY2lGdnZHWWNZSDUxbzh0SmpOYThhV2ZiYkFPSjBvdmQ3?=
 =?utf-8?B?UkdhSzJxSGRHMkhFV1pYamdzWG5VdmhCbUMvWWVhT1F3OGJ0SUVWbmMrQTNJ?=
 =?utf-8?B?RUlzeVBPajlyanU2Tzg0bi9XTXBvN0p1MDBIY01lZEVFdno3M3N0Y3NIZnVT?=
 =?utf-8?B?MUtKdmdlWVU5ZGVoMzJkQzE3a1hxVWs3QU5RelVlS2hXR2I4ZG0yZTRJajBj?=
 =?utf-8?B?UGdUTzdyWkVSUFFNQ1RZQUlpMmYxMkxsUzVPWXBQT0hiRFlTY25vWCtrMklE?=
 =?utf-8?B?ZDIwdjRBYkJ2bk91bngxOE54QkRGaFp1T1RsT2RBN0dWMWRLR0t6S2FDRDRY?=
 =?utf-8?B?aS9iWXdmZWNpcXJ2OGlZTWN1ZUJPaE1qMll5YllnZHQyOHhuQ1RzbmVaWmUx?=
 =?utf-8?B?U0JDNWJLdWVid3FTaVN4NXVpeHd1aGlneGg5V3RBT1JRaGJWcnMwSlF5MzBy?=
 =?utf-8?B?YU8wT2wzRktkc25IY2NGSzNFaVBJdFJOS0RxZHEyTHg3KzFMdkdkbWlnLzJV?=
 =?utf-8?B?d1h3RkZvcnJBSFVWN1B5QVVMRTE2NGFKZnpqMC9LNHVXVTVicUwzR29zZ0I2?=
 =?utf-8?B?VFZraURzTXRmalV6KzhQOUJuNzdhSFBwWVlUOUVNNmFNb2VjVjJCY0crLzJ2?=
 =?utf-8?B?bHJ1cnh5ZUM0SWRKWURoRzNKY2cvZUQ4YjhwVUNSMVhOWCtOUk5uWEJvRGJ1?=
 =?utf-8?B?YncyU2U4bWRsT0FOQ2QrTXBpRDhOZTBMSjR4d0pXSHpvNDltUTU1WHBDTGty?=
 =?utf-8?B?UEhqazVFSTd1WVlWSUtJSUx6Sy9tSTk2TTFTV1RCRThHMlZ2VmlnaXhPOGtG?=
 =?utf-8?B?bjdFR3B6VHMxQW9uUUdscWJWTlQ0M3l1VzNTOWNEaEN3WXJ4bi85c2VBN3k0?=
 =?utf-8?B?S0lpU0xRQWdnWWk2WCtKUlcxTUZEYXZWeGtPOGNVc1FYUnNOTmpoOW8zNHpT?=
 =?utf-8?B?cHlvTmE2Vk91QzIzeklSNlo3OFNubnhXM2pjL1E3NnlabGtiSkpYZG5PSGNw?=
 =?utf-8?B?VjdkWU1ZUkZkdEtHNDUrQjNYR2pOckN6MTdGVFBtYWdHbGNXYk1NTXZyZ2ly?=
 =?utf-8?B?dzlDVUZuQUErSHJqODhzZ3VVM1ZOVVpkZGpPVXN3bWkwcEM0MUM3cGZ4ekJY?=
 =?utf-8?B?K1A2NlpseDNGV0lFN21mRnNyZGZ6UkNhZFRIdUVMUHFjVzVGejNWd3A5dnFL?=
 =?utf-8?B?Z0tKSUROVGdnT3RjK3ZTZDk5M2o4ZjdNRzAyRk1UMExCaUN3VSs5VktsSjNJ?=
 =?utf-8?B?U1V0NW1kemZ4ZURHUVFLSXNEZG5RWDVTS0NEV2U1UTNVUFBZQTNzSFhJT0FH?=
 =?utf-8?B?RTU2NXFDQU5VTElrNU90WDU3TnFLNnU0WkRSOXJKZlZHZ0U1bmFsbnZ4NzhP?=
 =?utf-8?B?S3ZJQUp0Y0xqQ2taT2RuQytDZ2hreDhZc2tPL1ZXdGU0c2Rjc2wyUDRZcldD?=
 =?utf-8?B?UDVJd1ExVC9nQkFjdGRDNWU4bDNnNDZJclV5YjVVallhUHJjRVRvSnJLVTU5?=
 =?utf-8?B?SDdwckFha1VCK1ZBMVJCdFFLN011dFI1cCt6TGlQOXNyL3BOTXB5Yy92b1Ir?=
 =?utf-8?B?MC9ZL0xhUlpGRkJFT3F5TjVwaEk3VmJDS2FFNHlrWnRvc05RRUdyNksyQlBp?=
 =?utf-8?B?OUw3Wkd6Njg5cDJvRXp2TkkyZUhFYjBkT1AvSE1SV0NFTStyQ0lNTm1LMis5?=
 =?utf-8?B?M1V6ckU4VHA5c0dHbHhybjBpdDNERzJSRWdKdzFqMXg5L0ZsU1hnYWYxbTlh?=
 =?utf-8?B?eWtoelJxMGJyWmRMOThydDI2SytQRE5La1ZVNkt5NjJRZjhhZGJsbVVETks0?=
 =?utf-8?Q?uBil9+yHQq8+hGSxC8wmk/ifBiqE931sb646yBYQpYNSD?=
X-MS-Exchange-AntiSpam-MessageData-1: /yy+o0yY1KaKrA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0465bc-6f3c-48b3-f241-08de874edb46
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:36:29.0775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LEMyiTJvqM0PsADJcm0Hx5rCQQOHVDZmSyO2BdpPvYTBs02B88ggUp87xLt20sArM1Oi4QBYOWDxOR41Yw97g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133

A very common pattern is to create a block of coherent memory with the
content of an already-existing slice of bytes (e.g. a loaded firmware
blob).

`CoherentBox` makes this easier, but still implies a potentially
panicking operation with `copy_from_slice` that requires a `PANIC`
comment.

Add `from_slice_with_attrs` and `from_slice` methods to both `Coherent`
and `CoherentBox` to turn this into a trivial one-step operation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/dma.rs | 102 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 6d2bec52806b..a5cc993c919e 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -453,6 +453,62 @@ pub fn init_at<E>(&mut self, i: usize, init: impl Init<T, E>) -> Result
 
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
+        Coherent::<T>::alloc_slice_with_attrs(dev, data.len(), gfp_flags, dma_attrs)
+            .map(Self)
+            .map(|mut slice| {
+                // PANIC: `slice` was created with length `data.len()`.
+                slice.copy_from_slice(data);
+                slice
+            })
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
@@ -827,6 +883,52 @@ pub fn zeroed_slice(
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

