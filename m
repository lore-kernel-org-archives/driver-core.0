Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EFD394790
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 09:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540366; cv=none; b=UeIrYO1QYF+D7lXopndUoLknnGrYRv8VMatOtYV1VCFH2rTytgUgLnWKi5LUnHyXsvukYJGNwnTatRiAq88kJLhN3hRgBs89afFOspS/lZYzzuZsOGPLPfGDvasK4GTwLYODc7x9RySt4DE6rkTYiAZu18pdbhf6SItSeRKfrys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540366; c=relaxed/simple;
	bh=o3bO4FAjuxVK0962UiL8rrguCj8OrcINAutnD/Afj4c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qLaNW1UT8MEeXda9YtGGOBJN96M9kguhl1yB7QLYe1tTlpwjK+f1BTCgeOqJLEgRIiPcESrf1ydzGSXUKAjcm9IuXhtpH3HNzhh8iLt223Xban6WuWiy/pkp518HLXGQKFSsxntBe2SuNj6HPVR+0kF1SB6b2gK0nWSrWMWqB8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k7j9Te2L; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k7j9Te2L"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-44696b11265so794292f8f.0
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777540362; x=1778145162; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy8Z/q685PmwcT3tK0xjwvFofcgEB05Cfirscbd47U4=;
        b=k7j9Te2L4qUHtz/fK9r1HumCaDbTRUj0jMHKl6481SMop8vvIxrKpZgLr7Fh5zwiic
         gjBSqg9iP9DRfybtu0pGHaFZwc1S+rzd/6z5se5HdneoN9MqgyejiDz6D6fd22RSPSKd
         T/1gEdLcBNeS++qJRIT4nsmB5jrCRvgdNaRk4B4DVeGc9kfr7lg9jdwdaLkl6cV/+hB5
         MMByzAXy1PVG3PA9Cferdp6qbhiwD1n75rtPVv0/IHUQJyD5q0E6a18qsHE1nDICJbyR
         /sAYAD6iPXqGjgm+CDO+0s2V9XWwwnlRo1FPJw6FLMFJ68iJk2bUlzgLUulQttH7S+gU
         NchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777540362; x=1778145162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy8Z/q685PmwcT3tK0xjwvFofcgEB05Cfirscbd47U4=;
        b=jAPomIAISJfO96DpnAZ6/dvYtiwqytu0T4TJxRdBJ09TzBauXg8dZU7l6KF06loS9b
         dYuvU0jnUHCkK1AfLhK0JfqrT56ceI9iyquYJqynsDWTrG6sbHHJjGcaUNyP2UcwGpac
         k1mk1VPYMKA2fGKZrgySBzDa4XJXGQRVHneDW7TDnqq5kevn/OZ462WwC9sWvxbRH0mL
         3wyv/azs+WVeiXnulLHYYLC2yuNnjjren7y2+QLzsZco5Lb/tHDTLahfmE85M9AtbO70
         cWSSymW04jPUchbxDCPHXyE3/kwkXhSqpYwW3BZQO37AmXneNegQr3Co2z2b242yM1ub
         kpGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/B1Ow5e3ta2b617s6wGCQI3iS6wQ4GlgrJnn+eQEoN8i81ilQje4sRVrS9eP1oHjlKAitC+8uYIFlDcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YweGD8atTCJn01HpnYpkfr1gn3L2mcwAEF97JKZSM8aSzM+2hAx
	X8rBJh4bs/6RB0NYy14i8swINxpvfyiQ4bz1yen+MUiiaWUnwHw/zLyovbuhA1iLcuwCe43QGzi
	91mkyR6777I380XyaRA==
X-Received: from wrtw10.prod.google.com ([2002:a5d:608a:0:b0:439:d5c9:3b63])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f89:0:b0:43f:e22e:e8da with SMTP id ffacd0b85a97d-4493d7fa1b5mr3355911f8f.5.1777540362054;
 Thu, 30 Apr 2026 02:12:42 -0700 (PDT)
Date: Thu, 30 Apr 2026 09:12:41 +0000
In-Reply-To: <20260427221155.2144848-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260427221155.2144848-1-dakr@kernel.org> <20260427221155.2144848-2-dakr@kernel.org>
Message-ID: <afMdCU06-Y2d_LXh@google.com>
Subject: Re: [PATCH 01/24] rust: driver core: drop drvdata before devres release
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	viresh.kumar@linaro.org, m.wilczynski@samsung.com, ukleinek@kernel.org, 
	bhelgaas@google.com, kwilczynski@kernel.org, abdiel.janulgue@gmail.com, 
	robin.murphy@arm.com, markus.probst@posteo.de, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 28, 2026 at 12:10:59AM +0200, Danilo Krummrich wrote:
> Move the post_unbind_rust callback before devres_release_all() in
> device_unbind_cleanup().
> 
> With drvdata() removed, the driver's bus device private data is only
> accessible by the owning driver itself. It is hence safe to drop the
> driver's bus device private data before devres actions are released.
> 
> This reordering is the key enabler for Higher-Ranked Lifetime Types
> (HRT) in Rust device drivers -- it allows driver structs to hold direct
> references to devres-managed resources, because the bus device private
> data (and with it all such references) is guaranteed to be dropped while
> the underlying devres resources are still alive.
> 
> Without this change, devres resources would be freed first, leaving the
> driver's bus device private data with dangling references during its
> destructor.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/base/dd.c             | 2 +-
>  include/linux/device/driver.h | 4 ++--
>  rust/kernel/driver.rs         | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 5799a60fd058..be59d2e13a15 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -593,9 +593,9 @@ static DEVICE_ATTR_RW(state_synced);
>  
>  static void device_unbind_cleanup(struct device *dev)
>  {
> -	devres_release_all(dev);
>  	if (dev->driver->p_cb.post_unbind_rust)
>  		dev->driver->p_cb.post_unbind_rust(dev);
> +	devres_release_all(dev);
>  	arch_teardown_dma_ops(dev);
>  	kfree(dev->dma_range_map);
>  	dev->dma_range_map = NULL;

I seem to recall that we discussed a plan to have two classes of devres
callbacks where device unbind proceeds as follows:

1. Run first class of devres callbacks.
2. Device is now considered unbound.
3. Run second class of devres callbacks.

Is that still the plan?

Alice
