Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7273290A9
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 21:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276988; cv=none; b=BdxSn8jDvhhaonFDAWHCqIuqpDrUtRo3fjo0svkivwbADLfu7imY44GOqXq64mvjjoktwI3mED08fcAZw+g3ReBBcNRfYyI5fcjq9ImD2I+FsDT291WzzbopG3WxsVch3x7ZSnj/3qI4Eu6cP8PGPx/6Z6jA+06afNQZL71FQgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276988; c=relaxed/simple;
	bh=xneW9n/eFyYFwX151QQV138RZGgNafKZ/KvLb6N/acE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gwhf7jaqG8MddPkKLikyXKq1u99cXvkeWeJdvC9I3Mz4vMXTaJ1FottQNIZVtVC9BBHIhBEP17UtO1IJIEN8gB6pI14mVgEMonRTiLFz/X+DEp/5X5erIl8sgRjFVKlDDszTnZ+1aSPULeNdua1qEMoG48sJg3wn5D06FrkfZC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dTdPYgyo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dTdPYgyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778276986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xneW9n/eFyYFwX151QQV138RZGgNafKZ/KvLb6N/acE=;
	b=dTdPYgyo+9jth3cLbgDka5ipvOk3KoBYLH3tsUfDcnjqLVNPF0LxYEz89St58IOG816Uhe
	4W+RGiNx3Ztcr5sZksWPtmJoB3prDip4YWRoryrlG3dAHXJZhHKOt8wkiNEFg+R81YxYdK
	Dfp3a1cbvkNTbJpvyDPmHkqhXLrH4FA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-x6-9Sb28Phu__vb-kWPaXQ-1; Fri, 08 May 2026 17:49:43 -0400
X-MC-Unique: x6-9Sb28Phu__vb-kWPaXQ-1
X-Mimecast-MFC-AGG-ID: x6-9Sb28Phu__vb-kWPaXQ_1778276983
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ed2c173d3bso472205485a.2
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 14:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778276983; x=1778881783;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xneW9n/eFyYFwX151QQV138RZGgNafKZ/KvLb6N/acE=;
        b=E82uoZ6YeVAMMKeM0yvHcPa5K8Fo+z2qNvFaobZSkMRtTQ82zdMbF7CCSsFLPjgPIN
         /l6UAbLvC/MPA9EiByoTl6y7uvyDaZfnaBG/uNSAI1ndlXjv+qEEi7tyHXkTFrUhture
         +SI1VMYe3cac33FqAaFX9TolsNEncwdClkibLx/u2GO6Y01WkvCMxoZhYxZBi8QL1uQ2
         dHm0voQmhvkl7d9jyLUK9yX8vJsBWbUfnp1JW4DIeOKO5ds6DFQgpDVyB2mu40GIPh7h
         4VpdjpnAxPL5mUXBACe1FYuQyZxZk5f9QPn51sCWH8/JANi3f7bTnfjuHeuqcQ7wwlvG
         Ok1w==
X-Gm-Message-State: AOJu0Yz2qIG8aHtZbx2fqp/OZu5Ps3hTJpG0HWzCF+YhLq/AVyx+VlLF
	b4UQISkdPqadNTGKrBPniXimJULB6rt7BBha9xJQhHbiNuA3nyI3mi8xELLmsyorH8h6BtkZ4mp
	XLIT2w2N/ZDMe/aSDEDyLE3Hd/SdW6U7SlVfIsK3/MWFzYPzNBWTGZnyyRfyN3ew7
X-Gm-Gg: AeBDietleBgbw26AS+ETmSujpJmXk/ir/lsHZfW6RYe+l9yzZgjijPv8QI3Z1ZeEAhI
	qgVw8I5ODeQbuf3HbQ8Toh1XooTA+0QfmU45q9rWCTw0rfYu4/G7uKlM65JXTdTQaU+oPz/5wR6
	gi0ZF8AW+GsK603OSJ1GOkUSd5fLEp/mMYerQsXkCI+k6OKGtrnQIHWhYgxRi4oQBl6WGZaVmhs
	WSPmHDUq93BFrpYmSG3ZXuk14ON7LK9XAALFJgq8RbWqk/JeYPqEMeHoPw64xPjUN+75RPAC18d
	ATAVwWDRLF4xyb8IU2nK+K8cOTkJimjWkiJIHFmsZe1OXYWRrSXeelxe+1Yhs56dOmYHN3AaacE
	gDrYnmIYMFHZ93jZhEyPURPVNdS64
X-Received: by 2002:a05:620a:2544:b0:8f8:82a8:a31e with SMTP id af79cd13be357-904d72c5b2bmr2085910985a.60.1778276982589;
        Fri, 08 May 2026 14:49:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2544:b0:8f8:82a8:a31e with SMTP id af79cd13be357-904d72c5b2bmr2085905585a.60.1778276982047;
        Fri, 08 May 2026 14:49:42 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b9c524bbsm309451785a.1.2026.05.08.14.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:49:41 -0700 (PDT)
Message-ID: <56009df378bc90f171bccd89c80222dcfddd6884.camel@redhat.com>
Subject: Re: [PATCH 1/6] rust: drm: Add Driver::ParentDevice associated type
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 airlied@gmail.com, 	simona@ffwll.ch, daniel.almeida@collabora.com,
 acourbot@nvidia.com, 	apopple@nvidia.com, ecourtney@nvidia.com,
 deborah.brouwer@collabora.com, 	ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, 	lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu
Cc: driver-core@lists.linux.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Fri, 08 May 2026 17:49:40 -0400
In-Reply-To: <20260506221027.858481-2-dakr@kernel.org>
References: <20260506221027.858481-1-dakr@kernel.org>
	 <20260506221027.858481-2-dakr@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fjvae137j8zO0yXXAXbUuOqZ-qK1Yusl63oR-lfsBuY_1778276983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2026-05-07 at 00:05 +0200, Danilo Krummrich wrote:
> Add a ParentDevice associated type to the Driver trait, allowing each
> DRM driver to declare its parent bus device type (e.g.
> auxiliary::Device, platform::Device).
>=20
> Change UnregisteredDevice::new() to take &T::ParentDevice<Bound>,
> ensuring at the type level that the DRM device's parent matches the
> declared bus device type.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/nova/driver.rs | 8 ++++++--
> =C2=A0drivers/gpu/drm/tyr/driver.rs=C2=A0 | 6 ++++--
> =C2=A0rust/kernel/drm/device.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++--
> =C2=A0rust/kernel/drm/driver.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A04 files changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/driver.rs
> b/drivers/gpu/drm/nova/driver.rs
> index 9eef28b506bb..9d4100f01ea7 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -2,7 +2,10 @@
> =C2=A0
> =C2=A0use kernel::{
> =C2=A0=C2=A0=C2=A0=C2=A0 auxiliary,
> -=C2=A0=C2=A0=C2=A0 device::Core,
> +=C2=A0=C2=A0=C2=A0 device::{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Core,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceContext, //
> +=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0 drm::{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem,
> @@ -59,7 +62,7 @@ fn probe(
> =C2=A0=C2=A0=C2=A0=C2=A0 ) -> impl PinInit<Self, Error> + 'bound {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D try_pin_ini=
t!(NovaData { adev: adev.into() });
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let drm =3D
> drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let drm =3D drm::Unregistered=
Device::<Self>::new(adev, data)?;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let drm =3D drm::Registr=
ation::new_foreign_owned(drm,
> adev.as_ref(), 0)?;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(Self { drm: drm.into(=
) })
> @@ -71,6 +74,7 @@ impl drm::Driver for NovaDriver {
> =C2=A0=C2=A0=C2=A0=C2=A0 type Data =3D NovaData;
> =C2=A0=C2=A0=C2=A0=C2=A0 type File =3D File;
> =C2=A0=C2=A0=C2=A0=C2=A0 type Object<Ctx: drm::DeviceContext> =3D gem::Ob=
ject<NovaObject,
> Ctx>;
> +=C2=A0=C2=A0=C2=A0 type ParentDevice<Ctx: DeviceContext> =3D auxiliary::=
Device<Ctx>;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 const INFO: drm::DriverInfo =3D INFO;
> =C2=A0
> diff --git a/drivers/gpu/drm/tyr/driver.rs
> b/drivers/gpu/drm/tyr/driver.rs
> index 2743178af325..747745d23f31 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -8,7 +8,8 @@
> =C2=A0=C2=A0=C2=A0=C2=A0 device::{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bound,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Core,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Device, //
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Device,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceContext, //
> =C2=A0=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0 drm,
> =C2=A0=C2=A0=C2=A0=C2=A0 drm::ioctl,
> @@ -131,7 +132,7 @@ fn probe(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 gpu_info,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 });
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tdev =3D
> drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref(), data)?;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tdev =3D
> drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, data)?;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tdev =3D
> drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(),
> 0)?;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let driver =3D TyrPlatfo=
rmDriverData {
> @@ -176,6 +177,7 @@ impl drm::Driver for TyrDrmDriver {
> =C2=A0=C2=A0=C2=A0=C2=A0 type Data =3D TyrDrmDeviceData;
> =C2=A0=C2=A0=C2=A0=C2=A0 type File =3D TyrDrmFileData;
> =C2=A0=C2=A0=C2=A0=C2=A0 type Object<R: drm::DeviceContext> =3D drm::gem:=
:Object<TyrObject,
> R>;
> +=C2=A0=C2=A0=C2=A0 type ParentDevice<Ctx: DeviceContext> =3D platform::D=
evice<Ctx>;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 const INFO: drm::DriverInfo =3D INFO;
> =C2=A0
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index d91f19dcc375..492c2f2c7ca4 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -197,7 +197,10 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Create a new `UnregisteredDevice` for a `drm=
::Driver`.
> =C2=A0=C2=A0=C2=A0=C2=A0 ///
> =C2=A0=C2=A0=C2=A0=C2=A0 /// This can be used to create a
> [`Registration`](kernel::drm::Registration).
> -=C2=A0=C2=A0=C2=A0 pub fn new(dev: &device::Device, data: impl PinInit<T=
::Data,
> Error>) -> Result<Self> {
> +=C2=A0=C2=A0=C2=A0 pub fn new(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev: &T::ParentDevice<device:=
:Bound>,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data: impl PinInit<T::Data, E=
rror>,
> +=C2=A0=C2=A0=C2=A0 ) -> Result<Self> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `__drm_dev_alloc` use=
s `kmalloc()` to allocate memory,
> hence ensure a `kmalloc()`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // compatible `Layout`.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let layout =3D Kmalloc::=
aligned_layout(Layout::new::<Device<T,
> Uninit>>());
> @@ -207,7 +210,7 @@ pub fn new(dev: &device::Device, data: impl
> PinInit<T::Data, Error>) -> Result<S
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `dev` is valid by i=
ts type invarants,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let raw_drm: *mut Device=
<T, Uninit> =3D unsafe {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bindings::__drm_dev_alloc(
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dev.as_raw(),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dev.as_ref().as_raw(),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &Self::VTABLE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 layout.size(),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 mem::offset_of!(Device<T, Uninit>, dev),
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index 294e17af86a3..9d06f8c5b2da 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -114,6 +114,9 @@ pub trait Driver {
> =C2=A0=C2=A0=C2=A0=C2=A0 /// The type used to represent a DRM File (clien=
t)
> =C2=A0=C2=A0=C2=A0=C2=A0 type File: drm::file::DriverFile;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 /// The bus device type of the parent device that the=
 DRM device
> is associated with.
> +=C2=A0=C2=A0=C2=A0 type ParentDevice<Ctx: device::DeviceContext>:
> device::AsBusDevice<Ctx>;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Driver metadata
> =C2=A0=C2=A0=C2=A0=C2=A0 const INFO: DriverInfo;
> =C2=A0

