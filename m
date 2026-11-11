Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389424;
	b=nwIeq67lpo6QDf4BElx4PZDfFuHYql8M8NjL6XnPw41o4BKS+lPiTTaQAsJ45FPwFtQ4
	 +e0+NGQUq9AOlKa3Iq6VHU9WgxT/01tkN3q93sPiaCnJ/8T4L0Z0W22wb8o5AVLdcHyCl
	 3BhM55l2UqfLenM7re+JdYMXleDvYfUZ3gJD+lr78AWss0HnLZkq1iSX/nfPXJ0WH5Io8
	 F0DUEQBHLYy63iCIWk/A4W8aVAjzqUytWwQ9r0FLvHCK2dq8UwVOW5oQs1OhcubF3FcHX
	 l3f0xUFTXTXPqXKSAaJbJkN8DF6BcxPXB0lxBHTdTy2u025LdJGdXqEeRpKwRU10nnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389424;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=84mNVAxJB/4EPEIoYQQ2iI0OwXIBX5UcAERwTVjPWHY=;
	b=EqVFVTFthHAOtDHFPcIbS2biIFi0XWRIN3k/Dvcfz6+2lbHcuczoPYKq+tv4KhN6LvW/
	 EQ3quVviFpMaf25VcxeC2qwtD/XW6NXBUh7Fs0G4ZwSHFs1pvR+r7zf2gghMdWxzskfhc
	 TlXZ/gpuN5G//9qyOQa6u5HRU186ig6+C3n+XBRxsh3j4xry4ZhL50H8umznPTsz7VksE
	 d935+tW3a78uMa8hm0es2NLd48asl1N0GH8KdIlEwTI7b7GAcRHuvaiGyvqrQOm8SLEq1
	 cTYLpCuqB8HeK2BHSIPrjx27BYJi1U/okpZC+dtpnjVQGZ1Lmc3XPskpOWQarag492w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CYXD1D4R;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D22C60A261D;
	Wed, 11 Nov 2026 09:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D22C60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CYXD1D4R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=84mNVAxJB/4EPEIoYQQ2iI0OwXIBX5UcAERwTVjPWHY=; b=CYXD1D4RloSJvjkVTIKKM0ZLEH
	L71IzC0gJbd/iXHNJVQ+RyUh59BZ66wBfR+Ej+dxaM/fK3HF7i2z21HUaxVPIjXauhMjhYK8ELgww
	BXMSuL2dopUT5z6F8kyEEr7kQGK+JzRGowhDSp6pfgdiFq0bTgndsQ5qV/ch/zNB9dEVdeDF5RyK3
	DWr+yJID/of+vcCT+JKjXNhYKJ1k+vxiIVKqqOu3EF0aX28RJtcqT8AuM+9a8fbVPpZ0pZlzbV9pW
	ps0RfGrNFHYXkOlo5oFwmfBKGL4lb4IOFlb4qzEN2WHRmiYUJd2VT9+7TT9yA8crTPoorn1KuU0H7
	Sg/w4iwQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4eo-00000008yUr-2gtD;
	Wed, 11 Nov 2026 09:30:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2659B303011; Wed, 11 Nov 2026 10:30:17 +0100 (CET)
Date: Wed, 11 Nov 2026 10:30:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v5 0/4] rust: byte-wise atomic copies between `Page` and
 shared memory
Message-ID: <20261111093017.GX2668804@noisy.programming.kicks-ass.net>
References: <20261110-page-volatile-io-v5-0-a91ef252c24b@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-page-volatile-io-v5-0-a91ef252c24b@kernel.org>

On Tue, Nov 10, 2026 at 03:44:18PM +0100, Andreas Hindborg wrote:
> This series adds a way to copy data between a `Page` and memory that is
> shared with actors outside the kernel, such as user space threads or
> hardware, without introducing a data race.
> 
> The copy is built on `SysMem` from `kernel::io`, which already accesses
> system memory with volatile or byte-wise atomic operations. The series
> first makes the requirements of `SysMem` explicit by requiring freedom
> from plain accesses for the lifetime of a view. It then adds
> `atomic_per_byte_memcpy()`, a wrapper around the kernel's `memcpy()`
> with explicit safety requirements, and routes the `SysMem` copies
> through it. Finally, it adds `Page::{read,write}_bytewise_atomic`, which
> take a `SysMem<'_, [u8]>` view of the shared buffer.

I am still completely confused by this. In what universe is your magical
atomic_per_byte_memcpy() not memcpy() ?

