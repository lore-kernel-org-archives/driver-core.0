Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3963038D005
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100213; cv=fail; b=LnZAJIM/Ie4plx2IRvgP+foBQjfT+FTJBAry0lo8A3QEmhyQpNVTeo/bHiTseTV0pSH73JLRmIuNWHGQFzdI8TREW7nZjcOEZD+gMHevEdYqHNhDBdGjLTmcYpoLEWRO4mApn1mZNs+octojA7nCvs/+gYItEBcrf2MWiKd4EMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100213; c=relaxed/simple;
	bh=EX//spgIqV5RhAwcj+2Y2ukONQDZTUu4PesKMA1aV98=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=P0mziDGAMHV9o+AD1/QO5DrBDVme9xGxCZlxLPAFLr8b93j2U5gw6qFrPzl2JiPLDSQexSUcjI9zUyIdlwqdnd/DlH/MnpSowNyIAVw3MvfL4ypyOi0fiVWdhAzUkVftFgCZqSD0uHPE8lmOhWmZopd1f4LqFFPy4m0XqgwgKbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=goERvdUR; arc=fail smtp.client-ip=52.101.56.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="goERvdUR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJzTJqza5yVmFpfVy8ffGVrVgp5B7ky9LN5FXprF5xm9c54fIHw+Y3RBzcFLQ2rt9MxFvhNczY/D8n+obqjR1cJzkue8AZbAVEgFvgDngMV8dSaxqsiD7EDSo2uDoVO9HVaEPY75TgF8cAW2pUCQyrvHBYFuTwOuB5GV3qqKeuhgY7hv8De18jkBZ16vzUjgHpJLCIEIkGjG0vcOmy/aPVnKVUXrWCGng/B0h3g+D6ewL44Sou6GomqgHUbw1QGR6WEBXEqo5Mb/8WwU16GL6owIdlVoS/360SHz/FO6ANXEed6WmWGgAHwqj7chW3xSKfB7jEYrq6wO5xNzLVp/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NNr6JaNvFCvzZrfyrrPM/QCgEZkcrhRCrhKGsS5Z0s=;
 b=J0YFooLgeb2mBZ6vXjnOe6B5DVYr61/T9o/ikn89d6C4VNZpVqpHOMnJXDRRkKNBIE+rYpOaYHWHQYFUGz4Yst56k7Q/4GrIYgq733xPhMhcNvUJhZuQk1EO6edGxrai66RGCSD3gFsE7BQM1GYog6O7KJvZq1X0w8ziVncozFjpEwu4smwxScPey9BqxQA3m9Z353p9uw3gI98I2W26zSBl2FzY30cO8egc/qvi34ysF42v0QW5tVMLLhLugsWUddwmo1mlxZylmA0yv1ZNRaVOxTUMwDpmW3uraRzX1PCOJ7U1U1NFlY/77PvRmfiQiayV/iiSeqWY2X3b3xTyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NNr6JaNvFCvzZrfyrrPM/QCgEZkcrhRCrhKGsS5Z0s=;
 b=goERvdURZkIus+qkLrikYvAZlAcgBmBjYP0Mb60Neq3STZ2CSFjtXUsrbSKe26mADSnuKfe+hedC7fWiH9HTn2dk1Zv1yKQ6UTK9Buz17zqy0tT5ndFwrv0TES8p2J1wtleVNjYmdRlE8EPfo1KaWHYF4R84ingq+RFRHrTr5N84ZOWSgV4+w1GkNsYZiZYdLPRbXU9vTqhm8mi9QAoMNIc8qJ4W49GBVRhi16am7ZktjQxekVrbCOR6je+bezkDUf/6BnIQeXm1CJ/OPWbWa5/6QocEADFZvegOYGSz+Pd9LVkJelwc9VTIRRIAxAx3jPDXI3NkLVnYu1Ykr3iSgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 13:36:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:36:44 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 21 Mar 2026 22:36:23 +0900
Subject: [PATCH 5/7] gpu: nova-core: fb: use dma::Coherent
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-b4-nova-dma-removal-v1-5-5cf18a75ff64@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0190.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e4b45a-ee26-44ad-dacf-08de874ee48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	bRuE4Y3VWG5RjClKccjH3RtHLkCWb9h4LjGIpdQ0waNOP9nZ4ncgmmcYHJ+ZOACRD64gBk1fEEZm+qfytMIYhWEmmhHCOAICrhKrF/4QQOIhBwojxnvWhlPW58jMU/61VnYHXei2v+wHy5YDHLd0yf5U9EUHF2vURsGpZl8SQOJ7hL9ynu1B0VcP61kZHrgX5lRe8w8cHKyFWpoUkbO/DUtajdOGha0k8esS0LilW+27rkgeHIv6X35fWh4o3rrqXRKedC5RgXZKr/zco22/K+USeNdNFGqgyBgYWes+q2AF7p0AVZXDmLimo6173RS+iV7ULmqNgRikLKyjg6Fi+cmg24dZyuQbaoPOROsQFvWjxjFVPHT3D36vmlNygeCxkBds9Hw+BxsgN7HcrW/QscdOP0y/2Fg6OhwCnI+e1yuxX9ukeIU7U6F+CIZsdMnRqwzcBDQ5fQ6Wg9trmNcBKrSFmKj/D35hYnJncaCIm6faj+Igif3grn5rCHCFCNG3p/fKIaocX4906BUSPAsi7hBogVOW8dILBNvOhEb7S4ap4R2MHOkRUsKTQisEuVgomVOQj7gz2Z3Sn9AlaNFrSxFYdkM1Y1Y7cKb3HMZ2tWQSIesu4vBsY58gg6BEGHREA80iVASAdxZrr7/IqwIoWyTAyrlxxK7li5qi7d4qcIGNI+CIfn3ln5dUTOwnv3krs3s8S3NcOcbj+/AbA/pkXM7hmfoDyWv7jidyfrIhtAsHyS0VgFQR8SJcRCpSWlN4XvpjQs5Da4JYc0i/AyAIkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFFVSExGbzUxOEM5OTc3WEJQYWtEOTNiaEkzdXVtUWRJanRHZCtKaUFMYzZQ?=
 =?utf-8?B?c2hwNDhYTUZxUHhtMTllK3J2YU5wWk1WUVdRZ0tRWmFHejNsWk1vaFY4cjlY?=
 =?utf-8?B?V0NCNDZHanFuYXJ4M3BOSHlPaUo2OUJPemhoWHQwTWFCSWdSUXB2S05iNy9M?=
 =?utf-8?B?RVlXck5BNjdhSU1PbGFWaFk2b2RiOURWbk41K1Z1dFptRkh0NnZESTBWeVBn?=
 =?utf-8?B?U0VpODE3YnVWUU5XbEJiUDR4M3F0S3RVeTVtSGI4c0E1V29WbWJMMXZNekRP?=
 =?utf-8?B?aEs1SE5VNkloM3pwY0gxNC9sNzg5ZHRabEhLUVovaVNEdG1BVVJBNnBBbnQr?=
 =?utf-8?B?QUIwOVhVNitMckcvZ0J3ZkhTckFZK1pqNjBmWlVpRlpwUUc0U2V5ajU4ZjRn?=
 =?utf-8?B?ZXI5Qm5sMWlWSmJVNTNHdUFtZ1VWMU5tOThsOTdBcWZWSk9jTUlkaGRXYzlE?=
 =?utf-8?B?c2F0UGYvMmdIWUZabWtLci8xRnJHdkk0OTBML3RyNERUNXU4UjhTZzhOMUpn?=
 =?utf-8?B?amZUbTdROFgvaWFRcXh6R0pKelIyMGhYcEsxaFptajZjd01GTlJjbnN3RG1p?=
 =?utf-8?B?Uk03NXJHS3gvV2pnK0E5eVFaNXM3eVpQREhFTXorTjMvL0dLVDlnR2paenlp?=
 =?utf-8?B?TkdxOWsrZm5BcWEzS2QzLzNMUlFweGh0ODRRV012b1htbmJUNlJXZEUzTHlh?=
 =?utf-8?B?dTN0bGRXVFhpUGZxTEk4ZkJGNi9JRjlTKzhhVXJVck5hQkkvN1hiRUJtcGQy?=
 =?utf-8?B?TU9rZkg4N3hrY05uYStOcWFTMDgwY1pEdlZUbXJQbEgwWGg4elVJbXA0blZl?=
 =?utf-8?B?SDI0aUxmblhRTDNqR0JBOU1JaFphNVJUNkhoWW8vSnpPc3dzQjRTTG9uOFNl?=
 =?utf-8?B?LzRaSnZ2Y0tETno2b2FGRndqQS9xRHh4SXAzV25vd3RkWmlsU3VZeXRJS3U2?=
 =?utf-8?B?b0F2TVI5Rkp1VFNsZ0RZRVJETnZHc2JRMlVEQlQ5YTBiRElxWDcrdk1yOXh1?=
 =?utf-8?B?SmNMSEp5cDRYTXRZNzVrQi93amJDYktTKzVaZTBzb1hmZHRNRXA2a2hKK1hQ?=
 =?utf-8?B?YkN1MTF4dzcyVnVvQU00cWQ0SkdoVjlXb2VzVTdKN0tHeTZKakNaVWJ1ZVg5?=
 =?utf-8?B?Z1g1blQxZWtJUXM5dzc3Y3V3eFAzM0ZLWnJFUWdVLzA2WHlaVnYzcjg2SUly?=
 =?utf-8?B?YVNPbTllWnRyamJXUEFFS05TTzhLM2F1U1pzTGxhY204eUdCSkF6YnI0SDF4?=
 =?utf-8?B?d3lrbzI4TFJWaHBpQkNZVVRtenI4Y00vNGtIVlNZUWhzQlJyNHNreFF0RHpr?=
 =?utf-8?B?WHB2Z21CMVlpdDVoV0VsYWlicE9TVVdTSSt4RngwMU1KcGRpeE5DYmpkUEFV?=
 =?utf-8?B?Y29NL3VyWTVwamxaSHFOdkJOd0srbm01enNJN0V0UXRFRHpjUjBnOVRMck54?=
 =?utf-8?B?NlBjeW1SNG9TRVMrS3JoSGMxWkxSajRYeVBVVW9PdWd0Zm40MXhXZHlYQklz?=
 =?utf-8?B?QWUzZW5iU25QbllCeTJpZVJoeGtvMFRMVTJEKzl1Y09PaW5uRHpaTWlxRnN4?=
 =?utf-8?B?MWVBbERGdXFEL3NJQ0M1TFdCU09Sb2srb0ExMk9CRllZSmdWN1pWL2JsRXl1?=
 =?utf-8?B?M0k2eXRCaEw5N1NDUmhYdXNDS1NtaGJnREhLWjg0YUlaOGhTb2RxVjhiUWVN?=
 =?utf-8?B?bXZCU0Y3aWdHaVV0UVAxb3BjTGlRcVpmSFpMZ3R4ZklFd3JITEJZcFZ2ek9B?=
 =?utf-8?B?bWtqZ3hkNmpyZGFHQVhia2FOZjgvRlYydGY0YkY4QzR2ZzRVeTdMdUlOeGtQ?=
 =?utf-8?B?Nm1YQlQyaVpIWmpaa3pqVnA4MUdtaXpUeVRNbjNpMXBKK2NtcE56c2JUN0w0?=
 =?utf-8?B?UnhBR0dzK1IwY2liYXpFOGEzbHR3MFFSK3pieVRZbk5YWXV5TG1oNmJHaUZn?=
 =?utf-8?B?Wlk3K1BUdDE1QmhpN1YyeWRyb2JsUktNaWs1MnBtK0FLZWlmbUdmT29zbGh0?=
 =?utf-8?B?SXBuam5zcGt1WHAyeXQxOGg1dlNyeXJ1YjIzVllvanc5Y29VMDNQL3BzaWt4?=
 =?utf-8?B?N3lYQ1FrY1JCbGdKSWIrdzY2L2lqaE42di9qU3J4b0pDUW1vN0ZOLzNGZUdk?=
 =?utf-8?B?T3N0eDJ3dWprZk80RFFTdTV3ZU10QTU4eERlWW5KaEFpWmdCNTJGaEU1WWFk?=
 =?utf-8?B?Vk9qK053ZFE2YUhKVlZBMGlrRm00UzcwTHZNSzRacGk4ZVM3ZnlYckFVM2Nt?=
 =?utf-8?B?bzJTQnBMNjIxQWpWRzA0YjUyQXh3OHl6YWlKWlA4N2RPL1hQa1N6Q29WY3dW?=
 =?utf-8?B?TG9OYWhtVzM3K2VIOHBLNW0yK1E4dGMrd2FzQ2crZ0F0WVduaUNaSHRSOEZS?=
 =?utf-8?Q?8c5CeYe2T/qZF3SasW/OAI3vADRq0kn9ddWlPohxg+XVP?=
X-MS-Exchange-AntiSpam-MessageData-1: UPkDIu2rFcj0MQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e4b45a-ee26-44ad-dacf-08de874ee48d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:36:44.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSW9lbCah2z+2X8zIx6whVlSzqab2FTu3Ixkkp9meMwZZo/nLKiiypoKKUvg8W14BBpIDy2//HyuzeB0MmqnBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133

Replace the nova-core local `DmaObject` with a `Coherent` that can
fulfill the same role.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6536d0035cb1..ba971a114a06 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -7,6 +7,7 @@
 
 use kernel::{
     device,
+    dma::Coherent,
     fmt,
     prelude::*,
     ptr::{
@@ -18,7 +19,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     driver::Bar0,
     firmware::gsp::GspFirmware,
     gpu::Chipset,
@@ -52,7 +52,7 @@ pub(crate) struct SysmemFlush {
     chipset: Chipset,
     device: ARef<device::Device>,
     /// Keep the page alive as long as we need it.
-    page: DmaObject,
+    page: Coherent<[u8]>,
 }
 
 impl SysmemFlush {
@@ -62,7 +62,7 @@ pub(crate) fn register(
         bar: &Bar0,
         chipset: Chipset,
     ) -> Result<Self> {
-        let page = DmaObject::new(dev, kernel::page::PAGE_SIZE)?;
+        let page = Coherent::zeroed_slice(dev, kernel::page::PAGE_SIZE, GFP_KERNEL)?;
 
         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.dma_handle())?;
 

-- 
2.53.0

