Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D99A38F64F
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100216; cv=fail; b=LzUYX0fE0XaRhkI+qIeNv3xCxgqRczroQJdILsZ3Aj40J9F/ovCx0r3l2e0M65GMSP1WhqtbxwV8IrPQI5e8zUUQXBf1RtN69JYOZQVL7tI2A1G7fzwvz/uh8a3j/qIbJa1XuK2fnr+0Y2DVRsslr6BwGUECcud7WJB7a+Zir6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100216; c=relaxed/simple;
	bh=BN0m5S1JGXyPzpiWL4AxrTwzcFDxjA8KkugqMSea3jQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=biWGo6URe+0MXe0N90pZ40+V+/n6ucxllmYgq7aKU4YgSfAUgBJrHtbS+K6C8Xf/RNG9sSHPwqZVxAaoF30Ll8wZw3lTOYFIj/RQSBbRr2Vmslcpgcp9P+koEUG1rqsdaFsWTfcosterMlKfhomek/Bikdw8XKMvsGJAYGTf2/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L6aFjYva; arc=fail smtp.client-ip=52.101.56.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L6aFjYva"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbG+mxErVGkGa7tWBZA23UkP1seuBeQOOk8aZ7zVeYMbNj6aakJteJAPf7M1WVvNYGGUPykjt8Jga7f4iX6wMaVcTIJ1yLA4ws+aHagNEOfxKmJM1JhFZdA2tcOdJcj8x6nkzJQXGatS5Y1ZWykG1Fre5ri1Zloh+4u0+l0P+PUA2Y0iU6DT45awCiyF/hSeegJnXfC+HGKv1jz6gdDyBqwiVAjQhkKEqo08XRf/WRJsYFt4k13JMi6eg5tC+2dRga8Nl5z3GlLNNwReVLcjqBMu85rnvmIooyj8bc7Y8RqQTNU95d2yv1Bxxdd2FhCGvTejov6fGl5SUPFAmSz7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSJJKvoJ1hCI9wlwo+Lrko9Y8DxN2Eksy80ZbIhSK4Q=;
 b=TwMki1eprEzdTb/MxBjbnapBo8CUrscio04nOM2HIkNL8V0V2M9PEd7Ays9jhyorczlUku4QqB7hZUgXAJDYmZbdFAGl1gzVj5ZkrwfLtYum0TIwb/0KoaH9b0IVyN9ZW1bt2j/Qonr4LTIF/r7IMdmKJfX0IQaoGgWKA1miSHacKqvnpBJIX8qnbYLY9HmE+RRKcsB+wPtJP5aD7JFyRc2q1qdU16mywkB2Hq3sz/TXQsOt8/2rFkdd4mpzg7S30ZwjqyzDieewDz2b39WjfMOTdqecN4TXHVx/O8gd01wZ+MzbAgp7000OWPW5ustLFBILPGwOvd8/Hj8n+R9ddQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSJJKvoJ1hCI9wlwo+Lrko9Y8DxN2Eksy80ZbIhSK4Q=;
 b=L6aFjYva1wpzH8m6hX0ADHeTY8h3vugg/FkdPrC52pWNj/g8ziTYl99UzeIFcNhSA7Pa97N8d1Y98Ni9+v3jtx+p+Fd4atUOveC+krv9uFbjLtlV4emIxP9+rLamhNFyTFksh0sjCb3D15SjF7IjgOsJ+n9plNJPgbH5awN/+a0iYHMe9GNHmZfxk4mBQ4rRc8tn6MiUk0sD1OVsy/cDKzgJTjWed3NOWnetSfFc2zDSZwWs86M0IrsiYWiWEH8AVIliNclAm/cKoXRmOl0JxEL8g9SQpdvRlIJyCgoTFNU2i6p+V+fh6fjdix7faPH9PG6Qn55/QHk7JuxmPXu5ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 13:36:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:36:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 21 Mar 2026 22:36:25 +0900
Subject: [PATCH 7/7] gpu: nova-core: firmware: gsp: use dma::Coherent for
 level0 table
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-b4-nova-dma-removal-v1-7-5cf18a75ff64@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0096.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 4435dba3-4bbd-4036-3638-08de874ee88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	80/QkN9s9gu3wUNszV4CPsCUpY2N4y4odvjXzaaaRrXB8+CYPAGTOImb3T0GyEtyGFfBRwO1U86kTVWx/o+cvLIAim48JOGZffhB7HzK1TPXbLtvZhLh3SsxCrr4GP8SSlGWmyA+nsVGLNbaTQatQ3fRUUHa+OvNwvi5Uoffvrdv5GWZ5eVYfQpIVm0FjgrX41bE6j66l7VQig1SER2dZ/OMZViMqOquu9j5ZGWYBlsuzqLJVIPnkw74wM8jfWmRCCJW5z+dd6MsXS3O6XLvXJ2KeTgsiZpV/2UgxVdTt1a0Ipyqh0n4tcZv5DAiqy6FZCHUzI/7pdAkhV/opXaKz9xbsUepItWLAqJrqKzHamZ7cAK5NjZ3R5sNFi0XiqEzWVTTHxly1WFMAIy0HsT3tF0VJQvEQ8q9NMq6Qd32wPBKUQMmXsrRnzgU5yQ5yG+VMN3TG03oo5HDP5QgWKfSFjsdZ9LNEOpJ0xqduiKnXdK0u/Yd5V35JtIdpQZ5gUw6QMCKNLa8UcKlYubc7no3EfbklBlHjCOVdGEtpgS0QdriFlGGPgbjcOXWgbcmj145pqxnGiCyFDtEGbwfq5a+bxdrMPeqS/1xefunog5zFMErA02DIppWGEIBw/xE7RlDvnvN+ztVcNePnixYMSJIRmimKtNlXpoHUs2b60iA+jnWubQnkhQzLC8n99j4rIbkSdlhfPd0LHhou6dYYbhUR5vU/c1u6Tai3hL7ugkepJKyOrqePOimET3H+XtqQQ6+LcynbKM3HCmDEuKt0QTYLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFgwRS9pYTRFWi9Wcy9kRCsveE9hVk5hRmtLTEhDS1dsUlJZRWUvM3NNbkRk?=
 =?utf-8?B?OEU1SklneU8vekZFaWZTUURGQWhqR0FLL2NqYWlWemszRVgyKzlOZHRPYmxY?=
 =?utf-8?B?cnNaTmtsd0ZkalBYK29uNGRwdjJLVjlDMmNvOFBzSk5NYkFSakJuL1R5N1VZ?=
 =?utf-8?B?Qll4TlAreXM5ZDcwTnlQRVdYRlFGZkM2eVVnNHIxKytETTJSU0t2TTZCU3c3?=
 =?utf-8?B?UThiaDgveGJoWkNwbWI2V21nZ2FpS0NYV2xoV0FPRjdMb3MxUkR6cFdvNCtD?=
 =?utf-8?B?citCNUMvVmdwUHo2U0RZQkpPc1JyUk9BTStScHJ5ZmsxNlA4dkR5N2JISThm?=
 =?utf-8?B?MWVzbUJzU05DNHRYd0V4bE9GempKOGpxMWZDU0xyNWRBNjhVTlRtaFpKTEpE?=
 =?utf-8?B?dWpVcVErTHFFR1hBNUV2cXF0aGFIZks2ODZVY2ROL2RqRXp1bzBvRzZvWk94?=
 =?utf-8?B?MGtvRWVSdW8rUzhJT0I5ZUs5TVlxcGYwdlFjRmdLTm5aOUVzajREZktEZDBj?=
 =?utf-8?B?UEtDdGdyZWV6QVkxcFRUY2hWbERUR3hWRnpIbmlBdWZ5bWFVR2Rpd3Vhells?=
 =?utf-8?B?bkNvNllITzR6Ujg1ZzIvR0pEdlg0endqTFgrWXVpYUR6bisvcEFINHlSSFll?=
 =?utf-8?B?YXB1dVp5djJxd3ZRbVFHWjdzZkhwbUlMWEdzVEMrdVlXOWNFYmlwSDdHcVUy?=
 =?utf-8?B?NWNQb0tpUzlVWHozRE4zN0phK21qM0FYZUlsZGdpV0xrNEw2NExHcTVOdTIz?=
 =?utf-8?B?d3JFcDNNdXlTd3FlU0VWQWN1Qk5ieE55RUQvWXBaSUpKVjRhZDVCSW0zS1RL?=
 =?utf-8?B?MkUvTHBhMWZrUnNaWjFxbGswaXBVOHhmejRITzg3RDUyOTkybVVQNDJXYk5a?=
 =?utf-8?B?TE5tMTh5c20yZllmWWgrN3M4blZZRnBzcGFkcUZQdlJlMTVCZnZ4WVNFMGNy?=
 =?utf-8?B?aEg4aXhOek1WWUtqYmpmN2JaRU5GREhsZVk1YXVSREVFUGhPdlpnQ29tTStG?=
 =?utf-8?B?WHNWQ3ZHQm5qZG5GeVpVSnlaT2QyM0lrWHc1RGloNU5xVUVJUEtwN0tMVGhL?=
 =?utf-8?B?bFFhSW91bDdYa1UyT285R2lqZnRrWkwwNitnRy82aWRwMFJvNjZGUUlEdnJF?=
 =?utf-8?B?WnFkMnRoc0IwZThuK2VtaGE2RlpLcVc1R2tzZzNzTHdOT3BLL3RxSlN5R0p0?=
 =?utf-8?B?cEgyRUY4S2VNUXZiaXdITDJObW82NFRyMmdiV3lEYVh3Y0FwVU1FdjEvODRt?=
 =?utf-8?B?RnhLRFNTb1IxN2hveTFoVmg3a3dnUW5YYmdORWh6SWoydHlyQzdYNXphYjVT?=
 =?utf-8?B?bVdaL0JmYXJ1UDVRNlZnMEdZYUFxTjg1eXpvdU03bGdaV1dKTXhQbHVJZTA0?=
 =?utf-8?B?SThzd2hyYUhwbEEvRTRZdlplUmcvdnV3UHpqdmxMWDdVcWdMRVRIalF2bDdw?=
 =?utf-8?B?SThmNXNpWExncnpMTUxGZFR4Qm45dForMnhyYU9FU21BNk5yK0pvQ1Z3TWtI?=
 =?utf-8?B?bmNPc21HaU9mei9BTjhoWjZIZUhKMHFZdWtvd2tENnVvZFJNcTlVSzYxbm1S?=
 =?utf-8?B?YXIxMzVrR1IxaVJIbUtwM1FHNGpZb0I2bDMxRUpZaUkyVWdlR2FCUUtBOWNF?=
 =?utf-8?B?b25NUkhzN2tWOE1WVjVUTzRxUW05OXNoSHptRGpNemV6OW8xamdWU2hQZFlH?=
 =?utf-8?B?MXB2eUNiamkzOXJ4K2Q4dGN1UUt2dU1tMklibWpoYkFqeWxpbi9wODJJMEZM?=
 =?utf-8?B?dEpaTUE0OXBVVkN3bmRMc05DRXdYeWUyc3NIUUFteDdvdFFLc3B4N0djbGZJ?=
 =?utf-8?B?WW0rci93SXJYQW42WEpWcHpGbXdMRXo3NE1xZkhZOWx6NmRMV2RsK3poQWZL?=
 =?utf-8?B?cHIyNGNreWRsSERZK2o3VFJmME52Q0tVWVc4dUk5NnNxWHd0WERJMDBNZERR?=
 =?utf-8?B?UjlDRElhNGJCRU9iTkJ5Y3QyREE4OG45VmRwUlc1QXJEUFhYazNrVXkzM2Ny?=
 =?utf-8?B?bnFaSGhVME1LV1YyVUN1ZlIyVnpyam1MK0QzMm1IK0dFTVUyWHY3QWttT0RO?=
 =?utf-8?B?VStZeDJyK3pLNnloOVRzQ3B2U0FrRXFXNEdPZzIrMlVzYm9iQkRLOGF0ak1K?=
 =?utf-8?B?c1BTM0VQVzVVZ0wxclZxRGhhZnVXTWRrMzdObUpRMTR4N21odW9tRjZ1cng4?=
 =?utf-8?B?N2Y3dGNEZXoyaGZEd09UTEZadTBQRk1HTnlDN1l1emhQQXNzUi8vMnBYYzRU?=
 =?utf-8?B?YW9TcXVjQ0dFQkZ1N1lsYmVaYjhISGJjN3dFNDkvbHdIUCt3eWp6UGsvbUJ3?=
 =?utf-8?B?SHdON0t4c3l0dHNGQlJ6ZVVESnVMUTVTSHBLbkRMV2I1YS8yRzE2Vnc0TXpo?=
 =?utf-8?Q?Gi/4oh/W3I4syVmrqPn2Ea1bOl4NmQaCtS7AIiN1PIHvh?=
X-MS-Exchange-AntiSpam-MessageData-1: YQSyAqvbEN75OQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4435dba3-4bbd-4036-3638-08de874ee88c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:36:51.3425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Jk8z9Xd4+J7Eb2DlTfCKrIaU+RMXfmCUlXFucetrsWIb5drb7qMNH3EguFXsiwmElqBJaW3gEwzAzf/8Uk7Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133

Replace the nova-core local `DmaObject` with a `CoherentBox` that can
fulfill the same role.

Since `CoherentBox` is more flexible than `DmaObject`, we can use the
native `u64` type for page table entries instead of messing with bytes.

The `dma` module becomes unused with that change, so remove it as well.

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
index b5caf1044697..e0271e0c6335 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -5,7 +5,6 @@
 #[macro_use]
 mod bitfield;
 
-mod dma;
 mod driver;
 mod falcon;
 mod fb;

-- 
2.53.0

