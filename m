Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8AD4C14E6
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 11:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767384; cv=none; b=ZRmeMekbrS78KYphZ286y7B2L83kUSvtZPe19DPgi+1uxtibiYdAxvvYro56gWhWAQ6tJAgnjNOJKfhzYLNRlFD7QpSt8ChiNhccCD1CPO3zGKft9perKP/bE8m9yopZXNjY+tavdvMt15NLfY991/K5zo5pTvKdSzHQafCXyBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767384; c=relaxed/simple;
	bh=Uoz7OiW5a5Rxdk4fzcsOgp/2ExBRWbtOLfudw/aJhAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyuN0GZSwKpRKPtz7kYPNKdZSgSyCf0UVz+88D28psTsnOw/aZUCq7Pg9mhxa3S6eXN7pUzMPqsFa8e3hYe0Xtxggnoy6diNOjegApe9Jgta0qEb9INXnSz753ESUhZlYXZM5Ijkf9vKKftYfAi0CtZj4YYOVrI0KNueBNdmLiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=ZbLl7vVd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="ZbLl7vVd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so33170525e9.1
        for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 04:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1790767379; x=1791372179; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e55mgJNEP3D1NSQjWmS61DjoJXdbupSLRhSCnVOpVu8=;
        b=ZbLl7vVd/lntENOEAFDuTqmgtz/p8kLQRy+XlP0ehfGUf66+S2wA+Jwb+nBbmvaPQj
         LzMgBe+ApHzyPi6N0t9gsbVLU2ga66rCLCo13P9M8f9gYwnqiuGm0qWAueNTAp2cC14e
         s+YMRbNH0Oha5si5CKOQpCT/BCW5xEFDby/nsOPN2HBCH+xvrST3I8UjsEBgRgHKqRiZ
         ua/qW7YYG/fPchqpbdxDCvWaySWnHHZ6YO4J1Ux34WjNrvft2oAA+EbEzeK510YDMSjP
         2KQvbu/DPrdriMzr1rTRRGoImszzYFFARZ+FXg1cACJ/4m0U0L+AXjrO3hqaQ8NlH7fR
         wbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767379; x=1791372179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e55mgJNEP3D1NSQjWmS61DjoJXdbupSLRhSCnVOpVu8=;
        b=YtAh2mpqRK2bTnDVh7s25SwmzFXSltsowzsEvnW0uQyRmPCVlrK+zWVu97JFIzdiJp
         TXw8OIms594UZCTNfgTqpddtRKV6Bs8rzz1e/RIZVHarF29H7eH/WZr/oeZZpf75RuwQ
         oHbDY6NR5bm5OpumGM0M1vObyy0TgjbTlcr+S6VlhoyRlKm3tzwzLjX8DQd6EedSYFUL
         RC8YRhESjMhye6NaWV4wwOn3Ujdg7p+ry8srlmwT6I8wNe5SfdLjEpaclhgBvQVB+SwM
         msqCkUD95bSe0WH+OJAq4yR6Zy8iKxuQEHhQCX2r5SjgWk78+LcI4XQWG6/66S7pzO9M
         Cl/A==
X-Forwarded-Encrypted: i=1; AKwUvBzEMbdfdSEA8nP7OyfauC+9JuKHFUkwedrr5SjSjciK3DFukQrupy04p3GPdJX4BZd/9dGEJrpiDVN0hg==@lists.linux.dev
X-Gm-Message-State: AFuF++nsCX7hRwqN/+/SP0mFAKngl0aFro+fxqz2mIpaUVdAGzoGJyhM
	GyNeL61MDal3VwFQJy8gb3ptebGhrPsKRc8sg+n7dUD1aQJKGMwW0v2MJgXPPW8RXVQ=
X-Gm-Gg: AYBFou1dPfRozKz2f8V2QlrP0aF+faysYN0OCKw4PxMIQl9P3O/nNFs7FSCqHI25PBn
	TgjKspHizWvn2vY7bL1row9S6aVA6yOa/KM1RUkvmY4SCAXmwU975wcsb3BBi5rf1dQr8EfA/oM
	YNI58J7npPUBIL0QekMo61yCa83Hccv0+lVD6eL9glSn/Ir0xhi/IVIL0KNBagQD8meGeMYO5tV
	cDTn1ASD8E6O6ehsXDoymALLQ63GlfrSx2oLqlRC7nUJ2cDMLN6jsdHavsIkN07CIdIOUbru6A+
	Ju5xVkx2n/ciTNqRIe3hUsJyv4mWIYqpOvWFq97Wo/BaBITx2eR0mNO1/KaoksiZ/q2tlVy+0Fi
	+MWPe13iO4okOEwzvAkfGwByfbBfnzXTwKAzNB+NdHvb1c4DuZpGjW77WMD84faUJnDkzaNXL7v
	WWhbollMaAELpP8Roln9k+4k+qX5h2EJ7QW8VEv2cy9cMwa5fCsx/MvfFh4i0ypkfaj2cJrY8Cr
	vRjcLX5hA==
X-Received: by 2002:a05:600c:4e42:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-4a01aff206cmr18971015e9.9.1790767379170;
        Wed, 30 Sep 2026 04:22:59 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174e161bsm74971595e9.5.2026.09.30.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:22:58 -0700 (PDT)
Date: Wed, 30 Sep 2026 13:22:54 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Lukas Wunner <lukas@wunner.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Alexey Kardashevskiy <aik@amd.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, ankita@nvidia.com, linux-coco@lists.linux.dev, 
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev, Aaron Tomlin <atomlin@atomlin.com>, 
	Alistair Francis <alistair.francis@wdc.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jakub Kicinski <kuba@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Samuel Ortiz <sameo@rivosinc.com>, 
	Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>, 
	"Fontenot, Nathan" <Nathan.Fontenot@amd.com>, rick.p.edgecombe@intel.com, yilun.xu@intel.com, 
	Leon Romanovsky <leon@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <arzr32ZDComnfmny@FV6GYCPJ69>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>
 <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>
 <20260805005533.GB28508@ziepe.ca>
 <apeF/peEzdxvKeWR@yilunxu-OptiPlex-7050>
 <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>
 <20260902150125.GD2890729@ziepe.ca>
 <apl39vOiMPP7VloW@wunner.de>
 <apqSAQykEK3MF9AO@FV6GYCPJ69>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apqSAQykEK3MF9AO@FV6GYCPJ69>

Fri, Sep 04, 2026 at 11:52:12AM +0200, jiri@resnulli.us wrote:
>Thu, Sep 03, 2026 at 03:36:54PM +0200, lukas@wunner.de wrote:
>>[+cc Jonathan, start of thread is here:
>>https://lore.kernel.org/all/20260902150125.GD2890729@ziepe.ca/
>>]
>>
>>On Wed, Sep 02, 2026 at 12:01:25PM -0300, Jason Gunthorpe wrote:
>
>
>[..]
>
>
>>
>>> I've asked Jiri Pirko to work on
>>> the PCI evidence uAPI based on his deep netlink experience
>>
>>netlink isn't well suited to transport large blobs because the nlattr
>>len is u16.  (The len of the enclosing nlmsg is u32, which is sufficient.)
>>
>>Previous approaches, including the one proposed by Dan in this series,
>>work around the problem by splitting the blob into a sequence of nlattrs.
>>I think we should instead extend the netlink protocol with 32-bit "jumbo"
>>attributes.
>>
>>I suggest we reserve bit 13 of nla_type as NLA_F_JUMBO and use the
>>the first 4 bytes after the struct nlattr header as length (if the
>>jumbo flag is set).
>>
>>
>>A second problem is that the size of a socket buffer's linear data
>>is limited.  Also, copying the blob into the nlmsg is a bit wasteful
>>and we'd want zero copy instead.  The solution I've come up with is
>>to attach the pages backing the blob as fragments to the skb.
>>It's very simple, overcomes the skb size limitation and allows for
>>zero-copy:
>>
>>https://github.com/l1k/linux/commit/6e73bb999128
>>
>>That commit is from January and the time I've been able to devote
>>to this has since been limited as my employer prioritized various
>>AER feature gaps and fixes.
>>
>>I worked on this for native PCI device authentication, which faces
>>the same netlink blob issue as TSM-mediated authentication.
>>Both should use the same uABI for evidence exposure.  Additionally,
>>native device authentication may be used by non-PCI buses such as
>>ATA or SCSI.  The uABI should work for those use cases as well.
>
>Not sure if netlink as actually the best fit for this purpose,
>for large blob transfers ioctl-based iface is probably much more
>convenient. I'm working on a uapi framework that make the best of
>netlink and takes it over to a fd-based ioctl. I call it CTLV, here's
>a link to an early pre-RFC draft:
>
>https://github.com/jpirko/linux_mlxsw/commits/wip_ctlv_pre_rfc_draft1/
>

[..]

Following up on this, I have a very early draft of an attestation
framework here:

https://github.com/jpirko/linux_mlxsw/commits/wip_attestation_pre_rfc_draft1/

It introduces a provider-neutral, fd-based interface for evidence
retrieval, userspace verdicts tied to exact device/evidence generations,
measurement registers and their journal, events, and device-security
state transitions. Large evidence is written directly to referenced
buffers instead of being split across Netlink messages.

For this series, the intent is to replace the device-evidence
Generic Netlink UAPI and the draft PCI/TSM evidence-accept UAPI.
It does not replace PCI/TSM connect/disconnect or lock/unlock,
nor the underlying device-trust, SPDM/IDE/TDISP, MMIO, or
DMA machinery.

The branch currently contains the core, a simulation provider with
tests, and a TDX provider demonstrating the provider boundary.
The PCI/TSM provider is not implemented yet.


