Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A180E258CE5
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139037; cv=pass; b=fHCKczT5Fomw4YefsIY0bhzv3PShs+65eSrlh4q9EzJx0urJolQHvjodkB0qF0qlYaJZFN67jGz/4mHw+hgHVQ508j0FuFxF7kGgAume/3d+UCnmiKaYsjQ6+LxBmjwnHUH9lQD+1Uz0gDZmdBabIuF/FL3tdV4UiWfBZFliOaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139037; c=relaxed/simple;
	bh=UfW9ZbxSawettNRPZsiTFt/maBVXyJ58Op3z17lDyS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3wVVOJ02A5R9sGQJayVeCfYwY+vPjFHzwNb3s/Ec+vt/r6QjXHBZro8fz2Nju3Lb/jGonazonsxSQA0y7qxytju56dE6ikJzh+WL4rDB2SpeVa8ywUWLd6fUoIdC4q1FbotU0E4SxzJuknwut2SdqHzdxsOi8qM9mvOVLYSTTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1SC7GBh9; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1SC7GBh9"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so11567a12.0
        for <driver-core@lists.linux.dev>; Tue, 03 Feb 2026 09:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139034; cv=none;
        d=google.com; s=arc-20240605;
        b=ImIe6Kkbgp7Gzq63Iy++fPeVUB3tuCwTy5A/iX2JMenib/w0itoVx1ES7lOBYSiVv7
         g+/+sWPeOSgchVBLnU2OykfCQT8JK8KEsFp7VybyLlyRzN5K4c2HLknRPKyzwppdHbWJ
         PvoUf1v4zH2BvHldYjMppkJGws29Kum3LfjfdTMYwYuq9YgrqdwjdhbHWSnI/faknAwL
         sJD4a+5AQ5EDdxyeGnsRxCtZiH86+eN2ikATsn4v+OY2SmoeSrWaVkEo97mrKESxvFsQ
         XJ69ClOh2mqZygXkjECymA9rIQRGHebi2JbBkdefj7I4oq/5TtKVGJEQv/RxfUnxdVgE
         TsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XHfoxmbIC6zkgG4vIkE5TIaeovg1Amtxgwva3GX0OJ0=;
        fh=0zcRkzHZ4oij0zlUNbLWIhSd/we3E6fkC1m5xOwVAsE=;
        b=OTxDOgh0ti8ipzeMq5FiIoDUO1RyonqdS83+6+GbVsuztrX0Vj8aX2Gj1srL8AeuCQ
         hWAzsTkQR1wuGwXC5s1oF2aVzyZGiYHPYmAo5FRYuKY1aUohzNQzlSNSzK+c0A0DOBOD
         ienfg/dcJgyJwcXb+wuprJvkiy7oVlQnPz6S8KTYYumdwtnD5fTOf9tKTdm+CYUqR9GQ
         adsCvbSDv9uQCygOaeeh1NGa8oxnPYgIBXzTHkF0HCz+RbNmQPyjs5HXs0NPondrS0VQ
         qU0jHOd7w9/+HY+gT3SzROk2yJx8k6RvxLtjg7vDZGLLKq9ADAC9OuwtpwvUraVlCOe4
         MlZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770139034; x=1770743834; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHfoxmbIC6zkgG4vIkE5TIaeovg1Amtxgwva3GX0OJ0=;
        b=1SC7GBh9/l5UpJr1XZjoRZYYM+WR+feZzaUBdKwM3NIwVNIUd4dJIq3Gq/kGjftd3j
         6lyzzGoRhZxI+3xeZG44dAcFgo8CYLUoiHW4FUGhhXIxnITKXd8mgW+RKE+ex2QOsKTf
         CAQXtQa+G5ZZBJEyjZst/z+CSp5W6Hd0cOcFWRhlkoWXEA6clicObo0bN7iqElmwyFNr
         6hw4GTb8kbHAfrNIWYvzLvEDTY7cgbmVp7KhUCYR2RtV5P5FfiLrv0h2PwCgWr3JDPax
         s7sPxMowk+r+9nKGaNMW2YaEe/fyXBPl7tVz9b1zaaBmjk4msvIy8ZwGar2pn3fMDBAa
         BAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770139034; x=1770743834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XHfoxmbIC6zkgG4vIkE5TIaeovg1Amtxgwva3GX0OJ0=;
        b=Kp0Ttw3QBcYix0aO/eHEI6k5BC4/Vi7MfOksBV98sLGLKRBjyTzDS6LuDCEy/A/LVD
         7V46ir8oVJmkgXgOhvSkqSe9QiN6rtpNl2FxEv90BiHsHhIC+61z5iqt21rB565GNH5G
         RdcJKEeJSYfIrz2tguI1cwwkVsQSuJsmcFAwYR/0TFfSTzBBeCj/RYXqW5ISwEN/B/m2
         vMb8VmdT2XO/xh0xCYOxdhwcha3Wt7PXDNM4tk269eaKWp6ZttGXOlDNBKoYiyEaeDQ+
         abnKw1m/qKJWtBR3f8fC0CXefnxZgZ2QyeFAcevrauC5w2qhUKQKgcAVLVxWLL6+NAoP
         ybSw==
X-Forwarded-Encrypted: i=1; AJvYcCUjvAfTwPbzw9h24jjdIVSe00b6QuYR675ZKEHDQ9XWS9QwkFz/9TmwjWHRpVctkATPHjoF6+gNoKVEHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzl/4ofS/O1LZAhNBKdgz1i8/poiyh7KRsYmonOxc5moO3/GLQ
	6mvHslvNtSYaN+9NkwrBmwnRMgipSaoq20SmyEVeW/+1fl1zGt0rOWpZ1cww2Nl17AGg5crFJpG
	cN6i3fBsCANy9tNMUWkpMdwhBE0yO3eSlHEAAPbu1
X-Gm-Gg: AZuq6aKuETSCoMSvj2t4lnbCD9VNDxNkvkLC3UnhpScq41BelidoRQSsP+zQeVGvXH5
	IERQVedhkb7z3GPN8PqBNfRLg+hCaVDDZy8KXnPLNp9iCJW3RIao1xnB7FcNP3FY9ppdqy0BreK
	ko2JkIUEimL2ZUduvSFrFaLIWzBhiE4zJA9zGUKbTYJD8xRB8LsBv2PSl5EEX7+nzAMGgDGq8Od
	U7hcbD9qReXU1dT7WG5hgse5XEzL7BRJElfvv3y3acEFARvH4BrQ1lBFi6qP9ZLIeM4KNAlMPS3
	tyuJdr1bbNlCwgVPjyAgdzzF/qx6cWSwu9y5
X-Received: by 2002:aa7:c1d8:0:b0:64b:53a1:7b09 with SMTP id
 4fb4d7f45d1cf-6594a34b6damr3702a12.14.1770139033838; Tue, 03 Feb 2026
 09:17:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-3-d6719db85637@google.com> <2026020338-gratitude-overplay-98b0@gregkh>
 <DG5GWC5MR1ZC.3VFVRL0G0NMUW@kernel.org> <2026020342-dime-sharply-3fd4@gregkh> <DG5H9N9QKZUW.3KLJW09OBNRD0@kernel.org>
In-Reply-To: <DG5H9N9QKZUW.3KLJW09OBNRD0@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 09:17:02 -0800
X-Gm-Features: AZwV_QjJ5I2wN6j4AaSDIxHXnmaEEy8I5VLzgVrY-Rhll20Eq-wK6CGJrbI2UCY
Message-ID: <CAGSQo00M_6-6S3Yr4sLdGkNH_KAgP1FoC3zbdwdFuEOxic5vqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] rust: device: Support testing devices for equality
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Tue, Feb 3, 2026 at 8:46=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Tue Feb 3, 2026 at 5:40 PM CET, Greg Kroah-Hartman wrote:
> > On Tue, Feb 03, 2026 at 05:29:16PM +0100, Danilo Krummrich wrote:
> >> On Tue Feb 3, 2026 at 5:17 PM CET, Greg Kroah-Hartman wrote:
> >> > And I don't see what patch in this series uses this, am I missing it=
?
> >>
> >>      impl Smem {
> >>          pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) ->=
 Option<&'a Mmio> {
> >>              if *dev !=3D *self.dev {
> >>                  return None;
> >>              }
> >>
> >>              // SAFETY: By our invariant, this was a subrange of what =
was returned by smem_aux_get, for
> >>              // self.dev, and by our above check, that auxdev is still=
 available.
> >>              Some(unsafe { Mmio::from_raw(&self.raw) })
> >>          }
> >>      }
> >>
> >> It's used to ensure that the Smem provided by the auxiliary parent can=
 only be
> >> accessed as long as the auxiliary parent device is bound.
> >
> > But how can a parent device ever bevome "unbound"?
>
> It can't, that's why auxiliary::Device::parent() returns a &Device<Bound>=
, i.e.
> as long as the child is bound the parent is guaranteed to be bound as wel=
l.
>
> The point in this implementation is that we need to prove to the resource
> container (Smem) that we are allowed to access the resource, since it is =
only
> valid to access for the duration the parent is bound.
>
> In the end this is equivalent to Devres::access(), which bypasses the Rev=
ocable
> if we can prove that we are in a &Device<Bound> scope.
>
> Having that said, the code should probably just use Devres instead. :)

Not using Devres was intentional because:
1. Implementing `subrange` would require more unsafe / invariant logic
with Devres. I would need to either wrap `MmioRaw` in a wrapper that
maintained that it would always be inside a Devres that owned it, or
wrap the Devres<MmioRaw> in a wrapper that encoded that invariant.
Then, I would need to propagate the `dev` from the source `Devres` to
the derived `Devres`.
2. Devres is PinInit, so I can't put it in a vector.
3. I don't need the destructor feature of Devres that necessitates the
extra complexity, because this is morally a checked borrow, not an
owned value.

I considered adding a more lightweight `Devref` to the kernel crate
which only supports types which do not implement `Drop` and access
through `access`, and so does not need to be `PinInit`. However, since
that would still require the manual dev propagation wrapper, it seemed
like it might be overkill.
