Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763AF38887B
	for <driver-core@lists.linux.dev>; Wed, 22 Jul 2026 09:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713642; cv=none; b=rWwYY20rp2nW0frooMEioWFqMogCZxjKPgnaGYg81eLYLnizrZgYOhYqHjLPk1r0LSxWnb4K3uihs02y4fE+XYyADx0HFpa97+Tfxq0GxVyLTdxIfTLwdE0tI9O5ZqLwCcW+PUqGu62RMJ6dcN0zLc9I2dl420wpJnAhrumYUFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713642; c=relaxed/simple;
	bh=JdOp07e6jkIw4bhl5clfCQpR516wiRkJNQBguwkIJ6E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaiM46JAjhZdqQMEr0VhgZ1fVPPZx6zwDRCQdCU2Y8GO6gd3DCg8QatAuCfzQCH84uIR3Ni6Uz6I+t6Ss8pIT2Tk9NXEI97vGSo5HjY958JrGUfa7B7sT4YcmCjdGq29/84ic9igSw+hG8E7tx1g3G4ZoXy7LlojiW0vuaWgPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlaYlSGG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlaYlSGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310C01F00ACA
	for <driver-core@lists.linux.dev>; Wed, 22 Jul 2026 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784713641;
	bh=1psssF0EJ6tgCgfE2TXes0fv6UVmjctuTqOJj4nGWvY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OlaYlSGGgf3SjX9FtmKK314tNu5zhl9wEVX9vR6t71FECrmQdRnr+RAPXCGpTgYdc
	 4+3eVvDBNfnlpgMQlUax2lwdMC4IDIV4k/o7Livq4QflOP/9M3y3w+kXQ1j41iHCTL
	 D/CziWm/gj2i7ZWI80Te0xiTyYtGacP3EG4cVxyX0sW0OPp5SOSTd4E8t/nas2QyXR
	 Nv7hp45iFsAuv1xr8zojBCS9q15iW6eWXa2t2PQRFGctrh8Psi3f/Qs7Y7mlFhFDXX
	 s+7ciqFi6fOjR3D8ae105CgrmLqy2GhsypU/BJfq1FL2muCof0nRxhJu8JKBSlfEjr
	 BUaR8mHWklewg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so9361788e87.0
        for <driver-core@lists.linux.dev>; Wed, 22 Jul 2026 02:47:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq2TYES8CcybmMouedff0pOuFZrxZMqgUtSb1IxK35RxnAkjbF4tjoUC5L06tQrYJi9N5cGwcqZm4Cc3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz90qi151yNvaXjtC4Kw+1Os20hhbKIC/VNtvxL48WxRwAprAhB
	52AMPvIGjfjoAARXhCiAdeeIHIMdHtB9yjO8Exn7oE7YUNOjjK0pWupl2Ok7oRtZs6YXSv3Nqjj
	SVikCofVu/2YVnwH40p9lYWHfk23Z89Nu6dZhMmLHKQ==
X-Received: by 2002:a05:6512:211:b0:5ae:b9b3:2c0 with SMTP id
 2adb3069b0e04-5b28f9b8c38mr3373315e87.58.1784713639893; Wed, 22 Jul 2026
 02:47:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 02:47:18 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 02:47:18 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <51d2d692-ba40-3035-fac2-a9e8e98e6d99@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
 <20260713-swnode-remove-on-dev-unreg-v7-1-6d6bc448427a@oss.qualcomm.com> <51d2d692-ba40-3035-fac2-a9e8e98e6d99@linux.intel.com>
Date: Wed, 22 Jul 2026 02:47:18 -0700
X-Gmail-Original-Message-ID: <CAMRc=McoW72iX1GKWJAeVDBV4ft_sqDtcOwhF8XSWyC8agQhWA@mail.gmail.com>
X-Gm-Features: AUfX_myW5j5EC2yrK4hzqs7Ma3O0GUiOq4nsa6hrcCjhD9aYXO8RY8duj-A8ynw
Message-ID: <CAMRc=McoW72iX1GKWJAeVDBV4ft_sqDtcOwhF8XSWyC8agQhWA@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] platform/surface: gpe: use platform_device_register_full()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, brgl@kernel.org, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	driver-core@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Jul 2026 18:19:42 +0200, "Ilpo J=C3=A4rvinen"
<ilpo.jarvinen@linux.intel.com> said:
> On Mon, 13 Jul 2026, Bartosz Golaszewski wrote:
>
>> Creating a software node for a given set of properties and adding it to
>> a platform device can be achieved with a single call to
>> platform_device_register_full(). There's nothing in this driver that
>> suggests using the more fine-grained interfaces was intentional so
>> switch to using the high-level helper.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>> ---
>>  drivers/platform/surface/surface_gpe.c | 39 ++++++++++-----------------=
-------
>>  1 file changed, 11 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/s=
urface/surface_gpe.c
>> index 40896a8544b0a4da4261ea881b1eaed62d93b32b..4ca7ad76f3b9d2b6c455a5d5=
b37f23a85eb69c69 100644
>> --- a/drivers/platform/surface/surface_gpe.c
>> +++ b/drivers/platform/surface/surface_gpe.c
>> @@ -290,9 +290,9 @@ static struct platform_device *surface_gpe_device;
>>
>>  static int __init surface_gpe_init(void)
>>  {
>> +	struct platform_device_info pdevinfo;
>>  	const struct dmi_system_id *match;
>>  	struct platform_device *pdev;
>> -	struct fwnode_handle *fwnode;
>>  	int status;
>>
>>  	match =3D dmi_first_match(dmi_lid_device_table);
>> @@ -305,44 +305,27 @@ static int __init surface_gpe_init(void)
>>  	if (status)
>>  		return status;
>>
>> -	fwnode =3D fwnode_create_software_node(match->driver_data, NULL);
>> -	if (IS_ERR(fwnode)) {
>> -		status =3D PTR_ERR(fwnode);
>> -		goto err_node;
>> -	}
>> -
>> -	pdev =3D platform_device_alloc("surface_gpe", PLATFORM_DEVID_NONE);
>> -	if (!pdev) {
>> -		status =3D -ENOMEM;
>> -		goto err_alloc;
>> +	pdevinfo =3D (struct platform_device_info){
>> +		.name =3D "surface_gpe",
>> +		.id =3D PLATFORM_DEVID_NONE,
>> +		.properties =3D match->driver_data,
>> +	};
>> +
>> +	pdev =3D platform_device_register_full(&pdevinfo);
>> +	if (IS_ERR(pdev)) {
>
> Hi,
>
> Please add an include for this and PTR_ERR().
>
> With the missing include fixed,
>
> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>
> Thanks for doing these.
>

Danilo already queued it so I'll send a follow-up once it's in next.

Bartosz
