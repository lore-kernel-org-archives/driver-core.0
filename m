Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929AC37105D;
	Tue, 24 Mar 2026 14:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362592; cv=none; b=mIr5FQAZvcY73Z6oMfao7XcSXizihfYmCJgtCQvJyTvi/H0P+fWNx17aD0DmHpqhREyN56usW1Euy8rMVKxkPji/jc+Rrmv4T5qpxjSb57XtlMYZCbJUCfK/0SqwJcEMUO4jYhlzZaleo1STX4DU4wXHSWeUNJDETYPPQv4z4fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362592; c=relaxed/simple;
	bh=9f8Ertow8o7Hoy7VCHhTgo0WxhEZyuKxZ+ATg3i5rzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RbOzegsaLqRra0S+OKzrUE6Pr27gz+hvqXgdZfFABgT9rXfoLPi8SpsVJQYFZd+ZquXG1SycoQY5MP3veLCPLvCzMewmk/jH1+sdxtufaZntcLWoSH1a5PXwdUR7Bieu4t25C3n4g062vnNE01k0yhBntm8gelZYqHFr4k2X+wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLnBorfk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLnBorfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D56BC19424;
	Tue, 24 Mar 2026 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774362592;
	bh=9f8Ertow8o7Hoy7VCHhTgo0WxhEZyuKxZ+ATg3i5rzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TLnBorfkbC2nYFbvBO7zMhoAsIgPnN8s/kWSsmqQzjQjYUPxvnTHl6zRUtAI4faEo
	 SnqjyNofJFfx+ryua0JHea1P7P6S8GTESmqlvNwEUz3stYOgCWi3IkYW1KZHj2adhW
	 P6rEJBCdUZX75q5cX2uGX7bz4++rIsvqsgwW85B3ky6BAYWYDgd70x4E8RVHvppqAr
	 OotTa3PDUuaGyhZ838of9wdLCS6sjjyfwP6yzXirbkwAmlR/C83tdHweYdibtXpcWQ
	 1N3jKhzOGI3UIu1lu3KdlrO9QT5xTg2QWk3qiTpLbhwcPRfcQCBs9RyNDbyT8/gtx2
	 9HdxyyakTmPcA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Timur
 Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Eliot Courtney
 <ecourtney@nvidia.com>, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 1/7] rust: dma: add from-slice constructors for Coherent
 and CoherentBox
In-Reply-To: <20260321-b4-nova-dma-removal-v1-1-5cf18a75ff64@nvidia.com>
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <r99CFQu3TYPszzRwFKk4ScZQe_PoyAt1xcTaUyx-TMwA2S3z9-7Wvd7FUtx2HQPo_P2nehNTu_0rfnXJKLMwxQ==@protonmail.internalid>
 <20260321-b4-nova-dma-removal-v1-1-5cf18a75ff64@nvidia.com>
Date: Tue, 24 Mar 2026 15:29:37 +0100
Message-ID: <875x6lz4fi.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Alexandre Courbot" <acourbot@nvidia.com> writes:

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

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

I like `?` more than `.map()` as well, but it's fine to me either way.


Best regards,
Andreas Hindborg



