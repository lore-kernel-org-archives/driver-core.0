Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26D32B981
	for <driver-core@lists.linux.dev>; Wed,  8 Apr 2026 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775675243; cv=pass; b=U9Uoqvl8wNtrpz2Yim1n6Zd16BRQbZQxAfgurgZn/LA9fBzHC4r+8VfkchvzreaIQDnDlQeu+eAeMuuLwhfYrPBr4ZG1FVptnbCQW4kSt2a8rlCcA5ypReYRhAKAGGqPRB7o5R+TV54MOdntNck6T97NMloa1wTDSW2opFOUU4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775675243; c=relaxed/simple;
	bh=B3GzhcznlTgp3S6SnojCWf3qgJxcSS+uWQsFtA09RSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z038LBF2icnTF6DW0cJ1khXPlTMAExXbYhSvCVxap9XorLgAc7hmhNTYH16EFF0HJZmYILBWDgbVRJN7RRwouN1orSNxmdEgX+cQTl/sRV/QfiFqoMjqnXADMhd8feUPsoow6Wu08b49Fwk7esa2ruc0YdTrQwTUpNZ9BuW04SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8NGTLzH; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8NGTLzH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9b1df1a6b3so5002766b.0
        for <driver-core@lists.linux.dev>; Wed, 08 Apr 2026 12:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775675240; cv=none;
        d=google.com; s=arc-20240605;
        b=jYiUm4xeNNJUScx2k6GL/bscT2s6euDjYWQ5RHwVNQ3xqQ+4jVgzCgerxBvI4U/rUm
         06xi/EPmJS3mgPUKAJN4FOnGF3qUjf0MgcF+1YPFC9S5sEaDs78BlGhuyxA0Z5867GA+
         IRjcFL5L5i4Oo0IYcuX1GfFaz8cQdftLXOum7xQFpsl5Sm7Dg50EYCWfVtzCHwjW2PLn
         9o/ynCKrQzfEjsdh+/5RtiOq+h33oF4vyTDF4CpOrzhYwSkc/cgEkK+8FePl2KeBtplR
         Hg44lGT5g27geQFLjWD/MUFeYQklJ+LpxYziLDoiML7FA8gTI8lLgdEbuvsDdOz5Dc3R
         Cb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5MgGWh9XKK+ZjwM7NdPVqoY4t2PvZ9URXYNukPgpet0=;
        fh=jd2vdGD3Qy6LSS+5VMfheLbdQUV6MkCKyJkS2hVAnlw=;
        b=k1uJ2RXNlntlP1vr4irSevr54doF2zfhmQIjWUhzsb8L1FTZss3Tctm4oUVrhyAbTJ
         UefNlffjJ/k6UKA246jAIH+aCDZGi/qihiXkit4ttjwyBLHbaOAtdOp+VgPfuXy5Y5LE
         nf6EjXptsPr8P7zz2O2ctHaLi1p3b2STXm7NO0YTPWJ5qRrOqIbg6IMbV40nZAcbh57C
         UqNJiowx4OESnIuFSYVy2/HXdAg4FLFjmmGmjYOYvN5P0elDr2ksvH8oWvXuPHZDby1M
         vCqZlVZd0jf1GlOhgfoCzA8JWygdxlAsYLBvx9h1fYsaST6Ew6rRaN4bJd6sT+wXq8gt
         4Ofg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775675240; x=1776280040; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MgGWh9XKK+ZjwM7NdPVqoY4t2PvZ9URXYNukPgpet0=;
        b=Z8NGTLzHnkDqyFqI0whKu+Kag6ti7cqAqOnPK8gpVnZi6p4kvENOlLKjcSsKySYMmN
         SKBUqGB8j4MjaCvZYbLHjiIJipYA9f4LFWD+iXgL4PgZwsihCCNwAnfGSjRofNn9XBB9
         1jHFu2msFbM99ejYp5SX3AsUo9euimxgmOOv31uUNcqpx+iefoT5hofK/Zy7O4isrLsr
         9ld6Zyf2L/3VwPU9F2SKozMBLLiz+j7259zwM/j142/c/EIy4l2ZC+vBs0ITcWvbVT5d
         RPXrJV9YVLPKbB9BkJX5VMz1uVVtpXBw5FIWjDcSP7itFdgXuKalp/DtImb/SgUWxXVT
         nJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775675240; x=1776280040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5MgGWh9XKK+ZjwM7NdPVqoY4t2PvZ9URXYNukPgpet0=;
        b=QPamZruVKyu5SwWUf6l5xdMswzyoJUp3Dn5LLmdg1Rrjq9scpbkLhJ7lHWVtqvjmra
         ZFHK9uflHNt2EbZdernCgtyoonxD5TXZn2Yu72M5h8VMeTrS6IuftfL7GF3+DFHyzQsV
         U4TNTw6Clx04Ss5FAgK8yuZhtOLiKtT1a3z6Sc+lm8TL6tPO9nXYlvvYPQpNmc6NOAJ7
         8GgoSfr+xf+laXvD4xOKHh2Ri1jeWXw+HrA8zyQbKf/gfqM9oPqyub6WdBd+UBMqaRr4
         lp0qaiZB1i0a67TQoM0T1dRpFVhGp5XmXBHbiDGlnmLFQfkMJyWml1h44gSCP1RrPrqW
         2IcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXk0EJQQSyCNuxkjeiSZ3fC8Fuexet+6Z3DFHuJ7YkxGM4+w7Lkf6ahxyF/0Y0cYwBHWaR9gSl+zA2sA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg26g5EQGQz9/VxrIATcjWDSC1s9hbShF7Ip84xiku3a7NSNPT
	tdl82HsPgdsiQ6Gx0nnSyXhQQmtuCqHUy4VmcTRruMOHN4Hh7UdNPdpLAz3b2JxBozurXKkV+xm
	CPp7jxefFJktl3t4zbgteyDIGq0yZtXM=
X-Gm-Gg: AeBDieuHodcSIuWNnmEPNhT4P5OP31yXPrfSBKuUO4ApW+zvUfnPy+FsOoLhQRJh9rE
	wRbFtDOKwbEqRZUCYpPlGHikAXrM8GnsAO3r8sL448lX/NGK5zLeej+iAbzSwW+oWBTfa8NvmIQ
	lYvw2kHTSI5NIK2bNwM3DUVXjP1VxNgeVhuNPm/Piil57HTGEAaIQitOhzWKNYLSuvToNlDllED
	srOIl4us6frARo6YkYK0vikLnuF1X2Elm2yfPkiUHmncALjZLrifgYfKrUlo3BYc1wiMX3awk6K
	bhMXNG6vJZ1PMUfGLtFNT6bXTzMaLEuTXffYb270Ron6+gjW5/lTtkjPdRbpCx8SKqytMhGYtYo
	bmNzy23g=
X-Received: by 2002:a17:906:fe04:b0:b9c:7ba2:4168 with SMTP id
 a640c23a62f3a-b9c7ba2434dmr1035145666b.22.1775675240023; Wed, 08 Apr 2026
 12:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
 <20260407-swnode-unreg-retcode-v4-1-1b2f0725eb9c@oss.qualcomm.com>
 <CAMRc=MdWSigDmTGSCe-ggAC+rKcCLimKgKU_kAGh5N66jyXGtg@mail.gmail.com>
 <DHNVOVO67YMW.1Q763BB153CGF@kernel.org> <CAMRc=MchUSdWo=BXrYN-qS3YFer2R3J02HyJxKJje-a1QvWdfg@mail.gmail.com>
 <DHO01A7B9M0Y.1QVVS8600WRJ5@kernel.org>
In-Reply-To: <DHO01A7B9M0Y.1QVVS8600WRJ5@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Apr 2026 22:06:43 +0300
X-Gm-Features: AQROBzDJGzBec5JWWeiqiBKbeAoL0ZpHkqC5pUPiuXH6__r4G5qXrWhTK62d4tI
Message-ID: <CAHp75Ve67JDc=79Ynp29wHPFA0s7Tv_cDcyrB=0U8Q+ydAifmw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 9:53=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
> On Wed Apr 8, 2026 at 5:52 PM CEST, Bartosz Golaszewski wrote:
> > On Wed, 8 Apr 2026 17:28:46 +0200, Danilo Krummrich <dakr@kernel.org> s=
aid:
> >> On Wed Apr 8, 2026 at 9:19 AM CEST, Bartosz Golaszewski wrote:
> >>> On Tue, Apr 7, 2026 at 3:28=E2=80=AFPM Bartosz Golaszewski
> >>> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >>>>
> >>>> It's possible that at the time of resolving a reference to a remote
> >>>> software node, the node we know exists is not yet registered as a fu=
ll
> >>>> firmware node. We currently return -ENOENT in this case but the same
> >>>> error code is also returned in some other cases, like the reference
> >>>> property with given name not existing in the property list of the lo=
cal
> >>>> software node.
> >>>>
> >>>> It makes sense to let users know that we're dealing with an unregist=
ered
> >>>> software node so that they can defer probe - the situation is somewh=
at
> >>>> similar to there existing a firmware node to which no device is boun=
d
> >>>> yet - which is valid grounds for probe deferral. To that end: use
> >>>> -ENOTCONN to indicate the software node is "not connected".

> >>> With Andy's Ack, do you think you could still queue this for v7.1?
> >>
> >> Yeah, that should work, but I have a question about the patch.
> >>
> >> The comment added to fwnode_property_get_reference_args() says:
> >>
> >>      + *            %-ENOTCONN when the remote firmware node is a soft=
ware node that
> >>      + *                       has not been registered as a firmware n=
ode yet
> >>
> >> This seems like a bit of a layering violation to me, as it makes it ex=
plicit
> >> that this error code indicates a software node, while
> >> fwnode_property_get_reference_args() itself should be agnostic.
> >>
> >> The caller can easily derive more specific semantics with an is_softwa=
re_node()
> >> check as you already do in the GPIO code.
> >>
> >> Can we describe the same condition, but without explicitly naming the =
backend?

> > Yes, sure. It can be something like:
> >
> >       %-ENOTCONN when the remote firmware node exists but has not been
> >                  registered yet.

FWIW, good to me.

> > Does this sound good and doo you want me to resend or can you change it
> > when applying?
>
> I can change it when applying.
>
> One additional question though. I think it should be fine, but are we sur=
e the
> change can't regress other subsystems? It seems some of them (e.g. sfp-bu=
s,
> v4l2, iio) special case -ENOENT.

v4l2 uses the ENOTCONN in the cases similar to this

https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/media/v4l2-core/v4=
l2-async.c#L744

There are two more, but they seem more about connectors.

--=20
With Best Regards,
Andy Shevchenko
