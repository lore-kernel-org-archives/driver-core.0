Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020086.outbound.protection.outlook.com [52.101.196.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E788740F727
	for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 23:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784849538; cv=fail; b=n/vW7YIIp6oRmUQV3iWcuN+WTCPSgxtkd2oPG9pvbxpE1TxjT7qQIALMN5X6ikqXdHux8rob/IR3fQWOY4VD2uv6D60KYJNMEZLOKBhAcMcQIZfgTIrxbknknPRP+NlzjDB3wjpKMFYc8V5Kiu8BvK0lRNgwOYlz+gGtH3Avayc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784849538; c=relaxed/simple;
	bh=z0BNPPOrLOSnqc8Oo5YPjaCWgXDnQmtEHqz4fdKGTGg=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=TSIR35qsFpYgjE5Gx0kxG5sMPftNIkB/hKEBLt7e5ebX4OmFWnZVTmZMzBqhgsvhg16FrZ4DUtMc1pDkPH/QIVnDNkHUuqkPFQddZcToM9kPSgbajPa7IlmfAWGdDEWIWiBmSTk4VZZVfEe73Qg3B7wKrqE6wRH+3Wxg0OxZHCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Yx2x7ZUs; arc=fail smtp.client-ip=52.101.196.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Yx2x7ZUs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6D3pFg1K5EZz/sjbIEWsfymzwnKNZUgxh1nbG4xn8+gfXIdRVL9VmIvVSclLvqMusVJ88vUtzCae5S/mfQcfCWn/5L+GojqmDKA9OOuBHoH47gRoeyNmR3a+Cx3519JfCOGHcUzL38eXEBNkMrehjjJABP2hRCMD4I2c5l+97gx8OYHmCpGolxPU/GdylgplKhYL3w/ivlMO6AMkQz8ft6CZp8VEoLJ/9Ns9ieNeZQGg1nMXYZ3W3XeSaSPJOkt621xmCuzsfen17gefcIYVO20LQf+0Bk8eJxeWwpB5wcKpUl5yLiPTN2D2uFnINLDZ4Hz2+GWhKSd2J8/l8CKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81+WSljG2IDjCr/JTS2IygOQP4g/aK0747brqSJbqU0=;
 b=YEaugYvTsV/vG8rD3EX6zE41c7fFN30e6bZIZYuLu8POuvhsK48x9knrhFN7wqvZmOn5fWV8qra426btafTyH451l9BB7rSrGR6iHhnMAnQA3H+WfB2mPh043IXUAXVhPj//Z8lol6adyOhr2+QEOJVKWP0qNWZBYehR/jT9mFs+miC0B8vTqy1ITZoCoZNa5PaZuRfP0T2rquza99ABsvmOuewpd7rHnxDR5rNuMPD8MLH0spQqppKLbHEOyzqnX2MSVfb63hN83aKLwILDz+BQGHFOAbGRPyvXYKz/eCjyke1Rp/QWEgpOTlTto6TG2ApBP3AhQCPPfLBQxDYvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81+WSljG2IDjCr/JTS2IygOQP4g/aK0747brqSJbqU0=;
 b=Yx2x7ZUs7IoBLIStaOrsPUzUoJvbt2ZfFYqZSzVEKPuNmP3mYbYIJ4CEmuxWTRlpL9GdAuTz23On8RJTeMwqJVChfu4quZwvbGTxfRsutffeUPlf+7Bg/9qFl55QvKeZo2ibeKl9mOI5Zp7jELPIwX3hjelwtZBthdhM8C9vXzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWLP265MB5705.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 23:32:10 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%3]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 23:32:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 00:32:09 +0100
Message-Id: <DK6CCQDJHK8E.1DZHVZJDLS97P@garyguo.net>
To: <git@younes.io>, "Danilo Krummrich" <dakr@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Timur Tabi"
 <ttabi@nvidia.com>
Cc: <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: dma: return zero for Coherent reads past EOF
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
In-Reply-To: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
X-ClientProxiedBy: LO4P265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::17) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWLP265MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: e206fc5d-3cd5-410e-4f6b-08dee9129e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|23010399003|366016|921020|6133799003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	vKBtD9j3FRzFMgScPXwpeOkAKqCYJsZeGqM2tu6tTRn1pzVxyFqOwB9sRmA0it1hZ7Ty8HOKsBEenEPoGIUQ+RvSG0VDXOosTbmYk+og6F7uIzIrcXnfcubdj+rm8TCvHuh3OlDDj1a1bHK0k6ZVRF/so0G5ELdINKGYBQxqBvRV/q9K1r4/pe5CznwB/ZlCiQstasUhvppQUn/nIGWSWoRL+zfJ8qxyVphMWFXVG8CnvFmeircsQBIfBKazrRW/ia27nGcDhI1JK+mZi26ov31awtp1yaKejbaatC30ZhWRe+opPFIPLD1ONPcYaTUydZN/TIXKKPiaeJ1tyL26EDaHK1Pp7yT/pXC5b4O51EZa6PgZawfCm0QJ8mt9piNhtF7fy10OYkxpflJljxsrMbM7FWZsau1gy7ROQ2ZjJ1yUfvdKu/R+qTTdFb+medh2xUK8PyaFV9HqfbUT3Us5Uc3A3gniulNGKboJMXItLuOxmjJogUU1bWcVqEDHCPRLrC3S+UiXvn+no+qoQD6BMntb9MmVupp1GV2XUZlY4f2DDwOV/woV13AYoSwvx0vh0cxG1ak0CbjcMT2wo7PX/HoT6bhauPMWocCQCCakxZOwvVcLIdtw3kjquDf+pnBAZdRX1am0f1aqCtVgINwb8ffKc/F1VPNCdosFLoUg5YL7JNglw8iJVCV3ZHLk4pr5QhNQRWU9dDZi+1wBp4xQaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(23010399003)(366016)(921020)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVpYb09XdHZXSXVQeTZIQ3dRWk5pU1ZjRG9nVGdRK29STFh2T2NzMXJlTUNM?=
 =?utf-8?B?WWJXSnd4RDI3cTk4TlF4c2NuTWFJWjNsRWNKVnJqTXlDQkhzbE9wV2xDS2gy?=
 =?utf-8?B?d0JWeElqOGhSL0JVRkQvRWx2azFuakxIVzBiMmgyZ3F0Y0pEYTdsb1Uxa3R0?=
 =?utf-8?B?ZVV2OGw2V3lneDRqd2tvay9PM21yakpzNUV0S08vUDhxaXpiQUp4cmw0djBP?=
 =?utf-8?B?cFkxck9iaUhmL0xuZUh5VUVPVjNMSTRvQ1RMWXp2ZUtSQms4MUcwVng3S3Vr?=
 =?utf-8?B?ZjdnOXRldGFPZWJrckRaNHIxQ3RqM2ZMM2psWmNlLzZHZUI5VUJlbERsNG0v?=
 =?utf-8?B?YmlhcFIrQmVBVGRxY3BJWHhwd2FmR0kwcnlKVnAwdTNyK2dZSEVta2VsZU5i?=
 =?utf-8?B?anRsRW1idGUxUlBQWEJQL0ZyU2JERGxmRmh3VnhxdC9SVCtxcDlsaDYxdDBm?=
 =?utf-8?B?VzJpUE9xL2Qzc29OM0F3eUR0d0tabm1NSnA2dU8ySW1UM010a1VxekJmZnFV?=
 =?utf-8?B?OFNJVjU4TnJ4R2lqUVk1UHFsOEpoQnh2WjRZaXR3WjlWdTBOVG1pRWRERFAx?=
 =?utf-8?B?U0s1bnhGNlI0Qzlpc2NrcVNhdk9PQnhBemNpZzlvNDBhY2tzbzQ1ZlRXMGpV?=
 =?utf-8?B?NlUreEhuNTVBMVFkMzgyeXM3OTdxNzlmVVJEY0tybXJZakpXT2FsK0dBc3RB?=
 =?utf-8?B?bk5zTE5OTkVpRkRraUJIUW9Rc0d2VENuMmViVlB2SnVrdXk1eHh5UVREUFhJ?=
 =?utf-8?B?MGdhbGVjMFN2UGRoYm1sZEdBcEhRVUdwMmljREl6clkycFlaQXpNNzlIaEhk?=
 =?utf-8?B?YVVVR2VsSGxDZ2FMMmtMVzI5NGFuNjRjcEhCRGNoalMyb3FQKzByWktNSFNG?=
 =?utf-8?B?M0Q2WXBwYm9ab2hPTFFDVEorZ0dzbXAxdkRqNFBKaDJubVc1NFlMckR6Ry9O?=
 =?utf-8?B?ck5laUhIN0JwVDVsM1BYMlB2UWFCMExTR1JabjFOQVlOT1lRdVpDRnZtclBl?=
 =?utf-8?B?ZjM3cTlJZEExS0tmT3EwVU4yd3NMdHlJVDdqYjlGMFVWbFk0YTY0dEVZMmov?=
 =?utf-8?B?QnRBK01NZ09QTFpZNFQ4SjlmV0JuOC9JWlA5ek5rVnNHYkE1WkFVRGRpYXVZ?=
 =?utf-8?B?QmN3YmRHMjRqVzZIYkZaL1dUMVdNK1B0K1ZqSWNhSmtWVTlacU03eEw4WkV0?=
 =?utf-8?B?V1AwQ0VMY005ZHZDdkc0UXZJMlFHNVFNRUZoTVdxNDVyMzg1bUZkVzMvbUQw?=
 =?utf-8?B?c2NNajdBMm9ka2VSZEVqc0RxNFpIVHNMTEljL1FYK0R4N1ZpNkduSUdsYnFN?=
 =?utf-8?B?YUZUTnBkaVhXeG9aSUlNdTQyY1VFY25kT1JHZ0ZhbnhnSTI3ZFJoakM3ZXdC?=
 =?utf-8?B?cVhnQWJoNUsvMHFQK3pUNm03Rnhla2RqN1V6dWJUYmxnMmptdjhGT0pycHha?=
 =?utf-8?B?ZGo4WDQ2bDdkdVNKVHIvVVJ5MmcvTUN6eHJXT1h3Zkp0ZjBkbnBCNyt2N3lZ?=
 =?utf-8?B?VTZqYnVCQmp5Q20yRlZPZ3BhV082WXphdlBoVm1ueDF5UG1yWEtPUUZySm1I?=
 =?utf-8?B?OHpvMFlGRlpOWWJEc2ZBdk1jVDRWUTgzVUtZZUJKRUxMVndhMXRpR1FMbkM5?=
 =?utf-8?B?bEdyS29iNUdQQnpPTWkyaGNYTEw1bTVHS01tMXl3d1F6eE85bUt4bWwranEz?=
 =?utf-8?B?cmQzY0d2NGx2b1loRkJLbFkweDlubThXNkFPVVllVWx4enhwU0J1NmVpc3JM?=
 =?utf-8?B?dkxndnl5QnRLQmRMYlVXRDk4ZU1TNi9TSW1WM3VaTlk1NEVHYndudXB5aUsz?=
 =?utf-8?B?akR2NC90dXBON2tjNzkyWVFRQ2pQYWpSWUN4VGpRNkpaMDZGYnRraFA1K3pG?=
 =?utf-8?B?RjNuOStzdlB1MFhjNXVvdUM1NTJiSGVuQVBneW1HdmNId3Yxc1ViaEJRaEdX?=
 =?utf-8?B?SlRnNWhQeG54bXFKZWJ6KzB3K3RxcEo1U2swaE9qc2VkOTcxY0d2RHRWSldT?=
 =?utf-8?B?djVuSHFOSmNaVTNpclo4ak4xVEh0MnYwV3RvamZpMjNVaXBpWEtuaXhjQkZ3?=
 =?utf-8?B?MFM1L2haR3ZjcVVvd015czVvQ3Qra0I3K3IvU0tUNjhSSGJ1WUtPVDZOdm1n?=
 =?utf-8?B?RHJDdTdFMUhkdGVwOWQrT0hhbWFBaUFCbUhkNzdiS2JYZTJ3cEhnb3RQZFg4?=
 =?utf-8?B?Rlg3Ri9YOGFCZmk1MUhzUk8zRXdIUE1RWGc0RU1lWFJxeVcvMjRzNHVKaHVr?=
 =?utf-8?B?ZlRqanNjL1Q0NkFBQjFYN1ArM2J6SDNXNjN1c0YwL1dIbXVYV1o1QlBjQlZX?=
 =?utf-8?B?SHFORDd1eWQ1ZGVSUFExSmtIbFBOVjF0WmoxdHpyZWJQVmdEUkxVUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e206fc5d-3cd5-410e-4f6b-08dee9129e07
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 23:32:10.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfqX3/lsNNPS7tKYe/kX3pHAMKhqUUpdAY1s79k9s6LUK38kO5EnNnYxalNnW4KnJUDWDKL+BHZazf4I2GYaAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5705

On Mon Jul 20, 2026 at 8:21 PM BST, Younes Akhouayri via B4 Relay wrote:
> From: Younes Akhouayri <git@younes.io>
>
> Coherent<T>::write_to_slice() calculates a zero-byte copy when the file
> offset is beyond the allocation, but still calls
> UserSliceWriter::write_dma(). The latter rejects offsets beyond the
> allocation even when the copy length is zero, so a debugfs read past EOF
> returns -ERANGE.
>
> Return before calling write_dma() when the offset is at or beyond the
> allocation, matching simple_read_from_buffer() EOF semantics.
>
> Fixes: 016818513936 ("rust: dma: implement BinaryWriter for Coherent<[u8]=
>")
> Signed-off-by: Younes Akhouayri <git@younes.io>
> ---
>  rust/kernel/dma.rs | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 200def84fb69..36b72fb9ab46 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -1005,6 +1005,10 @@ fn write_to_slice(
>              return Ok(0);
>          };
> =20
> +        if offset_val >=3D self.size() {
> +            return Ok(0);
> +        }
> +
>          let count =3D self.size().saturating_sub(offset_val).min(writer.=
len());

This saturating_sub is redundant now and should just use -.

Best,
Gary

> =20
>          writer.write_dma(self, offset_val, count)?;
>
> ---
> base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed
> change-id: 20260720-fix-dma-coherent-eof-d0d08c91e013
>
> Best regards,
> -- =20
> Younes Akhouayri <git@younes.io>


