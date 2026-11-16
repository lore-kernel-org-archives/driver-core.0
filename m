Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833016;
	b=ZgEUJsg9iIADi5YtW+HS9F93iBm4bO0IxjdmxoDv1SAfX4Au4oQnhuhf0cw7eu3GDmQK
	 vk2fNPxKbVQxHwlaWR1u+RDMVlJWxppeivIqcRJJMSyyidVdvCSuWxd0DrCzro+gBQCHA
	 2F0p4wuHAGO8phNkLum/Ao0l+ewwDlsUEWsn5MeA/n14rCsl7OFTs5IjsKa6aMyIEg0Az
	 MlkOLP4QK8BByGz1aDVYpPBnyNEcOkdX2sITmYcDW+lPvTMr2NY56XwAMGR4eto9whQUI
	 E3hnYxZXD/i4ODKCKk18PRBK5FhK6LP2XKUZs0tlE679gWnpk8Z8AjmoBE/mg57lLIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833016;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To;
	bh=CXw4JlwiXiBhfP+REkN7yHwsbglu9GFDUemcCMcjoyM=;
	b=rJygzSP4u59Dj0BAwg/iRC53NNyd3giRBf5YgG6AtbLakVqAj6JjWl0Yb39tD1xWIcXx
	 TNHFKsxQ2NwhmFX/yVv3lKJYLdZvBEngfmwN9WlHxuputYFIeaztzShaHmy1zZpW1Pniu
	 AmSgzNzJ1qFreCVoDRREdVKBz+aD7N8sDcq4PfQGHLQl3Uw6/WVA6pRMhLnzKNFCsgldg
	 SipDuboYEQE61izMIvMck5Ncf7nk2+317Wx7hwOODyjxMvJQRSMursZM4q0TjuIV47Atw
	 pEZOQWc/03OTCcxCgRiVfyX04X36SWpaSpS9w+gt807biQpvFygkVODrUADP90MlAmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ophYpZLf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CD9606A32C;
	Mon, 16 Nov 2026 12:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ophYpZLf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84781F000C4;
	Mon, 16 Nov 2026 12:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833016;
	bh=CXw4JlwiXiBhfP+REkN7yHwsbglu9GFDUemcCMcjoyM=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=ophYpZLfEeJvZlyuCYfZQfdTYYsdpI8fR6sP3Tve7NtPhGSNkll+L3vUBsawnzHZK
	 tgqRZdtsdeyiesEA2ZzPZB65M1ecVQ7kkIXgSEeoZGEvfcd7M8KVIUThCyAuMAqKJP
	 D24o8ubU7QD9JSn3GLyCbxDyBgNeol2ayOI+Ux3kJA28Wj/MSsRtKvXsbj5CsHS+k+
	 pycZ86HNuYgM2sC1qAItD/vL1oaoobi2HtgHkaGW6d2x0VpwMPFvtNDg8JZfy6HABW
	 scy6jgCf2Ckujy4m/DVo2UZOgYwis6praWLL4Osj8ZBRoUd1t6DkHcirUWZ5nkNZDo
	 +HKIJrcojIMJg==
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 13:43:31 +0100
Message-Id: <DMWN7AJF6SXX.1HN3UMDROET7F@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] rust: scatterlist: tie owned tables to the device's
 bound lifetime
Cc: <aliceryhl@google.com>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <tmgross@umich.edu>, <tamird@kernel.org>, <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
References: <20261114234324.82387-1-dakr@kernel.org>
 <DMWC45NN5L9I.2NUG81ETBC84L@nvidia.com>
In-Reply-To: <DMWC45NN5L9I.2NUG81ETBC84L@nvidia.com>

On Mon Nov 16, 2026 at 5:02 AM CET, Alexandre Courbot wrote:
>> @@ -81,7 +78,7 @@ pub(crate) fn new(
>>                      let mut level0 =3D CoherentBox::<'_, [u64]>::zeroed=
_slice(
>>                          dev,
>>                          GSP_PAGE_SIZE / size_of::<u64>(),
>> -                        GFP_KERNEL
>> +                        GFP_KERNEL,
>
> Stray hunk? Maybe we can move it to patch 2 since it reformats that part
> anyway.

I noticed this before sending too, but for some odd reason rustfmt insists =
on
this with this change.

When I noticed I was 'whatever', but now I got curious. It happens when

	level2 <- {
	    build_lvl(&data)
	        .map(|l2| SGTable::new(dev, l2, DataDirection::ToDevice, GFP_KERNE=
L))?
	},
=09
is changed to

	level2: {
	    let l2 =3D build_lvl(data)?;
	    SGTable::new(dev, l2, DataDirection::ToDevice, GFP_KERNEL)?
	},
=09

>> @@ -308,38 +283,27 @@ fn drop(&mut self) {
>>  ///
>>  /// - The backing memory pages.
>>  /// - The `struct sg_table` allocation (`sgt`).
>
> `sgt` is removed by this patch.

Good catch, I will remove this and the other one.

> <...>
>> diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
>> index ffb693544673..844e137cddc8 100644
>> --- a/samples/rust/rust_dma.rs
>> +++ b/samples/rust/rust_dma.rs
>> @@ -35,8 +35,7 @@
>>  struct DmaSampleData<'bound> {
>>      pdev: &'bound pci::Device<Bound>,
>>      ca: Coherent<'bound, [MyStruct]>,
>> -    #[pin]
>> -    sgt: SGTable<Owned<VVec<u8>>>,
>> +    sgt: SGTable<Owned<'bound, VVec<u8>>>,
>
> Since there is no more `pin` in `DmaSampleData`, can we also remove its
> `pinned_drop` attribute?

Yes, I left it as is intentionally though as this patch is purely a mechani=
cal
conversion. I can send another one, analogous to the nova-core one.
