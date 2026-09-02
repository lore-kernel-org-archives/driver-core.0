Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020135.outbound.protection.outlook.com [52.101.195.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3964A441E
	for <driver-core@lists.linux.dev>; Wed,  2 Sep 2026 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360743; cv=fail; b=LdjRj9PR6zcAsihCzJXMGf4AwLJ4YESh5ZTku2xa9+BZcJ6h1v/cpa2rg9W3ev4Hj09hycI+GTJpRvrs1CuCc8uy3LF/odwdj6uVfdYpd4nfO/Xy4IuCb0C1xelUEd7xuFkf7A/ckjJ0qX7GM7+H9sJ7tg1ndMFSkqnt1Ob16Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360743; c=relaxed/simple;
	bh=PjEjcWmp+455732UxJ1U12D5RS9z9ryhq01hyqCC3ac=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=aDitmcp1clMdes2Jvo1YT2BDEgmValXoJ9S9CS6of7LNNyqdAU9XzGLeH0VM9BS9UIz+ydo+vaGDhDAjxyfSmlkLB7b7V0lzt7WF3hfevgX3HLr55M50t4z+uxr/C7lcoFSV9DpIgCv4KEE7VONCRFRoLWo1lxKuknxab62HPOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=K3+DZQkh; arc=fail smtp.client-ip=52.101.195.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="K3+DZQkh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzFo4fIfcIIx7G6+sp4tqqtnCxaFWn95tzzK+13edoYWxLVbrWGbVvquWo1+gf9Bz65IvWiuOHeAS3TbwwVKxYaq3FyDKGd56MTXQAJdQS++3zOxeLbeW3KsTCs6QdWQBqGylrFxuAgaA0iPJMzVrHlqZJsv4e7Kg5BYzw/U0ZtZK04tVwcytq2zAtKiVwZgzTmHe5fMbg95vKXMGlmnpyXKFUFUb+o6bkGCTk7htBshPrZPHb+uvL6cMP3OthAfUbyWpl45Sf5Je2TflfG8oBNLBlZspXqfYO6bAIg9OhwqQXG0pAo/ze6I1RU+BiLsAeEvm+dhwa5UghVXlGnTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmYGgPupStTm+vNCX+nA2mR1Zt/s2S6iTNDPlqp/eSc=;
 b=MrOSCxwn9iaD5Hd9QG2ACthqQvWUM7eg998qtU5JdaTeaJXpasHBS6D86W/WYKk+0BhB+g3SbyzD7sJmtzXkvsqTiQsXpBqa++kfQEcSr0CuQOyxuxMxnVowhWvrhNCRo62fXr8wRuofa79PHt7lk7XcPnlvtTbmrzuGZm1tgdIqSaqAl731XeGeIcdOAwFuY9sPg/ezA1tSUYE/+AXF26DMq425PoQQYL+umBGdIggPbPc8s6Tt+2ZLmfx9kOjuh9MtYwffVHiaEVYV2bklTRkL4XCGpr7hsSKeFt+DDVcfc2IUeSW3X6FvzFBFAfmWAq8OlP246ShAIRM69q1swQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmYGgPupStTm+vNCX+nA2mR1Zt/s2S6iTNDPlqp/eSc=;
 b=K3+DZQkhka0OdLqiXeU91VBhJRk+scllZ2fagTwYqpX6XDMZK+2zU3D5DLqW6DAktkaUKm2JLdC7go74NAN5kY/ly3gf7OColCw60xSUwAVvhHY0BhNpeHoLJoDYCaG174wARg9PIIcld1dPLjO/HFE1kcUfmuTvjbGXzHDsGfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOAP265MB9160.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:499::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:52:16 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:52:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 15:52:15 +0100
Message-Id: <DL4WZ011ISU6.30MN524IETGKI@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
Subject: Re: [PATCH v2 6/6] rust: workqueue: add ScopedWork for non-'static
 work items
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <tj@kernel.org>,
 <jiangshanlai@gmail.com>, <aliceryhl@google.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <daniel.almeida@collabora.com>, <tamird@kernel.org>, <acourbot@nvidia.com>,
 <work@onurozkan.dev>, <jhubbard@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260807165252.3849875-1-dakr@kernel.org>
 <20260807165252.3849875-7-dakr@kernel.org>
In-Reply-To: <20260807165252.3849875-7-dakr@kernel.org>
X-ClientProxiedBy: LO4P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::9) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOAP265MB9160:EE_
X-MS-Office365-Filtering-Correlation-Id: 446379a4-81f8-456b-46a0-08df0901c798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|376014|7416014|22082099003|18002099003|56012099006|10067099003|6133799003|4143699003|921020;
X-Microsoft-Antispam-Message-Info:
	VwzKfyD3LpfA27Ja+ZH8GZjYHeYiYkeQzLSBaYuVLOSyVPepvkfWJ/pv3jb7zbO6iajF2G0R8+PEm8GW/Oj3U5nHyZrdOJ2U8zn1aq0NctYRxMJKYWW45K7SBMzxux/V3kvJILAh+BFH1lP+VsIseB+3BB5FCofEOQu1Bda7ZYLSNN3AZn7Vil1ib5a33abeXoFg9m7saI05fscosAT2657dV+pKUYdMEWOOTiIdJNySF8zRAg1vaqS/Qxdx9ZwVtK4T9YSLDuJBNxPLcBBSmxCOB0EV2hiI9Qb+GIAaeFHtkf7uYnT4B/loa+rPuSRxi4etxwQh7m3i1p3FfrHvDFleY+Qwb+oEpUwOFiX1UuBo0PM6NECJOPtLMXBfsJRfGFugy6eaSsP3eMPh4nY0vzvf8p2yd8ER/oBox67XXilgdbmMqq5cnMnLy11a2wDUX5S4J7vzdJTPBHUN7cLg5DlhxNsrcrHugR1asTrPYWMz/3VvadmDTVlCtBhNT+beX4hJsTzNG5E6dkG2dzqDDl8nhVDd+Ys8JwX2yWVdLSVsQNVgLmZyuRHauU4wOTp7zKHLAQCqH67y0n9bFP6MmQUnLUQfgMAMNv4TTg4fVFNhqnKG7HBIwOwJ1YkhyFUfimoSZGkg/pqgfE3GjbM/LJ+94hVyW1R2nuBVDm/4Gnjj3P6N7DE0ty4gR0KUbylqVvrFp9FQfB+59EGVs6NXeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(10067099003)(6133799003)(4143699003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzJ0SmRrY3dKM0s1dTZmcmVoWWhoVU9aRTR0cVgvTlJvaXR1L0FRS3R1WElk?=
 =?utf-8?B?Mm5nWWFvUW5YYTI5d2FQNlJsT3YvaDRrU3o5QnU1TWZRRkdZZ0xmaWtuS0hY?=
 =?utf-8?B?WmthZm1KNWNtNXJML0Fhai83Q1hvcEV1VElnSmZMdk4zTndCNzBpRDFRM2Rs?=
 =?utf-8?B?Q2tydW5yajdXeTB1OVdqS2JMdlV1VVBHMEVRSkh1OTMyZzVVTWhBaXh1KzhS?=
 =?utf-8?B?cFd4R0w0NGppWnN2RWJrK3gwNkJzWk8wTzhzVDl5ZVBqcUc0QWo2T3Rqb1N3?=
 =?utf-8?B?ZjMrM2xGOFVtMnNnV3c0NjdETXJLeGx4YUxKZDltdy9aaitpVjExS0ltTU9Q?=
 =?utf-8?B?V0tyejB0OW9LSEM1TjJHODlJK2d1SHV6UDBnLzJiOXJZRHBrNFJqMVNrblA2?=
 =?utf-8?B?LzJGR1ZwOTBWZFVzdEUwY25Gbm04ZmJWVjZsMkxRZ1ZvTTlqVWpMeXN0alZ2?=
 =?utf-8?B?ODBoTmFxUHNCcVg2dHZOOW5MbEFnMHNNbFBPZnFGeXQ1aXU0YStpdHlpMHRa?=
 =?utf-8?B?UndYbEpMQloyOWtXUThGa3RPN1ZEOUR2Y0tNdlZRWFExUmMvUFhqcTdtdFU5?=
 =?utf-8?B?cE83ditHNUdEQ1BSTHZFWTRkQUt2c1k0N2xrK3J6YUFqZS9hU3BGd0ZuQWp2?=
 =?utf-8?B?cVZRQzMxN3hLVjFNZFNQeGROMTZWUkRRWWZZVkdKeVl1S3JDMm1nTVZzOTg5?=
 =?utf-8?B?dDFwZURtRVlmQlZVK2VhRGo2Z3lldGorMGpiZy84d29zYlVWOEpuVWpEeE1z?=
 =?utf-8?B?eXdpUm0yRGtRa1ZRVzNBNS8zaXpKeHRpQlRmdGNJVE5mRmRyb0luWTZobjNw?=
 =?utf-8?B?NWZKS1dLdGI2bTJHb09DQ0ZKdlZPRlkvaDJNS1VtNHpqWFY0OUV3N2ZGeFlq?=
 =?utf-8?B?Nld5MGp2azY1N3piK1E1aXlobGdiS1pzOTJHSnJGeG9zeXFFZkt3VGx0LzVt?=
 =?utf-8?B?ZTdka1QzaFpaU1BZMDRYbDJ1REZJK3hQNWZ6ajFVWnQ3RjNSakg3U2tJQ2pD?=
 =?utf-8?B?enFoU1c0K1hWTm5qTy9QNG9uTHVwRC9lMUw3ZXoycnJRRnBma1hvZGYvdThr?=
 =?utf-8?B?UFRwbEhoUDJyb3FoZ1A3ZC9vWDRVYkQ4QVV0WFRUcHI3SjI4SmwrOGJaaFVv?=
 =?utf-8?B?Q25NQWlDd1FTeW1YUnlGVDZIcitrRCs3aWZWKzNDcmxvcmpTOTJCdkl0ZkRZ?=
 =?utf-8?B?QitOOVh2RU9qUERZWTNhQUNXV2g3N3NDOThVSk1NdThvUUZzczVYY1VTTHdn?=
 =?utf-8?B?NE1sU3NsTXk5alc5ZFIrOTFsdGxWUWVFL3VBZkorMjNCU3R0M255ekxPeUJx?=
 =?utf-8?B?VnJUdXZFbjZlbUVoZElIcHVENm45UnFFOFlNa2xPQnEraDVXRkc1SVZIUWJN?=
 =?utf-8?B?OXlST29EdmFiUDhoYWtKKzlYWDV6TndSNDBPb0NLSzhNOUtybFJwMElibjhp?=
 =?utf-8?B?R0FmWjFVN0x0ZlJpaE1icDRJdlFqZWl5U0swSlowUXJtWHUzOEliZTIyNnZY?=
 =?utf-8?B?TU9MLzNFNEd2SytIaStuaGVETUNKRDJ2WkdUc1RaY01pdHFaZ1Rxd3UyTnRW?=
 =?utf-8?B?RHhlVndweWROakRhUjFRazh2dFp0NENoSE1VOW0rNGRxNEw4bkdYZklUL1JM?=
 =?utf-8?B?Wk9EZWp3NUNzNlYwUXpUam9YT0pEclhRTG9wVmRRa1Bsa3JHbHBnRzZPd1l0?=
 =?utf-8?B?Z3NBV1JWQW9rSWZmNG5SWkxSeG9oUTBrY2NqbXAwUHM5WE5DUnQ5aWdyb0RC?=
 =?utf-8?B?QS9pK2IwblNFbjEzQnpZdXQxc25mL1Y4VnhTUDkxR1YyT3RDbU52UU9PMFJE?=
 =?utf-8?B?K1VlQXJudkVFQVNlblVuUHNCeVBSKzV1QjZTODBrRnkzT3NLclRqY3NPSXBJ?=
 =?utf-8?B?cHR1VVdzcXBmd0J2Wi9uZUlwYXdYUnU3elg3cEZrQ1U5ckFWUTFpQVBvWUFy?=
 =?utf-8?B?TkMrcjdUc0w2Nm0rQXl5TmRndDhqcC91QXg5STFieXNDQ2tNOTFtQnVrZXBs?=
 =?utf-8?B?emVjQlpXNFRWWG5BVlpqYm95VW9Jb3JPTnZuaUdwOS9OMXZIdFJhMkdlQXVn?=
 =?utf-8?B?RVFPWGNNUDQyazlXUEQzbW5nOVdZWmcxa1hqVk1ER2hmYkxOZmZCYTZvUVg1?=
 =?utf-8?B?SS8zT1RoM2FSTG40QUFXVE9uSXhVNE1rOEt0YTVTbEttTTJ3WVc4eUtZTDNv?=
 =?utf-8?B?aHdncm5xOTR3OTN2YmQybGViNUFHNFoxOHE4djFtMlVIOUhmVGtacUZKQnNo?=
 =?utf-8?B?RThReFV5aHNUTzJQamFhSjJWTWRMaHZldWpDekl1REdXaUxXOU9ZcHQ1a0Ew?=
 =?utf-8?B?YjdyekkycnJQVDFCNVJ4SDdPVFFsS1ljWFVmeWl1VGdncURWMFZIUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 446379a4-81f8-456b-46a0-08df0901c798
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:52:15.9556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzjlC80tYFpCIPuR4q1Ae7Bw+peX+n9SdzdM/2IcS8bx7MN8kr/wyVDJn+mo6EGiJjDvBkUyvqUgeJ0fc+KHzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9160

On Fri Aug 7, 2026 at 5:52 PM BST, Danilo Krummrich wrote:
> Add ScopedWork<T>, a work item wrapper whose destructor calls
> cancel_work_sync(), allowing T to carry non-'static lifetimes. Ownership
> of the data is not transferred to the workqueue; instead, the
> synchronous cancellation on drop guarantees the work function is not
> running when the data is freed.
>
> ScopedWork uses the existing Work/HasWork/WorkItem infrastructure with
> NonNull<ScopedWorkRef<T>> as WorkItem::Pointer for the callback path,
> and implements RawWorkItem for &ScopedWork<T> and &ScopedWorkRef<T> for
> the enqueue path (requiring T: Sync for cross-thread shared access
> safety).
>
> Two enqueue paths are provided:
>   - Queue::enqueue_scoped() (unsafe): the caller must ensure the work
>     item is not forgotten.
>   - ScopedQueue::enqueue() (safe): when the work item's lifetime
>     satisfies the queue's 'scope bound.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/workqueue/mod.rs    |  46 +++-
>  rust/kernel/workqueue/scoped.rs | 442 +++++++++++++++++++++++++++++---
>  2 files changed, 444 insertions(+), 44 deletions(-)
>
> [snip]
>
> +impl<T: ScopedWorkItem> ScopedWork<T> {
> +    /// Creates a pin-initializer for a new scoped work item.
> +    ///
> +    /// Use [`new_scoped_work!`] to automatically provide the lock class=
 key.
> +    #[inline]
> +    pub fn new<E>(
> +        name: &'static CStr,
> +        key: Pin<&'static LockClassKey>,
> +        init: impl PinInit<T, E>,
> +    ) -> impl PinInit<Self, Error>

This should just propagate error and return `E` (you might need the `? E`
annotation for it).

> +    where
> +        Error: From<E>,
> +    {
> +        try_pin_init!(Self {
> +            inner <- Opaque::pin_init(try_pin_init!(ScopedWorkRef::<T> {
> +                work <- Work::new(name, key),
> +                data <- init,
> +            })),
> +        })
> +    }
> +}

Best,
Gary

