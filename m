Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9AD1A6826
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 00:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774054017; cv=pass; b=e0/WzNPwRno8wE4XWQV1Uufj2WEIEMLgyJasSp1J9CpcRvlztXGYyy0k3bl10MM4BZnybbruCM3sYV5buxTpSUeNHYuG0GRWk8NAYEN45k6qAYiE8OIA+NbR+d9FopORTQQ1exhkgF9yP7IuxJexegGDFysVXqG6ARqnhNvOspE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774054017; c=relaxed/simple;
	bh=GKt4vcoKxRiDc5hKfgsDBKpS+h2PSAqQrw8wYfNmzEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oafa8Ks4g9ug0aqkkccV1l72awL9qzMqbHJ5NteoAMBJUNh141aRDJhp1O1KfBuw517JzMju2imjzAV3aXyEqN6/YxlxmIP0HXS7S3j3fXitVJrPdwMvbF+zUKwv5EmS5W9MNbGW6stOJJ+LgB97+mLfQdDPgIR6Me5al6YXfIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HZoB63gY; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HZoB63gY"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8f97c626aaso401310866b.2
        for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 17:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774054014; cv=none;
        d=google.com; s=arc-20240605;
        b=Z9A/31o32eMlgTZnfxW8PAQo8zfH3F27OiDD/Y62/2kyQtHiFGwNcjpAyTWbKzsEfK
         xmWi0BmY7HiAZCBQEZWVTKq7tdel6Oezx/AZmd1UBzhIyA4J+Af9y+HFp7F7FSNRIQ6I
         xmcAuHJbh+wF8FeRKDQYUiKAQpSr5nqmPTF4eisr3P6S9D6Um6zcc6ZzPCchUm5uF/sU
         a2TiA/mZylkDMGn1O+xFT6aN4jJDBrSPObSlKo2EWLGEoNFljZztqy17rVc63WwL1jiT
         ed93Ybq0RpV/fB7jmY/P3zIG8PWrUr4dAOxoNNYNqwJmFPIuMlGaAW9I9cdsTNcHgxW+
         vPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+0bd38FVc9DlY8Rqi/0MBvfcLcfA2IutdpdwWLkr7Xg=;
        fh=MCfIid80ZWTPAug/F+0o+FrYDoyrwJyt5lEI+NJ0GN0=;
        b=ReFguMUTjUNcnBCcz1n7s9J24oFumNumL/AC3scpzmnSJar5k9Q9xfY5xlJrwrFVZl
         2sev+B067V1gq5qSVnilgh76cCkHIap08gGZHL3ZrgWV7y3Ua434oIZw4hA2ubMIxFnK
         sllwk6Gxa6k7DtgLMOgi1tK+yqm95ulfjI/Dh1JIFYXu39B8TP0u39A8Amq9rf6HnEV7
         11pnQvYrlo/E9/ff/i3czdlifIoh/oLPuy9IHp+8uUHNejzraCgOu5iNje0DydmJuaIG
         9JPMbDWrjg7sjXPj+glbdjKWe08zoztytwTcVPbmIlSVmz19tsUcpDJOTb8Lf5QvRYDs
         Jhdw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774054014; x=1774658814; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0bd38FVc9DlY8Rqi/0MBvfcLcfA2IutdpdwWLkr7Xg=;
        b=HZoB63gYUQKWZtI+HIUE4qku32RTsDyUx9gpITzX+vGln7XKS0bbguInKqmIJ6a+D+
         d6AK1t0TVQ/21pq55H9rpqsrrLgIUnCkVMSUozSUB+WuXtVaq/2/2m08K4O91TIppvD/
         ECu/bOQ+PUFpYjhA6eae99XKmpzHh99b4KRk+MQWdBbv+c1VPSEI+6ZLA8NEh4sKFqax
         Y5UmXx3hEXv6GGv/d7rwzghjjm7VTCuML1avyRgGA8UWqFaCUWUMsy8tM9VvpZpVb6ni
         qMPKrEBDHi93Cct+vf3FUm/FAHzcM6qCo4OO5Jj2FN+GlzI+ifp6/utgwMwaOIcqQLaO
         2Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774054014; x=1774658814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+0bd38FVc9DlY8Rqi/0MBvfcLcfA2IutdpdwWLkr7Xg=;
        b=T4Oqa8Vx76PVuF+csFhRKHqRg0KdgNfTBG95ePrg6P42Trf0tkUM5+q2AbRe/WRgPd
         zMhte3BGeFaV4ZQ07Vm4f2bagLeE3u9qC++jyvNBGRChfR6b8zimo9lA5o6QjAui8etY
         WHmKXxNUz5bflOaZQkC/hS7V32xMDpY/j+n/oZZR9/b4wsXTzloP7UqwCE0aqa9e5r5M
         Mt6uG8QASE5L3M2B0cCL5Xk1Kutsx9ebjwj5BCyXBwoa+pVIeGP/k2/KeMg/icWJz3bL
         V/LmG1lGuvHi7ag8voOCfdi3t+sXM8df9VLlKay17BqgxTdn4nKKeeahm4JiEDx/ZTcY
         I2hg==
X-Forwarded-Encrypted: i=1; AJvYcCV07mFUNr45RlC45/kolf/OYUyBvzo1MSdxjBEo2ZgtVMBF/KDT65wsWVZqaekOCGyluFV5bo5OwGrX5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdscz9fde/Hw+9ZQUWUbvzOo9G7uCyuN4jvMFd4n2QOV4JPKAZ
	hz3mcTV2GnCIn9g3aJ/E5kFj2ztt/EnejJcwU8ytbO3rr4u8IgiUAa/F3yEr5vsg6EjEMAtD+aG
	We4drak5o5F5wYdYVAbbVLBTMgfn54o3So8H6Qyns
X-Gm-Gg: ATEYQzwOH6fv5igc46SMefdxze721fkTpNiMZmnpow4Y1J0auy+xazcQQYeayhWwg49
	YpVdrZD7So+kqDrYW+i0rt39SE5Bd8pioz5SRNfWBw0M6rm/dOQbVWRnuPQVze6B4VNBMbYbHrc
	JB3XF1L0vI9RVX7QVr8I9usQvoIzGFX83sdUU+lHJHNDEI3VtHz4xEe47DC/6mwQpnvYd6ELde9
	drKtLa1Nf0UZS6iEWn9Mu1wImVlIREjCy4zMlQhBwrJg6/ZUp/4Oj6KVdKzS/nG1SfuhXR+RIue
	6L1G8Jt0cJfiCAeX0RUojjNdPLpm3DttBorwabqX
X-Received: by 2002:a17:907:a807:b0:b96:e3db:9e04 with SMTP id
 a640c23a62f3a-b982f4faea3mr346138266b.53.1774054013710; Fri, 20 Mar 2026
 17:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320160055.4114055-1-wusamuel@google.com> <20260320160055.4114055-3-wusamuel@google.com>
 <CAJZ5v0j-DWOe63meNY0eOCuT3US7Oqd+0M_hStmBO_nPnkA-FA@mail.gmail.com>
In-Reply-To: <CAJZ5v0j-DWOe63meNY0eOCuT3US7Oqd+0M_hStmBO_nPnkA-FA@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 20 Mar 2026 17:46:41 -0700
X-Gm-Features: AaiRm52uidG_JN_iNt0QjtWA1eFaeRgUfs2_72YgoC__7LmSq2GydHxOq1wRUZM
Message-ID: <CAG2Kctqw-11W3fDudVdxmf9G8k2TSFq-iidZUGKPDmCp0Sq=vg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] PM: Add config flag to gate sysfs wakeup_sources
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, andrii@kernel.org, 
	memxor@gmail.com, bpf@vger.kernel.org, kernel-team@android.com, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 9:09=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>

[ ... ]

> >
> > +config PM_WAKEUP_STATS_SYSFS
> > +       bool "Sysfs wakeup statistics"
> > +       depends on PM_SLEEP
> > +       default y
> > +       help
> > +         Enable this for wakeup statistics in sysfs under /sys/class/w=
akeup/
> > +
> > +         Disabling this option eliminates the work of creating the wak=
eup
> > +         sources and each of their attributes in sysfs. Depending on t=
he
> > +         number of wakeup sources, this can also have a non-negligible=
 memory
> > +         impact. Regardless of this config option's value, wakeup stat=
istics
> > +         are still available via debugfs and BPF.
>
> Well, except that otherwise it may be hard to figure out which device
> the given wakeup source belongs to, so I'd rather not do that.
>

Since the config flag defaults to yes, this wouldn't affect current
users right? And then the idea is that other users who don't need this
sysfs node can turn the flag off to save some cycles and memory.

[ ... ]
