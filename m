Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE18736493E;
	Wed, 27 May 2026 20:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779914952; cv=fail; b=qJlF8rgjAba9UYxxU43GJd4oaGZkn1mjVsXp661ZFjzZum7GNi+D2N5MdwMelOX/z8CDBnO8sI0jR4W5kE5Qe3D0Rp/uIKy1/+4ZD+E4BHQ3h3k2ks/QFnFnp2lxM9K3vzfvmv/9ZKT4U85C0rmwHARnpr2n2hRM8FpSV+lSGPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779914952; c=relaxed/simple;
	bh=U8Qt4GMKsCWO/T4Yhn4uMaKtOrAH5IcqQJCBACpiR9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eL0W3SBJiLdzHUKg0lE/yCOn8i/tRoNZt8yQjBSGJYzyCZf+szn1VOjZpDm9anErVnuXZnKCxcTUxhpecTYtqmGIZJeDAVYW4JRUWUjdXgV2uCsLJhMc5+F12iTx1IUNyPGhIfeCH/uAt1ShmCyi0dOR2qIVVTIrb2Tuby4es/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G0ZZTKZt; arc=fail smtp.client-ip=52.101.46.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G0ZZTKZt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RunfoMhCtqC9AggA3FrxgAdrfnoZa0rmvGuhGUZjrx+XZh/vuyhrPqscsxXNxEbIIYOJLcjGxHGMFELYufF66a3gVwu+L22/llMixZylTYmJCfSZ46JHvoiRHs563Zg7Ifl9KWzZaYOnrWz8IfYbhQry7Lcvtz4z9+jmSQTkE1wCjZB2hiwjoeQ2mUYJZ22oAzcIZDcEwZQk4nBvX8n6+EAD2bzmyjZbfDdUCEEgljuFNmh6W+l85bsZL+JFbayXNTlzuRGX1rxHb46TYVEo43PcIG81t9a2ukxfVvTLvJKPUbqRojCIzbs/jS/XRjMCFQCxWeyRvFWkqphgf12fSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZK3lqo9prx3MMK/u1gDYlATuC6ZBlbAmDxJMvyGt6YM=;
 b=GjWfhB4FJ29WmHv94fOSEDzp10WBqHhkcMzDIsGWWqeu93fYR/S5CInlja+VCBV+y1Ov4kz3kBCqJBQ+lXoWUJg95zPdxwO1qIr/ZLn11dPMEYp4/meJ5fW9m70Zr9QwFdXzincEWgeRgAXZbVU9dCvJHP8tYKZlU2fJ4PKNnZWAmsYOPSen6aUu8AMfxS+sGxfE8/7FR7mQ1EGW1GNIKvCQ+cUIx8dkIbF/NiFj2AfEQBg78BHQNoX+7Y/66cIrECqFlpmObaEHGkLwO4f2MJy/PIGtYyUu7oo/T58Kf2//pB8HZF4Hxdyrg7w/NeCIz6OSjZUq4tp1tZo0gWtDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZK3lqo9prx3MMK/u1gDYlATuC6ZBlbAmDxJMvyGt6YM=;
 b=G0ZZTKZtAbb8cHsBDk38VEYSJUX3M/1HRKvvnKZD/ODFH8krMEn01GdDZfqxdH8aJfNyYahzym4ImGW0H/VYoWLvCzl6OdS7cw+cv7qGfa3QqDlHLeK+3OjeqwGnurKVYyOtNM8Vj90mHFjM0lcG2yLmpkMaLIG4gYDotwRYpm7ntxlA7ZSs1rMuD8Z/SXNcown8A6aZZnKz2PXxiJJ8NbrqZYwMK3y8OQAKnpVYUstzGy20tBAMzwgDNodV/kT3K2Ui5ysV7AKvaVzha+2BVtPtbWhcoOvgDowx6zUgNEVYSKJg1tmOZKfA4dVDXT9PWv/ZqUzA2SphS8MDlbi3Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by LV8PR12MB9418.namprd12.prod.outlook.com (2603:10b6:408:202::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 20:48:59 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 20:48:59 +0000
Date: Wed, 27 May 2026 16:48:56 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
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
	nova-gpu@lists.linux.dev, driver-core@lists.linux.dev,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v4 7/7] rust: bitfield: Add KUnit tests for bitfield
Message-ID: <ahdYuLtEm30T_wM0@yury>
References: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>
 <20260527-bitfield-v4-7-e8821d4efbde@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527-bitfield-v4-7-e8821d4efbde@nvidia.com>
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|LV8PR12MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d0f307-6c51-432b-d0ae-08debc31607f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	WVuvNkxScPnJgDlZ6xLvvmmqarMp6jnMI8q8kUi1vZ9LXGbPJ+yRSYxMQnJJgZkFUsmKlgxb7tHtG2nlJ3wz4q5QYpmmaWfTUd5lwv5Qle/GZi/i6ZZQVztEVae4RTMuZkEilxIRHAgNHcWWbF/AWgT1kzNVj2g+501TnhGcmzNam4OQgd4hOGb9idW47kNpNgQPF7WYG3fAf52/iL3dXiTdNZUHn/ie66BuU5rjDF0zFL4SLXjSya+xEA25rodI1+YRhlo0zLLim/nlK6tUPoOAvr/n7OrxVN82+YyJ9MzlifiQl6RDYpm1YHhRyn0pVY0RRz5jgPge/Z1+YEOM9sHv5dO2KH0Ahhjy1raiWUwV9oJT9D84AtY2wo9Kic+iLsDXiTL94GhCA1coC7R+LuxSxdNaUPdujpRhDcrOVUfU/sJiRu3qTIIYleeqgU2AQN2LOCR0XIjfP0Tdu6Mc0R/sVDXoH0oGMTHfV5xLYNdzPbo243DqvHugIK9fDH1kXT+0IopNXA5CoI+oBmpto0I285iWUZlk6P+oM4AEbt8H7dUlDsTLB6Kp/4KGAUoiYKBeT2zObdYL/tSj7OukHBS/7TeV+ElSTxAy1W9MuuyRoUbhauAGHMJIv/UqL4NVn/dDHw3F1QRuscud9dK7qGps0DpFPF7lGEVECe2Opyhu9/Ql4bFPP71rS4Jpn0Vl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?53i8dD48kf9jcE+RviqPIMU7rdO0lZnpr9FdnCp1wi+Jowfrehl7bhRFae1X?=
 =?us-ascii?Q?RA6h71zfG+qahbGyQXcFycdg9YXrkdduu5hnY7sKP8xXKP7QuEAsvIx7wPFX?=
 =?us-ascii?Q?+YKivgZXrxKIeuciGTHXxhLpk2dRZfvhxweE63vmBFFhLG0c1DxPuHK4uJ59?=
 =?us-ascii?Q?XNJ7ryWpz7eYiwV47le8mreTZAfncWRPFFprUqLLzMmA0EIr5FPlyz80om/I?=
 =?us-ascii?Q?mrdH4F6psvfGy7JQIvO54aoKSxFqW5B8JVDuu6eLVR0Baz1qaH+2jbT0vk9L?=
 =?us-ascii?Q?NjvYhn9O54XYJj6O17CaM5Vc5zqczZSKq/wkdBRTex7KnzHd5mP/dvVys3Hy?=
 =?us-ascii?Q?VETn10+3oE6wHRLiOE+IBUo58bYyxw/CpT30h7y5OAM5kchSDyq0SuE7f6pm?=
 =?us-ascii?Q?T/Gv/G8AZoQ/DBq0Zt1C0tq21Ut5RlNXtOmTgnYnnCN4xGEkIcliZ4NebSYs?=
 =?us-ascii?Q?P7GFxAm2dzEKTrHazg1FGBIG5S1gnSxGQn7kBulcvFcFmaGurIQrlCgHelzW?=
 =?us-ascii?Q?zTVV+J3/OiUW5MTZKZzKlXF3OGpE26ZUPKU8k73GLRyCCIc1vhp2WkJYPiCx?=
 =?us-ascii?Q?ESbHaJW0fQB7Qi58iNg9fRAYFCVFrISpJfcTRSweLJrPFEfHWcqDrHM4Fuwh?=
 =?us-ascii?Q?QJc1z7tArzgvEn/7skEPTahpE0pZCOFTathqeh/2lGz/dHeUGoI39hPra3Km?=
 =?us-ascii?Q?HglqR9gzfue123JYZbzAdhunJl0+f3wXJVvl1/lRzDXB4ykQ2Pfr5ZbMfxMF?=
 =?us-ascii?Q?yBL9bn3OSehIGMR1iZYVDKb/5VbSiU2P/tHsSW0zKikSGdYxuDo0H7k6JCjD?=
 =?us-ascii?Q?5aYXX+XYl1B36EOl/PaAkOb3TW6wZyoHeTl0XrmVmoC/AdFIMiGuUvyWelge?=
 =?us-ascii?Q?AUpZ5hPad66SfVNvSTkHUzPeARWRNFzF8duqWilt+Q0mIe91CN71r56DVjXz?=
 =?us-ascii?Q?zghx/IvC42pYHsPo58vj/xnDAPkEjL28/fgXPLR+eyfx84CTYgFDlSjtguov?=
 =?us-ascii?Q?8BCboPGF8e8qvEertSScHBgJpTa3C5QtTzJcJfdLBCttjumoW9vHR/aX/bYO?=
 =?us-ascii?Q?RlzWVdKF23IJg1e3OzMet2xNfb1pWshc2M+eiaBEkmXQ6GNWqmh06rfdtvOg?=
 =?us-ascii?Q?hgdRMev0tn2GaZLI0BCUICy5IZ+rxiYbpl3CVZYs+qbUYK3AIAZ2COwF5b1O?=
 =?us-ascii?Q?nHwVAxs4isWRB8TwQvLeIT+eUtrllp7RCCUSg5XZX4iWQdsVFpJs7DVKFt+K?=
 =?us-ascii?Q?6YeBYWMdzCmjjRs4Nn6k0NG0ivEuqZgFUDYjfEiFaRdI83TKG6Wn8pwQtOml?=
 =?us-ascii?Q?T86jlk72yHU4POM3U6XVtyeHm3D0tVmEaPOJcqmRlI43zEJESFdjtjG0NN7H?=
 =?us-ascii?Q?X+g3MxCLmsP1AOke7URlT8lv2sfXJWtnZ2VeI/HC+GXpezXCuOYDw2dsGVq9?=
 =?us-ascii?Q?tyTPgnwXOhxWut7tLrrR8n1VAuK7wAtgiZCpXzljb+uc5VZzZoloK5UJrmWL?=
 =?us-ascii?Q?funv8YNgJhSPw/u7LcSS1+kvnU2e+2GowKjHUSea7g4Om8/FVJK+zA/dMqHS?=
 =?us-ascii?Q?uS/7mX0atdkPgT4U44vuGMpnl3GyAvnV8pSVgvsy63gxFZBJJoCj66YS/7vh?=
 =?us-ascii?Q?PWBVC8aiiqlhcanqvekm68Wbta96H4cTpCcNc15arvvIwdxptkmoVulOLApw?=
 =?us-ascii?Q?XEde1Oj+gUjlZAFyLreXH7nR5udKbEJgZxU5uupvqQyKcDgDz2Ici2xPMH8p?=
 =?us-ascii?Q?b9C6FQ5k/Z6SX1Yiuyb0uJ46Bjdpcjd3utzQlLcB5/JxHpXb1ut7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d0f307-6c51-432b-d0ae-08debc31607f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 20:48:59.5418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdfZ13jn/suGAdX+u6/k/YtGO8DIHmub+hx+6hHMihZCwJSa2TnL7SoDeGsG25u1ayIZV7Skr9RzfQwMcPLPeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9418

On Wed, May 27, 2026 at 09:52:01PM +0900, Alexandre Courbot wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
> 
> Add KUNIT tests to make sure the macro is working correctly. The unit
> tests are put behind the new `RUST_BITFIELD_KUNIT_TEST` Kconfig option.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/kernel/Kconfig.test |  10 ++
>  rust/kernel/bitfield.rs  | 315 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 325 insertions(+)
> 
> diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
> index fc47614e6ec9..4fc6dc978101 100644
> --- a/rust/kernel/Kconfig.test
> +++ b/rust/kernel/Kconfig.test
> @@ -73,4 +73,14 @@ config RUST_ATOMICS_KUNIT_TEST
>  
>  	  If unsure, say N.
>  
> +config RUST_BITFIELD_KUNIT_TEST
> +	bool "KUnit tests for the Rust `bitfield!` macro" if !KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests for the Rust `bitfield!` macro.
> +	  These are only for development and testing, not for regular
> +	  kernel use cases.
> +
> +	  If unsure, say N.
> +
>  endif
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> index 2498107979dc..4720cdd23c74 100644
> --- a/rust/kernel/bitfield.rs
> +++ b/rust/kernel/bitfield.rs
> @@ -546,3 +546,318 @@ fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
>          }
>      };
>  }
> +
> +#[cfg(CONFIG_RUST_BITFIELD_KUNIT_TEST)]

Here, can you also add a comment describing limitations, like
unsigned base types only, prohibited names, rules for unallocated
bits.

The motivation is simple: you demonstrate which behavior is intentional,
and which is implementation detail. So that, if someone changes the code,
he'd have to walk through the test to ensure consistency, and if that
doesn't hold - inspect the codebase for the corner cases.

> +#[::kernel::macros::kunit_tests(kernel_bitfield)]
> +mod tests {
> +    use core::convert::TryFrom;
> +
> +    use pin_init::Zeroable;
> +
> +    use kernel::num::Bounded;
> +
> +    // Enum types for testing => and ?=> conversions
> +    #[derive(Debug, Clone, Copy, PartialEq)]
> +    enum MemoryType {
> +        Unmapped = 0,
> +        Normal = 1,
> +        Device = 2,
> +        Reserved = 3,
> +    }
> +
> +    impl TryFrom<Bounded<u64, 4>> for MemoryType {
> +        type Error = u64;
> +        fn try_from(value: Bounded<u64, 4>) -> Result<Self, Self::Error> {
> +            match value.get() {
> +                0 => Ok(MemoryType::Unmapped),
> +                1 => Ok(MemoryType::Normal),
> +                2 => Ok(MemoryType::Device),
> +                3 => Ok(MemoryType::Reserved),
> +                _ => Err(value.get()),

Does this engine supports non-sequential enumeration, like:
        
                   0 => Ok(MemoryType::Unmapped),
                   1 => Ok(MemoryType::Normal),
                   2 => Err(value.get()),
                   3 => Ok(MemoryType::Reserved),
                   _ => Err(value.get()),

If so, can you add a test for it? (This is a real example from my
working place, FWIW.)

> +            }
> +        }
> +    }
> +
> +    impl From<MemoryType> for Bounded<u64, 4> {
> +        fn from(mt: MemoryType) -> Bounded<u64, 4> {
> +            Bounded::from_expr(mt as u64)
> +        }
> +    }
> +
> +    #[derive(Debug, Clone, Copy, PartialEq)]
> +    enum Priority {
> +        Low = 0,
> +        Medium = 1,
> +        High = 2,
> +        Critical = 3,
> +    }
> +
> +    impl From<Bounded<u16, 2>> for Priority {
> +        fn from(value: Bounded<u16, 2>) -> Self {
> +            match value & 0x3 {
> +                0 => Priority::Low,
> +                1 => Priority::Medium,
> +                2 => Priority::High,
> +                _ => Priority::Critical,
> +            }
> +        }
> +    }
> +
> +    impl From<Priority> for Bounded<u16, 2> {
> +        fn from(p: Priority) -> Bounded<u16, 2> {
> +            Bounded::from_expr(p as u16)
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestPageTableEntry(u64) {

Can you add bit 63 in the list? The highest and lowest bits must be
covered in some test. Maybe create a separate subtest, if you don't
want to touch this one?

> +            61:52     available2;
> +            51:16     pfn;
> +            15:12     mem_type ?=> MemoryType;
> +            11:9      available;
> +            1:1       writable;
> +            0:0       present;
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestControlRegister(u16) {

For the purpose of testing, I think it's more clear to give names that
are meaningful in the testing context, like u16reg, u8reg, and so on.
Where is the 32-bit register by the way? Is it omitted on purpose?

> +            15:8      channel;
> +            7:4       priority_nibble;
> +            5:4       priority => Priority;

I understand, you want the test looking more realistic. But giving
'real' names may mislead and distract. Instead, can you name the
fields such that they underline the testing intention.

For example, this part may look like:

               7:4       split_field;
               7:6       split_field_hi;
               5:4       split_field_lo => Priority;

So later in the code, you may add another trivially looking consistency
check:
        assert!(split_field == (split_field_hi << 2) | split_field_lo)

> +            3:1       mode;
> +            0:0       enable;
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestStatusRegister(u8) {
> +            7:0       full_byte;  // For entire register

Don't you have the .into() for it? Do you encourage to use that
placeholder instead of the method in some cases? Can you elaborate?

> +            7:4       reserved;
> +            3:2       state;
> +            1:1       error;
> +            0:0       ready;
> +        }
> +    }
> +    #[test]
> +    fn test_single_bits() {
> +        let mut pte = TestPageTableEntry::zeroed();
> +
> +        assert!(!pte.present().into_bool());
> +        assert!(!pte.writable().into_bool());
> +        assert_eq!(u64::from(pte), 0x0);
> +
> +        pte = pte.with_present(true);
> +        assert!(pte.present().into_bool());
> +        assert_eq!(u64::from(pte), 0x1);
> +
> +        pte = pte.with_writable(true);
> +        assert!(pte.writable().into_bool());
> +        assert_eq!(u64::from(pte), 0x3);
> +
> +        pte = pte.with_writable(false);
> +        assert!(!pte.writable().into_bool());
> +        assert_eq!(u64::from(pte), 0x1);
> +
> +        assert_eq!(pte.available(), 0);
> +        pte = pte.with_const_available::<0x5>();
> +        assert_eq!(pte.available(), 0x5);
> +        assert_eq!(u64::from(pte), 0xA01);
> +    }
> +
> +    #[test]
> +    fn test_range_fields() {
> +        let mut pte = TestPageTableEntry::zeroed();
> +        assert_eq!(u64::from(pte), 0x0);
> +
> +        pte = pte.with_const_pfn::<0x123456>();
> +        assert_eq!(pte.pfn(), 0x123456);
> +        assert_eq!(u64::from(pte), 0x1234560000);
> +
> +        pte = pte.with_const_available::<0x7>();
> +        assert_eq!(pte.available(), 0x7);
> +        assert_eq!(u64::from(pte), 0x1234560E00);
> +
> +        pte = pte.with_const_available2::<0x3FF>();
> +        assert_eq!(pte.available2(), 0x3FF);
> +        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_0E00u64);
> +
> +        // Test TryFrom with ?=> for MemoryType
> +        pte = pte.with_mem_type(MemoryType::Device);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
> +        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_2E00u64);
> +
> +        pte = pte.with_mem_type(MemoryType::Normal);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
> +        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_1E00u64);
> +
> +        // Test all valid values for mem_type
> +        pte = pte.with_mem_type(MemoryType::Reserved);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
> +        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_3E00u64);
> +
> +        // Test failure case using mem_type field which has 4 bits (0-15)
> +        // MemoryType only handles 0-3, so values 4-15 should return Err
> +        let mut raw = pte.into_raw();
> +        // Set bits 15:12 to 7 (invalid for MemoryType)
> +        raw = (raw & !::kernel::bits::genmask_u64(12..=15)) | (0x7 << 12);
> +        let invalid_pte = TestPageTableEntry::from_raw(raw);
> +        // Should return Err with the invalid value
> +        assert_eq!(invalid_pte.mem_type(), Err(0x7));
> +
> +        // Test a valid value after testing invalid to ensure both cases work
> +        // Set bits 15:12 to 2 (valid: Device)
> +        raw = (raw & !::kernel::bits::genmask_u64(12..=15)) | (0x2 << 12);
> +        let valid_pte = TestPageTableEntry::from_raw(raw);
> +        assert_eq!(valid_pte.mem_type(), Ok(MemoryType::Device));
> +
> +        const MAX_PFN: u64 = ::kernel::bits::genmask_u64(0..=35);
> +        pte = pte.with_const_pfn::<{ MAX_PFN }>();
> +        assert_eq!(pte.pfn(), MAX_PFN);
> +    }
> +
> +    #[test]
> +    fn test_builder_pattern() {
> +        let pte = TestPageTableEntry::zeroed()
> +            .with_present(true)
> +            .with_writable(true)
> +            .with_const_available::<0x7>()
> +            .with_const_pfn::<0xABCDEF>()
> +            .with_mem_type(MemoryType::Reserved)
> +            .with_const_available2::<0x3FF>();

I can't find try_with in the test. Can you test it too?
Can I chain it like:
        
        let bitfield = TestU64Entry::zeroes()
                .try_with_present(val1)
                .try_with_writable(val2)
        ...

Thanks,
Yury

> +
> +        assert!(pte.present().into_bool());
> +        assert!(pte.writable().into_bool());
> +        assert_eq!(pte.available(), 0x7);
> +        assert_eq!(pte.pfn(), 0xABCDEF);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
> +        assert_eq!(pte.available2(), 0x3FF);
> +    }
> +
> +    #[test]
> +    fn test_raw_operations() {
> +        let raw_value = 0x3FF0000031233E03u64;
> +
> +        let pte = TestPageTableEntry::from_raw(raw_value);
> +        assert_eq!(u64::from(pte), raw_value);
> +
> +        assert!(pte.present().into_bool());
> +        assert!(pte.writable().into_bool());
> +        assert_eq!(pte.available(), 0x7);
> +        assert_eq!(pte.pfn(), 0x3123);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
> +        assert_eq!(pte.available2(), 0x3FF);
> +    }
> +
> +    #[test]
> +    fn test_u16_bitfield() {
> +        let mut ctrl = TestControlRegister::zeroed();
> +
> +        assert!(!ctrl.enable().into_bool());
> +        assert_eq!(ctrl.mode(), 0);
> +        assert_eq!(ctrl.priority(), Priority::Low);
> +        assert_eq!(ctrl.priority_nibble(), 0);
> +        assert_eq!(ctrl.channel(), 0);
> +
> +        ctrl = ctrl.with_enable(true);
> +        assert!(ctrl.enable().into_bool());
> +
> +        ctrl = ctrl.with_const_mode::<0x5>();
> +        assert_eq!(ctrl.mode(), 0x5);
> +
> +        // Test From conversion with =>
> +        ctrl = ctrl.with_priority(Priority::High);
> +        assert_eq!(ctrl.priority(), Priority::High);
> +        assert_eq!(ctrl.priority_nibble(), 0x2); // High = 2 in bits 5:4
> +
> +        ctrl = ctrl.with_channel(0xAB);
> +        assert_eq!(ctrl.channel(), 0xAB);
> +
> +        // Test overlapping fields
> +        ctrl = ctrl.with_const_priority_nibble::<0xF>();
> +        assert_eq!(ctrl.priority_nibble(), 0xF);
> +        assert_eq!(ctrl.priority(), Priority::Critical); // bits 5:4 = 0x3
> +
> +        let ctrl2 = TestControlRegister::zeroed()
> +            .with_enable(true)
> +            .with_const_mode::<0x3>()
> +            .with_priority(Priority::Medium)
> +            .with_channel(0x42);
> +
> +        assert!(ctrl2.enable().into_bool());
> +        assert_eq!(ctrl2.mode(), 0x3);
> +        assert_eq!(ctrl2.priority(), Priority::Medium);
> +        assert_eq!(ctrl2.channel(), 0x42);
> +
> +        let raw_value: u16 = 0x4217;
> +        let ctrl3 = TestControlRegister::from_raw(raw_value);
> +        assert_eq!(u16::from(ctrl3), raw_value);
> +        assert!(ctrl3.enable().into_bool());
> +        assert_eq!(ctrl3.priority(), Priority::Medium);
> +        assert_eq!(ctrl3.priority_nibble(), 0x1);
> +        assert_eq!(ctrl3.channel(), 0x42);
> +    }
> +
> +    #[test]
> +    fn test_u8_bitfield() {
> +        let mut status = TestStatusRegister::zeroed();
> +
> +        assert!(!status.ready().into_bool());
> +        assert!(!status.error().into_bool());
> +        assert_eq!(status.state(), 0);
> +        assert_eq!(status.reserved(), 0);
> +        assert_eq!(status.full_byte(), 0);
> +
> +        status = status.with_ready(true);
> +        assert!(status.ready().into_bool());
> +        assert_eq!(status.full_byte(), 0x01);
> +
> +        status = status.with_error(true);
> +        assert!(status.error().into_bool());
> +        assert_eq!(status.full_byte(), 0x03);
> +
> +        status = status.with_const_state::<0x3>();
> +        assert_eq!(status.state(), 0x3);
> +        assert_eq!(status.full_byte(), 0x0F);
> +
> +        status = status.with_const_reserved::<0xA>();
> +        assert_eq!(status.reserved(), 0xA);
> +        assert_eq!(status.full_byte(), 0xAF);
> +
> +        // Test overlapping field
> +        status = status.with_full_byte(0x55);
> +        assert_eq!(status.full_byte(), 0x55);
> +        assert!(status.ready().into_bool());
> +        assert!(!status.error().into_bool());
> +        assert_eq!(status.state(), 0x1);
> +        assert_eq!(status.reserved(), 0x5);
> +
> +        let status2 = TestStatusRegister::zeroed()
> +            .with_ready(true)
> +            .with_const_state::<0x2>()
> +            .with_const_reserved::<0x5>();
> +
> +        assert!(status2.ready().into_bool());
> +        assert!(!status2.error().into_bool());
> +        assert_eq!(status2.state(), 0x2);
> +        assert_eq!(status2.reserved(), 0x5);
> +        assert_eq!(status2.full_byte(), 0x59);
> +
> +        let raw_value: u8 = 0x59;
> +        let status3 = TestStatusRegister::from_raw(raw_value);
> +        assert_eq!(u8::from(status3), raw_value);
> +        assert!(status3.ready().into_bool());
> +        assert!(!status3.error().into_bool());
> +        assert_eq!(status3.state(), 0x2);
> +        assert_eq!(status3.reserved(), 0x5);
> +        assert_eq!(status3.full_byte(), 0x59);
> +
> +        let status4 = TestStatusRegister::from_raw(0xFF);
> +        assert!(status4.ready().into_bool());
> +        assert!(status4.error().into_bool());
> +        assert_eq!(status4.state(), 0x3);
> +        assert_eq!(status4.reserved(), 0xF);
> +        assert_eq!(status4.full_byte(), 0xFF);
> +    }
> +}
> 
> -- 
> 2.54.0
