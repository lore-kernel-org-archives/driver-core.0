Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D433ACA48;
	Tue, 31 Mar 2026 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968175; cv=none; b=iQPVyR8KtJYVNG1MGrpnnprWMJNodjF48zCQiSecg6lPVoFrq9zJlJLdxIg+lxwMfNUM2NyEbWmXpIJKdqy1Ntg+f5dIHoB2dmQMt6DW1WVhjGfoJvh3sZgZuqJQBu6a9zYvlwrX1Pnoeql/XBFGDKUqbsPTZeOvAOKNzLiFOI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968175; c=relaxed/simple;
	bh=S1w1v1N3tuBG4tGxBDM4qmwiAnq1amBN98FGsNH5C7c=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=RoYTiBkm637I0oFxnoA07OMKRofjTWbihDTISv9SR/ll3Y6KbJ8r2lOEKq2+EN5/Hcjzo03a5VyoSc4Aztao0dsDAbbuOPWj172A8HKCXDoTSMP/aGiArRb0jQzGwgWy5mQzbOdzocFosJGHWq46im1VLLdqLeQEVa0AgnVqNlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wt3PvRF6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wt3PvRF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E312FC19423;
	Tue, 31 Mar 2026 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774968174;
	bh=S1w1v1N3tuBG4tGxBDM4qmwiAnq1amBN98FGsNH5C7c=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=Wt3PvRF6UVduIsBixBjzOcLxKhQydZsAESa6IwEPHZlBgj11IuFk5Q17qw8eXg3YI
	 gzqN3jzPAY7eNKxlkWpDpdwPIIkorddMghLbGm7M9+jMwaK4/B5JUQL+AB/PwLnlEm
	 UaxWvolK8xxxGKT9mZSLL89zZ94o5l/4+i8vmhd8Y5DbMeNXXwLQkV3uvOPsAf3Sa9
	 NIDXAyR87p7nf2cV8sSHeQVE08QOKUu06uzq40zhCOM0dpig7WXAAJdZKaW2ePn2Rn
	 cTepCKUMFn0vNyIasprEjdoxgSLNuCykQ2Dg6CvbQoyyLVsOO8a7tbnNiHv6ry1nDY
	 hkc9r95egsh5Q==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 16:42:51 +0200
Message-Id: <DHH1PD0ASG8H.1K3KG9L658DYN@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] driver core: Don't let a device probe until it's
 ready
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Alan Stern" <stern@rowland.harvard.edu>, "Kay
 Sievers" <kay.sievers@vrfy.org>, "Saravana Kannan" <saravanak@kernel.org>,
 <stable@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <20260330072839.v2.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
In-Reply-To: <20260330072839.v2.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>

On Mon Mar 30, 2026 at 4:28 PM CEST, Douglas Anderson wrote:
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 09b98f02f559..4caa3fd1ecdb 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3688,6 +3688,21 @@ int device_add(struct device *dev)
>  		fw_devlink_link_device(dev);
>  	}
> =20
> +	/*
> +	 * The moment the device was linked into the bus's "klist_devices" in
> +	 * bus_add_device() then it's possible that probe could have been
> +	 * attempted in a different thread via userspace loading a driver
> +	 * matching the device. "ready_to_probe" being false would have blocked
> +	 * those attempts. Now that all of the above initialization has
> +	 * happened, unblock probe. If probe happens through another thread
> +	 * after this point but before bus_probe_device() runs then it's fine.
> +	 * bus_probe_device() -> device_initial_probe() -> __device_attach()
> +	 * will notice (under device_lock) that the device is already bound.
> +	 */
> +	device_lock(dev);
> +	dev->ready_to_probe =3D true;
> +	device_unlock(dev);
> +
>  	bus_probe_device(dev);
> =20
>  	/*
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 37c7e54e0e4c..a1762254828f 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -848,6 +848,18 @@ static int __driver_probe_device(const struct device=
_driver *drv, struct device
>  	if (dev->driver)
>  		return -EBUSY;
> =20
> +	/*
> +	 * In device_add(), the "struct device" gets linked into the subsystem'=
s
> +	 * list of devices and broadcast to userspace (via uevent) before we're
> +	 * quite ready to probe. Those open pathways to driver probe before
> +	 * we've finished enough of device_add() to reliably support probe.
> +	 * Detect this and tell other pathways to try again later. device_add()
> +	 * itself will also try to probe immediately after setting
> +	 * "ready_to_probe".
> +	 */
> +	if (!dev->ready_to_probe)
> +		return dev_err_probe(dev, -EPROBE_DEFER, "Device not ready_to_probe");

Are we sure this dev->ready_to_probe dance does not introduce a new subtle =
bug
considering that ready_to_probe is within a bitfield of struct device?

I.e. are we sure there are no potential concurrent modifications of other f=
ields
in this bitfield that are not protected with the device lock?

For instance, in __driver_attach() we set dev->can_match if
driver_match_device() returns -EPROBE_DEFER without the device lock held.

This is exactly the case you want to protect against, i.e. device_add() rac=
ing
with __driver_attach().

So, there is a chance that the dev->ready_to_probe change gets interleaved =
with
a dev->can_match change.

I think all this goes away if we stop using bitfields for synchronization; =
we
should convert some of those to flags that we can modify with set_bit() and
friends instead.

> +
>  	dev->can_match =3D true;
>  	dev_dbg(dev, "bus: '%s': %s: matched device with driver %s\n",
>  		drv->bus->name, __func__, drv->name);
> diff --git a/include/linux/device.h b/include/linux/device.h
> index e65d564f01cd..e2f83384b627 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -553,6 +553,8 @@ struct device_physical_location {
>   * @dma_skip_sync: DMA sync operations can be skipped for coherent buffe=
rs.
>   * @dma_iommu: Device is using default IOMMU implementation for DMA and
>   *		doesn't rely on dma_ops structure.
> + * @ready_to_probe: If set to %true then device_add() has finished enoug=
h
> + *		initialization that probe could be called.
>   *
>   * At the lowest level, every device in a Linux system is represented by=
 an
>   * instance of struct device. The device structure contains the informat=
ion
> @@ -675,6 +677,7 @@ struct device {
>  #ifdef CONFIG_IOMMU_DMA
>  	bool			dma_iommu:1;
>  #endif
> +	bool			ready_to_probe:1;
>  };
