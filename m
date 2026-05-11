Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158FA3BD241
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495133; cv=pass; b=utdKd1Ljl4xg2GM2knVpSnA+5P3WFRe6wL7q93Xex+4mU54Azy3bkoJWe/Y9w3TZGD4dZ5Uc3ZSY1wnhh77JOiIE7x9wEwFg4CY8v1hzP3R3npIrLJCM1dVwrLQ/dmfzQBlNG0e8Imv900n5lFuYCmm2N+sFZb8dGUuWE2qLAro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495133; c=relaxed/simple;
	bh=QaiOtwTHgPwAS4MTEKlsWHGSO02A2jICVaQP2YkoUas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Advv7BnJC2hoOXnFOYwh9O5B7q3uda7UGEGBAw726wVxmysMubDqKeui2AgBli2xN7gJ+/4qx8oETcClaOWGalQqUKKTuZtJPWOe8oYGfL9bHpHucjxkpnDvnehksLG72CZf58Dd/yC7LLulCQ04NCMLYB/YqeTb9gg2vIck84g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uYwhS+aN; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uYwhS+aN"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so3901415e87.2
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 03:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778495130; cv=none;
        d=google.com; s=arc-20240605;
        b=KYAHGmWDIcrAoFq2WD839ps8ZZXfGk7l5pCn50UwX1ggLcQNfAUFJ7XMP61oVdD0kb
         VqPrzmFevA+8knH5lEVID0N5Ut8Ymyheg0SOw1MDC43oFMcwj5OiD/LIHX8lSN3BBNS5
         BZ6cl3UsQm7cU8Fx1AP+0Cs9DpG4+wWIF7vi1rQ+g9SHQLvOhfy6JJvW8E5q98NOyI+x
         GUeNJJiLdrtOg+QP6Py0I2x43UYonB/OHrCuSFEzrLhD4ko7pqpm5UzXFDxbQE08tDY3
         EooJjGFxxTdHDtoow4GpE5aw8mLrSyx7AXMGWEvfR/wIC9NeEP6bAb4aFl5tHuihNGrY
         zf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26pw5p2O4LfysMDPKO5lKRzkgvnLvc1tiwrtVXQtYAc=;
        fh=uODKPt3GHdKFazkR1+sm6g6YOG4mjGEj4PMLJKUX5Tk=;
        b=e736S4wU40dHbonr9sdS8W2aVbLw874x981xIP9XUwIyVV6W09n680w/kYWe7w7Ny7
         uXvon8tM6IxmWr3LSvlFZKh47NWJ7tVZVMh8NGtFjVn2TeP4K5sWGNBYqIvzTHE8QjXV
         vHX1jP60J2Vjpuds1tXzlcg4OdfLMgFwrkyJPIN+hr4hY2D7N5izmo1A2n1TW7p66ICc
         li2mGAWYA36l7Dmj4eAhRJw3WbXtudr4FZ44tuYPqTAFql3DK2UnTfTqVz8662J22dyy
         rg/L08+93OR4bIRJa1keRFU7VDnL9O3nmThHq1Wa/QGUzb5U3FsLyfAApkCyxymls4bd
         Kdlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778495130; x=1779099930; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26pw5p2O4LfysMDPKO5lKRzkgvnLvc1tiwrtVXQtYAc=;
        b=uYwhS+aNBpBr5PzoKKuEIjqscplmTkh4GHIUuc4zANyzYFQ+QmqHtE7YHlaSqBgFMK
         qTAqhHCxt/K62rJHrwwISVQ/b+p4T0YfNXTwJH5MKejckLhnx5hs0EAlH5rbCk5J62oo
         mZHjwlyF3bXDhYeLbjzYMe/0dY6yDM/b0AngOHGh+FEo2xK4WoMa9ZecixlXNNkOkzNc
         nwPbxQ8Srjr/CG7K+GyeAhCO32dRgQcAdFc7F6RaVQdmPTcsLdjOLhO3n90AtnntBK74
         7zLNvROv6q5f9vGBMLbqC1hrRcD4FA75iVmv0/AwOq4hfWmDuttuU+CEYKlZZlRQtzfz
         Abeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495130; x=1779099930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26pw5p2O4LfysMDPKO5lKRzkgvnLvc1tiwrtVXQtYAc=;
        b=joNdZl23LdJr75nvlDTdtN2dwmm8//SsFFR/pFEP1gzp7NT9sLMllHCn7SFNZ7WmAF
         n9Eh765+9v7chUkFo50wQqEPCblkKITB83w2rhvmR2Zt3uQ7allpSO7HcyuFYuWdh0yS
         a5NVMTDc7ftdVXqEogrlyjQQ3zZtGDRTurfs/SfShXnwyZS25ys+D24lkVZ15Ak7sxAZ
         iSnZ312bh8h+6UYI3bJetz6vBHA2sR4jhAvM2CW4RKwcoxFy37kky1HCkiMHUJQDan88
         DK9yxelprFjh2eaUrgHMb7HjekrHJonekJgTK12gDBjMvki2A1lryHWH3gsQKnfK4Fs3
         S6BA==
X-Forwarded-Encrypted: i=1; AFNElJ9Gz8mLyr+/Sw68uJaZA2wF6SNt8J3k9grcfwDRS8csU4GG+RvfXKc9f71g/JZeL8Pq/bZX2jHitQ3UZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YybamROtiNY1fUrceMx9mjULlSp4BM5RXTTsQH2fYPnXthSeEyx
	nKIB3mCGs1co/wSR12wjLNup4UCY19yJvkUslsjkEupF9EnfT8IdZ2PYxjUNU+5rwQ7gwSEIFtX
	0TYTcZIRvrVVO2lrFk10LK+6ILYANgngMm+smZOz4JA==
X-Gm-Gg: Acq92OH4HGqfZiu44xfUoFeKK/fATHhMxph4cadDvUUn1uTjBqvrEkqm5JrCDqRKOZJ
	cyo0aWOHY+OsAT1K+DcuaXJ35yQoAenf44iV9YPogs8hm3OZgKT1wqM+/p4vILHhojJVu6/qNkX
	VZr+LRHy3gbTTCzMbvMmsE4k2J2MPqVSbiPRucoM+DeE6E55712gAB1dIV4IeMkcDD2z8ub1w7D
	Yn0jgNWHx0BUUycTKC8NsXdk7Wp0A1KZwkHkQff14MnNepXOuzBzT30XlM8WbFmRO1FHBkkeB44
	JM1WOhYb
X-Received: by 2002:a05:6512:3c97:b0:5a8:750c:2f79 with SMTP id
 2adb3069b0e04-5a8b6c9d7f4mr2454726e87.3.1778495130112; Mon, 11 May 2026
 03:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
 <20260508123910.114273-7-ulf.hansson@linaro.org> <CACRMN=cowCsGb3x=tPOWLYdittwLCsSb2N2SXVPyxBRHThGAVg@mail.gmail.com>
In-Reply-To: <CACRMN=cowCsGb3x=tPOWLYdittwLCsSb2N2SXVPyxBRHThGAVg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 12:24:52 +0200
X-Gm-Features: AVHnY4KccwKVfW4opInH2wvv6H4LV9YYk-FND-WFVqnl0G_Vxtf7tdTrxriZmx0
Message-ID: <CAPDyKFoxJ8AOyqzbEQc8x-e5fRf0p3faE23PRNcbA4aPSY_cdg@mail.gmail.com>
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

On Mon, 11 May 2026 at 07:09, Saravana Kannan <saravanak@kernel.org> wrote:
>
> On Fri, May 8, 2026 at 5:39=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
> >
> > A onecell (#power-domain-cells =3D <1 or 2>; in DT) power domain provid=
er
> > typically provides multiple independent power domains, each with their =
own
> > corresponding consumers. In these cases we have to wait for all consume=
rs
> > for all the provided power domains before the ->sync_state() callback g=
ets
> > called for the supplier.
> >
> > In a first step to improve this, let's implement support for fine grain=
ed
> > sync_state support a per genpd basis by using the ->queue_sync_state()
> > callback. To take step by step, let's initially limit the improvement t=
o
> > the internal genpd provider driver and to its corresponding genpd devic=
es
> > for onecell providers.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >
> > Changes in v3:
> >         - Addressed some cosmetic comments from Geert.
> >
> > ---
> >  drivers/pmdomain/core.c   | 124 ++++++++++++++++++++++++++++++++++++++
> >  include/linux/pm_domain.h |   1 +
> >  2 files changed, 125 insertions(+)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index ad57846f02a3..c01a9a96e5c2 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -2699,6 +2699,119 @@ static struct generic_pm_domain *genpd_get_from=
_provider(
> >         return genpd;
> >  }
> >
> > +static bool genpd_should_wait_for_consumer(struct device_node *np)
> > +{
> > +       struct generic_pm_domain *genpd;
> > +       bool should_wait =3D false;
> > +
> > +       mutex_lock(&gpd_list_lock);
> > +       list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> > +               if (genpd->provider =3D=3D of_fwnode_handle(np)) {
> > +                       genpd_lock(genpd);
> > +
> > +                       /* Clear the previous state before reevaluating=
. */
> > +                       genpd->wait_for_consumer =3D false;
> > +
> > +                       /*
> > +                        * Unless there is at least one genpd for the p=
rovider
> > +                        * that is being kept powered-on, we don't have=
 to care
> > +                        * about waiting for consumers.
> > +                        */
> > +                       if (genpd->stay_on)
> > +                               should_wait =3D true;
> > +
> > +                       genpd_unlock(genpd);
> > +               }
> > +       }
> > +       mutex_unlock(&gpd_list_lock);
>
> I think I understand the intent of this function, but haven't dug into
> genpd code enough to comment on this yet. I'll come back to this
> later.
>
> > +
> > +       return should_wait;
> > +}
> > +
> > +static void genpd_parse_for_consumer(struct device_node *sup,
> > +                                    struct device_node *con)
> > +{
> > +       struct generic_pm_domain *genpd;
> > +
> > +       for (unsigned int i =3D 0; ; i++) {
> > +               struct of_phandle_args pd_args;
> > +
> > +               if (of_parse_phandle_with_args(con, "power-domains",
> > +                                              "#power-domain-cells",
> > +                                              i, &pd_args))
> > +                       break;
>
> Why not use a while or a do while() instead of this infinite for loop
> with a break?

I guess it's a matter of personal preference. I'm not sure the code
gets any nicer with a do/while, but if you really insist I can change
it.

>
> > +
> > +               /*
> > +                * The phandle must correspond to the supplier's genpd =
provider
> > +                * to be relevant else let's move to the next index.
> > +                */
> > +               if (sup !=3D pd_args.np) {
> > +                       of_node_put(pd_args.np);
> > +                       continue;
> > +               }
> > +
> > +               mutex_lock(&gpd_list_lock);
> > +               genpd =3D genpd_get_from_provider(&pd_args);
> > +               if (!IS_ERR(genpd)) {
> > +                       genpd_lock(genpd);
> > +                       genpd->wait_for_consumer =3D true;
> > +                       genpd_unlock(genpd);
> > +               }
> > +               mutex_unlock(&gpd_list_lock);
> > +
> > +               of_node_put(pd_args.np);
> > +       }
> > +}
> > +
> > +static void _genpd_queue_sync_state(struct device_node *np)
> > +{
> > +       struct generic_pm_domain *genpd;
> > +
> > +       mutex_lock(&gpd_list_lock);
> > +       list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> > +               if (genpd->provider =3D=3D of_fwnode_handle(np)) {
> > +                       genpd_lock(genpd);
> > +                       if (genpd->stay_on && !genpd->wait_for_consumer=
) {
> > +                               genpd->stay_on =3D false;
> > +                               genpd_queue_power_off_work(genpd);
> > +                       }
> > +                       genpd_unlock(genpd);
> > +               }
> > +       }
> > +       mutex_unlock(&gpd_list_lock);
> > +}
> > +
> > +static void genpd_queue_sync_state(struct device *dev)
> > +{
> > +       struct device_node *np =3D dev->of_node;
> > +       struct device_link *link;
> > +
> > +       if (!genpd_should_wait_for_consumer(np))
> > +               return;
> > +
> > +       list_for_each_entry(link, &dev->links.consumers, s_node) {
>
> Couple of issues:
> 1. I don't want the frameworks to be so deeply aware of driver core
> internals. I want the driver core maintainers to be able to change the
> devlink implementation without having to worry about going and fixing
> all the frameworks. So, please add a for_each_consumer_dev(supplier,
> callback) and for_each_supplier_dev(consumer, callback) helper
> functions.

I understand your concern and I like the idea. However, maybe it's
better to get this landed (the series is complicated as is) first and
then can continue to improve the code on top, with helper functions
etc.

>
> 2. This doesn't ignore "SYNC_STATE_ONLY" links and that's going to
> confuse the consumer count/check you might do or at the least waste
> parsing those.

I am not sure I understand how I should take SYNC_STATE_ONLY links
into account here.

At each call to the genpd_queue_sync_state(), we walk through all the
provided genpds for the provider. No previous state is cached to track
consumer counts.

>
> 3. **Device** links are not the complete list of consumers because
> they can only link consumer **devices** once the consumer **device**
> is created.
>
> 4. What you really need is a for_each_consumer_fwnode(supplier,
> callback) that first loops through all the consumer device links and
> calls the callback() on their fwnode and then the same function needs
> to loop through all the fwnode links and then pass those consumer
> fwnodes to the callback. And inside that callback you can do whatever
> you want.

The ->queue_sync_state() callback is invoked *after*
__device_links_queue_sync_state() has been called for the device,
which is also when the conditions for calling ->sync_state() is
checked.

If there are problems with not yet registered consumer device links,
why isn't that as problem for regular ->sync_state() in
__device_links_queue_sync_state()?

>
> 5. You might want to add a for_each_inactive_consumer(supplier,
> callback) too to simplify your need for checking if a fwnode has a
> device and then checking if it's probed.
>
> Thanks,
> Saravana
>
>
> > +               struct device *consumer =3D link->consumer;
> > +
> > +               if (!device_link_test(link, DL_FLAG_MANAGED))
> > +                       continue;
> > +
> > +               if (link->status =3D=3D DL_STATE_ACTIVE)
> > +                       continue;
> > +
> > +               if (!consumer->of_node)
> > +                       continue;
> > +
> > +               /*
> > +                * A consumer device has not been probed yet. Let's par=
se its
> > +                * device node for the power-domains property, to find =
out the
> > +                * genpds it may belong to and then prevent sync state =
for them.
> > +                */
> > +               genpd_parse_for_consumer(np, consumer->of_node);
> > +       }
> > +
> > +       _genpd_queue_sync_state(np);
> > +}
> > +

[...]

Kind regards
Uffe
