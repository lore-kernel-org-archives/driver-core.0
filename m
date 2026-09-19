Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168F4234994
	for <driver-core@lists.linux.dev>; Sat, 19 Sep 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831744; cv=pass; b=fHXGjenazo+FtT8/MUcHkiE3gHTlozC4WST3h4b1jm6HnFHaxjszl/N2OGX1CfoFGBtm9/hb8AZOrWOO1fJHX4THgxk6wzmnc5uZ8GeioWAjf5UVzM0AYXmTjzGr6IXqqwsumxQoR3m4+0md8CzRzWIFwm2ZdVl0yhRui5q728s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831744; c=relaxed/simple;
	bh=jOLtCA5xBCMN+IeZjOlru0hQ1zFhY1Y2MZjJga/2kjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pD1B/H/faSVwosOY4FiWQqS+qdxsefrbndjI1PSBoHu4nR0SAGb9g+zp4ryUCfwy2XU2IFMTT/ucN32zF3aHtovONeFbUR2Xoz+Us+5z5jUFIezlqvFvMN8QLbTrvQlaI/aB6Aci4sSoLbMhHiuw1SXn2qadw/pzDJsnKQIEOjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=Q23UIvDA; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="Q23UIvDA"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab2029eso1579129d50.1
        for <driver-core@lists.linux.dev>; Sat, 19 Sep 2026 08:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789831742; cv=none;
        d=google.com; s=arc-20260327;
        b=MqR6UynQYOhyUjoO0aTiMd53jdLh2IZvxW/eRi3ja9IMRDFZxgI4egCJ3CtJJSfAfE
         yEg11AZp6HcBDZ+/t8C0b0hxDY/2mWJVB+qSFtbSIvkOYQ+lqNer+w9LeN/3/GAc8Ylg
         FKevo7z9K+Uzf2L0F1bEKiKHvODAxpkynYVaxK1UJ5N/0bjfRlqAZB4+8gGA9+pClqrE
         Fu1Dz6PesNQc9ctqYUn289BjPFczN3G+nlB8GXvmbW9X4KI9q5vQfJzzFcC9lvWjAr8c
         VbpxbXWPyMzlsQENmpflNb1u9Kgzu3bIyOQ+93zZvJwm++hdoztYrB7Q6siTm09uIXV5
         zIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0TpZBfQv1YVfjKqwYzlR7A5wrn37+yIqc+S/AtQHiQ=;
        fh=j/2NfTO0/WxY0OEm1DxSpka0Ko8+GQIuGQ+QQglVUGI=;
        b=l0ka/gFGz1e3n9eRKv1XGvs2O8Iz5iglUt22kHUwf7xeTshFVtApUWuy2MN8N/73xJ
         g29PEnw8Mbs+oSHeiUH/uKszNG3NNsEglUtd1/o1EBQa/fhylgEzzgcLlkoDZZChdhf8
         2tUH/MnvuKikYr190ss0hXFIOQ80q4jpFVeyvcPjA2/by6LnkK9iwvUb9GAt41N1IJlN
         6+dfbjfyfqGYk9aojU0MV9iatsfQo7kz31lqAGrJscof3s90Al60Xj7xowXcqqOM2ZhR
         uj1X+b5FqRyc2hLsXisH+ZtOXzPmVjexEudVLYYk06S088ow27edNwj56W/Y8GRMK3qF
         RBug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789831742; x=1790436542; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l0TpZBfQv1YVfjKqwYzlR7A5wrn37+yIqc+S/AtQHiQ=;
        b=Q23UIvDAPPK30+b4Hv3iYe/Q+r6uVkIlpMLc1tnt0mDL9RomkFqTgI2CfU3Yzc/W6m
         7hyBic0QINmZMPnVN3DfNzwssakcaUeJQipLYwrLVb1UgPZM1IlA/eX83fKwtYmoDmpV
         3aJhwW0q6GiiQ0CqnSEfzA3cEKn+10mf1DNrxmmB4jzK6vv1o52CJxd5aETyRBQXlWXV
         jAoIJXac6e6C3WQ5CUUu7sWohH2vjJdO+hoRrLr2MOcDPz1j/XzsBGGatXBw4BI/eSTP
         a3L7RFLoYC3eno6F3C82leg5z/wgDfc4ggVX44SPZaEeUEbzZ9F9yrc5oXmqykH9vXw5
         +3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789831742; x=1790436542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0TpZBfQv1YVfjKqwYzlR7A5wrn37+yIqc+S/AtQHiQ=;
        b=E6fCOG47N5QfSvY94+hTpyq0pA5cSpseOZzNvJJ3DavhOVGccZC5r2X9QzdfhVl6bz
         iBLGKZLyLG149tlEdGgCv30XYtn6XeHMmmefzBhN+yGKID25rhByq3+j+X0qVZ7nOyky
         HRCzqi9ukSXuqBxmec+V6exJhwoechA6XICnXAvPd8SyApH4Zk3iLFybsE714B0gAekk
         s+U9sj0sGcoWiNstFCG0ZSg/J8JaDy2BXMK0O78SuI7YUIqNWfKPSFNPVCEm8EWFDjWg
         l5J1IL74018lGT4EwpYAj7ai5si/tYit8jipGYkClHHH2zpjMp8q+087f7gYsq+O+aPr
         T1zg==
X-Forwarded-Encrypted: i=1; AKwUvBwhRcMc3m/ltEH8wJg9I2Cy8OuWVAq+VBbhzftQuwsINUG1rLW9P5H6/2CxCTAB/DHjNFd/wtk7jEr+9g==@lists.linux.dev
X-Gm-Message-State: AFuF++nyAJdCpxhV+Fc1w7tNJqJCsW5kaQgnHb2akbCwZTS0x/bR+3ox
	z8IA2Gr3LEfiKcS6OsQhzM5BhRXa6nTu34Gy94KomlMFa1KM3/8qXdWS8bF4Bb7gsGvzIzbJBRh
	W1StoWCLxxiVmhLvMCQaUwUcvh+rD/G9/R0H+UuIlBJQ=
X-Gm-Gg: AYBFou1bfyipWF9aCbWSvJNr0CB/lSQ9TC16Cau4heFyQoPESbj1bg6VVxjdRJb/ufm
	95EJld2ffZ3nVcG6P03lcWJODa7Y+uGBVC/j1QhXpIazzufaYHS6ueo76cZ36WyP/Ws7opR2rE8
	0gH+aeC0qGwZh7AwxY6znC9+SH1I0hgII62HpRkzNXYBPKyubYgjhf/Ri3HatVImNbTpicMKOij
	I+He4sWnevoJXxDGlgB48Lgqx3T7CJKmhLAHM9Y8yv5bKKJQ9ZutK8/3QdEdrIG4/dk+8shQB9O
	2TYIfXHd8di6L0EqZKA2QDD+9DsLiNkdb6AwwLuDUZup84+SStXVVt9ksFdupytaq+LDD+v0L+G
	foK+Z3rD86GMsTgWkGU/rex7IFNRULhBX48fVg/NpG7NWlCUvuo60UK6teCaTfinoNH8QO0aPJl
	0w3ZiRv1Vyd2DiTug=
X-Received: by 2002:a05:690e:4511:20b0:672:99e1:11e8 with SMTP id
 956f58d0204a3-67299e11752mr455363d50.133.1789831742087; Sat, 19 Sep 2026
 08:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com> <aq6gJTYTpTr8sYPj@cashel.logfs.org>
In-Reply-To: <aq6gJTYTpTr8sYPj@cashel.logfs.org>
From: Chris Roy <iam@thechris.in>
Date: Sat, 19 Sep 2026 20:58:51 +0530
X-Gm-Features: AcwNN1WmuQ-yAJK_L0Mqu0n7bynCj_HJ7gLPmHLdxL6kt8_egR93r-O600_Qqss
Message-ID: <CAE2Bdm3K+ZnrfB7xzkg=2fzMs7AmJzdF3aYCpN00h90TR6FMog@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>
Cc: Richard Weinberger <richard@nod.at>, Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, vigneshr@ti.com, 
	Adarsh Das <adarshdas950@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026, J=C3=B6rn Engel wrote:
> Finding good names is probably a fetish of mine, so "val" is mildly
> disturbing to me. [...]

I have a similar pet peeve in my domain. I kept "val" since
it mirrors block2mtd_setup2()'s own "val" parameter
(the raw <dev>[,[<erasesize>][,<label>]]), so I kept it for
consistency with the existing call chain. I had considered
"spec" but probably it would have been similarly unimaginative.

> Is this check necessary? [...] Looks like the kernel is still
> undecided whether checks are necessary or not.

I will keep it. kzalloc()/kstrdup() under plain GFP_KERNEL can still
return NULL under real memory pressure (no __GFP_NOFAIL here), and
dropping it would be inconsistent with the kstrdup() check two lines
below.

> That's quite a few calls to the same function. [...] If you feel
> motivated to dig deeper, please do! If not, I'd rather leave the
> mess in place than come up with a half-hearted attempt of a
> solution.

True. It is accretion. I'd rather not bolt a redesign onto this fix.
However, I can look at setup2()'s callers as a separate effort.

Regards,
- Chris

"But how could you live and have no story to tell?"

On Sat, 19 Sept 2026 at 20:16, J=C3=B6rn Engel <joern@barelysecure.org> wro=
te:
>
> On Sat, Sep 19, 2026 at 02:22:15PM +0530, Chris Roy wrote:
> >
> > +struct block2mtd_setup_work {
> > +     struct work_struct work;
> > +     struct completion done;
> > +     char *val;
> > +     int ret;
> > +};
>
> Finding good names is probably a fetish of mine, so "val" is mildly
> disturbing to me.  It's not an objectively bad name, just something
> where I'd spend another five minutes trying to come up with something
> better.
>
> > +/* Runs block2mtd_setup2() on setup_wq, blocking until it completes */
> > +static int block2mtd_setup_defer(const char *val)
> > +{
> > +     struct block2mtd_setup_work *w;
> > +     int ret;
> > +
> > +     w =3D kzalloc(sizeof(*w), GFP_KERNEL);
> > +     if (!w)
> > +             return -ENOMEM;
>
> Is this check necessary?  I'm in the camp of "malloc should never return
> NULL".  That condition is so rare that it is effectively impossible to
> trust callers with error handling.  So the right approach is to crash
> (or kernel panic here) instead of returning an error.
>
> Looking into sources I see this:
> static inline void *kzalloc(size_t s, gfp_t gfp)
> > {
> >       void *p =3D kmalloc(s, gfp);
> >
> >       memset(p, 0, s);
> >       return p;
> > }
>
> We have at least one example of explicitly not checking the return
> value.  But we have other prominent examples of checking as well.  Looks
> like the kernel is still undecided whether checks are necessary or not.
>
> > -     return block2mtd_setup2(val);
> ...
> > -             return block2mtd_setup2(val);
> ...
> > +             ret =3D block2mtd_setup2(val);
> ...
> >               ret =3D block2mtd_setup2(block2mtd_paramline);
>
> That's quite a few calls to the same function.  If setup gets that
> complicated, that's a strong indication that we're doing things wrong.
> Typically we get into such a mess one well-intentioned change at a time.
> Find a bug, fix it by adding another caller, repeat.
>
> It isn't obvious how we could improve things.  Sometimes it's lack of
> infrastructure and the entire complicated setup-dance should be moved to
> common code.  Driver can then call a single function to deal with
> everything.
>
> But if there's only a single driver using such infrastructure, maybe the
> driver is doing things wrong and should copy whatever other drivers are
> doing.  The problem shouldn't be unique to a single driver, so we should
> find the best solution and then use it everywhere.
>
> I don't know the correct answer here.  If you feel motivated to dig
> deeper, please do!  If not, I'd rather leave the mess in place than come
> up with a half-hearted attempt of a solution.
>
> J=C3=B6rn
>
> --
> You cannot suppose that Moliere ever troubled himself to be original in t=
he
> matter of ideas. You cannot suppose that the stories he tells in his play=
s
> have never been told before. They were culled, as you very well know.
> -- Andre-Louis Moreau in Scarabouche
