Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701860;
	b=SSCrpLpU3tl1ulZkDaXPHLdwHE8DkHG7uBjYoFwpM4jnoB47pUXVv7L9Bn8CZF34xJzd
	 QvDuxJF00J1DcIfz0vmiI1cMz4EYfBhToW7brourYXkvCSIDnmUptRL1OuAj5+4KO2vl+
	 eYoHCWhf2f7MYQcrGyJRST/Lv8z9eZnTd9HmJz3o2P9AN6mqI++/mn3SlTzedCaANlfHX
	 2O/g8/DHk2yL+AdFnN8IooW2TBV3EQhaciC72PZW6hH2jhUs4ZIt7gxnie34J3qtGb9rR
	 ujz0avdw1kjCZE3zQz5dOtKPVXFqPyiZ18RoSnN1r/gfipACWVg1Z6aL8YU5LDw9Ylw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701860;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rkVPkoIKtVL3KsDay5yKt/di5ff4WQS5XpCVScQ0NDw=;
	b=PV/D/9TP5EI3khyKgwYHrson0CjYCxQd4Zpa4aIOZqsc3cgxk3CbfMvPKQAIj8a9+rqj
	 k9Av+rTd4/C4Mh/gHcfFwQ8zzKcAVLUO20Jhy4ShaKzi8etnM++S78orfRMkAtm3TA3Vz
	 EAyOqsE1dtfcJxdUiKQ1whpuAfS0x7NNx2s/W3KJ/PdEeShn0wTToKsT5sXXKRb36MLmx
	 BxnRcVsMBIGnU6nKHixjCZWrsgbmzYnV0u2J7ONgycJ4xQufZjpS456REHeyLHpY2gVbF
	 sxCCHmq/6fdZoO2maFqasOKyasntosvy4Kn+striJSuDk2mbEbX1nqdoVOBCY4jtYUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BK+0elR4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A24E606A32D
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BK+0elR4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982CD1F000EC
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701859;
	bh=rkVPkoIKtVL3KsDay5yKt/di5ff4WQS5XpCVScQ0NDw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BK+0elR4ncH6RHUdxP2nsBerr3JVEgT9Xz+obAflkM0oCL4miVBmTJenqlajm7puk
	 W6VHv0ETN2jaW+KTTDcqC8CSISs4ML/Be/lXo6YgrYBYEJ2Ld1lJPZdG8b7TKvF6K0
	 prmtmHXU1PpJ0l/Nb752MU72a87PbYUIoXqOLa4NnlkSrMeVYujHIBLTFa26EIe+zQ
	 Isfju4K6XqJSPzKiXh6UeSuBLm+Duy9+Rq4qupDCtb6bdcHzZXa34JzTD4kjs9v/I3
	 awsvTAnmf5iElaiCrm9GRpdFk5h3q9uPIioR9flGqAWpCJQ1RDWlKA3F+0Eh62J+Rm
	 EbYv3RcrTTUQA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae85e3685cso48195291fa.2
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 06:04:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEeluXXkjihXQMs+SfG01PQLYNMU1Wlu92fsQIxUKGsx19UZEorQYkQcAZKlwXyMBS5KuIknpCFzL7L9Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9L14evRP211BPgtgSCiLEmCfY+9OokgJxzFdHCeOFV3Wr3+sGv
	O89BEpea5g/n1crg6yvKZ2enCxpK8sJww6R4KJeR4X79ly9Hs1m8GZ7JeO39RWJDYoK0Dxun6nw
	+QHvds2jygvSLUFgp4WMhPRJweYsjaHk=
X-Received: by 2002:a05:6512:3a86:b0:5be:590e:ea76 with SMTP id
 2adb3069b0e04-5c1bc680e86mr6945117e87.6.1795701857945; Thu, 26 Nov 2026
 06:04:17 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <4779892.LvFx2qVVIh@rafael.j.wysocki> <14142601.uLZWGnKmhe@rafael.j.wysocki>
 <aweO20KV0XzcPBeF@google.com>
In-Reply-To: <aweO20KV0XzcPBeF@google.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 26 Nov 2026 15:04:04 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g05_8vJMRYSpN+y+rYB+Ou5dCq0EkPo3L+9um_6kkQgA@mail.gmail.com>
X-Gm-Features: Aa3M54oVymIXtrXskni02qesn3ZJ8JowzWnUlTgabuwCWOumAywQaIh72ciXGpE
Message-ID: <CAJZ5v0g05_8vJMRYSpN+y+rYB+Ou5dCq0EkPo3L+9um_6kkQgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PM: runtime: Add memory barrier before reading last_busy
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>, 
	Linux Driver Core Development <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 2:44=E2=80=AFAM Brian Norris <briannorris@chromium.=
org> wrote:
>
> On Tue, Nov 24, 2026 at 04:31:51PM +0100, Rafael J. Wysocki wrote:
> > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> >
> > The users of pm_runtime_put_sync_autosuspend() and
> > pm_runtime_put_autosuspend() can expect that the autosuspend delay of
> > the device will be respected after calling one of them because they
> > both invoke pm_runtime_mark_last_busy() upfront.  However, that may not
> > happen due to a leftover autosuspend timer running when the last_busy
> > update takes place, in which case rpm_suspend() triggered by the timer
> > may run in parallel with the lockless last_busy update.
> >
> > Namely, the last_busy access in pm_runtime_autosuspend_expiration()
> > called by rpm_suspend() may be reordered before the initial read of the
> > device's runtime PM usage counter in rpm_suspend(), and if last_busy
> > gets updated between those two reads, the update will be missed and the
> > device may be suspended right away.
> >
> > To prevent that from occurring, add a read memory barrier before the
> > last_busy read in pm_runtime_autosuspend_expiration() along with a
> > comment explaining the reason for adding it.
> >
> > Fixes: b3db492e8335 ("PM: runtime: Mark last busy stamp in pm_runtime_p=
ut_autosuspend()")
> > Fixes: e24e0630b5ba ("PM: runtime: Mark last busy stamp in pm_runtime_p=
ut_sync_autosuspend()")
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> If you're into this sort of thing:
>
> Reported-by: Brian Norris <briannorris@chromium.org>
> Closes: https://lore.kernel.org/all/awC0tcqgq2KvCyxO@google.com/

OK

> and
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>

Thanks!

> > ---
> >
> > New patch in v2, based on
> >
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
/commit/?h=3Dlinux-next&id=3D26236a3e8803f7e1ace104020d7f006edb220116
> >
> > ---
> >  drivers/base/power/runtime.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.=
c
> > index 0b15c718c1bb..c295acf6a718 100644
> > --- a/drivers/base/power/runtime.c
> > +++ b/drivers/base/power/runtime.c
> > @@ -186,6 +186,13 @@ u64 pm_runtime_autosuspend_expiration(struct devic=
e *dev)
> >       if (autosuspend_delay < 0)
> >               return 0;
> >
> > +     /*
> > +      * Prevent last_busy updates occurring before the rpm_drop_usage_=
count()
> > +      * invocations in __pm_runtime_idle() and __pm_runtime_suspend() =
from
> > +      * being missed if the last_busy access below gets reordered befo=
re the
> > +      * initial usage counter check in rpm_suspend().
>
> super-nit / feel free to ignore: it's a bit odd to write this comment
> covering super-precise details of function calls, and then immediately
> rewrite it in patch 2.

Well, say "stable" picks up this one without the next one (which is
entirely possible).

And the time spent on writing it has already been sacrificed so to speak.

> I think it might make for a better long-lasting comment if we just write
> in terms of "last_busy update" and "lockless usage-count decrement".
> Then we don't have to update it every time these things move around and
> get patched.
>
> Sample:
>
>         /*
>          * Ensure ordering between the initial usage counter check in
>          * rpm_suspend() and this last_busy access, to avoid missing
>          * any last_busy update performed before the last lockless usage
>          * count decrement.
>          */
>
>
> But again, that's a bit nitpicky.
>
> I'll try to look at the rest next week.

Thank you!

I'll queue this series up in the meantime because it has been reviewed
by Ulf and Sashiko has no concerns, but if you find anything needing a
fix in it, please let me know.  Tags would be appreciated too. ;-)

> > +      */
> > +     smp_rmb();
> >       expires  =3D READ_ONCE(dev->power.last_busy);
> >       expires +=3D (u64)autosuspend_delay * NSEC_PER_MSEC;
> >       if (expires > ktime_get_mono_fast_ns())
> > --
