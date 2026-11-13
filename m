Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590600;
	b=4XvQ3WhCR4OvLD8AcF2G7vyMPkCFaXZOGOkNxYEspEX/QTF88BrwDDKRV+e51Sow4ysg
	 GjrtUWHIUuRoWrHpgwXU9GjUVewpmuRUg7X1mX3Nq5zBqF9MakCGhFJcdZe8chxN5gXzn
	 5bPRmoHoQ1AhoXxfKZol2r4V/eTCuxxS0tMl2ODPHzShWQDbbO58Z2NvSZtFr7cpa+4qu
	 E979ULZ/zgjeYiYg1TZdbOz6ixYo9uL6keYHzqfQBh2Q9AMTamH+KYYnqEoZ8DZyaH72z
	 +kdCrnTkV3hbO4Lk68msYoEXCb0QaMewsqdJnvk9fWmMTN9TpUvKoYkkHk/LnAMmAmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590600;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2c+SwvVe+TYvB1ck0x9BFmui9dOGJzGDRlpiqG9Cfj0=;
	b=ys1kI3bazgAAqg2d/pKs4pow5DSAzoCdeKb03b6IicQyY7ZMaLn7jcKHvE7hk58eFigv
	 ToTWu4MtqM5PVPiTeBZwURlvdSTEYxGRLpJhebsuZDQT6Nexhx8a6mxYcNZT9+gPT8oCp
	 OhX9GhM/7tSJly3dwMHHBdQ5SMEfNTagOjagiXM6T+m3UinkaA8TjzFJEtPWer6QosVxz
	 BB31bRDCBvTPbeaaTIEHl6pY2MOaJ9cEgz4o7ur/v+lzXK3cxLaUfnR0d+G3xjOn2LkVa
	 dVb3DMHFI0qNYiaYtj4Ve2v2cVELeIMlIUCToqZudhD5mnwkBogfFfMdQ5Z4ip/TNgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c/YJO4bh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EBB606C0B2
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 17:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c/YJO4bh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ECE1F000C4
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 17:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590600;
	bh=2c+SwvVe+TYvB1ck0x9BFmui9dOGJzGDRlpiqG9Cfj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c/YJO4bhCrQWIhSM6EQGg1502+mq+by4yptqz28H6C2QAcVcxo/sv5SDoxBQPi1+y
	 rzOHHIcEX1NvwpOu1r8J5FHs0ccpqC1d6zeN0+LYuTvlctR3ztCM8VVjeiVYrgp14C
	 OIp/N0FawMMtckqcRN4VhblDLHRSNpdrpQQZ/Q6DXwI870gA3SD+bAfI55J58DzlE6
	 eFLNGmVmhfR9N1sOd/QzaGwqCjAdUSacbRwPOtpTJ4srPN+GGxXELmx6ToYKiOBrJG
	 WbaEz1fWYfaoaPxTLCGdfIUr3m53hxVLM380qbZboiGT3br3uDUtj6Cf+rlK6qDfip
	 3Tc71H311BoCQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso18177031fa.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 09:23:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG4WPHBRYcZJsxRxZVqb2//x8w7SFAcp8snTMBYk/hnUGPaHYkSp2MwaLt+n9uwMRL2g7sIjbTzdfcDWg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ljSDZRXolRaclz6+IV6iyRhkFQnVsasHNdH2io8+ipctefvjU
	2Aak7vAewR7lvTn2rn4panQJNSC0QUHzKcO1lMhl9ZBIBpkB2wh02vpe8Tsyz2anyjI9KWMNhg5
	oNLxCpb7p8gnJ7z9n5+ZtLDiYd5xWa24=
X-Received: by 2002:a05:651c:1a2c:b0:3a3:5a01:a794 with SMTP id
 38308e7fff4ca-3ae2b48e201mr12006811fa.1.1794590598539; Fri, 13 Nov 2026
 09:23:18 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110085125.2535508-1-johan@kernel.org> <20261110085125.2535508-2-johan@kernel.org>
In-Reply-To: <20261110085125.2535508-2-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 18:23:06 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j+GZ_v3=ji4Tcv9mahU3rBvX+WX0H5BwQ6kjhc6HpVpA@mail.gmail.com>
X-Gm-Features: AclHuK8jFghVnxRICo3FkWZ1EaLI4NGbOw-Xw0BnT0rGkVeLLEHZH-dtxA8z2So
Message-ID: <CAJZ5v0j+GZ_v3=ji4Tcv9mahU3rBvX+WX0H5BwQ6kjhc6HpVpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] driver core: platform: fix swnode use-after-free
 on device release
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, driver-core@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:52=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> When a device has a software node, device_remove_software_node() may
> drop the last reference and free it during platform_device_release().
> If the software node is the also the primary node then the device fwnode

s/is the also/is also/

> pointer is never cleared.
>
> Use a temporary variable to track whether the firmware node is a
> software node to avoid a use-after-free in is_software_node() and having
> fwnode_handle_put() call a function pointer via poisoned or reallocated
> memory when the primary node is a software node.
>
> This issue was flagged by Sashiko when reviewing a related fix.
>
> Fixes: 7d80509ff0da ("driver core: platform: unify release path")
> Closes: https://sashiko.dev/#/bug/linux-b860000b-f1d0-46a0-ab52-d47cec8ea=
b99
> Cc: stable@vger.kernel.org      # 7.3
> Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

I have not found any issues in it apart from the above, so

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/base/platform.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 979593e5cca1..be5d2f315fdb 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -598,13 +598,14 @@ static void platform_device_release(struct device *=
dev)
>  {
>         struct platform_object *pa =3D container_of(dev, struct platform_=
object,
>                                                   pdev.dev);
> +       bool fwnode_is_software_node =3D is_software_node(dev_fwnode(dev)=
);
>
>         device_remove_software_node(dev);
>         /*
> -        * If the primary firmware node is a software node, its reference=
 count
> -        * was already decreased by the call to device_remove_software_no=
de().
> +        * If the firmware node is a software node, its reference count
> +        * was decremented by device_remove_software_node().
>          */
> -       if (!is_software_node(dev_fwnode(dev)))
> +       if (!fwnode_is_software_node)
>                 fwnode_handle_put(pa->pdev.dev.fwnode);
>         kfree(pa->pdev.dev.platform_data);
>         kfree(pa->pdev.mfd_cell);
> --
> 2.56.0
>
