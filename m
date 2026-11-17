Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929158;
	b=mSDN1OUEx7oqTxd4GmRIuJGnl6uObFKzRxaNklky6FLsCSKGX8eTe+NsqtcrUU0kPUMS
	 5IhHJhsU7L5gAV9/77zRhfpBmR1gIwbMG58zZuBiWt937cRT4Y01QdRRd4FPVa/fveoPf
	 HAJZ3rlX1SPlQAOBCZxjb3DCVGgzFLsh/TxuxWSgh0GFzZb3QlTI3BuTAf9Ob6fIhhhKe
	 Jkn2cTlS21yNMODKIKkwVAvLu58Hike5ZWyphCS0pW2wFjkoz6ov3M1w1aAFqPbO/uaqj
	 KM2qM9iB9dCiMZqYJGVfsU4DxYmm01t0rvlwbFxbDS30bVDMAmhlP0KCSIaETlnAW0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929158;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KBdVW29HVJ4wR0PbCoFLY5q8sXCExkR+hunNaQ0mJo8=;
	b=Tc9rBl91zE4W1bXeXzrdrIk+zC/epJvlX8heK+C7f/Jw7e0Sz7XMQ2+/j/vDK3ltZ4zr
	 STzq1GHcG24ilCGYB83A+kBq2qqot7h57wr9ktIru3eINcbiokYdg05mxJG3OPn94UTW9
	 tyJHFQIsGPE31FsiCMC9PW+GfD4FmFiEsvpMqjS3PsiJQTAi/MCTTCAbDQjATE1S1lR+B
	 ggoEsdGpSUXfvQab+nh9ZoH3FUTHU6vOI+yaDF00Qo0c+nmb+NJcnCQWns/ggEehAsFA2
	 jiYnLNHXXr2FAzHoz9gLuUYsZ4tGsB9QJZA+QyQU+qL7dDdou0PFQqY0xSZh41Akm+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnIRjXwR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E25606A32C
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnIRjXwR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CBB1F000CC
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794929157;
	bh=KBdVW29HVJ4wR0PbCoFLY5q8sXCExkR+hunNaQ0mJo8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CnIRjXwRpNVUgqYvQWE4WOgRijmCokWzHFBLSjBGVSNTb8cHLqhJGaC8kBn8ZRi7A
	 6cXpGyWmj2XAp0X/TQi1kD2I1ZHD8R1y5slWiBHHHLk/iqBzmZedeXzjKPuTsYikWt
	 /9PaMJGaJhRf3y9xLHljY7HtWOOu1/T/xuvn6/Q+sWpu9ORWo4ncMpsl69W9HNloAV
	 XUe2L6gt4MR/hgoMamFRE8FEJ+SshFmoi3dnkuTE9wAXTjKDNe/WF5x8dc4RZAR8OW
	 0TvSt473tr+zU0I2BCYNcfkNbaMPkGq9KC7zrb4IM2uaXQ2erNsn8G0F2oZYU0TjOj
	 ZGPCzjAqwnpcg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so4751451e87.1
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 07:25:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFWWd/YpgRjfZowLyTQ3kyvRcm+a5QC8UGXuA/8CSyXcSMayU+CwYbQsULxIOgFwlVLJR48gv8AiHLAOw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+iBusXoSMNDY5aCJe8zbhvDx6Bq5MvvDLBAWlE9yRm/nfYMUNR
	SU9rvUatp6mSQFS+cAFrTKx7gBUoskjUL0vNX7G4y/ThtGDWDfC4WWjaAlA9m9zw/VY4ozFw4gs
	i3tBqMpFGd8g0b/Ql+gOVFfsxcJtHWcw=
X-Received: by 2002:a05:6512:3c9b:b0:5bf:d54c:1fb6 with SMTP id
 2adb3069b0e04-5c170b669a5mr5364150e87.44.1794929156283; Tue, 17 Nov 2026
 07:25:56 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117101336.980216-1-johan@kernel.org> <20261117101336.980216-8-johan@kernel.org>
In-Reply-To: <20261117101336.980216-8-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 17 Nov 2026 16:25:44 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j2DAPFBPA206VmWEiyUub7yuXFQeAvUtg95J=DwmKTDw@mail.gmail.com>
X-Gm-Features: AclHuK-hF4u064HXJHyD_Ul8WiKkjgi6nackBFOWJTHQRR2q8VH5bYUJg9XjRV0
Message-ID: <CAJZ5v0j2DAPFBPA206VmWEiyUub7yuXFQeAvUtg95J=DwmKTDw@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] software node: fix software_node_notify() primary
 node comment
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:13=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> The firmware node pointer in struct device may point to either a primary
> or a secondary firmware node and driver core sets the dev pointer of
> that node when registering devices.
>
> Fix the comments in software_node_notify() and
> software_node_notify_remove() which incorrectly suggest that driver
> core only sets the dev pointer of primary firmware nodes.
>
> Fixes: 37e586675993 ("software node: add fw_devlink support")
> Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

LGTM

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/base/swnode.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 95283d8bda26..78e224539b02 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -1162,8 +1162,8 @@ void software_node_notify(struct device *dev)
>                 return;
>
>         /*
> -        * When the software node is the device's secondary firmware node=
,
> -        * the core only records the owning device on the primary fwnode
> +        * When a device has both a primary and a secondary firmware node=
 the
> +        * core only records the owning device in the primary node
>          * (see device_add()). fw_devlink resolves a supplier device thro=
ugh
>          * fwnode->dev, so without this a consumer referencing the softwa=
re
>          * node could never find the supplier device and would defer fore=
ver.
> @@ -1198,9 +1198,8 @@ void software_node_notify_remove(struct device *dev=
)
>         sysfs_remove_link(&dev->kobj, "software_node");
>
>         /*
> -        * Drop the device pointer mirrored onto a secondary software nod=
e in
> -        * software_node_notify(). For a primary software node the core o=
wns
> -        * fwnode->dev and clears it in device_del().
> +        * Clear any device pointer set in a secondary software node in
> +        * software_node_notify().
>          */
>         if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.=
dev =3D=3D dev)
>                 swnode->fwnode.dev =3D NULL;
> --
> 2.56.1
>
>
