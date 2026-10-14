Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5635E4BF949
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996286; cv=pass; b=TnN97EiQgYdfuOd6tj1/OT8gNpLv3r1zhbsj6b95YEV5NXZEoKaT+cjbo9NavBlaQma863cpPnoVBoZaIz9N9TpuSXl4Fo9fzpL94u6hryxmOjWeY5y+Fji/F+xv3PgwFXlgUFA7xtO7F9WLh8n7zgN5FwbeUXHlsi2l4s3L0mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996286; c=relaxed/simple;
	bh=aCsxctc/xcnHv1pMHQu5CMpv8HUZNsqkMA91yRiQJRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWR06swWaT2Nf9YeN/UIZ+tmroWT1foqy2wzA7RRmHfEB1YO5u2P206F35m4YSofCTP2zbDLud3XQ9XqPvWlNOqkD8XpJLcOI8Jg/Z3xDBiJuXQ6bBOLFPjcjku8Hhy62rse0gqjhxEao2QoMpiLUIqPr0QpETAtRLiPKqWDFEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PF8y9CkN; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PF8y9CkN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so38176985e9.3
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 09:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996282; cv=none;
        d=google.com; s=arc-20260327;
        b=rUuDtGEQVHyE/J7INJWN3vZuXHqUoEQLSLZSt0cel9Wo0li+ozCsBuzOofE7vPoyb/
         9eOw5DQzEM6aVNyygqbqtbSN33aabGK90oSCHB8GxshrkYS7MMAeC7k/lXbffdOn9Asf
         ODxpEceHtVX7FlN2/7Y9cNPee8dOTq6KSF1zflXNsPB8YkuOGYse5c/+U6BQ1tmCRceu
         v6nYaj5etV9rlHMeRbBxqWPTZTbjr8k/NGk1/RUSwIAsp2Z0J7r68ehEsAGE/bqrImMl
         jtNJlQ2u2wpDCTzWnRp90ydlFktjraG86ZUJhtYVOjNBE0NM5O42+Yny+QIh094xpJ4E
         xvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        fh=/Q6unFYQ/soHdHp8KONX8/2abOf+SH6WMRCijQcwCws=;
        b=MU1DQhTAbaEaGIkZcfuOm5h8VcRxJnjKxHOMfLj0ohIGul4QtSBGIZoP9zojQLclJp
         zpK4K/S1bLPkN/NSua5yjw6VzAK6jIQUw4VNUVgjbSIR4RTq4Y94Pgbhz9OQ8KK4Lorb
         EmKg5xHCwiWvkkg1n+5mx+5PaoAE75v2wQFtO+UexYJm3WmIkjDiePxHKBL1DjMhe4WG
         CyBzxUcMmOc5HrKiA9chVLSwhLL3QTHGlN+4v+V2Ik2zqO1TRIBkMndYJVa06Ia61ijW
         //2a1gtlpHljkWzooUzlcziBkMTKlBlDYuwG/XsYBREuootuwIKaApAppoAKAIkVDicF
         o2lw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996282; x=1792601082; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=PF8y9CkNlj0nVkf9Ewzn8WoO1QDJuoDijZ8jWUUb+rAFmtdoNVMK7lSXQB4rgl1w6T
         PGRT+2NHz+CjQVYTvyTVDHtWcaJq88S5VtpwBpbarX/MzrFwbQoxmjkkFpOIs8skDZk7
         /8+6RN8+mQeocs1aMTHG1iZXZu3Jsh5lkNYdOdzd1Hgwf3OeT9aMk1Y3AuQJTzO7Coy0
         7lF6rwT9mHxmKsdzQKamLAPGsy6Rhrg6L6yJaiEkxt+P+mobTlapQTou5TaQ9U5xqc+W
         oAwuJRiIuu/7brwgqrXSqPCmnmX+O9BCTUp6cnnhLTPzf+hj8OYahfdXKaGfsLyoDO5U
         zGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996282; x=1792601082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=X0fKmPl1d7sSZ/bQw5boa/RTbSkTPo0j6/HNoolwri5i/Ijs3ozpF7T8SbCry37ETT
         M8ts9w3llNpf5HMqmzNiFRWDu0KRtLG9yed5xF/YE3QTqLhdVqmtFidUW9R4lLjKd1nX
         K/G8Z+CAmxEEs/3SolNqN6qKdMY+5xSF6Le/4wEkZbW9lCE83iro8HXreEFKHotqJBMJ
         x/XMUeTjYGSeFncx1Zlo6rSXEB3To0cluiRCiD8uxrhynxSpphTy6awdGpfSEU3XDNzo
         hC24zvG+cbONtwHXGn6iR6DZQkQy9u2hfc1oW6Z9Jd6Pllnk3feqr4svL6p/nkytLsXf
         +vsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuHLzMl9wyO/DEVrUjW7TtwK0LgnssgWuc78Odg1dHa4sZvmMoVUU041GUYEXvpxyw7rIFN22f5yDC0g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIanryQUYZItLoydUrJSG0kpoJHUzIfvBn+UVKxyj2UoaGt+Mdo
	l8JLvzcx79aNnpP3QEJhFX+YrOlXdM3qABf5O73cp9Q7vE7wGLeaW0bl/ptQcn8bl2DS2Y36rHu
	jRP0YxotoUz5gYTFfA6IBhxGOCzfUvDSrtnU2vHIs
X-Gm-Gg: AYBFou25iLyv2lv6gsfyaygVXzdPc9+mb72R8eO+nC4QMEwbCbtedenXDzRhQqV9J82
	NMAtLbO7YCyBfuJ66F5x2zHwY4vEMnljz/kDoW2bme47M2RbTxwQAd6oaJU8Z01MqVHHX6gY0CI
	GulM6/OAZ2N+VPyeAQZFmF9QnLhwlaJTEfZGtSR48SsCWM44AaCEDwwua1mxaqES+UCx1K6iFmK
	vf/M50zeePO70SAsdqMmKD38KLUoBK6O0uMZif/gQy3esco5aIEzHwx8QINPEzEeI4sAWKMD/I/
	6jsxFMPvQPRPEHsBTHOWwi6kCGow/wPACqpfezJSp3mBQ2dqCpFeDM+vgJBiKi6il2YpC7MC4qE
	616celbZQ1q9P370ydiM5q7pGzWa6A4IAh/QhYl/jVzMDTY9SApv+2uIcCQbgCspG/jCwLF4WnZ
	kbF6Fk0JHKh6lYSRnZRLsu4/3SrXv3B1EyU+lIG9OFedxWQpSthBse
X-Received: by 2002:a05:600c:354a:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-4a18e3ef23cmr329192565e9.0.1791996281614; Wed, 14 Oct 2026
 09:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
 <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com> <202610140937.B68C8C9AAC@keescook>
In-Reply-To: <202610140937.B68C8C9AAC@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Oct 2026 09:44:29 -0700
X-Gm-Features: AclHuK9LUe2FvddsKjj0vYiArabpm2vrSaqioSsrjl7koqqOn_VyYRh6l-6milM
Message-ID: <CAKwvOdm6nO6skW4-AZtmzpGoNyO126L_AN3Mz2fu23+3QXcshg@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Kees Cook <kees@kernel.org>, Ian Rogers <irogers@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
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
> On Wed, Oct 14, 2026 at 01:28:55PM +0200, Miguel Ojeda wrote:
> > On Wed, Oct 14, 2026 at 12:40=E2=80=AFAM Ian Rogers <irogers@google.com=
> wrote:
> > >
> > > +/*
> > > + * Optional: not supported by gcc
> > > + *
> > > + * clang: https://clang.llvm.org/docs/AttributeReference.html#requir=
e-explicit-initialization
> > > + */
> > > +#if __has_attribute(__require_explicit_initialization__)
> > > +# define __require_explicit_initialization __attribute__((__require_=
explicit_initialization__))
> > > +#else
> > > +# define __require_explicit_initialization
> > > +#endif
> >
> > The LPC slides mention Clang 14+, but from a quick test in Compiler
> > Explorer and a `git log --grep` on the LLVM repository to confirm, it
> > seems the attribute was introduced in Clang 20+, no?
> >
> > If that is correct, then it is not available in all LLVM versions we
> > support (LLVM 17+), so we should add:
> >
> >      * Optional: only supported since clang >=3D 20.0
> >
> > With that:
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Yup, I can confirm, I only see it with 20+ too.

Fix up the comment and have a coin, witcher.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> --
> Kees Cook



--=20
Thanks,
~Nick Desaulniers
