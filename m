Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D13FFABA
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542365; cv=pass; b=kbxkfyCedVZV1yBMGut4CdeyjzoNrVBZG6T0YNHAQseae8o1xrNBQ78X2SCwdT57thggbk0amXoR7cLXReDNdPMJ5hQ8ocpVuiGriQp1m6RP8Q0Q3tPmLrsMn7m+K0iAHMNcl8OhP6DSPtzSV8NNmH8Q/kIag/+x1hpyul0Zmw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542365; c=relaxed/simple;
	bh=+1VIbwYlD5P6U8aunjd8muf/Soz0/OQ+HB4vCQY8XcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFxenCoFNcBQya1VFtLpNKrgkAK5ftk5Z+RcCRinDL/WnGGxRDl+do1NdU0PZYRbKQZsRVXIKxgnSykbReyi1U6ZlW8pa7Npf6fxR6NZ6y83+Qlz1OMe3xz3EgjCjQnlDw5bY6ge9gOTgMXgbXyuMG7PNv5OTnAcjVvmKHmyvqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F8AxZlCk; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F8AxZlCk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b886fc047d5so178032466b.3
        for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 09:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774542361; cv=none;
        d=google.com; s=arc-20240605;
        b=OUSBppFq/oUbbQpGIwwkby5SkvapEKWhYnjIaXscbBnIqQVGpj9zRNCRb/BMv7aA6H
         aRnKQWG3j0sndOy2a50Azwr+vp9/OPBrpreFn7ZxLqAGJZf4oVU9fzAKWyyWbCRceBjQ
         cnLRUDqJ2q0YA8jECRvnnApbhRB3uWj3uYYMs7uk3mhMXUdX9ctr+2rvfxDhFZGg0I3N
         MkQ8CqM2r/Vyv5x4B+3Cf5xKeXIcS6AmKzyUvR02TDYm9tjd+ndTeXiUCPjSMtBpG4xw
         crnrYzphKqm7a0PwGS2hKKbWM04sh8eHp6S/8XB0Y5ndDfSE0PkupQkvweDeVVoHwzHI
         a2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8weEZ4/v1Q8ThZTOa9v3bW52mEvoKROcLFNZAFrpZyo=;
        fh=Uk6DsP8MGzeFmhsiM+BUmTo3DsBjRbsitKzhGXjLvQE=;
        b=XgI5t/vHBIEOix783XqV5PH2szj03THHPhJx2t1NJZ9obv1BeKXe9XzxhANMD3X7c1
         e0fVlzd3wgIevZ9Ms1vhnJOUp9Ufb2k4ajGyeJeRHNifUJXMWx0pfthMfeqbN49c4oKu
         P7GxMTu/AzfD52fTg2MvcRjs/2bMY5HUR5TQfJK67L1HrR0nKREOVZp9+YLcSQstp+cV
         UwH6RW21IViyTPPgF19UPgGfioGMaHKYmn9XoZhnWstXlfo+gh2XK1kMv55PF02+kDqF
         900F4c9IFaH63J9iqXA6c9BkxdJ3YyVFlPpa2KcJ2X2S5ztJDGa+SK6TBJ7Q/xdxmZZk
         skaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774542361; x=1775147161; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8weEZ4/v1Q8ThZTOa9v3bW52mEvoKROcLFNZAFrpZyo=;
        b=F8AxZlCkB1P4Eu2mR8S9Gb/1KSAIBCAEykxtgVHxWl6YiSWY6DVllLnER8U0HEwE9f
         FUTn8QPhU7as39uzP31diYFCokIqq+RTGarG+UBj6QwCffteyCvBFp6bp3A0QsKPMzYy
         z9xYv/l3rEIY9J27UBoxYXXGcfMyUhGirpFYY+vzJpyIkXFG/9pUF3bHBMLis9ZVPMFz
         oT67UDmQ9vj9JYCYVitdOYqhVpoEhh4YASVpEL0rix/2Ljiwk56ndHGQ+kzjrU7+IcmR
         w54djIoL7+MZKE2LlA9+9FkRpOaDvUzUOKkNyCspmdNhjNW0nCGVijISV5rmB8EoYJB0
         E10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542361; x=1775147161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8weEZ4/v1Q8ThZTOa9v3bW52mEvoKROcLFNZAFrpZyo=;
        b=Jbh+WuOc3k70EQr1Jrz7wEYbRu+SsjhaWJ8OtQuDM9Jzqw6NCKhcEPbR6dPO88S9yn
         2HFbAt7A3IHixBUQvHpjxWiOfg5AL8Yplk3hdNqxr8CchZVVhcIrxCsFx48NAptREire
         dvOX/KMEkFU5UQOd1/D2aSLo0ndeh0puAzc+dv85IuT/Wfpj/LFQN/pnEDLa513sCL0e
         P7yYiwjzC7rgNZ+GQ/FUi9vAt51XZXEGG9y5E7qzLAhTPwc9MIkA4TipHxe0BnWoESI3
         d94twIQ5CDVVrT9tFV+3iAuzLkPD9FJrMaw9+7SW5qHVgO8rUSW5iDCqn7Ux8CumX1EM
         7F/w==
X-Forwarded-Encrypted: i=1; AJvYcCV8Jylxulbko3mrut5uOlkYxivwbGy8RnV7HuaLdZugs2C6fz3A26uBk26C+gvTdo7Fk1kWhTVlxs0PTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YziX9mm5Dl5gwulpbyf52UaH/mWcI/Dd7TRnkSvIRPiYfB+TG/e
	jidtCSvjZiQ9lLdwLlkXLY8K4L6+za1XG+hLycVahqDY8Lu01uasi2SukGBXXyLPLi642G4yF6f
	f5d1j697tAS5R4iyUosI/hYX8E4qbfH8bMn78NG7j
X-Gm-Gg: ATEYQzwAbgwIl/IGJNihIC/hJ09eb0nh4PH3BkNxRxflUBABabxYbyiLHZL6b2WiWMu
	UDwQIliRiZXe7XfFwi/tuultW9OHo1f/d7R13N6EhdJr/25e1c1p4vK/MbJv6XLZmsYt9eOuqz7
	7GXIK3zMsriYk+V9Svm0DxbI3IRRQ3p6G5mMVmreMRewOpm+LV0zDjEEBKmdMd+BwSIye9xpmz3
	5JuQ/yDHWeuwQDcOmY9inY/hy/YKWfiLZhGe7TJs/zGIwzHK5GhNv/q9LFhKM+XIkFnO4zzH1bS
	z5fpwcvTugY3/MnUPgrhnBw85oevii2xI09R
X-Received: by 2002:a17:907:7fa9:b0:b87:173f:61b with SMTP id
 a640c23a62f3a-b9b348a060emr151018566b.9.1774542361098; Thu, 26 Mar 2026
 09:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260326112521.2827500-1-wusamuel@google.com> <m2v7eig4ue.fsf@kernel.org>
 <CAP01T74KNVT2SVRR+XPbFb1vy85W=Jkp4_yD6xvTSg2avQo8AQ@mail.gmail.com> <CAADnVQK252XxmxM3enS4wPREshTEawQKbChgN-teX3+wmxgdBQ@mail.gmail.com>
In-Reply-To: <CAADnVQK252XxmxM3enS4wPREshTEawQKbChgN-teX3+wmxgdBQ@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 26 Mar 2026 09:25:49 -0700
X-Gm-Features: AQROBzDpxR80sNDZIp7I-1jwQ56Npkte6GZeWCLG3T-hio_UtCQbkOqHje_ZuUg
Message-ID: <CAG2Kctqd4p4pJtH=tSfKT57qfecQrpcoYu3SsAzJ-zGEiYVSQA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Support BPF traversal of wakeup sources
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
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

On Thu, Mar 26, 2026 at 8:02=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Mar 26, 2026 at 7:54=E2=80=AFAM Kumar Kartikeya Dwivedi
> <memxor@gmail.com> wrote:
> >
> > On Thu, 26 Mar 2026 at 13:20, Puranjay Mohan <puranjay@kernel.org> wrot=
e:
> > >
> > > Samuel Wu <wusamuel@google.com> writes:
> > >
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
> > > > traverse the wakeup sources list. The head address of wakeup_source=
s can
> > > > safely be resolved through BPF helper functions or variable attribu=
tes.
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
> > > I left some inline comments on patch 1, but the high level concern is
> > > that encoding the SRCU index into a fake pointer to get KF_ACQUIRE/
> > > KF_RELEASE tracking is working against the verifier rather than with =
it.
> > > Nothing actually prevents a BPF program from walking the list without
> > > the lock, and the whole pointer encoding trick goes away if this is d=
one
> > > as an open-coded iterator instead.
> >
> > Which is fine, the critical section is only doing CO-RE accesses, and
> > the SRCU lock is just to be able to read things in a valid state while
> > walking the list. It is all best-effort.
> > Open coded iterators was already explored as an option in earlier
> > iterations of the series and discarded as no-go.
>
> kinda best-effort...
> the way it's written bpf_wakeup_sources_get_head() returns
> trusted list_head. It's then core-read-ed anyway.
> Ideally it should be trusted only within that srcu CS
> and invalidated by the verifier similar to KF_RCU_PROTECTED,
> but that's bigger task.
> Instead let's make bpf_wakeup_sources_get_head() return 'void *',
> so it's clearly untrusted.

Thanks all for the fruitful discussion; this is more rigorous. I'll
update v3 so that `bpf_wakeup_sources_get_head()`'s return type is
`void *` and I can add a corresponding selftest that directly
dereferences the head and expects a verifier failure.
