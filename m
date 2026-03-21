Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3E538E5D0
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100211; cv=fail; b=WaZal6JMrBZhGhveNKAyfViqitxbsMdBdpZWmWytTJIlMQ0jj+QUDTkgwuQLcmxVnk4QqTSH8Mk70UhB3SMgi0OK5syJyRgfd3crRzF2WR/0syDSXvThyZSqOeIdPuCEoF8DKRSJ0hdSNGo2qJB6SmsQpxvUTNKnqpwmA/fwwHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100211; c=relaxed/simple;
	bh=aBnFlWLS2BN08/dMqK7cdN9jOT8XSk0sJozQVva79Cc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NYc4yOXpQtXrZSSVdJGkc71S/y3kM4Uh0+aiNJ5fobfYHY7iPXBD8ipO7vD6g66bRi9NzUf8n5Vmp5BEarq6j+eGlXu/OqmcPV1BrsEmGv6zRocCjJaBmWRvIK6m81H1qQ8w1Vao/d1GvqjHNK+2aqaMAYEjhDTgsQ9G189chPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qaJTunX6; arc=fail smtp.client-ip=52.101.56.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qaJTunX6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkTDbHoZVf05YX4VQiDgU/1V6nXzW7ecyZ/m/sRbwswXnOBGtvTZioBlCi8oJQejvcsRsPeXH4uWE6j187sGl/gy2MDzdYOwghaxICQdmnFf6hXBCaKS0JXBnj8BvgASP6AV02w9oa4rLiFgP6cbmNKf63f2kWRicP9eqi9CqREHuBWQODCCA7dOCy590DI/UA46smXtQejpES2ei15Nc7KEXx513pFOaZDgT0M78/BKl/UpROdxwCu594+ZQKDXcao6DtaEEB09zfd3cgJe4hkTIddgZAP+VVpaZmE7jXmhL+3pYHHUUB38otgVDsUNASx6MWP0XX9oPGGMT0DFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miVyfIErXfTxZFY7Kg8WzYdWRXLrYS4+XPL59y1PQN8=;
 b=BYgqJ6EIchyehuErGZGjBBpvL/orfm77lAQ9eZ90m9Dr8I83WfDBXEDmUyItbZCVLXylDRyMcqeTJBMtaL33uROzvxtRg58nXhs3kdTLUhQXHR8PIvtnRfp8RDde0LyVk+YKPwrm3jAl4kRa4l4h1913+HrPpdqZ1hdPEAivU/ugqTy8SHclEvzGTRiWRKrvtg7pRDC2CITrFbcbWAU6R+/fcRZ2JF94eeaTIqMyeI5VcELk8Ewo0SQL1YCZu1Cq83kLzjNea6BAA9fuk3ys3Ma4vFZg0rYz1KABGADoGGjooETZd4oEfziLBK1LXoMPlWsF3B7LAkxB82uGrNL4Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miVyfIErXfTxZFY7Kg8WzYdWRXLrYS4+XPL59y1PQN8=;
 b=qaJTunX6hMXSiB4CNh+7rRFaoDOEu1nkI9XGSBVxLgMq05Dr5cU/L2l+z44q97YtCg0O0j0OZoVY1pXBZS8gHMvpA3rpcjFjsiZ2VPrmRBkPj6Pyt0EmKWBzFa+89gV9OzKU70sIuEtag9ryIiRbWmCbRWefNMYtAxyAtnlAiIkDVhh7FewY5km1vBY1XCd0gGsullXZSTMzVtPxVfSS7n72xVv+dZwEa7twOfy0qxSecAKSuSoy+juXi2BFKy4gxIVAHOmoU9Azt+aakjlkBJpikPnj/oyHpPrEuDSFgH5Szb53rhS9ANzaXOGk6zWSccGYnIK1iYNkoghzWpYcuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 13:36:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:36:41 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 21 Mar 2026 22:36:22 +0900
Subject: [PATCH 4/7] gpu: nova-core: falcon: use dma::Coherent
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-b4-nova-dma-removal-v1-4-5cf18a75ff64@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ec8113-85b6-4c36-333d-08de874ee292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	6TBhdFAgaP04UohUbEhA68a4Wf0MoY/7wG2bqFidGns3s+8qV3Amlsw++8KQf/dUr2wXl6FxDbfePCyncRtipKUEqeDsPaSj6M8jA4bckcgvkOWYaKA8DMZFu64t4sDLv/aL9ymZc4pYI3U5MtlqhMp7cB6GGjVllqVKCBC4Z9QU1dmulp+d/K2YzZRRhxrZiQ4+QZZkSqPDAB8SrJmDdaexcBqVfSCCvwseHGQgAwMa8nSh+PO0SM2uDf3+xuOCZSlRr/osj28itGq3RfOljmkXHfwINJFrr93gMnIAkg+RwUg75MGZdTThumH/1nmGbIjz8PEOK8PfeuQ1/KxkYPnM1SLlPf9hC6Rx+a+yTacoHyKsRcXOSs3yJHafIXEz74vYK0dllx/68KJi5i+VAdvSEOH1y14jymxHC9/j+OomVtlJj+o7g7uk/eZfUfyUt5drB+wZc7NOWvuQjtRX6+8jBcfwLaWQa0jyz0RDWlzYidQO6BTB3/0/brS42F1RRo8ZwJc5HUZJV2Gk7WZDwO8STMCZHWcKRiqgI7fyJ/sgZhvw+oSzpfAjfeSJwe1xyiLOIJiYPNQgfjw57+tuSaQxpDjp9L781VnBKcpN2aW8Qqo6vQy0AJTXABh5vPRr+fyU2PuN59apzmIwhr2vYO7wGsRqqMdYO/flBFQ0Kr422BR+C0+G/51Hsf+mILUF6x5pd6f345528owpVREayhEAHkri1FdTehAJjTtqBQh680YEMtcSrtVsbHYcQn7edCj9majw1THNKAr3JkvUpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUtHM0grSnl5SVI0UzBOUFN0SE1IaXJwbDVoQmdWZXRBUGZ0cjNLbG5XTHpY?=
 =?utf-8?B?d1VpNVpmdVY5TlhyVFh0aHNkWnJwbEJVMXc5enpnVW9ZNEVnVEhQUlRnSTNn?=
 =?utf-8?B?cXpsMjZnOEp1NjJnOWxkVU5jWjVvOVBaNm1yWWJvYTRBOEsveVJ4SnlJYnhW?=
 =?utf-8?B?RnpvZ3dzbWRHQWlONk0zTTJ1YnljcXlRQjJKSmhTL3dseGZqWjBoTDdtQ3NB?=
 =?utf-8?B?UVo4S3BHUEVVWW9yUnIvMTdDdE9MY25wczFVUC9tMVVTODkrRG9Wc01pMlRS?=
 =?utf-8?B?SFB1WklZMEtqbTdnRllPcGZrTkpydmRqM3piWmNvRExTNmo5blh6UE5ZQmhM?=
 =?utf-8?B?UkpOOVR5TU9vckVOdTlvdUFFV0xKVUVYbEJGSTUvbHp0YWNoU2ZoNWRhRW9V?=
 =?utf-8?B?amlmNTFDYmNyTFJuNE1NcDZickNKU04vb0ZJS3lnbnZrWDBuNUdJWlJvT00r?=
 =?utf-8?B?NnQ4NjN3TXd1TXZydUdFUVg1US9UUmxjNnhubWhSUU9BYzhyeTAxenY0RExC?=
 =?utf-8?B?c2xrdXAyM3ltV1JRK3krRldXc1M0QVBpZzI3K0hyMTE5eXc3YS9ONlI2K1dV?=
 =?utf-8?B?MFYxZU4waVdpanp1MndYSmN6ak1MNU5ocnQrdk00TmRTMkEvendTTE8zU1Ur?=
 =?utf-8?B?MzhFUThmcmtlVnFJbElDVVpOSDA1VnArRFREUzNvMituUzNCUE1ZL09BaDRk?=
 =?utf-8?B?eWNNdFZjQ25pdTBGNDhPL0kzWjdFaHE5aVpWV2NOVytIYW5WWHVFeTdTak9w?=
 =?utf-8?B?eEthbW1ZOEw3UG9xMWdCM3ZzTEJoeUZrSnQ3Z0R3d3A5QnBrTnZTODBESGVQ?=
 =?utf-8?B?ZXdmR0s4WFBwdENTS0w1NCtheEtDcWF5YiszWVBNc3lpL3VCbTl5YVllN3lI?=
 =?utf-8?B?cVlkS0wzUVFpcTU0QmE2ekw0SUx1emhUQTgxS0RrSDNXci9RRUVUN05DM0dr?=
 =?utf-8?B?Ti9BLzhUemF1WFhuZVdyMUZXd3VhdjNTY3poU3c2YjRtNmlOeThXUTE3NEkw?=
 =?utf-8?B?QVNTVzhWWG5DeDEyUi9PN2dFSy81aU5LVWNaSmxoNVZHRzdXMHdGVlRlMHJw?=
 =?utf-8?B?ZjNodDlZRzY5RjZhYm8rbitwa3hUM0d0VHJJWWdldTVuamxuOEFWWUdhL2ZD?=
 =?utf-8?B?QU00bkZGSGo0SHdhWUZDZjJ2ZXZ5Q00rQ0FTNEpqaWxOMXBaOXJMdGlMM0w5?=
 =?utf-8?B?SkxjbHpLTzZUalBLVlJjK3B5RWRWQVhjTzgzWCtVTVRzR0U2Q0NZbW42VzlX?=
 =?utf-8?B?NHJXOXA5QlZmNFhOZE5rSDF3dHZMdXphZHBIbmFBSTMrVUhHdGVuMjZzQVJn?=
 =?utf-8?B?Q2VwV25zK3JpNEtSbkV4Ny9Pa0NpeWE0MkxJcjFWMVZwcGo0UzQ1SC9nY2ha?=
 =?utf-8?B?UWVib1RpeXFLYkVsMmdzK1RPRUxYbUdmYk5DcG1jYjl4Z0kvNEk3TjlmZFdx?=
 =?utf-8?B?R0RkV1VtMjNyQ2dZdm16N1hqTWVYVjFCL1ZZY0JIbWdJWHRSUDZOUktMM2tv?=
 =?utf-8?B?eFRjbWNLc2VoWlFvN0syZ0hPQ2I4aXpXWHNXUlNJLys5aGdwLzE2a29Sb2hn?=
 =?utf-8?B?Z09kNTI5allLTWlnV1NreTdFU1Nabk5qZnNrWVJ6Q1RWRnZkNXprZk13akRi?=
 =?utf-8?B?dWhtTFBubExzRm0zOUYwVDQ0N2hQZnBtT1lWS044OXc5RXRTVjRaN0VGa0dx?=
 =?utf-8?B?WEdJNnh3dk9ib0FUYlFVaE5pb280ZHhRYXNFSnJMQWlhVXhEdTMrOUdwT3lv?=
 =?utf-8?B?RUg0TmNkdDBsZ1BpMXVBQURCN2FxT3R3c1FtRTFCYU04cHlERGQwMytaMVpB?=
 =?utf-8?B?dldWZTdzdzI4RmNmTndYSDVGdHlZTENGenNTZ3FOTGhyN29MTytvM3J0d2N2?=
 =?utf-8?B?N2FxQ0M4TCtyTUEwZmw1OGNmeTRzV2NGUndzdmZZVWVjL0dEWXhFYmFWOWlJ?=
 =?utf-8?B?N01pV1c1aGo4WXY1dDA2QnM5RGRrbkFNdEhEZTdzeXRFMGtDd1F1REtIdW9v?=
 =?utf-8?B?TGZSYVZuYk1yU0tzNklmVEdLRUNHK1FqcytINXhWcEFJUzZkM2JjYkNYSTF0?=
 =?utf-8?B?aHIyWnFYbExhSFZUNEZZNTZWYnVEL0h5UDc3bm5IRjNQdWJ6dko1c1V5eEpp?=
 =?utf-8?B?eXcwWFN0NDlydUV5SllCdXhUK3BldHlqbDZyNFFyWS9KQ21CRk5mTEgwZjlU?=
 =?utf-8?B?UUZGb0RObjFiVmNHdmovT05UWWZMdng4TXRPL0NpdmZVNVRiNk9HU0NEYkVu?=
 =?utf-8?B?eGZmOHU5T0Rmbjdveldva01VbHdpUUM4UVdENTROdUJFTHp3Q1BBVWN3R1Z5?=
 =?utf-8?B?eFBOYXZTVlBYZTZIenZYSVErdWdROTJXK3pBSWwyUzV2cDRXWGQ4d3VzUjNP?=
 =?utf-8?Q?SntLHkbhYuBqBExK9QuoKz+UjDRqnRnwVFakzenjnq9zs?=
X-MS-Exchange-AntiSpam-MessageData-1: Vjk7FeG0WVzvpQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ec8113-85b6-4c36-333d-08de874ee292
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:36:41.3021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyad0DEz0UWijKS7DHtYswVQB/de3p0PTcdPwDVZaF+FWNnp4iJjJKoD2JvxhVqRqRjHJXPlYJS17aBV6mAAZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133

Replace the nova-core local `DmaObject` with a `Coherent` that can
fulfill the same role.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 5bf8da8760bf..f6239c44dd80 100644
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
@@ -20,7 +21,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     driver::Bar0,
     falcon::hal::LoadMethod,
     gpu::Chipset,
@@ -636,7 +636,7 @@ pub(crate) fn pio_load<F: FalconFirmware<Target = E> + FalconPioLoadable>(
     fn dma_wr(
         &self,
         bar: &Bar0,
-        dma_obj: &DmaObject,
+        dma_obj: &Coherent<[u8]>,
         target_mem: FalconMem,
         load_offsets: FalconDmaLoadTarget,
     ) -> Result {
@@ -740,7 +740,7 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         fw: &F,
     ) -> Result {
         // Create DMA object with firmware content as the source of the DMA engine.
-        let dma_obj = DmaObject::from_data(dev, fw.as_slice())?;
+        let dma_obj = Coherent::from_slice(dev, fw.as_slice(), GFP_KERNEL)?;
 
         self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {

-- 
2.53.0

