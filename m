Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCAF46AA85
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117715; cv=pass; b=ruXIqRZtX3Mvigznp0//1S0tckqFHqeBAPPjZN4vlmDZ0IWxuP9/Sm9qJEVoHM/Qn/eqIcXtYv4eKlOKoTWX+uXrfHC/LLBJDMrOv24/SPK6+BXYqQ13GXtm7vQv9GOs4oW3bYHsEmPrcCIddYH/NY4OC3fRVQh6g4hNRYW/+C8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117715; c=relaxed/simple;
	bh=9AitBb1GHyxUD8itXAfWQrOndn4vr+DMbiE1kW67HMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibKZDplQCe13cibloq9Vuz8KjIw4/54fgsFqnsXCphj6LgfRaAGvHBIWhSTcbiPbYUsHNoVIAqZUpg2Nz6oIGbSEqK1UfzRgbJ9KFtKiuJkcRF2S8eUGaOATQ1k912SMJp4oIaVWaV3v15zIuS0oV4mnYnRFL+CaYFXVtcSNFL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iTnrqP4w; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iTnrqP4w"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4843e397f74so406045f8f.1
        for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 02:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789117711; cv=none;
        d=google.com; s=arc-20260327;
        b=gCJmUKE3FSwsQBuehNMMMPipYzeWDUNtXx4TeGNr/FSMLGid99o6XCF3eMg78X4ElZ
         Rc6HAL8OQ5NdrwW3wTZx/1eL6UmKelaQG9DPJitRbnKzjHF2tAcBGUKt7Fx2dkZv2dr2
         Izfc3K/dJvkGAMh79DDF1hxac60NSn/sDFMI22iA2FPX3arXZGY0BHfv3oJB7xFjz0WG
         9CN8RAravPBWbETaIyIL0ucCStyYFd2PDWyTb8nlyGvamLOpfCz9qr1zTMSRSp3RNEzy
         2FUp9Sszjhsxn9JyICfu3pXyyT5T+IExX8VXd/vvNw7dqJQuStIRpnt/u7XMiHcQVFk5
         6dWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8V6E7xJ2vtTyuoasuWVTwqEDTbAd7Nywgb6H8W3xPYA=;
        fh=ZoahE6qvWdfrBrEw5hou3GVIBSjHKjNJl7CWykgfRhY=;
        b=HKJuU0S6fHsthE1+xMfaKRoN8MmiKlKJDt/3y1DRhFc30CMLTW/J1MvnC0D6J2OndV
         eVnOtK3BC/xa3aFAFUUvJ60zDT87KaGsl6TSSt1xj6H0y2jO2UzQroZ7UBaPI8aeqR+q
         RqR3yol8Hn+e8V/dxTJBTHsz6DO1/NEexku+fjanh5rvMhBmpqBEnMZCtrwlRncgC6w+
         X0jgCUEUOUO3fLn5LANBuwkTmv6cMA1G0M3OAOrW2PykJVZYc+Kn2HFNy1MUYNxNHhtZ
         ZYTWLOJG0gpJR3I+XzNeOG3QcC7gLDo0OC4IqkGB/9csIKB5Jp4rQHCHvbWqLMpKSWZG
         izDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789117711; x=1789722511; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8V6E7xJ2vtTyuoasuWVTwqEDTbAd7Nywgb6H8W3xPYA=;
        b=iTnrqP4wwOsy+zSy8IPHIKvfsMLLagzkCQYmUdC2bjHRcIp6NlE+4wW6E8AWIlyz/v
         s3R8mkK4FQftV57VN2+qhNXvVZUhNfiZcWGMJbUThzmTbWnetIvmrN73+eiddmt3V2uj
         LD/WIWrlEBrxf+T1KAhmCeisk4VpoxXHB8hwAWe+BEcl7CVofnYp2HW1aBElZbpCktGs
         NDLTj/e8pgzWTY76NdMghAkkob1+vWGP7DgEvSCrhhA8yGjP78KO+fLQNkQebe5Y+2JR
         9Sfg6QkThcOORtdJuah5pXdGA1NCba+rZ1mPiinOLdCQmvOrx9/VfWR+IlSZQZxgopPI
         +b+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117711; x=1789722511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V6E7xJ2vtTyuoasuWVTwqEDTbAd7Nywgb6H8W3xPYA=;
        b=fzJXX1hDuMveYvu1CT2Hrvt76EfSj35u4An3BFuHgpvN0U+YGylruEdKrYhrjkalm+
         WI4EvYYXlYi7YgcKlfNiCSoGyoVoIhF48RT9+lj7W/74W7Y/vLFp89VVqL30U+k592TD
         GEfzkpw6AmQfDguTvdU5iqgfcZaIHLsg4b1mVQg8dKD4+u9kbxeM3wo7trXGmctcC45f
         GhC/fwoREPhxNwHYwRxHOSXLFlnSuep/Xew9kztOtLzIAOWIW35KACQkAQGqynEvLQGH
         JiTHpE32+PBGe6xy+rNSRSe3vnlB5EidV+qyeFomltGdiMK3yy8Xzaq8msW7hywKWkG5
         X5Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzZDNXYLbEnuekAuNaQflTkrdZ9ezld4ToGxFwb4KpZEmtwnm0q2KyiJ9cSAMhv257QyADmDOXNIkq1ew==@lists.linux.dev
X-Gm-Message-State: AFuF++lcvcJTVFRxufbuEVQw53TcN7sN4S/wnH1mpiV6i8ZBRkc5oTR9
	5pVohME6MkL2J3dkXusnIue0wTXb7pSaklZE9YUg55mk9I7tYpJfB2S7FN7uB9GEgVWcrKS8k+1
	ZfhAWKMLyiHiS/cx0H66dtzqERj4Oa26YvPWHMoL3
X-Gm-Gg: AYBFou0B+GiXB3C1LgK4Xj4diN2M3rcmkKJyH1ld74lxjfh01pqqkd9zKXyoPKnr5fe
	mfseEDa+/zBdBK8Oq+iAqCsmN0S170J4sY+W/zbjMp+zc//OddQm1dWALdV82rumdAKp8MlnbpQ
	fbqga+/o9HYrNsPgZMurOhX2QGYapFTU8xaDh3Hp38Uf1wX7JgBPmptW1MzaS303eDYDDmLkl5H
	glVUgZEnOK/lz4MdjOJ1+9dB5d//DefK5JVISZGi6bzkPDxF8eiX5NY5hN7Qtz3X9XwvG5drZ+N
	OiPnkCyG24vfPhqcaxV0nCNoAavWl90SnMI3XTjTTf9EKAQIVEVWo6Axp7A3mQNqsVlk/AKMwyw
	/PcxPi3WSoYdSHpYtlHUT77aCBKfbW4gOqpswXPgqywHC4suEUzbZIggVSL2eo+/0
X-Received: by 2002:a05:6000:46d0:b0:485:8226:c691 with SMTP id
 ffacd0b85a97d-486e0f6ce92mr8157059f8f.16.1789117710377; Fri, 11 Sep 2026
 02:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-4-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-4-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 11:08:18 +0200
X-Gm-Features: AcwNN1Wcpw91RcC64bgI4fLKPGdY59qIT8O1U-qjeWGvrNCV-tRUtkCYbazUk4w
Message-ID: <CAH5fLghUQW5urTfLCCDT4BhuqoFVoLUAG46TS-SxaS37bJcgWQ@mail.gmail.com>
Subject: Re: [PATCH v21 4/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:01=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> There are types where it may both be reference counted in some cases and
> owned in others. In such cases, obtaining `ARef<T>` from `&T` would be
> unsound as it allows creation of `ARef<T>` copy from `&Owned<T>`.
>
> Therefore, we split `AlwaysRefCounted` into `RefCounted` (which `ARef<T>`
> would require) and a marker trait to indicate that the type is always
> reference counted (and not `Ownable`) so the `&T` -> `ARef<T>` conversion
> is possible.
>
> - Rename `AlwaysRefCounted` to `RefCounted`.
> - Add a new unsafe trait `AlwaysRefCounted`.
> - Implement the new trait `AlwaysRefCounted` for the newly renamed
>   `RefCounted` implementations. This leaves functionality of existing
>   implementers of `AlwaysRefCounted` intact.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> [ Andreas: Updated commit message and rebase on rust-next (7.2) ]
> Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Assisted-by: LLM
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

This has a lot of safety comments of the form "This does not implement
Ownable, *therefore* it can implement AlwaysRefcounted". But I think
the safety comment should instead explain that it's okay to create an
ARef<_> from an &_ for this type. The fact that Ownable is not
implemented is not sufficient argument.

Alice
