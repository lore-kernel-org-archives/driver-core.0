Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFAE39FCCD
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539625; cv=none; b=Im3lFvI+z2efut2x3p8QRfcL2wckfsVwu9qAYzKwnCickqo0/jkmYxqnCt3S0sxB/HFFSHRj9iiLxCYNo9nOWGmT5WMLmqAmUaRUlwGhUE4i1+KwC/94Ze3SpsEqUYt39bPQlUr9UrS7a+RZ9pfcXBZws2x5qRQGD9tSC4uPu6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539625; c=relaxed/simple;
	bh=CV/9r9T1tGl8H3sNgsRyAGGKdcCvUg4t94aJpNXl2Jw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HvFN3yzzRYy1QYeXX6ECpfNaRw54Rrh+MmtkGU9G2zcuXUyKFVKDhHPM9Ran39c8nj3ZhJTet7/DAsZTg2GTlnygDR+pf5Ft6MCOTUvUWsTBmw3rCK3etikaHupUTo1aU1S221Ewe/H8pXb+OgnlFXfPdCLlfQSD9mNsR2xolss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i3cfr3H3; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i3cfr3H3"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4440c5944fbso613846f8f.2
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777539621; x=1778144421; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PqBhPKhd+Br9ZjEmkXcxZU210pei7kYegjOF/K5Z2t0=;
        b=i3cfr3H3Ysox/10Kz8X2KVcxScgezX1yckhM04YeNKTPOzbMyYkJiXSLcy4z01mVhm
         twoHC4SeDrARgkHZCi6/S0KfyCzHnXyUwm7WFijH/U8vaJ5DY+9jz+5cIpj/gLroGOaP
         wg6kuBhd9ITZGZ98Era4r9XpmDqsoad/MRHNlJbFwPGrJ6i2+hDGtEp6BKCKt56Q+K+Z
         +AhDoJDlPb+nRh3JTnj8EmCHRhhHQQOrF0AoOCwVr4XQEGVEgmXwfAvbnOffBVbN4HjR
         PggBb2/48R6s22i1Z8L1ubwW9kHyHiRNuYcfnY90L1VJyrq9/STtLjOxMERtv+eochxs
         ebQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539621; x=1778144421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqBhPKhd+Br9ZjEmkXcxZU210pei7kYegjOF/K5Z2t0=;
        b=DAPvjo2knrQaLA7lFhyKTI71Vdo+B3pgS/xnBFsNnPUM+NzEtVOQvinf9Yl52XLdbf
         1+mI9mkbWxb+GbPz+eo9AFrrL0kKeEKPru35Aw5WvN/yta1sx8y+1crf0FnJ30N7QTc4
         154YTc0CQB8rJm1Vq/o1rvVLvVQ/PwY18ebeg0cQqjJz2Ke8qf5HFnVthYMjw8sYfZPT
         eLQDFoPtRQEOGqEctEZzXhc+8IMr+tE6hieIxSbUaDZ8UV2J8uMCIc9s1DGe+y9vzPXO
         5beKqRiOHrfzOgByQPgjuAjyenpvYcoSNiLklrPKJv3fJt+QbmJB50/st1nUAps09O+d
         c+Ig==
X-Forwarded-Encrypted: i=1; AFNElJ90gLhnuwamZfNrOBk4oeBSVmZ2CVWrIijTTOuleuEKEohgwsa3FmPPczUlZ5QU2TqMdMplbbMneP/9gg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcN/DEVY0rYamo1XcfBT+jtaLlgqOFeKx1BnQThjhpmFPZX31G
	MZ4v41dYAK2nxnI93j56bvqx6kTLyIaQ6WDngJ5Eu1pyXn9T5OKkq+3q8gtmmvOfnL2RQonmQO6
	/Oue6rZPo0aKjWcdxOA==
X-Received: from wrwv10.prod.google.com ([2002:a5d:6b0a:0:b0:43d:74ca:3105])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1869:b0:439:b8b2:fabc with SMTP id ffacd0b85a97d-4493e1c1512mr3145148f8f.21.1777539620636;
 Thu, 30 Apr 2026 02:00:20 -0700 (PDT)
Date: Thu, 30 Apr 2026 09:00:19 +0000
In-Reply-To: <20260427221002.2143861-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260427221002.2143861-1-dakr@kernel.org> <20260427221002.2143861-3-dakr@kernel.org>
Message-ID: <afMaIz-EUsHbzqAc@google.com>
Subject: Re: [PATCH 2/2] rust: driver core: remove drvdata() and driver_type
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 28, 2026 at 12:09:41AM +0200, Danilo Krummrich wrote:
> When drvdata() was introduced in commit 6f61a2637abe ("rust: device:
> introduce Device::drvdata()"), its commit message already noted that a
> direct accessor to the driver's bus device private data is not commonly
> required -- bus callbacks provide access through &self, and other entry
> points (IRQs, workqueues, IOCTLs, etc.) carry their own private data.
> 
> The sole motivation for drvdata() was inter-driver interaction -- an
> auxiliary driver deriving the parent's bus device private data from the
> parent device.
> 
> However, drvdata() exposes the driver's bus device private data beyond
> the driver's own scope. This creates ordering constraints; for instance
> drvdata may not be set yet when the first caller of drvdata() can
> appear. It also forces the driver's bus device private data to outlive
> all registrations that access it, which causes unnecessary
> complications.
> 
> Private data should be private to the entity that issues it, i.e. bus
> device private data belongs to bus callbacks, class device private data
> to class callbacks, IRQ private data to the IRQ handler, etc.
> 
> With registration-private data now available through the auxiliary bus,
> there is no remaining user of drvdata(), thus remove it.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
