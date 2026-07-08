Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010026.outbound.protection.outlook.com [40.93.198.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E9348C5E
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505512; cv=fail; b=SD0EKgV1gPvgNwmXYgxNmNJxuyD6AaRxu9SJkbz+Rp2hF+xmlEE4VDmk5LJl2Kk4m5/Q5HvvEFHfQI5najn8oyDv+g4n77YPdLaOXeIUxjuzJbYsS9Wm/CAu//fLhTk7BqzjqLkpmZaryZRWMcXta8xPzvge1RRQQZ1DwaimmwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505512; c=relaxed/simple;
	bh=afPqTu50SIHM31XD8MAUOlgTeV72l0TPnJtjmneIS1Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Is7CCf1iH7qri0k/Vz6760rLtKcwp2y8ZVu7Qlw5Djm3066bu2dJHwb6zUh5Wfuu24BhLIJQOo/RlD6cCXMbUHIyN6EObtR/efurg0cskY+OFLooSjXKgB8qve2yhoHW0JVgYBxsQaFgoW3liOsr2lrumhyZaAN7bVni6zvq0JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uL2v7r+x; arc=fail smtp.client-ip=40.93.198.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uL2v7r+x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy12IwQ2i5/EQsfAPByax/wxUoYOtt2rlMVIZstSmFLLZEdwm7NDmg2az7zhz+DdQSgspcJ1biuyYqWlso6gKTz5PambwXvYJ/JCypTepvN0Ur1RcbwUB6kHmu/D7pZdutCi3MC08haWXXiLgk2cR/00FON49vHc+UWfHTjYHoqnAI/VSEDDidEovazwjJnCYLt8BCX/lGx+8jHV1Y5it7ZcD7OXb6XrPwb06/+JnVQ6xlBuEas/rg/cLLe7F7xWM7K1usPjSax6n1fb5ZywKeJDo1L1EbmntYFVBxtgHsNAkGMJ86kfx6rf+bt+U0Sw2IdwNJv3QzRmarou0OdlKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x9qfEPHFNzBcQFSv1UT01bTpHgiiaJL5fqNO/Llj4k=;
 b=mtMwjFNcuTpZg+skKC6NYHxdmP1RCiuvOQJzBvblaXMZ7CBTn7+tJUxLt9Cfk6StlebwiW5S6uFHa+IML6sMsB+KNIrfGciKRoGlByZM8/5x1IBLEz31ODJ4V77M78+ZHT0U92eBow9hFNYHbZ+aSY34kbqYtvej33CB6rz9+MzbgIJcMpvcwTv7dSmX1VgUvHRhr9mWHoVhkVu7xrx2U/zmzU9KFCLi8RqMQJ/d5A0w7a9UKqXJqbpT2lnm/2iQtYnDuUFJgfFeCG3fSmvmppX7yC8fJXxeL5e2hAl5hHroutMrfZAnReM8KtoVGNl8kFnv6IzxuS1QcvVj6w11xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8x9qfEPHFNzBcQFSv1UT01bTpHgiiaJL5fqNO/Llj4k=;
 b=uL2v7r+xmmbOdfp4Q4H41DciUr9wQZpDpxt23WubGpuqNAR5044kU1jo7t8B4ntQzLjH7PUMplY33Ry2AeOFwpxJ6tgNlADGeCAm/3VWO7ALXNdlh5sJn9OU+BkW5/qIt3RRQobkCB4AVorv2qADxKhylvwuVkfE5FwfBgdg8fbbo9WHt1ezSH4bOMfbSpzpQgEPfq4a/Htyl5y5rMQwK7fjV424g9sEA8F1+F+A892YTp3TL94wpBhVPMlVzNz/QWjvvtPkTUT2L6Wa5FGfwzPfNPM5L+HGiAMTeyZg/he3m0QeBraWIfu1KWFCQeS/8JzchBqd6uDP26eceYvK2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 10:11:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 10:11:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 19:11:39 +0900
Message-Id: <DJT3XNKGKVNE.3BN1EWKCE8SQT@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Matthew Maurer"
 <mmaurer@google.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
 <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net>
 <CANiq72=Q7aR51uvwKXUh2YWJmDuBAHPECA57qG3Hr20xWCt0mA@mail.gmail.com>
 <DJSEKYNY1LJ6.3SWGGDXKIURC7@nvidia.com>
 <DJSET0S73YYD.2HCX79F9XAWF3@garyguo.net>
 <DJT1OEEX0LQU.H9DPHR1SBN9X@nvidia.com>
 <CANiq72n2KwCE1DCp2HR6CJF-vR-VNBYFgXYv3j0Kvv81dH6rng@mail.gmail.com>
In-Reply-To: <CANiq72n2KwCE1DCp2HR6CJF-vR-VNBYFgXYv3j0Kvv81dH6rng@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0135.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 150894fc-099e-4654-c9ae-08dedcd94f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|10070799003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x8QxSzO1Z+SNyl5MsVxuOMHpl6HjGhYC+NrmDnM7VSUxmNvVh6WkvRVXgEqNfpyA6UPOuOwovVFX7kG7J82pKi+rutWKHM1TrcZFejPyE1yXQxbQipq5Ch1tdI3tTQEaqFf/zWRdRuU+o5bN0qzjFtZXGZ8n85yFuWJokd+vEd4sovB5oJ3HAzQhXKlzd1MySLV+jf5mjd3QY/wPtgmO2vtVRpyATLIiHecMfnxvuoh8FjE38dk96WDaIk3J8cg3NTvPN5sUwu+YZRhyR+LE/k0dGT39MM+VD9xU15xjMW7rLT+WsxnyCAw9nIApGHrb7vs8juM++9/O9c15GUbi/Q9Yh+shlpSt6MLrIbVG3rvhXeCuw5IXIjjwq04wC4f3etMP4jthKnfa2/Bu2mcw8QPW4hZdykW6/TGnpriKVo+u0EGuiluBYQvsIkQzMtWTVxQYDaQL4rglmMG9gHm2d83ySyXD0essyFNo+HTO6czgeMluB8InAJ9FYzGYZtwrlDPMecgmFsY3M3cmRTmx20m7NOoZYmhM4AQp1QrQKZMNZzUxwqvTrAJ97jcBzOHWgwbISwM/FgFJKuYiVSGIqulnYUKRapZgpzP/QWq8Pbm8nuJYDK5KRgU9TJNhpDgvrWjjaDyEWmEa4PdyOB8cl8sgvO/O0g5bcsQDeelzS8w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(10070799003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1QvY0d4Zk1vbXpUK3p1VHoyM1pBREV1K3dYUVdlRUNtWFZLdThESVBwamZV?=
 =?utf-8?B?citMYnJhZWR6Mmdod0ZFUTdCbmpQTklTdzhmbG52YllzTTVSQ1U2REwweHJn?=
 =?utf-8?B?MmVPSWd6aVR5SGphaFNXZlFzT0hVNm5oaVVkNk83OFJqL1V2Wi9uL0h6WU9E?=
 =?utf-8?B?U2xjUmxhSzJDYmpFUXg4c1hrY0lQYVNTRGd3bWRvb2p0S1dtMHBsVnd1YW1r?=
 =?utf-8?B?RXpYcDFtemZDTUxKTTJmWHdPalMzTTdGMzJpRThmQndqeWlBc1IwTVkvMjlS?=
 =?utf-8?B?WEwwYVBKbW00ZnZmd3FRLzQxNWRySUFhLzRUN0pCcDJUSTdieU9IeUxxT0xE?=
 =?utf-8?B?TlRkUFBuY3g4OFhYUEljbjdwUTJxczFYWE9MaGZjYkUvaEdsRVoxaGdQblA3?=
 =?utf-8?B?c055TmhUakZ3N3d5VC9nZmhETDFHa3BjSHZGSnU1Q0NGUGNrMFc2TjZFZVpa?=
 =?utf-8?B?SjB4YjExbE5Cd2w5U2hmUGdyeDhBS1dwL2dVTFJmUndPcThXczU2cGlZTlVO?=
 =?utf-8?B?emI5d1hSc2k5eW0xeTVFcDJPRG8zRVlkWGlQaEpET3NyRURycU5xR0FFeE1o?=
 =?utf-8?B?U1k4MUlSaFpIcDJkRDJLclNDUDNrQnI5WmE2Y1QrdzY1a29yenpUaytOTVVG?=
 =?utf-8?B?bC9LTSs5T0plRzV6Ti9jZ1J1WmZ1RkZKUmNkNjU3T1IyUEJKVC9rVlphVHQ2?=
 =?utf-8?B?SitRSWJianI1ZkZzNWNRUzFNRTJmZ3JoZWh3cGhoNEFYRkYxSFc2Ym5ZVVhG?=
 =?utf-8?B?b3ZBUDdCdVI1ZGgxeWw2OXlMOERMWXFpLy8xSXF4ditUNnlxNnhNaEl2M2JW?=
 =?utf-8?B?WDJndlQ1Ti8wNmZVUHU5T2lQSStVbEZoNXdVdCtTK2ZhOWlORjRhWjZHUGc4?=
 =?utf-8?B?dklIcmhmeTAwMWtUY3dYVEx6dHdaeWVkcHRJSnRlWU1nU3hESU01WXdSeGxP?=
 =?utf-8?B?czF3MkVCSysweWZ2L0U4QzVaVm81R2laeWc5bS94Q0lVMzVUblRaMWR3QlFr?=
 =?utf-8?B?UDhCMUpocWEwclp1RG1vM3hZZWlaT3I0YWlUYUFQWTltNnlKREZEYUJoMkds?=
 =?utf-8?B?RC9uVXJQNXAwQkZpU282bENLYWpad0RkbitXSHQ5UWlLM3RMbjFXWWZJeE02?=
 =?utf-8?B?dCtNSUdVVndJQkRic0lOanl2U05qcmU1SllMK3grUytuU2FxYlNGVjdFKzk2?=
 =?utf-8?B?SGlPSVAzSEdLY0N2MGdOU2VETmpqYkc0bXlNdVhFQ2NBS0pNTEFRWjF6QkNM?=
 =?utf-8?B?bVpndVdEaDVnaGk3NHpNOFpSVldpeVlZUnRib2pYeCtoZXAybHlXcGNRZDQr?=
 =?utf-8?B?ZG9MRVprbWVZRmRKS0tCQ0xXVXhaN0Z1dEQxbmNLaDJWdlIxRkFUdksyQzZx?=
 =?utf-8?B?RktWYnlnbzNYRUtOREI2Vzc4OHl6SGtsMW02QkhPcG03aXlZNzh1Q1M4WkhK?=
 =?utf-8?B?MXk3YWVCcHBWYU1zY2tLUzN0T2tGSit2WXpXYURBWE5QRHBZWDhXNkZFZG5y?=
 =?utf-8?B?RVJHcnp3cWs1Z3hWVFZ6S2VKbE9zV2hCNE9JWWJiVS81clI0b0Nnem1CMXlG?=
 =?utf-8?B?ZCtpUmJka3dJQXVhYjAvVis0VDZSTS9zUXd0a2kzUUNaWk01ZnpaWVN1UDZJ?=
 =?utf-8?B?WlRxOWw0WTB4a1RIM3hQVXR3RHVDR1UybUNZRHdWc1U0amRaV3pCeExicWF6?=
 =?utf-8?B?R1hUelpQTjBUNU54d0VqNUVWRnhnWEM4c21EUkdUN2ZBa1g2N2F0WWc2RXpE?=
 =?utf-8?B?NTJteVh0MHEvWEdhZDF3dnc5RlA0aU1ld2lNV0g1QjdlZHhEaUp5RkMxTlE3?=
 =?utf-8?B?dXRNeFZnOWdDTGJSVDliNXU2L0hBMk55dWM2MTFEWXk0ODhuNERoeDlLOHRh?=
 =?utf-8?B?MjdKK2s1SzhPV0dGdUREcTVUWlptZlFBcXBNOVE1M0hWMk5pQ0JpNTNpaWtL?=
 =?utf-8?B?NE9PVy9NazMzVUJKeWdHc01tNG56MHFIbDZKbGQ4WTY4dk5sdWNaQ0tiN0Vm?=
 =?utf-8?B?cjh2bGJPS05xUUpCMEwveFlCQTMxTFdiR3BhMTU2aFU4QWhsTnEzQTR2eEZk?=
 =?utf-8?B?cUhCOU02NHh2dVRQN0txc08zRWJiTHFXdzBhQ0lrR3JPUTFBaGN5dFB0SWpz?=
 =?utf-8?B?bU8yVmJ4RXo3OHo5aVR6c2VzRUlMK3pnekVTVXhpUzc3VVYrUHhvVytHSHdR?=
 =?utf-8?B?a25JQVZsc1luWUNVblRkQWp2T0E2K2k3VFFzZWVtcnc4Rkp0bndYd1Fua1FZ?=
 =?utf-8?B?SHVHazROckxqTjZ4Zjc1c3FyNm5PbU1iZ293YjZCRkQxZE9sUmZNSEgzWU83?=
 =?utf-8?B?UklQYXhDZUc3QkNjT054dzFZNzIxUmowK2pMM3RrYS9jYTgvMFVpRmVnWkd5?=
 =?utf-8?Q?QaJkIp7hIBz9wADWbYJa0QNbI2tNkPG0trVuBr8bNHpgE?=
X-MS-Exchange-AntiSpam-MessageData-1: YqZeq5s2RUzKdA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150894fc-099e-4654-c9ae-08dedcd94f6a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:11:43.4902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNWTFsgWwT1VYobxXEPHiM468cv1E2IFRzqsocOgUUMXY/204ndjs3TNi/VSIdzNCVfwlVq6BZsZhxsu7hwmnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726

On Wed Jul 8, 2026 at 6:04 PM JST, Miguel Ojeda wrote:
> On Wed, Jul 8, 2026 at 10:25=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> Done: https://github.com/rust-lang/rust-clippy/issues/17379
>>
>> As for this patch, I guess we don't need it then?
>
> Thanks a lot for taking the time to fill the issue! Linked to our usual l=
ist:
>
>   https://github.com/Rust-for-Linux/linux/issues/349
>
> But why do you mean we don't need it? It is still reproducible within
> our possible toolchains, right? Or did I misunderstand something? Or
> do you mean it is fairly rare and thus maybe not needed?

I mean that both the code and clippy setting are properly set, so
using a workaround for this particular occurrence seems like a
half-measure, as the problem can very well arise somewhere else.

>
> We can also always just disable that particular lint, and perhaps
> later on re-enable it conditionally when fixed -- we have support for
> that now.

That sounds like a better way to address this, yes.
