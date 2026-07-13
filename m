Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA3639EF2B
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930605; cv=none; b=GgXfaP08gJa/7VpwCWVaf/uBV1yg42ELwR0qRyKJ85xTjlgDSrOo1J9rRg9SC1gBJoZKQ8fo3Ef8GvxFtsSe8+JHKhJmWEi/JYqnkH5bLC8KsRRTjp0pCun4R9/T+I2BFdL7vS1WiCASqf1fdq2NMXnNicHYWwWYXXfUxopUhJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930605; c=relaxed/simple;
	bh=GT0aA4Hs0v+V8d/oRMBUp9nulXdAlA703EAOOYn8eTY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qk8Ti9Wn8v31shlsTBt8T2bgmwxaXS193jl9oMy7oGed1E5s+ZCor8LAr6doClQbrO7h7zDDf1YK10nUtlZ11Fx7XIpzMW4vzVJO2pvMaE2mXnYsnGtOQA48O4dxREqDfwmpzgXm4BvZ2++w6ZpGjqjVEmcM+h2d0s7Cn9I77rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SeZeHtuI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SeZeHtuI"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-492488f8583so43118315e9.2
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 01:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783930602; x=1784535402; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gq7CBsOOfXmcQmDqY44O8+unztSFjXGh8YCUzgZnM2I=;
        b=SeZeHtuIGNpwlylkvfgwfI5aAR+xYMtX5p0FxmcJYuQBeZkqqMWa6kT3OZ1Udlserq
         mgknig337uYvcwkmI1ymndjbYLzIdva4MtKwocDRHlZPfP3ohf4jaNm1Ev2NqzTSJKCN
         AaVo6ostolvmWPAuZQhBYLUv3GFoRq3IzBPq7rIGzuQsAbpNoVnfTWDQRKLpcdfsIgMl
         1dUyLfpsMBnwbKoQut+QiVPpbfTPjv7GjTsIN9OYIqXdglPGWAyv9mNRR0SyzUoZUyLK
         84aMkXGzxzBznfEkWAEXcS4GinkZCEKxEQSlU2jbQh0qyz0e9MpDWbmyT3YCP9ZSf93p
         Dxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930602; x=1784535402;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gq7CBsOOfXmcQmDqY44O8+unztSFjXGh8YCUzgZnM2I=;
        b=ZCvxRRNkRENpg+yTx026239BMx6lYuE8ePhr+QHGJPvAX3Diz3+IGCnJAWmccXccF2
         oR/EcFl/F/ivg05a0xN+PaHEcIIF9z2KeU6lpqFZEJliq7XEDuSiVz6ccCEI68Ju/Nib
         wvscPgNQPGD6ZaQZVgJ4riMUBB7xCTxGmzHQQyRIhSnNS90rJQZCVVKwhPDxloy9s7R+
         XQxB1fu8lgpsAX1bP8WssANQG0yC879WSoZTVjiACyJkPQFBNLYMGCFusKfWXPtZtt9o
         qimazroJmiIGgPCk/oZSGXF8lzuxijSvwrxXYKE9KqsUfjHAAlx6ENLbu0wTIrxXhgqM
         IAVw==
X-Forwarded-Encrypted: i=1; AHgh+Rpr2ijvUf1jYqvuAz9Cc4FnPv7nn/5GHeEUHnSZO5/PkWxicHA4x8nZ1AuBvYcuEVYoVyuz5cZ7l/uEkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEeW9S7l23i6vRJagXsTlpXB0r+vHBqjMpsnRNDMfOw8J/Kbvs
	WFoZYpbr4EEouU35db6znNhkDRcMgRiAWCi7BvYq1fbqHqducgryKUkiKz5ZtfH5S1nFSwXABwk
	baCDsVmqraUqVhODWBg==
X-Received: from wmrn16.prod.google.com ([2002:a05:600c:5010:b0:493:d1b8:3df5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:464a:b0:492:7083:e5a with SMTP id 5b1f17b1804b1-493f882b117mr52089545e9.31.1783930601636;
 Mon, 13 Jul 2026 01:16:41 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:16:40 +0000
In-Reply-To: <20260713-fix-fops-owner-v8-10-2495cfa82d47@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260713-fix-fops-owner-v8-0-2495cfa82d47@linux.dev> <20260713-fix-fops-owner-v8-10-2495cfa82d47@linux.dev>
Message-ID: <alSe6PsvdrSYP_Z0@google.com>
Subject: Re: [PATCH v8 10/10] rust: module: update MAINTAINERS to cover module.rs
From: Alice Ryhl <aliceryhl@google.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 13, 2026 at 02:45:31PM +0800, Alvin Sun wrote:
> Module types now live in `rust/kernel/module.rs` alongside
> `rust/kernel/module_param.rs`. Update the MODULE SUPPORT file pattern
> from `rust/kernel/module_param.rs` to `rust/kernel/module*.rs` so both
> files are covered.
> 
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Assisted-by: opencode:glm-5.2
> Link: https://lore.kernel.org/rust-for-linux/8ea21b29-9baf-4926-a16f-7d21c5a1a1b8@suse.com
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e035a3be797c4..74733de3e41ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17984,7 +17984,7 @@ F:	include/linux/module*.h
>  F:	kernel/module/
>  F:	lib/test_kmod.c
>  F:	lib/tests/module/
> -F:	rust/kernel/module_param.rs
> +F:	rust/kernel/module*.rs
>  F:	rust/macros/module.rs
>  F:	scripts/module*
>  F:	tools/testing/selftests/kmod/

Is there a reason why this is a separate commit from the commit that
introduces rust/kernel/module.rs file?

Alice
