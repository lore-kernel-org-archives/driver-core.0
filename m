Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021116.outbound.protection.outlook.com [52.101.95.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC30D3C140D
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 16:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284945; cv=fail; b=ijPGEzciA4wmPczZIwOz8FoKSKhNS88e6eIQhDDMq3XT1r5P4NT4JaU840Hw9I8i0cu1QMZYLU2QzHkXtx4uyM8D3/xBIvS+XlaHOgdJtNUXjGBpDw2WColiO7qCEUD97qXrks1AAbUAeGwUEzug9pZ2ObPBhIDVv/l3Vk2iciA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284945; c=relaxed/simple;
	bh=zuOAZHnuo6vrlGMOn/ZiftXu9OED/O2tJTopg77ZEnU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bZ9zrQX7KLh4IbzrBekeYziGZQlvJX07t1Kq7JNCcSStCKheyqgP55pP6Ui6ls4R2T/Fae7WgVTlB/vTUOlLQpBSuNqjEN14cESDTGKqXFN23/Eh1gyLynlLKzGwedFyJAEOtq6R/ux083H6nyz22K7zb3ITJl1FmWWM6uv4BSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=O1eYdmL1; arc=fail smtp.client-ip=52.101.95.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="O1eYdmL1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIxloLVWU92hy6Hoq1oQkhtVHU01bbUjXDiMGiyypGV7MJFydwyaYlmI1tT+y5cygoX60g3cJBJXvgL/4+CDL2CfQdLAsMi2y6xjhKQLiPQQSiarYSdNzSfeBSgvrTF2SDKMU9AEj9IagVmUG9wh7gFQPRjg3jdF/Y6V/bHMo2/bWDEQC1KXz4MSwZUQ6JqSQBJ592xMndXDtBusoUPE/lxySdj40UHp3Bi5WrZagODPn8/c7E3mvIOllI20e5hckcGfXk/bN/9LiazUAXpQ5JWyxHB3LsVSHMYCwz+Xg5WATdS1Tpl2KFqKzli4SLVUAh/DIBCUTm5azdRcEPDwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRr3A3gW0NnxUfTEW3RBa1/A6YHH6/Q82jk3zyY2G10=;
 b=bdt2Xin8iYc8HgLubR6QgjRh1jTW6oofLqEL7YyNV482qYJX+Po6DjLNlkX1JR9SGfjIx0O7Mq6GtfnuijnMlMLL4SJjcR2e9qIr8BE1HFFL8e+GynlCH114GIkZ/UK5wqJNZRJKFUAnl9OBEcCNaLTYMi144+9+y8I7kNAnLW1cjksWYh5iCTdyuISv2lnttx/2lqWcGeomY4WWKOmgTeRDg0gPX5u3FZ7+bU+vZFWms+rjDd25W8qfD8+fdUchx/6gqLotJmpAFIhIvqUK5tr6HQpcTeUYK4ompHbMpoM1oGiq9l/zrCJUvJWCBbnqPPZssSw3O1cCuWzV8QJ80A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRr3A3gW0NnxUfTEW3RBa1/A6YHH6/Q82jk3zyY2G10=;
 b=O1eYdmL1diz8KBTOFbU4mnjgy4B3V1hE0dVSyYEeKo8MZCoQEIBeVcJ/yET8LAs1G/khZI+DcUZbIhm+dg62RNrk6dsrs2eKZPi9F3Jq59yZnSVZHWgqI5zavtD1YZ+S5sp9T8tHjUuDzeP6D77S4BMlevxVkP9AQx7sPt/m63M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5475.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 16:55:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 16:55:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 16:55:37 +0000
Message-Id: <DHABINRM1861.3HQ3J4IZ150F4@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] rust: dma: add from-slice constructors for Coherent
 and CoherentBox
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-1-5cf18a75ff64@nvidia.com>
In-Reply-To: <20260321-b4-nova-dma-removal-v1-1-5cf18a75ff64@nvidia.com>
X-ClientProxiedBy: LO4P123CA0531.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: f86ae5f1-1cba-4648-e3e3-08de88fd0249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|921020|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BKyyxxX8/SGd59GDro+rImp++N+UVCVafPGmi4hhLesYDRl4hdzaAz7VAG5/0pBMEB7ncIl8BJvgtPoM8es6iUE4qXgCq4Pr7kveAz/F/Qpo7x/K1LLMLMLwabvOrBy3TqFZzuKyGn8uepXz8R/8X9OyowkVwfAaihu1WLM15Oe37ssuinaGleEb+2zNUrA6sD0i4N5utyC4dgYlNrOAA0Tzg2CTGl3X7Up0G0AzLiyfEtI0efW5s4LZUuByVf9bAQ2lJ+3XCb7xRp9fzPl9UuiQjvOnhpmnA0Hs8FYgj52pNoUhr5HnF+1apsXSS0tiimxzUUFJUDnU3mCfdPbdU5cbqUqePKAsGDctSxa6yEwv6//1c7Ccr0OMq7TpQw3kg1dhCKKdTMW7ATwkFAmMSNNZMwsTAtVFvXrL1Oph2Xqb2LH2SYHBoteSlqxPVuiCnL27TsJZOICqg7TF0MuV5Bj92PlO3owN9tyO3hxcJhGPWB2caqoEiViUm6XxTygPJpbgdy/wUMGrNPJEM6JuPgg341DFCsn6M7KROe5gVF7HVsrzyifnm+s8I/xmDERw49/CtHR+Wm9PhNDuy8mNzj5G/GgQLtUaUs8FnLeBsMTt8qHHBXApQqUFUAHTu8mCxcHhywVRxn4Mg25Vglgz4+lCoskuY62N2XRJbfGWdWF5xxnl6BUuZt4OBAzcssafdM6fQzhidbC9Aokpd+CGpI39zOEesSX5NEMNaYpZyFDZJ52d5K71QbxkzOvkfSjBWrDRChXaKQAASaxYeXNgyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(921020)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjF6dTNHWXlsbDJVYXhGUTBJSnJhUzJBK2xCSGNQN3JwU3IxQnlmZUF3ZlQ0?=
 =?utf-8?B?d2Zpa0E3STRkaDBKUWRucmIyOGRWRDNWZlhFZElLMllQbFJTeDlJOXZOL1NZ?=
 =?utf-8?B?THBoUjN0di9JZWNLOWhxY08vTVVndXo1SUpsMzkyM1FYdnFoMlZpTDJyR0Ns?=
 =?utf-8?B?WThRZFBqRW5EbUlTK3daNjdCRlRkOERoS1JCWG9seWxKQmxQY1Y5S2tZUUoz?=
 =?utf-8?B?b2hhTmlyR0l4NDUyb0RsZkNpWE11U1Z5VzJiQlNJSTJEWHl3YjQ0WDNqbk1G?=
 =?utf-8?B?cndiNUdmMjZpWEtZVkY0YXZCa3RPT2tqaEljbHNKMHRGdnNTbmxvaWp3bVZy?=
 =?utf-8?B?dU92eUsvTGs3TWljUGROTm56Mzgra0swRTQzZ0JuV3ZpZzZ0Z0l0QTRIZEdL?=
 =?utf-8?B?TjBNVzkxVGQrcHhBbHZYaDJqZkZhRXZRZWljenJDd1U5cHRZVmRlRW9wcG9S?=
 =?utf-8?B?UHJrZGIvM3NLVEZPM2xSb3ZxNS9DdWZCaGluS1Z2cnRUN21MTEVyOVgwakxN?=
 =?utf-8?B?N2NqWUNJZUpoeGw3TUxKeW5LY3J4WGpBcnQzVEZzQ0M4a3Y4aHFpcE9MTHlq?=
 =?utf-8?B?UlRCUjhIL2RVbi9IZmY2U2VLOGxmbXBzdWFvMGpxVE1PdHI5b2VZMldoWkV0?=
 =?utf-8?B?TG4wR3NDSU9UcFh1eldEUVp4Z3NUWlFNcGFFajY1NFR2RWJyeGdDVE1PL0l4?=
 =?utf-8?B?ZEZqVnhpMFp3emZ3UW1mYzkvY08xaHZIaUoyb3VjY256NDJGK05XdkdDajhM?=
 =?utf-8?B?WlN6L25nRHpCNi9SRUkycVBENHhWSEtBMm9EUTdpZGdQcjRBN3g0T0JQaGxp?=
 =?utf-8?B?VENDLy96ZmZnMk1uSTV2NW5oSmIvZ29BMXh3ZE5ITW1pWWRCTS9jUVlEdTkw?=
 =?utf-8?B?NDV1R2laWmxTNytFVUhQNDlWcXM1VmpMWkJOWThVaitMVzdOVDBraUwwVEVR?=
 =?utf-8?B?WGllVFYrdzFhbUt6NlZzV3ZidFBkbmRBVEhIakgwMW9jcUxBSm53R1VQSlFa?=
 =?utf-8?B?NUVaZjVMS2xtK1hZUkRHWnFCT2tMSUdNaksreXZLZXZJNWVwTjllZHVPY1ds?=
 =?utf-8?B?OTRERmJvNWFmUG5odWI5VFZ0U1hvNExVcGphS1hHQll3N0FKNm9TYzhka2pa?=
 =?utf-8?B?aDRwYjN1MktCZm9KVkZJdFlGRXBjZERDemdTUjlmaUZzL1NxM2tFSVZDTUxy?=
 =?utf-8?B?S1NZZzNVVHgvZVdlTTZEbmFGeFhaNElRZ3U5MEZVK1NaVkNmRXVLUGMyeEpT?=
 =?utf-8?B?SHprbTFNbDYvNGNCeXNHNEgySHZIbFlpVmxJL1JoTnhmL2pDMWZsSUlISXBU?=
 =?utf-8?B?NHVXa1lPUTBvdUhFdHVuWUhXeElXUkFGLzNjUGNRd0lLTDhXSUs2VFpxNUxS?=
 =?utf-8?B?WFJ3RjNmdCtGVTBVTkVEMWVNLzZhcWNvd2JhYm14VzdydVA4eHFPdWpETVFC?=
 =?utf-8?B?K09iQmxjaExWSXNMU3VZblU2bWlTRHFqZUxiZHY1Y2x3ZzZ1REtMT0trWUZk?=
 =?utf-8?B?L3BWTGQxa3V6RWNueWRlSFRlWG5yRFNlT2tmNnFpQnNOK24zRFNaSUU3V1JP?=
 =?utf-8?B?b2hId1REKysrbFJoa1dRYWd5WlJSYmhMU2U0NXdHUjdKTTluRVA2L1E4Tmox?=
 =?utf-8?B?cFcvUnRvZ3h2NGl6MGJzQ1BZV0UwOUp5N2Yzb3FjSjd3RHdxdHVmejNkdzVZ?=
 =?utf-8?B?ajU2YmFnbEN4NnJXT2dlU1hpcVpDbURkYmpWaTVvb1p4d3o4WExPYWo2dVVP?=
 =?utf-8?B?RjJoK25uOEJobTZhdjRONmhxdW5FUkFHN25HZ0NnRG5CdDVNMkNFbk5IMDQ1?=
 =?utf-8?B?Nm1lVW9MWGdrKzlSMzMvZm1pVVkxem12c1dtZlBnekVaRkR3aitDSGpzdGo2?=
 =?utf-8?B?MWk2QnQ3QTU5K2RRdm9EQUlvdnBmcTNsU2ZFOG83YnpNSlo1a3Voakw4enA2?=
 =?utf-8?B?SFZ4RmlKdTQ3dEY1YmlkVG1wMDFFVkRqL2ttbStJZ2RPU3k4cGp0d2xndlQz?=
 =?utf-8?B?ZUQvSXRYbFQzemsyZFV4V1hLaGtzVEQ4dTJCL1FWSVd2dTlZSU4wdnRkdk5Y?=
 =?utf-8?B?Z1M1cmQxYWJjZGV4ODNPVEQzTkUreTJhWllLNDFrbjM4S2tQeTlWNEhXTHUv?=
 =?utf-8?B?QVVMLzhGbVdTUUtkYUdZQks0Yy9xbkl5YmlIbTgyRkg2VUtYVm9pTHV1Tk9y?=
 =?utf-8?B?ZHVaek9ub3RJa2JjVXdPL0dSMWN6dXBRMW5RcGVrbXpsNCtvOU12TjYzRDBF?=
 =?utf-8?B?M1hLWWQrTmxqS2RHeTNHajZYVDhmMzI0MXRuL1VLQktwcFpBVGtKYk9Ja3V1?=
 =?utf-8?B?V0grKzBPVHpLS2RHL0w2V0RCQklhcWpCemZ1cWlka2lBL1MxeTR4dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f86ae5f1-1cba-4648-e3e3-08de88fd0249
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 16:55:38.0634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +deA3FsELlayLoNDHTF1q1Qxp+k1NsE3k7KUgILt5gmLrIGAv6rKj17hwFh1FngQF6n6tYHuxeCCecw+MuV81Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5475

On Sat Mar 21, 2026 at 1:36 PM GMT, Alexandre Courbot wrote:
> A very common pattern is to create a block of coherent memory with the
> content of an already-existing slice of bytes (e.g. a loaded firmware
> blob).
>
> `CoherentBox` makes this easier, but still implies a potentially
> panicking operation with `copy_from_slice` that requires a `PANIC`
> comment.
>
> Add `from_slice_with_attrs` and `from_slice` methods to both `Coherent`
> and `CoherentBox` to turn this into a trivial one-step operation.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/dma.rs | 102 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 102 insertions(+)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 6d2bec52806b..a5cc993c919e 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -453,6 +453,62 @@ pub fn init_at<E>(&mut self, i: usize, init: impl In=
it<T, E>) -> Result
> =20
>          Ok(())
>      }
> +
> +    /// Allocates a region of coherent memory of the same size as `data`=
 and initializes it with a
> +    /// copy of its contents.
> +    ///
> +    /// This is the [`CoherentBox`] variant of [`Coherent::from_slice_wi=
th_attrs`].
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use core::ops::Deref;
> +    ///
> +    /// # use kernel::device::{Bound, Device};
> +    /// use kernel::dma::{
> +    ///     attrs::*,
> +    ///     CoherentBox
> +    /// };
> +    ///
> +    /// # fn test(dev: &Device<Bound>) -> Result {
> +    /// let data =3D [0u8, 1u8, 2u8, 3u8];
> +    /// let c: CoherentBox<[u8]> =3D
> +    ///     CoherentBox::from_slice_with_attrs(dev, &data, GFP_KERNEL, D=
MA_ATTR_NO_WARN)?;
> +    ///
> +    /// assert_eq!(c.deref(), &data);
> +    /// # Ok::<(), Error>(()) }
> +    /// ```
> +    pub fn from_slice_with_attrs(
> +        dev: &device::Device<Bound>,
> +        data: &[T],
> +        gfp_flags: kernel::alloc::Flags,
> +        dma_attrs: Attrs,
> +    ) -> Result<Self>
> +    where
> +        T: Copy,
> +    {
> +        Coherent::<T>::alloc_slice_with_attrs(dev, data.len(), gfp_flags=
, dma_attrs)
> +            .map(Self)

I'd rather just use `?` and not use map.

> +            .map(|mut slice| {
> +                // PANIC: `slice` was created with length `data.len()`.
> +                slice.copy_from_slice(data);
> +                slice
> +            })
> +    }
> +
> +    /// Performs the same functionality as [`CoherentBox::from_slice_wit=
h_attrs`], except the
> +    /// `dma_attrs` is 0 by default.
> +    #[inline]
> +    pub fn from_slice(
> +        dev: &device::Device<Bound>,
> +        data: &[T],
> +        gfp_flags: kernel::alloc::Flags,
> +    ) -> Result<Self>
> +    where
> +        T: Copy,
> +    {
> +        Self::from_slice_with_attrs(dev, data, gfp_flags, Attrs(0))
> +    }
>  }
> =20
>  impl<T: AsBytes + FromBytes> CoherentBox<T> {
> @@ -827,6 +883,52 @@ pub fn zeroed_slice(
>      ) -> Result<Coherent<[T]>> {
>          Self::zeroed_slice_with_attrs(dev, len, gfp_flags, Attrs(0))
>      }
> +
> +    /// Allocates a region of coherent memory of the same size as `data`=
 and initializes it with a
> +    /// copy of its contents.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::device::{Bound, Device};
> +    /// use kernel::dma::{
> +    ///     attrs::*,
> +    ///     Coherent
> +    /// };
> +    ///
> +    /// # fn test(dev: &Device<Bound>) -> Result {
> +    /// let data =3D [0u8, 1u8, 2u8, 3u8];
> +    /// // `c` has the same content as `data`.
> +    /// let c: Coherent<[u8]> =3D
> +    ///     Coherent::from_slice_with_attrs(dev, &data, GFP_KERNEL, DMA_=
ATTR_NO_WARN)?;
> +    ///
> +    /// # Ok::<(), Error>(()) }
> +    /// ```
> +    pub fn from_slice_with_attrs(
> +        dev: &device::Device<Bound>,
> +        data: &[T],
> +        gfp_flags: kernel::alloc::Flags,
> +        dma_attrs: Attrs,
> +    ) -> Result<Coherent<[T]>>
> +    where
> +        T: Copy,
> +    {
> +        CoherentBox::from_slice_with_attrs(dev, data, gfp_flags, dma_att=
rs).map(Into::into)

This function can be inline as it's just wrapping another.

Best,
Gary

> +    }
> +
> +    /// Performs the same functionality as [`Coherent::from_slice_with_a=
ttrs`], except the
> +    /// `dma_attrs` is 0 by default.
> +    #[inline]
> +    pub fn from_slice(
> +        dev: &device::Device<Bound>,
> +        data: &[T],
> +        gfp_flags: kernel::alloc::Flags,
> +    ) -> Result<Coherent<[T]>>
> +    where
> +        T: Copy,
> +    {
> +        Self::from_slice_with_attrs(dev, data, gfp_flags, Attrs(0))
> +    }
>  }
> =20
>  impl<T> Coherent<[T]> {

