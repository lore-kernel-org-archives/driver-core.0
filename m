Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022096.outbound.protection.outlook.com [52.101.101.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D31199FD3
	for <driver-core@lists.linux.dev>; Sat, 14 Feb 2026 10:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771066001; cv=fail; b=e0u5/hBiTQiq4i/QB1ojJFchEpG37+Pth1Jy0c0Y1SXtN7wcbh3AztpI/8C7+EVGo9nq+75GqLqf4v2Y6nDju9Qe4GpTWY+ngV3EqTYr/nNiWXp5bQ+Kh0f5kiARn2K8FcQllQHKDcXyXBOX2L9L2SS3T6yrDefehNjEL9h6BDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771066001; c=relaxed/simple;
	bh=F1QYR/0IXipdHLCKDAOD2/AwO/A3ndL2gb9EJ8e5DbQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=SluUiLIj+6g/eVSKtpmgr/vooSa/OgsjDozLDmH9ZQgLDi1s9B9ZK32yZxFFoYP3qsEO/NFxqPkF/r8L2JK989j0gVcchnzgFUqcPFq+rf7As6O3A8xwkc+J8+tnQAAXXVush0nsbSmq+nb2Ihyx20MC+GJo8pZzokYbMwuR8Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fPpUKYQ0; arc=fail smtp.client-ip=52.101.101.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fPpUKYQ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCqEIDPmyFxJrTmKAc0B7l/3huBuVVCkmvi+d9s9xmSxV9O/yvS9bZRvS8ajHgdRp9FaciCjsFY5W+h7bdlbbp/D3yFPpV8aUxY2FnqwxXoRg61PI/h5E8EtYrFUDM4EOIVeg6VjOCeNaIAyeeueLjWxzS//72tpzktGXakUHBq6NRJ6HrqbskHcGQ9obnseY0H2r4EkQOxsjZFWPfkZXSRiigBIq+NaAcMGFZ8fpKa1sul+LxWP71cBeYv+s07sT6pXYVaMmpgo85KylEKZ2FCF8BA6FTyhwJ3WnHgOyQAL6ybjBXQX+iv4ZEk0F4JbDi5IHkdkQ8w/twDPtDCQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAjgFr09GgzsXo2bUUyULWtmiMgue0RoG0edfKUw1WA=;
 b=Asv8Drj7X+GTjgFsYe9pV6Bb5Zu1A+Go3NrxwwEkivJjFBu0qMHLAkGlyK0ots6UpzrdEq68L5FKENgf81MWmwkiZHxXhqoelJi2MXY4ML2Zk4peot9gHRMaVz+Mu2Nz6jp+LF4Mcw1uYsLIAQlfGmHtXMgsgnWV1zg9c/iCQvholOmflkPQtm84Y0Hz9pjvIT26tu48nC1Ff9Jwvvp6eLZa9gwfnZGXDdX9bndHDHIb/vmPvkHlYYnbXDD+aFtMldr0oOAMjsZ4zLm+bCTryHOzWEvi4YUR+IWPbzIaKeDoxzeUCCsBBnfcKSLt1TGs0dYo7err9vc+AfL8YfMf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAjgFr09GgzsXo2bUUyULWtmiMgue0RoG0edfKUw1WA=;
 b=fPpUKYQ0SdqHIqTQdCPX4oD4U9l7SV9RlNRP80eNFOaVf0i71IqiPz812IHT5EgHkgJbiArPDMGIlsqnCu3MGzXPAoqGuo0KxQexNOOGhuS+kqTLFCvw7WSuchbkrwu9BKp+2NlVZW0jCJMLeP0F74jDzyRTDseoARt9bh6yIwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB8360.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:472::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sat, 14 Feb
 2026 10:46:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 10:46:35 +0000
Date: Sat, 14 Feb 2026 10:46:34 +0000
From: Gary Guo <gary@garyguo.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Abdiel
 Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] rust: dma: generalize `dma_{read,write}` macro
In-Reply-To: <DGELM1R9FJNE.30QDHV2IXV0BI@kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-3-gary@garyguo.net>
 <DGELM1R9FJNE.30QDHV2IXV0BI@kernel.org>
Message-ID: <84ef050ac2c2cf858ec766f23d1fb90e@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB8360:EE_
X-MS-Office365-Filtering-Correlation-Id: 86746f19-c791-4888-05e5-08de6bb652f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hDzMQs5GkMntHMAvLXfyX1/UOmrVo8eQdZDNgbC186Uo/bfBTD0sTlpv4nrf?=
 =?us-ascii?Q?QQbpGI5WponnBo9jGzoQ3b8j/sqwh1r6c2mJhroL047z4z4j13axUPnNwrUQ?=
 =?us-ascii?Q?xxIMkmF5JpACw+3cR71lZaTWUGJjhnZuqeq4nqNSGy3zWXiJZNzkxWHebLaa?=
 =?us-ascii?Q?LfrqyI4oZO59i7FRA0i6q7gjMufYU4r2+7rxWvO1ae7KJpgye4u0rsM47PbR?=
 =?us-ascii?Q?+VXLhCURyR8Jyw72fdJy9TQeIevXCHE/uo1w0BwYg3enNsDoPj1NMfDpjzs3?=
 =?us-ascii?Q?Hr1Zkn78xR/PSoqAIiDtE72mIiDCu6naxPCQ1clDnZ42DlZlDn43+VzQxmUs?=
 =?us-ascii?Q?s2ARplotRWNamxRkHXAExjvFwt31Qm/JABmqgkiyyQ3TwOHiALzwA7F/juwN?=
 =?us-ascii?Q?a4HlR1HkUzeeIZ+6+9TWL69m3wtfONbzXYuXTrlS0ry/OfuAVHXFq+LmDqmI?=
 =?us-ascii?Q?equj4lZKl12UafLRrybjmqeagt3RMnoxb0ZGd/3mZDiX559HaSVYHCndkJ0a?=
 =?us-ascii?Q?gjvRqcfqUUzWycktjrAGo35yMYHsHiiedcFhVP41XATKRcUasmyHkoA5cbrK?=
 =?us-ascii?Q?2ThDL5YqTeXpfK1jx3C4AJ3V45aLUv0aAnFDnZiPmUAEX+hjn0BLjDu6oGLS?=
 =?us-ascii?Q?pBju0fGwmLiadtd1s10hYiPbjL1enoU0jrC4/R5sqZqXJ3JxBW1B8w/7haxJ?=
 =?us-ascii?Q?T82wywgruB27uhK05WpYAVvhxcOU5TCo6fBL0sSHtpcj/M8gjumFlZTKSTsC?=
 =?us-ascii?Q?rx3YoMWSljgNmc/jB5rhemI2LQIzO788MBxdnj/QUaJSt8cpqFgvGdwyY+eB?=
 =?us-ascii?Q?OtBjiNQUQFYBNaOAJTcQZSah7icTSRuOFYdFqyTwkV86QddMrZMwrfdOFDvw?=
 =?us-ascii?Q?YBhce9e7CmSOKbGg4M56gAbNwa5cd2S/7auHZK0YPembh5yethkVnnzakjPI?=
 =?us-ascii?Q?bBxViRKAGo2I08sDSbx7PC3r1karlyMUw27ovWcNBgyBEST3zqyHZTDJVUT6?=
 =?us-ascii?Q?c4sl90E8e0LWlFC4kKNXsd+Wp6CCZKqIGx7tA7IupZM+YCzjumajMHUhzmxI?=
 =?us-ascii?Q?TAr45BF44P9H9rewWewunAjljtKlI0+7IKiqdnmecS51a52q2ebG3TebqZur?=
 =?us-ascii?Q?O916u9Mr83HZpbNSoSzDvDJJyQpiY0bEO2ObXI76rk71gn58sV6hwztVP+Zb?=
 =?us-ascii?Q?A4Ie02gEVFjN39Xn1gbB31w+0uEY16CU5xVeIYknEgdgrrXfSxHMNv3U2fua?=
 =?us-ascii?Q?wiaXEO7+9idbVxZqS/XQQCmY8FpcitY8I/s8li1GkRtehDO3PRjJZJsVwfcH?=
 =?us-ascii?Q?5thlnEhK7KQTGoUoSqcdmEOdM9EoPBMP+9p5v4cNaiURJgKyHc8vo4Bl3MpB?=
 =?us-ascii?Q?Qr8chPSkgZN8aCuJMLIWJWvGAEWhUeTIvEr1UzFsWPNGKkHl81jHBh2o3u09?=
 =?us-ascii?Q?Z60P8em2lYBhAOKklukBR0L+VVEtdsc/BthHKlFWtusaSg5WI0ySy20Y2Fy3?=
 =?us-ascii?Q?xpH/4R/ta7/MCV0VLACzT1qrqZyAH9zkNTMmPrP80qKNyCZLorhYOuGYwaDu?=
 =?us-ascii?Q?z6aDiaUeGIqsSZBG56c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mTp9N5DtBhzWr2A8HyN0psM5d3mQxAJ26CkPu0u1IR/LnyEa8TVpke2g5I9y?=
 =?us-ascii?Q?Ixq+fLu106O0UWpEJTUkKAX/jV2nnynm4sLCCEalaWhi74CK9qLKkVs9bhoy?=
 =?us-ascii?Q?0VxyWHL057Xyo4+kUdeBWlDj+BGTKbnfq2mMbObkiN1qUVyqpzjqTXOLbtxm?=
 =?us-ascii?Q?DjU2ijaaMP/KguXsGsRRZVuzKELiHgJv3mIPt9OBRlCXvJ7Rv+JJ3VMBGVcF?=
 =?us-ascii?Q?gRQfKLgZXKuQECTLvCCE5b8vPoMpJKOaS2+qs8L20Ea84zIg23um52nwXAO1?=
 =?us-ascii?Q?GC+797+ro+Srzinb/9qakibAdR2H+sAssYwAgWJvbbYjAiwU8HNB51a5XWkd?=
 =?us-ascii?Q?Tj1kCBP7UZzwNejpG3C2VwVATh7WqWCKYl8JJJCzyxS6dkcrp3TpqxHPC1Ho?=
 =?us-ascii?Q?GiAvQkSu5DN5CZ8yL0bhFVhYsp170+XW7Niq8RR/rZsrs3X6cUn2aEO9qFUk?=
 =?us-ascii?Q?KVwlG8n1QJ2be3C7d/BG5I6z0TB7Wb1rFio9FPPiGdBq9P8o2193YxyBemLH?=
 =?us-ascii?Q?uZzhcZA36jC2L2NohKmA9c6Ik/D+NUYCw3RCiUhmsgfH8VIVwJIKkQgJPBoV?=
 =?us-ascii?Q?wuuMMEieE7rT08x8Cmv5UNUQTwOwWkacpBhQ1O+4KfLbijWKDQMFqaOu+kDo?=
 =?us-ascii?Q?Vf7nrUHWKY7Epn95B1R+KtcYqRHIO+YvSI5/lqcT5wEFjHtw9/fX6znr0eYf?=
 =?us-ascii?Q?9l+A6i2Ax3gEWStnw2uER7Q2zxq9Ei9qbM+Euvld6PtGrbWob02TTRwRVLPJ?=
 =?us-ascii?Q?EJmF2mJ8f7HSpTNDxI62xoVtTOpTAa0KxD48+PT6xd/cmX0jynP67T3xjokl?=
 =?us-ascii?Q?Su4x+qLKipczAo8HU21vHMfLLDCBjrBulshUVmaZDqjT366p5trbLdBc2UV9?=
 =?us-ascii?Q?S9TOlTeZqEvVfbanibUWig44ta+f9jfUHlrEbrKr/aT/GwNIA8KhJCmeKauq?=
 =?us-ascii?Q?r4BB3YUQZMYmMKFZgPsqpPDL0ng7DFKjs/QKms6f98s9ryQ+ThC5h+3lrzsF?=
 =?us-ascii?Q?7Mdj/aag9DDY2REu/6L0ImPPOmtrSlMD2g8LOJ9G+Q+QEHLOPgORecTzkznF?=
 =?us-ascii?Q?TYUY82Y9xT9cIjSgB3TO0fyJdhKrIG33qsi9W04/6x0hJH+6i8oOYaqYqfrL?=
 =?us-ascii?Q?5VaZo6eLxlKkWXqmNU5ZR2aLVgbBr57SpLfKFUH7oslnUpwYAkVHgnJR7tyK?=
 =?us-ascii?Q?l9nqcpRjZEEUgxbEcY1SH7IQYBPS6fBWDxuimIEh5zLkrzftTxPzb5URi7AV?=
 =?us-ascii?Q?WeZEU3rVNysoPGwOOiclzeF22V6RwuhHn8g/cH0tE5SfnVmv/kMMU5cMTar4?=
 =?us-ascii?Q?TVYCAKlbkOycXzsSs/68BnpQJIWVxcea1bbt0MHDK+xxtxRf0FBUwk9JZwy1?=
 =?us-ascii?Q?E9gqDCIrg+flHTumPxhc34fwREx7DJBJMUg7k+nSvFJ8rPdgnbsB5HSc4Xd3?=
 =?us-ascii?Q?Z6Cgtqgi/TY2OKb9edcnXK0bQraKjTb2EGiGR9bnt2THRk8pH6WjTnqgOaB+?=
 =?us-ascii?Q?mit+famk3VyyM1w3ncwFFF0DrV6Nr1aU9mNN26YGYVNjcKHdfaCcO8OXFFTe?=
 =?us-ascii?Q?RPNXywXoBPlTSp8G9g5KD57tryF6z1PA9kb3GmOoyPkhqc9wqEJHiwz0jSB4?=
 =?us-ascii?Q?+bvxtHYnfIIq9JYjqEDU0vtSmMJ0afrgzBn5uteACesFXOGOc/5P96lNi4o4?=
 =?us-ascii?Q?JHTLZnBD2k+1xskfKH8bp+bDfSQf7ABcTKe0JQ+/aqz65N1drtxJwkwuS7BD?=
 =?us-ascii?Q?QN/UEVxoe4s9jLF3Out1ZacHL3XOkE0=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 86746f19-c791-4888-05e5-08de6bb652f8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 10:46:35.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dS/84Sh//xuf+DHAu0maq2QhEXjRMncxfDQ6tDXqJBJxzgVBcHk32yi4A7bffH2NP9M1IbkWncR/wDNc0+aZQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8360

On 2026-02-14 10:04, Benno Lossin wrote:
> On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
>> +    (@parse [$dma:expr] [$($proj:tt)*] [, $val:expr]) => {
>> +        let ptr = $crate::project_pointer!(
>> +            mut $crate::dma::CoherentAllocation::as_mut_ptr(&$dma), $($proj)*
>> +        );
>> +        let val = $val;
>> +        // SAFETY: pointer created by projection is within DMA region.
>> +        unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, ptr, val) }
> 
> This evaluates `$dma` for a second time (and also places it inside an
> `unsafe` block).

Ah good point. The macro that we have today put `$val` inside unsafe and I've spotted and
lifted it out, but I didn't spot the `$dma` part.

> 
>> +    };
> 
> Missing surrounding `{}` to allow this in expression position?

Yeah, I also spotted this myself after sending the series out.

> 
>> +    (@parse [$dma:expr] [$($proj:tt)*] [.$field:tt $($rest:tt)*]) => {
>> +        $crate::dma_write!(@parse [$dma] [$($proj)* .$field] [$($rest)*])
>> +    };
>> +    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr]? $($rest:tt)*]) => {
>> +        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]?] [$($rest)*])
>> +    };
>> +    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr] $($rest:tt)*]) => {
>> +        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]] [$($rest)*])
>> +    };
>> +    ($dma:expr, $($rest:tt)*) => {
>> +        $crate::dma_write!(@parse [$dma] [] [$($rest)*])
>>      };
> 
> I'm wondering if this also works:
>     
>     ($dma:expr, $($(.$field:ident)? $([$index:expr])?)*, $val:expr) => {{
>         let dma = &$dma;
>         let ptr = $crate::project_pointer!(
>             mut $crate::dma::CoherentAllocation::as_mut_ptr(dma),
>             $($(.$field)? $([$index])?)*,
>         );
>         let val = $val;
>         // SAFETY: pointer created by projection is within DMA region.
>         unsafe { $crate::dma::CoherentAllocation::field_write(dma, ptr, val) }
>     }}

Rust would complain that the outer repetition can match empty token tree.

> 
>>  }
>> diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
>> index 9c45851c876e..b772ada2c65c 100644
>> --- a/samples/rust/rust_dma.rs
>> +++ b/samples/rust/rust_dma.rs
>> @@ -68,7 +68,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
>>                  CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
>>  
>>              for (i, value) in TEST_VALUES.into_iter().enumerate() {
>> -                kernel::dma_write!(ca[i] = MyStruct::new(value.0, value.1))?;
>> +                kernel::dma_write!(ca, [i]?, MyStruct::new(value.0, value.1));
>>              }
>>  
>>              let size = 4 * page::PAGE_SIZE;
>> @@ -91,17 +91,17 @@ fn drop(self: Pin<&mut Self>) {
>>          dev_info!(self.pdev, "Unload DMA test driver.\n");
>>  
>>          for (i, value) in TEST_VALUES.into_iter().enumerate() {
>> -            let val0 = kernel::dma_read!(self.ca[i].h);
>> -            let val1 = kernel::dma_read!(self.ca[i].b);
>> -            assert!(val0.is_ok());
>> -            assert!(val1.is_ok());
>> +            let result = (|| -> Result<_> {
>> +                let val0 = kernel::dma_read!(self.ca, [i]?.h);
>> +                let val1 = kernel::dma_read!(self.ca, [i]?.b);
>>  
>> -            if let Ok(val0) = val0 {
>>                  assert_eq!(val0, value.0);
>> -            }
>> -            if let Ok(val1) = val1 {
>>                  assert_eq!(val1, value.1);
>> -            }
>> +
>> +                Ok(())
>> +            })();
> 
> I dislike that we have to reintroduce the budget-try block here. Ideally
> we could add something like `try` at the beginning of the macro and then
> automatically add the try block. Feel free to make that a future series.

I don't think this is an issue. It's visible inside the samples because
we are testing the values, but in practice most users would propagate the
errors out.

I also dislike that the budget-try block that we have inside `dma_read!`
currently hard-codes the error type.

Best,
Gary

> 
> Cheers,
> Benno
> 
>> +
>> +            assert!(result.is_ok());
>>          }
>>  
>>          for (i, entry) in self.sgt.iter().enumerate() {
