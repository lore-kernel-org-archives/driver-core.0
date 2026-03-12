Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD002C11FD
	for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773324109; cv=none; b=n43shdUEnZqNTtbXa4FOEsjPaTtFMFMQHT32a6lETxZuV8ITrK+T3Ab4+p6/uM+Y6EOvg8szEvl1J//t7PBIFBpCkZlHWL3p/YBz9UWzhc6oODqNRywvP4Ice51LaGMjjWHo7spFyciWkaFucKm01edgFA3SVAA42fD1hP92JDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773324109; c=relaxed/simple;
	bh=h7HyxgIgdaXVa7GaIMk60Eou7grQ16jf0HfHA3SBWAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPrJCD9KQt1StBTGkYzrCjgRmnrKtSGJF9xMFWE1kXk3vsM9rn+u2BRLa5/J5sB6nnLZZB8cbsPVfN5+pPb+6X9Kx3Ydw5BVR7jG1vSRxUEuqT3Y64DtVYCwq2tJbqt+AlYCjsoW7vnsem3KOOuD3x3JpAh1pDSjx6vQbH4cbhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NnjXW8uq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NnjXW8uq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773324107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svCptW0MF+j8ogyjRJzY7kaL3jUF3IX/ZurOettGWWg=;
	b=NnjXW8uq4PtD0ubGgFHLA4szcmVWkFXn440rJ4v/IGf6w5197eWOaiwrUJCUeg9PxZs9Fq
	kLdRwX5DXzRokkzWkefuoIkzkbnXeVLu4INLrCCx+EkO5/ozB89RxZ3oUErkWW8yPaIdXa
	ldOzCHhNTWrfjvqdQDwhVEzIrgzR/Mw=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-hTkoUK65NXuiMKVxe90ehw-1; Thu, 12 Mar 2026 10:01:46 -0400
X-MC-Unique: hTkoUK65NXuiMKVxe90ehw-1
X-Mimecast-MFC-AGG-ID: hTkoUK65NXuiMKVxe90ehw_1773324106
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4172c136f7bso9777569fac.1
        for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 07:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324106; x=1773928906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=svCptW0MF+j8ogyjRJzY7kaL3jUF3IX/ZurOettGWWg=;
        b=CHsU2Ljq3JxCeFDgYmGHed7gubeq0/D3TB3e8m5lFdpb3POLKjwXTL00Agd1LUzG9e
         4JJyuItYo+JgtiufLsiNP/joGqzjhnczHnLxN0E4XRUKcCqt2f9gcL1dQpPeZT4xTcUC
         l7Kp75+vNsSY0H0zqUiBRut5d/2CWT/3Z0v2cvAXYHoFX//JkjahSk2YuEBjazz3pHfi
         9kGm1jXiFqGK1oKKnPNTBXZT/BLckdqLmhxFJkbbkL1wx4+2D0uqy8pv4srDK3UdYuaS
         xBlsu7srDd8w4Vgxk4HRT/waucufYW6WLWuIWMAs54qU0u17B3ZsVRE4F8GqNnX2LJbk
         uMnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaRGUCwyk/zxMrcXrPUyhF80sQjkB3FWaSeKlfFNoqxJA8KpcffsSL57pXxrgftkbBfEvrDYPMy1PDXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqMXBkncmS7CVJBfPP0aKW8kc9mQFa+QzsUkbYsVwF5xdJgzjw
	qhmLxMP5rE1+ZdbWYm9EsUqtJbOJt8gqfrc2NzwYy37YJJ1R+Tv4R3TIadKZBQcpXD9LqBADdAa
	zZtKZicS776QWSigUQ/lWyhvxLceg5isTJeTSw3YH9pjDSvuujezPk/EfabuMQINaXOvy+BsJn6
	QRD401QmCLDDrByIt+G2x5RHoUJTw8o9GoY16FOkQ=
X-Gm-Gg: ATEYQzxqzxDv23S80gCQ7swN3sLKbti440u2TTzoK90RA0sMt+I6wBnO0ntWOQylk7R
	WuMC4apx7ZMSfxa4z/jljKNE6MH3iDTibYz6k7Fz07bG400MDTxgJ8cvI08PPv4fBSOJLMpWA8A
	nrwl/Ccpm8fPbQJ59Kh33sgtcrz/Z2TIAhdpGn9pAuCfHQJBjdPjdeqkBePlnIthZzz5PAs8Y97
	44D
X-Received: by 2002:a05:6870:d626:b0:417:5b7a:704b with SMTP id 586e51a60fabf-4177c8bd782mr3791133fac.31.1773324104847;
        Thu, 12 Mar 2026 07:01:44 -0700 (PDT)
X-Received: by 2002:a05:6870:d626:b0:417:5b7a:704b with SMTP id
 586e51a60fabf-4177c8bd782mr3791060fac.31.1773324104254; Thu, 12 Mar 2026
 07:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311171209.9205-3-djeffery@redhat.com> <20260311230523.GA1066455@bhelgaas>
In-Reply-To: <20260311230523.GA1066455@bhelgaas>
From: David Jeffery <djeffery@redhat.com>
Date: Thu, 12 Mar 2026 10:01:28 -0400
X-Gm-Features: AaiRm520iVQTqV1-hjp19cjbWN8oiME0iudO3mEzYMJHW6uBnWcs_r1tMTE9dMI
Message-ID: <CA+-xHTHP2QY7T_mTFbN7XN4gbtPo06-EsovuMWuJ5u1A0HXEFQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] driver core: async device shutdown infrastructure
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <tatashin@google.com>, =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YsZJ0lzz2j34ReXMDOwyRleAigkAGRbBgklwO1xSbNc_1773324106
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 7:05=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Wed, Mar 11, 2026 at 01:12:07PM -0400, David Jeffery wrote:
> > Patterned after async suspend, allow devices to mark themselves as want=
ing
> > to perform async shutdown. Devices using async shutdown wait only for t=
heir
> > dependencies to shutdown before executing their shutdown routine.
>
> I'm not an expert on dependencies.  Is it obvious to everybody else
> how these dependencies are expressed?  What would I look at to verify
> that, for example, PCI devices are dependencies of the PCI bridges
> leading to them?  I suppose it's the same dependencies used for
> suspend?

Yes, it uses the same dependencies as async suspend does.

> From wait_for_shutdown_dependencies() below, it looks like we'll wait
> for each child of dev and then wait for each consumer of dev before
> shutting down dev itself.

Right, just like async suspend, all children and consumers need to
shut down first for async shutdown.

>
> > Sync shutdown devices are shut down one at a time and will only wait fo=
r an
> > async shutdown device if the async device is a dependency.
>
> > @@ -132,6 +133,7 @@ struct device_private {
> >  #ifdef CONFIG_RUST
> >       struct driver_type driver_type;
> >  #endif
> > +     struct completion complete;
>
> I thought "complete" might be a little too generic, but I guess async
> suspend uses "dev->power.completion" :)

I am open to a better name, but anything I came up with ended up
excessively long in my opinion, so I settled on the current and boring
"complete".

>
> > +static void wait_for_shutdown_dependencies(struct device *dev, bool as=
ync)
> > +{
> > +     struct device_link *link;
> > +     int idx;
> > +
> > +     device_for_each_child(dev, &async, wait_for_device_shutdown);
> > +
> > +     idx =3D device_links_read_lock();
> > +
> > +     dev_for_each_link_to_consumer(link, dev)
> > +             if (!device_link_flag_is_sync_state_only(link->flags))
> > +                     wait_for_device_shutdown(link->consumer, &async);
> > +
> > +     device_links_read_unlock(idx);
> > +}
>
> > @@ -4828,6 +4919,12 @@ void device_shutdown(void)
> >
> >       cpufreq_suspend();
> >
> > +     /*
> > +      * Start async device threads where possible to maximize potentia=
l
> > +      * paralellism and minimize false dependency on unrelated sync de=
vices
>
> s/paralellism/parallelism/
>

Gah, I will correct it.

David Jeffery

