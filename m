Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01A63B14A7
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191963; cv=pass; b=etxJze9vtiTlZMxBMqaMyslHl3MM4mzpusz2nYvY+HJ7/e9CNElhhIcEdyU0xuNOS0DZReCIL/v/ZP2Oo5lGYHEmjkNqOllghyBDooZ/H/5RQVO10uMb3Gqa8pNoOGWk8rQ5ESmpx0vCczambNhqxqzqwQpfXC4kqPjYLCYAwy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191963; c=relaxed/simple;
	bh=bY5f5NUrAmXPEdBrsvfj96nHb5zMKiNKEpHnjthNsRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKxFccJp1ge6Xs4XEloHXhdCnHeWPNSgHMFsoyMT6mLDc2ux39sv/2/LfqFtv4zH7QGqnrZ3wbJh0sAtalNXDrbrOsqoJfQGTcKUaFEd7+DS2hgPm+aBoRsIZ+HUBU+pKogkDaMzO+P1vIQEQLwgNtjiJ7UEF2LiLiOwcClIOT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BZqXvw1J; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BZqXvw1J"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-667bae10ba3so3016671d50.2
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 01:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784191959; cv=none;
        d=google.com; s=arc-20260327;
        b=JS7ICUBJ5aJEKB7EB33qAzXk50UOuJjq1iaKbAyEajue5sXaQB4RskV9+7nSZCfJX/
         pq1GJ+n3X9epXd7KRIT1c74Z2vu3UD3ItxGTmcFlknC3lsrLtPFD0/e4UD93OpaEvKE9
         kHwyUu3boK3pFzn0VhRfhgZ//Hbh+sQaFLYSRIsRv5xE4SRvwpEg8KyV/TT0KG/atcCR
         yldUL59nfRTBCDnhPc6PivgO/6DxhfijbKBIFN87dsfCunpB3t6Fd6lFa2a0Kj3ADqwZ
         NNsou0Y9qbDd6+78vJjkScoY8hY68ndLh262CvIhV9Lj0oZhsf76zJJwFlpe0G7wO2FJ
         Dmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IQq0m8gF/uxTNnEpTPTV3bbQ5uoOyMBO8OOWoNri3OY=;
        fh=KEPqUlWxVR3Dzcg7umu+U0969QIdNG/f3GLoPQMj7fs=;
        b=UJadS8vJsmn9NAL/wMGFOluMRb3fR1yYB0oqrsd2tcGwt2sE3WRUAvQ57MQgu7nVEK
         ig1jvlSV3BDxyUbRBGxmQL2sJOBzdx54uYgCL7Gypql6NSbxKlk9BPI8UM2FwQEe3vn2
         WatOk7jYyx94OlUnmVnAfWCw5fatbth5TOV8XYScbq3DY++GZubIDqUlptly/1XsJeOW
         nUGj4eRnQ3UgPpDx5d+LBHvNHeOBBjLpryMamH+30i6HIo/QvbMwi0PCgXApMPFxAq0e
         6qFoUvynpH1z0di4/pai9IEcuKlii8/0ve9ICzdHe76KFdSodqWcpJHTke1Yo3FrMj0C
         cD/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784191959; x=1784796759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IQq0m8gF/uxTNnEpTPTV3bbQ5uoOyMBO8OOWoNri3OY=;
        b=BZqXvw1Jn2gE0pu7EhpiPC0RjNydXGwOqqp7MjEMV2b0bTN402YHaKqxvcTX9UJFFu
         xT/O+fSPKXzYVkeqAJ2fv+OE0jbwOS3pQ+0uvxtCO7L8LIUgPXLK9IEri0GdKm1ImJMw
         XicxkcazlW4Oj4D5jxHy9Qh647N39g/jj/INY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784191959; x=1784796759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQq0m8gF/uxTNnEpTPTV3bbQ5uoOyMBO8OOWoNri3OY=;
        b=Fbp3cg8FRLdq/thomaaLHzkY9aaZWrQA9jADGfF3iY+E61L5FmBg1LmIeyUL8hpihy
         azgjnEwBluT0JXOMSenOSmZGZ4aMXS/oucBR3idLTyVAHENl+ehgGNTkNSnwbz0cjzZL
         U8IepJHVmWWVjudL1qQzNLb23MnJbhHplm3wEbrmIk5SqTK7DRmZRcqR5qMJ6odkTjj0
         0419B4SeKp4ijB5SziYaUC635tSg81jrKIsptUG6YOvTs1eXTC0ori+PKSqocDJwQFnJ
         Wr2VpsnZT/8YH3grOgQzTjWsQ6dFBD6dZN56fEiQG30U4Ne2gsD3NL4GO+CT2lzKBv0x
         i57A==
X-Forwarded-Encrypted: i=1; AHgh+Rq1CIh2PFwdGDjoK5gVvaMG3yuopQye/rXUS6OFYlMk8rtaNEDX5ENCmxX+sfsfaZ1KYOkTmWAFk9zJwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLVe4XzYx0Gpjg03rAeX8Tod9cCStSqZwg+JYSIc+corvS8W1x
	nhDznQb3nE9ppT6wsuY9eY2zhKaFp0kNPU594XRL33npcthqW3LvzYzV/IRvKD8XEwZFjP7JDHH
	zXjh4FICXx9NVKiwgHqrhbjNowH96ZL2NAJrOqgDC
X-Gm-Gg: AfdE7cmzgEIfUQ3Ht2z9iLINHp5b1BKU/Me8M9lUiNvg9eW28Ly/4Ka1XPMHT31P5Bk
	KBsB8l1VXwmLogvunUsbOtPM38Lev3Ei4oLmHQVX+gptbcz8FxvOX4j2rzGCBK6BVrQKMfgWwCS
	huSiq6rNIFxESou5xhWUNqm/plxEdSWZjiGv5GwPrJ8gKn3GGDh7K2hXoZJyZVBUlb3ARxWveHx
	OPsFjGes3XXFJ6BAZ5ryHcrb86cmmjjHAei9ZvWGTERIq123DyxFW6pam3IUxHFJxywjfxwspOU
	7Z7mIEcdrUcNkNT3
X-Received: by 2002:a05:690e:154f:10b0:664:c436:e523 with SMTP id
 956f58d0204a3-667d7babd34mr11429992d50.57.1784191959478; Thu, 16 Jul 2026
 01:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-3-wenst@chromium.org>
 <20260715090944.2B4441F000E9@smtp.kernel.org>
In-Reply-To: <20260715090944.2B4441F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 16:52:27 +0800
X-Gm-Features: AUfX_myLEQVBTlPy6_HTTPqxRUbMK0BTjrNXj-lz-dRMS2F8a-I6Tld4DGNkvxg
Message-ID: <CAGXv+5Ffsrc9r6d_RrgL1mBW1Zmt1RxCrMCjaD7vuF3+EaeAqw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, driver-core@lists.linux.dev, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The new `fwnode_graph_get_next_port_endpoint()` helper breaks th=
e `fwnode` graph abstraction by hardcoding OF-specific naming conventions, =
which will silently ignore valid ACPI and software node endpoints.
> - [Medium] `fwnode_graph_get_next_port_endpoint()` fails to unconditional=
ly put the `prev` fwnode reference if an invalid `port` is provided, violat=
ing its documented API contract.
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but iterating over=
 endpoints using `fwnode_get_next_child_node()` causes an infinite loop and=
 Use-After-Free when a device has secondary fwnodes attached.
> --
>
> --- Patch [2]: [PATCH v5 02/16] device property: Add fwnode_graph_get_nex=
t_port_endpoint() ---
> commit 8a16a51eeb8e99439d5b85ce61789ff1153e9060
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> device property: Add fwnode_graph_get_next_port_endpoint()
>
> Adds a helper function to iterate through the endpoint firmware nodes
> under a given port. This is intended to be used in USB power sequencing
> integration to verify graph connections and supported connector types.
>
> > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > index 0bd45f8b01c14..62c6221d65d05 100644
> > --- a/drivers/base/property.c
> > +++ b/drivers/base/property.c
>
> [ ... ]
>
> > @@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_ha=
ndle *fwnode, const char *name)
> >  }
> >  EXPORT_SYMBOL(fwnode_irq_get_byname);
> >
> > +/**
> > + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware no=
de in port
> > + * @port: Pointer to the target port firmware node
> > + * @prev: Previous endpoint node or %NULL to get the first
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer. Note that this function also puts a reference to @p=
rev
> > + * unconditionally.
> > + *
> > + * Return: an endpoint firmware node pointer or %NULL if no more endpo=
ints
> > + * are available.
> > + */
> > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct=
 fwnode_handle *port,
> > +                                                       struct fwnode_h=
andle *prev)
> > +{
> > +     do {
> > +             prev =3D fwnode_get_next_child_node(port, prev);
>
> [Severity: High]
> This is a pre-existing issue, but iterating over endpoints using
> fwnode_get_next_child_node() can cause an infinite loop and a use-after-f=
ree
> if a device has secondary fwnodes attached.
>
> If a device port has both primary children and a secondary fwnode, the pr=
imary
> ops finish and drop the reference to the last primary child, returning NU=
LL.
> Then, fwnode_get_next_child_node() incorrectly passes this same dropped c=
hild
> pointer to the secondary ops:
>
> drivers/base/property.c:fwnode_get_next_child_node() {
>         /* Try to find a child in primary fwnode */
>         next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, child);
>         if (next)
>                 return next;
>
>         /* When no more children in primary, continue with secondary */
>         return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node,=
 child);
> }
>
> This can result in a double-put. Furthermore, when traversing secondary
> children, the primary ops don't recognize the software node, treat it as =
NULL,
> and return the first primary child again, creating an infinite loop.
>
> [Severity: Medium]
> Does this fail to unconditionally put the prev reference if the provided =
port
> is invalid?
>
> If a caller passes a valid prev node but port is NULL or an error pointer=
,
> fwnode_get_next_child_node() returns early without dropping prev:
>
> drivers/base/property.c:fwnode_get_next_child_node() {
>         struct fwnode_handle *next;
>
>         if (IS_ERR_OR_NULL(fwnode))
>                 return NULL;
>     ...
> }
>
> Could this lead to a reference count leak, violating the documented API
> contract that prev is unconditionally put?

This seems like what the other fwnode_get_next_*() functions are doing.
I'd say this is a pre-existing issue as well.

> > +             if (fwnode_name_eq(prev, "endpoint"))
>
> [Severity: High]
> Does hardcoding this string match break the fwnode graph abstraction for
> non-DeviceTree platforms?
>
> By strictly matching the "endpoint" prefix, this bypasses the provider-sp=
ecific
> fwnode_operations, which could silently ignore valid ACPI and software no=
de
> endpoints that don't follow this exact naming scheme. Shouldn't this rely=
 on
> the backend-specific graph_get_next_endpoint operations instead?

From drivers/acpi/property.c it seems that ACPI graphs follow the same
structure. I don't have visibility into ACPI implementations though.

We also have the following in include/linux/fwnode.h:

#define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
#define SWNODE_GRAPH_ENDPOINT_NAME_FMT          "endpoint@%u"

So this should not be a problem.


ChenYu

> > +                     break;
> > +     } while (prev);
> > +
> > +     return prev;
> > +}
> > +EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.34=
57359-1-wenst@chromium.org?part=3D2
