Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8295243E9F5
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 11:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610879; cv=none; b=RusEmZshAmgO3HK2lA2LusM32GTcN7jct7Jhx4fk9DHwp4EmrIrGEnm9WGlCQc+LoPQPAJEzEm0bwwQ2ianCGeG5+mUhUlGlxLA+IwSDEHVPgeNm/Yfv9KYc82J+mbIuZegSDg82fG5olFAx1rngpZE7oAG+/5mGn8ln9M0kHsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610879; c=relaxed/simple;
	bh=/5GyqFufVnT0ephA4mcW12nnDGKZodyXuu8OjccvjII=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OeFut/s2dpZw4X9zIVyY2jPZmZgElmFa8fqAyzxOpOyOqxulfC42PSZptGfsLXiLxMUJMSaCi2JbDPF008NsVU2NamcP1z0z2lUDVIIJDw//PlmYDQziD0v5vfissaErzdUEgEuUQdBPvcAzsErqy6jKVOWfk9rE/h6dxXIC8uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZoXB/B9Y; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZoXB/B9Y"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bef1e83c990so363666466b.1
        for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 04:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781610875; x=1782215675; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fkz/8WHSlc5z8mgSFYgivmaJvolb4fXApnGq7F/IsFs=;
        b=ZoXB/B9Ygg/gNXE8tjt9K3/xFx6v+CC3Q5PcL2P+lMC84l2iftHgPLmGVXqadY+NgD
         QD/DGE9i8bjj6X3gtKbV5OVrv1Acjw0zd2U9FnxmcNWcZk+j6whmc5gBsxVFOIV5EHM9
         1MfW/vTO98wTXJwUGVwBJsitgEeByifOA2yfgkaTM7sca93IQ14kA9pJgSqOva1ZhJpq
         FJPCgzqv8hgk28h0Ci58FSua89cptMIZsLuEuDjNMDz1GvEdM7WbkmO29vm0+TSfEmaU
         jofO5ZBdNEue0w9snA10yskKfeEf+7kL1Shg/BbmE3PDDQRKPzZ5cGEtOK/lSIz3zCUo
         0NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610875; x=1782215675;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fkz/8WHSlc5z8mgSFYgivmaJvolb4fXApnGq7F/IsFs=;
        b=TYMgEjnNixNgFwybi4wfHbVgmRhRK7AatHhBqike4OxmdKlFdUokplR+9x8g7mWdvf
         bG/0qC1SxAN8RCQjUUI89LzVoFpwddUgAA2dJ9B+mZ5iF5raCNve0X87ZMor3pSZO5Ii
         4kZfWLLAqgDw996pf6Zi9E4mv1IRpVze6AlpyvQPuWywDn8atD/dCNk4h4AZykNEFh7h
         Gn65nC5RFGhEE0DhLgUNGt/57poMw3sLYwqYbM4x3Tx0kkgFUjXcSc/Lkw4/VwmpHSc1
         HC0UzIfuHARgHQrFB1S08qPgFwwSAJfpBYjjTJUKg/IHuqY9/xQRuZMb5EIZt7j+/8X9
         T2bg==
X-Forwarded-Encrypted: i=1; AFNElJ9uuHYIz/PENcqQIOIVTlYfToAZayUS3t7vVZS7IUJFmMOJs/GEBf3j+Hfntw+9igOKlAWIwhlWF+OIYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz7tZWQNuCm4fP5+AJ6HzP0oVQUFpq9zIF8EGzuwq+SrJwW0I8
	Z6FklVkvocodfYFZg+5NK6X0NbX2PV3mkl37yPoETxvn7h9oNPvPjAtNK1ahaAIuIDW1a2K+smw
	YoXnB3jo7jtoLv4ze6g==
X-Received: from edrc26.prod.google.com ([2002:aa7:d61a:0:b0:68d:205:9a90])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:35c5:b0:695:865:47cd with SMTP id 4fb4d7f45d1cf-695086ebec3mr1540972a12.7.1781610868582;
 Tue, 16 Jun 2026 04:54:28 -0700 (PDT)
Date: Tue, 16 Jun 2026 11:54:27 +0000
In-Reply-To: <20260604-unique-ref-v17-2-7b4c3d2930b9@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org> <20260604-unique-ref-v17-2-7b4c3d2930b9@kernel.org>
Message-ID: <ajE5c-5gZtJRoadx@google.com>
Subject: Re: [PATCH v17 02/10] rust: types: Add Ownable/Owned types
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Igor Korotin <igor.korotin@linux.dev>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev, 
	Asahi Lina <lina+kernel@asahilina.net>, Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 04, 2026 at 10:11:14PM +0200, Andreas Hindborg wrote:
> From: Asahi Lina <lina+kernel@asahilina.net>
> 
> By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
> (typically C FFI) type that *may* be owned by Rust, but need not be. Unlike
> `AlwaysRefCounted`, this mechanism expects the reference to be unique
> within Rust, and does not allow cloning.
> 
> Conceptually, this is similar to a `KBox<T>`, except that it delegates
> resource management to the `T` instead of using a generic allocator.
> 
> [ om:
>   - Split code into separate file and `pub use` it from types.rs.
>   - Make from_raw() and into_raw() public.
>   - Remove OwnableMut, and make DerefMut dependent on Unpin instead.
>   - Usage example/doctest for Ownable/Owned.
>   - Fixes to documentation and commit message.
> ]
> 
> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Co-developed-by: Oliver Mangold <oliver.mangold@pm.me>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> [ Andreas: Updated documentation, examples, and formatting. Change safety
>   requirements, safety comments. Use a reference for `release`. ]
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Overall looks good to me, but two nits below. With them fixed:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +pub trait Ownable {
> +    /// Tear down this `Ownable`.
> +    ///
> +    /// Implementers of `Ownable` can use this function to clean up the use of `Self`. This can
> +    /// include freeing the underlying object.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that the caller has exclusive ownership of `T`, and this ownership can
> +    /// be transferred to the `release` method.
> +    unsafe fn release(&mut self);

I'd make this take a raw pointer because the pointer can be freed during
the execution of release(), which references don't allow.

> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 4329d3c2c2e5..4aec7b699269 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -11,6 +11,17 @@
>  };
>  use pin_init::{PinInit, Wrapper, Zeroable};
>  
> +pub use crate::{
> +    owned::{
> +        Ownable,
> +        Owned, //
> +    },
> +    sync::aref::{
> +        ARef,
> +        AlwaysRefCounted, //
> +    }, //
> +};

We removed the types::ARef re-export, so you shouldn't add it back.

Alice
