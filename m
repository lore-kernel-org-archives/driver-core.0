Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D403559D0;
	Fri,  6 Feb 2026 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383769; cv=none; b=VBaKwe+1wuZL6z2djh8hXyLcEUkotzP3csVPOKt8QXxWnCnJ5qdFvOvd7MAkCXOcMzwWrY90Od3+2eBY17+Z8a8DTNvgcL5r3fNashG0y55jPiBSAPyVLBoD/FdodtdRD24a7tpbetHx0iawZh8e4PBy/B4oeOJ+WmMQ+KZlSQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383769; c=relaxed/simple;
	bh=SlJz4HCHmVFVKgEfDYhwB8zaxH3MiLS+JcRyS1IZ0Jo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=LsDezW4AQZOUYvIY6oMIp7pRwaS/dIOLtrWD4TZtFG8LwftcZqZZR5lFln4QBcLBqg3iUFpWGbnUVerrAsDf+WPlxEi6rjqBKAEaNdV3tPiy08y+jrulhxhrudaX7XeocxQYtgVeEvq1irAUKtG73Zqk1cD8uQ2FbHQo35DvITA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6+DuoP8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6+DuoP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92866C116C6;
	Fri,  6 Feb 2026 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770383769;
	bh=SlJz4HCHmVFVKgEfDYhwB8zaxH3MiLS+JcRyS1IZ0Jo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=P6+DuoP8blcjF8C7AImw4J6xdfbgdcUwiwUobHHn3EC4uBWR24QGBhOD6h9rFHPDA
	 ut1jLexGX9gzt/o43a0n2lP/UbvJfQn+E1nJAN7iEKdhi16uthynPjyjb5mXvBqdqt
	 8Ktz2j3Ms0we7eQ5Sa25o/Qyg1rOF5NTAZAczPJJZdztMFke76SUzQeIlHch9gwhfV
	 uPEjJ7wwS398ztkDOTt+rwMNM4l/WbZl2RNUGvCvxsuwWH4BlTImQL4JzdKUWj+IJ1
	 5so2bsT7GFl3BncYBLJf2bE0w5k5ZyxbS/fkDoL5/4WPXsg3/OJUFrIiGpfl7zgeXi
	 aGOEmRy/Yg5lA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 14:16:05 +0100
Message-Id: <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Cc: "Alice Ryhl" <aliceryhl@google.com>, <rafael@kernel.org>,
 <ojeda@kernel.org>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh>
In-Reply-To: <2026020642-consent-showman-25a8@gregkh>

On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
> That's fine, because the rust driver core code should also be built into
> the kernel, not as a module, right?

Yes, but the Rust compiler may still choose to put some of the core code in=
to
the module.

Especially with generic types and functions the Rust compiler may move some=
 the
generated code for a certain type instance into the module that instanciate=
s the
type.

For instance, even though rust/kernel/devres.rs is *always* built-in, we ge=
t the
following error when devres_node_init() is not exported when the users of t=
his
built-in code are built as module.

	ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.ko] undefined!
	ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.ko] undefined!
	ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/nova_core.ko] un=
defined!
	ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko] undefined!
	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_pci.ko] undef=
ined!
	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_auxiliary.ko]=
 undefined!
	make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1

However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at a=
ll.
Hence, we could do something like in [1] instead. I don't know if there are
other options that may be better though.

[1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/
