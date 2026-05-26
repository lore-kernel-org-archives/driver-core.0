Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2E3BFAD4
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821371; cv=pass; b=NUo9LbrtqfhUcjmxpDKlATjsqqHd+mkHxD0Kr7w9/d49DV/96kVwr7yaCx4YCUQsXUk7lpckoEg6XnkP9VKFebABcu/JSElIqqZUDDO7wViccadIBDhBhtNUKeLmJc5uH9ItnnEExp3MakZ6dpLPIaF5b593KdaOCrJgSgUsAbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821371; c=relaxed/simple;
	bh=Ee8xVylefUxsgAC7/wUPXBUGosnDj2MjwQFydFBfjuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnwCRN21063yz9Un9SxLabouVcuoWQtYfVzcqzDJH4D7wkhIRPL7P8v9FIZADhmfxFFRIGIGDkxZo1JQ6JjGMpdaZzTptkTVxr1auDFjgck8KbC3EyHDG/9XQMsYQi1ulHIirg3Qna2N2dCdjhTnaH7mHIN60xxk9VRiqakvclY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ou8O/c/E; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ou8O/c/E"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f5ae07e2b5so908185eec.2
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 11:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779821368; cv=none;
        d=google.com; s=arc-20240605;
        b=cUCNIGR0FvHSbDj+DSV604KWgPN/YLznzv6q59Mt4TLjJLbiEIGrVN4/wqFm/aRhlL
         OGkwp40Dez0q3TS44lKGVbu4MwRcJ17mv4K5IetKkIc6tEIwGOztxrseUdMZx8ghzBQ9
         C/HWdAugDuJDNewtPHu+eEpo4DNmF1B9hAYuN+KsNpgxbtfRY6ga7G6dXe4/qPg/Bmj8
         BrHbmEhtWb9tL1pyfE0n5zIM5ir3rAGUljfJbmScKPX88caAL5XbKieVPg71zS+xzroF
         Dj5CO6dKm3afBGt6GK8nW4B1LqjihYaVKuWOkbFHNtZrv1sneTAmlhV/VCFRDklJbYRS
         10CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gq/O5ZHqDltDecbFmxpc8E+jT5oOcbB4Yuea57wtwdA=;
        fh=McRWW+LUHueeAwu0CV6eSJUk4rPhcXBFdJ/fm4Qse7g=;
        b=IdhJgSG94FHWp0VA2KLkOrfnuZ7xU7GfrfiZ93AisaFdczXN1y64EyE5EFjcodWK2w
         TxwpolA9+8nzjdZeCiMnSIwlbwqrUi35EzJAw+54WfiXJoBfHFTcCTDNHl4CYgOUthXH
         K6GENqKDbfZAuYcIircXse8BoiGIVd3dOoqgkcQvUBfTOdgUXcVFAqzfxpvkEMt5Es1A
         37MbpTvU5FqKpKdzuT9cAJ4XWxMDdFxWlCSmzNzjicr61fh3mKbs89LZZf94acXoSCwR
         M1FoFdD+bNVVzCuZEHgIqxSLUDxjA5NCcpZBVRw3Ti50zn/14ZP2TwIbpet3ZNpxxcT5
         qhyQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779821368; x=1780426168; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gq/O5ZHqDltDecbFmxpc8E+jT5oOcbB4Yuea57wtwdA=;
        b=Ou8O/c/E/0aOruZxSzE0SQWzR9KY2ugWaZqp91YfkjMEU/Fwa54ip/Wndi+qk0FsOG
         7t4j8SrUfKdtXf0P9AZFiWejpA9Ml1RuIBkQYeRHo9mElL4jYEJW5pSya+/fxTngOt21
         yaPG7B4PiCq4r+BoYdbCYxU/W5i6+T9v8NDfsXt78ZreoEtVPLE6JbqyxB6cBMzYl0YS
         7A+icEf/26rBmAaJFl9VdHFUbahc11JGfIlFuC5d8qWauWitJfmOKIeHBWgyp4y0iq7U
         fEISfnSsI301liNxlHjo36z6Dbxp/w7s1zMsUq2VCK5Yb8VciJn57ZEZ7borR1cUG4Os
         ei4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821368; x=1780426168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gq/O5ZHqDltDecbFmxpc8E+jT5oOcbB4Yuea57wtwdA=;
        b=QKUaekrzIlMU3dDpQ1WE26bz3KXBlKGR8hh3YA9ra5OHiasRf8kOtytW2SsofkYq3T
         yKBVEB4gjTt2i5VXaYhF0jvHS2ZwJyKehzSoWpyAnDo7vd4i0HihjNmvN5qtpb7QKmMh
         mBd3UKa29uwgXtjO8A23+/DT7VRQfWHXLJ5o8QJf4A977BWGZg5hNqjG7YTotW29I1Hn
         I/ZnDsceLKxes6uGmAGfB3mrQjypdXRjym11x3599pYTUvtCvqxeJyApoPnkIhn2cwz9
         +RcY8xVKu81ubNZxvzPG7kAfjawA8HKXUk1mKesxEL/uACuZFs5DCoY6VdVUM3jAKW7E
         mDnA==
X-Forwarded-Encrypted: i=1; AFNElJ/zatnYdCmYZMGTj7vdnGRLidz1S/2eGVv3ka6FmFsZNCCL5loUpJldaXY/GGR67v4+vRR1NouYVUICOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/1YWpIkcg6tkyyjhpqNho0I55Yl7CHaA3o6S2sN1uG1EdDRw1
	78LK2vKUNwKe9AesMCDkd77Oy9WJSUw2IXrBdRl05P9YnO4apb6YfUZtPbdJdKrUw39r7aB7DGA
	O3dasqTPRl3m0NuROle4r6mMt5NCxreg=
X-Gm-Gg: Acq92OG6SOdwNvzIRl4IXJX2fZjz5SLJMQ+YD6kuBoo4x/3UBQIbZDfCqaIuRqLasmX
	C0MxZ2vwc+5/pAXodqEjE2RL/6EgmRjLHIDilSB5GIRSDnyon9FPBvAxv9s5UuY6do1YSga6PsR
	ht4AG7QkHpg4j7cNikOvxZ3xiz+4GvrCXx+KvYuJV0WLxvaKiNcx5Pbusm1409ah5Xh9ucCGTUA
	T8PuNVxR/Kjt9W0Pq6aIuJ69uJvSkQeoHGfB/ieePDQ0POUJf7dVBsn6lcToIZAwg9W5XUjH9T2
	8Of148C7MFhSRPoAjUhkhcS/Il+QKz2Q4UYL9ZQgpv9Rrq4FFDZ0LpR81p9KPxjuBoG42AbiYQz
	0tLgTYgsfRzOMBgp2hq2SsFU=
X-Received: by 2002:a05:7300:5711:b0:2dc:e799:934f with SMTP id
 5a478bee46e88-30449099a11mr4340063eec.3.1779821368216; Tue, 26 May 2026
 11:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525202921.124698-1-dakr@kernel.org> <20260525202921.124698-23-dakr@kernel.org>
In-Reply-To: <20260525202921.124698-23-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 20:49:15 +0200
X-Gm-Features: AVHnY4LynmVmerdJFsxXUCWY1urLy48wQB7u14V2mO2sDmYd9U9x9x1s6x7Cz50
Message-ID: <CANiq72=iLUncNw35tpRinUt15W0aqsEiNn+rMcjC3VGq0gx0Rg@mail.gmail.com>
Subject: Re: [PATCH v5 22/24] rust: types: add `ForLt` trait for higher-ranked
 lifetime support
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, viresh.kumar@linaro.org, m.wilczynski@samsung.com, 
	ukleinek@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	abdiel.janulgue@gmail.com, robin.murphy@arm.com, markus.probst@posteo.de, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	pcolberg@redhat.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 10:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> +/// Representation of types generic over a lifetime.
> +///
> +/// The type must be covariant over the generic lifetime, i.e. the lifet=
ime parameter
> +/// can be soundly shortened.

I wonder if we could keep some of the commit message around here -- it
was a well-written one!

> +/// The full syntax is
> +/// ```

Nit: we are not fully consistent treewide about this, but please add a
newline before (and after) examples/code blocks.

> +/// ForLt!(TypeThatUse<'_>) // Equivalent to `ForLt!(for<'a> TypeThatUse=
<'a>)`

Nit: please end comments with a period (most in the patch are already OK).

> +        // https://github.com/rust-lang/rust/issues/152489

Linked to:

  https://github.com/Rust-for-Linux/linux/issues/355

and tagged the issue with our label upstream.

> +    // Currently the Rust compiler doesn't check this, see the above Pro=
veWf documentation.

Nit: `ProveWf`

> +/// Obtain a type that implements `ForLt` for the given higher-ranked ty=
pe.

Nit: [`ForLt`] like below.

> +/// Please refer to the documentation of [`ForLt`] trait.

"of the"?

> +#[allow(non_snake_case)] // The macro shares the name with the trait.

We normally put comments on top of attributes, but if somehow that
messes up the formatting or similar, please ignore it.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
