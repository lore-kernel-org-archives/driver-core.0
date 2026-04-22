Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5295D3CBE76
	for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853554; cv=pass; b=B2nvJEckCTC8+I9qy7mvSR6CLHSu6ZSdcuvwfRJezRqDuNyqXo7oEr6lsPAtBj686TzHnIiccYjLnpUx7Rr6dIRhWQ+EtxJbHmDdZnSzLprMCYOJUiVP+efnso0APEzvQSJx7Lt7iwWgLQOpb7X9z7rIM2qhMjRim74inotRk8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853554; c=relaxed/simple;
	bh=YooqRyA/DUQm5e1Bubx+ZKBrDAyHYH6gU8LhytOsrLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4G0NhM1YwVU4iV3EAk7t8y1LSV5AMee1wX1HWMMWqFxpHsca0sGDe3xcCmsZwvdv7W8STLoVCrWvSMbVcyyZSUb+AgWMyVeqlwm2A2yXQWUerNwoxtW1UfG8TWPbV/3yzeGDKLq1F9YjA6f99RoUWRULsHPPHZZT6nyLEtbn3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NoIYujzC; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NoIYujzC"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a4113ab355so5533912e87.1
        for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 03:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776853551; cv=none;
        d=google.com; s=arc-20240605;
        b=E4TtMBWQ64xRorFKBqZ7r+DQpKMkPJdkWK/95OsBv7ASUfrwzHScklkPmsARBJJga8
         WtIxuzAUMWY2Q5tSlJADSVoAOC4LVJHE9HtDPt/1qgV89BGjFzwTGLa3bxLqUXrwScKI
         KeBKU/hs3fNbe1MldgUDldckLsoevArEh1liDowntbtO8xciS/wosCHAQZU45ALZZK94
         FX8G0GKPQSkw0DhWZAa8YJR9Vg62oafcM5ufQqYbhrlrkzVhIJFBsjg7qzaDUIsImKjU
         VzGc2gmvTX4/GnsSGJBG3bK2A274+44US1IP+cstzypET5hhh7/n0hk8kRUwFIcMm8oz
         3hxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wq8+U2WZxewGPTZ86+kP7pb8whJIc4RPuZ9dCPJUDAo=;
        fh=P4s4JZlVbwtPp5bCJd+6voTt3q5cV+40O/vH97BCS+M=;
        b=XN0YrGpa0z9SnN6XBB010bTeLBX7vUetmomo9cUWUiqS/AL5MD5Ic7tEqTKpKAywS4
         xoy/MwFduhj0ZcUrapCcyVPdgiEB89sGD7h4LlwpyE7Go46cUIr7ik20MH+D+3nCUk+W
         MX64e5HPferq4lfaZfcApwHtr5+5922I3lM28NJAAlSIFmkKN0BaqNOI4fv3osBZ9dX5
         O2tdeYdOfME9KbwoWMsydnseiCB0CKx1/fOCuowjKWpduVqvJu2g4vCK1z2x5I3YqSsg
         01GXWZvXuOFAaZMWOCmyiChjxEdHovxMRnpr6LZfdlE+RjPyNa+lUXgt6fkyPL6G5yMl
         w/mA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776853551; x=1777458351; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq8+U2WZxewGPTZ86+kP7pb8whJIc4RPuZ9dCPJUDAo=;
        b=NoIYujzCYLnYXBfbYS783wDSeK/aFQYoTVxiz/MnK/8xHWUPBBHCb3S4yO6GfP92AA
         L380bQ7HezRjsQ0Iww6J8Up8pT2eZ9oADmEfqTIw3/af5Z22Ck3CBWuM0PK3Hth+013k
         6vHV/5+Wv2fJvDTkJC/b9vYsrzl+aqoEtwTZGNBU0NyZzYyZ9KMvgapQVWpKHvzToakA
         p7mYrKYM6pE3d3KNjt0WbvHUkqoU+jI+UX/GYDjQKluPQPXCJck6EGSeecD1fFGt7gsM
         SD4UWAIpq+O9Knuyiiawq+gxWVNhoQJxY7VRghMhUPus7ZHFARs4aocJT4S7uW4cFF9f
         7QYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853551; x=1777458351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wq8+U2WZxewGPTZ86+kP7pb8whJIc4RPuZ9dCPJUDAo=;
        b=LAhzOuvAy7uILlepmBa6GtxdcgsdVhPOhs2I0U6S3j6ESbKK8Vu5TicdGtasPQW7Ip
         FK5qBPWxYCDamCKfdsEifV7VD0raxROmF43vMksOG49mJGvY0pPzx/rlvFXUJ2UZc5Uq
         z5AHfURTaJQgw16NXe6e2Ncrd3J5po5J/lYZOZuB4kZdByc0JHeNJc8NEk6Z6HjsHWRw
         oTTpU2mkJLFAfbeYYTLJ7MdlkY4IrQ9URtx5IaAdFuqHv+bI+8C3TytdsEvH0WQaddZc
         3zkbk/Ehfk3DGrNNSZOoSonauR/Ki7KmKQJU8ScCbhS/U1Hq5kCtf6OnWWByHU1BtS4o
         474A==
X-Forwarded-Encrypted: i=1; AFNElJ+ACxvvIbwckS5zvGBExWPiz1CR6c0i6j9FEGpGEwmuUgJd374GtMDfHLTpRdnUmJ85I4MMbG7JmyKCuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YznyEsRwgb9j65jcF3j8tLFH7yqGqGNr8Ar/7i3GpNgN6JC6Sds
	Wj2KYsY9zZhXsCh7FGatqhiZXr0iW7hcotJl1Zb1VyV0eYxE2iU4HwVnegnsrPmP1IeVCiFqOBG
	G+rX2qa+aDIQt7yI2zK9gvMdsATDiF0tMQxdaPwhZKA==
X-Gm-Gg: AeBDiesjfTyEVVqROzZHmJh5JZOuCc6FYQm6XNSNRVcLmRlDF3u7LhyNBVRfJLuQATA
	9StPgwvVvu7CgA543tnDsJAMikoa6UVQEUHjwTrbOc1K5tSL4tsJHgFvjQWauLXDpBi23C2ujcf
	Nc7RgJwkxRXx6piZMjSbw+cfwcbqRJJOBkxDvfkKQLR/UaFSnsnA9TvlnIap9oQqQp8lU73D5NH
	sW+MlEdVVNZdBLFerGadXJesnHDgeJ7CI/xuigqMkwOP2asMk1A0+8VOpU2f+uDI4T4gYwSqAop
	HkcKotXLkDYrJfv8tMU=
X-Received: by 2002:a05:6512:1094:b0:5a3:ff6c:9df1 with SMTP id
 2adb3069b0e04-5a4172e7f69mr7060238e87.39.1776853551219; Wed, 22 Apr 2026
 03:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-3-ulf.hansson@linaro.org> <DHW8QV8K3CM1.307C6PW2BM5RN@kernel.org>
In-Reply-To: <DHW8QV8K3CM1.307C6PW2BM5RN@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Apr 2026 12:25:15 +0200
X-Gm-Features: AQROBzCHhHSXfjVj8apklmTonwOpiVF9jPJJQpHw-yRBihJtcF-VZQ649rGH3jg
Message-ID: <CAPDyKFpeSv+fg=YKJE_qc=Q5BfiJFn0tR7Ar8SncqrD0UW1P1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] driver core: Add dev_set_drv_queue_sync_state()
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

On Sat, 18 Apr 2026 at 13:24, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index e65d564f01cd..f812e70bdf22 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -994,6 +994,18 @@ static inline int dev_set_drv_sync_state(struct device *dev,
> >       return 0;
> >  }
> >
> > +static inline int dev_set_drv_queue_sync_state(struct device *dev,
> > +                                            void (*fn)(struct device *dev))
>
> As this is a public function, please add some documentation.

Most of the static inline functions in device.h lacks documentation.
Are you suggesting that we should move towards documenting all of
them?

In this case, dev_set_drv_sync_state() also lacks documentation and to
me, it doesn't make sense to add documentation only for
dev_set_drv_queue_sync_state(). Do you want me to add it for both?

[...]

Kind regards
Uffe
