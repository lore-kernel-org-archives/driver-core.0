Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFC93AE195
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778664969; cv=pass; b=N/1PLJQSkRKOcRGoNQpaXb2XKncxsvAVGtlPMdXgtHzv2GXUXNWVi04fBLa18I0wqyV1/EP64gCnxyhghM7JAi2KrjIzAC91qFYMDkWn+401Sw0NApxT3lr8j/wpq2tCf3tIOxhh0Z6AKK6KNlSp/m7q6x6RIGBm0+YAvoZUrqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778664969; c=relaxed/simple;
	bh=RzUMPv6r/rKoIp290Tl6Mj7eJ9v2yVzdqkKUQW30a/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4WpaoBG1sqIn8gRRLnu1tZcRe/cnbKBwC4ZWItxGHAq1EiElc+yFIugJ32lmB0KFhZTmljC230+vKW+3bi4a4SaBvYcVmLxau5me/+c0tHABrnycFnOsBAQTcY+TDjdcnNKfNFPTSoJeX3xnoJNuR9/SckwkdwG8Tu4kP+jDT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N45basF4; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N45basF4"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso3158254e87.1
        for <driver-core@lists.linux.dev>; Wed, 13 May 2026 02:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778664965; cv=none;
        d=google.com; s=arc-20240605;
        b=I8SAHgKf5vycA4D+XFD+PyRjYl0obH2Pb00/NgvxCzSJdjtCBYtCbPukTp8AYccVOz
         7Wz44u/Lg+RTiUudpi0nDTJeGoG2YGwf/rodZ0L+MrDNJieTMEBhLmh4qjfTFnZFTnPU
         QJedoHY/PiaOBg8/lLQjW0L7poccgDFq7pzXDMtyTb3WN650hUBO5/aK0PWM4S+d5RNC
         YtFSsHfPd5nPIRPWQJb6H2Qouxghw+wqD393kz1qa42kdsR7SHvwgN3GDO8cnr7uIvGj
         /Un7cELOTpUr+jXGkEpodN3GXP0WbDYsLRBzDj2/9rq8iAV8Y+s8K9Beiy2Go5MdO3ec
         h3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h6g1TzJ4Yla0n487BRKqhfmrS5E8XKAE9jcIzzkGbR4=;
        fh=OScLK/JfgjdKPCvyo2y3bVI94iPdPiX0gadj0cFJxe4=;
        b=cKMqMaHGGtSJy2P6vv1rmtUi+kkDyTSKmaF36HKCZBjLiiyOlrEugVHfHDr6OXDZ08
         r1+TMZRoD7OnMGillj20MlmsbaMzE8P01WcvgrrveP2Kuz8hR8E7aVw88yaKlRvWNU2b
         /4t3i5PnJR2I6dTU1CNr77KKOfeel3bjl3AKcQvSbo4ll+KE0s+/skPf6KOAjMo6bsWJ
         rXve5tYQdpsd0ldgsRrO6qN/ERqwsIASVcmBdRqHKICqwa2QpmjTiSGy4IWfC59CJ8wt
         EdSpY2a8FGPdSRCv8pLmJ6eXNDGErakF+ifOFHS/dNYQjGckBAyRO3pmCLpCB5S/VajT
         oCAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778664965; x=1779269765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6g1TzJ4Yla0n487BRKqhfmrS5E8XKAE9jcIzzkGbR4=;
        b=N45basF4IG3F60z0YtM1thgi8Ly5x20cuorZrFjmgTwecejR4pOYuLrCEi9D+tkEY7
         Gi7xABI6aAmuw+CgluyRAPrxxVzM1DXt+xuCiVrYzhIS9Cqr2uJBHCEvJr6csiK01u1X
         z2yC/k8RvhTMA89RwERK4irv5ypgbbNobUpRIeZCnlmqHEEwF/U9QjMFSnVAj1Z6+NAB
         sESdP1MFXmer1YQFeo/Sse5WuA4CufxLM/aGOijjdhwibVDR1qWhAD78ajUH5vAHt/un
         hkQF6XLrOTzwpkZU3TCbtpbR3WJ3mqKHPzAWjHtgJsprmIQwZIKvqvZ3hENBM65eqETB
         VVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778664965; x=1779269765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h6g1TzJ4Yla0n487BRKqhfmrS5E8XKAE9jcIzzkGbR4=;
        b=Cp06mYPZ+eirD9l0iBQ4YFoRtwUowPNU1TnujivX3Ue6BeWRe5cHHX7VRQ408zoGq4
         2l0/6kndlnwkjAOErfpJ6hoxyK/WubvILsgDaRpiNBYcH3P+eNaAKERab2XWeixOkYFX
         loKRxGlOgVEIyWM6V0Qao92DDVEppjrUZbQDTcw3GysZ+ZjzCjHGa6rEHfxMpq4f31X5
         ph1WUn4lA3kpJ8WdiCWbMbnN/Ksts1y9nL+KS8ASn60LaVjjSViAXT0vUoHqEuK3PYmp
         8wcN3lTeaJ+xsIfeWeYZKmlGxJTL1dXFrxzXKl3bk0Z3UER7QVaOgH7t19ZIRqUxNTVd
         2g+A==
X-Forwarded-Encrypted: i=1; AFNElJ+f2R3dKaaCGY8woUVfJM+GZmiDZvL3nkervQIEnyqh7iU5TD0U2G/JuEZNbRF43e+UPnEeOwjOE+VkUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgpqeFrMBBjHBxzMihOZW9WdG3NrmnpH1k9bCqxmrcFiz37PcK
	u4T7eYoHUoMqp4CtDiY55ibYgY7r/hPVxpwPkT90vy4GM+PyWfXbaNudSKmltJSn/hJr3ooXhEe
	+QkLgdbaoqo6fLW4PD5ZACf22djpwm/ZQmhH1Im1iQQ==
X-Gm-Gg: Acq92OGzQ+pbqX7DOwrwWS3QWoc4725RRvD4KgiOaa1WGd9p5cBLBHVJ9ZkL628yv5a
	jY3y6SSSyk5XttEDZRjG5zGFVt4/6rQNHMrn5P5HnYvYMc7dTf8z5ETu+gHx+Y7pLnc0xTENrde
	B8pymC5jSrwXwxkIgrF8SGsG8XfemVZmRB+s3Yl8msB6ebRcrevmVy2/rEWYwAp392rMM1fuIrm
	CbanRAkvIj+ZJ7pMRxsBoPW+3lXNbd+pLRdA5spIW8IpxGXeEHjXt8fyAkDIkcP3FwzeSqVNFsQ
	PvQjl+GGrXZ+GHay0tC3UBM7kyAmhLjEkF/co3DT
X-Received: by 2002:ac2:5393:0:b0:5a8:7be1:24c8 with SMTP id
 2adb3069b0e04-5a8f445a568mr535293e87.37.1778664964965; Wed, 13 May 2026
 02:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
 <20260508123910.114273-7-ulf.hansson@linaro.org> <CACRMN=cowCsGb3x=tPOWLYdittwLCsSb2N2SXVPyxBRHThGAVg@mail.gmail.com>
 <CAPDyKFoxJ8AOyqzbEQc8x-e5fRf0p3faE23PRNcbA4aPSY_cdg@mail.gmail.com> <CACRMN=cyMjHtW1xjoYPWa8_TjmQEoJBvKtMo-UgP5yZJ=zDh2Q@mail.gmail.com>
In-Reply-To: <CACRMN=cyMjHtW1xjoYPWa8_TjmQEoJBvKtMo-UgP5yZJ=zDh2Q@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 13 May 2026 11:35:28 +0200
X-Gm-Features: AVHnY4IzKoe6a2cBcqyN4-jiFGnUP2nLjCxHHGdzcUZBmXtWGxkjvR6gecTMjR0
Message-ID: <CAPDyKFo4yoxGtvKNzCfTY0tOwPPxo+Ub7=VvCKtVPr3M31o=YA@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] pmdomain: core: Add initial fine grained
 sync_state support
To: Saravana Kannan <saravanak@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 May 2026 at 07:34, Saravana Kannan <saravanak@kernel.org> wrote:
>
> On Mon, May 11, 2026 at 3:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Mon, 11 May 2026 at 07:09, Saravana Kannan <saravanak@kernel.org> wr=
ote:
> > >
> > > On Fri, May 8, 2026 at 5:39=E2=80=AFAM Ulf Hansson <ulf.hansson@linar=
o.org> wrote:
> > > >
> > > > A onecell (#power-domain-cells =3D <1 or 2>; in DT) power domain pr=
ovider
> > > > typically provides multiple independent power domains, each with th=
eir own
> > > > corresponding consumers. In these cases we have to wait for all con=
sumers
> > > > for all the provided power domains before the ->sync_state() callba=
ck gets
> > > > called for the supplier.
> > > >
> > > > In a first step to improve this, let's implement support for fine g=
rained
> > > > sync_state support a per genpd basis by using the ->queue_sync_stat=
e()
> > > > callback. To take step by step, let's initially limit the improveme=
nt to
> > > > the internal genpd provider driver and to its corresponding genpd d=
evices
> > > > for onecell providers.
> > > >
> > > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > ---
> > > >
> > > > Changes in v3:
> > > >         - Addressed some cosmetic comments from Geert.
> > > >
> > > > ---
> > > >  drivers/pmdomain/core.c   | 124 ++++++++++++++++++++++++++++++++++=
++++
> > > >  include/linux/pm_domain.h |   1 +
> > > >  2 files changed, 125 insertions(+)
> > > >
> > > > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > > > index ad57846f02a3..c01a9a96e5c2 100644
> > > > --- a/drivers/pmdomain/core.c
> > > > +++ b/drivers/pmdomain/core.c
> > > > @@ -2699,6 +2699,119 @@ static struct generic_pm_domain *genpd_get_=
from_provider(
> > > >         return genpd;
> > > >  }
> > > >
> > > > +static bool genpd_should_wait_for_consumer(struct device_node *np)
> > > > +{
> > > > +       struct generic_pm_domain *genpd;
> > > > +       bool should_wait =3D false;
> > > > +
> > > > +       mutex_lock(&gpd_list_lock);
> > > > +       list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> > > > +               if (genpd->provider =3D=3D of_fwnode_handle(np)) {
> > > > +                       genpd_lock(genpd);
> > > > +
> > > > +                       /* Clear the previous state before reevalua=
ting. */
> > > > +                       genpd->wait_for_consumer =3D false;
> > > > +
> > > > +                       /*
> > > > +                        * Unless there is at least one genpd for t=
he provider
> > > > +                        * that is being kept powered-on, we don't =
have to care
> > > > +                        * about waiting for consumers.
> > > > +                        */
> > > > +                       if (genpd->stay_on)
> > > > +                               should_wait =3D true;
> > > > +
> > > > +                       genpd_unlock(genpd);
> > > > +               }
> > > > +       }
> > > > +       mutex_unlock(&gpd_list_lock);
> > >
> > > I think I understand the intent of this function, but haven't dug int=
o
> > > genpd code enough to comment on this yet. I'll come back to this
> > > later.
> > >
> > > > +
> > > > +       return should_wait;
> > > > +}
> > > > +
> > > > +static void genpd_parse_for_consumer(struct device_node *sup,
> > > > +                                    struct device_node *con)
> > > > +{
> > > > +       struct generic_pm_domain *genpd;
> > > > +
> > > > +       for (unsigned int i =3D 0; ; i++) {
> > > > +               struct of_phandle_args pd_args;
> > > > +
> > > > +               if (of_parse_phandle_with_args(con, "power-domains"=
,
> > > > +                                              "#power-domain-cells=
",
> > > > +                                              i, &pd_args))
> > > > +                       break;
> > >
> > > Why not use a while or a do while() instead of this infinite for loop
> > > with a break?
> >
> > I guess it's a matter of personal preference. I'm not sure the code
> > gets any nicer with a do/while, but if you really insist I can change
> > it.
> >
> > >
> > > > +
> > > > +               /*
> > > > +                * The phandle must correspond to the supplier's ge=
npd provider
> > > > +                * to be relevant else let's move to the next index=
.
> > > > +                */
> > > > +               if (sup !=3D pd_args.np) {
> > > > +                       of_node_put(pd_args.np);
> > > > +                       continue;
> > > > +               }
> > > > +
> > > > +               mutex_lock(&gpd_list_lock);
> > > > +               genpd =3D genpd_get_from_provider(&pd_args);
> > > > +               if (!IS_ERR(genpd)) {
> > > > +                       genpd_lock(genpd);
> > > > +                       genpd->wait_for_consumer =3D true;
> > > > +                       genpd_unlock(genpd);
> > > > +               }
> > > > +               mutex_unlock(&gpd_list_lock);
> > > > +
> > > > +               of_node_put(pd_args.np);
> > > > +       }
> > > > +}
> > > > +
> > > > +static void _genpd_queue_sync_state(struct device_node *np)
> > > > +{
> > > > +       struct generic_pm_domain *genpd;
> > > > +
> > > > +       mutex_lock(&gpd_list_lock);
> > > > +       list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> > > > +               if (genpd->provider =3D=3D of_fwnode_handle(np)) {
> > > > +                       genpd_lock(genpd);
> > > > +                       if (genpd->stay_on && !genpd->wait_for_cons=
umer) {
> > > > +                               genpd->stay_on =3D false;
> > > > +                               genpd_queue_power_off_work(genpd);
> > > > +                       }
> > > > +                       genpd_unlock(genpd);
> > > > +               }
> > > > +       }
> > > > +       mutex_unlock(&gpd_list_lock);
> > > > +}
> > > > +
> > > > +static void genpd_queue_sync_state(struct device *dev)
> > > > +{
> > > > +       struct device_node *np =3D dev->of_node;
> > > > +       struct device_link *link;
> > > > +
> > > > +       if (!genpd_should_wait_for_consumer(np))
> > > > +               return;
> > > > +
> > > > +       list_for_each_entry(link, &dev->links.consumers, s_node) {
> > >
> > > Couple of issues:
> > > 1. I don't want the frameworks to be so deeply aware of driver core
> > > internals. I want the driver core maintainers to be able to change th=
e
> > > devlink implementation without having to worry about going and fixing
> > > all the frameworks. So, please add a for_each_consumer_dev(supplier,
> > > callback) and for_each_supplier_dev(consumer, callback) helper
> > > functions.
> >
> > I understand your concern and I like the idea. However, maybe it's
> > better to get this landed (the series is complicated as is) first and
> > then can continue to improve the code on top, with helper functions
> > etc.
>
> That patch should be pretty simple, so let's just do it? You are
> literally just moving the code to another file and massaging it a bit.
> I can send one out if you want/

Okay, I will fold in a patch into my series that adds the helper. No
point you sending it as it needs to be apart of my series to have a
user for it.

>
> > >
> > > 2. This doesn't ignore "SYNC_STATE_ONLY" links and that's going to
> > > confuse the consumer count/check you might do or at the least waste
> > > parsing those.
> >
> > I am not sure I understand how I should take SYNC_STATE_ONLY links
> > into account here.
> >
> > At each call to the genpd_queue_sync_state(), we walk through all the
> > provided genpds for the provider. No previous state is cached to track
> > consumer counts.
>
> Ok, correct me if I'm wrong here, but it looks like you are looking at
> all the consumers, finding the ones that haven't probed yet and then
> trying to see which specific genpd provider each one of them is using
> by parsing their dt properties and then keep those ON.

The code cares only about the genpd OF provider that the supplier
device belongs to, if any. Any other genpd OF providers and their
genpds is untouched.

The corresponding genpd OF provider may provide multiple genpds
through the same fwnode.

>
> If my understanding above is wrong then, please help me understand
> what the code is trying to do.
>
> If it's right, then here's the issue:
>
> fw_devlink relies on device links and fwnode links to keep track of
> consumers. fwnode links get created first and then get converted to
> device links when both the supplier AND consumer devices are created.
>
> Consider a case when the supplier S is created and the consumer device
> C is several levels deep inside a parent device A.
> S { #power-domain-cells =3D <1>; }
> A { B { C { power-domains =3D <&S MY_DOMAIN>; } } }
>
> fw_devlink can't just go "oh there's no consumer device that hasn't
> probed yet, let me call sync_state()". It needs to wait for C. But
> there's no way to create a device link to C. So, here's the sequence
> that happens:
>
> 1. When device A gets added, it creates a "proxy" SYNC_STATE_ONLY link
> between S and A.
> 2. When A probes, it adds device B.
> 3. The SYNC_STATE_ONLY link between S to B is created.
> 4. The SYNC_STATE_ONLY link between S to A is deleted.
> 5. When B probes, it adds device C.
> 6. The actual device link between S and C is created.
> 7. The SYNC_STATE_ONLY link between S to B is deleted.
> 8. Device C probes, the device links get updated, sync_state() gets calle=
d.
>
> So, if your code doesn't account for SYNC_STATE_ONLY links, you are
> going to check device "A" to see which providers are used. You'll
> think that MY_DOMAIN isn't used by any unprobed consumer and turn it
> off.
>
> >
> > >
> > > 3. **Device** links are not the complete list of consumers because
> > > they can only link consumer **devices** once the consumer **device**
> > > is created.
> > >
> > > 4. What you really need is a for_each_consumer_fwnode(supplier,
> > > callback) that first loops through all the consumer device links and
> > > calls the callback() on their fwnode and then the same function needs
> > > to loop through all the fwnode links and then pass those consumer
> > > fwnodes to the callback. And inside that callback you can do whatever
> > > you want.
> >
> > The ->queue_sync_state() callback is invoked *after*
> > __device_links_queue_sync_state() has been called for the device,
> > which is also when the conditions for calling ->sync_state() is
> > checked.
>
> I'm not sure what you are trying to say here. Yes, what you are saying
> is true. But at the point the current code returns before calling
> sync_state(), your patch 2/13 ends up calling the "consumer_probed()"
> callback.
>
> If you see the example I gave above, there is a SYNC_STATE_ONLY link
> all the way up to step 7 that'll prevent sync_state() from being
> called. And until step 5, there is no device link between S and C and
> you'll have to go look at S's fwnode links to find C.

Thanks for the details, but I don't think the code in genpd needs to
take these details into account.  Or at least that is my goal, if
possible.

As I understand it, all of the above should already been taken care of
when __device_links_queue_sync_state() is called, as it's at that
point when we can validate whether all consumers for a supplier have
been probed, right?

>
> > If there are problems with not yet registered consumer device links,
> > why isn't that as problem for regular ->sync_state() in
> > __device_links_queue_sync_state()?
>
> Does my explanation above make sense?

I think you may have misunderstood how the code in $subject patch
works. Let's try again.

>
> Welcome to the annoying worlds of fw_devlink corner cases/nuances.
> There's a case where the child is the supplier of the
> parent/grandparent. There's a comment for that in the fw_devlink code.

Yeah, I am fully aware of the high level of complexity and as I said,
I don't want genpd to have to know about *all* of that.

[...]

Kind regards
Uffe
