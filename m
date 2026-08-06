Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022094.outbound.protection.outlook.com [52.101.96.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAEA471D0C
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016678; cv=fail; b=nXu8BOkYBy6MGK+VceI6at3heMf71VI2uH+izX4lW7xrVkD7WhRpSsVyFXuZMzsi/QwOPNyUxPPlSK+cPR2PtFuVgIA8hvBLmohctJcTaMpBRMQ/WYu5DKs+41Kuo6G20l+pBgcb3aiYwkqnRZNpOGSNkk4FLB1JUnw7yJDaWi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016678; c=relaxed/simple;
	bh=/CgOpKfO7KcG/cpThiUtzKZZBCxu1YYket1Z+fcs4/Q=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=UXXQMLV8PMjGyvDvNa9eAiJAcpVP5Q7nj6tNTwSnppU5KcRlajAkCblCiQm8+7sbG4TdpDeF4j+nJRnui1NCRFgjpwnCiQYzB7OsiwBwBfwXPxX31KQeI5YHYtRoPJbRwRTEQY1qFaH+w7O1IiVEW9kfuHPinqHK7OgbzWYpQ7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=geltjk6g; arc=fail smtp.client-ip=52.101.96.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="geltjk6g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgZFTwuExuvUMtd5yZh3chvLXvtPBJxW2yvCfErfyxtSFY1RB2HgmIBqxQPcsNWFlcgcVHpE/JS90deSCosQlAUEhQa8e62mASFn8Z+XXMMT85IO0hWZiWEf+0nu7bqef8H9SvxqrC1kBlvvC+CRJncE5GtdXazrSDlfbeJaWVx6hQrpSUQotmz/npqWaV/y9Y7K3CsnW/taiw/FDR1VA4ByWbzcxiGePG4YuRkD5NRRRfDoLt63n8h/nKh5crslaVVFPmDQh1r+X9xIzYuM95jeJZZh8wUJ9VLqtZFMD7BOdDyJGmwtw132Xhhm33ZXUB5fBlP8wAOpujnB4pfQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dkFK1BQ1IfMNe3+Q4FkBiA3s8P3wBBWUxSoSTXwElY=;
 b=C7yTAmA06EAeEQ/2Told23Lh4Qwr4wwEibRuf36mLLG6BMKzl9WQrsJdLg199zA9Xi9CwxB03+rQd6weNSNKM8gLLXIzOeWt4sOZSV969SWSwDQNIfngNqbtxq1w1mKfKI819AB6cZGYIJGd3kCBYn0oluahjAFRRA182SxTEFWJU/t69uE5lK8h2bPziJSFVU1yfEXmFcUndgtB5eui8IJoCUNsVFXPPSdWFBsfMdslqLkwIpNu942I+ZURvKhvhNNE/XdsGXs/1eabcbZ0HNxWa2ifDwNibr5v1aMGsR+54H1enVpntdLsyGVfjyEs6tMrufcyiJ/xl/NdT49MyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dkFK1BQ1IfMNe3+Q4FkBiA3s8P3wBBWUxSoSTXwElY=;
 b=geltjk6gYxi7Kag6xcTy4mX8Y8cTm1BTknbFXj8IJhXKM4dKHURgrfqD4JzBabge8ZpBe0Kf2aXl+YOjay6tAgTyNPL6MofK9+04JIah1ZdWcqliIf/XiwDOn/i2nqIllCCPv+P28QZIljOKa96ueMVRPwjEf1HOBFx9CqJz1QU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by CWXP265MB5624.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:158::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 11:44:32 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:44:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 12:44:31 +0100
Message-Id: <DKHU2JQ95D67.33B9B0U3539IA@garyguo.net>
To: "Link Mauve" <linkmauve@linkmauve.fr>, <rust-for-linux@vger.kernel.org>
Cc: "Ethan Plant" <plant.ethan@gmail.com>, "Michael Garofalo"
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "Sasha
 Finkelstein" <k@chaosmail.tech>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
Subject: Re: [PATCH v2] rust: io: Add a BigEndianMmio wrapper
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260806062207.3024012-1-linkmauve@linkmauve.fr>
In-Reply-To: <20260806062207.3024012-1-linkmauve@linkmauve.fr>
X-ClientProxiedBy: LO4P123CA0281.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::16) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|CWXP265MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a54c2e6-6411-4704-7e26-08def3b01489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|7416014|376014|5023799004|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ikJE6nH3LCzVOpySVNmgoKZf3c8D7wp6WYHEllQ3QSSEagqyWUxE2ZVjg/NHFZ5AlMhyVcBY126od+LPperuZCKcdvJalz/0bOPvJLQtRRlU1o23udO/SO2CsPMHbpLFcllmjIBa7d/LYiVkgsYhwAkCNTLZX7UDV2ORt2iEXGaWylWvorXfWD9AsJ7ecZkfAV9RhycncwJSwQLpshfZGo4FfwTA3lmvKF/qR73AakuugzJmytAUqZt5PtXQQm8LjFmZ2dsXPYavtamfKVs7pmB2EXJs252Ml09v+J6YFSMxd5Ry6NUTASAd3hmRu601Ts46ejI3dfantjW5u3bT5Rpd/V5PIoANqxmlXWg/RYvrJ23pu0luGyIKrbxuQ4pHPksCeQYx6PvqOTyuKbUkf0PUIZ9cwXd4SPpZe3D2kVWBMw6JWjXQqWgtsFvarC14SkymuFAzxw/hWbyQ07QL6R+2gEFEX1ZWhC9iHV/iPrzTHa1zsgFpW6/K5Gt1gGnet16jNMETr5ZJBbGVhshOzpmgoudb7Y3qGutcbbeDyZLQguxjODCTHp7O9LeOiot5PmtNSMCqfv006TUwB2b7hXwVVnA4UQVNs65lZTmg6niw1iYBKfgwjvd6OjBQ8kS4johaB55Yi9Nr+KmoF/ASqKMRQASCe/Ha+/4rsH72JVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(7416014)(376014)(5023799004)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFdTSkR2dVFwMDEzUEl0UEtsemI1SStoQjExTGh1Skl5Q2dVRU9kb0g3clJ5?=
 =?utf-8?B?NVB5VnRPdytrdVpSYjZyUlpYR1hraGZKS1RaMnpPL2lhZmlzMlBQaWFoOG9y?=
 =?utf-8?B?ekprL01pTHcxdDNPSXFOWWJOSXNDclMzU1RyVUF0QytJcHhlS28rajREOFA3?=
 =?utf-8?B?dUdEcTdxYXhhQktZeTU3cEdld1J5NGtaRWFLcmhadGNkWW5LZlQzRTZJVzNx?=
 =?utf-8?B?WEc3d0RrWlFwZ3Q2OWtFRGlLNjA1Y2p4eFY4ODlQQU1sNjZzT0tHeGNkUXlC?=
 =?utf-8?B?Tlp3dTlTbGxETGp0b0QzWWJvdk5mdHMwSDVFSmNwNmV2Y3dPbU56QnNIejlR?=
 =?utf-8?B?MDdvYXFyUXJxNXg2Zjd1WURCTXc0SlEwb1ZlOEdrdUpwKzQxZEFGdWNsZDgr?=
 =?utf-8?B?bkFqT1RSaDdXNWlLaENUSGZ2WUc5dllFYlNqem1jRGplR3hyejNPbzdaanYx?=
 =?utf-8?B?UWdDSjdxNWNNK1A2cmhmOGx4MG5jLzJBTjZEL2xKNWI3bnVEYVExSlA4Skpm?=
 =?utf-8?B?aTU1SUtGREZUNkx2K1YrY0FnT2Zvem1TWHEzZm5rdHF0aDFQQlFTVjZjNm9s?=
 =?utf-8?B?MFBkck0zamtHOFpOYit4eENLNUVXR3hZUmxUU1hRV1lhdFhtSWYxMnVWZ29m?=
 =?utf-8?B?ODRFN1hPWWEvRFhaMStQbTN4dlhyQURHVmRDcCtZRVJhUFhWZXJFY0VJd0d3?=
 =?utf-8?B?ODdqaDJ6N1c5ZWhMNnhueGhQcFZDQkJ0Q0VXTmlyNmExajIraklTa3FHblRh?=
 =?utf-8?B?WUtmZGdzc0J4SzhKNmZpTWk5WjdNUnN3VGkzaHFObW16VHhlejUrU1BFVWdh?=
 =?utf-8?B?SWx3UW1LU2V1OGlLK3pTd2kzeE5uSm1zY1lVN09uWlM1V0d5QXR3WW9PZzdG?=
 =?utf-8?B?eEtYY1R5Vys4QVNXM3pXaXl5WVdRbS9MelFQT3A0dWUybS9XaFl5b0RKUFJG?=
 =?utf-8?B?bjY2Qk5waDFsK0IxaU5meXdxZDlTK0dtalhnZS9UeDlYK1E1T3NoV3NLSFV5?=
 =?utf-8?B?OXRocnF4MXVLdTg4R0trWFo3QkJPcnVkb3RGUDVTdnZqS1NCdHNSeTZTV3lU?=
 =?utf-8?B?UTFsUDI5dm5jR1A5ZUFtdXpxQVdqUW9kNzhnUXU2UERCNko0M3NhNTNaOHZE?=
 =?utf-8?B?MGt1VFF6WmJjTUhaTTJ5ZUNKSzZXVmRpY2VtZVo3RWYrOFdEa1I3TFFhcnpl?=
 =?utf-8?B?TFE1NEtJK1ZwVGdkUG5VVkowTkdEUWt1SzRQeG1KOGVocG93Q012cmNHSUlE?=
 =?utf-8?B?cHdVZ1hWbm02em9MR1dLWXNJblZWSlBWL2JtZTRvSUpoQ0lQRWwxdS9FUVhF?=
 =?utf-8?B?ajAweUpsSHpEcVIxTGhvcVhPMXlQdHA2VmRwVU1FRHppOSt4WS8yc3NVODN0?=
 =?utf-8?B?T0huVkF5RmZNZElVYmp5WTFQQ0c1Uy93eTQxT1dkL090azB4d2I0WCtydkxO?=
 =?utf-8?B?SUxZWkpTbi8zWXVKYzRJRXdtN0RBTzI4OHpwZFREcmhDdXpuTWU5b0FLVitW?=
 =?utf-8?B?VUVRM1NQdEZ6cnJpbmgwVWk5ZDlyYjFndlRSczZoZVdqQ0JPMmlJMGpwSVps?=
 =?utf-8?B?Tkpubm0ycjJmYVNSdXJrS0MrNEhGcElnTU0vVE1NQWpsUnZvdTkwSitMQ1lB?=
 =?utf-8?B?VEFVekpmTUVVL1hNNHIwSk9FdlljVXFlSWJ3andlRVk1MUg2ZmRrVUtqZnc2?=
 =?utf-8?B?azBNbTNCdW1JVy9pdDJYR0p6RURjYkhQY01PSmxiNUJkeDdmc3l3NE01ZzNM?=
 =?utf-8?B?ZEg1Yi8wdk1ZajhUNGxXRklLOTVoNGhDeSs0N09NbzEwOWRIRVZhSnM4RUdD?=
 =?utf-8?B?cmorVmd3Q3crVFR6TEU3cUNzTzJERVZLQ0Jld3IwTWlPaEZkL29QNEh5YlF3?=
 =?utf-8?B?K1pjd1RJYmg3bjZCb285aGhkaFJFMXJudW5QOFc1NVZVQTI3YVV4NExSUHg4?=
 =?utf-8?B?Uzk5MjUrSnN0VTlaMG54cTRSVHFDQmpvTWtQR0wyS3RQTHYzYkw0cnNZZmdR?=
 =?utf-8?B?VzJFRml4Z0l4eFkrTHdId2prNFNrdHd4SWpVOXJzTGx3b1JydTdNd2dPMFdq?=
 =?utf-8?B?YWRNVUIvMEd6QXpvTXZGOU9PeENrTlYzTnVaTjVhNk9ndkdPcjBpTzQ2RW51?=
 =?utf-8?B?T3Nka3M5YjU2QjlvS0JUWHZuZHV3L2ZKNktkRGhOcTlsNUt1KyttUGNMU3lQ?=
 =?utf-8?B?RDY5dlF0SHlZYWN4aUZpM0V1ay9NZWY4dml3QkdnTUt2bXd1TzV1a25sWjBq?=
 =?utf-8?B?MFI1bmhIVlBOV25BdllycVgzNXpBaTg1T2tMK2oraVpIM3dJMjFqY1RKUE4r?=
 =?utf-8?B?UVBiWm9wR0ptbTR1OThvNHdPT1MvaWlQRHQ0Y1VBN0pvZ2kySFNPUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a54c2e6-6411-4704-7e26-08def3b01489
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:44:31.9337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjgGJRT9gNTUz+P4NGFC0jeIu0jVzzYfIetzpaTHYvtUwbpUXiUeoYN+Wrpqn4Y+TgzxcccLSOldilQqlhACvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5624

On Thu Aug 6, 2026 at 7:22 AM BST, Link Mauve wrote:
> This allows the user to read from and write to big-endian MMIO devices,
> such as those found on PowerPC systems.
>
> The implementation is pretty much a copy-paste of the RelaxedMmio type,
> with the business logic changed.
>
> This has been tested with various WIP drivers on the Nintendo Wii, and I
> thought it would be nicer to upstream it before those are completely
> ready, to get some review.

An alternative approach would be to have a generic wrapper `BigEndian<IO>` =
where
it performs byte-swapping in its `IoCapable` implementation. This is more
composable as it works for all I/O.

Of course, this means that it won't be using the specialized BE I/O impl, b=
ut
then the only architectures that have specialized ioread16be are PPC32 and
SPARC, so maybe it's a reasonable trade-off to make?

Best,
Gary

>
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> ---
>  rust/helpers/io.c | 34 ++++++++++++++++++
>  rust/kernel/io.rs | 88 +++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 120 insertions(+), 2 deletions(-)
>
> Changes since v1:
> - Link to v1:
>   https://lore.kernel.org/rust-for-linux/178598049138.1212746.24431515070=
74972963.b4-review@b4/T/
> - Fix copy/paste mistake in backend docstring (thank you Ethan Plant!)
> - Fix safety comment in macro documentation.
>
> diff --git a/rust/helpers/io.c b/rust/helpers/io.c
> index 7ed9a4f77f1b..3bbb86a00d67 100644
> --- a/rust/helpers/io.c
> +++ b/rust/helpers/io.c
> @@ -120,6 +120,40 @@ __rust_helper void rust_helper_writeq_relaxed(u64 va=
lue, void __iomem *addr)
>  }
>  #endif
> =20
> +__rust_helper u16 rust_helper_ioread16be(const void __iomem *addr)
> +{
> +	return ioread16be(addr);
> +}
> +
> +__rust_helper u32 rust_helper_ioread32be(const void __iomem *addr)
> +{
> +	return ioread32be(addr);
> +}
> +
> +#ifdef CONFIG_64BIT
> +__rust_helper u64 rust_helper_ioread64be(const void __iomem *addr)
> +{
> +	return ioread64be(addr);
> +}
> +#endif
> +
> +__rust_helper void rust_helper_iowrite16be(u16 value, void __iomem *addr=
)
> +{
> +	iowrite16be(value, addr);
> +}
> +
> +__rust_helper void rust_helper_iowrite32be(u32 value, void __iomem *addr=
)
> +{
> +	iowrite32be(value, addr);
> +}
> +
> +#ifdef CONFIG_64BIT
> +__rust_helper void rust_helper_iowrite64be(u64 value, void __iomem *addr=
)
> +{
> +	iowrite64be(value, addr);
> +}
> +#endif
> +
>  __rust_helper resource_size_t rust_helper_resource_size(struct resource =
*res)
>  {
>  	return resource_size(res);
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index a38c20ba3d23..ab8b7864298a 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -1194,14 +1194,14 @@ impl IoCapable<$ty> for $backend {
>              #[inline]
>              fn io_read(view: <$backend as IoBackend>::View<'_, $ty>) -> =
$ty {
>                  // SAFETY: `$backend::as_ptr(view)` is a valid pointer f=
or MMIO operations for both
> -                // `MmioBackend` and `RelaxedMmioBackend`.
> +                // `MmioBackend`, `RelaxedMmioBackend` and `BigEndianMmi=
oBackend`.
>                  unsafe { bindings::$read_fn($backend::as_ptr(view).cast_=
const().cast()) }
>              }
> =20
>              #[inline]
>              fn io_write(view: <$backend as IoBackend>::View<'_, $ty>, va=
lue: $ty) {
>                  // SAFETY: `$backend::as_ptr(view)` is a valid pointer f=
or MMIO operations for both
> -                // `MmioBackend` and `RelaxedMmioBackend`.
> +                // `MmioBackend`, `RelaxedMmioBackend` and `BigEndianMmi=
oBackend`.
>                  unsafe { bindings::$write_fn(value, $backend::as_ptr(vie=
w).cast()) }
>              }
>          }
> @@ -1751,3 +1751,87 @@ macro_rules! io_write {
>  }
>  #[doc(inline)]
>  pub use crate::io_write;
> +
> +/// [`Mmio`] wrapper using big-endian accessors.
> +///
> +/// This type provides an implementation of [`Io`] that uses big-endian =
I/O MMIO operands instead of
> +/// the regular little-endian ones.
> +///
> +/// See [`Mmio::big_endian`] for a usage example.
> +#[repr(transparent)]
> +pub struct BigEndianMmio<'a, T: ?Sized>(Mmio<'a, T>);
> +
> +impl<T: ?Sized> Copy for BigEndianMmio<'_, T> {}
> +impl<T: ?Sized> Clone for BigEndianMmio<'_, T> {
> +    #[inline]
> +    fn clone(&self) -> Self {
> +        *self
> +    }
> +}
> +
> +/// I/O Backend for memory-mapped I/O using big-endian accessors.
> +pub struct BigEndianMmioBackend;
> +
> +impl IoBackend for BigEndianMmioBackend {
> +    type View<'a, T: ?Sized + KnownSize> =3D BigEndianMmio<'a, T>;
> +
> +    #[inline]
> +    fn as_ptr<'a, T: ?Sized + KnownSize>(view: Self::View<'a, T>) -> *mu=
t T {
> +        MmioBackend::as_ptr(view.0)
> +    }
> +
> +    #[inline]
> +    unsafe fn project_view<'a, T: ?Sized + KnownSize, U: ?Sized + KnownS=
ize>(
> +        view: Self::View<'a, T>,
> +        ptr: *mut U,
> +    ) -> Self::View<'a, U> {
> +        // SAFETY: Per safety requirement.
> +        BigEndianMmio(unsafe { MmioBackend::project_view(view.0, ptr) })
> +    }
> +}
> +
> +impl<'a, T: ?Sized + KnownSize> IoBase<'a> for BigEndianMmio<'a, T> {
> +    type Backend =3D BigEndianMmioBackend;
> +    type Target =3D T;
> +
> +    #[inline]
> +    fn as_view(self) -> BigEndianMmio<'a, T> {
> +        self
> +    }
> +}
> +
> +impl<'a, T: ?Sized> Mmio<'a, T> {
> +    /// Returns a [`BigEndianMmio`] reference that performs big-endian I=
/O operations.
> +    ///
> +    /// Big-endian makes no change to 8-bit accesses, but will invert th=
e bytes of 16-, 32- and
> +    /// 64-bit accesses, to ensure numbers will be read in their correct=
 order.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{
> +    ///     Io,
> +    ///     Mmio,
> +    ///     Region,
> +    ///     BigEndianMmio,
> +    /// };
> +    ///
> +    /// fn do_io(io: Mmio<'_, Region<0x100>>) {
> +    ///     // The access is performed using `ioread32be` instead of `re=
adl`.
> +    ///     let v =3D io.big_endian().read32(0x10);
> +    /// }
> +    ///
> +    /// ```
> +    #[inline]
> +    pub fn big_endian(self) -> BigEndianMmio<'a, T> {
> +        BigEndianMmio(self)
> +    }
> +}
> +
> +// MMIO regions support 8, 16, and 32-bit accesses.
> +impl_mmio_io_capable!(BigEndianMmioBackend, u8, readb, writeb);
> +impl_mmio_io_capable!(BigEndianMmioBackend, u16, ioread16be, iowrite16be=
);
> +impl_mmio_io_capable!(BigEndianMmioBackend, u32, ioread32be, iowrite32be=
);
> +// MMIO regions on 64-bit systems also support 64-bit accesses.
> +#[cfg(CONFIG_64BIT)]
> +impl_mmio_io_capable!(BigEndianMmioBackend, u64, ioread64be, iowrite64be=
);
>
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba


