Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F3C33A6F7
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780940835; cv=pass; b=YWS3rlj2hNZBiMtZDwC1UWwHytyAeELMdQUbL76OYZilBvhscUcP1ipfFabTDcrxnsspSsHkgEhalVbSLMMn7piGRWqkIGdHNwDik9A/Exs175YycbjcnzjOAS6GQ8dNWzNBTLuUVUjvIMIB76ux47G5jQSDRthsZk7RsTpWYt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780940835; c=relaxed/simple;
	bh=qHOSN3CiBXYnjZS3fMmxWOq5WSeYJzuNKPvw/847FmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmGUqfhz8J2Kzyhxb1KD4vY9bHImg/x9uI2oo5qQ3Sk5IRmLiq12KTzkwvcKQ7b0Z5gWPlkzJYKr7rVHnsiJhYKdU4hB9CLaGdKRjlFUQpFJX3JFdnYCCE9gEnBQOodRtqLmrNuF1naR7o2QvhbYdbNYKSyGfDxuzVxpeI2040c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a37bYjYz; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a37bYjYz"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68ca6f01079so5465674a12.0
        for <driver-core@lists.linux.dev>; Mon, 08 Jun 2026 10:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780940832; cv=none;
        d=google.com; s=arc-20240605;
        b=E2rD0B84zlFY06DwZ+CCzNQkspQL2etFJ+2nHMvyUUqT6FFypTX/6x76jOvRnYRllw
         jINHPq4PURiU3A39hJMnKiM7hEnHr6S14fIOfBsxmc9NEGPUiAGtT2bMOorWaCDPEFW+
         80D6p5dD+X0GAP0kGnY27O05SBxwESJRDV7tixt8tLCqT1YQixm20i65dPh3CihD4NN2
         qNSitQTvLbEbn+io0ahRwPknlpnSap0vMufDo+9Kmm27HEKIeViKdTKhuX8ipnNKYcjc
         b3eNqpZCkN+A7cVEUA7e1vGkO65SN2aHVQnNg1t8i2ydk5svjx9kfmjV71hfu28gF+2o
         6WNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eOXE8R0rs9hWTG1f22gZq63lJX1nC2oAn7YRODWgoMM=;
        fh=RYMT4m12QYCmuTuPyhUbtHNHp1KNq3TL6wBQMXNl12E=;
        b=dx6HoSiv1X2PdF7tXXMurU1OAYvv40Ocu1Tg7cVIYzEo8hXS3u1wlEUj6z4p9Z3f7J
         CRO4JVvdUjKCB8CnYHPLEPxzep6e4hd6wvAtnKnpvKeCIS6VwSo80BLvHzm2xDbj4h7t
         a1ARp3YMc82MO4tDCBep7DmXmG6S23cBTnHRCwMt/eBCxnE0jDIgZ6uY2K/vJUtIJkjO
         0tiau1rdwCUWxsR8VUgLXxRn1UJcpcjWGeSLgDuAzLNNPd+gu62t2FnT1g6WK5GLbgOY
         jammgI+od1+ByLY/peazAA43Ife4++LYqpWyZuF0t4ERITNqGvFdH4rqAapSCRy4WhtW
         z7ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780940832; x=1781545632; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eOXE8R0rs9hWTG1f22gZq63lJX1nC2oAn7YRODWgoMM=;
        b=a37bYjYzw1Hx18uE8MTloYNxxqq8RBq1hWmhG72VmjE8zcdVGn+l72aRMT19m+PjGi
         sRn5VsIMs1RlpWeCc4HFyE+4cD3nQ7b0G0t+PuHLq5q78FNO2USkM7bwSVoA8oDEjKUS
         2RWJpWMJJqfOxbNbd8qAb7/rqK8J65HrFxAPt92I38sHoLkpBPcR+59xDpjfGzpwmvQJ
         ab117CHFwbOvbXQoQuK4O9PAtT6pyYqNQYNF76GohiozB12yFOXlHFxfSBnc7tvMipBZ
         b6zLw5FIMUN1R0vzn65ig6OT26qGnjen0bX/VI4sG9MIjwG3gd2nbfWagOyn3iQDv+Bf
         kbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780940832; x=1781545632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOXE8R0rs9hWTG1f22gZq63lJX1nC2oAn7YRODWgoMM=;
        b=mIsXBoOR62+AfeTgLTImVQDI1rj6ZcOHObx8g0mlq4Z8cLJZZnv5CkwfBaHYrG+BLI
         9GzD9zU2K+gKYUHWNpTIRfn4Be3f3ZyyBbFfIp9r+ihvX2lLWPrzeAayU/ZI1GXeuv6N
         pHGNzhZ4f0UNYKsF6X6OdLorofLzyw4dl8fZIhTfHOuE81eLpXwtdwoM4KWHKAazGwsO
         KpgwWoRKpIO0qGzgQRC5vrydncXOHsFki8sStboGme3u8Xf6B2QPo3Vi7y2+OtENeHe6
         lGQYh4BVMU/OKliSVOu1EI4tALJjq33jnRdzn8R363bh9ZFXW9mmRrWDLWCtD0zwGKhe
         dABg==
X-Forwarded-Encrypted: i=1; AFNElJ/DwY7ns1Q3//TAf1l6ilhKSFeqLrgir27+ywZYcNj3azMDVHzbfVuENlmKgnkOQ6sh0/n+GO5ymmSsNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHw2MTVyqOUC90Jtk/XqUupBeq4UH7F4qIOHG58yx0eR+T8/J8
	rBL7un+aaFS5OHsvrWk5fdq58cbS0d/LEo3nxmzFfTYWuGHKNkH9UdYGDYjW3flkTyU/Az2+Twr
	SH3cG5UfwHAOI8Mp7KVBkFsG3iJHv4VEsnHt7WXJmMA==
X-Gm-Gg: Acq92OFIDHxA+/Kj/Y+ct22jbe+lxRWcYFGVQKO6a4EYTjl8+0pH4M2i+tAoxj1Huqm
	SawfYAJFnWEon2f8iCEv4MhPyXN2JpXV76+AHcdOyWeHQWEteBUhSSFsbwtyGj0wV0kUFAlJH2x
	3+WJDABcSTy1MtgmwvRsuLVSfLyc/HFOsWxnEm/yRjOIIubF7mW2rAwwhMVEOdvKy2/GmUgcatj
	RoYs43V18jbH70PeK9STaSGti6vjg0auOVFRWKcSDfVI/gJ6lgNVg00mjF0P62q6IAy2SjLfoW/
	bpM7f/B+YdzL0BT9/YdsWGOF2ZimOfg6FIcpKNV9vXloB58+dhgz
X-Received: by 2002:a05:6402:847:b0:68e:4c0:f5b1 with SMTP id
 4fb4d7f45d1cf-68fa4c00598mr6979387a12.2.1780940831827; Mon, 08 Jun 2026
 10:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602160829.560904-1-runyu.xiao@seu.edu.cn>
 <20260604035239.1711889-1-runyu.xiao@seu.edu.cn> <20260604035239.1711889-3-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260604035239.1711889-3-runyu.xiao@seu.edu.cn>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 8 Jun 2026 11:47:00 -0600
X-Gm-Features: AVVi8CfoZLiHBf9aDuZ4wDa8jT-va5Ux9POcpJ_j1yJw8B2FcWKwCD0yeZ72G4c
Message-ID: <CANLsYkwa9STAfcBxhgMVCEOWwmBVBx=fW+XwZrRUR07eeY6KjA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rpmsg: core: use generic driver_override infrastructure
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux@armlinux.org.uk, andersson@kernel.org, 
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, longli@microsoft.com, nipun.gupta@amd.com, 
	nikhil.agarwal@amd.com, linux-remoteproc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 21:52, Runyu Xiao <runyu.xiao@seu.edu.cn> wrote:
>
> RPMSG still keeps driver_override in bus-private storage.
>
> That private pointer can be updated from the sysfs driver_override
> attribute, and also from rpmsg_register_device_override(). Both paths
> replace the pointer and can free the old value.
>
> However, driver_match_device() can call rpmsg_dev_match() from
> __driver_attach() without holding the device lock, and rpmsg_dev_match()
> still dereferences that private pointer directly.
>
> This leaves the match path racing with concurrent driver_override
> updates, with the usual risk of comparing against freed memory.
>
> Switch rpmsg to the driver-core driver_override infrastructure. This
> removes the private storage, uses device_match_driver_override() for the
> locked read in rpmsg_dev_match(), and converts
> rpmsg_register_device_override() to device_set_driver_override() so the
> in-kernel override path uses the same core-managed storage. With that
> storage now owned by struct device, drop the remaining rpmsg transport
> release-path frees of rpdev->driver_override as well.
>
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/
> Fixes: 39e47767ec9b ("rpmsg: Add driver_override device attribute for rpmsg_device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
> drivers/rpmsg/qcom_glink_native.c |  2 --
> drivers/rpmsg/rpmsg_core.c        | 41 ++++++--------------------------------
> drivers/rpmsg/virtio_rpmsg_bus.c  |  1 -
> include/linux/rpmsg.h             |  4 ----

For the bottom 3:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  4 files changed, 6 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e7f7831d37f8..11d3007db5cd 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -358,33 +358,6 @@ rpmsg_show_attr(src, src, "0x%x\n");
>  rpmsg_show_attr(dst, dst, "0x%x\n");
>  rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
>
> -static ssize_t driver_override_store(struct device *dev,
> -                                    struct device_attribute *attr,
> -                                    const char *buf, size_t count)
> -{
> -       struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> -       int ret;
> -
> -       ret = driver_set_override(dev, &rpdev->driver_override, buf, count);
> -       if (ret)
> -               return ret;
> -
> -       return count;
> -}
> -
> -static ssize_t driver_override_show(struct device *dev,
> -                                   struct device_attribute *attr, char *buf)
> -{
> -       struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> -       ssize_t len;
> -
> -       device_lock(dev);
> -       len = sysfs_emit(buf, "%s\n", rpdev->driver_override);
> -       device_unlock(dev);
> -       return len;
> -}
> -static DEVICE_ATTR_RW(driver_override);
> -
>  static ssize_t modalias_show(struct device *dev,
>                              struct device_attribute *attr, char *buf)
>  {
> @@ -405,7 +378,6 @@ static struct attribute *rpmsg_dev_attrs[] = {
>         &dev_attr_dst.attr,
>         &dev_attr_src.attr,
>         &dev_attr_announce.attr,
> -       &dev_attr_driver_override.attr,
>         NULL,
>  };
>  ATTRIBUTE_GROUPS(rpmsg_dev);
> @@ -424,9 +396,11 @@ static int rpmsg_dev_match(struct device *dev, const struct device_driver *drv)
>         const struct rpmsg_driver *rpdrv = to_rpmsg_driver(drv);
>         const struct rpmsg_device_id *ids = rpdrv->id_table;
>         unsigned int i;
> +       int ret;
>
> -       if (rpdev->driver_override)
> -               return !strcmp(rpdev->driver_override, drv->name);
> +       ret = device_match_driver_override(dev, drv);
> +       if (ret >= 0)
> +               return ret;
>
>         if (ids)
>                 for (i = 0; ids[i].name[0]; i++)
> @@ -533,6 +507,7 @@ static void rpmsg_dev_remove(struct device *dev)
>
>  static const struct bus_type rpmsg_bus = {
>         .name           = "rpmsg",
> +       .driver_override = true,
>         .match          = rpmsg_dev_match,
>         .dev_groups     = rpmsg_dev_groups,
>         .uevent         = rpmsg_uevent,
> @@ -560,9 +535,7 @@ int rpmsg_register_device_override(struct rpmsg_device *rpdev,
>
>         device_initialize(dev);
>         if (driver_override) {
> -               ret = driver_set_override(dev, &rpdev->driver_override,
> -                                         driver_override,
> -                                         strlen(driver_override));
> +               ret = device_set_driver_override(dev, driver_override);
>                 if (ret) {
>                         dev_err(dev, "device_set_override failed: %d\n", ret);
>                         put_device(dev);
> @@ -573,8 +546,6 @@ int rpmsg_register_device_override(struct rpmsg_device *rpdev,
>         ret = device_add(dev);
>         if (ret) {
>                 dev_err(dev, "device_add failed: %d\n", ret);
> -               kfree(rpdev->driver_override);
> -               rpdev->driver_override = NULL;
>                 put_device(dev);
>         }
>
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 401a4ece0c97..d9d4468e4cbd 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1626,7 +1626,6 @@ static void qcom_glink_rpdev_release(struct device *dev)
>  {
>         struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>
> -       kfree(rpdev->driver_override);
>         kfree(rpdev);
>  }
>
> @@ -1862,7 +1861,6 @@ static void qcom_glink_device_release(struct device *dev)
>
>         /* Release qcom_glink_alloc_channel() reference */
>         kref_put(&channel->refcount, qcom_glink_channel_release);
> -       kfree(rpdev->driver_override);
>         kfree(rpdev);
>  }
>
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 5ae15111fb4f..1b8bb05924af 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -374,7 +374,6 @@ static void virtio_rpmsg_release_device(struct device *dev)
>         struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>         struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>
> -       kfree(rpdev->driver_override);
>         kfree(vch);
>  }
>
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 83266ce14642..2e40eb54155e 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -41,9 +41,6 @@ struct rpmsg_channel_info {
>   * rpmsg_device - device that belong to the rpmsg bus
>   * @dev: the device struct
>   * @id: device id (used to match between rpmsg drivers and devices)
> - * @driver_override: driver name to force a match; do not set directly,
> - *                   because core frees it; use driver_set_override() to
> - *                   set or clear it.
>   * @src: local address
>   * @dst: destination address
>   * @ept: the rpmsg endpoint of this channel
> @@ -53,7 +50,6 @@ struct rpmsg_channel_info {
>  struct rpmsg_device {
>         struct device dev;
>         struct rpmsg_device_id id;
> -       const char *driver_override;
>         u32 src;
>         u32 dst;
>         struct rpmsg_endpoint *ept;
> --
> 2.34.1
