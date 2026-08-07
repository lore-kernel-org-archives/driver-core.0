Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37BB3A8753
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122761; cv=pass; b=YrJDyFmrhJ3qsKh98G16nnBTue+3nox4AIw/lzZXTteFpY6sf+S0YRGQbQOO6RPHGAfZuXU0CSfkK61j0+WkeffgSTIzygI0UfZCgA1vxYbfgaau/A20Pv+qnK1EIeMbFOdEKJYE5GBn8kjhIT3uaePVrNtG9+PSZ7H0Tdme1HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122761; c=relaxed/simple;
	bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJ2cF/pNHw9nYqsOvPiQ79qnckdFiO4/zPx8bg3vlcd16A5vNhlWMCiJT3WMs0szkx94ItVRWvZLpf64TjInoHXvhgmCY1SCIhIzm8zcoA1jRgMMseRkgSC27TesToBu9HiHAAQAb74gFrFJHrWie8BnstlpRTBpoYcbIyT3e6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebfDng22; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebfDng22"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so460521a91.2
        for <driver-core@lists.linux.dev>; Fri, 07 Aug 2026 10:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786122759; cv=none;
        d=google.com; s=arc-20260327;
        b=B7NMn/sqc2qBZ0ppvwjB1/RVu7zLUZX5Dz/nCujkP+kyifzobBppnzhAv6FY+K7ZVs
         KdSznh5qOtFFYAkUTJiMnhqXEd9/RCHddJ9bVwB3dyFKK2z3kUUBLCp+I1H8KrjT6DQ/
         K8XevL6/TDlOUL1iQfHmTyNPSjnYWK3A6tuFOKcfPG/9llB4adXEmONMK9q+vEoGFr0T
         i7yxRFbTxSg1R+6GvXC0WuKk/hDxolos9kcLQrMHL9BBFq+oESs7bH8TB8F3eEUyQ4gJ
         ejsEKDU6fdYw1tPvm/vT6sPnacjznZuY/4CFn3PbKi8yBgwvUWksmuKC95iXJN36zVRM
         Em0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        fh=ak1S86y+eNQUSIlvTWPqqiaf8z1aKL8LhGFmhkW9cYA=;
        b=M7bgYcE76HAa4lXa7TkmORe5HGOkR4TV9wk7PrnXfLVsJuX/ZZLn9DIB3oIWRQ4o3V
         YkPJkIGChOTstKx7Lm+Yqc0Ci5FqIV9/YBr2pWv2tBIxcak4tsTCqNmsONigJnwGkZ/v
         ZcSKyxvPdr5L62x+MOncA3mJui345ZBUic644TSMRDYmqqKbmZWuvMS/KoTpIemPoJSL
         aho6GGYqMWHPHbI2HKzA5EL9hbBj9q6+BPmRWYJG5A90bOngokROtyfvEnRZxot8R2GZ
         /31CQzaUfaXlxeit7rATlJM0vYYfkiTtDXYEIaZz8jySYHU0Vjrzk7xAYyfVKg5z+/sK
         0jgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786122759; x=1786727559; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        b=ebfDng22CIBVPF1OX378SD39Ymr4slNGko1jXrZQNWj2iGtcmCOUFGt82mt2OlwzqE
         LjRahJ5MX9gg6Bt+zu+yeeTJ2ST9sTn59Y/iWpOyIJnRIt8PgubvEUswZDEHgaJV4oyc
         U0fK6dADJ0ShO833mxPK82u0BEjlwoLn8TdqEReE799s4I/BxNQxC7/7gQDUZtRRTSwM
         EGXiNIzaIBKcxSnsXRit6pFsYavjED652qX6klROFwIDj08Lb0E+xQvFO7gvcnqM4Eo9
         lY/mbrlXFWfBtpz+vftNOmRHak54iSULRYnh8SOw22SMZAoOFHty/R8pCAr61G/1kCGp
         wSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786122759; x=1786727559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        b=PIWo8KJRE7lTEKGv7yXia05deYHPlr0IeaSZY7S/nwyG1hIef79x7VhmJfmuMRTFUR
         IPY4ChmynkcrxsntFkgVcxQbHWmf0v90EkcGXXSYqUIzGNGvkfFKIqQZtD9uSJ6maql5
         it9Hw0xjAScdljwolgKYI/GeN1z92aYg50NKSZEPfC+2uNDvGuu2W8G61t0F9hq0pmmD
         fneT8/64UK+l0BiKqZ8BaRG3y9+4DtO8BJ3VRXGC9sMtivmdWbTIQzU+NaLKZktCsr1t
         fwG5q1G+HHAh/ZM929Nma0OOEAGA+jigb2JdmLDwn0CcYnCjtDm7x1uf6jD+ov4rwxKY
         0xhA==
X-Forwarded-Encrypted: i=1; AHgh+RovyR4hpzpLXJ0ilsU0dTyWdSxL3nxlqiJdKDa/GrELCi3xETp1OfTWmRlzxrIGme++FONZ22v4HGGyeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6WEGQ2OBNy1nxidumBp6C95cvPgZozj9QUuFUPsSdg64pAluf
	JsFeLfel/srQoXLq9B0Q285k+BgQWX/fqPZ3IG/2OoraFCjM9WwfUJjPRRQg5wiBzIsuWpffxER
	f9m4k+amxhm/kCwtlpmEJRNa1pPpsI9Q=
X-Gm-Gg: AR+sD134UhQ+dDzWg+XZ0bko7xtnA9FOoM2B1mIXFlWuN3B+ttrHUJtOuzmZIDN1Bh4
	UGW87QnnhvKN3PeWdOmICcCtunYRYe/u32N4i+4rzqRJhXsMpK79y8dYQknbHc1hciIiDTU3JtE
	EgEJQeqXgrMCr4/dQ7WPIgfSM4D0wPgI371P9Dk3Pu8J/5VR1oAwW47aJmTnSUjPdudAjA6mhmZ
	INLnx7tus1nqLKwiyDvDHsADDsEBLuWYtivVacyqH6QlpPUEwa9lJCKXvtEA/YXOyC7gGk+cPVS
	glGBWRCFLbYRvFmsEQgcNxtb1ryOPKsJdJHiJA+aLhPAu4Ir0wFQqgkR8r+NyIhGJx5neFB6EZd
	861s0zzrJlB8rIrZHUMEUdsjAkI2veLpys4L1w9Z5qhtqjxJAs/1prbWIHL75
X-Received: by 2002:a17:90b:1fc8:b0:38e:ab3f:2c99 with SMTP id
 98e67ed59e1d1-3903c628181mr18187876a91.2.1786122759120; Fri, 07 Aug 2026
 10:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805-pramin-split-v1-0-ff3e84a75dac@nvidia.com>
 <20260805-pramin-split-v1-2-ff3e84a75dac@nvidia.com> <DKIRNHGHK4O6.2IRJZGM6W79B@nvidia.com>
In-Reply-To: <DKIRNHGHK4O6.2IRJZGM6W79B@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Aug 2026 19:12:25 +0200
X-Gm-Features: AUfX_mw-cYa1MKRYuhH-uVGjXrAOGt3b9pyVqsuViit8BjsQ3XkXMD2u-qTWwOs
Message-ID: <CANiq72kYqPySwS8ci84CEsvjJqCTBjrveSx14xxnNWJZWRFAuw@mail.gmail.com>
Subject: Re: [PATCH 02/12] rust: num: reject Bounded::shr overshifts at build time
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Yury Norov <yury.norov@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:03=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Indeed it looks like this would panic with the kernel build, and can be
> easily caught at build-time since `SHIFT` is a constant.
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Do you want me to take it this cycle? And maybe the next one too?

Cheers,
Miguel
