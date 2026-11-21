Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260175;
	b=R51ANzidkyjHbpQVvU4yXHcVzlGU48dG9SmW4KSsPaBOW2mzfwtnh1Fdvvgo6yTOXK8O
	 VoDOFPIGJbfGhVK9HW+amY/adrpcmzbFeRu67i/ZRx4MY62PwNG3D1Ib8NQ0gWJG7Yai+
	 ZOnXTdrtyCSfMxd1VKWFsxEQpk4mASnuhy7RMcPP2oVBDvVbeZx/eTA7tuPwPsq/DVjku
	 sD1AiKUGLup8GolDrl59JKZlBlWD230yLKfGlIoUzF9pnk78iFExYaBaTjxXB9lwo9VWs
	 ZFYxa/lUAt2ak0OmWNTdRD6PkHPZ1Ip+2Ans6I2Tl8XYEEPBEa0B3EztMAj8WMmShyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260175;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VXTpoBrzLdbldT1C9z4d9cxILmU7XPHQacy7zIo4aZk=;
	b=wu4yWP614mRkhpGHLuqfGKWTFlHqPQ9EQEr38VzUJ18f0TXI4TvKpkp+0/1UnnQ/MpkG
	 vZy32/e1+abon47nEw7qkOt8NPxOx11Ink4bhQgYIU09mFp/iopmbnaW2acLELfrGlvIp
	 J+u95/HgZQTVlHDe/L+aBhj2/pyWFBZN1mzgLFYXFX+fRGwdnLx/kOEVJ75qjoVsTHCTx
	 ayPDdlwKUSxB/uTEYN1Y4nrNQTAgtvTCzPhk2f7KZ7sH3AoYoSHk5l3GGT8VE37u2bU9v
	 MrzYZ/w9pHhLyMwo5s9B4xmNo3jSZvz6vd7ZPgABAo/srmL7oB+t92grFx1DyKbsDxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THBjpZGn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367B8606A32A
	for <driver-core@lists.linux.dev>; Sat, 21 Nov 2026 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THBjpZGn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E3C1F000D0
	for <driver-core@lists.linux.dev>; Sat, 21 Nov 2026 11:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795260174;
	bh=VXTpoBrzLdbldT1C9z4d9cxILmU7XPHQacy7zIo4aZk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=THBjpZGnrzGlrorPL2z3p4H0eTwfgZj58SpLP5wDktC6sPSA+GiBGSFKs0xaz47Ih
	 RLNljI5tHA20yX2OMlhYsfMErwY0BvUg71j3FGrls7Qoj6vWUQaPOs21yVO3JtA58V
	 cSsBzgng/1I3R/6EnpFhhw//m3T+Rk79JQo/AxE2nom3tMPnTA1iLGinhYRjgqNDr/
	 c0h7PS78C89O+Os2/zTZhjiZLdAF+Uf/6LBVmFRYfW0eml5pxtAX1KJaDkiEUuO0zO
	 p2j7ZiTwERmSbogycosrqsbHM4/+6NI+1G8YjzELsgWeydVRvHOS3tpEs+01ifsZWU
	 ZBq673joYYk7g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so866234e87.0
        for <driver-core@lists.linux.dev>; Sat, 21 Nov 2026 03:22:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHhqayPly+1piTxPZXdSTj14MeDkOlB5Ci6r/e4Kp16c0SPiTpS62fDnVdx3f/ZbZnj7BvoA+ugykpLAw==@lists.linux.dev
X-Gm-Message-State: APuU4Z95tQMijvcUqpVzMnmSg/7yHlh5AfhXuXa6NjZx9fTH0NAh3LIe
	kzCc/AcqrY/kvuP3zM0cesHvtugYGXuF+p+diflHH1JzDnRxkQjSB3XPjpEpEd3e3/SS/p10wt6
	SUJavIEQa6AG9/sLAZjaUdELZohhau2Y=
X-Received: by 2002:ac2:4e0a:0:b0:5c1:4aa4:557 with SMTP id
 2adb3069b0e04-5c1bc7cc547mr1727666e87.31.1795260173235; Sat, 21 Nov 2026
 03:22:53 -0800 (PST)
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
In-Reply-To: <CAJZ5v0jjxWzL-NLkm5B2ayGfXYdQcE4Shq8B9TGz1ghHBybSAg@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Sat, 21 Nov 2026 12:22:41 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hgxJFXQnFRvLS=s85oSVSbu9tNDs_OoiGce4NMRNP04w@mail.gmail.com>
X-Gm-Features: Aa3M54qEv_i_jhYbOZBjVLlzGoQDwdUl-S2MVW-Q8HeS_qeyzNd5xupMePO473M
Message-ID: <CAJZ5v0hgxJFXQnFRvLS=s85oSVSbu9tNDs_OoiGce4NMRNP04w@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] PM: runtime: Update last_busy in all rpm_idle() paths
To: Brian Norris <briannorris@chromium.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, 
	Linux Driver Core Development <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 10:29=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Fri, Nov 20, 2026 at 9:59=E2=80=AFPM Brian Norris <briannorris@chromiu=
m.org> wrote:
> >
> > On Thu, Nov 19, 2026 at 09:16:30PM +0100, Rafael J. Wysocki wrote:
> > > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> > >
> > > The changelog of commit 26236a3e8803 ("PM: runtime: Update last_busy
> > > before calling rpm_suspend() in rpm_idle()") stated that rpm_idle() o=
nly
> > > needed to update last_busy when it was about to call rpm_suspend(), b=
ut
> > > that is incorrect.  There are still cases in which a device may be
> > > autosuspended earlier than expected.
> > >
> > > The first one is when pm_runtime_put() is called while a leftover
> > > autosuspend timer is running.  Then, dropping the device's runtime PM
> > > usage counter to 0 allows rpm_suspend() triggered by the timer to
> > > suspend the device immediately before __pm_runtime_idle() is able to
> > > grab the spinlock.  Prevent it from occurring by adding a last_busy
> > > update before the rpm_drop_usage_count() call in __pm_runtime_idle().
> >
> > Do consumer->supplier and child->parent refcount drops have the same
> > problem? e.g., in pm_runtime_release_supplier() and rpm_suspend() /
> > parent->power.child_count decrement?
>
> I need to think about it.
>
> I don't think it affects the $subject patch anyway though.

So generally speaking, yes, they do.

In the suppliers case, that can be addressed by doing something like

pm_runtime_mark_last_busy(supplier);
smp_mb__before_atomic();
pm_runtime_put_noidle(supplier);

in every step of the loop in pm_runtime_release_supplier().

In the parent case, a similar thing would need to be done in rpm_suspend():

parent =3D dev->parent;
pm_runtime_mark_last_busy(parent);
smp_mb__before_atomic();
atomic_add_unless(&parent->power.child_count, -1, 0);

with the addition of a read-side memory barrier (see below).

> > > Another one is when rpm_idle() returns without calling rpm_suspend(),
> > > for example because the callback has returned a transient error, whil=
e
> > > an autosuspend timer is running.  The timer may then suspend the devi=
ce
> > > without respecting the autosuspend delay.  Moreover, the timer may fi=
re
> > > while the callback is running and it will not see the new last_busy
> > > value in that case.  To address these cases, move the existing
> > > pm_runtime_mark_last_busy() call in rpm_idle() before the first retur=
n
> > > value check.
> >
> > I suppose we don't care about: "what if .runtime_idle() is slow?" --
> > that makes a small delta in the expiration time.
>
> No, I don't.
>
> It is actually absent in the vast majority of cases.  And if it is
> present and it is slow, it may as well call
> pm_runtime_mark_last_busy() itself.
>
> > > In both places mentioned above add comments explaining the rationale =
for
> > > updating last_busy.
> > >
> > > Fixes: 26236a3e8803 ("PM: runtime: Update last_busy before calling rp=
m_suspend() in rpm_idle()")
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > ---
> > >
> > > Commit 26236a3e8803 is present in linux-next.
> >
> > Semi-unrelated cleanup: pm_runtime_put_sync() some stale kerneldoc now,
> > saying "this does not update the last access time".
>
> Ah, good point.
>
> > > ---
> > >  drivers/base/power/runtime.c | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtim=
e.c
> > > index 0b15c718c1bb..02e7b4953c38 100644
> > > --- a/drivers/base/power/runtime.c
> > > +++ b/drivers/base/power/runtime.c
> > > @@ -518,6 +518,14 @@ static int rpm_idle(struct device *dev, int rpmf=
lags)
> > >       else if (dev->power.idle_notification)
> > >               retval =3D -EINPROGRESS;
> > >
> > > +     /*
> > > +      * Update last_busy to defer autosuspend by the full autosuspen=
d delay.
> > > +      * Since an autosuspend timer may be running and the new last_b=
usy value
> > > +      * needs to be seen by it, update last_busy before returning an=
 error or
> > > +      * dropping the spinlock and allowing the timer function to gra=
b it.
> > > +      */
> > > +     pm_runtime_mark_last_busy(dev);
> > > +
> > >       if (retval)
> > >               goto out;
> > >
> > > @@ -563,7 +571,6 @@ static int rpm_idle(struct device *dev, int rpmfl=
ags)
> > >       if (retval)
> > >               return retval;
> > >
> > > -     pm_runtime_mark_last_busy(dev);
> > >       return rpm_suspend(dev, rpmflags | RPM_AUTO);
> > >  }
> > >
> > > @@ -1132,6 +1139,13 @@ int __pm_runtime_idle(struct device *dev, int =
rpmflags)
> > >       int retval;
> > >
> > >       if (rpmflags & RPM_GET_PUT) {
> > > +             /*
> > > +              * Once the usage counter drops to 0, a leftover autosu=
spend
> > > +              * timer may fire before the spinlock below is acquired=
.  Update
> > > +              * last_busy first so it does not find the expiration t=
ime in
> > > +              * the past and suspend the device immediately.
> > > +              */
> > > +             pm_runtime_mark_last_busy(dev);
> > >               retval =3D rpm_drop_usage_count(dev);
> >
> > This is somewhat of a pre-existing issue (e.g., in
> > pm_runtime_put_autosuspend()), but weakly ordered architectures don't
> > really enforce the dependencies you want.
> >
> > rpm_drop_usage_count() uses an atomic decrement, which has a full
> > barrier.
>
> Right, that's why the last_busy update is carried out before
> rpm_drop_usage_count().
>
> > But this is supposed to influence the rpm_suspend() behavior of
> > rpm_check_suspend_allowed() (atomic_read) + READ_ONCE(last_busy), which
> > includes only a conditional dependency and no barrier.
> >
> > https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0124r6.html
> >
> >   "Control dependencies can order prior loads against later dependent
> >   stores, however, they do not order prior loads against later dependen=
t
> >   loads. (Use memory_order_consume or memory_order_acquire if you
> >   require this behavior.)"
> >
> > So, rpm_check_suspend_allowed() should probably use
> > atomic_read_acquire(&dev->power.usage_count).
> >
> > (This is probably an extremely narrow, practically impossible issue.)
>
> Yes, this sounds nearly impossible in practice, given the number of
> branches between the usage counter read in rpm_check_suspend_allowed()
> and the last_busy check in pm_runtime_autosuspend_expiration().

It is not entirely impossible though AFAICS.

However, it is only really a concern if
pm_runtime_autosuspend_expiration() actually runs and if it actually
computes expires, so I'd rather add a read memory barrier to that
function:

smp_rmb();
expires  =3D READ_ONCE(dev->power.last_busy);

That would get the ordering between the last_busy access above and the
initial usage counter and child counter checks always right.

Well, I guess I need to redo the patch series to take all of the above
into account.
