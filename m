Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010013.outbound.protection.outlook.com [40.93.198.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D78440DFCE
	for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 14:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774191188; cv=fail; b=dnLu52m7+bEHaWdqYlBI/8eFi3Jeb+vtZwHaz3Mun0/klNSnx6DASFxJ8lM8ndD6EXMR5T+Q8y+Hdx7oNTQODv6kEtXZW2WjsyzwkO+FKkU6Zgwx8Wmzhx9s22Y77NV8gUHCMH8lWqCGtAYzoLxr2o/nOndmx7IGTPXY7tbUr4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774191188; c=relaxed/simple;
	bh=VjRMjuddJEL0l45sgGgM0HXsAfL7W5SnK4P3odp9q3w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GPMYJR/KQe8gPxR9/j6acV+itCEDsNpMJX7lS9rokZiVM0jQJSLFoPAApc44hLkURFNbTQXwTPDbG6owIFk8Z8fwkYAN0WGaaz41mAadkVtkyuSeQf7EddeZDMlSkJ55x6pwAzicTJ/D54qYd2+W+RkcYcpDS32r2WIheqb2j7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q7HKcm51; arc=fail smtp.client-ip=40.93.198.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q7HKcm51"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmCtwzTLnqYMa2KtfVKHuO4hUvYU+PqPf5Dl9MFm/KBXQWxqVatZO1l9s5mxs+adChLXGwfusydDsqkzPTIBEm6HEEzCuAtZJKJE55FhyQ3xbw8UdjfHNUMI+zUb4e7dbAI9e77Ui55kSlIv8Y9pzV7GQzwazM9WUlhgwbPbVIXFmoWAcWkt44vNowpTihFYekbQaA4VAgjKzKANBBhvoZ7Ak1MTcY+wpEGLR9qfwyYsLExmDSxYOcc1+NJ1ojEStgHdo+uQJ/K4ecARVpymKhg25SJ6SpaT/xu3P9yDWKcji/rCAaMs2TJ6JcH6OGP0WIuKiZsF4II4z8apy9dkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqggL2/2guI/NzZ5/r+CMJ8rLYq0iwfVsyzmjOaAMYw=;
 b=mHKSn5cRQjnhRlDmYfKMNKrgozWbiOX+cbSkzUbeRHOr690s0tm+NNB5kfDVVHsGakCa8q/X1S+ulouxUbJPlipRar94H7CpZImsntOviImKlnQxk6BgjuhpA8wjOxKAu184CE1m8ClRKVFM3190iPNw+fAMxHPX9mKIgCjNp1hOql1Z6RbSyCRNwDHi5BbJbP1CMYwwWKa1JBNkcHsQRgLid3c2PiEjx6D1zTyoBBu2iSKEDgFCo2Bg8Jaf/Q01TM/hbCg9VGsmKGPhHqbu4h3yxrWyUA0f23O/e0KWZm7PB8C+9sr7CqDKTj+jt4cniVn4merIkNk2cAIVGaArNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqggL2/2guI/NzZ5/r+CMJ8rLYq0iwfVsyzmjOaAMYw=;
 b=Q7HKcm51lG2tSkRJ6CltbkIh+Qq1VW7IihIsis/iMit0TBTHSLkHWDtPY0O6CLhOnRhddHb9yhTlFR4+eC/bUlS7fHtX6YXkHtz80lTTRbQ5B957JsOA7q1bp+rQ+T4RhwV4UiXIMAGugYxwN0KIrJXTv+n6ssw8S2sOYaHQE2BeQHjlf70VQpNtn25DrydXR8bQ8DhfuWVmdSo9+oxUP3PKV3WmOUZYJ06aH6IMEoI58NGSClZoJnhqsrUjLC+FLVnjiL88dn0sRDvgcgxKITj5p6I8uhxF853MM5L09PBFaQffdRxLsjkEzcgZv4O/m+m6eqRGWStx0J3hQtqGkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sun, 22 Mar
 2026 14:53:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sun, 22 Mar 2026
 14:53:04 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 23:52:55 +0900
Message-Id: <DH9EA6773QO6.W3EDFZPEL8K@nvidia.com>
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: dma: add CoherentHandle for DMA allocations
 without kernel mapping
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260321172749.592387-1-dakr@kernel.org>
 <20260321172749.592387-2-dakr@kernel.org>
In-Reply-To: <20260321172749.592387-2-dakr@kernel.org>
X-ClientProxiedBy: TYWP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4205:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a131285-a84a-45ec-8f77-08de8822b8d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	bpEVD/ij66/7AbWz8UzEFFYuvjdW42IJ+H96/+lo9LIssKWn8nNFlCzUGx0HejQhz8rYJHyF65sJlRk6hy/mT2IMleE2HQcK4LmMvYutUTNqXDp4diAXhrOYdXko3bmBYMghABJdoyaGzTY51Fs8hrcHh383RqQIblcaQ3Hy+aYiLDdj9QAKVJS2wOQsK17JPFeBBAM5vo9QAtdcQzE3b9dk5d3T9BKa0HWuB4n2RrMh5udfke8F4uvNRvg6j0RVi+9OUjbbFTzBOCEGEv4bAn876C+59g6XaF4Q57o8YGhQ5+D8kXd7wxXbQTlUP7YmC7qWVBwuij+EpLyI9j6VAebpmrSSNxFENG8L8vT5lVmDC54Su3OYQjuWuXlpZt1SUrVafVkVSIT5gp8zoJwJO5UfsBAtditg8g46oj8q6m2IaMmTBraPxTfwpntxgEAL4+awFSG7ednpPBF6J5zHwSR0bQZp2mzufDdFH93orVDgdw4cDMI7K9bMVGC+IWUBGbSmpxWBZPFW2Os0SVnrXIf2jTkdNbSgDMVTvgBPUB6cZKpukRAwNMYUMW9nw1cs8VBiOkmEkcnVYCNkAh38m/WwDx8SQco7rpxqyGTdYu+kSocEBvwTmMIo0MjKTIwmprIFMuwKj77tD10MxiIiXzvFNHfZ8O3YjmCs+PmKpXMxKxliOmWVHjtLXq/QiQ9Es6rmFEDTbFTI+Q0jK5p62mMH0qYURtJHd/n1DNS6IlQlfVGrUDdkyGiplKo2MarY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akN5S3UwZ28vTDZ0dWVYTlczTlVkdWJqdGxWQ0dqTk1sUFNrRS8vY2o3VzFB?=
 =?utf-8?B?SGwyRUhHa1J3Z3NJci9aTDhyK1hON0ZrcS9ic05kVXY4VWp1UXlSdDdlY0Jv?=
 =?utf-8?B?UTJtMUw5ZmljRmpKK0V2Yk5xaEJEaWFaS0VkTENYclh6Rlc0dEExZFNxc0Q4?=
 =?utf-8?B?eHJkdHdKNkczS3VYSjFsYjF6dHE4TTZ3NDkrdGxGc0hnaTNUZDlNdGFURUJW?=
 =?utf-8?B?RkdEYjZPQ1kyNVU5aldhODBXcTVIQWR1ZmM3VXJYOVh6bVZDLzVybWFHSGdQ?=
 =?utf-8?B?OXRuMXhiSjV0ZXZOMU9uWWNudmtvTFY3UklJS2NMRGJmVWp1dE1NS0R6Wkha?=
 =?utf-8?B?RDU2TmJWK3hHaHY5dFQreEw4amdkSm9yTjdINmllczB3cWtBcUN3MFFTMTBJ?=
 =?utf-8?B?MityRVk3Q01TcVVxRWRLQ0I2QXlNcjhTODFzNmMxNmpxQmNhbFZrdmRBbmNC?=
 =?utf-8?B?ZlNXZTZ5empkdTZnYk5LVTgyTGpodEF6ekduZTNJaWRhcG9rRVNtRlQzYW1W?=
 =?utf-8?B?ek42dVg0SXB2TXZpQUwrWnJERmF0b3Y2NkZhT2c1MWdCa0NmTld3bWVzTnVM?=
 =?utf-8?B?cGw2YzVIb0xQOGJkUkNZdGZYZnJFQlA2ajRGNmgzZTJzWHhKN3BFWW1lRVhr?=
 =?utf-8?B?ME5vNEtoazM1UGJKaWFQZWxPYUJTRjc5ODNDbDd0Q0ZmN1dVL3BLNXBtZno4?=
 =?utf-8?B?ckVFZWJJZ3g0akZHQmJtYlVNUitmdm5HbTBTdlRwUy9OOERYWHMrVlFQRThw?=
 =?utf-8?B?Yjk2TC9sM2w4SGJ2NVNGNVM1K2FDVjJZc2RDNjdCcmVCTFdMMCt2K1FXK0J3?=
 =?utf-8?B?YWRPTlJYeFYwWEc5aVNMSDloZlMrODB1aHdWMkk1TkFUc0lWL3c2YzU4OHdM?=
 =?utf-8?B?aWtGdi9xUmxCbm95OEpJUEhGazZwbm1JUzV3KzYzWlpDK1p2TkZqYUJ3bTZn?=
 =?utf-8?B?Mm4zc1AwRlpMMURkZEV2ZjFMdHo0MGxEMzVvQ3J6STNtK05IMXZSem1aWkFu?=
 =?utf-8?B?bEE3WmovT1pzWVpaSW1SbXZCRzlvbW13RGhwLzVwM0xyM3YxNEJEZ1Y1WVJz?=
 =?utf-8?B?MEtVd1I3SzVZM2QyV3o5MFJCa1YzOEZ6QW0yNExVNkVpSXdMRm1DM0ozbFM5?=
 =?utf-8?B?T0pOYjVhQ2NETXpjZUdGcUVUMkNCMzFqUGpxM0Z2UWJaaTA5UGRTeVpKbldC?=
 =?utf-8?B?L2ZYdXRmbUw1UWhsaEpvdWNRajVsaE43MXBGVWNpS0tWUzZzWm8yUU53MGpl?=
 =?utf-8?B?akY0bkhKMzIvdTNpa0drSWZXdzhRUno5OUpUc1JSTGdVS2VkWDhJdnphZ2ZR?=
 =?utf-8?B?b2xzU0NQMi90R0dkS3EwWHljelRUb0hnd1hsTk1wQ0c4T0V4eS8wamxZa3ds?=
 =?utf-8?B?ZWhVVFpuNDZGdEt5NW5USE01MGVuWXljNUtjNE1WNkJwK3pkV05TMVc2YjB2?=
 =?utf-8?B?a0pkMU1pWmpweENqM0Z4aFhGdFoxQll4enVCSzU0VkV2U1E2TFp5cHczNHZ3?=
 =?utf-8?B?UWdRRmRrS2hSbjNYb3BxOVh1QlJGQm5CUWdYYnIyYXQ5UzZnZXBCSWJjWkJa?=
 =?utf-8?B?bmo4OGJ1czBxcjdQOE5zMW45cWJLMjBlaWdqbEUxTXdTVTRXM0JFRi9abmNM?=
 =?utf-8?B?T21DbzhPblBoNzJKVHFuREUyQWd3ZGlQZ1p5dG96ekdYMEFLRWs2MVExNmxp?=
 =?utf-8?B?MGJqc2NhSFMzZE1nRmxtMS8ycnAvZnE4azJzdURhOWdkazY0L3lFdU0weXdH?=
 =?utf-8?B?c2hoNFpFVFpLVlNiVm04MGYzd1dteGdJT2phc1k3dm0vK0xPbkEyeWdjTFQ3?=
 =?utf-8?B?cW5PZmpOL2hndFdML0lxK08xMEZ2YkhtQ3UyRlNiS0ErUWg1SkgyQlRxdkpD?=
 =?utf-8?B?bFJjZXhxYmo4anYrRGZFNzd5ZGQrbWdpMjNMQVRHWlpMQU50TGVXZWRzOVFD?=
 =?utf-8?B?bkZkcTl6dllob3h0ZHloUHhUcXZFaGVPbG01S2laZWRYTUs0aWw5YklOM3pn?=
 =?utf-8?B?VForWGhDRk9STk5KU2t0OVhiSzBhci93TmhNKzVhWkFRTnVCM0VJQU5HTTg4?=
 =?utf-8?B?ZmxzK00zNGw1NWN0MFRjRFFlQXlYWkRkWEpnUFNwaEh1QzhvUW41dWhoZWJE?=
 =?utf-8?B?eXNMc05mU2lFTnRYMnlCZzVhVm9yRTJUYS9kak1wWHVTOVZHRmh0cFROLzdC?=
 =?utf-8?B?amcyTFlxMG5WWmZ6UXF1d0xNaUtkMm5yVTNlYUtTR251UTZJT0kyWHZtWmo4?=
 =?utf-8?B?TUwvVmxSWkRwaDN3RUU4Ly9sSE1WWGs1dkJxT3JOeDk2QVk2YTRKM29ySUFQ?=
 =?utf-8?B?VVBTcUZ1dzBDTldlOVBPc0VnQkQ0dkZWdVoyOW92eXFUQk1vMnAzbkNrMlhJ?=
 =?utf-8?Q?uQrGNr1yPVMIwXY9dz1FbfhdAXdMVEA1qeI3orxg0nhPB?=
X-MS-Exchange-AntiSpam-MessageData-1: +LyEY0eQm3p0UQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a131285-a84a-45ec-8f77-08de8822b8d2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 14:53:04.5743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JzNN55LKOvwsbLpLa6YivlIyZOcHoAMo8I12ejItmA7QRuzKXuSozZJQhNoUJ79PtA+XE7TDsk7dEXLD9/2VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205

On Sun Mar 22, 2026 at 2:27 AM JST, Danilo Krummrich wrote:
> Add CoherentHandle, an opaque DMA allocation type for buffers that are
> only ever accessed by hardware. Unlike Coherent<T>, it does not provide
> CPU access to the allocated memory.
>
> CoherentHandle implicitly sets DMA_ATTR_NO_KERNEL_MAPPING and stores the
> value returned by dma_alloc_attrs() as an opaque handle
> (NonNull<c_void>) rather than a typed pointer, since with this flag the
> C API returns an opaque cookie (e.g. struct page *), not a CPU pointer
> to the allocated memory.
>
> Only the DMA bus address is exposed to drivers; the opaque handle is
> used solely to free the allocation on drop.
>
> This commit is for reference only; there is currently no in-tree user.

nova-core's sysmem flush memory page would be a prime candidate to use
this, I'll add this patch as a dependency to [1] and use it.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

(one question below)

[1] https://lore.kernel.org/all/20260321-b4-nova-dma-removal-v1-0-5cf18a75f=
f64@nvidia.com/

>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/dma.rs | 119 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 9e0c9ff91cba..fa30793c798d 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -1011,6 +1011,125 @@ fn drop(&mut self) {
>  // can be sent to another thread.
>  unsafe impl<T: KnownSize + Send + ?Sized> Send for Coherent<T> {}
> =20
> +/// An opaque DMA allocation without a kernel virtual mapping.
> +///
> +/// Unlike [`Coherent`], a `CoherentHandle` does not provide CPU access =
to the allocated memory.
> +/// The allocation is always performed with `DMA_ATTR_NO_KERNEL_MAPPING`=
, meaning no kernel
> +/// virtual mapping is created for the buffer. The value returned by the=
 C API as the CPU
> +/// address is an opaque handle used only to free the allocation.
> +///
> +/// This is useful for buffers that are only ever accessed by hardware.
> +///
> +/// # Invariants
> +///
> +/// - `cpu_handle` holds the opaque handle returned by `dma_alloc_attrs`=
 with
> +///   `DMA_ATTR_NO_KERNEL_MAPPING` set, and is only valid for passing ba=
ck to `dma_free_attrs`.
> +/// - `dma_handle` is the corresponding bus address for device DMA.
> +/// - `size` is the allocation size in bytes as passed to `dma_alloc_att=
rs`.
> +/// - `dma_attrs` contains the attributes used for the allocation, alway=
s including
> +///   `DMA_ATTR_NO_KERNEL_MAPPING`.

Quick question for my erudition: I understand all the invariants are
referred to by `drop`, but some of them (`size` notably) really read
more like doccomments. Do we need to be that exhaustive every time we
call a C API?
