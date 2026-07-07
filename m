Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4B341D4D9;
	Tue,  7 Jul 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431180; cv=none; b=ovfWfNWywrf3QK8tk55a5noewarC+6ejfnxNuBHiWVZrDIOY3LyB+8lsb5PbkWpKzFy2LVlgDH2sUPZdNe7iMi6/xmJUiWJ5bBd9CloiD3zUp817R53fHVmygMcCc2IFS3/7vkVhu7L0jrh+R/r1uaFmjt1Ms/j8PAW/YD7ZfIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431180; c=relaxed/simple;
	bh=x4JXL5MthhbcVUmt6JpsDYJ13gDvQUv0R5Dbfal+3dY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ffq/55nWV6w25AKrZu6GPDqsjTqkQaAxa+OCFhIiBAirqlwv3485ou5dBj2bZIC7bCXu4az3phRp3ks3WPzytedYLYqIIcF9+OHGVBhtRuzp+l81SeoUmF3yfY84+n8BSkWDMLE4KvhMfdB1YjO0OndlN353R9/jDAJkQW9pMrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+ZMEndv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+ZMEndv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5B11F000E9;
	Tue,  7 Jul 2026 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783431178;
	bh=rhfHOQvTa498cQtDMgDpdpPPwFlV7FDZZQ3IECkJHjo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=m+ZMEndvVUaCFJSjYulugDIcoLta67ck5AssagG9srrTxzPeISwZpbczJvzQFHp+b
	 wY/cnPnCk3exWVxeKHXl7XecV0Wf4T4zLSV2InsAKanIZI4FFsPM0Y2pGJ+rAyOJKb
	 I7ucoZFeXYqTXHp2SWuSKjKkA4vM5HnEQ2/IPfsdaxP1qoAijDzHBaLVkl4l6lZLWf
	 Oo0KsI4mXS7ZXI+S5B2+iz8W3ScVrGVGGq1o4gLCyEL+tt8LsZX8RIMEzlcdU6Q1GM
	 AhZwk/G18T54Ma/T79bGxHzh1q5o58PVD2FVI208g9Wb7cGolEDfaq4EAQFPM4lenh
	 ku4sCfD375oIA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 15:32:54 +0200
Message-Id: <DJSDL78562EB.1RQP5C4UX55TL@kernel.org>
Subject: Re: [PATCH v3 1/7] rust: firmware: add request_into_buf()
Cc: "Timur Tabi" <ttabi@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "Zhi Wang" <zhiw@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "russ.weight@linux.dev"
 <russ.weight@linux.dev>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
 "ojeda@kernel.org" <ojeda@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-2-ttabi@nvidia.com>
 <DJR9ZKFB5WQQ.1CGI0N3GS1SFM@nvidia.com>
 <DJRFIANMW0AM.2LAQJ114NJQYH@kernel.org>
 <e1c7a5f2ca6fb05b27f76f8f1af2c11532c75ccc.camel@nvidia.com>
 <DJS2WBOSQ1U7.AQQZA227X9MK@nvidia.com>
In-Reply-To: <DJS2WBOSQ1U7.AQQZA227X9MK@nvidia.com>

On Tue Jul 7, 2026 at 7:10 AM CEST, Alexandre Courbot wrote:
> On Tue Jul 7, 2026 at 11:54 AM JST, Timur Tabi wrote:
>> On Mon, 2026-07-06 at 12:50 +0200, Danilo Krummrich wrote:
>>> On Mon Jul 6, 2026 at 8:30 AM CEST, Alexandre Courbot wrote:
>>> > Sashiko is correct to point out that this doesn't return the number o=
f
>>> > bytes actually written into `buf`. We might not use that information =
in
>>> > nova-core, but this is a kernel-wide API.
>>>=20
>>> Returning the size only doesn't carry a lot of value, please see [1].
>>>=20
>>> > Returning a `Result<&[u8]>` would take care of this and cover the
>>> > general use-case nicely.
>>>=20
>>> I'm fine with either this or just Result, as we don't have a user for t=
he
>>> former.
>>>=20
>>> [1] https://lore.kernel.org/nova-gpu/DJ6JV2QQY0QD.1ZK1PRRBN5BRP@kernel.=
org/
>>
>> Guys, please come to a consensus.  I had it return a size originally, bu=
t then Danilo said don't
>> bother, and now Alex says I should return a size.

I said that both are fine for now, just Result or the slice, but only the s=
ize
doesn't serve a purpose (see [1] above or the reasoning below).

> Incorrect; I said you should return a slice. :)
>
> What makes me a bit nervous with this API is that it is not sound
> against incorrect size information or race conditions (e.g. if the file
> on disk changes after we determined its size). But that's true of my
> proposal as well anyway.

There's nothing we can do about this, the file could also be corrupted, etc=
. In
the end there are only two cases, the hardware can't deal with garbage, the=
n the
size-sanity check is not sufficient and we need proper validation (e.g. thr=
ough
the returned slice), or the hardware can deal with garbage, then the size-s=
anity
check isn't necessary.

> Another inefficiency is that the buffer must be initialized when passed,
> only for its content to be immediately overwritten. I'd like to make
> this function accept a `MaybeUninit`, but that will require more generic
> code.

This is true, with the current approach we need something like

	let buf =3D VBox::<[u8; SIZE]>::zeroed(GFP_KERNEL)?;

which isn't the end of the world, especially in the firmware loading path, =
but I
agree it is a bit unfortunate.

We could indeed get rid of the initialization requirement entirely, but in =
this
case just returning a slice isn't sufficient, as it leaves the caller with =
e.g.
a VBox<MaybeUninit<[u8; SIZE]>> for storage, which is annoying if you want =
to
access the buffer subsequently, e.g. to parse headers, etc.

So, for this to properly work, you'd need to take the container (Vec, Box,
CoherentBox) by value and return the initialized one on success and the
uninitialized one wrapped into a custom error type on failure. But this is
probably a bit overengineered.

A simpler option would be to just use an initializer, such that
request_into_buf() becomes something like this:

	pub fn request_firmware_init<'a>(
	    name: &'a CStr,
	    dev: &'a Device,
	) -> impl Init<[u8], Error> + 'a {
	    unsafe {
	        init_from_closure(move |slot: *mut [u8]| {
	            // call request_firmware_into_buf()
	            Ok(())
	        })
	    }
	}

And then allocate the buffer with

	let init =3D request_firmware_init(...);
	let fw =3D VVec::init_with(len, init, GFP_KERNEL)?;

In any case, the current approach is fine for this series, this can be a
follow-up if needed.

The only thing that'd be nice to replace would be

	VVec::from_elem(0u8, size, GFP_KERNEL)

with

	VVec::<u8>::zeroed(size, GFP_KERNEL)

analogous to Box::zeroed().
