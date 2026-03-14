Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5314A4F0
	for <driver-core@lists.linux.dev>; Sat, 14 Mar 2026 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773465198; cv=pass; b=kTBjZH7bhkGgjs0AydDr0q3pDyqTT26ESO13fZW0mScqC3blUww2yMdjjlJMCP18pMCXW7WpzKZcm0Z+7W1+egmaEZWnznTkcU1m8qsI/Ga6G+nmMBuLd5v4HlKptT79aOX2goQaiEo/Qt4buo18PZGEz7f3i6X7kpWiYmTCvsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773465198; c=relaxed/simple;
	bh=SzQIXiO7WCG8WN+IgnhZr8P9l0vaLniDCPkwpiqXiHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6dFLLrYO9+/G97UZ00Cwkd9tM8q0hgw+UlPJoX2HDMueS/1ldI5EOu7t6FmHCFbvvzXY0K+VcN05vzd0MHvn85sUGcA/9UlBwEstEQFm++gUQ2kIxyFhJw1/QTtanwMwqGbAjxe9hSdUTtt+MTTwIIgNXHWirnwqEJEQyWOkLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wtt2JeKf; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wtt2JeKf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b941762394aso356769466b.1
        for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 22:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773465195; cv=none;
        d=google.com; s=arc-20240605;
        b=JtShpCjK+YqfD8sCTl/IRfcLB1BMtjJ35F+VQEzrhynZCvvQDc7IwAYFWCgqH0WYLb
         M+IhE/vxI74XFHSInyTc6qimzep8qLVDQ+jvnjcTJhqgkDI4L6Opft996j1c/T0QJ6dX
         0xb7LH5VnluUPUa53/QPqssbqyr/kwpmwW4zh0KjMGL7yJ6n8ZZsbASHchigP320wVie
         1/goqeoi+OnxJlUyTb0pIMUTdAFy1TUYz6t4GnJ0+i3i9sfoTRmi786d5AsaUvF/L1RZ
         ohzzOz99uLScQm2WxsBNqsN9BYU1g6yzcr6N8EiXSOJRA6LIZT6tveeLdg6E0r3EqLjv
         1PEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IM7Q6oOyb5nhIw60KEs5pEzxBNhlQ40PGDtJzVWEr0o=;
        fh=/XjBaensSO+EZWb9RhyIUEku4yWlBjNGDJrzpC4SUIQ=;
        b=RBjPtFEiRuI+okpGbAI/UrvW9Rg2PNh2Jf080EitVhgZx42ddAsCXqY0+U9mmuZmUS
         zitQU3lDW2PkprM+2RdrfJkVRtCPGtzuJ32h8uLhrx+/oNKFY0AT8a00ShnDEqCoTdDM
         83FJCI5pX9J4xVDQx/j7fq+s71xZttuoRKN5mabFqB5GNC2PSthImgqYw0ZyxqC7t27q
         vLJ0yp/a0H3KnG1/ucrZCqUF41tScMXr7zt9aH+P6wyIq2nHNf4+mj/rawL0m89U9kVC
         R1s7d6qXzr1WEqddrtnOZ3b238sHOYy5HlwQQuBiLwJk3ywDfy48jkxISdu2DlhvXI4V
         jw3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773465195; x=1774069995; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IM7Q6oOyb5nhIw60KEs5pEzxBNhlQ40PGDtJzVWEr0o=;
        b=Wtt2JeKfVi5aqPFLVncZYtnq/T7k+QE5pYRK+m87G2/S6Vo4/O3lYgwL+nwBJ8NCgP
         A67jmLrCpFRPfkYVLyUya5IGwVeGWKKi1vBxTxwNJQ8hn23s9pH9g+rp60VCaTL9RrD4
         /5tHZ0C9Fwl7FarFM+4NUc60fwEY+J3fZvLi4wB1GCt6n31d/CTqkYNUWEUWAX98VFdD
         rIumM+UGiBekwTdJ88m2aZK29fuGfNRnYlah6vuRV/gGm5c/62yLGyBU/j7h2g3zRshC
         1J83INxqhpdt1FgrT7aJGw2MERMvqDQe26f+SZioG8eEGVSIbkrGtj67f9SnXYW2k+/N
         txEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773465195; x=1774069995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM7Q6oOyb5nhIw60KEs5pEzxBNhlQ40PGDtJzVWEr0o=;
        b=O40h9ey6O/ZZa3Mfxlo5nOxyThPcWPPe6hqIMnm+CDX4FxuqVc2Ak4cXLmtlQgbq7P
         kgEsOPu/CZsYd0MkvVZQw2BOXjH4O+7sKsMhlnYqWGLHoiiRPtb2TuaDOUbWWH08gYn3
         3lfkVF7H9Tn7P2LF5gDmOuqUkiPqjgjMoXGqIqKfwoRFekcMb5nOuWoku/hfhdcn4vHx
         NmLbU5Nq17gyRkJ5skz2jgPVyU+gWVoFFX6NG9P+5kV3aqdsTKNQpKzcVgHG9aOzhn1o
         EJb21YSf7b3Dp8n46fQJRureSQiS23WjKCdLp1zvVAcdFvKbp93Bu6As4pnb507DbfAE
         ECuw==
X-Forwarded-Encrypted: i=1; AJvYcCVXbGxlIQxYqrOOhhHXxvFFe/SzR1evahTwqqrKmP7hCkPYtKcQEB7VpZPsWSHilwv5PzUoIW+dHTY0hw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMzzIh4oEVRuSxnWFM/i3AMDiuD95U8nNq6RHduJyATMRtBHU8
	fYzme8nXDgAUc1KyNHuDF/TufA02ewMCDu8tGX3DzjHoz6M84R/1iVD8sROzE2ImDtJS35qhMI+
	CY1avMWc/EEJ3QpdoyIHA33xtgSimJZI=
X-Gm-Gg: ATEYQzy8/u0jgEDdJL5lkg5H3StBmNp0BJ8dxfvnGPYqGj3sD/cmdWNpshDBDWHSK0p
	U/s8+RHb37zx4Ob+HFa98qGC8+4RhtuYSv/rl6HCRN/F13qQT4WBV441KSFc/byS7nNbAGPclyP
	zDzNTwZiF05D4QSA6SjK6M4NxGL2UbmqhfgUENx9d9kOBh55GCvl6eDQYkNLO3PyDvbf0SW3XwO
	HROkPtztQw8sOnjySCyAt+7UW93PZ2BiqOI/rmYeG51eJtsDRzVVgnW8/qROO2JdAlSUlISnthK
	0r1p6g==
X-Received: by 2002:a17:906:208f:b0:b8e:796a:fd5c with SMTP id
 a640c23a62f3a-b976506440amr202919666b.27.1773465195027; Fri, 13 Mar 2026
 22:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226101032.1042-1-linux.amoon@gmail.com> <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com> <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com> <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org> <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
 <DH0TM60TVX5D.20W4O1X696ALA@kernel.org> <6cfe4bda-036f-4bb9-8a08-ed75f61cae24@arm.com>
 <DH1QCLS89ADR.3H0XABP0GEFQT@kernel.org> <4f9fdfc9-f2ad-49b1-a6b9-ae64aaa47cfd@arm.com>
In-Reply-To: <4f9fdfc9-f2ad-49b1-a6b9-ae64aaa47cfd@arm.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 14 Mar 2026 10:42:58 +0530
X-Gm-Features: AaiRm52yI10E6vLq92rcORMoPK2tRdzWpVlxX3dbSjvIMnFFuSiMh3dLe0uhnRo
Message-ID: <CANAwSgQ6eaM=Z=MBmS0=HrLfBxOh+vqnRSkEge_q6y+oe7AU5w@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Robin Murphy <robin.murphy@arm.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Grimmauld <grimmauld@grimmauld.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"

Hi Robin,

On Fri, 13 Mar 2026 at 23:07, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2026-03-13 2:39 pm, Danilo Krummrich wrote:
> > On Fri Mar 13, 2026 at 2:15 PM CET, Robin Murphy wrote:
> >> On 2026-03-12 12:59 pm, Danilo Krummrich wrote:
> >>> On Thu Mar 12, 2026 at 1:48 PM CET, Robin Murphy wrote:
> >>>> On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
> >>>>>    From a driver-core perspective I think we're rather limited on what we can do;
> >>>>> we are already in async context at this point and can't magically go back to
> >>>>> initcall context.
> >>>>>
> >>>>> So, the only thing I can think of is to kick off work on a workqueue, which in
> >>>>> the end would be the same as the deferred probe handling.
> >>>>
> >>>> Hmm, in fact, isn't the deferred probe mechanism itself actually quite
> >>>> appropriate?
> >>>
> >>> Yes, I've also mentioned this in [1], including the fact that it technically
> >>> even complies with the guarantees given by PROBE_FORCE_SYNCHRONOUS. I.e. the
> >>> documentation says:
> >>>
> >>>     Use this to annotate drivers that need their probe routines to run
> >>>     synchronously with driver and device registration (with the exception of
> >>>     -EPROBE_DEFER handling - re-probing always ends up being done
> >>>     asynchronously).
> >>>
> >>> However, I'm still not sure how I feel about this, since I consider this to be
> >>> more like a workaround that just moves things to a "more approprite" async
> >>> context.
> >>
> >> I guess the underlying problem there is that there are at least 3
> >> different significant aspects to what "synchronous" can mean:
> >>
> >> - literally in the context or device/driver registration as documented.
> >> Off-hand I'm not really sure what useful property may be *specific* to
> >> those conditions that a driver might rely on, other than for
> >> super-special cases like platform_driver_probe().
> >
> > I'm not worried about this one, as it is already special by not being compatible
> > with deferred probe. I.e. the caller already has to promise that the
> > corresponding probe() call will never return -EPROBE_DEFER.
> >
> > This is a much more error prone requirement than just "don't call this from
> > async" already.
> >
> >> - serialised, i.e. probes of multiple devices won't happen concurrently
> >> on multiple threads. This is probably the one hiding the most driver
> >> bugs, e.g. internal shared/global state without sufficient
> >> synchronisation. I guess this falls out as a side-effect of the first
> >> condition, but AFAICS it *can* also still provided by deferred probe
> >> (given that it's a single work item iterating a list one-by-one)
> >>
> >> - in some regular thread context that isn't liable to have issues
> >> synchronising against other async_func workers (i.e. the request_module
> >> case). Again, deferred can't have a problem here, or it wouldn't have
> >> worked properly in general for the last decade.
> >>
> >> So it's not that we'd be relying on some dubious "deferred is always
> >> synchronous" assumption - AFAICS deferred *can* launch async if the
> >> driver permits it - more just ratifying that deferred is still able to
> >> effectively honour all the useful properties of PROBE_FORCE_SYNCHRONOUS
> >> other than "during registration of the thing".
> >
> > Yes, and as mentioned above, EPROBE_DEFER has always been a valid path for
> > PROBE_FORCE_SYNCHRONOUS, which is why I brought it up as a a workaround in the
> > first place.
> >
> > (The reason why I still say "workaround" is because nothing actually needs to be
> > deferred.)
> >
> > Anyways, as I mentioned...
> >
> >>> On the other hand, eventually we want everything to work with
> >>> PROBE_PREFER_ASYNCHRONOUS, so maybe it's also good enough for the time being.
> >
> > ...plus there are not a lot of PROBE_FORCE_SYNCHRONOUS left anyways.
> >
> > Do you want to send a patch?
>
> Sure, I just wanted to check that you didn't see anything obviously
> wrong with my reasoning-by-inspection - if you're sufficiently happy
> then I'll write this up as a proper commit message and post the patch
> (likely on Monday now) so we can all nit-pick the details :)
>
I believe the issue lies in the r8169 module, which currently has the
PHY address hardcoded to zero in mdiobus_get_phy. I have modified the
implementation to scan the MDIO bus for all possible addresses to improve
hardware compatibility.

Can you check this at your end.

----->8-----
$ git diff drivers/net/ethernet/realtek/r8169_main.c
diff --git a/drivers/net/ethernet/realtek/r8169_main.c
b/drivers/net/ethernet/realtek/r8169_main.c
index 58788d196c57..fa99e33eccfe 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -5420,7 +5420,8 @@ static int r8169_mdio_register(struct rtl8169_private *tp)
 {
        struct pci_dev *pdev = tp->pci_dev;
        struct mii_bus *new_bus;
-       int ret;
+       struct phy_device *phydev;
+       int ret, addr;

        /* On some boards with this chip version the BIOS is buggy and misses
         * to reset the PHY page selector. This results in the PHY ID read
@@ -5455,18 +5456,30 @@ static int r8169_mdio_register(struct
rtl8169_private *tp)
        if (ret)
                return ret;

-       tp->phydev = mdiobus_get_phy(new_bus, 0);
-       if (!tp->phydev) {
+       /* find the first (lowest address) PHY on the current MAC's MII bus */
+       for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
+               struct phy_device *tmp = mdiobus_get_phy(new_bus, addr);
+               if (tmp) {
+                       phydev = tmp;
+                       break;
+               }
+       }
+
+       if (!phydev) {
+               dev_err(&pdev->dev, "no PHY found on bus\n");
                return -ENODEV;
-       } else if (!tp->phydev->drv) {
-               /* Most chip versions fail with the genphy driver.
-                * Therefore ensure that the dedicated PHY driver is loaded.
-                */
+       }
+
+       /* Most chip versions fail with the genphy driver.
+        * Therefore ensure that the dedicated PHY driver is loaded.
+        */
+       if (!phydev->drv || phy_driver_is_genphy(phydev)) {
                dev_err(&pdev->dev, "no dedicated PHY driver found for
PHY ID 0x%08x, maybe realtek.ko needs to be added to initramfs?\n",
                        tp->phydev->phy_id);
                return -EUNATCH;
        }

+       tp->phydev = phydev;
        tp->phydev->mac_managed_pm = true;
        if (rtl_supports_eee(tp))
                phy_support_eee(tp->phydev);

> Cheers,
> Robin.

Thanks
-Anand
