Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21899324B2C
	for <driver-core@lists.linux.dev>; Tue,  5 May 2026 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979607; cv=pass; b=DbZnssYeWUW/RobxQrtz8kXcfPmo7M8JC2scKcu6U1N4eHiiU7U2N0bCJgURFnx/eeNIuFiF0AjMw+NQMjqtFf6OJZsEehFtrtgNL6GWy8H2zbKC3xhpQ48SuVuUuZnbhhJNiYD5SmqIxPVx2FM7tFhJo/Prpre5hN49flgTYJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979607; c=relaxed/simple;
	bh=Os9gwDsHZQMlqqIBFGdN3USXXITiLKFrWc3TuCSD3Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REi0Agsf0Vk3HPoCP/VMV+/yQW9BoZ4CXc+4tmRertp6eah24Jy2c3DOyIGsXm6JKfDMvPkb0H9/7AmKJeTr06HttXQWd6c7ukEqKaw7KpDIiHZRP42eaY2X35Sq4TvcV4qpfDQwqITbQZA6A7AbSmsbcaNnf4Fcc1ME6wFryBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IbtrjZJb; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IbtrjZJb"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a858881ad2so5204116e87.3
        for <driver-core@lists.linux.dev>; Tue, 05 May 2026 04:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777979602; cv=none;
        d=google.com; s=arc-20240605;
        b=iPQ6vqP4Mb/JRAKKWwmLS3l5drE6c9MjlziYieWUWZqGD5ZU/c8PQY0iq62b5NZQMR
         ddvMrgEcdNrJG98loS3fY4G/iQl0ns0ZJoUu4sZGsfkqNsyKe6KZAxoLyR6/RBfF0IQ7
         Ur8eNFHY5Heu+7t8rGejjhbMmC7DR0dAXG0VCIoqvEIB0FG+PHWmlsorJjnLhFdUfY96
         OiFah+4M55oSTkg/f4umvC2cc3xRwXe+RUB7ULLQgKBFxtrcXxOrSlvkIoCYwghO0UZ+
         qVATxiGCq02cKutzvdJ2QQpwlGbcEDO9eztNJI7qR1cspHf7iTUgopxTXnkPWxwUbppf
         uDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vHtD1aX9zPxNRjWtqJ4oSWNxhaYMbBh5QHVWQYJquis=;
        fh=yEO/fZRg/THVyhhbxuh19+4CHyJAcqgAwk44dYJkZ04=;
        b=AOYGr5CtsciyVCXBcwSseWu4DBIqlEaTNQdjPnmnyUfV9wvnVukhIOiG+sZ39KD5sU
         aje9Ow1Vf3rCHau1LTOfp6fE3tGrAabHwUfGnGkKV4omc8mljZFBLAeSQZoXPEPbwg/E
         BGOK9JFwsqTyOr6MIGdaAbWWR0rfv4R2xni3fR+JinUsXt93Ch5Lp9R1vGdHRI1zrPCq
         5VKypJm89UNFzdVKAdH5MAVUe2mfdXfH9SqP8j5D4XH2q9rzb/BybYwXSJQZXiiFpxUr
         HtOiyLFbUFaM5dtudi3qWdNEzBUAqtZxgun3mv2JWb2Y+hjcglxSSBSHwXCveTjSGfH2
         IrQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777979602; x=1778584402; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vHtD1aX9zPxNRjWtqJ4oSWNxhaYMbBh5QHVWQYJquis=;
        b=IbtrjZJbYM88XVdji2wHYGOHT5/FbI+K5dl/51tVZN2QBtNRKhx0dUBq/dqyjJeujW
         T8zZQAdE9HoFOjpChK72/S+ZmRnW593zXRb6a89x7PXzQDaDoOiDCuAy48XuxQ4UtTGQ
         kYsddD1bvYdm+2RfxppNlkUIV8Tmpe+uZzXpDvpFUp3POfiVAvD4k7lCFsGfNuyWOnfa
         Xa7G1RaN6YlV2VVEPEgbeT0nddfnd+wQc5Ir8nvcyTcnxHJwc+WyXkyzOCdXL03Rtthk
         MoLne6/AOLXXJBOJXs9ZI3a9jv+1Gb2XQRibjmyAlXB+l1WIpCzYZyHC+LClHeEleSTB
         VaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777979602; x=1778584402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHtD1aX9zPxNRjWtqJ4oSWNxhaYMbBh5QHVWQYJquis=;
        b=QWdtnxr3DQ23Dpay2Z7PwDqNGIBSbRe9NuDNOXdtNrkeRD/x4bz+RLB9yzTPKXSVtx
         o6Gj7ZUvPPsyNajeZ7h2eC+txXoo3AyihoWlvE1JfVAAhLbeNrA6V5flVwwwCwSAvmqc
         vojzQjxDikmgVJuwl7mN7DI8P6ClrceNu2TvF7LwCpV+HFuRjDPEtC73b73Ux6BL3FaC
         YZs34IzsLn+k1q7dFzH646oZEG23J4CjEc4DtKyrbiVRMZWqYDwK78Zyth9rUR9Nd7Tx
         ftlcqVaKpGLDb83+vgBqa0a1s4YuGG1ZV6sIDyLcwmpYyVuG984cv8PnfUeZGryaxSoa
         a9Ig==
X-Forwarded-Encrypted: i=1; AFNElJ+FEOZuxETJTrogN0LS9mIJV40iadGKxtwXaLsqa4yzlFqrNHoZrx9RGwgktrwBLdyPIYQzzj+MHQCtTw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy82YArRvoX+CxCfOSEA53BsalF11ElE9MkhLQppAD3MdHzWYip
	IuzUIEsfVct8jnh/4+mNbgXa2RtIkXo0UMR2O/BCEa8TUDB/7owH9NIRL/gKHZCcvgyECUBwnAc
	/8F2o6QEpfZm8hO98S1RpuEpxWfbURfspyK0SdFHu1w==
X-Gm-Gg: AeBDiet7tBdo8H2cffZk/fMdu1ALszZdGzkGtLuvCaaGUvRPqbhw6Lz09fgLxekO8Yf
	pmVGXd7I4fRpNZ31KuP2oAfsbNaIpqseTNqV3pqt2T+KdGfRFPczXtJrhPYSODam5CETErQCL4K
	/JljrKe+oE7c42pmhmvKpUm59mGCwTw2D+voAI08f5EwIFI3eOmleTKUh3jevF9Ht16ohTDXsWn
	YI7SmNOn5xYpnF/6DJzUP/UTWCS9U828RcGJnNCBDrzMJl3zAHvoioA1iYV+ar+J8wrn8oJmzKc
	wGKisHdyHU3UChVNhHE=
X-Received: by 2002:a05:6512:1255:b0:5a8:6b81:6694 with SMTP id
 2adb3069b0e04-5a86b8167c7mr5154556e87.30.1777979602140; Tue, 05 May 2026
 04:13:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-2-ulf.hansson@linaro.org> <DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org>
 <CAPDyKFqMDPiqvqJrq5Qs6Tw4Sc7szG4G-=y0NFkNSPoNd9kdVA@mail.gmail.com> <DHZMQLCIRJIS.174HZR6DIAOMM@kernel.org>
In-Reply-To: <DHZMQLCIRJIS.174HZR6DIAOMM@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 May 2026 13:12:45 +0200
X-Gm-Features: AVHnY4LlCgMgAkU1pCqSb5NGsrhZtKGgNNx2kcRO5ejJAWo_ZbIw6N5C10vsCeg
Message-ID: <CAPDyKFoKNpUexGrM0zcysKMKcdYT-cU0_Q_AHbgiGPk_gU-3nA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 12:59, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Wed Apr 22, 2026 at 12:07 PM CEST, Ulf Hansson wrote:
> > On Sat, 18 Apr 2026 at 13:23, Danilo Krummrich <dakr@kernel.org> wrote:
> >> On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
> >> > @@ -1126,6 +1128,9 @@ static void __device_links_queue_sync_state(struct device *dev,
> >> >       if (dev->state_synced)
> >> >               return;
> >> >
> >> > +     if (dev->driver && dev->driver->queue_sync_state)
> >> > +             dev->driver->queue_sync_state(dev);
> >>
> >> This seems to be called without the device lock being held, which seems to allow
> >> the queue_sync_state() callback to execute concurrently with remove(). This
> >> opens the door for all kinds of UAF conditions in drivers.
> >
> > If that were the case, this whole function would be unsafe even before
> > this change. I assume this isn't because of how the function is being
> > called, but I may be wrong.
>
> This function does not issue any driver callbacks intentionally; the existing
> sync_state() callback is deferred to device_links_flush_sync_list(), which is
> called without the device_links_write_lock() held, but takes the device_lock()
> to protect against other concurrent driver callbacks, such as remove().
>
> I.e. we can't take the device_lock() when the device_links_write_lock() is held,
> as it would be prone to lock inversion.

You are right, the device_lock() is needed in
device_links_flush_sync_list() to protect against concurrent driver
callbacks from being invoked, such as the ->remove().

However, as part of the removal procedure in
__device_release_driver(), we also need to account for device links.
Hence we call device_links_busy() which takes the
device_links_write_lock().

>
> The documentation of __device_links_queue_sync_state() actually slightly hints
> at this, but focuses more on the other reason for the deferred semantics -- the
> sync_state() callback may want to call device link APIs.
>
> > Anyway, let me add a get/put_device() here somewhere, to ensure we
> > prevent this from happening. I assume that is what you are proposing?
>
> No, an additional device reference count won't protect against other concurrent
> driver callbacks, such as remove().

Because _device_links_queue_sync_state() is always called while
holding the device_links_write_lock(), it I believe it should be
perfectly safe to invoke the driver callbacks from there.

Kind regards
Uffe
