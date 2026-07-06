Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7153A48F6
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336102; cv=pass; b=WzKLJ1n8x6UT26BbsRHOYGGdv139/dJDVv7s+iofnmnjw2kfBnikcSh2pO+yNsGdm4pHgiS/v/CetmUeA4TAQQm68UCZnRkxzM7fcN9rYHUnhSBpa8Fy9k8Oimh1bu3mpcQ/upkgP/DkeJIeuVWRtcEqmbr9SWO65eT74vmahvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336102; c=relaxed/simple;
	bh=4F/mamksgE6M36asyjHLz+r3WuYlAy4EjSD04V58GmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkadgPpFOslO06UEN8Nv2svMW0HSiZ9HVyVzAnJhQOo06X+sCZevQujYJSenZDvxPcSFYYyXUyRZJvwi77x1+FBFmJZF/CNBMpFqBUo/TvKs+ogX0E9sgCt2tNUOlX7vJ9g8+OJyT9IH+JsvgA0PsgiSZyksNsB4oj86TiuK6EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RfGx0ckp; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RfGx0ckp"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664ce3000e6so2247325d50.0
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 04:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783336099; cv=none;
        d=google.com; s=arc-20260327;
        b=ddtSHEPnaJ+CA88eHwIk2KYjcdlHHBWdgaZhHUmgKgZoCaNA/7P/+CxTw2W1QAYHwL
         UH36RttwA8llSYpbem3DAE6enVVKBlWu3DhPU8GIIOW9JJGSAa4y8+lzC590lEPSjh2P
         rP/8BfEFYls8dMy9RRJf14ccPdTpH28AWAhVf2/DpCsH8lPMlaGfT2NWh8j/eGqMGYrt
         bBLoqNanW5MuX5q8TGKFCd9AQP3xq6zFKfgoHl82+Jx2VphbrJVzhoFecOe2qettnMhm
         l1PDyn1GqaNl9yyH/hwMgX1BcoZV7s3vjFB7KvbSOaUNj/ie4AKgFwC8PWAsO79PgYH1
         0syw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SIs5mr1YlXuHrRAWD0Cvvhp1KPf82E28pNtyAHr0i7A=;
        fh=0Y/nqzKLsNHESaCEFmFumPbnI3vIS6GLKMp2PuKkHes=;
        b=XH2lpZB+wiFUcKc7JVMtz7TXU5YBW4mBwkI40CBFqp0Hks653EuYn5N+DcMLykPZJf
         1/yZOzdTCS7MqIbrTZhA9r4h7/bFuq5Mlumne09FSfzZqcpsYmTkpA6djoMECUekILoq
         p+EvegMKjKztCAHzAubHMoag48XviajAavaxvZCicQ7TBPsUiknqobQq9UzvRwNYGiEZ
         lojsLPjRpIJedwV8A/LW0Q7Wl0D0IZ3pWBZhNlEWuC9SJ8hbkmyu9MwiDOH6Bnpj/m3c
         LhZXwmGSaT2QbcGel3I95Acit2surxjASSFbxNl3QhAPGZEbtxYzq7WqlPjBmamj31H8
         nKUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783336099; x=1783940899; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIs5mr1YlXuHrRAWD0Cvvhp1KPf82E28pNtyAHr0i7A=;
        b=RfGx0ckpCrFkF8WGe2gMDZ1WRtbBhu2lu3AwEHSME0pNMwh9lJxwJFBRZBa5xQjd/U
         foxoHqWt8bDYLlLjrbZsC7QO/B04gl47d41vpXckG/ZOEWQKZqWungfm7cpkJkN77bci
         HXh9FbAEEbdHB//057kuuOGUqjawPMbWvchsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336099; x=1783940899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIs5mr1YlXuHrRAWD0Cvvhp1KPf82E28pNtyAHr0i7A=;
        b=QlezlDSEBteYPPzHDlcznCLdqDDASwFLfltsnQP4up+wCs/u7gcMI/Q1ZM3M+e9AL4
         WqrAgV7NBDPfcv5144/Vi9W6klKwqc/X9oQZJxBvlt6ZgQnM+chpCdGNYs0pg73CxXYg
         zCyLBzCYZoh+7/OtxfhRU/gXrrI7JJmlTGTVczdR9oVwHGuBOYemoqpv7pq4Vhzk2C0+
         6MIccKNzn+06tfhdYyuj/B8+z2D0B0kctk6wdCVOmVNW5+ETgiEkPjO4MRlw08TFfBkd
         ZKwW8/g4SUmh4ZC5d5Gg1YmDGebzlpDmwvaksrbYdlkZ2RWLMKZ31HOWm0hwZaY7pzdO
         tXSg==
X-Forwarded-Encrypted: i=1; AHgh+RpWmQoHsSR8ai6e42iimySgzenGfSSrjZlVJxsToW9WRRleqrYQTCVkU2GUYQnaI5mx+n8WQXv2DkIpQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyL4+VqwRZKOBnPKZiEe94ea+m98l9LKTxdXLHKv6lqIt3epUHc
	x1aj9QSivsqhjkeud/JcavcwGwpjwXBbdIQC2wDJDjkeDknFLi5VE3dgjerxis1uMUJw8syYCay
	/xadoAO4ppN8cHOSrsKGxjxS8p77majsWchrbaEAs
X-Gm-Gg: AfdE7ck0fAs9HSbEVEr135bHE+dxcj48JFsJDrF0SnXi+Zmm9j8AvL1NbZ7UxJmMwdZ
	AgcPtsmrr0czTZS4/WNI8kZAAtcdMPItA2v5gv9snqkwZsX4Fgo7ey82GZUXcv43y9hohbiflSB
	OeaBOvJ9FiJbHE1BuDeJ0QwxRexAluVxRjpmiQEBeGvnEI8JCiLBi3KpjvvEu/GvN8Mym6f+dNm
	VpH4hAioiTQEXqzNF8R9lylBVBjNDHDtxuuJ9Ytx5DPrkteEeCUvPWN9R4JNE+FlTKHVH9MaQQS
	ohNmymHHAcbV+icpWgYzlsgT1XI=
X-Received: by 2002:a53:d016:0:b0:664:c436:e525 with SMTP id
 956f58d0204a3-6677fd49ec4mr103596d50.58.1783336099517; Mon, 06 Jul 2026
 04:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local> <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
 <ake6FNy83LLtCs3b@ashevche-desk.local>
In-Reply-To: <ake6FNy83LLtCs3b@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Jul 2026 19:08:07 +0800
X-Gm-Features: AVVi8CcaHXwr5vK-Mk50Hl5ytWXCTbNUaYqO2byI6p2Q5_6clKTL9yyyDNsH5MY
Message-ID: <CAGXv+5EgpizA3Pc8ScNuChPhvFKWd5F6dxB-wT4-7EwabE-9dQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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

On Fri, Jul 3, 2026 at 9:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 09:17:16PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Jul 3, 2026 at 9:11=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
> > > > usb_port_is_power_on() currently takes |struct usb_hub*|, but only =
needs
> > > > it to tell if the hub/port is SuperSpeed or not.
> > > >
> > > > In a subsequent change, usb_port_is_power_on() needs access to a pw=
rseq
> > > > state tracking field in |struct usb_port|. Either structure can be =
used
> > > > to identify whether a port/hub is SuperSpeed or not, as the field i=
n
> > > > |struct usb_port| is inherited from the hub:
> > > >
> > > >     port->is_superspeed =3D hub_is_superspeed(hub)
> > > >
> > > > Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> > > > |struct usb_port*| so a subsequent change can use it.
> > >
> > > At a brief look this will be the only function that takes usb_port
> > > instead of usb_hub in the entire hub.h (I don't count container_of()
> > > as a function). With that being said I would rather see it to be move=
d
> > > to port.c altogether (yes, it's more invasive change, but looks more
> > > consistent).  I would even dare to move struct usb_port (and containe=
r_of()
> > > accompanied with that) and this function to port.h. This might requir=
e
> > > a separate patch, though.
> >
> > I agree with the reasoning, especially given the function name. However
> > I wonder if it would cause problems given the linking order. I'll give
> > it a try nevertheless and report back.
>
> Thanks!
>
> In case it won't fly (but I still think it's better to split), can you at=
 least
> group usb_port APIs and struct? Means moving the proto closer to that str=
uct
> usb_port followed by container_of().

Looks like it works out fine. port.o is linked in after hub.o, so moving
the function from the latter to the former doesn't cause issues. One might
even say that it is the correct thing to do.

> > > Perhaps something like: 1) "move struct usb_port and associated APIs =
to port.h";
> > > 2) "...this patch...".

There are still some left in hub.c:

static void usb_lock_port(struct usb_port *port_dev)
static void usb_unlock_port(struct usb_port *port_dev)
static void port_over_current_notify(struct usb_port *port_dev)
static void hub_usb3_port_prepare_disable(struct usb_hub *hub,
                                          struct usb_port *port_dev)

These are used only in hub.c and moving them probably makes things
messier?

OOTH, the following bits are in port.c but declared in hub.h:

int usb_hub_create_port_device(struct usb_hub *hub,
         int port1);
void usb_hub_remove_port_device(struct usb_hub *hub,
         int port1);

Any preferences for these while we're reorganizing the code?


ChenYu
