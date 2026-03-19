Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17652D0C62
	for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 17:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942759; cv=none; b=Stb7O3Ii4YiDehrOe2Gli4qQXlckrmDRQAxi/LH9CxvpOt8Zb3wv4EpI5cQnqbWKQ9rSIFzLWfD61UrK6l8URzVDSgx3hmSaEWNVl2fwHg6/Sz1h7CgWlU/RVRk/YgAVRESGk5EG6xej2VLh7maQ+Ju/tvRf8f7+8L6gh+J+Vro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942759; c=relaxed/simple;
	bh=1qiYzC4e4C5Osb7cyOfG+hx3gfnhgiG4CgnJdnnYqWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jk+PG+3SBCpmNtRKjqRgwRyMzO2mjE6s9lEU63WMB1dD2LnzFUJIzBacnY/YMkj8tnuxt3ujGI3rdUD9ieHQ9YplEix/2KbnygVgmWzQXIYFZkvRmfu5GZtZcdHmMiif9ITBs7k6m+PWubEneV2IAedEINNuzbEF9f8f6Rh562A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fuHWspt1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fuHWspt1"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b979d16dd0cso126039766b.1
        for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 10:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773942749; x=1774547549; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwNvoAxpSBA3F4YxfMu4dubOKf0cPSpjGd1s0V+Fdds=;
        b=fuHWspt1q/Hz6MGGA9b/5Fldrb2s3DQ+AYMViwUcOhMdirw7uNUUtR8fxOqm7DJX1P
         cc54vzOdie58fSZUL+tNj/plv9/CRGC5sVZOUIiFlP4hwOgN7YIgU5oWBry9bP6t5zlo
         6lMSqKxv7skaef8igEsx3pwoeasmguLJKLBwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773942749; x=1774547549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwNvoAxpSBA3F4YxfMu4dubOKf0cPSpjGd1s0V+Fdds=;
        b=nlYk4FKq/Gg6MU/xebVvLq7wsMuV7w/HjuSZ430L1TEyVT/1YjXCb5pr3wHaEjVwxa
         5FvDrvQinn/tX5nJt+vd1zDd7TVJfRXUTeNq2QmTpUaSOqG+jBt2j2cT828SyRm5IrSO
         wa1K7BD/d/YDmP4ZuKBFyOG65J4zC11lQP3WtQkc9QAyMBwqVzru94lhqzonynT0cvNG
         VUvuQLC/PGIvzAj0E1kGiBZ7mrsYhLXEc616KQfXkmtbNHGmbw8TqPCeBXzfIig35V3v
         8nqEmMZ3SaQezpPd1LluH9FeTGGC76Agu7+wuG0ZOgx+NkKvUR5PKuAwUcvbtQLtGnrr
         40UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCc4/sBQEjHYUlvXe+vgk3FtH0tvEigsGLzInKXl51I33zWkT2qNiC+p7nTHEOUZfyGkzYDZVbuSpv0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz3FHeeG2yffAepck897X4zvLx21KfHs2Fl5Rg1vNP6QXOt89u
	dLIuO/yCJ+YQTpHNbsfqFVkjiiSRVa1/l5IpKDzvZasJxa8fle/Fh/Oa7I5cwxjir79H0p8sr9R
	dSpv7Dg==
X-Gm-Gg: ATEYQzxI8TDeI6yVRodEWK6QgMne8pFPo8ZcqWf05LLG8myJN9RWMCBXfDsvvD2OVzZ
	J91LvTAUZTSw7WUPJvPnep9KnfaEVa4KYevF8rEMUI9+qYcVq1BP+hi0JsL8wWvUEs6VesSPxM1
	P7qZPw/SQIl4YfxRd03Jtf2Ic5ex60Aa9KNYP9RNZbQxdP2nVXFIu5soMfBYMgbyQhoI9LL7PaM
	XvSeQjuDs94Q9ALwXZXSuHjbNwxKY8faYo4nKr33P4DpmGv+FmiP24v20NgEj1hKXP4YuMar3QZ
	j0ar4Ui3VSrwJVHfRjkbdzPQmisALNEQhHxNhAQADVLIyLhwTyqr97JtbrJWNQysftKgQvtZnV2
	5Cdkg1jnctea5aMY4bHRjJ58aSyhvREbyuDiZdPCwD09kBT4KzqwrsfT5ok4Oos14K0lPKv05a5
	+2rhb2jFJgjVD6CqPk+tK33w+wcA12bODodW95U0o330zeYgTfCY4+vofqwfhofA==
X-Received: by 2002:a17:907:cc1c:b0:b8f:f08a:4b80 with SMTP id a640c23a62f3a-b982f0baeaemr13548266b.3.1773942748837;
        Thu, 19 Mar 2026 10:52:28 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1686ae4sm498237666b.32.2026.03.19.10.52.27
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 10:52:28 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4327790c4e9so691865f8f.2
        for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 10:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXp49pQduS49fYzXsm9mZQBcnfvMsHiw7AFN1HGUnMBgRt2Ubq9mSeIRWLLCy8Y4rMfLLFmXoOVgxxP6Q==@lists.linux.dev
X-Received: by 2002:a05:6000:18a6:b0:439:beee:43b5 with SMTP id
 ffacd0b85a97d-43b6423d90bmr470716f8f.3.1773942745211; Thu, 19 Mar 2026
 10:52:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317090112.v2.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <CACRMN=euZzwDpCQupzth-J1z9qWXPenmy_bu727+R-kt97zexw@mail.gmail.com>
In-Reply-To: <CACRMN=euZzwDpCQupzth-J1z9qWXPenmy_bu727+R-kt97zexw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Mar 2026 10:52:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEWMdh+SuSE-5P81g7NhV8KH_4u_FxcRdBFRTAaASqhQ@mail.gmail.com>
X-Gm-Features: AaiRm51jE-pJGKyYKekSNJEdkSVtbmzl88hjmcc-VHWIT0EUhGVU2WYljuGhtW4
Message-ID: <CAD=FV=WEWMdh+SuSE-5P81g7NhV8KH_4u_FxcRdBFRTAaASqhQ@mail.gmail.com>
Subject: Re: [PATCH v2] device property: Make modifications of fwnode "flags"
 thread safe
To: Saravana Kannan <saravanak@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andrew Lunn <andrew@lunn.ch>, 
	Daniel Scally <djrscally@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 19, 2026 at 10:25=E2=80=AFAM Saravana Kannan <saravanak@kernel.=
org> wrote:
>
> On Tue, Mar 17, 2026 at 9:04=E2=80=AFAM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > In various places in the kernel, we modify the fwnode "flags" member
> > by doing either:
> >   fwnode->flags |=3D SOME_FLAG;
> >   fwnode->flags &=3D ~SOME_FLAG;
> >
> > This type of modification is not thread-safe. If two threads are both
> > mucking with the flags at the same time then one can clobber the
> > other.
> >
> > While flags are often modified while under the "fwnode_link_lock",
> > this is not universally true.
> >
> > Create some accessor functions for setting, clearing, and testing the
> > FWNODE flags and move all users to these accessor functions. New
> > accessor functions use set_bit() and clear_bit(), which are
> > thread-safe.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: c2c724c868c4 ("driver core: Add fw_devlink_parse_fwtree()")
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Acked-by: Mark Brown <broonie@kernel.org>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > While this patch is not known for sure to fix any specific issues, it
> > seems possible that it could fix some rare problems. I'm currently
> > trying to track down a hard-to-reproduce heisenbug and one (currently
> > unproven) theory I had was that the fwnode flags could be getting
> > messed up like this. Even if turns out not to fix my heisenbug,
> > though, this seems like a worthwhile change to take.
>
> Reviewed-by: Saravana Kannan <saravanak@kernel.org>

Thanks for the review!


> Thanks Doug. Hope this isn't the cause of the hisenbug. If you report
> it here, I might be able to take a look at it too (no promises).

I don't _think_ it fixes my bug, but I'm still not 100% sure because
the bug can take a day or so to reproduce and it appears to only
reproduce on official kernels built by the builder. :( This makes it
hard to say anything for certain and also hard for me to inject extra
debug logic.

I did finally capture a ramdump of a device in the bad state and
managed to inspect the state of all the fwnode and fwnode_link
objects.

The problem (simplified) is that I have a pinctrl device:

  max77779_pinctrl {
    pin1: pin1 {
      ...;
    };
    pin2: pin2 {
      ...;
    };
  };

...and then a client of the pinctrl device:

  client1 {
    pinctrl-0 =3D <&pin1>;
    ...
  };

  client2 {
    pinctrl-0 =3D <&pin2>;
    ...
  };

At parse time, we get a link between the "client1" node and the "pin1"
node (and "client2" and "pin2").

In a normal boot (where the bug doesn't reproduce), when
max77779_pinctrl finishes probing, all of the links to its children
(which don't have a "dev" associated with them) get moved to point to
"max77779_pinctrl" (__fw_devlink_pickup_dangling_consumers).

When I detect the bug, the max77779_pinctrl device clearly has
finished probing, but the client devices still point to the child
nodes.

In the debugger, I can inspect things. I can see:
* The fwnodes for "pin1" and "pin2" clearly don't have a "dev" node.
They also don't have "FWNODE_FLAG_NOT_DEVICE" set.
* The fwnode for "max77779_pinctrl" clearly has a dev node (and a bus).
* The fwnodes for "pin1" and "pin2" show zero consumers.
* The fwnodes for "client1" and "client2" _do_ still show suppliers.
* When I look at the fwnode_link between the clients and the pins, the
"supplier" points to the node for the pin.
* When I look at the fwnode_link between the clients and the pins, the
"c_hook" is non-empty.
* When I look at the fwnode_link between the clients and the pins, the
"consumer" points to the node for the client.
* When I look at the fwnode_link between the clients and the pins, the
"s_hook" is an empty list (next =3D=3D prev).

It's a bit baffling because everything looks nice and consistent with
half the link being severed, which doesn't seem possible when looking
at the code. The code seems to always add to a consumer list and
supplier list at the same time and remove at the same time.

I've started to run out of ideas on how it could possibly get into
this state. If you have any, or want me to look at any other data
structures in the ramdump let me know.

-Doug
