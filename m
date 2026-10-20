Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792497523;
	b=X9w7y7Wa11c3jw8NnDvwuonXOWcL9hVlVVyMl/tsPEinOnKuKwRt4UZPFENkEXoy59/x
	 vv+ZCfK4xoj9yg1tDALjElkV1hqsritYx7hSlFGO30KBU/C6bV/qyVWIudaO8Ub1/ISFz
	 lh6JyUTWWs4ES74dliwXdcXdzzwYagyWW+568mREeAiQx5IxzpLco5bTItxAYzJa/djLT
	 TgQolFBiC+EOrCI6CtCFgRs0Bycjk3do3yTyrbVjCzgY8S+w7bcIqCbAZlxr9MuV7DtcJ
	 uYBUhPpUM7CroKRlABSZEp7LYzOX0C0gpN1pLtFisRazVJravWRBXqnXPh9Ul3PPb0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497523;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VsHVLkdhZFp3TiAW1gxa/ApjDdqOxgGcRkHRtkjoG4U=;
	b=o8/iNr9Gv+8BSLwbRBJwuvtfpUoCQpi5+DeXZr30h81KskAadSGtZhdei/TTpb3yqh/t
	 ilb3YHtVYvwrxDy1hkXqdcVDP/tpjwdeMVPqlEcLuXDEsuL6grK2pRRUQCoqrFtgK1RVa
	 Byfhlh6YFKcZUU/oOeKjsPBMZW+0yKHI0r1cH/CcRfIgONbOlW8oXabhRrIyxxe8YpUUS
	 +qoLVpubS2oKVJXfgCAbfCZSkB+QhBzelACDDr0/GYmJlbOyx2hs78gf5TFq0tH8kbh0H
	 2WuTpCfl596ND7Dbac9f4V9QsXQqL2hvOvjIJQh5GhSGA9QFrRWzznN+qYR+Q0INIbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=Hn2+ovWH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.137
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020137.outbound.protection.outlook.com [52.101.195.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D046E60A260F
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 11:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D046E60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=Hn2+ovWH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQFUFyJ7NQB0er7FqECPZnEod4C8I7CMx/StDH2A96VD7TQISTMeXPIu9fZEvqWyH2vcEOoUP/xv0XWxAQn1XO3mmF/2ny15FqyvwcQJ5eRozJnYECCckPlCzXBtfeILVAYK+hJc4D7x3SFHDHB1Tt+lWdFsDYCpmsXGRLz4Jk/qGvQeIS5fDjPP+fuEBNF4eV22Rg6qIc4R2qB2BZFcxbEIW5sDITnncQg0FgCFIKrRLs2Zx2aB9BPV1bL5sFUVpy+Ptc9kmx17LoWkqGUC8xysjb1LsBtDBrH/hV1rT8ejLzN91acZKkdBdmn/RJQRmxqK4gUmHmJ1/Hvfu/4OhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsHVLkdhZFp3TiAW1gxa/ApjDdqOxgGcRkHRtkjoG4U=;
 b=cQniGOALtaDLGHAKd1qJ8bF2ZVC9t9UAKC8SOfwueUIy66BnU2f+Sk35DxtLoidWqJ4l4wk7Sqhs3/I3kG8kIFIcXfVHO0v+tD/XRcsguZAIXRzLR4a+2n8lFYkikPzmatjVus+BG4n2IWywtQ20dWf58keSZZrU0sOe6fbejeJ0XYoSwIf+Aiwdnia+PjMKCbeRTckF+K0kJCEyMRX39UHUtY/g51aYX1g9AokYoN4GzIMT4LDNpVdOjk4p9PjmR1z9jhM4zy9n8a+BtkbrBO6ugZW/FQEjB8tTygJWlAKa9CEMv2vECXM/pYVsGuuU8j+i9uBryBOh5YGF6q4i/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsHVLkdhZFp3TiAW1gxa/ApjDdqOxgGcRkHRtkjoG4U=;
 b=Hn2+ovWHGmDfuIFZMTcnos8qQKWly5JMTlktrXea6UC7/QGB/ZBCHoTCpPKkOORsjqncMqjmr/V0qrOos4xYPbn+iYQck4QtKEoor0+q4lz0cmZnmbvdOgODP8Wtg8KBviFRQZbCLxUUN1eM8cwvV+uH8LK+Qb6zcv3O3Z497iI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO9P265MB7475.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 11:58:38 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 11:58:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 12:58:37 +0100
Message-Id: <DM9NC7KWLMXE.203CLTZWNRCCU@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Sami Tolvanen" <samitolvanen@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, "Frederic Weisbecker" <frederic@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Thomas Gleixner" <tglx@kernel.org>,
 "Anna-Maria Behnsen" <anna-maria@linutronix.de>, "John Stultz"
 <jstultz@google.com>, "Stephen Boyd" <sboyd@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
Subject: Re: [PATCH 0/3] rust: Fix CFI type mismatches
X-Mailer: aerc 0.22.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-ClientProxiedBy: LO4P123CA0403.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::12) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO9P265MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 5726cab6-4bd9-4d93-61fb-08df2ea17a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|10070799003|366016|18002099003|22082099003|921020|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	q9pwUB1SWnQ3/x4CpmwXynitwn0II78EhJ/J6dzNqrjodcIGsc4IMv/WopJWnDMzrW8XDweLa7gqAKhJJ1PwFy/5xjpz4sTJzhJwdqKUdpve+5Fa+AeeD44KGK4brQFxEO1zkKnjMWQr1D+WHT4eh+b+tmwIStweDQsGDeAJA3nOtHYnUExiHWSocuVdU9/dLSjyABlt/PFLu8Ry41ezNIzza7kfGuk1+4o6voC3NuHPP9TYwIFZPRPPukZZ9SxD63KQTgcDszm6qtd1tJROGx/b/kVjMeYwhLXMorMcnE2BR+coxhZtOXJs0s8WLugLRPKHLwwuHIoA/lQ9wWurcN0f2NAWlb4Y/tJ2IaXi35VsApgWH056WeQ6HvYcCSzBoaIY1Rrs8YsmYflpDiZ56uWvNiYSY3M5r56Rfaxg4ayLZZ/Sborryj1rPXCubYDmSLh5ohdJr92V0/FhjqqqzdTlmeQyhSDCaITHxR/YgFQkKcXOFL+NNWSBMuuLTnSZqsM6jt/5kfMldjJV+S7XHRK9XvPv6pxLds3oPorSML/8A8HtucQO7BNHHs5HW4RNk6Qc5q9kvmlcUehW2NYdfuEyCJIRgyY6YOaLXGlOKzfSuKpmOp97wjMXZ7gWGNQXPmq0IkTHErOuDaj8Zr6fEbnpII6uH6bJz5k4qU9mFfkt2ZpuFF4tH6ElRgHORw9z6xDldEwhUW9J6vCzu03dYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(10070799003)(366016)(18002099003)(22082099003)(921020)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVlwQ1kxMy9iMGx4c1FzTVNKTnkyakEzOVJUT0V0L1BkZTZpTGl6TkxNVysy?=
 =?utf-8?B?YWdkMjdFd2VqQjVrdnNJL2JGbnlDZW9RbHJuQldPTm5ueEpCWnpFdmh5eWFL?=
 =?utf-8?B?MjVQTHZwV25JL21PZHoxbzFTKzNCUk16eS9mMDdadnExVEZJMkUycFhCaFR2?=
 =?utf-8?B?Tk96ZUxaL05xOGtVWi9GNmRTZ3Zld1FIQkwwUVRsTXdxL3UvT2U3QUo5UEJS?=
 =?utf-8?B?UkNuSFoyYzNCRG1TVjY3b25JdUF6OU01SGtPbnpzZk9HaU05Tm5KYndsT1Mx?=
 =?utf-8?B?OHF2bzI1MExac0d0Kzg3RXFLY0c3ODJ4QWRPdzBBUUE1cWpCSCtTVjVLWmlD?=
 =?utf-8?B?ZHFSdlpxQTRIZEV3a2hYZjlJcUoxb25ldDczd2RIWDN3Ny9RRlNHZnBMNzk4?=
 =?utf-8?B?cTBoZzBsZDN3UjZNaUg2UVUxcGlaVDk0Tk12VXFSWVNUeDJ5di9rbitGc21F?=
 =?utf-8?B?MW1rcWFHZlBaSUJlMU1VS0VTa0RBUzJYNG9rbDg4RGplRDNoUG9VZU1lWHJ6?=
 =?utf-8?B?V0lGOTZJMTFVN0l5bUJ1RmJPcjQvWi9WeVlzSHd5MTJWNEZPK1d0eGRRajlT?=
 =?utf-8?B?VERDTTNYOXdWZkpqMnIveHFaUUNIZllKQW9oUDEwM1lTUkNWY21iUHdSeVIr?=
 =?utf-8?B?VTdOZHQzUHR4NUhRS0RhV1htSkhnRE5EY1VYQkxPVTN6MWpZU2JtV1NFMWJL?=
 =?utf-8?B?QkJQOVNzS0FleFBPMUhaYXlyOGxwTWZTbGsyaHdTWTNZWno0MmQrZGxhWGpU?=
 =?utf-8?B?M3JmSVFmVDNoRFJyMkRlYzF0TUYyUytaYnp1cktVcm1wdHBqbmZwM0RpQkJQ?=
 =?utf-8?B?ZWpCQVcyaVcrS1R1SEg3V2VwOFFSbW9mN1d3RmdiWkdhL052WnRWY01wRm9s?=
 =?utf-8?B?Z1N2cVFXSmxsanBWUExGSzFRdnpPUG92TnBvelhlRldScENWbXlodkdTT1Zz?=
 =?utf-8?B?SEF2ZTJLTW0zZHIzRkNVRHEvb053eFc1WGE5eU5yRnU4OFNNWVZjNWYzejlE?=
 =?utf-8?B?N29VK0R3WW1ydW42RnZaVWtIdkZKeGIxaThrK0Ztdmw3Tkh6NmQ0a1o1NFEx?=
 =?utf-8?B?U1NBRXU5Q2ZBYys5SzdncTNBVkdUc2xzVXl4YlpSMVhCSEtoUDU0alNWSDB0?=
 =?utf-8?B?OUtveUk3WWxmQVc0TGpWcEhtQU0zemhReTJtanVwL2JrVVNEb0V3cFNONHd0?=
 =?utf-8?B?dExTMExQa1VLUHVLcmhTaUt0MXhHYXRXMXV3d1U0VzEwTHZhb0ZLVFpHTzRl?=
 =?utf-8?B?TExpY3hPQTU5VnBrOVlkVmJSTlFzMVQwWjl5QUxjRzZOVzhJRU8yUEticEVJ?=
 =?utf-8?B?a01GU0hEaSt6YURybXp3bDlCZHYyWkduTW9LN1lJT2FYUHZjeklhb2hNb09m?=
 =?utf-8?B?WWs2YjZZd3IrNVVUelAySFMyMUdIbWtLZ0lLVjVyT2NCdE9JblM4RkE5cGhV?=
 =?utf-8?B?b25YQng5N2xIZERtdkJ2dWUreS9lVzRJb0w0eU40SitYaThXeEQreHV3TFhD?=
 =?utf-8?B?VWpraWhab01VWTlwQ25tdU91K3dweTdIWkZjcCtPV0lPRy9ma3hoUkNUSGE0?=
 =?utf-8?B?c2FkY1NTbmtFWHdaR2o3NTM1WjVFUFc2QWpHY2gyeFFjRGJsUjdDRmNhQ2dG?=
 =?utf-8?B?V2wwbmU2VHpkMEJYYU0zV3RVL0VzZG9NT3pVZHhOUHhqQ1B4Q2R3bys3bDcr?=
 =?utf-8?B?TVhleWFtTWJIclJYdHlUczEwaUU2UGFsbi9TL3NDaklxT2x3NGE0MjdHS2Nu?=
 =?utf-8?B?d3daa1pNYzhzOE01ejRRWUpIa2NsRERQcXU4MzFaOWlqQ1hEMVMySStjbXRp?=
 =?utf-8?B?OWQrM0pja0NkMFpCMGhjbi91S2I5eDVPYTJGc285M2o5K0ZvQWxpRUtEUmZo?=
 =?utf-8?B?cVhvb2hJb2UrWWtkWFNsRjN3ZTVEeDdTZU9jUVBIaFppSmZyek1ZZUhKTHI1?=
 =?utf-8?B?MGZYZ3dMMnpEaklsZHB5am4rak8zeTZaUzRTbDNnbm54QWtJRzdlYTlrQUht?=
 =?utf-8?B?Z3V5R2ZFSWpYR0RIS3pKZDFsK2dlN1JlWExVVURCYXQ5SVF5dFlpNWZJMWNY?=
 =?utf-8?B?dmFiNWhBSGQ4MVdDbEhpakhjU2xlTngrZE43MnhXUlVYQnZQdFlnVVRwT3Ex?=
 =?utf-8?B?OEtkV09qYzNCeGtvakpBTElFQWh6WHYvdjdJTDBFK3I2YUlFSmgvZXRmWW16?=
 =?utf-8?B?Q1NkU0FpeDVOdzNmS2xQZkJSa052VzVnbEZhZnppcmtNR0ZiNG5PdjJKNjRr?=
 =?utf-8?B?UFNpRXlMTG5mM0l6aGk2QWxYQzN4M1orN1pVeG9Lb1o1Y1FTdFNjTDVZbU5U?=
 =?utf-8?B?SVdrMHVQdXl5ZWx6WFRSMWU1aVRIdGdPZ3lYbVlXZXJHWFVSa0xkdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5726cab6-4bd9-4d93-61fb-08df2ea17a02
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:58:38.3203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtcLnMjSVsIKw8MRI7hHu328iCpUvUg1oWQVEoUuBfwz3rGDD8D6IRWcCInntgWEMhtV+kJBPLpF9yQdQdINtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7475

On Tue Oct 20, 2026 at 12:34 AM BST, Sami Tolvanen wrote:
> This series fixes a few CONFIG_CFI indirect call type mismatches that
> I've run into while working on Tyr. If we're going to run into a lot
> of these in future, perhaps we need a better solution than addressing
> them one at a time?
>
> Sami

Ideally we would have bindgen doing it, but well... Looks like this has bee=
n in
our bindgen wishlist already.

The series look good to me, so

Reviewed-by: Gary Guo <gary@garyguo.net>

Please do include commit list and diffstat in the cover letter next time, w=
hich
I usually use to double confirm that I haven't missed any commits in series
review.

Best,
Gary

>
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20261019-rust-cfi-fixes-bd898391df1d


