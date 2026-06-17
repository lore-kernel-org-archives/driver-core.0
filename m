Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA28A3E958C
	for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696196; cv=none; b=ickr331Zv78pFkCXc0RPMqZlPPBdkBKC9vZ67mqMsFd+uGpT0sc6aDu2XsxlK9eIIqXw+dpOwitDyPjh1iwmFRmOeszF2OureYWJzYQRbrD2G9sbdmvFpS5clqpn5QLZfhns2e8QH8xnJMgrK2ESSOwG7bSoBm1BWrviqeI2yS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696196; c=relaxed/simple;
	bh=rOcDjKNM7agwOLTLfbY1xAQ9bt9q2fdtORORxk4X9p0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=omnUS2y/y1KiVx45XiASDiP+6DrhDwijFNFY43BzjBL4che5J2s7LX5zSBLqwEAVP/y+OK+7/WYG0Liq1ZzxGtwh09x7UMjwxz0vwXu3Je/NlO7uyhWJtrotTTxQMRS0168XwdISeiLmzKdNCF9Fqj8kGVFPU5ur+I30ikAXZLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RePkcFCl; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RePkcFCl"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6959dedafe3so153848a12.1
        for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781696193; x=1782300993; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYicJoYFI4w4qF8sCnn+jRXzXN1/GRmTZzaGc7Ox2u4=;
        b=RePkcFClQT2stmTC5hRFvxYT2dmbucpSPIYqPXdZKh9ir8P0HZxsK3ayl0+oBF2mmB
         JjOPVNxXFWsA3JSQOQH3NYMbBSAc4oHP7yneZjEZZa+LKMiEl6NDAuDB/EFhuwqRVwjC
         URQIIOGco7YDwFBbWhhEBgUfN6AoAPe/dskwK/2tYwE0VzigEBS4M2KRvqS5zYFXCnrT
         2DH0pQLA6q9zdJFRmvpDtS80bF8Opf0jkp/2PtUEUMwEd3SeLnopISxUn7Qoye6THARJ
         /CrLypidGVvC/CFcLwxLG2LpFfnrD67wPUpy0HC+zN7k6C/XhLZSgk+vMGNC+uPja+vO
         P1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696193; x=1782300993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYicJoYFI4w4qF8sCnn+jRXzXN1/GRmTZzaGc7Ox2u4=;
        b=mdZR8HGSBg+SrJe75/U4U9hXedcTUvX51Mm2EjkDZvB35xZchguPP+Bvo11bQqud4c
         8DFNjQLfCzvycjja0rdxHgb8XZVO6r1b8Fpq2Eyg6yf8KW+7mynNxSA5A9P7P51FSpl/
         /ie7f11Lg0QHFL05lKuhxr1tc9r3TIlV/8pCaC35wCrwVMOm8ZoTMUCNecbfBYEmBJeh
         wg7GHEv1kQVpil0xedHG/x5MqY7MyiIPVfMJnlI8jPfcxQ1cKqiUz4lGAiFZz7hjs7Xg
         zHnEy95hISbmRoyWsa9r6tInugHWnIbKOH447wAdL1tOE0YXD/ZBVJMpTngnWweRfuR6
         3PGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8I43sw9LQejRfYNqd0F7xqh6HQXosCyy9iCwjYH5qaNLSFBMN96ivkj+hJYGfvYzCAOW1GGGUE5DrMuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzibLzMSw+MTEnnYoyAjUb+eGMO2IUKp24qF33OhCpsu0yrYnaT
	TSz/ze0ZFF4zOl5/3GpbfTg6tp0TUN2PfktR314Y4gwm1OyZxxnydhJoD0+iNdhs7XWvC1jx8Yb
	KqWp/6WHWBrD8jfFBUg==
X-Received: from edea23.prod.google.com ([2002:a05:6402:a197:b0:695:72e1:a5a0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a50:cbc1:0:b0:68f:9fd9:435a with SMTP id 4fb4d7f45d1cf-69554cac360mr960260a12.17.1781696192851;
 Wed, 17 Jun 2026 04:36:32 -0700 (PDT)
Date: Wed, 17 Jun 2026 11:36:31 +0000
In-Reply-To: <20260604-unique-ref-v17-5-7b4c3d2930b9@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org> <20260604-unique-ref-v17-5-7b4c3d2930b9@kernel.org>
Message-ID: <ajKGv5ioLSassmND@google.com>
Subject: Re: [PATCH v17 05/10] rust: page: convert to `Ownable`
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
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 04, 2026 at 10:11:17PM +0200, Andreas Hindborg wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> This allows Page references to be returned as borrowed references,
> without necessarily owning the struct page.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> [ Andreas: Fix formatting and add a safety comment. ]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/page.rs | 38 +++++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 3bdcee0e16a8..844c75e54134 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -10,6 +10,11 @@
>      bindings,
>      error::code::*,
>      error::Result,
> +    types::{
> +        Opaque,
> +        Ownable,
> +        Owned, //
> +    },
>      uaccess::UserSliceReader, //
>  };
>  use core::{
> @@ -105,7 +110,7 @@ pub const fn page_align(addr: usize) -> Option<usize> {
>  ///
>  /// [`VBox`]: kernel::alloc::VBox
>  /// [`Vmalloc`]: kernel::alloc::allocator::Vmalloc
> -pub struct BorrowedPage<'a>(ManuallyDrop<Page>, PhantomData<&'a Page>);
> +pub struct BorrowedPage<'a>(ManuallyDrop<NonNull<Page>>, PhantomData<&'a Page>);

BorrowedPage<'a> is no longer needed because it's just &Page.

Alice
