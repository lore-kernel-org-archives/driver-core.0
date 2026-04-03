Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430E63A758E
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213159; cv=none; b=i5mvmFCrIkRmJb3hr1qkOmCl0zqeT9z/gD+7/FOUihfZyaJqqu5b73kmrp7Eia5qjoMe3JkQQcb08LbS9jzrpbx0cCtbmNTWrrWYlMLrTjq0YYQtQC6WDLX8uFiamRhSa0b8Y28obVRm7j2LzcKDjjuosqgYr+khBaUzYcj3x20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213159; c=relaxed/simple;
	bh=0o84pYdxTQQzYs6glMpMj/UUvehhD/P8bC+lS8pjvkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDfZPGjOxtff00bdOKeGyiJit53GWN373DIReyrOLz1P3hwEkBv66KTUXZbmOcjq2vwE6Vtvkx6SyzouusNNNxGlgp35ON8A2Zhr1ngRYaJwqadAbzwgTU8uOrQ8JwENp7jvbQ/86XdYlhS7Cg/dXj5RkUvTrGP/+0AFVq3tvrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sB5fdZ5U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sB5fdZ5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0807AC2BCB4
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775213159;
	bh=0o84pYdxTQQzYs6glMpMj/UUvehhD/P8bC+lS8pjvkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sB5fdZ5UOXQsxINOLqYVn+n3VedunYbYINFaHTsuN3Y7h5NWf/mikecFBDZgmRGh3
	 oOXnxvO5dJ8yhP361yfuKxb8Z9bZ+7E9NEBA1I61wHP0lE1bYOMwKwX/aHFWKz+LM/
	 MejbhEkzjuQHipqSIkXPgBk8QYiKpydyOgy1T/KWUpccr1au3uyrLNOzPTK1W8LSqx
	 pCaa+B49o1fuyuOzu+dFtsLd4DtOJyW6uiMhmLI8YeifzUYj4QdU8ybQMH9/593C9U
	 c0WG7obr7jK8TIWIJ5lcSONAxp5BnOWCsd/UdLlY4EwCQJtY6jIVak9PHLppSAtmdd
	 m5BjydjoBBxwg==
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-46fc5b8a04dso86546b6e.3
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 03:45:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7+ciKHMBxh755tDZQWfoZpLDON6PbLucR9d1eZNvwIqI53zmgKu1I+F/ATCP9bmHhBDnUBvrR+BlGjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgHO1W6BcAr+T3yQ4LPc4N3Z4jcSpTcHrgr0sczA23sih495KR
	ztb+/ijhTTdj36sJSKVC4hnkDBqpnnRsw5IJEALOH8xeEhEFCLKDyAHy+wMa9mxUuacuNkmp38b
	vERIhM667OA+qcQd5U8BNlaR6vpPRYPE=
X-Received: by 2002:a05:6871:7bc7:b0:404:42e:92f with SMTP id
 586e51a60fabf-4230fe43eacmr1298230fac.5.1775213158066; Fri, 03 Apr 2026
 03:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0fe1b679-ab28-4505-b0db-14e7ac3ba749@gmail.com>
 <CAJZ5v0iMfiqjkkvOMU6jWEZ+nBvcRtWNwjvBW0pEva1G_owFcg@mail.gmail.com>
 <744440a6-e1cb-4792-a848-57755de0686b@gmail.com> <CAJZ5v0i5dSuQ7f8Okb-Ch5igzNn=L_Fj5d3H4pftvxoEVBaDUw@mail.gmail.com>
 <0758441c-e88d-475a-80ef-061b227ae7fc@gmail.com>
In-Reply-To: <0758441c-e88d-475a-80ef-061b227ae7fc@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 3 Apr 2026 12:45:45 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jTTdJDPDk3ACVpjP=S5nrA-vddfKBnFRyWSbHCuWWKQQ@mail.gmail.com>
X-Gm-Features: AQROBzDMajT-PTryobqCCYVLkZW11PnyntEq6PmPGmp9K46vmX4cNThO38lcrbw
Message-ID: <CAJZ5v0jTTdJDPDk3ACVpjP=S5nrA-vddfKBnFRyWSbHCuWWKQQ@mail.gmail.com>
Subject: Re: [PATCH] PM / wakeup: Allocate class wakeup_class statically
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Linux PM <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 3:05=E2=80=AFPM Heiner Kallweit <hkallweit1@gmail.co=
m> wrote:
>
> On 01.04.2026 19:32, Rafael J. Wysocki wrote:
> > On Wed, Apr 1, 2026 at 5:45=E2=80=AFPM Heiner Kallweit <hkallweit1@gmai=
l.com> wrote:
> >>
> >> On 01.04.2026 16:19, Rafael J. Wysocki wrote:
> >>> On Sun, Mar 29, 2026 at 6:14=E2=80=AFPM Heiner Kallweit <hkallweit1@g=
mail.com> wrote:
> >>>>
> >>>> Allocating wakeup_class statically avoids a little runtime overhead.
> >>>> Define groups and device release function as part of the class, so t=
hat
> >>>> we don't have to repeat this for each class device.
> >>>> Whilst at it, constify wakeup_source_attrs[].
> >>>>
> >>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >>>
> >>> Can you please have a look at this and let me know what you think:
> >>>
> >>> https://sashiko.dev/#/patchset/0fe1b679-ab28-4505-b0db-14e7ac3ba749%4=
0gmail.com
> >>>
> >> Interesting finding! I think the diagnosis is right.
> >>
> >> But: I would say the current behavior isn't a nice solution as well:
> >
> > It is not fantastic, but it doesn't have this issue.
> >
> >> wakeup_source_device_create() does: dev->class =3D wakeup_class;
> >> I think no reader will expect that wakeup_class may be NULL here due t=
o
> >> initcall ordering. In addition this behavior results in such early
> >> wakeup sources not being shown in sysfs.
> >
> > They are registered too early to show up in sysfs, but they can work re=
gardless.
> >
> > I think that it's just pointless to call device_register() for a given
> > wakeup source if wakeup_class has not been registered yet.
> >
> >> But I'm not sure whether registering class "wakeup" (and registering
> >> classes in general) would be possible early enough (core_initcall,
> >> or even pure_initcall).
> >
> > driver_init() is called before do_initcalls() is do_basic_setup(), so
> > class registration should work for all initcall levels AFAICS.
> >
> When testing the current code on my system, autosleep is the first wakeup
> source, registered in a core_initcall, and it's not shown in sysfs.
> Same result when class wakeup is registered in a core_initcall
> (instead of postcore_initcall). Registering class wakeup in a pure_initca=
ll
> works and fixes the issue. So, would this be an acceptable solution for t=
he
> discussed issue?

I don't see why not.
