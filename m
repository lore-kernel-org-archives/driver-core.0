Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC486511E9D
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779665; cv=none; b=D0gpjnRthYJNCJwXv9rhc1+oGHszeMDa7qnFkXxA6Nai2gv7ZA41JnPCbGmEzJdFodqkA36K6IFfFVw4j8VxCUiyZB+NgMlaqYUAGuL4dkVhFxX9uXof8YFGNgNR/Tjgwy7/lrojjDnAcdGilNabAP+Xon9/YyUmhNac4Fa/v0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779665; c=relaxed/simple;
	bh=2bJatBzAYcCk1VuDyjZ7beVPB8aZyCvTIcDIZIN7xlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j++AtN7dssciFZfEbqLq8O5snLJ8J8FpYGsxoBfEhparkV+WIba6WKWOR2LOuqtEv68+bfQSiSxTqulg0x8YshpVKONPhHLGcehekiLzQYdIpHZktk1gBrU8pCDpm22Qee8DciIS8p671ZBSqKurf0JvyJNaqnJJj8Wyy3tU0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=uhofek1a; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="uhofek1a"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a772de44c5so7936161fa.1
        for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1790779648; x=1791384448; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aY70AEYx6MIgqGoDnlt8OAOLQ4i8odTt91o9/5DhGSA=;
        b=uhofek1a17aBDOA8MLgOnLMNeGiXCNia/3RqZBSeVSqTytTqOlNqZJDF6TGCm82Vc+
         mmeqcrWpdKHugyBT5E6XFSzW0WQZN7SQejMqFlM1Rl7gSryLHRVwC4NFS7rkeDY1CG5T
         uIaM16z2FRRaDK8i7pf6n10k0rNG2YPJy8K1rS5lkMAmOTCdySWqKPVBFxGTrtEzq4Cw
         VqenhIyyFHOchOJixERfb/OYTMxhREkkKiJVt0xaMpBdOsHpq/Y1CwjCdFdyclzRcblw
         ajxtCa+I7z+WEVonqWKep6noFB6OttIX3pOtCZeQcFUFefDPC9lIkz1DR95ZQSoDUxC0
         /LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779648; x=1791384448;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aY70AEYx6MIgqGoDnlt8OAOLQ4i8odTt91o9/5DhGSA=;
        b=pe0l98c68a3Bz92oDG5KoKrrVRtat0BaaVlVglDK8acCotHbzJ5TmzgNIEo8db7n8e
         EKYADJ6M027zyx86ytylTGNJJ8Ay0StgEoFIUyv3LxS/2m/bHbUC+GAgdGGOzprfKfwz
         O6WZgao1U8d3J2RQhf4xa66UlLndvEq+58CzkNo1Gtd1J43X4sZBI78P8TVbG4OjgLRc
         SyDE3T47+/nBLKrWhyC2keIz3m9VSlef7ddAAQH48kWpIceYCP5OZZTSVXBXlu5xaF1f
         Zv6yePekJzh+QqL0nVG5HXgnV5wI2i16vwW9m7gkmnpmFiGJVyXydbhRxRksTgf1g7eV
         PlxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZZfYFstwhHB4Bgaubt9YNt28tC78rdIi4oKwaHOGqpM86E21CK9hJPHWl9SdP9V/1FRtu4B2xfpenyw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJcv0pZvRbYKBGfC0L1bYzWzePQuatywv45nhR5e0uB0XrecQd+
	C2jSMmImoocMzAv191SH6lfHDhdmOGYR8SVzd5ETcEtDFOVEoDkr44/az/UqDg0+1DY=
X-Gm-Gg: AYBFou0jaV7YxZs+CTkzsHVjavJZGM9Ms5b4diJimiGIUpzPI10TaCjsyxgVMf0wcoE
	nVIIaxt4XNANIJYGOl/eD2X9oaFS98jGlxwcO0aqGPeqg2oityTzX9DSTNHWUVLBd7cfQhwH5KB
	0XCHSc8VwAwQydJ+BtyZ5YjDofvqjlo7+cac7SsSueSAXpyg0uVlNZbnvZ1hgbcBNT6OoetGDsL
	RZdjtFdqm4/MPcsvbfWSc6U6nPPzfNRBFmid8O+oua2PEFyttt9DhfvuNexNh01to9+wUa9u1fZ
	hZ1hb64U0Y9YwuRSzzfQV7ZQOQ657Q8aYxIcsxy366Ma4k2V6FvqQ+yohEZXTOcWdncffQpE1mL
	GXi2PcruBKUwUWx6V/0FZmYXNtiIILEkaPADA6aYXad3Z2g7MrGw1PcBuBipiHkfngB7twN+mLu
	OE2NFnoPt1BusTdEOYJcCuul1SioL0cKz1yKaLQrzi0gusDEY96D0keGLmKEdGkL9gEuirxN0MA
	RXE03WNvlA=
X-Received: by 2002:a05:651c:a10e:10b0:3a6:4c3d:978c with SMTP id 38308e7fff4ca-3a7791afe63mr4436211fa.16.1790779647918;
        Wed, 30 Sep 2026 07:47:27 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a77192c19csm8140371fa.29.2026.09.30.07.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:47:27 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:47:21 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Quigley, David" <david.quigley@intel.com>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org, 
	driver-core@lists.linux.dev
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <ar0gagYLbCbxT2Ay@FV6GYCPJ69>
References: <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>
 <20260805005533.GB28508@ziepe.ca>
 <apeF/peEzdxvKeWR@yilunxu-OptiPlex-7050>
 <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>
 <20260902150125.GD2890729@ziepe.ca>
 <apl39vOiMPP7VloW@wunner.de>
 <apqSAQykEK3MF9AO@FV6GYCPJ69>
 <arzr32ZDComnfmny@FV6GYCPJ69>
 <b32438d2-4470-44b6-aa62-b691f93a2b9c@intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b32438d2-4470-44b6-aa62-b691f93a2b9c@intel.com>

Wed, Sep 30, 2026 at 04:14:00PM +0200, david.quigley@intel.com wrote:
>Is there a way for this to be posted as its own patch set so we can provide
>feedback inline? Also do we have any other potential uses for your proposed
>ctlv mechanism or is attestation the only user at the moment?

Will do that, still need to do some work on it before though.
So far I focus on attestation with ctlv, as that is my immediate target.
But the mechanism is quite generic, easy to be used by anyone.


>
>On 9/30/2026 5:22 AM, Jiri Pirko wrote:
>> Fri, Sep 04, 2026 at 11:52:12AM +0200, jiri@resnulli.us wrote:
>> > Thu, Sep 03, 2026 at 03:36:54PM +0200, lukas@wunner.de wrote:
>> > > [+cc Jonathan, start of thread is here:
>> > > https://lore.kernel.org/all/20260902150125.GD2890729@ziepe.ca/
>> > > ]
>> > > 
>> > > On Wed, Sep 02, 2026 at 12:01:25PM -0300, Jason Gunthorpe wrote:
>> > 
>> > [..]
>> > 
>> > 
>> > > > I've asked Jiri Pirko to work on
>> > > > the PCI evidence uAPI based on his deep netlink experience
>> > > netlink isn't well suited to transport large blobs because the nlattr
>> > > len is u16.  (The len of the enclosing nlmsg is u32, which is sufficient.)
>> > > 
>> > > Previous approaches, including the one proposed by Dan in this series,
>> > > work around the problem by splitting the blob into a sequence of nlattrs.
>> > > I think we should instead extend the netlink protocol with 32-bit "jumbo"
>> > > attributes.
>> > > 
>> > > I suggest we reserve bit 13 of nla_type as NLA_F_JUMBO and use the
>> > > the first 4 bytes after the struct nlattr header as length (if the
>> > > jumbo flag is set).
>> > > 
>> > > 
>> > > A second problem is that the size of a socket buffer's linear data
>> > > is limited.  Also, copying the blob into the nlmsg is a bit wasteful
>> > > and we'd want zero copy instead.  The solution I've come up with is
>> > > to attach the pages backing the blob as fragments to the skb.
>> > > It's very simple, overcomes the skb size limitation and allows for
>> > > zero-copy:
>> > > 
>> > > https://github.com/l1k/linux/commit/6e73bb999128
>> > > 
>> > > That commit is from January and the time I've been able to devote
>> > > to this has since been limited as my employer prioritized various
>> > > AER feature gaps and fixes.
>> > > 
>> > > I worked on this for native PCI device authentication, which faces
>> > > the same netlink blob issue as TSM-mediated authentication.
>> > > Both should use the same uABI for evidence exposure.  Additionally,
>> > > native device authentication may be used by non-PCI buses such as
>> > > ATA or SCSI.  The uABI should work for those use cases as well.
>> > Not sure if netlink as actually the best fit for this purpose,
>> > for large blob transfers ioctl-based iface is probably much more
>> > convenient. I'm working on a uapi framework that make the best of
>> > netlink and takes it over to a fd-based ioctl. I call it CTLV, here's
>> > a link to an early pre-RFC draft:
>> > 
>> > https://github.com/jpirko/linux_mlxsw/commits/wip_ctlv_pre_rfc_draft1/
>> > 
>> [..]
>> 
>> Following up on this, I have a very early draft of an attestation
>> framework here:
>> 
>> https://github.com/jpirko/linux_mlxsw/commits/wip_attestation_pre_rfc_draft1/
>> 
>> It introduces a provider-neutral, fd-based interface for evidence
>> retrieval, userspace verdicts tied to exact device/evidence generations,
>> measurement registers and their journal, events, and device-security
>> state transitions. Large evidence is written directly to referenced
>> buffers instead of being split across Netlink messages.
>> 
>> For this series, the intent is to replace the device-evidence
>> Generic Netlink UAPI and the draft PCI/TSM evidence-accept UAPI.
>> It does not replace PCI/TSM connect/disconnect or lock/unlock,
>> nor the underlying device-trust, SPDM/IDE/TDISP, MMIO, or
>> DMA machinery.
>> 
>> The branch currently contains the core, a simulation provider with
>> tests, and a TDX provider demonstrating the provider boundary.
>> The PCI/TSM provider is not implemented yet.
