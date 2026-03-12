Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5358E34F254
	for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323674; cv=none; b=q8TtUUzhqsmv9AH4yIMFTiwJxPd/TsiRNCQzXxg4EmPzQKEZ0UrCmfB+wPoXjwSxG3mRlhnLGGLUcyQGBELUtuJcQV02oXw9ZWk7nqi7YbgRWJ9QCSrPEJGPQwT+5xbgFgC3+Lx8Pu3Le1uDqo0HnusqxgaPkvljfjUn7IWIJ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323674; c=relaxed/simple;
	bh=QyuFlbrGA5AQlhnI0HMtrCQprHs6ftmSMcfrRAXjexw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cW8Sxei6N1d9Gmqt9IcXjb0nFR+keXJcOiMmwNJrV1dgH4cUnTHqZeiJgaVVLw6WrXJKzEszpUT9nO5joxYI7zCuj5t4mNJqR4XXORtCiqnbYN26rQZcetaIBrwx4wJIkC8X8nRuuOFFJwnRFR4COtrTxjoNtize7wIRbSzAPWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OvwCcUHs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OvwCcUHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773323670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XExV6QRKq8SZymtd9B/1tvKMnhGFOwk+2Q9owYWU/z8=;
	b=OvwCcUHs0oTh6eCn/SYOb3EXiH9eLrn3FtWTpMB6s740BgPgA+wvbsiUadOavyuPspvMQH
	MrZxZ5hloOxbCGtBGqssaauYJPpCBBvvmPfLlM8i0qH2ZkqK2wc5beAkd2BK/obT+dHTqw
	Er2TFKa7vvmL0A6G3PDUyb5k9UhrSbA=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-Zwr8fzglM-2x6us7dCbSaA-1; Thu, 12 Mar 2026 09:54:29 -0400
X-MC-Unique: Zwr8fzglM-2x6us7dCbSaA-1
X-Mimecast-MFC-AGG-ID: Zwr8fzglM-2x6us7dCbSaA_1773323668
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-38a2f7f021fso4545571fa.2
        for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 06:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773323667; x=1773928467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XExV6QRKq8SZymtd9B/1tvKMnhGFOwk+2Q9owYWU/z8=;
        b=YiHjkdwvfq4s1u1VFcI4Nmbr9MqjA498GQ/+m9HXzTUwXObVV0WNEiJ7D4y80oSGdO
         ycRkKfgU4ldBQy8+SrFGN1KtPA69b+HmC+JZcg4Re83cUQl/9i64yRmUyk6q2f6G7JvH
         +AK8uRE+vVMSnko3vkVKZaWLmjzkzsM9rqypkOB6HAPW6GmzbkbsZnulBM+5yCTW3NFX
         0rKb1Suzqm3n9+VgSWbo2he3XT13iOOje8sNoProyvpPO1aVtQnyf8znyf6OZVK/kNLC
         lJSpdwbvNEV/Bv6rq1mf90SDxQqLPrOFgjeHOnvozCLHG6ns545L48DgZZNYVAQayKYn
         S/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSnrPvVOsj96QAk63ng0L3RgxwnkqYsQBXrPq66yR43QiQ49SXn2fJY8v4jL40oX6Ct6DJXIzYqKVuBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkSW7G+o65XR1u3/oRarw2VYfcsTPHsA80o+sQJ3jNfTbaZAQm
	MVOhdY6AYLqak6Jy9vipK773JQ/1ZGai/doxiq5r5AYMNfhe5eakYKNk8jFwaIWHM4TxxukxHOr
	CdX454SQZqaFIPYCmDBo3zY+WNH2T/89SC14tJshzHp8B+MBssNhLEKF3AGp5T2AQllpULw22MX
	VJhA38Qrux30ueWg7Awy81R6ufe1wz8wj049AFosg=
X-Gm-Gg: ATEYQzwH2OofIcazg9h0nHjvMmycyYCt+x3BTMC5mkXh5YY9/vKNrEy/HfBXve0sJ2S
	Q6GZnd5+CsuQcTutV8BXcyiQHPTCR/M1jLWCNP9LScI7zgXzkTqR9M5lpVlBHpjMQcZklEBEKNQ
	QLorGxx8ewCRFThvNJ4OmuwBWVTVvRsBzWgdeU02IKOpdaBwBLWk7z2Tf/g/zqTjt5VAbCiKEuh
	iq6
X-Received: by 2002:a2e:8a86:0:b0:386:1ce2:11ab with SMTP id 38308e7fff4ca-38a67da3325mr25663071fa.11.1773323667557;
        Thu, 12 Mar 2026 06:54:27 -0700 (PDT)
X-Received: by 2002:a2e:8a86:0:b0:386:1ce2:11ab with SMTP id
 38308e7fff4ca-38a67da3325mr25662881fa.11.1773323667010; Thu, 12 Mar 2026
 06:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311171209.9205-1-djeffery@redhat.com> <20260311171209.9205-4-djeffery@redhat.com>
 <2026031229-coastland-ducktail-c4b9@gregkh>
In-Reply-To: <2026031229-coastland-ducktail-c4b9@gregkh>
From: David Jeffery <djeffery@redhat.com>
Date: Thu, 12 Mar 2026 09:54:15 -0400
X-Gm-Features: AaiRm53czMd8xlW_uvkK052fMb3Ujo3XTxm7kNzW6g-GQBO5hD6Lp1oyDE-dXEA
Message-ID: <CA+-xHTHR84gAoz-82CKKEsbwY5npqofUb3=jQ-=OJnqUQZR1yQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] pci: enable async shutdown support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <tatashin@google.com>, =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kEVCodZk9j-BtyofEpATMoi-mbJCaPDeX3AE31yXFW0_1773323668
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 1:09=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Mar 11, 2026 at 01:12:08PM -0400, David Jeffery wrote:
> > Like its async suspend support, allow pci device shutdown to be perform=
ed
> > asynchronously to improve shutdown time.
> >
> > Signed-off-by: David Jeffery <djeffery@redhat.com>
> > Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> > Tested-by: Laurence Oberman <loberman@redhat.com>
> > ---
> >  drivers/pci/probe.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index bccc7a4bdd79..4d98bab2163d 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -1040,6 +1040,7 @@ static int pci_register_host_bridge(struct pci_ho=
st_bridge *bridge)
> >
> >       bus->bridge =3D get_device(&bridge->dev);
> >       device_enable_async_suspend(bus->bridge);
> > +     device_enable_async_shutdown(bus->bridge);
> >       pci_set_bus_of_node(bus);
> >       pci_set_bus_msi_domain(bus);
> >       if (bridge->msi_domain && !dev_get_msi_domain(&bus->dev) &&
> > @@ -2749,6 +2750,7 @@ void pci_device_add(struct pci_dev *dev, struct p=
ci_bus *bus)
> >       pci_reassigndev_resource_alignment(dev);
> >
> >       pci_init_capabilities(dev);
> > +     device_enable_async_shutdown(&dev->dev);
>
> For all PCI devices?  Are you sure this is ok?  That feels like it is
> going to be ripe with race conditions...

I did not see or find any issues. PCI already enables async suspend on
all devices, it just does so in a power management specific function
so I didn't put device_enable_async_shutdown next to the
device_enable_async_suspend call.

> How was this tested?

It has been running on various VMs and x86_64 physical machines.

> thanks,
>
> greg k-h
>

David Jeffery

