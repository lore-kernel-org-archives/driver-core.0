Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492216;
	b=plx/9QaCCeq2iHg66b+M6QcV4vNiqSbHqP2vqJuhl0AO6HZRZOCHk7Nnht30YZ27DtUw
	 N27ZoJvILQzYKYN0DK+KCkf43YnavWdOVqkMvOzSzQ7cKM3SXQeTo+eFvmne1weSBMdmb
	 UX4clF7rTr7ci8dGZJGm4f+03vSiPKcKlalT/TiDZfG2/fX1FG8M1rSGdX7LQzQA04Tk1
	 5JJ5JaIMatF0pgitsHVif4/AQk8l+3kaWmMbb49ZQWieVjCT30akijA03l3pBbIm/MDnl
	 b3XGtCxOJNw7aOVq3jNz1KU08TufezImzfxQKYdOdsApD5lumc2CV7aP0s6bpVVOQ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492216;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zmPWh+NYf7w6PPrSZKb5ErSaLMlekSlLFc1zs9w8z0Q=;
	b=KLA51L+zyRAeoBCjZu0q8KVy7w2I9KoGZ+GKov06TqORH+dJZ1UdbO4Y0MJ6w3I/Pt8K
	 Rv7c7SFh31g0Rbu8jTRTNYc6yxuxa6LLlSOd/s+xy0+qLOw8qcSm/A0Rg9a8ZzEcuxmUX
	 InvDFN5EyYMbtF+m3ojF4CKX3zN5/05ZXXy9MXtJUytcVUmUQKR6UPyAqqRAE73rPzqdh
	 F8qG18uxPbttHRqdT+PnKcl1A9wvVN2Jfq2fRUZaX0cKoFwHs9gXVrUt9sv9ASHw8OEyl
	 STIJicIaNpqLn88MzjzrBx59xW1nLn/BKgEHnIV+QlJspE+cVCkoTbGLnhXCKOc5O+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orsbQZ0F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BFC60A261F
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orsbQZ0F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4641F00A07
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492215;
	bh=zmPWh+NYf7w6PPrSZKb5ErSaLMlekSlLFc1zs9w8z0Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=orsbQZ0Fs9Yc8FoXyxHjcSt+uJVAY+FT7P5zPQScjNFhGP+bVpgRbU3Y7B2W4r5ip
	 jYZ9/Q19ow3k5lCv00/d1zZk9ds6paCeSflAFSlCvbbLvyeiiaAW4Rq+kHZBeRW4Pp
	 bTr+jvfP6jzc6TcM/YurJSBpq5Wtu9sgabNOIxa4E1NqT7TPcCIN34HGb5mzwwhJw+
	 +BSvzMnr8Ru5liz74l5qe1mFxtxLV9B1KTq2GpRMWsDQ9w4AsJy8W1i3zy9f8H2JQ7
	 5uRyQi5gB9uowIXCvriwEaOesFmJhMU3QZ0k6xQHTxWXqVhrdlI942Gh4e9e2TUEJf
	 Eu7mfm85Zywug==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so1452066e87.2
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 06:03:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE4cBs4+ZdES5t/xZUr0JUoZGuCVnHE6FfdtlbLt8pdEHCq0YKy7L6ork0WjGcIuLW1m9RAZdPPGLQcgA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/TyW6ZPs0L6f6SjdRt2Yw4hH4ubsoqUQsabK/y1W3x8bv4QKg3
	CtXb/p0kLNj7a/x6vA+cUH+QYb5gTi6HsGXWogIdIrgyx8jN9tMZiafv2RrtauM5vt5lWQID12Y
	0sn0J6ew1xZRmHejjx5itGLRgHx++828=
X-Received: by 2002:a05:6512:1325:b0:5c1:4a5d:6ae1 with SMTP id
 2adb3069b0e04-5c15d62c5dcmr2107662e87.14.1794492214280; Thu, 12 Nov 2026
 06:03:34 -0800 (PST)
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
 <20261102-b4-pm-sleep-hibernation-fixes-v1-2-51fac96d080d@oss.qualcomm.com> <CAPx+jO86pgUXuHMPKAMKN6Tq9unxnpd9kB8eE9byZw_B=0xxyw@mail.gmail.com>
In-Reply-To: <CAPx+jO86pgUXuHMPKAMKN6Tq9unxnpd9kB8eE9byZw_B=0xxyw@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 12 Nov 2026 15:03:21 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gEDWA_zc6KTJqCPNwHt74+pt6WfBC8Ka6XCp8ZSK15HA@mail.gmail.com>
X-Gm-Features: AclHuK8e-AJ-XjrSAXBkD-hu4PMVxz0LC00YFvk3ACIuaq22lQdmQ2x0hsZZ62o
Message-ID: <CAJZ5v0gEDWA_zc6KTJqCPNwHt74+pt6WfBC8Ka6XCp8ZSK15HA@mail.gmail.com>
Subject: Re: [PATCH 2/2] PM: sleep: Do not arm wakeup IRQs for hibernation
 freeze and quiesce
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 2:46=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Mon, Nov 2, 2026 at 3:47=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.=
com> wrote:
> >
> > Freezing devices to take a hibernation image and quiescing them before
> > jumping into one go through the regular noirq suspend path, which arms
> > the wakeup IRQs of all devices that may wake up the system. A wakeup
> > IRQ firing then aborts the hibernation or the restore:
> >
> >   PM: Triggering wakeup from IRQ 180
> >   Wakeup pending. Abort CPU freeze
> >   PM: hibernation: Failed to load image, recovering.
> >
> > On a Qualcomm Glymur CRD this happens on every hibernation and every
> > restore. The WWAN modem keeps asserting WAKE# once its root port goes
> > down, after its driver has shut it down for the freeze, and the WAKE#
> > GPIO of a PCIe port is a dedicated wakeup IRQ with wakeup enabled by
> > default.
> >
> > Neither transition is one the system can be woken up from, as nothing
> > goes to sleep, and Documentation/driver-api/pm/devices.rst already says
> > that in the freeze_late and freeze_noirq phases a device "should not be
> > allowed to generate wakeup events". Do not arm the wakeup IRQs for
> > them, and only disarm them in the noirq resume path if they have been
> > armed. Wakeup IRQs are still armed for the final transition to sleep,
> > PM_EVENT_HIBERNATE, and for suspend.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>
> This seems reasonable to me, but I can't judge from a reasonably brief
> review if this is the proper place to fix this. Rafael, what do you
> think?

I think I'd do it differently, but give me some more time to think it throu=
gh.

> Nevertheless, please add:
>
> Reviewed-by: Ulf Hansson <ulfh@kernel.org>
>
> Kind regards
> Uffe
>
> > ---
> >  drivers/base/power/main.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > index 16a1f017051e..34ba0e5941a3 100644
> > --- a/drivers/base/power/main.c
> > +++ b/drivers/base/power/main.c
> > @@ -949,6 +949,9 @@ static void dpm_noirq_resume_devices(pm_message_t s=
tate)
> >         trace_suspend_resume(TPS("dpm_resume_noirq"), state.event, fals=
e);
> >  }
> >
> > +/* Whether dpm_suspend_noirq() has armed the wakeup IRQs of devices */
> > +static bool dpm_wake_irqs_armed;
> > +
> >  /**
> >   * dpm_resume_noirq - Execute "noirq resume" callbacks for all devices=
.
> >   * @state: PM transition of the system being carried out.
> > @@ -961,7 +964,11 @@ void dpm_resume_noirq(pm_message_t state)
> >         dpm_noirq_resume_devices(state);
> >
> >         resume_device_irqs();
> > -       device_wakeup_disarm_wake_irqs();
> > +
> > +       if (dpm_wake_irqs_armed) {
> > +               device_wakeup_disarm_wake_irqs();
> > +               dpm_wake_irqs_armed =3D false;
> > +       }
> >  }
> >
> >  static void async_resume_early(void *data, async_cookie_t cookie);
> > @@ -1685,7 +1692,17 @@ int dpm_suspend_noirq(pm_message_t state)
> >  {
> >         int ret;
> >
> > -       device_wakeup_arm_wake_irqs();
> > +       /*
> > +        * Freezing devices to take a hibernation image, and quiescing =
them
> > +        * before jumping into one, are not transitions the system can =
be woken
> > +        * up from, as nothing goes to sleep. A wakeup IRQ of a device =
that
> > +        * signals for attention once its link goes down, like a PCIe e=
ndpoint
> > +        * asserting WAKE#, would only abort the hibernation or the res=
tore.
> > +        */
> > +       if (state.event !=3D PM_EVENT_FREEZE && state.event !=3D PM_EVE=
NT_QUIESCE) {
> > +               device_wakeup_arm_wake_irqs();
> > +               dpm_wake_irqs_armed =3D true;
> > +       }
> >         suspend_device_irqs();
> >
> >         ret =3D dpm_noirq_suspend_devices(state);
> >
> > --
> > 2.54.0
> >
