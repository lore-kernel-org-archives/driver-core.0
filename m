Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E511F2B8D
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854758; cv=pass; b=FFH+h/B9mpGKATxsiDRIXdX6iajP/xKKsWfD8BausDfBKRA2y0yXJDA8WHYvxBbZB6u9djeluVbql/eur2yErI582xx4m5f6w74aqYFJ9vpZ2fiWHR6fOq/io1ixEZnmnPiCZWKZ6S1K8SDZwyhOh3RVdcElzoI5zKlFhwoo1u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854758; c=relaxed/simple;
	bh=EzUfziwHN4t+6rCJqNdkZVs8Vyi2IIgFGGSz1ptRO/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ri0C/Teo8kFDVANBXoAHt2W5OPsP5b0m62PId3rwym+SaFNLISNMaausx4ufJJD5e0DH9ALbBXu5BnTA7L96w5Hj0HkrqGngA8Xx3LxvvaZNnzLgGWqa0YHCkp+P/DNErwpbtddQNTrczVdWsDJ/fD21fwgyowO02cwvDtYKv1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N97TUSmx; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N97TUSmx"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-352dda4a34eso1804109a91.1
        for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 05:52:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771854757; cv=none;
        d=google.com; s=arc-20240605;
        b=UfuzOBcGSOWuzAfT+JSNmQs8oAC38H7NdiQgBmImtb6qsPqjfMQkK8aicPKXeT/iXt
         3S9b+lsybWt0XEDBE/nz7RHlb9lftd/GP28fqGlztX2Qq47ActlvQb5hm/eSH9B/gWxs
         G3L8lqrnStnow0ebPq2gWJC3uHegK9+3WmZnFZeKb5KLQDYDkTK374Zi0EUBHcCY4kwS
         ToesNwSlzQ5gKnXDMgPJp8OOcvs1aPBGXnzXiy66dkr9JCb3OVBSt0hTcRa3j6WUthUR
         a12QgMtKLlFoDaYGhiQ6JJcJjz1pdKoeZfO2U4ybS4al/koebVtfGNl52O6e8/HDW9BR
         vwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TWwsfQSmrc7KhlI2G6haDBaCjFdQ6FTDQCYdiKWJd1g=;
        fh=sqi4VDvoF06VeLSXkcm585K0zcWKPOWrB+45LuC/pXo=;
        b=EYg0ciMOT64AgC8u3YJ6XkaTCSuTy1HewhxAPVoFjiy83qrwJivMJVNTAdTiM/fSQL
         uXGtLZNqLmmfSPeC+MTuMQgPtR42KAb0ABN6/ePT4yAoPe5mQJODGoIpE7I0cXmvlT39
         1xq+fZRnT6ChmBwknuF8Vt3bdRYJG+CSeZWD5pg0bsmbtRM3mmhA2u/Prq4JCesHugHf
         xF/WxUbhloE4KlY5AH5NBB/uDITBYKewPFyRsIQKR9yLWZN2BFGSZteLDZJsynDR6AlE
         gxSHOvp3j5c7zIvHxk7W9wkNAksWVW/ohBRg2zvVesmYQJVNqEQASXnypSgdLM2Xs2u8
         ctOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771854757; x=1772459557; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TWwsfQSmrc7KhlI2G6haDBaCjFdQ6FTDQCYdiKWJd1g=;
        b=N97TUSmxvm4VSQMgN58+Un7zQJEDgUaScgP8hLQN//LmDRNlj1RLMA8u4rZle7uYZc
         e+n6/goLd/8uuQ/lxxdqVgFByjBe0CJgML4niVFh6HGAKY4Z512J7GP+oQUtzSp3ga/I
         sZkE1nzgGACtcxzjHYfTKfzjQwcZwEIiTshPIAch55WXVQEdozTp4HmUYKTOw8o4GYT5
         /ufpiazZYecLRoMLOT1/SZPg6ZUxIhqhmKrIyI2tNnrq1xpz5fhBap+ZfIZFJ6qZnXVt
         hSmbFJy2s/NWO1nyUGCtHggqKPgHj2Tod5XKBcvmsyYkc9aPzGXI/HvcdxlmkzHfOYJy
         PgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771854757; x=1772459557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWwsfQSmrc7KhlI2G6haDBaCjFdQ6FTDQCYdiKWJd1g=;
        b=S0g5BfLD/7OLXjgCkwHpRtRswxGpY0Fev/GzxudIejU3o3WGRD14qLzBAqASgwKLGj
         7opkcFo28IyQoZoseUKqFas4U1dY6GCP0bqHpiitkPSsgEVAlM/zmPf7ZyjOsNWLb+Zn
         ZrnlchNotKuiDPA8SxoNuG21hRY3SqJbAAfxgoUEm6ucOT8mJQzgzfF3lTvcsRWBAgtc
         EOWOSG3gt51IZHlp5Jq5qWb1nL9FHthheS33XNU7kUAD2TzoL7Y6GBIzF5cDhFkpecvu
         L7o/7TW2i2Y2cE/TowcvgiYLDLf1lKtIbY1BrYN4v9xRj09fUpAPYTqebgUhGqYCnD2b
         Gi6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq88oR2s85BgZHAa5m6CM9PmQ3VRHDNiK/Cdb6jbYY4BsO/B+sou843DpALBep8Lllbhz+vtBy7Lc45w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy848kVl4HC/BqI9119jQo+bkqGRPW4700ogEsBNVSuXYV+Ux03
	bDIVJhkcl7YHyqylTBC5n6GtAsVss0HOmiy5QZt1h75KkgJbPWbFpWlpRldrh2q9sdoPDkzL9D3
	RQFntTYE7/BRshpqwrRtnNSRjfOADaFM=
X-Gm-Gg: ATEYQzywe+S5IId8Ky0PEjct+Hk962DtYcs29m0Bll8W8XKdaDm+pLIUUXCiI0cb2od
	724GJ5xuWQ9f/RT4COHaUTlelU5fj312tHYgsjRH0xK25UYTgRjzFUMcydjwkHGnj5OIe7IsOyp
	mV1rTFecleBIUdtC6D6CA5dS4TkHLRwu0tP7wr2hntq4157YChIgi/cV6xPBgPIgz0BiVE6yJdK
	6CO2/oRQmq22mdGENKbk/eIsksKotooxIGg8pU08dOMWo5DbpmqIgW79b9Pe7FmHDhpOxvSOjT6
	zF4eajsk
X-Received: by 2002:a17:90b:5447:b0:356:4ea0:e9e2 with SMTP id
 98e67ed59e1d1-358ae8d3a09mr6084454a91.34.1771854756912; Mon, 23 Feb 2026
 05:52:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
 <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
 <aZwWMiYEvr3DXi3E@smile.fi.intel.com> <9dd377f6-3565-4c0c-8c98-1b5ac4982f5b@kernel.org>
 <aZxES35K3hSX4KEx@smile.fi.intel.com>
In-Reply-To: <aZxES35K3hSX4KEx@smile.fi.intel.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Mon, 23 Feb 2026 15:52:25 +0200
X-Gm-Features: AaiRm53PjY3r4YJJgRdEcXeF3wEcS_dn51myeI6Bp2rdVCy5EIQxm03JMpsksBU
Message-ID: <CANhJrGPWxgFddKaqdFM+DGKYTXaPxeBZLMhxBfXT-ZU6SrsbPA@mail.gmail.com>
Subject: Re: [PATCH 1/9] workqueue: devres: Add device-managed allocate workqueue
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Tobias Schrammm <t.schramm@manjaro.org>, Sebastian Reichel <sre@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Lee Jones <lee@kernel.org>, 
	Dzmitry Sankouski <dsankouski@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

ma 23.2.2026 klo 14.13 Andy Shevchenko
(andriy.shevchenko@linux.intel.com) kirjoitti:
>
> +Cc: devm-helpers maintainers/reviewers
>
> On Mon, Feb 23, 2026 at 12:52:14PM +0100, Krzysztof Kozlowski wrote:
> > On 23/02/2026 09:56, Andy Shevchenko wrote:
> > > On Mon, Feb 23, 2026 at 08:27:29AM +0100, Krzysztof Kozlowski wrote:
> > >> Add a Resource-managed version of alloc_workqueue() to fix common
> > >> problem of drivers mixing devm() calls with destroy_workqueue.  Such
> > >> naive and discouraged driver approach leads to difficult to debug bugs
> > >> when the driver:
> > >>
> > >> 1. Allocates workqueue in standard way and destroys it in driver
> > >>    remove() callback,
> > >> 2. Sets work struct with devm_work_autocancel(),
> > >> 3. Registers interrupt handler with devm_request_threaded_irq().
> > >>
> > >> Which leads to following unbind/removal path:
> > >>
> > >> 1. destroy_workqueue() via driver remove(),
> > >>    Any interrupt coming now would still execute the interrupt handler,
> > >>    which queues work on destroyed workqueue.
> > >> 2. devm_irq_release(),
> > >> 3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.
> > >>
> > >> devm_alloc_workqueue() has two benefits:
> > >> 1. Solves above problem of mix-and-match devres and non-devres code in
> > >>    driver,
> > >> 2. Simplify any sane drivers which were correctly using
> > >>    alloc_workqueue() + devm_add_action_or_reset().
> > >
> > >>  include/linux/workqueue.h                        | 32 ++++++++++++++++++++++++
> > >>  kernel/workqueue.c                               | 32 ++++++++++++++++++++++++
> > >
> > > Hmm... We have devm-helpers.h. Why the new one is in workqueue.h?
> > > Can we have some consistency here?
> >
> > Answering with update:
> > I don't think this should go to devm-helpers.h. The definition is in
> > workqueue.c, thus the declaration should be in corresponding header.
> > It's logical and consistent.
> >
> > Otherwise, I could move it entirely - definition and declaration - to
> > devm-helpers.h, but then the release (devm_destroy_workqueue()) will be
> > essentially exported to everyone through the header.
> >
> > So kind of conflicting choices.
>
> Hmm... An alternative I see is more intrusive but should make it less
> inconsistent: Treat the devm-helpers as devres like header for workqueue
> and collect there all devm_*wq* related stuff with maybe something putting
> back to / holding in the c-file.
>
> OTOH we may leave devm_destroy_workqueue() visible for now with a comment
> saying do not use, it's internal or something like that.
>
> Hans, what would be your opinion as you IIRC is the author of devm-helpers.h?
>
> Matti, I also Cc'ed to you, you have usually non-standard thinkig and
> insightful solutions (besides being reviewer of devm-helpers).

Thanks Andy for Cc'ing (and flattering!) me ;)

My personal opinion is that the devm-helpers.h as a "collect 'em all
here" -place might not have been the best idea. Perhaps the original
author didn't know what he was doing :) Problem lurking there is that
such a file collecting misc devm -interfaces in one place, will end up
slowing down the compilation while some people put effort on splitting
the headers.

Currently the devm-helpers.h contains only workqueue related
devm-helpers. I'd consider renaming it to something like "devm-wq.h" -
and then just stuffing the devm-wq stuff in it. Optionally, I'd
considered adding all the wq-devm stiff from the devm-helpers.h to the
regular workqueue headers - but I think this was not liked by
everyone.

So sorry, I have no helpful or strong opinion on this. Besides, You,
Krzysztof and Hans all probably have better insight on this than I do.

Yours,
    -- Matti
-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
