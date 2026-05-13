Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1076A29AB1A
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633487; cv=pass; b=kCxDfpRPbDu3j8Iv2a9cDaR/c9TGGfWy7avrA4yBwVL2AdppasNC96Qzdr20sMFw90W+mbNHODnmfXltq9hsj4HkPFyPLRJbONuoMPUbKLZrOp68YcWI3awk7c7Y0NIWR7u8QkSfqshRuNq5DLF8g2Ag9HYpRIht4sHFfHjnVCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633487; c=relaxed/simple;
	bh=izyNufNv3l0EJK2+rtZ1T7rBl3b1uNLGp9DIpmbczBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tc9TNPcp6Zt464WQHSWc9cqIfc6IMI9GMoNtqQnvTmvVb5Yd0C/ItFYiEA6H3C8MdzteLjUkHRH5XPL+LFUIaQgHPPF5TZjHEzaEmgKZP8suvvatg6VS6IngpCz4hmMUB8JDGuMkNmwjDbR76D8oHAt7SH1jMz2DElRMzzVsLRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xkp2ieKD; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xkp2ieKD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4526a8170ceso3374243f8f.2
        for <driver-core@lists.linux.dev>; Tue, 12 May 2026 17:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778633484; cv=none;
        d=google.com; s=arc-20240605;
        b=QYBzAPbiGTNouEWpoZLg3/mCBvMlF/2G0jLG7SMwBfVjxAG4mgS8KEAisSKDrF7k7+
         Da0SsmxawRuSABN/3yyI4tFuSNP/7vhULe3o/XcsUXvkBKU2wHngbaSyYuNzYisRdam0
         B/N66MrywixKVuT9e6Dz+F0CqgEvrRTomIqzC6YnniurHln2vkKufLXCJlqZIfG1MRsl
         C3LdKG0JwNZxPrSsMQl7+PloVTJJJTaImBCluHNPguEtLmHub636gANcap5KnJCQgEoN
         EQhqDMNwG//e7srtMWX5F6NX2h1jKAU43NiefYR9k49gaQieP8jenANdBTk3jL/iTuuu
         S/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A0yqDbK591ypC5eJWQGsP1nPlMWdMRq98a5gApsWXZY=;
        fh=cb9iuESxQD94YSa6HUpATrJ1+bYK6gSdTpyYkYR3Cno=;
        b=VnnTPRhlkWuGvOfN+KzAe2/VF5UZs7xc9Jv/d3KlsMa9LVSiC4FWebLBHkgRSdnaxC
         a8ZNJzcGF9t2D2eosrsS3fMGYVDyqSbf+xg1n6Iq+Kx7pZrUYCAEFY+D3GNsbNQrxkok
         ww2fly32Ciq6p6rOLbZTOdIMtrwQ/pQGYlmVuzbzyK7njayPq8HaYNXirciQNXrPSOZ6
         qEQTzWGXmj1P4iGFwnB7D91/IxhRYCPQ4PVvqLH2fYTjN3kLDqlxACbaog8pTNET++6P
         BD/fRHCa0WdbGz8NsQf4ERv2LLbsRZqR+UcOjnAbPz9G6rPcTjaeFUqMbu/E733pyg1n
         A3vQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778633484; x=1779238284; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0yqDbK591ypC5eJWQGsP1nPlMWdMRq98a5gApsWXZY=;
        b=Xkp2ieKD/KGJSwIlqp2iluEQ/t7jTJqKC9THwL8A41MMQfc4ZnB7mslGU+/f+SHDjY
         fYsLHrncpNDYnu166ZWH90SbD3DvtOGI5p2qPOGQJkJ3JiiKT8Q7tSgSE88sucRQHcQp
         H5YiHoIUDHYtCgBIrJ0nt7GY+cldD4UOUcPIotK6f1SZoXeB6nJxD6U0LaD8/5hAAZgr
         FPZHbGSvGNa/GL1IsQKO/FGXzZt3u4o8tr1GrGXeV57tRA1hYEdPFJzI1F0gKUJXA/Bn
         KaTashZz/nyBV477V0E6Ju3j/WjRo5fYxVdsUCnXvMLXnHB7bYERwYecFvpIdVVSWeyh
         Ts+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778633484; x=1779238284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A0yqDbK591ypC5eJWQGsP1nPlMWdMRq98a5gApsWXZY=;
        b=A/LLGMrtDf658I2cNO8sQS+t8ksvXI37IRMZMRBpVCq5IYtneX7uH16Y8UoOsG6Up3
         ZD9S1C4SiczegeejuI/wR929PyCej0jgvOP810KpF+aTyfXe5Ve50Jlt8wFkWQUZ7uqR
         Ye9MutZyDPqNA/fcG7UeP8RNenZIGcc1z0Qv6GUQuxOuVqJ/oAVh4cH30m7rV28jzuEd
         9XWJVnkMaU34B2AJKEx+Onr8746x4lZnZ8QPMMOteJeB+C9ezXYkelM1TF/mtmxjSZW+
         XyfdGYmr9CHOUKq3OIIrh+sFBpTCgbgp9Vf/JpP6Qz0RmVIhUeaiOQ2USU3N6VP+krFd
         3n3w==
X-Forwarded-Encrypted: i=1; AFNElJ8aRnV7dSYeJgckU9Tw6qscG9kMM7HDppgeepNc/gBLB+iYB4xQUlUckmptoFImXWa9jXsQS8CYmXLpPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwruP+jR4n5iVn3HhZe8hXmJJ5V6wfud1eWBO3t8+Nti5AAYjFV
	JzvSzbJfC4SQQSIjNyWHFMjJAWENPUx1Gb+02DuoIQo4IrBu8k/NL4rfqk3UHiRqsnQtm0ufN/r
	K54pwWELPDoehva9X+2747LryrpK1sQI=
X-Gm-Gg: Acq92OGJYr6YqxlInpnSCyFngweOcSnznI/Ig53Jlr/og7vXqYpelZoG6Y54YPoyL7+
	SrKXuU2m6sdqJxgY8RiUyrFXEORHk3JKxyNLs57vKElwrM6DotJ0r9EYD8zX3ZcnXW7qajUTDFn
	lFCbW5WFcPaEKorLJmFnMDoH0fOEadhtVsbyY0nQnhya/a93bHdPmm+qN80i+8jmp6NKztfJPW+
	6KH6cDTkmManqZXn2LumUw8qOhLzsQPgst9QtG05iNh4610PXVZNfbWpsFWB1t9aldjRTEDWtod
	uirnNkHZkgTV4HU+ffHibKPsQyH/xwJQ5zplZL8+KmWASKItVDyBr1VARZwqPpa8XXM1DcFcIkW
	IJz3sFqNXoqFTUC6Ru1Dpz8RcuQ==
X-Received: by 2002:a05:6000:3109:b0:43d:6f0f:32fe with SMTP id
 ffacd0b85a97d-45c59702e8fmr1423029f8f.31.1778633484225; Tue, 12 May 2026
 17:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511174559.659782-1-wusamuel@google.com> <CAP01T74KQ6bie5o++i_gHM19J+s2RzDyM6=w87=oUZgPagPejw@mail.gmail.com>
In-Reply-To: <CAP01T74KQ6bie5o++i_gHM19J+s2RzDyM6=w87=oUZgPagPejw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 12 May 2026 17:51:12 -0700
X-Gm-Features: AVHnY4K10O6Mxpl9QjZAt4PGuFBG9tJtHHyQLjkej2TGD7aWVby8-50dFABh7DA
Message-ID: <CAADnVQJtuKQh-bpDDeqWCQRM1zb2sSgo0qET_+1+JFOL-6cpDg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Support BPF traversal of wakeup sources
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Samuel Wu <wusamuel@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
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

On Mon, May 11, 2026 at 1:44=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Mon, 11 May 2026 at 19:50, Samuel Wu <wusamuel@google.com> wrote:
> >
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
> >
> > Adding kfuncs to lock/unlock wakeup sources allows BPF program to safel=
y
> > traverse the wakeup sources list, and a kfunc to get head of wakeup
> > sources list is needed to start traversing the list.
> >
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
> >
> > The initial attempts for BPF traversal of wakeup_sources was with BPF
> > iterators [1]. However, BPF already allows for traversing of a simple l=
ist
> > with bpf_for(), and this current patchset has the added benefit of bein=
g
> > ~2-3x more performant than BPF iterators.
>
> This looks good to me, you can add for the set:
> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

Rafael,
how do you want to route it?

If you ack it we can take it into bpf-next.
I'd think patch 1 shouldn't conflict with other 'wakeup' changes.
