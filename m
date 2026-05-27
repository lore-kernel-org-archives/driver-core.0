Received: from mail-lj1-f201.google.com (mail-lj1-f201.google.com [209.85.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E331A567
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884188; cv=none; b=M7TcpZx9zJevgChOUcHn5iQZI9UWy0tVLEefHvPXsmNcG6Kc29231FCr6xFSufP7Vw0CjISAyIVx4Z20Sv+uNeSfUQdAnZ9vWkZ6pspOZBxfB15TTk7FGkWIUU83R7YmFe5/lqLQuktnUoHH6bepu3EVrw9l7mNA61+6mk57i24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884188; c=relaxed/simple;
	bh=hH4FUXAWRkoqD7RFxNxzVkWtnxsFjO12a4XWB+RyyEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jIXY+EIWTPLm4KMI3RMc5iFhK8twDlSJArRKy1GX7YUFaSPDYYsr41Ed7hwCxxJJuWf0JLKgz7DYeFt5bA4s1FuUr2pllAr8XXO2Cbk4UD4b5z3H5YTNoIFtJV/LJj6+r3BCkvlPoQmeyK9Bkdk6PJJQ6h4WAQN5819kpntOE5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cfwxLBvq; arc=none smtp.client-ip=209.85.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cfwxLBvq"
Received: by mail-lj1-f201.google.com with SMTP id 38308e7fff4ca-38e9589b7c7so5184261fa.0
        for <driver-core@lists.linux.dev>; Wed, 27 May 2026 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779884185; x=1780488985; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GySeGqKvH9w0k+SKK+eNFV995XnhG9D+usTEWb/rPg=;
        b=cfwxLBvqwbco384Wd4LFbDYYjN1biGESgiC9QmtzqIEagRuW6TocVvQZW70zIAZLk8
         Y3M+Fqethbcg4higZm1uCdN7OilOKVUwXWJPNhXXys+nE8y+0P8QnJZ3AqrTmLncn4cc
         5P0D9jUMo7HClEeIhqWHUV0iup1AEzEsS1YvWJoM5ox45h1rnL3kFjaVJr8ky+cTp3r0
         TV8lyDicWa58/Qw0ldDvDJk2KyczRz36FSjoGVwR8j9lHvAmdnxcgCBCweRe5RzOd4Tx
         CnsH8jF9G9A+eJxqnnbV1fmFdUhcBgAOC7VkvrfUITzV/Nb/2Zvb1W5hkwYGcEcJsZ+9
         kLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884185; x=1780488985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GySeGqKvH9w0k+SKK+eNFV995XnhG9D+usTEWb/rPg=;
        b=E2KQMeJlTG0VJwJ/LMA+dCR4qfRXCu15Ce1UOcjqDWY1ZezmwviomXy/NoPfNm4xK6
         XS+3Egj/gMdBjFj2NkiNhgVOYOPt49pwhM1BVyqQsgz499qrQNTLZE04tjnkU3LZdp71
         hRAz6Cz3z787nUPfWMdF5Uk0Ic+Z91QoZI479mxD9AqIP0C/QsHJgnr62d4ZddHIbHRZ
         WoRaLKQZzvASa6OGUGNmB02TNGEc+Lde7y2b6N4gGn1WztTbUprKo3b+4fxc5pHoLO36
         2/Bp9XpApcy9S4ZCH825n9bqvOKIzwIX9krvFz0aOtEBRBwZh7atLv7BOYDnazoRas6x
         yU3w==
X-Forwarded-Encrypted: i=1; AFNElJ+SM4m5W1MhvS0ewjA6Ag7lIwDsOOpQ2zYPvqdAojiM16e+274vV9Krh3nAEnofHlNv7eprkfK0U/pfMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy23cmyvsBdkeBjExxcb7FxVDi6Nq9untOjKe9m5VavVoxX47jY
	gleJQhKF1qcCW1lA/UsNKb15sra2tFbw34esE4naEyyD60ghJAvx7WO73UwHZsl1p85Psa0Q/GM
	3HN4wQwqZewubz7oRbg==
X-Received: from ljey13.prod.google.com ([2002:a2e:bb8d:0:b0:393:7fb2:6b5a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:651c:907:b0:396:c3c:d27e with SMTP id 38308e7fff4ca-3960c3cd3femr45362351fa.12.1779884184566;
 Wed, 27 May 2026 05:16:24 -0700 (PDT)
Date: Wed, 27 May 2026 12:16:23 +0000
In-Reply-To: <20260526212857.1158294-6-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260526212857.1158294-1-lyude@redhat.com> <20260526212857.1158294-6-lyude@redhat.com>
Message-ID: <ahbglxo5yePyjE81@google.com>
Subject: Re: [PATCH v14 5/6] rust: drm: gem/shmem: Add DmaResvGuard helper
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

On Tue, May 26, 2026 at 05:28:56PM -0400, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock much
> easier.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>

Missing SoB for Alexandre.

> ---
>  rust/kernel/drm/gem/shmem.rs | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 116ed0a13eac2..1b24cb1129a8b 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -27,7 +27,10 @@
>          Deref,
>          DerefMut, //
>      },
> -    ptr::NonNull,
> +    ptr::{
> +        self,
> +        NonNull, //
> +    },
>  };
>  use gem::{
>      BaseObjectPrivate,
> @@ -233,3 +236,29 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
>          dumb_map_offset: None,
>      };
>  }
> +
> +/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
> +///
> +/// When this is dropped, the `dma_resv` lock is dropped as well.
> +///
> +// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
> +struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);

Is this missing a NotThreadSafe, or is it safe to unlock on a different
thread than where it was locked?

> +impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
> +    #[inline(always)]
> +    #[expect(unused)]
> +    fn new(obj: &'a Object<T>) -> Self {
> +        // SAFETY: This lock is initialized throughout the lifetime of `object`.
> +        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
> +
> +        Self(obj)
> +    }
> +}
> +
> +impl<'a, T: DriverObject> Drop for DmaResvGuard<'a, T> {
> +    #[inline(always)]
> +    fn drop(&mut self) {
> +        // SAFETY: We are releasing the lock grabbed during the creation of this object.
> +        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
> +    }
> +}
> -- 
> 2.54.0
> 
