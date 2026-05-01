Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEF030C34E;
	Fri,  1 May 2026 17:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777657678; cv=fail; b=SoVgNmszdN8q+Dk1Qdc/v5aT5yu7eLr5EkSBblLMrWM4jRCo/BIRvuEHS9+XbbTuCsEXxA72qQCWGVvpvQnTUlSAoHgKfSCO4ctbl82mV3tll1h6FX4Q/kT09HuL9CcRT3k5dY8Qr/gYDnCxNNdIUM87tQ6TQekzhunwVgGGV9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777657678; c=relaxed/simple;
	bh=vZTxZ1ZXadrjAm2Zy57CTUhrNXvQN3FZiZIMEypk8Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AUX6AD7sTbqIJir7IVUW+LG/qSpOolba03vM0REnJDFQ39+FGhdQTBJawm8C5WBBOBsGkpRIIIZlL2sC6n8bD0SN3+PENHj5jmMy8cV8B4oVizGjuRcy311JHcQgDL1iUrwZSDszynXXsbnoGCGZoKPQy7g9aVE3LpAtpto0FhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=haG0Frld; arc=fail smtp.client-ip=52.101.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="haG0Frld"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD1qk6kOu8bgLfcnwu6geaWRfInqaG8qR78ht2s7QFyOJqbHGdzrd3DFSRk9gB4/HmxPNu4+5ybMxaRcS9MW+ldWKh6TGsoSbCE0JVd0IR7FVzI9MdsJ7X8lBvWKu912oa4o9MvZvzB6X/pdmePnW4Ym8/UU/rd5vnFOnozM3L3vWTfLoIKm+BiRnSZ8u6zSM+IuuWfWGa51dP5Ju+fz2bPAlpUqEPnLZVZ03t6OwHQxCn7iBCiNLa/kD/5WN5Q1ZmZ8qtp7+HtzR9DItbiwrGixSqfr7Y6sF/9MObTFzg8fid5GWI4aPWOlcYEZc7cP17YeNqwH89fXXTbNJoJSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jB5ekkYe3diTiGARMeqxSlAGvvZUu13jfwA3MmHtn6A=;
 b=oJyRYfvLRexKCQyhlajW5apH75jw4+IxdB/y8Uo2kdC7YdHfAEDD80HR6nlXXghFtPsanaCcTWSBZqqvFco8RyiqQsKSpE0Dq1BLwhCP3YW7qn8IVOgFdDd1h6YI7TEzVvF6uBiEPOIglpb3XH2bbNWte5UjMsda36U49xMnzRO+a/K8NP1qVVUHIE/7Tv834aINwJiJjFK4k4DfEIIHtvH9EQ1evCYiUXAeQBahZ2NzdvLrlBijX33n+KehprGi8E+1MH5EqNE/lgyYS0cUp86XcWaSabzGm4bkMr85YIWp4ZM+rLa9OyZXRvFcrCZt5iHyqdA0K04W/OEB3e6SUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jB5ekkYe3diTiGARMeqxSlAGvvZUu13jfwA3MmHtn6A=;
 b=haG0Frld/IZuAmxA3qEa6GgK8BWrjT9Yjv61XeMEixdp0GyfZpJaRFLJnGlyLU1NOL0EvhnvIdn/4AM+eUFyz9QNXFHOYLMkW4zqP5tsVg0BNStrR+QluD3uIODHQlZk9jRJCTyAOdc+bo6AL9QQkbUqJsoN/2Q8X+t5prHgF+ZsIvClgg6HjY7xWYOh9gGsscAee5BRAlQWYcicnp8jNosq6y97uhE1rS0sp4Pt6AQjNhlh/zYwddCcLOMdh8zV7duUGaD/v8bTChToiQx4jzNb7+xpS9Q9h2p0cyS4eoTuq7OJ0bEwEbsW4D6D14FUq0+rwlL/NOgWsWmvQ8Z9Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by DS0PR12MB8069.namprd12.prod.outlook.com (2603:10b6:8:f0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22; Fri, 1 May 2026 17:47:50 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 17:47:50 +0000
Date: Fri, 1 May 2026 13:47:47 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev, driver-core@lists.linux.dev
Subject: Re: [PATCH v3 3/5] rust: io: use the `bitfield!` macro in `register!`
Message-ID: <afTnQ1KCyybUE3pH@yury>
References: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
 <20260501-bitfield-v3-3-aa1076c3337d@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-bitfield-v3-3-aa1076c3337d@nvidia.com>
X-ClientProxiedBy: SJ0PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::26) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|DS0PR12MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0f82af-c018-4296-66e2-08dea7a9c346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7wKR87D0NBlwvLaWQMlKoVphoB4tE+3GXeOLJs4BVWJIlf3SPVK41HIp743OlzLerJcmLt69X+A/GngmFAQ/GbAUh64DAZtQH6I8a5AvbwTpMdQSx7RcjQJ8hZpqEgcROaZEsz2hijlThIRnDwbufZvjmP8IlzZIFfMKxcZnhTxv8afwR/DvGpXd3xduHiHn96eXl3SZ/wLKFeQZJRUhQ1DFnF5Vuff0TownDkHU8YFB0jlJen0NuXqiM3mJpXzUzcY5IRlP4bgNHfYIILxi8UrvKx2G8ts+deghENj79vWRw4ideyWX0uymfgVvA48SoGYkExApfxahGG8pHpnri6wsE82kghMdQWlpbvKRvPm7UaWRk3ZXTVx8M+N51Eq+87rRvVSSkTa8LAhRqj7scHho9yM2J8aNMvnGEb/+3H3ldBvjd0D/tWhGCt2enJQWyyo13JeoBXIW1jnNdXw6n3jyQsszPEEPwXJ5jKxfrwbXr4QXEY5KqT5hnmrP68hWi0gTSMl8t4kQPDa5dEQKKy0Z6d3hYN9s2hWqpo1T7Et9OQq5GGIhgY+pfGxQs5Jq+aSaADhlIuy+ui+TGa0XyYsg9QUi0n0OnZhuy30Qbzjts5OCFct4/fnRW8V1TTgp47IZ/fCqN3+5QBjS72TJE5RES8uMnymU8UpgwxvVKZNXnuDjWXv2AeNw2AWZVJg3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D+Ldxn0Pna0lQ0AA9gRlEqBs89B2poaxmUaZHw9qERcozIEqs4KJb1v7zx6x?=
 =?us-ascii?Q?4m0pIqcbTiFDlej4Gr5hxfssApE577+aQIjsNVpOWdXfdE3DEYjuCSbga+B2?=
 =?us-ascii?Q?G9BkgPJ8c6nkxS7GfnVtK5AghyakpyWh6F26zhVHKU8Nm8aim5atXNBhksby?=
 =?us-ascii?Q?cGtATwHwhIUlhY2E82MVO6Z8db2xszCqZbixfI1XiwqgYb7BFty7JMw2TzOw?=
 =?us-ascii?Q?evXC9SYFb0bqnooMMvTUHPSj1JuTJLjQkoyRo2IV42SfH9Q/B1sTeyxJxXEx?=
 =?us-ascii?Q?Okceko1Mg1AgXAw3DnUPPGmV7mfkhd33oO2K2/4wFm8szmD8Dhcwxwd8x1YK?=
 =?us-ascii?Q?4VBTB80sMXZbvClaNCnV91I6EJQ2jMxLuEWvE7ElaNcPwtcGbO6JFolEMJdx?=
 =?us-ascii?Q?OE9TKZuycMHfh2UYZb6Rqdjm5ZIuB5VR/IXy+4eaAY9vOyFzbyoO9rRmgUkP?=
 =?us-ascii?Q?hO/3ERFmKsOqWBzdZQVdcotzdS+nXf/iTZ9cc6oJj+9qaL8wegcLY5GwMFQd?=
 =?us-ascii?Q?/bJ1hOyF1GqEYjzUjuBKVGscqsDnk6tdZUl1gBobxXpyk1OdnXk8ZZiJoBUy?=
 =?us-ascii?Q?AZ5cIzol7GV67I7Wj1Ov7yIKUmt8wmVZAcI7Wn4t6KASiEXuoWqemFZ33Cez?=
 =?us-ascii?Q?iCiNqMemnJ1r3Jdf5S8hHVw4/Cfq9qFJypBiVAx5Tst8FSpyhx0I9bDHTlPe?=
 =?us-ascii?Q?SeiGm+6UMMU2v/sZqJNaR2ihe7JvLpbrbA8hymAkMhSvPC8BumCLD4sFsIKp?=
 =?us-ascii?Q?T0GnWhibY/SBTnxcqTCGZSAJavJrad5S1ajtmDdjuQPshyM+1G0DVj744vmW?=
 =?us-ascii?Q?Ua7cwq+uu+k45fzlH/bb67OtXWPqh3XXh80j5EN7CMFTVr2cK5UnEwYegFYm?=
 =?us-ascii?Q?be+4hPzxM2tpWsBSmoG4uqMWCPIqm+hMOGXAboYKGEqu52u0UFg7H05sQUMa?=
 =?us-ascii?Q?FDhiZqjZpLMeKtFChaQ+WwRNhYJDL1byeig6V72qf76iuPr/DNwVqIQfXqzW?=
 =?us-ascii?Q?6S5HoCmDyfp0FJju6gAzsvxtIr86bpv+OkFLzy7QP2QulkHLXSz2CPulbUqD?=
 =?us-ascii?Q?VqKAsbm93SDOVYX4nTgCM6sbgEr3MDpa/PlR5Cr8jlIwW2ZhU51EkH7GOu+u?=
 =?us-ascii?Q?0pO6DE/cUmAZiJpP8AYZRac+cpsoOBwZJ0BC76SXSxXoS4gLmv64zr7JLBmH?=
 =?us-ascii?Q?8x+zusufm8livLpCBowekkvGLwf+5vxodZpboXF9RPrjTzrmcBHbbRF2OGR0?=
 =?us-ascii?Q?pJjI4w2ZSN88Ruo4lqR/1bXm5+RrulsT8fNbKSbnwBG7FEzQKq2d2zb+Y6QC?=
 =?us-ascii?Q?WTyY5DrLKEUq3T4opWjSYsCULAAZVidz2LZtiz31RDwnRAvndnt560sICW0r?=
 =?us-ascii?Q?zY2sn89drl0hwu/8UHdMPEBoknVAMPQjgok13KeUyA/QNXYblbCiudzWAuY1?=
 =?us-ascii?Q?arrP/tfcgZiFDDU4aLAo5E63590K0kcdgFNRwC8G47bj6h/8TZUA/hyIIJA5?=
 =?us-ascii?Q?nO6qloA6JH4k9KU1OMwal82xZYEajh3gQ6kpLJzhuIPTznpivgI5sT2E19xz?=
 =?us-ascii?Q?pZiWbvOeIZhT/DMS4oLG0VaW7NBr51IJ/RYMwUIl2FlLqtVQwROlmcrD9qO8?=
 =?us-ascii?Q?2oYtAxdMl2h2BXlfI4/8k51WhffDxAtBs0pYVwIxmjpAtJGW5M5B9sHnM6hy?=
 =?us-ascii?Q?WZpZV4ylidCFejB4YQAGZ8rWYu1LjXL5nOHFlxDt9t65ncdtkfF27Zkh4aqZ?=
 =?us-ascii?Q?0rS3r6u6hPertj4ZSFo9g8okHCX+Y9MzY0i/pl25KeKVfvhV0S6B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0f82af-c018-4296-66e2-08dea7a9c346
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 17:47:50.2934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaXgGur0J4R0ryBbGcj0kFB5KqkfBKlDjvKzSetDeDQYoTZlt5SJRs2S26qRJnMlBizH0DjfkxrgpeWnzg7E7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8069

On Fri, May 01, 2026 at 03:03:20PM +0900, Alexandre Courbot wrote:
> Replace the local bitfield rules by the equivalent invocation of the
> `bitfield!` macro.
> 
> No functional change should be introduced as the `bitfield!` macro has
> been extracted from the rules of `register!`.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Yury Norov <yury.norov@gmail.com>

If it comes to another round, maybe split switching to a bitfields and
getting rid of the bitfield_core? For maintainability reasons.
> ---
>  rust/kernel/io/register.rs | 246 +--------------------------------------------
>  1 file changed, 2 insertions(+), 244 deletions(-)
> 
> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
> index abc49926abfe..388647f28292 100644
> --- a/rust/kernel/io/register.rs
> +++ b/rust/kernel/io/register.rs
> @@ -956,11 +956,10 @@ macro_rules! register {
>      (
>          @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
>      ) => {
> -        $crate::register!(@bitfield_core
> +        $crate::bitfield!(
>              #[allow(non_camel_case_types)]
> -            $(#[$attr])* $vis $name $storage
> +            $(#[$attr])* $vis struct $name($storage) { $($fields)* }
>          );
> -        $crate::register!(@bitfield_fields $vis $name $storage { $($fields)* });
>      };
>  
>      // Implementations shared by all registers types.
> @@ -1016,245 +1015,4 @@ impl $crate::io::register::RegisterArray for $name {
>  
>          impl $crate::io::register::RelativeRegisterArray for $name {}
>      };
> -
> -    // Defines the wrapper `$name` type and its conversions from/to the storage type.
> -    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) => {
> -        $(#[$attr])*
> -        #[repr(transparent)]
> -        #[derive(Clone, Copy, PartialEq, Eq)]
> -        $vis struct $name {
> -            inner: $storage,
> -        }
> -
> -        #[allow(dead_code)]
> -        impl $name {
> -            /// Creates a bitfield from a raw value.
> -            #[inline(always)]
> -            $vis const fn from_raw(value: $storage) -> Self {
> -                Self{ inner: value }
> -            }
> -
> -            /// Turns this bitfield into its raw value.
> -            ///
> -            /// This is similar to the [`From`] implementation, but is shorter to invoke in
> -            /// most cases.
> -            #[inline(always)]
> -            $vis const fn into_raw(self) -> $storage {
> -                self.inner
> -            }
> -        }
> -
> -        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
> -        unsafe impl ::pin_init::Zeroable for $name {}
> -
> -        impl ::core::convert::From<$name> for $storage {
> -            #[inline(always)]
> -            fn from(val: $name) -> $storage {
> -                val.into_raw()
> -            }
> -        }
> -
> -        impl ::core::convert::From<$storage> for $name {
> -            #[inline(always)]
> -            fn from(val: $storage) -> $name {
> -                Self::from_raw(val)
> -            }
> -        }
> -    };
> -
> -    // Definitions requiring knowledge of individual fields: private and public field accessors,
> -    // and `Debug` implementation.
> -    (@bitfield_fields $vis:vis $name:ident $storage:ty {
> -        $($(#[doc = $doc:expr])* $hi:literal:$lo:literal $field:ident
> -            $(?=> $try_into_type:ty)?
> -            $(=> $into_type:ty)?
> -        ;
> -        )*
> -    }
> -    ) => {
> -        #[allow(dead_code)]
> -        impl $name {
> -        $(
> -        $crate::register!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
> -        $crate::register!(
> -            @public_field_accessors $(#[doc = $doc])* $vis $name $storage : $hi:$lo $field
> -            $(?=> $try_into_type)?
> -            $(=> $into_type)?
> -        );
> -        )*
> -        }
> -
> -        $crate::register!(@debug $name { $($field;)* });
> -    };
> -
> -    // Private field accessors working with the exact `Bounded` type for the field.
> -    (
> -        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
> -    ) => {
> -        ::kernel::macros::paste!(
> -        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
> -        $vis const [<$field:upper _MASK>]: $storage =
> -            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> -        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
> -        );
> -
> -        ::kernel::macros::paste!(
> -        fn [<__ $field>](self) ->
> -            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
> -            // Left shift to align the field's MSB with the storage MSB.
> -            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
> -            // Right shift to move the top-aligned field to bit 0 of the storage.
> -            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
> -
> -            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
> -            // output type.
> -            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
> -                self.inner << ALIGN_TOP
> -            );
> -            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
> -        }
> -
> -        const fn [<__with_ $field>](
> -            mut self,
> -            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
> -        ) -> Self
> -        {
> -            const MASK: $storage = <$name>::[<$field:upper _MASK>];
> -            const SHIFT: u32 = <$name>::[<$field:upper _SHIFT>];
> -
> -            let value = value.get() << SHIFT;
> -            self.inner = (self.inner & !MASK) | value;
> -
> -            self
> -        }
> -        );
> -    };
> -
> -    // Public accessors for fields infallibly (`=>`) converted to a type.
> -    (
> -        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
> -            $hi:literal:$lo:literal $field:ident => $into_type:ty
> -    ) => {
> -        ::kernel::macros::paste!(
> -
> -        $(#[doc = $doc])*
> -        #[doc = "Returns the value of this field."]
> -        #[inline(always)]
> -        $vis fn $field(self) -> $into_type
> -        {
> -            self.[<__ $field>]().into()
> -        }
> -
> -        $(#[doc = $doc])*
> -        #[doc = "Sets this field to the given `value`."]
> -        #[inline(always)]
> -        $vis fn [<with_ $field>](self, value: $into_type) -> Self
> -        {
> -            self.[<__with_ $field>](value.into())
> -        }
> -
> -        );
> -    };
> -
> -    // Public accessors for fields fallibly (`?=>`) converted to a type.
> -    (
> -        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
> -            $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
> -    ) => {
> -        ::kernel::macros::paste!(
> -
> -        $(#[doc = $doc])*
> -        #[doc = "Returns the value of this field."]
> -        #[inline(always)]
> -        $vis fn $field(self) ->
> -            Result<
> -                $try_into_type,
> -                <$try_into_type as ::core::convert::TryFrom<
> -                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
> -                >>::Error
> -            >
> -        {
> -            self.[<__ $field>]().try_into()
> -        }
> -
> -        $(#[doc = $doc])*
> -        #[doc = "Sets this field to the given `value`."]
> -        #[inline(always)]
> -        $vis fn [<with_ $field>](self, value: $try_into_type) -> Self
> -        {
> -            self.[<__with_ $field>](value.into())
> -        }
> -
> -        );
> -    };
> -
> -    // Public accessors for fields not converted to a type.
> -    (
> -        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
> -            $hi:tt:$lo:tt $field:ident
> -    ) => {
> -        ::kernel::macros::paste!(
> -
> -        $(#[doc = $doc])*
> -        #[doc = "Returns the value of this field."]
> -        #[inline(always)]
> -        $vis fn $field(self) ->
> -            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
> -        {
> -            self.[<__ $field>]()
> -        }
> -
> -        $(#[doc = $doc])*
> -        #[doc = "Sets this field to the compile-time constant `VALUE`."]
> -        #[inline(always)]
> -        $vis const fn [<with_const_ $field>]<const VALUE: $storage>(self) -> Self {
> -            self.[<__with_ $field>](
> -                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo }>::new::<VALUE>()
> -            )
> -        }
> -
> -        $(#[doc = $doc])*
> -        #[doc = "Sets this field to the given `value`."]
> -        #[inline(always)]
> -        $vis fn [<with_ $field>]<T>(
> -            self,
> -            value: T,
> -        ) -> Self
> -            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
> -        {
> -            self.[<__with_ $field>](value.into())
> -        }
> -
> -        $(#[doc = $doc])*
> -        #[doc = "Tries to set this field to `value`, returning an error if it is out of range."]
> -        #[inline(always)]
> -        $vis fn [<try_with_ $field>]<T>(
> -            self,
> -            value: T,
> -        ) -> ::kernel::error::Result<Self>
> -            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
> -        {
> -            Ok(
> -                self.[<__with_ $field>](
> -                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
> -                )
> -            )
> -        }
> -
> -        );
> -    };
> -
> -    // `Debug` implementation.
> -    (@debug $name:ident { $($field:ident;)* }) => {
> -        impl ::kernel::fmt::Debug for $name {
> -            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
> -                f.debug_struct(stringify!($name))
> -                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.inner))
> -                $(
> -                    .field(stringify!($field), &self.$field())
> -                )*
> -                    .finish()
> -            }
> -        }
> -    };
>  }
> 
> -- 
> 2.54.0
