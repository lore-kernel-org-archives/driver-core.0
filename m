Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697471;
	b=yUSm3qgPeIYzOQqxNW7rQNUs6ogLnZcZAkwS5u2TueSV1PBJTTG/8AlmyBLyugAart53
	 zkR04OwNT5KOXdzWnRQmHfzi0l8KT8OI1anFOHyWJylw2RU9JxxqV3YTxQyNZMlzHUGF/
	 5TWenwoPWUSwkNLyVkxL92zw4LvVjWEYUL5VZfS/1O6cLJJBtL2pJePii/tPZrq9jofte
	 oSIAoqhwIaUi8/Et2XF6un7QtxBu/8Rdqh6799fLP2ukdkCQJtOC6/f2ISeyXnV7hHAaw
	 fY+nTkKBYL+DOpFFb7EI5DZQ7PETNZF2PdUCFsaZJnzrHiGuoOp39MBBj2d6G+9lN2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697471;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q16GF0njlSdP7LoxbGpcMFaYQri5fmeNaCUnRRlaTx0=;
	b=sMyNaLb5y92kFzdoLrcakKAIQGLdxnLID3uEzwiiY51KtfXNNGry0lQaO9DplCVsh4rV
	 GGhjSaR0pHAg5a1zp8bvpGYjp2nGHsLAXMb/9waXU65MSvw+q1OI+o+q5bzrcFWEDaRk2
	 fUZysG5Ymk+sgrEIkYzL6qRH4KbPo77D5INYs3i9zOq9HQ4XpN33Es+NG2uLPxIvbU63r
	 s3MjzT+t2DpbJhQekL4YrpU67O11huTBsVaR7dl7X7qd0TY0MNH170YE9mgO0dncL0kwJ
	 i5xBTry7tLxU/0X53hKbM3CUBgSvrx/7JND1DD7UDtrMBtv7YZblzsmSK5R3uFuwxTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CuM+B0Tr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4BA606A31C
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CuM+B0Tr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABBE1F000D2
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 12:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697471;
	bh=q16GF0njlSdP7LoxbGpcMFaYQri5fmeNaCUnRRlaTx0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CuM+B0TrgcpGtPRfYJrU7EUCnd7OgXWQ2QX07sEI1w8m7LzIyZrcTd3sOo9e1Tj2I
	 AbdvhCmos7JLecctVIu2bwTnw0rNwiL/eu/eYOq8l61tvUDUOn2QfG61piloWAPlxa
	 8/ByKD8/7nCKYHF11ivb0P1cZOeRFNLEPqLd174Hv52scmHM3aGJqCqbJQrIFU2wSG
	 71zU+2QgQIIH91HKlWcywBChe0hZVGA06qmYvBFxHeArvHpU6uC9SNYKg2aFFVdOvL
	 MQnvcykOA8PXAc3OcDR/WfBq3XrWmCEl0QF248ysLvWSOQcLNsxZCPd3WDgVBxPWfk
	 Ma4RtCfNwm79Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c31cdbeec9so2213877e87.2
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 04:51:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEBm7ipKrtPAT3cPU9zanMF/p3MQ31UUQ2/ufUXi0RCdqPmlr6cf7PHptMxhoE88xT/WYbFnBErKq9hHA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8xpLF1rQ5ep0hQj3gWHRntuqWPcloYIOVqqFpTsGCLiKIt/OC5
	6P2o2yPKEfl4dJ8yhbmaIF/wJaUqec0mX/NBU+AoMVsRiosoEXwEzvVnJNGdnnYJ6Ur9whodzpL
	gSQXb1eWqMWE9L/70lZ9hkspPyDKFmYw=
X-Received: by 2002:a05:6512:3d29:b0:5c1:47d6:8258 with SMTP id
 2adb3069b0e04-5c1bc80120bmr6196876e87.41.1795697469357; Thu, 26 Nov 2026
 04:51:09 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <4779892.LvFx2qVVIh@rafael.j.wysocki> <CAPx+jO8d-25kLQw9X0wW4i3YV4Jn+2Zr7_ZOT9rE10D99kPU_Q@mail.gmail.com>
In-Reply-To: <CAPx+jO8d-25kLQw9X0wW4i3YV4Jn+2Zr7_ZOT9rE10D99kPU_Q@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 26 Nov 2026 13:50:57 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j5M7fax8_XP1G4oENykq6vg-hgiW4JPaqf=AvRiY-xFA@mail.gmail.com>
X-Gm-Features: Aa3M54rqPc231r6BvV4IGlb68jllf8ooObFsk4opHGBD8naBN0eygsdnIo8Ab08
Message-ID: <CAJZ5v0j5M7fax8_XP1G4oENykq6vg-hgiW4JPaqf=AvRiY-xFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] PM: runtime: Fix issues related to autosuspend
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Linux Driver Core Development <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:51=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Tue, Nov 24, 2026 at 4:40=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.=
org> wrote:
> >
> > Hi All,
> >
> > This is a follow-up series for
> >
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
/commit/?h=3Dlinux-next&id=3D26236a3e8803f7e1ace104020d7f006edb220116
> >
> > which is in linux-next and it replaces
> >
> > https://lore.kernel.org/linux-pm/3076901.e9J7NaK4W3@rafael.j.wysocki/
> >
> > (hence v2).
> >
> > First of all, there is a potential issue with respecting autosuspend de=
lays
> > in pm_runtime_put_autosuspend() and pm_runtime_put_sync_autosuspend() t=
hat
> > existed before the above commit, which is addressed in the first patch,
> > and that fix is relevant for the other patches in the series.
> >
> > Second, the commit above overlooked some cases in which a running autos=
uspend
> > timer may trigger between dropping a runtime PM reference to a device a=
nd
> > updating its last_busy timestamp, which may cause the device to suspend
> > without respecting its autosuspend delay.  Those cases are addressed by
> > the second patch.
> >
> > Next, I was mistaken when I wrote this in the changelog of the above co=
mmit:
> >
> >  Updating the last_busy timestamp when rpm_idle() returns an error
> >  without calling rpm_suspend() is not useful because the device is then
> >  going to remain active for an unknown amount of time and its autosuspe=
nd
> >  delay needs to take effect later.
> >
> > There actually is a reason for doing this which is that an autosuspend =
timer
> > (left behind by an intermediate runtime resume) may be running when rpm=
_idle()
> > runs and that autosuspend timer needs to be prevented from using a soon=
-to-be-stale
> > last_busy timestamp value.  That is addressed by the 3rd patch.
> >
> > Finally, the last patch updates a kerneldoc comment that has become out=
dated after
> > the commit above.
> >
> > For details, please see the patch changelogs.
> >
> > Thanks!
> >
> >
> >
>
> Again, thanks for working on this! For the series, please add:
>
> Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Thank you!

> As somewhat also proven by the subject $series, there are some churns
> that we need to deal with in regards to the intermediate rpm_idle()
> phase. I am wondering if it perhaps may be the time to consider
> removing it altogether, unless we still think it's useful of course.

I don't think that the rpm_idle() phase is super-useful.

Of course, eliminating it would require getting rid of the runtime
idle callbacks in the first place, but we all seem to agree that this
should be doable and probably worth doing.

> In the past we have discussed introducing support for *multiple* (a
> dynamical amount based on what the device supports) low power states
> to runtime PM. When I started looking into how to implement it, I
> stumbled over the rpm_idle() thing, which kind of prevented me from
> moving forward at that point.
>
> What do you think?

Here I have some doubts.

I'm not sure if there is a single model covering multiple idle states
that can be applied to every device in every system.

There are different semantics and different requirements.  For
example, you may consider "clock gate" and "power gate" states for
some devices, such that a device needs to go to "clock gate" first and
then to "power gate".  On the way back, it would need to go to "clock
gate" before reaching full power.  However, this is not how PCI or
ACPI PM works: There you can go from shallower to deeper, but to go
the other way around you need to transition straight to full power.
