Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774533E7171
	for <driver-core@lists.linux.dev>; Wed,  6 May 2026 18:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778093888; cv=none; b=TqyNW9dm1lpcCJfdb22v5ru/axs8/JSU0nALeQj3HZ8h7Vgf2afvvabH33/TGfS96TQAY5tACaaKEYEcLE/OZaKaRA0fPBfh/CEcWlrX0ZdrY26Yl0/J678dT8SeWQEQ7dnkMWKU83LxAsXuainILVtsHhOqs8DCDAmp42iAPcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778093888; c=relaxed/simple;
	bh=Jh8dRSsZA+SwPzKtNF0Q3FCiISzC/DzVkcO8uvkFP80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qo2G9IhH0jvTtTAesjr5Gmbss0D9tLgHhSKPSiGSy2nWWPJGBFxx9prFEoY8CDTQLvh+F3omcAf8XOWKfG27RY8IfB6gllABLU2uwhMWr6ZZ8DLWPwqTFY6SCBdLmNFOQ/maci+dkbYaeEwpDERSFjSGK+UiSwUMHEHsNeEx4Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=FOryj9Kv; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="FOryj9Kv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778093877; x=1778353077;
	bh=j2jb6pDWytCnzPIoxX5bidCRS1zNhWu4x26eJoWFxK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FOryj9KvWYeojcv/0kDCxfcx11fE9EZxZ9qMAQDc+gEu4yB6jOhaT1voDvEsCaorL
	 W9JmBwuTPNWNvlghgdmn241eBlq9rQcSmjEpQkiZNTxzHMuIWGqGqikAP0UfFQyCg3
	 wFrVtER86AcMriYLI4skB0qXSvyrFRFPYqgNrdsshLhc6y5Ssj1syguW+nbRA0e+Up
	 X/UdNU2LHAAR3hFQkPHqB/mekhwA+tcXk3Z36Ef0jkAZst6wz7gWBH4ho6SwDZINQq
	 kMckebl6o5ZvGU36MhhVnvLYF1s/lgHXFPlfLkzcWk89USyZK3tFVf4hpWEJIKyJBk
	 6oi1ws6gV/Xzw==
X-Pm-Submission-Id: 4g9l4y65WGz1DF7J
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Melih Emik <melihemik@noirlang.tr>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: dma: drop placeholder TODO comment
Date: Wed,  6 May 2026 21:57:35 +0300
Message-ID: <20260506185753.8786-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260506174637.22687-1-melihemik@noirlang.tr>
References: <20260506174637.22687-1-melihemik@noirlang.tr>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 06 May 2026 20:46:37 +0300=0D
Melih Emik <melihemik@noirlang.tr> wrote:=0D
=0D
> The comment above Coherent already describes the outstanding design=0D
> =0D
> considerations around device resource lifetime.=0D
> =0D
> Drop the standalone placeholder TODO marker and keep the explanatory=0D
> =0D
> text, including a minor wording fix.=0D
=0D
This formatting is a bit off. Please consider tightening the paragraph and =
drop=0D
the unnecessary empty lines.=0D
=0D
-Onur=0D
=0D
> =0D
> No functional change intended.=0D
> =0D
> Signed-off-by: Melih Emik <melihemik@noirlang.tr>=0D
> ---=0D
>  rust/kernel/dma.rs | 4 +---=0D
>  1 file changed, 1 insertion(+), 3 deletions(-)=0D
> =0D
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs=0D
> index 4995ee5dc689..60c458adba0c 100644=0D
> --- a/rust/kernel/dma.rs=0D
> +++ b/rust/kernel/dma.rs=0D
> @@ -580,9 +580,7 @@ fn from(value: CoherentBox<T>) -> Self {=0D
>  ///   to an allocated region of coherent memory and `dma_handle` is the =
DMA address base of the=0D
>  ///   region.=0D
>  /// - The size in bytes of the allocation is equal to size information v=
ia pointer.=0D
> -// TODO=0D
> -//=0D
> -// DMA allocations potentially carry device resources (e.g.IOMMU mapping=
s), hence for soundness=0D
> +// DMA allocations potentially carry device resources (e.g. IOMMU mappin=
gs), hence for soundness=0D
>  // reasons DMA allocation would need to be embedded in a `Devres` contai=
ner, in order to ensure=0D
>  // that device resources can never survive device unbind.=0D
>  //=0D
> -- =0D
> 2.54.0=0D
> =0D
