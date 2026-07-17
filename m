Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D833D401A3F
	for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286382; cv=pass; b=MffOJsbw5wWhj9j/blCxSPdnZ6fEyL4opOFZxtldvwO5mwGeBquS0cY44ns6lhz7MsjwAKcD0swarWHWFUxYDzmf5IQd5pzXQ7e5AwppEaAcuZj7Iee0HnAvIvBzc9PB6ABV9CwcqJciAtB/IBSrVKMlRbdfd6D4zigjPvHzS9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286382; c=relaxed/simple;
	bh=MMxGBEHRYv0PhbSXHbgLbSrYRf7Oa/o80V8Vx20kOWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssVHDdcwjCrFqwJjfOu3gN7jBMlKifYCY5MDPACcq8/KHqnBq9Q3T2s0qwzMemVIOMAbZ8Gm1hIZfEu4qGKpiHIEDD5mGxceQmhQ4Eb74KrB1EZHx6cj6vN/xQ0QYQl67yFobmP8lebYPHthRLymZfanHyV1qGQf85fSzRz2+48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kqdW6l0w; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kqdW6l0w"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66825848551so1596299d50.0
        for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 04:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784286367; cv=none;
        d=google.com; s=arc-20260327;
        b=AlLKnFSAWe8EZF30LitFvLhGYe3366ApzRywWivhK+00jqzdpXlVXsIAxD8J982GvW
         xGCs+EzXk0uvKKKzzHYSkNKeT+W5cK0YZRrpjszGc2VG/qTdXdHiwk91LvhApktVWVoJ
         eaKrtSn4WItBqO14felQHuytZvJanKORIbN+NmRw8p+PWGQRw08zIFwLRpP9aFBCjn4Q
         LA5vQll34dwyBCyGG/VASMry9RDQWqBgbIFqBeiG2ADzx+ATKm8vl0b39f2M6zHd7aCW
         00Ld4+reRNNKVQI/xGT/yCT0dMhS2umq27JeyTmhwDyA9HqaaMc8kQB9tlJoLz4P3NMU
         tzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=duGi7mDgkkuOmUQuDzMNdNsQ9Y99A4lhMKChdyaHr20=;
        fh=uCpCmFvg4OxBKaDnpXiGOTN6HquzZNqUFWII5NKqKL4=;
        b=YV0Frk1YPErMbvxVJH6P55q6LNuZ85LH/0aBFJz8MAxprEyYiArWVeMZPdYR4jSLrV
         7KLROm5dVjSyrpCAemXXjCjHzcMuUS3D2GwzR63yozzAgLL+IhlJKi592PkWQwcpMZNm
         DCZGNxyVKuY0WbkZQJTREBdrqUezpeyf6AwsEuWKqZcfbcbUdKQs3NrkPyhI4a6c/fXL
         0OsTiitb1p3Fx4x0D+kLpwNpiOofD6bwy0O7lcGi3j/GquxofnX/yBRKSupsN0847RgI
         Xytl8j7Ox7KEy9rN0pgR5hvV/1qDZH2NKmQFUm+358GT0GqsLcBEXkJlLWqT2+zrzWTc
         sVgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784286367; x=1784891167; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=duGi7mDgkkuOmUQuDzMNdNsQ9Y99A4lhMKChdyaHr20=;
        b=kqdW6l0wcIMJppUlv7UnL+LGOQT4PvcWSy0KUIekR1EzSVNcoDc4w4jLAsR1/zpWAl
         7qQ03Kdh+FTTvQabw1qLJq9FQ2w7Ay+PI/VMvT2w1cRbiwtA6t9BCv8vJX9mxa0FMURQ
         Y90ROtku/Tg1R2tVEPLQH/JxG4thiUUBvyz3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784286367; x=1784891167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duGi7mDgkkuOmUQuDzMNdNsQ9Y99A4lhMKChdyaHr20=;
        b=NZz48RZfLYmZ0pR/v4PiYYA9UY7HfqnEiv9ZQu3FRvGJdYnwXtdHARMdHuFaruObPk
         DrLKLWvj31ok348oYU0BEVuJi02as2odNRXEolTiQZLWliqOWuVSaShWk3NtT/oBepLy
         fgYP4kHomGsPxiGRZ7CimMzBJX7fvZpr6e54INi0Eb+4bIv8nG5vO1Z5RsZB5UgBskRA
         kc8Gv8nPfzXTHurkXOjgkXYjPRF5xWtdFiHekEhuPmoe+pTC/RpIdmezo0cY2x+muVfb
         t3hbQC5ViA9HHkPnXTDiXpzWN8OvmVwOkKAP3ajvRsB669a2R7IdUOuztdrNsq9bXK6g
         l0bg==
X-Forwarded-Encrypted: i=1; AHgh+RqMtFxw/XOUpsROQl/2sFD1qYY1PrSCDgjdcMTX23qpy7q+ScxnQVSQaq1Iiy/E2Z2vjwqdsOv4xNYGJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YycS8Y9c7APcTUOL+blxHyFWUF2Av3+j4peDbK2XLc+0g5SPRvJ
	+QFCpZuG2SvKX+sEmnqb+dkF7LZzH54E8fwBUxqpNUcGnKMBvhnuabNzMdXeChm7uZDQDx5PF05
	T6xY4mwZDL5cllYOH3WuA/UpNIG/h93jzc/rGzKWB
X-Gm-Gg: AfdE7ckPlJLZ+25zu5ZhhbtasNmiolrQJVT1JWuDqPXvZ3GHQQInuhq7cbniXC+M51W
	rL4DhFOq18YCRsTqjd5iIQdhYPG7Bu44yKaG18jxyxI2vN06GknaYwYxDqhhKOpA4ba5Q6Nmckq
	6hxYupJGlrWVVfShDU6xuJIwv5tRy/cFvzl94h4/I5qGre7GtD2VC9loJhmLos45KpPffnq0f1A
	tppENLCs4dJcld/43APcVjcwhJw5+dHRhzjCYmPYHrrVWzs9rLfHGhv9C/hjHaAEbeAU3Qi2Gij
	tkFBOg/8Yq0/
X-Received: by 2002:a05:690e:454e:20b0:667:a285:7624 with SMTP id
 956f58d0204a3-6683bb6a945mr405792d50.35.1784286367356; Fri, 17 Jul 2026
 04:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-3-wenst@chromium.org>
 <20260715090944.2B4441F000E9@smtp.kernel.org> <CAGXv+5Ffsrc9r6d_RrgL1mBW1Zmt1RxCrMCjaD7vuF3+EaeAqw@mail.gmail.com>
 <allHTc-bJrPwDA0b@ashevche-desk.local>
In-Reply-To: <allHTc-bJrPwDA0b@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jul 2026 19:05:56 +0800
X-Gm-Features: AUfX_myBJ4V-SWOZ-GDiqFvmqO85fuN9BhTsU3Z0DMM9loQQI8vJniOKvrsXuws
Message-ID: <CAGXv+5HS3neb=8EW0FT2-tP-dhPFqQ+q8YRS8Gy_XBic4z4Mug@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 5:04=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jul 16, 2026 at 04:52:27PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Jul 15, 2026 at 5:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> ...
>
> > > > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const st=
ruct fwnode_handle *port,
> > > > +                                                       struct fwno=
de_handle *prev)
> > > > +{
> > > > +     do {
> > > > +             prev =3D fwnode_get_next_child_node(port, prev);
> > >
> > > [Severity: High]
> > > This is a pre-existing issue, but iterating over endpoints using
> > > fwnode_get_next_child_node() can cause an infinite loop and a use-aft=
er-free
> > > if a device has secondary fwnodes attached.
> > >
> > > If a device port has both primary children and a secondary fwnode, th=
e primary
> > > ops finish and drop the reference to the last primary child, returnin=
g NULL.
> > > Then, fwnode_get_next_child_node() incorrectly passes this same dropp=
ed child
> > > pointer to the secondary ops:
> > >
> > > drivers/base/property.c:fwnode_get_next_child_node() {
> > >         /* Try to find a child in primary fwnode */
> > >         next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, chil=
d);
> > >         if (next)
> > >                 return next;
> > >
> > >         /* When no more children in primary, continue with secondary =
*/
> > >         return fwnode_call_ptr_op(fwnode->secondary, get_next_child_n=
ode, child);
> > > }
> > >
> > > This can result in a double-put. Furthermore, when traversing seconda=
ry
> > > children, the primary ops don't recognize the software node, treat it=
 as NULL,
> > > and return the first primary child again, creating an infinite loop.
>
> Yeah, it has to be implemented in a way how fwnode_graph_get_next_endpoin=
t() is done.

If your patch series addresses the issue, I guess we can consider it
covered? Sashiko labeled this a pre-existing.

> > > [Severity: Medium]
> > > Does this fail to unconditionally put the prev reference if the provi=
ded port
> > > is invalid?
> > >
> > > If a caller passes a valid prev node but port is NULL or an error poi=
nter,
> > > fwnode_get_next_child_node() returns early without dropping prev:
> > >
> > > drivers/base/property.c:fwnode_get_next_child_node() {
> > >         struct fwnode_handle *next;
> > >
> > >         if (IS_ERR_OR_NULL(fwnode))
> > >                 return NULL;
> > >     ...
> > > }
> > >
> > > Could this lead to a reference count leak, violating the documented A=
PI
> > > contract that prev is unconditionally put?
> >
> > This seems like what the other fwnode_get_next_*() functions are doing.
> > I'd say this is a pre-existing issue as well.
>
> See this series (not yet applied, you even have chance to review it!):
> 20260611203537.1786399-1-andriy.shevchenko@linux.intel.com

I believe that series addresses the first issue, not this one, even
though it partially mitigates it.

The contract says "puts a reference to @prev unconditionally." What it
doesn't say is that it requires @node to be valid, i.e. the function
is a no-op if node =3D=3D NULL.

"node !=3D NULL" being an implicit requirement seems to be the norm for
the fwnode_* and of_* APIs. It's not explicitly spelled out and Sashiko
lacks the context for it.

I'm not sure this should be changed within this patch. It would end up
as a mismatch between the various functions and possibly lead to more
confusion.

> > > > +             if (fwnode_name_eq(prev, "endpoint"))
> > >
> > > [Severity: High]
> > > Does hardcoding this string match break the fwnode graph abstraction =
for
> > > non-DeviceTree platforms?
> > >
> > > By strictly matching the "endpoint" prefix, this bypasses the provide=
r-specific
> > > fwnode_operations, which could silently ignore valid ACPI and softwar=
e node
> > > endpoints that don't follow this exact naming scheme. Shouldn't this =
rely on
> > > the backend-specific graph_get_next_endpoint operations instead?
> >
> > From drivers/acpi/property.c it seems that ACPI graphs follow the same
> > structure. I don't have visibility into ACPI implementations though.
>
> Sashiko might be right. ACPI has device and data nodes, for device nodes =
the
> name will be FourCC, so never longer than 4 characters. For data nodes, i=
t
> takes their names, which are arbitrary strings and seems should follow th=
e given
> schema. You need Sakari Ailus to review this patch.

OK. Will add Sakari in the next version.


ChenYu



> > We also have the following in include/linux/fwnode.h:
> >
> > #define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
> > #define SWNODE_GRAPH_ENDPOINT_NAME_FMT          "endpoint@%u"
> >
> > So this should not be a problem.
> >
> > > > +                     break;
> > > > +     } while (prev);
> > > > +
> > > > +     return prev;
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
