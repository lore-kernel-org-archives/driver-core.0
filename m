Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AAC47F2C6
	for <driver-core@lists.linux.dev>; Tue,  5 May 2026 14:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990589; cv=pass; b=orV3aXtjPyogAX2EiuUBBuxshjNbXyDoHySWRN8L8dKesvc0Nh78ZbZD8Hkw+NSxhl9i2Gx0CliYSeM5D+yXK3sM/4r7J4gJlANpAsO/2RctjHqcmOqolvBhfQLpJYccjfpunm5XjYlUKpQBBidXkGZjAHqKmVMxP7ljmOH8MIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990589; c=relaxed/simple;
	bh=kdL3pnqejRELK0jNVjnayG+VYLvtXvdrz73QwxHzyUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsZauwM6fkB4NLwvHuKiHcIctK2WxciGFrXJKX6JkhlravF8W+Zc15C+gj9Y10BL8lTfUS11mIJl4++tFVrO+5NOXwHbpGXiiaXzDCB4M4x/xhHzJpPSGc88h8iCB6CGDy8UQjFUvXAddJ5mMEYwo551dYXPU5uCutDfgqYVk6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BV3E2eHS; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BV3E2eHS"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso5847319e87.2
        for <driver-core@lists.linux.dev>; Tue, 05 May 2026 07:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990586; cv=none;
        d=google.com; s=arc-20240605;
        b=C6rSV2DHClHENQG8rj/3MYaMFx0hO2pR9Wj9T1K4liGZw2ef46kkS2oiwZJwOhv4oT
         7uProLKvF05LHPnPnezpwtSnde2CMdRimnyxAijKABwTftuQTmrIe39fTpuFrnlb/DzV
         ZlvljM6ZwP0w3cQVLVOprzF0nYOh0qN8JGpm5tLlGlSO1eDiCEnPfdht4yGAlD1itOC8
         sPPKNzN4DjCO+c4Zry+rJdDRZpAsVwGv4WHMzaOOE6LcfKKjejeP1xbzJf9TsAln22NM
         QBGsFZBeObAE8ma/rphXNyx9ueY9z6SZYSYU1gJwKOq/MT+SO0YGXzY2poy1UiwM2dHU
         VUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3n1BHwbT6sLMZPQ5Ra5Z4Dc4Gq+q3b4+gKTchSYDuYg=;
        fh=EnkGi0qkOeRtyUFyoArYEmFGcZMaHcK2Av0/FQILoYY=;
        b=PR7Gsdk2KujkdQ5z3uq3KyNJuaDjHxafDiAuIL6KPol/McWd3beDEHOMob2Gk6kHM5
         aNB/PEGAdZktB857ATei2zsNtIv+LOIRmAOMk4ijxh+6rZ/KHLLVaJr/QcbjGN38zm3R
         IwDYVGpV8wo9nGhmTVwAcAQyw+roHi7k+zbVAhQ0YHsy5zMlv7B29HsLd1l9kZ1+5srt
         kOtx4ZNfpcPllsdmIl1JefqzFQBv81ZBVud3B5QD+iaJH3DTYfg7lw+B/cozchuVH521
         esa6L5HvmwcpdYvxgx9+I2IvTQRCvhsSLssNflJcfUZDqfygvOpY59NSfX1D27gmlKMe
         sLbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777990586; x=1778595386; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3n1BHwbT6sLMZPQ5Ra5Z4Dc4Gq+q3b4+gKTchSYDuYg=;
        b=BV3E2eHSilAr4DOzfj9X9nHqDwP0TQRJXUozy/MxM4SV1ELVMBBYKsT/rWhclHqQF5
         mTixW53dfZWkMoqCmmKF2dkSEJT/M6K6G6+eQ9+apukLCNDpkLHblGMkFNRs+osi/H7f
         EaiE/xT8VEdQPyIBPIl9LaTvgIvZjES1APvmHnbSCxCHiUbe/5iZtmHXM/7QW8bqRwmV
         C4iTHDvT0aYpWEU4Ji4xeezK9ZMTl98vBB54rpzRmhF2pw4eOq7H/2o7VPItizoAeAs4
         wuv6D9lBQolBE5neJPQOxXwH9NkJEZzVvMOifG2ClgNAgMxmhBXroxPmLl7Wn2fkVCaY
         dMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990586; x=1778595386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n1BHwbT6sLMZPQ5Ra5Z4Dc4Gq+q3b4+gKTchSYDuYg=;
        b=O5gswK2pxVFEfHaL92rdvEz3dUUW4uv7OoIS9zGQCNPJ7KUcWKLFnuIoaiKCSRfyWO
         QGMFL68okaGwKRAeon2kKBBJuA/gK0PYNL0kg1ot3GF3lHSC51kzg/h8b5HYqvytJmO/
         gqMjCd0utl7mtKIz9BbDNFFrHPtddvhL2LFMlSkZQbZGYTVCzyybo98qCTXSIkvdFshC
         nZus2H5Zn1dfwBR3CIlgXvnmHH8dwErIHDLSyD9tVL8C8nam/xtSszm1jv7dk/sNTnAm
         34pX8Qe3gnWoR4B3jbUS+UXD2lmohFxb5LVEyaZMcA8fmB3Ycgih4gzJi2r27e4fKps1
         h5EA==
X-Forwarded-Encrypted: i=1; AFNElJ8SqW9JMVvGpW6J+ZHoHsBN+iQfojYBxCzcM5p8KpFRAE4l9U8cbky9HXFxoqmDJtMoc8C8LeljzQDf0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyupcjNGaiRKkF8bJY4H/zRTuUt2FT4JTU7m/83rVncNsJrPuR+
	JnMAKFzQua6ucwmD8w5bvMOsM1QvIS3o8KgQhGrmAE+ZsyZkx9z/cazlJYfqabz0HTEU49PLISD
	rzOATCbswXZoAFkULX+vkLuf3MLeramuFeqeYiRkyig==
X-Gm-Gg: AeBDiet2e1cVTPAl3taxod7QgJE8DoChjPD+gIHAW3uUgqJ4IeROsw0Dh4ZbYqhYfDT
	K6QreYawIxYo6sy26B2CyF3ykyMFrtMSLVMKvJnmGkU+450N31Qb9THr8i5+j/+HomDEBvfiT9J
	HmfomxhIo9ClNMgvRlaUgIinSmBJfcVcIK4guD3zJe5079lojqklEBty1Ss3MB68lRcJHgwNwLw
	iwmAEyjrQA3II3+BRk0KHT/623c1nT/3KRGLVRPBJeE+TYDveyJZ0zGj8N0pEAYOsbduU83vy7x
	mdRkImDSyz+NvnC0OwQ=
X-Received: by 2002:a05:6512:a8c:b0:5a2:bc5d:c675 with SMTP id
 2adb3069b0e04-5a8631c1104mr5144695e87.28.1777990585964; Tue, 05 May 2026
 07:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-2-ulf.hansson@linaro.org> <DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org>
 <CAPDyKFqMDPiqvqJrq5Qs6Tw4Sc7szG4G-=y0NFkNSPoNd9kdVA@mail.gmail.com>
 <DHZMQLCIRJIS.174HZR6DIAOMM@kernel.org> <CAPDyKFoKNpUexGrM0zcysKMKcdYT-cU0_Q_AHbgiGPk_gU-3nA@mail.gmail.com>
 <DIAR5LATLBNK.1CSW7AD5VRN77@kernel.org>
In-Reply-To: <DIAR5LATLBNK.1CSW7AD5VRN77@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 May 2026 16:15:49 +0200
X-Gm-Features: AVHnY4JoQ9U8rU1C6LkDXLwkHY8Lk-vfHOOrZ84KcQURDPW5oqZb9k-nt-xLubU
Message-ID: <CAPDyKFqbdDHRj6ZTAs62K=T833Ko7Mu2Bna9D8pjhd=Niw1DbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Danilo Krummrich <dakr@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 14:46, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Tue May 5, 2026 at 1:12 PM CEST, Ulf Hansson wrote:
> > On Wed, 22 Apr 2026 at 12:59, Danilo Krummrich <dakr@kernel.org> wrote:
> >>
> >> On Wed Apr 22, 2026 at 12:07 PM CEST, Ulf Hansson wrote:
> >> > On Sat, 18 Apr 2026 at 13:23, Danilo Krummrich <dakr@kernel.org> wrote:
> >> >> On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
> >> >> > @@ -1126,6 +1128,9 @@ static void __device_links_queue_sync_state(struct device *dev,
> >> >> >       if (dev->state_synced)
> >> >> >               return;
> >> >> >
> >> >> > +     if (dev->driver && dev->driver->queue_sync_state)
> >> >> > +             dev->driver->queue_sync_state(dev);
> >> >>
> >> >> This seems to be called without the device lock being held, which seems to allow
> >> >> the queue_sync_state() callback to execute concurrently with remove(). This
> >> >> opens the door for all kinds of UAF conditions in drivers.
> >> >
> >> > If that were the case, this whole function would be unsafe even before
> >> > this change. I assume this isn't because of how the function is being
> >> > called, but I may be wrong.
> >>
> >> This function does not issue any driver callbacks intentionally; the existing
> >> sync_state() callback is deferred to device_links_flush_sync_list(), which is
> >> called without the device_links_write_lock() held, but takes the device_lock()
> >> to protect against other concurrent driver callbacks, such as remove().
> >>
> >> I.e. we can't take the device_lock() when the device_links_write_lock() is held,
> >> as it would be prone to lock inversion.
> >
> > You are right, the device_lock() is needed in
> > device_links_flush_sync_list() to protect against concurrent driver
> > callbacks from being invoked, such as the ->remove().
> >
> > However, as part of the removal procedure in
> > __device_release_driver(), we also need to account for device links.
> > Hence we call device_links_busy() which takes the
> > device_links_write_lock().
>
> I don't think this is sufficient.
>
> I wrapped my head around this about three weeks ago and I think there were
> multiple cases where this falls apart. I think one case was:
>
>   1. Consumer binds, supplier is added to deferred_sync. Consumer unbinds,
>      link goes to AVAILABLE.
>
>   2. device_links_busy(supplier) takes and releases device_links_write_lock(),
>      finds no ACTIVE consumers, returns false -- drv->remove() starts without
>      device_links_write_lock() held.
>
>   3. device_links_supplier_sync_state_resume() takes device_links_write_lock(),
>      finds supplier still on deferred_sync -- device_links_driver_cleanup()
>      hasn't run yet, blocked on the lock. queue_sync_state() is called
>      concurrently with drv->remove().

Thanks for pointing this out! More problems seem to exist regarding the above.

What if drv->remove(supplier) completes before
device_links_supplier_sync_state_resume() is called and the removed
device is still in the deferred_sync list? Probably another
get|put_device() is needed to protect us from UAF.

>
> But again, I think that's what I concluded three weeks ago and this state
> machine is rather tricky.

Indeed it is.

>
> That said, *even if* we could prove that this works in all cases, it would be
> very subtle, pretty fragile and not by design.
>
> The whole state machine around sync state is already rather complicated. So, if
> we really want to make it an invariant that it is valid to call bus device
> callbacks without holding the device lock from
> __device_links_queue_sync_state(), I think this has to be carefully reflected by
> the overall design making it *very explicit* how this invariant holds up in all
> cases.

Right.

I experimented with adding the devices for ->queue_sync_state() into a
separate list and then flushing that list similarly to how the
sync_state list is flushed. It becomes messy, but I guess there is no
other way.

Perhaps Saravana has another suggestion for how to implement this?

>
> Otherwise, I'd be rather concerned that this becomes a source of subtle bugs.

Kind regards
Uffe
