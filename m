Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93984B8287
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798612; cv=none; b=gYP93bLIQdwnWuhX6yANOBNGzMBMdXV5sI3jZbkN4ujXFFBrE9FzjOkrXNaoTF/k9xtyOcQ28/fUJWFentNT7Z2/w7soBbVvWOam2asfrVxhoZAqzP3soKUFxPkmGAAwSV41ITjGLcGIHA0n+EPH4E9ixzn9qrDyIhoUBGbOhSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798612; c=relaxed/simple;
	bh=tb7tRqjRKsskIV4ptJEZWXYPWkaWUIXs01cFsV/GkMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+n2Wnww5IuPd+0zk7TBSmbWyHdEyPF0IwwF12Mp0Y/oP6wBjbZRKKcz/oHZf1thNr1GxwP8kSoPGLvI7mp/3NVjj3afAcjMxT59K2tecvpTxipiL5ZoSBFdunY2hUckNjxRdJ2uaJzI5Ql6KIZvyNRf+o5Wm9GkS9qmhSLlAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GWIKXjWN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GWIKXjWN"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e2e4ef20beso18525ad.0
        for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 13:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798610; x=1791403410; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gV7fs5Nei/k8o70WCYEk0VoBwcvkJqHkvDHNbl1vC2Y=;
        b=GWIKXjWNYQigzEKbNcz2wBkpGpYIasAazqWP97AP6Gno45WTj02hsYQMODT377v5q7
         Baz7NzDhpB9ESdFcnFrRLk4D8qLjxFyDeAIo9fqFVPoBGzvpWiEmDriJF55fe0kPVfNM
         Rj5dOAWeHZp0yLhtj9zHZjU5OOZ3hBswj/Z+pCcUREYrD8QTg71mOWQ+YMTcpFMFHPae
         VEDiduRKQ0gCdSj0IgmfrhPDm/O+/AL9QvyoRAdrhYe3ZeXB7B43zam7xd2l4ChcNuPU
         7rbtE2Lkea61r4Cdvu5JHxplXGkyU9FYWjRy2BPm500WE71aSAjGfOYwocasEHs4Pjly
         cLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798610; x=1791403410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gV7fs5Nei/k8o70WCYEk0VoBwcvkJqHkvDHNbl1vC2Y=;
        b=yIQOJY0TD2cNIp0LL9HtvDCi/vAH39V/Du34qbOsCaPBkAxULZDUXpMPdhpfUTdreh
         lP4iH4pFI56nZkxClECxynF8lZMys5EuAmw+SFVplqG8oJhWd+NpUfEtsTzpL16skkP9
         R/RivRpWCweq+oHnSkwab9jxMatdVg0NLBarLpKJOA08hgBSIMRGO03c5VKw5Uy/MLcz
         hqV9ZkTQ9wsjS5dna7mTjOEOyEjUyHV2TT9Aq0LTis8gUYsSZ1CA7x7XY2s3hAnf7/XQ
         wOR/OYL9VBhmC2stNsDlutqs9MNgChL4iEzVgVhFb1/2NS0zoSXt3PpBSxwHVsAA5Rzw
         wySg==
X-Forwarded-Encrypted: i=1; AKwUvByWGplTdqR9PoUnORnbfgK1rJtNMDRKetU1Bu9XrNqRSrHzYFAJtm/fR1PoKCXFW6EWcw0vbJuOZ1FPEw==@lists.linux.dev
X-Gm-Message-State: AFq9FYL3VN0YV1EVZ4rBmO0b5QdMg6Gdvx9jzgCDJQpUbvqPnDi+jMBo
	COscu/8WMo0+fxgzolxXtYkS3P+xDx+E+xxWk4aM8YuFfQun8Gzjqusu09niYmJsQg==
X-Gm-Gg: AYBFou10S4nZGCWomZynIhOGMg5ezKJGJIGU4t8FtaiPX7Gy91kxaIPu+f5Rm6ALUhV
	vgVWZiBg8X9aa/X8Iek/oci468Lqppr10fk3mZqEBMNlCmQMqoliHhXt4E3FcrPFj6juMX71dPv
	J4oqo4NO6x+zvFMOSbac9JOBT7k3lWb0Q+WOz0ewOtQ5d6EOHKiM9BTt0SVRRNF4rQbRsHAKzsW
	vF6GyQroa3DluQ8f1z9BUDNLR1s7Kfui7QUufBTqjuZqgyGa0FvJN3sSYxvtU/A2igZLMm6Yquz
	DEa1bjR7IaP9dFuDtkJpNWsSpWiSVeK+ZlInEMC/OoYg6WrsK/0SMu9lej2v2FcSEgAYMNdlc8B
	4MwnJrlYWdP467dZ3TyeR4/hgbqvJ4Tbqv53Kxzi/T8g3fWhjUC4nDANJkQ9jKIxGtG3ED2pgah
	e9tekQlAubqEBAuPrNPV46V78Xq5DKvIsOibLD8KBlGwDzAAZzJ7Til0IBehb62MDGejgTBQoP/
	t5u9pL9BEViRyGZmguXIDniApyZahdT8OOC
X-Received: by 2002:a17:903:32d0:b0:2c7:9e6a:1a8d with SMTP id d9443c01a7336-2e305407c5fmr334005ad.12.1790798609384;
        Wed, 30 Sep 2026 13:03:29 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300a90dc9sm1914285ad.18.2026.09.30.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:03:28 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:03:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v11 10/16] iommu/arm-smmu-v3: Factor out
 arm_smmu_handle_gerror()
Message-ID: <ar1rCWg2mJ3aiZS2@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-11-praan@google.com>
 <ar1WQCud+B3nAWX6@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1WQCud+B3nAWX6@nvidia.com>

On Wed, Sep 30, 2026 at 11:34:40AM -0700, Nicolin Chen wrote:
> On Tue, Sep 29, 2026 at 03:45:04AM +0000, Pranjal Shrivastava wrote:
> > The GERROR register's state might be lost when the SMMU is powered down
> > during runtime suspend, requiring the suspend sequence to handle any
> > pending errors before the hardware state is lost.
> > 
> > Refactor the gerror handling logic into a helper function. Subsequent
> > patches will invoke it from the runtime suspend callback after disabling
> > the SMMU, ensuring that any late-breaking gerrors are logged and ack'ed
> > before the hardware state is lost.
> 
> CMDQV has a separate IRQ, so I think it likely needs a counterpart.
> 
> I have a similar patch in one of my series:
> https://lore.kernel.org/linux-iommu/16ae24cc2a002802b990afa1a69fe4ceab1e0da2.1790188510.git.nicolinc@nvidia.com/
> 

On a different note, I should look at that series, I think there were
multiple things that were fixed/addreseds in that series. I'll try to
take a look soon.

Thanks,
Praan
