Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B730E45562A
	for <driver-core@lists.linux.dev>; Thu,  1 Oct 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852032; cv=pass; b=ZwwKoxrsz8Hflyq+AGwrEb1x/i8YY/V8krm2OPI99NiV1SbLS01Du63hqdvZlpi1semchfLOtGL8/3mrCxJQb4hUK0pfasNrpwHmqq1JdHm84y5z1SUzn/lNiXUXdiyOzNdp6b7PLDGqBig6L/TsjJb01CTcvLIbffDtZ09BJ1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852032; c=relaxed/simple;
	bh=Fs1edfuHx1in4X4WdK3upBMt8kh7e3INqc862LZOi+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIcptElLpMaimJsswJqWUTtF1EdwAoRNS9JgB233HUSeRPJDBbY/5RPkiUUR6pY1QkBFdv0O92+0vrBpP2m6ihITNndviafhGscx3E6SBgVNOYKSQIWiR1ZnQgntGJN/zIfIMyxGDZd2nbw/THAUutRCrvRAOkvw607Nmj/8e+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qj2JRp6G; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qj2JRp6G"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-6756a6320f6so2404703d50.2
        for <driver-core@lists.linux.dev>; Thu, 01 Oct 2026 03:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790852028; cv=none;
        d=google.com; s=arc-20260327;
        b=bpbXZ3oZd80bur+hyrk3VSXlk5Zzf7Ko4a0ofulCN+a278B2xiIM7EmHNvN9InyYnQ
         KjaewC0nJDz8J+0F+QXCYCIn08EOHsnRx9AKqCjbnh2I225WDOe7FKBr2BodgdY/sk77
         JcIK3dpoX8TCPBKVctHPe0z727gxkJxlXyOTQmr0QarNHOszrk2e1+MHX23JZY+FurEO
         mBHzH/iovEg9+DtrXGZWTpVwFE+tu0J/uW7YvgM1+3PS4bv1iVmXd+wqXZg9N093XNx5
         Zo/VuurbflS3pb9SY7C9ipe8ObbRE/aylZQO69JyDWNFR3r3wq5xRxiuALoefinwcch1
         p+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        fh=y5IAzT2zvxWmVhC5iBg9EtvX2b8++k/mN0z6oWvEAn4=;
        b=nUPOyTYtIJn081EQsH3tc19wilDDhbt0bNvn/ahzCc7Kv/0wC8S4SxGi1O3OAAdWzG
         3zIinndu2ZZJq1WofutwNINgR0ILz5kNPK7SR2upQYYBipZ5oFJzZe5TPZ5YVvexNASO
         /+5pI6GMAm8wolaOxfogpPKli2Aj5OUGYc4W3U/NsdQals3AibBPLgg2lXaya/Zio7tF
         VWaf4HfnreKk8enpPN+uUn33UDpBo9bIyM5Munc4o09SS+JTBolUQCrWEhwL9M6HNVNa
         JnVc4zsJs+AibrhgAd6ZM4LRFrrsYNSV6PHmY0HlQblZE9OBqssHMc/42/mX4lSoAeIJ
         KV5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790852028; x=1791456828; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=Qj2JRp6Gq/FkKlTK6+D5W2Wenh3PNd8wogZCA8tmgXBVoUOq/k8vIWtVbHFhxlGX/3
         hil6AaAonGil+QkAvNaU82sU5KJkMdI1AMrrh6xq6Q4kgeVlAf5/cV5J3puikSw/t4oa
         M9YjqyYRGLhoty3KkQ0LqwrZuIYj4juiRMHMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852028; x=1791456828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=fiGa4JIh5DbKEurWbMN5TBpIx09gPoGPHrs9EpUavWFpv7bvq7kkyY1zW76Ex9d88x
         z/R2U0bicwKt5Q9gwJKM6yECRp/Cypt3uag1P1hnfq9fed5Ueru7S41Gvmig34B+vUlp
         +3CVUenJ5Z5QtWXciYYCphA0B6SJ0SpvrYyTnShDeMR42ebOiq1i9UlSElCLfGmwtGzQ
         7eO2lEuhzlHFpaLdW/9Bg8jX0zPGAXGzgnbybUa2+olmR1xfrDvGKnZXZ7h+ZUtnxFVg
         76XOQzUbnEopZxUNwI0VCkY2CK9gn83Z7DZ+3oymp2gGAjCN5FIRddYHkXiSRVovRaQ3
         X5UA==
X-Forwarded-Encrypted: i=1; AKwUvBweFO3Hn+u5M+jKuoGkEa761BUrF3gS/kb0SrCSzfPLKm6JcWAcu5JI7ouPTlz2b1JFNyo7MvQeDNIB9A==@lists.linux.dev
X-Gm-Message-State: AFq9FYLlhqntwKYUL1eQqTCZY7URvQhBsT1wOKhdd6eb6xlz+TtI38Js
	5VbF9jTUVvG7z5+K2F++9xCz07OLeNUV6Eus9boiRr/G+ri5JL70UH+ngas4Y9kLdg5f7Lw06iJ
	IusYrN9Samk91HGVuzW62R9I5vVl9ErWWiw7ITO8w
X-Gm-Gg: AYBFou1n8V785Ore6pKQj+aH1k5CMGj5KstIkkH+d86XoJroG/FRjdK9qi956XuhOxr
	M2hMVVutYeaQQJZLWv1z6yFUw7Q19UmBD0zEGKZk3sdHsgSqhnSlqYbewI67jhnQWHddZKY2nxr
	5ZMtCp03xVSyyD9Y2V9hAE0mCsuPFthPaa5qT/Tl/tddN2hA2v//8O51wBKfeFSpdNsEI/wHPe9
	ROCwba7lA2gnF9t8udqnySleV4hHUEGY58aXrX7DaWEXXuhBIhCp/3keOeAcDE/tuh282VSAeEe
	r54DJzKTI2QYv3H9mSiHQdKHIqKSj7G9zFpxaW116x8ZCH2KcqvP5rXcP2Qa5XxfVZPJ9iHsQ0x
	e2sr4KpBYAA==
X-Received: by 2002:a05:690e:4105:b0:676:9954:81ef with SMTP id
 956f58d0204a3-676995489a9mr323421d50.14.1790852028003; Thu, 01 Oct 2026
 03:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916075745.3549953-1-wenst@chromium.org> <20260916075745.3549953-7-wenst@chromium.org>
In-Reply-To: <20260916075745.3549953-7-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Oct 2026 18:53:36 +0800
X-Gm-Features: AclHuK_wafiRDk696txMZ3q8q7Qaz4NsP-wYkipLMPcHq1r5tW6zotnKrD-_NRc
Message-ID: <CAGXv+5GdBUafk6niG-UMDx=z6LJQ6iHAWhDpm1Ly2ce6CQDaxg@mail.gmail.com>
Subject: Re: [PATCH v9 06/15] usb: hub: Associate port@ fwnode with USB port device
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
>
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
>
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Added extra |struct fwnode_handle *| local variables to shorten lines
>   (Andy)
> - Added comment about passing fwnode_graph_get_port_by_id() return value
>   directly to device_set_node() (Andy)
>
> Changes since v4:
> - Dropped unused |hdev| variable
> - Added flags for fwnode_graph_get_port_by_id() with
>   FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
>   ports can be connected
>
> Changes since v3:
> - Added missing fwnode_handle_put()
>
> Changes since v2:
> - Skip assignment if hub firmware node is ACPI node
> ---
>  drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b4452b665f59..c0a51d9b06a6 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,6 +7,7 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
> @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *d=
ev)
>  {
>         struct usb_port *port_dev =3D to_usb_port(dev);
>
> +       /*
> +        * At this point ACPI nodes and swnodes have been removed by
> +        * device_platform_notify_remove() in device_del().
> +        */
> +       fwnode_handle_put(dev_fwnode(dev));
>         kfree(port_dev->req);
>         kfree(port_dev);
>  }
> @@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, i=
nt port1)
>  {
>         struct usb_port *port_dev;
>         struct usb_device *hdev =3D hub->hdev;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>         int retval;
>
>         port_dev =3D kzalloc_obj(*port_dev);
> @@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, =
int port1)
>         port_dev->dev.driver =3D &usb_port_driver;
>         dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
>                         port1);
> +
> +       /*
> +        * ACPI FW nodes are associated later when device_register() happ=
ens.
> +        * Skip assigning one here to avoid potential conflicts.
> +        */
> +       if (!is_acpi_node(fwnode)) {
> +               struct fwnode_handle *port;
> +
> +               /*
> +                * fwnode_graph_get_port_by_id() returns either a valid f=
wnode handle
> +                * or NULL. Passing NULL to device_set_node() clears any =
associated
> +                * fwnode. It is effectively a no-op here, since no fwnod=
e has been
> +                * assigned to the newly created device yet.
> +                */
> +               port =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNOD=
E_GRAPH_DEVICE_DISABLED);

After AI hinted, I found some dwc3 hardware to test this on.

"port1" needs to be remapped using usb_hcd_find_raw_port_number() when the
hub is the root hub. Otherwise both HS and SS ports end up getting the
same port node, which is incorrect.

Same needs to be done for "usb_of_get_connect_type(hdev, port1)" some
lines above the diff context.

This mapping is currently only done in usb_acpi_get_companion_for_port()
and usb_alloc_dev().


> +               device_set_node(&port_dev->dev, port);
> +       }
> +
>         mutex_init(&port_dev->status_lock);
>         retval =3D device_register(&port_dev->dev);
>         if (retval) {
> --
> 2.55.0.1032.g73a4cd73de-goog
>
