Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8B8199D8
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 19:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131094; cv=fail; b=SczDTbl3oR0O5OGZAkkK2U+QLE6Dm9JZfqxrXVEapgC1wCVywPx0zBoYJScqz7zTpt/y8dJeTyfA7L3qv//r7r5Du8S22Qxk4cmNI/VbDWh2CuHLu1I5MMq2ZP7mR5URwiAucco1TWFj7BqGiKayEXZViOfd8o0APTFUiLLJCFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131094; c=relaxed/simple;
	bh=x3R4ruAcYbCM6S1N5oeL3C9NVbhy/LE5+y9gyO9C/Ts=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sNkRJu7vqbiyEqjrdzlrAhxGYtEaUROj4sXCYVBECM2hgTO+0+J9wT6HDqnEnQ0/u/X7p2yriyrfVjDW7InY+Ks9I2M/91P2nqPYr/3GgOmDCEk2DOJ/KAgQ9UYY/tHlYka/YoHWkUTbQ1bOIZv2u0L1853tvLaR30g403zMVsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hye5A0lX; arc=fail smtp.client-ip=52.101.46.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hye5A0lX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IW9Dc3AqMHPXBFoWyWpT0t2fwB2monqFvBA7LAZbhfEbQy0sbrzvYx2TL69yFK0T2b3VE0IHsfNjAUuLw7gzmHsNMVX/vsBdJOqF+3jLhee0Oi1JNeHGUJQM8QwfkVLio0/Ht9+KUTOhNcFIRZ+XoNsd9iscQB/o05e76qp1UAyS3VBcfwi4TbKwyX8V1oq1MQTyUwGSMV8n8gtGDzK0O6ZMrBRV8DC7Z11ZGYrp7bt+xLkGVGEu3MhxnHAQ37Nk4S5+aCxLQdrjIv7Cepg34MR6qSUEgVg2K9tCa0B2i82pEG4bAGzeyfCcGHCkZCayKab+BBSLjvLB3913E4x/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gmd0xwCLmpzS5UJQx2hHb9G8ToUqZSFrTj5sEp8s2Fo=;
 b=bF5LSHBEDnUYG8buDM5pkpvP/SIWNSWLBlB8DNHmG12juutOKocNsBN0FkFe4bYBjvgc/VsojuJrnTPA7qGRdWzc587AFuLCQDba78QVhzLkPN1GzmDkJIUb1ajH2KliYwrN1h/6hJ6DfzB993L8bua7QXMJSc2VK/tFFuev4Y6e6wihA8T2NYAJBeJsN8L9EGW01yvIzdzWPKmyCPO0borNen4dUH2aJ7kG2KyeozVsKc3PrRvkX44Tbg4Q3BswVrnosY/IwPG4J+tnAvkxwauULpuAaW4hIoV6EUCRcg0vFJsb7AHoR83I87tQ1A+iP+k5LEYdC1m1yJtOcWZYDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gmd0xwCLmpzS5UJQx2hHb9G8ToUqZSFrTj5sEp8s2Fo=;
 b=Hye5A0lXkjqlYJohHYldTvJ5DAazyYrNR/+YHbhD7QCx7l+VhDGRG4QZVP/3+3j2h3msF2SYDcxd49F/ISf25zgcE9zMl+lPIwSTtIOXJAiojWZfErBLmF8DpMKXGZiUCmrygRKXay3soo+JoOBa5z5cWI52ICAAdQZpK0e0lS+35GwUShr+aNWJR8vP5mb1syxjXX6G3pJn27ZnILccaDQoo5wWdm0PxlHmT6/rJ6ea9T9vAnatDEy0F1hJVvfQy2TNtkCws50PwZ8UZPFFdXY2/aCAukYnh8jPPLLHXb3mri3AHl1Mw9cTMPqtIOFXVb33apsT10vHEQUb3xmXYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 19:31:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 19:31:28 +0000
Message-ID: <4b889de5-418a-4f36-bfe8-f48d2f84ba60@nvidia.com>
Date: Fri, 7 Aug 2026 12:31:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] rust: workqueue: add Work::cancel_work_sync()
To: Danilo Krummrich <dakr@kernel.org>
Cc: tj@kernel.org, jiangshanlai@gmail.com, aliceryhl@google.com,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
References: <20260804195248.665636-1-dakr@kernel.org>
 <20260804195248.665636-7-dakr@kernel.org>
 <c5fae595-2407-42cf-8040-384699df537d@nvidia.com>
 <DKIOSPRHO8V1.286KQFRH751TE@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKIOSPRHO8V1.286KQFRH751TE@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c91e0fb-20c2-4fb6-3b3e-08def4ba7a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|10067099003|4143699003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	18P3qKYiGfSaVXR9hbcIQiu0pQiYyhIPKnY1HUp38wCYKh5157W7FaSB+XdBvFfRFtx+RbF0rJ0bS5AvDmGslNg1tjh7M19yraLYJSXcDNyPrDG+FRPRQzgWt2eD2aaffjgpkRdxaEmXVlKgVSazsoo2RxQuHg2jkydv58RNuBtBWLZ5UF7EtOJl6gAooltpsGak/Bjr5v5QXGBrK99p6TKXzXIP0rD8YWAyjIwThF3d2nBN3+t8jxQ5CkTGaHd6EW88vOXO9q59YGwAZKAEl7V2avXWPiTkGyyI4wa/fl9TbE/s9XjIy9ZZuBImLyxeOKbKP8ZqNUA9JC8kLiU7VDisDZDkm/L+Cnh03Nv5Tmzry5cdBqU3jtkZyMnmvF/lhFZkDVbYs9Bf7a82kZw9XFpgLjE62M3TuoFE5cJ82h+3TUGu/jWOcGiGt07QWRy9iIDaGsW2svcuzznYDKiqtZ7inIMGYrC01qOaOsRVmw1p0OQVfUlEXMTKbuAImN/F5ZOiy2UURZtpQ1AFMSJ/G2mchGozOQqk10EcBSCCufR4vD+lxBUL0YuEUgjFuhYxVk6x1NqOAa4dfx5fsoty9DjmrkhP3M8VjRsKJ3arj6TbevpgrTYYBiK4UeivMe4gJs29rvga85d4DUhxXbFEKVymkovaetVpVbP/eqdnqW4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(10067099003)(4143699003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTBxRFJob3QvUTBZeTdidGwxSHh3TzJRNWt0Z2dVa1VaT3NzekV3c2FqTms3?=
 =?utf-8?B?ZW5SS01DTGtYTmxNUnBmWjBROVh0dGJ3N1Y0Nzh1R3owcWJkck5DZXBhTVJT?=
 =?utf-8?B?a25EWHorMkFPd2M2UnpwV04xakthb2I5TmVrVjNvVWFRM1VaUFdTNlhLL3dv?=
 =?utf-8?B?YTJXdG1wQUR1WnB4NjRHS0dvejJ4WmpKZzZOcDVOaTdnREQzQzg4TURCTll2?=
 =?utf-8?B?T0prV2VOWXVIV29DQ0JzM1J0UzBrbk9qWEJQNHVxaFJwMFlHNGhhWGs5UWMy?=
 =?utf-8?B?ZTN4N1RxZEZBaFl3QVV0cW11aXRrSiszRmFVbXh3Z1RzcHZyQmlWODA0dng4?=
 =?utf-8?B?RmRrdytnY0xIMXVDSHhhdE9oTFRUNXNCS0Mvc0NGTVZSQk5ieGVJRWF0Uk5U?=
 =?utf-8?B?R3lBempRby9tMHEzQStzdEhVVjBFekQyVzdNNmR1YTN6dUN1NFVvclZxbGxZ?=
 =?utf-8?B?N2lWeVp5UGNHMlBONWRPRkZQK2pPYmo4Nnl5REszR29oSkhYS2lmYitmYWtt?=
 =?utf-8?B?YTg0bFMxTGVhMkVGZmtUOVpwOWtHaC9wMWRja2l6bGVTL0JjRThEN0ZPU2pN?=
 =?utf-8?B?Nzd2Sm5neFhrOTY1aE1JWGhFSnNqWGo0MTBFSGFQR1RkdjFRL2NLWUtLQXlz?=
 =?utf-8?B?TGlKanFLSFNpZmVZZlgzMFpRUktYUmlwTkNMVGpVSlJHN28xL1lXY0dDZ00v?=
 =?utf-8?B?a2FiSk9rT0JKNXVUeEFDQnRLZGhac2cyLy9HVk1TQnBMKzNKZVZ2REtWai9i?=
 =?utf-8?B?QXAxZm02VmlNbVF3NndteEJiTVRnUXFQM2ozN0V5YnRweVVoNVdnK3BmTDVj?=
 =?utf-8?B?a2N1R1dEUjZZK29mYWtOenMxUGFNOUplUEIyN2FJRldZbEt0VEx1TEVUQ1Ur?=
 =?utf-8?B?ZXc4NllQalpzT2Jybk9OeTQ1bDQrSm9iUXBJQ1dmaytTbUtiTERPaEEwMTBR?=
 =?utf-8?B?MDE1R2JVN3d4L1Z3NVJPeEYwYys1ekJmRWx2dHFhV0NEWWpHNjJlQVNZV2w1?=
 =?utf-8?B?QzFrN0htTW1JMUNRWnJSMXJxdGVkL3lWQkhsWjhRQkRYRVFWT0QvUjBjU091?=
 =?utf-8?B?SWRJdWlFZno1M0wydDBqamtmUmZXTThLd2hrNURUZmk4TXN3anc1aFNKemM5?=
 =?utf-8?B?MDM2WGR2c1RsYjFXNk5nZmt6YjFHNzRoT0pCNm13dGU2Yk1nbVpUNFdQbkN0?=
 =?utf-8?B?SVl6TEovUm5tNXRTVUtrQVNFalpGbElOeW5lanpFM1ExM2ZYTTlhZU1SbEpO?=
 =?utf-8?B?NUtjYWpiTnkvTTQ4Z2dGVURKZS9lT2Mya1FubTNpdit6bUVXMWFIemg3SGJK?=
 =?utf-8?B?VWgyNWIrVEp1SWdUNDhabTlrUlVoVlpYTVh4YlA3a1RzM3BtMHAvTVJRQzdO?=
 =?utf-8?B?QjZvZkMwYUF6enEwQklna2VOWW5RY3RlRlpkNXNtT1paam9OUEUzK01yMGJr?=
 =?utf-8?B?Rk5Ob2VGUm13cWt4U255U0YzSmx1VStVQ1BiWkVra1M5blJZL2x6SmE3VlB2?=
 =?utf-8?B?MkI4OExpY2xIY0pSaFdBNDN0dmJrdFBMcmpPT1pmcTk2eXFGT3F6WmtadzVI?=
 =?utf-8?B?d0pVR0pCemk1YTFtZC83MXZNRXJHY0JWUHRmQlhLL0o4Z3ovSXpOeDBtbFd6?=
 =?utf-8?B?N2JWRkZGTjEwYmM5bnorN2FGTEVzemlIem8vdWhGQzQ0eGpJaGM2VzF3SXhv?=
 =?utf-8?B?OEhVSEFOTkx0MFgyb3JhcHlLQjNNcHo0Vjh0c3JwcDlsNEFvOHV1dGU4WEhj?=
 =?utf-8?B?T3Ftc2JxUE9KdXJWVmM5SjluMWRDZ2x5RVp4R0Y2QkhvT0MrSGh3QzFtS1pq?=
 =?utf-8?B?dUprVVJSQmdaVzl5U0N4TDY5ODJlV0gxeGdMYzU1aXhiQU9UaksyNlBJaW5t?=
 =?utf-8?B?MUI1djJzbFBJZWE5QmNnYklVek9MekJjTnRvL2tFSm1tblVFcmQvdUlISUQv?=
 =?utf-8?B?S25wTlNhWVozbVoxazhSQWlDZElIWFl1THhON1hHbVNKOEJkWHRIMzNhRTJB?=
 =?utf-8?B?SVBSdlIxVm5Jck9YWEIzMnhyREVCSS9WaDRzQ1dIa0hJTUppV0RmclphY0FQ?=
 =?utf-8?B?dXYzY1h3ckovQnlXbDFua1FaR0FWVnRrY3BLb1FjbGZzQnB4dklHb3lNNEhW?=
 =?utf-8?B?U3Q3NXhpSzdUUGdLdXVjNnBnYkJKZ0MvQkhiTDF4SmVLeUQzd3FwTURROWJ5?=
 =?utf-8?B?MXUxaFU3djhmUHd0NnRqVEQvTXMzaVNmSlVORldSekNaNCsyYnZwV0lEL2x4?=
 =?utf-8?B?bUhlYXZ0Mnc4NzdNV0c3SWQycExDYmg2d1FtdEhnRG9qeGJhSk4xS2ZadGxp?=
 =?utf-8?B?eGdsVklQdGI1a3NDNjZZRmxWWjVhVnVTMnpKMXFDbjZCcmFubFV2dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c91e0fb-20c2-4fb6-3b3e-08def4ba7a2b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:31:28.6136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /c6rt47O0CobRsHt3ABWHoOMPrAESZzVJbCVdLv0gs23J/DVKiH2CBCCO5QPz1geOLfTXGN7TANlAZ3LZ4bNJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196

On 8/7/26 4:49 AM, Danilo Krummrich wrote:
> On Fri Aug 7, 2026 at 3:37 AM CEST, John Hubbard wrote:
>> This seems to expose a way for driver writers to leak work items,
>> doesn't it?
> 
> Yes, I forgot about this for a second; this should be on ScopedWork only (at
> least without further effort to make it work properly for Work too).
> 
> Since you explicitly mention "driver writers", note that unbounded work
> shouldn't really have any (valid) use-cases within drivers. So drivers should
> either use ScopedQueue or ScopedWork.

Yes, agreed. Perhaps I shouldn't have used "drivers" as the example. I was just
trying to show that this exposes an API that will leak refcounts.


thanks,
-- 
John Hubbard

