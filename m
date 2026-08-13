Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817603B27D1
	for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613577; cv=pass; b=bH86QmbPAUYP9yZ9PXMCBYVqP+KypxME/I34Yqm5DrH8IOZeNpBB+Lrvln1v1S2yTk4gMnhnHvgWVv3UZ5YtC/hRtLQQIqF+xeaK0n5N7zU4pH8HDB9M2/ya/pL3+AB0dS8ntQGp+WjAP242BZw2l0/EL/3vrJJEw+u82ZUYLsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613577; c=relaxed/simple;
	bh=hxPH+ehBPzRCWk6w7xeKnqdyk50jcH5XyZCkn0NKK1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omtcjjLfBdfunTrjy72wuw5ala1mevCSAISm1jmhcenmyMVgn84w8Vm20l+/d7YFH2+yAmqrTQKCm4uct816HMej3YanPrmL1fnfxnmhp0DWcYwWL77x7Zih2ugyl5a7vwhQ7XTZIJdZ2pAsZ3ryaSfQT8XBBleXB1C2GCv7U4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIgjMVnH; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIgjMVnH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ccdce28edeso3396965ad.0
        for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 02:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786613575; cv=none;
        d=google.com; s=arc-20260327;
        b=Tkq4ySIlWNRnxUOYs71+0uHMmpkEks5jQRboQ2aa7PnIzix48EzfctYvERns+5Ozen
         dPMkOz9CMADo4IvqYdEP4ssbRfF3d+uMDeTh2oHM8+Ze3ICtNVkBInfZOMV5lvfr0/CR
         XljLn5M3John5Lq17V0uIpBG+yPseory0f1tSSogTfT8sIVYw+z1PQshni8y+tU5rZPD
         LPg032J0JpRgTMwmXIV8uLQ1G6RjUQB69MoitBgIigT0aKKp+4r/9Zy1leBnA8nUf5QY
         8U3VoWGpCeoVfpznw0fMlcbqqvsP2cCSuhdmQdQJdWB3817aPpnPco6Ocv2pDtBeHoVZ
         JAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        fh=4UrcP6qMJWnUt/qN6GrwpRQ6nZOZCgRDHZ33Pb8O0ag=;
        b=gVdDyZm8FiTJ/hCBkSM5MAzU1FmmRtnPHJxcQln7RHas/g1YmmM+cn0FK5l4z11iiW
         cvRstZi3/RjDflzXV+IdpGJ6bA8p81ONrgxhRtRXG98aHVQzPG99Ra0TSR72iIDLZunk
         MB3xpD95ePEPB4F5+bXa4mrZBNV0TOSJTD37k9tuXd0xm68aoMSgHoiTUlWX8zTOGjwu
         6d2VMSbSzpOl5SpyBgl1xplLG/WpSiR741kaaxFtMtgXP7oSlBlmrITT8DrG+fII4RUE
         WtPM2y2UIJ73LcLovL5JFpZfIS1CudyK+CJGVZYINOhqsza5W10n2ir9Rtf+XmAq1/kx
         5Ptw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613575; x=1787218375; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        b=RIgjMVnHB2lWhIlzcg6ZxsbfO20enyN3GuT01Lb1PSHYiH3Ayb5Nedn54r7qA+9Iig
         rZB+VqkZ4P3rLsI9NJxaeJ4Jx5GaM6IRoCBwqQ8wUmp3MyjxI1v8ZNYDYVzSo1IXyR8C
         vfjmo0y9nUCU+CIcsYGFWHx5fGhBd4XrppggmgpUzk3qzsENwf2+GVz1bM6tbU8QLIa7
         p0f0Zi/+avFyC7cU/20L999q1+bbY2aI/FJ6Q5jXeu+B/lq8TUBhgyzT5h49ESwX/czr
         KAcWF/jkFcrQnGhyoEfJn3e57s4pO8o19Djp1h7TN0zfnOywoqsDkqcmZL+hvWPb5SyW
         O7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613575; x=1787218375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        b=KuuJfRCVmNRN/nJfFWFTWd64iimY87BeyDgKOXoLV7kotgmMGhnbDXFPg7w3j0UB1D
         5jlHPJxw9kyUfkI22AkT0lfUkKpm5N/LNB6DEvwp8zZlLd5kZgaPFtLJpQkvQtsK1Lzi
         DNmjiKngdqV8MpwB+WgUyqiEv6H1uS8aMDOmvoiutYfTPNITR8xwVgTertBZouRciWUE
         +aGFAt5F9N8U1Dri+SGb7dwY7bl1+OT9+1RUaIx6cda3Bw8TaPEVY45atGVPM8Ggc6uW
         R1gcFAd+S/Zr0BItzE+IC73lyRsP+A066+MxjGZHAq2KAayggjCgck0Pf+QFG6F7Nepg
         dh5g==
X-Forwarded-Encrypted: i=1; AHgh+Rr6T9luR+VHxhyCZXe4jQbTG+QIQWLclCf0wQ581wT4WLZsg9eh2FVNE476yS47QzsTstuZnr8AN0/BTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEAQWBmU6AvXpdXmalw21iNLLGot+gNixRcRJka4lN3Sol5Aw6
	gCTb1ac8GCqSPkcp8jOktM++S1NcoE1kBSAi3RzFuXEtYwBT4+jjBXSvilxQBdc/l19xsWUVORt
	XReo5VyBpgJTFP66ezq9qboTrg8iGFc0=
X-Gm-Gg: AR+sD12dMykZK4Hxjh1Vg+YZmj1YWZZXYZYMiOCH+OeMsgEY83yIFvQ1tjhSDD1Ef7s
	tsH+Vi9d8ckzRAcU0e+MOyfD9BA2bWfy2mtazs3pmt/+R07hDWozuhVGW03ftxQkk1h2RXPzLHy
	GdGKy/46Hd9wgMpYl3IcRfo/EsmXyGZF7EBQ/FB6v9g/Q1NYU2lEGzMGRZWo/az523AvDhOWUMG
	trKcGnrQCwIBuCYek4Q/D9tSmI5nUI0VjK4nvL/FGg281hborZAy13oHMap44jBMkintcphKFxE
	+lXPjP9asfPelh72aLc8Jeb/DG5ZdpsKs016G3uIJYA0vr/IUUYIUn2ZEejhtQvwpmBj2+0vHxW
	yydx/AdZSBaEWhAptGbTinoGW9hks7e9B/QNVPlK7g6qN1AfHPgS+Vn6ya0Ah0Q==
X-Received: by 2002:a17:902:d4c1:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d389a366b2mr27617905ad.2.1786613574868; Thu, 13 Aug 2026
 02:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
 <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org> <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
In-Reply-To: <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 11:32:42 +0200
X-Gm-Features: AUfX_mwSjTSmX5g9cpyULDa32fuXt2Yd5-MIkCd-iXvVUBlQKiet4rzS7F5uPZo
Message-ID: <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>, Alvin Sun <alvin.sun@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 1:57=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> IMO this is the correct way, also consistent with
>
> https://lore.kernel.org/rust-for-linux/20260811-fix-fops-owner-v10-3-7e71=
776f9dbe@linux.dev/
>
> It might make sense to add this to rust-next.

Yeah, it is also consistent (in the sense of adding a fallback) with
the other fix I added when applying the series for the `macros`
doctest; and the `kernel` crate is not an actual module yet.

I guess yet another solution would be to have an even more local
fallback, but that would be too local in my opinion, i.e. we will want
to use it elsewhere sooner or later.

So I could fold [2] into commit 98f256e27262, but a commit on top is
fine, I will reference that commit from the new one instead.

Ok, done -- Danilo, I took your diff and converted it into a proper
commit, please double-check you are OK with the Signed-off-by:

  ec6fcf8a175a ("rust: kernel: add `LocalModule` fallback for
`#[vtable]` `impl`s")

Thanks!

Cheers,
Miguel
