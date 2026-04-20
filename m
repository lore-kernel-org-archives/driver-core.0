Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443F81AA8
	for <driver-core@lists.linux.dev>; Mon, 20 Apr 2026 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681615; cv=none; b=etBRK5ngab/Bc/0AHtma6Siqmp0P7nwWpqzxCW6aSGUtTcsvEVX2bKP70+4bet3ccpDQlnn3eWSAuz+WzbFusei6LspqoLfMbbZI7FgDoU/y0Az0hrnrUmHW7+RpaboLQ+U5MkBoXklQS7iPBUocHOVLJPIoT1FnSHyDWk+YtsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681615; c=relaxed/simple;
	bh=oGQTuSjnBLK35lK52m7vC5muW6a6h6qQ+a1v6/6nEJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFknjnCAQzf6l7oxM/PibzD4QytYQiOe4gnwtHE807XfmJuZ7M0MReFI687CKNB2jVaBYAdzyCLQLw04dlmWC5y6Ycd1OjEailYxcW/zb7UwAzO25LshneGwLhaQjNKF5EhlfQbYwMTwjXVEFX8163TO7516UhqdvI2puQWmYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inOsxB/6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inOsxB/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BE2C19425
	for <driver-core@lists.linux.dev>; Mon, 20 Apr 2026 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776681615;
	bh=oGQTuSjnBLK35lK52m7vC5muW6a6h6qQ+a1v6/6nEJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=inOsxB/6rB4+iucNP9YZIUUXzuC+TsxdoA5jbpxW5KpxlHPUuG+eeo1q6kMNEaCja
	 9Re7riAFteJsu5C3NVbVYU31FY3/8PHJDwygH/865QTtMcsjkFKaJHeO6q+3e4BDGx
	 GdVhoM6aEkTlWjL8HVsjUHDnFism8m6zT9yci2xtYM5W2kspxMzQ/96j4RsBWm8twC
	 0cVeW4iZOLykbzFB5qAP4Y8fQqSFTjHApYbaq/95jPNg49EUh8dBGY7Yyu/d3I2V81
	 LqTXHuK2MJR3WPQPq5QFfb/BoPANlMCsp0RvTYlP9pa6/Ehle3w2JXrhBxiIApnjxC
	 dNlxRXvbWdA2w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so3068123e87.2
        for <driver-core@lists.linux.dev>; Mon, 20 Apr 2026 03:40:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8+VZvt1R23SBnQBbRp4ustGCDdFkUUc9OrYq6Wo9b2CHmeAEc5So7uSn42jiQKr6cpVUoPXHGJ3AWIyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPAk4F5g1GTQItfNucaZd/IzX7hWxWatJ14J6tP+Kh2JEB4hg6
	4ksJScF3Uwf45NywXhu1bfxytKXs3n4eyXyKxrqevZ60dWof5niU92sCjZb5DCXY0NxUJPto8GJ
	nUp2TRiM3/NX8vXADPKHVBnDjOTLEHQk=
X-Received: by 2002:a05:6512:68f:b0:5a3:ffc6:6618 with SMTP id
 2adb3069b0e04-5a4172dd706mr4197538e87.26.1776681613767; Mon, 20 Apr 2026
 03:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418162221.1121873-1-dakr@kernel.org>
In-Reply-To: <20260418162221.1121873-1-dakr@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Apr 2026 12:40:00 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jkm9K9=-U_51FMsyxN2msdouRnz4sEjmxG0Btd6Hmw0w@mail.gmail.com>
X-Gm-Features: AQROBzAIrnBUK5gqgB8p70ImicjRLg8GBfN6yqd105Ye0aFy0FdWvLbNx48qnlg
Message-ID: <CAJZ5v0jkm9K9=-U_51FMsyxN2msdouRnz4sEjmxG0Btd6Hmw0w@mail.gmail.com>
Subject: Re: [PATCH] driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, saravanak@kernel.org, 
	ulf.hansson@linaro.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 6:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> dev_has_sync_state() reads dev->driver twice without holding
> device_lock() -- once for the NULL check and once to dereference
> ->sync_state. Some callers only hold device_links_write_lock, which
> doesn't prevent a concurrent unbind from clearing dev->driver via
> device_unbind_cleanup().
>
> Fix it by reading dev->driver exactly once with READ_ONCE(), pairing
> with the WRITE_ONCE() in device_set_driver().
>
> Link: https://lore.kernel.org/driver-core/DHW8QPU1VU1F.3P6PH69HLFBYC@kern=
el.org/
> Fixes: ac338acf514e ("driver core: Add dev_has_sync_state()")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  include/linux/device.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/device.h b/include/linux/device.h
> index ac972e7bead4..4c1c9cb8570a 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -1018,9 +1018,12 @@ static inline void device_lock_assert(struct devic=
e *dev)
>
>  static inline bool dev_has_sync_state(struct device *dev)
>  {
> +       struct device_driver *drv;
> +
>         if (!dev)
>                 return false;
> -       if (dev->driver && dev->driver->sync_state)
> +       drv =3D READ_ONCE(dev->driver);
> +       if (drv && drv->sync_state)
>                 return true;
>         if (dev->bus && dev->bus->sync_state)
>                 return true;
>

On a somewhat related note, I'm wondering if this function can be
moved to drivers/base/base.h?

It doesn't look like having it defined in device.h is particularly useful.
