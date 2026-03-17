Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA973368B1
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 06:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730039; cv=none; b=YbbSdmxumtFSaLecRwgAn7Xyp24rIHBDB7wBge5Kk/saphf8lk78i0ZIyBYM9YGPfFiAjE6U+N/9sox7q8TilvCjCIqhvuVh78a1xhsfHzpnSp88LCRisk9ZvIYwA8nMhhfunrK7ePTc4UUJI/wcXkcyhbI4ZyHYH4KYLKAU5fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730039; c=relaxed/simple;
	bh=xgF1LFYaYos4BSjAvKO5sCMhdKO6UYeNzPHvYUAYG5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aWEQXtIrFo9wfqR6Sku4IBvq5R9KxJt+N4mVe8R94sqo9fsxnpyxnmhMJOh2jcr1EbpyKy1HOMFch0JgPM0Jdu8sb+4o+o6hiAPJ/20hh5ham0tNTKrmvhvGlHrjuOH0TiRzyZ2+6tde76AgFOk6/BOIkRFy3dVSehqxN4AA9/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gVFTTUsV; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gVFTTUsV"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-485c45885e6so2049195e9.0
        for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 23:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773730035; x=1774334835; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+LfXYyK2K5YV7GwOcQbmsbmYUjdllavbSwogkW6CuYU=;
        b=gVFTTUsVNdSDuQRwNvEVGPJZXQ838yKvWKtmprSq/DHH/fc9p5000T8UiBhqDk3jYb
         hO7gKn9HBnbCE1pINfRs5UdXNlbLhDfyhbXeoKRgZFLXhEQ3Jw3tBx+KlJxlO6nc/cVT
         gJ77Z6oKrzg88Oi1v9b5Gc7tBUSk5vL3AFhHbJjptsltnBqFR9+1ZAnLLD9SCiQxh6rW
         BwLHbDmjUukIe7prWBVIofGgkUQ5KUptuhkmzOpvOKXYHU4ecv5tj54KAjBiH29cUgKU
         mVdiHyBviXxGNmW0iG2PLxIETRhhVxPBFRgUUlIEl8agU9zLvbZlDICGDX2/CN8BeO+e
         QCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730035; x=1774334835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LfXYyK2K5YV7GwOcQbmsbmYUjdllavbSwogkW6CuYU=;
        b=WXJxwejPmVptGF6TAw3wXgOvwqMSGLGFwFuVPeGXJfhgFo7mcuc7mIulBK1ANw+1bZ
         an1bvYgghdp+frhavzG1sFoD+WnwBjWs+b0BKy+DRApH6afpO18grJFXwGjH5/Z3gA0n
         pJpReBUQpEuCNTrHgR4d6OJy7zDwdeIEvpIRZorWOsFBVCMZrVi3lPL5TL89zUYahKND
         XEcuDTAIp4VKaH5yeTcFPU9DARqwNcwSpD0KWTGVxoR1u+ivF9FNRZ+5vARNYfrDzBa7
         tUPF9vBs4vD6y6mBP7/AW1CqcX9fwtimPgPJfFdSdzLt0HNrkj+8B4whtP1v7CZr5C7d
         paWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbvKwX2RNzy7zSpnY4ydLoRa0SZJfpuFemC/c8p8kZyCcvLYo/QQ0oKgTidD2bm/LPKduxtfvoYE2EYA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx8xo5nQjm6Ltgh4r+a6LcqXT7XSA8B+bcAmeXXl6eMSxPz0T4
	dAOdprXLswmTBpgBGAXsPhspzcBiKGrSGTrabKuz3rqR3CmOnDfQWrVG/dCklN95KEynE6S/8IM
	9NXGRCkpQpRFlTbuMtg==
X-Received: from wmpj3.prod.google.com ([2002:a05:600c:4883:b0:483:509d:729b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a0c:20b0:485:54cd:6e4e with SMTP id 5b1f17b1804b1-485566facebmr200570335e9.18.1773730035474;
 Mon, 16 Mar 2026 23:47:15 -0700 (PDT)
Date: Tue, 17 Mar 2026 06:47:14 +0000
In-Reply-To: <20260303162314.94363-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org> <20260303162314.94363-4-dakr@kernel.org>
Message-ID: <abj48uggZonBXPsf@google.com>
Subject: Re: [PATCH 3/8] rust: dma: add zeroed constructor to `Coherent`
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, driver-core@lists.linux.dev, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 03, 2026 at 05:22:54PM +0100, Danilo Krummrich wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> These constructors create a coherent container of a single object
> instead of slice. They are named `zeroed` and `zeroed_with_attrs` to
> emphasis that they are created initialized zeroed. It is intended that
> there'll be new constructors that take `PinInit` instead of zeroing.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
