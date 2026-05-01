Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EEC3112BD;
	Fri,  1 May 2026 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777657091; cv=fail; b=EPgixFkIi7XmzfrXAY/HwVTFiIkq0cEe+1FTE+wS4xaG4lVamDanMbPuNbpIJc2vjgOx82WkeX1PumakJfaMpgzttML6fFjGOvTO8ts31u4cD/yh2z64e9LB7aPgrbuug7MA/t45vF+ghdw3qHvHAPs3KyxEAPxUFAtY2Dn6yJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777657091; c=relaxed/simple;
	bh=uqZ0xFl6hCR3ZSG4ZhoUucTDOdCCk1U+QH7rUKSlvsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eNoYfCD+pSUBT8BaQ03WBA0F3WRcM71LyBDYFvX5R8cl+bw68Ay2LClMsQxhZCoGh9wqTNPwied2XZQ1KAUL18AeH6wNtDyJZT3MijCbIedmtqhd2U76HMHpqaMgOaG4iiyAwBF3WnsYnAiUvUtCGpvk1FrtZ/Ur+bs7YfteE4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NmLoVl7l; arc=fail smtp.client-ip=40.93.198.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NmLoVl7l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyrLi0Q5bdJV2cWBzM5/prICuwKkVt3iWlr/K1YPCJ7BRtfazU0QCLf/C2QoUiLNm1ffp9kIYLdSIWX9V4ztkXJ4sQI4vAXS7JvnHfHLzyMR3lW+qKBqbEN8Ssg6IU53qtl5rL34dciIFeKetFkUeiMplYWag+I5MJWlQWlEj2kfHp7qMBmFu0FnrgJYDNNdGjyHYSetBG74MgZk6AR5l2aP3/YmDN0icchHTP9TQL3MftTK/fFbT/B7NcFHsvCWIOZZ2ujNDQGpkQCl2dV7YmySZeI/ZUrYoTDUeN8WVGBma//8X6uqY6SrCPpi/ibYkVGw7D189c+7BZX1bAtniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNk/1Urv9CoXia4msaKo4jproulsdsAHJuaIBRHfSpg=;
 b=iF3UlvjFOrfH8G0Bg6bd6Z5yn+SShWsa67GzcvkLaD6q7jiQ3qQF8qGP8LbFpfffDwl9lut/MxTJCin6esa9zEof8FBSxWxc6M2gJc5/8J58WEWahLhrgio2ixAdeo2OPoWDn7dhyKpwV1yTIh6pLTGrhZ9S5BjYtaWLUkq3d8DwJDlNOmurQL/QAkFneUj7hVEPdZKqOx9JunznX/Ml0hYMVIYenxTCNG0pru51318z8NQnbn5U2Ia3V4voiGmsQl1m5xkPdWIr750ZOLY0gSXtxDTiqO960HO/fwD3MSI9Av6GErRX2nrVJzWOqAmZ3plC/iKDQ7FTGe/ST0epUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNk/1Urv9CoXia4msaKo4jproulsdsAHJuaIBRHfSpg=;
 b=NmLoVl7l0RIqJ5O4ZOX5eCdVOoSYkGlAqOpV1EzyZGdbnxI7wv1AHW7HPdaX5PoZN0LMA5rYbBqQnMtaW4RFa4XoI3OKMySt2vjQX8wzms1yNaEA8DniUufeaGbfbdy+qdXYT/e75mjWLuG/CLyCH4l/Ce3xtBTDgLQo33CuL3TSdCUOgDBhndlFyw4fCjWx5JIktG9wvLhs3eS+rKCcDyj2LxCQcUkav5HW1bFZvWEtfOFEtT+CJTfR/PvvkH3IjB8HTK+biTiDg9w8aErj8/3f5vPu7zLf2HphfFliQoKvivC5TKIdAqRsWOQj4HH2Jy/ijfkRwv5wkrZJhVZh/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by DS0PR12MB8197.namprd12.prod.outlook.com (2603:10b6:8:f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 17:38:02 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 17:38:02 +0000
Date: Fri, 1 May 2026 13:37:59 -0400
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
Subject: Re: [PATCH v3 2/5] rust: bitfield: Add KUnit tests for bitfield
Message-ID: <afTk94w7an-31LPo@yury>
References: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
 <20260501-bitfield-v3-2-aa1076c3337d@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-bitfield-v3-2-aa1076c3337d@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|DS0PR12MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1c39a7-b007-4a1b-71a5-08dea7a864be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6VS3t4Kq7wAx1+9WJxl6OzLM1LnB4wkaThjGYIw9Px91YJWpXfKSe0ca5lpKesg5iDePuC/4tdwn8GA6rvgq20Dh8WdJGqo2P9bjQYPc/s0TfjVCXOJUCj9f9tZzGyQR991yUe8oDr6SH3a09wcORwhumAduBo9udtwFs3nEH9pPiNwI/rrrLv6GmJ+aUKCUsvRQNBy12ZU9eCHfASYlSHH3baX1ySPjIJ2CGpMn+oesA2sCRB1HmPOQ7HgIgaiy+nFhRYdLWJ/S+E764+UG4u83MM4tXkRxUBqr4sGmmJtmWJeSqoxeDwjvt5CyODc0Nd7l4PJrEA0gGrnG8xyAcudL7YJaJbUk3wrHKg12dCXdfJK8oG4JpmNSDfQrccIECt7cGMQDWzU5z2uMf1v9ZrPVPw28WKhnVRIZG4rIvmnFGYAFdoZoZrYYZZNW3uyVcCorYvBxeiJ5nHsMlsHHZ5fymS5A1oZnVaxXJwZwtUnG7Kz+s80yAhheX7vIS9/K9EhVb5S+7abSBFqXgZbFaLSWbfAqhO1Mpv9mCxmTc60n2cYZYPde66rjoEcFziLJNwyWfQiuMMQd2/OYqemuhymGQafGga2QnBfY0fWFpnfHp8io2GqIsdTJRSwpyQV1Qd7CzX22OYewmCOvE0cGp6TazDvYxwt5JWot2vsj1QGNt1JEI/U7Iexn/pG5wofm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hsmDiY3gp8qw/6VBb0Xi2XAgXBxPJxA9wne6ZuarWfjzh9S4ij52T5IGyye+?=
 =?us-ascii?Q?RRmI+XAgLgc/G+7Ba4oSo9wcEtP4165KBFKPxCFZdKpU68setgfd4gI6XCeH?=
 =?us-ascii?Q?ej+7/RyMT6oN2EtnqIMeBZCia4SH3Ofjfi3eXZNhrsu23jKjTQeu0t/aZ4p4?=
 =?us-ascii?Q?qInIPrxfZiL0Cp9239yq1Gu9fLVPnG//IO+bZ0LXP3h4YEOCA7JMhXP0dbXI?=
 =?us-ascii?Q?OA5ZDcWzfasEAeKEqNgm1p1y96LQ+erYbWxvW08dtWist2zvu7x6jTEcSuMU?=
 =?us-ascii?Q?FTR5/m6IR0QXSDRoM5ocnCIxFwCZ2cbJkin/Q1aQxTZZWA+awXh9OwrDYM2r?=
 =?us-ascii?Q?a+naWsW0BAaupwalV6myYyxSupYgMyLlza/JeiytgDQcYCmeZ41oYUwCuKHs?=
 =?us-ascii?Q?RJWGk5SJY/HcF/LXjkuIQ+pSjLdmDV+PHIIxH3JE2dNIBIMX6cGLHVO9VKHz?=
 =?us-ascii?Q?zTZolR3a/1HDxfO2rvP5C69BI24HmCTVyHCGNVB4Csl0Qac2/iim49ZBXBQZ?=
 =?us-ascii?Q?z0bzBT3IAH79dodBDLc2mKbp6pEhOHhqlHhmvarkalcxX4DcYx1FaOGvdmGx?=
 =?us-ascii?Q?F64uhOWnzhKkY/wUwL3RzOxXQSFxW5+mOYLqL9wPEs6N4UQ6ee9CPmxYusQH?=
 =?us-ascii?Q?T56BbEpRqtN4yW8boZuzCYMHhKOnEygfwXaOAGfL+B5f3d6RuANSxE3Sbmkq?=
 =?us-ascii?Q?+Slmm18RRXalz5cnf0sa473pQ1ABygZ+bUf5P4TJ/JHYZvw+0Fr0wZwQUPi5?=
 =?us-ascii?Q?Oeg8XrNKMov4ZFG44sESKWY/5VgzqjX7lwkMevNU30DRMn4T0NepIEbkilG1?=
 =?us-ascii?Q?lkHDEe1z3803FTsFQV7JFDdhRZYdGvu4JWavxS7VFSP3/QLgxuvCcdC2okMI?=
 =?us-ascii?Q?LxCHM7OKgzgTYqJ1fivWLSf5Az2f0gOTNZHEu1gioZ71GIX/FyOd7nlptRqm?=
 =?us-ascii?Q?1a+U8P1JINh+63/wEeV8f0yh+/WWplGYeQfnaq/IqyiO8dMUUfRlSTTIi3Rh?=
 =?us-ascii?Q?fWF8WyusWNDnNe5zzFOCV9qJwGiW9nEdBor2fA1/jOSu1DG+6Wipwoa4/LVu?=
 =?us-ascii?Q?9qaze5M3i/INRGWprWE3yBoqWfs8OzybgiaAANREsuJWhC7aTKKF+K7mve98?=
 =?us-ascii?Q?eetZ7Z4CxgBdLeSENGmfYuQdjgY87pIjC+6FYqtTa6cHCRvIdBkCQZSg0/ig?=
 =?us-ascii?Q?qNDjjxFvK9uZOa8zCcs1LcmunAJZwDWA2DXH+zBFR6+SfwZe2mp8jGETri86?=
 =?us-ascii?Q?m6bnwwJIOBPcw7JDoFSiLjpzTNl8fGfZODr8hCgplHLWuI9u0VQB2KsGH/I8?=
 =?us-ascii?Q?mraCPOU6QBHmDlMP6qFg12gbDLLnwd4UuEMiO53AT3s5o5ZzBTSOfwOQJys1?=
 =?us-ascii?Q?XKr7GUNUWNAfrMiUTjYRS0fA+zS83LKt9SDjdE1f6TnpGSnm0WUeMvaF3d9I?=
 =?us-ascii?Q?8a3e4rn2fBJnn55N/BCcLtD0SnSBb2VOcEZv0cS2MM+iqhwiHyjBy26V/qFG?=
 =?us-ascii?Q?+veN/kheVnAm8fH1EB2FuJPWxzlAbjDQwIWrvjP7C2uwGu2e+LraJX8c0C6r?=
 =?us-ascii?Q?yFgAhuSYx7igmmhNorGsNmt6wM5E3uY36J7rLz0itN0TRsAbw7fft3T4CMyD?=
 =?us-ascii?Q?WOAoRxJjkNCGacaD/xusD7Wv3Se1iDsu0PZ/PD24iivFpG7mgNcRP2YyzhwX?=
 =?us-ascii?Q?zH2SoqSyqgqbg2B+l2v3VPAxauKKKHkCczxae81yBFh5PJjk2nEvZ8HmGnwt?=
 =?us-ascii?Q?k7QHl2O7b7WnfTomc16eWF5lSqSvZoijTyk9JDLSjeNj7G1g9nSz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1c39a7-b007-4a1b-71a5-08dea7a864be
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 17:38:02.1550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hmitlo8weZkQs6jzDArKEibaJNuU8sN2adFGaLu3Dp+oZhxXvPRlZ3NTUo+Wl9m/mguA/kqaDl5628OnnsV7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8197

On Fri, May 01, 2026 at 03:03:19PM +0900, Alexandre Courbot wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
> 
> Add KUNIT tests to make sure the macro is working correctly. The unit
> tests are put behind the new `RUST_KERNEL_BITFIELD_KUNIT_TEST` Kconfig
> option.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  lib/Kconfig.debug       |  12 ++
>  rust/kernel/bitfield.rs | 319 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 331 insertions(+)
 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 8ff5adcfe1e0..916bf066c016 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3608,6 +3608,18 @@ config RUST_KERNEL_DOCTESTS
>  
>  	  If unsure, say N.
>  
> +config RUST_KERNEL_BITFIELD_KUNIT_TEST

Those KUnit tests are all kernel unit tests. Maybe just 
RUST_BITFIELD_KUNIT_TEST?

> +	bool "KUnit tests for the Rust `bitfield!` macro" if !KUNIT_ALL_TESTS
> +	depends on RUST && KUNIT=y
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds the KUnit tests for the Rust `bitfield!` macro.
> +
> +	  For more information on KUnit and unit tests in general please refer
> +	  to the KUnit documentation in Documentation/dev-tools/kunit/.

This sentence travels from config to config, adding no value. Maybe
drop it?

> +	  If unsure, say N.
> +

Can you build the series on top of my "rust: add Kconfig.test" series,
and add this config to the rust/kernel/Kconfig.test?

It would be better, because the series creates a "Rust KUnit tests"
menu, so all the tests will be in the same place in menuconfig.

Thanks,
Yury
