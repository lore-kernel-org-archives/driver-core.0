Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E160040756C
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538560; cv=fail; b=CsA4KCvp+NTthSr4NkdNBmGCGNUf/aNwQHV3QL/s8bKAA4oikZf44EvumaFTG6BKOVfylJYSnIU/U4quNQkiaxmm04wYEFgJFSs/N8zkOMMoafguayrWWSNvQPXaTzBHZT25KpiubWKizb397Cz0D3y50KKN9nojVgYicsR6VIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538560; c=relaxed/simple;
	bh=3+EjKkR0UKIPp7be0JKoVgXwE0rvWt/yQiBojFtwsb8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GHU7XKzJHyDa3Jr52oMjRowHycmrqFsf4wSWePPjZsTTRLCiGxrwU/dA+w9lEp5PcL2dmFeH3EBxKBanckfQPeYn8j29cCPCKDk6rLStg5lRZIj+ILuk3vD+UkzZ8AGqlM6N6EHcCWtSqjLaHFRJTo9jsUAinsoJViZEUJ4iQ7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dWuHSE4T; arc=fail smtp.client-ip=52.101.53.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dWuHSE4T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DinJsCzISYpkenRRib2Jr2vIWSJPoUD1+3Zh1djpAH0O2uWnrVtEsylVd8dlIUN3GDmz62Xdd+dZATew3uZFTwzjmoKWeYgxEQSAdo+oWNiwrvaT6BWGUSEy+Yem7zgXiDZMsT46frKihwC6TU0oBHMxlSgtv2ByGCnGxdsuoLyvLDSXux0B/AepQgRQNzowJHihtCIDjKvmVYXra8ENOn+qf3txwk3G7dYqDWhk8YddRcnm8p9hvLF65KBT3Tuv966zm21xAIzoGdPOCHL3xsGRjcBIrMsobCp/s5xkGYQaN8mlRljmbHzQ1f9a09nkky2IecOUyi3It/xTgitSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcwpdnlxnKWrq8UQygURStPZS9WKawS90pO8lig9H9w=;
 b=TsWV1yaahOYOaE6Z9qqQm9EMUw0ighOyEqxAxjLaK45HlV5ou0HsobZytrxVr9D7DuwyI6TrB9ZZCFUdU+6oa8Hw2NlQb0JStgYn7tKeBWlzugfNw/fobjOhablydNIFCF4Cr2SNBxwgvgdZq9D3P5qFYinQdsvYzkj4nA6WuF6q/4L6aEwUeV//8nW9mrGlr/pkxs/0ygRGkIqQMt8jjxfZ4uDjGmcPgOGEEQZ1O4MgaPlnE0Rxl/fclKD950EhPA4g3EmgGBidrTR+2yFlMHyeKgN4cMNSfpo5De/lqCJx90mE1mg1WmZibdDjU3nBXq+WmZ+cyYF6CtzVjEjAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcwpdnlxnKWrq8UQygURStPZS9WKawS90pO8lig9H9w=;
 b=dWuHSE4TEYonekXRTkqlJ8KlR0QQ2X+k5jpqZteE/wBR+E3mHAbggU1eIecE413fHgmFpMiNioxNCki3vppZJ642uE9oRSxjBzSGuTXbd6sBFa76/M0gdzhgIVZzxW8SEp2xKjipY4okBAO/mQqO1sCj/Gg4kxv0hW2aEwAZQnY7YJe4U3JJm7MgbH1LRLeKdto9pjYV7+fFfNTfLBi/T9vgjvGjyEQX3Ubwno2aqsUC+hgfWMCBwXzBe7VQw8S9jihNhrHP3iX8Y8j9mPFM7gHtT/i8DJNaA1/gNSONORNiLWRwOkHwX2YnmPOhz1cH7GXtlIusIiWYkk/KB5HQUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 15:22:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 15:22:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 27 Mar 2026 00:22:10 +0900
Subject: [PATCH v2 4/7] gpu: nova-core: falcon: use dma::Coherent
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-nova-dma-removal-v2-4-616e1d0b5cb3@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0094.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: b0bccabc-be9b-4b6f-91c5-08de8b4b7f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0B10xCIlv+AdX5ZjUJIAmzruv9rPL3L+BBuyEJczTmZOz3Xp9qfF2L7QQa2un8c0uLqh79Wb+tJiqTDBntU45lso6eiTIUfk5uUg2a336O577eCn9LoFn6nAJu5UAVaLINPJlaC31Gdzkyi9A07HdflPS7ZIAnnQYk9s0o8SYNmc8bj3OsGzifONNzwfg55zbJnMPCG5DaaGysq4XEC4oMOMQ3K34RbxwbVXEOT/R7bI3HBNCj9YCmqz3ksR7s4o7I0V75nGlEDVbtND9wFi4+oGgmd0f39kald5H+atb3ToB6v2NAgveYppxI8opoDdEDDKHXZrcsm5nH7zB758uqKCad/tRLUeKhuj9gHpsS8wO9D9YGgqNjkxKMAQ83s5DOm/7JltlceJ0cs2nH9rnSQA0/V/T/dAGoc4JSSdVwV8oQRxZHC0H82wlEvHPtZPFVOCJMoW9iDHDEyUbNW8DRgRYC73hPg3IAzAIhmTdIgjg+XwjMoYeCMQqqMBK0xZiLkjvAgm2imnyY73LG3871lf6zmFRbk7w414MXe5trhJ5FPx/DLtgDbC4G8R0gPGmALdX/82llgew/l4v1rbSm0fVNHcWL0b4yVR4LYBk6B9yeV/RfSe+MS3DevLmHXzKWO4/1aQ06io2xRJ0y48rD4oEYja9Bf0bfjDBPqv8dKYn8px6BZIk/qNDyJkQZ19/T2IVvo5CJz+6OEYLMf8vokgBGBZidWMecI0+yUjs/Ntcyp0nLPn+3VHtNUelRejrbF2PGEvj4Vv6vR1HRCwIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck1tWTJOZ3lrdG1PK2NrdEh3bjFiRFpuM1AxOHN4L0p2YVArZ3FWbVpVcDVJ?=
 =?utf-8?B?SUtOWk45V0JyR2ZPd0ZOOHRLcjExTjArdVJIR2VMU2hqTVgzNmJuUG1hK2o2?=
 =?utf-8?B?TEtLTzFHYU1kdXJ4a0tlU3c0QWdZYVpEaHVGZTdMVSszQzYxUHhxczJ4a0FX?=
 =?utf-8?B?VjdCMWdmL3dQbHN4TGtSUFpmbitsZHVVc2Evb2dZYzVrZWltK2wyaytvbk9X?=
 =?utf-8?B?MTdmeW83OWNCUlk4cWwvdFJOWURGWnY0UTFSbFkvVGs1WTRPbzVYWG0vVGR0?=
 =?utf-8?B?Q1hvT1JzN3RlY2w1cUtTbTlXY1YwRGk3ZmFyeDNaMis5MFVQRmNxS1VWZUhy?=
 =?utf-8?B?K2NKRCs1VWFHVUNNSmNvV3lVWFBHQ2t4TUJUaTVuNlE1eXlCeFcyME9ZSXhT?=
 =?utf-8?B?aXcwL2JGcEtxMVJZVVVZbWNhWGJsc24zenpaWCtnckt0V281L1ZHQ1Fqem9E?=
 =?utf-8?B?S3JTc3lmckVDQWRORFJPSmFnMVA3ZGFRRktOVkNlZ25ZQUdIb0s3WUhiVGFN?=
 =?utf-8?B?S2xuZHcyc3RhM1o3bkpyYm1zS1JRUFVKR3d0eHEvYmUrb2VqVkZsbVNvaEpK?=
 =?utf-8?B?UXErYmUwTWNpTkNOWWNDblZNcmtzb0ExZk1Jc01DME1vaURCTzBNMHIvdS9T?=
 =?utf-8?B?L1hubW5BaWVORzliMlBrV3VaTE82YUVsWmlwMGVIci9GN3RTdEtWYWpjemtS?=
 =?utf-8?B?ZzQ0ZG9rRnM4eDhsUGF5dU84bEVxSW1xM2lkOUp3VCtsd0Z0ZXdyQW56K1VO?=
 =?utf-8?B?OWVTRzRlUUs3U3dQcnB5TFdRTEd6L2ZUZGkrZ09pWFg2MjRtTlBFdHhidzRQ?=
 =?utf-8?B?WENDNG9sNUpaODJScVhrRXAyTmRGUXRNY1FMcCtZYkVEU0wwZHEvNStRcWtn?=
 =?utf-8?B?dFRiYm4rc3hWTXFzNTBmU29tekxKRE1xbm5oVm16RHJTVDZXd2NCNWhsSkRn?=
 =?utf-8?B?dmpENjNmMEloeUdKdjQ0eEh2UnBLekNxdU5QSjZTTjRDcnNYcVFhMVAyUFdG?=
 =?utf-8?B?anAyL1NRZnpBMkdQSjBFN1ZXNHNBOENPek9Dekp4NGt1U1RoQzl0QkZ4UzJo?=
 =?utf-8?B?NkJUUTJPQU1qaWNFQzQ0YXRoVThpbXpDVytJOXA2NnhZeE9HdG0zeDZHaU9D?=
 =?utf-8?B?bGgxY0YreEVPK09GMGNBQ0tzNC85M08zZ2w3SGhVRTNHaFRhcVdFeGRxdkdM?=
 =?utf-8?B?a29BN1RkUG5VRjBqUXRKdTFqc1g2SFBENld4akFlcWNCTXFaV0hNeCtoS0dW?=
 =?utf-8?B?RjZtVEtUckhZeU5KWVl4THptTytZUFlObGlTbjZwd0FHaHBuUFFtZUdVTFIy?=
 =?utf-8?B?Qnc5YlIxeTVtYzJTdGhreVVEdkxkSXdTaVdvamh4enJ4cmpvUTJ4Mk9SUDZO?=
 =?utf-8?B?MThYZE9ONDdENGZZTWZ1N1JZRzlORW9HUkxqQ3RvTmFXNzVCU0NsMkIvRUlh?=
 =?utf-8?B?NVkzYTVwbGFTR25HNmNFUkpPaDZWSFJGMFZFOG9zZ1Fsb2k3R2NudGNhRTVG?=
 =?utf-8?B?elJjejZOT0xZaGlsVVZyYnJSb2ZEc25WRDlpVTBzNGxPbUtPU2FUMEw5UEk3?=
 =?utf-8?B?K01KYndCVjJHSkRGb1R6Z0JaTnZzaWFZWVNHeTBBQWY4VXlITFpzdVhGUmgr?=
 =?utf-8?B?aFRXakg1NVozUmU4c0ttWk1KRFdBaXJOOVZ1SGpDQzVNMWZkMm5aeVk5eGZ0?=
 =?utf-8?B?SFcyQitPYXNTSWdnMTM2TkIyT0ZFSEo5MlBlbWduOWtsZXZ0QS84OVd5ZW9v?=
 =?utf-8?B?d1FSUU5Ja3d5clZmTGtpbVJwb1QwU21iMWxoZE16VEF1YmNzTHVtYlA5U2d4?=
 =?utf-8?B?V2JCOHF1NHJ5UkxOY1hPQlJvL0MwaFB0MnNyZFNvYytPWGdNVTNlMGJzaW1h?=
 =?utf-8?B?Q0E3MHlkaWlGUktMbmFERW1jZEZvbWFMQnJ0b3FqQU1LMFZtZHBDR1dldG45?=
 =?utf-8?B?citHQ2VyL0xHaEJUV05KWFhJNGVQNEtvUE1Bdm1zM2IzVnhoY2FsSjBoZ0JW?=
 =?utf-8?B?MmZHVFJEMzl4c2NSZ1doUWV2QlVINTV2NERGbFZUMnlyTGhodEdHODk2ckpj?=
 =?utf-8?B?M0RlSnl6NzRvNW41WEN2UFRkOFdXMUk2L0F1N2h1dDNwZlZjT3Y2ZFRNN09m?=
 =?utf-8?B?Qy9SRkRDQUhhb2JnT2ZaYW1DRGZxQklXdkNXeWhPcEc1T1haLzZtNU5rZUxE?=
 =?utf-8?B?SkMrUGZ2b0JEcUdYa2dOVFBuZzN1Q2xHSDU0ZFY0RTY3M2p2Y0ZnNzNVMmVQ?=
 =?utf-8?B?cXp1Y0xKTFo0RWVRV0xXQ21OcVhhWFZyV3pkeWpSaThOMkNZazdWd3VUKzhM?=
 =?utf-8?B?L0szV3UvK3dkeGRrREh4cG5qUXlQUUpBcVo4MWt5WTRqdER1N1BBQmhRbXFP?=
 =?utf-8?Q?pOmeTRe79aR1iZazWGpjAatsP85FTJGo0/YwbymXVxq0r?=
X-MS-Exchange-AntiSpam-MessageData-1: F4M4iyklXTGSfw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bccabc-be9b-4b6f-91c5-08de8b4b7f6a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:22:31.1535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pw26fY7ySZgGV9CdFtMkRmQ0OZwffkOyJeh8LGU/lJwiz8HHLuaFvSbWx2G6W4Ft9AeI+9hj4bGJ+oisqMmilw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

Replace the nova-core local `DmaObject` with a `Coherent` that can
fulfill the same role.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c49ec6ded909..e0315fda576b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -10,6 +10,7 @@
         Device, //
     },
     dma::{
+        Coherent,
         DmaAddress,
         DmaMask, //
     },
@@ -28,7 +29,6 @@
 
 use crate::{
     bounded_enum,
-    dma::DmaObject,
     driver::Bar0,
     falcon::hal::LoadMethod,
     gpu::Chipset,
@@ -504,7 +504,7 @@ pub(crate) fn pio_load<F: FalconFirmware<Target = E> + FalconPioLoadable>(
     fn dma_wr(
         &self,
         bar: &Bar0,
-        dma_obj: &DmaObject,
+        dma_obj: &Coherent<[u8]>,
         target_mem: FalconMem,
         load_offsets: FalconDmaLoadTarget,
     ) -> Result {
@@ -614,7 +614,7 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         fw: &F,
     ) -> Result {
         // Create DMA object with firmware content as the source of the DMA engine.
-        let dma_obj = DmaObject::from_data(dev, fw.as_slice())?;
+        let dma_obj = Coherent::from_slice(dev, fw.as_slice(), GFP_KERNEL)?;
 
         self.dma_reset(bar);
         bar.update(regs::NV_PFALCON_FBIF_TRANSCFG::of::<E>().at(0), |v| {

-- 
2.53.0

