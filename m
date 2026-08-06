Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF030471CFB
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 12:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018416; cv=none; b=TK4Unvjjyw7VAM+rV37r7/NntqwRzexPVs5Qo9s4MXKErD3EX9DIjEtLQwWeIr22t4YTZu6laYao+5hh6Wel27IsAbfN5uMVVFahujQ3Z58ALFw+7fH5JP62GaZbQdIffu0MRg1s3HE5O2lTJmcVUWTPvXo4r6q5pU+ThhG/0SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018416; c=relaxed/simple;
	bh=XWJC71vjidbrGl2vWWbByguYpH4UYbNLFLMSpk0Lr6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQeYrQ0Rl/3fwcjKFnnwGsiaeF+wAhgPnjlPxVM4k5uzLgD5f9I7VB8eo8Uld6gbS8fY7IRMpLAYnnIlr8TJi9qCSNgg0hsNnz6I9M5PhiA+hJWWPQfXvRzFotdA6AODgN/SLL71Q5FeRVWzXdB7XyujV+1GVsH9ww5gye2wtqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 32DA770A2CAA; Thu, 06 Aug 2026 14:13:33 +0200 (CEST)
Date: Thu, 6 Aug 2026 14:13:33 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Gary Guo <gary@garyguo.net>
Cc: Link Mauve <linkmauve@linkmauve.fr>, rust-for-linux@vger.kernel.org,
	Ethan Plant <plant.ethan@gmail.com>,
	Michael Garofalo <officialTechflashYT@gmail.com>,
	Ash Logan <ash@heyquark.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2] rust: io: Add a BigEndianMmio wrapper
Message-ID: <anR6bfODEukoiCv5@desktop>
References: <20260806062207.3024012-1-linkmauve@linkmauve.fr>
 <DKHU2JQ95D67.33B9B0U3539IA@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DKHU2JQ95D67.33B9B0U3539IA@garyguo.net>
Jabber-ID: linkmauve@linkmauve.fr

On Thu, Aug 06, 2026 at 12:44:31PM +0100, Gary Guo wrote:
> On Thu Aug 6, 2026 at 7:22 AM BST, Link Mauve wrote:
> > This allows the user to read from and write to big-endian MMIO devices,
> > such as those found on PowerPC systems.
> >
> > The implementation is pretty much a copy-paste of the RelaxedMmio type,
> > with the business logic changed.
> >
> > This has been tested with various WIP drivers on the Nintendo Wii, and I
> > thought it would be nicer to upstream it before those are completely
> > ready, to get some review.
> 
> An alternative approach would be to have a generic wrapper `BigEndian<IO>` where
> it performs byte-swapping in its `IoCapable` implementation. This is more
> composable as it works for all I/O.
> 
> Of course, this means that it won't be using the specialized BE I/O impl, but
> then the only architectures that have specialized ioread16be are PPC32 and
> SPARC, so maybe it's a reasonable trade-off to make?

In the end this should all be inlined anyway, I’ll compare the generated
assembly but I expect no change here.

> 
> Best,
> Gary
[…]

-- 
Link Mauve
