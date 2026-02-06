Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7173B36BCC5;
	Fri,  6 Feb 2026 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770386155; cv=none; b=lG1gYSrHxkTYe5qkrr3e6RHMXt8lXoZrgYD/273rEizchG8AmkQXbWAAgFG1xfF11d2Xiv4T7yJuSh+1eQDfgxGQziQS6vnF+c5GD5ww6EosDXPuheisFIGStly9dUbsFE3gjXIUXhub1Yf1/bIEh2isu/fDZnhrNSEi/t/CNS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770386155; c=relaxed/simple;
	bh=/RTP1a1GRRWEUuPb7p7qoXPD7R18r0X5lN0PkV9oDAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJw+VjBJJd9ssg/JC0KXq5pEe+xG0Taq9eVnPIO5O+GJlkWzIbpKz07hBmVPOQL895YPVee35LjIZy8XXl8C3BqDtc49jNw6DzfCcszpZlF2odqe9y0R/e9KGo2TwJmMaKaQsrczS6CxPIIyXu/ftv2oKbQuJk3sdUFu0iunbCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZjjYvRI+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZjjYvRI+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7EBC116C6;
	Fri,  6 Feb 2026 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770386155;
	bh=/RTP1a1GRRWEUuPb7p7qoXPD7R18r0X5lN0PkV9oDAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZjjYvRI+8QdQmfkFMb8tzlQmOp341c1wTHvQCJE47Yqeqn58IAleuDFxyCvFgygIF
	 +db3oXPj4nPEldYw+/+yUknL7F0bBdYr4sRjgvBS4aFWQ1npQEVOto0MBCScaXdzmp
	 6n0JTW7ksjZNyy4yc1e6m7NLY8TUsXRfAuVM2vPw=
Date: Fri, 6 Feb 2026 14:55:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, rafael@kernel.org, ojeda@kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Message-ID: <2026020633-foe-etching-e464@gregkh>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh>
 <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <2026020616-hardhat-french-4dac@gregkh>
 <aYXtwXYAELSIoxXE@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYXtwXYAELSIoxXE@google.com>

On Fri, Feb 06, 2026 at 01:33:53PM +0000, Alice Ryhl wrote:
> On Fri, Feb 06, 2026 at 02:22:42PM +0100, Greg KH wrote:
> > On Fri, Feb 06, 2026 at 02:16:05PM +0100, Danilo Krummrich wrote:
> > > On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
> > > > That's fine, because the rust driver core code should also be built into
> > > > the kernel, not as a module, right?
> > > 
> > > Yes, but the Rust compiler may still choose to put some of the core code into
> > > the module.
> > 
> > What exactly do you mean by "the module"?
> > 
> > > Especially with generic types and functions the Rust compiler may move some the
> > > generated code for a certain type instance into the module that instanciates the
> > > type.
> > 
> > Ah, that's a mess.  why?  The code lives in the .rs file in the kernel
> > core, right?
> 
> It might still be inlined into downstream compilation units. Rust has no
> equivalent to 'static inline' function in a header file, after all.
> 
> > > For instance, even though rust/kernel/devres.rs is *always* built-in, we get the
> > > following error when devres_node_init() is not exported when the users of this
> > > built-in code are built as module.
> > > 
> > > 	ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.ko] undefined!
> > > 	ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.ko] undefined!
> > > 	ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/nova_core.ko] undefined!
> > > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko] undefined!
> > > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_pci.ko] undefined!
> > > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_auxiliary.ko] undefined!
> > > 	make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> > 
> > This feels like a compiler bug, how is the compiler reaching into
> > devres.rs and sucking out code to put into the module?  Doesn't the
> > build/link boundry stay at the .rs boundry?
> 
> It's quite intentional.
> 
> It used to be the case that only functions marked #[inline] could be
> inlined like this, but it was changed so that small functions without
> any marker are also eligible for inlining. Now you need #[inline(never)]
> to ensure it does not happen.
> 
> Note that this analysis only applies to non-generic code. If you call
> devres_node_init() from within this function:
> 
> impl Devres<T> {
>     fn new() -> Self {
>         ... devres_node_init() ...
>     }
> }
> 
> then since `new()` is generic over T, it is duplicated for each type T
> it is used with (via monomorphisation, like C++ templates). So the
> actual `new` function might be instantiated in the crate that uses
> Devres<MyDriverType>, and in this case it ends up in the module even
> with #[inline(never)].
> 
> So you'd need a non-generic Rust function with #[inline(never)] in this
> case, and have Devres::<T>::new() call that function.
> 
> > > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at all.
> > > Hence, we could do something like in [1] instead. I don't know if there are
> > > other options that may be better though.
> > > 
> > > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/
> > 
> > That's a start, but still messy.  There's no compiler options to prevent
> > this "lifting" of the code out of devres.rs?  If not, this is not going
> > to be the only problem that drivers run into like this in the future.
> 
> Because of how monomorphisation, as-is the code actually lives in the
> module to begin with.

Ok, but again, that is going to cause all sorts of "the symbol is
undefined" type of problems going forward as a developers just "assumes"
that the place where the symbol is exported will actually have the
symbol exported from it, not that this place will be copied inline into
somewhere else.

Think about the interaction between module symbol namespaces here.  This
isn't going to scale, and will trip people up and cause us to be forced
to export way more than we really want to (like this patch series shows,
I don't want to export any of these...)

thanks,

greg k-h
