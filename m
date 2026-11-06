Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995537;
	b=vKZPG07DzkjBibGD2fH4QsCUk3OgNY2VF18c9+Rs2fObtvXPsFR01e8zVYHw/03a8bMq
	 hzO1mX2hWKcPBY4IFZZnVSSe6L9L+aY4NjkA7hGMyyxrv8cy3HW78Q0ILNlTcIK5YzGZa
	 atFy+ZBJiwoe0Oq+bo1Ew7SgI22BO2DYiAvTGXwnhxsN7s4cmX64sdCC1xMbHIrH7Q+ra
	 YsjlhHR8+TC36Txp03j8/1WG5+mAQUOecU08XBSZE49LawlOaKkB2T/mHuH6NIDVAE/Yc
	 w8IKwlplhmrCAdBnkc5cB29J8wsteDlpB8466mZzF76capu8SNxzbmhDj2856cvSPgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995537;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=8Mw7V/0cbeSEgOWRVzam31usqXbWxTAghwJGS5x4VEQ=;
	b=ANiRXs9V110mY+KPt5oYOxqhIpyTnExO+ELTClANxowaPfVRQYVwWd0uuDpvQ2m5nIAR
	 eBt/Gy95a/mrYH0P4DkjgMbXKC6FDnUGIurCOPd3oPOPa7xtDlz+y4v+vVKQvIXei9A58
	 F+fGLsc+tuWulam4W/5twHmg/J8pMsZHK1SOvJHjKhlwXURwOZbnlaU6z6kaKBGPwT6HQ
	 xy38fU/cBEmRZWHBxAvP1Zp9RZ5dY4pC4AKyEk6JsNZTJQRagjbAzO/ESfONpkMHpVaYi
	 grABzNr4t0EwPhRVQJLcuciBuOOMau7e3SiWBEWMk7j/zp3NxeeiG9i8pZDpyo3ndJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mJQLWutE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B04606A329
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 20:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mJQLWutE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EDE1F008A3
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 20:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793995536;
	bh=8Mw7V/0cbeSEgOWRVzam31usqXbWxTAghwJGS5x4VEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mJQLWutEVebQlOiqkbO5iVmSVRWtUwVl4kJHnbIQs4UVZtdKsNwXv/1MTZSbow3lt
	 r1WdxBVS5vSxvwbChYQXRfI5S4ZCHZfW7+F0ne/drD6Bb53ZF9xVsckm3XKh261fT4
	 /Gb/U4bOwMTDg3SwyryCVCd/Jil0JTiEfcQQEFAAk4nFT6ryCVA2nCvGaXmQ5Epj6W
	 qWMmVwIswcvcs04teaW19r9axISl2RkO/ZPjbdQsznnCa2UoIdaQDFOkjMtIz5w+wE
	 MBrty+Z+4P0+fCEcV+O15hg8u0JqX2WjeD3dI6EJGZuxHra/MVnb9tZnjG82r0NoQb
	 QKFMfAYcyAOHg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be42ae8eb1so654608e87.2
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 12:05:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEXKTn4+JXKi+bQxsWto62FEgfGiK90qm52r4tf6bTAWCSI4SD1Mc15l7zTC/6vnHuOeNHd8+NrCEfOzA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+B7LUKsD9a4eF5aRXAQG+i9oXjvMnIhA1PKGF5/uQBX04a1g+a
	POVnVhbUXlgIEpaTLupuDGKLPmHPCnzuQb+NHLzPNxEHhAByNJbXbJfYKVKQkrZcy5F6vICsmfA
	Pyn2FaNt0Df1j5UazoEVJ6m9udabrbpM=
X-Received: by 2002:a05:6512:1586:b0:5bf:a352:9c25 with SMTP id
 2adb3069b0e04-5c003804e87mr1159674e87.5.1793995534685; Fri, 06 Nov 2026
 12:05:34 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-b4-pm-sleep-hibernation-fixes-v1-0-51fac96d080d@oss.qualcomm.com>
 <20261102-b4-pm-sleep-hibernation-fixes-v1-1-51fac96d080d@oss.qualcomm.com> <CAJZ5v0i4ZpQJQ_9kgfdT=h=UQj6L83G4d3_eqtxLGhjidwLr-A@mail.gmail.com>
In-Reply-To: <CAJZ5v0i4ZpQJQ_9kgfdT=h=UQj6L83G4d3_eqtxLGhjidwLr-A@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 6 Nov 2026 21:05:21 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g3zU51Q4sQvmTNH-Jtycu1D5Qm9c6r2t_DCp03ePzV-g@mail.gmail.com>
X-Gm-Features: AclHuK9ffEJOtXbm6XH9DB_bSh2KJbZwL0soeflK3rXbvjZmu6oY38SsaZSSydI
Message-ID: <CAJZ5v0g3zU51Q4sQvmTNH-Jtycu1D5Qm9c6r2t_DCp03ePzV-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] PM: sleep: Do not mark devices without PM callbacks
 active on resume
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Pavel Machek <pavel@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000092f9ab065fa122f5"

--00000000000092f9ab065fa122f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:46=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Mon, Nov 2, 2026 at 3:47=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.=
com> wrote:
> >
> > Devices without system sleep callbacks get power.smart_suspend set in
> > device_prepare_smart_suspend(), unless their parent or a supplier
> > prevents it, so device_resume_noirq() sets their runtime PM status to
> > "active" whenever dev_pm_skip_resume() returns false. That is always
> > the case for PM_EVENT_RESTORE.
> >
> > Nothing resumes such a device, though.
>
> Too bad because it should be resumed in the "restore" phase of
> hibernation.  The concept of keeping devices in runtime suspend across
> hibernation is just fundamentally broken.

But if this happens to work somehow, then oh well.

> > If its bus or driver manages
> > resources from runtime PM callbacks, those resources stay off while the
> > device is now reported as active, and the next runtime suspend releases
> > them a second time.
> >
> > AMBA devices are an example, since the AMBA bus only has runtime PM
> > callbacks, which enable and disable the APB clock. After restoring from
> > hibernation on a Qualcomm Glymur CRD, the runtime-suspended CoreSight
> > devices are marked active, and the following runtime suspend of each of
> > them hits:
> >
> >   qdss already disabled
> >   WARNING: drivers/clk/clk.c:1259 at clk_core_disable+0xa4/0xac
> >   Call trace:
> >    clk_core_disable+0xa4/0xac (P)
> >    clk_disable+0x30/0x4c
> >    amba_pm_runtime_suspend+0x58/0x74
> >    __rpm_callback+0x48/0x1e0
> >    rpm_callback+0x58/0x64
> >    rpm_suspend+0x10c/0x5a4
> >    pm_runtime_work+0xc8/0xd8
> >
> > followed by "qdss already unprepared".
> >
> > On suspend-to-RAM this does not happen, because such devices take the
> > direct_complete path and device_resume_noirq() returns early for them.
> >
> > Leave the runtime PM status of devices without PM callbacks as it is.
>
> If I'm not mistaken, doing so may break the cases in which a device
> without PM callbacks and runtime PM enabled is the parent of a device
> with smart_suspend set because there will be a runtime-active device
> under a runtime-suspended parent.

So yeah, smart_suspend should not be set for devices with existing
runtime PM callbacks even if they have no system-wide PM callbacks.

Please try the attached patch (untested).

> > Fixes: bca84a7b93fd ("PM: sleep: Use DPM_FLAG_SMART_SUSPEND conditional=
ly")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  drivers/base/power/main.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > index 88a31e09e4f3..16a1f017051e 100644
> > --- a/drivers/base/power/main.c
> > +++ b/drivers/base/power/main.c
> > @@ -839,10 +839,15 @@ static void device_resume_noirq(struct device *de=
v, pm_message_t state, bool asy
> >          * Otherwise, the device is going to be resumed, so set its PM-=
runtime
> >          * status to "active" unless its power.smart_suspend flag is cl=
ear, in
> >          * which case it is not necessary to update its PM-runtime stat=
us.
> > +        *
> > +        * A device without system sleep callbacks is not going to be r=
esumed
> > +        * by anyone, though, so leave its PM-runtime status as is. Oth=
erwise,
> > +        * resources managed by its runtime PM callbacks, like the bus =
clock of
> > +        * an AMBA device, would end up unbalanced on the next runtime =
suspend.
> >          */
> >         if (skip_resume)
> >                 pm_runtime_set_suspended(dev);
> > -       else if (dev_pm_smart_suspend(dev))
> > +       else if (dev_pm_smart_suspend(dev) && !dev->power.no_pm_callbac=
ks)
> >                 pm_runtime_set_active(dev);
> >
> >         if (dev->pm_domain) {
> >
> > --
> > 2.54.0
> >

--00000000000092f9ab065fa122f5
Content-Type: text/x-patch; charset="US-ASCII"; name="pm-sleep-no-callbacks.patch"
Content-Disposition: attachment; filename="pm-sleep-no-callbacks.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mw5eizf70>
X-Attachment-Id: f_mw5eizf70

LS0tCiBkcml2ZXJzL2Jhc2UvcG93ZXIvbWFpbi5jICAgIHwgICAgNSArKystLQogZHJpdmVycy9i
YXNlL3Bvd2VyL3Bvd2VyLmggICB8ICAgIDQgKysrKwogZHJpdmVycy9iYXNlL3Bvd2VyL3J1bnRp
bWUuYyB8ICAgIDYgKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgotLS0gYS9kcml2ZXJzL2Jhc2UvcG93ZXIvbWFpbi5jCisrKyBiL2RyaXZl
cnMvYmFzZS9wb3dlci9tYWluLmMKQEAgLTIxNzksMTMgKzIxNzksMTQgQEAgc3RhdGljIGJvb2wg
ZGV2aWNlX3ByZXBhcmVfc21hcnRfc3VzcGVuZAogCiAJLyoKIAkgKiBUaGUgInNtYXJ0IHN1c3Bl
bmQiIGZlYXR1cmUgaXMgZW5hYmxlZCBmb3IgZGV2aWNlcyB3aG9zZSBkcml2ZXJzIGFzawotCSAq
IGZvciBpdCBhbmQgZm9yIGRldmljZXMgd2l0aG91dCBQTSBjYWxsYmFja3MuCisJICogZm9yIGl0
IGFuZCBmb3IgZGV2aWNlcyB3aXRob3V0IGFueSBQTSBjYWxsYmFja3MgKGluY2x1ZGluZyBydW50
aW1lIFBNCisJICogY2FsbGJhY2tzKS4KIAkgKgogCSAqIEhvd2V2ZXIsIGlmICJzbWFydCBzdXNw
ZW5kIiBpcyBub3QgZW5hYmxlZCBmb3IgdGhlIGRldmljZSdzIHBhcmVudAogCSAqIG9yIGFueSBv
ZiBpdHMgc3VwcGxpZXJzIHRoYXQgdGFrZSBydW50aW1lIFBNIGludG8gYWNjb3VudCwgaXQgY2Fu
bm90CiAJICogYmUgZW5hYmxlZCBmb3IgdGhlIGRldmljZSBlaXRoZXIuCiAJICovCi0JaWYgKCFk
ZXYtPnBvd2VyLm5vX3BtX2NhbGxiYWNrcyAmJgorCWlmICgoIWRldi0+cG93ZXIubm9fcG1fY2Fs
bGJhY2tzIHx8IHBtX3J1bnRpbWVfY2FsbGJhY2tzX2V4aXN0KGRldikpICYmCiAJICAgICFkZXZf
cG1fdGVzdF9kcml2ZXJfZmxhZ3MoZGV2LCBEUE1fRkxBR19TTUFSVF9TVVNQRU5EKSkKIAkJcmV0
dXJuIGZhbHNlOwogCi0tLSBhL2RyaXZlcnMvYmFzZS9wb3dlci9wb3dlci5oCisrKyBiL2RyaXZl
cnMvYmFzZS9wb3dlci9wb3dlci5oCkBAIC0xMzEsNiArMTMxLDggQEAgZXh0ZXJuIHZvaWQgd2Fr
ZXVwX3NvdXJjZV9zeXNmc19yZW1vdmUocwogCiBleHRlcm4gaW50IHBtX3dha2V1cF9zb3VyY2Vf
c3lzZnNfYWRkKHN0cnVjdCBkZXZpY2UgKnBhcmVudCk7CiAKK2V4dGVybiBib29sIHBtX3J1bnRp
bWVfY2FsbGJhY2tzX2V4aXN0KHN0cnVjdCBkZXZpY2UgKmRldik7CisKICNlbHNlIC8qICFDT05G
SUdfUE1fU0xFRVAgKi8KIAogc3RhdGljIGlubGluZSB2b2lkIGRldmljZV9wbV9zbGVlcF9pbml0
KHN0cnVjdCBkZXZpY2UgKmRldikge30KQEAgLTE2MCw2ICsxNjIsOCBAQCBzdGF0aWMgaW5saW5l
IGludCBwbV93YWtldXBfc291cmNlX3N5c2ZzCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbmxp
bmUgYm9vbCBwbV9ydW50aW1lX2NhbGxiYWNrc19leGlzdChzdHJ1Y3QgZGV2aWNlICpkZXYpIHsg
cmV0dXJuIGZhbHNlOyB9CisKICNlbmRpZiAvKiAhQ09ORklHX1BNX1NMRUVQICovCiAKIHN0YXRp
YyBpbmxpbmUgdm9pZCBkZXZpY2VfcG1faW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYpCi0tLSBhL2Ry
aXZlcnMvYmFzZS9wb3dlci9ydW50aW1lLmMKKysrIGIvZHJpdmVycy9iYXNlL3Bvd2VyL3J1bnRp
bWUuYwpAQCAtMjEzNiw0ICsyMTM2LDEwIEBAIGJvb2wgcG1fcnVudGltZV9uZWVkX25vdF9yZXN1
bWUoc3RydWN0IGQKIAkJIGRldi0+cG93ZXIuaWdub3JlX2NoaWxkcmVuKTsKIH0KIAorYm9vbCBw
bV9ydW50aW1lX2NhbGxiYWNrc19leGlzdChzdHJ1Y3QgZGV2aWNlICpkZXYpCit7CisJcmV0dXJu
ICFkZXYtPnBvd2VyLm5vX2NhbGxiYWNrcyAmJiAoR0VUX0NBTExCQUNLKGRldiwgcnVudGltZV9y
ZXN1bWUpIHx8CisJCUdFVF9DQUxMQkFDSyhkZXYsIHJ1bnRpbWVfc3VzcGVuZCkpOworfQorCiAj
ZW5kaWYgLyogQ09ORklHX1BNX1NMRUVQICovCg==
--00000000000092f9ab065fa122f5--
