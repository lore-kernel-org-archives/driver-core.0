Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDA91F7569
	for <driver-core@lists.linux.dev>; Mon, 16 Feb 2026 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230568; cv=none; b=dEdJlZsZPDegzXCloqHXoOlQBHaJ9EV3UeQ47dY5Mol84RkIcP2KJ4a2QHdc6k0S9K3SYavonqMD6dq5D4AHHs6gwmNYFRtGp+lIZ8T0+NswiVZOYbncXKOwMfs6TmYgiNmsqFeTu73y1JncOxLCEh7mrGYpYNxAClDIiYXYCfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230568; c=relaxed/simple;
	bh=ra1V5naSBIa3oKdC22ngSjF+njr2h+bn056HhsDqPMY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bQRH7R/qL/DNBiICuVm+D5lwvIJVBQU2ymT0cztGiQgDlRHlZBk01QLdeZYC5OVwnmCTPAO3Df0vJZzY8Kd8XxmqBQw4RY9IeLrjGBn1sULE78bSOEDCaUuyRrl8vikyjEzlBE88Bg9vK4gnwXD0l7uIcJg68tv0V0ZhNECR9Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vIyuQG6V; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vIyuQG6V"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso10854885e9.1
        for <driver-core@lists.linux.dev>; Mon, 16 Feb 2026 00:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771230566; x=1771835366; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw73ohv4pJTcmw9KbhINi0iCnAI6CO1W3op7q8abiDI=;
        b=vIyuQG6VmxgSGwElytK588Q2JYuK4vM6oHVzO8Br/ZhA1E1uNZcyGvhRlQmzLwcxRW
         DPpd2yq3MC29f569lq5LWpa3pub3T6BWoxYWnpNlYeC1rky0HmouL00mnv5sOk4sVvNJ
         1LYbUGZ0jrZGfYb208g7T+ObIu+JBgfMTQeXOUgbQM2FyxVYEqxFEQNa+r2h+yCUP+nK
         BNeuxBQdOadIge70Fu/9oRWkAGijH7emy/FSbeOHfjIHKpbB5XkEh4HM85lJFxEDZcJu
         NiCr6zQUHXGOUf5+qtaG1mqKtMAF//YA10lvufwbwP26EvcSlGqKGim/YIMyTY9L3f0d
         xrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230566; x=1771835366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw73ohv4pJTcmw9KbhINi0iCnAI6CO1W3op7q8abiDI=;
        b=IXVsrT77Cyt1sWI9if0IR5jvoZWL61ENfEcpx9jOaBj82UucVlDKfKf6lvVA7Ojy/F
         43l9LHMtyOHVj9+BmW0TNEVRJcvUQcYK3uv0cllGEhIOpaxq2UWv10K5ELd3gk8h3DB+
         +ZCsPfq5UH5F5EQ4HpIkxMN/KD13YLhdmuQrAs0Dw6bMMzipB81oQ1Mu4PrOBtvctQxR
         UGaSXU86QxZ8Caka/FZWtGe9zpTZd8Dr8lsJki5SZBGSagBl6T4TKfSVuVE4dWrSx/XR
         aMX4yalrekpA9V/EfJZB49lShKAo4Ya1dpt6b6xiZ3qYDdcs+XUPKZiD+++wfFuJyMQd
         +w2g==
X-Forwarded-Encrypted: i=1; AJvYcCUhMLeVvLcZ2fzG/iUBmxn70blcanRz9UVJpQvf5piHqYr4JbWdv41bkS8IVu99uN2FBPBZYm55KxWXUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyfXYXt5Kvpi56NL274gSErTa5mlNXaK2aL7zhDQyahBwLAmI7
	rii4NvHYle4Bbqncijbuoi1iSHhipjWryT29pW01/lg7GhBGmysqs/Bz9/j45HBoQQ30jUdk4ck
	CcPJjs44LHoKtaG2pMA==
X-Received: from wmbiv15.prod.google.com ([2002:a05:600c:548f:b0:483:5ee6:9c8b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37cc:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-48379b93370mr118294095e9.5.1771230565675;
 Mon, 16 Feb 2026 00:29:25 -0800 (PST)
Date: Mon, 16 Feb 2026 08:29:24 +0000
In-Reply-To: <20260213220718.82835-6-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260213220718.82835-1-dakr@kernel.org> <20260213220718.82835-6-dakr@kernel.org>
Message-ID: <aZLVZMHzAPnY03Oe@google.com>
Subject: Re: [PATCH v2 5/5] rust: devres: embed struct devres_node directly
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 13, 2026 at 11:07:15PM +0100, Danilo Krummrich wrote:
> Currently, the Devres<T> container uses devm_add_action() to register a
> devres callback.
> 
> devm_add_action() allocates a struct action_devres, which on top of
> struct devres_node, just keeps a data pointer and release function
> pointer.
> 
> This is an unnecessary indirection, given that analogous to struct
> devres, the Devres<T> container can just embed a struct devres_node
> directly without an additional allocation.
> 
> In contrast to struct devres, we don't need to force an alignment of
> ARCH_DMA_MINALIGN (as struct devres does to account for the worst case)
> since we have generics in Rust. I.e. the compiler already ensures
> correct alignment of the embedded T in Devres<T>.
> 
> Thus, get rid of devm_add_action() and instead embed a struct
> devres_node directly.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  /// This abstraction is meant to be used by subsystems to containerize [`Device`] bound resources to
>  /// manage their lifetime.
>  ///
> @@ -111,12 +124,63 @@
>  /// ```
>  pub struct Devres<T: Send> {
>      dev: ARef<Device>,

Wouldn't it be nicer to move this into the Arc? Most of the time, it
would probably fit in the kmalloc bucket without enlarging it, so it
seems like that would be better for most scenarios.

> +// Calling the FFI functions from the `base` module directly from the `Devres<T>` impl may result in
> +// them being called directly from driver modules. This happens since the Rust compiler will use
> +// monomorphisation, so it might happen that functions are instantiated within the calling driver
> +// module. For now, work around this with `#[inline(never)]` helpers.
> +//
> +// TODO: Remove once a more generic solution has been implemented. For instance, we may be able to
> +// leverage `bindgen` to take care of this depending on whether a symbol is (already) exported.

I'm not sure what a generic solution would look like. There is an
assumption that if A can call B and B can call C, then A can call C.
Other than just exporting the C methods, possibly for Rust only?

What happens in C when you turn on LTO and core kernel methods get
inlined into modules?

> +    #[inline(never)]
> +    #[allow(clippy::missing_safety_doc)]
> +    pub(super) unsafe fn devres_node_remove(
> +        dev: *mut bindings::device,
> +        node: *mut bindings::devres_node,
> +    ) -> bool {

Since you're taking the opportunity to wrap these, I'd consider adding
#[must_use] here.

> +                    // SAFETY: `node` is a valid pointer to an uninitialized `struct devres_node`.
> +                    unsafe {
> +                        base::devres_set_node_dbginfo(
> +                            node,
> +                            // TODO: Use `core::any::type_name::<T>()` once we are able to convert
> +                            // the `&str` to a NULL terminated `&CStr` without additional
> +                            // allocation.
> +                            c"Devres<T>".as_char_ptr(),

The problem is that type_name() is not const. We can convert a const
&str to &CStr with no problems already.

Alice
