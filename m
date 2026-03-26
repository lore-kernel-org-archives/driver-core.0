Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743442F5328;
	Thu, 26 Mar 2026 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535850; cv=none; b=tPqTp3Y+AuAKQKPoUIhruHh5eVK0r0cK9wyHGr2IFnSeRmelOn7lhdvYN53P2LrR8Zl9Fx9r1Ivj+niA+zDR/gAtOOwMkTrPKWsB/p0FcZzhvfjZe/0TijYJxKdhpm2FB+n6cIF6VjJORJsDxPCdiYfS5C7GSKOuRwuH0GTLTOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535850; c=relaxed/simple;
	bh=XJDQ4xhzwjP7OM1VnwAQAVahzECcRB1m42eBk8f+hEM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=thxPLQ0vL6hQdT1i5GXh1tVRBGGhXAyjVFGaNXsnyGE59uW/2I3Eh4W0wLh0nulDMdATbTp0y+PcdRaHK0eNZYmhH2GdVsI0iZavFuZxlexxKfFcmy7YlanvohS6soSvESHE+J9eiHd2Db6ZviZxLPr9YPF+Ct1oH/CysWnBNH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKZklWZ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKZklWZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FA3C116C6;
	Thu, 26 Mar 2026 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774535850;
	bh=XJDQ4xhzwjP7OM1VnwAQAVahzECcRB1m42eBk8f+hEM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iKZklWZ+HsZFWw8nqDvrmAQcHr6L8KbjQLl6hfbwS/KQItMhIEHS/omtsr8cWrXs6
	 BfidobC1Vu3GMCDH3xgaWmezpYjMPwJhhH/QKVQGtT6coFQh43bSlm05D6mhMx5UZo
	 4p7jclF9U3byy+Ls/ObeKaURH5eNZsTmR/RMJKBpULOfevdy0uVjKCKwx5IIl7aj2z
	 5l8PxWP79xzpN1t1OFtg47LEZqndqHcTv+QNtrhEjsYdC5x4yLSPZu/nu7IgLk+i0J
	 N0xuYrd50j89WG6Bls630pW5UJUV+GXGYRmZpflcJLReRMtToiAvD+A2r8fVRD9IWM
	 PmeiXIcWKoZhw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] rust: dma: add methods to unsafely create reference
 from subview
In-Reply-To: <20260323153807.1360705-6-gary@kernel.org>
References: <20260323153807.1360705-1-gary@kernel.org>
 <JzrSpZxmwfo8q1EH2CfDaZi7zjwwJ8X2Gm2rn99EFvWcKZzGbP1DvTqAfAmql3olSG5AWDt3j8d4F5sQxX5SIg==@protonmail.internalid>
 <20260323153807.1360705-6-gary@kernel.org>
Date: Thu, 26 Mar 2026 15:37:20 +0100
Message-ID: <87ecl6y7vj.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@kernel.org> writes:

> From: Gary Guo <gary@garyguo.net>
>
> Implement `Io` for `Coherent`, so now `dma::Coherent` can be used with I/O
> projections.
>
> This allows the `as_ref()` and `as_mut()` API to be used in smaller region
> than the whole DMA allocation itself. For example, if a ring buffer is shared
> between GPU and CPU, users may now use the `io_project!` API to obtain a view
> of the buffer that is unified owned by the CPU and get a reference.

What do you mean by "unified owned by the CPU"?

>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/dma.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 779d4babab9a..ae2939abc166 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -12,6 +12,10 @@
>          Core, //
>      },
>      error::to_result,
> +    io::{
> +        Io,
> +        IoCapable, //
> +    },
>      prelude::*,
>      ptr::KnownSize,
>      sync::aref::ARef,
> @@ -864,6 +868,58 @@ fn drop(&mut self) {
>  // can be sent to another thread.
>  unsafe impl<T: KnownSize + Send + ?Sized> Send for Coherent<T> {}
>
> +impl<T: ?Sized + KnownSize> Io for Coherent<T> {
> +    type Type = T;
> +
> +    #[inline]
> +    fn as_ptr(&self) -> *mut Self::Type {
> +        self.as_mut_ptr()
> +    }
> +}
> +
> +impl<'a, B: ?Sized + KnownSize, T: ?Sized> crate::io::View<'a, Coherent<B>, T> {

Will this break orphan rule when we split kernel crate? Or will you put
`io` and `dma` together in some core crate?

> +    /// Returns a DMA handle which may be given to the device as the DMA address base of
> +    /// the region.
> +    #[inline]
> +    pub fn dma_handle(&self) -> DmaAddress {
> +        let base = self.io();
> +        let offset = self.as_ptr().addr() - base.as_ptr().addr();
> +        base.dma_handle() + offset as DmaAddress

Do we need a // CAST: annotation?


Best regards,
Andreas Hindborg


