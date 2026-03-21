Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013049.outbound.protection.outlook.com [40.107.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDA638BF85
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100204; cv=fail; b=oh0X/xUxaKdkZirf9bB/xU0Or6hc1IeCcJkE3sana1wQRuyIyvUkmBDLbQ+Nk8fXD+hOPfMxIjpbgsy+91h6FDF6TJj7i/lfKLG0/ZrUVMh00x0p/RpHXhDP0LzQopHj2BfzaPCyEvMlK7wLqFPRdsQFKAExzD3Fo2thi/b/kbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100204; c=relaxed/simple;
	bh=EHE21pbJuOETaF7Vz7mo6vezQ1zFtOLS1SmcwfKqbrM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rIqbpRFrkGsZ9kk0k+kR2Xkfw07ufb2m+9pDFgIgrwl4ioy5Rr/UEVKPUB9QmrAnC7U2DsFJXbbFvcJgKmfJTxuAUbg52wtEUnMkzwalkJ0x4VKmwkkq1XywP+K8Tx3oBihAVneZsRXigOqu+8S/SwO0y3lZyAGMbyukjIPKfoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iHqW6wkz; arc=fail smtp.client-ip=40.107.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iHqW6wkz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZM2TZVtIHNthczTJVBAqJ4NI0yqSQz6tlldfsqk8bJaBgsJ/Ii1+VRxrQfpX/g8t0aE5jVSTzBDPLYZ+Wk6BTUxKcYLMoq/iuRA91rfkTWWW5ajkiRjCX67Joi5oqpYickIliAZH7AT2lRJZDpOe7VtKG82IZ8XYJneZvtyGK6nnSzUnEjU88mguR6fHC1FMjCyjWeU86plE5oDQpgOs5t3igbtxOdwme6wtefqQMhjngmf6asPt74tp7HT7WtgUE5DmkBeE8vu2HNnX2WgqUlNQcoIwnLHgmOS+8g9Pa2+t6pT2f4856F6jSUM04K9R+lz7IY3eIDxEthRqAJqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmyrJzR402fGayqLJMsuOLSMaVswlwHp4VsC2piXjLA=;
 b=aSuKVR989o47pzxU9nKOHm9xjuUe+omliituZGIBtZfQa2Au2AomuIABO6+jubemCvrHegbPoxwpO6JIzcYNpfyhQOdPehC5XCc4mz26lcAX84VN6x4k14Wk0VXoYdhm5WUnW1aC7HYGUVJfcr5U8W1Dj8TUIZzTIB79oiFegXkSL7tNOV8QYqzWNAw3YzDSBXBqs+Liskm9fn4KL6ZZVOLm2OhYpTIBT2O6X01DigX0a1kz2/cCZhnD7/IUDuspm3gnCcMz43X8JPIgA5jE1Leor7o3CORM8ZRD6QVV5cTKu5JaV0iGN0wNxKM1jHom2ZlN2J315IP70BjqPCeD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmyrJzR402fGayqLJMsuOLSMaVswlwHp4VsC2piXjLA=;
 b=iHqW6wkzUV4oTmiByYrdX/tSKrf4x9KlLvkTsbG18zH7nMYDuOuDG9PWSeOt3FEtUMO85I3c4Pgif0cXzt6rhJEGdVJxKmkyBXQvTjgSvjY+rcTvXJTFPSIhNoduS4Tm2GGtvo8gNeAQ0bD4M0wAt3tljpNKpRwczy3lkJagIv9LI24Enbt/U1JcPxzH9ssovUs0hMgOikw8ajePq/4MFd20MrRUA3foOgbAycOOMBparjvMRnrBXwVFD9vP/dcjYYJ6AYFd24PiDUpo4gk+paL6LVW0n1pPhULWVVJuo5pSmFRbMjyRMuV4p0YwStxAoIrIG5OTp9V+iYOyfDa5Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 13:36:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:36:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 21 Mar 2026 22:36:21 +0900
Subject: [PATCH 3/7] gpu: nova-core: firmware: fwsec: use dma::Coherent
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-b4-nova-dma-removal-v1-3-5cf18a75ff64@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0132.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ccae369-f506-4c7c-9713-08de874ee010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	6d3fX5XYlbhwY4uRR1OlkOR6jAvDaoLofELLRUXGLrD5g84GYBldGJgKsXJi//MQVUwAVehZSn1g81gzEzqNwTswye+XTx+yxrXl/RCcJGc1vTeQbBE2BYme9QCYmdt9Xt9J7tQK8GG685aYAyI3dSVVigakT5qwnWIHwIgCxgoDW1HT41QuzDcXgVefQLd2wBeGQ7/XE/JNVd3/wGJpN/dYXSkws0SqKCZ+Z56v92Fxg6X/nwQwcRucVcI0NzsQ1/yz48ddEiEuXCiWgwTE/K1Mu+ZR7A2t5KcJ617g6pfWiFlIHs1OLpXY6a2b1ekmhorHAEZZBRR3rjQmz7JVlpHynUTpThy+orVIzPYPxFE1uiCdZYobVXZQr/XHRk0QR2ZOCs7iixkid2twYFFQNRtbT6PE61dEITteGrvCxnf78ZELeOzehqJeH1PdUqZAkFi17UKfuGbcOcMeKFfvIY6ZgsxpIJy5rjO9dIbwoATREamY6S+bsI388BvwOMzmQk70h8EcsJl1zC4sIdBiwQSTXvgoxTDSYppMgLweUvrs4XVxMtWgJr3SUs3G4txeEsRAi/HBGHEdHyhNCbnlg1WmQmTB6Foo3exxsmPe1UAUTc1zt7uu/p/3tjrIq3DxPMN1kxbAWdLluUtoetAiBuAWCwIfWe+DkPDJbrLb8dfWXD5HuOA7mfoRQrSpajiefohY76tsL/xCLltdeszMQdtEzeljz/su8GvUwirujzJnBNgiAR7LXyiFTPBf2vLgTqgohepPlrxY8fclC1/IHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ynh3c1ZRYmdTbmFkOVJBK1U2M29zaTF0YXNSeWtGS0ZaSXhaL1FmQmxzNUFU?=
 =?utf-8?B?bzBmUVNUN1dxU3N6czZ5SGN5SXNkQm5pblZqSyszQkV1Y04zcnVGUFdSK0cy?=
 =?utf-8?B?MGxrTXBQaldBSFF3VFhqS0RjamRiRVlWZmFBRFRBTE82elVJNCtBSm44ajFL?=
 =?utf-8?B?aFNveU13Z1MvSHQ3ZW5CMlp6WFA3UGZPOTl5Z2VhSThGNlFwemt6MkZXUzBt?=
 =?utf-8?B?YmZ2OE93U3hoZ25MbFJLUmt3dE5vTkpiNTlTUTJkTUMrd1BOMVZSRDZqaXc1?=
 =?utf-8?B?T0FKZW4wVnc4K1YyRmdZeDBmRTZPanp2c1AzbFlxWVZ0eFlyQit3bGNwZUhM?=
 =?utf-8?B?YXpzdDczMGRsczhhUno1LytMdVduekV6RW14V0RhTUpWOWhSRFNBWEpQVU9G?=
 =?utf-8?B?L2p0bzJuZm5XZWkxd1JuZFIxTW81bzJwenJvQVI0ODhzeVVsZ3FWTGdkYkdG?=
 =?utf-8?B?T2hoanZNT2QxUzhQd0Q3UTZFc2hrMDVVc01oM2g2VjBPb0xYTk5rbURieTBW?=
 =?utf-8?B?T0lhczhua0VuZEZqVnlCZ3F0WGZScnFIL3g2V3FzK3FOTUZDR3N5OWxGNXJZ?=
 =?utf-8?B?VGtlZFBpTDdRWTBxRks5TUR0UHRvU3RNRXAvdGtSK0hyUUdabUFKQWpaYWFK?=
 =?utf-8?B?RGVYSHpSZ3R1c1RsS3M0NFlDZm1USVVTaTU1ZGN1TTQ5QUVyQ1BKNWNFcjJp?=
 =?utf-8?B?Ry91UFY4THFmWDRzOGJhb3dmbXdsS3kvbnFxZlI0MHB2M3pUMkdBMThLN2JI?=
 =?utf-8?B?eW1QT3d5SDh0eFpqTlF3WEkyLzdhQSt5WVpvbUloNG03R0lEa0xsS2NFS0tY?=
 =?utf-8?B?Z1lDL0RiLzFPenhXVzlhZGh0SWJrUUNJRUh5Q2kyMWFJVSs5YVlBeTZTalJ6?=
 =?utf-8?B?eTBVQjcyQUhtVGdYN0NWc0ZGTGptekdseDVNMmcvbm5HOTEwaTdQbHc3MS9G?=
 =?utf-8?B?cG13WGVES0JMem1MZkVUWXRTV3VWM2I1Zk9ZTmd0VGU0YmFoSEU0QXVBSzly?=
 =?utf-8?B?UGlpSngveVkvVkphQk42bkxnd2NDMzgyalI5aFkxVGpSOGtCa0t4dWFzb2Rl?=
 =?utf-8?B?eWVQcmkvRDM4b3U4eXdXTnMyVmt0dk1wQTRmSlRnNVBhZHRCZkgwbXFKNURE?=
 =?utf-8?B?UUNxVzd5R2graThLeWVIOUFPVS83dzlmMmNrOEQ1eE9QVm1uODBpZUhUb2RJ?=
 =?utf-8?B?dlozb0NFQXYxR0RoOVhHRkhpeUpkVUYzMGhobkpiS0hFSjF6SnJCODJTbzk1?=
 =?utf-8?B?a1hGM0xmSUgwQ0hiYkUwNXV1MlFiL0xoZHJXTldSWGV3eU9oR0xGM1pxcVNo?=
 =?utf-8?B?KzRsbzBWOTFsOWFQZDh2TE0zaGxiajJGUXIvNkpDOTZQK1E0cGxqdVRaWnhi?=
 =?utf-8?B?YkoyWXplazErZW40WGU0WUhEWjYrTFhLaG9taEd3TW84QVJjejFFdmZxOTBk?=
 =?utf-8?B?THpSbDhsdnROWXk2aGVZVDJCYkZRQUhoblVRbHlCa1hCcWtFT1BpUGtja3Zo?=
 =?utf-8?B?eVNXRGtzVU5JazlaZXpvSWkzVUFaU2ZjbnFnNDBvUEhoWGp5TnlIanlwU2M2?=
 =?utf-8?B?eFJ2TjdoQWJTMzFoN1ZsUTBnVlMxdS95M2c1dWFtanhBZHhkN1NUVUZKM2ph?=
 =?utf-8?B?RklScWNrUHpseTU5c2FyTVY5SG0ycElFQy96clVyMCtSckhTVmJHemw0VG1Y?=
 =?utf-8?B?VEJDY3I3T3JPN01CQzMvYTN0b2Q1SEVRdThkMjZLMkFxN2NEb2x6eStnVWUx?=
 =?utf-8?B?b1IrV3Z3ajNSem94dWo0RkhuR1hjb2J5bU4zUjJyUzA2TXkwRnpDUEc3MGVX?=
 =?utf-8?B?aW55SVZnb0J1UG1Jb3FGdEV6LzV5KzBDYjc1N21YdWp6a2MzRmloQnc0SW5a?=
 =?utf-8?B?UHYrZk44MUR1UlZhTW9USGV0djNhSnFGVnVFZzJ5WllzT1RSQnczSERURGZC?=
 =?utf-8?B?M3VqWjlOY3FseXBDdFVZZ3FDeFRXWFVjOHlIeGFGOVlPelZlSmJuZHhVVE1V?=
 =?utf-8?B?andEYTkrdXIvbFpVYXUyZFpQdktiQ3pmQ1QwM05FMTU2ODgrOXpCb3VtMXlx?=
 =?utf-8?B?UDNXWVh0T0hmMGIyWHRFY0RsVk1pZDRBdm1tV0xLVjNaQ1lWL05lTnNYK3JR?=
 =?utf-8?B?MmhEWlNtSVYwdXAvalFaSzlJN01GYnBFelQ3QUI0bFpQNnFia1Nla0crNGVi?=
 =?utf-8?B?bVU1YUl4QW8ybCt5eEhrRW9xTzBoYVpWcGZPaXZIZ1M3aksvRSszcXhUbC9Y?=
 =?utf-8?B?WTZSeGFNRzdOWVZoVDc5eWVsbVgza2ZkMWJjdEtuM2pKc3BBN0ZlS0FhTlZk?=
 =?utf-8?B?OW9yc0JpZW5aZE13YlZIQzNqZ2wwdEVZM0lkK2w0RUVYZGVTZ2daQ2VmZEZP?=
 =?utf-8?Q?LFxbPuNN59zbypgjV+Jj0gJ1Mp51R/DBd9omZ41ZJwWHA?=
X-MS-Exchange-AntiSpam-MessageData-1: N+YJbm8ooF6JBQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccae369-f506-4c7c-9713-08de874ee010
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:36:37.0836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xExSBkmabZrrLh1KtRKWz69ASwOOgx8u1nnhW/WJvloZMq5lhViKgTsZ319EsIpkcsGu0tdrEfXAsJ+/RtCOyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133

Replace the nova-core local `DmaObject` with a `Coherent` that can
fulfill the same role.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 342dba59b2f9..7c6bb0a871c1 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -12,6 +12,7 @@
         self,
         Device, //
     },
+    dma::Coherent,
     prelude::*,
     ptr::{
         Alignable,
@@ -25,7 +26,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     driver::Bar0,
     falcon::{
         self,
@@ -126,7 +126,7 @@ unsafe impl AsBytes for BootloaderDmemDescV2 {}
 /// operation.
 pub(crate) struct FwsecFirmwareWithBl {
     /// DMA object the bootloader will copy the firmware from.
-    _firmware_dma: DmaObject,
+    _firmware_dma: Coherent<[u8]>,
     /// Code of the bootloader to be loaded into non-secure IMEM.
     ucode: KVec<u8>,
     /// Descriptor to be loaded into DMEM for the bootloader to read.
@@ -208,7 +208,7 @@ pub(crate) fn new(
 
             (
                 align_padding,
-                DmaObject::from_data(dev, firmware_obj.as_slice())?,
+                Coherent::from_slice(dev, firmware_obj.as_slice(), GFP_KERNEL)?,
             )
         };
 

-- 
2.53.0

