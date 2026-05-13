Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6223914F8
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706236; cv=pass; b=bgwhbUCvRWSpAOe93BXITg9APMECJOeTd2uxEN6oHe+6eR++WbDjNEPgMnFIJQm9BMkv+IcsbSCz25gC31TnnnN7t84me66tyc6PzPFfAC8py4oFzQFSs65M1RdVfv2EZm1q50hSIdrUxmZAp+4y6OcVzPzlvrsvoqJ5+WF9Tww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706236; c=relaxed/simple;
	bh=Ak9QebyPplmvEVZxfnV5E+i53CeeU7rfM7MEpmPpjGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6WHtPuVfVyC2P8+sgQilTJpkRPFgJJFY8Ozeaahg/QHK2mw2DMQKf5lo7IvndDGTl3OJI042NRWM2JwJMfxkUU9nX8tLoTSYwxKL1KCF+ujCiC+HFVa0ZJCFE0S20yUIeZ5DBt3dQHS3VhwpWV2aKE2rqLjYIzL8li27hc8Lbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjaTkhR1; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjaTkhR1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so6271017f8f.0
        for <driver-core@lists.linux.dev>; Wed, 13 May 2026 14:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778706232; cv=none;
        d=google.com; s=arc-20240605;
        b=EntTRXKZobf8Z3x8xDwngxGDBlpOvb63QALJMb3lxhEyXG5/NvKjd7AE3EJfyEKdQ5
         ZmXLE3KxMSn1/1ZUSsrtNM7B79zZ3Qxg38Qm5TcS34LKofI/PROAtRA7GpXdj0Sy2dBg
         h3dZl/AAXNE8OcNpgcCFA2AJSwzSvLLiVEQ4aDnR0BuX08fHR4AXT4m9Z6bTlxAhA9Y3
         S85hlplZsh/hRzxfj8OHQwo6qci7uOwxUlyGojYZXsv9AG855ApZp0TNqPJG/nFyaY4K
         Iw3XZvPr6o2+Vx/jGbhcUIUnFxbxYQtGXVCd0ljfb4r4Do2CPodAATdyjJGE0asZrltd
         zcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=11Jb0dd2cFuHeuXRLOYq2HD+pUqkjW/pEpvn5zyVRwI=;
        fh=MSV2E5M3KYghXpisO3xXcdZ6zY8dy1vWiKv/zPoa6VA=;
        b=RT2B37Zv2/7Xz37gft1ChyI4JPtpAp5ZoJdE8ORJ+NjGTRM8NQsSF7wzw6FIVzIKJy
         P1HcR2fgWp+cL5W/sHDnBVENF1lSWNSjoNH5hxtxfYbP5tt84maSfKKo8SKRctzdIf8G
         WoxlYnIsEjoF+iG3aT+UnJhocPx3sjeAE3yvJM3NxAMTN8/VxOwnKJRhpdzU3K5AMG+U
         /EFcpmhxSbXBlSslx/Y1vVk70ob0MkI71fw5F72j3yIj/dFujdTKyxud/AQaIRtd+7T2
         ezGdm7Ygfm2HxwiiMdvMoNR0F+7txvevfycIMjm48Xxytup4VDucQD3MHH5JJ/pHOteD
         x5NA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778706232; x=1779311032; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11Jb0dd2cFuHeuXRLOYq2HD+pUqkjW/pEpvn5zyVRwI=;
        b=LjaTkhR11aHPI4yqq5mrT9aXIM9ET0fNknigK3r0pKmBRsCz83KtyNpnKvLTPT3wWc
         0t7ogDldZb8CnKqWEVwJeG0NCvNEFx4uCWXcdvzFkz4u+Em6rwOGfhmciMZQhDaOd6Sv
         OAjbNqtzvCw7fM1HCt6S3YMctHBPsL86djoOihClq1y+SMLsZT2BpKc/w8v3hGmiDogX
         W9FFUMOdZLsG+wPoAcCRETjHusRDhrvYN/mkjqsZOshnA6GiMHBsRcVvBfCaw0oVZ3p7
         8gxl4L3Tfl09OZl0928wihnVYNyA1wC8YjY868VLJu4seTxrFRa8JBE+LoprDLc8MCSS
         BvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778706232; x=1779311032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11Jb0dd2cFuHeuXRLOYq2HD+pUqkjW/pEpvn5zyVRwI=;
        b=pKt1V76pxuFEqKw3hzUleGgEuB3y1uR5ZSYItxhCifKkSWc9ES53U9CtSk+PTaL440
         2Xoc4oxYbYfP0Xf82AkOYls31AnraIvdfRsw84hZDpfObd38ECBx611EUYd+s2ZEcf8F
         /Yv+ioAFQwPc9YXXkrrENe1UfhHVCUmUYQNv6xR2zitO9J4+ADJU7NnnKMWXJU9W/P+O
         8X0I2SepI942NZTh+MAE3ztLFNd5Q3gPEsB4u0/DHhMOJ2d+bvfDbE+0jxjN+21QhevU
         xpP5fXw8fmqNELMmZB4FyfUDgMvU192Qr4t4o1cBdNlQ7O5cGfTrU/PoHaoqyRiltrBd
         qX/g==
X-Forwarded-Encrypted: i=1; AFNElJ8waXJRPvoV+L9igcE9nKyGyF5167VP2HMxV67T1PS0DJe3UHuFjmZb3zv9OD0BLafbQHgeBrn+j50g6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPD/7xZYSGvV4Jsw0hXxyJkDiAjZhuez0U4Zft1YBLVY4pgery
	lSB4T4Wiw2JW0TKPLwWi4FyidWGml+bEBcWm915QgZQa58w6FpiYjqdPHkMmlynJ7Yo303j5Lk8
	cCcqrgZ6Tg5WfH+Jj3+nOv7yz7fJ2UQ0=
X-Gm-Gg: Acq92OHJKSLrtP27VpR4OnvS4l4abCK14/VRn1Tmh0416QRy8Dyy9e5dyN6okw7SzIT
	iqyqf9dslfV2N8h2436SYH6GXuOUGmoYUeZsyu/CcVwiyNbL5FF2pEm/x5Dg0vGn6OcVwz3YyLz
	oqwt8dTBhNnoRzPGxQCMYjJJRyXVAqtxOk+aGXKRBxd1Kn1Qnp7hZ+m01DvGdNulvldBlFn7w5u
	vWZJ0BAs6xJddCURo8fHpUNBtIoKquVR7vl8c9kgi5wvB0KVg6jBVcFT7G6D9dEojpDABtjo49+
	FW/H7UMfdXfMaxL/Xa7aEoIVpbCufdYE3QTQ5mfYcKxSM4lKP+nPR3JQFfx4OszTJc6t6mbVIN2
	CF5Ie//Tbm87WDUWOtUhJqrQX8w==
X-Received: by 2002:a5d:5f51:0:b0:453:f951:4e5b with SMTP id
 ffacd0b85a97d-45c584a86acmr8273177f8f.13.1778706231832; Wed, 13 May 2026
 14:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511174559.659782-1-wusamuel@google.com> <CAP01T74KQ6bie5o++i_gHM19J+s2RzDyM6=w87=oUZgPagPejw@mail.gmail.com>
 <CAADnVQJtuKQh-bpDDeqWCQRM1zb2sSgo0qET_+1+JFOL-6cpDg@mail.gmail.com> <CAJZ5v0hqdyMnBtvvo7RwUkh5saLvAHkTEVz8Ln09UaKMqoP=Dg@mail.gmail.com>
In-Reply-To: <CAJZ5v0hqdyMnBtvvo7RwUkh5saLvAHkTEVz8Ln09UaKMqoP=Dg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 13 May 2026 14:03:39 -0700
X-Gm-Features: AVHnY4JXZcwxzcwywRgvFsuXdvDflXIGcM__yxtCZ9WZk-JETjoc5UQtPM5_vFs
Message-ID: <CAADnVQLvuCKLUHnxcEx2+t4diLmuOb9VSthoDea5iktsAZxhTg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Support BPF traversal of wakeup sources
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Samuel Wu <wusamuel@google.com>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Android Kernel Team <kernel-team@android.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 12:52=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.o=
rg> wrote:
>
> On Wed, May 13, 2026 at 2:51=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, May 11, 2026 at 1:44=E2=80=AFPM Kumar Kartikeya Dwivedi
> > <memxor@gmail.com> wrote:
> > >
> > > On Mon, 11 May 2026 at 19:50, Samuel Wu <wusamuel@google.com> wrote:
> > > >
> > > > This patchset adds requisite kfuncs for BPF programs to safely trav=
erse
> > > > wakeup_sources, and puts a config flag around the sysfs interface.
> > > >
> > > > Currently, a traversal of wakeup sources require going through
> > > > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls t=
o query
> > > > sysfs is inefficient, as there can be hundreds of wakeup_sources, w=
ith each
> > > > wakeup source also having multiple attributes. debugfs is unstable =
and
> > > > insecure.
> > > >
> > > > Adding kfuncs to lock/unlock wakeup sources allows BPF program to s=
afely
> > > > traverse the wakeup sources list, and a kfunc to get head of wakeup
> > > > sources list is needed to start traversing the list.
> > > >
> > > > On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~=
34x
> > > > speedup (sampled 75 times in table below). For a device under load,=
 the
> > > > speedup is greater.
> > > > +-------+----+----------+----------+
> > > > |       | n  | AVG (ms) | STD (ms) |
> > > > +-------+----+----------+----------+
> > > > | sysfs | 75 | 44.9     | 12.6     |
> > > > +-------+----+----------+----------+
> > > > | BPF   | 75 | 1.3      | 0.7      |
> > > > +-------+----+----------+----------+
> > > >
> > > > The initial attempts for BPF traversal of wakeup_sources was with B=
PF
> > > > iterators [1]. However, BPF already allows for traversing of a simp=
le list
> > > > with bpf_for(), and this current patchset has the added benefit of =
being
> > > > ~2-3x more performant than BPF iterators.
> > >
> > > This looks good to me, you can add for the set:
> > > Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> >
> > Rafael,
> > how do you want to route it?
> >
> > If you ack it we can take it into bpf-next.
>
> I guess if someone really wants this, I have no particular reason to
> object, so please feel free to add
>
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
>
> to the first patch.
>
> > I'd think patch 1 shouldn't conflict with other 'wakeup' changes.
>
> Sure, there are none ATM anyway.

Thanks!

Greg,
are you ok with it too?
I hear your api concerns, but imo it's a nice improvement.
And bpf is not a stable interface despite some sceptics saying otherwise.
Just see how much sched-ext api surface has changed.

So if pm:wakeup folks need to tweak it later they're certainly
free to do it. Of course, it's better to keep things backward compact
and deprecate gradually. All options in developer's hands.
