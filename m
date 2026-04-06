Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6CE393DDC
	for <driver-core@lists.linux.dev>; Mon,  6 Apr 2026 19:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503804; cv=pass; b=fgLt5ta78zOIAW2CKbAIW9l5IWToRl6l0G+hxf+rLwhQYWnnRTJlgR2r3Z+6WBIe+wgJw/7pjlD1pL2jZzO3Dnn3fGm97d0fmRsIRh3HHjBKfYmPkMdRXTWBdvC/DoW3TDmnF0O91U4HQ9+040IPUFHM5zqeMYH5zaYJibNHito=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503804; c=relaxed/simple;
	bh=E91vaeMNwDF/pEjv7G2aprNsjDohPpm/gfEXupHR2kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obOxRoLgo/7J++g/nIgMu1UPAoAVSe6aMyNKWM4rKGwm/9f/e7YzCJSXQFYh6tFcs8+W7V+TViSHY8EkAJq0QPr8o+Yg8tTeghVzS++5ROe3mJNXCxYibKrNt6za4PxsGjtUOLjSppHNy43NCh248tMJRj6yVpxw8YR/KZ5umXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPB2uMRV; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPB2uMRV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66bf6aa4858so7895610a12.2
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 12:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775503801; cv=none;
        d=google.com; s=arc-20240605;
        b=aPfuZzRVlqeGFxmUyJPD7T5ZH+TBqcW0T4qZz/WyhzaquQvxhPcnXazX9tJ6lAMUWO
         i9z4wyHNWfYBYGvZo4BmQK+Wuv6EnxSkABy/grImWTPKgxuhDk61IBUrrJ0MlQbT0Z6n
         dejlXFoU2DJE0BXn1W+anvgyg0glp+SD/Tg8WRBf4pCZ/O5qdse/ueFjpokxjMjURh92
         xNVw22efvVMYts3XjuUATuwoTRRqtybpoYxCpYQOPlsHybCFu/shAS/tBfJO4n8LI1/A
         jZj/2MW8Pz+Bb9QaDhBLf1RCmxhwPynmQrHRT7mSh73vN4OQZeiEW4rP2MDdT7mAyt0K
         DI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6oqpjiW2BP+Tsq4RmXpwQJ34Z4G51X+Eu8RZMOYwNBA=;
        fh=UHiAA8tgHGuYQu0DAbOf4zuwpjK+I7d43gsZjW0U8eA=;
        b=KjzzNn7ZMqSoXWmYMI+pmsrwkjwAL4ffwi4GqZqPTIwXhkzBF71ZTyWfPNN6fqynJR
         cSAtcydGwT/EVnlbkLYHX1dMbzB+6bl1q2cICPLiNjOJjmYXp8hgtFMMtfJSq3ydcuyH
         0x8t5p2PVxQzPCPee08E/ShRPzU6+ELAVwQ3whlPcN0F5bZOptCSTgdukvI3yCfkj+ou
         ZYWo4OZNulifsK9xllaPopQqx7tlTwGCazLxOKTB8LGbPGOySCCHSX4CeUw+ylGZx2Rt
         pvYA/PWquwoWJ/zt6EbU1F8D9rlUN3DB/gW8nOc8ucCe/rJGCQooR6S/pcwZtbGmXx6I
         FzuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775503801; x=1776108601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oqpjiW2BP+Tsq4RmXpwQJ34Z4G51X+Eu8RZMOYwNBA=;
        b=kPB2uMRVmO6oERhuAeUOkTcSciiyHiroVt3I2eXrmKjmuC0Xt46w7XRrK5CN7GwU5A
         tvehWKD58Mpyc8Q7OVf88p6M4fiNj9ZGGDEON1DLW8IJoIPGpnFTiNt2u8FP8KeHWFjj
         AcVWId3fRhvyQ/XQvZJU68goz9hiMHOmh/lbHTTZJh8bt78vZiDEFapbBgQRPmFjXjDl
         PVQIUEbChMWYRwlYdbtMLlpczdM1eG4UdcMAJcFsK75Xvv0vxKjmUZahf+PnWDyqc+Cp
         Enm/74x+uQixajt17niIGJsoQ7TcQVk9O6D65MTsUXKn11HVqBjqE/+rQqb8OhBPXaAt
         v0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503801; x=1776108601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6oqpjiW2BP+Tsq4RmXpwQJ34Z4G51X+Eu8RZMOYwNBA=;
        b=fTh2fLhhaAJQpZes6vRhPnRxMy5RhgjpFLDx45CRDKetC8QDEt/iTBYjzhg7GOZXQ7
         JK8/xbscqPF1x80ph0FeWKFv416H8sVb6s80uGIQiKOCwiosw58/MWGpDqhpjraIzsCs
         XbxjhkGeGXOlczZVy/t24h5sobBmCu/YhpmAXbTCv5FNBVjwuQC7J7Y1vw8OjOcTTgxO
         j+0wHBYGyW+yTg2TnZoKCV2IaJvpmg51qAVz2yDtNp/AcObxcTZNViK0GCL69WMEiId3
         ifLtpUe1zxuZ36Gu6g4qyTiuXrlH1WAIgKYzyqb3A55PlN5wFIFLP4zdgwzLFcRx/xPN
         B7bg==
X-Forwarded-Encrypted: i=1; AJvYcCVN4FUbaujPK0C+65SYdlqfUUy4SIOvr75K+8PDLdkQCKVBOaX+MwgjsMsilf+T++T2rqKF+8s++3uwmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2qXx8O6sPpFGjQkHNJZKXsnnIMyplEiaVYjnTBW1L7ZH8gqWm
	BB5JSzSkYEhBBGF7VbpSXYAGNa9aC0O/wgpEhwBNdrvhu+5woUDOQRV50DGy1MvYrS0akEpLYdT
	l9Gol5e8eiIkPEVqYC2V0EWUmeo9CF24=
X-Gm-Gg: AeBDieutdjD2iN7vQR4Ry1Rhix1xF0skrGpkf3rpUAaxW+9gIoj0AjFGaen/26hTA/v
	3VpFMtcifbeWXzd91dJ9wlMQKu8ki/6PgiLOxYZn6mu0ksXjgTaNZgATZYRhpMNnN5u/DoJx5nF
	OnTPddjJQfYO1frxQa6pAcHfRBvzcFF7vwUTSLcp8SCMUD/x2T5864TddIQvroMUDr2799Co0Tf
	BYkgAPjbCZPbxLmy7ejqGKOvgkUHjUZBRd5mcMKLoaTyFuwpC3qn6b7nQjIihi9ZkpjzjCNlltA
	YpyvYYO7Bxe5gcwW/l4PsSgjUOSg+L32L4eQiQgVkD933M05dn5YOO9vaUJrrWSVZYy8AlYkEDE
	H3zLlLOH47fMjC6/smQ==
X-Received: by 2002:a17:907:d87:b0:b9c:b069:8ac3 with SMTP id
 a640c23a62f3a-b9cb069bac2mr337550766b.3.1775503801341; Mon, 06 Apr 2026
 12:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com> <20260403-swnode-unreg-retcode-v3-2-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-2-7886092b28b4@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Apr 2026 22:29:24 +0300
X-Gm-Features: AQROBzA8JV6OQ6clUVeDdQ8y2N7R8Nc6EH_ZR0i5RXUt9ZfYunTBiDn_zltZ3Uw
Message-ID: <CAHp75Vca5R82wEV1hAyu1=zkuQOw3htXT787XhGH+LVN+EHQHg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: swnode: defer probe on references to
 unregistered software nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 4:52=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> fwnode_property_get_reference_args() now returns -ENOTCONN when called
> on a software node referencing another software node which has not yet
> been registered as a firmware node. It makes sense to defer probe in this
> situation as the node will most likely be registered later on and we'll
> be able to resolve the reference eventually. Change the behavior of
> swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
> resolution returns -ENOTCONN.

...

>         for_each_gpio_property_name(propname, con_id) {
>                 ret =3D swnode_gpio_get_reference(fwnode, propname, idx, =
&args);
> -               if (ret =3D=3D 0)
> +               if (ret =3D=3D 0 || ret =3D=3D -ENOTCONN)
>                         break;

If I understood the logic correctly this may be just extended as

  if (ret =3D=3D 0)
    break;

  if (ret =3D=3D -ENOTCONN)
    /* ... */
    return -EPROBE_DEFER;

>         }
>         if (ret) {
> +               if (ret =3D=3D -ENOTCONN)
> +                       /*
> +                        * -ENOTCONN for a software node reference lookup=
 means
> +                        *  that a remote struct software_node exists but=
 has
> +                        *  not yet been registered as a firmware node. D=
efer
> +                        *  until this happens.
> +                        */
> +                       return ERR_PTR(-EPROBE_DEFER);
> +
>                 pr_debug("%s: can't parse '%s' property of node '%pfwP[%d=
]'\n",
>                         __func__, propname, fwnode, idx);
>                 return ERR_PTR(ret);

--=20
With Best Regards,
Andy Shevchenko
