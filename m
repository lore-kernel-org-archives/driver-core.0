Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54113EF67D;
	Thu, 26 Mar 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537380; cv=none; b=NNoTEwHa15454A/eYZjRx2+Q/hYRAkMB6NFlDXIEcgIzak+xaX7son5FA+wUuVpi19VNA+rOHP49zYsQnKNoPQB3nVHlq0kMnHXkKPBAeyUA32Z4QiK+R+Vc9qEOiBxwYBcfq1xDpqUG53egB2PByVZ35MBen8fWxiK5XpOUy7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537380; c=relaxed/simple;
	bh=+EpHCZqjj0dPNbA++lm7bhmmIMPe/QOI7xvGupRgv0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kP/k77kho9lzIg+Saqi6Jqr1ApGpxlmE3Vp2Ip/zESQfmuN7SqDCGVhzREmK4qpVkJnAqW/OGg9ZdzMJvr4Fgco1fFofSr5LOwRmLfJPYLwDppObhFmhsIcaTOzbrNq4CmNAnREtCumfX03SzDNhOB6EmBV5IRpkGZji/N2fALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ga8rnKHl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ga8rnKHl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BADBC19424;
	Thu, 26 Mar 2026 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774537380;
	bh=+EpHCZqjj0dPNbA++lm7bhmmIMPe/QOI7xvGupRgv0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ga8rnKHlR5rJUhuqnfkV5CJVpmrjP4TEpMbDX4QUr7NRETdD+yMe/2YsfE8FnflQ9
	 YlNz0klB8/83fGj5D1G8xokwxZ5Qn+tMekDxKBW+QD5f+4+8lxAvvaxkN+UrH+tN+z
	 6FTtWzmMbfbwPEgWikPjezhfrNm+YCeXs6TuAQU4XGyFVKX+U+UHCQ3Bkkyw8OG6nw
	 2vSPqfH1zrRXB3RO+VmvELLOoredEMbmPUGmOk6pBb8K1jKUMKmo0punlw8bJRGeed
	 XKHf5eZoGZyBHf1p86SSDtlPC3fdvPDl+pZtJCsv73zn8mK4ig9/KC+s9WziQv+KCL
	 judcA3rGLwHuw==
Message-ID: <02633e09-cabc-43f0-a09b-b95c0f1271ab@kernel.org>
Date: Thu, 26 Mar 2026 16:02:54 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] rust: dma: add from-slice constructors for Coherent
 and CoherentBox
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-1-5cf18a75ff64@nvidia.com>
 <DHABINRM1861.3HQ3J4IZ150F4@garyguo.net>
 <DHCSXDEMMPZ9.FPPFUV6AMU4P@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DHCSXDEMMPZ9.FPPFUV6AMU4P@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/26 3:59 PM, Alexandre Courbot wrote:
> Then it looks like this:
> 
>     let mut slice = Self(Coherent::<T>::alloc_slice_with_attrs(
>         dev,
>         data.len(),
>         gfp_flags,
>         dma_attrs,
>     )?);
> 
>     // PANIC: `slice` was created with length `data.len()`.
>     slice.copy_from_slice(data);
> 
>     Ok(slice)
> 
> FWIW I find using `map` more elegant, but I've made the change for v2
> nonetheless.
I also prefer map() in this case.
