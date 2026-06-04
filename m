Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E02425CF7
	for <driver-core@lists.linux.dev>; Thu,  4 Jun 2026 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573773; cv=none; b=HTS1lh0gJTh5XwVQJvC7Mfx9OTmntwMPNUNfm0wgER4O6DI+tyEZvs9SIM7MMtg3+5Hi8vrnPo53ZJHmppfRwGAU2/1DqpcvlEBQnD/AajqXrfIDwAwOx12zTQB1qUFounPeOhO6a2nC6Wsx9gUc7aRf62Ljv8NAXeVyx4iduQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573773; c=relaxed/simple;
	bh=eOJ28jQK0dMXwHg78GmVtabOBwJqVXIChB/pOF0BUW8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sl/1F0BPK5ZVUSvne8Q7zEbuiPAUjVnjF81Q9MjjfCZJR9k2ok5MQdILBYIQeNt3iow9ggoqpybvIylDWMOsfSup79szVGvpFwy6TLHaN2PavbR+L47rhmFtuvK6FrUquLwDDvexYg51YDxEv/AknwrzJP42qC0Vi3J1UfrrCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C/3mziaw; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C/3mziaw"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490b8adf8b8so6713665e9.0
        for <driver-core@lists.linux.dev>; Thu, 04 Jun 2026 04:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780573770; x=1781178570; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IDsisrKoiSBYw8b45wvLvNabX1p1YR55LCjFQrLjodw=;
        b=C/3mziawT1p1bHGyOlvzT0raL439USK9s5idrExvmFj9DdNKK+6O9uTGFM6r0jONRP
         uJDgYLh2ptk5eqyK6/97j9jnxqBnpihw457Pm6K+t0OMfA0Hka3qssdwZoie5r5tYBw6
         kOl9TghRJ2j1GRzyTiGL3c+4za/APVwuAr6zaG0ZyFHvggqNKH2i+w2I8tzvbNcZncG0
         jP752VO5W2T6sekLTUx3MQWq6YGWC+/OFLOnlTUTlE0Ra8cJiCvxkmpRW5fpl7VBIOEm
         8U/25O4IzHzAsgbfGw1ACcBzmnjCe0JinptzFxKf4Tw8pz7VZRNYX8CXVxx8eZmOsYTk
         IQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573770; x=1781178570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDsisrKoiSBYw8b45wvLvNabX1p1YR55LCjFQrLjodw=;
        b=V/C4qfy305aI3kCZuAR+V6E6FYQqW87JQB9Tb9EKknf7saehrupFySGxYTXJ7eyUT1
         Rql1TiqAoQIEVjdFUQi3+FxA19Z+lJVxN5gBoFllNnfz94XsFJazBsK9lyu+TzCr/HOr
         JG72MIrs19NOQo/K+5onWC+RIAaKaw++rpMeQO2loZE7XmfqbJk7zVeJF6PhRySG2JDw
         KflbmTNC1YNmCpQ7ZgT6IiXDo618htX9BOzxQspCbS0BUMk/H9a3YIgRwcxlb/VfFlPO
         nSA+pMi2pWedAupx/BPUseHSNlE0Lf5x6nFoMZZzyutO9W2jRDNtkd4jKuJ5I/ac0heb
         vBaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tM/K03deo0i2/5KgcJm6FzxbOSeg0hnOLb4JcmuWvTyjsNlgFZ1Z6s4NmBroJaM85s8THiuQgX3vaDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqgawYkiGwWu1UVczCbHAC9WX18RYKnY4b/We5al/p8amt6Kxg
	bLbi+Na+spNzVeNpbrXQbrUcd133LoI617TuIPebX8QTr+v9iO8/nH6v6zZzfFGZHWykXSNM++w
	/qebKviwUWM20z4Q30w==
X-Received: from wmbc9.prod.google.com ([2002:a7b:c009:0:b0:48a:7f8c:a95a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d86:b0:490:6869:46c3 with SMTP id 5b1f17b1804b1-490b5fe79f8mr132548195e9.30.1780573770264;
 Thu, 04 Jun 2026 04:49:30 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:49:29 +0000
In-Reply-To: <20260603195210.693856-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260603195210.693856-1-lyude@redhat.com> <20260603195210.693856-2-lyude@redhat.com>
Message-ID: <aiFmSUi0ZHVIj5Q1@google.com>
Subject: Re: [PATCH v17 1/6] rust: drm: gem: shmem: Fix Default implementation
 for ObjectConfig
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 03, 2026 at 03:42:30PM -0400, Lyude Paul wrote:
> I completely forgot when coming up with this type that #[derive(Default)]
> only works if all generics mentioned in the type implement Default (and T
> usually doesn't). This being said: We don't use `T` for anything besides
> using it for a reference type, so whether or not it implements `Default`
> shouldn't actually need to matter.
> 
> So, fix this by just manually implementing Default instead of deriving it.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

This one is so simple I went ahead and applied it to drm-rust-next right
away.

Alice
