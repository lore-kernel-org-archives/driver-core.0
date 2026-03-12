Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428993822BB
	for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322765; cv=none; b=dMnlSi6/jAxj8GkVPvgCuuixHD/OVIec2fNNYMwXVNcydDddMpb/3lWfXhzoHzHaoTB20DF9GVqkIyUljMWPg5Sw5fVfBtSeUhkH/NtsURdENX5P6Rvp+japxMCeTGJiHrzrtp4KQWfJ8FqaSb7yLKfqNFWXcSVb0wfyG2h/IBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322765; c=relaxed/simple;
	bh=L69QmC18hapMhcCCM9aOUH8w0vMV/TSuAPEAAljzmjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=so8t/QHQqV6R79bto82HcFdXG8H6QabjnYdLAV4V57nKsyi77gpOZ9lmUcEwypM8wRez5KBtM+x9saJL9+erlwPhrEfc0clckCyH27tGS9U+Zg1Gce7ZCAOdY0bI9Z62PxNQSvBdsJ9K5NlBxEHioFR6jeYaqKZCBEyobv73kcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MbWeDCcK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MbWeDCcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773322763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P1afq9gHFIfQK6ABVrm5mHYxKeNKd2BXTj6Ir4QwH/s=;
	b=MbWeDCcKfnHQIkmkxsGJr4MJpn9HmcoJblyMLZVe4leqTbOnD9921K7Hq6ZIqG4rK5p+Vy
	RiCuMbwXuSaF0qkekY5EbtMBa+Tea9GgrYetc17tbkrvBO0t4SrytwcKqCglAcxzysF00C
	CGsmf44BpABSjpzJuyjj5l4Y4tx4tDM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-JiKk4ksrPAW6DGPmL3M_cQ-1; Thu, 12 Mar 2026 09:39:21 -0400
X-MC-Unique: JiKk4ksrPAW6DGPmL3M_cQ-1
X-Mimecast-MFC-AGG-ID: JiKk4ksrPAW6DGPmL3M_cQ_1773322760
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-38a39047762so4320521fa.3
        for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 06:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322760; x=1773927560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P1afq9gHFIfQK6ABVrm5mHYxKeNKd2BXTj6Ir4QwH/s=;
        b=QDV9Gm4RL1SsZ5UxK21rrA+gG0ccmOES+lwjFKUNRh74F6eBPueCwFVtCWlOjyvVeV
         pcZSTrYr2iGh3amqh9/gFtHYS4isGjHoUeuqlf4nZtGnVw1tA8H6N3qN69IbA9IodAzA
         CvkHafehpJzV7UHpNfPX+5TUn2F4I4wJAvImKC7+eyDcBJNxvMLwF/pyDxMGgmP72fkH
         SUfUz3H/gTDB++0bFLvFUj7zDYCH2nvSoudE606uRyPJPfrvte+TxsIGful447j5mRCP
         TVhR6N8fnNHYcNNij9nN9SWA12YTUVr/5goBHMIbsRZYmZqnE3c+0hwBziZlSPuiuTXB
         Kzvw==
X-Forwarded-Encrypted: i=1; AJvYcCWk4uiYYr/edkBKoyd3r7nojX7cvTsS9gOQlCI1JPDjMlAGO6pwBQ6oTTJehI3mrFDHG2jHnOtjGBZbug==@lists.linux.dev
X-Gm-Message-State: AOJu0YyR+t+fvtiDPz3PMFqIlz7F+us56z/DjMFphXFNcwdYisiG4TxI
	ZYJKimmnTSiBVKsk5b7ecmtmJvCrby/Ro/w7ccB9YurARzI27yhUt9agebk912u/wPgrNLH0yJ5
	XfoItPz8Zt6k9eTuuamhsAPvQ+vqeIJnBhbR/TeRqcyo+5fZX6zMhNDX8HAWXTWtY8ch6StPNs5
	Zh5ayfGfh72ZN2/3ekp7oMiL4yhICCriMHHJcFZFk=
X-Gm-Gg: ATEYQzxMKjiIcq7EgIU5CUJ7nbJkcFUjwQXDsKAohrwwMHQ+yFmTwpN3fHio6dvYjGP
	KPg61aV+GBLevGv4+5qQ7EVF1vT4oHnmmGS8a1n9tKyLczHUN5xce0TfszJjUWRNIvLNUJKr7zP
	Reiw/yEuP0F8EzdjQoIG4yWPh3fm+adaKbhSyj07UrqRU/BgZbBZb1xnWGRSlmuEh2ZD0Yi3RXY
	3//
X-Received: by 2002:a2e:a991:0:b0:38a:69ae:ed76 with SMTP id 38308e7fff4ca-38a69af0e32mr23484891fa.8.1773322759830;
        Thu, 12 Mar 2026 06:39:19 -0700 (PDT)
X-Received: by 2002:a2e:a991:0:b0:38a:69ae:ed76 with SMTP id
 38308e7fff4ca-38a69af0e32mr23484641fa.8.1773322759293; Thu, 12 Mar 2026
 06:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311171209.9205-1-djeffery@redhat.com> <20260311171209.9205-2-djeffery@redhat.com>
 <932d4e59-395f-4022-a2de-874fdea778ac@acm.org>
In-Reply-To: <932d4e59-395f-4022-a2de-874fdea778ac@acm.org>
From: David Jeffery <djeffery@redhat.com>
Date: Thu, 12 Mar 2026 09:39:06 -0400
X-Gm-Features: AaiRm50cC3-HopgnDbEpZBKck8Qg_3xXUFA0iihGZz6Xo1ScI6fOim-Jwqz1X4I
Message-ID: <CA+-xHTFnOtFqFeH=Va1vTC3qaa2J_tDCfpdq-RdHFFbByoNobg@mail.gmail.com>
Subject: Re: [PATCH 2/5] driver core: separate function to shutdown one device
To: Bart Van Assche <bvanassche@acm.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <tatashin@google.com>, =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Marco Elver <elver@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0PU5xmE5ZifTVTYyxgskenx0D1JsI2On0SVAQ974gI4_1773322760
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 2:03=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 3/11/26 10:12 AM, David Jeffery wrote:
> > +static void shutdown_one_device(struct device *dev)
> > +{
> > +     /* hold lock to avoid race with probe/release */
> > +     if (dev->parent && dev->bus && dev->bus->need_parent_lock)
> > +             device_lock(dev->parent);
> > +     device_lock(dev);
> > +
> > +     /* Don't allow any more runtime suspends */
> > +     pm_runtime_get_noresume(dev);
> > +     pm_runtime_barrier(dev);
> > +
> > +     if (dev->class && dev->class->shutdown_pre) {
> > +             if (initcall_debug)
> > +                     dev_info(dev, "shutdown_pre\n");
> > +             dev->class->shutdown_pre(dev);
> > +     }
> > +     if (dev->bus && dev->bus->shutdown) {
> > +             if (initcall_debug)
> > +                     dev_info(dev, "shutdown\n");
> > +             dev->bus->shutdown(dev);
> > +     } else if (dev->driver && dev->driver->shutdown) {
> > +             if (initcall_debug)
> > +                     dev_info(dev, "shutdown\n");
> > +             dev->driver->shutdown(dev);
> > +     }
> > +
> > +     device_unlock(dev);
> > +     if (dev->parent && dev->bus && dev->bus->need_parent_lock)
> > +             device_unlock(dev->parent);
> > +
> > +     put_device(dev->parent);
> > +     put_device(dev);
> > +}
>
> Please keep the following code in the caller:
>
>         if (dev->parent && dev->bus && dev->bus->need_parent_lock)
>                 device_lock(dev->parent);
>
>         if (dev->parent && dev->bus && dev->bus->need_parent_lock)
>                 device_unlock(dev->parent);
>
>         put_device(dev->parent);
>         put_device(dev);
>
> Additionally, please make sure that the caller is made compatible with
> lock context analysis (see also
> https://lore.kernel.org/all/20250206181711.1902989-1-elver@google.com/).
> All that is required to make this code compatible with lock context
> analysis is to organize it as follows:
>
>         if (dev->parent && dev->bus && dev->bus->need_parent_lock) {
>                 device_lock(dev->parent);
>                 shutdown_one_device(dev);
>                 device_unlock(dev->parent);
>         } else {
>                 shutdown_one_device(dev);
>         }
>

This would also need to either grab another reference or move the
reference drops since shutdown_one_device may drop the last reference
the task owns to parent and dev. Since shutdown_one_device ends up
called in 2 places in the next patch, perhaps would be best to split
the bulk into another function, then have shutdown_one_device be a
wrapper like:

         if (dev->parent && dev->bus && dev->bus->need_parent_lock) {
                 device_lock(dev->parent);
                 __shutdown_one_device(dev);
                 device_unlock(dev->parent);
         } else {
                 __shutdown_one_device(dev);
         }
         put_device(dev->parent);
         put_device(dev);

David Jeffery

