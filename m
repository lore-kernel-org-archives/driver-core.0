Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AB537E2E1
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255869; cv=pass; b=WhIe3JwYVWdvJrKd/EMF5704ipavsxTGI5c5oqVNIbLrIn8lDyPOAykjIlJaTHsiQbs2kI5g1shZ2GrJEcXIcnJBW/Khnsom/+OZwKGk+MyRVFE1y2khIkwtBFUZZfpaeVQTsbrBwh49z30sz5GVehgRYSgjpEhI0FN9aCKFjhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255869; c=relaxed/simple;
	bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0OXPM4lVlpcq/COA20diY5L6gK2ACqqY4W1L+55NnVVPpX5NOprhYbv0/m/njAB9X7tHzmWHYscIVGU+YIWXspxyASXnpEjcqGBuvKasJt3e0x59CMT6FcdfEjlDW6NIt9MPfTCDx/rew3X+l8lkM3X9OtBboZEAtgtRtkmw5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hFFh+uSo; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hFFh+uSo"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7f69b71f7b2so7685417b3.1
        for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 02:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255867; cv=none;
        d=google.com; s=arc-20240605;
        b=c5QPUwecWdjK2f/J9pcizyrCeDoKjt9GbznZgk4cnPsn8VO79IfD1fu77wn237RSVD
         Kv2ahxHIUJBiemnQKBvqOWCLU4lgCLG/D2D+uqwryyz9KV3TO89umhoFnJ7lSZXHcZ2j
         Cj/28whPo4du6XO/oLabAhdXUKWzdIvPpoK97+csfRgxcPMTgIIwc3hp7szUrwHbaBgI
         O61nNp1uKLOmg6YBR4TPzvlDBMYGbAsMDsGAWhjNzknVGdvgpfIXMpkVz+dteOkk1qHZ
         s956wxEcqalpgfD6gd+EoIeY7L9bFMbBCbxmdzMXV/4z8Fsd0WkbRC0+umYXHBN2QlLc
         Dn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        fh=lbgA0NUCJkUk0L+HW99KfbpvBfi3g3VY+SioO/4hBms=;
        b=aLTFacZzb+EbM07Ui83qgbRlQail68r6waaExL91H5kO4/tXFfqMp3m+hHIzkqLq9R
         y/uDbcniKx5rWeUyGZfFkd8aNYrDmijf1MMnlOrHU+SsBl1zoDpxre7QBCxm0iA97kYe
         vF8LK07fcpTV4RTEsQPIo76y28UaLdzxDdhBxbv2LQ65ttkAJayKOzb6gqAN59Ot1n5I
         Gi8Gur+YizIpE9y4gFrRuR1wK8XhUtAT4g0+P1KLs/7yQDwaj+S8HZzBdzmkMEYMkcSU
         OvEMCnwDnn0y1obf2pkt8guuG+2RWRHJh3lV/ONqnO2mVscFTOTD5DcsTB7UnWALPba8
         okLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781255867; x=1781860667; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        b=hFFh+uSor2++wBXt7yDEEdYM8zpZ6N2nRMaWs27anBW/mkMRecgDILkDMm+eBFL8Uv
         wh8eFY5gqZ+Xl57swwZMUQKBVwCELB6OqdGZkL87Pnr7Ww/TiSvNr5hfkuiRPkke+Qkr
         0ag1DqMd6Wgl4bHF1J+LLe6NJ3xPj3IOo5d2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255867; x=1781860667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        b=NDxcTyS1bgfY5FRhRuoBjzRT8rQz0fMktrYv54iNVdAnL8bkfzjKiZrJGXqWBKTyET
         0HzF3zyOJ2U2NtvUqcYJ0e0GaKlqzxEtjYruhP8HiEoYtD15O7PmLWmRFOTXOOL3aTiP
         vfLYpWteswwEuVIPbMDgNKmZeCwt4sNSgugh3Zyk/+yZmCK4mnHLzt1kbcKZytUqEMq1
         uIf2bV9GvgPd7OmZvHZb1S+dc8eXL7/IGRRgdEqNbclRh0T90u7gJrPCaS2qeistKEns
         ip0+55QyjWq9oEPza0hR11+20cmZsMASAGK6gFXi1t8pRQGIzzdZxIaNkMt4udBkoICC
         4Blw==
X-Forwarded-Encrypted: i=1; AFNElJ8zp0kZkWUE9pzrNO6LXlsw2BXbHtEYtpVFndwGxPpla9nFic3XH4ZkAeh4i+8a9cPP6cYUT3fTk/Witw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0yQRBpvknrEC6q7XIgrFDPAxNCF5M6UUbV95EQ0n8yPueRIcd
	Xtj/DkWSorjZCYKykK8HzKoz2F0aUb9PMuMLiTWvSIkLeBVNR+tCi7LhfREGQ9OWK805KMbMpRR
	5jDoKxlEbtLyNSudNrmE2nttNkDS4l9oqUJ/j7+Y+
X-Gm-Gg: Acq92OF6EFFLSl0nylYTixrdMBYN5SLTjudL4F9oGVKmlXETlEfbD1J+KGm8eRS5Z+j
	iC7StYRrNsxfKVuyBGP0KMY5wVlOzEUpagwQLoX8+RSGHxS001Ezmj/dfHQpQXualeC7SjZItZj
	eLRwS+EVaai2g+mW9RJ35DzMxQFhP0g/1qOmsRmfr3dbThe4HafJlpXq16K642I8H88dmSvSy+U
	OBlJQa+FAAlPYgpNys8IswmzjH5/ygSBLKTkgR4ct60WrBVI011ucH+rHHc2EGZPYo0XVaTfbXI
	AdJ4kiQo
X-Received: by 2002:a05:690c:3a0:b0:7cf:af41:50b0 with SMTP id
 00721157ae682-7f7b8d248damr20618557b3.36.1781255867482; Fri, 12 Jun 2026
 02:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-12-wenst@chromium.org>
 <ail2VcubjT7HNGUC@ashevche-desk.local>
In-Reply-To: <ail2VcubjT7HNGUC@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 18:17:35 +0900
X-Gm-Features: AVVi8CeDuG6qw5zFxFcHgtnnMaKWsSajO4ZT4D-k-SPwtRIr1WJR_hE6bMB1VZI
Message-ID: <CAGXv+5GNfWFinO1E=5X46xnBsQpY-_i45mq60eeQu=U3Z0MtDA@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:45PM +0800, Chen-Yu Tsai wrote:
> > The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> > UART for BT. Currently the driver only supports PCIe and UART.
> >
> > Add power sequencing targets for SDIO and USB. To avoid adding a
> > complicated dependency tree, rename the existing power sequencing units
> > "pcie" and "uart" to "wifi" and "bt". The existing target names are lef=
t
> > untouched. The new "sdio" and "usb" targets just point to the renamed
> > "wifi" and "bt" units.
>
> Why can we do that? No breakage? Only internal names? No ABI affected?
> Please, clarify all this in the commit message.

Will do.

In short, the target names (which are not modified) are used by the
consumer, while the unit names are internal only.


ChenYu
