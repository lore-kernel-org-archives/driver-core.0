Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55623D0917
	for <driver-core@lists.linux.dev>; Wed,  8 Apr 2026 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657812; cv=none; b=cXuoDksVhHa8ZzoPutoNKGjgC8KyxoOc/hg2S7SotUVmD52LHmC6Oyxso1WHBxdzRjU8wXD4p48+mSirhMA+ooiPenftkSJrrYW4MstoarSj+IE/VV+O3oApk9sfTdmlZ4hL3DmMwZ0QPj4LtSaJRz7Rfi6FcIN2PO5MiUQe6J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657812; c=relaxed/simple;
	bh=BL7bjnfiDc+oze86Z5+hb/JdSfgy0dPrHiccC1cL4co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wth3lUomxNU2TPbli4wnDIcdBfaJnUSba3pF+xXzg9YuOuQ8vpVFJm1PsNXJR/yN1oZKSfYjieo/TJwrDillExO9xCl7nP86Vq0bMlZniqK5AliDPsRfPmQNjjegn7zExjBDi4vAIvL3XkUkHZ17Ej32gVkld0xx4juJG1JL+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gJWXWdII; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gJWXWdII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775657810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RG7NMZgM415BV6Epnr7PY+Cg4TeSFTKlU8/eVWcZm8c=;
	b=gJWXWdIIgNgg+O0JVMA0myeER5iPOTy4TLKEfda5MVBTAYOddE4aLwFmtMsDZPC/lWAGGs
	BL88rWcrnkQpy1DVGJ0QKv0eKB/Dg9CloPF05y1c+IR6dDyoInQjlC9uVPS3bQm4XaCHCi
	geTuoNgeBa0Quel+HtJkXkX6tjAJf5I=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-xMGCGlrVOdOK8_cosPVsGQ-1; Wed, 08 Apr 2026 10:16:48 -0400
X-MC-Unique: xMGCGlrVOdOK8_cosPVsGQ-1
X-Mimecast-MFC-AGG-ID: xMGCGlrVOdOK8_cosPVsGQ_1775657807
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-389e0db12cbso46982481fa.3
        for <driver-core@lists.linux.dev>; Wed, 08 Apr 2026 07:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775657806; x=1776262606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RG7NMZgM415BV6Epnr7PY+Cg4TeSFTKlU8/eVWcZm8c=;
        b=Sn+uuRPdxhs4EyKp2hpg2B7yyyBr/zVyAyqMHglqrmdwMTIFdnatyIvDrgZoJsj44k
         KYKAZgz66pO6Jo9WoxYS1h4xSpNPUpBa1G/oXWutlblozj/KJmBE3yURVBi2bWTeObTv
         7T18nx+EWntibbXEytfyLPpBIsipQhkpoxjA6dr3yLNuTFWVoI237HRHYWYqaG4JpIDJ
         6+V21S1Y4AzdKxUVBfzsKNam0AlKpU4+yrewF5TGAeva6KfOlqhz+PYGnycHRn6QAXkK
         EYHJcoXjN/Nra6q9nrW2N7veGCmD7YkJywgo/4X7sVIIU6aH+Mmdq5oCEq3+nl1oRG1x
         mtFw==
X-Forwarded-Encrypted: i=1; AJvYcCVrnCkmQBYNrkXw10otsV8zF0HaLuYeh/3GaONfbpSExiQ8DQpfKv7qsj020kMJiBJQKyzy4FyoZg1AGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXWYctzSgjfMm23faLR1H5rPA3qC62U8904LYFPTo3/L3x2Ot/
	XHoCToBGmc6YT71b47rfMC8HlJcX2sX8rnyDW101/H3vp794IyB5MMaEOv6ytU7tLJtCg069lJv
	Uc+Cinx6Y3BmMlJKMyFFlPR9avruqUj9CUmf2dKbrUmfJxZHxs/nXn/qmSakV2TAA8uHTYTr+b/
	oUmqzQEgagdJRGT7CJP4w4+R/Gy6NvCmPZIYZIFGI=
X-Gm-Gg: AeBDiev5gQuJvabdVi6JzzyOBotVlHB0U98DSh3JlfJZeA9iugySd6V8hnUZR2PIVla
	CXAaVtuBYvT2wRORrYe5UWa5KRmir2bE5IJZycmrnG+SOlSIwAXP0V3bWKy2l1UunpJOnuA2yoH
	zcMJbnK1MtPjOpzaOGNN/ofl619QBAu+Vz1DF+XS1p6SscvWkqy6PJ2n652NubFhvECUKCBHo4J
	fN+
X-Received: by 2002:a05:651c:4408:20b0:38a:a7b4:15e8 with SMTP id 38308e7fff4ca-38d8d3856a4mr53298641fa.12.1775657806480;
        Wed, 08 Apr 2026 07:16:46 -0700 (PDT)
X-Received: by 2002:a05:651c:4408:20b0:38a:a7b4:15e8 with SMTP id
 38308e7fff4ca-38d8d3856a4mr53298501fa.12.1775657805980; Wed, 08 Apr 2026
 07:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407153532.6395-1-djeffery@redhat.com> <20260407153532.6395-6-djeffery@redhat.com>
 <c5cb8cf0-9beb-4bc4-8ce6-83b4544beede@oracle.com>
In-Reply-To: <c5cb8cf0-9beb-4bc4-8ce6-83b4544beede@oracle.com>
From: David Jeffery <djeffery@redhat.com>
Date: Wed, 8 Apr 2026 10:16:33 -0400
X-Gm-Features: AQROBzCA9JzhK-STTzQehLHNPnOIWukHHyeEOKbNwvtun8-eFJcP344aRf0ba_A
Message-ID: <CA+-xHTG9tMCCf11NZwKfvE5xvCfjXrttDXhFsyz=SCofAc9Mgw@mail.gmail.com>
Subject: Re: [PATCH 5/5] scsi: enable async shutdown support
To: John Garry <john.g.garry@oracle.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <tatashin@google.com>, =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DBNWtgQNSt44vU2s9XCAt7brismXt8uFkfgzaMLTCwM_1775657807
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 12:35=E2=80=AFPM John Garry <john.g.garry@oracle.com=
> wrote:
>
>
> >   }
> > @@ -1396,6 +1397,7 @@ int scsi_sysfs_add_sdev(struct scsi_device *sdev)
> >       transport_configure_device(&starget->dev);
> >
> >       device_enable_async_suspend(&sdev->sdev_gendev);
> > +     device_enable_async_shutdown(&sdev->sdev_gendev);
>
> We call device_enable_async_shutdown(&sdev->sdev_gendev) here and
> scsi_sysfs_device_initialize() - any reason for that?
>

It was added to match locations where async suspend is set. But as you
point out, it does appear redundant to use both locations.

David Jeffery

