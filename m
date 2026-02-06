Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019123AE702;
	Fri,  6 Feb 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384167; cv=none; b=kwNH6LHR9xP0Omdy1CzCFAwdoAT0yBbXUrzU7GJGGE5aYChg4Ps4Wh9GMO3G456DJdrXzGT4CtkQo/H0il69ftuE0RSufBw+ySH4tT/JebAShzJ5AES7F3TP2wjl/6uiAKz1D35EXgq16H21LGGwtB3sSW5NTj4Yn4FQVoSvOB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384167; c=relaxed/simple;
	bh=A1Alvx9eMaVQcr/DSmUMNhLPlq8mqIx/xeMgnkFJ+lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bpg/LsomwX8T1y+tEq8gifE8qYfMgvO89OPs2//+52Une8EIT9ge80XaU+koFQGlrcHAYbA7vFLqlIqx4hy6shpuL/ww/Ek7imoRpKpLayViRXlFYdZWA0q7P0mPEakTKTAz5QJZ8ZK82sLaN83C6o3TMPfhib7vSafDi5corDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YW+WJkM9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YW+WJkM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC308C116C6;
	Fri,  6 Feb 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770384166;
	bh=A1Alvx9eMaVQcr/DSmUMNhLPlq8mqIx/xeMgnkFJ+lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YW+WJkM9DYpjVq7MeoAI6WXC3aqgu989pLx+AxruvAul9JmaHbPA3uA2twIyXcO4a
	 6JCLxth2ZbaRuLMZ43F2Pj79BoRW/cs7Kn/yhlRKp5VdqIYHFgHa36PQWCQ4XXLPL3
	 k9oBuTJb0F1f/wEyVCG215cSS+061OzQha+xcwHw=
Date: Fri, 6 Feb 2026 14:22:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, rafael@kernel.org, ojeda@kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Message-ID: <2026020616-hardhat-french-4dac@gregkh>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh>
 <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>

On Fri, Feb 06, 2026 at 02:16:05PM +0100, Danilo Krummrich wrote:
> On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
> > That's fine, because the rust driver core code should also be built into
> > the kernel, not as a module, right?
> 
> Yes, but the Rust compiler may still choose to put some of the core code into
> the module.

What exactly do you mean by "the module"?

> Especially with generic types and functions the Rust compiler may move some the
> generated code for a certain type instance into the module that instanciates the
> type.

Ah, that's a mess.  why?  The code lives in the .rs file in the kernel
core, right?

> For instance, even though rust/kernel/devres.rs is *always* built-in, we get the
> following error when devres_node_init() is not exported when the users of this
> built-in code are built as module.
> 
> 	ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.ko] undefined!
> 	ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.ko] undefined!
> 	ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/nova_core.ko] undefined!
> 	ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko] undefined!
> 	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_pci.ko] undefined!
> 	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_auxiliary.ko] undefined!
> 	make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1

This feels like a compiler bug, how is the compiler reaching into
devres.rs and sucking out code to put into the module?  Doesn't the
build/link boundry stay at the .rs boundry?

> However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at all.
> Hence, we could do something like in [1] instead. I don't know if there are
> other options that may be better though.
> 
> [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/

That's a start, but still messy.  There's no compiler options to prevent
this "lifting" of the code out of devres.rs?  If not, this is not going
to be the only problem that drivers run into like this in the future.

thanks,

greg k-h
