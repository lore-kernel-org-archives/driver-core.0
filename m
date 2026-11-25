Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625046;
	b=Av6r0WBptz9I83O3UiXBhhGqouCT1+Gt/CaQWKvV26IlUIVnxl1FEjQrTWlw3ksUUGcq
	 jhHLnsB9cYwPe1m+2v1Uw9nS4+VJ9e6KmgHy4J53lfI8mgNgsi3NrqXxeGC7YUL8X0LuO
	 hQltpLRWhUJIqF1iDZl5Dzu8+s7kbXD5pHYjt9nwGsEUGA0+xcT58QaUPd2n5bzg86yfY
	 ClRTe7AKewJg9pOmypcdNnnyq8yO1/SLVwMmpW8C6PNLBPhG7oYiehZ4IqUZB+L+FZ3CZ
	 9H5Jn8eD8L5OIwYwwuQK96cVZB/Ge3ICt/Pwl8PJvHyasUieRUKvzvaQLkp6334ZXFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625046;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jd9x0ZEc5Yg2+puDyM+sOwzRHLWcGdo4dAnUPow/Qz4=;
	b=P8x1IUnqfu14arlwTCW3DO6EXOtU5CYuMD8sFHGWORmcdkCFlEtdY0oZu6fsH0GCjvbj
	 13VFtdSFRVsBK/7oh64BnTECBBmGFh2p665QWSE6lYcMM1FxZ8oaWttj7/Bvk+rhRnkYn
	 wAP4NGNydv3fLyMVQmQ5V6RTsmFeIRioAeJOT79NqmaymI/Wt5dFQbZ92sxS7WbwvxnaB
	 vIblSAsKe70zORM0yk/kmlv2b8p51hk+FVLRJb0YkgLUplcJDRlY0dz+7ApcLTx2NldqA
	 EXQlewfBYfgmLx3GPyyfCwmOEd7y0a0DDu7JBO/e9a1zMFegNRpdieI5x/odNm/Hqag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nXMHQ2UY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775F2606A321;
	Wed, 25 Nov 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nXMHQ2UY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EBA1F000C4;
	Wed, 25 Nov 2026 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795625046;
	bh=jd9x0ZEc5Yg2+puDyM+sOwzRHLWcGdo4dAnUPow/Qz4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nXMHQ2UYLtkkHGDN35dhVb6SOBN9guLcXBsbwgBsqwxivWUf0tC15Dy6Ca/oy4Itc
	 zrlittQFUvyEGDQ8/NWSKfnC5emgOQnwdd9v5VMoHtxRFxSimqUBiDFrXvkjOsiZ27
	 sbnFGnQEIApaBJEAtTrhn8Ol3DZ4MWQ7F2goHvZiBD81d0HJI9agO5b5Q9Lw6SJuWL
	 LdcouFr2sgKb8whrnHcEoovfu0b+HDjOgxYOoUxiZ39qRf7lF180qD3bwNrydDdVyN
	 idtqlimmwY8VGsT3ycXvNnk/ctMXTwJ2/vlEwBMnPqD2NV8x3E1lknPLP8O3LnBZqc
	 M7JsveV1fbEPA==
Date: Wed, 25 Nov 2026 06:44:05 -1000
Message-ID: <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
Subject: Re: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static work items
In-Reply-To: <20261119-rust-workqueue-v4-5-707c68994940@google.com>
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com> <20261119-rust-workqueue-v4-5-707c68994940@google.com>
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
Content-Transfer-Encoding: 7bit

Hello, Alice.

On Thu, Nov 19, 2026 at 02:12:46PM +0000, Alice Ryhl wrote:
> Because the cancellation guarantee only holds if the destructor runs
> before the bound Queue or any lifetime in T expires, ScopedWork::new()
> (and thus new_scoped_work!) is unsafe and requires that the resulting
> value is never forgotten and is dropped before 'wq or T's lifetimes end.

I'm no Rust expert, so maybe this is me thinking too much in C, but
requiring the compiler to understand and enforce that a workqueue outlives
its scoped work items doesn't seem very convenient to use. Wouldn't it be
easier to package e.g. a percpu refcnt with the workqueue, have each scoped
work item hold a reference from creation to destruction, and make
destroy_workqueue() keep draining until the count reaches zero?

Thanks.

--
tejun
