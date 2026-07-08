Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AA93F6C57
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 07:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496268; cv=none; b=E1qk0d9H3etXQ2LV5kCuZX2YG6xh+6YfE6Dl2wP1L7N6f7PGseWNyBg6bbq3h2Q/pOCML4dxo+R7xuIrVOj+0sq1XcCbYXlEaJKSHwomERJETxx13qbJwQBk5Biaz0LcHt+jSjd+KtkzNABDqlCqsdQMi+kg8fjlJj77ChdXC+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496268; c=relaxed/simple;
	bh=42gw/j8fnRePva9BK3enJ9N6JrHeKP9THWH/uUJHaEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLQBbvvtJBXpm05xnU8f95Khvy/9Wqv0j1Fe+NiQ4M6SuMS5n+eX5DD2icyaJ5PozR2op4OmS9xr5pPF41AMKOKW+poiud2VvNSq4x5YeJr4lWDgFJD/9FR0ER/Ycgza5OSZEps+Uz8Sk1k3iyEmwLk3A3Ii4P96xq1yhLtZKOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 74DBBF40CC8; Wed, 08 Jul 2026 09:37:33 +0200 (CEST)
Date: Wed, 8 Jul 2026 09:37:33 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samples: rust_dma: use vertical import style
Message-ID: <ak3-PbQ-PdeEWVo4@luna>
References: <20260705-rfl-vert-imp-v1-1-2f07946a905f@gurudas.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705-rfl-vert-imp-v1-1-2f07946a905f@gurudas.dev>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

On Sun, Jul 05, 2026 at 06:25:37PM -0700, Guru Das Srinagesh wrote:
> Convert `use` imports to vertical layout for better readability and
> maintainability.
> 
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---
> Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
> vertical import style") and found a few more locations that could
> benefit from this cleanup. No functional changes.
> 
> Separating out patches per-subsystem as per the review feedback in [0].
> 
> Tested via:
> 
> 	$ make LLVM=1 rustfmtcheck || echo "fail"
> 	$
> 
> [0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
> ---
>  samples/rust/rust_dma.rs | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
> index 5046b4628d0e..c46af109f4aa 100644
> --- a/samples/rust/rust_dma.rs
> +++ b/samples/rust/rust_dma.rs
> @@ -12,9 +12,13 @@
>          Device,
>          DmaMask, //
>      },
> -    page, pci,
> +    page,
> +    pci, //

Usually we put the empty comment at the very end of the imports, not in
the middle.

>      prelude::*,
> -    scatterlist::{Owned, SGTable},
> +    scatterlist::{
> +        Owned,
> +        SGTable, //
> +    },
>      sync::aref::ARef,

So here:                 ↑

>  };
>  
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260705-rfl-vert-imp-d12bdbe397c7
> 
> Best regards,
> --  
> Guru Das Srinagesh <linux@gurudas.dev>
> 
> 

Thanks,

-- 
Link Mauve
