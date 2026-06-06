Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F0F39EF11;
	Sat,  6 Jun 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780747589; cv=fail; b=jyHUfUE/lucPA4RtinmOEBNKIs1ncPC4Dv070k5fkjY5joW4KpUfkrz4DOPOzhh7r+LvYxlkfyIIgc6rGd9Yw8+fRDCisGSCnPMhy1JXJV+1RNGvx5SPdKguKKKK8rSMogSiEFWg+4Zk3gAtPkswbPksujEtjouNEwbiHHeJYOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780747589; c=relaxed/simple;
	bh=5pJ7jUGOAHPE1d/CPhSVkudMadcOWnHnP6arYtY7cvE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lXfAJ69HNSnOKyY8FDLCie21H3LD36UM/btx1lXQUYI5TYg0n8LSh57esza9Q4HR7q9HnSnm8JZ103lF6txOx4ftwnT/8UMbsbbTfz981nd1YcfpF2IERRc9Fgq0av2TiALEzRgNDlIE0yqSiLuMZ+QQqfLYSiYew8BiE1gVMP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zw8lGP4g; arc=fail smtp.client-ip=52.101.56.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zw8lGP4g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPtEHD8I9qXV1WDVhUYp9TWCSDDu5ykfQo6oRtt9/KSm2XFdP/7I/5gz0vMxfKj+RUAunWFjYe4K6ouZ0bIBjwErbl9TF8TCc5gVl9aTCVvssYZQsPwfYjiILRseyRxIspeQj/XheYNrNEW5E8iGYLIPbW05ITVuz75mT9wBAfFb1UNhvaDcfY8nJ2VpCvr7K3w2K2yESQwluKz5LGgpegIzqpP3ItPzWH8tSOv7WTuVH7h+4OOkEah/koNJj+nOEbXJirt38WC3o3m/PRqj3Dq4ecYladU4vGyLpD13sYVzFmp1YlTz5tQG5nnnMAdSkt8Xc9QV9HhQwniPGrrM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N879Urce7Gr3jPVBr8MBRoLVTqAKevfnUKo5xiYfljE=;
 b=Aj+Xo78NQPyFHz5FuRmdvGjVQ2ACLQEFnWija9WP7FpxkMYHS6nxFJ+/rUrOjwTbakrf4A4nhqd0G2g7BLlzc4CdgOQ9HpxTohvfDrMT0sLFENjn59nGP6CaMw382LoKPenDlZs9SHyi3l9L/dgScdQCpWqjOEmrpuMqv2ytrZUDoQ3iwR8I7kNbYLZymJ1MKW2P8sRLCbwtI83C1XcJS6mrc2Qt1ve5e00wHMiGDZYx0waDTVQQ5cLS5HUaTYis4dT133pcBG+UqJKZnGLvQ9k37FIGpUpwEi4iC0E/75uUoZhBkNbV4Meyz2y17Ll3cB9WgA+CsLiLc8xMBUlSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N879Urce7Gr3jPVBr8MBRoLVTqAKevfnUKo5xiYfljE=;
 b=Zw8lGP4g+Tkx4uec/+Lpua5SObDmLvBfwgNY9+TffN50zLmYVPPdkRpNFYSA0h6ldY9p8Mo4z/E0Fva3zJfcAqSIRB9/cGNJOWMFqAI2SDIDNdHgcSs85sPYHVvdTwq36Jf9T1K3E9ok7WjWFBIQWhWAnRtrOukQ2scZ8xkNTIeHFLLCMANh6dx1bn/oULjKeP38AvFb2D+zTGpAWE/qtIfxezazXYDOyR27C4nK9wRQ6Nc4Teh0xf18/cVGKhjvH0dcurcaf9i+tTnR/Pbyg1sUV07FSNo26m5xnhQcjzArExxMkbyEJj7V69v+dNapzfoGW2RAy44a3wGCVuWpcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8239.namprd12.prod.outlook.com (2603:10b6:208:3f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Sat, 6 Jun 2026
 12:06:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 12:06:22 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Jun 2026 21:06:18 +0900
Message-Id: <DJ1YC02D5VVR.1Z6HZ5L3870AA@nvidia.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <driver-core@lists.linux.dev>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
Subject: Re: [PATCH v4 7/7] rust: bitfield: Add KUnit tests for bitfield
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yury Norov" <ynorov@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>
 <20260527-bitfield-v4-7-e8821d4efbde@nvidia.com> <ahdYuLtEm30T_wM0@yury>
In-Reply-To: <ahdYuLtEm30T_wM0@yury>
X-ClientProxiedBy: TYCP301CA0061.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: cc81f541-6f80-4fcb-8cbf-08dec3c40654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|18002099003|22082099003|3023799007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	nQ+B00hCzdK/z6eAWCook+I7drnCqEJBeZXC6i5G3leZdmSaIbJgOEbKfY8DTpRpCrFkU1WA4EfRH5Fq+uc5phHAeGjVSJgDw9+cvwZDfv3z1xKqSmjGr0ByweSGaodXLIh6eMdOrArs+kPCthaAy/HkYDCCx4ep6Ao8XAQQly4QnUbRS27PTihwcZHzr7UT3FiE6pBI7A/3VtdesS+6HcZAX1zkKPCDGscjHc8BTdXJq75ivdlEfD9kwlEtuEU3zJpKPEAXWwRj+nVFRZsNBgeQYjuwxCXDqxJFJ1mJm/FIKiMjUpG0ukWhzruw9qKfv4ZplGreZaCNCuEP9HB4uLxj8va9YRSv4hNyRoep98ZVMofVcP1vzxJYzCXzOSccOpGjKpz8bghzJhJBmLg6T8Anawj6FLHybCxVFKderTOrhh6/mm+2vC+qsgVDHumv4i1v7yqtDONT/lm/Mui0eywU6VDt494up+mw2UAfbF4oSBDt/pOdeOBRVDFyfl+0OZrVso3IRUs4TFoPpv2WyZSCSqUpwWGtjuxXvhx2EMmD8ZRscFLq5in4dc8XrFZVQH1tis0qgYJwkjIYLTIGj49VYMpQ9ViS+R53+hTQ+I3DqytvBzopQY57HfoYsidWKKg0s+zUjG5O6oYZqSLDX2p++RkZ7S2zOymMOjk+9gwqDHj+zefhRtW0JNCK8It6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vlk2aXFINVJNZlV6VUN2TSszNzlNZXhpY1lIcTh3RC9ySHZYMHJYZ0pScGNz?=
 =?utf-8?B?cE0vcTJqK1haaFlzNWV0R0VSZWQvV0d1ZnlTeTJpUGpaNFE5RkhXVWhEd3lB?=
 =?utf-8?B?eGp3UHRYOGtwWnR5Tk8yV01BeEVSYTFzckR2ZmFqQ3dNVjVDRjZDT3hHemJQ?=
 =?utf-8?B?OTVtWGdxdmdIV1BkeDlzSGM1ZDVta21Ec3lNc1lTVjBqQWtaT00yZHFxM3pD?=
 =?utf-8?B?VDhaaEF3QWxoWU1nVTVJbnFLMWtvOHN4NnVWQ1ZzdjRKUEFZS21aTVI4Yk9O?=
 =?utf-8?B?VkdRYmhRdVZZWEpFbWlNTXZYWHdaUzYwdjlHWXpzNzRkUWhsVDZCNkx6Y0NL?=
 =?utf-8?B?SHJQcDREQVVTQzM0R1l1azlQYkZlSlBkeVFCa09pUXB3YnZ2ekVvWnhMeGhj?=
 =?utf-8?B?NGV0cmpSQUZQdk1ZQnVyamJUWjdMVXhheUZtRjF0enFBT2ZjNlkrcEFwcXJW?=
 =?utf-8?B?eWdOY3BwNnJvMDVDZHlYeHF6MTcrQXFGYTF5V2FXT0s4T0NvT01LQmNKN1dO?=
 =?utf-8?B?YmtXNnNZOTNwbGZ5YzNsY05aZVQ4Yzd1cS9jWDdKRG44SWdpSHFUM1lVOWVZ?=
 =?utf-8?B?dEQxbUR0OFR2bUpYNWFIQi82dFlKc2xjZEJXc2NnWmM2YnJqdnA4WEhpMkRK?=
 =?utf-8?B?ZkROWkFPZURyT0ZPbmlLUWhFZzR4ZTJCMzhYeFhTVXZsM1VQWCtLUUxYNEls?=
 =?utf-8?B?eHhTOEhCTWFMdEdlbVdZcXZiK25xeDhvWEl0dGM3SUN2R1ZSQ3ZtcjE0QVNj?=
 =?utf-8?B?cEg4cTB4Rlh4eFFCcjQ4VDZ0TDFXdzBwUlNOR3VueGhsdmpIcyttU3g0NG1k?=
 =?utf-8?B?TjJHT1VhZVpLNlAyT0ROMS95c3hGN1N6M2p5YmdNSE9uT1pMUEJjOUdhWm5v?=
 =?utf-8?B?NGtQQnViTnh6VDIzR3Vacmp2eW5xOXllUGVkVmhnYmh6MklmNnc5Smc5U0dJ?=
 =?utf-8?B?RU1tMUdNWFB3R0xadDM5ckpwZVdJZ0hPVkZKZFBJMDNUYXArc2wzWDM5ZDVR?=
 =?utf-8?B?Tk9DVDh4dWhhZEZhNkw2YXo1MVhTMFFITlZGaEY4YW9kUktESEUwZUVkQXhJ?=
 =?utf-8?B?UFp0cFowb3czeFJiT1BYakxpeU1Hczhmbjc0VEQzVWNXKzhVTDE2VHhTTEI0?=
 =?utf-8?B?VktBWTNlOHZNa0FVRGpsM1RKUkJMcm5TRzVoWWg0Um9OZDBvWm00a1d1YUpR?=
 =?utf-8?B?bVNuOVB0R3J6L2FpWHhMbXlBTTR3dnU5dFdUVzliYnZmdXlMTlM3aE1vSkI5?=
 =?utf-8?B?RTdMWlFuQnhWa1lENldOODBnQXZzd0Y2bDBHdmxRUjZDMWZBSEI1eTlwYnVu?=
 =?utf-8?B?L2lyRnh4TXNiQ3FVMkg5citCK1Z5NjJodnc4ekFiWWdUdDhSR0RiYUcvUmV6?=
 =?utf-8?B?UVh3cklsRnhGamVZdnkxZ1pVdC9mNllhOGVhdmdYb1lJYXMwNFZldnlnRU5G?=
 =?utf-8?B?Ly83dzIwMzJDZmQ5U2ZvZ2t6ZVFCVGRoVkdwUHByb1NFWnB0VmxIQUxKdHFq?=
 =?utf-8?B?dFpRL0J1c1I1MytRb0p5NmZueVp2anR0ZS81T2tRbEpubWhhWExjclBQd1lz?=
 =?utf-8?B?WlZNVnMyZENMakZHenJsemdqakE0VmVXeXB2blRZaWhrSWhKZWM2eFdhdzU0?=
 =?utf-8?B?eWNYbk1rQnN1UjlmbGplVmFhbVhRaFQyNkxvTEgwelAvUW5YYjNTTG9CaENh?=
 =?utf-8?B?MGxTRnVIK096ZHFMMHV5bi9zbncyOVdyVjh2OGZheVNhdWpqU1Z4YVhrSVF6?=
 =?utf-8?B?bnN1eGxMQlArVmxNM1BLUERFM0lYc1QxM3BmQVgzQTAyeWZ6enpsNlZtTDB0?=
 =?utf-8?B?cHQ2NERUdWs2ODlDVkdlVG9QN1ViSUdjREdzdlNJNml2NFBjNi85bWlVbm50?=
 =?utf-8?B?cTNXYkNiRC9RR2NYYjNOeVROL1VqOXJhemtjb2NiR3JUTk15SXlSajlvckRW?=
 =?utf-8?B?cXU4OXpKenV5czBBWENvRlgrOW9BTEwrU3RoNDM3dTVJNDRqaWl6d2U2aXlh?=
 =?utf-8?B?dit0bTdkUDhPNjJKZTVOdkQ3MnJ3dWVPNFJ6ZkkydUwxRUxTRGo5b1RzdE96?=
 =?utf-8?B?eWRhc3pXNitJZ0VhYmVDL2pNcW84ZHl0NTg5VXRSVENUOEU3N3FpRng5ejVI?=
 =?utf-8?B?bWZSdUdwK04rYjBHUjBzVElkS2I5UVJVZVBWYzd1ajViK2FqMWFOVUpncnVi?=
 =?utf-8?B?Y3VVeVlhNklrcDBvYzVpNHA5UkJCekdFM2U1dDNpck50Z3hHVGtHazFrNUZq?=
 =?utf-8?B?YlZBemR3SXloS0o0c3FvUXpzUjczSytGZWx2MmhLb1p5R0ZRaDk0U0FXVFdu?=
 =?utf-8?B?N1d6SUFETUsyTEpScGErelQ4L2xYc3dnRDdDWHlUdElKSnYyWlZWelVHUEcx?=
 =?utf-8?Q?RspV/8zqmgaBKD6FOszDnT4rtzC11MEL6UJvAyoA6sHOU?=
X-MS-Exchange-AntiSpam-MessageData-1: xHCNHNBIy+4sSw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc81f541-6f80-4fcb-8cbf-08dec3c40654
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 12:06:22.4641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiDGDXh3hI+bRgXYx7Vp8lTyl4rqHp+pSfiS2pwADZxZXqGMKaGsQ8EBbju/puF7ZlMhAXKQ6GlTozbFoa+7Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8239

Hi Yury,

On Thu May 28, 2026 at 5:48 AM JST, Yury Norov wrote:
> On Wed, May 27, 2026 at 09:52:01PM +0900, Alexandre Courbot wrote:
>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>=20
>> Add KUNIT tests to make sure the macro is working correctly. The unit
>> tests are put behind the new `RUST_BITFIELD_KUNIT_TEST` Kconfig option.
>>=20
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  rust/kernel/Kconfig.test |  10 ++
>>  rust/kernel/bitfield.rs  | 315 ++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 325 insertions(+)
>>=20
>> diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
>> index fc47614e6ec9..4fc6dc978101 100644
>> --- a/rust/kernel/Kconfig.test
>> +++ b/rust/kernel/Kconfig.test
>> @@ -73,4 +73,14 @@ config RUST_ATOMICS_KUNIT_TEST
>> =20
>>  	  If unsure, say N.
>> =20
>> +config RUST_BITFIELD_KUNIT_TEST
>> +	bool "KUnit tests for the Rust `bitfield!` macro" if !KUNIT_ALL_TESTS
>> +	default KUNIT_ALL_TESTS
>> +	help
>> +	  This option enables KUnit tests for the Rust `bitfield!` macro.
>> +	  These are only for development and testing, not for regular
>> +	  kernel use cases.
>> +
>> +	  If unsure, say N.
>> +
>>  endif
>> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
>> index 2498107979dc..4720cdd23c74 100644
>> --- a/rust/kernel/bitfield.rs
>> +++ b/rust/kernel/bitfield.rs
>> @@ -546,3 +546,318 @@ fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>=
) -> ::kernel::fmt::Result {
>>          }
>>      };
>>  }
>> +
>> +#[cfg(CONFIG_RUST_BITFIELD_KUNIT_TEST)]
>
> Here, can you also add a comment describing limitations, like
> unsigned base types only, prohibited names, rules for unallocated
> bits.
>
> The motivation is simple: you demonstrate which behavior is intentional,
> and which is implementation detail. So that, if someone changes the code,
> he'd have to walk through the test to ensure consistency, and if that
> doesn't hold - inspect the codebase for the corner cases.

These constraints are mentioned in the doccomment for the macro, earlier
in this patch. I fear repeating them here would be a bit redundant, but
maybe I am missing what you mean.

Of these constraints, the only one that can be validated via a runtime
test is the unallocated bits one - for this one I have added a dedicated
test.

>
>> +#[::kernel::macros::kunit_tests(kernel_bitfield)]
>> +mod tests {
>> +    use core::convert::TryFrom;
>> +
>> +    use pin_init::Zeroable;
>> +
>> +    use kernel::num::Bounded;
>> +
>> +    // Enum types for testing =3D> and ?=3D> conversions
>> +    #[derive(Debug, Clone, Copy, PartialEq)]
>> +    enum MemoryType {
>> +        Unmapped =3D 0,
>> +        Normal =3D 1,
>> +        Device =3D 2,
>> +        Reserved =3D 3,
>> +    }
>> +
>> +    impl TryFrom<Bounded<u64, 4>> for MemoryType {
>> +        type Error =3D u64;
>> +        fn try_from(value: Bounded<u64, 4>) -> Result<Self, Self::Error=
> {
>> +            match value.get() {
>> +                0 =3D> Ok(MemoryType::Unmapped),
>> +                1 =3D> Ok(MemoryType::Normal),
>> +                2 =3D> Ok(MemoryType::Device),
>> +                3 =3D> Ok(MemoryType::Reserved),
>> +                _ =3D> Err(value.get()),
>
> Does this engine supports non-sequential enumeration, like:
>        =20
>                    0 =3D> Ok(MemoryType::Unmapped),
>                    1 =3D> Ok(MemoryType::Normal),
>                    2 =3D> Err(value.get()),
>                    3 =3D> Ok(MemoryType::Reserved),
>                    _ =3D> Err(value.get()),
>
> If so, can you add a test for it? (This is a real example from my
> working place, FWIW.)

It would work, but that particular code is regular Rust, not part of the
feature being tested here - so I don't think it warrants a test here as
failure would indicate a bug in Rust itself.

>
>> +            }
>> +        }
>> +    }
>> +
>> +    impl From<MemoryType> for Bounded<u64, 4> {
>> +        fn from(mt: MemoryType) -> Bounded<u64, 4> {
>> +            Bounded::from_expr(mt as u64)
>> +        }
>> +    }
>> +
>> +    #[derive(Debug, Clone, Copy, PartialEq)]
>> +    enum Priority {
>> +        Low =3D 0,
>> +        Medium =3D 1,
>> +        High =3D 2,
>> +        Critical =3D 3,
>> +    }
>> +
>> +    impl From<Bounded<u16, 2>> for Priority {
>> +        fn from(value: Bounded<u16, 2>) -> Self {
>> +            match value & 0x3 {
>> +                0 =3D> Priority::Low,
>> +                1 =3D> Priority::Medium,
>> +                2 =3D> Priority::High,
>> +                _ =3D> Priority::Critical,
>> +            }
>> +        }
>> +    }
>> +
>> +    impl From<Priority> for Bounded<u16, 2> {
>> +        fn from(p: Priority) -> Bounded<u16, 2> {
>> +            Bounded::from_expr(p as u16)
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestPageTableEntry(u64) {
>
> Can you add bit 63 in the list? The highest and lowest bits must be
> covered in some test. Maybe create a separate subtest, if you don't
> want to touch this one?

Agreed, we should always test at the limits - done.

>
>> +            61:52     available2;
>> +            51:16     pfn;
>> +            15:12     mem_type ?=3D> MemoryType;
>> +            11:9      available;
>> +            1:1       writable;
>> +            0:0       present;
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestControlRegister(u16) {
>
> For the purpose of testing, I think it's more clear to give names that
> are meaningful in the testing context, like u16reg, u8reg, and so on.

Indeed, I'll switch to more generic names - some pattern based on the
actual range sounds like it could be useful when reading through the
tests actually.

> Where is the 32-bit register by the way? Is it omitted on purpose?

I don't think it is, but since the storage is generic and we already
test smaller and larger storages, I believe this can be omitted to avoid
increasing the number of tests?

>
>> +            15:8      channel;
>> +            7:4       priority_nibble;
>> +            5:4       priority =3D> Priority;
>
> I understand, you want the test looking more realistic. But giving
> 'real' names may mislead and distract. Instead, can you name the
> fields such that they underline the testing intention.
>
> For example, this part may look like:
>
>                7:4       split_field;
>                7:6       split_field_hi;
>                5:4       split_field_lo =3D> Priority;
>
> So later in the code, you may add another trivially looking consistency
> check:
>         assert!(split_field =3D=3D (split_field_hi << 2) | split_field_lo=
)

Not exactly addressed the way you requested, but I have added a test
dedicated to overlapping fields, so this particular case should have
more visibility now.

>
>> +            3:1       mode;
>> +            0:0       enable;
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestStatusRegister(u8) {
>> +            7:0       full_byte;  // For entire register
>
> Don't you have the .into() for it? Do you encourage to use that
> placeholder instead of the method in some cases? Can you elaborate?

Since this is a valid pattern, I'd say it makes sense to test it even if
the feature is indeed technically redundant. We do have e.g. register
fields covering the whole register, and use them so the name in the code
matches the one in the spec.

>
>> +            7:4       reserved;
>> +            3:2       state;
>> +            1:1       error;
>> +            0:0       ready;
>> +        }
>> +    }
>> +    #[test]
>> +    fn test_single_bits() {
>> +        let mut pte =3D TestPageTableEntry::zeroed();
>> +
>> +        assert!(!pte.present().into_bool());
>> +        assert!(!pte.writable().into_bool());
>> +        assert_eq!(u64::from(pte), 0x0);
>> +
>> +        pte =3D pte.with_present(true);
>> +        assert!(pte.present().into_bool());
>> +        assert_eq!(u64::from(pte), 0x1);
>> +
>> +        pte =3D pte.with_writable(true);
>> +        assert!(pte.writable().into_bool());
>> +        assert_eq!(u64::from(pte), 0x3);
>> +
>> +        pte =3D pte.with_writable(false);
>> +        assert!(!pte.writable().into_bool());
>> +        assert_eq!(u64::from(pte), 0x1);
>> +
>> +        assert_eq!(pte.available(), 0);
>> +        pte =3D pte.with_const_available::<0x5>();
>> +        assert_eq!(pte.available(), 0x5);
>> +        assert_eq!(u64::from(pte), 0xA01);
>> +    }
>> +
>> +    #[test]
>> +    fn test_range_fields() {
>> +        let mut pte =3D TestPageTableEntry::zeroed();
>> +        assert_eq!(u64::from(pte), 0x0);
>> +
>> +        pte =3D pte.with_const_pfn::<0x123456>();
>> +        assert_eq!(pte.pfn(), 0x123456);
>> +        assert_eq!(u64::from(pte), 0x1234560000);
>> +
>> +        pte =3D pte.with_const_available::<0x7>();
>> +        assert_eq!(pte.available(), 0x7);
>> +        assert_eq!(u64::from(pte), 0x1234560E00);
>> +
>> +        pte =3D pte.with_const_available2::<0x3FF>();
>> +        assert_eq!(pte.available2(), 0x3FF);
>> +        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_0E00u64);
>> +
>> +        // Test TryFrom with ?=3D> for MemoryType
>> +        pte =3D pte.with_mem_type(MemoryType::Device);
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
>> +        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_2E00u64);
>> +
>> +        pte =3D pte.with_mem_type(MemoryType::Normal);
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
>> +        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_1E00u64);
>> +
>> +        // Test all valid values for mem_type
>> +        pte =3D pte.with_mem_type(MemoryType::Reserved);
>> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
>> +        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_3E00u64);
>> +
>> +        // Test failure case using mem_type field which has 4 bits (0-1=
5)
>> +        // MemoryType only handles 0-3, so values 4-15 should return Er=
r
>> +        let mut raw =3D pte.into_raw();
>> +        // Set bits 15:12 to 7 (invalid for MemoryType)
>> +        raw =3D (raw & !::kernel::bits::genmask_u64(12..=3D15)) | (0x7 =
<< 12);
>> +        let invalid_pte =3D TestPageTableEntry::from_raw(raw);
>> +        // Should return Err with the invalid value
>> +        assert_eq!(invalid_pte.mem_type(), Err(0x7));
>> +
>> +        // Test a valid value after testing invalid to ensure both case=
s work
>> +        // Set bits 15:12 to 2 (valid: Device)
>> +        raw =3D (raw & !::kernel::bits::genmask_u64(12..=3D15)) | (0x2 =
<< 12);
>> +        let valid_pte =3D TestPageTableEntry::from_raw(raw);
>> +        assert_eq!(valid_pte.mem_type(), Ok(MemoryType::Device));
>> +
>> +        const MAX_PFN: u64 =3D ::kernel::bits::genmask_u64(0..=3D35);
>> +        pte =3D pte.with_const_pfn::<{ MAX_PFN }>();
>> +        assert_eq!(pte.pfn(), MAX_PFN);
>> +    }
>> +
>> +    #[test]
>> +    fn test_builder_pattern() {
>> +        let pte =3D TestPageTableEntry::zeroed()
>> +            .with_present(true)
>> +            .with_writable(true)
>> +            .with_const_available::<0x7>()
>> +            .with_const_pfn::<0xABCDEF>()
>> +            .with_mem_type(MemoryType::Reserved)
>> +            .with_const_available2::<0x3FF>();
>
> I can't find try_with in the test. Can you test it too?
> Can I chain it like:
>        =20
>         let bitfield =3D TestU64Entry::zeroes()
>                 .try_with_present(val1)
>                 .try_with_writable(val2)
>         ...

Added a new test for this. You can chain, but since `try_with` returns a
`Result` this needs to be either by adding a `?` operator after each
`try_with`, or by using `and_then` (illustrated in the test).

Thanks for the review!
