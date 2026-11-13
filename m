Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590996;
	b=kVvKBJZrD2olgKkzIzksMsePuAJ3TfTIle7skRV9TREech+Xj+3zWEYY5v1Y1lbj+fpf
	 ubigaSzwco/G0Y+G7jU6i0mvC6kdNgNSKSPRd/gYevd6SUB6b8/vzooNDHKKDxMwEjoll
	 4d4UBWtT6B4C0ZW0hIq9h7NdyPJ0RryCNK5LhjvfnTW7AKIlLD09ba36YKLQwTfNdSeM4
	 wyWaSZBNM1WUeSjTMOBzs/wZVQGMXesQ6sFxsuJ1JWpyijK2mctsn22UpYoKdWwhean17
	 6TF4HqArg7FS/IbMGaSprXiT53L0gnaGBSr3qUZ4SgcB9ae9hozLLluOwyUzc7F50Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590996;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dqCS52njA2aiVteiRfpDb/yZ504mBEljecH8GRJRMOg=;
	b=mCSHeXv8keGj3PPRHPvuCiAydRfSTSko8/8L0CGAPj0XEwIwjZ50fojiasfOuGHJLbQZ
	 1Ht0Yu+7h8sY85RUNkZ+8fc+TAaYrjUXjrn0M8t25s3pauiGZYzkfUzFB63Zc+zqOB1hx
	 dOcZqU6rN2u9AERGTvzJyzs1Cd9f3OICTPQMeEW9CW5zri76ccjOdwmikB7ZAthblIbiH
	 vHK55Bdu1BSVjmswrbrP150Mbf05/zBrEH9E4X6/DfARvDpmY1JaaTuoUl8X+r4k63ZjU
	 J3s2WMwsMkiaTZRBp8bbnTvdqs0xEFQlg0oapOLAvNYcNFmgR5TXc+pu0YrxkJQJ+qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orkSRc8Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250AC6071410
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orkSRc8Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BEA1F000C7
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 17:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590995;
	bh=dqCS52njA2aiVteiRfpDb/yZ504mBEljecH8GRJRMOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=orkSRc8ZGdr/s5q5G8ZHuiv3sBaXkGmkcWo1iGTK/j66ixWTwjpP/ZXs9ahpjGCGW
	 SHCvUHkZNUGc8rR5ktCbx/yY5JzvzRpejarqQSF9ER5JaHA9TIA5bmMXcej5MRtdVa
	 rljCXzef4ATa1rVHmvtAmUPDxBjstYfv4SaBroMTunTIQxc0bVwixZHBsZo9CdYkb0
	 wYsJCYEGajZpN+sPPviMKbAOqBjQGKn+2j7SsohFlKKCyEJIvdMffYIhhdQ9ybfqfg
	 sQhtz615DiYfrvhfoNBYx9xPlGWI+R2St7sQAO3eBOXuyamWUWsVvdOBiX7/KOyPzK
	 UqYwij1XiHsbQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso18266931fa.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 09:29:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE7B15hwOZ9LoLkU7d9dOUAlUF4o44a/xRFJG3DRHcMZAXcOlGEVLVpxZI51ZL/X2f2LMzgTBuIIq08pA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Y3fSA4Faj3omzz3w6htCJlaPWeJAocbV1k9Z8uoRATELDVhCO
	cDScMwutZqKPkEUmioSrydMFfTgXN+2KKtxiN0qZlmnLGO7JFI47VRyvOCQ+xycHEoMjirvnKV2
	eXCDL/LSHUKzyHJJRf9j9/wgLp/IOCnE=
X-Received: by 2002:a2e:a543:0:b0:3ad:f04e:d342 with SMTP id
 38308e7fff4ca-3ae2b68c4acmr9609891fa.20.1794590994354; Fri, 13 Nov 2026
 09:29:54 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110085125.2535508-1-johan@kernel.org> <20261110085125.2535508-5-johan@kernel.org>
In-Reply-To: <20261110085125.2535508-5-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 18:29:41 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gjPPrHOy6iwWt_BubH+QvekgWQYrA+Y7GkvittHU10DA@mail.gmail.com>
X-Gm-Features: AclHuK_IKc6zUppJnoMJ2CNbOeKvfrjfnic31BW-zR148q8dXf7IdOqQfKMoni8
Message-ID: <CAJZ5v0gjPPrHOy6iwWt_BubH+QvekgWQYrA+Y7GkvittHU10DA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] swnode: ignore primary nodes in device_remove_software_node()
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, driver-core@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:52=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> device_remove_software_node() should only be used to remove secondary
> firmware nodes added by device_add_software_node() but will currently
> drop a reference also if a device has a primary software node.
>
> Bail out early if device_remove_software_node() is called for a device
> whose primary firmware node is a software node and fix up the two
> callers that currently work around this themselves.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/base/core.c         | 3 ++-
>  drivers/base/platform.c     | 9 ++++-----
>  drivers/base/swnode.c       | 3 +++
>  drivers/i2c/i2c-core-base.c | 9 +++------
>  include/linux/device.h      | 1 +
>  5 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index bf97b06337a1..460c7ad1eaeb 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -5212,10 +5212,11 @@ int dev_warn_probe(const struct device *dev, int =
err, const char *fmt, ...)
>  }
>  EXPORT_SYMBOL_GPL(dev_warn_probe);
>
> -static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
> +bool fwnode_is_primary(struct fwnode_handle *fwnode)
>  {
>         return fwnode && !IS_ERR(fwnode->secondary);
>  }
> +EXPORT_SYMBOL_GPL(fwnode_is_primary);

Not used in modules as Andy said, so need not be exported AFAICS.

>
>  /**
>   * set_primary_fwnode - Change the primary firmware node of a given devi=
ce.
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index be5d2f315fdb..e0b38dbd5acf 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -598,15 +598,14 @@ static void platform_device_release(struct device *=
dev)
>  {
>         struct platform_object *pa =3D container_of(dev, struct platform_=
object,
>                                                   pdev.dev);
> -       bool fwnode_is_software_node =3D is_software_node(dev_fwnode(dev)=
);
>
>         device_remove_software_node(dev);
>         /*
> -        * If the firmware node is a software node, its reference count
> -        * was decremented by device_remove_software_node().
> +        * Must be done after device_remove_software_node() which may hav=
e
> +        * freed a secondary firmware node and cleared the fwnode pointer=
.
>          */
> -       if (!fwnode_is_software_node)
> -               fwnode_handle_put(pa->pdev.dev.fwnode);
> +       fwnode_handle_put(dev->fwnode);
> +
>         kfree(pa->pdev.dev.platform_data);
>         kfree(pa->pdev.mfd_cell);
>         kfree(pa->pdev.resource);
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 5dc2029f9a7b..a90c20cb84e6 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -1108,6 +1108,9 @@ void device_remove_software_node(struct device *dev=
)
>         if (!swnode)
>                 return;
>
> +       if (fwnode_is_primary(&swnode->fwnode))
> +               return;
> +
>         if (device_is_registered(dev))
>                 software_node_notify_remove(dev);
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index c55ca14eaad9..af3ae2a83626 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1056,7 +1056,6 @@ EXPORT_SYMBOL_GPL(i2c_new_client_device);
>  void i2c_unregister_device(struct i2c_client *client)
>  {
>         struct fwnode_handle *fwnode;
> -       bool fwnode_is_software_node;
>
>         if (IS_ERR_OR_NULL(client))
>                 return;
> @@ -1067,14 +1066,12 @@ void i2c_unregister_device(struct i2c_client *cli=
ent)
>         else if (is_acpi_device_node(fwnode))
>                 acpi_device_clear_enumerated(to_acpi_device_node(fwnode))=
;
>
> -       fwnode_is_software_node =3D is_software_node(fwnode);
>         device_remove_software_node(&client->dev);
>         /*
> -        * If the firmware node is a software node, its reference count
> -        * was decremented by device_remove_software_node().
> +        * Must be done after device_remove_software_node() which may hav=
e
> +        * freed a secondary firmware node and cleared the fwnode pointer=
.
>          */
> -       if (!fwnode_is_software_node)
> -               fwnode_handle_put(fwnode);
> +       fwnode_handle_put(client->dev.fwnode);
>         device_unregister(&client->dev);
>  }
>  EXPORT_SYMBOL_GPL(i2c_unregister_device);
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 6b082c638d45..229a15625766 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -1280,6 +1280,7 @@ int lock_device_hotplug_sysfs(void);
>  int device_offline(struct device *dev);
>  int device_online(struct device *dev);
>
> +bool fwnode_is_primary(struct fwnode_handle *fwnode);

Could this go to drivers/base/base.h until there is an outside user?

>  void set_primary_fwnode(struct device *dev, struct fwnode_handle *fwnode=
);
>  void set_secondary_fwnode(struct device *dev, struct fwnode_handle *fwno=
de);
>  void device_set_node(struct device *dev, struct fwnode_handle *fwnode);
> --
