Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD434C806
	for <driver-core@lists.linux.dev>; Wed,  6 May 2026 21:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778101836; cv=none; b=Nx+rLRICcairrsGx7Otf5JDOwJy92HsrjW+V/i4PG0WDGJ86j57I2wpBMKPRxfk1e1T/gRGYliCdCfaTNFsLkboXv5dqsJn8jEgSG4otTekdSxUUYz6EYULHoqYLfB0Qb7mSeKFMLpR8FQawf1jf2aB//Dflp+GYPTYXj/OvR9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778101836; c=relaxed/simple;
	bh=QqaD8UmQ8Z3VOreDAgWf/h1HMc4iYrLZBevxSmnzqSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGeRPth1es8YI2zMpGLrHLuEH9m30HYHQO5LcksO/+k2Sv13E0g/C72K4dqFGobIFKVR5yf1Voqy69sKfO0gk6fU5TZYBSkR8KBzN/GqYKyKCjHSdzCVeIGK9SV6rACzwWfY3oFKoKQS83in8duvwUq8cRur4TNG82tae3PFr4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Aq2VgTG8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Aq2VgTG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778101834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxnLsY+y7KxAKQJwPXt/psWoOCQobXjWIWQgMudLMZw=;
	b=Aq2VgTG87Mq6nNdZ1rGTHn1KEX5KL7ujxRNFCKJgPaoIWzd9TbiFQiBAGN9hTVVPE6R9Pv
	9TQ018o+XIjEibL30mZOWreEkj1IfBMKz9S3ZVEVV2uGwZxbewd9xl9OYeLSxYyxmgnCeL
	AFGVb2A4hi4fQmExW9Pf90Cv72/woxg=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-SbPYsTCgNGqOA0FuUrdhLA-1; Wed, 06 May 2026 17:10:33 -0400
X-MC-Unique: SbPYsTCgNGqOA0FuUrdhLA-1
X-Mimecast-MFC-AGG-ID: SbPYsTCgNGqOA0FuUrdhLA_1778101833
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d2303e591so348651241.1
        for <driver-core@lists.linux.dev>; Wed, 06 May 2026 14:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778101832; x=1778706632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxnLsY+y7KxAKQJwPXt/psWoOCQobXjWIWQgMudLMZw=;
        b=jvJATrrs4RBRFbYj00LUu1u0Ch+CD+jTLj4AEIVjf7d+9VoCv15DYJoCyUaPHia292
         CAXYp4zBGUOdbUCP0oR0bzgbZBGtzUJVxjQVzerm9BmZ9/Wy5AgYQULWOgYk97RHuiqC
         JoIb71l9cj9JQPfRInWf9I2BNPOnDuAPfpPxtYtKbpLfuKodLLykPuvOrK1QsElgmcXU
         +NsrhyaoOaAP1mlmV3MUJI6ABkSqQEoA0E0QGucLTI7lBP42DN4MHMSoURlo1XY1mnaC
         Va8W2DbDlGCzrR1+YnR1qJBJ3RpVlOsrYhH/bv0OQ0qH6EfrlcSKbKT3YTvfra1NzmmW
         gHWg==
X-Forwarded-Encrypted: i=1; AFNElJ9F1171wbojNBuLFLL0Jshvm7TIcluhXhWta3AhBS4nQoTMUWP8Spep68fb41P+cCT2+50ztyrU52HinA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2ol/50MfoYEZfNvqo+e9GJEYXLnXasyvTBGGDs8RyFMLPeOL1
	EjeZddDZI6xQD0T9+UPPRl4CIpDD/mGFa4nNKRzs4k4ng9G7mMk68j+mBJmYd/IzR0nj/FMq0AM
	UVoyAKGMuVIw19kSVzJaiUJYV2trrl12i0w5wZjT07tLexZdHGHEw9u6n6oc3mCqiCITy4kRa/G
	wm6ENKs8U77rO4b6Qi+1Jr2YwVPCXlyAcEG3syOmg=
X-Gm-Gg: AeBDietTtoZmhLT1OWNFaR9juAfSrRZbqvA12b6ZiD/ypF5j3GNho6CkoUG7INkK/K9
	UKcvDcsW51Jeil4fJ/Yes8+RqBrnj+BBR+MNE1DZqgkDeP2Fdi1v9fpeE75/YMZgR6vE4t7fNRP
	YgUHMpnfuR39OdZMQLXP0pVUmwgOYWAzdRZ52TfBq6izXcofAEDIWOhY6soiaZnqRFUYxyDgxIO
	ROLuZxd9TiGwPvzTocdKfCaJG2Ltl+Y+iq4XGo+Tc2gYh98al/BmXesPoGFyLBJvZrdqdG7JnGF
	Ov2ecg==
X-Received: by 2002:a05:6102:6a92:b0:605:8280:5e6b with SMTP id ada2fe7eead31-630f8fda840mr2980743137.16.1778101832528;
        Wed, 06 May 2026 14:10:32 -0700 (PDT)
X-Received: by 2002:a05:6102:6a92:b0:605:8280:5e6b with SMTP id
 ada2fe7eead31-630f8fda840mr2980722137.16.1778101832091; Wed, 06 May 2026
 14:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429175016.7915-5-djeffery@redhat.com> <20260506182801.GA805231@bhelgaas>
In-Reply-To: <20260506182801.GA805231@bhelgaas>
From: David Jeffery <djeffery@redhat.com>
Date: Wed, 6 May 2026 17:10:19 -0400
X-Gm-Features: AVHnY4IXvba8Tz17dkRY5kRjhQZN70nrQGJ8xeOK7b1DB0TCF0AP8sKV7dUTWys
Message-ID: <CA+-xHTFj_J4r2oqG8cPOU_wx7pChjHt9SgyHzKbTD8+KgeSFXw@mail.gmail.com>
Subject: Re: [PATCH 4/5] PCI: Enable async shutdown support
To: Bjorn Helgaas <helgaas@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <tatashin@google.com>, =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	John Garry <john.g.garry@oracle.com>, kexec@lists.infradead.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tDx0SmAq9tspm3iQmtFgNeLP65KzwVcSmzUpMMVq-qA_1778101833
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 2:28=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Wed, Apr 29, 2026 at 01:50:15PM -0400, David Jeffery wrote:
> > Like its async suspend support, allow PCI device shutdown to be perform=
ed
> > asynchronously to reduce shutdown time.
> >
> > Signed-off-by: David Jeffery <djeffery@redhat.com>
> > Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> > Tested-by: Laurence Oberman <loberman@redhat.com>
> > Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> > Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
>
> I'm concerned about tripping over driver issues, but it's a pretty big
> benefit.  I think it's worth mentioning the "async_shutdown" module
> parameter somewhere in the commit logs and putting an example in
> Documentation/admin-guide/kernel-parameters.txt.

Sure, I can see about adding a document patch to it.

> Might even consider keeping in -next for a cycle+ and targeting v7.3.

I would be happy for it to spend as much time in linux-next as needed
for people to be comfortable with the risk of odd interactions with
all the pci drivers it will indirectly impact.

But I must admit my ignorance with some of the details of linux-next.
Looking at the main code changes, the patchset would seem to want to
go through driver-core to get to linux-next. But as far as indirect
impact, it is the diverse collection of devices and drivers under PCI
which are most affected by the changes. Is there a consensus on how to
steward a patchset like this one into linux-next?

David Jeffery

