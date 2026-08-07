Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013041.outbound.protection.outlook.com [40.93.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554143AAF7F
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 01:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786066704; cv=fail; b=TXCb9UF205utQ310s4AaGYzH3SgJrQmYwUCBrJPHmJOFzWH5UQ69XqvcM7IDKKqc0J4UtQH5sGK5jBERZ0OrG8uUGa0AkaSwAH+AKww63y4ywz/KPfS10eOClu32wXxTBg0aMjFF7qnF5K7QJHr0Bw8DYIDlcHstDVsL6/RfYl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786066704; c=relaxed/simple;
	bh=dh5uOVVF9wrTGX8dFTlUwUEpeCqcLPbDmwZPFQCEl4Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sq6leKXGiKp1dQUdO096YrVhkMV8jL3a0iPUW9AQNi7pZuffxr4VzQHvpQxq/k5JXdvkdrwAUvr/n/1iY0pysa1K3N1CVnZYjdckhgPYV+RHWZEq7Fnw8jXhR4DSlq9vBEU28n3D5svk8pe6X1xnFTKeJdz7IjbHpM7RmgRV+24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W+uzjGAB; arc=fail smtp.client-ip=40.93.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W+uzjGAB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqtOVb7RBfc3IhWAwrzgvB+mqwu380+jtRPq6AvQT9+Q57MQ6swLBaRsC6rCtlRqZ8nuiFhkJGvxi27Z1+v4l6pUlUTnjyuPx30b5UckNIV09JDU58xYsvPOs/tnUoxU5SVLIvH7T9gofY2/pRHh+Hqt2n/sF31Gyn5zR6oXVKVLSNlW5q9sBE2kZoYZnrYkf6CC7ti8T+kiutZGmosi0aq775h/TdsgQdsue4uN0Yk2mFqzQFar7ik1SoShGklM7os9Fo22arguPJNFvxBY6xDz0r6m+janxg13RmACTyLgfE1oycqt3f668zfXFOFwQJDVfCGyUyuLRo2mlEWZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/kFY7caVr+CJO19u4aNehB+8SuGAcrg3RX4ACfwIvs=;
 b=nI9z49gWo3PjK/YWs5g02whmSuRum8nJg2CEwXkt871u9pgd2eGQooOcG2hLwvvXrw9VlPENjM6naTZNZ69i4MinBHmYo3dmlZJDOK5CoyTNIt4gCbQ1rcc2UPGCLYYLMN6Ww9C/jh4ySWBnEXACfsA6KzsLCXh2W/89Kk+1EOWiT1OP2QziYC6WxWPVggCSs92WNlYMMN1LI8iLL2hG6OHSgliynf0E4vUyFevr3eDIUAZdprbk8w0Nfecm7xRsk9s9ZqybtC6ABpGiNAxUuE2D5k9L3R/a9uWV0qyxo7kILya761TISYTnSxZO/6xDeNstIAUldhtbL7emr2+HtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/kFY7caVr+CJO19u4aNehB+8SuGAcrg3RX4ACfwIvs=;
 b=W+uzjGABk9YL4he4y2TeNiCKpTOoMrfOrMBt2ZmlNq23uf2Zpi/qf7w/9xX4VXm+VJMlATiV5466kob52XVy5H+ythPq2TJiSV9kAd6DbIt1KPJjT87+xtzfsRN61Aolt+gSM7ENj8iU9en3GrI+p4h/ca0W/jmfbfbsb/gtpqSzFqnY7sRNwNGkE4IFWOJSDmgpwrNKi/kg9KAGYh2VjFzpWO98cGuwldPHUs5+ZAucZc8PSZW1zAppYmzTFc7eXyxKNQlrXgw2p+brhiC6D+idcMj8yGwXFFPMZCI0gCR7EaFzo6SEJVBtgURnU3KdD6AmemOI8SgJEhEzsf7sfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB5666.namprd12.prod.outlook.com (2603:10b6:303:188::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 01:37:58 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 01:37:58 +0000
Message-ID: <c5fae595-2407-42cf-8040-384699df537d@nvidia.com>
Date: Thu, 6 Aug 2026 18:37:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] rust: workqueue: add Work::cancel_work_sync()
To: Danilo Krummrich <dakr@kernel.org>, tj@kernel.org,
 jiangshanlai@gmail.com, aliceryhl@google.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
References: <20260804195248.665636-1-dakr@kernel.org>
 <20260804195248.665636-7-dakr@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260804195248.665636-7-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f25bf4-7d77-47df-5deb-08def42482b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|22082099003|18002099003|56012099006|4143699003|11063799006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	bBFh5Q9GHS7raj24NgkQOozwNrukAOEKL1mk/vZ5BwFT716Ses8MYe6xJ3CxeTMygrlx957DKVfLGQGKVkM6IeZ+WFOWNTky2OFpBPD3oiaPWlOY28xr8p+U5JYWBPLJTIVQSYHDbV/kjrCl81R6MYEdfgSHXFV/QKnYTE0d6MJx4Z9w9DjuXP7mQeu/yVbipN8qMpFAwy5E2rTmHZ+DU0A6b2z4YDsz3iL0t6Yb+vdtq5vwrQ0D6mrOLfbeU15fLj1Xyo5EoYrlBUkZMk0J3C7+XU+wor8NaNcIDpkByOFuVJVmibtfhh5jkmYtAv7+Xcc9kb6ukTVx6mPiXEr/P29nvXey1oPCIaq6KIWgAlOyzuOItIyipMBLXLQvWbDv40eH002vHf/0dR1WBrYQ4VlvEjbD23ngBPRS1I+QbmlCnpW55i6grF4jxagNnRItb3SmgP66jvn2ipdAwjFpYkMlz0UDvvTVGt6CAWZD+PfKxsLgcadWhTfEfJa8nnTFb7AAfgloAvWLelE/q7cxenaIc+YqC0UwmPHXUZt7zdoCJGyB6+hfIj3jaqG0WEbuF5+XZEFgQtaaaM7c7RGxz0bvVtcAKmG0F67Ze00KbwlITozXhgrheQErIgSxN8QfHs50WH95Ejmo498cnNs6qsUJQkiYN3lzu/1B0Pf2fT4SBbEtfuHifxocswBz/zPoAyEJfpGKg+3xjBd87qLbmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2F4blBBSEdHNVFVUU40Wk05dUtIanM4aysrOFF2KzdQR05NcXBjTWRabjBp?=
 =?utf-8?B?QUJwMlpJcUZ6VnBWWkM2WElDeUxTeTIwdlFvT2ovNzZ1cmhPQlZEYk4ycU5X?=
 =?utf-8?B?NzYyZUpZUXJNbjRyNjNPbG1abmNmalE2dzgyL1RjWTZCa3ArOHpIYVkxenlZ?=
 =?utf-8?B?bHpjY3lKeE4reE54bzFma0Y0aHJmVCtabjIrNkJqVUpTdmwreDRKYUZkdXUr?=
 =?utf-8?B?Mnd5VHJldFllOGsxWUIwbGlKb3VsNkdKNXpYcFc1ZEtZdmU1MUsrbzFWemEw?=
 =?utf-8?B?c3lTSTFRMjA2WXNSMWVwbDdKN3lTT1VaZ2RFV0JzdXpFUm5WaktuZ09NWE1W?=
 =?utf-8?B?K0E0QmRCK3l6VysvMmxiNm9qZVdOdmxJNnpGUG4wcnRGdVRQRWlJZ2lRZEhH?=
 =?utf-8?B?NUV4Y0VKRkw1MnFwR2JVbkd1bDJoSEFSanAzRHFSLzlNUFdNWGl3WWRqS2Vw?=
 =?utf-8?B?N3VYaUlNMTI1YWtPNmF2WG1RVkhNdm1lZ3d5aklQeGpUeERXRFVEZ1ZYNHlN?=
 =?utf-8?B?eW9XYUhoOTY2ZkhnTy9sbjFIVmFrN2RndlpMWUdZaE9ySndiMnZFMHlDME5R?=
 =?utf-8?B?Z1ViN0hPV3lsbWJUY3ZoQTRrSUdPZkxhWmxQekhKOERtaVZKOFdNVkZYVlQx?=
 =?utf-8?B?ZHNOOFNkOUtSWDVjUmFxS1RxcFF2WC9jb2NIYWFBeFlCV1hETHJvaVY5WXRv?=
 =?utf-8?B?MzlraGdlM1YwRWh0UGhIVVBoMUZsbk1ZVWswUExnZkkxTWtjeWZqVm41R2FN?=
 =?utf-8?B?K3JSeWJ5UlZuNkZMTVFLajh2S2YyS2cwQms2V2cyR1JhZXlvT3VIM09sVzhj?=
 =?utf-8?B?Tmhnd004dVNPS3BuUForTG1RUnZNQnlPVjZOTmJubSs4Tmtwd1FVVDJpbDFP?=
 =?utf-8?B?T0kvbXZlelYzc3o3VFozSkRUVHdvWkFhU2wzZUlBR1U1MTQxeTJ4ZkpBT29K?=
 =?utf-8?B?MVF3KzdZeldaeDNXUUErRUtDVlVMbXpFeDFPTk5SaFNXK0p5SHoyNUxja0k3?=
 =?utf-8?B?ZG5tcmtPTEdPTyt0dmJPamR0Tkk5c0ZrRTN3L2F2a2FWQ240K2xYcElieFJh?=
 =?utf-8?B?czRheUVVWU5RVXN1c1FudzlhUzNWeHZzQzVaZzI3cjF5Zm9HbG8veTkwamt1?=
 =?utf-8?B?MFRySE8wOGloazRLVjdwdDhQQ0VxTkZsM1Rsa3ZCU2VTeC9oWXpJR3pkNHU0?=
 =?utf-8?B?MG9lOE82N3VqNVE4QWJFWDlYWFNEM1JGY0ltcjA3YWFtcjhzd2N3NzN2YkpG?=
 =?utf-8?B?NVJWRGVDanRnMG5sdEdiVUR1UytaQXFqRXZ3YmRuZWZDTVpFZE1vQjU1ejZn?=
 =?utf-8?B?c1lQdlg2YVBrN2plNFpRVHlCNkdBRkRDMmFRUU9Dd0REdTlaVWRrTWlpZTJq?=
 =?utf-8?B?TGtFOEFUeTRwb0FNZWRPU0M2T3VzS3lVVFBOd09GRlpVOWRQVllJNkg3aklq?=
 =?utf-8?B?bFJta3cyY3c5OGY2dUhvVVMzZkVLS0trSDQ2UmxCUkhwZHN5STkwTUlSd0Nq?=
 =?utf-8?B?WnBxZ3RzaitGTUpudTJXZmQzd1lZOE1NYWF6ZGZjMEhoV2ExalZ0bENGNUxC?=
 =?utf-8?B?dDNYb0dobkNoaWFETHZMaEVmQnhIVjZ4MzhsNklnMkFraHVKbUhrU1lzQlNG?=
 =?utf-8?B?b1VZT0RlMUFSeVhGenJ3aytNOUIvK2JKdWZLQVlWSFpQRnIwdmt0N0MrNElU?=
 =?utf-8?B?NGlYUXpYVXBvb05SZCttR0c2VEx3eTdiK0dtNDB4SmdmMHJ4WmRoZ3VHZHU4?=
 =?utf-8?B?bGlrYmRVZTBjb0krNEg1UkhvdVZTQ2xlako5NUx1S25iYlR0bURXNEdMTEJV?=
 =?utf-8?B?TVQ5TTlRNE9TVzd4OWFzMExUc3hhaWpRNGxqSFV4bHBsUDFqSUpCTjVUUGRH?=
 =?utf-8?B?VzM2Ty8xUTVnR1c4QzBHVUJhTzN6NWd3bVBHaEt2Ukw0SGcrVEhyaUd3MTFq?=
 =?utf-8?B?OVl0RWhHTkgwdktoSUJ2VUxVSWZURUFKYjlMMjBKSnFsaVdBaXg3bmQ1TlJk?=
 =?utf-8?B?T2YwajVzd2s0YTVhdGIydGlDalVvM0ZRYjhBMFZ0S3FBblNoWlhWSloyM25i?=
 =?utf-8?B?ckpUM0VITG9rZkI0ZWR4aFA1Q3QyUzlheitReThtVzMyOExzb0pJUEx6UktN?=
 =?utf-8?B?aWFHU1czREVDd3psQVdVR2pKZk5kaVVQQVBvSHAyN3cwRW9IdWozREdjdXZs?=
 =?utf-8?B?OEV3bmU1M0JTdm5zTUdwRUtNUXlmVlpzYzlpd2J4NG9LWk9wRVptTTlXbER1?=
 =?utf-8?B?RUhBY0l3NDdHM1A1ZTJDR0c4SmdGNXRNM1lIcjhXZkNNYnFqOGhDUXRsVkpC?=
 =?utf-8?B?V2tCN2NEWXB2WHRFZ3BwNEZLbjh5cEZqMk5CeWp2b2xLVW4ydG5Rdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f25bf4-7d77-47df-5deb-08def42482b5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 01:37:58.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Os+DN+FCf0nKXPU1S6D+td0S9N6ouTftjoi8LiUg8ZKWIwaRazy50w1H7HOFy7n9JKu63PiRu77tqDRVGlIrfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5666

On 8/4/26 12:52 PM, Danilo Krummrich wrote:
> Add a method to cancel a work item and wait for it to finish if it is
> currently running.
> 
> This will also be used by ScopedWork's destructor to synchronously
> cancel work before dropping borrowed data.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/workqueue/mod.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
> index 5de88c59b2e5..2b87f935712a 100644
> --- a/rust/kernel/workqueue/mod.rs
> +++ b/rust/kernel/workqueue/mod.rs
> @@ -585,6 +585,14 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
>          // the compiler does not complain that the `work` field is unused.
>          unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }
>      }
> +
> +    /// Cancels the work item and waits for it to finish if it is running.
> +    ///
> +    /// Returns `true` if the work was pending, `false` otherwise.
> +    pub fn cancel_work_sync(&self) -> bool {
> +        // SAFETY: We have a reference to a valid, initialized Work, so the pointer is valid.
> +        unsafe { bindings::cancel_work_sync(Self::raw_get(self)) }
> +    }

This seems to expose a way for driver writers to leak work items,
doesn't it?

Previously, work items were either run, or failed to enqueue, and
both of those paths restored the Arc via Arc::from_raw().

But now with this new cancel_work_sync(), Arc::from_raw() never gets
called. So for example:

#[pin_data]
struct MyStruct {
    #[pin]
    work: Work<MyStruct>,
}

impl_has_work! {
    impl HasWork<Self> for MyStruct { self.work }
}

impl WorkItem for MyStruct {
    type Pointer = Arc<MyStruct>;

    fn run(_this: Arc<MyStruct>) {}
}

let obj = Arc::pin_init(
    pin_init!(MyStruct {
        work <- new_work!("MyStruct::work"),
    }),
    GFP_KERNEL,
)?;

// refcount 1 -> 2, and the workqueue owns the second one
let _ = workqueue::system_dfl().enqueue(obj.clone());

// takes it off the worklist, so run() never reclaims that reference
obj.work.cancel_work_sync();

// refcount 2 -> 1. MyStruct is never dropped.
drop(obj);

thanks,
-- 
John Hubbard

