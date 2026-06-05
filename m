Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01D3CAE7B
	for <driver-core@lists.linux.dev>; Fri,  5 Jun 2026 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647830; cv=pass; b=e9vbLUD4rv4s6uzKaZKbfwI1Dvk4wET88OMcmFVutpvVpQ1gTtCkeZPswz4uhvkcF7sD7iZ8e07XIlCibfGqMqIs8MzPnC62oMaRUe40lT3eYVobQDyZMGoXlUNDjeeej6S+0x+/0Dsws1pkppgk62ZE2X6xC+R7gWTJMvTDdjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647830; c=relaxed/simple;
	bh=ztvFAQnPcWQQLPxoeTzlegVkk4Ybko5X4UCIpwXzV6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kb4qvk1HRalbF1QxSHte69sXs6M3Wj46rxcI0gs5uHuVOZZ7oRU2yledOBjWNmjPL7bIyEEWA8sgRJlpFaod+WiAs1HNpsxcBlE/R3RpoLsFXj6gniwwU60wNMk/1r2UCwZf6rhIWfmZ6aOXRpuEeWbTEa4NjGiAoYrloQsKWQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQ06F+Kh; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQ06F+Kh"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304cf9a02f9so74956eec.1
        for <driver-core@lists.linux.dev>; Fri, 05 Jun 2026 01:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780647828; cv=none;
        d=google.com; s=arc-20240605;
        b=hqnc9BqElWJwpE0Xif4sxa23Y+FqHVEGpqAwBZONcfF6H7/Y0A75ZaHiocyQNM02ly
         rJrIBbuQO6lDA9mVVPiwO2gXuqFPjSSVSOhDJOE9019AAhpJY9/kE1omm+V+4zg3aZAy
         MVf8yjkYv8dFFqORLtZAHnXCWKiaJf4ICWC/Sxd+sO8m0hojAvWfQN9yGS24p3pSvBD1
         GemI0zrlU3Isjcu8o8depa7eKeW3iHgsk5OLsUImWm81PCfz6KQOdyoLq6LxyOhYZvAP
         jnhdr2lQyz++PzJrO2YvHkKxyTgYAGtNZWMdyufXNrC0oKjIbTjH/1//TRPrTve59qJ4
         V+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Sd19hW4Zhi7QaeR4Q5YXb6X/rEi4eqFLIxE0KT8DhQ=;
        fh=f1QUovXvOQugmYIJwTYhPkgwWVPmSrzYvIYA6IEJUhs=;
        b=f6O69Jdd3SOxDC+ILVN5njfNAAufjGf1Nz8V01OGIRhhraU84IoBQVPuv35pDop+cE
         wX3tpieSF+z1dSRHoWwV8uvo2tFCw1mU4bnqzfazKgusVy2ysG2BTauKYkP9+0I/xhTd
         eERY62g6w0aqj4UXv2tKIXlyoeQQ9nKlIOeOmHZu+7OhjCBJH1VBJQCb2Una03tIi5Bq
         qibBM0Jf/oWT/SDgoEhJokpeM2Z+8ptS+KPb8ImhF6zG+BXog1T/KlKvbp6kZzlGqQGL
         qLKZwDCJ62UDDa9cVz6c5glV6Stfz/gZBpJB9fuj/Oe6BgG4UCWb6C2yId1wu0sCP/rI
         u1Wg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780647828; x=1781252628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Sd19hW4Zhi7QaeR4Q5YXb6X/rEi4eqFLIxE0KT8DhQ=;
        b=AQ06F+Kh6UkDaQz8b+1y4rFn+XukIIGAtXn/AABX38lGWGDYPH8ESAJNdZsYAdUAQu
         EDwjvB16kF9zoFrvUD34ICwxEe0mztUAEuVCpdlfq4dNmzrTrWfPzmX22NEkxwgs0S5+
         2BHroABJWgl0g6k714ilaW9glrne2tDtQNru1i9I0EBUJlJRpy73blEl4v62/OT9y4Po
         O+/emRlKhNRFdlE9Abf454UFy0CXuqeDmz0VoLCF6rLfBxj1c2yNXCwqX6Sy9oUFDqEq
         ejiNN/mdRC6eq+QHMKY6I4083yFXbLkSF/CiqzaOSV3magkKOnqHT+RoJamBGJ4jTvwO
         ShIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647828; x=1781252628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Sd19hW4Zhi7QaeR4Q5YXb6X/rEi4eqFLIxE0KT8DhQ=;
        b=Z2g67mfBF/+5P3DfgH1qw5MAeclTgU5YjVI69luPMD1AanCchS8rxa+hgNK4imP3mn
         rJt5555MmozPMws7MBgHRAFWRKwzvEGK95RV7vHbwVN97fKEzN7OwxbrzDH2Hz/6y/US
         0e9t4r05VxY7NZGU8D/VpVm2B/ICZ6WvpWEq/WTwxJD/MQgjh1m1x2iweQV02UIpgyeA
         XQY5oRTX5qe1MLOrKVlz8OK92dQseHpDcfX6GeX8Z2yVINnOhoR9ZkJzhgA2iafQBPhH
         Aa6n8CNIlg758+UUQQAnn6FJJRU7uS/wpQ7jWfFyOD5+/mrEN5MEN4HeYFfKE+WSTR0V
         CPKg==
X-Forwarded-Encrypted: i=1; AFNElJ82hnxnz+zoaKLHeQUJgvM1NOeFVnWki2oQxKBoZo1SrT5ivdp5sAIzKq+ZNnMEgRa7uTr0rwcZ6lueWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyT0UEYebfkaOY1OyPbyJLa2zt4bcZMJOPzkmVmioQWGdbT11YN
	AJFOh8Wk5Xj5PTU/cv5xe7y9gFmtPPnnsio/XsdRtmWtZ+SGIbZs3OCQZKbiNIVGR7bO8jByi8I
	FmieKmiuCc8Fz2pyzqeuaVMVlga87l4A=
X-Gm-Gg: Acq92OF286f7Lk6rPcuH46V6FC+V38zpnhM9KDbedrUZ6s3zQ4MzfDlJSK2b5+AGcxu
	OYAFJg2lp6Fy3frxJVxOKpgzoxK1S3rLPV4Iqyc53z537h3rA1kndWm/Swr5ti0byF6uCpYi9zF
	tsWYS1NyDP9i0ONF3eJHWKQveMsKjqTMZauJLLWxDs6gqGk8p94GbPgeJSCMpTwq5zNKZZvc0qS
	KbdjjM5hGKdFKczklOm6EkEBLFD7icvsqhUMT6dM7fxGoRfJhuqcJ7FtQQ8AoYNFMY0Uhh71LGa
	ThQOqt8gxHSzAf833qWVJrUG0dDWlbFvZetw2GiK+4yKDVr+O20wkg2OyJ64OWSDVp9OHomnjMh
	ol5Y9Dmom6v5aZWXIEAu3x/wD9rRBpQpdvw==
X-Received: by 2002:a05:693c:3749:b0:304:c73b:79fd with SMTP id
 5a478bee46e88-3077b21905fmr565626eec.5.1780647827968; Fri, 05 Jun 2026
 01:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
In-Reply-To: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 10:23:34 +0200
X-Gm-Features: AVVi8Cc0V_mPWbgZwqJ5GOMV5Xx3qEWLtYtwsW8Dxd-NGXwfyyP5qAGAP7_StUw
Message-ID: <CANiq72=87b1heSP3ssk4+9E4+1Vy_Zk9eSC_9EF9Cs_mUT=hpQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Rework index projection syntax
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This series reworks the index projection syntax in the pointer
> projection infrastructure to use the keyworded syntax to be more explicit=
.
>
> Doing this allows adding a new panicking variant of index projection,
> just like the normal index operator. This is useful for cases where
> compiler cannot prove (or cannot reliably prove) access is inbounds.
>
> The new syntax looks like this:
> - `[try: index]`: Fallible indexing (replaces `[index]?`).
> - `[build: index]`: Build-time checked indexing (replaces `[index]`).
> - `[panic: index]`: Runtime panicking indexing (newly added).
>
> DMA sample driver and nova core is updated.
>
> Danilo, we previously discussed merging this series with I/O projection f=
or
> patch logistics. However, I'll need more time for next version of I/O
> projection (implementing view types that have original container type
> erased) which won't make it this cycle. This new version for projection
> syntax rework is minor changes only comparde to v1, so I think it's worth
> sending out so it can still land this cycle and get out of the way.

Applied to `rust-next` -- thanks everyone!

    [ Reworded docs slightly. - Miguel ]

    [ Fixed broken intra-doc link. Added a few extra intra-doc links. Rewor=
ded
      some docs slightly. - Miguel ]

Cheers,
Miguel
