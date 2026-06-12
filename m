Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38C37BE6B
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254540; cv=pass; b=hVVtL4TwvvkePGAfvMyMj/MyAuaiyBUu8Ns0QFaLfj7GFgpl/vWXWKa0TbHZiIbTJv8vS3Yj01TAIwNo5+Ac11nSvR2ZG+JlAJxquftaPXY4C3Vl2pPrLQk1NZ092FEoMqb0cKRO7/wPMYLemaCQBoHUAaHouj4GNulpYcfTjLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254540; c=relaxed/simple;
	bh=qoVKWlTC8A5exFZISdXU/mz0LuRqilEY4d0H6+v5zeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPpGfHcHTveX3vNIBm2w7dImtzNDRgco5qqMT7qJ+nNnhXCVbyFnsOzUtEai2U27y4qstjEyQXFAQWkYnHRoGy3/DFS+V54lE0f8Wp9rIqK78PsIMugf7E0v3gsLqdOQce0JERxI4Bb73D32LzX9bpMU3ZBIAZ28rTKDiaH4azM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RBSMRpct; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RBSMRpct"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7e2fd65f968so7333607b3.3
        for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 01:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781254538; cv=none;
        d=google.com; s=arc-20240605;
        b=YpgiRyMqPsMWuGKwkT4T/ciTyiCymGRBg8jgTbFwBUkuHrsPnuuKWpBTmEyPoLnHWc
         HdshSsCmD7749KRbXZ+O8ZYXd4n/7BF4qIVH8dTSnf5bn50f7Gm2A4OO5FzKbd1JYbI3
         iKLVOtsflFmqTkHj0UjjtPLJTaq4jj0tpmrqjHQ0t/+sqb+qizlnMXpXQcyQBklpxjJd
         7kwCM/t1foPcHr29qFvxi+L4BOEnIvA7loJnRExX8kCcTGTkuOHLs3eTs3f+9VantxQa
         tyXSRXlO7B6KW344dPQCNs14AsJ50kiRPEEnqTq9REDtn/emOO4GP8hlsf2PQAzO6Jgp
         YOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        fh=sqkW2ijw6Cxla/WRYnL8N9nieV0kb9aKKGJUcjBJnOM=;
        b=hKazbKc0bo1d+wCLixAYAma0b7f0JcQnfJ+fBg6WfWAXcGKH5IJeyJGwT2X/C1cgNF
         O393A9++oxwTdgArY6j/KSW7Z1FFsYoMPunScvxdP8Ea/j9wRytz5bD1iVWRAEbHClax
         cBYc8ue1SjUUQYb5+oOisj3IojH1+L3YWy+0YMxX69rdpDJIAb2MqPYlFRvi3Hk78rNQ
         8bBxdQeIaZNR8Lp3TKHim6fHtBFHx/6d3SDSiEmGPIRIWQ134LZhreF4h5wlMmc5u8FQ
         V57ZaUjyiGOZaqxiJj/OugrMWAiOnuU5ljuh9ngif9PbqqWML/rufijLOb3LssvLybTi
         QqTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781254538; x=1781859338; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        b=RBSMRpctyusS4Etrc7Pumh2eDSAezqTAhDNblhmfi1TbocYxRb0NQ4dGDQSXWn628c
         FEALdEBUeFDUXhvLghPRTNzDfG3geeyK6RAPxqXuZmN9jvrrC7imLev2VjI2QYhKhGTI
         F+Bq6hrKizrZNZV3MPSGTFyb75HZZWZ97CMuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254538; x=1781859338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        b=PMeFiyl3Usww9YcahXI/Hs8QIcbHCNckvDsoRFpB/2hE/jkZH67gQ9P4kQiEvyrAAH
         xYDPL0OTRq3Z/IbwLxI+l9V+8Vk4/qryONGJgvP43uUZwF8VE10d7Ps04PH6DHoygr/L
         QRJrJ8uCOEFH6ORjv03+BL1oVTCnYSuOPaSGZkpZyuE2/BBYqrWXgpPK7A6oDbj8Y85w
         KQp9K1/kkzoKonyKjotk5xCLanMP5otXIZG0h4nMPToSnBs/f0pY9XKOmxq+MgMSuEEf
         Bp6+Rm6H2XiB5Hl5uCsOsedrdtwwXULVempBFhb4NpyC+kdcIRWWZC320wzqXe2Tauj5
         iJYw==
X-Forwarded-Encrypted: i=1; AFNElJ/R5u90pgMUXWHtI+iLJP0gNcZr9POa+GGpvbZqYjd6a30l11wh5thpGnoxiRF+KEaCyl2ZaCGlvXHIlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCp2odOck2ubR+HBnjoydOIK8yWK0OUK1tu2/ALDRHSI8pjwT9
	rt6cUf2Ah4QiVMI8WIWkdoa6jShTCjsgErM6XQ2nhr+MF2zHiZ/vQgGLddP5rNBhRiJV4McEeD2
	GeJNkk4wS3i+jYzaVsE5I7Dbvr9zu/mQbpf9NrXN0
X-Gm-Gg: Acq92OHLEK5okPttpwykyq8zCeJRMXUTuHvtSVI5Fr8WlymKwRs3hluw1z5fKsXLSCQ
	wO6TEQvHZustDu5FRdaX5P5OrMNy2I8AQDsVmDb+aAiJq6/U1LnJG96o6LGyhpS4VX6x+k3h2ms
	ZvCIIv6ACtfqC7+egs+DxZvytBiibi4lfgj3UQ59nn/LPxK8syttAo8sf8IsMQYxKy3Fu0xW0d8
	qe/+iObptHHYTie6HjacerHxmbmdwu+c7TDBb2gdlfRbRdFW0Ki0xoVHXtMwUAW3aTyBOXz9Avx
	ML1GGyXH
X-Received: by 2002:a05:690c:e3ea:b0:7f5:87d3:c38c with SMTP id
 00721157ae682-7f7b7c3b073mr16472667b3.21.1781254537877; Fri, 12 Jun 2026
 01:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-8-wenst@chromium.org>
 <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
In-Reply-To: <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 17:55:26 +0900
X-Gm-Features: AVVi8CcqxBgWwqPnctKiq9OR5bHp6we8pjEGtqp_ZFOZvY5Ttt7Fwncjoqrnmf4
Message-ID: <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
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

On Thu, Jun 11, 2026 at 6:11=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 10 Jun 2026 10:40:41 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > The new M.2 E-key connector can have a USB connection. For the USB devi=
ce
> > on this connector to work, its power must be enabled and the W_DISABLE2=
#
> > signal deasserted. The connector driver handles this and provides a
> > toggle over the power sequencing API.
> >
> > This feature currently only supports a directly connected (no mux in
> > between) M.2 E-key connector. Existing USB connector types are not
> > covered. The USB A connector was recently added to the onboard devices
> > driver. USB B connectors have historically been managed by the USB
> > gadget or dual-role device controller drivers. USB C connectors are
> > handled by TCPM drivers.
> >
> > The power sequencing API does not know whether a power sequence provide=
r
> > is not needed or not available yet, so we only request it for connector=
s
> > that we know need it, which at this time is just the E-key connector.
> >
> > On the USB side, the port firmware node (if present) is tied to the
> > usb_port device. This device is used to acquire the power sequencing
> > descriptor. This allows the provider to tell the different ports on one
> > hub apart.
> >
> > This feature is not implemented in the onboard USB devices driver. The
> > power sequencing API expects the consumer device to make the request,
> > but there is no device node to instantiate a platform device to tie
> > the driver to. The connector is not a child node of the USB host or
> > hub, and the graph connection is from a USB port to the connector.
> > And the connector itself already has a driver.
> >
> > Power sequencing is not directly enabled in the connector driver as
> > that would completely decouple the timing of it from the USB subsystem.
> > It would not be possible for the USB subsystem to toggle the power
> > for a power cycle or to disable the port.
> >
> > This change depends on another change to make the power sequencing
> > framework bool instead of tristate. The USB core and hub driver are
> > bool, so if the power sequencing framework is built as a module, the
> > kernel will fail to link.
> >
>
> That bit needs to go away I suppose?

Yeah, instead we need

    config USB
        depends on POWER_SEQUENCING && !POWER_SEQUENCING

But I ran into a dozen or so drivers that have "select USB", mostly
input devices:

    config TOUCHSCREEN_USB_COMPOSITE
        tristate "USB Touchscreen Driver"
        depends on USB_ARCH_HAS_HCD
        select USB

Kconfig complains about unmet dependencies.

> I see Andy has some suggestions but in general I like this approach much =
better
> than adding the pwrseq_get_index() function. Thanks!

Thanks!

ChenYu
