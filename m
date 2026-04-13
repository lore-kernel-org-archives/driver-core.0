Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A11393DDB
	for <driver-core@lists.linux.dev>; Mon, 13 Apr 2026 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776112773; cv=pass; b=ixacEGBbBdRVzj6zrAOfDHRohxITNibCP5p/eehQ7l2yD+1FejYyVCLhyLoe1PFP9dgHjdIGCSiSWo0lJ3mMlyGLvRTzjgBMZkrVSs/8iHpmwodCSZ5e4tm4L658dreaeCMMV/fJOvOZS6Rzxd+wqo9YyTJGrlLAVBlPX0XYtWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776112773; c=relaxed/simple;
	bh=PEZjoZa12UUj5SyO1b3BkdxKCeo86DiqtO9Y9tXDXgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAL5++W04BTrTHhwSe69U3mNZ1uB34PhZvS+snY5V3bTESAASKRlscdse6YwMJuLD85VgLVjyUa0Q12H4u4ukCQQRNu+7AaTDVppv1HLL6GCoi55BHDKtf5VDxpaEihqtSwe+tm13c6OiQUGUKfmpv4p7IN0rrDJUS3h8gLuS5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QwQGrF8x; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QwQGrF8x"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso633231166b.3
        for <driver-core@lists.linux.dev>; Mon, 13 Apr 2026 13:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776112770; cv=none;
        d=google.com; s=arc-20240605;
        b=CSj94OxIToeGCbevvwRfp3GugnC7A6FgXlrFb8dwupbrZJ4DnFfUTJ0IsVJHr+R4Ik
         93SmLJbtzPpP2DADsRlR7opE1DK9fVeyKqP5YqcjATTpNQJbo7qe3sY7oKcKYmeotW4s
         A453h9zzldrvoekjMoQVJzK+Wc+x4Yn1tHfq5fm/08USjQWEwk21CB85NyT/q/QysecF
         XDT4lVt9YBFqfre+HGKdFmBNHt7qAZJRDssqoo8Vb3gKK0E6+XEB8toIVMa1ZA0TIKqR
         bMdvDPmg5+Oy0GqK79f69Mho2+AvbuTD04epCPIEcBfSIBvmzAqrzuODAmFXW0lzg83+
         b2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TH4m/idJ4M3FjDEc3vL3oLYbFEZ5XJk9GPdaO6YXJ0Q=;
        fh=TcVllJ2tlWHQFTrEftK8L2EbSLud2ZsUBLacYtpz68Y=;
        b=bTkJCqO/xO64vV1moksj+ouf5+DWcb1fL7nTb0V/vemPKVDUs29Tof8xjjgD4fABGj
         ZEFIid+x3/5pABT/2z4nEcK960oF1z2hhxSt9NWZLFRgdm+8qIcyNFfP/1XnDXyeRALR
         iYt55l+kZj3JwdJwOBpUctQVUl3u8EiG3XHGReYu/NY9Zt7kVbzlbhG4tCdn1aCAcUhk
         I7bentOMd3LU+6hPZI/oy4EpSdCfx3i1AeAACWcB2+A8nKaCIXwjozO1aeTMpmsSG3+N
         zGx6jdB7fH+VWSZXc1+5zzTU3rQdamwdXdyveH9A6//Z/b4be6loKeV1NBRkZ/XHGrhd
         gjaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776112770; x=1776717570; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH4m/idJ4M3FjDEc3vL3oLYbFEZ5XJk9GPdaO6YXJ0Q=;
        b=QwQGrF8xSnlMk4RuVdVgyodS5Z+RYGb9ABk1VBlf+/RZcHrnGKQ+Rt2DgRF9VBzFNB
         1ON4oGUSMkISMY4OsL4nKiuethfP+Qul4A55y7zQLtYPr4hnZ7BiYXTIdtlsiUgXqvQE
         SNsJlA6aeBcnxq5+g/3pTc26RFH26VjIdS6s4JLXQP8OMagmURsaIZJHIqRS4qKlIavE
         16ZoK6+13a870Q5T4P3Xr1HebrDuP5tzP3aOFIKTfea/89fNwlNW9OaQTVSYml6JHFZO
         r7SPpgWyFjQytga5+QPLu8A8MQtYJbeSs6EUD7cM8LBxOFxshiBvg2YRWmjxLs4HALkG
         L8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776112770; x=1776717570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TH4m/idJ4M3FjDEc3vL3oLYbFEZ5XJk9GPdaO6YXJ0Q=;
        b=Q0gJ10zGCi40QiZMVmJ0fqJVTdYFGxNwTbxnQOzTuFqZPhC3HmmKuwIB1PwNTxRnV6
         Ayi05aonaJ2A1Q07dUWQowakGFV9CZfQZKHw11pRrwA6sLSuRZmVBXjYG0b+N3CqC6WQ
         Ds+PxGKVZNvTRtlsOfyDZm6a1+2MlCoyMmSPOSPJ63Y/or5/WLSR0Yc3c9oKn5ohsRcW
         e5VR+mjcmSIpQCIkmvUUpIP6ADx/xa8SEohVjikC0ipBjx8eSxs/hy3US5DpAXdNi5Ij
         ciN9Gu+0MeYgKG4x7m1I8AENaG6KOoGcq3i/6GWSwRGRELUyux9mfp2cxC4+LyvYItvh
         Urgw==
X-Forwarded-Encrypted: i=1; AFNElJ9KAzYTYnbBD08RduSyn5fAkbwOBBkYtYzV3WxxM8zixCzajKtxFOHZlqXb2NrLY930C8iyZ3BudBt0Yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdOxbisa7eTPhrOKQtUtlLOwOeqVB2MD47TaU1MwuO0+9GUSmE
	OTUCzNkehnUpmBhjM8p66fZuzQExh1X9bggHuxzzjgtdN3HieijQSE2OF//FsFtIMKBcDZ9VCiP
	1nlElHggFHnLdPXrysVStvhY3FGGeIxMQKIJvFUYo
X-Gm-Gg: AeBDiet40kkLjWVe4WdMXnBnaiPGBVQyqyX5h8EEZZ2KbQgFK5xM/u5c4fQIxeFw7iW
	A01YVsFwWqzjcztnrJOXb1DPdFaSr3Hk/xgj0+t11kE5O/UwqHd5jq4JivVGUsU3sPAFmVHe3Rq
	Ft94R/FmR1DwsnQyJDdOXGDpa6uYJQS8dveWvwX0XC1zngqNrR5syvtggnHxVgETA5Ubvo7trRa
	oBRUCCUK30p9rn7B2VnXXHVLvxg2KW4meiuYKvO1W9hqI/rap7+7Vbcqe/0w8EiCccIMFFwySo0
	POzmEM1ufM5cuqRWuUUy1E3f54fDFbv+UxiavY8UHOh+WzwOjkIK0RpdLa4WRoc=
X-Received: by 2002:a17:907:74d:b0:b9c:bc70:e928 with SMTP id
 a640c23a62f3a-b9d726577e3mr820713966b.25.1776112769834; Mon, 13 Apr 2026
 13:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <2026040136-ocelot-simply-8981@gregkh>
 <CAG2KctokEVVuhrs6tYuMjFF4ALR=tX80iZHrt4bhVvEKyoHzRQ@mail.gmail.com>
 <2026040236-kiln-carat-bb6d@gregkh> <CAG2Kctpr7vBm_=Xz4H5FHYAfFxg=bDt35j6B4EprfUGio=Ftew@mail.gmail.com>
 <2026040357-undefined-gave-c98e@gregkh> <CAG2KctqOLeYm_NFUjGdXQcBo1KhSZpXFQxQdM-DQBV4Mn0ahTw@mail.gmail.com>
 <CAADnVQLELWyv0kuv8wK3FJVFdJPbp-tD8d3p2pgCiVrcw_cVNA@mail.gmail.com> <2026041315-oval-rut-cb8d@gregkh>
In-Reply-To: <2026041315-oval-rut-cb8d@gregkh>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 13 Apr 2026 13:39:18 -0700
X-Gm-Features: AQROBzB9ayPqL4YBuz2jmsJ-T4uaqkCVLTD0LdsQ1h-gNQThCOSm7u-eqI2Gpsg
Message-ID: <CAG2KctpNTvkDEOnJAnsnXOfqEkzrVQSUF5S2=-NVoXiO-Tfk2g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support BPF traversal of wakeup sources
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Android Kernel Team <kernel-team@android.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 9:48=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Apr 12, 2026 at 03:48:58PM -0700, Alexei Starovoitov wrote:
> > On Fri, Apr 3, 2026 at 9:28=E2=80=AFAM Samuel Wu <wusamuel@google.com> =
wrote:
> > >
> > > On Fri, Apr 3, 2026 at 3:04=E2=80=AFAM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, Apr 02, 2026 at 12:37:12PM -0700, Samuel Wu wrote:
> > > > > On Wed, Apr 1, 2026 at 9:06=E2=80=AFPM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Wed, Apr 01, 2026 at 12:07:12PM -0700, Samuel Wu wrote:
> > > > > > > On Wed, Apr 1, 2026 at 2:15=E2=80=AFAM Greg Kroah-Hartman
> > > > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > > > >
> > > > > > > > On Tue, Mar 31, 2026 at 08:34:09AM -0700, Samuel Wu wrote:
> > >
> > > [ ... ]
> > >
> > > > > The data is fundamental for debugging and improving power at scal=
e.
> > > > > The original discussion and patch [1] provide more context of the
> > > > > intent. To summarize the history, debugfs was unstable and insecu=
re,
> > > > > leading to the current sysfs implementation. However, sysfs has t=
he
> > > > > constraint of one attribute per node, requiring 10 sysfs accesses=
 per
> > > > > wakeup source.
> > > >
> > > > Ok, as the sysfs api doesn't work your use case anymore, why do we =
need
> > > > to keep it around at all?
> > > >
> > > > > That said, I completely agree that reading 1500+ sysfs files at o=
nce
> > > > > is unreasonable. Perhaps the sysfs approach was manageable at the=
 time
> > > > > of [1], but moving forward we need a more scalable solution. This=
 is
> > > > > the main motivator and makes BPF the sane approach, as it improve=
s
> > > > > traversal in nearly every aspect (e.g. cycles, memory, simplicity=
,
> > > > > scalability).
> > > >
> > > > I'm all for making this more scalable and work for your systems now=
, but
> > > > consider if you could drop the sysfs api entirely, would you want t=
his
> > > > to be a different type of api entirely instead of having to plug th=
rough
> > > > these using ebpf?
> > >
> > > Almost all use cases want all this data at once, so AFAICT BPF offers
> > > the best performance for that. But of course, open to discussion if
> > > there is an alternative API that matches BPF's performance for this
> > > use case.
> > >
> > > I'm not opposed to dropping the sysfs approach, and I attempted to do
> > > so in the v1 patch [1]. I'm not sure who else currently uses those
> > > sysfs nodes, but a config flag should remove friction and could be a
> > > stepping stone toward deprecation/removal.
> > >
> > > [1]: https://lore.kernel.org/all/20260320160055.4114055-3-wusamuel@go=
ogle.com/
> >
> > The patches make sense to me.
> >
> > Patch 2 adds a bpf selftest and corresponding:
> > +CONFIG_DIBS_LO=3Dy
> > +CONFIG_PM_WAKELOCKS=3Dy
> >
> > and almost green in BPF CI.
> >
> > Except s390 that fails with:
> >
> > Error: #682/1 wakeup_source/iterate_and_verify_times
> > Error: #682/1 wakeup_source/iterate_and_verify_times
> > libbpf: extern (func ksym) 'bpf_wakeup_sources_get_head': not found in
> > kernel or module BTFs
> > libbpf: failed to load BPF skeleton 'test_wakeup_source': -EINVAL
> > test_wakeup_source:FAIL:skel_open_and_load unexpected error: -22
> >
> > We can still land it into bpf-next for this merge window.
> >
> > Greg,
> > any objection ?
>
> Yes, it is too late for 7.1-rc1, sorry, there will have not been any
> time in linux-next to add it.  Let's revisit it after -rc1 is out, and
> again, I feel that "walk all sysfs devices in bpf" is not the correct
> solution for a system-wide snapshot interface you want to have,
> especially as the one you previously added you feel is now obsolete.

Sounds good, when the merge window closes, I'll send out v4 with the
s390 errors and remaining comments fixed.

Regarding surfacing a system-wide snapshot of wakeup sources to
userspace, can you elaborate on the solution you're envisioning? My
understanding is that "walk all sysfs devices in bpf" is a canonical
BPF use case, especially in this scenario, where we see improvements
in every core metric.
