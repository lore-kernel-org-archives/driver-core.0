Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6D25B0B2
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 05:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781243199; cv=pass; b=YtrBbqXyFlmF0dzdNtT/bx7t9pJIX1v5TioPthqhBHqpRf0DDXHpjWXoQty42ZHwB0pJ1Yix0/PG+VYSpMcpiUctlEjx3k9/qWyZTiOzE3riM5gqTr1RbojpiGdBqft1ngk0KNtPCEEnRmYJQ3VozOt5ai4VxCw+CQYEMyfnHlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781243199; c=relaxed/simple;
	bh=uxhicmxU+8eIG2C29hx4vflsMsbZnUfDPDvn7qOTo6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktY5HWKWH9LmAkpw1YgJMGP4OntFS3iNq6XNsWAXa0qfCHzqzZSpF6qMqx/Hu5tAJyQkA0wpr0/1O8P/qcPjszc7kvxdGRVjQUsn/fj/Fw7fHlFV8K9d938ETSowe/MTwVsYs5E/Hh7x1brJmc+edSEh3216H1GN99sIqih1G1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LbEpQFLK; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LbEpQFLK"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7e87602f26aso6785117b3.1
        for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 22:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781243197; cv=none;
        d=google.com; s=arc-20240605;
        b=i7cC+0gZsVZdnqHr+AwMkuWvDXBwleDFOE810cO4n+N1zWw/NlA3FY1eWmKl1asety
         wSHFcs3YAIcu/FhQZHXrH1ITGSkHCAqkdUwCE+gn+nKjbLrNI04SSUzRevf5Y/ktvJ5S
         Ic6vJ/n5wn2MiK5VtRRBbE+cOEIfxWJ61Gs65wLUzzHXZu0AuRtMxSNzlUOBoLIuANOq
         +3rgwKjlGJSnAYu/yy7ypAYbjXJmWCPT8p9718MV2F247I3uPSi7b4X3CoJT86Zb6d1p
         bgTjVnDsVV3fAJpBwIprmCouyIJg5svm2dPKzVvwExLuAMtUAYSkLn1oxJzc242dtvqy
         gLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MHHVj+Zx0+/vBQAJBv7r1n57GCFzoErkyz4ZsU3+esc=;
        fh=h9+JwJURoR29aeTeh0BceUkq47QN6YfZvtV5kkcz+LU=;
        b=AlRKRAGEns+DVtm4shF909C0MblGqcojx/JzfdNmW34hf5eDzo+l++H91sNpofOBlx
         +diIYrMloDmb+uGMsTNJ/8M3ocm4UQgXDXEX70JCJ09xmbLXy5PrjO7G5Ch9l2OmQghN
         sX1GvhxNhYOds+kwn9XMpq6r5TWTI4i4Dusl4mvBxjk5BL6ik3/VKfveYIcVdCyd6bVy
         VkLpapqpDVjhC7cBumfLmelTcRzXkF8A4ZTvCuWAtOdE4vH+BiBCjKnFE3m+G9A/PfkS
         BjP6qYwo7dOibZqkGrhZd+Z6zzWAE3JHOQQ9Ewyfmg88K1TSPcorH0cNjAPMb/PE7Xs4
         qTyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781243197; x=1781847997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHHVj+Zx0+/vBQAJBv7r1n57GCFzoErkyz4ZsU3+esc=;
        b=LbEpQFLKnDrTyVdHzOjs54TsK1Ezja5oUcULhnbX3eqIY97XIEBr1QEfTHXebzI2hc
         eDLecfXPdjCdpt6PAVHcuph9Frtc5vIkSfDwk6HwN2uuuoOnBUuQLKhXTvSpxXMz2WJp
         O+ITHH8ko3bjUMTswxsJUkIgLjkkqSbwZhUZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781243197; x=1781847997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHHVj+Zx0+/vBQAJBv7r1n57GCFzoErkyz4ZsU3+esc=;
        b=TZ4jJwJY8UqTcCDcm4MsRexPzcArhaLnjFo5nC0vv2FmxAmQpmyrwnnsGS4SVcVpOs
         5iFmVJg5mIi3XYI6c3qIexMpdQzZgwruutzyMmqZf21yH0ZkXuCGe6IzMJId2zlnLd6o
         CKnB9qE19I/3Q7HmPTjFcnOtVR1vQPO6KuDBK8pOv2KDNA81tkXZh7kHzFflkjR8kwxF
         7R9JNviavVTkUv0yMpTaYsZseRMArd9dohHb/2rKspfK0jM910UHahlYdu92cE5Lt+lc
         v9RUhOUnkMIoJrZyZnUR1DAEr14ibH2v8tmkDau/oJeYTTX7rrQBeZNUjQ2ymhK8OU6b
         kKQw==
X-Forwarded-Encrypted: i=1; AFNElJ8M9Yt4zmtT8H4lCXf90cFOUWOkKoQo6SvSihdAIdpx4r7jjfutVMIY4HmTJDqpWDdYmqcyuYuFurXzzA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx70L4cy6xti1djsoD8EVKwtTKMKdzgjQX4zFaB2PzKLy1yPHnV
	Tw+hmOQjh/EmsSCiwatrH86Uuj1OyPGdaYmSwm5ivyvR5BuQhCY7nExIHfy5m/qHbNMkIxG5jDz
	kRRMwyLUHxDC39qv5/g7ob3PyKBnqeJr7nZ2YD/Bz
X-Gm-Gg: Acq92OHXhfD5XOluMCAy1mpjY9f1UciV6NpysvCLCfN/dCipl4T7XOjgdngfCmc20Du
	7pRgV/AZ7eeBccKxb1eQkMtFsUPAM6xLqJoMcC7TmepTYCYNsOSf70BBkSTKBSEFLJqPTss+uHz
	fPApXe1R/ATnJURkqnzQH9SuvkCh8zS5FEMxoRVgKxKaZv5KXW9v7rrQ/a2h78gCDWsR/EZAUWo
	Fx4CGFXXes56Dks61Xz3RTkT9ZbPYNSTIcaafzJBLwGHFZyg4s+z6dAlJuqYKUJQXuKpqKzXbq8
	oU8CjKqr
X-Received: by 2002:a05:690c:4441:b0:7cb:93d1:d804 with SMTP id
 00721157ae682-7f7cc52611amr7898237b3.7.1781243197392; Thu, 11 Jun 2026
 22:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-6-wenst@chromium.org>
 <ailxrP-_9_NL8qnN@ashevche-desk.local> <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
 <aipz2zMFcdnZYTxS@ashevche-desk.local> <CAMRc=MdRN7YitmMX8PknbzLh+MdsWm+dDg0MLtCVYOorqNobTw@mail.gmail.com>
 <airY6IMz2KFz_z9j@kuha> <aisEccAOm3qoXjxd@ashevche-desk.local>
In-Reply-To: <aisEccAOm3qoXjxd@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 14:46:26 +0900
X-Gm-Features: AVVi8CcqLILhEQ5p8_o0FiDM5Wwe_hy_cZp3NZb3BqN3lFzIwdQDiPu3OCyJS60
Message-ID: <CAGXv+5Hf_V4=mkAc3pN8_K9i+FfH2Wv7HVJBq71-f8sMFYL3fA@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
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

On Fri, Jun 12, 2026 at 3:54=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jun 11, 2026 at 06:48:56PM +0300, Heikki Krogerus wrote:
> > On Thu, Jun 11, 2026 at 11:35:13AM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Jun 11, 2026 at 10:37=E2=80=AFAM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Jun 11, 2026 at 04:20:58AM -0400, Bartosz Golaszewski wrote=
:
> > > > > On Wed, 10 Jun 2026 16:16:12 +0200, Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> said:
> > > > > > On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
> > > > > >> When a USB hub port is connected to a connector in a firmware =
node
> > > > > >> graph, the port itself has a node in the graph.
> > > > > >>
> > > > > >> Associate the port's firmware node with the USB port's device,
> > > > > >> usb_port::dev. This is used in later changes for the M.2 slot =
power
> > > > > >> sequencing provider to match against the requesting port.
> > > > > >
> > > > > > Okay, would this affect ACPI-based systems? if so, how?
> > > > > > Can you elaborate on that, please?
> > > > >
> > > > > Is it possible that there's an ACPI device node associated with t=
he port like
> > > > > on some DT systems? I don't think so and there should be no impac=
t IMO but I
> > > > > also don't know enough about ACPI.
> >
> > There are device nodes for the USB ports in ACPI, and I think they get
> > always assigned in drivers/usb/core/usb-acpi.c.
> >
> > > > The API is agnostic. There is a possibility to have software nodes =
associated
> > > > with the port. I think the best is to be sure that ACPI-aware peopl=
e who are
> > > > experts in USB will check this (Heikki?).
> >
> > I can't say what's the impact from this patch - I'm not an expert with
> > this side of USB. Is there a danger that we end up overwriting the
> > ACPI node for the port, or something else?
>
> Exactly this one is my worrying, but I haven't checked the actual flow.

Looking through ACPI code, ACPI_COMPANION_SET() is used, which boils
down to

    set_primary_fwnode(dev, acpi_fwnode_handle(acpi_dev))

This is called through

usb_hub_create_port_device()
  device_register()
    device_add()
      device_platform_notify()
        acpi_device_notify()
          usb_acpi_find_companion()
            usb_acpi_find_companion_for_port()
          acpi_bind_one()
            ACPI_COMPANION_SET()
              set_primary_fwnode()

Looking at device_add_software_node(), all swnodes are secondary.

set_primary_fwnode() seems to be able to make the ACPI handle / fwnode
the primary, keeping any existing fwnode as the secondary. However
if we do end up assigning a primary fwnode to the device using
device_set_node() as in this patch, set_primary_fwnode() is going
to complain loudly.

On another front, the ACPI representation of the USB ports looks nothing
like the OF graphs, at least on my X1 Carbon:

For a usb port device on the root hub such as

  /sys/bus/usb/devices/4-0:1.0/usb4-port1/firmware_node/path

looks like

  \_SB_.PC00.XHCI.RHUB.SS01

while a usb port's firmware node link

  /sys/bus/usb/devices/4-0:1.0/usb4-port1//firmware_node

resolves to

  /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:19/device:1a/devic=
e:29

Neither looks anything like the graph "port" / "endpoint" node names.
So maybe we're in the clear here.

Besides the loud warning from set_primary_fwnode(), the major issue stemmin=
g
from a wrong node is that power management (through ACPI) is likely to fail=
.

If we're still concerned, I think we can skip the assignment if the fwnode
is an ACPI node, i.e. check it with is_acpi_node().


I've never worked on ACPI systems, so this is just me checking the code.


Thanks
ChenYu
