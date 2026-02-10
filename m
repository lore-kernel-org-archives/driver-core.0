Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C7248F5A
	for <driver-core@lists.linux.dev>; Tue, 10 Feb 2026 22:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770763711; cv=pass; b=lUKE17BmWJeDeUArO3RiMaaOHOc0PgSwOz68IPBplWcID+MKxuBbbey3sEF7apcS4C9aFZ6yTxj16dm2N5/XMNweY2BIFwmx+sz/lOuK7RmvrHoJWxHWeWghWfEzK4b6rZ6z9vvXELLvB2DVzN0wgJJnzlQEmWRWTkERrMyfmoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770763711; c=relaxed/simple;
	bh=7RueDEbxvfiJY9nFUB8GTsk9UAZbqARgQdFKPxdici8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7hfY7aIa65WWP0mr++gs9xCwGk8qSAHa16RoeMTOaFuLMel+EEOl/Uz/64w5Tl4LALQf/aOLkez9h3ts8ZNeyrLmA1ut5+ae9SAr0iGung2nZ6h91QSE0Oh4rfrvfZGwUyC8mtNPWIjt9d+06WiFlWCcvlwn2Rv7dkROwSBHXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YV7ESlb8; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YV7ESlb8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so9515e9.1
        for <driver-core@lists.linux.dev>; Tue, 10 Feb 2026 14:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770763708; cv=none;
        d=google.com; s=arc-20240605;
        b=iRwQgg9xMdbLTS8r45umEd4VVO8K+0/4rBJfQyxH+0JIVbzrAmojSbPRrqr04pWJaZ
         ZRuaLEIXmcXqvD8pr2teFLDaXeWHItSORDLQumInxenMg5tDTT6/KkTnDf8jDrn4yTnu
         KnA6hpQQJxhEGlJsvfxuSW3+pTninoXY/4zCuIWX/V0z7CF4TqjbF1/jzTkkuRtBtX0x
         N4m4jR7aPsjlFbTO/s209jJEMXI0reKfHcv6xqwb83GwlXQNh64A+evIKhCEGCP70/MM
         5pn3zS7VT64UqtkJUH9QwfQDl4vMyDR1tUJwbHdvnzECLfGeXQft9KpEGYebnRqtn1+3
         9XBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PuqeYntCSLTt3WclOHSOnzeNRZzfBKcRNCGgofm7tCg=;
        fh=NFrnHXX2PFym7TucNjWE4nOxDA45MCRPc/6ZkKTFMrg=;
        b=BQ/jSu4cr2U5sszzqALSioObaYAe4UBixjIYkrTK9f57TDmzyOWVKsADpNcYEA6mhH
         wO+u8YDhShnHk18+AJ8darYrhwI00fPyZdjdx0O5K6yLJ3itogompfSoNY6RkHK4gjn6
         oZVcqDCFp13pKYUQrqX9NLZpOG2DieZ/OeTuLzpdZL+vYC5Ij1VQbsf1foDixiSMYtMO
         15b5bmF5rJD2jPQMbavECugcA7mFBKuXmQTD+MmSEE4qYQk6Je4lL+0ODbhjUSlVqnHs
         Knp6oAyK1FhwpSvc8D5+MCeDtikTXt4u6yInoFHVAB123AEBraqB9XFPH5QoW/0xiDrD
         /nWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770763708; x=1771368508; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuqeYntCSLTt3WclOHSOnzeNRZzfBKcRNCGgofm7tCg=;
        b=YV7ESlb8jeUJfZerOFqd1Gl1oTs+jurgJ2A2wqXHeJ5fxpxpI7ouNKtwx2bX9YSwyP
         4kUvBGcGwRB86VayCdWxg3RNtYkvEApwZDa95yU2wMzaQThItmm5hCoTXFPQAMMpKlzt
         ZuGwKcQKAQckNj0eq/jtdXAMbRibtMIsItS/ATTiDdUnKOyEmBdwTWpAdK0MejbfLomo
         glsozwShTTKcH+D1jTaCfU9fVhXYdMoAFztRYgpwaEx68TjWxXe6moo9Vbi5ebxaBzQU
         1dr6egyqX81mjYKXoYIvjj5KltpVhZFyLKRw1SLrcu7KjxG0hZga6qGzpoUmmsuQ60A3
         gU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770763708; x=1771368508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PuqeYntCSLTt3WclOHSOnzeNRZzfBKcRNCGgofm7tCg=;
        b=vfuA0bvPknXccHY3Q/EvSxbohJOOkjAP8EaG6ChjkOuRqx4iynygDcJAZ216KHXof8
         e641QSxUmSY5YEys/nY13+gQOJT740i6P3r+JHULeppL3h5bQmaoZzKkvAy9W43bWsyB
         ofuk4ViS8vX+D2W0l7YEe+t1XffgZuuRioa91e7gu9ok6n8H1ZXF/ahDlFXX3iA3yeec
         6klOCr2tbT2wS7s8b7EauMkOMgWmuH+CJc4oLKBJ7FaQWNowYjWAvztDlBFlug/gsK0c
         J2GpM8j9mzVujztHI0kHKb/FFsFdI6naBuAkgCAvP17U7ll/w9C597ASzkl7z/2ON7jK
         R3nA==
X-Forwarded-Encrypted: i=1; AJvYcCWY3b0dBPCLq/DGGXBUTuxLFrNN3iQ9l/VvXQ2TmicYCvIZb6UL8ERgsAdtq5Ru8wuD7moL75oETLSBUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIlfNv5LK9shsJxPuhyNWsVFPdGZmhd0Cv0eAcJxenOG7IIkb7
	zbDDulkGeeauEoxVV3zKnm8mEGV7xZrK99IbYlAZNxddgqok+1y6lo70aSvDmpIpx1jO6dGO2wy
	lKDc5+lcUhegI0cERvxcaM6RxNcOq1A5W3FjxT/FO
X-Gm-Gg: AZuq6aI7xg+82YneT/bL5IpMqvtTQEkGX146UDh36i2+OsXG+3qxwUrK7U0RDIkUNo1
	U/a1EEUpg5ZSzZ9ByOU7SrF4Tzk+k2F/UT1hj4qoSuzoQoC2JUA9A1DluLtbXSdW4yY5R4Va/Gd
	FJl5Y/2or7wlI1pPpfIoPuHSU1Sxh6PingTjfjmatr//cMKfFK1UUj0B4H9gePCPStgeNNpwJ/L
	Go3LqgFMWv6h+cYA7HfI6z2qXiJ3aA6hU6I/L6D/VvW9IJig3WStNMuKhMwULrdHb6O2cCuMUkw
	H316yzzXpw5WD0+ZQRaHEqXoSN7KdpoGjN9W5XCNkHjsfBLG
X-Received: by 2002:a05:600c:1492:b0:47b:e29f:c63f with SMTP id
 5b1f17b1804b1-4835cebf7ffmr48345e9.11.1770763707610; Tue, 10 Feb 2026
 14:48:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260210003801.2834976-1-tjmercier@google.com>
 <20260210003801.2834976-3-tjmercier@google.com> <aYu0WZ-xCZr-bmsq@slm.duckdns.org>
In-Reply-To: <aYu0WZ-xCZr-bmsq@slm.duckdns.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 10 Feb 2026 14:48:15 -0800
X-Gm-Features: AZwV_QgfVPfvMntqiVCLNCIUNKNlybv8eQNNTRFicqch08xd5Yhkj2QTYq81v9w
Message-ID: <CABdmKX36bog6EvLd1bkGk+hd8FyPqjgqGZZ3T1gvskgvjZGxmw@mail.gmail.com>
Subject: Re: [PATCH 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Tejun Heo <tj@kernel.org>
Cc: gregkh@linuxfoundation.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 2:42=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Mon, Feb 09, 2026 at 04:38:00PM -0800, T.J. Mercier wrote:
> ...
> >  static void __kernfs_remove(struct kernfs_node *kn)
> >  {
> >       struct kernfs_node *pos, *parent;
> > @@ -1520,6 +1538,9 @@ static void __kernfs_remove(struct kernfs_node *k=
n)
> >                       struct kernfs_iattrs *ps_iattr =3D
> >                               parent ? parent->iattr : NULL;
> >
> > +                     if (kernfs_type(kn) =3D=3D KERNFS_FILE)
>
> kernfs_type(pos)?

Oh, yes you are right. Thanks.

> > +                             kernfs_notify_file_deleted(pos);
> > +
> ...
> > -static void kernfs_notify_workfn(struct work_struct *work)
> > +static int fsnotify_self_event(int event)
> > +{
> > +     if (event =3D=3D FS_DELETE)
> > +             return FS_DELETE_SELF;
> > +
> > +     return event;
> > +}
> > +
> > +void kernfs_notify_workfn(struct work_struct *work)
> >  {
> >       struct kernfs_node *kn;
> >       struct kernfs_super_info *info;
> >       struct kernfs_root *root;
> >       u32 notify_event;
> > +     u32 self_event;
> >  repeat:
> >       /* pop one off the notify_list */
> >       spin_lock_irq(&kernfs_notify_lock);
> > @@ -929,6 +938,8 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
> >       kn->attr.notify_event =3D 0;
> >       spin_unlock_irq(&kernfs_notify_lock);
> >
> > +     self_event =3D fsnotify_self_event(notify_event);
>
> Maybe just inline the conversion?

Sure, sgtm. I figured the named function was a bit more
self-documenting, but it's just as easy to add checks for FS_DELETE
where self_event is used.

> Thanks.

>
> --
> tejun
