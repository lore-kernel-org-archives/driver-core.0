Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BDB26E70E
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784176309; cv=pass; b=DYGSeiKRFpuQ+dCV02dHmrq8W+OUg222OjGwlDaGRaYn66bPwNNZve06Y6bBAwuEKDHT7mbt6KRIF7RhDGWWMzVSttyOT3Cx+fAbeHD7jxr2HYPEc2SSAPQOS/ot4xKwBynIZDokMmJFDAcYYZcQD9i4IjMERrDzehWlcPaozac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784176309; c=relaxed/simple;
	bh=nhYyNn6r73D9XtB76IT5BMo5NhG30UFFcOOZMpuXDho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6pyQr0cyLioqIJixavDVqIcKD+pm9LtdiqrTrwuC3Xnkgf8JbKf1/ETweNcPT3dkn80koXUrQy/5VNBkzsy/fyUJEp3ICkZ6g4m9CUFf6zsNArLoTfAHVuERM7M3OL4FMRN+e6Nnv809MrfiZB0EwtFfFfLPzyuhvBNG2qm7B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fLQe+CBZ; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fLQe+CBZ"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81ea0b7d137so53457817b3.2
        for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 21:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784176307; cv=none;
        d=google.com; s=arc-20260327;
        b=p9VaFPv8EBrLj5pUIO142h63MPMeprPyNvtuYBp+rNEdmGGlFpPIKLUgJ6QtcFkEix
         19v3E+lMQ5xlgX8QNJzm288pvaodxFyHyJ5ulZgkXr9Z6uaeRQFAuAbnOl2rhsaPMXVE
         JpL+iERwukLuM60tCxB9T0czj+qEC5MNOri/dnGTBkHWTIGMyKFfas7mYEAXPfqPYINv
         4pjEcj0dDo+U+Gn3HV9wWYIpmcGdvua1IQak+96EO8q5GfCMbWZCJ8fb0j4FiTNNSPXo
         RNaLiwYDOLTTP3j14XHJfUSRhh+C/oENDCnPxrnpL7fekJNY7jrKAmKKgBs6IEPD4Nmr
         7FVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        fh=2L5+XKEDc9Co/xwEKnJY1pwuPkN3eXboBCPog5dewiM=;
        b=n3bJcT2lX2Q0n3xl0PqyovTnGQKRUBPs5QFs+x3Pvn0yWTkAHIN1vKiE9SNBzO4ytX
         vQoGshVzZMfbg7mvi5KqOiGQ3hZi4Hd6f5aR3l4W+w7ccj6V6ddZv9PAgTs50cKRj+pn
         TuUWbwEJxgacpxmB1DV7snOrQz6KPslaXN1hLxUECKw0q1fjdvbN4k20vzjxYB+yGJ+m
         dgDYEEr7R91NFemcNvFSzzHTMx71Zn1ndBqnIKNoCMc5nxfq6SlbTyOBzK0gi2iadWUl
         MMRiB6XUv58mc6LC9QrPdVvUZs8ErLv+ynsQ/A+p44wQamN7+FryYchgovW4lDViRYEl
         Jx1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784176307; x=1784781107; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        b=fLQe+CBZdSQCNlqfc/Px8oFd6YrTMS8KGHfLx0BVnMBX46O7qsZ5qNy4GYFhgaGQwL
         9molHXv0VYkpR9SGptzr5D/SPNSilITWdW/pMKmF4annhXFebreCEJCKVYSs8DeHsBdE
         6EQlY1HGT0Yud4PqpFcBS7kdNHV0aKG9NIxc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784176307; x=1784781107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        b=mbLhT+T0LhAoyI9/P/SA1JLJgz2q0BYBMIM9pxGmpynjswOg44xUGR/SU3uT3X9JIp
         g4vM84xpvtqxlLt4b3qriLOVRzLIfe4Og2CSMjVLrIlM2odfxRoN/THC9VBB++jftN05
         5fnPhzcXSGQlheBIreUhGlYtwveD0o2CT6EGDODGZMnV8TGQI1vbeDVPhckaRE39mq99
         yt6WYGTMCUEEhWogMXTN9WGsizIJuY8r/ccnfAnZri8tCpNqNRkpFnidoNozziE55yuD
         Ur3EgKn23EgO0ZUcfwoHJSmixQJRjL0+QbpaaTlPkQ662w+OpDc6dQJuEcs5UzV8D1T/
         jCsw==
X-Forwarded-Encrypted: i=1; AHgh+RpmQTPeJteDmTZcjVlJnDZnFDjUd6K8/HkeaKkD2uFmbLAMYxD/oflWMvwNIvWq1I1qZ1Xl6KsdCIrC3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+Lbk0tV1LOxh8U22sBJxTZpO5q6otgICahNV2DGbvnohNRQwD
	nSEjFCwhmoYYHTk7H2ooqSuahsPNIUOzzUT/K95gAjfx7Xe8ZI9iqX/55rBNqV52LgEMDuXiaQo
	rbrXX+0Ga3q1A32ONiRz1CJpVDWfFwvNq9V1NytTS
X-Gm-Gg: AfdE7cmLc5MyRJLuxjsfVr15SMbqxK9vPIftI9fnYAU1Jd6T2jNytbSJ8yJXEC0PHAd
	P10NglljL9t/HrPI/QhhCJbm8Cs3pEETp5i3de0nglzTPPa7ar05Liel6iAp2n+K3T2tCNWsunp
	7zEE+th0LC35vRqwKy1DeOs+8SHuXF+RWh2aX4pZXgSopwmK92P/dDsNkD1yth+jOPTkQuoIAlV
	3x5fTmOym8tON7+yHDK5lj9Offo5aXAZVvdoy+7T6lVG2AFBbO7mPR5iZrS+ltchXvh+E4wq2Mi
	myERBjL1d1DMPknt
X-Received: by 2002:a05:690e:1c0d:b0:668:19ff:7eff with SMTP id
 956f58d0204a3-66819ff937dmr2943635d50.38.1784176307120; Wed, 15 Jul 2026
 21:31:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-7-wenst@chromium.org>
 <aldQ5odptfmK5aCw@ashevche-desk.local>
In-Reply-To: <aldQ5odptfmK5aCw@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 12:31:36 +0800
X-Gm-Features: AUfX_mzQbv55XMQ4uR8jO2hQgRvrbYnVnLlttvP6FASpWrSMQxMLCCNzy4VYT9I
Message-ID: <CAGXv+5FAHZP-u1ZyWSUkUrOx7R5-YgBs5y9V4mGTycyrJG3UKA@mail.gmail.com>
Subject: Re: [PATCH v5 06/16] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 04:53:36PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
>
> ...
>
> > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>
> What about adding
>
>         struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>
> to the top of the function, and...
>
> >       port_dev->dev.driver =3D &usb_port_driver;
> >       dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
> >                       port1);
> > +     /*
> > +      * ACPI FW nodes are associated later when device_register() happ=
ens.
> > +      * Skip assigning one here to avoid potential conflicts.
> > +      */
> > +     if (!is_acpi_node(dev_fwnode(&hdev->dev)))
> > +             device_set_node(&port_dev->dev,
> > +                             fwnode_graph_get_port_by_id(dev_fwnode(&h=
dev->dev), port1,
> > +                                                         FWNODE_GRAPH_=
DEVICE_DISABLED));
>
> ...shorten this a bit to

Makes sense.

>         if (!is_acpi_node(fwnode)) {
>                 struct fwnode_handle *ep;
>
>                 ep =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_=
GRAPH_DEVICE_DISABLED);
>
> // Is NULL or error pointer is fine here to be set as fwnode in port devi=
ce?
> // Perhaps add a comment?

fwnode_graph_get_port_by_id returns NULL, but not error pointers.
And passing NULL to device_set_node() basically erases the current
associated node (which is NULL anyway, since we just created the
device) so it's a no-op. I'll add a comment.

ChenYu

>                 device_set_node(&port_dev->dev, ep);
>         }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
