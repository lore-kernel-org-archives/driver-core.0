Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021087.outbound.protection.outlook.com [52.101.100.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03DC3ED5D6
	for <driver-core@lists.linux.dev>; Wed,  6 May 2026 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778090089; cv=fail; b=iRk6mQ85W74pg4P7E5B1KeSD++lek0qXZm6/k0rGyfhxcHty3YBCaBAFExzfhHa2fI5X27jIZhAnA8fUpZqdI1vJqkwGbDOraHKNpZI+FbOytj9NzhhewyRx42wAvyY8HqK3ckRXkAmzYRCj0yWSD8Sj3Umb3fL9P17YmXJU5s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778090089; c=relaxed/simple;
	bh=x240Z+CIveB7Q2pNsflHxaee/tNXea43LKgD96KFkOQ=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Nv/jKk1WHC1yoz9zR+n9JZwFpqNKsLNAYZ0rsGs/gQ/n3qkCrqTHBc7rQgkCh08Vz6mJKZq5HYsszm4Zsr6KwdOfs60Qb4qwah9qWX4l5akPFCsZaL3Cr6X5kakIV8/SNA9kQXK/avbP+HH9QPHY2vDQuqLv/zphVbqfWZCvkos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=PwF9yCLp; arc=fail smtp.client-ip=52.101.100.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="PwF9yCLp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1tQi4K21sF6dE/KrzSKD7L4EhftawdO2KU+/9bJ7FtmUimKmaMJWiYhFagIX8ORBcIzXpojO7AhcNKrfLlEPwdkl0d292uWg4b62swzD1VWbusn1nSJJCFh+YjpVuyqPqzyboxypDhkddi1Zt/1z+j+a7UC1TQZOWfl5v1wFCcNgM4mn5TnIuCenNMBbFtzPJ3UiJXAYWl3gNZQE3XWpUZ+pMepesTM7H6bVFAVEHEaL1aWlOKYRCwiH8wGiUUa943+DXZSTnREePw2671Mnos+Za2VqUSBkvXzSUeTqWB+KqRYO/bi5ttwBZl/wLqA3Hz39POWunrtyljEXUNyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zau0UNX+zaiFheiXlZKudJsW69ekTMIB/JnEHrWy0w=;
 b=eFuaUYhIMsd7qWdpM4LKoZVmHg4AqAdZ1pY8M4OvVu0cMDfayqQf2sMYIDhgXvYUuKB7VcFxyo/Qh9kkS6HSM0APkbMHqnBzve+KcenrR4WE7oAdSUgNXXaB+Suzx+zPQ98BDvFQ9I3bye75Ao7dls4IsMeX7Mv+oGMg0BQcbntUaUTCZFYismMD0WALHGw+LmGzweXQfTU6iwWcAFkYBz21JqKBBfJRyMYLAIzpynC/PHJVnm/lVsqPunJiDsRWG/zwgeQJWo/tKaMbDyYcAzmODrpVf/pb1JbHvKcfD0a7HgTlWn8anfuDZY61PJceWfNlZZeEXRQEunV945oRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zau0UNX+zaiFheiXlZKudJsW69ekTMIB/JnEHrWy0w=;
 b=PwF9yCLpwSNRRv2aYtka3tjPqGa9mAP0YH8VU9ghYgiFbJUQY5rSLScdpiQA/q2xTbZ7/0KG8oX0C/cG4jv6Ujv4OGFgXZ2Nr2hsZI+9cibbIeqI4JD1PgfEV66jt1ayIpbFnGoRiKS3h7p0Ulc782cC1PAG/dyw/ylV7W6+fK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8356.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:46e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 17:54:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9891.015; Wed, 6 May 2026
 17:54:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 18:54:39 +0100
Message-Id: <DIBSBTO76OGQ.2EBPYIU063TG5@garyguo.net>
Subject: Re: [PATCH] rust: dma: drop placeholder TODO comment
From: "Gary Guo" <gary@garyguo.net>
To: "Melih Emik" <melihemik@noirlang.tr>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260506174637.22687-1-melihemik@noirlang.tr>
In-Reply-To: <20260506174637.22687-1-melihemik@noirlang.tr>
X-ClientProxiedBy: LO4P123CA0551.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: a1248106-e9ba-4571-e3fa-08deab988b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v4f6yb2ly728I9g0jwGnv95BXofXuXeErcU1hoCzABnvWd9zVlseiYYalF4oje2R/msPI18WQ7U+WnrDdf9YNWI5UZpjc6x3Smp65EiFPgsWWYph5qzm+WE4d01McpaPItdvFp1QUSDAgvagK7Siglkmp6zVITGpG3HhChEbKcvskGRpXMFtzjF1X1UKqCaQVEzjlgZrNlAg/4EmGaYjtYEPDMB6uN0I4p/lHOeF3SpAqssn2R68+Xmx3S8O30O/6IxnCb/HWOQG68t2F6O4yc4eidxmecxXiBTE3E6d1O/u0ozJmt2pfKU1TQmUImPz5nIvPAc+ak/MSJ/74p0YLOnWfrBh4zYazFmMl9Yib23ORKQTSLfN3fnJaujh0DEnW3pWIvdK1Z5AF/KOkh70ewwym3CqptgXy4pV56TqmIYFA8WKNMSDoLuSyMeBVC4cujBwZ9fI0dCOGhdl6B3owEPktTNiQaTH5U7hwB14GO6UMZedXeIm/FJDD/esIqaOX09tOrdgefojYWKQYRKAawt7iy2SFTqfIsLYuktYy2Y7RERAlWngpcX6Gbc2THRNLOZr7zZxlblHm8GehMlL8pHwK0Wy69ZlCiUWJn/ATZ6U9WF0G44pMyzuNb2GCIac1asFlLqNIZ7a5AmwmtWZUonPQ+lcqTLNm8fv+0NI3fZKUmkZek0QU9zStWYHMXTOlK5xqSdQIl/HH27A+xdqpY+PChXvCCAAYzcFSY4iTu8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXNrTUptVzR3QWdJZjJHT2t1MHpvTnhSd2pSKzgwM1lsZCs1M1Zrc1lUanh0?=
 =?utf-8?B?cFBEZjlOQVc1SmZDbVZTdGJIY3o1VTlxN3BPaEhLL0w1UWdrbXJYQkZPZFcr?=
 =?utf-8?B?dkh6eDREYjBNK0d4ck9KZDJ3NUptYjFTdFpkM2h2Qml5WEo2ZGVNZ3oydGNK?=
 =?utf-8?B?b2d6K1dmNTlySlJmelNjaWhhVlN0Y2Q5UjRtL1lLZFpnWGU1RkhYSWRLVk9s?=
 =?utf-8?B?MlJ0VjV2YjMxTVR4WDRqYW51WEY5N25WbHZkQlZPWkE3dlczZXFpUVpkYnNZ?=
 =?utf-8?B?OXI2WitYdEZwY0NrNGRkc2VKd3U0TVRxQjJVM3VpcXlBSEFJWmhKdUpmOUpH?=
 =?utf-8?B?eGp2NGlZVWF5N3ZFbGJYdUlwbjhhWkVEQ2taTVFrd3Uxb3NYb0JIbzMzeXg5?=
 =?utf-8?B?OEJUS2hUT281MlBzNTVDY0RReEVjWmRON1ZPd00zRE84czVrOFJkRXB5UzVs?=
 =?utf-8?B?cGlXWHZnTWFXSTkyRkk3Nzlwc3NRN3lMYWhkTmdseVp4OTd5Vmw5b3l1Wkgv?=
 =?utf-8?B?SkdOM1BLSkxaaWJhcWhjSDJkOTBnK1N4QzJzZkpvL1dvLytrMXRPL0VRbEdv?=
 =?utf-8?B?S05HYXMrRjN4UGdienZuOUZ1eUwvb241QUNpN0pqaWF0NjgxbUZkWHNtMmNv?=
 =?utf-8?B?STFMQVVPdTQyaDVwRm50OUNCNE81a2MyU1dvS2c5cHBTcWtUNHB2MXg1S3k1?=
 =?utf-8?B?WXF0TUF4OHdNd1J5MXRLZlY4cUljRTQ4anZvOWZuS3BEOGJrdmh5WWdJcmhO?=
 =?utf-8?B?T2JaWE5RdzBlU0lmWVRVaGdPY1Ntb0dEVW9vK0RtNTNhUHZmQ2d5Y2NDZU9Y?=
 =?utf-8?B?Z1N0OS8vU3RQMlliUnZpVjhPa1M0TVA4WW1pMTI3YVJrWVc4Vno3V2lycmlJ?=
 =?utf-8?B?eHh5SWxJcFhFQllzemh2QVJsaEt1Q09hNXFUSlNQZ0FXMmVNbkdjZlJkMXVE?=
 =?utf-8?B?T0NGV1J2MUhaQk1MZE1lSG9ocS9Fcjh0aVFwRUNhbkhGRjRYdXBXTUZFNit0?=
 =?utf-8?B?Sm1oY1NNaGROUnVDZlNiS3RDcEdnM0tGYXlaMSt5VGh3MEdYd25qS0g5b2Vm?=
 =?utf-8?B?bklRUy9FaGJRMWRGdFBaM1ZOQ1NZTlJCa2o4MXJoZENIOExBbnNjREdFQmRM?=
 =?utf-8?B?NloyeUovQjIvSm8wS3dSSGhmVFJ3My9CUytpTUZMUUpmaWpyeWh4cC9POElC?=
 =?utf-8?B?V3lDb2lxREdtTUJMSll4M3JuU2ZyWEsxZW9UeGZDdEQ1cTdpZGloeVAwemJH?=
 =?utf-8?B?UG5IRmlVWUpoclVEdWZWSmd5OW1SQ0F2ZHNhb2V0azUyN296Z3gybU5LZ0Ez?=
 =?utf-8?B?QVlteXJTRTNGQlp5ZHM0WkRaTDA3OVlmZG1vM09LQ2RCaGFkMHkvU2NaVkJY?=
 =?utf-8?B?NjlQZzBoUGpMRHNnaEhZMWZzRUptaDNxSmVZNWN6R3N3OUtuTHpVYUNPZnNF?=
 =?utf-8?B?akMvdzZxMTBWcGNnNmV3akREZWJpRUlrYzhiMVVRemNVYUJ5Nlh6V1Vma1Fs?=
 =?utf-8?B?WWVxY0VudDVKVVNocmthWEpOVlgvVkFrQ0ZzM2JsOHoxajBvODNPbytIU1ZQ?=
 =?utf-8?B?a3g4VUJUZXNlZzRDUmFKSWhOWk4vR2V6YWtKbWFybmc3c2NZQ002R0RiUzl1?=
 =?utf-8?B?N3dPMDhac3F1NEV5ZlYvSkNpc0M3WVVzeWR3emVibUZseXhLcHMxajQ3eDRZ?=
 =?utf-8?B?VExhV2tkTTlleW5wcDhHMm10aGhhTHRtcnRoN3dSVnQ0MWVBQ2dhbXUzaWd5?=
 =?utf-8?B?dTdqV2NRdi9aNy9VR24xdG5FMFkyOERMYkpXWS9FaDg4MDNCUkQ2REpXZlh1?=
 =?utf-8?B?TmhSYndNdzhYeUx2TENWTHVyaDhyVDkwOFZCWk5iSk00YUw5eXpVa2FzOUNz?=
 =?utf-8?B?T25IOXI3aGtoNi8wV2VoczJXUHhRSEo0MjRFYlFxV3QwcDNGMW5Fd1lJMjRu?=
 =?utf-8?B?bDNMYXFURHNlNXNoQnNlbGZWL3ZuT0VJeml5Vm94Sm5VWk9uMXlDUUF2Tksv?=
 =?utf-8?B?Zkp3TUsrVm0zQ09CTkgxU0Q0Q1JSbUFqTjQ4WU9scHpNbXQ2ZVVqUzRkRk9S?=
 =?utf-8?B?YzBzcHV0OUFkNzU5dGFoSmg0Z3Q0SHBxck43bW1MQkIvQ1BaaVc0Y3lUelNQ?=
 =?utf-8?B?aXZHV3pEakFBYlZHZFVKamwxR1BRa2d3cE9PdmhNT2NyVFJmRy9hZ1FyaDBG?=
 =?utf-8?B?UlBzSEN3R3lzRWRLbnBzUDJpNExSMVpaU2pjdzBpaXZDTDNpTm42Ty85Y2tN?=
 =?utf-8?B?c3JEdjk5SUlrQ3BLdDh3STVPTHYyU0grVy9wYjMxZi9vclZVN1R0aUlCMlVr?=
 =?utf-8?B?M21LUU95UG1QYm1iZGxVUjFjaXJBVnVjRFlMV2l2L1lHbUQ2UVk4dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a1248106-e9ba-4571-e3fa-08deab988b60
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 17:54:39.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UC2MLjLdAHAS7Z/eh7JBYB0Pa3y6zP58gY9H1rtHihr3+nn7AuEx9/tQg7lgnVV0mxJIyT6xnySzqvTxc6IVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8356

On Wed May 6, 2026 at 6:46 PM BST, Melih Emik wrote:
> The comment above Coherent already describes the outstanding design
>
> considerations around device resource lifetime.
>
> Drop the standalone placeholder TODO marker and keep the explanatory
>
> text, including a minor wording fix.
>
> No functional change intended.
>
> Signed-off-by: Melih Emik <melihemik@noirlang.tr>
> ---
>  rust/kernel/dma.rs | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 4995ee5dc689..60c458adba0c 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -580,9 +580,7 @@ fn from(value: CoherentBox<T>) -> Self {
>  ///   to an allocated region of coherent memory and `dma_handle` is the =
DMA address base of the
>  ///   region.
>  /// - The size in bytes of the allocation is equal to size information v=
ia pointer.
> -// TODO
> -//
> -// DMA allocations potentially carry device resources (e.g.IOMMU mapping=
s), hence for soundness
> +// DMA allocations potentially carry device resources (e.g. IOMMU mappin=
gs), hence for soundness
>  // reasons DMA allocation would need to be embedded in a `Devres` contai=
ner, in order to ensure
>  // that device resources can never survive device unbind.
>  //

The TODO here is supposed to be the heading of the next paragraph.

Best,
Gary

