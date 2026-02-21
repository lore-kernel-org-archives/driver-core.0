Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669C7199252
	for <driver-core@lists.linux.dev>; Sat, 21 Feb 2026 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771690303; cv=pass; b=tSjP6SYjol+HMIAOiEOIxB0f37uBjBTv059RRaUaGr0FGCNWU27L2Ci/WRThkLyRbrBeZlxk1CvXKrvhseaK+zW2Eti2dmaxX5ufRGOgTOksNyDK04RcAabR51Oum1YH9T0xVToEpYetiCbKsfsNClNL407pT7rV/QJWzhG034Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771690303; c=relaxed/simple;
	bh=WFk2dMGDXodWdBOsas5Wh8VEIYFRodTYZpiky7YPwy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6ji4E5FGj04iJ0OMegusKCeh7fz/pAmin9tfDMKsSDlor8NFnI7J12ycVaNI0G/YklY6kmVOGqw0UH0NYLHW0A9R5P1ArpfKhxm404BODmrPogL676mFpNucBzWChbKJsaT0g7O8oe+8sC1+L9fR5yfJPaArnMmsu/nWT5LYdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdWY+iYL; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdWY+iYL"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b904e1cd038so429596666b.1
        for <driver-core@lists.linux.dev>; Sat, 21 Feb 2026 08:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771690301; cv=none;
        d=google.com; s=arc-20240605;
        b=Wodmqm/rjz8p0rsmp6sqX87TQwfLO+3cP6Ca7Vgm8m6qlUkHCi/TzwO4eVgqxdbGvo
         O7Qd4ZTQ2+QJWASkJPmGMoK20VbiXJnt4ARGWo+RYqq3zXj+TGU0lX4JW8cM0GJWQ+Rp
         IdP+yecegWd1vhnfYru6ZTzoTuQJhGB/eEjDp8S0aRAPTUr8vPKVQwkezLe+rSIHOssJ
         lJIbz7K6iQVw4apgR/bqiNSk3AemNryiJhDG5L3EBUu4HUBf5xTBS+I7fniLxovzmNK5
         /DanPhdCvWQeqkSEVqIcSHghmVtl9klLFhGkJJf/cu+kECAs7sAOCBA4MG8wUxqN4cU0
         9FXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WFk2dMGDXodWdBOsas5Wh8VEIYFRodTYZpiky7YPwy4=;
        fh=QCKBs2JJzkFwuF4zIFo6Zex1M7Jn7ikwPQWCzNd2uBI=;
        b=eURJbu4FhwzjWtr1F8LE1F+n2nXVejVECcu4NP6BBJ2tg/BBHB1MJagjxNL3pkT1Lh
         m8MVPeFdhxA1kRdV0LnagQKGcQCyY+AfKaX93AQfaDA8IjJ0qMRrbudegJp4Ef/a55V6
         vyAH+wHU2q1mVCtJY36Nyb+X1pxWpoIPg61Kxh49aqnLvYoM3dOio33O6pLPIFh7jste
         C5Pj38pOgvaZYVhxJDUl7MUJ8TdD+fqpSkdbcCM7epkwHwHSSVkOKV2msLe3IIXnyuoZ
         NuRBvOZsTwSNS7P/QLNsp2wMY58wh6ACGcC+5nlz68JKUML+7WDrTp73s8SlZdPtwWID
         OwcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771690301; x=1772295101; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFk2dMGDXodWdBOsas5Wh8VEIYFRodTYZpiky7YPwy4=;
        b=YdWY+iYLn4WrngHbAKbXkc62VfUyKsY6hdWXr5E6dILLrH/hEADYxWO/IFCqIehZLp
         QJ1/++GjXH45nUp7f3lElVOHqnxSvhM7dSrCsLNI6+bsXIW656wYf4ClBvL6dLB6azp0
         hn4sx1xnLMhGoK2TWN2U+t3kR458RfVyj1HP2JPlX7N5Q23LzYAGSNf5SzEC8H4vEuuZ
         Aha3pzy+mDFY1QOItUWQ4jgCSqM4T9MG8VWEiPqSLJcQBpWAr2jVmS6U+tCw+iQA3hMc
         igsDtzmQ78nPJ4MfCxuWQViokQcLA6nt14S+ojZuPI+y8Bs1ncvBwDn98aGk/T7AQVcd
         McXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771690301; x=1772295101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFk2dMGDXodWdBOsas5Wh8VEIYFRodTYZpiky7YPwy4=;
        b=cIHgP89EE25cg0H5X5K5NEWY4+BIyDUmnvq7k3XFc0g3hS1L3l1oPCAbOpMDwpKlIB
         EDYBRMl541TqWlJHLWA06tdhn3bEl/W3f0F9sc5ByQ+1VjrSg1b4MlXuibGEoTtv6lLm
         Yf4oGG7IRkl0GY+JPll9z8UWiXh2lecpou+1blemZ/1w6tKMmUA7bzvLZZYD2NSwlWF0
         GY62p8KjRuNWhY7X9Z8nufcL9fro+SI8SvxNmuCn9DHbLF77fWuSoun9x4ZRKrD0abI+
         4JnLSvfVfI7eLKc7jNLh7SNf8oLaRzhnxCRR6YDBRtTdnF+1UWkXf0cxy3lW9QDaAK5O
         EcIA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Ei3RBBOVxK5vNj86rVFUVFGIhswWYD4kcDiuueNDF7huG1ULBUQbl7kRWx9M35TW0nIyZP4Vdxw3RQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcKezUQTzyDXjfS/quXgBiPt3/TtAdE3/eYk2Rvp+D05yhEOtj
	Ha582hICZYfmCGHF/ETOcImiCXyy2d3bDDFKAcS7AaazjiwhK0qfO0stn6ilARo4wR9D4LoCl+L
	tkOm3itGWy0IF+hufPD8xEt3fQbLhk3Y=
X-Gm-Gg: AZuq6aJuLP7mki7dOnT1Sro5SaIGaahAu2VOSM4BR5ErMu0sbFqQvKxZjDG2U//8/hL
	octq6FO4Huk53p2U/eZ4xHYqIsmKghA63s+0Y4iFmjtLZbDI48FiyfUwRcbXw5TaIfgB1Bz2BdC
	byy+iy0dNYBIz9mTp0bXdIb1KyOoz/IUSspPtrKSsF3MuUKryIpmwTlty3phAMfVaBMN+RQ2lme
	ZwG4eh4F3RqpHxDCe5A//gjSF95TpHD6Qsu4kyIdbkBdyf4c1hKyYsDJnES1iLzgV4/DDu7oGwR
	Ju3ItlQ6DhtPiJlwBxit0EDWmy3p2JLqXLkxeBuB
X-Received: by 2002:a17:906:474a:b0:b87:7938:7b77 with SMTP id
 a640c23a62f3a-b9081b4adbfmr135784766b.30.1771690300450; Sat, 21 Feb 2026
 08:11:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-3-tjmercier@google.com>
 <aZh-orwoaeAh52Bf@slm.duckdns.org> <CAOQ4uxjgXa1q-8-ajSBwza-Tkv91tFP-_wWzCQPW+PwJMehEWA@mail.gmail.com>
 <aZi6_K-pSRwAe7F5@slm.duckdns.org> <CAOQ4uxjZZSRBwZ2ZL31juAUu0-sAUnPrJWvQuJ2NDaWZMeq0Fg@mail.gmail.com>
 <aZju-GFHf8Eez-07@slm.duckdns.org>
In-Reply-To: <aZju-GFHf8Eez-07@slm.duckdns.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 21 Feb 2026 18:11:28 +0200
X-Gm-Features: AaiRm50siD9H0RcvpiyV5fyHjGmjcm9TLE2lBYwftlepNHL-uvxe1pX7UaXUvqc
Message-ID: <CAOQ4uxgzuxaLt2xs5a5snu9CBA_4esQ_+t0Wb6CX4M5OqM5AOA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] kernfs: Send IN_DELETE_SELF and IN_IGNORED
To: Tejun Heo <tj@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, gregkh@linuxfoundation.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, jack@suse.cz, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 12:32=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Amir.
>
> On Fri, Feb 20, 2026 at 10:11:15PM +0200, Amir Goldstein wrote:
> > > Yeah, that can be useful. For cgroupfs, there would probably need to =
be a
> > > way to scope it so that it can be used on delegation boundaries too (=
which
> > > we can require to coincide with cgroup NS boundaries).
> >
> > I have no idea what the above means.
> > I could ask Gemini or you and I prefer the latter ;)
>
> Ah, you chose wrong. :)
>
> > What are delegation boundaries and NFS boundaries in this context?
>
> cgroup delegation is giving control of a subtree to someone else:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git/tree/Docume=
ntation/admin-guide/cgroup-v2.rst#n537
>
> There's an old way of doing it by changing perms on some files and new wa=
y
> using cgroup namespace.
>
> > > Would it be possible to make FAN_MNT_ATTACH work for that?
> >
> > FAN_MNT_ATTACH is an event generated on a mntns object.
> > If "cgroup NS boundaries" is referring to a mntns object and if
> > this object is available in the context of cgroup create/destroy
> > then it should be possible.
>
> Great, yes, cgroup namespace way should work then.
>
> > But FAN_MNT_ATTACH reports a mountid. Is there a mountid
> > to report on cgroup create? Probably not?
>
> Sorry, I thought that was per-mount recursive file event monitoring.
> FAN_MARK_MOUNT looks like the right thing if we want to allow monitoring
> cgroup creations / destructions in a subtree without recursively watching
> each cgroup.

The problem sounds very similar to subtree monitoring for mkdir/rmdir on
a filesystem, which is a problem that we have not yet solved.

The problem with FAN_MARK_MOUNT is that it does not support the
events CREATE/DELETE, because those events are currently
monitored in context where the mount is not available and anyway
what users want to get notified on a deleted file/dir in a subtree
regardless of the mount through which the create/delete was done.

Since commit 58f5fbeb367ff ("fanotify: support watching filesystems
and mounts inside userns") and fnaotify groups can be associated
with a userns.

I was thinking that we can have a model where events are delivered
to a listener based on whether or not the uid/gid of the object are
mappable to the userns of the group.

In a filesystem, this criteria cannot guarantee the subtree isolation.
I imagine that for delegated cgroups this criteria could match what
you need, but I am basing this on pure speculation.

Thanks,
Amir.
