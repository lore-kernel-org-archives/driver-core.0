Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2A833E35C
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924870; cv=pass; b=eu80rkjstWTe9Xh/RQKoQNSrRZiiCEBSSpq8AhjUTrggeu7CkbyxYW1OjPOTe16PYjY5X6zFFifE+k/KR+1RG8d7nFakmg6ccUgr1jOS7/WV2U9326YXeeml+I2lNMSVzNPUyTKnidbJnSKWi/JykLE9EE70WTMJtH2MFXiBVLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924870; c=relaxed/simple;
	bh=SoNHDrWROasgfui4FF2PQ43gjyBa3I1JHB7dBso0fYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiOcSdyfYDdYO6tiMtICBCLxjIjcyoQXdKLUs2NginiRUMZoAd+x4PzD6woiN5lkSNrwqZbONz/BUq6mH+6ugpvyBVWdYZ09iYFVrDclLqOYoO47gJa7jwWigQOlw5jm60K2Ft4DH5MUPnV7DGRMBMPIfVF4mUAwTALmzv491Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cnop1RJu; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cnop1RJu"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664d530fcfdso5009657d50.2
        for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 23:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783924868; cv=none;
        d=google.com; s=arc-20260327;
        b=pIzAxuC8htdQL7stctQjkbf1z6/COztyjQCwaVqWYwa7zCDyiqtMSHggZ2N4fTYPH4
         LyPuBwAxfebLPMKPYO8Y13vFpzdE5fIWsE2p8pCkQmMwq4w72OKzpMyl4s+vmQLBZTbi
         L89Nu6v2/DAWeZRz/UcUzPooy8mHT9rpVLs2bPyMi1ZGTvylECP1erRvRchEMXkMWCTt
         aRwLReiKxXXVZqpVzI4yxt/3UgVbUg9ySQSGmgEmRu/FWbExRyspqtmRQywAOrLUxjNs
         Kemykp0dAMjfK3npi4TcYIpsH+WW4jHGqr3e1p2mjzW4xTWgQcsGB1F7ZiTd4N4w7EPn
         +6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        fh=dbIXqp5DShiv96YcdvttjFRr9wR1UztGGTJMZf/kAYM=;
        b=jsGQerQtibBQz4UaYX3IwIj7UE1dWT22SK5URxK2qqtG0iEndEWUjYAdbV0VxcOir1
         5RRuycjAdHJeglZbg2Uzud3tMEExeGO1Vhpt+5oFUGB52d7EpzIf5kCDqOfOm/t7byXR
         3BSjEBwM91JOUVcgaUephHNDjtQoo20E8byV0AOo/AacSz74DFV3VPXQ/+px0HCYihwC
         aIW+c9JQKzvP+SxyiEtlLaNHFJhfNDuYZYq6E9E+43SFYEePILKxoaelj9I9CcYFaanc
         juACvFM/gXnRC1uGrKAXu91BTdgLZJm7lswUara4L7aNJvmlWjRMH+MpIH6UIq9p3ymf
         3ICQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783924868; x=1784529668; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        b=Cnop1RJuNVoaQ4gcIiaDGVhc9jgEy8Jo3mNb90Jd3C6v0+NU3epgOfsYQKurjoC7xA
         +scGheqUP2O8iuz6aySBFwPHR73cPbhol7FKCiG/Z2LvnghY2bflb3zxfpKkU4+lWZpF
         hbSRx0YJ6OgrGOE6WqleO/HWUzNJuzEaGAa48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924868; x=1784529668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        b=cxRTsGPboHHAO/2Gpcr5n3o0WCNbYGVqVrfgps3ujNRrFDUXcA9XAqn90hyixRRtax
         nVZcPkQ/lQ695PLIZXSEIv+UbaduDYTPnMpKZ0wyU48AupI41XaTKwZ+bIY1WU3FnkFr
         P9U2CJo1uT7ezFOOiAKNQ4IovFdoZk1PDYpUNe+iIzR0hiAjCRUKJ/SMyZT7Tko8ZErg
         i/e4RT49xeKileeQRc3RORBeHrj/uC+LVauOv8XqIbjKCoLHxmK8XdygCyoEmgl3Ci9p
         hM6YCI/Q2uRs5NNPdYXlh3Eviq2gyc8lTBDpzB1Z16haepGSCbJc/4mSYdXHzjt9OH7O
         /6pQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAJzNkq6BLRKlQHGTq1wzOdWO+hmCkZaCoKZTvXMZnMMYWWy4w83ZFlKQu1VIWbRxJzZ7GVkp8OrJ6zw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgUTCQZxwvA70HYxgu27sMwyJx6CKBkGoc8Lkvb2H3fLiF4j2K
	jJitBu3Bn8r+kRozfb/1bPqs3Nau7WImpRvoeQT5ZzieL8yawX3ucEqJ7fYjgr1WQ9+GIc1SVkt
	VFNUl43b9xGrMbEeStXTv02050rIJEtNXnHMJk9Sl
X-Gm-Gg: AfdE7cmJuJ+FWvX6J30saibbBp8dVzMAd8V661AthQWEpWsl/X9/aqVohlN9VXNmGEn
	qnVkJYNhFQVs4pH9nbkO6LkKR1IChsp/jQcOZuwBvqJqwqiM+ypRaDangVrUuaRFTmpjbabk9At
	csmACcUCEi+G296NHYoOX8dNChmZBR8/+ThbhAFTDUepcKc1h9xMAeD6RzxyOihwt5IVSXTuG4H
	3WADI/cy8aMG7YepqQGO1yZL3sBbsNoQj40rcoIvaUXHIzUrRmaprsS9toRoKSoif+VLPoBsZFI
	u8Mjrs1h4UDLoMm5Nlgdeuy7+ekHVmChElJ6
X-Received: by 2002:a05:690e:138f:b0:667:db66:eb59 with SMTP id
 956f58d0204a3-667db66f471mr5286970d50.22.1783924867897; Sun, 12 Jul 2026
 23:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709095726.704448-1-wenst@chromium.org> <20260709095726.704448-6-wenst@chromium.org>
 <2026071025-diffused-jersey-0d94@gregkh>
In-Reply-To: <2026071025-diffused-jersey-0d94@gregkh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 13 Jul 2026 14:40:56 +0800
X-Gm-Features: AVVi8CffSvw8dKrdOHbSnASMEsx0puSGrR918doi02cLaaF9gK20T18TFDW9zpc
Message-ID: <CAGXv+5EyJ3WewkWfEy=XNA=VoU4Fuhi2K6evkvFanWhVe8J=ag@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] usb: hub: Associate port@ fwnode with USB port device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 8:08=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 09, 2026 at 05:57:10PM +0800, Chen-Yu Tsai wrote:
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
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v3:
> > - Added missing fwnode_handle_put()
> >
> > Changes since v2:
> > - Skip assignment if hub firmware node is ACPI node
> > ---
> >  drivers/usb/core/port.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index b1364f0c384c..e8fb2acd77be 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -7,6 +7,7 @@
> >   * Author: Lan Tianyu <tianyu.lan@intel.com>
> >   */
> >
> > +#include <linux/acpi.h>
> >  #include <linux/kstrtox.h>
> >  #include <linux/slab.h>
> >  #include <linux/string_choices.h>
> > @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device =
*dev)
> >  {
> >       struct usb_port *port_dev =3D to_usb_port(dev);
> >
> > +     /*
> > +      * At this point ACPI nodes and swnodes have been removed by
> > +      * device_platform_notify_remove() in device_del().
> > +      */
> > +     fwnode_handle_put(dev_fwnode(dev));
> >       kfree(port_dev->req);
> >       kfree(port_dev);
> >  }
> > @@ -780,6 +786,13 @@ int usb_hub_create_port_device(struct usb_hub *hub=
, int port1)
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
dev->dev), port1));
> >       mutex_init(&port_dev->status_lock);
> >       retval =3D device_register(&port_dev->dev);
> >       if (retval) {
> > @@ -852,6 +865,7 @@ int usb_hub_create_port_device(struct usb_hub *hub,=
 int port1)
> >
> >  void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
> >  {
> > +     struct usb_device *hdev =3D hub->hdev;
> >       struct usb_port *port_dev =3D hub->ports[port1 - 1];
> >       struct usb_port *peer;
>
> Is this last variable addition not needed here?  It's not used.

Indeed it is not used. It was left over from me figuring out how to release
the fwnode handle. Will drop it in the next version.

I still have some other comments to cover. And I want to go through the
code one more time to check Sashiko's concerns on the main patch
"usb: hub: Power on connected M.2 E-key connectors with power sequencing AP=
I".


ChenYu
