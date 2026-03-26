Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DE3405AA2
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538554; cv=fail; b=lOTkBGV5mQ+p3jckfuuIWC1vCDzysto9NdkrRhJTFdF2Not9ImAD/9GMXArHFl384HZRAY91KZzWqz2DjPK4wmidO9DGg5vtBaqgSooZOJ8bsRdwFUC5YLrhGM4MB5ZbdRbbRAwcezA+K+nds+K4NIfjzQGCkT4rfVH9iFezOv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538554; c=relaxed/simple;
	bh=c+sR3IvEDTgVuRax8e+6uVDYm0yinMrGAysiLW6VVtg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WQhnr5XnP+UnMQCq2HRYbzKKwszjStfOxkf/jrKP02NeT7eCwTDwMSjvqazY0I5vKr9/VUbpMfq3qpp9ts8+SO6JxZWyIvHXHPvKIlc7jHB8QyayTJ7Fb/W02Se/iXVe45sfmoKTg4fbb0BxT0cxcpRCPNRNV71XG6S4uTGES1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qk/6ixa/; arc=fail smtp.client-ip=52.101.53.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qk/6ixa/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAd2KBI/ftr0Bn3tjifykQcViHeSWS//Z8nZGBk49jPK589Lr0RDzRLd9rXJpuhJfKTCLro3p60kCohm/glivn27l2kIeo2B2ttvJfmBgMXlzGjWA/cUby5NjE4ESCs2BA4LgrfqVa34cKGkLqUNVJ1g8HnKmIlZJYDDJ3PE6XhdD08a05hWmBFbIumuH8cwfXbXxRG/jCLb7rk3S/nfw1yw25y1WQUYeXIVneTqKZFTiAkrseIejQ+OjjmDkfbFnc5GXakJXamZGqa9JOw4BTJjtts8sM2bTFURoHtfkWqiVCmVSylOX4NsoJuycIjhxpr5KJGhA9tHZZhx3il6hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=US/sMtO05Igki3c7zBGYTLNLE7x0WvBwb/Wr8HvZKvg=;
 b=qkv8JUPZKWaIMflm/kNyJ36pZPa/unxBvskFtc3xcAgN2XVS0EEGmsHKqo4ZVwmQlf2lPFdZsBIcOnWpAovcWpZMSb6Mt2dwAKbgba28/knMRZgpaWyOilG63VMTDGZ883DiKAxvPZyn/a0cO3dswFcNuff70cWSFVYjb79035q4IeHibQooridNzs+U0if+iVu3g92jrfLqWAs6tbNrwKP/3HEhVeksl0tIb2+K6EqKTQywhgTmXFuf2jIUWS30UuovyAhvXZsb31WrRvTOY9z1S8y/aMIeKg4wWHdlK+kqrM+lApQqiALMLz3GuqbKS7rpZJDaQgKXp3FinoU2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=US/sMtO05Igki3c7zBGYTLNLE7x0WvBwb/Wr8HvZKvg=;
 b=Qk/6ixa/PG3RlR2exiYI24TF9pDU/QULrIfOJ9sNzipWVOYEqQ7XKB/ExsxgalejmmS3dwGI7w2XKTRPdQDvcAdh6R2MxSSSk5Ah1SesMVa1UjjFdn8vaHe8PkC+HJGSU8bDwtFO01ItnwedxH/ODJNyYY4SRgD+beg6jC9bmkGjPHttxpGw/4OCbmKHbFIIWsJK7JAOAbB1VGrq6NQkC7w7qNeVJwBec8ZNKJk0EQ+oDNkot2DQjtyrZ7DjolrDiiwTru96ZraNS0NqKdeKYKqGbl8FjAxEUBZ0F2uuJz2JksZAOlpzKQEH71bw1GmLtZFq8PlEtzDHhAyBC+HDpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 15:22:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 15:22:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 27 Mar 2026 00:22:09 +0900
Subject: [PATCH v2 3/7] gpu: nova-core: firmware: fwsec: use dma::Coherent
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-nova-dma-removal-v2-3-616e1d0b5cb3@nvidia.com>
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
X-ClientProxiedBy: TYWP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: d36adc34-8028-47ca-c032-08de8b4b7d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mzVPNQSjQeUwGWsTP+TQaU4MY0+PdeVoO8To0QdYAtPVsJQ0qJd+6L3OXY9GihjLwY5g3wGLSOLkoEFdwqa49UlrrHo2aekK4gVlYlnKGSnhociXEq1Y5svGN68Pe+HcZ2WG880h7yu5d5vGyXXmtUfL4GlnL1pBjiyuuh5dyRbsaajCN8gEPvHOkAW5yNpfVcy9eepoiv5J4xQDx+YA36QclqIx6h90uZJBJUKgD6ijKRxyiXFUtT/H2kkBnvYIeJqZHWbiOOcbwDnUbd4kXudEiR4mvexqEPqnhhzN+ivAv1iqVtyeK6dADpoDEenS6foq1bErGp7SnfObZvShuNeqRDw8b23gJzkHXsJuBTEo8umi9Vr+vyeJaIyt8TzTUFs1afzM8pPgf2HVGz3O9vd5HMPLPf3GhKu1ReuSOPBZbvnMXex6AjP0Lx+qDhfLESbteWRzhIcase/AF6uHTDQa3NGm9GFaFQqx9I7RUFTVtqYWa2MbDELYs8l2D2Mw0WICfTy/G2TbXgKVmSxZ8ETlmkbhC49Y2w8BPjz+HXWqiuOuoXBdEXUABtu7TtwTlVZgLHiaMpXofK2F1wFdOXgtnyfHsbO0eEtY9MIoDgSx9NMmN1zVvjlHZjYUs28S0H4o72n3jQqmSUMn71HmLpwdz/Za88lXIUEn6lCSgJG89gGeovhTP/TSA5divaM56e0EwfzbnBp1Ot+AQ0vt64rY813d4+vrfNppr1n7Dng+yuy8H422cxKoXinPXQj8vcsoTFgjwuEXu5m/ErH7Ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGUxUTAwSWtDdFgvRE00bnBkc2N0Ni9FQUdsaE9zazNjblZZU3V0YW15T1ZL?=
 =?utf-8?B?dnFVdWtqYU81VjI4aHh0OFZpK3U2c0s5a0NDQnN0Y21mdlV4Mm4xek1xOU9k?=
 =?utf-8?B?WGJVYXh2OHJIRGhWTmRjREY4SEhqRGhOTlJHb3haMTNNMjdjRVoxMkF4QjdK?=
 =?utf-8?B?ekpXZUlNNXJBUEMzb0U5eXczZXBhZXdSUEFyeTYreGx3dFhZVGZjUVJ6Rml1?=
 =?utf-8?B?OGN0aC8vUWs5UUpBT0wyQWtQR0MrNXNsVW43RE1UK3RLNkRzV2c2TXd3cnVt?=
 =?utf-8?B?bFc0UU9TRmczbWpzUys0K0VUUWpoWkcyODhBaFBJcXpvWFZSeWdrNm9PNCtG?=
 =?utf-8?B?cmpkK0JUVGRKZjNYQms4YmZON0RPMzVMSnRlcVRZUFY0UEVBSkh1TDlCQ1Qz?=
 =?utf-8?B?cnkzUHJsWi9yNGx6OXd4b0xGQXpSenVyVEdyVmU5U25GeUhlUkl0NlUxcVV0?=
 =?utf-8?B?QW9JZmFlTlFTL09IZXRCay9lVjhNKzJRNGFzM3ZJZ0ViZ1d3NzNBWDhPMDZI?=
 =?utf-8?B?U0NldnBJMkRnQ1JqVzZrREpzNEVDbEEzbVNvVTNkTW54TnYwVjhHUnZ1SjJM?=
 =?utf-8?B?TWpuR0FzQ0lGbVA5aHpBck5DYWhxcUxVTUJyZ3ppaGpJVVQzVHlyeXNjSjlt?=
 =?utf-8?B?Y2kvUjRDOWRYS1FtVnNHQUFVaHhiREJIeUE3a1diOTYzTi81ZmJCYTBsN1Zr?=
 =?utf-8?B?WS9MZkw5MVlhNWJRczNvMjVacWJMTG5Ga1FxY1BjSk4zSUVSOUg3ZGhkcTJO?=
 =?utf-8?B?N2ovUjBXcUZOdHBvbmJxSDRLekhTZVdzM1lPbGpjSUIrQTFoblZnRDlCaG5E?=
 =?utf-8?B?T3NKUS93dm5heXU5ZWoxRzEzd3I0emE1TmszQ1cwaGd0NlVxdFJ3TE1nMDdj?=
 =?utf-8?B?SVFRMEtjRDJ6RFUzQ3o4bjF1VzM4RmNWc3FoVVlEVVFJMXZsdnkzUjZwOWZt?=
 =?utf-8?B?QzFQeEhHYzR2Vmh3U0pLc0tWR2J0Q2NQNDMwUDdQWjVwOE5iTTAyNG5PMUdX?=
 =?utf-8?B?cGNSMzZIK0hrYjlJdHV4eTV3bjFSWVJId1plU0Z5c3ZINW9JNFMvMDMyTHNM?=
 =?utf-8?B?bjRpYkNZSUNYbGNGdWhNUlR6V0lNK0F6KzliOFNJR0xuQXo4cDhGMllndmRm?=
 =?utf-8?B?Kzl6eFFNRFpMYkxkOWIzNzZ6V1ZxUmN1bDk1aG5udDEyMU1tTk01OGhPY3ZC?=
 =?utf-8?B?c2wwSklHTm1Kb3lWa25EWHdXb1ZlYnh5REQ3dWV0dDUrRHVwekc1eGtsVW51?=
 =?utf-8?B?VGlZSE9MUU13d2EvMVBIbkgxN3VJNkVtOXdUWVR3SEg4YzJnY3ljZ0ZUbU1N?=
 =?utf-8?B?cnVxaExld1JTRldGOWFDTGNRcUQ0dW1mendId2p0OHNJRDN0T0Vod1Bud1lx?=
 =?utf-8?B?aHFqNGIwd0sva20zZDdic2huRTEwT2pyajNLRHYybTAxWWUyQzAveEJ0T0Y1?=
 =?utf-8?B?ZTAvd28zY3lBV2l0MU44QmJjWkZMS2FqaWVNMHRzY09zZjdxemdPRkJRMW1Z?=
 =?utf-8?B?QzVsYXRTb0ZEV2tTaUJYSkhDWGNLUHQ5ZGdxcVRpZmpiaHBkOVJaSWNMVFdG?=
 =?utf-8?B?V1dVa0UwNEZnaEliMllQVlNsZUMzL0RKaGpCTGkzYWFlMTIrUStvYmd6UzdV?=
 =?utf-8?B?bmgxc0NMT3lTdzF1ZmlXMWFydS9vblhlRzJ0allEcnFOOVp1OEY1UlRDam5T?=
 =?utf-8?B?N2NDUDJCOU1TUEo3TjZJOStDQStmci9CQ0pyQ1ZBZk42ekxlbTBqMm5WMDNL?=
 =?utf-8?B?MmRkdC9ZM1g0cXRnV3NpblRRZXoxZ0xkRmRJanZJRUZpQ1FTVjNIb1k1eFBw?=
 =?utf-8?B?VGVYUzkyYk9ZcDBOSzBNTy85bHFGcjBvRVBMdVBZcHFwZUVBL2VzS2NCRmVy?=
 =?utf-8?B?VVExRDI3cEV3MG5oQWJGZ3l2MitLMDArVXBlVW9DZkVleWRvVXBrbnc3NXFo?=
 =?utf-8?B?bkNna1RTeE5vTkhCNjBxSXRGUUpGTElyNkd0Zm85NkJYMUtTcGRzd2lrR1Z0?=
 =?utf-8?B?N2lrTkxIVThpVUg2V3ozMU5WaFIwY3crUEliZGE4ZmxmdUdVbkh0YS9Saytv?=
 =?utf-8?B?SzUxZm9Lak1BQW1LRVpRY0hxY01jK3FFdTZWSzZ6dEFmVVBoakNrWnVmd0N0?=
 =?utf-8?B?TjEzZG1tVEhnWHZNbGJNUkhyOHAwL3pPUWl2Zjg2WXN4bzBqd1oyc1ZXNnpM?=
 =?utf-8?B?MVhWYXVNWkM3WnloRmp2YU56cDN5ZzhycG81ejBFMHpGeW5LQTlNeVZvYWt4?=
 =?utf-8?B?dGVTUERCcDRwcUtYdERxT3RjbzgrWC9ZOE1USkRwZEQvcVBLT0V3LzZXVUxn?=
 =?utf-8?B?eVJLZmRhZWNUQU40RlNtbElrRVNrdjFmUWdpZ2s5d21qejNLYjlSUHNlL1JG?=
 =?utf-8?Q?E+ivOlbYGKFwouf6zLApBfCAqL0OEpvbzzHg8cnWEuutK?=
X-MS-Exchange-AntiSpam-MessageData-1: HK9figwDMlANqg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d36adc34-8028-47ca-c032-08de8b4b7d31
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:22:27.3847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0E/65VAumYPbjXFGwaXJURso16a6F1YGUr/EJJmPHx5pP+Y/1RX2eDGYnqxx8PUkQQx9Bo6ZX5qpolVDXYq7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

Replace the nova-core local `DmaObject` with a `Coherent` that can
fulfill the same role.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 3b12d90d9412..bcb713a868e2 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -12,6 +12,7 @@
         self,
         Device, //
     },
+    dma::Coherent,
     io::{
         register::WithBase, //
         Io,
@@ -29,7 +30,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     driver::Bar0,
     falcon::{
         self,
@@ -129,7 +129,7 @@ unsafe impl AsBytes for BootloaderDmemDescV2 {}
 /// operation.
 pub(crate) struct FwsecFirmwareWithBl {
     /// DMA object the bootloader will copy the firmware from.
-    _firmware_dma: DmaObject,
+    _firmware_dma: Coherent<[u8]>,
     /// Code of the bootloader to be loaded into non-secure IMEM.
     ucode: KVec<u8>,
     /// Descriptor to be loaded into DMEM for the bootloader to read.
@@ -211,7 +211,7 @@ pub(crate) fn new(
 
             (
                 align_padding,
-                DmaObject::from_data(dev, firmware_obj.as_slice())?,
+                Coherent::from_slice(dev, firmware_obj.as_slice(), GFP_KERNEL)?,
             )
         };
 

-- 
2.53.0

