Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78296481257
	for <driver-core@lists.linux.dev>; Tue,  5 May 2026 15:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996133; cv=none; b=PCXumxfXSuRhfAKi7XkaFYbw/JE0Fyg7kiyntuNx/hv3/oa1fvWRhgxjGVxi52P9n9h/2MDwlOYEVQVOI9YSbsBdnR7/i9F/7VHqVuOweKRlk/U2/CIvojNW6IUjuqCBdJvPSP8kaniiS8HSziS8T6GplNWH6hweih/WCzdo0j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996133; c=relaxed/simple;
	bh=xYPp5aLMlcFbbyc2Tvslw5PfcoWXbnSljC6zGT0v7Jk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=srQDpOrIM//zda5n197IaR+vzp+AoAO4CkQdqEidEwSrxMHqyTIeni9pBa6NwHAFuBR8xol+V/hxzMiIc618x3QRTfUp5sneRV6U4KPSzSYpZlDcfKzAhyBx6w4JQi5B4LFxF+W/JZ5qmZupI06/mmchhvwrPmKPp7NWzK2OEv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MEaNmnNb; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MEaNmnNb"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6749e8562a7so4601946a12.3
        for <driver-core@lists.linux.dev>; Tue, 05 May 2026 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777996128; x=1778600928; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=88jGTJt1jUBTa9gUMTrSJbkV2SqxUXuXjo+gX1FmdT4=;
        b=MEaNmnNbjixh8FgzPdca1wSs65jlR7m1dLy78vmvXUPLzRKdMqiQrmFqNG4ZogNlfU
         +YE4nYsGRlsrSeYzdlioTVRlrrQCj/gQCDAyYDjiZfDKGwljgrO+zyOk8+XhmiILsk2Y
         EnKUw29F2mnwD5e9yB0aGcmmtwg+SI2NYf3Opz22UYI2PeYbwz5ioPoZjV8qm+5UYlFP
         0sZu0uzpkGUdf6cXAt+7BSzy5BSzAwZtGBej99Z6nTc9rghupxScC+dzDaMrYIuufR2l
         yRa2k1XmZ1wJTPAG9WVvzQOOBMprVBou9hg6FK13VwrB8XPm1eDDfbzwpNvlEBzGNw/N
         2nzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777996128; x=1778600928;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88jGTJt1jUBTa9gUMTrSJbkV2SqxUXuXjo+gX1FmdT4=;
        b=bC1K2FBskLU4Zjy+wrGkR8SXGVqgiLguGhnxBsGtw2uF9AWS4BHq71eizjGk7jVZp8
         ArbMiCWIY/0Rf8sIwUhGw3Wkk1udZrMxPW9zDZdFUiIVTpF8CPLqjfWPZBiXoGYCbNcn
         ltFO8JDSg/pYp8p9iN9C38kYt+O90g0+MYLCSVL4jEDcLFLeHbVV//ggTBszH11CNnrP
         9BNOUkFZbKJZnPD0EQUIDHNyi1OZIWTYj83BVxdwv3U5nnmljQ1J+Ii5d2ih8xEgRLFF
         cBJbxqPDI4VDI5pPXYnldyKAnUeMC1C2qaxpQ/S/n00OnDYMxKuZa82Mp3GiGQAITLxN
         7GQA==
X-Forwarded-Encrypted: i=1; AFNElJ+jKDUQbPiBTsdX5t0pbN+EPkdcR4kXbodWywOrgbZzI1XCTDPNtN2bWx4qxlq0ChE6aegudWG1lEESmw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2RTr6BBjvJs/0kG/Ee9LER1w07EqN3A/MyTDSbnMyypgvts6L
	pv9lvXQ852lIr/F1ybC31+CORgPqBYpKZaXcDg+bTzqrut/V/zMUBN53uw6lvQYK1D0SNqp8qkO
	O1A1aeSN5Rrzxh6EXJA==
X-Received: from edvb16.prod.google.com ([2002:a05:6402:1390:b0:674:5a86:ecaa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a0c3:b0:67c:ba33:c605 with SMTP id 4fb4d7f45d1cf-67cca92e19amr1615859a12.6.1777996127373;
 Tue, 05 May 2026 08:48:47 -0700 (PDT)
Date: Tue, 5 May 2026 15:48:46 +0000
In-Reply-To: <20260505152400.3905096-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260505152400.3905096-1-dakr@kernel.org> <20260505152400.3905096-2-dakr@kernel.org>
Message-ID: <afoRXrwKjZAJuMaQ@google.com>
Subject: Re: [PATCH v2 1/3] rust: alloc: add Box::zeroed()
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

On Tue, May 05, 2026 at 05:23:07PM +0200, Danilo Krummrich wrote:
> Add Box::zeroed() for T: Zeroable types.
> 
> This allocates with __GFP_ZERO directly, letting the underlying
> allocator deal with zeroing out the memory compared to
> Box::new(T::zeroed(), flags).
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/alloc/kbox.rs | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index bd6da02c7ab8..c824ed6e1523 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -19,6 +19,7 @@
>  use crate::fmt;
>  use crate::init::InPlaceInit;
>  use crate::page::AsPageIter;
> +use crate::prelude::*;
>  use crate::types::ForeignOwnable;
>  use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};

I suspect some of these imports can be removed when you add the prelude.

> @@ -256,6 +257,27 @@ pub fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>, A>, AllocError> {
>          Ok(Box(ptr.cast(), PhantomData))
>      }
>  
> +    /// Creates a new zero-initialized `Box<T, A>`.
> +    ///
> +    /// New memory is allocated with `A` and the [`__GFP_ZERO`] flag. The allocation may fail, in
> +    /// which case an error is returned. For ZSTs no memory is allocated.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let b = KBox::<[u8; 128]>::zeroed(GFP_KERNEL)?;
> +    /// assert_eq!(*b, [0; 128]);
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn zeroed(flags: Flags) -> Result<Self, AllocError>

#[inline]?

Alice
