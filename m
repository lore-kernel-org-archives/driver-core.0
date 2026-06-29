Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B860E3A543F
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 06:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715616; cv=pass; b=Wqm9u+vNGbPJpVJbcMxwFae+1hk+WQ8aiZGRRl4bEzRzNzbpNJS6MD+fEI8nFpykpLia7wzZrBukb9pDY/tzwyK3rc+FpyI43J5+gVl2tPnWdEMP0ivT6E5u1wvy3Hp9FG31kKyHjQ1T16WWbDJ85q77OxGMCt9boG9EFowZKoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715616; c=relaxed/simple;
	bh=wtT+R2QEQMbY0+UAKHyPbJ02qh8DU6NUrzght/3Gr+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6Y6oU03NjFC+Ul3v7KdoKNlvkD5h1xKTzGburv2XTCrVgw/uYMg/JR4EpjvYnqi7h9fOIF3z0KyyE7n3/uaIh9eQ8WTOtEeBZm611kUaa6WN8KvuP1ebDe7Smg9JJ3L/+B0Rfm614CXIM9VjaNa2yvZz4TJZYk6XbOGy0Ab8H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aGDaQJjo; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aGDaQJjo"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-664d910cc75so577967d50.1
        for <driver-core@lists.linux.dev>; Sun, 28 Jun 2026 23:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782715614; cv=none;
        d=google.com; s=arc-20260327;
        b=dcq7FFBPkEbOvTj/NJ1TEtJOaDjnqgmDQQ1O+w5jKpIz8VfsOhL4ju9dda8ih5smVv
         iLIlCgomLM6Pe9pa20PuDBMlGHr/PGpMknbqXp7QZgVbapxuFstN+6DBliQTbu9mV+8d
         RZj1BsRuaZug9w1q7SPVeVKf6oMC4E682B20mEWu5H9M2iAk32l1PTqzH2V88N+/Nv01
         jdN54QYgUSkIfOWJA96vdPDrkBSV8JnmubpswhyKPdReOOL7Hx3CKthEETmVMji/tBm4
         sWNzND/eU+J7nwkCAwxXyQdinShquv6sIcBfHTR30PyeMAtyBgAQM9YcACaIE02M/bIf
         4gQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        fh=6EmY6BweVms56bdhTMetFMIibhIeFiU/krPcKZWXgHo=;
        b=RxqBb7/z+bDE9Yq8kMeC1/7xLYkVqbALWUGss5YBQEZF4JirOGiFsATdWE3Htrsplj
         hJGsiLdt/9gIsSgeYZZVWtcz8tokPrgIDM8CFPZlSu/KI6lv/Mi0GuW03wcsIw9V2wtD
         LarP8o/+iBPBykwv1hhTkBIUVzu5qyrwWldY4W1kgjf7jM778L10/kscCC6Y7ek93CB+
         0cTU5NjbxAoqZBvY0MsL4QZSiiSKyGzp4JyJV36YJ0Sp++0r7fftTE+bs8LrOkrXMawt
         7ZOk8ytaBC7/s8C2qY8L4SfhCKHGnJi6WunfFrDiYmPqxPTLiitT+tciphK9CdyiVJ4U
         vbew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782715614; x=1783320414; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        b=aGDaQJjoLLX70RnoQPm1Th2vBk2AvMczhmwSPCi4mLSNneQQilVvtpuKEBKWsCa9XF
         FkaqwUE3UjiuhlqLnHxmQw7Qkl1h9rriRrUPoaHndJDNUoTFpe9n83wftfZrO0VTA2ux
         baoJDnOqzyBcGyfAGyY8Hym5o2180wZUlRqpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715614; x=1783320414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        b=ogA8Ep5tGk8/VrfzivfXNPDzXizeIfxLN+fK8z6zuqf8dfCjXLPWso5nItCgSzF/W4
         MnTn6mjWygsw3pmVKwC5OgxVXf73iwtw4l4bP8h1A00Qw7dbSCgTfQNjorq/BkJa8Oz8
         3BMpxNaaaq6m2IIf60G6CPA32p96KLoOMtC9HjkPlHf0s+7qP388/z998zNpyU527lOy
         PkKY+BZnhJnrWOgwMP5e7t6GUZCHS7BaLOMoSM9QrRfmrKxY/+WaYEKESwyhWLExD5Wa
         +09tZ3NPOVDayRyDE1MeFi8kFFDqSiHyQRKgvOi5Pz1mihn4mPacPbCISHMIbU4EcHwP
         TQmw==
X-Forwarded-Encrypted: i=1; AHgh+RoizHm1V8ORdjKlSUlJzDD8bjhHgAgWHUN3rn+kQyQ+zF2AXiTFCLSphnFjWSUH06lGH0x+6Tqr2vn1vQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvYRN0i1cEjB1yiKKf/+akH/ojTNhOplDgzFSuODMAPHr5WYff
	2f7u6OcNmNm7mpaZ6817lzl/KPpLxksQxXiz0BzE3P68jeg4KMWwLGADBSB0UN/O6Alg2RxuM5I
	BmIQToNrP3iZeia3/7yVcPmzRcNLC/tkzoMO10ozf
X-Gm-Gg: AfdE7ckHuzwGyMebCG6TIleIntFMqmljEtx4FRxHIinQUOkPo0SSEaevY7DzPvDeNov
	5iQB5QAAcJ47n1rkzq0XAT5zxiENNKz3SgWQRAxaXH40nYdQRPflH00ab820DeWnBrP+4DdX7Jt
	Pqlfs2ma3MMi22FhfD0F+su+RnGFxooyFUYhUsT8xLsFkGZl7HLFkAhsIuDz76lF2ph+ui4e2Aw
	eBB5ZaHZ2iiXZ21+E9ldDCfPb3j5et4xFQ4uG/BEe/zmo3P/fDNjSGTTz4FuSE7ufH+NLxTx6hv
	lytdu8cPYJX5zsxWS68DYMN6mps=
X-Received: by 2002:a53:d24b:0:b0:664:ae6a:f07 with SMTP id
 956f58d0204a3-664ae6a108dmr6236222d50.81.1782715613698; Sun, 28 Jun 2026
 23:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-8-wenst@chromium.org>
 <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com> <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
In-Reply-To: <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 29 Jun 2026 14:46:42 +0800
X-Gm-Features: AVVi8Cf2Jr6SG6fphp7pdwOmuJjdBOlHCbVmzmc43-YAOHTJXjsvshlXzGC6cxU
Message-ID: <CAGXv+5Gbf8+=hMZcK0pYraC1t4qmDx_WVPkr2RhWdm3bq_LZEQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] usb: hub: Power on connected M.2 E-key connectors
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 4:55=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, Jun 11, 2026 at 6:11=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Wed, 10 Jun 2026 10:40:41 +0200, Chen-Yu Tsai <wenst@chromium.org> s=
aid:
> > > The new M.2 E-key connector can have a USB connection. For the USB de=
vice
> > > on this connector to work, its power must be enabled and the W_DISABL=
E2#
> > > signal deasserted. The connector driver handles this and provides a
> > > toggle over the power sequencing API.
> > >
> > > This feature currently only supports a directly connected (no mux in
> > > between) M.2 E-key connector. Existing USB connector types are not
> > > covered. The USB A connector was recently added to the onboard device=
s
> > > driver. USB B connectors have historically been managed by the USB
> > > gadget or dual-role device controller drivers. USB C connectors are
> > > handled by TCPM drivers.
> > >
> > > The power sequencing API does not know whether a power sequence provi=
der
> > > is not needed or not available yet, so we only request it for connect=
ors
> > > that we know need it, which at this time is just the E-key connector.
> > >
> > > On the USB side, the port firmware node (if present) is tied to the
> > > usb_port device. This device is used to acquire the power sequencing
> > > descriptor. This allows the provider to tell the different ports on o=
ne
> > > hub apart.
> > >
> > > This feature is not implemented in the onboard USB devices driver. Th=
e
> > > power sequencing API expects the consumer device to make the request,
> > > but there is no device node to instantiate a platform device to tie
> > > the driver to. The connector is not a child node of the USB host or
> > > hub, and the graph connection is from a USB port to the connector.
> > > And the connector itself already has a driver.
> > >
> > > Power sequencing is not directly enabled in the connector driver as
> > > that would completely decouple the timing of it from the USB subsyste=
m.
> > > It would not be possible for the USB subsystem to toggle the power
> > > for a power cycle or to disable the port.
> > >
> > > This change depends on another change to make the power sequencing
> > > framework bool instead of tristate. The USB core and hub driver are
> > > bool, so if the power sequencing framework is built as a module, the
> > > kernel will fail to link.
> > >
> >
> > That bit needs to go away I suppose?
>
> Yeah, instead we need
>
>     config USB
>         depends on POWER_SEQUENCING && !POWER_SEQUENCING

FTR:

Somehow I remembered this incorrectly. It should be the following instead:

    depends on POWER_SEQUENCING || !POWER_SEQUENCING

and the dependency issue mentioned below then goes away.

ChenYu

> But I ran into a dozen or so drivers that have "select USB", mostly
> input devices:
>
>     config TOUCHSCREEN_USB_COMPOSITE
>         tristate "USB Touchscreen Driver"
>         depends on USB_ARCH_HAS_HCD
>         select USB
>
> Kconfig complains about unmet dependencies.
>
> > I see Andy has some suggestions but in general I like this approach muc=
h better
> > than adding the pwrseq_get_index() function. Thanks!
>
> Thanks!
>
> ChenYu
