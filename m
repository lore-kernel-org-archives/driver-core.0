Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8832F5616BB
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996101; cv=pass; b=YaiaprZOIZCQjn6DMdWRcIajF/G/sdbOnBnCsnBxHkYYnWUU4rMhkd8LeIBBjfPBARN7J6uXjsXg4que85aRxGGTAwcxNVXuLIIKqjmtzD6tOGcyqaJKi3I4IO3DC4YJKq4PN0TW+uiVUrbE4NwHKzfDCNbuV3bI98V/Y9RreWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996101; c=relaxed/simple;
	bh=3mwSDPTFjJGkaatL1Lo6Mh8o6JdUk3CgZRH07sGguXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5lta3BKxoD45/kdQhjnfNzBF079UCz3i5kQw2R9bnvBNvKtoRinI84Le0IuKOlXJHQuCmOBTG+MpUiWKSI2bnDRzvkQCr6H2E9ebpxEF1L3c/FFKOClD1FARVglSRnXMwgqBp0VNxd/1VxFdElWe6gnNBeEm5j11dRS8W6L3ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ly1skk7c; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ly1skk7c"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so1288991cf.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 09:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996098; cv=none;
        d=google.com; s=arc-20260327;
        b=akqzEPeSCRk31Wkh9z37Pyf6n/sSStrzkdryviq05ulFlM3D4KBSEGo+alkiTEqCUl
         egQIH8zh2oMKCEPxP9bSXHxh+iyEU3D9QJsuZ8hsWK5B2TZe9wNyQNCxiexnVaiijW0Q
         yHs+ZUcr6VnGKUoDMnZrdG2LGGQ28Eij591zoDq1UBk0Ugd1HaNMzEUhw+9gHVPD0Bxf
         pC0gkGOPDb75Xnc9LhTVvwYvIBHpvYdMjRedy61pzFYTmN54C4ozfcO5xO0wKxV+0sj7
         sNXMTsgfIkuE1ravONOuyTZP73ojCwQ7+kefU64rUyvPc7d4IxTFM7Q4+j/WPdEqk0Pg
         TqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        fh=141VnPFi5pu9JrFrwtN1bCnGUZb+gYaaDJB4/J/Yfk0=;
        b=XVM3kMWNthp/7LYcWgWAsx4McxJXq0agD5wdXpHQrtKQ++PfknVisBXM04N+0Urir6
         ew3FzR9jZ1a500t/sO3xGXKvVk6f6MyWKu+20/5hF8YHoZkF1meH0hj8BVAHsSLV/2mh
         c2DGvBu1/jkLP2nSqvJVqJNQh3FT98ZwrOK/FnqRXkJjukHnOqkkfjdynWFSjRT0mL/s
         g/hKpSDdUbfqlKxhDT0Q5lcgFxhBjruAAgLXiP27r/M/ScoNkW34/UEPfNj20a9AUPWj
         7Jw7h8WcYC2ASX6/FplvD+2CXcVsmLfRmvEpy0SVAnmXic9b+AZLum/dZEGCjvbQFgoV
         4plQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996098; x=1792600898; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        b=ly1skk7c4C5vtGV3cbo6BSQX4GNtmVPw0XKFFqv41FTNFWMCFyrmg2Fyxjf3VThmPR
         pgyjJocF+SdPMjLhEDzXX/DDorCTBQsIS2ld+8NZjNXG+cRbdk4M6Ggj/0MU6t2h/PmA
         lQmvSRlD7VjLpdXiOr9pQ7pI4sgy8yw8mFD6GPYaUs0E32YXG/7gxYXYiqFmB+ui1z9L
         1piWxiV7AIaycSJxubTi0hrzY05OL6MVX/vqIn36SCETJ/PVIiVcGFu3jZcl/m1ACgxH
         SRF9A62AY75MB2EGWgs4H7zxDhJHLXn5obq4bDg5/XAw6UJGguMcbYmdZqq47IWcvHXU
         meeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996098; x=1792600898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        b=TVJgDsalqDswKynlv5bNo/txaujW+aCjUhbNHNVDXA+dXoeW5mw0uUj18HarZYBwDH
         OELsOFCuxY62U1l/332nzE7IJlh0up6Q4kLtZ+2OnZcytHtY+ztRB6hbASuYPrE62Nah
         Vcgyan/vnPzgtJliIiWqEn98XbBr1YK/JI686BSkqkYJDqoE1rke23K5Uck3NLsFDHyV
         shFdE6DLD1BfNb5HmYx8cMOkRewW3uwNeaPwJaEnJiNrudHmNB5Ggp6zg/zOj/c1Rrxu
         tKBhcn9m1VP/z07A5HG0fH8+bHYtrqLwnBYsRZUHiQ3IsZcVv4Osn918/lkk1TAS4M64
         9nUg==
X-Forwarded-Encrypted: i=1; AKwUvBwgIhjnM1lEbb75iHbb7hV8MjEv/PqEJukQrIGDn7rEH2+ODNu27bVgVpbILJXWWnlkgac5Ef683ft0nQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIX7ypzS7mj6m/KQKNvyGXYXAm6c9/dMNzAtgzdMxZC69Oa7Z3p
	M+/XMFTQ64VI9rF7BWNoHIHYOTzA578+Ln7XJuRCiK6Vik4kdd7R0y3nap4IbEvZXrqqP8i9/0C
	eARFrprBVfplv0gPbEHosjw0M4iA6GG4VPS8RaFfR
X-Gm-Gg: AYBFou0kW+vDIpdn1uZ9pK4CbrhNAoe8dn4pdVr3oJqAkv3uB9R6bN9mzDufFR20eZm
	0f9EaNqSbJ13r3ekA4+F9RJOT/XcAlF5bkaw6KxM4XHDXsAVnJSOB6GCWxiYASxssB0CmpjswnA
	nXUnwufiBLoLvZIn2rPgAUsNwLcR3euy5S2U5l1Ss0yX41JUIRSE7SOF0vdQfGEy8/soaORwYQF
	UB9GngZ0wxJT8fApCi9fWoW6KZvRzUE+MlxNg4GpBB7BXSuhqvMIKN25Q/aaurSe7IRY7qEPO8R
	kV2jiqiKRWiE5yVd9i3qUd5I2CbaoJkeZsR9XoK8I9O5I08CAp7UH2bLc0Ut5OEPdJIaL39OidH
	73fRTTY56zw==
X-Received: by 2002:a05:622a:1108:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-5360573c96fmr14813151cf.5.1791996097367; Wed, 14 Oct 2026
 09:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Oct 2026 09:41:25 -0700
X-Gm-Features: AclHuK8_g-YOJgMR77fEpf5RTsveF4u_ERdXz6lvoN6wh_uF7KP8ZsaUSV1ti8A
Message-ID: <CAP-5=fVLWh4uay2HGy6DOpZmtTr5WAd-TehAkN+P-pQgq_BZhg@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 14, 2026 at 07:36:41AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Oct 13, 2026 at 03:39:35PM -0700, Ian Rogers wrote:
> > > Clang supports the 'require_explicit_initialization' attribute on str=
uct
> > > fields to enforce that the field is explicitly initialized when an
> > > aggregate object is constructed, emitting -Wuninitialized-explicit-in=
it
> > > (enabled by default) if the field is omitted.
> > >
> > > Following discussion at the Linux Plumbers Conference [1], this serie=
s
> > > introduces __require_explicit_initialization in
> > > include/linux/compiler_attributes.h and applies it to
> > > struct kobj_type::release.
> >
> > Cool, sorry I missed that talk.
>
> Yeah, I'm really liking these compile-time checks. :)
>
> >
> > > As Documentation/core-api/kobject.rst notes:
> > >   "One important point cannot be overstated: every kobject must have =
a
> > >   release() method, and the kobject must persist (in a consistent sta=
te)
> > >   until that method is called. If these constraints are not met, the =
code
> > >   is flawed."
> > >
> > > Annotating struct kobj_type::release caught 30 struct kobj_type
> > > definitions across the tree that omitted .release:
> > > - Patches 2-10 fix 10 struct kobj_type definitions where dynamically
> > >   allocated kobjects, ksets, or enclosing structures were either leak=
ed on
> > >   kobject_put() or freed prematurely before kobject release (risking =
a
> > >   use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=3Dy).
> > > - Patch 11 annotates struct kobj_type::release with
> > >   __require_explicit_initialization and explicitly sets .release =3D =
NULL
> > >   (with explanatory comments) on the remaining legacy struct kobj_typ=
e
> > >   definitions whose kobjects are static, per-CPU, or embedded in devm=
- or
> > >   parent-managed structures.
> >
> > Sounds great, but let's fix up the users before adding the attribute.
> > Looks like some of these need another version so it might take a bit of
> > time to get them all merged.
>
> I'd really like to have the attribute available, and I've got at least
> one user I can apply today that don't require fix-ups (seq_file), so
> if Miguel is okay with it, I'd like to snag patch 1 and send it with
> my seq_file "first user" for this coming merge window so it's available
> starting with v7.4-rc1, and we don't end up needing to wait 10 weeks for
> other subsystems to be able to use it. And the kobj fixups can continue
> in parallel. Does that sounds okay?

I'm happy with that. I'm working to address/incorporate the other
feedback for a v2 of this series, but I can drop individual patches
that have already been merged. Thanks, everyone, for the positive
reception in getting this landed, I plan to follow up with patch
series for the other uses I found.

Thanks!
Ian

> --
> Kees Cook
