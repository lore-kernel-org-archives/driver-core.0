Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630675;
	b=a2GGRfWf2REhOhbXnzGJumVccXUhyRJhPt4y+KMjBgcqkHX4VCa39lTSBAh3oI0KVvsi
	 sf4OM4MhfSshRCNiC8A5Gbz9W9VUozp4rzyZ1kiXq8YXmDxMDnqAw1HdVOx5cyDvHUdkb
	 tb4a2ZbkXcSIzTn0JrqaYsp4wzwg4bWn8cP1ueNdpjeK6bf32f6+97DB2kea94HzysoWD
	 8prpeI1DCe3aOLbdJhb34f6Un19JidGRxGqI/PnYcl6UJMeCYg0Z0PyFa7i5lLBBImFWc
	 1aNvYqrwZOH08qrznsyKxkGUi6hnupoEzTiJ+GgVAPqIeUI2f6t6rCHvQtwl2aVgypQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YHLhVtA0M0YnoXZFl+g5SRgT14ajH+S/lGw2ZTmdV94=;
	b=BySWlhMBoxMDq2VaRFJ0W0/p9UUc1ccmJsm6SkyzpTDLQAh2KGVIurmwneBD11h5MWB2
	 zHRp6dAIhAsDiR6WzMmGqlCWEkRvq5NWWaYc49gdD5m8VujorMcZ8ZxfJivJA35rKX3Uw
	 qFrkufpGiWTLSMkFxvmTwD3l1nxlWnfT3wbAH740bDZBj0Vzx+J8FKtX4DRmG9MkufjnH
	 m+PoMzT4+dg/Yoddc+/m7XJuHyb9ORvHJr+4RmwaJQzzCnTIuZdUuyHKMhkpy/XU+v16C
	 TTIv8Oxp7WsOw6Y3RS4stZvDppHPND7ytFaLpHMNlt3n4ykiRZyNv5t8q+sMWBoTyog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=McTAkLoY;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2743E606A327
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 18:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2743E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=McTAkLoY
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49953abe51fso43463775e9.1
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 10:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630673; x=1796235473; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHLhVtA0M0YnoXZFl+g5SRgT14ajH+S/lGw2ZTmdV94=;
        b=McTAkLoYqd/c7yNwnxPSBL4WqpEhXxVjloZ/c3520rbYRNZZ4NytoiAVtA7V0gfTXw
         T04fyo5O5wcV6fxEGoQeIOOtObyP5VTny2AoAUUKoAXDqNSIMZkPYVZtieXYwefBFq/d
         45nqPY+rWROesDf1EJAPYl5HWuBUV8B7o6pIvkiJxbQY77anbEoBiCOcgWQ+u50XfhKB
         zKSyPo4dzIVmopf2BKy9QEGSgRsCBp1IiWXzvcg4NoH8ztuxd4vuR8xum7V6JdBG5Ybl
         I3FH1KgubaTvPNm4hHqhEJR1Z0yxRuzy3qhFKIShPe0GD78UaOv1UQqC/21YQYRBVCuB
         rlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630673; x=1796235473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHLhVtA0M0YnoXZFl+g5SRgT14ajH+S/lGw2ZTmdV94=;
        b=k4HwpVq2VEeyH6itymR4N+HQpn4t65gnECm5jyJb2cWp8KYpYL79bDq1dmKbaD9NLL
         ste9pWDS1zcjDW51K5ApBDLskB6n+gfoeoxnPgTFb8e7xGzdU3yGdxPXPDEvS6j/Q5AL
         ERDV/KYhJHBZ2od/HwAF0YEPUkMtM7039FRVfQyjZNPXwucxK8t5q9sxq6SB8Et4A9xx
         gZ7crOABFP8B6JXWiNZOqqVAgwLU4TkoPQsW4Eys+0k6LMWgj/81lyuALTjE8wIvQlIx
         /c5UP5+EZIp2UaxYT7FgoAUc0GoayAxOZtK5bWc9xhhFsNl/97bMjuMKhe+mlJ2IDWgl
         aMPg==
X-Forwarded-Encrypted: i=1; AL+hErG4+jKC4Y4G2ZvFsmUCpgLQR7noNbSF4c2iYV+wTZvZ3Uz/yzzD30Nly2c/YAPtoFXXMVMCNnKC45w+OQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z81BTXgDlRV6phi+j3kRwBCA+Mn7jIKGUDgca8GDVdNFdJrIiks
	VubMiSJTAj+0VNdwtJnmpNO3cInN/V2kl+YeYA+sIIUeJLpwzDSAY5CbT4fn1WhR3CDk4je2tHW
	c7J4EANRIJXDulzqjgA==
X-Received: from wmbz25.prod.google.com ([2002:a05:600c:c099:b0:4a1:e676:5ad4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb88826921mr365854635e9.5.1795630673419;
 Wed, 25 Nov 2026 10:17:53 -0800 (PST)
Date: Wed, 25 Nov 2026 18:17:52 +0000
In-Reply-To: <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-5-707c68994940@google.com> <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125181752.2027207-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static
 work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2026 at 06:44:05AM -1000, Tejun Heo wrote:
> Hello, Alice.
> 
> On Thu, Nov 19, 2026 at 02:12:46PM +0000, Alice Ryhl wrote:
> > Because the cancellation guarantee only holds if the destructor runs
> > before the bound Queue or any lifetime in T expires, ScopedWork::new()
> > (and thus new_scoped_work!) is unsafe and requires that the resulting
> > value is never forgotten and is dropped before 'wq or T's lifetimes end.
> 
> I'm no Rust expert, so maybe this is me thinking too much in C, but
> requiring the compiler to understand and enforce that a workqueue outlives
> its scoped work items doesn't seem very convenient to use. Wouldn't it be
> easier to package e.g. a percpu refcnt with the workqueue, have each scoped
> work item hold a reference from creation to destruction, and make
> destroy_workqueue() keep draining until the count reaches zero?

What I'd say is that this isn't the only way to spawn work on the
workqueue. This utility is intended for use-cases where it's convenient
to do it like that (e.g. because the queue is defined before the work
item in the same struct). We already have another way of spawning work
that uses different ownership rules (e.g. self-freeing work) and that
mechanism would not go through ScopedWork.

Alice
