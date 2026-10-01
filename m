Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE9643635D
	for <driver-core@lists.linux.dev>; Thu,  1 Oct 2026 05:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833252; cv=none; b=g+Lguz4vDB4zjs0UZgzJ/kKRG6fHsjcq/AIJb9/fkhz7MZX7gtsMf0nOhfmqimLKsKM24yu7+qj4taiNDSq4ql6cPdBh2xZ9dsLfMqiIHtTSygIWLRn2DntzgiTYArmnycCxNNNRPWGgVvsrk5YpN9kURrmrl9HgKfi55M0QT5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833252; c=relaxed/simple;
	bh=lof18EAR8koDW4CmD7Ew8X2SZsJqJVY2ODSNxskcR7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhbXoEwVjTDxkWvQ9ghGyNHBdEbt9/zPysM1+3yGDJz3t4mWAL+cfpm6GDMSSsFpV8tgyTMtbtGEg2dUfRz8Gb0F2oHkP1qW0K+0XqKEbsZsOQt2QnpLanVos7VyfmLph518gbUmuvpfMzq8wYnw78GJQ89rnhSTd1BZ/j4wxr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qOULVEp9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qOULVEp9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db33db4de9so21475ad.0
        for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 22:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790833250; x=1791438050; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aS6sOmcWqD+JGmAwtp5t++abYU7vJWrSGj4RsT0KIIw=;
        b=qOULVEp9upjoxtLsfXTRfis4vEhNP1d/QKZ/yUyr/o8jVqHaq53QthovuT1q07hEHK
         9+165mpIUHBAYFNlaLBgierkdKifRW2ZLsFukOs7mCIdXhnrJQ4C6Taad+xe5U8CKiKy
         ptsaQnl/0uizDmRGJeu6hA2PWuhmmddT6YNpIRa9MRjDDM8x3YXXCYHD4hq7eFSwtJa5
         PvEFjSQNsQKzvYC2ouAqp4pd4R34cFgN27H49NRVgYrPzTqc3dE64oUAiOLxVV5m/DB5
         kwe1Dmdeyn6xvKhd2OOVQk9bR/4VsYuhKgxE0oaIfDEjr6bjAQhvJme+JVkFwOcwG9eA
         RAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790833250; x=1791438050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS6sOmcWqD+JGmAwtp5t++abYU7vJWrSGj4RsT0KIIw=;
        b=1wBv1rUimWzEExjMGxs9GI1D12hn55jXEWSiyi5mX5byKGW9rkmszkVtdZz4wWkLpL
         4AuZdTjgRRqJIdRi+tU43RZxRRsuJ0vUH5ZNlRYnoFGvBEWiOkbcYI4qJpY106jK23G3
         Qo8Nf5I4+h6ZdjdQgF353wHuxsNWv1TpLl0Yhrl0vOVBhjw469wWHB0ugGqiMb++gjwY
         FBScttXhMGLVhuONErVVFrEsWwIK5DqYeDlFh6lKF7V5mMSr6Q89eZXeiSBE9hV9KIkX
         722PsiZv7khhMpO+HrzU5PbSDkGWtREGfGrrJ/EDJ4wkQqfl/J4nWSA7sL5SwaleqicR
         g1lw==
X-Forwarded-Encrypted: i=1; AKwUvBxRUp9c5nVrMRleTwBXbXmQgSzGyIvB/fs734Fniie+WLbYb6pvhZqGIPBI8L+RIZ+yrVjcLVe3hlkvQw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJjuFhfBo8fm6Qh1ZOO5RkujvaurO70srdMIiDOiem2wEhkGR1S
	fBk1j00DhOK+M488AU6GYlMZXeroVRrJbSsIhyD5I+YjVonqpWUROY0UxoHzuWptyQ==
X-Gm-Gg: AYBFou0Opn9j9VkwdYCijoobtO1yvXARFDZl/tA3iJVpQRKOxtvIAN5UnzfP0sKBqy+
	9Z9QhYtk/fZNVlb1RL5VCZBARhprnBMNWFrw8msCzFSntpP8maUeoE62KEextxDW9s3vB86uxtH
	A/Nzp0IpxY8qWpRjcDnOkdn0BrZInCuc7TaUyFks+lHXKEm8d7Mpz7MB8fMXwVdA4Gadab9+TSj
	jzCLyo0NX4+JW/tyaAUbky2ZSDigsrGJN5K6klGu1ly4lMqY2FV7w+U0+B+b0H23Uj7leOB7OqZ
	CnqIJNoJ18cHIqAkjOf0w56uv+qpizAMKGUdTzxwZt97ddNo+9maalFhiHI4we2BoWAuQfl8mtg
	z69VRxUB1U0NzPvCXaFPHSLqBDveAi59uit2QPTEoQ/IoyR+0YWrcIUxdNNR53X4ZrOUHkm7p1u
	lL6IflmIas1r+zbM0i+ByxnNHsmQLVwUVL4XjTRMdGM15SIxXtyt8fCdylSLAuP8OOvxfxvQRUO
	xTvBdmSblVAP5LXgSNlPGBxkBwQRgkj9B1m
X-Received: by 2002:a17:903:1acc:b0:2c9:bd54:cf with SMTP id d9443c01a7336-2e301d71be7mr3155715ad.4.1790833249336;
        Wed, 30 Sep 2026 22:40:49 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b6d7a1sm5294465ad.76.2026.09.30.22.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:40:48 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:40:41 +0000
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
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <ar3yWUmi8E0k37Ml@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1yNtr7Kp2OTcDd@nvidia.com>

On Wed, Sep 30, 2026 at 01:33:58PM -0700, Nicolin Chen wrote:
> On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > @@ -726,13 +727,42 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> >  	do {
> >  		u64 old;
> >  
> > +		/*
> > +		 * If the SMMU is suspended/suspending, any new CMDs are elided.
> > +		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
> > +		 * our new indices yet, we can safely bail. Once the indices are
> > +		 * committed, we MUST write valid commands to those slots to
> > +		 * avoid indefinite polling in the drain function.
> > +		 */
> > +		if (Q_STOP(llq.prod)) {
> > +			local_irq_restore(flags);
> > +			return 0;
> > +		}
> 
> Sashiko pointed out this:
> "
> Can this early return cause memory corruption by silently dropping ATC
> invalidations?
> 
> When the SMMU suspends, Q_STOP(llq.prod) becomes true. If a driver or
> background thread then calls dma_unmap() to free a buffer while a PCIe
> endpoint (with ATS enabled) is suspended to a state like D0, the SMMU
> driver will observe the stop flag here in __arm_smmu_cmdq_issue_cmdlist().
> 
> By bailing out and returning 0 (success) without actually submitting the
> CMDQ_OP_ATC_INV command to the hardware, the IOMMU core is misled into
> freeing the memory while the PCIe endpoint's Address Translation Cache
> (ATC) retains the stale translation. When the PCI device resumes, or if
> it issues a TLP while in D0, it could use the stale ATC entry to access
> the now-freed memory, bypassing IOMMU protections.
> 
> Are we assuming endpoint drivers clear their own ATC or that a hardware
> reset handles it? Client endpoint drivers typically lack an API to
> manually clear the ATC, and SMMU hardware resets do not broadcast ATC
> invalidations to endpoints.
> "
> 
> We may get away from the TLB maintenance. But ATC can be the case
> broken by the stop flag?
> 

Not really, I guess Sashiko missed the comment in a later patch. This
was discussed with Jason in v9 [1].

The key thing is that ATC_INVs can't be issued by the time we set this
flag anyway.. if we're in the suspend callback, the PCIe EP is already
suspended, so none of the ATC invalidation TLPs would be responded to.

I'd addressed this in the RPM patch with a comment right above this check:

         * Note that eliding ATC invalidations (CMDQ_OP_ATC_INV) is safe
         * because client PCIe endpoints are guaranteed to be suspended
         * (via device links) before the SMMU is suspended. With the PCIe
         * links in a low-power state, no new TLPs can be transmitted.
         * It is strictly the responsibility of the client/endpoint driver
         * to quiesce DMA and ensure that the ATC state is cleared across
         * power state transitions.

i.e. we only start eliding once *all* consumers are RPM suspended, so
the "endpoint in D0" scenario can't happen.. and a suspended PCIe
function shouldn't be issuing translated requests anyway.

So we can't issue ATC_INVs during suspend (the EP is already down), nor
during resume (the SMMU resumes *before* the EP is made active). The EP
can't use its ATC while suspended, and if it loses power/resets on the
way back to D0 (from D3cold, or D3hot with No_Soft_Reset=0), it comes 
back with an empty ATC.. same assumption the PCI reset path makes today
(pci_dev_reset_iommu_prepare()).

I can add a pointer in this patch's comment to the RPM patch to make
that clearer.

[1] https://lore.kernel.org/all/20260826134757.GK3325090@nvidia.com/

Thanks,
Praan
