Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8453314C4
	for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 05:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786943273; cv=none; b=MJafVRPnQ8Qes0ytZGV6oYDIQETjkJHZ+HwAb67MpBvu97KscwRlL9laAICrreyRvgiDLKrMDXDg67suZX667Iw0bSTxIaoPOY8jLoEeP4ecO0fpQB2y1H5Fjk6Snk2M8K06huIJCr0n7QK5Qu6feyp+WLbR45K2aNpy7iF1myg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786943273; c=relaxed/simple;
	bh=dPsF7Xioqbe5fhKxW0MfomQ1+z5/xpPeeyvux+IR1Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhEbeDlo690OJj1IP0lzjLbmng0H7LIO6Wdv4sKxMHE7fAmUa4lSAoySYJtY5Zf5DRJRY1JsJL5vl5vlTj6H/7rKvX6XHH/nupMmOaZy8Yxb6USJpS/KzlyM6mctbRXkhCTUIxhicxRdt5EJJlST2U+rReLTzTEl3pdob0tGc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GT4zDEDz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GT4zDEDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07A11F00ACF
	for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 05:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786943271;
	bh=CHRP4WWAlhnlIcngLxDf76+lEj0u2TNpiNX33keCcBU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GT4zDEDzS49pxkVS++aYPzKQsT8Lw43dh7yC/vX/7yccfZORo52w4xxrDi7FcENIm
	 N7HFli1Sky06U4n82gtJCI2ZkKWyskW163FlVluYkuuYpIu3q0IlkFnhNEVr2n863h
	 XRsa1dR2Y4gY9NO9NTHGj+KXz6oQ0Wop02LXZI3x83qx+tQ5Lv3Ag6ENnTu1HPJf6e
	 7pqvaIxmt0WQm0qAz6kE1hpzF3Zd43TzYATDPKQ4IROU5sfnyitWiNMOWH3EoRw7Qg
	 nEoCbhCEXQeylCPfSHr6knxSn7Zg0/ZvCZN6mP3f6hvtiV9DGXTGxaE1Bwqn7RCjOl
	 NVeLaPhc0u41A==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a17c04563fso4255826a12.3
        for <driver-core@lists.linux.dev>; Sun, 16 Aug 2026 22:07:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpk03UaadPEgKOWVBOWGykSpAwT1eA7SmQQ1+x0xsALRu6jULp/XG3X+LrCyUIn15hoa7uryU3nny5tVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ9Pd4ncr5M2kaJ37+lP7etTrte93US6YRCa73UyMw4dXBW/P0
	kSOz/BH+q1HVIa+FCMjuBecaPjT6VG7aL87gZ9EqX+T3JIefau8aWHuiR23GzAeDNE06VjKLVst
	XB1tjDqOTVWqOqU8zD9zPRdnzsiKH+60=
X-Received: by 2002:a05:6402:4345:b0:6a1:29ca:681e with SMTP id
 4fb4d7f45d1cf-6a38a927f6dmr9252296a12.7.1786943270802; Sun, 16 Aug 2026
 22:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
 <20260816-submit-phy-package-fwdevlink-v1-v2-3-23e55dd59fad@gmail.com>
In-Reply-To: <20260816-submit-phy-package-fwdevlink-v1-v2-3-23e55dd59fad@gmail.com>
From: Saravana Kannan <saravanak@kernel.org>
Date: Sun, 16 Aug 2026 22:07:38 -0700
X-Gmail-Original-Message-ID: <CACRMN=f2RYJbgTdBvb6R4EZ2vGzux6ALfoB_Td2HBp-0k4LEAw@mail.gmail.com>
X-Gm-Features: AcwNN1UJ5Vyf0Luntl1LV1hQIf97qhuC4K-SYL3G9ab3BtcopvWi0iTczMQ4KaM
Message-ID: <CACRMN=f2RYJbgTdBvb6R4EZ2vGzux6ALfoB_Td2HBp-0k4LEAw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/4] of: property: link PHY package suppliers
 to member PHYs
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Christian Marangi <ansuelsmth@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 5:00=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Ethernet PHY package nodes describe shared resources for their member
> PHYs, but are not populated as struct devices. fw_devlink consequently
> represents the package dependencies with proxy links to the closest
> ancestor device.
>
> The MDIO bus is a class device without a driver, so such a proxy can
> remain available indefinitely and prevent a supplier from receiving its
> sync_state() callback even after every PHY has probed.
>
> Treat every enabled member PHY as a consumer of the common package
> suppliers. The links can then be converted to links for the real PHY
> devices and retired through their normal driver lifecycle.
>
> Fixes: 385ef48f4686 ("net: phy: add support for scanning PHY in PHY packa=
ges nodes")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/of/property.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 38c0c7dc428a..d59bcb1f29de 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1272,6 +1272,20 @@ static void of_link_to_phandle(struct device_node =
*con_np,
>                 tmp_np =3D of_get_next_parent(tmp_np);
>         }
>
> +       /*
> +        * An Ethernet PHY package node describes resources shared by its=
 member
> +        * PHYs, but is not populated as a struct device. Link every enab=
led
> +        * member PHY to those suppliers so fw_devlink can use the real c=
onsumer
> +        * devices instead of leaving a proxy link on the MDIO bus indefi=
nitely.
> +        */
> +       if (of_node_name_eq(con_np, "ethernet-phy-package")) {
> +               for_each_available_child_of_node_scoped(con_np, child)
> +                       fwnode_link_add(of_fwnode_handle(child),
> +                                       of_fwnode_handle(sup_np), flags);
> +
> +               return;
> +       }
> +

The design philosophy behind fwnode links is that it's purely a
parsing optimization. It doesn't care how this is later converted into
device links. If one DT node points to another, then there'll be a
fwnode link between those two. Whether the node gets converted to a
struct device or not and how that should be handles should be outside
of the fwnode links code. So, please solve this elsewhere.

Without digging too deep into the code, this feels more like something
that should be solved at the MDIO or phy layer.

Thanks,
Saravana


>         fwnode_link_add(of_fwnode_handle(con_np), of_fwnode_handle(sup_np=
), flags);
>  }
>
>
> --
> 2.53.0
>
