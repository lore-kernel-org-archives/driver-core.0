Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348453;
	b=UlPf1Uz59Ron/6yDjl5FyiQNwOk0ksN1rUwZkGTenOE/uChrRkiZnq/xNi3k4VQrUHjQ
	 tRx/AwoTctbmlLIeTgkZDeXX3VHmiuEGVNaaGaVFmHuASy028Ak26p29vW5Pny0Iv0Kt8
	 9w3bGBh0Iur3tIt/LKc6lmmHDO7wmm/D7ozSlzgY9L4N6GVBkwhHxcgY6AyoxMbIJkrp6
	 ozJeQTJ6asMCJ3apX8mZzrr9c1vtdF7W9vF3Nna9JkbNtdym2Qms8Gtfy8pAhVgQC8tSr
	 Qe01sC1NazMPNrHF8YfG3c2sJnDn08r/4jRBGc3azs3l++9Oi5vjkUkOFGRjGZz4h4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348453;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hpTtgvPqHJQYaMjHZ0OTVw/eXj9Y8bSYmtvouHtYSb0=;
	b=DSfEp94GTDi4CsoWwjXKuC+5wCtg7/Jbu3NQH5PQkeQVUWmoATWriDYZPx+N5dONvr0Y
	 RA2qaagk1+fm2hnB6LDsQxWghBXGwp2mJNZgw4q5sngHnZG4EmMnmEMSBNjezpOrBbIa0
	 3N7ODwzZ2inqUI56cNFra7sHoiYTU83fT7/yZedNvmpesrKnO5NeF6aE1VM57cBobnwHh
	 iW2pzfnnl58VvVXnE2XoJmuAGDPpwvzGCHNeQIh6uakeLoP38EngcIsBQIEHJSowYvh/P
	 4lXcKLt/O0/VsRPDv6IVUzVQ7AzvG0YCqhTikjSpcdAqDYa3ZVeVeyRdMefSpQ2/uag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lsa8pRfV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB3E606A320
	for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 11:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lsa8pRfV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4CF1F000D0
	for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 11:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795348452;
	bh=hpTtgvPqHJQYaMjHZ0OTVw/eXj9Y8bSYmtvouHtYSb0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lsa8pRfVZpXw3yacZGP3uy7VcqFEcrB4EcyHxAbUhXpt91mOFzH0iHIfPGGDDdoLD
	 j7aPyMbpsRChTtlCE2HYd6GUpL/jn7tuBQ+PJhhoZb99jMTVfOBLexEGokdS114GQW
	 bRD6Xd5GBmaPD4Q58Hz14GRkGTrklivD8MkUM8oJtfsbiKx+SkimWAcqoWLN1Tv8JG
	 j0VBaFOPornRXawlIRr0Vx7Oy7dWDwaPr4HsreNDPW0WOx5d2T3V+J9/48VJEHdDB6
	 Jm4xzUpR3O6mHS3pTXhxjdndqaw6Eeps+JRMZaHkY2CKF6AbNbi8r9e4B3XDxDdJbs
	 t3L3oC/xBbsvQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso2948754e87.1
        for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 03:54:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEmL7ztyfv5RDKmXWoM8eqwhu2CMrOB7CGaiBC/8Rx/rtAspewHpknPA4cLijvVDgeSji4nxXtU58i02Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/ChZKfUDD3rTkBjFwAmJ/Ee0z90dfoa2LvKZjOhwP/ZwiBzD1z
	gSo/ajv1GjbZsD8j85rhUd4NibeZCmlJ8Tw+tXjruF9StH3VUblYYn6dD+6A+pI2HxerPSab/li
	ca+gMRR6zkojI0yPRIYGGaxZYHdY1Zj0=
X-Received: by 2002:a05:6512:2c9b:b0:5c1:ace3:12c1 with SMTP id
 2adb3069b0e04-5c1bc575979mr2268962e87.0.1795348451262; Sun, 22 Nov 2026
 03:54:11 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <1978814.tdWV9SEqCh@rafael.j.wysocki> <3076901.e9J7NaK4W3@rafael.j.wysocki>
 <awC0tcqgq2KvCyxO@google.com> <CAJZ5v0jjxWzL-NLkm5B2ayGfXYdQcE4Shq8B9TGz1ghHBybSAg@mail.gmail.com>
 <CAJZ5v0hgxJFXQnFRvLS=s85oSVSbu9tNDs_OoiGce4NMRNP04w@mail.gmail.com>
In-Reply-To: <CAJZ5v0hgxJFXQnFRvLS=s85oSVSbu9tNDs_OoiGce4NMRNP04w@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Sun, 22 Nov 2026 12:53:57 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iiWr89UWy6jCxY5pEsrgzWTU6_SBJOS_xCPyOwvD9d-A@mail.gmail.com>
X-Gm-Features: Aa3M54ouPbTjS5Ok69KjngyZmq31JmV4Rg_fdHEoKgGkFKye78-_4hbdcDMi9xM
Message-ID: <CAJZ5v0iiWr89UWy6jCxY5pEsrgzWTU6_SBJOS_xCPyOwvD9d-A@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] PM: runtime: Update last_busy in all rpm_idle() paths
To: Brian Norris <briannorris@chromium.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, 
	Linux Driver Core Development <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 12:22=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Fri, Nov 20, 2026 at 10:29=E2=80=AFPM Rafael J. Wysocki (Intel)
> <rafael@kernel.org> wrote:
> >
> > On Fri, Nov 20, 2026 at 9:59=E2=80=AFPM Brian Norris <briannorris@chrom=
ium.org> wrote:
> > >
> > > On Thu, Nov 19, 2026 at 09:16:30PM +0100, Rafael J. Wysocki wrote:
> > > > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> > > >
> > > > The changelog of commit 26236a3e8803 ("PM: runtime: Update last_bus=
y
> > > > before calling rpm_suspend() in rpm_idle()") stated that rpm_idle()=
 only
> > > > needed to update last_busy when it was about to call rpm_suspend(),=
 but
> > > > that is incorrect.  There are still cases in which a device may be
> > > > autosuspended earlier than expected.
> > > >
> > > > The first one is when pm_runtime_put() is called while a leftover
> > > > autosuspend timer is running.  Then, dropping the device's runtime =
PM
> > > > usage counter to 0 allows rpm_suspend() triggered by the timer to
> > > > suspend the device immediately before __pm_runtime_idle() is able t=
o
> > > > grab the spinlock.  Prevent it from occurring by adding a last_busy
> > > > update before the rpm_drop_usage_count() call in __pm_runtime_idle(=
).
> > >
> > > Do consumer->supplier and child->parent refcount drops have the same
> > > problem? e.g., in pm_runtime_release_supplier() and rpm_suspend() /
> > > parent->power.child_count decrement?
> >
> > I need to think about it.
> >
> > I don't think it affects the $subject patch anyway though.
>
> So generally speaking, yes, they do.
>
> In the suppliers case, that can be addressed by doing something like
>
> pm_runtime_mark_last_busy(supplier);
> smp_mb__before_atomic();
> pm_runtime_put_noidle(supplier);
>
> in every step of the loop in pm_runtime_release_supplier().

That would be overkill because refcount_dec_not_one() provides release
semantics, as per the documented behavior of
atomic_try_cmpxchg_release(), so long as the refcount is actually
decremented by it which is expected to happen in
pm_runtime_release_supplier() at least once.  So adding a
pm_runtime_mark_last_busy() call before the loop in
pm_runtime_release_supplier() should be sufficient.

> In the parent case, a similar thing would need to be done in rpm_suspend(=
):
>
> parent =3D dev->parent;
> pm_runtime_mark_last_busy(parent);
> smp_mb__before_atomic();
> atomic_add_unless(&parent->power.child_count, -1, 0);
>
> with the addition of a read-side memory barrier (see below).
>
> > > > Another one is when rpm_idle() returns without calling rpm_suspend(=
),
> > > > for example because the callback has returned a transient error, wh=
ile
> > > > an autosuspend timer is running.  The timer may then suspend the de=
vice
> > > > without respecting the autosuspend delay.  Moreover, the timer may =
fire
> > > > while the callback is running and it will not see the new last_busy
> > > > value in that case.  To address these cases, move the existing
> > > > pm_runtime_mark_last_busy() call in rpm_idle() before the first ret=
urn
> > > > value check.
> > >
> > > I suppose we don't care about: "what if .runtime_idle() is slow?" --
> > > that makes a small delta in the expiration time.
> >
> > No, I don't.
> >
> > It is actually absent in the vast majority of cases.  And if it is
> > present and it is slow, it may as well call
> > pm_runtime_mark_last_busy() itself.
> >
> > > > In both places mentioned above add comments explaining the rational=
e for
> > > > updating last_busy.
> > > >
> > > > Fixes: 26236a3e8803 ("PM: runtime: Update last_busy before calling =
rpm_suspend() in rpm_idle()")
> > > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > ---
> > > >
> > > > Commit 26236a3e8803 is present in linux-next.
> > >
> > > Semi-unrelated cleanup: pm_runtime_put_sync() some stale kerneldoc no=
w,
> > > saying "this does not update the last access time".
> >
> > Ah, good point.
> >
> > > > ---
> > > >  drivers/base/power/runtime.c | 16 +++++++++++++++-
> > > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runt=
ime.c
> > > > index 0b15c718c1bb..02e7b4953c38 100644
> > > > --- a/drivers/base/power/runtime.c
> > > > +++ b/drivers/base/power/runtime.c
> > > > @@ -518,6 +518,14 @@ static int rpm_idle(struct device *dev, int rp=
mflags)
> > > >       else if (dev->power.idle_notification)
> > > >               retval =3D -EINPROGRESS;
> > > >
> > > > +     /*
> > > > +      * Update last_busy to defer autosuspend by the full autosusp=
end delay.
> > > > +      * Since an autosuspend timer may be running and the new last=
_busy value
> > > > +      * needs to be seen by it, update last_busy before returning =
an error or
> > > > +      * dropping the spinlock and allowing the timer function to g=
rab it.
> > > > +      */
> > > > +     pm_runtime_mark_last_busy(dev);
> > > > +
> > > >       if (retval)
> > > >               goto out;
> > > >
> > > > @@ -563,7 +571,6 @@ static int rpm_idle(struct device *dev, int rpm=
flags)
> > > >       if (retval)
> > > >               return retval;
> > > >
> > > > -     pm_runtime_mark_last_busy(dev);
> > > >       return rpm_suspend(dev, rpmflags | RPM_AUTO);
> > > >  }
> > > >
> > > > @@ -1132,6 +1139,13 @@ int __pm_runtime_idle(struct device *dev, in=
t rpmflags)
> > > >       int retval;
> > > >
> > > >       if (rpmflags & RPM_GET_PUT) {
> > > > +             /*
> > > > +              * Once the usage counter drops to 0, a leftover auto=
suspend
> > > > +              * timer may fire before the spinlock below is acquir=
ed.  Update
> > > > +              * last_busy first so it does not find the expiration=
 time in
> > > > +              * the past and suspend the device immediately.
> > > > +              */
> > > > +             pm_runtime_mark_last_busy(dev);
> > > >               retval =3D rpm_drop_usage_count(dev);
> > >
> > > This is somewhat of a pre-existing issue (e.g., in
> > > pm_runtime_put_autosuspend()), but weakly ordered architectures don't
> > > really enforce the dependencies you want.
> > >
> > > rpm_drop_usage_count() uses an atomic decrement, which has a full
> > > barrier.
> >
> > Right, that's why the last_busy update is carried out before
> > rpm_drop_usage_count().
> >
> > > But this is supposed to influence the rpm_suspend() behavior of
> > > rpm_check_suspend_allowed() (atomic_read) + READ_ONCE(last_busy), whi=
ch
> > > includes only a conditional dependency and no barrier.
> > >
> > > https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0124r6.html
> > >
> > >   "Control dependencies can order prior loads against later dependent
> > >   stores, however, they do not order prior loads against later depend=
ent
> > >   loads. (Use memory_order_consume or memory_order_acquire if you
> > >   require this behavior.)"
> > >
> > > So, rpm_check_suspend_allowed() should probably use
> > > atomic_read_acquire(&dev->power.usage_count).
> > >
> > > (This is probably an extremely narrow, practically impossible issue.)
> >
> > Yes, this sounds nearly impossible in practice, given the number of
> > branches between the usage counter read in rpm_check_suspend_allowed()
> > and the last_busy check in pm_runtime_autosuspend_expiration().
>
> It is not entirely impossible though AFAICS.
>
> However, it is only really a concern if
> pm_runtime_autosuspend_expiration() actually runs and if it actually
> computes expires, so I'd rather add a read memory barrier to that
> function:
>
> smp_rmb();
> expires  =3D READ_ONCE(dev->power.last_busy);
>
> That would get the ordering between the last_busy access above and the
> initial usage counter and child counter checks always right.
>
> Well, I guess I need to redo the patch series to take all of the above
> into account.
