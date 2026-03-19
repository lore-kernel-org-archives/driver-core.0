Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189633ACF0B
	for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930803; cv=none; b=eEthXEzP0y3aIRbJbLNcnlU/T8QWwIboiAGRmp6yskutF2bsUwQEYlpi4fl4gjGXHmuVypRRSWPe/nTpHyvPfj/4+abqLUH71BK4PZ79cvSYV18vE3rdPU21iWRuboXPBW0678HbVjW772FeiucVNIJRbcUGAFFMn3Av+b2GplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930803; c=relaxed/simple;
	bh=CUqfhEJRi2PChR2DmP6wNUXoON4jGbn9sMb3OgUY2KA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rAf10DGhIMDBctKzAMcAHBf0dHIjv0rQ/vTa9fK1KkCbddIx3oCBgthDZxoQmcGm6VxQzS5BwN/V6kE3siTlpZQ9cJg+D9pvgWFH5FPXYSAukt5xD+syxIVcpgx6Ps5l85duaZUOKPZQDw5c9htk/XCq/vt5+QGRZMyp/+7qm3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JVVs6Ye0; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JVVs6Ye0"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8fa5744b82so125155966b.3
        for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773930800; x=1774535600; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPdU0RGKwneFH7OF6wzVXdtsY6BXzcqmiGE7v4NtV4M=;
        b=JVVs6Ye0ypY0WwkvTh1Yvb91iPLtuyibN9335xfOQ3tWJmHJPXcKMSkz8vrA5w45oH
         gZ1onx7mFRFnfILR2iBJdq3vFS8/kfoG/kBpox34TFhuuITqeZ1AOcyzGxme0PT+5TOB
         cqHxyeGlxx1LkXQiaRFPymZwqDv3qllgyiOYH95LT28PXxRcXKof0VPg0suV5pB5LPey
         HIzomVQLz8Wm03cyO9AtdCJ01N2ZJA0skaEkyL5rCzpwg2ZIfmCfI4p2H2t1Cneg+xd1
         uT8ZkxrAaJXRM3W0EyNY13Vg2ROF1NzcVp/dIsSRoR6fMsenJGznzCXEX69ctsgm5LuA
         +m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930800; x=1774535600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WPdU0RGKwneFH7OF6wzVXdtsY6BXzcqmiGE7v4NtV4M=;
        b=KMaWgsMpZ9uR7Zb7jDouK0dl/wWIrNwqLmxo00c3PIq1nwxa+q7IJHWehDyJrLDSx4
         dF5sOt71VJ1DTD6M9IiSTSIoxCZNv5HZwJomu6nlRHkvDYc+etsNX+l5wAIeMQZGKU4v
         E0FQJUaD+D46y6M2qklrT9kPH8jek/mfRhkfJL8SXhTdIOP9Ieyz6FF9TW8IREnLz2m1
         miuZkGTF8Jc1keze7KHl4nq0Ppg1za5HyoW0Z8c57l+c6mkRlUA3bD0qPJ9OTjNLBmFo
         I9OU7Zjg96lK/M6XvrxODe5P+o6e0NHst8nKc1cNO3TaEZa02YKVa1/atC6ui0lYHPo9
         oMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIrgJkCX1tFpj4BaqAkJ1LsR9TaKeLikRylRxqfzgnj2tW72RlamiZddmB/KDW4avmH9zwwU1xukHYqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJKCJYXW05Cd95oKDuSBvLi9VrewA+knwrrh7ZcIr9e6I4YIXt
	02sYX3WZ7qHbxsv3XTMa0ZwqHJYUZpnLz09nzFEqNuBcA6S4DmvodgJvFKJmQGUwffeFItBfPfu
	moCJo5L8Qdi4evON7og==
X-Received: from ejcdo3.prod.google.com ([2002:a17:906:c103:b0:b97:ccc1:b250])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:1d01:b0:b97:b9d5:4ae4 with SMTP id a640c23a62f3a-b97f48c3840mr428088066b.20.1773930800216;
 Thu, 19 Mar 2026 07:33:20 -0700 (PDT)
Date: Thu, 19 Mar 2026 14:33:19 +0000
In-Reply-To: <20260319121653.2975748-5-gary@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-5-gary@kernel.org>
Message-ID: <abwJL2OTFzSFdVxt@google.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Tamir Duberstein <tamird@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 19, 2026 at 12:16:48PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Given the macro scoping rules, all macros are rendered 3 times, in the
> module, in the top-level of kernel crate, and in the prelude.
> 
> Add `#[doc(no_inline)]` to the prelude so it just shows up as re-export.
> Add `#[doc(hidden)]` to the macro definition and `#[doc(inline)]` to the
> re-export inside `build_assert` module so the top-level items are hidden.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
