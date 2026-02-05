Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7434723C516
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298791; cv=none; b=JoFaoZ+5diEbbrSv06M/UwN1ZnUNgHkfniC0gJh3ed/aZpBIGNxU2IjJ4MhXNujNwfJU1cm1VlZ02QphzuluO2uE6ArJRZH4Hy5YeHTzQ60YFXUzgNWIxczZNrXuJFqCKCeSe+P5I3GtI9LtJfrcqK7C7yYalwXQdH9xKVMpKGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298791; c=relaxed/simple;
	bh=6r5v68Merfpxg1UUm8/Kwj7bCqbM8IgCLaB4xo+YiqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hc49muqfETKKcKM5NhW+yDmpB+MbmjCwGT+IChOdGksoNPG3/5cLCIy5/GTwl1vq+yaaYngWxRU4C+X+D5Yld3VCCakN8geXAT1ReOJH032nIWDTX5+EzYB8Hrko1WXKHsHMMfZj2mDuVTyOowhSx2jIudkEqj2xZ6vDodY8+xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwElltTC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwElltTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577AEC4CEF7
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770298791;
	bh=6r5v68Merfpxg1UUm8/Kwj7bCqbM8IgCLaB4xo+YiqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FwElltTCmGnzczAOs9cyhMstcmvda3Ph61BZggnI8Wm+TxccazZif31+wcUL1mBUV
	 6tU2PAs4JAPPRGbyHcPGP1ZVgiuep2kiKb/YM9CSbmTxDj84x+pG0YshrJxUcnWJQP
	 BkHfpTdaC4ZnEMGe9K/eXC1Dv4TNz4PH64uR6mjgPxJZV8OAnpZbGVOXqNTDDoxsIm
	 BII2SbLzS6ROxnyJ21SyFsfQmJmSGmd9OVlf6jvuHySYVcIqoTkVyNG+MEOEpajPhh
	 GiFjTM8LEAK8LV5svy7drDLRF3ddwiQkeW1XlG69oTe/oJJKQ7e3ix0qbXtgYJq9Km
	 N7xLTzvas/8Wg==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-662efd1bdd4so620595eaf.0
        for <driver-core@lists.linux.dev>; Thu, 05 Feb 2026 05:39:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhVjMPcc3esHmSX7lzJTgAeBRuxeABv8EJ3ABNDmTBZoU2wnA6aaXSxaLI27aTDcRJKYXIn6BJH24Mag==@lists.linux.dev
X-Gm-Message-State: AOJu0YymvY1G85naexOp1fFHo9S8klZ1CV/QTa2nHR6DtdJxUCO6EZ3q
	8JTBP5n8lWP+3i4qpMH9n3YPOhA4uIgL4RYYKNUvrd0KzZgPG0uc8T9UY5yaQxgJYhh46ypiN7C
	8SHfxfKMjo+GW7bt4DnanOukK4gCg/hw=
X-Received: by 2002:a05:6820:1692:b0:662:b663:5956 with SMTP id
 006d021491bc7-66bac25b93dmr1096038eaf.1.1770298790449; Thu, 05 Feb 2026
 05:39:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026020541-energize-graduate-981a@gregkh> <2026020543-molar-childcare-af20@gregkh>
In-Reply-To: <2026020543-molar-childcare-af20@gregkh>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 5 Feb 2026 14:39:38 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jkm-7sVYyJj+t0Qe+4ZjTz_-aE-XGm-yjKsC4324=a4w@mail.gmail.com>
X-Gm-Features: AZwV_Qica0U1ZCOPZetIHiyaN-udE9Wh_BBW7rA7TMfX8-CbpAv4N15Jg7u53S4
Message-ID: <CAJZ5v0jkm-7sVYyJj+t0Qe+4ZjTz_-aE-XGm-yjKsC4324=a4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver core: remove device_change_owner() export
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 2:09=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The function, device_change_owner() is exported for modules to use,
> but there are no in-kernel users of it, so remove the export to prevent
> out-of-tree code from thinking this is a safe function to call.
>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/base/core.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 40de2f51a1b1..f599a1384eec 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4781,7 +4781,6 @@ int device_change_owner(struct device *dev, kuid_t =
kuid, kgid_t kgid)
>         put_device(dev);
>         return error;
>  }
> -EXPORT_SYMBOL_GPL(device_change_owner);
>
>  /**
>   * device_shutdown - call ->shutdown() on each device to shutdown.
> --
> 2.53.0
>
