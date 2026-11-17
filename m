Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927995;
	b=rtQOLlGHSXrGw5WFkvLgE5Bev/2GJ8np367yZ1heAlAHqb/kjkYmAMLYy/IJ+YDfdnKA
	 xIN0YUqUR7SBoBhGL4MCKzPOULvA9jgi0WBUZo0Pns7b39Lgdnk4+4hrpaDAleEQAWsap
	 IJXVsFQfkOVohBn/+x6MbTxnw6HhRBMppUcDkJX11bHK5mamrAwh+tSCzqp3nZPurKOps
	 pMX/ffFEgHKWRkq1O1XdcC9O4T4NI4qYvemoTOhijscwfM/3KhAD/c2u02CiJ+1aC5F3Y
	 785MTobKDvSrwU/Ku6x7gWf0pxoC/F8d637+mU3lhqCAkwFPyk0dg7TN80vlsJK08ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927995;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=97CCOpTWarpZiKxPkFrwJzakzwDUQ3GnMlQehIooZrA=;
	b=ZvPdlEnv4ZDogHX+HyOZdP/PV2lsbTaLfoJnDdhdj9e5JtL5KQp6xTPfF7Jxv5vlgPa5
	 BHzJNN1yK7sNnn3vNHgM/oD+LKRAu2A8k4nohpz3y2Dg+n2mxZXA6bb6qYkYjq3k9x32x
	 wDPOaeE+BcbQIqx1eIP8M3p3uX3x4XCOoIhXjJS05odLxMaDGyimNFKGySVWD7J7sawgE
	 XSlMToPE9esfsntDQ7v4iCl2GHfnjsD0sukAxI+Ac3gsPx4LbL9rfpuomgszd/DnvGogz
	 YU4bWmNH1JAL72ctyGQ5DL4RTSrigognWg8WrMPmLecYEXgNtx0rTKXrLFXPvid+ELw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrmZGLUT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECBA606A333
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrmZGLUT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0BB1F000CD
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794927994;
	bh=97CCOpTWarpZiKxPkFrwJzakzwDUQ3GnMlQehIooZrA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MrmZGLUTapAv9feCJ3fWTnwJgToCRTjv6EMy8wRwrxkbM765SW+d4PIlFy2bDus/m
	 UWl/kc/+lADBQ0iLALpGj6v58ORy6f7MYlUXHG4xBa3FN8tQHifPxbtnGae/AqL8gl
	 12S7T6aN9wEDPthnpZXgAYE8tKgbYBO+Z00p52hZWd2EJmnogd6gGrTG2TvTXt4vt1
	 2rZiCJRgIPgTRzmwHMmVyhFbvvtngElU1vDUxqRi96MsFklwiKqIZUy04zNdLgZ4Y9
	 0LcCZUct7GJc/C4IQQ+xqgv76cLU/cEcoO1qwjLydfO3bhB4NguJBXA5Z8ACAUsmMw
	 I5Pr7vTkxOySg==
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ee36376a0dso3197192e0c.0
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 07:06:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGOx6SdlyHTKFcmhGkaW9NrgEYxA+k5nTD/gHAEVioi92qh0OxzNOAl1wLOlHe9YRaVXhY6g12f4tBXew==@lists.linux.dev
X-Gm-Message-State: APuU4Z9NTOZ7drN6Riu/S1IEti2FtnGITpDoE9pShBOw9J+tqd7IotSg
	lBPBHrhvRmjBQCYJk965zHCTWmlWjn7qmcCsZ2r5d+wyCFS2mSRF/WVBv5Dg3guMWRyrcF7znw/
	/PJqBzLCORYzN5T9hSqfOioXeU5WNI/Q=
X-Received: by 2002:a05:6122:793:b0:5ea:e223:5437 with SMTP id
 71dfb90a1353d-5ee34a98485mr5810657e0c.12.1794927993719; Tue, 17 Nov 2026
 07:06:33 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117101336.980216-1-johan@kernel.org> <20261117101336.980216-4-johan@kernel.org>
In-Reply-To: <20261117101336.980216-4-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 17 Nov 2026 16:06:19 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jsOZUMvkRSqh+YX8uwWC+AoFTxszZSxYveLQf9rPtADQ@mail.gmail.com>
X-Gm-Features: AclHuK8Y65J3pDRJficJKbngOd5x13CYfD7qFXi0LQorI5YXYtk7K3ylF3ijT5o
Message-ID: <CAJZ5v0jsOZUMvkRSqh+YX8uwWC+AoFTxszZSxYveLQf9rPtADQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] software node: fix device_add_software_node()
 kernel doc
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:13=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> Software nodes added to a device by device_add_software_node() are
> always secondary firmware nodes even if they may be stored in the
> dev->fwnode pointer.
>
> Fix the kernel doc which incorrectly claims that a software node added
> using this interface "could become the primary node".
>
> Also clarify that device_remove_software_node() should only be used to
> remove software nodes added by device_add_software_node().
>
> Fixes: e68d0119e328 ("software node: Introduce device_add_software_node()=
")
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

LGTM

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/base/swnode.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index ce4efc506b9c..b2593b2fcada 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -1048,9 +1048,8 @@ EXPORT_SYMBOL_GPL(fwnode_remove_software_node);
>   * @dev: The device the software node is meant for.
>   * @node: The software node.
>   *
> - * This function will make @node the secondary firmware node pointer of =
@dev. If
> - * @dev has no primary node, then @node will become the primary node. Th=
e
> - * function will register @node automatically if it wasn't already regis=
tered.
> + * Register @node if it was not already registered and make it the secon=
dary
> + * firmware node of @dev.
>   */
>  int device_add_software_node(struct device *dev, const struct software_n=
ode *node)
>  {
> @@ -1091,7 +1090,8 @@ EXPORT_SYMBOL_GPL(device_add_software_node);
>   * device_remove_software_node - Remove device's software node
>   * @dev: The device with the software node.
>   *
> - * This function will unregister the software node of @dev.
> + * Remove a software node added by device_add_software_node() and
> + * deregister it if this is the last reference.
>   */
>  void device_remove_software_node(struct device *dev)
>  {
> --
> 2.56.1
>
>
