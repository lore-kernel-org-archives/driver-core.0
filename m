Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5792DB7BA
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770393254; cv=none; b=seoIWVYvcVnwlgrTE+AL7Gu5Q9FfhsFP8rwBlfG0IdYpZcs2N9ZHkGM8CVfJbqtQTUEKGy63ADvXUK5KwZ8MNovNpWISJ8hdv8puhgG27P7/2mSEJGQxZlofOe0ErBvA9hgitXHWjt7ePjG/kZ6bppFNHBRRSsImXUZq0vQ51yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770393254; c=relaxed/simple;
	bh=CYS4rw1bXYyrm8MMXbVB/DRHjhCbVA4/2BprubkQJkQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wem4zBMq3lYPMDwZVCIWYFbfjJ/n4FFI5sVwFdWfZii+narLAH4iDGGNPVZ1D5hvn0K46ZGCd35p1QE4NdeJjCDpBDRiaAoRV3N/HjaPWU2n2IP0b6gocxCWfr4VDLLwMLpu2qWsSj8envHkC8b23GlM8xUkcKqJp8ri/mJDZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TSdhZMLj; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TSdhZMLj"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4806cfffca6so30278395e9.2
        for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 07:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770393252; x=1770998052; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hal6PjPvOpNNha6OrWCmkRD5rZzaVkVcwVhH0GcBRys=;
        b=TSdhZMLjBSAl7b8XHqTREN3VuuGBuEi6cwUuYfnWaBYCPI3Vmk30eveSFhI/XDySaj
         SAwtKMa1IhQNSv8sxH+CEiTbWfcZVKdLwX4YFioDWFVqreuSPY2uM0BlbmK5lGBP+ZEF
         PWxh7xV8DKAo5Bru/sGMdX+Yw9P3LeYrBZUm9JsPq9U7P7PH+YhAWWCyo0uQsyu3yNXt
         YVQ1tovsrB3Pu/Me9tiYRwIk71+WoJHBoyGoHQJ5tfFej6wYDsWQfboPCwC6Dp6Stx9L
         A8mxrhoYJKl35kJvFnkotAhbsuEtvmLXMupwnChooNWBeKlnA2jZzszyYZAoX3xuolFP
         1RCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770393252; x=1770998052;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hal6PjPvOpNNha6OrWCmkRD5rZzaVkVcwVhH0GcBRys=;
        b=lAs7qGYaFRsf4j1xxgBvfDtVsPASgTMHIGRWQXXQI/xjqSsYSOBYeOOmQQ6n3Pi/q0
         /B6rRODDy9x4VdXXO0oALQVvv9573cBHDebYuh6JxpCYtcdmt/FkUagaKzpXpOUpgRhi
         IFSirzMQpYF94i5fCeaJca6CbbSsO3uEDMEOEhsE6XunnvGtAttN+V03ahAHTSCR9p7g
         /YfvNcI49pA35x1F+To9R6HDIHLPMKf/Z27HZJ6Dw5DjC6pZQz2V4YqEPRxQ36UzW+S9
         xL0ajghIShe9alwcRtwTNJCTZ+7x6KEwy7YJ9utGvNBetyqk8xFuRXWQkgsxx9alcrvS
         HE/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3IlI9dRYdtVoidmU3rUTxTHO+qLjfwcpyWznoQNsiaPh/t2tAHOwmFEYAItUf38lVH7a5eECoE0JyAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgoAeQ+v3OvBPX7OG/128EiuydE+gsdnjykGPWYjQxT/uVi5Qn
	TlP3wYxD9HOlTlPLRvZOJ2OPCEAu9xlWwjWcFT6jdUJFlq8Wo0P00fsrdKek3ZlKNVE+LtaGIwN
	O83ALuIA+T86Eu4c3hQ==
X-Received: from wmkz20.prod.google.com ([2002:a7b:c7d4:0:b0:480:6c79:b533])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d96:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-4832021eaa9mr50165555e9.25.1770393252414;
 Fri, 06 Feb 2026 07:54:12 -0800 (PST)
Date: Fri, 6 Feb 2026 15:54:11 +0000
In-Reply-To: <20260205222529.91465-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260205222529.91465-1-dakr@kernel.org>
Message-ID: <aYYOoyD8QAHEsWTp@google.com>
Subject: Re: [PATCH] rust: devres: fix race condition due to nesting
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, 
	Markus Probst <markus.probst@posteo.de>
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 05, 2026 at 11:25:15PM +0100, Danilo Krummrich wrote:
> Commit f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc") did
> attempt to optimize away the internal reference count of Devres.
> 
> However, without an internal reference count, we can't support cases
> where Devres is indirectly nested, resulting into a deadlock.
> 
> Such indirect nesting easily happens in the following way:
> 
> A registration object (which is guarded by devres) hold a reference
> count of an object that holds a device resource guarded by devres
> itself.
> 
> For instance a drm::Registration holds a reference of a drm::Device. The
> drm::Device itself holds a device resource in its private data.
> 
> When the drm::Registration is dropped by devres, and it happens that it
> did hold the last reference count of the drm::Device, it also drops the
> device resource, which is guarded by devres itself.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        // Take additional reference count for `devm_add_action()`.
> +        core::mem::forget(data.clone());

I'd feel better if you called .clone() prior to devm_add_action(). That
way, even if devm somehow runs the callback before we get to this call
to clone, the refcount has already been incremented.

I know it's not really a problem because of the &Device<Bound> argument.

Alice
