Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39DF48C3FA
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936065; cv=pass; b=l+NqwpgVXU1Vyoju6nspldHUnBDpYdTVP1pdZRjqp2a06MFX0kKYojM1xQxZaGrVPq9YlB7AnEaQ1A7q+BtAtVpBB43lvxzTr3g6HoOXEyE2PkQLkK6Xz2K1wp3u6yFnsbDchlTgbkuNw2oLFhGe4Tbdsk5xQF1lS7DVO9LIRus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936065; c=relaxed/simple;
	bh=pIfrqYOsttuk4BcoBkatYHzhO60Yrc+sR942QLyGfbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUAKu0AQkKaLzPV229Z+hoCC8vKeipU2eMKXdgBM22S/GivHNiPp2nJplMGLQ4Ix+vcYtYYEiTacv7UZdQ/ER7hWtyiwBkED45xPI+SsPBhFA27XNkHSeLr/G9J4zFxOotJ+6wJzShtdVgU5sZkOnPI6uJ21pwiY+mBo83MvaLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTt39BcF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEEqGIYp; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTt39BcF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEEqGIYp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nbOR1190437
	for <driver-core@lists.linux.dev>; Fri, 2 Oct 2026 10:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97tQrA8V1fotLtgnaG3+4FcLpgXpr+0ISXkTd+sa8kE=; b=gTt39BcFNLX7ML3w
	MHVGUYozgYrp53m+cIkXudyla3DkkhIDcBC5GOxak74EnUyfrwqDkygihs5f+2rT
	7KksnIswlaRwt4vRFRsaAoIAsT4YQPGzMrQy/3LodEYu3YQmmImVPySOBUSchLRO
	g9PdBZ56v8vt/cBrrRgiPQEzZI22e079byf8h76+Avp9zkKIs1cwe4xhMoZi8XAI
	u/dTdXbFbypyDnL2+8BAz1jxPdLdPokklz1UrkcjiTycrDbOLWQSdBMJ24tdO0JS
	AP7sAlHjKLTp2YLmuJ6SxnySObd1bvrP9HsOYobtQWnNgjb972bA+Mvyo1j3YR7L
	palIzg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tjm50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 02 Oct 2026 10:14:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1487191a91.1
        for <driver-core@lists.linux.dev>; Fri, 02 Oct 2026 03:14:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790936062; cv=none;
        d=google.com; s=arc-20260327;
        b=LCMjzZft5KU7oRvvhOZ3MJk+WY1iK9bq4N3O6vbxyea/4VAzozZRADgY0pAkW/WDNi
         2Re8JaihiW+KEPEFYT56/kXwW9G9R2z0OnZqvFP3vtqTwgzm/B07dphdYg9VnHhq5MME
         NvW/XZEE2T447Ekuzi9nejrIX8GNz93qHyEBGBd6G4Tn5Ypnk6wLWwB4XNULVRoAoTAf
         y+5hV81c/CFS3bzjoaJAbvF9SzxUKWLJSbImFz0UOIoKAsO/gqtKdVlq/I7URDQVm49E
         RjU8nsTqfaKzObPfBUf7R/A7OB6KjhAHAZH0OKc0a8NKVqfUHORfNH4jAQRfTkiuBezG
         Ke6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=97tQrA8V1fotLtgnaG3+4FcLpgXpr+0ISXkTd+sa8kE=;
        fh=2Q7GlTaR+tNzKXu7HGp98ljhvVRiA3CnBFcz4rnnoPs=;
        b=c5mqKbdy+EZ0R2KRttA5sQzFcl9dCaCGPqwqWWqg36OJSs6xelov0EjjrZCnPtUQNI
         IoXAXLiCDb+um0gVePNnWaQltddwKEPTtaZPxZaeO9WX0dpZzMyYRxq3S2TDzzHYVecN
         QV6WevJT1uL9NRmUewQ/F3bn9KmMdBFQJeMIGSUmUbgwjD2Jz+X4J8DfpZ9Ojeeiaj8A
         gf6LanNUlZT2V0qIgjUHB6rB1SnEDkQyWrKrC5wg+PHbiLfYmPRYCvx4rcjvZGUjNHoK
         ZPjjWFa3J382JzGSNupCiz7W/CBcltYQHQAZGXnJ9O8cFGh+DkCpA3vQhh8ETf9FqDez
         2jiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790936062; x=1791540862; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=97tQrA8V1fotLtgnaG3+4FcLpgXpr+0ISXkTd+sa8kE=;
        b=AEEqGIYp4wpippTeFg8LfXXwqq0vblRq4vk+TcCf/a9855s4LVp4Q6Ey+hiVtZbEfx
         l+A+aN79b/JWrkszAS+EsXHx2m1hOjRNB368hmMXsIitkga/NdZv7FUmAtEO5F3RtxM/
         flwkCRgTDdZFa/DzhkcYQDoXHrqMD+h2aA2TQU6Mwr8WrsxHVSVBjf0y859HvBrEdK0T
         5Rny0jQswpzx9sjLDWOhkdHvf9XAvgey7DcYrftqCTYhjGPf+tw15WHqkYMeJZjvFJ2v
         WDHlWO0mZKqIzDjNUOoa3B8DzYtKc5StEw4yOqDQLF+btgxxhMObBgL/fM0NTnD2Qip4
         v7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936062; x=1791540862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97tQrA8V1fotLtgnaG3+4FcLpgXpr+0ISXkTd+sa8kE=;
        b=mIS3PVWzXnIpfA6kcRAcZSb2ha1vQkTGWRSw9mcnewHuobMOwwBa9P2dMERkD7Rh91
         ODrKfaazSIahje2AOJhu2IRhTOKartfvR2TvnKUgGoIQr1tdwMGDhIqAkZWOflILyk1G
         aKTiZ9ufnoUeJU8e/EdOB1Qwb9rutA52IrEdMbMA61WpQKiKurhXa9u6vxI/P2ziNX+q
         rmeMwBsQSFHu4yq905/AXniQs4wEbqB6JCAbWOnnZTH2Lu4XXGHSI1h0g4Q9AJZQ3g9Q
         8xz0w7GoHh2BcnhmS7UyACr+ELCz6bWY1fzgBl1/mkCMc2wdjG8cSpY4Z/SYi1z9CIgj
         NfDA==
X-Forwarded-Encrypted: i=1; AKwUvByBdPF7G3Zau74JXfmFXmTb3LlkB6rPD8250i9awqDyqV7I6U2Q29wT0JJbnLBjVfV/29KdYXmJNwg/AQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJHWx92O1caoD95zrhrpVBbmvHSkJ+jL0hkI1mQgxL6ZjpecG78
	7ULQIwayndp96uu5znV2eGWi5RsHDXhjr6dfvTLtmnfRCVPrNu/cVgIo388mVq+J6XCJ3eLt7+k
	y4nHBJWeu5xsIu7Si/fa3MF7RbHCGLDN8jMkH0jyLIdGALFfKb7GpUDQGCRsLLgmq0K50HRQQ2r
	EO1lYmOh014y9HsK8a6Go9C7guxywJk2kO5oI15U9t
X-Gm-Gg: AYBFou3MIGNs+J1NvRItnoJXPObag7P6PbhFRvG0/30Osa5nSVUaORtTEqx06bNYHVr
	/FFxxTRoSHuMWa02Gc4+yqiCipsc5/RWxfO14HYQRy/3TRdzqwxPeyQqpX+qpEhqQuMjBgKsROc
	qlg7G1v33WjESkLdqR+pejD0cgZ7FyjKssfyaEjgF6lHrlAxTv6RcCWaQ3EA==
X-Received: by 2002:a17:90a:fc50:b0:3a0:25f0:d8a0 with SMTP id 98e67ed59e1d1-3a4f3d3b4e0mr3834209a91.55.1790936061787;
        Fri, 02 Oct 2026 03:14:21 -0700 (PDT)
X-Received: by 2002:a17:90a:fc50:b0:3a0:25f0:d8a0 with SMTP id
 98e67ed59e1d1-3a4f3d3b4e0mr3834178a91.55.1790936061253; Fri, 02 Oct 2026
 03:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com> <CACRMN=dAxriWU7Age3g9o_d6zyz8hj2p76vHXJSs7sCFxSwuWw@mail.gmail.com>
In-Reply-To: <CACRMN=dAxriWU7Age3g9o_d6zyz8hj2p76vHXJSs7sCFxSwuWw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 12:14:09 +0200
X-Gm-Features: AclHuK-oEMz6OlcHzwlSg3p_f2RJdDM8dmJ8MqNGv6f5-pC6qfJBs-GdohGXbU8
Message-ID: <CAPx+jO_byttA+b-Z+zNyPa0-zXvjCU8hv_AsSjCmBDWEEkSE0A@mail.gmail.com>
Subject: Re: [PATCH 1/4] driver: core: introduce dev_add_sync_state()
To: Saravana Kannan <saravanak@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Xuyang Dong <dongxuyang@eswincomputing.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: pwhKazFORfDy6uO9bUbfIqB1UZ-Xgez_
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf83fe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=aupEIk04F7la7JYrT74A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX1tk9ubRrCa/B
 Enf4UeK+ZOKG9Zgw4/Z52Zu/v1KVMGi+UItQSFABYPm/bEJZx+hKoloCbkg3uMDXxntUefX+uxI
 Xk7V/PZUYSm0w5wAy2QoE5MKjBGGzPz8E2YbP6/RPYQy8mOXSjEAThZZCBe36vfWoRBhRPi57HM
 fi1n7EdDAGpKu9gBaVI5VRviKnjldFFAMVKRGc/iGLAamBZCqbhQgYXY/dl34blQc6CwfTXFO08
 G4pa/WFYYVMBwS2sTygMOhk3DFRiHGmfmMQvxLICZ/K1cqgCfH1NrNOdDKVRSgKEL4YX7Rn4QOp
 9HSyYuTk6plPJleegnI2th7WO+aBFT9rZ59ZNyOJAtb8cXZZAnzdM81NryY0uYU/46LwS+pILmP
 CenE9f34Xh3vcB/b3R3/N55h0tspFI7JSSbcjM5YB7FLpMnVF/R5E2VH6nQu/NL+60MEVYL7CgY
 2yN+wNhsf0rLoT+JHpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX/4+dnXQgkPvd
 Q56x2qg4LzlAR1PgGaIRLLVjNO3TO+/dWeQS2meNMiO5bm9pFCh4QbkQ1nmEraLOXGVEeAffxMV
 dcyGTJq0W7SBoTRhklc2HAX7S6xlT1I=
X-Proofpoint-ORIG-GUID: pwhKazFORfDy6uO9bUbfIqB1UZ-Xgez_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020040

On Thu, Sep 24, 2026 at 9:30=E2=80=AFAM Saravana Kannan <saravanak@kernel.o=
rg> wrote:
>
> On Fri, Jun 26, 2026 at 9:33=E2=80=AFAM Brian Masney <bmasney@redhat.com>=
 wrote:
> >
> > We have cases where a device node represents a provider for multiple
> > types of resources, like clocks, power-domains, resets, etc. We
> > currently have dev_set_drv_sync_state() where a framework or driver
> > can set the sync_state callback for a device node, however it currently
> > only supports a single sync_state callback.
> >
> > The pmdomain subsystem currently sets up a sync_state callback in the
> > core framework, and the clk subsystem will setup it's own separate
> > sync_state callback in the core framework. These can collide with each
> > other on some types of devices that have multiple types of resources.
> > Additionally, some clk drivers already have their own separate
> > sync_state callback already defined.
> >
> > Let's introduce support for allowing drivers and frameworks to add thei=
r
> > own sync_state callback via a new function dev_add_sync_state() so that
> > multiple sync_state callbacks can coexist.
>
> I had already thought about this scenario when I implemented the
> framework. Your driver should just set its sync_state() callback and
> that my_drv_sync_state() will simply call the sync state helper
> functions provided by the relevant frameworks.

That would work, but would require all drivers to assign the
->sync_state() callbacks themselves. The core of each subsystem will
therefore not be able to help much, except for providing the helper
functions.

I can imagine a lot of boilerplate code, but perhaps the flexibility
is worth it.

Also note that, we need to address the situation where a child node
acts as the provider, but doesn't have a populated device for it.

>
> This link list is adding a lot of code without any clear benefit. And
> it also doesn't work for drivers that might care for a particular
> sequence of framework sync_state() callbacks. Instead your are forced
> to follow whatever order in which the frameworks are adding the sync
> state callbacks to your device.

Right, if the order is important, the "parent" driver would need to
control the order for how providers are registered. Yet, I think they
already need to do that (if it's important), although for other
reasons.

>
> I don't think this patch is a good idea.

You may very well be right, but I think we need to discuss it a bit
more. Let's chat at LPC next week.

>
> -Saravana

Kind regards
Uffe

>
> >
> > Link: https://lore.kernel.org/linux-clk/CAPx+jO9JiV16ePLk59hTQzEMnA96Va=
6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > Assisted-by: Claude:claude-opus-4-6
> > ---
> >  drivers/base/base.h    |  7 +++++++
> >  drivers/base/core.c    | 29 +++++++++++++++++++++++++++++
> >  include/linux/device.h | 11 +++++++++++
> >  3 files changed, 47 insertions(+)
> >
> > diff --git a/drivers/base/base.h b/drivers/base/base.h
> > index a5b7abc10ff0..339db4afbeb4 100644
> > --- a/drivers/base/base.h
> > +++ b/drivers/base/base.h
> > @@ -178,6 +178,8 @@ static inline bool dev_has_sync_state(struct device=
 *dev)
> >
> >         if (!dev)
> >                 return false;
> > +       if (!list_empty(&dev->sync_state_list))
> > +               return true;
> >         drv =3D READ_ONCE(dev->driver);
> >         if (drv && drv->sync_state)
> >                 return true;
> > @@ -188,10 +190,15 @@ static inline bool dev_has_sync_state(struct devi=
ce *dev)
> >
> >  static inline void dev_sync_state(struct device *dev)
> >  {
> > +       struct sync_state_entry *entry;
> > +
> >         if (dev->bus->sync_state)
> >                 dev->bus->sync_state(dev);
> >         else if (dev->driver && dev->driver->sync_state)
> >                 dev->driver->sync_state(dev);
> > +
> > +       list_for_each_entry(entry, &dev->sync_state_list, node)
> > +               entry->fn(dev);
> >  }
> >
> >  int driver_add_groups(const struct device_driver *drv,
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 4d026682944f..acc12f402dd3 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -2612,6 +2612,7 @@ EXPORT_SYMBOL_GPL(device_show_string);
> >  static void device_release(struct kobject *kobj)
> >  {
> >         struct device *dev =3D kobj_to_dev(kobj);
> > +       struct sync_state_entry *entry, *tmp;
> >         struct device_private *p =3D dev->p;
> >
> >         /*
> > @@ -2625,6 +2626,11 @@ static void device_release(struct kobject *kobj)
> >          */
> >         devres_release_all(dev);
> >
> > +       list_for_each_entry_safe(entry, tmp, &dev->sync_state_list, nod=
e) {
> > +               list_del(&entry->node);
> > +               kfree(entry);
> > +       }
> > +
> >         kfree(dev->dma_range_map);
> >         kfree(dev->driver_override.name);
> >
> > @@ -3239,12 +3245,35 @@ void device_initialize(struct device *dev)
> >         INIT_LIST_HEAD(&dev->links.consumers);
> >         INIT_LIST_HEAD(&dev->links.suppliers);
> >         INIT_LIST_HEAD(&dev->links.defer_sync);
> > +       INIT_LIST_HEAD(&dev->sync_state_list);
> >         dev->links.status =3D DL_DEV_NO_DRIVER;
> >         dev_assign_dma_coherent(dev, dma_default_coherent);
> >         swiotlb_dev_init(dev);
> >  }
> >  EXPORT_SYMBOL_GPL(device_initialize);
> >
> > +int dev_add_sync_state(struct device *dev,
> > +                          void (*fn)(struct device *dev))
> > +{
> > +       struct sync_state_entry *entry;
> > +
> > +       if (!dev || !dev->driver)
> > +               return 0;
> > +
> > +       list_for_each_entry(entry, &dev->sync_state_list, node)
> > +               if (entry->fn =3D=3D fn)
> > +                       return 0;
> > +
> > +       entry =3D kmalloc_obj(*entry);
> > +       if (!entry)
> > +               return -ENOMEM;
> > +
> > +       entry->fn =3D fn;
> > +       list_add_tail(&entry->node, &dev->sync_state_list);
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(dev_add_sync_state);
> > +
> >  struct kobject *virtual_device_parent(void)
> >  {
> >         static struct kobject *virtual_dir =3D NULL;
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 7b2baffdd2f5..b7a3dd4b56ed 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -642,6 +642,8 @@ enum struct_device_flags {
> >   * @driver_override: Driver name to force a match.  Do not touch direc=
tly; use
> >   *                  device_set_driver_override() instead.
> >   * @links:     Links to suppliers and consumers of this device.
> > + * @sync_state_list: List of sync_state callbacks added by subsystem
> > + *             frameworks (e.g. clk, genpd) via dev_add_sync_state().
> >   * @power:     For device power management.
> >   *             See Documentation/driver-api/pm/devices.rst for details=
.
> >   * @pm_domain: Provide callbacks that are executed during system suspe=
nd,
> > @@ -723,6 +725,7 @@ struct device {
> >                                          */
> >
> >         struct dev_links_info   links;
> > +       struct list_head        sync_state_list;
> >         struct dev_pm_info      power;
> >         struct dev_pm_domain    *pm_domain;
> >
> > @@ -1137,6 +1140,14 @@ static inline int dev_set_drv_sync_state(struct =
device *dev,
> >         return 0;
> >  }
> >
> > +struct sync_state_entry {
> > +       struct list_head        node;
> > +       void                    (*fn)(struct device *dev);
> > +};
> > +
> > +int dev_add_sync_state(struct device *dev,
> > +                          void (*fn)(struct device *dev));
> > +
> >  static inline void dev_set_removable(struct device *dev,
> >                                      enum device_removable removable)
> >  {
> >
> > --
> > 2.54.0
> >
