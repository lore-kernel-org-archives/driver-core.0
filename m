Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7103CA487
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769043; cv=none; b=lf3DoMmW8koJ4B4deXtdbpSi/Xuyb+Rty+fx1I3CQn4dBweOyY8QbLZVyIeig9x04Hny4TrK6lETF3tb/+diRukYmIxhegehlvvydz9m2eHRNlEsu1C74R49WqBBNqnt8TkVMWp+oK81AfEqF0//JURJvXEK1seCsWdlXKcTc6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769043; c=relaxed/simple;
	bh=7uutpCNWAahXhInXrsjarJ8XhuURUcRvN4QenNk1700=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OnTF6wkKPU4oMO3jkpc3oJlFJOSd2FaX3G4gD+GZHDyS+SQbs6Gq0SOgcyx2Gtezh2vFBQ5FByPpi4eOz/CWd9u6vdQJ8SyWr9PAidxpZ3tQenGxkCttsNpPkx/BRWso4OFJ/70R1hZg523IaCZlXEM5cPTGTTysmxVbpvTiWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KHEptHPR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KHEptHPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7uutpCNWAahXhInXrsjarJ8XhuURUcRvN4QenNk1700=;
	b=KHEptHPRpsb9PR05tkWP5h8Qci5vjJg2VRfxnxKz6fYv2eTDgjhfYxXbaiXjZp7TFdlTYF
	lLrwpZ0iWRYUbTMN1oQ+6OFY7J34NHmcNlEEz+t67PJ5PQDAHjHoFDNa3uLblK08evBClP
	Eko+DPHFemeRAfc8yzi8MNUslEY6204=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-p6h_WN1VOq2baj2VOcBhyw-1; Mon, 29 Jun 2026 17:37:19 -0400
X-MC-Unique: p6h_WN1VOq2baj2VOcBhyw-1
X-Mimecast-MFC-AGG-ID: p6h_WN1VOq2baj2VOcBhyw_1782769039
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so19874621cf.1
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 14:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782769039; x=1783373839;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4h5QDGQfeC12aIw9GPepcb1Zj6xE1bUvcgth2ziWe1A=;
        b=hcbMflSOS0TBIg32hQT+/vTYZ8yqo/X/kkh0WDo3ztu78wyn+ypmEQDGhSNVQwny7Y
         TabmsbXxNe4myzjAy+yy1JRQ7LQjRXGSJB9OFa5Socriv6LIRBpnad3klplgdgtf2Yrw
         WWV1UBmdBM5LbYtkPStzS9eqcMu6lrUfZ5zmhBxjFK+3G6S5KThFEGvbbIoa6jombrtl
         PqQUMWTM4kk13bLoulVeS4QqAHI9KRt41XhA1t7JjvvMF1kqNfyD6rUhzgi10JxpC9uf
         gsUyo7PObRhpsMudNBRSNtTUFagPlIgpwa+Kxql2pHiaAc2mY1FHj3knuzpjn8UGw1qp
         XhRw==
X-Gm-Message-State: AOJu0YyVf8s7nHrJbi7uLBiuP8aUs0b/u7z5BPWKdo8ZGhsdkfZz14ML
	OeKxs6k3LHb+zpaB9AXJ3FV8p2vQsJ7jrKD1ec++qMBz+jrQM0IkwEY5usm6HBuHctQ6Wv9Lwwp
	HpDuFavLWqN/SgI/fVFupDxtshFdwkVcnE/GeQReEhlF9P4HA0BT1WpcKwbozLqkN
X-Gm-Gg: AfdE7ckAz7wfj81upXt427x+Yll8ad3eZlIiLSIy/SWnQOXuaNZPLA21rMidFR1gIHl
	KmlanBaiIfylriNZKwen2wIEGGAgMoAnm31kaaaM8OC6ivThnxahpMJF1LHJouaXyF460OFOHXM
	piYnBce9sfvI3ctTNcO77z/FxuugC16j+jxPzC5Ux3w25MER4olQS7F+ZGEtpT35xwYyzc/oTRG
	HA1lUfIj5VYctZK+W1cDl0yIBvtsxRi9NYNrCYB8lA/THlQFKBDm5roQvrcpjPqRbniFmmxu7N7
	u4o/vHOG7ATvDstFKe5R+pXe/e57RjP6vLupJo8v5NPb1d7rA9aHIFjRoVR8v3RiitWLCV1dPBn
	VSLpgfX8=
X-Received: by 2002:ac8:5811:0:b0:51c:1d9:e95c with SMTP id d75a77b69052e-51c10716e14mr16825961cf.5.1782769038945;
        Mon, 29 Jun 2026 14:37:18 -0700 (PDT)
X-Received: by 2002:ac8:5811:0:b0:51c:1d9:e95c with SMTP id d75a77b69052e-51c10716e14mr16825551cf.5.1782769038320;
        Mon, 29 Jun 2026 14:37:18 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a69c25absm7952766d6.27.2026.06.29.14.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 14:37:17 -0700 (PDT)
Message-ID: <88003b81e8dc83f675ab94280409a1202a0c2959.camel@redhat.com>
Subject: Re: [PATCH v5 16/19] drm: fix race between partial
 drm_dev_register() failure and ioctl
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, ecourtney@nvidia.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, 	lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, 	deborah.brouwer@collabora.com,
 boris.brezillon@collabora.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org,
 sashiko-bot@kernel.org
Date: Mon, 29 Jun 2026 17:37:17 -0400
In-Reply-To: <20260628145406.2107056-17-dakr@kernel.org>
References: <20260628145406.2107056-1-dakr@kernel.org>
	 <20260628145406.2107056-17-dakr@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AM1WOpzrweBi8ZlBNae16yQ-VEylEViMSfQxebRtAH4_1782769039
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2026-06-28 at 16:53 +0200, Danilo Krummrich wrote:
> If drm_dev_register() fails after registering a minor (e.g. render
> minor
> registered, primary minor fails), userspace could have opened the
> first
> minor and entered a drm_dev_enter() critical section. Since the
> unplugged flag was never set, the ioctl proceeds while the error path
> tears down device resources.
>=20
> Fix this by introducing drm_dev_synchronize_unplug(), which sets the
> unplugged flag and waits for the SRCU barrier, ensuring all in-flight
> drm_dev_enter() critical sections complete before cleanup proceeds;
> call
> it on the error path of drm_dev_register().
>=20
> Fixes: bee330f3d672 ("drm: Use srcu to protect drm_device.unplugged")
> Cc: stable@vger.kernel.org
> Reported-by: sashiko-bot@kernel.org
> Closes:
> https://lore.kernel.org/all/20260620190648.2E9F61F000E9@smtp.kernel.org/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/drm_drv.c | 34 +++++++++++++++++++++++++---------
> =C2=A01 file changed, 25 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 675675480da4..e890052061f3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -473,6 +473,22 @@ void drm_dev_exit(int idx)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_dev_exit);
> =C2=A0
> +/*
> + * Mark the device as unplugged and wait for any in-flight
> drm_dev_enter()
> + * critical sections to complete.
> + */
> +static void drm_dev_synchronize_unplug(struct drm_device *dev)
> +{
> +=09/*
> +=09 * After synchronizing any critical read section is
> guaranteed to see
> +=09 * the new value of ->unplugged, and any critical section
> which might
> +=09 * still have seen the old value of ->unplugged is
> guaranteed to have
> +=09 * finished.
> +=09 */
> +=09dev->unplugged =3D true;
> +=09synchronize_srcu(&drm_unplug_srcu);
> +}
> +
> =C2=A0/**
> =C2=A0 * drm_dev_unplug - unplug a DRM device
> =C2=A0 * @dev: DRM device
> @@ -485,15 +501,7 @@ EXPORT_SYMBOL(drm_dev_exit);
> =C2=A0 */
> =C2=A0void drm_dev_unplug(struct drm_device *dev)
> =C2=A0{
> -=09/*
> -=09 * After synchronizing any critical read section is
> guaranteed to see
> -=09 * the new value of ->unplugged, and any critical section
> which might
> -=09 * still have seen the old value of ->unplugged is
> guaranteed to have
> -=09 * finished.
> -=09 */
> -=09dev->unplugged =3D true;
> -=09synchronize_srcu(&drm_unplug_srcu);
> -
> +=09drm_dev_synchronize_unplug(dev);
> =C2=A0=09drm_dev_unregister(dev);
> =C2=A0
> =C2=A0=09/* Clear all CPU mappings pointing to this device */
> @@ -1091,6 +1099,7 @@ int drm_dev_register(struct drm_device *dev,
> unsigned long flags)
> =C2=A0=09=09goto err_minors;
> =C2=A0
> =C2=A0=09dev->registered =3D true;
> +=09dev->unplugged =3D false;
> =C2=A0
> =C2=A0=09if (driver->load) {
> =C2=A0=09=09ret =3D driver->load(dev, flags);
> @@ -1118,6 +1127,13 @@ int drm_dev_register(struct drm_device *dev,
> unsigned long flags)
> =C2=A0=09if (dev->driver->unload)
> =C2=A0=09=09dev->driver->unload(dev);
> =C2=A0err_minors:
> +=09/*
> +=09 * If a minor was registered before the failure, userspace
> could have
> +=09 * opened it and entered a drm_dev_enter() critical section.
> Ensure all
> +=09 * such sections complete before we clean up.
> +=09 */
> +=09drm_dev_synchronize_unplug(dev);
> +
> =C2=A0=09remove_compat_control_link(dev);
> =C2=A0=09drm_minor_unregister(dev, DRM_MINOR_ACCEL);
> =C2=A0=09drm_minor_unregister(dev, DRM_MINOR_PRIMARY);

