Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662BA3B6C02;
	Thu, 26 Mar 2026 17:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545873; cv=none; b=IqNJ/IPQwcHrlpniTeFnNFOb+vHlplx7/OMf87THresKuiwtguqIhHxseHL8OKkUAHVBHViwbuh/u08RaO1Qs8vKLA0TQ819W6Z05ZC6JCcltqksZHx9UiOJcxy5IxboqgtVCjyi1gMIFxU2EDB2wdeLyEjKy48Ck42esjtpEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545873; c=relaxed/simple;
	bh=opDK4Ru79ZA86qR34P9186LKKxDY5g3Umn4JEv2lErI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9lk98eODhsvyt6/F0MnSq7C0wcLO1AHpaeA76fDA73OZ0FMLCQQaxAdKuM0HlkpGIRKat9eX500ddod0w81RfIqbg99Bl6r1O16RC1H9V81uCdV0n5B9s+4dDTjtk79ohCFdiL/GXH5mCUBgzjEteKFtAdadA/fNonsRUoBvEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Id7uZYvO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Id7uZYvO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62197C116C6;
	Thu, 26 Mar 2026 17:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774545872;
	bh=opDK4Ru79ZA86qR34P9186LKKxDY5g3Umn4JEv2lErI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Id7uZYvOI/T8kuCSM9/6OWuMlY5W93yyxwZgMFspXSbb/b89TY1fof39Y3k5gjs4h
	 G4nzJ7x1jrA4veeFAo6WyYgEW7mj5c5iZjJ3U/sFdkqPEhjvg/lHiWFVPmjFBbPjEN
	 ZuUSfPatQzr0HoRZ4e0FCqRGG43ytBS1rkVW0Uq7J1A44Yy3q6S7fLYrZNJPMZprq1
	 uweMwn7tDir+VvZKc9LsqSPqgTLPiT9vMYllLmmx0sBnfhsTOZ70QDUaAhGEOGGFvm
	 7Np3LpXwb8kb7i4KJ8qHSd/osXZiIBl9v7H1vhn/pwAsFOQmRwoVz5ISeLkME3Ceai
	 e2d7IK5/2j8jw==
Message-ID: <f7e39810-bcf2-419e-af2a-2ae0c4d5ab67@kernel.org>
Date: Thu, 26 Mar 2026 18:24:26 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] rust: dma: add from-slice constructors and use
 them in nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260327-b4-nova-dma-removal-v2-0-616e1d0b5cb3@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260327-b4-nova-dma-removal-v2-0-616e1d0b5cb3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/26 4:22 PM, Alexandre Courbot wrote:
> Based on drm-rust-next, with [1] as extra dependency.
> 
> [1] https://lore.kernel.org/all/20260321172749.592387-2-dakr@kernel.org/

[...]

> Alexandre Courbot (7):
>       rust: dma: add from-slice constructors for Coherent and CoherentBox
>       gpu: nova-core: firmware: riscv: use dma::Coherent
>       gpu: nova-core: firmware: fwsec: use dma::Coherent
>       gpu: nova-core: falcon: use dma::Coherent
>       gpu: nova-core: fb: use dma::CoherentHandle
>       gpu: nova-core: firmware: gsp: use dma::Coherent for signatures
>       gpu: nova-core: firmware: gsp: use dma::Coherent for level0 table

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Feel free to also take the two DMA patches.

Thanks,
Danilo
