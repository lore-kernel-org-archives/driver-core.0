Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5265C5695
	for <driver-core@lists.linux.dev>; Thu,  9 Apr 2026 00:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775693827; cv=none; b=MUrA/PPF33svVO9wIhssqNG5SGkf+4sS7QVKNizYLVfc9yUjILvYAnAP1ERSxc2GCdwlfY8jBJc/1zMExNwNYhSQnnf/Ev3gKpBHqahnH22BRg8Q03m+aUb5aTEPgQWWebmIbtLQWxWrWDy9VCUD+SfpHj6gYTOoYM8NI+3cC0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775693827; c=relaxed/simple;
	bh=Bf3HBpcXRbpnz7qtsNrFHKLAfAPv8JOiRr+8WNuuU8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bW6fUgdzUgSWWGX5fSdp05RbaK3U8kv4gXE6zAj0+iwJKADcEXbZKdPH9p8EPEY801CRq2guJAgGFqsompRAEkAchjPOXTp+x1CL2CorK4n4FFVkb8x0J/H2cMaNlrX8BprqBzFyiNf7b1ObwNGgfCMHOGf8U4uWOm6yexQ0w/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ccDZWHwr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ccDZWHwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775693825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8YmCfgK+S4qww1OeXKFRIv11CEZdN1UiyLhZqJZF1s=;
	b=ccDZWHwrQEs7X7AlRc3xHhOM+pyF+fqP6KrFD+8rdqzBA/OSCE0J+wl+QPCOLjXd1GuZVr
	EKkFzwAJ/uxevWqTO+BB3tOMZHIrv1GtrUql5StoVms4b/g5Zj1XJTO/cr936Wb/93YzNm
	cOnjnIcuISdQMjHcQUG3D3fV84gr52Q=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-nF_4EnmHNQ-M8hueWGq5Yw-1; Wed, 08 Apr 2026 15:35:49 -0400
X-MC-Unique: nF_4EnmHNQ-M8hueWGq5Yw-1
X-Mimecast-MFC-AGG-ID: nF_4EnmHNQ-M8hueWGq5Yw_1775676947
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-38e0ef48a2eso387441fa.3
        for <driver-core@lists.linux.dev>; Wed, 08 Apr 2026 12:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775676947; x=1776281747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O8YmCfgK+S4qww1OeXKFRIv11CEZdN1UiyLhZqJZF1s=;
        b=Z2y5wZeqffPqZUSMKOOReiWF50Mv9DqCDSFpI7XDQ65yOZ+aSsKFOvys5AN+IObDGB
         5SxHMg1nE/qLor+7XE2lhqVxYLviMDKz35FYZ6S7ABSd289XxainmuPkm0gUk1MoPP9v
         lQCMUyIiqoJVozzHnyzM9+7OoVl7sbvTxUVfYIJhmOUp62+uB3/x2NoK3cuJdXa7ksMY
         ePrymU1B5ZkoF2C9cWYXtLTLPHrV6GGRKt1V7/ElmxIEGv79RSFm69/YyrQRAm1tMShU
         7suWcvPTnqXUQ8zWX8M/yC5qFyDGmk65ObavZS10zGQyALDWADVNUEZv8eWu2UKqJ/Yo
         znmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeQaf3Vq9Np+m5f5Rvs8Q/wv4t32blI3Q0M2YR6LdThxBAdbpAsdC3WOTDnwJzo+wq0w1v5iGKVfw2zw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfX1ZpkE8U3QVDidCe0TIrEBD4yOmlIHjFniuYF5k0ynup7y6Q
	BY0j/GXVKhLxTZxTtmn3v59w7q2PYl6DrRS4XILsV/fU2I//+25tcvt59NZLbWMdlo9NxHWVs8H
	xKwkAYR+W+DDpB2fIhSz1CF+c/WQuexqc7x4D95cvHFLcarESmKsP8esVX8ZaGJ9+83FktgdPh7
	PWuYtVMV1Qwms+ufUD3/9h+juzwEJwWoPz8vyjjP4=
X-Gm-Gg: AeBDievkdL7N0843hVdTJ8SbkVzSXlAqDEXjtvQ+hqff8IGPpATyP9Qh3A/R8I9rBec
	RWmsizgpwOek+9N2TsaqYNwwIjOKGzi3ptkU6Dfu8EEkbw/OP9fNJa1XmPsJzWB9spguWHFftDu
	ztYotUXR5sXEk4VeNz+9BCINn2NuYyUk8PG2ldZQLJZIOcQqIiR57vKVCH/YP0VKqdk+vsMzH/3
	tes
X-Received: by 2002:a05:651c:1509:b0:38e:2933:cefd with SMTP id 38308e7fff4ca-38e2933d33dmr12737541fa.9.1775676947316;
        Wed, 08 Apr 2026 12:35:47 -0700 (PDT)
X-Received: by 2002:a05:651c:1509:b0:38e:2933:cefd with SMTP id
 38308e7fff4ca-38e2933d33dmr12737381fa.9.1775676946827; Wed, 08 Apr 2026
 12:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407153532.6395-1-djeffery@redhat.com> <20260407153532.6395-6-djeffery@redhat.com>
 <c5cb8cf0-9beb-4bc4-8ce6-83b4544beede@oracle.com> <CA+-xHTG9tMCCf11NZwKfvE5xvCfjXrttDXhFsyz=SCofAc9Mgw@mail.gmail.com>
 <069f3f1b-8150-41e8-a760-f85a0b1b0ce4@oracle.com>
In-Reply-To: <069f3f1b-8150-41e8-a760-f85a0b1b0ce4@oracle.com>
From: David Jeffery <djeffery@redhat.com>
Date: Wed, 8 Apr 2026 15:35:34 -0400
X-Gm-Features: AQROBzD1jjRkWpzNwb8uyDg7e1dbHkjzLDl0riAoAiR4l1_QYsvUdLm-veMvcSg
Message-ID: <CA+-xHTFdKaCCwkytXpWdvp6vZ4ZCh+Pp8wzkoVZYPOy--CjiSw@mail.gmail.com>
Subject: Re: [PATCH 5/5] scsi: enable async shutdown support
To: John Garry <john.g.garry@oracle.com>
Cc: bvanassche@acm.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <tatashin@google.com>, =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, "Martin K . Petersen" <martin.petersen@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oQRwgnUi9BcRHTNpqBHCuY72XJG2UfnNfy1irVwO0HE_1775676947
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 11:54=E2=80=AFAM John Garry <john.g.garry@oracle.com=
> wrote:
>
> On 08/04/2026 15:16, David Jeffery wrote:
> > On Tue, Apr 7, 2026 at 12:35=E2=80=AFPM John Garry<john.g.garry@oracle.=
com> wrote:
> >>
> >>>    }
> >>> @@ -1396,6 +1397,7 @@ int scsi_sysfs_add_sdev(struct scsi_device *sde=
v)
> >>>        transport_configure_device(&starget->dev);
> >>>
> >>>        device_enable_async_suspend(&sdev->sdev_gendev);
> >>> +     device_enable_async_shutdown(&sdev->sdev_gendev);
> >> We call device_enable_async_shutdown(&sdev->sdev_gendev) here and
> >> scsi_sysfs_device_initialize() - any reason for that?
> >>
> > It was added to match locations where async suspend is set.
>
> Well it is not exactly like that. We have the following:
>
> scsi_sysfs_add_sdev() -> device_enable_async_suspend(&sdev->sdev_gendev)
>
> and
>
> scsi_sysfs_device_initialize() ->
> scsi_enable_async_suspend(&sdev->sdev_gendev) ->
> device_enable_async_suspend(&sdev->sdev_gendev) when not async
>
> Maybe similar needs to be done for this shutdown feature. AFICS, Bart,
> added scsi_enable_async_suspend(), so maybe he can comment.
>

My inclination is to drop adding device_enable_async_shutdown into
scsi_sysfs_device_initialize. The intent is for normal scsi devices,
and I see little value in setting the flag so early to flag partially
initialized or pseudo devices.

David Jeffery

