Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ED0429CD2
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798442; cv=none; b=ZF63TM7+Ekd9U0SZHknVA3Ukm15NO0QoPzLn0y9WOx3xZYGzZ+/4ITNHXTWGzWyNGIn5mYJ8WzimUB3+i9tTlYyd63xAQ5DSkaAiAAv7XG0Eu++y2GUCHrbGrdMkNtQY6raNt7ijndLwpZj7mBjUpeTcWXwSHQVO+F6NioFa0r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798442; c=relaxed/simple;
	bh=j05inaXzvotjyKWa/ZFf47qCdIej5ahkTtsZ7bh+bp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUZ6PFK7ZuLzULi6QMB4/3Vk4zt1rGYDa1Yd6es1tJihFaAV80UH04QkI8S9BaG8DG5zx9r7iL/Cam3siGENBxVjkcFKL1NGl/oAaUjCTI4ZfCGx7NmmYZlOmpFKP4O5Y7L48JIJk3K/8hfRULHCsW5Z+o7GWogpp5lDuF2hSlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iIoU49bO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iIoU49bO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so6435ad.1
        for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798440; x=1791403240; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1G7G3x8CQosaH9I2KCc2mDmp0caEd6Jn1e0HXGIwM0A=;
        b=iIoU49bOGC/kSQ2MqF2qu42Lf3Bxce6n7Nja/APDxh/Nb81JeYLI1Hy8U+eG/0R2Ct
         FFKyJt6wZdr+9TrLUAGjst/WDIfYg3kBoVEQ6tjGHihEunB4TqgsnkpeiIRgfgqJ6moA
         GumO9lVEIDwVHw2yizmUfSzciTiRGczWRS3L9tAomwfKfWQP3duVv0EEFu2LsvlRHmOK
         zPH0WjRG5UxqDfBq/Q+QAMVAIj1y8AjWybLrLp25u6idsIUHwoN0MCSA4r1vV37WUQ6r
         O3JV1feS/VcFS9U0srESUE3KaJGf9KpXLgr7d8zSQO3ZWoSS2ikoPNfNdcv0drhi17u5
         9xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798440; x=1791403240;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1G7G3x8CQosaH9I2KCc2mDmp0caEd6Jn1e0HXGIwM0A=;
        b=LN1dM3d1EPtA6Dd2L6SPsAf0qM3y/AowQG/tl4Eyp6vjssmaGsu1VC0FwL0xXlHKyd
         tR38B5zupktZl4ceYJPxE+e5a+fDLMh5h72wdsZLiGu8CDtp0YDti8cZgvUWbvjBhwKi
         Ui1IbiSU91mo4Yu5lSGeTF4LY9+sNDkHUeTh/XUL+64RjTBbJ6GIPUj9qbCEdxo1jX6J
         9jyGDNQBo6H8CnTLg7b/DHuxzXMi+Uf4UqJXUv2FUaTKd7qzzkqO/jmieVaZqioT+ioL
         M3E2mON4N2sLsamAxnBwyGCk7IyDpIDjHmvkxOzZ/ak/79XVnQC/O0DvYHHdNkj7E7N0
         e21A==
X-Forwarded-Encrypted: i=1; AKwUvBxoXH++yyTGqR975aky755pRaromdeO+UEvqUhg7R+77mWBEAI1jAheGri0Ct2wOWvZK/QRLHL0AglGPQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLTDDBxPUcyphoqCtfeh3gS3KDAerDdQxRU95c/eiR0EIS+JF/n
	iP6QT1XqNeBMYzu2FzAZMxBQWWuqCduIH8q0qMDRnUFb9vTuUURgI2oIzFkT0hABdQ==
X-Gm-Gg: AYBFou0Dn3PvXKu90uuT0dkf58WZ20GROeGQgd2rdyQSSiGCTcSgXSoeT8MpDF6M8Jq
	66O4oPeUkawT5FvZjzvX65ItsucNWoZPGL6O0yTZvysr6p28+QEpA6EuZK2zOYAGtskgAPREbEm
	0RsFQlI8BWcXhjzZlrWYNOTYKvxMHMvymgMZ1SnwQwFRBfFv5BFHA9S2Ro6xZpMN+TqvebDjVpw
	nxE8R/HnHyfFtGHp8Wh9Wt1oYcZxgnIWYjzXks17+C1phj+V1Fg19yWhvpDFzwri8L6oR1EzZbj
	8BEXz1RjgdqNgTsAwzGbxsD7pu4awEO+FHVwoJ6DrXZQws7zdd8nYnS78wWIq/QB4xfmpxpUTjl
	mcTIuDDa2ksOsKpJSZnkdE3Z+wBOp0aV8KsZRcsnAyqNk7wzekqk42EXe8ZjoSmycIAF0qLxBd/
	Vzb5HfBTUq5toTyMhd6mp9dLV4w49aMIqI+q7SS/NZK9BP/mqqoh0L+J4WWkZp33wRI7kElVIki
	l/KOX1Ehp671WJs5bDXDJSeUvH1zXYHuQWu
X-Received: by 2002:a17:902:e951:b0:2df:8ff7:876c with SMTP id d9443c01a7336-2e305472617mr373115ad.16.1790798439504;
        Wed, 30 Sep 2026 13:00:39 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f44d0a30sm753405a91.16.2026.09.30.13.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:00:38 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:00:31 +0000
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
Message-ID: <ar1qX_Ox2ONgcZM5@google.com>
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
> Mine only handles CMDQ error though..
> 

I'll add a counterpart to arm_smmu_handle_gerror() in v12, I'll factor 
out the body of tegra241_cmdqv_isr() into something like 
tegra241_cmdqv_handle_errors() (bailing out early if VINTF_ERR_MAP is
clear, so we don't warn on every suspend). The new impl->suspend op
would call it after draining the lvcmdqs, with cmdqv->irq disabled
around it, right before hw_deinit(vintf0).

Since yours is for the CMD_SYNC timeout path, I'll keep this
independent? WDYT?

Praan
