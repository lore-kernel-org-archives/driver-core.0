Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010015.outbound.protection.outlook.com [52.101.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A03282F3A
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760207; cv=fail; b=IbuyLGQsvMBHBEnL6fWFLVB8V+4Er/I/vgvp5gSEgvUJ+8XCW8ntB7xLK4KmsnqpvBRgrHPDZlSRL7LyACXoDUwk0NH8f0fUjLVxUrfUDE6FHtN8WByiaeeTUodvE2xE4t7Tgc/nqdQEmR44PKfpjTqlwkXeRy4l63YqHb/uPGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760207; c=relaxed/simple;
	bh=kA/01qW6tNBiNWWo1ZVgb7XzzxlRs821g9GgAUA5INM=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=F7YkQUToHLr4bW+DztFSRUIg+WZVh0+v0lN44kFOA2bFNdhkLgXvuXs98Zqxiqx2lXto3pKR/noamSgiLwdnWe7QT3Hf1hzhuh3RBAZbb4zfm+1FflNGte8p/LZGHqOo+9i55IYPpp82eZ8Jz8HByn5zfWFBokkYQ2Ds8uzBNsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WDEjpsLo; arc=fail smtp.client-ip=52.101.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WDEjpsLo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nt0sHhDUFB5Ey53pssoq9bntOOFSg6NygpHBxJDJJazK1+Pkdv9bbmS9eFTqDODiTolJTr9AASxefjC8YAelH+PbTk/aGBG6+jGBPpiFtKfRIhtIDENOIKMAakyGcVgF5SSL8XmpE6VToXOdgpa5YOKkRA+sTWmYB4T8O0OTFQdorzSIBz8HscqwvKxSLSE0TXhT7zocORSjdSQxdzYiOhWb9rrH1EhVhqp3TqskGa/ZaUB5fXOi/OcUXT4MSsWdJ3mMyazO//AqFZymtiJp/ReRFUJ7LBkRUXAkdIID2tVOORfrCOTLAPQOzoEOS6yQm2Ma6iwPC18i0dTwNaiWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA/01qW6tNBiNWWo1ZVgb7XzzxlRs821g9GgAUA5INM=;
 b=QsV2uEO3CQJfitlx+e7wcvQT+FWMr+2+Ac6FTythLn2MEfefBkjw5aAg1cYjp6saw+eU0Sd54YUf2AiF/gzBIwdAxgHadc2PUbpXYTiNo7ZO21QXu6DDKbmePHIjXdsSawkd6frc6y1jTpzhU8727PlLSO3WevzSGXSaChqXRPrRzlp9EJXRO+xrDwfDT1b7OiAHSwUgumoMzLwMcbTIImMEXVQLuXOYY5USPm8NwXkdqoW8L2purIPjLV5RXXDh+uMGGiR/symlMdEj6b12QjP1FtO2NvP00cvNJ5mJxp/TDR1+DOGSiKPhXHCBfg113/6wuOnndCY/Pt1+utSruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA/01qW6tNBiNWWo1ZVgb7XzzxlRs821g9GgAUA5INM=;
 b=WDEjpsLo//CM61k74vSvnYt0+49ehuty+VTkWF1XOwER5oEpbo3IRgu4Xg1QR9HZ9LgB4vOz2GHoAAlev6B0SXNRJU4pdwY3EvUQPh5/0+YmWwCR9K8Ysetx/r4n7ZJzn8exKSQt+6gtBRNt6wwmAu1+CLnJQnJCizYF9wGjLsOCtTRfAkq8u2QEbSZbSykjjrufBjfp7SrNZwlIaljsUV0Y/iE8JFGQ+EcmHFU0FlNVLrAKgqKtcWmr9rczQXnzIfZlhCRLUQRQL/+6f5bmOPTdqrwsvgOtoWLkjfdejAkpfouiqSJhCkuzY1SlgcxqY5mEAWNf7qKg2SBmBdnj3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8052.namprd12.prod.outlook.com (2603:10b6:510:28b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 01:50:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 01:50:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 10:49:58 +0900
Message-Id: <DIS8C454T6XF.25RDEXTXGON71@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: devres: add 'static bound to Devres<T>
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260526000447.350558-1-dakr@kernel.org>
In-Reply-To: <20260526000447.350558-1-dakr@kernel.org>
X-ClientProxiedBy: TY4PR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:405:379::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 392867e8-9e4c-4c3f-f97f-08debac91a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	GNrA6qJhbwk0Q4F0aO8aO4RxcEGQaQf444YDTFCuL4l+PCkRcDVYudMs36+5vFzLbqgwRRYuCTcCjltp0MJ/h3pcryXy4DDa0PSXJgJuSyfKqu15dnzDEB7c7p7TkssvZ2u8vFXcRSCA7GW1OVVmvHriiQU+325FJGQ/jOID1ZbTONe0J7EDb9KKkYcULCqk9I+2XFBkSMBfQBFb+clzhCade/7D7pQqv9oAYpM+Z5KsnYbl10/Te4+G6Rz6ZKzTSBNgUEleR3csP2/QR4I/2RZsvNvUat0qP2+zu69Z5KX6bbWbJBxrRyTFgcEeuWtEpbvaC5V5/LGa8D+veEr58RTFA86a9IhlMRFLsGeaICsjvMO7FH02+Ta3X21cK/cudvriK0VYSaY5Mvu9PljQjrb1b2TDRDBnFxocS2NZWYww+B54ctlgIuMChurS3bWqlo99iLk01gju5urivygZR5ESxxAe4rxmFfQOrTrgzjdeCGLsH/tv5PFhSuBTSZtS5PsRS1cgotUXWrGH2cuWYAoKWiKJKRuFxFivO37CDmt0P6OIUUlutHfVUndO8uCVgAEs+dkOEx+EpSkSywcZiCaKKaLcNpKmu3qAAuwNAn6qN+mFvJ+293oKYOpqSSGQsDju/MHg4yzHVvNPdRx3hI9zGOw9vvc1aeOGsD8n4M92Yz+14opzN+xUrptMy8Zv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFJ3RnB2WFovbzJ1OThtVWZRV2xZU2wvbFZyVWhjdTg1V2VSYjVDMEhEek1D?=
 =?utf-8?B?M1pJTU5KQktzaGJpd2JsRjdHbHBRVXdvMnUxcnF4NTQxVkM2OXRxaEcwbUlu?=
 =?utf-8?B?MkViMi82dW9HR0N0Z3hWM01JcS9pcjdlU2kxWmdxRmZlQnhPcHNXQ0pYZWdN?=
 =?utf-8?B?TDJ3OVhJc2d4Y2NUVTFnZ2FVcXRUYW82ZVFYWkVqQmptNGlxUzZlWWtCU1ZE?=
 =?utf-8?B?b3FqR1YyVUJ6bWc3ZzIzU1pkQy9yZTlpUkc3bW9kMlpaRmduS29HWXhRZG04?=
 =?utf-8?B?RFUrOUlKUzVrTDhaR1pIOENuRlUrWUdIcGV0bG9HWU5FUHZlaUxYNHFxNFpl?=
 =?utf-8?B?cnc5SW5oRGFkakVaU0lqdk05bkRKeTlZR1ZkNkdvMjZEd0VCVzRyWjh2MnV0?=
 =?utf-8?B?bWc5Y2dCVVBxdkJjeG1XY2RkRjhsYXN0Q2x0aGxNZHVTRTdONjVueGpodm5n?=
 =?utf-8?B?eGFjL0txY2t2dkMwaDQwajhaZm1ZU0tNVzYwb3k0TXEvcDYyQjJNaHllM2U2?=
 =?utf-8?B?UEl3Wk4zRnRwSkJQbVVRdCtyV2hoMDFmaUZKaEUwSEtjZHVlUVRGRmYvaUpP?=
 =?utf-8?B?Yy9LT2R5dHNESXVtOVgxRTFMOUQyS2lDOERWZEorQk5NK0tSdlVvaW1jMWd6?=
 =?utf-8?B?UFBLbXlBZEV5c0VOcmZhcXVCYnp4bXYwY0RDVVcveGdjZTM1V1E5MWw0QnVq?=
 =?utf-8?B?M1BVOTdoa3hGaGo1QTBmRHBjZG9NR1BPdTNPRFhyZHhVb1J5U25wb3M3bUhH?=
 =?utf-8?B?blZSeDVsV2I1MWxqbmpISnM4QkptT0JaZHhpa2lSN0ZjTWN5VjlTdDhjcDZq?=
 =?utf-8?B?eThzSFpUN2owbjBHT2tRc3k4MHY4aDR3cTRMdU5IekZ6bkczTlUvTlJCbzhs?=
 =?utf-8?B?bXhiQ0VPaEl3ajZCQlpBNzBjK2xuKzZ0aytkSndVWlcvM2l2K3VTdGk1aytv?=
 =?utf-8?B?M3hvb21kbG9xTlg1aWViU01Eelo0Z2dLTkRPWHowOXppVnBubHVvTVNkYmRm?=
 =?utf-8?B?KzBoeUtSMThZRytLNmk2WG84UmkxUWc5WTgzQnR3eGRzandxN2hOK1JTeVc4?=
 =?utf-8?B?VWlnQ0VXaStrV3BjaThacjhvdFM1dk5iRFoxUm5ibXM3S1BhMWgxT3RuMEVM?=
 =?utf-8?B?Y1c5SFVKbmszTFFSSGNFWnFiTXBBQjVQUEtyNzE2QXhIbHNLL1BORWxLVGVw?=
 =?utf-8?B?WE9qUG12VVV2cjN2eUJ2N282YjRwS2FPaEI2YnpXcjJZT1ZUeHoxYk1CUXhF?=
 =?utf-8?B?TjVydjd5eG1vbUZiYjVvWXRjNnl1a1RlNFJwMVNmTFV3R2Y1TXpSMUVPb3FV?=
 =?utf-8?B?SWVjNFZjblN5b3lkZks4cmMybGIwWmZXM1lnRmhFQS82UDhVV2EzR1dsREcv?=
 =?utf-8?B?cmlaMjhrSk5NOS9wbkIvNzJDSlVuM0doSWlJdE83bXJmUG1QczltYnNqdjhj?=
 =?utf-8?B?U1FwQWp3R3VoT0xvNTRicmUwbVd2eldORElPMGR5cTN5L1BpTWh5Q3hPYkps?=
 =?utf-8?B?V01ibWJXSWZOeGFiYnpMNnVnMXRWWEk3ZGNyeERQbG1rNk02a25FMlgxOHYr?=
 =?utf-8?B?aTdPOE53Q2E1OURmZGFNTHJSNWpyUXBRZ0ZHVVhLbS8rN2g0VllKdElCUmMr?=
 =?utf-8?B?TXhOcDJuVWZZdlNIZ2svVmo4T2hNNFZWRWs1V091K2FON01PZ29IZTduYVBT?=
 =?utf-8?B?Y1l1U2ZaWmJzZDlrcW5tUmdFbHYzS3BtclM5eGdXRkVFUm82ZkxBUExpdCtk?=
 =?utf-8?B?WnVMK2h0cEJrdFlablpwVUl0ajNqa2dSMlArSUREQzViQkk1VEVPT3dVQXRY?=
 =?utf-8?B?NTgyNExPR0s3VGtJL2JzSmRJaTFmUmtyZFFxaENaVmlrTDFKYWdYQkJwdmlZ?=
 =?utf-8?B?cUpvNExZQUE1T3U4YXZkWW5IdDdUaWNzL1hZRnMrMEN1a0g4aUlvNVhGYkVZ?=
 =?utf-8?B?c09GR0VFek5JNlFtYWpEVG83eVkxeERNSmxnaUI0cnhoaEhuNVY4bXVza1dx?=
 =?utf-8?B?QW9jdWx6NGJwUjhFKzdDcWlMYmtIVStiVzVEa1V0UXVaTUhsRGxvR0tnVU9i?=
 =?utf-8?B?R0NqVWJuRWo1U1FVMFVsbWlkZDJnNlMwdUx4eTZVZFNQd2ZsU0N2b1QrMFBC?=
 =?utf-8?B?b09OR2Z6T2lMODBQaVFEd0JUYmp1amhTUUdDd3hpd0J4VkVPV216VGVKVEdI?=
 =?utf-8?B?QlBRU1JSazl3SEhOU29vYXEwUTBnWS9ScWNIVzFTYzRNYU03b0tEbnZNVCsz?=
 =?utf-8?B?SnpJYk03SytVSnV5TjFNS1hVTnNjS0ZlWElzTXpFN0ExYzkxRWdiaTRYYVJK?=
 =?utf-8?B?eFVQRElhei9IRTRZQkZCNGNlY29lbmUvdjVFODQxWldVLzVTclkxZ05XaUwx?=
 =?utf-8?Q?lVgv73j7JR/ZxanFo0cGJM4iJgGYN3cnAXbI2txzOBC18?=
X-MS-Exchange-AntiSpam-MessageData-1: mKg6XVFsVSwiXA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392867e8-9e4c-4c3f-f97f-08debac91a30
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 01:50:02.8325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dyX9CUwM7Wv1mdFdmKIefKuKpYefXgzai3ngkiw544y+OIXVjbM9yrSPTdGEZRH/xGGREhRkHRuFY2Ljv/Dnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8052

On Tue May 26, 2026 at 9:04 AM JST, Danilo Krummrich wrote:
> Devres::new() registers a callback with the C devres subsystem via
> devres_node_add(). If the Devres is leaked (e.g. via
> core::mem::forget(), which is safe), its Drop impl never runs, and the
> devres release callback will revoke the inner Revocable on device
> unbind, which drops T in place. If T contains non-'static references,
> those may be dangling by that point.
>
> Add a 'static bound to prevent storing types with borrowed data in
> Devres.
>
> Fixes: 76c01ded724b ("rust: add devres abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
