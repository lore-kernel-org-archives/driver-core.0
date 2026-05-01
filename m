Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865BA19E839;
	Fri,  1 May 2026 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777615466; cv=fail; b=sCCaPkMfCb38utODh3+5YAFJ22tXoTT+HWW/bA0naPNGRGFKteAiHNzdiYtMB5nSir2HQoXuKw20evtX8wv0ZxqET4ZriA4PeiME5FU482YfJ6CdxOHee0CIuzcbqxZ1t/1Lkb0sBkRkJrAGAI2asI6tmcgPAIVFehLTyUfZM44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777615466; c=relaxed/simple;
	bh=PU2LyDDG7z6hcbH+Aip3FtwHLLoqCYokGL97ezxuVLY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GaQ8hlbk1kLGofPZIn4Vr0WoKPb7ssEfiDz4sMhLDK/PGjAcxnvYjy7UARtjb0JHPTF3K1JhJ50F8Xl5TWcS3huHob01eyNlzlWg6jpFvcNbK6FYDODUJ/YGaMUt3FAYsw0mhxy3IT3EUv/XfoOE81295sp38r2kIjAP3fI1BVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dcEqJcYa; arc=fail smtp.client-ip=40.93.194.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dcEqJcYa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4eYWynDqnwftFVQA0mQE8EO66hCm1mtfcdCmbGjF+IPmsgWlCjPrbZSaXbqpwCs2sZzvZK1LtOjUtt2HWlY1Woqsy/JeRn8VjCtCppGpT1YQpy2tXM//9hJ7RtnLdKd7sOC/S8RaRbbmI9cEop24BeC6KnGuN9korw2Ch7W+1fb/mqcnc5PWFG5gtEIr79DWk/NsWDs7wSpEgmZiTcyGMZSlrDLDIU33RB8kBMMQnJPPx19zJ+Lp9tIKCEf9hOhvgmlgheXNQUlUGDxyuwCDe9GV9kPdEvGnyhyhiNgb+3qv31kNSPmgfgYOjhIGXm/KkM9nGUohJopsIHcgp0ZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/ZG6zCu6ofRvrF0GQdW6RpuEAwgrw3aqHEpWriP8MU=;
 b=LPJbfGaDKSrYhqvOV2yYATuFG0XupXY5JszT5SC9FY2SWcxhAmS5GgE7SBtMHdy9OOMj+JNupL0TuzlgwwdiAuyrLnwQ1nMMZUDoU28J8k0VHaCTFIoFukx13JMrkdoOfNUm+9MAggKU+4HJgAALIhnE66BM3/T4n3Lf7MWhyZrGGPwFnr5C71Q6S+acrXOywlNj6vvO1yHPfIfVD7Nj0/QtbquGKnFPa8cy8DKy8tmzOm9q4eBcSOGDGNJ83sGFgE6/OCvBi+B3W8wboyfYaRb5A7FOSa0Vqf56Z4CnpRSBgISJRw9sHeJVIeezXZQz7PsTd9i5UFGDoXPf5TxQiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/ZG6zCu6ofRvrF0GQdW6RpuEAwgrw3aqHEpWriP8MU=;
 b=dcEqJcYaIuK5zvx+mfecl5BWiTzv1WNFiu2ikR+kuk2IDu///jXM0H9CwOSyjN9znYLNjffQvar8R/RgBisGpCoPVSIB/QBXfDFzfmTVoIQr95veuvNQ0sN9Ab3NomUf5jh1BL032QKWvsLLCMl8RGZPs8byxbMGBrCQG2nsJE5nrKbTEV/paWfYDNz97HzdNdTIT2IX1DafypA/6TqG2/Gv900PJJC5jYvG8X2AhurWEqG5fUb1pmT3IxLYgVdk3eNiQoZYu8uFvUPe2milZkpIAI6FNd3lxEHkKNy/8pc4gjTotWh4m4ohNjZcEBKEm/orsoWYSkW3ZjCkF2rkfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 06:04:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Fri, 1 May 2026
 06:04:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 01 May 2026 15:03:18 +0900
Subject: [PATCH v3 1/5] rust: extract `bitfield!` macro from `register!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-bitfield-v3-1-aa1076c3337d@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <ynorov@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7PR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:604:250::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b3bb60-11f9-4213-1086-08dea7477a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|18002099003|921020|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	u8QuQuvEdy8XxmNluwjcW9GpLsv+eyBp2es3nQdoSc5/S8XieeGLygPTifNHP7OaW5lcUNyMsbPpHrQGuprRsoHrSjig3oyftErzHLHM5fQ07UnqEwBwP6sB4wjLlHISxyZ+1ENYbxS23SgnWN4bFgqLxAr2TnW3A2PAIJUQ5GKCVQmjujx/Uyvcu42IaFUheRt3YQwsnTiyRCHMlgGTQTbPwZ7Kzy7BIt7zyJbAHaXziJg+qQaa6fB5mRE4TT6aZ4+uh4cYLWN7nPJT4cITaaXOXcuqe5jid99JKC+4WKQMSe6qBYux49ObUPgLyXKobLY0oTWa/FZXw3Be9WsDlpCiEFTNmG/xLZ725vWnunRfaFLW0bAqFH861gce8TjtFVxvgIb8jScEvAYJPAivGHVVg6H5TN7A+tO/NfksSq/rY61TT5ZomULR+wTmP354/x6meh/Au8Ps5/IAjGEWfXB2USpUIyjqnZFucRhGDRMa8rBy0YipNs2K7wQQE7TRfyezcS6HDSqidVktesc7Zhqq+stvlfeaFrx3q+pXIRQntVgKMIQHQ7VasLYysXsQTGAve7bFKSI6tsUXXjfxtEBQ6kF0k1wWMAcFg1dki/nEAhpqQSn3UqPuy3kefD/dIgHUDzchx+M+kw54hKsFuJoQVENSUki7OVWfxFyzFHp6iKGMHxzuXIZ4HgogK/JqDCEyWKWSuJE5JKKfwAm3OW/Umb8XQfn2ICiBI6aN98abDaVLVEQ3e/fkEQZ6E3/+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(18002099003)(921020)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWt5eXZBRGZsZTZUeHdVVDliN0h3bXRxOHJuRHI3YkFWbTRIT0lzeEl0NHl2?=
 =?utf-8?B?NUZnWGNXRGk5elNZSzllZjNjZUo5UzlXN0c0Y2hpUi9UVWRBbXZUYlZTZks2?=
 =?utf-8?B?cDdBc0EzZnJ3c1RVR3ptNDBDdTZ3SGJUOU5XanNyS2lMRCtrVGFMS1VtdlM1?=
 =?utf-8?B?ZUpZbXlzeXdZK1BlZS9uUkFMYWF4Yno0RUFOOUtaOVp1WFllTkxEd0s5aVlr?=
 =?utf-8?B?WGltcWJFWXpsUDhZcnhsdmk1TWZKalI4MDlPQytxUVl4S3RLZzBacE54clFm?=
 =?utf-8?B?SFppNTUzNm05aUNtQVdjMm5CNFFVTTJiNi9PMG1oMHBjbWZXQ1k1dWpLUnR6?=
 =?utf-8?B?UVZjZFdXcVJteVRtNWwwR0M4NGZGY01DYVlObzgzN2QwOGFDcW5HQmIvZVJZ?=
 =?utf-8?B?aFlhTlIyQ0l5VVpOQjVBUEFLV3RzM2JpQ0FsdWlDbmlmU0l3bEUzei95Tk1I?=
 =?utf-8?B?NXUyZFRvbVVtcFVyMlE4SDQvbW1wMHcrMGNsUXdJNmltdEF2T09QcmZjMGJC?=
 =?utf-8?B?bWNiOG8wRUFDWkc5R1RlcDlVRkhYeTk2NU1vckpDMURZNUM3b09tQnZkNVVw?=
 =?utf-8?B?VXJtR0hZczFrWnZMZCtPRU05ekdlU3BxR056UG5EREJLcGhLc2JBS09PQzly?=
 =?utf-8?B?QXlyL0ozYlRrV1d0YXo4TWVOb0NyaGEzaUVnb0tWbVhpbytMdzQrMjFFZ1h3?=
 =?utf-8?B?eitCUlJUUk9rSUdac3NLT0ZEODNWYXFkV0NiKzlUbHE3OEUvdWQ3aksrR1Qy?=
 =?utf-8?B?cXZOV2ZnMi9WdjdSM0FPdFViRUg1aDhxZk80NS9VYWpNQ3ZDMlM2Ui9vZDJk?=
 =?utf-8?B?K1p5MEoxNWM1VUUwNk0wSW03M3FFaEhKWlhOTGw5M0FINkZjc3U2MStDVzR4?=
 =?utf-8?B?WkNnTmdIV0lZSVNsWGlWSkFrSERsbVF6ZytrMERVRVQyeGpybldQNTVRZDhG?=
 =?utf-8?B?eDU3aTdpU3RTWjRCejlDQjJndFB2bW9LbzRzb3JEN0tuL2Mra1pCeE9UcTAy?=
 =?utf-8?B?aGdZWWpvQjFpQmRBTEV3eHVxZ0hBQVU4UlltazNHb09sK2VUREJSbkRYT2dq?=
 =?utf-8?B?djhvSVNZVTgxM0JJYkNpVUt1ZDlvaUlHWElJMmJZM1VQenpTTGZnbmRlSHdN?=
 =?utf-8?B?aHNzM2M2OGRkd3lpdjZQRVpnTGRtTUVIRlNXMzYraVJuV3duN0tQL1I0ck5G?=
 =?utf-8?B?ZnVzd00vU25kMDNmQjFRN3plTzJHck15cTVtQUVrdkZyUDY2QVE5OHNmQVVi?=
 =?utf-8?B?VTU1dk1iWERJNXlmcVZkN05KWFlKNng3K0VLWEFUcHhYdUdIM1NyWm9BQWs4?=
 =?utf-8?B?Z2VrNlRvNGRZQ0ljZHpOY1BhSDBFQlRMQ1NyRThWRW0zT1JVMWFFckJ1c1RM?=
 =?utf-8?B?ci9md2xtbWV0Z3RiSkFnQWFMZGw0UDhZQzU2ejFFL3VSN2xVV1kzUGZmN2lx?=
 =?utf-8?B?OURKU3FrZ25vU1VudXByMTBhYThrS0g2eXMvVm9yRDRjSSsrTFpuV25wRFYz?=
 =?utf-8?B?bzg5VHBUUENVZkJZdzg3RXhodWtQeDloN0wvbGhZOGpDdXhnMEhNbXZEU2VR?=
 =?utf-8?B?UEFUaVFKUEZvMC9SY1lHdURMa0F5cTE2ZFlEaTN1KzhFdzBDbUlFSm1zeEFB?=
 =?utf-8?B?ZE1XUVlIYlVMOXVqVjRQMERrZEM0ZU15R0xMTG5QZGtGL1dsbTNXM1p0MDJE?=
 =?utf-8?B?dzFxOWNmUytDb3k4Nm4vTWlqSllESzByN3RXa29Dc0Njb2UwMkN2eTlWK0V2?=
 =?utf-8?B?RGRRR1k1aTdZdTkvcGJJa2FHRTdzMW5RMkFQSzU3SFBrMUlrUE5ZdjRVRmxW?=
 =?utf-8?B?aVFld2pma0s5Y2xzUzBxQ3d5Q2VyR1lHK0VJVHJNNEJndU9HOEhPZHFlVzl5?=
 =?utf-8?B?UElnSG02T2NuQ1FvTUlSa2x6ZFNxdHdFMVFPMitUYnd6eEtaWHFtcTVpdW1D?=
 =?utf-8?B?SkI3V2IrbmxQOGtHWDFBQjlXMDFTcUJmRGQ1L0grM1VYS051UEpqUW5ST1Y1?=
 =?utf-8?B?MHdJbUlOY3JhR1Nxb0VyTHJhV3gvVXp0dmpPTVN0VDVEWm1EUVpWRW1pTzNj?=
 =?utf-8?B?Z0FQQlFSaGs0V09mZXdVblJWbU9GdjhPY1pNbUdyc0dVYTN6aUtiMW80TDlG?=
 =?utf-8?B?QjdFRk5YTW1XNUR1VEJFOUJQMEZmMU1ka01TQzhlSDNBKzZUQjk5REtHRU91?=
 =?utf-8?B?cW4vMGhBeDduZS9aQ285d1FVcGF3RXVueGtNZFhJRERyb3lUVlJTaUhUSWV5?=
 =?utf-8?B?d09yVi9xc3V1UXRFZ3hJOVVJOFNYZ0xzWTJiSGRBdlJjOTRpalVDbWVVdFk2?=
 =?utf-8?B?cm1QN29RL3RFanRCRzdSalJITkYwblF2eWxGcFNKMGFMd1hxd1MybHRwRkli?=
 =?utf-8?Q?cRXlL6DVSStJC6rsIlBQQkcNZ7p47pe7ItEjV8nBfrMhB?=
X-MS-Exchange-AntiSpam-MessageData-1: tRPaQppXMbNwWw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b3bb60-11f9-4213-1086-08dea7477a9e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 06:04:17.6486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 210ljDhwoxuwi6/0/zFoqqEwvk9gaBqgCFLfQLVIXzU+eADsYw+esRvesGoXUWBJlXvzVTieuuGECy8bQ3r6YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584

Extract the bitfield-defining part of the `register!` macro into an
independent macro used to define bitfield types with bounds-checked
accessors.

Each field is represented as a `Bounded` of the appropriate bit width,
ensuring field values are never silently truncated.

Fields can optionally be converted to/from custom types, either fallibly
or infallibly.

Appropriate documentation is also added, and a MAINTAINERS entry created
for the new module.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Yury Norov <ynorov@nvidia.com>
---
 MAINTAINERS             |   8 +
 rust/kernel/bitfield.rs | 546 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs      |   1 +
 3 files changed, 555 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..b685f364cee4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23377,6 +23377,14 @@ T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
 F:	rust/kernel/alloc.rs
 F:	rust/kernel/alloc/
 
+RUST [BITFIELD]
+M:	Alexandre Courbot <acourbot@nvidia.com>
+M:	Joel Fernandes <joelagnelf@nvidia.com>
+R:	Yury Norov <yury.norov@gmail.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/bitfield.rs
+
 RUST [INTEROP]
 M:	Joel Fernandes <joelagnelf@nvidia.com>
 M:	Alexandre Courbot <acourbot@nvidia.com>
diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
new file mode 100644
index 000000000000..4083e7b7a307
--- /dev/null
+++ b/rust/kernel/bitfield.rs
@@ -0,0 +1,546 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for defining bitfields as Rust structures.
+//!
+//! The [`bitfield!`](kernel::bitfield!) macro declares integer types that are split into distinct
+//! bit fields of arbitrary length. Each field is typed using [`Bounded`](kernel::num::Bounded) to
+//! ensure values are properly validated and to avoid implicit data loss.
+//!
+//! # Example
+//!
+//! ```rust
+//! use kernel::bitfield;
+//! use kernel::num::Bounded;
+//!
+//! bitfield! {
+//!     pub struct Rgb(u16) {
+//!         15:11 blue;
+//!         10:5 green;
+//!         4:0 red;
+//!     }
+//! }
+//!
+//! // Valid value for the `blue` field.
+//! let blue = Bounded::<u16, 5>::new::<0x18>();
+//!
+//! // Setters can be chained. Values ranges are checked at compile-time.
+//! let color = Rgb::zeroed()
+//!     // Compile-time bounds check of constant value.
+//!     .with_const_red::<0x10>()
+//!     .with_const_green::<0x1f>()
+//!     // A `Bounded` can also be passed.
+//!     .with_blue(blue);
+//!
+//! assert_eq!(color.red(), 0x10);
+//! assert_eq!(color.green(), 0x1f);
+//! assert_eq!(color.blue(), 0x18);
+//! assert_eq!(
+//!     color.into_raw(),
+//!     (0x18 << Rgb::BLUE_SHIFT) + (0x1f << Rgb::GREEN_SHIFT) + 0x10,
+//! );
+//!
+//! // Convert to/from the backing storage type.
+//! let raw: u16 = color.into();
+//! assert_eq!(Rgb::from(raw), color);
+//! ```
+//!
+//! # Syntax
+//!
+//! ```text
+//! bitfield! {
+//!     #[attributes]
+//!     // Documentation for `Name`.
+//!     pub struct Name(storage_type) {
+//!         // `field_1` documentation.
+//!         hi:lo field_1;
+//!         // `field_2` documentation.
+//!         hi:lo field_2 => ConvertedType;
+//!         // `field_3` documentation.
+//!         hi:lo field_3 ?=> ConvertedType;
+//!         ...
+//!     }
+//! }
+//! ```
+//!
+//! - `storage_type`: The underlying unsigned integer type (`u8`, `u16`, `u32`, `u64`).
+//!   Signed integer storage types are not supported.
+//! - `hi:lo`: Bit range (inclusive), where `hi >= lo`.
+//! - `=> Type`: Optional infallible conversion (see [below](#infallible-conversion-)).
+//! - `?=> Type`: Optional fallible conversion (see [below](#fallible-conversion-)).
+//! - Documentation strings and attributes are optional.
+//!
+//! # Generated code
+//!
+//! Each field is internally represented as a [`Bounded`] parameterized by its bit width. Field
+//! values can either be set/retrieved directly, or converted from/to another type.
+//!
+//! The use of `Bounded` for each field enforces bounds-checking (at build time or runtime) of every
+//! value assigned to a field. This ensures that data is never accidentally truncated.
+//!
+//! The macro generates the bitfield type, [`From`] and [`Into`] implementations for its storage
+//! type, as well as [`Debug`] and [`Zeroable`](pin_init::Zeroable) implementations.
+//!
+//! For each field, it also generates:
+//!
+//! - `field()`: Getter method for the field value.
+//! - `with_field(value)`: Infallible setter; the argument type must fit within the field's width.
+//! - `with_const_field::<VALUE>()`: `const` setter; the value is validated at compile time.
+//!   Usually shorter to use than `with_field` for constant values as it doesn't require
+//!   constructing a [`Bounded`].
+//! - `try_with_field(value)`: Fallible setter. Returns an error if the value is out of range.
+//! - `FIELD_MASK`, `FIELD_SHIFT`, `FIELD_RANGE`: Constants for manual bit manipulation.
+//!
+//! # Reserved names for field identifiers
+//!
+//! Field identifiers are used to generate methods and associated constants on the bitfield type.
+//! For a field named `field`, the macro may generate methods named `field`, `with_field`,
+//! `with_const_field`, `try_with_field`, `__field` and `__with_field`, as well as constants named
+//! `FIELD_MASK`, `FIELD_SHIFT` and `FIELD_RANGE`.
+//!
+//! Therefore, field identifiers must not use names that would collide with generated items for
+//! any field in the same bitfield. The following prefixes are thus reserved for field identifiers:
+//!
+//! - `with_`
+//! - `const_`
+//! - `try_with_`
+//! - `__`
+//!
+//! The field identifiers `from_raw`, `into_raw`, and `into` are also reserved.
+//!
+//! In addition, field identifiers should follow Rust `snake_case` conventions, since the associated
+//! constants are generated by uppercasing the field name.
+//!
+//! # Implicit conversions
+//!
+//! Types that fit entirely within a field's bit width can be used directly with setters. For
+//! example, `bool` works with single-bit fields, and `u8` works with 8-bit fields:
+//!
+//! ```rust
+//! use kernel::bitfield;
+//!
+//! bitfield! {
+//!     pub struct Flags(u32) {
+//!         15:8 byte_field;
+//!         0:0 flag;
+//!     }
+//! }
+//!
+//! let flags = Flags::zeroed()
+//!     .with_byte_field(0x42_u8)
+//!     .with_flag(true);
+//!
+//! assert_eq!(flags.into_raw(), (0x42 << Flags::BYTE_FIELD_SHIFT) | 1);
+//! ```
+//!
+//! # Runtime bounds checking
+//!
+//! When a value is not known at compile time, use `try_with_field()` to check bounds at runtime:
+//!
+//! ```rust
+//! use kernel::bitfield;
+//!
+//! bitfield! {
+//!     pub struct Config(u8) {
+//!         3:0 nibble;
+//!     }
+//! }
+//!
+//! fn set_nibble(config: Config, value: u8) -> Result<Config, Error> {
+//!     // Returns `EOVERFLOW` if `value > 0xf`.
+//!     config.try_with_nibble(value)
+//! }
+//! # Ok::<(), Error>(())
+//! ```
+//!
+//! # Type conversion
+//!
+//! Fields can be automatically converted to/from a custom type using `=>` (infallible) or `?=>`
+//! (fallible). The custom type must implement the appropriate `From` or `TryFrom` traits with
+//! `Bounded`.
+//!
+//! ## Infallible conversion (`=>`)
+//!
+//! Use this when all possible bit patterns of a field map to valid values:
+//!
+//! ```rust
+//! use kernel::bitfield;
+//! use kernel::num::Bounded;
+//!
+//! #[derive(Debug, Clone, Copy, PartialEq)]
+//! enum Power {
+//!     Off,
+//!     On,
+//! }
+//!
+//! impl From<Bounded<u32, 1>> for Power {
+//!     fn from(v: Bounded<u32, 1>) -> Self {
+//!         match *v {
+//!             0 => Power::Off,
+//!             _ => Power::On,
+//!         }
+//!     }
+//! }
+//!
+//! impl From<Power> for Bounded<u32, 1> {
+//!     fn from(p: Power) -> Self {
+//!         (p as u32 != 0).into()
+//!     }
+//! }
+//!
+//! bitfield! {
+//!     pub struct Control(u32) {
+//!         0:0 power => Power;
+//!     }
+//! }
+//!
+//! let ctrl = Control::zeroed().with_power(Power::On);
+//! assert_eq!(ctrl.power(), Power::On);
+//! ```
+//!
+//! ## Fallible conversion (`?=>`)
+//!
+//! Use this when some bit patterns of a field are invalid. The getter returns a [`Result`]:
+//!
+//! ```rust
+//! use kernel::bitfield;
+//! use kernel::num::Bounded;
+//!
+//! #[derive(Debug, Clone, Copy, PartialEq)]
+//! enum Mode {
+//!     Low = 0,
+//!     High = 1,
+//!     Auto = 2,
+//!     // 3 is invalid
+//! }
+//!
+//! impl TryFrom<Bounded<u32, 2>> for Mode {
+//!     type Error = u32;
+//!
+//!     fn try_from(v: Bounded<u32, 2>) -> Result<Self, u32> {
+//!         match *v {
+//!             0 => Ok(Mode::Low),
+//!             1 => Ok(Mode::High),
+//!             2 => Ok(Mode::Auto),
+//!             n => Err(n),
+//!         }
+//!     }
+//! }
+//!
+//! impl From<Mode> for Bounded<u32, 2> {
+//!     fn from(m: Mode) -> Self {
+//!         match m {
+//!             Mode::Low => Bounded::<u32, _>::new::<0>(),
+//!             Mode::High => Bounded::<u32, _>::new::<1>(),
+//!             Mode::Auto => Bounded::<u32, _>::new::<2>(),
+//!         }
+//!     }
+//! }
+//!
+//! bitfield! {
+//!     pub struct Config(u32) {
+//!         1:0 mode ?=> Mode;
+//!     }
+//! }
+//!
+//! let cfg = Config::zeroed().with_mode(Mode::Auto);
+//! assert_eq!(cfg.mode(), Ok(Mode::Auto));
+//!
+//! // Invalid bit pattern returns an error.
+//! assert_eq!(Config::from(0b11).mode(), Err(3));
+//! ```
+//!
+//! # Bits outside of declared fields
+//!
+//! Bits of the storage type that are not part of any declared field are preserved by the setter
+//! methods, and can only be modified through `from_raw` or the [`From`] implementation from the
+//! storage type.
+//!
+//! ```rust
+//! use kernel::bitfield;
+//!
+//! bitfield! {
+//!     pub struct Sparse(u8) {
+//!         7:6 high;
+//!         // Bits 5:1 are not covered by any field.
+//!         0:0 low;
+//!     }
+//! }
+//!
+//! // Set the gap bits via `from_raw`, then mutate the declared fields.
+//! let val = Sparse::from_raw(0b0010_1010)
+//!     .with_const_high::<0b11>()
+//!     .with_low(true);
+//!
+//! // Bits 5:1 are unchanged.
+//! assert_eq!(val.into_raw(), 0b1110_1011);
+//! ```
+//!
+//! # Signed field values
+//!
+//! Bitfield storage types are unsigned. Since field getter methods return a [`Bounded`] of the
+//! storage type, fields are also unsigned by default.
+//!
+//! If a field needs to encode a signed value, use a custom conversion type with `=>` or `?=>` to
+//! perform the sign interpretation explicitly.
+//!
+//! [`Bounded`]: kernel::num::Bounded
+
+/// Defines a bitfield struct with bounds-checked accessors for individual bit ranges.
+///
+/// See the [`mod@kernel::bitfield`] module for full documentation and examples.
+#[macro_export]
+macro_rules! bitfield {
+    // Entry point defining the bitfield struct, its implementations and its field accessors.
+    (
+        $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
+    ) => {
+        $crate::bitfield!(@core
+            #[allow(non_camel_case_types)]
+            $(#[$attr])* $vis $name $storage
+        );
+        $crate::bitfield!(@fields $vis $name $storage { $($fields)* });
+    };
+
+    // All rules below are helpers.
+
+    // Defines the wrapper `$name` type and its conversions from/to the storage type.
+    (@core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) => {
+        $(#[$attr])*
+        #[repr(transparent)]
+        #[derive(Clone, Copy, PartialEq, Eq)]
+        $vis struct $name {
+            inner: $storage,
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Creates a bitfield from a raw value.
+            #[inline(always)]
+            $vis const fn from_raw(value: $storage) -> Self {
+                Self{ inner: value }
+            }
+
+            /// Turns this bitfield into its raw value.
+            ///
+            /// This is similar to the [`From`] implementation, but is shorter to invoke in
+            /// most cases.
+            #[inline(always)]
+            $vis const fn into_raw(self) -> $storage {
+                self.inner
+            }
+        }
+
+        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
+        unsafe impl ::pin_init::Zeroable for $name {}
+
+        impl ::core::convert::From<$name> for $storage {
+            #[inline(always)]
+            fn from(val: $name) -> $storage {
+                val.into_raw()
+            }
+        }
+
+        impl ::core::convert::From<$storage> for $name {
+            #[inline(always)]
+            fn from(val: $storage) -> $name {
+                Self::from_raw(val)
+            }
+        }
+    };
+
+    // Definitions requiring knowledge of individual fields: private and public field accessors,
+    // and `Debug` implementation.
+    (@fields $vis:vis $name:ident $storage:ty {
+        $($(#[doc = $doc:expr])* $hi:literal:$lo:literal $field:ident
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+        ;
+        )*
+    }
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+        $(
+        $crate::bitfield!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
+        $crate::bitfield!(
+            @public_field_accessors $(#[doc = $doc])* $vis $name $storage : $hi:$lo $field
+            $(?=> $try_into_type)?
+            $(=> $into_type)?
+        );
+        )*
+        }
+
+        $crate::bitfield!(@debug $name { $($field;)* });
+    };
+
+    // Private field accessors working with the exact `Bounded` type for the field.
+    (
+        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        $vis const [<$field:upper _MASK>]: $storage =
+            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
+        );
+
+        ::kernel::macros::paste!(
+        fn [<__ $field>](self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
+            // Left shift to align the field's MSB with the storage MSB.
+            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
+            // Right shift to move the top-aligned field to bit 0 of the storage.
+            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
+
+            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
+            // output type.
+            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
+                self.inner << ALIGN_TOP
+            );
+            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
+        }
+
+        const fn [<__with_ $field>](
+            mut self,
+            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
+        ) -> Self
+        {
+            const MASK: $storage = <$name>::[<$field:upper _MASK>];
+            const SHIFT: u32 = <$name>::[<$field:upper _SHIFT>];
+
+            let value = value.get() << SHIFT;
+            self.inner = (self.inner & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Public accessors for fields infallibly (`=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:literal:$lo:literal $field:ident => $into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) -> $into_type
+        {
+            self.[<__ $field>]().into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>](self, value: $into_type) -> Self
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields fallibly (`?=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<
+                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+                >>::Error
+            >
+        {
+            self.[<__ $field>]().try_into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>](self, value: $try_into_type) -> Self
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields not converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+        {
+            self.[<__ $field>]()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the compile-time constant `VALUE`."]
+        #[inline(always)]
+        $vis const fn [<with_const_ $field>]<const VALUE: $storage>(self) -> Self {
+            self.[<__with_ $field>](
+                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo }>::new::<VALUE>()
+            )
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>]<T>(
+            self,
+            value: T,
+        ) -> Self
+            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Tries to set this field to `value`, returning an error if it is out of range."]
+        #[inline(always)]
+        $vis fn [<try_with_ $field>]<T>(
+            self,
+            value: T,
+        ) -> ::kernel::error::Result<Self>
+            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
+        {
+            Ok(
+                self.[<__with_ $field>](
+                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
+                )
+            )
+        }
+
+        );
+    };
+
+    // `Debug` implementation.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.inner))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b72b2fbe046d..9512af7156df 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -44,6 +44,7 @@
 pub mod alloc;
 #[cfg(CONFIG_AUXILIARY_BUS)]
 pub mod auxiliary;
+pub mod bitfield;
 pub mod bitmap;
 pub mod bits;
 #[cfg(CONFIG_BLOCK)]

-- 
2.54.0

