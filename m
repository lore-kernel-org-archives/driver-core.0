Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09845339365;
	Wed, 12 Aug 2026 22:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786573973; cv=none; b=Udc9iUfMDTIUL846Efk7b+WPRv6fPFEvr4DoUpJX0r1fx9qMqtIv5j2KEi/cyc4CCK4a+bbiF9szF14Mr1DCd2p4UpAFMaQFrixesP1Zyyl95BAOtIkJNp+We7VZdQAsJdrarhjlVxW82PvGW3Q41H1yEknNLr8JA3XdwfMP79M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786573973; c=relaxed/simple;
	bh=6BeS81DWL6o8u3TAJVI1R5uPB8t2fBRrKP3xI6O1tBU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=SFiodya0nHF5TfzfKam7TnFaYB+0ZaYA+6F78nGvedZr4SnGurHVbqylp9uOTVqIflyt/7JXKX9V8/axYgIAer3CWhyPTHetoHqXuTvyGlBcAQ9zLEJiC+3UfKtea2zKeeLsYzsfE3s18fMvvuu8Q1pCHNljG44uDay8u536fxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZyL++4B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZyL++4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7461F000E9;
	Wed, 12 Aug 2026 22:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786573971;
	bh=8r5wf+1EdOu9kDZSeKuRUzd6DU8YYx8iwDviFqjhf3w=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=cZyL++4BmFmoo9BIgo8g3pYbTdpvjKtLU46K+doWAdWyQ+ABhkt23ZDudjHO5RtyR
	 ZarOQLDtGP/B0WDAIE0SVLWw50HTB/yJHcBYbIUAKU3+awH3DeKveuyLhKSMz4fBTP
	 4VxEVl3pCR6JLAzBNZA7b/y/5cWqnsHDOgApmd6MDamKw28/LNP2IHuKKWiXHzxGET
	 BSXbE+aWud+vt0Uy7W99wvRsN3lqE6fpsKQ25D3vnMSTrA/HnxoVdj9pvoxCGtQrxX
	 mSzIyw+UeqfRWJxqm0fsbCIpB/XmgKQJCXLwuAWLr4OpKqBjChKAms8D1RcLMaN//H
	 UGSKLCo5/h34g==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 00:32:45 +0200
Message-Id: <DKNBM5C0CWIL.1Y659FEPPM2G0@kernel.org>
Subject: Re: [PATCH v2 2/3] rust: dma: rename dma_handle to dma_address
Cc: "Robin Murphy" <robin.murphy@arm.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260805-falcon-dma-projections-v2-0-4cc9f3f13ee9@nvidia.com>
 <20260805-falcon-dma-projections-v2-2-4cc9f3f13ee9@nvidia.com>
 <3a87960b-8a20-4947-a8b5-d5197174317c@arm.com>
 <DKHATVF1WAE7.NGVXJQD12XQ@kernel.org>
 <DKIQEJX6H5A0.1D3POLLNZB9YS@garyguo.net>
In-Reply-To: <DKIQEJX6H5A0.1D3POLLNZB9YS@garyguo.net>

On Fri Aug 7, 2026 at 3:04 PM CEST, Gary Guo wrote:
> On Wed Aug 5, 2026 at 9:39 PM BST, Danilo Krummrich wrote:
>> On Wed Aug 5, 2026 at 1:32 PM CEST, Robin Murphy wrote:
>>> To be fair, that is sort of the intent in the C API as well, to be clea=
r=20
>>> that DMA addresses must not simply be treated as physical addresses, an=
d=20
>>> aren't necessarily address-like in general e.g. comparing two=20
>>> dma_handles is pretty meaningless, since they could have different=20
>>> values but still refer to the same underlying memory, or vice-versa.=20
>>> Adding or subtracting offsets within the bounds of the original=20
>>> allocation/mapping size is pretty much the only arithmetic that _is_ va=
lid.
>>
>> Yes, I did suggest a dma::Range type [1] for this purpose, such that onl=
y this
>> kind arithmetic is possible to do.
>>
>> The dma::Range type should have a method returning its embedded raw valu=
e which
>> then can be used to program registers etc.
>>
>> This patch is only an intermediate step, that clarifies that intent of t=
he
>> current usage of dma_handle() (or now dma_address()), which is not to se=
rve as a
>> handle.
>
> I suppose with I/O projections now it's rarer that people need to operate=
 on dma
> address directly? What do you envison as the use case for `dma::Range`?
>
> Also, I suppose we can also represent dma address ranges as `Io` views th=
at does
> not implement any accessor methods, so projection still works on them.

Yes, that covers most cases. What about SGEntry cases and CoherentHandle?

For instance, in nova-core we currently have

	for sg_entry in sg_table.iter() {
	    let num_pages =3D usize::from_safe_cast(sg_entry.dma_len()).div_ceil(G=
SP_PAGE_SIZE);
	    for i in 0..num_pages {
	        let entry =3D sg_entry.dma_address()
	            + (u64::from_safe_cast(i) * u64::from_safe_cast(GSP_PAGE_SIZE)=
);
	        dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
	    }
	}

which could become

	for sg_entry in sg_table.iter() {
	    sg_entry.dma_range().for_each_block(GSP_PAGE_SIZE, |addr| {
	        dst.extend_from_slice(&addr.to_le_bytes(), GFP_KERNEL)
	    })?;
	}
