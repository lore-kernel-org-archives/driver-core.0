Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF703DE42D
	for <driver-core@lists.linux.dev>; Wed, 11 Mar 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773250442; cv=none; b=AkRWgZnlFtmnpAlnp3oLMl40zmgEFOC86Smxmnkr5mSYucbSL8zp6/cEFqhfkxJtgdCnd/V0Z+t/YvjQ0ac9qrXnYE6OyQYD+8B5hos+Xz/8QCPk5h8eqeQGna3xdcDpmQq5yEmaCxAQWIjVUm0C2/AtW9SemH3YE0nhDYcIbzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773250442; c=relaxed/simple;
	bh=s2TT4zBmTgKLBjwI2jX25EeD0XUul2cp2vaWxlr2I3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBMfT8+XQxqojU/70lrbD/GnntLwMV0mwAizdq1ktrdXmIwGQBoeIfEfDCmP7b5I8kBeSSgc527cG+SFgFNIu4Sd6YLNt7Fy/PWWLtTEbj/D3larA4JO4XQAxvvLM/bwamymIkv8L+HtlWBoDtBHNUpgctK/N1tVoeYS4Jxqg3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fkRynZC9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fkRynZC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773250438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=flJ16OLbnUTRR+lsZIvlkZ9oQtiHzlZe/Icpj7ZquZU=;
	b=fkRynZC96qRwTgEaI80gfc7M97DxDcBA7mO6SRB2rl/xL6BnCtIuD9UT42TJwpjUQJYcxC
	97tsy3zZ7uuSf3PHURRhESGqOf/MnWKNvgrKOq7WXD+Ar403xlo5HTBvqEP5E1dmK04UqJ
	o7KKtp/+me0/BXABhwoa66mCm+w7KmU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-OJNU-f2cPd-L17jsnULjDw-1; Wed, 11 Mar 2026 13:33:57 -0400
X-MC-Unique: OJNU-f2cPd-L17jsnULjDw-1
X-Mimecast-MFC-AGG-ID: OJNU-f2cPd-L17jsnULjDw_1773250435
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-38a3baf3db6so736981fa.1
        for <driver-core@lists.linux.dev>; Wed, 11 Mar 2026 10:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773250435; x=1773855235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=flJ16OLbnUTRR+lsZIvlkZ9oQtiHzlZe/Icpj7ZquZU=;
        b=HRdqR8CPTSGSdIlIopsNheRczPrQr70vRPHWkYSqta4kBteu/SkZ4JKtYq+m1DMxX4
         BZRkMaaDQP1x36c6L8YhuT3HYmY+2dmW59r53hvAN17V2ZYJIOKwfsuqReVyK/sa+G+l
         JJhqkAh0FwFQw3md6YRUe41vIq0f3C1O+vF0UNfp1+QNQWsofvDco3Dy6WhMa9sq2o4N
         xSUyzhwlzYcFRcyraaIFoyMf/LUDJ8UKiA204oHZr1FSE/w5iNlvKUqnQaQK+RG6W/EW
         vJXvJ007LPIq6QJCd+WZ+2RSy3jQj8vQTKu6W0GYZ3uOMQIYIJ32XpTTEVG/ZuAcAdmZ
         Zq8A==
X-Forwarded-Encrypted: i=1; AJvYcCUInQcNP8v8P7U+Y65CtX7WWehzqCa4cVUARpY0OogzD4HWCtmUTMFIcoUIgfSIk4n7GJyvDWC+n3EJUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/HYrhoro13OXFsOZ7GFoVot0fqw8cJjposUn2a7VYE/rR0JSc
	UB5ghQ2aY9rJ96pF1XJJhLMpiqVVqd3mTJx56nAEfRdkH3iMvEc0ZEqOB4I4qrvfCpVMZuLwIB1
	0L2xHCi4PrEJhDbW4h58npVOC2dFwpp1DPX59zyiihAeeLjr7R0ywNrsOw4aDc7mSx7q3IH22/r
	iCLxWSAJiBWY8KKXILY8APQ/0hgzVZeKBGcD5zLMk=
X-Gm-Gg: ATEYQzxjo8BKOI/M6F20O/Oa0E3KSl9rwVrp43crNEvupcUugXzuVbncXoO7y/wC8Nh
	u61CMsFVYmRD12LYL8RbdS8YKeEF6ydH6xP+Qmevtuzpem4dKz3TLPPGMxOVcu6uXwPH0lFe+Al
	JCwmY9I/eXGqsDei3Q+PDElbu3719WO8L+1fX+OS8+koazjkDls08P0BUPITjczcS4XrafMUzOY
	3DU
X-Received: by 2002:a05:651c:2118:b0:38a:5f1e:5a27 with SMTP id 38308e7fff4ca-38a67ac5bebmr12044271fa.0.1773250435322;
        Wed, 11 Mar 2026 10:33:55 -0700 (PDT)
X-Received: by 2002:a05:651c:2118:b0:38a:5f1e:5a27 with SMTP id
 38308e7fff4ca-38a67ac5bebmr12044041fa.0.1773250434837; Wed, 11 Mar 2026
 10:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311170956.9146-1-djeffery@redhat.com>
In-Reply-To: <20260311170956.9146-1-djeffery@redhat.com>
From: David Jeffery <djeffery@redhat.com>
Date: Wed, 11 Mar 2026 13:33:41 -0400
X-Gm-Features: AaiRm52MnSut7lwQAhwTt7Xx2XUNBQi4rzRxg1tEEehWxmKQpJTSigbO7AwxnYw
Message-ID: <CA+-xHTEdSk69BYpu+6mKVyoErgMTnOpZ-AFXntMe61w1BT0_FQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/5] shut down devices asynchronously
To: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Stuart Hayes <stuart.w.hayes@gmail.com>, 
	Laurence Oberman <loberman@redhat.com>
Cc: Tarun Sahu <tarunsahu@google.com>, Pasha Tatashin <tatashin@google.com>, 
	=?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tNoijGkNEOsSQbXKqnVFfIkVeQqxtWpRwg2LvvJp3NI_1773250435
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 1:11=E2=80=AFPM David Jeffery <djeffery@redhat.com>=
 wrote:
>
> This patchset allows the kernel to shutdown devices asynchronously and
> unrelated async devices to be shut down in parallel to each other.
>
> Only devices which explicitly enable it are shut down asynchronously. The
> default is for a device to be shut down from the synchronous shutdown loo=
p.
>
> This can dramatically reduce system shutdown/reboot time on systems that
> have multiple devices that take many seconds to shut down (like certain
> NVMe drives). On one system tested, the shutdown time went from 11 minute=
s
> without this patch to 55 seconds with the patch. And on another system fr=
om
> 80 seconds to 11.
>
> Changes from V10:
>
> Reworked to more closely match the design used for async suspend
>   * No longer uses async subsystem cookies for synchronization
>   * Minimized changes to struct device
>   * Enable async shutdown for pci and scsi devices which support async su=
spend
>
> Changes from V9:
>
> Address resource and timing issues when spawning a unique async thread
> for every device during shutdown:
>   * Make the asynchronous threads able to shut down multiple devices,
>     instead of spawning a unique thread for every device.
>   * Modify core kernel async code with a custom wake function so it
>     doesn't wake up a thread waiting to synchronize on a cookie until
>     the cookie has reached the desired value, instead of waking up
>     every waiting thread to check the cookie every time an async thread
>     ends.
>
> Changes from V8:
>
> Deal with shutdown hangs resulting when a parent/supplier device is
>   later in the devices_kset list than its children/consumers:
>   * Ignore sync_state_only devlinks for shutdown dependencies
>   * Ignore shutdown_after for devices that don't want async shutdown
>   * Add a sanity check to revert to sync shutdown for any device that
>     would otherwise wait for a child/consumer shutdown that hasn't
>     already been scheduled
>
> Changes from V7:
>
> Do not expose driver async_shutdown_enable in sysfs.
> Wrapped a long line.
>
> Changes from V6:
>
> Removed a sysfs attribute that allowed the async device shutdown to be
> "on" (with driver opt-out), "safe" (driver opt-in), or "off"... what was
> previously "safe" is now the only behavior, so drivers now only need to
> have the option to enable or disable async shutdown.
>
> Changes from V5:
>
> Separated into multiple patches to make review easier.
> Reworked some code to make it more readable
> Made devices wait for consumers to shut down, not just children
>   (suggested by David Jeffery)
>
> Changes from V4:
>
> Change code to use cookies for synchronization rather than async domains
> Allow async shutdown to be disabled via sysfs, and allow driver opt-in or
>   opt-out of async shutdown (when not disabled), with ability to control
>   driver opt-in/opt-out via sysfs
>
> Changes from V3:
>
> Bug fix (used "parent" not "dev->parent" in device_shutdown)
>
> Changes from V2:
>
> Removed recursive functions to schedule children to be shutdown before
>   parents, since existing device_shutdown loop will already do this
>
> Changes from V1:
>
> Rewritten using kernel async code (suggested by Lukas Wunner)
>
>
> Stuart Hayes (2):
>   driver core: don't always lock parent in shutdown
>   driver core: separate function to shutdown one device
>
> David Jeffery (3):
>   driver core: async device shutdown infrastructure
>   pci: enable async shutdown support
>   scsi: enable async shutdown support
>
>  drivers/base/base.h       |   2 +
>  drivers/base/core.c       | 165 +++++++++++++++++++++++++++++++-------
>  drivers/pci/probe.c       |   1 +
>  drivers/scsi/hosts.c      |   3 +
>  drivers/scsi/scsi_scan.c  |   1 +
>  drivers/scsi/scsi_sysfs.c |   4 +
>  include/linux/device.h    |  13 +++
>  7 files changed, 160 insertions(+), 29 deletions(-)
>
> --
> 2.53.0
>

Adding missed Stuart Hayes and Laurence Oberman addresses.

