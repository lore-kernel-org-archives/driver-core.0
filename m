Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B143451D4
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384835; cv=none; b=SajT25mYsQGq0uJoLJoh5IxOCtdLxK8vq5bReP67BHkSrRmjX1vte3nC9G9WSnlqegzk1i8urg6PbizWgPpvPH7eW2LIYUHfXYhkD/+faw9jXFm9uxi+WFzu8Z3tyvssM2/TMKJOFARHZCDxfzlQuO6s3ZwnhOJ2Ayezdpi54sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384835; c=relaxed/simple;
	bh=xGpaiHCVft5rqL5hPHguU7ANEzc/m51uTVb/9f3EGf0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mhLxJCF4tbU6vJ7KpjWA6qjfkRTLS2ZGam10tYJvmYtO0e/aT01S0AUP5+E6GtOmfnsWarfn3Ho0Gqt15NhU0JKyZUxosZYwgpLLcz11zq1EjW2TNaJGXORWqXJ5tSCZCGaGY51HAsfiZtGr1tQzMz3473YX9f1lktj0zRAfa2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B8vM0DNS; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B8vM0DNS"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-482eec44485so18119765e9.3
        for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770384834; x=1770989634; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwkcPQInn+Mm0bMHzFxwfMcyvkWX24kShIbuI4LJcbw=;
        b=B8vM0DNSrs0FpToaIbRJuTPOs944PVdyhpOrN0OR0wOFuvKUCEKw//ZBKU65zAWDqq
         tqITU/Dp776PgMK7s2FhU8tB29o9FONYfeLxDMrNtjGlLdKL2LCJbRGitHuUPvf4nSsS
         zEtTpQ8yjKiwAGXC/3RIJ5AQEvkFx72HhRPWvhurgGQ1LTagTadZlvcccjv7zqSgrMC6
         TODq0hFJP/bxDojyilVIRBegIgNb8Zc41OnpcCrZ6TF6HATihQXT6Pm7WVetvS5H9cNq
         zoOmps5Kv4WtV29qKrR0pY+97DfVq9Z77Jyobs7X57l81AgHsYSNErEaY7CmRWY1rx4R
         7awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384834; x=1770989634;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YwkcPQInn+Mm0bMHzFxwfMcyvkWX24kShIbuI4LJcbw=;
        b=bPkcTo6HLZiMeWq+C9UaPCmKoA+GbBAt/2J0mTg8KNHVf+VaB0NCsbEqCX2TUIKD2Z
         ydp7qOxKJ2nQdvM/tnWRh4hKrD+SZmZw21npu3ffFCFWZJPtoO5qF+YNj1Yl7W1a39mD
         mYMOMd0iZj1Q9nsUe96em3byKUd2c7CjP3ZPLWBawQNNvuL5Tqp5PtzhxuxN9xO8DJvj
         gqfvBAwtbD/EpMn8ExWbkti0XaM8S8/8XeReu2VoJfUSM/oQ1/rM/VBJX7CtLF3mVrRo
         OTQ4CjVEIXgMsvO0A/ZleJA1jXqzj3/S5AlGEF4zangGz3iw1ONINBa2Am41UDW6m+G8
         rXlA==
X-Forwarded-Encrypted: i=1; AJvYcCWlXpqLeEleEtnGTcO4oDIswnvz/oCcPgiRYEO15pmbMHe+SuecTkUyStoca56vb3ijpyaTQ5jvfahrCw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1pQnnmc9Kih7uJZWcWnFAYxHbT08eOZlZpXg6j1b8kQmPYd5l
	SkKSJA6kxyqkZyusFH4DFqdP0g9OyA5I1KGnGfKfI6klZhWjh0U58rAAP3lJ6soI2jx4xIInhml
	PqPSMikDW3Pvo+RiGzg==
X-Received: from wmig16.prod.google.com ([2002:a05:600c:1410:b0:477:aa9e:db24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f08:b0:480:46c6:bf4b with SMTP id 5b1f17b1804b1-483201dadb6mr42367165e9.5.1770384834177;
 Fri, 06 Feb 2026 05:33:54 -0800 (PST)
Date: Fri, 6 Feb 2026 13:33:53 +0000
In-Reply-To: <2026020616-hardhat-french-4dac@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260205224706.91996-2-dakr@kernel.org> <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org> <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org> <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh> <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <2026020616-hardhat-french-4dac@gregkh>
Message-ID: <aYXtwXYAELSIoxXE@google.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 02:22:42PM +0100, Greg KH wrote:
> On Fri, Feb 06, 2026 at 02:16:05PM +0100, Danilo Krummrich wrote:
> > On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
> > > That's fine, because the rust driver core code should also be built into
> > > the kernel, not as a module, right?
> > 
> > Yes, but the Rust compiler may still choose to put some of the core code into
> > the module.
> 
> What exactly do you mean by "the module"?
> 
> > Especially with generic types and functions the Rust compiler may move some the
> > generated code for a certain type instance into the module that instanciates the
> > type.
> 
> Ah, that's a mess.  why?  The code lives in the .rs file in the kernel
> core, right?

It might still be inlined into downstream compilation units. Rust has no
equivalent to 'static inline' function in a header file, after all.

> > For instance, even though rust/kernel/devres.rs is *always* built-in, we get the
> > following error when devres_node_init() is not exported when the users of this
> > built-in code are built as module.
> > 
> > 	ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.ko] undefined!
> > 	ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.ko] undefined!
> > 	ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/nova_core.ko] undefined!
> > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko] undefined!
> > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_pci.ko] undefined!
> > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_auxiliary.ko] undefined!
> > 	make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> 
> This feels like a compiler bug, how is the compiler reaching into
> devres.rs and sucking out code to put into the module?  Doesn't the
> build/link boundry stay at the .rs boundry?

It's quite intentional.

It used to be the case that only functions marked #[inline] could be
inlined like this, but it was changed so that small functions without
any marker are also eligible for inlining. Now you need #[inline(never)]
to ensure it does not happen.

Note that this analysis only applies to non-generic code. If you call
devres_node_init() from within this function:

impl Devres<T> {
    fn new() -> Self {
        ... devres_node_init() ...
    }
}

then since `new()` is generic over T, it is duplicated for each type T
it is used with (via monomorphisation, like C++ templates). So the
actual `new` function might be instantiated in the crate that uses
Devres<MyDriverType>, and in this case it ends up in the module even
with #[inline(never)].

So you'd need a non-generic Rust function with #[inline(never)] in this
case, and have Devres::<T>::new() call that function.

> > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at all.
> > Hence, we could do something like in [1] instead. I don't know if there are
> > other options that may be better though.
> > 
> > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/
> 
> That's a start, but still messy.  There's no compiler options to prevent
> this "lifting" of the code out of devres.rs?  If not, this is not going
> to be the only problem that drivers run into like this in the future.

Because of how monomorphisation, as-is the code actually lives in the
module to begin with.

And not lifting out code causes issues with super small wrapper
functions around C functions too.

Alice
