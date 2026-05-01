Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012031.outbound.protection.outlook.com [40.107.200.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE9E343D9D;
	Fri,  1 May 2026 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777615473; cv=fail; b=EKaa412XxiZOrH8bANOCggkWtIha5zequ9rf58Y2J0n6B0s9K9LNxBfIFQ1nHjkE/8LwIh7klJmK3PSnrcIIyLigMcPn6o0SWoxjHbCVO0kIzu1ENqRhjveLT/QzGJ5nztLeb5KjtDT4dddYWP/nwxyFpShZI8q+h2ra4GEGiAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777615473; c=relaxed/simple;
	bh=HI6519Hj5pIT85k4di3iKX5oE6aObarsKP2NZiZ11ks=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bYk+k4MeDxw6xuVPL5pcccArkOZ+6JrrK0bzXwGCElGRXL+vUFAAAGyu/U9o+6OJVRPzXyO7wPRT2xMME9kdP9FY6pGI8dYSLRNjBO1FopyZJ5WvPManOQxb1lgyVfPco8Cf2yJj9amT/WKvs/nFcrNomaSwFm6ClQlAyqeHlXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mFnxYpI+; arc=fail smtp.client-ip=40.107.200.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mFnxYpI+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyQu+S5wZ2JHUOvMCKZGFsvOGrG9Vs7ZwTMRM5exAV0lxgPbOt8YprZ6Uwd5JX7NDi++XtQbB8pYkaj/s0t/oLY68AIiDkGNdNIEaFECHzOQh+w31lGkQSeWrRBYvdUkkXJYt3bz9gBtZkIpudvVieNsHuFeY9sB0JoKlWy/SklUFwW4nRkiySx6cbc2rNjWbFvMI3fFPhNcSnYIeukD8hijD18FulCWNCVbs9pPxHUjPu8FbdCNRUg0McSnPTEZBCELwAawyaLfJgKqd0oqhF2JW96/eM0cg9yKmqYEWW1nQ2/UJtb/6wk18+SYw443iEVGJ92QxBGtq/7BFlhatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSrbg1Y2P58RRyH5l/aFJm3jOVlJATKkSvLtKCEVtJE=;
 b=I5V+4nsu9FmeKHHuKwl2aIX3EEnkA8GjoOIp8SZJMVkPbZyEM1TiT78JifzlpylHTBTwVvwzXEpdtFaZHpoHTFahWhVPqp12hou53w9H8eNi7k9FA9/G05Z0wGz01ghS3mEfPSzJ0mXQNzFRvUL529cpAymnhMwbZhTWgZvc3UrKT+Eq6hOgvMkuUIUiNKWKZloagYys+RtZViHqdxyHCdQt3TeDEjy15MAc8zZ6ak1rp1hwMoy7h5wyeQ4cEbfhG/A60M0IaMqVaiattdMHgOZSwPE5IZLhEHVM7A3VVdc1Yd1XQ0ljvnfOvN4FUF7fCcndBRWkM8HkOOtOm3kVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSrbg1Y2P58RRyH5l/aFJm3jOVlJATKkSvLtKCEVtJE=;
 b=mFnxYpI+PM4gzqh8I3oSf94m8xCRQhF5a4z9hwYZ/+pgeZNdkiepCfywBGWLf8WlsEpX1Xw5jPAcKjP5JQD6TMBkmPxSi7Y9ydsYxBAkmXtq63aeKGN5XfHGn9vfAW3KH0LfglyHhpL+5yVFkKW3EMWQNliUZlCEmzzr4t3VeBtEMc8+q02yC404l593m1oENCpjlenL9QZw0LdV4OvPSyMbhB7o7XDoFSiEzeLIEtQurHZBDkdRcXv3wJtrvxQ9K0xDkGn9m84KfffZSFtwGyU1cwxzf48xNMHuWnSxjymLeO6TN7WmmhTH1mL2DTJIEJuToeJtCVU6QASUKT2ndw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 06:04:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Fri, 1 May 2026
 06:04:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 01 May 2026 15:03:20 +0900
Subject: [PATCH v3 3/5] rust: io: use the `bitfield!` macro in `register!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-bitfield-v3-3-aa1076c3337d@nvidia.com>
References: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
In-Reply-To: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, 
 Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nova-gpu@lists.linux.dev, driver-core@lists.linux.dev, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 139741d9-5dab-48e2-7f27-08dea7477f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|18002099003|921020|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Xfjwcazw/lvStiO1ZdiVd2+N3yPjw8K2BshhG3V638tmEG0tuBPaQQuBGiPdY5NOQTzmQ3CY33VKtT5ytm2SCy28eWCpdAC4x1h1iCWnxyzynAystFIObw86Pbz/87XR47aIxmdD1cm8FM4J7S0/S1TqSMzxa7kZwazuj4JYM7kV7IND1+aa7pjgu0TVReRR3TEafZ4/69LFX6anHr6rvbBg30nrN94S4OMPR3sgRrCP9OFOMcK6L5QRbzUFUuguaOvC/IKWB5dt81SlJl5472uybqlNRLTpS2f4SsTlk2k97pSAXyMOAZb/jCi+ZLXVX90XY3wh1Kl1eLM3cDr3kjSGZCXRqQQuAfvYQzFPSG8nwoIcR4bZRqWiXoX0VTsiUXSkUXVJnNFbbFEJzI8D9LCvEs+ZNNMGBrBgoYcyAjERCCcygBWIsABMZJLgqXtpYoX2PTte4KM08OytPt8dpT/WFZ0UOQNEPi4exq08iEs0TlOukcUlpzc82dtEJbhjBO9ebzMA+VXoFRhFntkgUkN6+eO0SGEU5NaIKImWPrUCyy9v74cWX+npoaH/Z1vyEStbtG8aVg2SFGoq/UuIpa4cSrVlsmdN7EuCqv3abFvCNZHd+tKKE81jnZwADMYKuKIBrtAALncwfghamxtjcdaf8fXzRhdyw2Wqsx0FML+PiYQZSsjhdIpEM/ByK4v8/UMHhJVFRQSHKq4edXXsmrrdTW3WblhC6e6/lGleaKY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(18002099003)(921020)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnRibjZSajdKS1hHZUxQcXFzaCtjcTc4L29CNUdVTVVpZ1dyZ01QM0VFSHVO?=
 =?utf-8?B?NjBRczBlZWxWRm1LRklqSkExZmM4WlNoUzkwK1JoUjBRbDh4SXptdEd6L2Fv?=
 =?utf-8?B?cFdnSHB4VXZUU2oxTlYvbWJtTDA4Nm9PWjRQNkxiQVlXV3Q2Q1lBTkRpd1Za?=
 =?utf-8?B?N2YxUm5lZ0pYd0Q1ZVRFSWgydlF3UFlla1ppRWVzTEhnUXZZVEZzc0FRUFky?=
 =?utf-8?B?WktWMnVieHowUmF3ajBuK2FwdWRwT0hmaGEzdXBSQm9qeEcvT1prZmMvWWxx?=
 =?utf-8?B?ejk5WUh6UGgrcWYxR24zMWt1dDUzaEs3NjdYZXlCQXcrVmRaanMxbTd1alRE?=
 =?utf-8?B?TythYXNjMDhuZkNzakdnQ2picjFGVWJqdWd1dG14eXpLemhmMmN0OEJKN2dI?=
 =?utf-8?B?MlQ1R2xvQS9FUUNlZ2xVT2hyWWdMaHUzV2tYazNDWFlBbUM3amZpTVNWblJk?=
 =?utf-8?B?enFucUZicEcycXYvaDl2SHFMc2hUZ0Mzbkl5SEI5ME9QRVFMTTh5bUovOHR4?=
 =?utf-8?B?NEFaOFpSWm8rSFgxeGZ5STNNdVpqdzU2cVhadzBiNDNHdlVRcUMxL1NXMGE2?=
 =?utf-8?B?cnB0UlljUDZncklrTGJwUHlYQlJmU0ZCc0JHbzJsWEkzZDd6UmxaQUJhY05R?=
 =?utf-8?B?Q0lCZ3FRN2Nsc21xTWZQV010OXFzQ3Q1cE5hUWFUSStRLytsRHpibzZNMngy?=
 =?utf-8?B?UXBEaHAzdkhnRHJmWjVDTEVEQjE3ZXJLMm9YVFFjVFdiejd2SU9pd3FBakZV?=
 =?utf-8?B?bkp4KzIwODhaV2hqRXhZMUVQQVFjcmtYdEsyNXNjZHF3SE03OUlPYmpSbFFU?=
 =?utf-8?B?QnhVRkdrYUxORWpZYnRyTTEvaGEzeUlLbHNYNmdGSndnOUY3cjEraDFFaEE0?=
 =?utf-8?B?M1pXYzlMZHVkRUR6ejJ4ai9OWnhYeFlsNy9tcFFhNHRiVkw1alovWDlnQ3hq?=
 =?utf-8?B?dENFRUFaYW9meXhNcGVmZ05RNzNlSnVCZC8xaHdmY29LNGlXdEpsUWtOdWoz?=
 =?utf-8?B?cUhYb09YWksxK3RFVUo3eENqZHkwS1A5WlhISUtDd0ZURFk0ak1ydWxrdjJB?=
 =?utf-8?B?YUJ4ZUQwQjBtSE1ualJ6aU1JeUxDT2lkRjYyVHM5ZnNkWVNiT2NicHZ0ZmdK?=
 =?utf-8?B?dGxVQ25kZGhzZXFSelZSSzJWTzZ3Wkhzc2VDTG9PVmNpSE04ODVnRXRoRW8w?=
 =?utf-8?B?bFFYbkhzc0ZacW9PZnJxaUhnVlJ5UXpyaHpvaVdiNmRyRG43a1RZcS9MRmMy?=
 =?utf-8?B?VzdFN3ppelJ0RGJkdDlnUGtpaGxQVFYrVFBjSEswYit1bXl5MTluU21zcFhx?=
 =?utf-8?B?RE82azZJS3lRR0UyTzJUS2NvUWdKKy80S3lDaWtRQ3lSdDcyUmV5Rm5laG9L?=
 =?utf-8?B?eWNzSzRNSVlaTkpGRVJXaVducnRmTzFIRlpZT3BsYjh0S05Tdkt6MDQ4ZXRB?=
 =?utf-8?B?RldXWVJmSXdQRk0zeHRCRi85R3RpQXptZEgrT3NyY2dyQm9kK1NEVnQ5Rklj?=
 =?utf-8?B?RjQ3Y1l2b1kzZlNhODNNSjBpRitXN3BUQ1ZUT2krUTM0UzRySU82V1VUNnNI?=
 =?utf-8?B?UVl3eEF4UjF2cFdLL0ovUURsMFhLRW5iMXJOZEw4OGZSU1F1RGk3enFzRTNL?=
 =?utf-8?B?UHp1bEpKVFJLK0Zpdlk2WWxLbjRSM2RmR0hyZm5CRXRIc3lQd2FhOG40Vm9z?=
 =?utf-8?B?UFFnaHF6K2ZyNHZXR1MvYm4zOHMyeW5BTU1sVVRoTVkrdU5LQUdPdlkxK0JZ?=
 =?utf-8?B?RFIvZ1lhU212cDJxbmY1WTdyc0pOYVN1VE1rZHpOOEwyOStNcHBabGNFczY4?=
 =?utf-8?B?cFB2KzBUVDJJak5KcnVSL2w4OTZLeFNhVm5nV0tnNWhwWFE2djhhajZySEsr?=
 =?utf-8?B?Um8zbUNpQXVTalNMQkh6V09PdHo2MXFFYjZRVTUyZVFXYmZqWml1cDJSMUVC?=
 =?utf-8?B?aUtackF3R0lWeXppNjFGbjZaeWROSDA2Q1V2SGxzQ0ZuNktZTzJ3djB4QVVD?=
 =?utf-8?B?azVmNGNPKzF2S1E0cmUvRmNGaG5IOGZBWlhib1pmNElGaGdLd3BHQXhQNVBm?=
 =?utf-8?B?YUhUN3E2Rnc4NXVBNTR3RmRLMEtBTHVtQ3pHVmJudTZoZDd4TWhTRWtDZHRz?=
 =?utf-8?B?ZW9BdHpqRnNzcHQ2elQxaXRHTEliOGZwSkoyM2FEaXhrNFFSaUJpNFhaekhW?=
 =?utf-8?B?QnRFeFdncnRLelhLYk9ZNE1vYVBuNXJJTzBGc1hEN01KK2REbmZGdHVCTXdy?=
 =?utf-8?B?RmI3a3M5VTVYa3U4SVlsbVR0OVJiV1dVMm5kOVY3MnNlMmJ2VXZkejgwUXlJ?=
 =?utf-8?B?V1l5amNpZUhadTNlK2I0Q1VoYlVidy9SOHRtNytwdERmaG5DTEVYNkFja2Rl?=
 =?utf-8?Q?q8safPPSjE+hfu6q0jwEdCSLALsxrV1Ey9lzfJ5ZtrDSK?=
X-MS-Exchange-AntiSpam-MessageData-1: gWOQSbyZuJF4dw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139741d9-5dab-48e2-7f27-08dea7477f59
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 06:04:25.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8aRv5nB4aL6wsi09oFCLIF/ZYns9gFeWgiOzOG95S8vi4FVllI/HhdmmcJr1jw/cfzCvQ6p2BaluIUUjMhncw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584

Replace the local bitfield rules by the equivalent invocation of the
`bitfield!` macro.

No functional change should be introduced as the `bitfield!` macro has
been extracted from the rules of `register!`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io/register.rs | 246 +--------------------------------------------
 1 file changed, 2 insertions(+), 244 deletions(-)

diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index abc49926abfe..388647f28292 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -956,11 +956,10 @@ macro_rules! register {
     (
         @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
     ) => {
-        $crate::register!(@bitfield_core
+        $crate::bitfield!(
             #[allow(non_camel_case_types)]
-            $(#[$attr])* $vis $name $storage
+            $(#[$attr])* $vis struct $name($storage) { $($fields)* }
         );
-        $crate::register!(@bitfield_fields $vis $name $storage { $($fields)* });
     };
 
     // Implementations shared by all registers types.
@@ -1016,245 +1015,4 @@ impl $crate::io::register::RegisterArray for $name {
 
         impl $crate::io::register::RelativeRegisterArray for $name {}
     };
-
-    // Defines the wrapper `$name` type and its conversions from/to the storage type.
-    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) => {
-        $(#[$attr])*
-        #[repr(transparent)]
-        #[derive(Clone, Copy, PartialEq, Eq)]
-        $vis struct $name {
-            inner: $storage,
-        }
-
-        #[allow(dead_code)]
-        impl $name {
-            /// Creates a bitfield from a raw value.
-            #[inline(always)]
-            $vis const fn from_raw(value: $storage) -> Self {
-                Self{ inner: value }
-            }
-
-            /// Turns this bitfield into its raw value.
-            ///
-            /// This is similar to the [`From`] implementation, but is shorter to invoke in
-            /// most cases.
-            #[inline(always)]
-            $vis const fn into_raw(self) -> $storage {
-                self.inner
-            }
-        }
-
-        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
-        unsafe impl ::pin_init::Zeroable for $name {}
-
-        impl ::core::convert::From<$name> for $storage {
-            #[inline(always)]
-            fn from(val: $name) -> $storage {
-                val.into_raw()
-            }
-        }
-
-        impl ::core::convert::From<$storage> for $name {
-            #[inline(always)]
-            fn from(val: $storage) -> $name {
-                Self::from_raw(val)
-            }
-        }
-    };
-
-    // Definitions requiring knowledge of individual fields: private and public field accessors,
-    // and `Debug` implementation.
-    (@bitfield_fields $vis:vis $name:ident $storage:ty {
-        $($(#[doc = $doc:expr])* $hi:literal:$lo:literal $field:ident
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-        ;
-        )*
-    }
-    ) => {
-        #[allow(dead_code)]
-        impl $name {
-        $(
-        $crate::register!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
-        $crate::register!(
-            @public_field_accessors $(#[doc = $doc])* $vis $name $storage : $hi:$lo $field
-            $(?=> $try_into_type)?
-            $(=> $into_type)?
-        );
-        )*
-        }
-
-        $crate::register!(@debug $name { $($field;)* });
-    };
-
-    // Private field accessors working with the exact `Bounded` type for the field.
-    (
-        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
-    ) => {
-        ::kernel::macros::paste!(
-        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
-        $vis const [<$field:upper _MASK>]: $storage =
-            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
-        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
-        );
-
-        ::kernel::macros::paste!(
-        fn [<__ $field>](self) ->
-            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
-            // Left shift to align the field's MSB with the storage MSB.
-            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
-            // Right shift to move the top-aligned field to bit 0 of the storage.
-            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
-
-            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
-            // output type.
-            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
-                self.inner << ALIGN_TOP
-            );
-            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
-        }
-
-        const fn [<__with_ $field>](
-            mut self,
-            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
-        ) -> Self
-        {
-            const MASK: $storage = <$name>::[<$field:upper _MASK>];
-            const SHIFT: u32 = <$name>::[<$field:upper _SHIFT>];
-
-            let value = value.get() << SHIFT;
-            self.inner = (self.inner & !MASK) | value;
-
-            self
-        }
-        );
-    };
-
-    // Public accessors for fields infallibly (`=>`) converted to a type.
-    (
-        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
-            $hi:literal:$lo:literal $field:ident => $into_type:ty
-    ) => {
-        ::kernel::macros::paste!(
-
-        $(#[doc = $doc])*
-        #[doc = "Returns the value of this field."]
-        #[inline(always)]
-        $vis fn $field(self) -> $into_type
-        {
-            self.[<__ $field>]().into()
-        }
-
-        $(#[doc = $doc])*
-        #[doc = "Sets this field to the given `value`."]
-        #[inline(always)]
-        $vis fn [<with_ $field>](self, value: $into_type) -> Self
-        {
-            self.[<__with_ $field>](value.into())
-        }
-
-        );
-    };
-
-    // Public accessors for fields fallibly (`?=>`) converted to a type.
-    (
-        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
-            $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
-    ) => {
-        ::kernel::macros::paste!(
-
-        $(#[doc = $doc])*
-        #[doc = "Returns the value of this field."]
-        #[inline(always)]
-        $vis fn $field(self) ->
-            Result<
-                $try_into_type,
-                <$try_into_type as ::core::convert::TryFrom<
-                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
-                >>::Error
-            >
-        {
-            self.[<__ $field>]().try_into()
-        }
-
-        $(#[doc = $doc])*
-        #[doc = "Sets this field to the given `value`."]
-        #[inline(always)]
-        $vis fn [<with_ $field>](self, value: $try_into_type) -> Self
-        {
-            self.[<__with_ $field>](value.into())
-        }
-
-        );
-    };
-
-    // Public accessors for fields not converted to a type.
-    (
-        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
-            $hi:tt:$lo:tt $field:ident
-    ) => {
-        ::kernel::macros::paste!(
-
-        $(#[doc = $doc])*
-        #[doc = "Returns the value of this field."]
-        #[inline(always)]
-        $vis fn $field(self) ->
-            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
-        {
-            self.[<__ $field>]()
-        }
-
-        $(#[doc = $doc])*
-        #[doc = "Sets this field to the compile-time constant `VALUE`."]
-        #[inline(always)]
-        $vis const fn [<with_const_ $field>]<const VALUE: $storage>(self) -> Self {
-            self.[<__with_ $field>](
-                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo }>::new::<VALUE>()
-            )
-        }
-
-        $(#[doc = $doc])*
-        #[doc = "Sets this field to the given `value`."]
-        #[inline(always)]
-        $vis fn [<with_ $field>]<T>(
-            self,
-            value: T,
-        ) -> Self
-            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
-        {
-            self.[<__with_ $field>](value.into())
-        }
-
-        $(#[doc = $doc])*
-        #[doc = "Tries to set this field to `value`, returning an error if it is out of range."]
-        #[inline(always)]
-        $vis fn [<try_with_ $field>]<T>(
-            self,
-            value: T,
-        ) -> ::kernel::error::Result<Self>
-            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
-        {
-            Ok(
-                self.[<__with_ $field>](
-                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
-                )
-            )
-        }
-
-        );
-    };
-
-    // `Debug` implementation.
-    (@debug $name:ident { $($field:ident;)* }) => {
-        impl ::kernel::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
-                f.debug_struct(stringify!($name))
-                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.inner))
-                $(
-                    .field(stringify!($field), &self.$field())
-                )*
-                    .finish()
-            }
-        }
-    };
 }

-- 
2.54.0

