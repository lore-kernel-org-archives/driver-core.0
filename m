Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013046.outbound.protection.outlook.com [40.107.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA8820125F
	for <driver-core@lists.linux.dev>; Mon, 13 Apr 2026 02:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776047328; cv=fail; b=GGYXYWrm9pbUm1cJWrkqLEtoBHpyx8/65e3zLlDeCikC0BMyl9jlJfhJeaucTAMLo7qIkshGFFX/r3Qtscl71AWzPKuohQcgy8mMCOiM+soUxQoTRt7LqphWo5ikQUuPou3Aa+O8tzDFdfelmxPhlP0QYrdJ8el2jOkN/uchfYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776047328; c=relaxed/simple;
	bh=5JyRn3ezoVLfMkiXu1ORSLmEyhifO2h8bazTyMDKiTw=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=qBxg2WM707vPqyDB+YmlMg5hwj1Fs9PDMQeaKCn8BvWr/ug86W7+b/6WpZ9u/w2OTkTaEfrSUu8IpGWEWGU0VWGuCJIrV6eao2Dy3SMFO06/7TDvitLrLGrSBF/17+X1xUa5DxuRplqSNW2rTgF/v5WUOdlc4x4u+fpeqyGhh6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qoWQvY3j; arc=fail smtp.client-ip=40.107.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qoWQvY3j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfZYk2SfaSMAQhxghQiB09eYZU2JcjtVTLiyACjrxifg6eXlo11LXEc3wOMhv5H7NruXbI7L0dzQNehSYff4HUS0bjvkVFzGl8fMccX3awnJ2EuxL2w5XrXbXpN2PBfg1YIjtyB5Q7IS70FcgIXRi2RYqBb7CYhdhWoUF8LUajj1b/UVkw4CPxBB0ADTL1ZnQa9dFGyJtZVdmjJdXAxNEJ04I35jd28mXtGYYY7zg6kupMll6jrgKhgAYTagP2QzJ2YCF6CciM9Aa2ZNLLQ/s7RxmFNchlzo2XLsCkxtwxvlZWBjlQ3vWNiRjUpLaSxP12zFEcAs9D3T4pAkWNMuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JyRn3ezoVLfMkiXu1ORSLmEyhifO2h8bazTyMDKiTw=;
 b=r9qbOW/s6ziDy7NynEe8SxEyGBXYsk4CtDCm48JljWIVrKMiLOt2hJKJfh6DXVQto5j75phSHzCVNl1RlkOeCV1TNbs1SWtD98J0/rYxhuSDtIDsMGqYkWeyTo2W+wzNsiHnBWCV6KhiUT2o9Dcopme5MYVVEgT7oRSkM7q2iREmlSaLwSt0szrlbm0nCLoqkHfg/gMQTz+NrRYiembLq7u5jmCHbPbb0GbhfBhWyp9SYmMaW6f0A4pmfHS8Z+erxPxhw11oW8povRw7DbBHP0UxT6sNVDi4NKtiwGdtLZxIoFcqlILWRAffY41vchK7neOtcwMNwZBbcIM+ziXvNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JyRn3ezoVLfMkiXu1ORSLmEyhifO2h8bazTyMDKiTw=;
 b=qoWQvY3jhx3Sg/CA3g79gErlza/mVkf4nwyf7QzK9AGDAfQVIMluo8vVYBqqoUD9KDeBtaN3Z/JMQWvXE/dHVz6jSyTmAZS9hLo+uz4y5FMvU5F+8Sscfl6ywsWIcbWY+JduUXcU9L3BGT/WwAqxvVzwgrIeIEtPMmlL0kY4+/+SWIYFAGqLtT+akvLWjtHNjeDGOXaixoiqE00tjffAyn95vvzqoGOwUtCLk1j26nD4mu7wFyEfFZMSPkDR1tJ9vYUsgJvkdYK+eBYI7zuuVoVHbYNPyrIXL6cRJHSwkLFW5j4G5UzR0pXhUZ9r4kZKC+fyLrGBvI+8MiOc8zpmIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CYXPR12MB9428.namprd12.prod.outlook.com (2603:10b6:930:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Mon, 13 Apr
 2026 02:28:44 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 02:28:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 11:28:40 +0900
Message-Id: <DHRO8BEKJ3G0.3MOZ89YFK1B36@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] rust: bitfield: Add KUNIT tests for bitfield
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <20260409-bitfield-v2-2-23ac400071cb@nvidia.com>
In-Reply-To: <20260409-bitfield-v2-2-23ac400071cb@nvidia.com>
X-ClientProxiedBy: TY1PR01CA0193.jpnprd01.prod.outlook.com (2603:1096:403::23)
 To BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CYXPR12MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eaf092c-f735-4471-45cd-08de9904624c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|10070799003|376014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2+eDU0wk5ok4cWTKAqy4uRmcP89v0AZZktl/DMH1Slcosfqh0B5JlVg8m7lhf/J2jxpexzUoMzSSMxMZVnrleasMJQmpuMMjQdbYGD4qGOLmWS+TxJld8CyeO9Dj5gNeCR5W35Ifc11BB9vLmuiVc8WUObg33ClY77+45pJvwV5UmxU3yFIDgASfMdBMYOj7FxCP0d+4iEHD8KZMkJUaF6qezgS+jKVbcjIQKh9hJRx4XyIxyU+oZBFgccrcXEeARsIJgoHEBQG6gQJwianrGN6NKaAguUi73x1LzQw0227Akkhv6rF1VA3Fy7cTzCReuxCL0L1NP9k0T7i9nQaDAd9CkEV02BU1bFXRkdbOv5njGsDWP9V98kBqpHgxY4OukUUxOGv+qAj9b9zZgKR2rq5ZWO9PnKJomJKDt6Y74E0mzoo9jxC4OkSJeUcMGwzMLzv6u6QnQumHKymrEkwvNHZsyBy9H7yyjV57LurbnT2CKV+9fzHLfAOX4eucQani16GWTiejsbcFvCY8YbJ7wMl5U6VI6mkQQrVRXK3LjB9D7AseHIBFgetKHNfeZ6f8NxgP0y4WOrNn2dTXKvuGB+cw866KwBiso4rVJWxpNv0L9srV1GA4wmXjIChI82RR5XWQ0l0gqWhOhlSVdmGhEd49MKgwfBMurhkAguZotgGJTHECp0FmFlQjV5WKzwNEafn2EfNM3hAjgipxF5I4G4ltagjCg2cwp4FQj7Z1KZlsA/DunXPO2Dm1TE88UHr8o+aSRNNrwXrW2/IoswG4/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(10070799003)(376014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXJLRDJJWkFTZjhBZ1JpS28xRjNVRXM0aDFiaE1oYVJ4YjE3VmI0SlA3Z1Qw?=
 =?utf-8?B?VjNOL3QrcnhMb2VoSWRZcUhRYytpRzNPNmgrOVpuQ0pxd2htaC85TFQ1OWwy?=
 =?utf-8?B?OFNzSng1aHdiOWVjdXc3Tzkrb3lwelNIemJIR3FLaDVpMU9zRUJhVmdWQWZ3?=
 =?utf-8?B?dnNiaXpzSHFQMkxxT2RHZnllUzVmSmtxK0JaVDh3WWp5Sk9TVWkxdU9hZHA2?=
 =?utf-8?B?WWxqWFpwKzBNK1FyemVySHdqZFZTN1ZQRUJBaHd5NWJRRitmSzFEMUlnUHFW?=
 =?utf-8?B?TkVLQ1VWREtXZ2RzNEFPRTJEUFVYYkw5WDRXSTg5aHVrd2E0UGJsMi9KaHYz?=
 =?utf-8?B?TTJ1eGRkcUNYcndYa2xvUUVtSUpmS3FFSnNwZUpwWGFZVFJ1THFOTDVlM1VU?=
 =?utf-8?B?bjVxUUpGUVNpbXdTUHplNGNLNTA2Q2gwRHd0cXk4citsZlM4ZlVuT3I1QmhV?=
 =?utf-8?B?cEFEVmpMTmcwZU5IWVNmWUVqQjNadVJsS1JhcGdzNC9ZeFdEWmtiM0NEZFJ1?=
 =?utf-8?B?OXN5N20xNHRIcThBSTVTYjZMTnBmcXJTSDdoOUE3MTkrdlhBazlJRlhjb05r?=
 =?utf-8?B?SUgyRmQ2a3pka1J0VEduUFcvQ1BXRGFWdk1HUTNhNFFqRHhEUnY0NjErUlhK?=
 =?utf-8?B?cGkvczZiY3ltYUxhd0lIcUdYdVRvekZqOG9raXA5Z3I2OVhCQTJRNWpnUjcr?=
 =?utf-8?B?MTVaZG9FeERSZE9qRERrdUM5cWFobzlPajJpc21RaWJpL21YTm1kOURDNmZZ?=
 =?utf-8?B?cjZWSnU5RXZLMVF1ZVlzSlVDM3d5anpXdTlIVGtnM2xuZS93RDZkZHdpQUxD?=
 =?utf-8?B?TmwxM2V0UVRrUTJNQm1IbVdqVFFnbms3Q3lZZUNUMHJPWTFSZzU0aXJ4VXZs?=
 =?utf-8?B?VGYreU1oRW1uRVg2ajZScnBpSkkrRXRleEViZW5weWx5UHN3d3BEMDUyU2Vi?=
 =?utf-8?B?VUV2RjNBbDVpak4vQmo2M2pWakI4ZjZtVjBBTGtFbGc5SHJqVE1NamRRekdN?=
 =?utf-8?B?L3daeWdlTVN0c2RRWFZqMEszcW9qbFk0OWo5NWJGK2FQQVVuWExuTFlvNC9z?=
 =?utf-8?B?dzZFUStUYjUralVBL2pyMkJUcWhFRS91THhVZUNBNzdXYkgrQ2NsNkdZbVBP?=
 =?utf-8?B?anpSVGZYcWVURFdrdkkwaXpSUC9pM2FFMUVlSXlMSktxOW1VUGFjQWxPekpV?=
 =?utf-8?B?TWJ4aTlWbzBmRnNNR3hhSmxqT0F1NHdGYm9mOW5NcGZadWticHh0T0d5UFdN?=
 =?utf-8?B?MVdLRW42T2xiT3A4UmVsQUtvd1JsWFk3YmlFQStPN3BJa2hUdnVsZ2pURHhS?=
 =?utf-8?B?TlFjUkFmdVBrRzhVdjQ4dmt6Vng5MkZ2MTBuVDJiRTBrL08zNm9qUmEwYnBH?=
 =?utf-8?B?ZFRIbXc1TndjUTJkZEV6Y1YvNzIvMlRIZmNzczkzR05OQnpOSTZEY1BpeFp2?=
 =?utf-8?B?NUJGTjZVaFZoSGZOSzM2SFF5aTZqZVdtbytJOTRHUlJBWlprWkNvT3h4b0lv?=
 =?utf-8?B?ak5maHVDWWtvMHNma3NBYk1OekdjcXNVODBMb05odHdic3hncUhlZkMrRHE1?=
 =?utf-8?B?RVJ0WEs5WTg1WFdodnhUaGl6YWtTTFpoSWozdmh5Um5LVlI4VHNxZjJ3bGZi?=
 =?utf-8?B?S1Y0dmdwcWZzQk1IK2krSGRnQS91elpsTVlLMU5rOW40QmFob1l2dG1aT3ZB?=
 =?utf-8?B?VUJxOVYxTTlXa3VqTlE5UXVwc2h1WWJWL0NwdW1lbEp0Mis1blFQUlZjY3hH?=
 =?utf-8?B?YXJMb1cvNzJPNks3b0ZOMTgxQnY4WHJKY2VQam1vdEFSSTdvdEVEOEJyVXFy?=
 =?utf-8?B?U1NzZktYYThRSlQrMFYxYlZkTmlKckhRRmh4bE1mVVRKMmg0R2dmejBGa1NY?=
 =?utf-8?B?eWRFQUdJWEVFa3l5OFNkZUU4Ym40cm1qL3d5d1RDcTRXWE4xV3ZuellKSk9j?=
 =?utf-8?B?dHh3SGZPMkYxbU94VUdabFdWU3BuTVlUTFd2djNtZFAyYXk1b2gvdUpMMkwv?=
 =?utf-8?B?WE1OQTdZbGphazVNanVRVElTajhnWHd3L1hVc2pKQ1d4Nng2b3AwRXRXOTdp?=
 =?utf-8?B?ZDhqZ0g5TGYwWmpXalFFZXpTeGlqeExzYkZ6cFpvbmRwSSttemI3SzRUUUFC?=
 =?utf-8?B?NVFSVklFNTMvMWZpTDVlMTFrRXpMQnRFSmpxZkpPT0UwWkxmMG9ncGVQK2d5?=
 =?utf-8?B?QURNQmY0dnFyTjFKUHhiVitKWjBRT1J3K2hnUEZGQ3Uxa1JuRlBnN2pidkJv?=
 =?utf-8?B?QzE0STQ1bElxN1VVajNtTG54NGNQQy9FaTJvbVFQWFVMZ0xqcThrSURWRlJZ?=
 =?utf-8?B?cVdDT0tBQXk2ZTU0bERNNWJNeW8rNXlDR00xVVZWTXNsaXBZeFpFU0Radmxk?=
 =?utf-8?Q?xr0kFwn9g58XaI1YyPCYbnY2nw/ABxBbR8Ki6gSjyLg5U?=
X-MS-Exchange-AntiSpam-MessageData-1: S+YsGqSVT7GmbA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaf092c-f735-4471-45cd-08de9904624c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 02:28:44.3521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCzicjNyyxAHqoFKaXEHLJSaiuYmfJjUFsIK3Aiwc+4mLzdZPMKPk071kQjV9EDerFGj2QFqWYssNSESIvd6ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9428

On Thu Apr 9, 2026 at 11:58 PM JST, Alexandre Courbot wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> Add KUNIT tests to make sure the macro is working correctly.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> [acourbot: update code to latest bitfield! macro.]
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
