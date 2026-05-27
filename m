Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022132.outbound.protection.outlook.com [52.101.96.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59504657FD
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 18:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905252; cv=fail; b=epOEX8eC79e+ABZx//E78eKWuOXR+bkcfXyPIl8CJXrxvDARnk/VXLCAO7ysSAZWUKsqxqMw//Sb0aKyT8yzHBELyZBkhbGLDzPRHFkjvf0M5eXRFLDKqRE01VhvgcPjGxOQvZ2gAmoxxKjLVWE5KldcslSAy9N0er1sLeIsYAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905252; c=relaxed/simple;
	bh=+tKOee9PUvA6dPDF/5J5g+W0NVjk0oYUoTrRc0hfR1s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ukAkYjr+yBL6B1KVP9KNeMbeF9SSfQYikGCx6KHWYygeWBW/dN0PpeJ7B9b2msfCZKn+WqXQzMegEvo5NF9g1y8kXBz5cx8QxS3ynNfSt1zsIw6f7oL8msqmEIouMdi90lNc2GmiyBlhd6ornFNKrHEDAVJzIZYsfEM9DjTCDgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Z0tNwbX0; arc=fail smtp.client-ip=52.101.96.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Z0tNwbX0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPdFsovKyVc4onRa3bo+vjTSzhQetaMNLmhxrxd7KshDxxNAj/fKpusjwPvHEuTJ4Ntq0Sq+KDuSM3Z1Oeatx83bPHaed/kIrlSotBhsofFzNvGRthI57zI/rPn7C2x4goEpbPgLux+u5tJihsmV5V+/XU3pEHmA3EfzvwV4RCHL2V+vIqGQOQBqXs3HEoxfDSt/LNErWgrmDWHkwrT0/tml1rjRHxnB87x/wGjyRujS1geEaQi91+d59hUUPQ8qlepm1L9CVRvnlUGE9jjlDFK96KOenYu54mk4Tq5Uv6k+IOYydCxOfSHsrUTY6qeiVNNoLmV+r4eqYWsB7Gil6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tKOee9PUvA6dPDF/5J5g+W0NVjk0oYUoTrRc0hfR1s=;
 b=q5cS/EL5DizCt3l1wz4gISEYRzWssPPBZuOZpkxKqg7wuen3kGSO736LUDDpBkMeZLS39Ay1eQ4qidUpW7lBOJWWkBfw/ibp+oxSf82OWEzIGk9Ula5Zs+u083R2R6dcRMFZubkkKCp70CbZWs3a7tVYoiUiZ/SeSCbb1RSAWq4c1uVS8ERcnRe1SXLGqQSryciMHJi7suLyziEEwkmb8a2SRGOKzEU2l2BW4t1MiEbXrn0kjcMPCzarMLAlKW+Ytu0DlIRc5DwMhXB1cMtpPn9d6pfRsQeGZv6gfONrgc3mYwISRROse+pdtd9oagWmGXpK/LGTk6E+xm/+LEgFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tKOee9PUvA6dPDF/5J5g+W0NVjk0oYUoTrRc0hfR1s=;
 b=Z0tNwbX0x5TEsdOpJ85E+cFguCXu8a6gcX3MIZShV442RSyoOzs7Yc8l4sC/LM3WxhCizcyOv01besmbZKL5KDReWHXfBeDhKGPONi9oEDTm6PL52fWIIZYPiaqWEOoT1mwbWyNL4kRk4bG8ubzHPhLJmMVFnz/N34Ad3JtX9Uc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWLP265MB2417.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 18:07:27 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 18:07:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 19:07:25 +0100
Message-Id: <DITNR1QTIE1L.3MTG2UJJVGFAK@garyguo.net>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: devres: add 'static bound to Devres<T>
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260526000447.350558-1-dakr@kernel.org>
 <DITJFWVQH4ZF.1HYM0UDBMWQ2J@garyguo.net>
 <DITNP59XG4H8.VYHNILHQV05G@kernel.org>
In-Reply-To: <DITNP59XG4H8.VYHNILHQV05G@kernel.org>
X-ClientProxiedBy: LO4P123CA0216.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::23) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWLP265MB2417:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d9c92d-449d-42a8-ae2b-08debc1acf10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4Qd/lqAomMa/GgyFzAP0QQ3bbFu2btpPHySrnhC0A7QQFiIeipoMdcY/+33odhARSu3+uDk+l0sBo62iQwe632ErUmfayJ6OfKC84Vt4EUMW6h8VFxmS6fq+K//0BPrZHKcaL7VT08xC9j38lIFeHitheMyB5cn+pXtYj4F312zHj56ahI5RlM23hVwztlY8aYe35D3P7E5UnEjG0haYUKOjd9OCNOm6yS8/9eVZfq3r7X6aEXm/rzYjloLYyNejffpTKkNHqEhMZz8koNlNQkvFqYusTlUL0QLg67dYE0TwzYxZ2Qna4Ej346TnhjZ8WCKIIDT8tI8k/LatiUgIUC8hz+zn+5GPzW0d37lZVAPQ3mdjTlkqdLkl3O+H2inHCPnTqLf+W8J3bxrRcZE29iTwVf0Z9/Fn6FyLbFT8jRuW/km6qWenHQuefrdva4Iq8LZYxLe+KpavzJxg91jSk7nNVjfkm7DF4zBrCVfVhxqGLAXmCNaax612L8TPdHW0QM4wqJN6/XmzANcNhxmWnVI/lx8gCxlKHe3Kxmpj1cZezedGfZAWQ1COGeOlSOX17CpPdGdtxMSp8H53MbsUL1nfK7IAKhsU7kXYtPNwducKwP4qJatUlFlSeJxeaQDPlPZY7/r7wXPhg8Vae3FEm6LlQM3z2EPW6JcuJVHQzu1826ysHzyDkPGHe7j4xzRO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFV0NU9VS3pWN0lIVWhQZzdDY1dVMmZwRVIwdEN6WkxSMWIvM1VxKzVYS1dp?=
 =?utf-8?B?MzdyLzd4amE5bDgrRERTb2VMVjJjU1NZeGNrdGV1Yk93Wk9FM2tBNk1FWklk?=
 =?utf-8?B?a1NuUUU2dGp5dWNHUytQaDBhOTYzemIxOUpYYUxvVFNCMkZuNHJDNTBSQlBM?=
 =?utf-8?B?dEI0TjFQRnJKRnRNalZWV29LVXdoUUN2YjlyYjJCZHFaNHZTZlpQZVR3V2lC?=
 =?utf-8?B?Ni9zUUFpcWt0U3ptUTNWT0pETEJOSmsySXJvNU1VeGtleUhDVGx5MTVJb0J3?=
 =?utf-8?B?TVZCaDZMQUxac3RqcG1wb0lpVUI1eXg4VEc3RUNtSm1jUnA3K1lHQ1JjWHRt?=
 =?utf-8?B?TlRRVEJ6T2MzMDJoMnFWcWdaekFVRFJIeks2RkNDcHJrckx0anpLZk1lUVg2?=
 =?utf-8?B?NFNSSXhNYzFNaWt6dGFTcGQ5U3JGcDdyNW0wR0JTYm9NN3gvSWlZNHhpc2hi?=
 =?utf-8?B?ZjhjWjdxRjc2OXF4U0d6UWo3NVVnYzBIOVJkL1BMUWVnRGF2Mm91Zlg5SDNk?=
 =?utf-8?B?NmZLMXpRMUJnRnpDUG5YeDArRzlpQmRRRWdkdHhpbnpjMkxkaHozUElTV2Rr?=
 =?utf-8?B?UFlyZmswUjRhTlFHdDRKaUNDT1dqT013SUhnUG1SektWT0pFSERpYWMrQng4?=
 =?utf-8?B?UGMxbmtzWThGcUVkS3JaNFVPQWpjNTUxdmp5d0t1Nnc5R2x3VDN4ZkovcnY1?=
 =?utf-8?B?Vk8xYUYxZzVpcUxwWFYwNDcvWFNxYzlKV0w0VmlVQzhtYkFKczN2a0YrVmNU?=
 =?utf-8?B?dmRmRXJTcUxiVW95dmNzQkZNQlpuUzJlcmZ6T1p2ZFpOWEc1ck5zNkFJaVVU?=
 =?utf-8?B?RUtrdkZZb3cxS2pzSjFtdlFWR3RxN0ppZS9RV010YzA3Rk9mY3lYamZ5emFy?=
 =?utf-8?B?THplTm9SU3JSUXBVMElocVRBVmhJZXpZSHJrenFCdVo5WjV1QjJiekZ6ZWdQ?=
 =?utf-8?B?d3RjeW1admFRV1hEbEF2aEc2dkRlNHlCeSt1cFNzWWdiemNSczdGb2N5Y3N2?=
 =?utf-8?B?L2VEWCs3ZGxyWTZ5SFNGdjgrYUhiYkZ4NHZJaGYvcDF0VCtKYy9IL09RQk54?=
 =?utf-8?B?aHRvTFRLYTN4T25YNWZCNUp4SEpGS3VRNGpxV0p3ME1TUE1TSFhsYUxXM1JG?=
 =?utf-8?B?YjdxcG5PNEM4UlpRdU9IYUQxNW5KUDdxcG1JT1ZaMERmS1RnYWE0aklEUXdM?=
 =?utf-8?B?MjJEOWpxbFB3NFRNaytqUmlYTEsxZEV6eGxNamR6UnJ5V01jZ0dTZ0gxYnlO?=
 =?utf-8?B?d08wVjZHckRHbG84YzlHT01VV0FHaEpzd01HUDkyMkJCL05NQTNObWErNno1?=
 =?utf-8?B?WkV5UTNjeUR3MW9BcHc5MndSQU45WDlPeW1nbFdYeVFVT1p6bjVGMmJSbkJi?=
 =?utf-8?B?YW5sbFRlc3VtUmpjaWxWR2RUWFNBbTBNZkxmZUNjVTRFbFZqZERGazN6Sktv?=
 =?utf-8?B?MWl6RlZGWUkzdWIyamgwb1BBWjJPVkx5QU4rYkVyeEI5NU5wd05yajlCenAw?=
 =?utf-8?B?SGRMbk9NTnk5eEYvYXZiMW9DdzNNeWRNUy9IOTNpMzJJcmNaY215aWpQN3c5?=
 =?utf-8?B?QWUvaHpCRGluTER4cFl4Y2JhK1l1WVYyR2JDYVRDUm9qamZqUjVIQjk4V0pF?=
 =?utf-8?B?dmx4NGUyNFJwM1dNSVlBUzNTWnhFdTFicVVGejlMYnl6Z0JFVlc0ODlZNzI3?=
 =?utf-8?B?NXdqaklWTk94Uk9GZDgvL3UrSHdGZGNUUmZNNk9QRzU5ZmxQck1sOVJKS3Ev?=
 =?utf-8?B?dzZtKzdOY1ZmYVRBcWZnSVlBa3dIbllRQ212d0VpdlFROU9kL2krQzhyZWh6?=
 =?utf-8?B?WVdLejdBVWlvYXUrTXRsTEE0eWUzbjQySUNmSWU2V0VPRDB4bFJrb1pGL2hV?=
 =?utf-8?B?RWNQcHgxbTZneGErb0pML2lqOUpuay80L1NYV3RGMVM4VktmNUNTN1FHVG01?=
 =?utf-8?B?K0hCV1hCNmVZZFp6bXhwcTlZRHd2L1NqUUdzTm5lTEtGRmlqeFB6Ry9uZ1dT?=
 =?utf-8?B?ZVc1VFRMRWxFRnZDcVNXYlFWb2tXdEJoNXp5SC9UcTl2ZkdDYU9OQXYxdHpU?=
 =?utf-8?B?NTFveStuS2hYRUE2NVR1c0w5WFBUZlQyWUwvZGdXY0pFR01pQW43RXY4cW1o?=
 =?utf-8?B?OGtHMTNvc2tMK1BBaWRyZjh6Wk5ueEsyUkxvQ01KckJ6WEpZOVlGNThTZjRS?=
 =?utf-8?B?ZzgvYTNKbVFGRTVnZVp1cytyQWQyWlY0QWJOVS96M3JLWm1jV3NDRUE3aDZG?=
 =?utf-8?B?OWJ2UzBtYmhVaUdJbVNTQ1RJYUd3NFJPRmNmK3lLY3o2MzlXQU1WYzZKai9w?=
 =?utf-8?B?b2dLWVUySzg3dGlERUs4NFR5S0paUW1NaXZERVV6Nmh1ZndzQWhDZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d9c92d-449d-42a8-ae2b-08debc1acf10
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 18:07:26.3865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBfvL21F6LIObjmnumKSlxW+YX7+zIoghyEt/7p5hBxAqAbplZNm3cF6Wgp6W2fB6ArHtdf7ubD0W57Iuocp6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2417

On Wed May 27, 2026 at 7:04 PM BST, Danilo Krummrich wrote:
> On Wed May 27, 2026 at 4:44 PM CEST, Gary Guo wrote:
>> On Tue May 26, 2026 at 1:04 AM BST, Danilo Krummrich wrote:
>>> Add a 'static bound to prevent storing types with borrowed data in
>>> Devres.
>>
>> The bound should be added on `Devres::new` instead.
>
> I did consider this as it is generally recommended to minimize bounds on
> structs.
>
> However, a Devres<T> with non-'static T is semantically nonsensical, not =
just
> unconstructible, and I think type level bound represents that better.

Technically `Devres` can contain references to the registration, which is k=
nown
to outlive the bound device.

Best,
Gary
