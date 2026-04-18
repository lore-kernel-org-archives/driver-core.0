Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A6140DFDD
	for <driver-core@lists.linux.dev>; Sat, 18 Apr 2026 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776539793; cv=none; b=lgVP3JfAH0u+n1DdQB4t86g9vbyEgyFM76vuq2F8fNMNYYqfO12xnl76xiB+A0N7Vgv76xMOEIjNWj4chirPtugaljoFnR5139PUSqzJ3uVMFZwWe3b9gleF+F/y9K2TedgG7lGPJlLc72t+3aDnprKrkidZQ2Wiw2SY2sJXzho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776539793; c=relaxed/simple;
	bh=iH+pzRH9NxNFzHv7j/2YirivUzGStkJyyPU8YqJvBxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jniFRdX9gV4qKwQYeQb8b1oII6Y3eN47IWgcfkc22Iy45QpH98LlDhKVyXUTLJF/kMtKdbcKourPou14/yM0Gz9fDn3xCA5YnXlqAetgWlArsP7RerVaccERjrgavj2yrgqUrs1wpQXNajvAW0Ccmr7v4BfnUnlEKi3Fb7XS240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gioxZOXq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gioxZOXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB64C2BCB5
	for <driver-core@lists.linux.dev>; Sat, 18 Apr 2026 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776539793;
	bh=iH+pzRH9NxNFzHv7j/2YirivUzGStkJyyPU8YqJvBxE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gioxZOXqYUiNHht5ydkIctL/HXaz4LoCisEOrXcpmcs4dNwKyII/8pJ48I1X3jQcy
	 m22NBmDAzRgxddLfzpCa3/iLt6nTldH/XYwah/fl+KaIZCiwhquc4lKRPiU9MTXFY5
	 nZenljK7GLQ+QJOdBb3xeDhRX/uZccI0xi6FLxORtFGwi7yLTDCR2cpEuicuM3G54x
	 WEb8UM5mKOKKz699Ne2fMG043+2YKsFjq5Bs8RaKsMIQYTij/BXi5pZltdIjDqFqmM
	 AGHK9q3u4di2yQc4jyMdJCnVVnFX5dLA83rv0r7S5MSCIU9MLaxvCs5aVJyx31Iy4N
	 +euwBz16FdSmw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6720c7968e4so3378520a12.0
        for <driver-core@lists.linux.dev>; Sat, 18 Apr 2026 12:16:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9UHKlHyLeqcRDd/jlzUd+EgCYkFbPDuStF/NCoY8OetYttsEDzy19ClAaMolDPVqm+o1/Olo0JdGpDhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwtHOwqVMMgDA+RlKMtsw2QDQvkS6JTCznpMQVxP3Mk3U5ZHaF
	hjx4aV2r+6gCf//zDUIbpR1MPpyOCsGsE+EYftMBtJJBMdiSQ8a+/yBHuFiydBN5UEJn8jFSkdi
	OX6K3X4WNhfd6eq4RxAQFUne5PQU5fTQ=
X-Received: by 2002:a05:6402:1d53:b0:671:a6e2:8f74 with SMTP id
 4fb4d7f45d1cf-672c12b2fd1mr2850429a12.10.1776539792326; Sat, 18 Apr 2026
 12:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418162221.1121873-1-dakr@kernel.org>
In-Reply-To: <20260418162221.1121873-1-dakr@kernel.org>
From: Saravana Kannan <saravanak@kernel.org>
Date: Sat, 18 Apr 2026 12:16:22 -0700
X-Gmail-Original-Message-ID: <CACRMN=fFOUHz+SBoXaDkZKoXcGtksrDv+yQW8ya8GTBtdf5iow@mail.gmail.com>
X-Gm-Features: AQROBzAOChMhh1r2TmToEW8Kd6o6bCo-lxxLiOQ8YnjqTju5ktFNUjTEYzWmA6o
Message-ID: <CACRMN=fFOUHz+SBoXaDkZKoXcGtksrDv+yQW8ya8GTBtdf5iow@mail.gmail.com>
Subject: Re: [PATCH] driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, saravanak@kernel.org, 
	ulf.hansson@linaro.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 9:22=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
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

Reviewed-by: Saravana Kannan <saravanak@kernel.org>

-Saravana

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
> base-commit: 5b484311507b5d403c1f7a45f6aa3778549e268b
> --
> 2.53.0
>
