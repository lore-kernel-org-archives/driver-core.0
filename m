Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C23191C8
	for <driver-core@lists.linux.dev>; Mon,  1 Jun 2026 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332966; cv=none; b=ozTbIz+eztjbYaBqigtNTDyPZL6gFhSTPGZesx40w2cPYSTmsQezIDMUsI9CKibn69l2OizAOzaN66UHGdTKspWnf+SJN4pHM0dumM6N60Ulu291q0daq8K+63NMvrqT8NBk0HMvvtLj4gzTohJy/JlFq1twZRDMWZ2XhslWOz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332966; c=relaxed/simple;
	bh=0e7u8ODv5hGAN3SwrIVi3OVbVFu5joHm/GWqQlQCsiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7neczOfzi/futBNBdkBZLiBDwLihAKd4koguXchg6r1hmuAXzZwPZmuxzCQAzV2gfOFeYigdKPGuyoyuWh9HpumB2ZQKPuNZBfJ6WjTtzjFBQaLpnuFdp99COaNQC+dwt0a0CayJWtJyk5lBUHimlCFv4HEfjcrXRdqV3g1ItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rthe9Sb1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rthe9Sb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780332964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0e7u8ODv5hGAN3SwrIVi3OVbVFu5joHm/GWqQlQCsiU=;
	b=Rthe9Sb1IkwIW1/C1zrGHTzwY5rJTLf15voACDNWO9amfyFEp4r2xbxn9uBUSZNuphpKwg
	PLO/2j0SUy863B59UTKEPakGOCiKaXBOgOZBDW4GbcgeWa86Bbyv3LkXKe8M67n7TI42uD
	3bRjXZFtHNP9U2vBkFvJTZv2eEi6azE=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-64WZKOVmNXK9x2yoZm5d7A-1; Mon, 01 Jun 2026 12:54:56 -0400
X-MC-Unique: 64WZKOVmNXK9x2yoZm5d7A-1
X-Mimecast-MFC-AGG-ID: 64WZKOVmNXK9x2yoZm5d7A_1780332896
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfe512e871so731893137.2
        for <driver-core@lists.linux.dev>; Mon, 01 Jun 2026 09:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780332896; x=1780937696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0e7u8ODv5hGAN3SwrIVi3OVbVFu5joHm/GWqQlQCsiU=;
        b=gd9xc6YEIxIUdV7VygydjjbHHN8a3BKiAGwCYml7ad0pY2hZbA5XKK3Xu1KptKyC2B
         PY+CPUGhbbhpc1tF85Pl5QMI/RVF+x+T/sGSdn7bEYuJ6gfOtRA5fe+W6Ehcrt/7iVa9
         YxhNzuGQlKRkDgurJ/9jnRINXEfOwr/+1m8ndekpYxlPysQQpHfmu265v2bQZAf1UXE2
         yj3+li9oYE0Xm6wzbiDJDYpMjMRvvwK3hNATJKzldWFXlbcGpolXb8/Ohz5vpMyEAg7z
         +3cE3oGWwg1lHCYmbyYcj7JS4ilTF6ZNTPFn4ohsOt0o+nRcaznXw04XgV6mLS9VweKK
         h0uA==
X-Forwarded-Encrypted: i=1; AFNElJ9QJZrTJY0UJb4Azodyc8BHisYeixVbL7OL2trQpNXTV6R0rSL5HbzkQTqN4OIwPhDi5hoPP/LFIbtRtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgFmWrBkxUd8/ofYX+4wgH5y05R5hiMGjokgSWsweCEfZOy5Ry
	kqT+izEZE6/DJV2bzFFG6ExZ4bp1qgHr+G9KA38vM1YVhWvihr9R1rwA8LTKaG62JxiPx5L7oYF
	KDm2XsATOfYsOzOt7iJn45IlgVbZfvdcs3rcQRYvN0ApUtS45S7arx1GGI0WNd6qVIsMgM0sRQA
	SQ2bAgOLbBqEO7qUBnZkz5AktQpJjavqIBH6JCH4Y=
X-Gm-Gg: Acq92OGtKtxTkJxyVyzx2e7QU00Vu7vAYRQZelAM1wv/bO164bDV9kAWkJG1GCG3384
	iHIip8r8szN81B2Em/TseTLdyMWQ9P4o6L9fkamRTjT0Hb+yhTohkCT0JBePCPJYY7byrz/vdWQ
	FQVYo7hftizTXZoinlxlYPB4sJzaDam//xpokI8GPMwOw2mM2cdXI173x6g71teOzQdHW1+4y+T
	xbvHuQdVxDxM9XDpLWQt1ofX9R95+rPzx7jPNPX23OWZAsOOr8pP7RZA5bj+u8cHAdPS4c=
X-Received: by 2002:a05:6102:41c1:b0:6d3:aad5:6d2d with SMTP id ada2fe7eead31-6d3aad571d5mr1975290137.18.1780332895712;
        Mon, 01 Jun 2026 09:54:55 -0700 (PDT)
X-Received: by 2002:a05:6102:41c1:b0:6d3:aad5:6d2d with SMTP id
 ada2fe7eead31-6d3aad571d5mr1975273137.18.1780332895334; Mon, 01 Jun 2026
 09:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518193204.14273-1-djeffery@redhat.com> <DIXT3WV9XAWK.3E0JOPV2K6NC1@kernel.org>
In-Reply-To: <DIXT3WV9XAWK.3E0JOPV2K6NC1@kernel.org>
From: David Jeffery <djeffery@redhat.com>
Date: Mon, 1 Jun 2026 12:54:42 -0400
X-Gm-Features: AVHnY4JlEP4O7SvjLzcCS-aNG7BrnY8TX1LnwVykV7UvnzLu5Qi3VLZ62Fw9ZAA
Message-ID: <CA+-xHTGSuo-i872=-SG5pf+xGAN71TDQ=5f-H0kuv9g8G3uqZA@mail.gmail.com>
Subject: Re: [PATCH v16 0/5] shut down devices asynchronously
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tarun Sahu <tarunsahu@google.com>, Pasha Tatashin <tatashin@google.com>, 
	=?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, John Garry <john.g.garry@oracle.com>, 
	kexec@lists.infradead.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oDGEswnIo3v3zMCMNnkLgfpU9Ze6GaqpsIwoqJAN5aU_1780332896
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 11:10=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon May 18, 2026 at 9:31 PM CEST, David Jeffery wrote:
> > These patches are now rebased against the driver-core tree's driver-cor=
e-next
> > branch.
>
> [...]
>
> > Changes from V15:
> >
> > The async_shutdown bit field is converted to a device flags bit Convert=
 all
> > patches to use the flag bit accessor macros to set or check if async sh=
utdown
> > should be used Added documentation on the kernel parameter to control u=
se of
> > async shutdown
>
> Did you have a look at the Sashiko report from v15 [1]? Some of the conce=
rns
> raised seem valid at a quick glance.
>
> (It seems that this version has not been picked up by Sashiko (despite yo=
u
> mentioning they are based on driver-core-next). I'd assume it doesn't lik=
e that
> the series was not sent with '--base'.)
>
> Can you have a look at [1] please?
>
> Thanks,
> Danilo
>
> [1] https://sashiko.dev/#/patchset/20260429175016.7915-1-djeffery%40redha=
t.com

This does look to have found some legitimate issues in need of
correction. I'll get them fixed.

Thanks,
David Jeffery

