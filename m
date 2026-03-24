Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F62F2E5B21;
	Tue, 24 Mar 2026 22:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390864; cv=none; b=iNO+nObYswsDsKslyzPT/EZAbldk3m/irOAis1YToRURJ0P/rzcUYQ+ZKUK2oCRk4NhyhEu0XbZRcpyZvzNGBw2X3CRdYXiI9ANSomT8LutswWQrvEUflDxVNKRXbcfAXLvp3StyFIvk/TFH/7Wc/SUm4nh8GbZvOPM35DF//Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390864; c=relaxed/simple;
	bh=8+AiWm9w+5HQ6mpdrWQkHAekFAOur/L2VsI1LisI0u8=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=LVPI4kCGZryZxhuchAwNfLftCaNoedvP090PqgoOqz4UbBhwqSb9Tnv1t8Oj03KCN7Qf2KVwF5JMwqliYqv2lCJ9eI/wZ5JtXfoj3KTc81E9sDekA9sUyDYIy5jYbVwV+sf734vrmsG2e2+F1sKTZ2aw/ulAVVNTns8lvOLxpRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppaLoB3Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppaLoB3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E403C2BCB1;
	Tue, 24 Mar 2026 22:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774390864;
	bh=8+AiWm9w+5HQ6mpdrWQkHAekFAOur/L2VsI1LisI0u8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ppaLoB3YaZYwMCoer8MTbbfvPwN9zmHsfDsXYwLSztEL8l+tfM+ZAgB44IYotGRIb
	 LDZRFzre7XLEpQF/Rv1c+9zi2hH+xmwBLa05xUpSm1W5N9xupfPh7SU6Qso68+/I5n
	 JK15NCLSvzDcnl7znez76P1WJvlPHfi+gsqm2/16Esy08Yg9kEKsPA3Ug7p2AJrkDL
	 zE7l/VzuMdPha9vu84dQqLWMyh/I3ptr7TKPBjEfeP55e7qVDAw0DTT9cWeeAKl7P3
	 qAfElLPhpDta/6WlQIejP7adiI/hauOFZK/P89+9OVXroe+9JwuYy74NF6xJQSQbug
	 PuJ9WgO5soIUA==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 23:20:59 +0100
Message-Id: <DHBD2BO4R5BM.3OS7AHYN9A7DZ@kernel.org>
Subject: Re: [PATCH 2/2] rust: dma: add CoherentHandle for DMA allocations
 without kernel mapping
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260321172749.592387-1-dakr@kernel.org>
 <20260321172749.592387-2-dakr@kernel.org>
 <DHBAADML4BXP.131CD8C26BELH@garyguo.net>
In-Reply-To: <DHBAADML4BXP.131CD8C26BELH@garyguo.net>

On Tue Mar 24, 2026 at 9:10 PM CET, Gary Guo wrote:
> On Sat Mar 21, 2026 at 5:27 PM GMT, Danilo Krummrich wrote:
>> Add CoherentHandle, an opaque DMA allocation type for buffers that are
>> only ever accessed by hardware. Unlike Coherent<T>, it does not provide
>> CPU access to the allocated memory.
>>
>> CoherentHandle implicitly sets DMA_ATTR_NO_KERNEL_MAPPING and stores the
>> value returned by dma_alloc_attrs() as an opaque handle
>> (NonNull<c_void>) rather than a typed pointer, since with this flag the
>> C API returns an opaque cookie (e.g. struct page *), not a CPU pointer
>> to the allocated memory.
>>
>> Only the DMA bus address is exposed to drivers; the opaque handle is
>> used solely to free the allocation on drop.
>>
>> This commit is for reference only; there is currently no in-tree user.
>
> Thinking about this a bit more, instead of creating new separate types, w=
e can
> probably just have multiple flavour/kind of `Coherent`, and we default to=
 the
> most common one.
>
> Something like
>
> pub struct Normal;
> pub struct NoMapping;
>
> struct Coherent<T: KnonwSize + ?Sized, Kind =3D Normal> {
>     ...
> }
>
> Where for the common functions, they're implemented on `Coherent<T, Kind>=
` while
> the ones that require CPU mapping have `impl Coherent<T>`.
>
> The benefit is that there's no code duplication.

This was my first thought as well.

But I found it a bit odd that users would still have to define T, then I th=
ought
we could have a type alias, e.g.

	type CoherentHandle =3D Coherent<[u8], NoMapping>;

In this case the constructor would be CoherentHandle::zeroed_slice(), which=
 I
find a bit odd as well.

Alternatively, we could have a const SIZE generic on CoherentHandle wrappin=
g
Coherent<[u8; SIZE], NoMapping>.

Then we'd get CoherentHandle::<SIZE>::zeroed() (which I find much better), =
but
we would still have Coherent<T, NoMapping> publically available, which I st=
ill
find a bit odd.

And then I thought, it's probably not worth the additional complexity and a
separate CoherentHandle type is probably good enough.

> Also, you could also implement `Io` but leave out all `IoCapable` impls, =
so
> you may do I/O projections on these and be able to get offseted DMA addre=
sses
> without having to do manual computation.

This is a reason for having Coherent<T, NoMapping>, but I'm not sure it is =
an
improvement in the first place.

If the memory is not mapped on the CPU side it is probably just an opaque
buffer. And I'm not sure there is a huge advantage in defining a structure
representing any relevant offsets and then do an I/O projection compared to=
 just
having constants or an enum defining those offsets.

I also think there's not a huge difference in terms of robustness. In the f=
ormer
case, if you mess up the offsets, the buffer size will be wrong (unless mul=
tiple
offsets are wrong and compensate each other) and the device will not proper=
ly
work on runtime.

In the latter case, you either also pass a wrong offset to the device, or y=
ou
get a compile-time error if the offset is out of bounds (which is probably =
even
better).

Also, consider the case where the offset into the opaque buffer is dynamic,=
 then
a type and I/O projections won't help either.
