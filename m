Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2A32ABCD
	for <driver-core@lists.linux.dev>; Wed,  1 Apr 2026 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070447; cv=pass; b=hEW0zMPiQ/xMiX42cfgqMvMYLCokibXzLdzUuiGehs4NicTJS2ahlYFtVpWM1WRi+Nrx10HRFL6C8oSxNaUAo/B6NMQcCO3qynLlAbLekjPLrAhhmAqAXtHJ8/JC7tv9u6MULte03xRRo0h+dfq2vwISrbG+8d7Sq/8UcK56tWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070447; c=relaxed/simple;
	bh=oPmpGJgra+J/X4ds4wcUHLxA6Eg7GvkHp+DXASeWwJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nb2bGhrOw5rLkWxnpyhgeMKbfj9pu/AWn991L+nmHLCf/55RWmJtemKeRL5jROIYWdgReqk2PVcMtNekRIQuRfQH/1GzPASG1lRh0/3MeRP9SC9UQNjuWld3ol5kpEVB11PmJdL3PwsVMG8ynigp8JaHVGFlAruIMvIXzZAxhf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D9kj1D/g; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D9kj1D/g"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8d7f22d405so13514566b.0
        for <driver-core@lists.linux.dev>; Wed, 01 Apr 2026 12:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775070444; cv=none;
        d=google.com; s=arc-20240605;
        b=YUUCPAV/ZKfkWha1RVG97MTddvA8f801/Ed8SlJMQwbSuqvTRyF5RmAa/gWb661gXB
         CISo/dqFLz+Y+UhsvrWHjxqOYFQe5isTinNltMiZdfgcA8XNw/GzLqDmLRT7JZBrfQuZ
         YWyBp5jNIv5aTrzFzIriLkR1jqJMxh8+BN37WgKNdZjE/WEC1aow50YXsmgZ4uBgVJuD
         Fw9q90PESTZfsN5L57JQBYIuYywv36VfPvGw3X6mewx4ThR9mnu8CdmLwEY1J91i9GeN
         jZ7bTrOJOFUFXroWOp2N4YXOdVxrw1tGXuBb/rz5+fc+qifZpRcw1vhuKZ+ej2mOG2qh
         raMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tbulKj8l3zNdTBhluioK0AGuzttA7TtmTV4oAVYitSw=;
        fh=dDDQvWjx4KVVugA/AlZGhZsOgcdj+WcIqvOAsLboFCs=;
        b=bN+eS1lP+Ugt4dtkjZT0+sFWjIx3OnEVjxLXn/Kit6SRmpHUTyV3BOclI5GScIIAtq
         f+8FKv9LNXLsbd9uMBrW81rIuVBpD3x00IO93jTpQmGaP/nXzKQIlWUBxuQz35W0Ziwi
         d4p1aDOs/LMYIhfULLtVzzL+Gm+DHJX6uk55WhDJPZROimxskMwnrf+NxkK7oPpqDy3v
         yZtANPe/3UCMc+mgOoFpD1Q81W+VUa+jmHSpFOpwW/XDkPFpXX3Ny2lqxYqJsu/asZWd
         2q+XIrcFXMLbz3W4Btgxailux4mORkQXqtY7ElSRdAUuIXtcwL66Y0TkbCbZfbCNidUr
         NA2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775070444; x=1775675244; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbulKj8l3zNdTBhluioK0AGuzttA7TtmTV4oAVYitSw=;
        b=D9kj1D/g5GH+p3b35JibIa5FZOSGazzlFzYvKf7kl/EfNL/GngmMQdnbNhdVJnqY1c
         SbQiUlleN4HmNfz0l68AZCtoCMiGFg2OS2vzIKbgz1BZ1jzB7vfedqaUob3C/IkbGEew
         TncUfwcqLg5Z07vGq5Xr/MrVUB67HvsosKhQ6ETKGWvojcqiEYGM59fCO6LXPRUUjkwh
         oSPoaicnTFFbF3nMulNc7nhHPVdOnYF54Yg4bmhvMBuoIReXfNgKQwii//YxMoh5uqop
         9jNlvYNw3QgiRH9/FlQG1zZmVgyJY0tJL+1bUeK3AG0BKo+9hc0owqPoEU2RKiguLAMn
         NyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070444; x=1775675244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tbulKj8l3zNdTBhluioK0AGuzttA7TtmTV4oAVYitSw=;
        b=lDUXTA2l0MvbrevTNQFpnsyfsbXZRc7wZdFg+J9SP+4CHnUh0ffBEJ6AAl9yBeo/wi
         f59if5y9K2Cj5ir1jhAhMET7IhW/1FXZiRIkB7zh+0vptN8qEE8nlGUxrWnu20dgy3Lk
         p98sQ4w+oxYto6CBuz9nDN4rgoDjhDXme0PbB6APSc4sfMX4BlnXMo7etGOA1rXSSzf6
         /TaQjXgEtFjRbTcBGfWvaGnSWHur38yJyJcHxYBBbqAJUuc7fwmUY5m9wbLWytar8fj+
         NahO69JXjOivSgKvgyCI1wbXQjVIUPBQ8vFFVlePAOK1dcpm1IEakKyKHCkbOCNIhN6I
         7ERA==
X-Forwarded-Encrypted: i=1; AJvYcCUoeNE0kwEv6j91E3RXcfFoPPJEfmCQTa2wfJVyoVy4xCim9W3KRbiCehE7OXuIS8xsOuinOMCe/kUcdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTsIKnZJYCO2fnyHsIX/urXnK/uhW7iYnDVDbN+tZuGCU/J+5y
	VOWZj5+KSVO2ZMUU6/96MEuOIfCCbLkaIepGgiQd3yYouBH+mmWYvbmr+Kx/m+J72oNp4oeq+qe
	lHlM+wXuKPZSK0liqxwkRZ1OBmqzhP0PA9P5IyYj6
X-Gm-Gg: ATEYQzxQgx01vhdckDyjxM0eQkQ393gMc8vuUhkp6yIKKqj3Ub0geBaCLLoSndDAAlS
	OgyjZgI7VdD4Lbzb/g5OUPt8Gw55oc+WNGAannMTLBmxAjfwp8/6XuKaDXimydluYqAWehE0cXJ
	4UP2zcgl8j1m2xrDClmXKgQepEyoNPpmzpSa7X4EXpU4RWs+eOgAMIASqMwZBxj8uOMgHHeoWGj
	5Mto0ViLKFLiduMGCsvw2ce79LE2v0lCeEdNzZTdl0JX3fgslWcWf2KjOtoMcg8hpm6ha55eYeV
	F5QeNXrhFcNRs38uYi3sJk8ZzmwTX6cFREuiQw==
X-Received: by 2002:a17:906:194a:b0:b9b:e5d:71df with SMTP id
 a640c23a62f3a-b9c1390345cmr238853766b.19.1775070443780; Wed, 01 Apr 2026
 12:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <2026040136-ocelot-simply-8981@gregkh>
In-Reply-To: <2026040136-ocelot-simply-8981@gregkh>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 1 Apr 2026 12:07:12 -0700
X-Gm-Features: AQROBzDAv1zFg2qxt-3Ch7XBslSJIDWmAx0yiNuGqnKyk-N-jI_iMZvmNf44ICs
Message-ID: <CAG2KctokEVVuhrs6tYuMjFF4ALR=tX80iZHrt4bhVvEKyoHzRQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support BPF traversal of wakeup sources
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 2:15=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 31, 2026 at 08:34:09AM -0700, Samuel Wu wrote:
> > This patchset adds requisite kfuncs for BPF programs to safely traverse
> > wakeup_sources, and puts a config flag around the sysfs interface.
> >
> > Currently, a traversal of wakeup sources require going through
> > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to qu=
ery
> > sysfs is inefficient, as there can be hundreds of wakeup_sources, with =
each
> > wakeup source also having multiple attributes. debugfs is unstable and
> > insecure.
>
> Describe "inefficient" please?

Ack; I=E2=80=99ll provide a more detailed breakdown in the v4 cover letter.=
 To
summarize: the "inefficiency" isn't just the number of sources (150),
but the fact that each source has 10 attributes. We are looking at
1,500+ sysfs nodes to get a full snapshot of the system.

>
> And if you really think that doing an open/read/close on a virtual
> filesystem is inefficient, then I have the syscall for you!
>
> I've been trying to get readfile() accepted every few years, looks like
> I last tried in 2020:
>         https://lore.kernel.org/r/20200704140250.423345-1-gregkh@linuxfou=
ndation.org
> but I keep the patchset up to date in my local tree all the time.
>
> Would that help you out here instead?

`readfile()` seems like it would be a great optimization for many
usecases, but it doesn't solve the context switch bottleneck.
Additionally, current userspace implementations attempt to speed up
this traversal by caching fds, so this new syscall wouldn't help as
much as one might initially expect.

> > Adding kfuncs to lock/unlock wakeup sources allows BPF program to safel=
y
> > traverse the wakeup sources list. The head address of wakeup_sources ca=
n
> > safely be resolved through BPF helper functions or variable attributes.
>
> Who is going to be calling this?

BPF programs call the new kfuncs. I realized I left some stale text in
the v2 cover letter regarding the interface; I'll clean that up for
the next version to make this point clearer.

> > On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34x
> > speedup (sampled 75 times in table below). For a device under load, the
> > speedup is greater.
> > +-------+----+----------+----------+
> > |       | n  | AVG (ms) | STD (ms) |
> > +-------+----+----------+----------+
> > | sysfs | 75 | 44.9     | 12.6     |
> > +-------+----+----------+----------+
> > | BPF   | 75 | 1.3      | 0.7      |
> > +-------+----+----------+----------+
>
> 150 sysfs calls in 44.9 ms feels very slow.  but really, what are you
> expecting here, sysfs should NEVER be on a "fast path" that you care
> about performance.  Why are you hammering on sysfs here?  What HAS to
> have this type of performance?
>
> In other words, what problem are you trying to solve that having access
> to 150+ sysfs files all at once in a faster way is going to fix?

The 44.9ms is the cost of reading ~1,500 sysfs nodes (150 sources * 10
attributes). This is even worse on wearables, where the compute and
power constrained platform exacerbates performance sensitivity even
more.

On these platforms, the CPU is suspended as much as possible. A
byproduct of this is that the wakeup source traversal occurs on a
user-perceptible path, which impacts battery life and UI
responsiveness.

Beyond the performance improvement, moving to BPF offers other benefits:
1. Reduce Memory: Drop the fd caching logic
2. Simplify Security: Consolidate SELinux permissions rather than
managing labels for every single *possible* wakeup_source

Thanks Greg!

-- Sam
