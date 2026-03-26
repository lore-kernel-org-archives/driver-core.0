Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020080.outbound.protection.outlook.com [52.101.196.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C17274FE3
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532279; cv=fail; b=Lj8Y+L3fLhmtwQcioT7PAL8fThIGUIyl3hab9vkpGSquHIGaY7v+zf2ZYMt5Y6EirZ00fI5R3iI/SgMuNT6pfNVQrjHYaggumenDn883xdf5mbnGCzIBEwHamqXviqCiLTwPQpkx5NfhBCKQifo0ePQaVmVenQ6vXA6794PQvU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532279; c=relaxed/simple;
	bh=K4oLT+x7P2Rn7vm4s0eb6MaHNJv0eKtdvjpn4dyJQOU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cdDjM3uudjXfrq9gtGnHrVBpBjUJRQQdxHg6vXCCCNZa3jzEmfimgk1VZOvnuQCk4TwOEctiHicr3x59prXAE7dEn4Voql5qkhiSgoghj50ktICZLXMcsfNbj/kMlhEg+ZSLdo8h0M1JO0nJhy3rMlTkxdIYzSe5oj0y2hpgwns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=v9lXt/3g; arc=fail smtp.client-ip=52.101.196.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="v9lXt/3g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCfyd/BABolF5hcSTthxlHNeesf1DetlmNsJlrZsbH1PdKP7cV0QUaaftG1oypZ5DwbwNbxcOlL0Dipk+yd/P3lGGg1gEL6p9OFspdB+aBwQBjVag2dU9Y6mgvx4vC2SCBm30lPYroTgnpU1U9sA57ZsLCVagMI0rK8XCpO6bWSgLs3ssBgGymHQ++huGXY6R+rnLbTxGMs4tM0gemOT1a3Dib/y9u8inxqjGBf0SdSKZXkJSv9s9FoxyYdUChwswR7yPkB9jKuV+WR2O3wnKFfb3jLk7KteqPYdehjBSJtDfbLRxWBGrvOmEmNDNVzm7f6b6M4/H6xy0HpT814Z/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNXcQv1dKLGjxQySkEhML8/0DInPCpelpAqC5mVBfgM=;
 b=QQnh0mrTnCaiquUigAKMlxvBCfs5tNt3vHCyUaUoB5TwGcC9ne7hA95fwsWqnbG77orgvVYcO+AKtg1bJtR2qCptpS6KNp74/3hOTMz0a8IhlfRj+g3aOgFPC8aWKgp5hOesMSHq+esMNWckMkJrywayeDG2SnWXMZXmGwQ8yRyMGfiAHt2iz+tefFZGFYtWC2pbar420hnovY5hplp/1hcHc8WHZkUjl8V714d9UPRsCMJoJeyUeHNu0/dBfyfODTvlA2DgobL4u8NigfKoXIf29lYtrVMe5m0z2fEVgH0Y3jUSa9n7tErVU5Fybwk7rVz+C578+8w0qTPchmjdkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNXcQv1dKLGjxQySkEhML8/0DInPCpelpAqC5mVBfgM=;
 b=v9lXt/3g4NGaMzNh/dmAJo7FsZivuJsesaG0FT/FuFFZMiTCJdN3ycxRuxSaS/xWltokKyXhfXhCDq+RXssmKVFWraiCZ5XwoOUzrKE7BaQCPHQycfYIBr31KReEe6ykvugUK3Ab4N3CeDWRSnNQVpg+rixmOVgy4Iva5FpiPDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7492.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 13:37:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 13:37:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 13:37:54 +0000
Message-Id: <DHCR6WNHWX7Q.1IY8CSTHS63JN@garyguo.net>
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: dma: add CoherentHandle for DMA allocations
 without kernel mapping
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260321172749.592387-1-dakr@kernel.org>
 <20260321172749.592387-2-dakr@kernel.org>
 <DHBAADML4BXP.131CD8C26BELH@garyguo.net>
 <DHBD2BO4R5BM.3OS7AHYN9A7DZ@kernel.org>
 <DHBVYVW7ZTDA.23N0Z3YOC5735@garyguo.net>
 <DHC18ZPBO3X4.1P6GJKSE0IMK8@kernel.org>
In-Reply-To: <DHC18ZPBO3X4.1P6GJKSE0IMK8@kernel.org>
X-ClientProxiedBy: LO4P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: e99735cf-5c3c-4053-069c-08de8b3ce26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AQn8Z57PkSJgdIIlLYlVl/AbNCy5+I1+hpFaNfW2wzIYw/lJpYlRYHtZfaWYL+2axoKTxpkWiXXwkfzriFIMD5M6q9UfdjVwl29aCNQwsxaQXJdxAmXnZPgEY2gjXyEhnPwpNJIAQf57RFrmXXAZefbD9TRkz+vCjI5fZpR4rr4XO72jpDHF0nLTzHVlk+HmFnxf9r2z5RIFxMAqOAY7qRwppC77gOCiOdZ6Re3c6jPfkFMfJlITycQ6dMw3pAxjGnYeR8WezsgGoRaX2zSILHHs7j/TnwbOlQ97xh7lYtiaDKw3FDnC5SNXnt3iYCW2me1AASkljdvEod0hs0vZTPWq9jybUJMvxn6eeOINKFKf6l7Fvl2PQVgEkJPJc0hsb4dMvwnzZtBgivTbSBu3k9Mc26u12QXDvbPrb2JZC6La5JqIGuxW01yCGCGr/QzcV+p/2r5UvMOdS2L86t2lAthnJu2A8tu9v4endceP7NbgClq49bG6PiCK2I/MGONLFLG1ozI8XhXS0TuEGl8So92FapXGHqomqzJf476rJ6C1+nZanMnMyRvfkl85s9Lkb4/CYDSsNz+ToqD6D4sjEo3zmxZEMirB7xVciMggY+NvSEl2Df44sWkbzkwItj9viAhWy2SsRUfDUkDbewVICUA3gjhrc9jZbDfEj/59O7Xg53MJnSN7JHxkg6Tig9LgIy7igK+GcMRxJXYKLeBWwHREPP3CssTFYXNcIVD9un8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wnc1Y0xEaVhkaGtMdnYzV2JYWVdwakN6ZnEzQzVwWUU3VTUvN3ZqRWJBaGhR?=
 =?utf-8?B?SkQzT1VXOFhQS0RQeHZoaFVKT1lySE43L0pZcTBxamJ2YTdlZnRVV3VhZmdD?=
 =?utf-8?B?VWU5dlFwMUdYazJaRGRlN2Y5cVFhNGwzdEhKMlNnZ1hySVdCb1A5TGtzbVpr?=
 =?utf-8?B?Q2hGNHljZzFtVXY0Uzd2UnU1YnFBSTlOTkw2a3FEUUVlMCtwaDk2M1pBOFhD?=
 =?utf-8?B?KzE3V1dFUEVHY01sR1dMMTF6RDk0NXdWYXdUSlpsZW4wVjlvR3V2WkVoTUZI?=
 =?utf-8?B?NVhjL3NmNjV3ZE5xKzZQcGtTVXdpSVJIcFBJTGR4OE9aRkpjN0o4VThOdGNl?=
 =?utf-8?B?cG92a29DWG1iV3NrK2YrTG9tWHpvbWdDdWxMUlJzbWtkS2xSMGdMa20yQjZT?=
 =?utf-8?B?QzhMU3NlOHpJMS9aZDFpMlpycGIrVkZZSGhoemUxU29HalpJdmxoVkMyVSsr?=
 =?utf-8?B?YUJlTnJmdTR6OFpUWlc4ZnFjK21nRy9JcVpWRUlESXEvTkdXbXV5aURVckJn?=
 =?utf-8?B?UEJBOTVkYkx1YkJrcnk2YzQyTVFWNUlBM3pkQVMzUmFiN2Y2dmxFenlPSEkv?=
 =?utf-8?B?Q2VJS05RY0UxaGZ1NkpIQVdXNXI4RjZhTmVJUEltMTExNzlDRTlDdFdYOENP?=
 =?utf-8?B?Q2dvYnJrVFlFOUwzL2pmcWdnZGkwQ281NFBjM1l4dWJ0eXl3VUFxdU5mMEgr?=
 =?utf-8?B?M0FnSHd1emVLdXZmdXJtcmlOclhLM0FCSUtDS0gzUm5OaHhpVlFPd2dPS0dR?=
 =?utf-8?B?cGg0VHBrZnhLU1JhTkQvL0srb2N6QjQyTHlBNGNTNHhRL1ZTMzI1RVBTc24z?=
 =?utf-8?B?WEZuYkFkeUE2cklPSlJHTDhtOHpENU00N0RkM3dPUWxLWi9mTzFHREY2cC9J?=
 =?utf-8?B?SXZ4UTFKbDhkQnZ6WnJwNk5jdmNqVzg1aDhiOFd3YzlHNVk1bnJ4Nm9TMXNX?=
 =?utf-8?B?dVN2TjBDU0ZmQmxxMms1V1VYa3lSdm8yaDNDakpPY3ZZYW5FbWtEaWVmRHFK?=
 =?utf-8?B?YkVYandpd3dyUVRGeCtuaTc5Y0NJM1ZxM2hDTUhwd1ZlS0J2WnM3TkwyUExx?=
 =?utf-8?B?V09oSXlJT0U3T1NyeXdENDg3a0l3Q0VaeWpTdTVwaVVZOWxLZ1hPclNWYkY5?=
 =?utf-8?B?eEc2a0VnTWN1ZUJmdkNTMXBUTUZ4dDJWQ05LYWdGa2Q4Q0tybVF1Uk9VZDh1?=
 =?utf-8?B?RkNZTUhQMmk2OFIwcVRReVVlaVJPT2I5cEJqK1hvOHBTclZSSlJpQ0dxL2Iz?=
 =?utf-8?B?RWhoNFBGM1NjL245WTJzOFpZODFiZnNON005SmxBNXQvdXNPTy84TjFVUlZZ?=
 =?utf-8?B?SitPYVdqVDQrZGkvcWdqVzhORGdja2thQ2kySlE2N2ZaNHhVNlFESHZ5ZExS?=
 =?utf-8?B?Mi9Hc2NaNkpTS01pN09hQVRmTlBUME9RMkZNdnJFaCt5TWJxR3lkS21ocmRY?=
 =?utf-8?B?emRLSm9ITTIwQjRXRjlIWkwrbDZJd1k4cGZsbWtOWDV2V1doUzZoamMrZmkx?=
 =?utf-8?B?ZUNTaWVWQTJhbEltNHhYdVlQTjJtTFVrZ3ZEc1lScXBYU3RUTENMZjU3d1lx?=
 =?utf-8?B?WHRHdk01dlJJT09qb3BEZzZTRVRLYlIxV0VFMW8zekhLNEpqRUtHbFNLaW9i?=
 =?utf-8?B?TzNTMmQyaG1ublY2NHJ5Q242eWp2NjR2Mjl5TW9BdDhyZi9pRXc0RUZIeC9j?=
 =?utf-8?B?WUVzWXNGeC9kd0Z3YVpqVWFZR2FabHNEWVc0dXRMQVBpVlpQTGZpMGhUQkU1?=
 =?utf-8?B?aitFbm1iRng4N2x4VkJqRHVKenNSdE8zSEowOGpkdVpSS1RDVkUvTFhLdHFU?=
 =?utf-8?B?WFR6YVlsclYxTVNWeG9sbUttK0hFN1RmRHJuSTRtUFlSeWlva052bXlOU0dP?=
 =?utf-8?B?Q1p2cXJmWkF0YTJ0eWloUEptZUJEbWVZSzBUUmJoQ3d0Q0o5SFVGWitFZm5G?=
 =?utf-8?B?QzdBQjdoSFIrVGxyU01HT3ZkUm4xNEpsaW1XU1JWcVpiUEV0Qm53Ungva3dj?=
 =?utf-8?B?emE0Mkpzay85c0V6Uit5UXhaK00wM0x0VjROOWF3L3lremRFQmU5OGs0Lzhm?=
 =?utf-8?B?a0lFSFlZb2lNV3A0WEtPclkxejhhc1RhdXNIS1VuL05oQVNBWTY0aGVSenlv?=
 =?utf-8?B?WW9ONno0c1FuOXNSTDN0MzhvcWpHZFhoRlNDbHdlYTF0SnU3b3gxQXRXYzFv?=
 =?utf-8?B?WFR6L09GT3kvY1ZpeDVPT3V4bEwyWmh3SEI3eXlYckNSMk14L3M0QVI1cTFo?=
 =?utf-8?B?ajVhWDZjTkY5RE8veHFRVnNUWWNsUUtGQVUrazNGVnNwK0dBUnBHRnJuM1Ax?=
 =?utf-8?B?Ukg5VmFwWVdhV21TM29Eak5FSCtWc2MxZjNGRk9IQmF4ZzZZT2plZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e99735cf-5c3c-4053-069c-08de8b3ce26a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 13:37:54.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsVu+KdvsAb1DhD4lCQ+XB9EC/n2xeUXqV6oHNyWmHbzUpgSeqfciZDBKI5yjVtbkb25hnsOIs5m9QBal7rtUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7492

On Wed Mar 25, 2026 at 5:18 PM GMT, Danilo Krummrich wrote:
> On Wed Mar 25, 2026 at 2:09 PM CET, Gary Guo wrote:
>> This only gives you fixed size, though. If you want the same type that s=
upports
>> both a fixed size and dynamic size, then a generic that is either array/=
slice is
>> the way to go.
>
> [...]
>
>> You still can use `io_project!(handle, [start..end]?)` to do the bounds
>> checking. But as you said, the benefit might be minimal.
>
> I think we shouldn't overengineer this for now, and wait for actual use-c=
ases
> that require any of that.
>
> The only thing we need right now in practice is an API that takes the siz=
e and
> returns a handle to the buffer of this size exposing the DMA address that=
 is
> subsequently passed to the device without further modification.
>
> So, if we want to re-use dma::Coherent<T>, we can just do this
>
> 	pub struct CoherentHandle(Coherent<[u8]>);
> =09
> 	impl CoherentHandle {
> 	    pub fn alloc_with_attrs(
> 	        dev: &device::Device<Bound>,
> 	        size: usize,
> 	        gfp_flags: kernel::alloc::Flags,
> 	        dma_attrs: Attrs,
> 	    ) -> Result<Self> {
> 	        let dma_attrs =3D dma_attrs | Attrs(bindings::DMA_ATTR_NO_KERNEL=
_MAPPING);
> 	        Coherent::<u8>::alloc_slice_with_attrs(dev, size, gfp_flags, dma=
_attrs).map(Self)
> 	    }
> =09
> 	    #[inline]
> 	    pub fn alloc(
> 	        dev: &device::Device<Bound>,
> 	        size: usize,
> 	        gfp_flags: kernel::alloc::Flags,
> 	    ) -> Result<Self> {
> 	        Self::alloc_with_attrs(dev, size, gfp_flags, Attrs(0))
> 	    }
> =09
> 	    #[inline]
> 	    pub fn dma_handle(&self) -> DmaAddress {
> 	        self.0.dma_handle()
> 	    }
> =09
> 	    #[inline]
> 	    pub fn size(&self) -> usize {
> 	        self.0.size()
> 	    }
> 	}
>
> and add a guarantee that Coherent::alloc_with_attrs() and Coherent::drop(=
) never
> touch the cpu_ptr.

Hmm, it sounds like we *could* actually have `Coherent` support `Drop` type=
s and
have `drop()` run the destructor for it. We don't need to for `FromBytes +
AsBytes`, but I think we'd better not have that as a guarantee.

So the original approach that you have is better.

Best,
Gary
