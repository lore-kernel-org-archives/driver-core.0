Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F417B418
	for <driver-core@lists.linux.dev>; Tue,  9 Jun 2026 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781004652; cv=fail; b=sXYJgNTo0XV/HEaBU9BYkJWerXBIKf712kjP5dvyI9JH4++kGTKWmLoJya2pn2XEJKTXphhZ3ni3Y/ELdeCTkqOca64NNNMd3Ax9dAemY4dNTBfLDCNGyyK8i6/jtXJlsqVMrv/xVDXUdYJboiraEM60Y6vM5/+murRPjLpcUqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781004652; c=relaxed/simple;
	bh=ShMhh07ido8IJHqIHViQfnDcmSVhvGXdaEjvL/qYbJ0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=azK30qaFhQTE/2nVJHUIKsDQwAzEFEgVh3vVUTcJnNblKcOYqoZkEA2y/JwuVEC6ImViEQI3GDyHsY3mMtYc0h7AMMXNB5ZN/xGaQc1VUCX92EsYhbIYK6DGAte6lChv4XqMDtOJJoe6ofBqqB6LIR8cgkJwBUPYyNFO/M7CD2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qgahUHPC; arc=fail smtp.client-ip=40.107.208.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qgahUHPC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVMdD6Tbp2N8JcYpRDBNAAOyf+yqFfU9XWzySm1NIMdKphKA8yCq1eRCNyTK1QHN5rTNzXbr5XpWSuzbJixGRVrh53U0A1Qfj92JmOaRRjtEwecI3Wwot6svHL7Uhgmcj+/9AzQZZrKLp9SDyevYARLoyWP21JcmdbFT1SHg1H5nseiVXcM5UymTBhHYlh7z3jlDO0EwJbELuSIZc9NNEpJj0FxRSKtPwoNkqDJGZqZWpRIAqLgweGrEX5IV9Ooq5rCtdLR5GCG7jSjfOX8dOmxUAM1d5QnBoDjffX8ggSnEl4jF6c55PZq/k6oT6ATMAMMBD7XhzIyWgVQiBKDWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShMhh07ido8IJHqIHViQfnDcmSVhvGXdaEjvL/qYbJ0=;
 b=q/Aof8cBYnGPZGRbIix5SSaL/JZNABHaDU4ugva8qSeSSfilLXp+RCU4FvzOVATsooAw1SjwDrJfFA6KQMeSTGQeVuHhQpyGKJfkhb+ClHnZltoxqVak4GCmrFCA/e7569fUd8z6nlAb1GYx8iggUpuuhM6fUjGdvJSndWF3FspQFJcMzd+ruggXK0o+WNczxNUixUGhLSm6sptRY00imQKzQT+Uv3BcQ0B5DBJ4NssLwbz/DtOd5mTLq7OYk7keautXT5bKMt3JSS19lE9hAx6twNXEDJeRydt8P5AyxACIvcE2Nhm8HLY8jb0HaapvQRDgh6HZveaGp9lk8VVvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShMhh07ido8IJHqIHViQfnDcmSVhvGXdaEjvL/qYbJ0=;
 b=qgahUHPCG5A1ZKTX2L8eWcmVpguaSEXKKfXkBai5xNJd4B3E9RzsuFjPyYU2WwDD2UWYnGvvik7tDos+LuAsMzWguAcRdEi7ztN4vOjdEmC+kvMRhPfNgGxHxoBq4zpAoJk9fvUkzJ7d37x/q2WirRGAAjx3144ytzrRA/Mrt4d2ABjdd8Nnmzjt7QIodgmO47AWGO0V7Wjv3BVitoiCPrf5J9g0j+O5DI8gBBcEAO9+PSlNtlDragwEsP115qYNgOvrd9OH4hoxGbfG0WXICJ0WMahOUph3xvoSx9RkrKGksR2A11/CIvLyWl+lPqs4bt8Ko59eVVZnyP7JsYa0zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6943.namprd12.prod.outlook.com (2603:10b6:a03:44b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 11:30:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 11:30:46 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 20:30:42 +0900
Message-Id: <DJ4HGDIUQ5RG.3HUE8KJ44ZHWN@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: io: require proper alignment in the safety
 contracts of `IoCapable`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260608-iocapable-align-v1-1-4d4b5ad2b1f4@nvidia.com>
 <DJ3LM0JABTV7.1SGWCGBBLAZ2M@garyguo.net>
In-Reply-To: <DJ3LM0JABTV7.1SGWCGBBLAZ2M@garyguo.net>
X-ClientProxiedBy: OSTPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:604:222::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 561a72ec-a530-4bf3-790e-08dec61a8c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	9rRx1jg7dcLxpFCMkO8cFw+CFr68mc/MQVGvMlJPJjPri0DB160ZoAYMjb13rKUz4D9GvYjq7a5z7ClVqErtKyY1DwgC8bOeeMzGa/D+2sxiMbsTrY4EkPfqrUdyhpuT+GVYu3HHLGL27PNWCoS49qwUbYUEbKgVXx44p+tyziIf2fltI54qIZdXiPJPdbj05xiSuVQScSuY7XPBm2Dzi5HyisrwZh7vyJ/txqM3d6Uy/ZBqCf/OUBov1os+7JBUKv1vgXIB2zRZUWgRDbGJDt6B1vwjyHaCbICMZmGNf8KcCnyTZdKtPGJL3UWnpRreYMGseQ6v/uDe3lCEMb9vcT8slcyq6Bv4sDmGUgpOmmEwXbsUvHkJaM3g7ltza0ZUPuXRYEJ+ROhEvB1OSlH9SHBjW6Pl2FBBkzowg9IlhRhM6EDexaCUkTGZ3MTT8h+Mbp3S3LAFcPOuYRoaf0EzCBFoMAjrsa4Ruac16wp1yjAqzoEZhCmjnJNx433wGFAhTIGwKR3QbfE/C2HjaOBy8poOC17OG3e10Jy3eXd3xzfQVpYOnw/gCB9j9Ld/6X11Kffjuf9ywyiyVvJiYjw4OKp0fSV41SvXiTbsgJjjHDTmd7ZxrX1CHtxYrnClDak3SonCCAEIBlhwpM1GhYBByAUG8noEl7Ev25BeOshiHj7LouUex4rehdR6qaE81Gmf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmRHOXR6R3o4eTduYyt3Q3R3aGZuMjMxQkhpRFRmU2s0NFNhNjExbmhJUE5I?=
 =?utf-8?B?eW42Z0xXN3B1T3BuSDNpbDV1NlBCVkRZYW01aVdKOVVKakQwTjFQRTgyVDZY?=
 =?utf-8?B?T3Q1VmlacjI2N1Y5TVEzdmRxSkVPR3poakdZRStxTW14aVptN3RXTTZJZGxP?=
 =?utf-8?B?SE1IQ2xzZTE2b3R4VTlYS3VVRUthV1psdmdvbTRQVnEzbGNCTitmTWcxV3k1?=
 =?utf-8?B?YWE0V3hRNlUrbmVROUorZHpZb1dYVU9rcjFKRlVVMFI1KzVib1cyZ3RadytX?=
 =?utf-8?B?Y3EvQVJlK0lyV1cybGZ3ZjN0TEgrYzFWQllyb3RhRmxQVGNqYXh5NjJqRStZ?=
 =?utf-8?B?aWpPNmdJbUtLMWVFendYTjI3cXpEZU4xMUhSK0FGcGNuRXdUSXdNZFd0cGxT?=
 =?utf-8?B?R1BUUVIzSDEyN09zdk45THBPdCsrd3BmZm5ObmpIM3lsMkhIWkZZOE45LzZo?=
 =?utf-8?B?T3VJSkxVMEtXbDMwUVRUSzBvUHlVMTk4a2QxZGhNVnFNR24yMndhSGNzZDZQ?=
 =?utf-8?B?TnAzd1hnTGV5RXFvbytRcjhJYXNEakJlbm9kQ01iY3hmSXoyNVduYU14SXpa?=
 =?utf-8?B?SFZQWkd4YnpPbzY4c3pQTzVUV3RETS9WQVh6V0F6UHlhSmtSNG1XZGNwTVFM?=
 =?utf-8?B?YXFPZ2FCV090eGZycEo0cEQzZVNLVDI0dFZXUFFlTGZDNkxSQWw4WjV1VmQ4?=
 =?utf-8?B?TFRITVlyOUNaRDlTNFk4a3UzNk1UenU0eXZJTTYwc1lLTFRZdVZGdDRDa1A4?=
 =?utf-8?B?dFZUZS9lMmw5MkY1QzZFd2NLa1hlOWFTYjEwRUV2VjFhMGJqQ2l5ZWowVXFI?=
 =?utf-8?B?ZnhoQU16M1g5cWNNbHlGV1pkU1Fxdk95K0ZsYm5xL1FZSW8vcEJ1VU16YmZI?=
 =?utf-8?B?OEMrVFpWQXV6eFdpdW4zWUlJMU1JdEYzZ2x4MW52STJOcTVQTVhiaDNZL1k2?=
 =?utf-8?B?cnhBQXB0QWs1WURzQVVjR2gwalBSdE1sWk85UWJSY200bng5SERDU1dzaU5i?=
 =?utf-8?B?UlhYWE9HMFFONkFzNWVZbnRKRk9xcDhUd29NWXZIbDd4akN3aWMwWlpSbkxa?=
 =?utf-8?B?Vk8rSElCWkxqWnZKc3NYUVJXbldGNHcvbTlZeWtISWlyN1lIRjE3LzVOemts?=
 =?utf-8?B?RGFmTndaQWNSdi9NTTZpMk9DZ3FnQllkSzAzZjRScHNMaklhUVNWZHVJWGEy?=
 =?utf-8?B?TGRlWWViTXNjMElaRUpVS21LU1hONFNjN1ZsUUpHQzFjRGlkQzhNdkQreUdG?=
 =?utf-8?B?YWhBemVRa2ZFYmRGTWJob2hHdDQvTWV6ZEFyVGlsWTk0VElwTHFzdmxjODlC?=
 =?utf-8?B?VHJCVU96R3VzNmpUOXB0eFBTM0ZVa0dMOWFzckdIOEJVbDlnYTNPZWYwODcv?=
 =?utf-8?B?RWpwLytGQkxkUWxTZWdIcjg4cjV0NGVrK1c1TkR3VWZVQXNzZDdpV1J6cHNJ?=
 =?utf-8?B?QnFVQlVtY2xJR3pNSGNYRU9zWk1aakNyTlhNM050dGRZR3RWKzBlNzRNdnNU?=
 =?utf-8?B?S1grT2pMTVNJWWJuejQ0ajZoSnlUTzdOdzJHSUk0ZEhzNWpaSVZxd2NNVjho?=
 =?utf-8?B?QzM2WEllSVMyMjlzM3I3V0R2NE91NDRFclloZzRJU2NYaHVIRU5BUE1HQ2pr?=
 =?utf-8?B?Wld5K1RsRFlDVXgxeWZyVVBvN0t5VWxjdEVKeFIrbEdydnlyamIveTkrQlNa?=
 =?utf-8?B?UkdVcFBwNnNBaS8yb2FsaVMvM3loZ0EycXhXdzY3T0NIdkRRTmxOeWszNnIy?=
 =?utf-8?B?UFZHVWxhSlZQKzRDdC9EL0R5NWMrN1Y0QlByNTVGZmhSbHFOdGFBb0hlNHNt?=
 =?utf-8?B?QnZuby83NEdkUTJSVzgxY1NjR2JUc3pEd1VhWi9vQ1ZobWdPMzBHTU5LTTlZ?=
 =?utf-8?B?bzNEQ1EyamkzdlIya0JocUJGbGVzNTl4MEFwalpwWnRzOFF0Z2ltTHZaaE9L?=
 =?utf-8?B?bk1HUFA4R2N4TEs4SjhXVTZmN1BpQmZwU0dwb3RUaHJaaGxxS1NhY0lEWUxQ?=
 =?utf-8?B?bHFoSFptaDY5SU40aUFPRkRMZ0FJb2o4dG5aczF6SVlJMTQ0eFdpL2RNekJH?=
 =?utf-8?B?Nk9wNVliTmk4TFRkNEc5ak9GRksvU201cW8wZnB4ZzFpaS9na0ZPTnVuZlJ6?=
 =?utf-8?B?SmJFdTRzV01IenNWbFhBa0xNYTFFNGlxTTlCUndKSnVTRjRlZ1ZnNVE5Mm9t?=
 =?utf-8?B?NTB2SjNWclgrNVBwc0drOTRtUTczWWk4RUVZcy8zMXJ0SkxBNElrWjZTTnZD?=
 =?utf-8?B?V2FKaW1jL2MrOG1pcGNXTzZKMm1Bc084TkRrS2RYTDYrTzlodE1FSU9tbUVD?=
 =?utf-8?B?WnVvRWNpa1NWTnFHbzA3aW93ai83cXp4aXZWb01XZjJ5cTNvcVpYOXphanFl?=
 =?utf-8?Q?tn3OTbJUgpH6wXgQmun/qCSpVqwpR5VccwrwRf++dcfc3?=
X-MS-Exchange-AntiSpam-MessageData-1: PS1gmplKy7xlrA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561a72ec-a530-4bf3-790e-08dec61a8c6a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 11:30:46.3236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMgwBuqiaR+kL7b92ESLnE+9WTQyW0S/E/Nb4vIC2EsUiNw5yl/OeV8bhyDwb27qh40VEXNMHuHk07L4g7JXcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6943

On Mon Jun 8, 2026 at 7:33 PM JST, Gary Guo wrote:
> On Mon Jun 8, 2026 at 9:14 AM BST, Alexandre Courbot wrote:
>> The addresses passed to `io_read` and `io_write` must be properly
>> aligned, but the safety contract only mentions a valid range as a
>> requirement.
>>
>> Add alignment to the requirements. The existing call sites already
>> obtain the address through `io_addr()` or `io_addr_assert(),` which
>> both check alignment, so no code changes are needed to them.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> There is
> https://lore.kernel.org/rust-for-linux/20260421-io_projection-v2-4-4c251c=
692ef4@garyguo.net/.
>
> Although this patch will be gone from v3, as `IoCapable` is not going to =
be
> unsafe anymore.

Ah, perfect! Dropping this patch then.
