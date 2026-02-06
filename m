Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D883136EA91;
	Fri,  6 Feb 2026 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384325; cv=none; b=JSeXHbq4sJakEN8Npl60TZ7OdtOYHsq/fSNRRyIwYQdMeTdmIN7ZBgp11TsT5Iev70g5dRVAWIZTQ8HmduiGW+QCLq5DouLQDZHS25zXxs7iLHM/GX0SNK0LiImF8+a9uAgV0ngUx7UeSNdpkdql3Rmaxa/f2XP8vNR4buWNRcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384325; c=relaxed/simple;
	bh=5z3ls1cn8lK2M7B7C3qpyMjsybP7m+Jib7R+EStEy6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBJkXvbxBa5gD8nAwUs6A6ngjdORimmbQtHXPjNy3Is8bSJ++njYwn44IjkD5h779/VpTRvHdrlXYQMfb+Oo1Lfv8ZiFaOUwrYVfy9OUS2kTyUsrJ6hvvn5CeAh7Q+A5y79PJst8GKI/BYATW2BQtUypiRUVoKYe0RCburubWzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jc5O3DnC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jc5O3DnC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D92C116C6;
	Fri,  6 Feb 2026 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770384325;
	bh=5z3ls1cn8lK2M7B7C3qpyMjsybP7m+Jib7R+EStEy6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jc5O3DnCDaPks6M0bDNna70U6GBLiB+b6S7pCERR6gU/TiIRxAb1x1ZdnkWBpvwmP
	 WVRKBLkzU+DiI1a8ezw2sYmnV2PKKvlg2nw4AFyx0X1trDIdDibSXX1/xJl8CUHCap
	 ci7NNq0Ss39KyuXMVD70QMcI1htxhmu/YcMQNe7s=
Date: Fri, 6 Feb 2026 14:25:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, rafael@kernel.org, ojeda@kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Message-ID: <2026020618-congress-tuition-8893@gregkh>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh>
 <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <CAH5fLgifC=K1wssW-nWR3wvL9OHEQ9x2hPd2+ENj_mqtgEhyxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgifC=K1wssW-nWR3wvL9OHEQ9x2hPd2+ENj_mqtgEhyxA@mail.gmail.com>

On Fri, Feb 06, 2026 at 02:20:06PM +0100, Alice Ryhl wrote:
> On Fri, Feb 6, 2026 at 2:16 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
> > > That's fine, because the rust driver core code should also be built into
> > > the kernel, not as a module, right?
> >
> > Yes, but the Rust compiler may still choose to put some of the core code into
> > the module.
> >
> > Especially with generic types and functions the Rust compiler may move some the
> > generated code for a certain type instance into the module that instanciates the
> > type.
> >
> > For instance, even though rust/kernel/devres.rs is *always* built-in, we get the
> > following error when devres_node_init() is not exported when the users of this
> > built-in code are built as module.
> >
> >         ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.ko] undefined!
> >         ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.ko] undefined!
> >         ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/nova_core.ko] undefined!
> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko] undefined!
> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_pci.ko] undefined!
> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_auxiliary.ko] undefined!
> >         make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> >
> > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at all.
> > Hence, we could do something like in [1] instead. I don't know if there are
> > other options that may be better though.
> >
> > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/
> 
> You can use #[inline(never)] to prevent this.

Ah, good!
