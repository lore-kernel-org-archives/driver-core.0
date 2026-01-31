Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4334E765;
	Sat, 31 Jan 2026 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867800; cv=none; b=hx9GNveX/MqnQa4fSjDWokONlUb4w34AqncevsjCxFj4yjLBIELU2/8pXXguvLkuF8GN5n6Ob0ahvHVUi442pqa3oaQg8ZQPM0XTX9S7N+KHygntY9d7cMc4TG8cNxH3CBJbJYUi82qOckexw9kUUp0iJ/fHvF5tlcCHuzdBpdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867800; c=relaxed/simple;
	bh=Va3K+D30hZz0SN78oYxnmFtW/3mJg2NP0XZBLy7kYno=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qUCvHcBZTuFS7G3pREPNN7adK+t2K3rGfM+8QC4c/C27W92mRn7Hm4lespStHzUO05dAH6ckzwVceHDHCjfKPBXZwzBOuURJwNzmovnHqjn8x201lQ6KgGneYwey7tt8pUe1GfJOM51WAoGOWtndYEpV329ZjAjLBrR215kZHss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxtdhDRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxtdhDRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349E6C4CEF1;
	Sat, 31 Jan 2026 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769867800;
	bh=Va3K+D30hZz0SN78oYxnmFtW/3mJg2NP0XZBLy7kYno=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XxtdhDRaTFlFWArBkMQIoiYLwTVbVvlnRVj+oPvTRh6VHhtPmeTeAg0yCVPFs1tTm
	 2a35Vw6bDtIhUW5ADup/M9vKLuZZNdl1jqsnaoKnsmKbXgJN9jt2zqiACkxr48wgs1
	 1mEXdiwB2feodPC0/3tYGW9twh2lDcqpJuNzlTWf7JYwEuZBGxg70IRb+TJ9YgiPtv
	 T75RMvNu5A7rE/1lU0Z9SzPj4GFsBzXQHKhz/KVE2PJPUkwGrqW8nAqhIDOUnV4kp/
	 6N7dzdNBXZh23OKUXsG5ACyh72nzOcTPkU8bmgvP4VRojpviA3rPogml3K+ggpRe99
	 SFvPWcNLbzQtA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 14:56:34 +0100
Message-Id: <DG2TRSA2LOJ4.3PMICD9ORSB5R@kernel.org>
Subject: Re: [PATCH 0/9] rust: dma: add CoherentArray for compile-time sized
 allocations
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Abdiel
 Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
 <DG2RVAALGX4W.1L637C8NXXEEM@kernel.org>
 <DG2SXGUZPEUW.3SYUJHY0GZUWT@nvidia.com>
In-Reply-To: <DG2SXGUZPEUW.3SYUJHY0GZUWT@nvidia.com>

(Cc: Lyude)

I assume something odd is going on with your mail client for people that ha=
ve
been added to a thread later on?

On Sat Jan 31, 2026 at 2:16 PM CET, Alexandre Courbot wrote:
> On Sat Jan 31, 2026 at 9:27 PM JST, Danilo Krummrich wrote:
>> We've just generalized I/O to support arbitrary I/O backends (busses, ba=
cking
>> storage, etc.).
>>
>> With this we can wire up the I/O traits to DMA and generalize the dma_re=
ad() and
>> dma_write() macros accordingly. I.e. we can extend the I/O traits with
>> field_write() and field_read().
>
> With the caveat that the I/O traits for now only support accessing
> primitive types; is the plan to add a function to read any type
> implementing `FromBytes`?

That's exactly what I say above: generalize the dma_read!() and dma_write!(=
)
macros by adding field_write() and field_read() to the I/O traits. :)

For reference, this is where I brought this up originally [1].

[1] https://lore.kernel.org/all/DFOP5BY09539.AFY5L5FV1HNV@kernel.org/

>> (Lyude is going to work on this as a more integrated alternative to iosy=
s_map.
>> It would be good to align with her regarding this work.)
>
> Heads up, I am also doing some plumbing in `io.rs` related to the
> register macro. Maybe we should have a thread on Zulip to discuss what
> everyone is working on.

Done!

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/t=
opic/Generic.20I.2FO.20backends/with/571198078

>> This has the advantage that we don't have to duplicate all this infrastr=
ucture
>> for I/O memory, DMA, etc.
>>
>> I also think that CoherentSlice is too specific of a type. I'd rather ha=
ve a
>> generic type, maybe UnsafeSlice or IoSlice, that just uses the I/O backe=
nd for
>> accesses.
>
> For me the main appeal of this patchset is that it provides a way to
> work infallibly with a single object or a fixed-size array. I hope
> that's something we can preserve.

Of course, the generic I/O backend infrastructure is based on the distincti=
on
between compile-time and run-time.
