Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B3B451062
	for <driver-core@lists.linux.dev>; Wed,  1 Apr 2026 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775053413; cv=pass; b=LKZM3xSqMvOyIWaF0S6yhsfEl2xnUuDIgxDevSY8HSpEILF0ysyt5TCY1zsnjOT/8NoZeH0BNrKfd92A/F6EGpSKtCxfKrJb8RQMt4PuCTw9vid10xgp03ZscDRZX39HDKBJnv2fno0qo3AiylfWL2HOMJqgrvfakrT8E17Grwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775053413; c=relaxed/simple;
	bh=jCAWadVZxWjFHf3Z7AAoz9vfZzBHXx1pRn0Dhndlvzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ia3Mus1cpFyjZEV1kSjqc8L8RFH3eM5AmZKrYqstDMk8TViIWcPc8ob/6k8wG6SycbrFinuN6yVq0NrgsD/XfnZPlLNmE8t494DZuC3tp+2VDHHih6NaC1evZgY/mWq8rjv2WdLo/nHRHxY+hZxsN1xN4PW/h5ElaCoi6doLO4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blKNwgQT; arc=pass smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blKNwgQT"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43b41b545d9so7580206f8f.2
        for <driver-core@lists.linux.dev>; Wed, 01 Apr 2026 07:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775053410; cv=none;
        d=google.com; s=arc-20240605;
        b=BFOR3VflomKpnFEckeJTW/pQLjiZoHNRZ6W1cwVsJAB0ixQmQDhlei1m6RbIsZjB6z
         fJXqh8FDaUCk2gKs8MAxFR/dlQSPlvu+EcbOgNUV5LxenpTqz8GGPknz9MCLP3ZBi1TG
         UqtqU8zAyL5hRapcy2ktnwxLaWCk55Dr2uJ4hzMtjf8nfmMw0wAOIuDycF+nzG7FsF2z
         cyi0kbCdMD6eh7kCEhxDFpYdcXtzragpNob++wwcFLZP86mOUExl4YNY/8bQtudrHQve
         3bbnPalznhklV0zDk8DGvtU000YyWcsW1kIqBVk90qxEp00ki0c4wDQNwvdYRca1Xv+Z
         +yYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+su7u1DujUR7e0bvScKtwYqkb+UMyoruXcpy4rpqvic=;
        fh=vpcLtg/9gjPTifg6Kq9GvCjHJJSHyVGlU37SpnZPBjI=;
        b=F8YJoBHShRfBG35jIl/ENlp4hsy5xfPGUFVGyj5wfg+saal7of4HMehtXrwuxEMY47
         zKQnrU+zLFZAFbfCJki4I9HEczIleeJcalLOPbbCTYwBUQiU/R1kUn3rs30exzSB6sgQ
         MfCTGdyE5D7OOWfUod9IZ16Rugts+8BZeQTu4VIoHF79uBDXSSxlSY4e9iRe2peNKcSi
         /BtywBjf9EWRbBn+OHM0EWDh2eepSlWai3g0TuuU1XtFfxk1Z/MiW1ZwB32jIYF9i6BO
         OQQzs1C5zgF7mc8tzl2rVRKPYcsJPVz0/wQvVeC2LMuoqlhspt3QosyuuoAcTsJHKWj5
         ux+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775053410; x=1775658210; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+su7u1DujUR7e0bvScKtwYqkb+UMyoruXcpy4rpqvic=;
        b=blKNwgQT50rgRbq/73scCaGiZmeS5eaURoZhF0xkjxSWCtbVc5TbVh8GJemNocuSP9
         tZbVSMh6Ng6JPtA9bEYcMnqeLdJKGT1Z4gbq0wcIfYWT63l5DJnzrQiIXcWcPTCFiiNt
         374TxC9I/fVUsXcx1Ox3Ssapi3DMlBTxpmsSEJ3onc3Autbz8HRb+3N/9jmgs+sc9kEm
         G+70orvrnK+UR7gBgUQEjqJYafQpZfQ+H21OzPJAM9ZAqaD8Q0G3V80FagbXgcItQme5
         7OBqvIAMBel8qd4x7+wNxVIVMwNErXlFiQPpOdXbJW0pujmILf1gBzGxaNPrB4yRnZj7
         OzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053410; x=1775658210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+su7u1DujUR7e0bvScKtwYqkb+UMyoruXcpy4rpqvic=;
        b=EKXFf+UslTDVAo12bxmZ3ygoZvuQ8VvfU9RAUZyUJiLgBdh4+5YcYbydJsxM6uWKiG
         bpNdQtY4dMySmnJLCNiHJeU8sQ7tZaTQsUmBZRQAYMrIkMR4yOF+odQFgZydENNf0wG+
         Tax+dfUvZFpKtJl7j/pdfD8pLp0ZIfhuel5to5hrHiy4GRNnrjdNa0fh6ioT/MXLqkRX
         X7ShRo4BOSJmGAviEirkflGFDK/zfHjkeEmodzTntkcY2NJdNTCU1X4sEaPRKOrzPwvW
         AtMrQ5wa8mCABItZrV76Slr6fRP4uY7xOIQXUd//Mt2fCR8cAqgpq53tFkjVpmGbr3Ts
         cV5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmcjugeB4C9/cQ2y4BS5BmPLFckiimkFZp0xqoWrmgnyJlJVTdWuqkoYuF+tGXPOgLYFpALRYkQi8TNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9ix71cH1a9K96/EytiODYL8hLxL1EYkp5m4ibD+2o3/LbyPC/
	RI1tuJ2UDkbOmdkKJcbMmGMUpSlEQ+pTl0s5VlPl1AUf1tYNUut/kAp+MItsfHeFuzkhQfrE5dl
	N3uZaemOof2TDmLZaDKSVpoeUVRZ+2xA=
X-Gm-Gg: ATEYQzySE/26FpC4o/F25awi6tfFnjkkCAM+0QIWgCNnz66VdHgY+Jw/4kD18CgB58+
	QXVVpAyEyrfUxJSvbp4pQs6SDHylLbFLrlsA8ZE7Ufqk41qlLTJ7goIA37nxDt2VTEcQeDfxJ1n
	HMaS8LGBke5CO4eSYH5kjdk0iIdNKW0lehttoFmRDT91fJSU5M+XPpsK44SbBgdELo/LiKX77nP
	pB6FOUIT53sTtHfPVOmNefD7vq3755/j+ocmG4vKkE85obZphrkFs8i+zioGoSMGaxDSxYHyOju
	KR57SIbEiMpij3EnWlIO8DiQ7n6P9uGxUUvfto1+3ylHrjwnE2SawzPhjuYxisheDUkR2Q==
X-Received: by 2002:a05:6000:18a8:b0:43c:f90b:5663 with SMTP id
 ffacd0b85a97d-43d150d7563mr6887118f8f.37.1775053406663; Wed, 01 Apr 2026
 07:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <20260331153413.2469218-2-wusamuel@google.com>
 <2026040153-overpass-shanty-71a0@gregkh>
In-Reply-To: <2026040153-overpass-shanty-71a0@gregkh>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 1 Apr 2026 16:22:49 +0200
X-Gm-Features: AQROBzDH-gBJUmuMrT1i00bs7K7Gj7h7rmupTCDKMaOOIhQqh803srjDhQwcCmU
Message-ID: <CAP01T75nL2wzq+ONGNZ2AB6=A9iFDabTrXOWOwXLhqYohz2ZQQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM: wakeup: Add kfuncs to traverse over wakeup_sources
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Samuel Wu <wusamuel@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Apr 2026 at 11:11, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 31, 2026 at 08:34:10AM -0700, Samuel Wu wrote:
> > Iterating through wakeup sources via sysfs or debugfs can be inefficient
> > or restricted. Introduce BPF kfuncs to allow high-performance and safe
> > in-kernel traversal of the wakeup_sources list.
>
> What exactly is "inefficient"?  I think you might have some numbers in
> your 0/2 patch, but putting it in here would be best.
>
> And who is going to be calling these functions, just ebpf scripts?
>
> > The new kfuncs include:
> > - bpf_wakeup_sources_get_head() to obtain the list head.
> > - bpf_wakeup_sources_read_lock/unlock() to manage the SRCU lock.
>
> Does this mean we can stop exporting wakeup_sources_read_lock() now?
>
> > For verifier safety, the underlying SRCU index is wrapped in an opaque
> > 'struct bpf_ws_lock' pointer. This enables the use of KF_ACQUIRE and
> > KF_RELEASE flags, allowing the BPF verifier to strictly enforce paired
> > lock/unlock cycles and prevent resource leaks.
>
> But it's an index, not a lock.  Is this just a verifier thing?

It's a verifier thing. The index must be passed to SRCU unlock wrapped
by the unlock kfunc for correctness. The verifier understands such
acquire/release tracking for pointers (e.g., taking refcount and
putting it), but not for scalar values, so we need to launder it
through a pointer to an empty struct, which isn't really usable except
for passing it eventually to unlock. If the program doesn't do the
unlock, the verifier will reject it.

>
> >
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> >  drivers/base/power/power.h  |  7 ++++
> >  drivers/base/power/wakeup.c | 72 +++++++++++++++++++++++++++++++++++--
> >  2 files changed, 77 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/base/power/power.h b/drivers/base/power/power.h
> > index 922ed457db19..8823aceeac8b 100644
> > --- a/drivers/base/power/power.h
> > +++ b/drivers/base/power/power.h
> > @@ -168,3 +168,10 @@ static inline void device_pm_init(struct device *dev)
> >       device_pm_sleep_init(dev);
> >       pm_runtime_init(dev);
> >  }
> > +
> > +#ifdef CONFIG_BPF_SYSCALL
> > +struct bpf_ws_lock { };
>
> An empty structure?  This is just an int, so you are casting an int to a
> pointer?  Can we make wakeup_sources_read_lock() actually use a
> structure instead to make this simpler?

See above.

>
> > +struct bpf_ws_lock *bpf_wakeup_sources_read_lock(void);
> > +void bpf_wakeup_sources_read_unlock(struct bpf_ws_lock *lock);
> > +void *bpf_wakeup_sources_get_head(void);
> > +#endif
> > diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
> > index b8e48a023bf0..8eda7d35d9cc 100644
> > --- a/drivers/base/power/wakeup.c
> > +++ b/drivers/base/power/wakeup.c
> > @@ -1168,11 +1168,79 @@ static const struct file_operations wakeup_sources_stats_fops = {
> >       .release = seq_release_private,
> >  };
> >
> > -static int __init wakeup_sources_debugfs_init(void)
> > +#ifdef CONFIG_BPF_SYSCALL
> > +#include <linux/btf.h>
> > +
> > +__bpf_kfunc_start_defs();
> > +
> > +/**
> > + * bpf_wakeup_sources_read_lock - Acquire the SRCU lock for wakeup sources
> > + *
> > + * The underlying SRCU lock returns an integer index. However, the BPF verifier
> > + * requires a pointer (PTR_TO_BTF_ID) to strictly track the state of acquired
> > + * resources using KF_ACQUIRE and KF_RELEASE semantics. We use an opaque
> > + * structure pointer (struct bpf_ws_lock *) to satisfy the verifier while
> > + * safely encoding the integer index within the pointer address itself.
> > + *
> > + * Return: An opaque pointer encoding the SRCU lock index + 1 (to avoid NULL).
> > + */
> > +__bpf_kfunc struct bpf_ws_lock *bpf_wakeup_sources_read_lock(void)
> > +{
> > +     return (struct bpf_ws_lock *)(long)(wakeup_sources_read_lock() + 1);
>
> Why are you incrementing this by 1?

I think SRCU indices can be 0, so it would appear as a NULL pointer to
the program.

>
> > +}
> > +
> > +/**
> > + * bpf_wakeup_sources_read_unlock - Release the SRCU lock for wakeup sources
> > + * @lock: The opaque pointer returned by bpf_wakeup_sources_read_lock()
> > + *
> > + * The BPF verifier guarantees that @lock is a valid, unreleased pointer from
> > + * the acquire function. We decode the pointer back into the integer SRCU index
> > + * by subtracting 1 and release the lock.
> > + */
> > +__bpf_kfunc void bpf_wakeup_sources_read_unlock(struct bpf_ws_lock *lock)
> > +{
> > +     wakeup_sources_read_unlock((int)(long)lock - 1);
>
> Why decrementing by one?
>
> So it's really an int, but you are casting it to a pointer, incrementing
> it by one to make it a "fake" pointer value (i.e. unaligned mess), and
> then when unlocking casting the pointer back to an int, and then
> decrementing the value?
>
> This feels "odd" :(

It isn't readable, though, because it's an empty struct, so I don't
think it would cause any issues in practice.

>
> [...]
