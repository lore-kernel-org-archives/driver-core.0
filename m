Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6391B347FD0
	for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 13:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323236; cv=none; b=bDFWlOk4WPN2kMFr404F6GYUBPjGhM05kiTt+p4HV0+VuhnbOHJFk6jU/V27FTpJuGPfW92biWQNLw8HRDA0OtP+dSq33kvhKBHklYMYnB3CQTCWcDFVFKQegf5Z5Kx9dXGD7jkHqEU2PnaPRWg5C4F8yeSvX/iWVdUabLDN+T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323236; c=relaxed/simple;
	bh=ZV3VbZ1mNM0aS2EfUb3caDrCm043ueTXRh1wTOrM/Y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/b/AJp3dwcRdP3jy1QuX5Yh9IEpZ/g47DDTJzpeRtNZ3nLag1bLQyvwspjzwWQZCq8ZmWxJm48fBrfwzK/52kG7wMgYxdcCQFoUkCJSVRWmsi4RyBAoaf088UKSbD2EO91YA0acT/4bfF1w+2tVoiCwklE0kGQ/m7XLY75zuGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PKKlxWEk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PKKlxWEk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773323234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdlxH/5WUEaVpOS5WFYwF5v8OUn3hB2b+n1tpHi0S+k=;
	b=PKKlxWEk05amaIrcIGRB7FOIAECsJxRgz8Kzg/IvWDsYMR2l9TgJDsTwNakOa3HcWLLRUN
	tmpEGR7cRkULTTx4tveFSmkAiO81oS4s/l/PVsZZZrxVhcaWbvT8nKMSGBsSfbJAHJEfDZ
	AH/TRceTmlhug4LxJ9hNUOuytgHEUCY=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-clV4UB_tMIiPoT9r0K0Y9w-1; Thu, 12 Mar 2026 09:47:10 -0400
X-MC-Unique: clV4UB_tMIiPoT9r0K0Y9w-1
X-Mimecast-MFC-AGG-ID: clV4UB_tMIiPoT9r0K0Y9w_1773323229
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-38a34c834c0so5626121fa.2
        for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 06:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773323228; x=1773928028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gdlxH/5WUEaVpOS5WFYwF5v8OUn3hB2b+n1tpHi0S+k=;
        b=N1pMoeTxMzkB4v3g7ztEvPoPWYpyRjOebbwCvN3D+z14XN5antZuY9Lx2nK8TRZdJb
         sHjjhdXm46iuITG/xyHyIEiIn7hk+OEhMhoX9Gafzz5Rs39Q8m9UmfqTFTNGwdej7gzP
         0VN/wjmoc+hFjNsT30xS65zNNt4re2CbEUdMenhkblAqKmu98LnU6SkKjWp7aZxvrktW
         kBGUOPWc+KtAb80OHn4NnFtlSry7rDU5GoadLzV16eQH51IoPQ6EuP/yGojALpUYM9tN
         PMADE0afU8KoJU0ZdpXW1sbCoTfwV+GaFoXGYGdWYMewueHcApG0mtsmzapID1He1h5s
         w7Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUvL65pNxniEzC2tTFW3IDNRlPnuKnYU+F/JN3jr98aweGMw/rvZ2twwZD/f1wPnqTDcG3/7YWRPue3hg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrQpL8WFitXh91VdBcAH7G0aabdO0GZff4RZtdL+YdBrhRj/TN
	J1l+zsoxQEca24fAD8nEhT5nbBg9K22gza2eMN0/1X0ujuGB+zK62cxyEILeqwfNc99ByPQj3fF
	hp6xMsD42uheJNFwO62k8gVPtG9LsQdKJgmgbFxWydqaRyqnqjuU16NzUF34dvdyaRo3JR9/esF
	7mPIrQTQrvOUpD4dDYu1XGFMnH60expAB78xTH7pE=
X-Gm-Gg: ATEYQzx/U8LL+jZYK1HdIPFzx858+fg53L64Px85j/qzq248Bx0iqbfLa/v/3OSS9Tf
	ndvfnUpc7Q+Fuu7YOye04ff7w6EF1/95fnO7s2OScQ/A/2TyJqEDjTxkxSvYDrnPDeYO+Bbf9tU
	ywNFwb4mzRykGUb7+P2aNNOAsSqjVCm4DKc0MFet4Y+TtsR/t3IWsIr0NOBCL1c9HQ6WBZOUy3b
	zGw
X-Received: by 2002:a05:651c:418a:b0:386:9653:5d52 with SMTP id 38308e7fff4ca-38a67e7491amr23214081fa.34.1773323228369;
        Thu, 12 Mar 2026 06:47:08 -0700 (PDT)
X-Received: by 2002:a05:651c:418a:b0:386:9653:5d52 with SMTP id
 38308e7fff4ca-38a67e7491amr23213891fa.34.1773323227890; Thu, 12 Mar 2026
 06:47:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311171209.9205-4-djeffery@redhat.com> <20260311230854.GA1051125@bhelgaas>
In-Reply-To: <20260311230854.GA1051125@bhelgaas>
From: David Jeffery <djeffery@redhat.com>
Date: Thu, 12 Mar 2026 09:46:56 -0400
X-Gm-Features: AaiRm52AtdZGk-qB4SJr26Fu0GESy8t58w0K_vuANNjeyWOVb3Y93GXrhdA1CIU
Message-ID: <CA+-xHTFHCvqqg+_XKyvsWUEVo=hqXYARRMVT_nqZkwJOX+o6yQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] pci: enable async shutdown support
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
X-Mimecast-MFC-PROC-ID: RE2lw5A9i0blSVkKT8fhJ6ltGAo9PGnmxay0foWSrs0_1773323229
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 7:09=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> In subject, to match history:
>
>   PCI: Enable async shutdown support
>
> On Wed, Mar 11, 2026 at 01:12:08PM -0400, David Jeffery wrote:
> > Like its async suspend support, allow pci device shutdown to be perform=
ed
> > asynchronously to improve shutdown time.
>
> s/pci/PCI/
> s/improve/reduce/

Sure, I can clean up the wording.

> I like how simple this looks, so I hope it all works out.
>
> BTW, something seems messed up in your post threading.  I assume this
> series is supposed to go with the cover letter at
> https://lore.kernel.org/all/20260311170956.9146-1-djeffery@redhat.com,
> but the patches don't seem to be replies to the cover letter.

This was from an email issue I should have handled better. For some
reason, send-email hit an error with smtp after sending the cover
letter and failed to send the rest. When I then sent the rest
separately, I failed to consider the threading and didn't think to use
the option to force it to work as a reply to an ID from the already
sent cover letter.

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
> >
> >       /*
> >        * Add the device to our list of discovered devices
> > --
> > 2.53.0
> >
>

