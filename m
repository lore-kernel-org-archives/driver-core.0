Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD251390CAE
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537335; cv=pass; b=Pu4CxZQ8tiOJ7GwFEx2coJ/6mNhwnKoRVnRzTUQpQJ+tixPG3QbA9t+CUEKkm2gtlKG4EFo3KzSZCsKkzKIFiy9O8ZUp3rxRa8qh6N9mr7dqqi1hUpvJAVEiNcA11TCqImBbYfJAgt7m0Y3crwdgTGDGRZS9JGY68VYLW4XB6PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537335; c=relaxed/simple;
	bh=fQBoj1TH90YinvX7tOqOMb4BmPMJ09nlNwkXs74qpl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/NxK8NdalaJ1/t0F7vvBG+pDQ+xpfrrd/zCoBqfWfSoHfJu9ug3Quv9u5J+NVUym0ZXJIHaGNI+Mr939URXlW2Oq7uinz3mR6B13ek1ApmaqTYvyShj/wRC/+BoHeWo2ynwzVAW3kZQIS/J0Jdz4EnsSzmi73IIt7gVq1sfY0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ag6XBlYS; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag6XBlYS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so761833f8f.0
        for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 08:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774537332; cv=none;
        d=google.com; s=arc-20240605;
        b=T8ezQP005xFfzJux/vH5Zoiuh/LVQY1rgIkuGCeQCdm9hPawYnHzUyLG9RMxSNqE+t
         owa9y1TB3x063HFW4OYycwYEj+xL9UzqwxZsgdwmhNSqcTGiZhnKKqupVdZPyjHZVXY6
         uFB7rdAtFNZ/DAxW1EMzuI+bnCBssX179bH00LrFx7jfRLs0NSm7h1n6222q8128bDzi
         HCOiS6TN4kDhkau2VmI9imyEcG7X5wCrjwZXxdlB4fyUhONonwEwYpGqoOCtcQCsTFEu
         MglJ/BqOfHY2ktYvEz+lTMN+VFtzZfDXexrkt+Wli62n29G/fUa2WuokYctl82vr/Pvl
         PB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u/Sf6wOkMweWv83xQm9DiuxVskt6+OUeojXwOwVW50E=;
        fh=K5hvbJzc8RcZkh6C45C8TL1/OW86NXAP4AydSQzUYIw=;
        b=ZxDZ637vP3fZAZHFad46Ui/AFRyH6jxjafq7Mo8qxAadWK+JURfxffLjxymVH2dgXI
         KRidECm7IrXwIHTVvffIZq445ZVFCNo1yNQJHaDdV3GwzaoEvk9LvlTnFCkp4iSzzSIM
         MHaz1EqDJQMuWqBwzdpBCMBgNEbyE6Oshq9L4YQY3iuvD5EkE6jD13Gw2+6mxo0+nm+9
         aPTDw8sZuZNfU0r9RUr6u9BoJ3bYVYPgwlVFgGsHIluoPvplgPXWX8paRId+Ie3zFT/C
         lzRQoZAGLILefAvO99VZSm6z61GCbMPPaWuKnrWTnP0j0fy6heDcEyQGXwSFJjWO3k2s
         1KXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774537332; x=1775142132; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/Sf6wOkMweWv83xQm9DiuxVskt6+OUeojXwOwVW50E=;
        b=Ag6XBlYSPEOQqdBVtU23CYNrIxKy0bfuF3CDAUxnxoCOX8EKY1GHBjnWjA2460iuXz
         QxYMq74iazZ/PPK3A58VXceCHUdXlE1pvQ10r0tGxBOdDhPneoDpzJoOLlOJuP/FN8AN
         ZbYzVA6hfcJ9UahaMDMMDFoXzY2jT/0XKGnOIgupcRu1Yjbj2J2g1FQxF3R1tnAzNQV6
         8pPfFPugDFO2/jMnSPH9+FsexXD9NTMB8JEWAiorOIu0HGYWDd3QFir5uMVoZZOkQhU6
         PPyV2rDNUtFxU3NgLD1bn03pnlJWoIG/FqbOXNYGMBkdtYKh6OMUf8drACMSQMb61FBy
         vBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537332; x=1775142132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u/Sf6wOkMweWv83xQm9DiuxVskt6+OUeojXwOwVW50E=;
        b=ir44h/9O0l3VEILHYsDvCM63mt0LdrGCNxGofsbcx0N0OC2zH3Q9ehI+gUvCNIYliC
         EGKSVyFF1UIDzT/N4Dktj2xi0xZxFxcyfIracZga0jSmhN6BcWbLNRkRWdryjUH7KrXw
         puGL8iPoZL+hui63dpEX2HteTBXMi8yQUVeJtU0hXcwnQiDXR4onw+RA+65iVhXpOKU2
         RcmB3pkgbVwSTreoKTeKnbBcH7Z2g1JdBcMThaFCIEX9ppg6gGN7/Gna3otpJa1Y8APA
         vUJcOyb7232ux1aPzsdsgh9J8Vs0NK6RDylhuTR+g9dL6HLwvcp6wa9LFP0W8Ge4KMdW
         llwg==
X-Forwarded-Encrypted: i=1; AJvYcCXoCl5vFvXsEpGdeny7HNLpcO6qdFayvoPqkFnLuZQqJ+HBoROB8izhDrfMn9X7R2Zv5wrgFrdRKqZfLg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3yUrUKmOjrhsFQxSCcb9v4TC2jKZ/n1GT8V9tm7Eo7FCrVz1e
	lMXT3c53mbmdgyheyXPlNzeaMVHXxuQj9+5P88d1Oo+/V3xuZuvsFFXa+dEGyXNWuXInpgbPghr
	l8rb5RF01z7XNYSnaMVkz8rwsdarblB8=
X-Gm-Gg: ATEYQzzsr3m4dMablH11C61qhv8NKqZl+P7vrRogOu0c12RxCIPf6Hmqo5P5hqz6gvw
	CpF1TGdl1/5GHQtKqKXLM9SVnavsyFUuRngIGvUqRmZ++jr/9/MSmhcKe/JJV3Ff4C3XIUtiu6A
	wqhAcV1KIM4M97ZrQAhl1V5sOz1I/inN1nRk7guxdF5XnDgMTRUhymOg1uKs8cYrJnjXlv3OZ7u
	oGlt8iJmvAJILl4KGupGUkeh0KMZDOU4S8Ubdd8PvX5/wYPgKFK8fGFRDCg9/K3/U/Pbp0sRBJ/
	CoBCuXODmgQYSOcTvdEJ/K4JpJmNNFE930i4TlrRNaQwyolQrLJXcHHGCsvdwN6cwGGgeirUh3F
	e1zQ4rSUG
X-Received: by 2002:a05:6000:1848:b0:43b:9687:620a with SMTP id
 ffacd0b85a97d-43b979fc0fdmr3667446f8f.5.1774537331511; Thu, 26 Mar 2026
 08:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260326112521.2827500-1-wusamuel@google.com> <m2v7eig4ue.fsf@kernel.org>
 <CAP01T74KNVT2SVRR+XPbFb1vy85W=Jkp4_yD6xvTSg2avQo8AQ@mail.gmail.com>
In-Reply-To: <CAP01T74KNVT2SVRR+XPbFb1vy85W=Jkp4_yD6xvTSg2avQo8AQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 26 Mar 2026 08:01:59 -0700
X-Gm-Features: AQROBzCGtnU5-dOrxHATP1abxYAIKp7uD_DNHv2-zLG2AdZOG74ShatkiLTI8Ko
Message-ID: <CAADnVQK252XxmxM3enS4wPREshTEawQKbChgN-teX3+wmxgdBQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Support BPF traversal of wakeup sources
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Puranjay Mohan <puranjay@kernel.org>, Samuel Wu <wusamuel@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Android Kernel Team <kernel-team@android.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 7:54=E2=80=AFAM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Thu, 26 Mar 2026 at 13:20, Puranjay Mohan <puranjay@kernel.org> wrote:
> >
> > Samuel Wu <wusamuel@google.com> writes:
> >
> > > This patchset adds requisite kfuncs for BPF programs to safely traver=
se
> > > wakeup_sources, and puts a config flag around the sysfs interface.
> > >
> > > Currently, a traversal of wakeup sources require going through
> > > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to =
query
> > > sysfs is inefficient, as there can be hundreds of wakeup_sources, wit=
h each
> > > wakeup source also having multiple attributes. debugfs is unstable an=
d
> > > insecure.
> > >
> > > Adding kfuncs to lock/unlock wakeup sources allows BPF program to saf=
ely
> > > traverse the wakeup sources list. The head address of wakeup_sources =
can
> > > safely be resolved through BPF helper functions or variable attribute=
s.
> > >
> > > On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34=
x
> > > speedup (sampled 75 times in table below). For a device under load, t=
he
> > > speedup is greater.
> > > +-------+----+----------+----------+
> > > |       | n  | AVG (ms) | STD (ms) |
> > > +-------+----+----------+----------+
> > > | sysfs | 75 | 44.9     | 12.6     |
> > > +-------+----+----------+----------+
> > > | BPF   | 75 | 1.3      | 0.7      |
> > > +-------+----+----------+----------+
> > >
> > > The initial attempts for BPF traversal of wakeup_sources was with BPF
> > > iterators [1]. However, BPF already allows for traversing of a simple=
 list
> > > with bpf_for(), and this current patchset has the added benefit of be=
ing
> > > ~2-3x more performant than BPF iterators.
> >
> > I left some inline comments on patch 1, but the high level concern is
> > that encoding the SRCU index into a fake pointer to get KF_ACQUIRE/
> > KF_RELEASE tracking is working against the verifier rather than with it=
.
> > Nothing actually prevents a BPF program from walking the list without
> > the lock, and the whole pointer encoding trick goes away if this is don=
e
> > as an open-coded iterator instead.
>
> Which is fine, the critical section is only doing CO-RE accesses, and
> the SRCU lock is just to be able to read things in a valid state while
> walking the list. It is all best-effort.
> Open coded iterators was already explored as an option in earlier
> iterations of the series and discarded as no-go.

kinda best-effort...
the way it's written bpf_wakeup_sources_get_head() returns
trusted list_head. It's then core-read-ed anyway.
Ideally it should be trusted only within that srcu CS
and invalidated by the verifier similar to KF_RCU_PROTECTED,
but that's bigger task.
Instead let's make bpf_wakeup_sources_get_head() return 'void *',
so it's clearly untrusted.
