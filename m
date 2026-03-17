Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022117.outbound.protection.outlook.com [52.101.96.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067E73C0602
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752174; cv=fail; b=hg/z2I17cODvjK/3NDw868d6Be/P1/7ncs4lI7RTu5Sy05tbKbqj8iNazOInGj0/OOEVO3s6juiYNDTTe6BiRYZw3xiveKjGRVBJNmUuJVqfTV71C0eUBJruAu7r0HAFtbKDbiXgpTitw3XY10azo4fn7JrQEk9mvq1GZd1UDJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752174; c=relaxed/simple;
	bh=/+X962wQAn7Tv2XAFkArD3jXRAXa9z2c4hLBGTso5RI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=umWBjBplLNEQGsexoQ9ZGBqkwtHZE97JaC8lp+aA+4Y7+aiSjo5APs48ITl5qJwPMM6AJTgiGQchRkTFWkHvR1+9KSPbuZ7ybbVdlkf4mWwizMQIbaQ+sj/AdtRh52TzKAWBEOQUpY72maXnyOQLAMVOixe2kSUqYaf8TCi5OCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qzRK1Af9; arc=fail smtp.client-ip=52.101.96.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qzRK1Af9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F89HBVtR3NhiIxseU2ZnY4+0GgCtQa5XdOxVEjq2KHSptAsQMRWKWVBsgQdVeDxz7DCLLPDPF1KG7/jqd5uzYOU9tw03i/di7gkdGCVjoNTWKPv4pzfrM2OYpXNBpIUz66NIM2R7IuAYaS5ALpXoyHv01zxHLfq0VzwVUM+B7dqo9Y2f6gqzCSchjSj/T8YyKbyGPKi4Z8yHUKEnO/SZdPFP2X/NbQpXG1QhkHgT8r3Pd1VD9P4o4QWmh5m5vmb8JeqnQpEvLUdVdHmFbivyzU/bz6KVhKSIgbb1Oabg5UbDm2pU1CLWUA9RWh0K/g5lxkYDm1luoq6BhiEani1dOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+X962wQAn7Tv2XAFkArD3jXRAXa9z2c4hLBGTso5RI=;
 b=K8i/+TrDeZBBo5Ddr6kPYRf3r6K08vERw8NiYOLxhA1NwrWV+JIcE3wVJYQUZ4ju5wQ1YMphI8SYKhge9Q8+mEVvktnSKhCJx+53FjklkulMa+UsWyA2uTJt4ro/C9I7CcY6onZq++u99B5F0KxetnwJd21xAkSnNoNa5mMtk7RKKqq7lof2h2BXYn4kbveOQslfKDqycsv3O7/CvJMHzHCorODMFPraCcUkIxleDm0wZC34Qo90OYBkbi2B9yy1NMAkXlEMZmRhDxVInV1QyVWaJ5602XRd8xxAkdRGfFH/aiJAdYC1JszR47mvPuspN9B+IKF9afPldFXd94Q6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+X962wQAn7Tv2XAFkArD3jXRAXa9z2c4hLBGTso5RI=;
 b=qzRK1Af9cH0+GUvKlylRAmfdvWP8L4w3UCUhiLouaq2DJqVYqDY07wiqrhSzjmi0K4NlKOU9JJxCzjqE1fDJOmeV2zrY4JSxdX2XgIx4WBD+SjpEDYgZO/dQfNZ5h5x6SPb5jaSjj8a/ueLXTiJwuRGxDAgJPpVWGrndFBr+X48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8512.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 12:56:08 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 12:56:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 12:56:04 +0000
Message-Id: <DH52NZ8L28QN.JTWZP7UBYL8Q@garyguo.net>
Subject: Re: [PATCH 2/8] rust: dma: add generalized container for types
 other than slices
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-3-dakr@kernel.org> <abj5mOYQAY290nqY@google.com>
In-Reply-To: <abj5mOYQAY290nqY@google.com>
X-ClientProxiedBy: VI1P190CA0044.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: ead0139b-a2eb-402d-2804-08de84248e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	H1BBbZ2PKJ0mjadQES2PcGpW9+G4dQYA74SDvTM/6nIUBXKR30VNTg2rcP/1c1eiQlhXhw3YNOWvrN6V3eO+ZU23HkN4czB/TG2JLhsFCR4md+KIJlMhEH4k/TFtEGjc0CuzTkxAa0Ia6HCZZPYEblZCEFAjwAeZ+FHjuh4xa+EzKWLUUKuguaV3idmQ1Lfs+9wG1FR0sRYm4maCRipUUN/1d18RmwZ+BoSk6S7akVxDfU8nAs/hQfOvEwXNCyrcf3hK/+cVJve9xxqKG/GtzBflHmn5F5iqGJiX/4WbCsMObn3AC1jC4uPV+378qqIaDeWUuSE9ZkDHxwYhD96nmCANHzAibwKXhHYh5MWX9bdhmXFLiwLfCav3BPcrj6+2wA1bPlYsNKdFHWjbKPzVo97Fmr9ZO8nJp8++2fpMwKrCRdMXBs6KmRk9AZsHC30enVdxrciQbA7kxjSyeeRPDlTJqtZRTr1d5mmB6EBWfhsZiIi25fsgSQayWa7O0kqMaXU3bhjTAQI5GJi9tVJjbQz/+yJXvqTEGbxSubBfcgLSCF7AFXEPWy7YAH1ixt3dWywtBKLHbu8Ny0iKxQaLXqwLBbz4H7Qb3OyFLuTbxbDb+NMZlp/aO1dth4dSmtdxjHCBIyzjOkQpRLNy5Y05lAySAQHZINYxsLP3GThK3jZS0HNy84JOs+Nc0knfdzx6+xGIGmZeIlQrhUW6zQcqrl8+Zkpm09gNhMNDwZ4kVFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UCtJQkRvck9JWmVadzdFTHVGalo3eHVUajVlZlRGUk9VYlhrdkNFVElFYW5P?=
 =?utf-8?B?TFR4djhFT0ZjWEFRSGtkck1TcGpZTnFXWDlzZkh5ZnZRb3ZMNmRUWU96TDZj?=
 =?utf-8?B?aWF1Qy82YURWMnhlYlNZWTlDdXdPVXJwVVlSOGd5cEdJZlB5ZkZwQWhUdVla?=
 =?utf-8?B?SndFUXZLcEUzWW5nR0hDaU5iUThQRjBSRkZ0VTBWT2VRemFwckRJTUlPZFhv?=
 =?utf-8?B?djVRejRyNFk4cjJOSzRKTzZGM3A4N0FuRmtpYTFVd0Y2UFNWdXFPMllFMksr?=
 =?utf-8?B?KzNzSjEwM1hGSlQveGdNc2pxbzdOcG5CdkxvWWZsL1RXSUpMOFZYNytzdXJ2?=
 =?utf-8?B?ZHRObklQaXJQSEtJbU1RYmFhN1owei83WFVsSWVCK0xCcFRGakdRODRVRTU5?=
 =?utf-8?B?NVF0RUNEVjJ4aTVNOGxhMTFMYjhIMTZLaUZqQkNrRDE0NWhiT3pMam9vVDB5?=
 =?utf-8?B?OWVVL3BGOVA4NG95UzFyZXVJQ3ZSY1J1NG42dGliYzFsenpZb3lrR2RGNUJp?=
 =?utf-8?B?d1ZjODZSODBhdSt4MFNGWnF2ZlN1TlJlV0NxWkZ5ZlFsanV2NEtWNHo4SytS?=
 =?utf-8?B?NFIyLzZKcDBQVEk4Z1RqeTFPNk1PNmF4c0YrM254OWZkMXlmK2JzSDl3cFZs?=
 =?utf-8?B?eGUxTEpJUFpmNmI5Z0tYSHZ3TERlOWkwZTN6dTdVbndLQVJFN3UxczJtbXgy?=
 =?utf-8?B?UjJSZHBDbGZPSmkzVjNtUU5Db0lZOWYwS1NSZmxPRjI5dmdMdHUxcktyb0pQ?=
 =?utf-8?B?bjFrUWE2YzFaQ2FtVFJhSmtUQkdvODVoR01wdW9IRUIxSEdYZ1M5SnF2V2hs?=
 =?utf-8?B?MHRWeEJlbkMrMEFrSXNOaFJySDhCZU5mMlZxY1VqLytSVGh0T0NLRldKUGsw?=
 =?utf-8?B?bG1WREdIQUQ2TWNjUjFqbFRlWWVCVXN5dFJnSDl2QVFxZEJQZ1JEWFE1QmZU?=
 =?utf-8?B?bTVuVjFaN3ZCczh2VTUwM1l6aFBhVjdXMWVTclNXRWVKWkVpbGtKczcySkRn?=
 =?utf-8?B?eE05SVhtNHRUNUM3MktoZ0NtM0xJVVphYTM0NjFJVGovR295alZ2dExCQ1Ri?=
 =?utf-8?B?YlZPVUQveExlRlRkb2pDTnV0QkI4cFBRU0hhTC9KWTlPYjNoTEp5MThVRnJ3?=
 =?utf-8?B?WkQwRG5zbXp0b2VjRFRVdzZtVUJhSlNodHBpV0RST0RHTTRSdWpIZE9scmtL?=
 =?utf-8?B?NllEcUE0d0JYV1NVaEYxMkFsaC9NL01mVlhKRW9hdndZSGlySmVmeE0xcGR1?=
 =?utf-8?B?OUNVUnQxaTF3Z3NZOG5QOHg5NkZINUI5R3hva005aENsQ1B3aHMzSjdOeDR4?=
 =?utf-8?B?TkF6NWlvS0NJM3NrMlU5cUlLbmZmQXNhL24rQ1cwOWJvZThDSHBENFQ2VlBp?=
 =?utf-8?B?YTN6QlZReklET21obW5tNDdOQW1qayttQkwrbnlKeWFiRlRFL3ZwNlBsQlBi?=
 =?utf-8?B?YzhzWVdwakdzODlJdXRHdC9HdDFCZEVFYXlUUDZQbC9BeDZIY04wR3FvNE9D?=
 =?utf-8?B?V3lveVhVaHUrcjkyN005dWY2UEkrb2ZIRzcvMEtiYStrMWZtZU10RnlQTkJj?=
 =?utf-8?B?dHppUS9yNlNrc29DTko3OXpHYWlPa3JOMWRkSlI5bFZZQUhJRTVvdWZyUXJR?=
 =?utf-8?B?YWEyajhTK1dpdkYxNjRlSm03REJURHRmazZCcitOd1BKNDhLWHlIRFY4SFZG?=
 =?utf-8?B?Uy9POXU2V1BSVDlvWHBwWGJhS0Z2STJFTjhoL3M0ZzA1d2lBaU1KeG03YzR1?=
 =?utf-8?B?cWpUSzcrWUtQem81dEM1UVdKQU1WVjFkK3NjSGZ4ZnJpMGJ3ZlRRVzFHdzVW?=
 =?utf-8?B?VU9FSVJHMkYrdC9EQ1dwRUZjOFZza2dqN0l0K09jaEt0eHV3UGwxRHFBY1Yz?=
 =?utf-8?B?bHd4UHZyM1BXT28zbytrQWNtbnJjM2hNWlcyZGdTOVc4L3dXSXZtRTlKTmFy?=
 =?utf-8?B?TXRHTzhTd2pwd0xVRXgybVFMUjlvc09kZFhaK2FpZHVFN3l2QVFDS1VSZFVW?=
 =?utf-8?B?VThKWGlDbS9xOVZhOFVFVjgxTk1WbVQ1Z05hY1B4S2FCZHdXcE1xZXRXaWRP?=
 =?utf-8?B?bUVlZkp6QUNxL2JLNzlVSlhEYkZXUzJCUFpXMzZpdWY1bmwvajA1NjBWRUwv?=
 =?utf-8?B?VGhaRE42VDcrRjZiSEpSdnl1aTBLTTFQNC9qNGQzeCt6V3lvVmNSQzdCbG56?=
 =?utf-8?B?RldLaXFXc1UyR0RPd2FORXhsZG5Oc0RUb2R6dGNJZzRBbWRuOWVUTXZRbTJH?=
 =?utf-8?B?NTE5L1Nqc09TZW9WVGRBMHhSckZ3WHJPb3dEOUFQbHF0VTNaUU9vcTVyVHRT?=
 =?utf-8?Q?8FvPCjOZpmVmRcpujL?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ead0139b-a2eb-402d-2804-08de84248e9a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 12:56:08.0787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PjxcG3QjDlDQk6coMxQ1GUAiExhTQhBh8ceeUJ+MNOJs3zeYUFsTs+jNeKY562xev3KHVXZv0ROMlx/5G/1ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8512

On Tue Mar 17, 2026 at 6:50 AM GMT, Alice Ryhl wrote:
> On Tue, Mar 03, 2026 at 05:22:53PM +0100, Danilo Krummrich wrote:
>> From: Gary Guo <gary@garyguo.net>
>>=20
>> Currently, `CoherentAllocation` is concecptually a DMA coherent containe=
r
>> of a slice of `[T]` of runtime-checked length. Generalize it by creating
>> `dma::Coherent<T>` which can hold any value of `T`.
>> `Coherent::alloc_with_attrs` is implemented but not yet exposed, as I
>> believe we should not expose the way to obtain an uninitialized coherent
>> region.
>>=20
>> `Coherent<[T]>` provides a `len` method instead of the previous `count()=
`
>> method to be consistent with methods on slices.
>>=20
>> The existing type is re-defined as a type alias of `Coherent<[T]>` to ea=
se
>> transition. Methods in use are not yet removed.
>>=20
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> I see you have both `size()` and `len()`. I think it would be clearer to
> rename `size()` to `len_bytes()`.

This is an API that already exists and I simply moved it around so it is
implemented for all types, not just `[T]`.

I also think that `size()` quite unambiguously means the size in bytes (lik=
e, in
all allocation and I/O APIs, `size` means size of object in bytes); I don't=
 see
much benefit in renaming it `len_bytes`.

Best,
Gary

>
> Otherwise LGTM.
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> Alice

