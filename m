Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C797382371;
	Tue,  7 Jul 2026 05:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401215; cv=fail; b=AxCEO3EMkXj6y5MlgDbm9tcnj1I63zi0SrnCVv56yYZ567b7rtiH7uImmBbllPcrjG6i1+MLxCtCQhYH6sk1zxTe77MASitxliK5v9dVOjDCNt8yKnWW6IP/U96tUW4aZk/kG9zpTgAfY77+1Q7R4ozQ320utR3Qec5qCn1mhQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401215; c=relaxed/simple;
	bh=m3rZGdn7yyHy9W6vYzEZiY/UoPbQ4TnZbSLF3BHUC7U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=OBWm1f4FfXHbWsa5M8CTaYk3fUgcJgYtvKwnWBK3PXpnos1c0DZTgKlX4M9LN/PGufKg4/0E51HiImrUW4j7eskD+714nhIwGAg6KjYEkQ353cNJwwOpLUBVGGPnMwGwEfCuiPZ/MuAj0FbIpn+uiBZLLZFwoez9NiEPes63IJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jcyJx9EE; arc=fail smtp.client-ip=52.101.53.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jcyJx9EE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+wubtXat8ozVTJZMfoql/SCUMelp0OXJkbC3a3KaLdvkY8v0FBVsghPoj/em39YYB1w7rNO/WKxNY1PxuzulwpMeg2qG8v+kGxWG6ekg6633uTsvGCOzaglLgomtZpeVx/XWQN+kHkQ243/obG/ycWsxbbNKsULIPC9NDhvm7h3Mx66P9RAOPX70kVTKfCsb4woVSr4XR5Huz83qFU8ameHfGegQMn8lx6hUnJZGfyQ8rfPZZFsXf2bKDL9MeSVlP4FPKuPyXd1/Nr+tKww8a7FbnCtPuEiPEsyLLrX468GIDZwPLM0fE+9n5c35zINyuzLum1w9m4t7Ozoi2eLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5GFq4+dYgWP3PPOeJuH5X718tHL96JE6kQ5r6XN7oU=;
 b=zOJNhjPgbUm2ha1orUdJERPuAaCj7h6EnWKaMjQ+Gnx0JaONd5pzX3pDuZ9JYH0ufHRG2OAkEt5XagC1kUk24FQjHkdNKfI81tDgNt8frJ1gTIhEPdjLCpU4o3QQ+wXSCAgOY0q7p7mOIoBmZCuINdcYCin50c8Sq45SDmT2JwfSthVa+2pJqzrf2ZDxcG7HdrnQ1JdhBySZmWV0JBh8r18aylk4DDnNn0DZzyjbSLRMLumhYt/VrHWCjnZ2kcCfTbRQrEzcpkXQ3rk8Y5aloYsKVP/JiH3qisy4701bADOJVd98LSBgQvfzOuJ+y0Vwhn0dKi7+kMcnST5kvwvgrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5GFq4+dYgWP3PPOeJuH5X718tHL96JE6kQ5r6XN7oU=;
 b=jcyJx9EEZiMP4ZTlRQ8P2Ia2d1LBaY0ATjym/gsi4zZNGvge05UZnle+qRH8fjtJNOM+nD6Cj16WIqSJdVVFOCzgvNLb/ps46PS+Zp1A4eArXMonvpXkBma1y+jLPJvnueByZ9hyM8SE0LPPFzYpcd54thU3gdiLmJITd9qT2g4FUaYjquTZOzR0e8ejUjsoZNmsUaMTOIbQ5c295rWh3FGCkISvZi7547ygiFAA5TTi5g5ZAb/YF6QOUUubkpzr2ku7jnJslpLc48tDNHC0HoywsmQdC+OTv5+mpJKNtcFoUj3JGg6Cnkzmv23OKqeqKDavBrp3aS8omO2T5HG8Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPFF3CB57EDE.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8eb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 05:13:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 05:13:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 14:13:24 +0900
Message-Id: <DJS2YR1BBMPC.2X5MMLHOM0LL7@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "Zhi Wang"
 <zhiw@nvidia.com>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "driver-core@lists.linux.dev"
 <driver-core@lists.linux.dev>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "russ.weight@linux.dev" <russ.weight@linux.dev>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware
 files
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-3-ttabi@nvidia.com>
 <3e771bfc6b0c89afc7969755e340a5fa863bc7cc.camel@nvidia.com>
 <DJR9ZP56YXX9.P8U6V298X5RW@nvidia.com>
 <09d1fd87272e7c7dee79d1e0841f49de76ccd82b.camel@nvidia.com>
In-Reply-To: <09d1fd87272e7c7dee79d1e0841f49de76ccd82b.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPFF3CB57EDE:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ab54e0-6853-42fa-dd71-08dedbe67a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	SGQDW0yEc1E0JxvDF5erFR5YVZhEGtFN9ZVuhmTZg53HkBzg6oeN7v18wgqfnhG2z1ORKs8itKD7Amz35h0PD4wvODyj3BWkrNpgp74e9MDSaiAkoAJ92Wa4HmvT9cJxuxgiTU2uTit86Oldh5TBYjaJSV6kO+XiGGRqALdWhqspIiBfVBTHjstAJOStbLIX9L2m4rR2XydiS8PfeErQAe1o7rrnYBAY9Ih76RrH72pVJI26WXIi4kpjkoGQrdZrWWEAnKUpOLc1sOOQEK2Re57yEULcv1RNMnr8VG2c0gJ8y8bE4WtVepm7n/33oXpdrHL8LXH88J/triWiWB/UUIwJzouZFmsQYjKD+H1CDBA1a8Ihy269QEjQRSlm1xBEzHKSXg68Y/m5yi71t4dC1h3oSdMlwg8UVmREaZ0tPcQVKCtXjm0PnNcUQoQICZKOMfKtDuVqpFQkvRmEBgQGnsRHJTVvt86xwN8S5pcme9sL9QF7XjNFrFRPhyJH9zPpFGnoBrxHnucuoRyEr9Nlw7yjvLeE1JVX9nm9cu2jkLGcyzopntFwVWVl12SuPeOJAk1RDOyZJgDhTI7mEdJluOLPcdJfOqT/li4k3AuIaei1L/7oduWnUSBE6pSnAdeTBqARPcV9Qb3UFBVVgWWSL/y44bvx9BE1AjtJRRC4LQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0JTQTRwWFgvRjMyMFhNc1NVNHpQR0RGdExsNlhNYVBwZkdwa2xOQjFCeGRn?=
 =?utf-8?B?RkhzdDJSZU0yeWhJZTZiTVR5Wmg5YXFUdktLSXpMcXY4bTN5VHNuOW5sWXR0?=
 =?utf-8?B?emJSdTdtOTdEMmdMUXJCSHg3dE45OWVEQjlGZTNGQXpOc1l3WU5pVnhMTk53?=
 =?utf-8?B?SGszUlhPelg5UEZZUTVsNnVSSTM2aHFzdHhSbjVlVjFCNHBsK2IxUWhpWHVl?=
 =?utf-8?B?YzA3a3dmb2I4QVo5SzlQQ1dSc282RG9vUXNINUNaUE5BcEFoczhFL3k0a05U?=
 =?utf-8?B?Qit2K3dJYkNwVmtmSy9HNGd2SCsvUG4rZyt2Z2ozYjBaT0NmRzIxdjl0S1oy?=
 =?utf-8?B?eUhPZ2Q2VzFtcUR0MkxxczQzT0ZqeTFWM2dacGNkODljSm1KOGlobnpDS3lt?=
 =?utf-8?B?ZnJGNlBNZ1pOUFRLeS9zZ3dtKysrSnpjVzZTeG5PSHFNNndyN0lQb3JZQ2ZT?=
 =?utf-8?B?bzdpR2ZrMjRwL0JGeFY1N2tFZmJwVjRVRTA0bzBSaGV1d0xtMmdrSnBRK2lk?=
 =?utf-8?B?NGV0dmZQcVo3b3hoQy9ta3dpMExEcFNieW9mMURkUGE0R0QxZ0JnMFNsbjBa?=
 =?utf-8?B?cmxjUmRNemxSY2Q4VENsa1lIWHR6M1d2d3ZLejQxcldCMnI0NUVmWWg5REIv?=
 =?utf-8?B?VjJoNXFZRjl2b1ZBUHF2UmVCTkE5RTJSN0dNVHNuM2pvM3puWnpXLzBmSlJD?=
 =?utf-8?B?Qi80YmljTVlORFNaK1VwVnN2Q3FDV0dORGtPcTBkd09rUVJta2FyR3B0Y0FO?=
 =?utf-8?B?Vm9MN0d1YklGc2FaN0poNlVUbDdRNXdkZzM1bjFYc0cvdTQwamVSUXN2VHF6?=
 =?utf-8?B?NzVXTTJCS0s2U01PcmJaL05jQ0FKS3ZJZG5MZ21Halpxdy9FaENZWHN2dERj?=
 =?utf-8?B?SlpuTmY2VG1QWlRENVo4TFg4VTFUOXdLemZYa1hrNmNFcmRGanlTY2dpTklF?=
 =?utf-8?B?UW11VENEaGpTQVYwaStZRXhvdFdCd09RS1c3TzhBdE9WMTU2TWJZRkc3V1Bu?=
 =?utf-8?B?aHZlMm5wRjQzVzV3SHJleXl5Y0x5NVFnSDNyOHJuT2RKWHRqMTcxVzJhYmt4?=
 =?utf-8?B?Z2ZwdUlhbFVLQmlwZU4yWHpZM0pndDhNRG05Zll6T1Q2S2hLVmh6MkwwTTR1?=
 =?utf-8?B?eDlQVkxNbW8xUVg4QkJaU1hZQTgrbWNWUEdVdlBCMEFoOUZpZlpoZ3RLK1lU?=
 =?utf-8?B?c2liTWxhSnNsdUpoWW8rdHV0T2xBNjc2cUVLQ0dIYnlFWlBWc29WT2ZNUUVh?=
 =?utf-8?B?c29YTEVVenBmNjRxL0J5cVJqdE4wU0pLanZzZDZ5OS9iYmlHVEFhUlBNclNZ?=
 =?utf-8?B?V2tMdTg1SlA2eGhOVHBzVkNnRHNDSWo4VC9ocE5uaWdIOVdRYkN5ai9xNzZu?=
 =?utf-8?B?YWNoaWQ2VzM0bVhwYVd2Q1J5YXlaKzQyVjh3RjFtSEdQUjE5ZUovWndBZTUv?=
 =?utf-8?B?ejlVZDJpS2NQeDV2SFNtNGZIeGFZTUxUallZZVducjVaUjNCaFNMRWxIVW8v?=
 =?utf-8?B?MWExdEc3UWgraEQ3d3NvWExKQlFHc1ZWdmZjdnFJVHJOeXlDYWN1am5YbkdU?=
 =?utf-8?B?UWVReWtzTlY3TnhRc1dMdzNvejBSZVA0QlJ0Z2dMVXg2NGVUQktVWlB3NzBT?=
 =?utf-8?B?TXJLMHdQdG1oQi9JSWUrTldGd1RjNWtUWUljNEdBRFU2THBLbUdaV2tkaUhm?=
 =?utf-8?B?UFBhVGxWaTRrK1BWYjFlVlJITXJOSzdPbEpXYVNGRC9SVzAvLzlzL0VoaVJo?=
 =?utf-8?B?dWJVSVhTQkFiYjRiUG42U2RidEZvWlVvU2ZhRWN0UFdrWUpwUXgvWFBoYzhM?=
 =?utf-8?B?UDMrNVZaQTkyV3hVTnkyaXovamVZSVdKdE9iby9tY2hZcWFnZ2FaNFJkUUpv?=
 =?utf-8?B?V0RWclhwTDZvRWxpSkhtL0kxaGRIa21ubVgzYjZCWkRpeUMvaStJUE50OGls?=
 =?utf-8?B?S1QrRmVnbW9XOU5ER0NMODB4MEM5djMzTnFydTQ4SDk2YWUrZmRPSFYraU9v?=
 =?utf-8?B?cHkvYkhuNU5BZFpZQWlCQWR3WXlJS08wSVNMOEtzOVVuYlNVRTl3aTJzUU1D?=
 =?utf-8?B?cmV2eWQ3aUN1N3hUaFYwODc1UmJjblhUSHZ3SzBCYXdJL1hGL2JCSUg1ZW5F?=
 =?utf-8?B?NExsVVg0bS9EMXk2aWlXOFVYM0wyT0FKY2E2VG11LzlQVFJtOUVDeHVFWC9W?=
 =?utf-8?B?RXNjTHdkbUp1NVNLKy9xTTZBc04zZlEwaUJJSmdSVm5WRDhmZHJHZWJ1Unpz?=
 =?utf-8?B?K3I2cnRkSnpvdlQwbmUzTHFNMmxoS2d6eGFGVmN3ZVpDTkFPRTFJUUlIc0M2?=
 =?utf-8?B?ODlMWldHekdySDFBejhhK3FrVys4SkNHYUUyTkl3RlU5S1IzQkc4OFF2c0th?=
 =?utf-8?Q?BxjpIGdW8ZyCG+pRyRMD0KbJMrzUX9xOqDUbB+uq1QcIA?=
X-MS-Exchange-AntiSpam-MessageData-1: 5IRmogsQfLRAew==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ab54e0-6853-42fa-dd71-08dedbe67a7b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:13:27.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhbFkb02IUXk8ZuB0cfWdALM5LFhkKBjPZtY5wWtkebmfSahhPX58FbSWzKvv2XFV44GSfM6WwXRboWmCxlRYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF3CB57EDE

On Tue Jul 7, 2026 at 11:56 AM JST, Timur Tabi wrote:
> On Mon, 2026-07-06 at 15:31 +0900, Alexandre Courbot wrote:
>> > I forgot to update get_bytes() to return an error if the value is empt=
y.=C2=A0 That should
>> > address a lot
>> > of potential issues, including the ones that Sashiko raised.
>>=20
>> The spec says that
>>=20
>> =C2=A0 Lengths of zero are allowed and indicate that the tag is a boolea=
n.
>>=20
>> though, so we probably don't want to return an error in that case.
>
> Just don't call get_bytes() if you expect it to have no value.  I can add=
 a get_bool() or
> is_true() function to handle booleans, but there are no users.
>
> Returning error on length=3D=3D0 simplifies a lot of code on the caller s=
ide.

Can you give an example of such a simplification? I'm fine if there is a
benefit to doing so, but would like to understand what we gain.
