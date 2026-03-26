Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DAA4035C6
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538571; cv=fail; b=aM4zSlHZXa474r4WJq1Dre7Yns0i32r/1p3+AGvq8PcqAydfDbccey2lsvCB7kAjWJiX4EVNHBLvsesZS63FtyZE+5EIIzu4Mtn7T08Dt/uERbk0GWqpHiHdoz9Fg0a9X1Nx4cU/z8mvvVDuuorXejLk0nJAO1KeRVbRxztit2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538571; c=relaxed/simple;
	bh=Um6upCuw8NnFoleA6CZYSw9ui6ykpcIDxj4Ua76nuZY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EoIIJ4ZwJxItSOa2bXChEEKQzhfClQ8YXp4NxH7fHwMfXlRhgl23TS4Ik7cce60O+UsinNPqPAN/URYsVxZCS4nLoA7JN0I8M3FsYvcCo24FCg0Bd0zC+/7dgp1n5UXjTVMAnVG7F1/DqLUvpJETnfb/2+NPT5NaTvDPyIUTVnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gimcCKsD; arc=fail smtp.client-ip=52.101.85.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gimcCKsD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjzOfF8Th0ZVAWRSClVSkJDT+/nQieMe4E5MRqrJwmDQTyIY+DFkfq2JkqDMBkecSaaCiaTJPuu6lyvMRXZcNsVQHbhrvIDaZXuYFnINVtKv2Jz0M6JIwQFXsUPE75Y1blhT6prVLHitRRMGxE23+QcUhuhxlMDN2drOSwRvijwoAkrjfLpTxGbnBlYDB1clDstwmXkh80qCQtee8eGxA3IHduZmT2oPvXPQrorLBqD5XELhEubH5Np3MEBmNSGOquXZw+lsbCwVzad+GZRMLbJXVkfLKR3KvYxTf+u1HtwVPDzAddrwVFaBnVH/kIFvq7srgnYR6bj0BHPrUnmp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NX7GNH24NfNzWEucDo0mCUY9YlZ2NmVgYTKii4jCzbw=;
 b=LP5R/Ca/sBvpA08q0kU2Wr9fUdUEXBeHLIpzHuO6NiX58lwc+TBVaJlAbv8muIPrQ3VHKmtR5NvouUpRp5/GzRFkCaz05DU8id8YewLUleXSywbL+S3FBQKEwNvpuchgfEtzwD5JFIk1M16qYvcqvHv6b67YeRR56+uIRxH/pe+3aU+IeuVyq9gQq2LoAlvkgl0lBC2z13E/r7VrcqDHQsJnLrFR4O6bXJasuTFoP07kdDdK3svEPHmHzH2dZPZ93OSwsTGabLt0K3MyIPZ4eVaT4f8Z0yANVNVGZLiV+g5ztSpLuYn63xARTYPjBewioJusGSqQTWzcxxp0BHomHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NX7GNH24NfNzWEucDo0mCUY9YlZ2NmVgYTKii4jCzbw=;
 b=gimcCKsDLNzm5l16EN1+KCnir1WhvBwV4s0wzXKLtf1EqcvglmKs7ZNSJGqTdR5B3a/T1XwRSOiUR/BxN7JUci3SZvto0y/90DHh/2pf7SU2saSNZYt1KTCm9ILOMaIRi7nPe8ZKlmceD5UhpdcojQWupJ31+yq4HZUAHs++npcWmPZNwldcnEpjYSef4Y9E9SE4WViihXK9m69blNtMrbK6iCeO1luVqhxjT1TpxuvWzh3++TxmCe6N8mGrCpZviGMpPsPxydjmy7BCLAqqKbkByKjmOobu+mjn182P+Hh2Lu9tjC08Ux+qzkS/sDyiE2vxgM/eIKH0gvS1CkRRsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 15:22:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 15:22:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 27 Mar 2026 00:22:12 +0900
Subject: [PATCH v2 6/7] gpu: nova-core: firmware: gsp: use dma::Coherent
 for signatures
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-nova-dma-removal-v2-6-616e1d0b5cb3@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b20f81d-8fe3-419a-4240-08de8b4b844a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1jNFmmvSHH+fln4UwvK1/oxD2U+ItTeGQ2i0LWsDjcD/pxqITeFGWuX4R+Q4zjfEKHLZzmBOJX86gOMip1dWRZEH1Pgs+woQWomfr+ie1Ojrwk2VmUyjCOSelbGlR5ZHFJbfoFqpw+2JFWqkZGXbREvDOkgbqpuA/bw/upFxOIdCNJ8sAjgy5AIb65jum2t5N9c/cvNXUPjWzTiuBNEyAw/g4yqbX0ko75HT/WYf31s56lxVwtO03G1I8GNLe9oIDwEieC4HPY9/h6t5P5VQKMW4+/WMuXLIu9V6ujm0nRd9Bc/BOYtAhP9tcNmB11fuMMbpfk0jg0xRU/kiuLMdfriBoeRW6YsQe0Ig3DweVI1dvub9IjkqpCedB2VP9zdVpuyYvCmQXzcuH8Y4I0K9tVF4RVSdybiG7VoJjV8mdvBajgQ57i75unfupKcGD5oktFOlBKhKbcOuVY37a3nsOjJ3yRRgeo5A4N/pzYVrt60RQiLWAccyf2OHeNZMmfP0b0+3TXBLwO44wI1+BOJjn9bbxnBTTavURPiVLymBm3gMjD+HpBE8bXtZR+c152c9xfjMIfLMf97kQwaMTdJiEJ94XeXfZYHFUPfdWMV870wjfZc5rOFWfmeQ/qRmzYGXP3VN4nx6bZ2Zeq5PuOY1UK9aXgepRomuzix0INbzeo4bpjQbrTJU63oB8GdxC43pVnjngYpDjBU4DdpXQOPBan5ILflKWgqIQ7rUXo+0dmECZM2/20WZqGvGXApLy06RIrqq6oBRR54y4fwPHJCOOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUQ4UWw1M3BpUUQ0Rkdkb3Rhd3hZMkthbnNxQTVYMkorWFZ0TTlGVThMZEVt?=
 =?utf-8?B?RnJoWVZQZTJ4cFdrTStCWUFyN1kxL2t5aEc2R0YveURBMThUV21MRHZ4QTh3?=
 =?utf-8?B?anFVaklmazg0MHU3VDJBOHR1MDNlVUFxWE8xb2hsZ1FRNmxaME5KQkQvSmRi?=
 =?utf-8?B?WmtXZ210QnoyNmt6dk1IeHY1S2k4TE1jQ0YxKzdGcXNvdTdjNFRmc01xb3BD?=
 =?utf-8?B?RDdtY2RQaC9EV09PRnhLekFVUHNkYUd6K01WaHNhazU4M2pjVGRtTENQb0VP?=
 =?utf-8?B?ZVhCa09BblRhREExUmFrbjNiRnBLVFpXd252WjZIcm5SUUJIcWpsckdNSnJp?=
 =?utf-8?B?Z3RqdEZZT1k0UTFybGd3QWtWNWZRUDF5VUhYNG0yNHB4czlzeVh5MGtURndD?=
 =?utf-8?B?d2EwUjZNWFpSa2RodXFvN2s2b090cmVud3NvQ3hlNGY0TGtsa2hkSEtqNmZs?=
 =?utf-8?B?WVJVZ2VIWnp2RHB4STJDdXQ5dXFNK2p3MzQwNWRFR0pZZUZTMjQvSWFneklq?=
 =?utf-8?B?Y09PSGxoRkROSFBQR3ZUejFQMmVuMWZ2c1pQM3lXSXlrdjM4SnhQcjNMNExG?=
 =?utf-8?B?YThQV0ZYeE5FSFUxSmRUUjhwbDgrZ0hiaFRrcVMrTEpyMDY2aTJSUDNJcFFO?=
 =?utf-8?B?SjJkM0FSOUE2aHNrb3EyZHlpeE5pN0NHOXJ4eGRBWnpZN01qTDIvTlQ1Z2xx?=
 =?utf-8?B?SGZMam0rMlZvMThMSDgwcTdEVmFsRSsvckZnQnA0TFRoWk1PdmxwdVFiQXl3?=
 =?utf-8?B?clh6eFc5R2kyeFZjQ0ZabG95c1c2WGpaR2pPWTJYMGs3Rnh2eXA5ZWV4OE1Z?=
 =?utf-8?B?R1JLWnJsTEhpMjNvOWFpUktVdjI2aThHOXU3MVJsY2lBT0ZvclhEZGh1SlJV?=
 =?utf-8?B?ZEx5aE93RHErK1lHVWFkd3JORUFXT3JmYUJUOWVWZ1RQNG5lTkRQbXVIYXgz?=
 =?utf-8?B?Z21wRThaMzI0U3pteEEwcmw5NERKNS9kVFNjVytLVGgzWXRlSzZ4UG0rZEhN?=
 =?utf-8?B?MVFoQXRQY0oyT09nOTdzdnZKcGl3Zk45cHczamx5SnV1N01LM0NIZ1dqVExl?=
 =?utf-8?B?T1IvR0hnT2VhblREYVFFQ3k4Q0g5bEhpRENpODdKVlJuNEdBSFdDcnBTN1Fs?=
 =?utf-8?B?eDBDdm1LNmNpaUw1aTZqc21JRDh5SnRYcHpQN1JoaDVYd0NzampqRWx1OEpx?=
 =?utf-8?B?SDMzSU5CT056cHdMRkl5MG0wL0wyMWRKdWJxYXVHeXRieFh1TkY4M0NtZXFS?=
 =?utf-8?B?TUNTV3BndEQ5RitZaWwvSTd2WFliQlhldEg5UERRWHpJNkVYaUtrUkUrTFV1?=
 =?utf-8?B?emZnTkcraUl3YUdlNkU2QTdTVmRsY1BKc2hHbW5ScEdYOERBZzdFWnlPWi90?=
 =?utf-8?B?a3ZvMktMLzUxU1QxTUtFdXhIbVNMVkFMbWRpMVRmb2crZ0VtQ1NuMGJIM3FH?=
 =?utf-8?B?ZU5ndTk5VHYyTFBPMEZRbk10Zmt5NmtINWszTVRRcTJkOG4yOWdod3JYSy9B?=
 =?utf-8?B?L0YvblYyOXpvOGhycm1ORkZ0TlpXOEdTZnRHb2V2RHh1ejhNVG85dVRJNDYw?=
 =?utf-8?B?akRqRXNER3h6azdEN2Y4U29ZeTJhNVUyNXV1RjM3V3VTL3NDd0NaRHNZTG1D?=
 =?utf-8?B?YVZHR29wV3o5RkEvT3NxeTVmbkdHY3R2TnU2OWx4aHBkVE5UeS8ybG10eFRU?=
 =?utf-8?B?elg2aFN0NnQwQlEweU5waDFMRitLUmE1NHhCRG0vdjhVRVp6dk03TUlhRERT?=
 =?utf-8?B?ZGhYN2NLR1Q1TCtBbUowcnVJby85bUtPUEVGVGoreTNsTmxhTlRjTWZXazAw?=
 =?utf-8?B?WmR2a0RlUmU2ZUdvd0dvaDJBVndNdDVlSmxvQWJTRnlobjhJUGpURHExNEt3?=
 =?utf-8?B?dnErcnNOUzMweUxrTDY0M2ttWnpEOVNrZTZKUnltTGx6Z2FtODBoTEtRWVZD?=
 =?utf-8?B?dlBIWGU0aE41MlFUVGM2OEhmRzZRZ1JxUmMxNlFHZENNVmhwWXdRcmlLSnEv?=
 =?utf-8?B?cFRnS2NOLzdPWXdVci9hcUxGVVdPTHpKR1RnaHRiMGt3Y2xFcVlYUlFPdWRw?=
 =?utf-8?B?WERtbGNSdjNSam5oeitWSWhHSkVqOEtQa2pUbmVjelpWWnlBbjZ6SjRKVloz?=
 =?utf-8?B?RGlmY0tlS29Db0F4MVFZcEF0TXNjNEpYaHNYMnBIMENValNyeG02LzNVaUQ3?=
 =?utf-8?B?NEpIbzdudmZFaTNnNGFlUk9CdWpUVklaUE5pU1JsODhDdm9nZi9zUVp0bitu?=
 =?utf-8?B?c0JJdWI2M25HN1VERUtKY1VTcWRiTnl5dHlUd0lrcitBY1VDZ0NvcGhIUHRn?=
 =?utf-8?B?cXRrZHR2NTlFZDFDdHhOZWprenpsY2srSjRhTDNoQnJ5MnBEZmdsUzRNT2FE?=
 =?utf-8?Q?Hm8YaSpWFSWAwR0gGzSOj36nlpYAD8izjg+ExqMl8OcDq?=
X-MS-Exchange-AntiSpam-MessageData-1: 86SqsxAUeviSPw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b20f81d-8fe3-419a-4240-08de8b4b844a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:22:39.3119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4p45itTUrJavr8Ugbfyjv5BdCG9h+SomQH0qYDlkLIBpwaFfsrTeJ9EAfYqAbXpy4iFIKe2sYqCiMtFx+/k5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

Replace the nova-core local `DmaObject` with a `Coherent` that can
fulfill the same role.

Reviewed-by: Gary Guo <gary@garyguo.net>
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

