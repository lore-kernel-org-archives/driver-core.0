Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4078428750C
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 17:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139597; cv=pass; b=mg3o2RR5o7ekbo1zB8GROKnl44/cB1MbgLY8yNPygKiRwRcqwTZukOzVN0+bNq8fp/spZqR7pujkYDiol5+OScc9ikhHJIr+zEcD/pfghNtTN8Ttl/SKoxhEHEz5qJ7Uzlwlpa7QKiWhwPV5aDS7rh2ELrjT0VoKVMU27EHpuEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139597; c=relaxed/simple;
	bh=BVSKK1sQZS2pD9gylNFVpwd3l9Oh8g0ThiOWKnSHB+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRzOxyiJdOPhXhC7JYhKmIXbckjc+23bZaFdE+iUyGgcYeo03j5xRRuj/OXER7tpG7GxGdb2f7z6Pgm2XI1nmfQxabEZi/UHliECrWPHSbBCKD2ifFuKoMN3UNhK6u1Kmio3/yu/ZeP5wwvubnF4YQsl1OQR7mpm1Cqv+oYv4vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uxk+nIKZ; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uxk+nIKZ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so11846a12.0
        for <driver-core@lists.linux.dev>; Tue, 03 Feb 2026 09:26:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139595; cv=none;
        d=google.com; s=arc-20240605;
        b=FY9uwDbN/wHYgbF58AbwLa8IqKUQKDxp1lSjLf4y9xwv+lEmdBMvMKxngdD4Ba4vFU
         akGLsB/62eFBlVfDRX/qAl9EJftkUqyaZT9aGoD5iXJiVh+IjbOyJN3Zj1c93PSOxeug
         yvlzePn8sHlSW0yYDWB9zuXxKPpai/PtJbc43mbsjJSuQK85bSVzz7uLrtqn13GKcZWa
         EepNCSRJRali248Oc3CbDv24LaghD6913LF0giGne5D+rqtIcyxvi6qE2hTVmI7sI5Y2
         L8Qhi3wcmseZ2Q2gALXnSyefEzoGxbCESv1F+TJXANWULSVnwfmBPTumN/KLt04Lvf0F
         kJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TNaiJtMpISY5S0HDy1ONbkfjtxu0QVlIHfgawUN5ajQ=;
        fh=5/M7eBC9EL5Ii1CfKQp6Dfw2jYzNxZM8ko2/Z8atsGM=;
        b=Y1n9QyC+klg2M/8bUO/37j+cAarGQ2B5l5Bkc+qnb+PI+r9xsomoEoaxmNB4RyQGbL
         qQxi1aTBqLSplffIPJOtobayZXHyyXFL9zRe4kLR2fRBgGE71fshy/hxrN33qRbWAyaS
         tKJZ2zP5sFsZgJbXaQsk9mpdCCNtxMrVE6Y4kBDxN6Bm4mIGD6t/iikMr1JzyWW42yd6
         RF97E7sRcVganUIzyzWorY59MKWpRp3T3WpV7/OSZRmPqzKjt+jfH5qLCxtWRAghCbcd
         bbvpRC/9yX2zSX7+CWrBKftZfaWv8h0f94xLAjHC3X9SxAHXc5E8iRxwm+nMJtB5fPil
         1mnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770139595; x=1770744395; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNaiJtMpISY5S0HDy1ONbkfjtxu0QVlIHfgawUN5ajQ=;
        b=uxk+nIKZumQ1wW3kT3OKhl/HMTTAXj0UshiCo3pSKiv1ibRy535CPX05YcHvDD9Xpy
         HshAKIexbX4e/r4R6WMpEUX2yzXfElNPT2dwGhMx2jBSGQCBUSsv7iNgRJ/YfLDfuwT/
         s/6Xx0J2RRe+AWYm9/cJEkK24Tc+neRGa0BGxaA3kRpbyCL8CI8xCwsoNin/L+9WY6jD
         pbigY6HpVb7xvgvpb1sm3R71/q9c5mIhEiA/7ykN1WjnI/KfcsnMPfUxaQ3cS67WSd0+
         6WCrnDe3270A67HiM2K33vqQNUGe3uj0N+ter/TBt7Pd1C5JCVfsB+UytmOQrBUI4fYq
         pEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770139595; x=1770744395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TNaiJtMpISY5S0HDy1ONbkfjtxu0QVlIHfgawUN5ajQ=;
        b=JkjbJ4R198vylfiZW3QcIM6FaKsJoUm7RqLpM6tymrM6yWNcD2qfkT/1535eEmQFFX
         /fR1YecZ/dzxnyEQOMQIOkXiLui7GWp9VrTlLefnMtraDzx9NNr1jt6+uKfrAZGcv+xt
         GW+APxibXlhf5SpkIp03DgCTMLq57w+fA56ZhLkaFHUhawt29JGlkiWDwqYB6BliU10C
         Li3HKyAHxqejFLQhNcGcuXu2k/8SdJRbreLXsI9SueN8AXep3Kb821pKBfhIPm1C1BHV
         Awp8SOx90/H6lfc/KiYyJvB9beO9jIi239gTZ9uPjpkWuYfsc9cZE2h7UpCrGlv7aJNK
         OKHg==
X-Forwarded-Encrypted: i=1; AJvYcCXEyBZoGx6r/uwVD3q6Ku94UUXCK3SY1NREcDdPio1tlR4W8KLJM7uHllBHeGKDiCkrFf7VTKbeIUFAyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YydWBDbU/Lex3yN2EnOayBnKqrEfLezoKZIvL9Dy/NGRljpNmwj
	UTTDk2TZn/7PGEdoPWvfaRw4USIsEYD4g2/bg3GXcN1bhcYsqTq9u5ErrIl55IR/hLm7m2IVcJq
	KtZHAUAjrlaYZS4Rljp7Hv1MkBTguSIyGu0b6GBSZ
X-Gm-Gg: AZuq6aJRhVXwubKTV5Y3I1aHmV1nWX9s7VaPD8d2BLmA9jCbi0HoEQ+haqUpRsSzMAA
	jqHxGU5kl8MgWYTpWa9enIZF/fnP/iLvcoH75zTTIvRlXYYQYDzRT5pmcbSfAYIFieqFd3ySm7+
	+UkmbG86jHUDLz6CICq2YsOSjwm1xgiTgHvB9f48kCqlCcXCvsUMznaMoX4p/Ve+UC8lgZOAPWy
	QngHfQc1R2Td9StsxzYyeDSkCSnKkrDe6UnYI7D4rskx5eupi3eExW/ZZUdY+INy7i0ZWiQIy24
	R3ns60XW1n3nKsCBkcriBh7E9A==
X-Received: by 2002:a05:6402:3098:b0:64f:8fc5:251c with SMTP id
 4fb4d7f45d1cf-6594a353279mr5513a12.18.1770139594461; Tue, 03 Feb 2026
 09:26:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-6-d6719db85637@google.com> <2026020315-conch-trickle-2d84@gregkh>
 <DG5H119NY68Q.TWLCK3W36CM5@kernel.org> <2026020347-sneak-embark-1b36@gregkh>
 <DG5HGZG62NNS.18BCSOO6TR70G@kernel.org> <DG5HX5K2T371.3JGY5PQIV554K@garyguo.net>
In-Reply-To: <DG5HX5K2T371.3JGY5PQIV554K@garyguo.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 09:26:23 -0800
X-Gm-Features: AZwV_Qh4ac161-isyLFn5NPWx7VX7FdmQ6d8uiNuPee-beDbNAjAyPPpvPjCwQs
Message-ID: <CAGSQo01qf4i6LDyi1umH6-6vjiE-VrFc1dd+qLxDXkjiYLcOCA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Trilok Soni <tsoni@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 9:17=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Feb 3, 2026 at 4:56 PM GMT, Danilo Krummrich wrote:
> > On Tue Feb 3, 2026 at 5:48 PM CET, Greg Kroah-Hartman wrote:
> >> On Tue, Feb 03, 2026 at 05:35:24PM +0100, Danilo Krummrich wrote:
> >>> On Tue Feb 3, 2026 at 5:28 PM CET, Greg Kroah-Hartman wrote:
> >>> > On Tue, Feb 03, 2026 at 03:46:35PM +0000, Matthew Maurer wrote:
> >>> >> +impl Smem {
> >>> >> +    pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) ->=
 Option<&'a Mmio> {
> >>> >> +        if *dev !=3D *self.dev {
> >>> >
> >>> > How can this ever happen?
> >>>
> >>> You are right, since this resource is local to the driver, it should =
not be
> >>> possible to have another devce from somewhere else (especially not a
> >>> &Device<Bound>).
> >>>
> >>> However, from a Rust perspective I think not having this check would =
be unsound,
> >>> as the method by itself would not be able guarantee correct behavor a=
nymore.
> >>>
> >>
> >> I don't really understand this last sentence, sorry.  If this is "not
> >> possible" why would that at the same time be "unsound"?

The code as it stands doesn't do anything that would grant `Smem`
objects to something that exceeds the lifetime of the device. The goal
of bindings APIs like these are that it should be impossible for
someone to write Rust code without the word `unsafe` in it that breaks
its invariants. Without that check, someone could do:

let smem =3D Smem::get(dev)?;
let f =3D move |offset| smem.try_copy(offset);
some_other_driver_or_subsystem(f);

That other region of the code would now have ownership over that
function, and expect to be able to call it safely. We're not doing
that, but we're trying to design the unsafe API in bindings so that
you can't mess it up even if you wanted to.

> >
> > It would be considered unsound because the function itself can not guar=
antee
> > that it does not produce undefined behavior, i.e. it would otherwise be=
comes
> > unsafe.
> >
> > But I'm not an expert on this, I'll let Benno and Gary jump in.
>
> Yes, in this code, `Smem::access` is using the passed-in `&'a Device<Boun=
d>` as
> a proof that the device is still bound.
>
> If the check is not present, the user of this API can give in a reference=
 of a
> different device, and now you're pontentially providing access to the MMI=
O
> region to a device that is not bound anymore. A important property we wan=
t to
> enforce is that UB cannot happen no matter how an API is misused (it may =
still
> oops, which is bad, but better than UB).
>
> This particular code, though, probably should use `Devres` as Danilo sugg=
ested.

Mentioned on the other thread, but I didn't use `Devres` because it
being PinInit is problematic and I would need to encode an additional
invariant anyways.

>
> PS. Personally I think this check (and the one in Devres::access) should =
use
> assertion rather than `EINVAL`, because it is a bad driver bug when this =
is hit,
> and adding failing code path for something that is a bug is something I r=
eally
> dislike... It should at least be a `WARN`.
>
> Best,
> Gary
