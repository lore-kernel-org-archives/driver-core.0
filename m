Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7A648665F
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057755; cv=none; b=NMFE5x5od382qR+rzkATz5syEqvDJd9/UTDUttc+4Hk9OQFJkMu75R+L2c7ZR0Uap4f7c31dq2GUL2nziJ8vNgOA1xqLKQFezed8eehxXMIygclqdlxABU9/lTRQhx412gV39SRe1BZ8HItXqRTJZLmi9GXWKNax2pGCDqBkem8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057755; c=relaxed/simple;
	bh=HZ5/ZTe0o0stFkn0v+Skv9Pkz8EPR2PjgVLVSSpSrbc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLVJ4dceZIcZKdsifZ2IG54lc7W27UGpYh5NjCmZh6jbme10iUh/JkyWKDKL8IL7vO0QCFsexeZ/1Kiact63C+3B9rltjKTrRfhsP2w2rSQUIeY7eSY9m2baKWXdvTjYFKNt1m2oe0rwYyw81cFJ8Xw+Ehwu/cIsljBpLvOH7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lF3gu2so; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lF3gu2so"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2B81F000C6
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057754;
	bh=nT9Oo7iXgADtYp5co9OiTR6UXXfzH97xvsCw4wzlKqs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lF3gu2soNC+q+EeSdcAbmkjoxP2rczlnyJdeTtIv8syw6vTsK1WSEueFu7cjOcWR0
	 f+3yhO3h2+A3bh9Vv3lOX2x0porx8pNVVPGDq9AJqGKZOQ11iS2nqiCH62zhuYaF3E
	 GKKuR841MQ0n0hBYXU1A1crNuiDruFnqyVFDxKqCVUawcRrJko7c7rNgw+QMf3yN3q
	 TBsa9cc15BoCxmj3VugGNcaziCrkwdCP9bdEJIYCYGv8ZQQMy5tIPMHtIeYmtcwufc
	 14e+BF0JDzmG2aLym5ZMGmxYc0FPc+xSOeDq01WWFA8Sv1wW+cPmIOrv4SjKNNTFiQ
	 iFbY1XEyNiDaw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a75f960be4so38915551fa.2
        for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 02:49:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQAIcmWDLAI7pAqe4U++L/SA9np2ZDcgXAU8TYkMUPmZVTV8RykaTtqGPQTD1zR6vmOBJgEXp41KP06A==@lists.linux.dev
X-Gm-Message-State: AFq9FYLdqd6O8/e+5ky2oaP2hzulbbvtTSSI69/gbEilfYEmKLJbE2im
	M5ORYxA/kL8O5hSOkwHXazQFPHoCqmyLSrS0CeA5V+CULD0fhO4p0fulga0ALG4LO0sJJjs6Spz
	YoPcPn/suSN+tEPHHxWbeBw0WPHLx89Ego5fld4TZVw==
X-Received: by 2002:a05:651c:510:b0:3a7:8372:61b7 with SMTP id
 38308e7fff4ca-3a9c56e47e1mr41776871fa.25.1792057753228; Thu, 15 Oct 2026
 02:49:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 05:49:12 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 05:49:11 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261011121246.162759-6-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011121246.162759-1-tzungbi@kernel.org> <20261011121246.162759-6-tzungbi@kernel.org>
Date: Thu, 15 Oct 2026 05:49:11 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeWy7UQrGEr7MG5KT1b_NeLeEc9cYb+sAWuzU3shw620A@mail.gmail.com>
X-Gm-Features: AclHuK8brzPusY-1WAKnXNkeI2Aw9WKzMjJ4dsJ9Vf8cnHI3dHP0eQKp8_TPFsE
Message-ID: <CAMRc=MeWy7UQrGEr7MG5KT1b_NeLeEc9cYb+sAWuzU3shw620A@mail.gmail.com>
Subject: Re: [PATCH v14 5/5] reset: Leverage revocable for accessing struct reset_controller_dev
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Oct 2026 14:12:45 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> Commit 78ebbff6d1a0 ("reset: handle removing supplier before consumers")
> protected the `rcdev` pointer in `struct reset_control` with SRCU so
> that the reset core can handle suppliers unbinding while consumers still
> hold reset control handles.
>
> Because `struct reset_control` handles can outlive `rcdev`, each of the
> N handles had to embed its own `srcu_struct` and call synchronize_srcu()
> on release, and reset_controller_unregister() had to call
> synchronize_srcu() N times in a loop.
>
> Leverage dynamic revocable to allocate a single reference-counted
> `struct revocable` for `rcdev` shared across all N `struct reset_control`
> handles (1-to-N).  This reduces N `srcu_struct` instances per controller
> to 1, drops synchronize_srcu() from reset_control_put_internal(), and
> replaces the N synchronize_srcu() calls on unregistration with a single
> revocable_revoke().
>
> In addition, calling revocable_revoke() outside `rcdev->lock` avoids an
> ABBA lock inversion between `rcdev->lock` and SRCU, as
> reset_control_acquire() and reset_control_put_internal() acquire
> `rcdev->lock` inside the SRCU read-side critical section.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> v14:
> - New to the series.
> ---
>  drivers/reset/core.c             | 93 ++++++++------------------------
>  include/linux/reset-controller.h |  3 ++
>  2 files changed, 26 insertions(+), 70 deletions(-)
>
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 38e189d04d09..788a235c3965 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -24,8 +24,8 @@
>  #include <linux/property.h>
>  #include <linux/reset.h>
>  #include <linux/reset-controller.h>
> +#include <linux/revocable.h>
>  #include <linux/slab.h>
> -#include <linux/srcu.h>
>
>  static DEFINE_MUTEX(reset_list_mutex);
>  static LIST_HEAD(reset_controller_list);
> @@ -37,9 +37,7 @@ static DEFINE_IDA(reset_gpio_ida);
>
>  /**
>   * struct reset_control - a reset control
> - * @rcdev: a pointer to the reset controller device
> - *         this reset control belongs to
> - * @srcu: protects the rcdev pointer from removal during consumer access
> + * @rev: revocable handle for accessing the reset controller device

Please call it "revocable". The name "rev" does not indicate what it is at all.
Same elsewhere if you call it the same.

Otherwise looks good to me and nicely shrinks the code! We still don't know
what the fate of that series will be though, right?

Bart
