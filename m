Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021103.outbound.protection.outlook.com [52.101.95.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F76A331A41
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 20:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774383033; cv=fail; b=NacGenoJDo0MUBKjRwOHMQt0PY9+XxVEs2k6kAN9UoZS+g3vA5YX2sociXFPxCIiBztxmSiWyVJa8m79mQYOi0DXNdBPLKnwD6K6Epe6XDzcSf+pGyxqpUZXmXpG/AbnExcLKOj7Qwf7F8Lhyqjs3zl7nuuk/CP93yNy3lgSF/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774383033; c=relaxed/simple;
	bh=MTfHzOFGjm7BZ5fBYB/TpU0FtizFv25Oqc4Qtn2AQdQ=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=fU+ATD9Vq0TRHD0hKY6NBCpLUZIVl4bossBA7DJvy2XnUpcQsfz0SnuVgACm3CgZTSD/6KDCJaYsnBl5Pj4+RAdH4Uk0Pwi7SHnnmNBWPwOoqDeGxvc2X606d/hTl1s3n4C6Z6X0xJR8Cj78TuEXcSjLUrcRTs0DonjStOQwWQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=S1OhcW7X; arc=fail smtp.client-ip=52.101.95.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="S1OhcW7X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCaLUVUzmMB9tc3MPWrJQTJQ3hx8v9b/aataeuxymbekBlUGYeBLWEAUswZeGTsKeaWAKWcFCyMAFgihrVQLqWBAXNvbLeR6xCiZBGugdMZtbpce0S0n22nsbREdx1DcXu+avUWDcI+YywM4pjxLSw8nh1/h2if8rpcvAdtyJ0ZcQHw1mPFXP/yC0ZMT2USP6YnRyfh+eJFVQOwBwf+zMUuNQW41V2emFy3XqbbDYBkcK9FPDJApGTkJSTCEn1OrHqoCOvrYjFj0veLlQht+neuOPeZKiT3xaWFr2GWh+/8FOEp5s4htW59R2oJLkc6bHkkEOPzRBFmIr0zU0us6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdUY/qNocmUCPrJ+6WZs/StVrEIE7Rq4BMhxgUyo8BI=;
 b=zJMwzZw4McFvFjnb2kdk1WknYM+nsOo6f0gJjQsDMe7rwgePlbD/TnlGuZeZNjGRDWqG4S3peVUbpriLvvkzaV+6tsLPxguMIjvKu4sTZ3z078nt3a224InpNOVbycYJ8igzh2Y3vEJKYSe8wF8lKV/MzWn0p56fC9ZAEOWPMqM0VKUBxnEzBRG9Ewxd80CqBKFAtBcrLZ6xLYN2xAZRtzN9VXw/NFFRWlQDOzjFq48tMH1l8P+cGqVTco5ymphdGEyxpBLnZKFEg08ABQMAcmK1hjMsPoI4fs1q5LrKGtKGPp7w4Oxo61IJE2K34OJsFf3J2O3trR/i+ZoeXkNy5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdUY/qNocmUCPrJ+6WZs/StVrEIE7Rq4BMhxgUyo8BI=;
 b=S1OhcW7Xk4N0wCTCqVDJ8gj5bYTqDS1mWyVk98e0wOexrYLnzOTbD6buK0a58T2CFHyZaYtTnl0Qwz4uGkxRRYZFR7jFbOXsr4wMVw9E38kpVzosNUsIECiNhhHKuwQbLjm0nbGLCPI4ebflqcJEusnF0ikL8QN48fgRsnEQssw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6186.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:27b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 20:10:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 20:10:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 20:10:27 +0000
Message-Id: <DHBAADML4BXP.131CD8C26BELH@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>
Cc: <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: dma: add CoherentHandle for DMA allocations
 without kernel mapping
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260321172749.592387-1-dakr@kernel.org>
 <20260321172749.592387-2-dakr@kernel.org>
In-Reply-To: <20260321172749.592387-2-dakr@kernel.org>
X-ClientProxiedBy: LO4P123CA0355.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6186:EE_
X-MS-Office365-Filtering-Correlation-Id: 670f5af5-324f-4cad-5301-08de89e1646c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|921020|18002099003|7053199007|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TqQ5ciGJcsIFWryVciRDPiWSmJ+YGG5qcgNk9SWBYWiwEev54gPIFZcZUffMCkj5hS372oMKuQQzYbhxe7JjzXxZoH1ePpLjozcLeINm0ngAKkKFINXreyV+qsTyyFhxqIN7w0STBeV2O5RkgaN4x0kj1J9DNr5pqVKJ6NeR8in6BTMJn7D9HA2ncYDRezyHnF//okzPIcu+Qc931g4MsaLYjYaW3z74PeP+SF9uhKljmn7nYM6hcG0T65WyUuTwrIwMCw+/olmbgkI5A/f42if53XbiQt1n+2ZbbZTzFnta8I047i1NQf9ahujGnanpNRCCG9Er4pi+lstSzDVKMp4os6E1eAWNMjWxXeiuTlC133yHaz2YhPoBXN+t0WlYlNtlQd3GjL8iqKlGjAoitVgphuBkflpttg4lxB/3ZxfHj91Bsgd9wQWnvYrzu4gSrfM8J6SBbRXQ7plP5GM008gZI/TPV7eEo5fqwi+RAM7/nlEzH5Q4faYK01Idcz7B02wicnOw6d3jGccW9TRJ+Df+TAP3G2cHmsmJAe0KkGaBqa20ezkG9qQUg4xoNm4L7BcjHRcO3wVqPdmOUVKQJpePB1Ip6eQ31BnnZy5uOCNS6kRQW3dfzZHwmMbkyBPtxqLIWalmBWYA/S9oLwAUj2Ev8Kx73Sqvj7sgzGfCVM4WW9tREql5xVDErpfVd5e/MlRRaz84QOUL9N96oqiCOclbhT7ah5BDrv5TKXs8cv9WHPeRJRvP9ipaU6/ofEkpJ92DjwXuQyHE8RvoNtgqOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(921020)(18002099003)(7053199007)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2NYVElOY09LV08vbUM2MzU0RWdFVEU3cGd3eUI5RUhRSWpybHg4Qlp6UEpN?=
 =?utf-8?B?RFQ0WkF0dFNKQWpzcXUrYVNvNmxXb1BoazNQd1YraFY0TmIvdllTSEhTNVNm?=
 =?utf-8?B?bXhUaTkwSE9kdnpuWFVONms2elc1V3oyNE0vY2UvYTVocU9YRnhKY1lnR3Fh?=
 =?utf-8?B?c09kZnFURzZqY1d5K2lDekZLQ0cyWEw5d3pIYWZmT05XVVFYeFYxaDlUK2dL?=
 =?utf-8?B?bFdYL2Jpcy83VFEzVTFSL2pDam5ZUWhoQWVpbExjQlZIcXVTczJvbHVTVUt1?=
 =?utf-8?B?cERWYmd0L01CWmp3RkwwZ2JKbmtVNGVSUDdDSmxqU0FKcEMxTXNUVDZ6c1Vw?=
 =?utf-8?B?TU1MT2FSaFUyem5HSlByRmd5WXl2ejFISmNDZ2xQY1lraVlPYTdoYW1jeWpL?=
 =?utf-8?B?RVQ2VUgxeWVveFp0ek81VGtyQXA4MG44VDNTSEgrZ3RnaEh5bVR5b3hveWVs?=
 =?utf-8?B?dWJvdk1pZHErK29haHA0bEV3cDh3anNPOG1CeWxGTXFqK0NMRHVPRVZkT21O?=
 =?utf-8?B?WVJQMm95MDVncWwrVSsxTzFrRG9oN0RTdkFUeDg0SlRpYnAzR1VxMFJES3c5?=
 =?utf-8?B?bDdkOUlEb0tWTEVCNzRJcFpWZVF3SlY2Z051T0RpRXZJc0U1Zks4Y2kxb1RK?=
 =?utf-8?B?Q29TaklkNU5Db0xyMGNjRnpteHRGWVR2bklYNHFSVVNlOEZERnlvMjU0NkJN?=
 =?utf-8?B?bHdDeVRta2xKM1ZmQzc3OVVUVERxV1cwUmgxbWpTREtPUmdhTmxxR1pHTFJt?=
 =?utf-8?B?dEtXZXlsM0VQQTZRbmIwM3J1Q1BGRzVuREp3RjYyTERxbTBaYTdMUFc2Slln?=
 =?utf-8?B?Y0NIL0NYbkQ5NXpybC90bysrbUhuU0JXaXdJZFo5VWgyN2F6elpuS0dyZjF1?=
 =?utf-8?B?ODhTMitiYUYrdmErcFlFVDdUbGtBaGUwcTU3NHp3RnI3cXBocFFWY2ZsYmV1?=
 =?utf-8?B?Zm9KS0F0VnB0Wi9CVmo2NVhMRjFhZThHdmRWMlkxSjJlQU92REN4blF1UlJV?=
 =?utf-8?B?OG8vaHBXNWRKNzRIMmdGOXQ0RVNWeFZNL1hqYVQwYy9UVGpDK1dyNmd2OThL?=
 =?utf-8?B?WDl3SGtudmVUWTdjZXFlUWV3OW0rdXhKdmdnL3VzaU53ZHFvZGhVWERqeFhh?=
 =?utf-8?B?N0VkTFVYVWFIRyt6aVh1VXdSM2VsbFR3QVV1dGZqMExaSUpLLzM2MVB1VStt?=
 =?utf-8?B?Q1lCZStZcDlwSm16NnU3VC9wNVpDTkdRR0hmTnZ4UmFMQTl6RWVrYW1reVNM?=
 =?utf-8?B?RldaMEhFRDlkYTlWaEdXTVJrb28wVkMxWkhBdURtL3E1SWdJeXZoa2hOMUg0?=
 =?utf-8?B?d21EelpuZzhzQWJHOUxsUXZlcGlob0lMT3Y5V1pFMjBYM0dUMjY3aDhyM3Rm?=
 =?utf-8?B?YVJVVlN2YitMcmJDREJkRHNPaW9GY1Byd3Y3SmdmVVgrWUpQbmVCL3NxdEFR?=
 =?utf-8?B?RlN2YURHMVBabnZpREd0N1VURHhJTlQ3clRyMEdqWTA1OVJJUzVoN2tWeHls?=
 =?utf-8?B?R014eXhXRHlPSEI3VzdhQmV0YlBqVXNKNGttT05YZjlsZ1RCYTU2clNMTTdR?=
 =?utf-8?B?Q1pUV2RLMEJBbXU3SGxIQnVSeXB4VVM5TDlSekwyYmZxNEs0SjN1OEVZbzU0?=
 =?utf-8?B?NDZKeU5pVXNnRjJCQXRVL3B2QkYvZmlYeit5RlVrOFBDN3NlUEtUMEZLM1Rv?=
 =?utf-8?B?M1dNVVR6N3ZwazNxZDZBblJQSWI2MlVQRE9lNTNKZWxGNXB1MC90UVByTHlS?=
 =?utf-8?B?MWNqN1VXbC96WE1YUUU4YWJLTk1kdzIxcHlrWjlyUHR4UTlNZEU1VGJLclAr?=
 =?utf-8?B?M1ZCeitXN2tNbGlVRis3aFFpY1h1N3Q1WlRwTnhVV2RxTUpHTlZ3ekczMkxE?=
 =?utf-8?B?MzczVkQxcC9PRlp6d2plY2QzOWpEVVhIazZhL25yT1pSWnhaUlhVUVlqYVcz?=
 =?utf-8?B?Uk85RUJxWG1QbDUwTGxkSXlKZ3pzSmNyM1AwNXRrZTk4ZHJmZnpmOXVpN09h?=
 =?utf-8?B?aHZ6c1l6UkNONXcrdzVzbVQweHpPNklySXUwQXlWUDVnbm5XUnhIVjFlYW5D?=
 =?utf-8?B?VXpGaC90ZU9iWEpjRGk2ZHVNU2VNRE92L1B1ZldLRCt2YTUwdkpCbVRyK01k?=
 =?utf-8?B?SStmQ0tIaXRnK090LzBzdUhiMEFwejdQZ0RwVVZBRURBaWROT3Z5S3VMNTVC?=
 =?utf-8?B?V0gzellHK3MxazY2dStmMnNURXBPQlV4c2JuN0d2T2pveFhEWlBGNXJJNXlh?=
 =?utf-8?B?NENvRWtJNm8rVHNKZjBDd2N6c1A5enJUWWF6REk1Q3VlNkh5OUx5WEQ3L3Y5?=
 =?utf-8?B?WU1yTWVQTjF0Z3JOYVVwZ1ZDRjBpTGFJVU1LZWlET1VqZVF6TWF3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 670f5af5-324f-4cad-5301-08de89e1646c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 20:10:27.9535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRUtMD73N9D5AJz0WS9kyl08dyQXpDjIEzJfuDdApwX1GIVYzB258zRMlSb9tVEh5wmLzCF15Je/UA59h05p0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6186

On Sat Mar 21, 2026 at 5:27 PM GMT, Danilo Krummrich wrote:
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

Thinking about this a bit more, instead of creating new separate types, we =
can
probably just have multiple flavour/kind of `Coherent`, and we default to t=
he
most common one.

Something like

pub struct Normal;
pub struct NoMapping;

struct Coherent<T: KnonwSize + ?Sized, Kind =3D Normal> {
    ...
}

Where for the common functions, they're implemented on `Coherent<T, Kind>` =
while
the ones that require CPU mapping have `impl Coherent<T>`.

The benefit is that there's no code duplication. Also, you could also imple=
ment
`Io` but leave out all `IoCapable` impls, so you may do I/O projections on
these and be able to get offseted DMA addresses without having to do manual
computation.

Best,
Gary

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
> +pub struct CoherentHandle {
> +    dev: ARef<device::Device>,
> +    dma_handle: DmaAddress,
> +    cpu_handle: NonNull<c_void>,
> +    size: usize,
> +    dma_attrs: Attrs,
> +}
> +

