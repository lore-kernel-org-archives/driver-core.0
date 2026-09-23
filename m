Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2406740926E
	for <driver-core@lists.linux.dev>; Wed, 23 Sep 2026 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153407; cv=none; b=PRclx0Z4JJzho1BzBIS027Sq+4e0XGgs0/g+O3pbf7rFPQo0TiADB2zbc8HIapMLZNJ3H5nRT92IXZST0ey66CK7X1p1vY4LxPkyhLDuoJc92hLHTq1auQ9lFurlaeO8NX/DvXe97cjcPsvthuXs6Ye6aOEPgbDT35nzawE0r0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153407; c=relaxed/simple;
	bh=2XHh08DSWyQ2Lla9nNvrGWSyFGkMaNolE/nGXFIv2Do=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gdLeUcKjxA7tDbzKFfqxoQnD4P+vtKZeLl21xejiRS90ABhWofrX76CUbXCEegxj9qkNS2gWOXgeAWMmzN9ycdC6z2T9yMozd0SGqNUcsEDlV0ESkrnqDYSuN8pMWZ5ZwCGWRZM7COUxHDgG57zAPXnKB9WpI0ACAWikSMeqS8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NBdmsw94; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NBdmsw94"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a615ab0c06so833625a12.2
        for <driver-core@lists.linux.dev>; Wed, 23 Sep 2026 01:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790153404; x=1790758204; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/V4JJZVNuiDLsMZrmNpJjlcNEhUviMYM4KAzEYYNoVE=;
        b=NBdmsw94tSZU2S4dooMlsMZ3uzgJ3/EZcO8jYdyVb7qFrxc9VPMX9NHOxEsJ5sHaJe
         zpLGf5jWYVEvovLnwbjG1aX2AJrcOhutGLNpoXoGlaBk4fiMM+fQ5WCHObq+CsRondqU
         z5o4lqIwNB7QwtNLHd9fTLE9HAJehZn1NANkXIGFF+51nXouUnuuWs6+ftZBkIIYcqjZ
         gNSCZR0omHL6gxMpu6pdEKoWpVxh2ButNIOVeHHsiH5Yp2vZ5d6FXGNr9jEk6GBTj8aI
         rfk0invGVrd5SJGei47adZO3EP9FeSQIf+nPpsLnM7RTfRWxaIGZ+Q67BnaM3iBv+E3Q
         xPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153404; x=1790758204;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/V4JJZVNuiDLsMZrmNpJjlcNEhUviMYM4KAzEYYNoVE=;
        b=o25/+T6EbabF09iw+E/V/LHbw/st6FVIq5VLVlUqu4VKlZkdjGhwH09E9s0nmhG1DN
         seprGgJ6sW5TKfYU+HIFSa5yRWh7ylYS158f5VlIZGyy0xQ5BSHoyd6oMiCJhm+hwpUS
         38OsRe1TwGxtZk0ITdVMlAo69ym710NKLlGmi5jB8W7uaBGNTEfD81WSGB3L5DIdVqxm
         ufZoiqX2PEQ1hIQtVf23RcPNkL8AzmILaH0oUcvTxL+cmzxYMLX8pA2ZAooRO5v5L+dM
         c6k/zUaSERls+R2d6RxecL+bd6bYRY4Q52m1562jWwqGpJYtZlNDJJr15rHUFwioFHqx
         yDzA==
X-Forwarded-Encrypted: i=1; AKwUvBzke+jUFimVczYaCu4hyP95HOvJ5KWGacpMio2a1bJdHdeKgFZQ6n0I9vbxz/e1/XNBMrDCaH36NpVxTQ==@lists.linux.dev
X-Gm-Message-State: AFuF++k0jZqaFKemSgRFTJTS8QnvFIomt/Z6ehNsBqs/WYEIkM2EnoMn
	ZepJt+zPv56yD8jwsMRB+lV1+pieBRb/LirnwGwaoGbuVLjGdTRCn/bI1cn5yIvxihX/Oc0xsD2
	DAKeow8v7sGkBFxqrwg==
X-Received: from edxs21.prod.google.com ([2002:a05:6402:1655:b0:6a6:6326:bdd8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a0cc:b0:6aa:734b:1a1f with SMTP id 4fb4d7f45d1cf-6aab3b5bb34mr1568561a12.25.1790153404051;
 Wed, 23 Sep 2026 01:50:04 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:50:02 +0000
In-Reply-To: <20260915-tyr-interfaces-v1-9-5d28f1f75aca@collabora.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260915-tyr-interfaces-v1-0-5d28f1f75aca@collabora.com> <20260915-tyr-interfaces-v1-9-5d28f1f75aca@collabora.com>
Message-ID: <arOSuojQNLcO6m8r@google.com>
Subject: Re: [PATCH 9/9] drm/tyr: wait for global interface readiness
From: Alice Ryhl <aliceryhl@google.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, kernel@collabora.com, 
	Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 15, 2026 at 12:57:42PM +0200, Laura Nao wrote:
>          io.write_reg(MCU_CONTROL::zeroed().with_req(McuControlMode::Auto));
>  
>          if let Err(e) = poll::read_poll_timeout(
> -            || Ok((io.read(MCU_STATUS), io.read(JOB_IRQ_RAWSTAT))),
> -            |(mcu_status, irq_rawstat)| {
> -                mcu_status.value() == McuStatus::Enabled && irq_rawstat.glb()
> -            },
> +            || Ok(io.read(MCU_STATUS)),
> +            |status| status.value() == McuStatus::Enabled,
>              time::Delta::from_millis(1),
>              time::Delta::from_millis(100),
>          ) {

Does the io.write_reg(JOB_IRQ_CLEAR::zeroed().with_glb(true)) line after
this read_poll_timeout() also need to be removed?

Alice
