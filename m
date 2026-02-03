Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0363A36405E
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141858; cv=pass; b=A3D9CXETuQQfZgcUrWXTo3gSKp2IDZy6XqZ2tEeXFr5nKJyNrcmFB7GF66+bxQkwwa1dX29n40OC368ARnPbIAb7KwMx8p84+K0ftKcvnHJ5k6KEjIs7KhRij/lWh0C36ihzwT36hP9jo0Jt52O5Hd/cqow/ppGmhCsoS8e/KIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141858; c=relaxed/simple;
	bh=NiYmGhBDnkvI8ZJQgcCZNDyToFlarmUji712KD5FXgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aavt2zUaeuOSXhTNMGXE0M1KmVuikqdjYoNyeEnYxSqid831S2Tf4+ucdJUhIAl+gPmTffOWchKAS5+jNw0D00Kk0X5tE1KKf6dNh6OWt5dqLbCPfHN4GJU0Rl0DFJVa2MpGW/Px04CyLMSyxwvL4cPhMyfrTPDaxdpqEe2VHjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Epqbwyfz; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Epqbwyfz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so486a12.0
        for <driver-core@lists.linux.dev>; Tue, 03 Feb 2026 10:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770141855; cv=none;
        d=google.com; s=arc-20240605;
        b=VyIfmU0tIyiz85v+O9go9zVQXiCTZ9e8SM5nvJHFmIrL74b1v4m/MNNZfjyyyu2/hX
         V5fd9cIV/VUhVcwGtGu7sqPoPOthXFbrRCqgQxCVMadnDQQJhmgkR7NaNdWNRRiU/lA1
         U6+Uuu+6ZBux6IivPOr9ziugbZddIyMoPsFwdyzfK+JRM3lBGQ25+ExCALe66t63oAjc
         /P42413KkvdbsR5IVEMCZU2VattbVsIuGYfFYvom7+ednfFlF98F27/Tb7195U0JYvzI
         UsF5tDjumoKMKHXq0d8IBxDivgJUXB9XBhsL+/7dNCkI+9M4u883m8hF8Xl4JN/Vrq27
         zkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
        fh=oA00wArFCgVaToToHbViBhDoXxQsHggz022LTFDOz50=;
        b=ddyoFtej+1iJZ/YzvxCN9MTQif3/fmvG/zfklPbNk6jsbTLQz0EQtyXnr0WYSTbcHI
         FYb/8b573LalcRZNceg97OvHjTuTSnUt0K0mLq6eCnURaHDCPZhUlcEn+P4HC9F5UVWY
         JZ/xeFm6W5SUZKf/dCuBy2yddNSlPDZbiCUJZ2ieENhX25XDANf+fyIs1Ffzzb6aCyVc
         wl0Sg9aiLQmaF7cunjFcKZoIvLTW2ottq10GdMwfN6SMcW4tRDzeEtQ8tVwLrQEqFarD
         LLlRDW7QPcPsk1h4f6NtEfMn/5rKJkfQemIGdIJaqrHgDkkDn2xAeKhr3nlHUUIkr7AH
         9W4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770141855; x=1770746655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
        b=EpqbwyfzD1HLBQiiRVMaOA5I/34vQQK1NUitJa/q3nmlotJ9uFAcWBf+ZGFU/dwR/i
         eX7ATBNMoXzYB8nVwY4Bx+8NPEMMQAJ8jVrAFCJYr+bJoNXuEW0pSHF3VGPsa5A4CYnT
         li6fi/qaYoCipeAVHSBHsqIMqfdO5oG1G/FnBpng27L1giioqHTKMGkDFBZO9qOVFv6a
         OACBFukJKlI9YmGAWHXQ29ubVbbYka3QAo2SeHIepIgG9QedeBG5VB4bMx15WtApMWcP
         g+nWuya/BUkginj4FLGtWUt9xTrkJH3Xt2hn2kXDKOjHaJlfmgI6Bm14YRqi62GAkJMF
         4kSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770141855; x=1770746655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
        b=rqZ0t7ELaGpyj2bSnckpDK02Q01Ti7M6wfFsHYJeEmSPwBb+V6WaRj1FTIsQsh40S7
         z104J/JUGGVWf1V6avvnapPdXesFbHcSI2d8xvKIVe+fQoqQzPLbGaK6rnl3wxGdnQvf
         ug9+hSr3rlLtAheIreLPhCPAsOQdJFIHaamnVLzHV0IC/xTfVmYMbPu2hAvjLQNQ971f
         3EVaVyI3shG7tLZGNuqDDcPIw9RE6mwYO9DUrCZQo43se/tLEoZwHpAa6EHoXbyB7Yzz
         3B2iFN8XylIisNOpyuaV9D8VM6OJwTZ2xuHuQyWNYS8EGMCxzI1TNH2BFNRIs7rxh52q
         o/cg==
X-Forwarded-Encrypted: i=1; AJvYcCUGA3eUzi8/4OtH5J2AcoWYEtGra1dhuuU69rLOnLfeWY32nPJzVBs1vLtlECWDyUqkt4giNthuBwFteg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQkdOUYJIUT5sxLMUxC7Z0y9kflFNZhbrznNRWO8UC+v1JXczo
	byKS22F2+5wnp2L8bH1L82HjG7EPpTGj5H04BdnCyk7wMwyzc5uIY+4m6exLD3ElVXowmC1xcQP
	AWrCEhlSYiUQMG/NX4Aql09WbVu7oEdMnm2g8aVmD
X-Gm-Gg: AZuq6aIIp2EUt0DEJ+lDZUbDoV3rnCGGNKNnWk446Fd15giuPqs/i9UFVyQ0BAYdD9J
	Czd5xCwCI7Y/4KGOyc59Pf/ZL/3oreG209HIvLAF31h+v2/lkueC3GsbY/hkwG5C2RUeMQAFbp8
	DhaJOBgd1C/meY6scExR+mNiTkGmPHJFjuPTFA1sXwEwOiOE+BPGPkSVDfU/ArbIeOripSGTY9u
	AA1Uxbilb2ju/aBtc92r61QSZ2IyfVTqiXFX6rfrTE8AamG7MowzK7tfLO3qyt/XWCOrqcL3XH8
	IXvKbCjotWk6wwYfTDgnz6JepA==
X-Received: by 2002:a05:6402:5351:20b0:659:3fc7:e1e1 with SMTP id
 4fb4d7f45d1cf-6594a350f8dmr6491a12.16.1770141855228; Tue, 03 Feb 2026
 10:04:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-5-d6719db85637@google.com> <DG5HAM6F5QYE.1ZFO7GD3SL9V0@garyguo.net>
In-Reply-To: <DG5HAM6F5QYE.1ZFO7GD3SL9V0@garyguo.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 10:04:03 -0800
X-Gm-Features: AZwV_QiFdGyk29eec1MFmYhNyUzLZTIr17YBC0D3LJX2IXJzzxnb_bKNmlHpqIg
Message-ID: <CAGSQo03g8bjRosYVPzxhK9FpSW1ZfW52unPaoxpcn=pXaDUriQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] rust: debugfs: Allow access to device in
 Devres-wrapped scopes
To: Gary Guo <gary@garyguo.net>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Trilok Soni <tsoni@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 8:48=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Feb 3, 2026 at 3:46 PM GMT, Matthew Maurer wrote:
> > This adds support for creating a DebugFS directory which is aware that
> > it is bound to a device. As a result, callbacks under that directory
> > have access to a bound device which gives them efficient access to othe=
r
> > Devres, ability to use dev_err! and friends, etc.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  rust/kernel/debugfs.rs | 40 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> > index d7b8014a6474698235203f2b7d8fec96f2bb43f8..ac614d693fa73929d095b66=
9e9ba61958bec609e 100644
> > --- a/rust/kernel/debugfs.rs
> > +++ b/rust/kernel/debugfs.rs
> > @@ -11,6 +11,11 @@
> >  #[cfg(CONFIG_DEBUG_FS)]
> >  use crate::sync::Arc;
> >  use crate::{
> > +    device::{
> > +        Bound,
> > +        Device, //
> > +    },
> > +    devres::Devres,
> >      fmt,
> >      prelude::*,
> >      str::CStr,
> > @@ -722,3 +727,38 @@ fn new(name: &CStr) -> ScopedDir<'data, 'static> {
> >          }
> >      }
> >  }
> > +
> > +impl<'a, T: 'a + Send> Devres<Scope<T>> {
> > +    /// Creates a new scope, which is a directory at the root of the d=
ebugfs filesystem,
> > +    /// associated with some data `T`, enclosed in a [`Devres`] for th=
e provided device.
> > +    ///
> > +    /// The `init` closure is called to populate the directory with fi=
les and subdirectories. These
> > +    /// files can reference the data stored in the scope. Because it i=
s stored inside a `Devres`,
> > +    /// the init method is granted access to a `&Device<Bound>`.
> > +    ///
> > +    /// This can be used for cheaply accessing device-protected data i=
nside DebugFS methods or
> > +    /// accessing device-specific methods (e.g. [`dev_err!`]).
> > +    ///
> > +    /// The entire directory tree created within the scope will be rem=
oved when the returned
> > +    /// `Scope` handle is dropped.
> > +    pub fn dir<E: 'a, F>(
> > +        dev: &'a Device<Bound>,
> > +        data: impl PinInit<T, E> + 'a,
> > +        name: &'a CStr,
> > +        init: F,
> > +    ) -> impl PinInit<Self, Error> + 'a
> > +    where
> > +        F: for<'data, 'dir> FnOnce(&'data T, &'data Device<Bound>, &'d=
ir ScopedDir<'data, 'dir>)
> > +            + 'a,
> > +        Error: From<E>,
> > +    {
> > +        Devres::new(
> > +            dev,
> > +            Scope::new(data, |data| {
> > +                let scoped =3D ScopedDir::new(name);
> > +                init(data, dev, &scoped);
> > +                scoped.into_entry()
> > +            }),
> > +        )
> > +    }
> > +}
>
> I think it is a big strange to have this on `Devres` (in patch v6 it has =
`Devres::dir` doesn't make
> too much sense). I would suggest that we domsomething like
>
>     impl<'a, T: 'a + Send> Scope<T> {
>         pub fn devres_dir(
>             ...
>         ) -> impl PinInit<Devres<Self>, Error> + 'a;
>     }
>
> To me `Devres` is just a generic container type, just like `Arc` and `ARe=
f`, so
> the assoc functions should be defined on the concrete type.
>
> Also: is there a reason that this needs a special API, and by
>
>     Devres::new(device, Scope::dir(data, c"name", |data| {
>         // use data and device
>     });
>
> ?

Yes - that won't work, because the function being provided to
`Scope::dir` is `for<'data, 'dir> FnOnce(&'data T, &'dir
ScopedDir<'data, 'dir>)` - this means that *intentionally*, if you
capture any non-static-lifetime variable from outside the closure, you
won't be able to use it with the methods on `ScopedDir`, because the
`'data` lifetime bound should stop you. In the general case, we
wouldn't want a reference with the same lifetime as `device` in that
example to be usable inside the debugfs callbacks. The device of a
Devres wrapped scope is a special case because we know that it will
outlive it.

>
> Best,
> Gary
>
>
