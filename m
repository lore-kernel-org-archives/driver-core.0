Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929185;
	b=k0ALqz3xWfEpR6RDBHQVf8Khyc28WF4e8+Gwh10r2riGOLKBFAEAstmIjQfxFIjedJlD
	 VYcNMjkrCEnwXuesu0nDe79iVM8FGFBpDK63jPanSb2Q+44imBznlqGM67YqugY7LZtUj
	 98rxF0cfzWOUrEJ0mH6yurMI3vgY4XUE1BnvKv2UDt1HQ0fKvFcFcOoA5mJTX0g1KsX4g
	 t6ViMsX5jhJHodDmRQN6lN9S8BetbF9YbDu67bNH0+rERjw5qdaVvJ+npkC4TyEIpCtMr
	 1ru2CQveh8PipczbXJ4z4k0RqGI27dqRvAoT4QWB4DDZa6O7Z7sewOLbu532yZudKPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929185;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=++06PQJflKig+6hQln7vv+bAUJFdci8/kWBunR+qCrE=;
	b=5X5IVToHw4s+vutOmY/rEaDC6AngID+yzA7dSS44DmO8qc5oKeCKl67/g6ey/wVny8yD
	 zXAo0ZWDFz01P6RytW3JzYInsP7MTsXzv0TJKGQmQfxLs/GsI6TfHAHVRQc5Mtyv+7dSm
	 q4ZbH5uiDfbYvIeXz0eXJXCvmTJerSXcCgwrEqeFzlHQECmkLSqmhNRNduypY5+KwIRgx
	 HM6AHsV42T8nus37xwDp87tBejEMG1eAgSkh4+KhbNZTjdB7Pz3YP56wW37iaEaqTHBIR
	 BTGUz2DQepLL4kXlkgyJMnUc3FCzC2+l1wXIi+iGEQJ/fQccqYQMNt45Z+zEWZK1xJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fDiYjYi/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03386606A334
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDiYjYi/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D387E1F000D1
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794929184;
	bh=++06PQJflKig+6hQln7vv+bAUJFdci8/kWBunR+qCrE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fDiYjYi/FXrZfOf7lvpYHSAFwq4OjV9SzMBCOyo2K4WmqTSeimz6j1Tx1tIRCxepQ
	 mCvUm3tXyn40runumrRvF5U9+SaLcr25EIDkyei+b2NJxIFhpeGYX9ceM3xFsDDiuM
	 7mkq8Cu0w4nk/tuIJo923Gb81kHrTArg2fHdcNQsgp+y6dXaw1bi0yLGiQJGlWu2l0
	 /brXR7qNzzzlZW3+dgjUFFYxQ0gwhi/v2hm2o1+KioIgw3wVwQ8HXZcaNS6DVGJQnf
	 lQ3Lu8TQ8C8rb6wG22bN5RgxCEqYQUyUTK0szeg1V23W7N7QrYYocAn3taegaCuWyQ
	 RFcMQv7Ci0NQg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c08539c827so3750719e87.2
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 07:26:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGaVFJdM+UeqzZXQumljgJfDvhN8c5xiCzxJTvQzOi3Tir8yeTsMtUkh/5q6w+3CaoZ2VBQ/yhsy6h1ag==@lists.linux.dev
X-Gm-Message-State: APuU4Z+sHHQRlA0TyqSaFU57ffb5VEItR37+ot0fQ1ml0OZE0Mxu0egk
	KQtKXR8y3HeWX9oOGifx9XfMkHgWKNE+1AfAQUZqvb2TU0xxHa5O1X1/0E8z3adN0/bR0FOSmfO
	gm0qjIA91bk0Txz4KoTGDC1U2qQwYkH4=
X-Received: by 2002:ac2:4bd3:0:b0:5c1:4f8a:8f5 with SMTP id
 2adb3069b0e04-5c170771fbamr6263013e87.25.1794929183274; Tue, 17 Nov 2026
 07:26:23 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117101336.980216-1-johan@kernel.org> <20261117101336.980216-9-johan@kernel.org>
In-Reply-To: <20261117101336.980216-9-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 17 Nov 2026 16:26:08 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0ipadLX1yUwi6Ei4o8+b9YtsyXsprXfA-8xDaE5uY4+7A@mail.gmail.com>
X-Gm-Features: AclHuK9P-eL5qUVo7UHG-qeLLKO9_Qsiw7_oDS5I9OT8qh0o6GqsYRVlxAXrvE4
Message-ID: <CAJZ5v0ipadLX1yUwi6Ei4o8+b9YtsyXsprXfA-8xDaE5uY4+7A@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] device property: fix fwnode_get_next_child_node() comments
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:13=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> The parent pointer in fwnode_get_next_child_node() may not point to a
> primary firmware node so update the comments to reflect that.
>
> While at it, fix an indefinite article in an earlier comment.
>
> Fixes: 190069255582 ("device property: fix infinite loop in fwnode_for_ea=
ch_child_node()")
> Cc: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

LGTM

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/base/property.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 51109794d727..bfc424a193b8 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -810,7 +810,7 @@ fwnode_get_next_child_node(const struct fwnode_handle=
 *fwnode,
>
>         /*
>          * If this function is in a loop and the previous iteration retur=
ned
> -        * an child from fwnode->secondary, then we need to use the secon=
dary
> +        * a child from fwnode->secondary, then we need to use the second=
ary
>          * as parent rather than @fwnode.
>          */
>         if (child) {
> @@ -822,12 +822,11 @@ fwnode_get_next_child_node(const struct fwnode_hand=
le *fwnode,
>         if (IS_ERR_OR_NULL(parent))
>                 return NULL;
>
> -       /* Try to find a child in primary fwnode */
>         next =3D fwnode_call_ptr_op(parent, get_next_child_node, child);
>         if (next)
>                 return next;
>
> -       /* When no more children in primary, continue with secondary */
> +       /* When no more children, continue with any secondary node */
>         return fwnode_get_next_child_node(parent->secondary, NULL);
>  }
>  EXPORT_SYMBOL_GPL(fwnode_get_next_child_node);
> --
> 2.56.1
>
>
