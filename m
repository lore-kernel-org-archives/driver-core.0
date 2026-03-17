Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A40D344DA9
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730204; cv=none; b=JwN374Pr1kbI8+UMNi8yIZsfFa5tgZ8qroB/ZNO+b4+DZrFKVCItKBQfr1HStD1T1gJNRpSGsR2DiSpETocO89Fqu+fugql0d5mmeiYdVGOi2maIOLuJSmSHiyipaAnj2UMVB7tP/6eje2Lg0z8qgS3wGqQsimBxbX5e1EQAwJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730204; c=relaxed/simple;
	bh=gkJ+po5fQzbwv+veCId4gGGL4Xp4wQrz+F+leY/d2+c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Syb0dkdOlDCwFYenHM9gDzGekqz+MTmRjFCNLnlqdM+THI/yYvW2Uy1we9X55Cl8ozWzJRCVLLRQxRWvagFU4Dmt0ggrkkxpyeczJCru0qF2ESyyzwWRW8xRwCGUFG2fGM4d59jiNHSdTfFP96CkgtozOfm+vPJnrH/CldrRxzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IVZ/mGJK; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IVZ/mGJK"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4853a9467c5so29962825e9.2
        for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 23:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773730201; x=1774335001; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxvRr8+lOBB6LohtXEdeEzhkagUanjKQw+ztADkvzGQ=;
        b=IVZ/mGJK8Bk93TYeQNMHgbY3JHwMEl05lmbm4p7uqPIbxqRWYBaCAKIieurMu0t8uv
         92iu5tBaQ+VkRelZRkEX4GXI4K9pjdBuYVNuBmE86D32dnVoR5brjvC3SVNW4wlcLpKY
         InudsbaHVHNvi8EnuMtqmkNo5/PNKil0sI4+aoHCpPetHaaEXOPcXpi7MGAG/MkuRCAc
         J8KRMiWuOu7eiws8JibFpLqf0ZVQq15QR/5g/Q1iHZdto513Y2XUY2mFRDTyXlgccyJd
         Itu1rM1P/kK850GJ0MNecfblv161BDhZRRtnRkwgbL0ESorS2N15nq6p/McfG1mFbV4c
         ayjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730201; x=1774335001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxvRr8+lOBB6LohtXEdeEzhkagUanjKQw+ztADkvzGQ=;
        b=Ded+J95vIpF9jlIH6+v5RHr0CqHuCm2fGu9FJRsPOaIqVq37ubhkYu43IuCstpOzn7
         ZgOjBwCwNt5QMeOOdKwAEamSo3DdxE/Hl12SNVXvt27i+J89EXzkkaeCmJz0JAJ/mnUd
         Z5jMViPPPRjcA3LnxI3U/vkWiwCBTVZTYLY81JwOwKLA1Sl/q77gaBUNJQ6wmYVZJPDK
         4NteWbkLMeV0iAumkMxZnNfzkvWK35cooQZMmRuE/cnMdnZnPGERFxrPn3BpzfUOdFuD
         K+mawEPlRZvrmvi+wV7rXSSaGXnL6jCwGROTJjVnWOYTz1aXcgqXzuNyLjucwPhDGvlN
         rxdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVLC86Dd2mO1HRveWXhBpmz6UJqOVypQDMai93zhRH3DCCFE+X5i4MsZF6HO6aYBPkibH269RNue6syA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcarBdWMX24GYvzqKk4K1gFFadSvRBsMhuwEBn3Mw+GOGXYPpW
	X//T7lZZO/erebY4Hz+jt2xRCQepClGsTGj7xMqBacm18oeg/W7x5hjl++g9cQQH2lrMSXE2PkB
	rrGLj1x6qJZ+++YZtqQ==
X-Received: from wmop12.prod.google.com ([2002:a05:600c:468c:b0:485:40d2:1eb1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8519:b0:485:5812:bb9e with SMTP id 5b1f17b1804b1-4855812bbddmr300430745e9.0.1773730201517;
 Mon, 16 Mar 2026 23:50:01 -0700 (PDT)
Date: Tue, 17 Mar 2026 06:50:00 +0000
In-Reply-To: <20260303162314.94363-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org> <20260303162314.94363-3-dakr@kernel.org>
Message-ID: <abj5mOYQAY290nqY@google.com>
Subject: Re: [PATCH 2/8] rust: dma: add generalized container for types other
 than slices
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, driver-core@lists.linux.dev, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 03, 2026 at 05:22:53PM +0100, Danilo Krummrich wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Currently, `CoherentAllocation` is concecptually a DMA coherent container
> of a slice of `[T]` of runtime-checked length. Generalize it by creating
> `dma::Coherent<T>` which can hold any value of `T`.
> `Coherent::alloc_with_attrs` is implemented but not yet exposed, as I
> believe we should not expose the way to obtain an uninitialized coherent
> region.
> 
> `Coherent<[T]>` provides a `len` method instead of the previous `count()`
> method to be consistent with methods on slices.
> 
> The existing type is re-defined as a type alias of `Coherent<[T]>` to ease
> transition. Methods in use are not yet removed.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I see you have both `size()` and `len()`. I think it would be clearer to
rename `size()` to `len_bytes()`.

Otherwise LGTM.
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

