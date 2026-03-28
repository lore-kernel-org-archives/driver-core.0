Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2FC225775
	for <driver-core@lists.linux.dev>; Sat, 28 Mar 2026 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774709536; cv=fail; b=ifMIzPRwK3oxfPzNxDS4MRSYv0zG1SIYhsGLtcOC5+hTE/6CbDI5SIb6+0Arwmcvv5FtEPRjP2/nJ4l65tvBlu36KGYwGLPuHexNJVpalUuDNY9qkzi6lON+ri0XjCCDfcbEh3UQeiiGFP2iPlZdqC7sQ+sjGe9B/4gFRN51Quw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774709536; c=relaxed/simple;
	bh=3tIBebT87g3oRhUJ+tcxNfSzh6SReJGhNC/rbyU0tRQ=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=nYw/Rjw2ZIC42G478VdAR0cvcjJfuIPTBoivmh8vOFjTUOWWd5l8nAWpKoimTpQT1BDyZiDLtQRCtc3SEv/9RN3yq7N1yrG9+egwiUGTksz7FUZv740AE4WL7CtlzZukMTWhN1wbhz1BZFVHTjte4zu3YnsvUW0bh8y3YKOO47Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LwKHLqPn; arc=fail smtp.client-ip=40.107.200.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LwKHLqPn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYmJj7iZ4vbGb/Wv+HsMqCfDfv9YPKUQl/dtOOO2vQ6x8xCwcbDjdcqOKqWwIycIKIOudmHAQLC8h37DaQjqXbv1TgE205iAb3HqS0fxXPi7xMS/2UtsKYKWzgm4iDao/IB/UKi4+fVOhrP4VG/7CTiXGWAPttgXaUpH+cGhxNSMaKQVhUHySULXXY/HqM2FM8lzvsRgb9D8pROxIo6tY6im/BN3C6E0UMrsd0YvnhR8z2C3Uaq36qwOBqyf04qPNlv91t3KsPqTaWwBI6Jgjiw0kJi5IrhVgTI8+1C8YyDhqnAQInp9Fat5KtWpAxN9mEdHVNcDMKD1ahv9JvjX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i/cnMlkgE6Na/xBCdIJMretfvrWUPQ+CTgjemeWlQQ=;
 b=LuKGKPSDNgcZb/RWLv5JDxRABuq93SBQQVtipXFnDNkPSGPiBcTqI1wVzBUh/GNUXu8xZuktS/LrrgbqCMXQEUrzr72rVjf2sFRjF607BZ2rima0E3xT1ziQVHZUf5gLsHN/Ox5EUOQay3rl9J1WaxAtThyFZ5CKnAf+j1s1I6q0cd6L+6xEFtcSiJh2seP3QkO9cKgMqcGrQneDGnHNF1P2uYaAziW2yWZHNcqgmYeTjXv6Tam0d1aTERbHodx63jkwQZObZ113t0dkjZQKWR9PbfXbNzXUp0lpYPNYqHnyZxp5OrxBoDQ8Y4SXCRDU9jR/zjEd81Z8+wpL3y9pLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i/cnMlkgE6Na/xBCdIJMretfvrWUPQ+CTgjemeWlQQ=;
 b=LwKHLqPnOQiylcHJr6EGsq96+rR7jR2ylJk3dk71aHEWY/kxL34+ATy5F4kd8m4PFzd27oVRNpok2s2jxBgUHcDZ6uknDmQVyhqXXRDijafapgQfE4N4ExV0NUjW7okiMATchqDnXS+ldhTtkRM4NPG4qf2NJnhFVKyU3WdcxxqjPxJuWepTpFJ8oO9jK/1bL91JAIJQ6zQUWt+CMQWw6EHfCngmwoYZOk8t/7RpDz4HK1lopDTvweW+8vgmvJHDiaxw8SBKLqFSx+owy81aFrMbViNHc0+d8DDSyuaYt0gWNWFjaijr9D8PDU3W/E1cdHPCGdTJ3MXckIt6B6G0gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5754.namprd12.prod.outlook.com (2603:10b6:208:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Sat, 28 Mar
 2026 14:52:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Sat, 28 Mar 2026
 14:52:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 23:52:08 +0900
Message-Id: <DHEI0U0BYVRN.M1IVH5E5Y4IS@nvidia.com>
Subject: Re: [PATCH v2 0/7] rust: dma: add from-slice constructors and use
 them in nova-core
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260327-b4-nova-dma-removal-v2-0-616e1d0b5cb3@nvidia.com>
 <f7e39810-bcf2-419e-af2a-2ae0c4d5ab67@kernel.org>
 <DHDDAY4B5JXG.5FBC99G558N7@nvidia.com>
In-Reply-To: <DHDDAY4B5JXG.5FBC99G558N7@nvidia.com>
X-ClientProxiedBy: TYCP286CA0278.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: d99379d3-a2ac-44d4-3965-08de8cd997b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	514/ed5Q1g6hIY6wp8+H2YdeO8rfY1RR+1rb4qi3xujX8idr5u7u97czc2i0rNr/RcjZ3ORsQ0p5IyrRD00s18ldxurslZvCi9qMnMsEHnKHcVYgXetZmE0TDxJXMJOKhj8Gaw+bHVxyyAaaaKYKi2G8KsvqtLN5qsszaRoHspt7YZeCv1adjyxPHsArYFsJvH+G1ciNQF9TuGruvzy1Y8Zv1G3lBwib3kjk2+nAVEp5UcpDE35n/4jJRB+RME8U0YX9JIG1dujvthwJ+U6c+N/9p+tiQ28LxqoQz4S7RUNQhdtPuTyXPnuKFZ9hmQ3ve/snMBj0HHsw5ymJny/AdvPjRjkcjmIMMWQdwNJpob5i0DeWpSFDZN14fcxjrJbzefVg1IWqbmwysGuTpElJyM5KhNyR5k72lNgoF1imRbUALBdFHWx2DSfqyejBxG/ClWOH8Y/qDPlrgLHPDErOn7uLXVtBf6InTmIGglRG8ulZ/XR0mnc3qETRv9u7QD4mai33pdmCunIvhRFp/iXxC8Zbu1V8VBJzxAKfPo8Ic2EBaNJoHCramjGkdrU2jrChUC4kBrfvAegyxSIguNsZNrd50ePxf6F3Imy3rcDCppOiesswxEo5/8M7vBYMt+hwHnCZtriL3wI3GUWHUe5OyoLMU8BwQLPuzQ7utNFseEXefyqWdwfxnxSyNVuGQn8fWlyf2cNf96yb12HIEKcYwfAnAeIpzrCmasWdB2WkMHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0QzVHpBWFBqOGQwdE5GWjBoaHNCdjZFSUtiUTI2RkRyR204NW16SkhGN3hC?=
 =?utf-8?B?VjVQbG8zQi9VTFdkS2RjZHBnV3MwZjlxOEd3WUNGWlRTY1lJV0xTQldoVFBK?=
 =?utf-8?B?Ukt6T3JRcUJ5UDF1OEtQZ01QNU9aTDkyaUQ3YnBob3FkUHhBZnUyVzFPN0VC?=
 =?utf-8?B?eTFadk8rVU5iWjFSdEduVzF2SFBnQ1V4aVlweVoxaTZndlI0ZGIxVFJ3Sm5s?=
 =?utf-8?B?MDJmN3o5eTFRUGQzTURJVGJoZVRhZE01SmpaZHZtRmJpRVZ5RXlPWklYWXlu?=
 =?utf-8?B?a3ZzcXgzRTY3SXd4WHJOMkZPV3NyYmFMRnRlWDNqZlNJSkJFWWNmRUpVL3FX?=
 =?utf-8?B?bGhYbDhNeUdTaDk4V3hvRnVuTVBrTS8zRWVzMDZ5T1BmZGJ2Nng5UTJuS1RF?=
 =?utf-8?B?VW1KbURkUmhwSVQvZ3Y5Wk10NU9mVHdadDBDeXVWTFVTUldPbkFxd2dISnFu?=
 =?utf-8?B?aWZoc21NZVpRak5uMWYwWjI2TmVaRXNXZE9BMTVESkw0UXMrUFRFWGVzOHFm?=
 =?utf-8?B?N2tLenNaUm9TejRWWHlWS2JIUmszZmo2ZzRkeXBjcGNUcnNLQUNkczBINlRH?=
 =?utf-8?B?MXpta0RqSFpOU2dGSkExOTRRU3J0REVzUStrVmVoRU9iMFRueFllVDF4MUpw?=
 =?utf-8?B?RDdxcTVtZHJmcW1NNTJieklZRGxzMThwd3NtVUxiaWtCM3hkRjk5YVJqQmtk?=
 =?utf-8?B?blM3YzNscTBpY2xUOVlwLzNjZkU5U2NYaHhvYjM5cG1xWER6SGdzUWNHTHIz?=
 =?utf-8?B?cVc3RkNndEFFWGQzN3dPUGM1dHpYSGxNR2N4ME5zYXl2MmU3MVhQY3NwLys0?=
 =?utf-8?B?SU1jNWR6OEthaCtIcjB0SzlKeE5XNTM3T2V1NVVBUy9RN3A0aGxDdVB2S1l2?=
 =?utf-8?B?MjdNampYM01tQXY3MlhNM1FPZ293aFN4emIvNmZBcUp5cU9naHUvRURUUEw3?=
 =?utf-8?B?WmN3d2FyTkJ3S0l3V0VEMzU3Q1J2QjZtK0hFVFNld1BGVzZoQmlXSmtDL25C?=
 =?utf-8?B?WVJMemVrYUNVZlNlVTRHZ2Vjc2VXbkRoYW9ET0pOUGdGd0lDZkpnOWpGaHhl?=
 =?utf-8?B?OVVuWDlHSHg0ckgxQTNoZzRDNkZ4ZjhTcFFLZSsxRVhLM2twdGh2d2E0Kzdm?=
 =?utf-8?B?cjVPTEdCZU5KKzd3aGMxSEV0MC9BWmt3eFRLMHU1dTIwT2tOZHhzaVBJY2JE?=
 =?utf-8?B?V1NUUHQzcWVsUjJRU0l6dWZpcER6ajdHN1RYamtWUDRQZTY3aXZzdDQvZUow?=
 =?utf-8?B?YUVxZnFhR1JjMXBOekNzSENzdEpEd2dDclZnL1NUVUUzNnlReGdKUzRKV3F1?=
 =?utf-8?B?dVU5S2dlWkszZlowWHdqeGVINzZtSXlURGRsTFZhNlp4eUVXajI4d2FuOGtp?=
 =?utf-8?B?dVZiS0lDbmo0d05wMUpaSi92akRWcmxqOVRHK0xXWUJtK0FNR1FpalhWMlJP?=
 =?utf-8?B?UlFSSzFQOHl0SXp1Y05kSTZUR0tDekU3UEwzVFFkS2QvcWlyQkRyeGVYYURh?=
 =?utf-8?B?OGZVdHFtL243MHpRQVNUWXE1VjZUWC9uaFBXWXM0Z1BGck9sL0VER25WcXlv?=
 =?utf-8?B?NmhJeHRablhsbnU0cGZGVURJVVFnQktZQWRHNUE3OCttMzVVbDZMTWc0aXBh?=
 =?utf-8?B?cTJlcjB2NDdMb2VZSk1hUlFtYkF2UnZoSEljcUlUNlRSeG9ZYS9BdXVoZ1Z0?=
 =?utf-8?B?TE1PVm53aEpXTWwzdjhFemQ1bkY2d01iSmZCaEt5cEk3eVhTTVZaMTB0NW5q?=
 =?utf-8?B?RE55M3o5N0VlZXZEVnJUbHB4RGR0RnpTbE5TWmU3bk9paS9ZUGVuK3B6R3Jp?=
 =?utf-8?B?NVpLa1FDRDFXOHlscldZUkhNRW5FUVZaSWRCRkg2YlhSZEVCaUlrcWVMaTU4?=
 =?utf-8?B?cTI0cDRGUEh5cXp4cit0QTh3T1BNSHI3Tld2SHA5djRobjdkR0pkRVhaN3NF?=
 =?utf-8?B?YmM3VVIyaE13MS9ONG5YemxJbkVZNGRpYlU0Yld4Q1pUc1pLZjhVc0tRcVg0?=
 =?utf-8?B?TkM1RlFnNnVWNjNienNvL254Vk5ndHRIS3RlTmNTN2FRSXpYNVVnM1dQQ1JB?=
 =?utf-8?B?R3F6d21WQXpyUUgwZjZuZEtmMmE1WkxodDByYzB0dkMzOGlWb3NjRGVnSTQ0?=
 =?utf-8?B?VnJXbGljeG9GOFhxbFVpR3h0dGV6Q21RanNPeU5LbHJ4NjJKcGlKVzh4OEox?=
 =?utf-8?B?UWN1T2hKaWtyTjBpQzZjYlNWM0QxUEt0dTdMSVlrK1F0Nkxjc0NZeU9FVk85?=
 =?utf-8?B?MUtkbjJ3VkpNK05sVUtnd1FHSlZyNjJsK3ZHN3NuZ25TUFhkdThOeTFUanRE?=
 =?utf-8?B?ZGI5KzE0YUMwVlJrUkJTdzMwbTFDak5XTVZGcHpWWjQwY01qU3hUVUhQcUc4?=
 =?utf-8?Q?1AupKKoc9+ueJApB2aU1NzXL9XO39Waonad1PaOm2aZAR?=
X-MS-Exchange-AntiSpam-MessageData-1: p8lqLLXTw4wefg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d99379d3-a2ac-44d4-3965-08de8cd997b5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 14:52:11.7392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: easpALTrK7U0DqoqV7gqNtL6WRx6/zCc7llD6Sv5/tTbRh9yE9twMSK/4WTNdWFjO29t2LIbryZYjo+tpOdQOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5754

On Fri Mar 27, 2026 at 3:57 PM JST, Alexandre Courbot wrote:
> On Fri Mar 27, 2026 at 2:24 AM JST, Danilo Krummrich wrote:
>> On 3/26/26 4:22 PM, Alexandre Courbot wrote:
>>> Based on drm-rust-next, with [1] as extra dependency.
>>>=20
>>> [1] https://lore.kernel.org/all/20260321172749.592387-2-dakr@kernel.org=
/
>>
>> [...]
>>
>>> Alexandre Courbot (7):
>>>       rust: dma: add from-slice constructors for Coherent and CoherentB=
ox
>>>       gpu: nova-core: firmware: riscv: use dma::Coherent
>>>       gpu: nova-core: firmware: fwsec: use dma::Coherent
>>>       gpu: nova-core: falcon: use dma::Coherent
>>>       gpu: nova-core: fb: use dma::CoherentHandle
>>>       gpu: nova-core: firmware: gsp: use dma::Coherent for signatures
>>>       gpu: nova-core: firmware: gsp: use dma::Coherent for level0 table
>>
>> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>>
>> Feel free to also take the two DMA patches.
>
> Thanks Danilo! I will leave it ~1 more day for reviews and will push
> both unless someone screams.

Pushed to drm-rust-next, thanks everyone!
