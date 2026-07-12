Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021077.outbound.protection.outlook.com [52.101.95.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97890322A
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 00:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783814909; cv=fail; b=XXtuhjBVujZnK6VLG68GmKSKZK9E3bJcMG7tn+TR1k8jf8wrIpC7GLFQ0DJnsSRMTajphvUxJ46JOHuOSkzpMQGIr57+g0VFjZyLlFy5RrrJiO8pVl7KUkfzGkBfKcWRC0jfNlgkqidYmsskZlpV4maE+fa72RTQdzfG5ZoAUUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783814909; c=relaxed/simple;
	bh=2+Oz0oALNpnBx2TgvGFrFUujbB7GyKQ1X2eYaqLfV/g=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=LnkDQP3r8/cVDbDhhwLrN7pCPvcRrlZGo98K2WPWCHTTZVtJE4qtodE30EOiIKELorBSFXgpdj53TPY2T7pklSJm0i4hDfoqvWFHBH2LFPKEYvs7QX7NhnnhXb9lnijJqPF7km9ybP3MR0ODmy8VTqGUkyDWFS3NUxty3zeD9Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZAR5lbTI; arc=fail smtp.client-ip=52.101.95.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZAR5lbTI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXpmzvEAPhieRVfdCSxfos57v5rflePlJ0MjRGkNNni9SpeHNqSIrx+IlUdfymjuKAsGjhRGLnRqqKFfssccN7ivaqxKob4ZEwZpfPlyFSntKpmK9umEugJd3vrry8uttIO4w6xFJPtBPaqyYnMEQlg7bwtT0Mfm8MeOtsFUyVdqwvZoupLcV6vcZsLi813ul7M3BOpX54J72Jj0B0PpjQ74V8bCjJZgpsg8DNGzPnzmt+Od2HfLYbctW2PGsLfsAdmZ8IDlZQSN2LqNARrTBgeVmzfe0KGVMn/5ZkA8A2lK9RxjAfAYJ4tcUU5BbjCnIck6yVEdomFZZXHeGjZBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xyjm97MG0H8zOtzvV2cmLedKJT0NzBhVB05gF9ZoFs=;
 b=qIjtDM1C8unnSdEvw+MfnohbSxSicZK6mlQfFaataJZ1RBpfSaAAIuTAYTbue7PgoZ1m+Dj7+Iqqy+24n1jNQ+cJAPb6HY5O4swbhQox+8cdWsZ67inOtvn34u2V8aFEkMuEe/IpZqyM/lnyCK7bFqsApJ7VSGwY9cKPrbtvDe7FgVc4fS7Kh8oig24JhXgz9gDO0EJXM2IZhYUFrSPbBWxQO/9Yo7bcehMGx/2wSVUWWJsfU4bkxQdDOgtq86ehh6TAJFdl/ZWfzypNYfYBVz+G4/tPqeK8r/DEBRU3WvnP5BQXerYZuBCGA9G2O6fAYRFRCf+BeXpced46WVrJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xyjm97MG0H8zOtzvV2cmLedKJT0NzBhVB05gF9ZoFs=;
 b=ZAR5lbTIbx2Ch7DbJcyDvmeIzyjq5EZ4xavqWBxUU8jXuRMAaJH7+iTqPtaIbd7c1JtTScGvSalXwUbe8pEFNifin3YRTHkaXEcT+5rMIai5qEAwvg/wPwHFzCJeIbqWfymGB6KU2Vdcsspgd0noeamOooBEmr4nogOWmxWs/Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6000.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Sun, 12 Jul
 2026 00:08:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.017; Sun, 12 Jul 2026
 00:08:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Jul 2026 01:08:23 +0100
Message-Id: <DJW5LXIAN16M.3U0ENPC6UYFKL@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: <driver-core@lists.linux.dev>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: firmware: avoid UB in example by passing
 parameter
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260711180231.229525-1-ojeda@kernel.org>
In-Reply-To: <20260711180231.229525-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0551.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: 814f6261-113c-485f-cb61-08dedfa9b066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|7416014|376014|366016|1800799024|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/gcQvgmzjAH4AHcn1OvouDl5rD5kIHHPDti5Z/IRNNHzIKDz1t6OG6xPoVAC3TtOa/3tyDmbBAB/3PoamPXpEvbbLKuizGOOfldEQgPLIEFLKo9wdGE6pYSpboB019K9YT7D68BnRl5EhBKtgt+d6+9Q0+h8VrVEQ0rFNCCtL8KRWGHIKuBhlQE0Qacy0XtaG0PXQtXu4SnAWpegOW0wvjx9KHLZz57zEEH9/Ht4/uMCO0xzyJera0UJTqoAcOhity/ho/3ZaHfcDhJqVuVfEV78Qw65DZuuyWpYPukA84jIRGmBvNBxclthCiYqgbLpEzcSFXocsh3PzTVfo+geXYzicEYwcUyD0JdBbHx2lYvuqEZvljlAwZzWtRMkuM2yoZxEcFchkl+vcOyLV6PQ5Sd6TkqfwwePs8UZoBufZ49i3q3ob0DA47KYl3b98s5CGOeoDPKoaDrGJ9CSbbr3L1XMXwg+TywTQ0tZxI8vlvvXuEzXq2g6i5zuItBTqzuW4dpZvJCz/cCslSa6PezkLTaVjlQO8fLopiC2OAHjRjKRFs/M7dRpJF5QQn0zehMeD9b1gd1goQvkak0uop67fNBdiHhfrV2S/g1+gaMWCkTj8cHNjo6hGAapQrXRspnLJukfIIi/1pVQWLqPBcmfhFgKSQSvzPII2EPazFYteC4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTlVZHBPTW81bUE4TTljVDZXYWo5Szl2MENYQnlYNkI5NVAycldzbm42SzQ0?=
 =?utf-8?B?b0dsUlo1Ly8yU3dmdGtsT1JqMXdtalNOVHBWZ2gvVWZaTUtPTzJvdTM4MmtL?=
 =?utf-8?B?NWZkL1psbFJoczkycFlvR08vRUxSU3RrTlRyU1Zkd3ZnVFVRZXUxUDFTNEZs?=
 =?utf-8?B?c3N4blQrdjVvL3F6MGNvaEJwQldyYzMxZ21UOEhvMWlINENiUlNRSERJdi8z?=
 =?utf-8?B?YkZSOHl0d0dLbVZxMUlqTThhd2R0aU1jZStoQ01LL0c5QmNFNHpjMDAwczF0?=
 =?utf-8?B?ZEVmd3lmd0xNWUp0Rm5iendreitCQ3JHTFd6N2JBNDVaQlhEeDMxZVF5Ky9R?=
 =?utf-8?B?Q2xmUFlaMnFSS2M4R0twY25yM3N3ckZrQkNEL1loYVFLQUJJVm9YbTU3aGpj?=
 =?utf-8?B?TG8vaFhnSC9ucG9xNUpLQnh6cmVZai9IZUtvemo3UCtuVHNIakZDYlZQRmhO?=
 =?utf-8?B?Zm9vTTA1ZG1aL1hpQUs4cy85SkF2aXY3OTl1V2tHdGRzTWYwN3YxVTBLbWh6?=
 =?utf-8?B?SzJwOVFRS2hLcFNHTFV4OGUwV1I1UFV1UTRNZFMrakxkSnYrTVVET1M5TDhX?=
 =?utf-8?B?N2lDaSs0Y3JMbDB5eEExL2hPZXFMY1g3bGZ4bDJrc1ovZ29pVXYzOXJIZWdi?=
 =?utf-8?B?NzQyeEU1bmhXS1NBWU4yMGxnSmMrYW9WTEhMVkZnYnp6UGM2amp3dlV5dk9U?=
 =?utf-8?B?SXBMOEFlMlBaUkR1NmkxUm9PQ0wrUmZVWXdZdGVldGNPMmtmeUh6V2s0QVJw?=
 =?utf-8?B?UHlrbzUzZ25ob0ZicWp2bHlHNFIzYnBFcTFicXllS3REd1NMQ2RCZHgxY1RQ?=
 =?utf-8?B?RERzTjBpdzV1c1BCUmVNRFVqdkNBZS9IMEliUFJRT3VtTW1LYWdrK2VRaHkx?=
 =?utf-8?B?Y1FDSkJ1emYrUXNzc2xqV2xzUjhNUkhLbDlCcDdVUVErUWVIbXZTVGI2UDRK?=
 =?utf-8?B?dld0OVA4OTRtSlExdFlld1AyVzM1bjAvR2lXRmhiUXdobGVTNWpUWWZ1QnB2?=
 =?utf-8?B?RVpKY3VQd09BWS9Bdkw2YUx0aDRBcm9LdWk5RVhGQzkzUU1GcHFzN1dtK3lp?=
 =?utf-8?B?aW9xbU5jRHJSSVZLekhPNTl0Z1BUaW14djFPZlR2QlU4WUJnVSttd1J4ek5N?=
 =?utf-8?B?VmNjMkJDT1ppK2tkUEdPU09qK0d5cFZmbGU1OEJ5cmVMTTllNURZRTFOTG44?=
 =?utf-8?B?a1FOdDQvK0xOTUx4c0xsNU5MY0kyZFdXaytCZVlsTWFuOTIzeVJMR3Z3TWcr?=
 =?utf-8?B?WDVWK1EwcVhCZDNDK056TVJWMGg3a2xDcHI3YWlNZ0VJZkJNalYvdUt6NXI1?=
 =?utf-8?B?M0UzL1dERGxYMFhvTHJYanI0dHlMNnBYK3BmaVEwZzk3bUZDMkhKZk5NTlJs?=
 =?utf-8?B?RDFnOTgzcGZ5U2xkY0xORCtpRjM1M0xqak1taytoZmtUeU1sVEY5VU5TVldn?=
 =?utf-8?B?cGYyOHRaT3BiaDd5dFpRNXVtSjZIVm1wODY4TnZQVW9ocituL3F4Q1hMcWJP?=
 =?utf-8?B?QUZMTjhCemVVcDl6TFJ1MXUzdU83d2d3MlhXWlU4SlpmaTlTeEpJbk9wYVBG?=
 =?utf-8?B?UGtaZkF3TjZ0cUc3VkRNYnRqL0FCUFd0V3BSdlFiRDZiNFhXTloyRHRaVStO?=
 =?utf-8?B?TERTVmlZR1RTVjN1eDVKYnllT1N2WjN1UmVlbkd0ZUk4ZmU3QkVrYUVnUDIr?=
 =?utf-8?B?WThMNGREc1NIWjNWaHJPQVZsR21qTzlWaFRNbVFIaWxIR3JHM0xDMnEvR0lz?=
 =?utf-8?B?M1gzMCsxenh6VldmeEhTRUFRWURqbXFYR2JDR2RGcEZBQ21mMGNWMUNqVFNX?=
 =?utf-8?B?ZzNYeFZQcWlGeFlLbS8rNFJnVzF3S0lzK3pOZ2RRVXpwZU1uaTFoV3V2Rkd0?=
 =?utf-8?B?dENEVmZGaUZJakU1KzVDRkhNeXNhazFlQjNlaFF1TndLRS9oUEsvQ1V2NVA2?=
 =?utf-8?B?KzdRVEo4MjhIR1F3eG5UdDVhSG1uNE9QNGtYcFVRM0VwNHZEVEpudFY4R3M5?=
 =?utf-8?B?UkxpZkR3RFhPc3QxMGxXZWhWVnlXS0NUKzBpMFhCQld4YituSCtSM1cvbU56?=
 =?utf-8?B?TTR4VEJkY3NNRVN4Qkpya2NTTm4rSVE0dVA0Y0U4ZUNPWkJYZTNESEpadTVZ?=
 =?utf-8?B?dlBYd0NMSHRFLzhnc1NwbGljSFBtUU5aSTB4S0ZRb05Mb0xHc2xPUXM2SE9M?=
 =?utf-8?B?enZlUmh4UGZSdUVPUnNwL0FnV0Qya3FaVFY1TWloYTNhNHRONVBjNHVBcm1S?=
 =?utf-8?B?YmJGY0ZhWFVyeTR6K0dzS1MzNWpRUkdyZFVreDBCUlZwcUErOENBZTdnRmtK?=
 =?utf-8?B?Yi9wTlpYNVVxVUpzU0RodU1xc05SV2dLQndOamdGOTZtbE84VWtBdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 814f6261-113c-485f-cb61-08dedfa9b066
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 00:08:23.6094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKUGGllwe9/YmX0xyyrS19MkA5RsDIX/RzsCBMo7ag+tHQV/hpEt3mvPS6I7RpZWbiSw53y7+FttyFpgqz9S3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6000

On Sat Jul 11, 2026 at 7:02 PM BST, Miguel Ojeda wrote:
> The `Firmware` example crafts an `ARef<Device>` using a null pointer,
> which breaks the safety requirements of `Device::get_device()`.
>=20
> Instead, pass an `ARef` via a parameter, which is simpler, avoids UB
> and removes an `unsafe` block.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/firmware.rs | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

