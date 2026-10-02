Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0740443C08
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 21:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975515; cv=none; b=naGaFMDfaSs6jGx1Wge7zWG2WVVeJ0dU39j70GxlCtnmJZp8MN2ZRJb95IIr/7PtZOv1WW0yzm8zFQYGN5QQNH7K4REwbtJZnEKw7kcBHra6gTdGS3OiWje1wrn7Ez+P1TjwHHsnqDcPLW+MDU2aJTQOWVFtXOEjF+Lsypy8ZcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975515; c=relaxed/simple;
	bh=iOrHGz64z0wKTg4YNpqTI/tUIfNY75DEXU5oPmbSSps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJ1p4QDsEzo4VJlMZBTGQdxNiZQ6RaOfNax0cW/C8EZMOoIHzz8qhXSM4aXSE7Tg3ePy+IqQQFjmUN+a5/urHah+inSc4YlPNF1U94HZRAUDTWN3A/JX4qqF0eK5scBLLcVc5JV90B4ACjZ37JSm42qJP6beoKQeJ/tVnnpYZY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nuDcH4Wh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nuDcH4Wh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d3b445a84fso20485ad.1
        for <driver-core@lists.linux.dev>; Fri, 02 Oct 2026 14:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975507; x=1791580307; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aTAI7MYZpbnU/agtQxfkMDXpGe2YnzBKn6e+VLjrcQs=;
        b=nuDcH4WhOYh6+5b80rm+NwPkm6jz+tV0Ti7Q7U5P9xyREJJNGhs8ysG3fPJ2oFd7wD
         V9LuMByJDpE4dv8+zPR1RUXJTR9i14b4ACUYzLErC6vSSXPPsktNiTJbQu23lxsf7jJ0
         vu+gO7zyIuUy2cTSBIB1Tv/pLQv4SsIT2B1OZ5KHSi7BSVPkGsE/nDQEOCT3+UuZwj3Z
         d09Z3ermq0HHJnlZ59ReApp49KYNeglieeSyfYNdxgfEUjgNb35sCTsf6KRHxH74983T
         dum58uBZ72xIgB8Aqw+JWmyVDbq4ddeEt4aWtRGXUJ78uLIJFcSm1vJaCou+MFSU+28t
         wv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975507; x=1791580307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTAI7MYZpbnU/agtQxfkMDXpGe2YnzBKn6e+VLjrcQs=;
        b=j1Q3XYHy1uzLoE/clDcTxOnDM8PqEvMbiQzTCdP5BjoPpW56r6AHthv/ENtNo4mffW
         DnWB8X3oogf9FvwESrPWOMGz8XnYXieQPPAmnRLhB2H+YW3HTa1yHx2dDFNFrSE9Du6F
         jeb4eb/2Eq0bhgFl5V9pfZ/g66W5LHoK0ROettX46a/ELgJEQo9OQT1LzJmnjSfDwpSw
         bF5lmXpCKSq+Mj4XQz2QGYZNlUzQW3Cb0vjrGFeSMs4BiG9etuw7lpplykLdnMWf0YJU
         eTXbn4g6c8ivQ5MjtUfNZMoElUoTEtDCqusAvAUkegrbQ8oKwd18b5HurUDwqfMxYxwQ
         IH0g==
X-Forwarded-Encrypted: i=1; AKwUvBwjufQoJvnTv/pNa2uaqkAg+DqZohYBocnyLZKztPA6AX5F0ET8kq1WXBv1Oa8Bh02C8YL/b6x4Yb4A7A==@lists.linux.dev
X-Gm-Message-State: AFq9FYIufk8CNOy7wZMVvaKN4xDN2t37wXSlM+MSvUM66E5hzN5G6gEf
	6b4mhR1xdAfLZocW+0++z65+c22xLFhDHb1GKyyQSblBmDOZpGWrlGiEkE9eI0a+dA==
X-Gm-Gg: AYBFou0kRqBueLWuxlFUJ1VVmaB9JE57DFgWsTVuYNbKBk9V3WSnd9iArkTkuwTPym1
	z5KqzX5mhhcW/qCHDH7C5R4eJlpFGLhS8S/vD9t/+HNImsz2lWqjU75PS4i9k3wZZ5kuDkfpotZ
	wj4fA7ynHAYsdEy2nHYHvpPgTAWwoaHeOfEASJ23mY+k6zPAsVxuhjnwVTMXbe/0lGu/DNtJhaG
	AKI+2ggO2aN6kkQktNzGdVNz7TDDxbw2vYKPuAx+gnSDIAtC5ubcvK0QDqkQiitAV+oVLc38fHC
	7vZsR2l5325x9SWAeRDV2sL8VVPL4TXlCvE/v/ZdGBHN0c9f48YsgSwsTBPjvzrI+z0W8hAxXjn
	1Xr+YtJV3fUyD5vA9wzUKvBCsxsIr8qxtdAm2xyed3DQGBdWiZt0dNA1XLRVuVciC9mLTJvv5V7
	83WANxW4SCtf69oqJywh5Cpir6fWGKX9LW28D3P09UDNkFOKKh5zxi+NWl6/aF4Sf7GX8bUWJ3W
	b893cN8P1/iIRNl0BAXj4045c6SqH3PXAym
X-Received: by 2002:a17:903:b8c:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2e53091f83bmr1274215ad.2.1790975506423;
        Fri, 02 Oct 2026 14:11:46 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e497230sm39218a91.11.2026.10.02.14.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:11:45 -0700 (PDT)
Date: Fri, 2 Oct 2026 21:11:39 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <asAeCz_rmpe5hbsh@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
 <ar3yWUmi8E0k37Ml@google.com>
 <ar6gY9grmdMZcN/M@nvidia.com>
 <20261002164748.GD3481470@ziepe.ca>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002164748.GD3481470@ziepe.ca>

On Fri, Oct 02, 2026 at 01:47:48PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2026 at 11:03:15AM -0700, Nicolin Chen wrote:
> 
> > > So we can't issue ATC_INVs during suspend (the EP is already down), nor
> > > during resume (the SMMU resumes *before* the EP is made active). The EP
> > > can't use its ATC while suspended, and if it loses power/resets on the
> > > way back to D0 (from D3cold, or D3hot with No_Soft_Reset=0), it comes 
> > > back with an empty ATC.. same assumption the PCI reset path makes today
> > > (pci_dev_reset_iommu_prepare()).
> > 
> > In that case, would the STOP flag be too late? It's only set in
> > the middle of the SMMU suspend. So, an ATC command (via doamin
> > invalidation) might be issued prior to the Point of Commitment,
> > which will be timed out due to the unresponding EP?
> 
> How can you ever fix that?

The unfortunate reality is that this gap exists in the kernel even
today.. upstream SMMUv3 has no RPM, so it's always on, while the EPs can
runtime suspend independently. So an ATC_INV can already be issued to
an EP that has suspended. I'd argue RPM improves this slightly, since
once the STOP flag is set everything is elided, so the window closes at
SMMU suspend instead of never.

> 
> How does power management really work, is it expected that the end
> device is already quieted by its driver?
> 

Yes, power management would topo-sort all dependencies and invoke
suspend callbacks accordingly, i.e. in our case the suspend callbacks of
all SMMU clients would be called before the SMMU's suspend callback.

> Could the first step in power management install a blocked STE? Then
> we don't have to worry about ATC desync and that automatically stops
> generating new ATC invalidations if we go and detact the domains too
> 

Partially.. at SMMU suspend we set GBPA to abort and clear SMMUEN, so
nothing gets through while the SMMU is off. But that's global and only
happens after all EPs are down, it doesn't stop ATC_INVs in the window
Nicolin pointed out.

One way to ensure the ATC state is relying on the PCIe spec to lose ATC
content during D0 entry from D3cold, or D3hot with No_Soft_Reset=0). 

Another way to enforce this, is to *somehow* ask the endpoint drivers
disable ATS during *their* suspend, i.e. in the EP's driver's suspend
they could call pci_disable_ats or a better suited helper from pci core
and the in the pm_resume / rpm_resume they could call it's equivalent 
pci_enable_ats, counterpart ensuring a clean ATS state. Or maybe the 
pci_dev_reset_iommu_prepare/done() pair (with slight refactoring) in EP's
suspend/resume?

I could mention this explicitly in some comments or dev_warn if any of
the masters have ATS state as ON during suspend?

LMK what you guys think of that?

> Maybe I'm wondering if power management should involve the core code
> so it detaches all the domains from the device, setups up blocking and
> then the iommu itself could power ofF?

I'm slightly against the blocking domain attach because it's a
reasonable ask for the client drivers to be able to dma_map / unmap when
they're suspended, given that most of the modern IOMMU state is
in-memory and the only HW state is some sort of TLB/ATC maintenance. We
can map/unmap when the IOMMU is off and just ensure a clean cache state.

Drivers often want to pre-map everything, power ON just to run their
workload, power off and then unmap. 

That said, I agree it would be nice to have the core code handle power
management, which can be one of the next steps. (it would be complicated
to see how or what each IOMMU might have to handle for power mangement
in a generic way). 

> Jason

Thanks,
Praan
