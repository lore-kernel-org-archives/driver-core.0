Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189707;
	b=Ck/by1djokdGQ2c++Rwj0X1+tvZ4itg5adATid0ebODOdKNiAeqQhAtQpwZ9DeRMVWzJ
	 s1Sy9tdzHdeLj62kRUgEYvvFHaj2rOswIjIxMR03gKqxnhERp/rXfqBhLov7LujTFVpbK
	 pJFDb9QNYn2vjVy3eQ2N9FCo4tM5E6ZJ8e/tOHQGT68yyRqIKUatZjFIFnJEkTSC+Juyg
	 4lg1NvqNu04GmquOLn7EeA4fFGVQl57MiGiaHr0rLfQaxXR25mdmnp0DDuXQAiwHio0Ma
	 iKpXV98rvFzzgLVXNNIE0svBOLJ6J61e2fKUmWjwXUW4RIj968du3FvetAUun04+TgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189707;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uoCLXlIyzTuVjcKkec7UtFiflj2Avxbg288tSQZ5p04=;
	b=GCMvkhDfKrz6HVNfo21fuE8HiWY5RfQdAdMJbb/w92yQMe+1SRhouAwp7OMZjizxm0He
	 JHe/9kkOyyd+Vv2oeFp7Y64ckr/sK/MQLiokcVsY1JPV2AZ3lVxHc93ly71eQynMjMyM/
	 99jtS1Te4TthU5eRVPospzpnf9elIy1XosoNtEC2HOmMj71Fz7FdCQ/H4vybw35CPt5f3
	 +qt3wYKCABlGtKjp0K7lWexqAc3xYMmxbYFAhvvQ5yeMAkZLkP4YPIneNrUUGQV3byiCb
	 luQKUqUGQvxAP6pP5BedRzMryepYnb0rRepbdwGRafvFflfOh9BLs0UV6UYJb3e1yTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQh0VJwT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AC1606A325
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQh0VJwT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC791F000EB
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 15:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189707;
	bh=uoCLXlIyzTuVjcKkec7UtFiflj2Avxbg288tSQZ5p04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nQh0VJwTgDgdrEhJmK1lo+HQXM7C78ahzsguFe+Ayghpa8C8GxU32GQIIq8lSPBr2
	 tBRZEbSLo0q/x+kPfxKl6d/xHuBTZKbvUODjOpS1KQvWvDeUBmg1fyv+6vGiwcgSjZ
	 0XYwchPNFp0yZSMwrckMI5nv/rLvUvhAKvBBOY8odnSvX+IZJZkdS98nAcaQk1/I2m
	 VuCVJQ5ZidOry1A4ewKgBpbnqRr2KaWmOUoHBpXsLMnRH+mglNymSRw9SXuptPkywM
	 ISAOoSPlvOSr1TsLcIlRO4KJoB9aA04LDI/ms2XPczGEcORqCwYe9kbdzvt93ue/s8
	 /AI2GHYgWKeJQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae81ae52ffso6828771fa.2
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 07:48:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEwY8EOBtRFDHKRL+vTYuJPO/MdvhdiBchTdaZqMrGrfulNmdEHlr4JD//z6X1mSPpusI+IOAds3jvYBQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/RDGVqw1yRJb4lOgSg3xAGd4q/c8py5Oip7+GMTUtA8CCG25C4
	VIf2Ww+hc06kQdl0Yp98PaY47dnbWTbC4Rl52yycypzSj+1lN2n4wtWQe2NOq7MmP1Te1hTDEKd
	9Cujv2d8adjgBZ6x/xmVPyW0ujpOEToY=
X-Received: by 2002:a2e:ac0c:0:b0:3a9:811d:3a58 with SMTP id
 38308e7fff4ca-3ae7f9da2admr11520241fa.14.1795189705315; Fri, 20 Nov 2026
 07:48:25 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-pm-clk-resume-report-errors-v1-1-ba6e1dddd522@oss.qualcomm.com>
 <CAFEp6-3GKHmc4y_mTTVMO6iPdnpmxEmRokpki4uVGoBuXTj6Hg@mail.gmail.com>
In-Reply-To: <CAFEp6-3GKHmc4y_mTTVMO6iPdnpmxEmRokpki4uVGoBuXTj6Hg@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 16:48:11 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hftga=t4QGoc8C3iY-zVYwewXi9BK3xnEdTm5KuOsNOQ@mail.gmail.com>
X-Gm-Features: Aa3M54q_rzvZFVXpc28f17CurETrF5JEsNbmkva9b4j9EDron5Ym5vF04rjyMSA
Message-ID: <CAJZ5v0hftga=t4QGoc8C3iY-zVYwewXi9BK3xnEdTm5KuOsNOQ@mail.gmail.com>
Subject: Re: [PATCH] PM: clk: Report clock enable failures from pm_clk_resume()
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Pavel Machek <pavel@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:37=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Mon, Nov 2, 2026 at 11:23=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm=
.com> wrote:
> >
> > pm_clk_resume() logs a clock that fails to start but always returns
> > success, so the runtime resume of a device using the PM clock helpers
> > succeeds without its clocks, and its driver goes on and accesses the
> > hardware.
> >
> > This happens to the devices in the Qualcomm LPASS, whose clocks are
> > provided by the ADSP: after the ADSP is gone, like right after a
> > hibernation image is restored, a sound card opened by user space
> > resumes the LPASS LPI pin controller without clocks, and the access to
> > its registers then brings the whole machine down:
> >
> >   qcom-prm gprsvc:service:2:2: CMD timeout for [100100f] opcode
> >   qcom-sm8550-lpass-lpi-pinctrl 6e80000.pinctrl: __pm_clk_enable: faile=
d to enable clk 00000000b90a5151, error -110
> >
> > Stop at the first clock that fails to start, stop the ones started
> > before it, and return the error, so that the resume fails and the
> > device stays suspended with its clocks off.
> >
> > The callers of pm_clk_resume() check what it returns, including genpd
> > and pm_clk_runtime_resume(), except the MMP2 audio clock controller,
> > which keeps ignoring it. A device with a clock that fails to start no
> > longer resumes though, even if it used to work without that clock.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Applied as 7.5 material, thanks!

> > ---
> > pm_clk_resume() always returns success, even when a clock fails to
> > start, so a device using the PM clock helpers resumes without its clock=
s
> > and its driver goes on accessing the hardware.
> >
> > I hit this on the Qualcomm Hamoa CRD while working on hibernation: the =
LPASS
> > devices get their clocks from the ADSP, and when the ADSP is gone, like
> > right after a hibernation image is restored, a sound card opened by use=
r
> > space resumes the LPASS LPI pin controller without clocks and the whole
> > machine resets on the first register access. With this patch, the
> > resume fails, the open fails, and the machine stays up until the ADSP i=
s
> > restarted.
> >
> > The LPASS macro drivers already check what pm_clk_resume() returns, but
> > never saw an error so far.
> >
> > Prepared with help from an LLM-based assistant.
> > ---
> >  drivers/base/power/clock_ops.c | 56 ++++++++++++++++++++++++++++++----=
--------
> >  1 file changed, 40 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_=
ops.c
> > index 3b8ba27802a8..a978eb3d5479 100644
> > --- a/drivers/base/power/clock_ops.c
> > +++ b/drivers/base/power/clock_ops.c
> > @@ -143,8 +143,10 @@ static void pm_clk_op_unlock(struct pm_subsys_data=
 *psd, unsigned long *flags)
> >   * __pm_clk_enable - Enable a clock, reporting any errors
> >   * @dev: The device for the given clock
> >   * @ce: PM clock entry corresponding to the clock.
> > + *
> > + * Return: 0 on success or the error from enabling the clock.
> >   */
> > -static inline void __pm_clk_enable(struct device *dev, struct pm_clock=
_entry *ce)
> > +static inline int __pm_clk_enable(struct device *dev, struct pm_clock_=
entry *ce)
> >  {
> >         int ret;
> >
> > @@ -156,13 +158,29 @@ static inline void __pm_clk_enable(struct device =
*dev, struct pm_clock_entry *ce
> >                 ret =3D clk_enable(ce->clk);
> >                 break;
> >         default:
> > -               return;
> > +               return 0;
> >         }
> >         if (!ret)
> >                 ce->status =3D PCE_STATUS_ENABLED;
> >         else
> >                 dev_err(dev, "%s: failed to enable clk %p, error %d\n",
> >                         __func__, ce->clk, ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static inline void __pm_clk_disable(struct pm_clock_entry *ce)
> > +{
> > +       if (ce->status !=3D PCE_STATUS_ENABLED)
> > +               return;
> > +
> > +       if (ce->enabled_when_prepared) {
> > +               clk_disable_unprepare(ce->clk);
> > +               ce->status =3D PCE_STATUS_ACQUIRED;
> > +       } else {
> > +               clk_disable(ce->clk);
> > +               ce->status =3D PCE_STATUS_PREPARED;
> > +       }
> >  }
> >
> >  /**
> > @@ -483,17 +501,8 @@ int pm_clk_suspend(struct device *dev)
> >         if (ret)
> >                 return ret;
> >
> > -       list_for_each_entry_reverse(ce, &psd->clock_list, node) {
> > -               if (ce->status =3D=3D PCE_STATUS_ENABLED) {
> > -                       if (ce->enabled_when_prepared) {
> > -                               clk_disable_unprepare(ce->clk);
> > -                               ce->status =3D PCE_STATUS_ACQUIRED;
> > -                       } else {
> > -                               clk_disable(ce->clk);
> > -                               ce->status =3D PCE_STATUS_PREPARED;
> > -                       }
> > -               }
> > -       }
> > +       list_for_each_entry_reverse(ce, &psd->clock_list, node)
> > +               __pm_clk_disable(ce);
> >
> >         pm_clk_op_unlock(psd, &flags);
> >
> > @@ -504,6 +513,9 @@ EXPORT_SYMBOL_GPL(pm_clk_suspend);
> >  /**
> >   * pm_clk_resume - Enable clocks in a device's PM clock list.
> >   * @dev: Device to enable the clocks for.
> > + *
> > + * Return: 0 on success or a negative error code. If a clock fails to =
start,
> > + * the clocks started before it are stopped again.
> >   */
> >  int pm_clk_resume(struct device *dev)
> >  {
> > @@ -521,12 +533,24 @@ int pm_clk_resume(struct device *dev)
> >         if (ret)
> >                 return ret;
> >
> > -       list_for_each_entry(ce, &psd->clock_list, node)
> > -               __pm_clk_enable(dev, ce);
> > +       list_for_each_entry(ce, &psd->clock_list, node) {
> > +               ret =3D __pm_clk_enable(dev, ce);
> > +               if (ret)
> > +                       break;
> > +       }
> > +
> > +       /*
> > +        * A device whose clocks are not running cannot be accessed. Do=
 not
> > +        * pretend it resumed, and leave its clocks off as it stays sus=
pended.
> > +        */
> > +       if (ret) {
> > +               list_for_each_entry_continue_reverse(ce, &psd->clock_li=
st, node)
> > +                       __pm_clk_disable(ce);
> > +       }
> >
> >         pm_clk_op_unlock(psd, &flags);
> >
> > -       return 0;
> > +       return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(pm_clk_resume);
> >
> >
> > ---
> > base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> > change-id: 20261029-pm-clk-resume-report-errors-b5d538eb27de
> >
> > Best regards,
> > --
> >
> > Abel
> >
> >
