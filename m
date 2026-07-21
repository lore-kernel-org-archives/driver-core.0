Received: from out-12.smtp.spacemail.com (out-12.smtp.spacemail.com [198.54.127.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB1A435A8F
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621102; cv=none; b=gw4Wwi9OvAzSsrudZ9duyhB/wqUhxzwWSithTKmxtMvlBAR0ybpNlf6hSAMFtRxmMHJd2U4TPsEgKP+VcNe1KyquB8UAt+6pLdD9QEmlIQ7uASfrwL2Tl5SE0wagh+In/Bv5GA3OGW1ldttFR6hrcB8UQYrPYNjNVXhi+BpSBOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621102; c=relaxed/simple;
	bh=mr76EBlbN8O08LnhoPUbT4/bo6oQwF8RwmmNfaabwDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9aTvxW0XtiTImGbn5XPSkmeMXLDYxmQz4GwWM8+Y4ke419IzgNSzDN0ZK0CTQDUIGoJN1MTfWRR0Rrxy/s9cAqfoh7fzPHfdkcc5VhHghiNEr1SQDJtaCtszArYxw0MbcLCvnEUWSjs7d69Jdy6m3ZjR2hDo6BHseM1Qaq5ZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=PRCkyWIq; arc=none smtp.client-ip=198.54.127.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="PRCkyWIq"
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4h48q82WqSz2x9D;
	Tue, 21 Jul 2026 07:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1784620613;
	bh=TzX28A1UMcW9Zf5PxBkxX7mH+N3wq7mpn7WQihwVe24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PRCkyWIqzhJSXgOQncMADunzg9byN24YBMA5TEkY5ibyDt5nUqC8vAne1mdZXn242
	 j3LCiMKZWTerEg/TZwV7ICiNwaJnFF8EpwG9JF16mvWqM+o6F/s0EeFPkUm/F89YsS
	 xetxsmYSmoVnr6HhhxcNFcawRdJeER+R9kLjFX+hQiuqkVaDwTmcHyEym1I8TDfjjA
	 QK15wOYNapYgvaNp9BU18rJmUaOONQ8xf6KHizUdPMI9vPsBwMLs4k0LuWh3b24dDz
	 b1MmK0pY/xn22skPbQ4EzPLgmmRvRNd3ajuJsApKgM5XjpsLMsvGZZNWieSOyUtaca
	 MLNR1eyV9/YGQ==
Date: Tue, 21 Jul 2026 00:56:50 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Link Mauve <linkmauve@linkmauve.fr>
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
Message-ID: <al8mQuk8f9l9VgR9@gurudas.dev>
Mail-Followup-To: Link Mauve <linkmauve@linkmauve.fr>,
	Danilo Krummrich <dakr@kernel.org>,
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
References: <20260705-rfl-vert-imp-v1-1-2f07946a905f@gurudas.dev>
 <ak3-PbQ-PdeEWVo4@luna>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ak3-PbQ-PdeEWVo4@luna>
X-Envelope-From: linux@gurudas.dev

On Wed, Jul 08, 2026 at 09:37:33AM +0200, Link Mauve wrote:
> Hi,
> 
> On Sun, Jul 05, 2026 at 06:25:37PM -0700, Guru Das Srinagesh wrote:
> > Convert `use` imports to vertical layout for better readability and
> > maintainability.
> > 
> > Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> > ---
> > Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
> > vertical import style") and found a few more locations that could
> > benefit from this cleanup. No functional changes.
> > 
> > Separating out patches per-subsystem as per the review feedback in [0].
> > 
> > Tested via:
> > 
> > 	$ make LLVM=1 rustfmtcheck || echo "fail"
> > 	$
> > 
> > [0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
> > ---
> >  samples/rust/rust_dma.rs | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
> > index 5046b4628d0e..c46af109f4aa 100644
> > --- a/samples/rust/rust_dma.rs
> > +++ b/samples/rust/rust_dma.rs
> > @@ -12,9 +12,13 @@
> >          Device,
> >          DmaMask, //
> >      },
> > -    page, pci,
> > +    page,
> > +    pci, //
> 
> Usually we put the empty comment at the very end of the imports, not in
> the middle.
> 
> >      prelude::*,
> > -    scatterlist::{Owned, SGTable},
> > +    scatterlist::{
> > +        Owned,
> > +        SGTable, //
> > +    },
> >      sync::aref::ARef,
> 
> So here:                 ↑
> 
> >  };

Done. Thank you very much for the review and suggestion.
