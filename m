Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA413B14C7
	for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355700; cv=none; b=scfKqHrYrgUc2WOs7YFDUyifXsZLeFBtWRCABSg8FeMMOUDYwe9fWsmR625ICq2ogNiaUggOvwAvZI1Z+y1t+5UWk9eY2zkw2zu8ZcMFbHkTUkrerNjbwycrMbHgw+jWPqvBJ8ASkFULQZb9Urqk9wJSQVtddef6npLp4xBLZvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355700; c=relaxed/simple;
	bh=ae+7nNWeaOcwtzoJ8g8zJTapU9Co0WkBDAjHguCRKVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGgV/VIMCVbXuHJ5OOZH9PZz6WdQxZWtn+qZEEV4xxzWodZxlODnKbNgoTLkJT1ywlY8jkudsj8kaPSsbKcntfftd7evKULbqNE6x36Od4wf2TOojvx+nIWdJlftEUSXm1CDy3E84qvSXxFrMhIWvLveQk/c4sfkc6JKPnpXvPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnMpzoBu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnMpzoBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314891F00899
	for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790355694;
	bh=0ffWHiQbZIsxSI5BXBygJAUPT1n/Ksw/KozICfj7llQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NnMpzoBuP6u0rUip0usj+vy4a1nH3PDmnC/0VjqdKczZwipFNTo6diGuH080ku/3c
	 hEBNkWJVLilry6lGZAIOwRlusA0jZcNLLzv88ZnbXXZRJ3eeeGigEpxBMIn8tfDFmZ
	 zBoBx11HY4qLoDbgZ/4yH/3irgR94ve+4en4SRX+AIIhdRhKkLI+qHIULytblXp/CR
	 +SnX3Snp/EvNITIVus7J+YcLjuTJ2327kkfOTMeFojcRjimBAl4wfppMzxMqrDbrwu
	 lmvG+bvu95J8cQQo/szt0sUsW6SRGZ4Us9pFy2VeufbRU6ZB8ihZVhHP7hFxaIik3k
	 UZhWCBi+LI5mQ==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a6595b02ebso1042871fa.0
        for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 10:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByIemwvi3S0vyvZ3a+MyIS3/tgzbzZT5yMJo497arkZEPlJ4iP1M56tSvJT0BlOdNnPs/dxTu99uFvZIg==@lists.linux.dev
X-Gm-Message-State: AFuF++kRZEOuR3ve8V1zkj9ZUfa1cFgvwkd7VPkXwH3xqwBvYAf890h1
	VRmpMq43ofeYKFMx5g6ug7eqx4z3eCCeU2LdT0UogXGW0rkPf1Mx0C1kWFlZRQLLa9bLXduXzNO
	nJ87grVRmtMJoc05ZlireRGfcAuH7qmo=
X-Received: by 2002:a05:651c:890:b0:3a5:b507:dfb with SMTP id
 38308e7fff4ca-3a64caf4363mr6778101fa.29.1790355692625; Fri, 25 Sep 2026
 10:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909224818.2177311-1-mrungta@google.com> <CAD=FV=WFBmq3kniULxcXNsKgY-Zrb82JfaX5uRWVewQi_tJyJw@mail.gmail.com>
 <aqQBFxCjSdPmFJXh@google.com>
In-Reply-To: <aqQBFxCjSdPmFJXh@google.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 25 Sep 2026 18:59:53 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hBTGdBo-sgooV6_wscQLm9qv3bSnCqyUTODc5wDi4ecA@mail.gmail.com>
X-Gm-Features: AclHuK9rAcNfhTZvYquNzX8E_7QQVb0DrSRQ4EHHrRqgHRPmhGpKmAZJUHyj-Kw
Message-ID: <CAJZ5v0hBTGdBo-sgooV6_wscQLm9qv3bSnCqyUTODc5wDi4ecA@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: Add DPM watchdog to prepare/late/early/noirq/complete
 phases
To: Tzung-Bi Shih <tzungbi@kernel.org>, Mayank Rungta <mrungta@google.com>
Cc: Doug Anderson <dianders@chromium.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 3:24=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Sep 10, 2026 at 10:01:40AM -0700, Doug Anderson wrote:
> > On Wed, Sep 9, 2026 at 3:48=E2=80=AFPM Mayank Rungta <mrungta@google.co=
m> wrote:
> > >
> > > Extend the DPM watchdog to wrap device_prepare, device_suspend_late,
> > > device_suspend_noirq, device_resume_noirq, device_resume_early, and
> > > device_complete callbacks. If a driver hangs during these transitions=
,
> > > the watchdog will fire and dump a stack trace to help identify the
> > > offending driver.
> > >
> > > To prevent false-positive timeouts, the watchdog is set only after
> > > waiting for subordinate (during suspend) and superior (during resume)
> > > devices. With this change, DPM watchdog coverage is extended across a=
ll
> > > phases of system sleep transitions.
> > >
> > > Signed-off-by: Mayank Rungta <mrungta@google.com>
> > > ---
> > > v2:
> > >  - Extend DPM watchdog to device_prepare and device_complete callback=
s.
> > >  - Update commit subject and description to reflect coverage across a=
ll
> > >    system sleep phases.
> > > v1:
> > >  - Initial version adding DPM watchdog to late/early/noirq phases.
> > >
> > > Testing:
> > >  - Tested on an ARM64 SoC (Pixel platform running a 6.18-based kernel=
 with
> > >    DPM watchdog enabled; Android 6.18 kernel has latest DPM changes
> > >    backported).
> > >  - Verified hang simulation in device_prepare and device_complete
> > >    triggers DPM watchdog panic and stack trace as expected.
> > >
> > >  drivers/base/power/main.c | 31 ++++++++++++++++++++++++++++---
> > >  1 file changed, 28 insertions(+), 3 deletions(-)
> >
> > Thanks! I guess you dropped my (and Tzung-Bi's) Reviewed-by tags
> > because of the minor changes between v1 and v2? They look right to me,
> > so:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> They look right to me too:
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied as 7.4 material, thanks!
