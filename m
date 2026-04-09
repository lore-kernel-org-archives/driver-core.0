Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE5730C601
	for <driver-core@lists.linux.dev>; Thu,  9 Apr 2026 20:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767028; cv=none; b=g40oYqd2uKa64jwW/XQMvvh7V3xBnvdXI9JQChE1xN4YzuV2Cn3Ni+uxLj5wsysvz0SghhhO7uKSpdCJhUxFOGKs5s/IofiQ9sf10ZGfjy0k8jELFBojT3ngoEuWlaotDgB88xVnGKwf278si1XvnuJqarH0t6pr782OMOdr4kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767028; c=relaxed/simple;
	bh=9GON4HqrWMN21HWEXWy1UigIACbH1qvKcO/t8RyCEB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjV53qGoGMwOfitvLfL38FCiJVh0pc8ETlcrpX9NEs6Dyly2GBiTO6ItLtHwdBiTXtzHc27kEBFfFkOxP10c+bLgDHaLU6NYI/LUYlKQnAPGZhIfPsXQPEqwLjLYlrm4NasKcy09NF7Po53apJFOJUPgbZM3Q/L8pj4cJMjYVww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJpfVwO8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJpfVwO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775767026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9GON4HqrWMN21HWEXWy1UigIACbH1qvKcO/t8RyCEB0=;
	b=CJpfVwO8C7Ni3xuKmN2QTWMuOxD0vTW8wg/5VvOmnzvVpHjHakksZTcW+QCEyfP+iU+gBZ
	zQZ+UQzx8MUCmeRbY1WjX0K23CtsgeLMzRn1gaQQIfFUVeGE6qrNh0BNCViUvTcX0nZ2CS
	QglY3dgMr5Eoj3hd44j8v9FqsknwZFE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-dXEKt7AiMSepApJ4PVG7-g-1; Thu, 09 Apr 2026 16:37:04 -0400
X-MC-Unique: dXEKt7AiMSepApJ4PVG7-g-1
X-Mimecast-MFC-AGG-ID: dXEKt7AiMSepApJ4PVG7-g_1775767023
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3870692eb93so3960031fa.0
        for <driver-core@lists.linux.dev>; Thu, 09 Apr 2026 13:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767023; x=1776371823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9GON4HqrWMN21HWEXWy1UigIACbH1qvKcO/t8RyCEB0=;
        b=R4BKCjjZOxp6AW1xAYJjFT97iEJYUrt1k5RuaUiU1XA3rGfPvY4zqrDrNncZy4rbJ8
         +eS0Mzk5OXhGiEeFHE1+wFB0DZAbM19GMSJDhq4tClSQRkjDudRhfffAvLLre/3WDL/h
         6rNbUJd76N3EYBFWiUlXzpCKIS36T/+fWy06VmX0HPyhpog3tP5Nq3M5qHzIRn0j+NQg
         pyEJwr6AjAQJeSxviRi7t3Uyyb5Co5tsc/dRbsEEfbko16KJNbp/xvGuA4BHCryfCJ71
         BYOdEmatytAenH6ZU5govQBHotHd1PW5BHrRDO1sCJQz6Ez0UoLiJa5SIH3m1b989Xiv
         +Q0w==
X-Forwarded-Encrypted: i=1; AJvYcCWQoPG+/ZPEmNeqYYorT06wBqzol8VOK2TIGVA1RE8z9W2V3eIbuvefd6WQGsP+4mzA98+HHcifwiTyYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzE7P+YqWzoPSdxOomFatH0dnERBLLI9QFQ6C5fvO1WDVaahWZw
	t7zQKp06HgPZCi8aNpQ4kY99FD8bVdfGsIy1q7/Qq+OD+hdPlh6Ta5PWFXOeGnfq7LB0nt0IpZ0
	kGhnaWhJeH0lUTaHuQTUFH3Fh+hPZTX1aNsf5EEOCMQ6Wz0T+DfvWL8OURmYuZvmxng8WxLZPWN
	bZpZa/6K0TdanwwOy4ejGQd7qNpJ+PryNSJ59htPE=
X-Gm-Gg: AeBDiev31muoyOwa8JqgmO8apAIUcogU3acZEkZroJYaPJ/KDR6K7KU1BBVtclxHu83
	MA7xePk6nXTLcTjz2fupVxvR3EEBAOZQUtXbHtC4xb3iDxC6yGcxDeJqHkHW9qM+BqEepeNBx+n
	zZFTQUWTYvrDg4TjWvR0Y5zV1T6FwJpTS6JhvTwBVDksznDw5wZNUP0WvPHwV2myU5jd80QXeMh
	Bnk
X-Received: by 2002:a2e:b8d1:0:b0:38a:4dd3:6a48 with SMTP id 38308e7fff4ca-38e4bf6873bmr720051fa.26.1775767023272;
        Thu, 09 Apr 2026 13:37:03 -0700 (PDT)
X-Received: by 2002:a2e:b8d1:0:b0:38a:4dd3:6a48 with SMTP id
 38308e7fff4ca-38e4bf6873bmr719981fa.26.1775767022741; Thu, 09 Apr 2026
 13:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407153532.6395-1-djeffery@redhat.com> <20260407153532.6395-6-djeffery@redhat.com>
 <c5cb8cf0-9beb-4bc4-8ce6-83b4544beede@oracle.com> <CA+-xHTG9tMCCf11NZwKfvE5xvCfjXrttDXhFsyz=SCofAc9Mgw@mail.gmail.com>
 <069f3f1b-8150-41e8-a760-f85a0b1b0ce4@oracle.com> <CA+-xHTFdKaCCwkytXpWdvp6vZ4ZCh+Pp8wzkoVZYPOy--CjiSw@mail.gmail.com>
 <c9af1723-550c-4f2b-aa04-3ce769bb4a84@oracle.com>
In-Reply-To: <c9af1723-550c-4f2b-aa04-3ce769bb4a84@oracle.com>
From: David Jeffery <djeffery@redhat.com>
Date: Thu, 9 Apr 2026 16:36:50 -0400
X-Gm-Features: AQROBzCNo2zD09xUDoJkeee-Ps33E2lSudGCsUOC7vsRfjmkn3a0hz8Fbj91pfc
Message-ID: <CA+-xHTEGpmM7Kvpip1C4QjMPU8u9MoP9=bMyukEWtgwK6VdShw@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: OOsceK-eI1U-mQ4SDO8oPWGxW02De8qeUWN6nrWoIdA_1775767023
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 8:18=E2=80=AFAM John Garry <john.g.garry@oracle.com>=
 wrote:
>
> On 08/04/2026 20:35, David Jeffery wrote:
> >> Well it is not exactly like that. We have the following:
> >>
> >> scsi_sysfs_add_sdev() -> device_enable_async_suspend(&sdev->sdev_gende=
v)
> >>
> >> and
> >>
> >> scsi_sysfs_device_initialize() ->
> >> scsi_enable_async_suspend(&sdev->sdev_gendev) ->
> >> device_enable_async_suspend(&sdev->sdev_gendev) when not async
> >>
> >> Maybe similar needs to be done for this shutdown feature. AFICS, Bart,
> >> added scsi_enable_async_suspend(), so maybe he can comment.
> >>
> > My inclination is to drop adding device_enable_async_shutdown into
> > scsi_sysfs_device_initialize. The intent is for normal scsi devices,
> > and I see little value in setting the flag so early to flag partially
> > initialized or pseudo devices.
>
> That seems reasonable, but, again I am not so familiar with this async
> suspend and shutdown.
>

There also appears to be similar duplication with flagging scsi hosts
and targets for async shutdown. I'll see about consolidating those as
well.

