Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07421341057
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398273; cv=none; b=WBj3jHEbtF+exPRM0tSdLQLElu835AoVlhdHcLMcnn8TG+129HNEBDuifT7dMvPCS3iRf6E+UdqbYZFY5YdRlHIwu2biQSuxjJ2Da9CObBX3YCqX8uvk8iX7NdByGQLRKGOF/KhLXIxupQvZITToWaZohM9j6ihLeNRhxwHRv88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398273; c=relaxed/simple;
	bh=jts7JT7X0Il7llallqDOQsVcgzR2weK2u2dKxkGtG4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLmZh0ivwa+S4onS0JrjV/NVaVDHmARRRYL2+VbF1yX3OZzMXYI+ePUDRk7enrIOEzrtiQiVXEkZy6UJtPS92uZ6wKVn/nP7WxGxnHvgW2379VLbxmqy9weOd7AHVtTwEfz+ALJqV7QoLlrvDa0xHIZw44Yz8smiX1GJcl91FLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YfRHFesT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YfRHFesT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9f6a16afcso18085ad.1
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792398271; x=1793003071; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jzjsLtJTWVbyke5K19uxcbpg8sweyOiagkfvb9qFUQ=;
        b=YfRHFesTpZlW2FT99IheaqWst0+OlnoQz21+2m6fFvPhajel0sClX0pSdJcpdb/S4Q
         dTBXO4eJ7Ogzjs18d9FmUNcKJZm03kv7fvKVzeRe7BJIp6WbV77LijhaSGD+Sabb2WLe
         li6GZC9xvvttPS9YfuPj+ve4xOcWcVr2JpAA6ofWNPLgp9JieaeAOTfP5CQBFIN9yTRm
         VtWZjyYmHC51UfodYllkoPK7L4YCs4Oy/iY70mDsg+aY6kHcb2JvhqvrVd3knF7f33E2
         3sdi/QkzoQQgCQySTVIAJOh03KK8YwLRaXOFXHHyOx54dJQAVa5sKR52QxiI92BKsHSx
         jqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398271; x=1793003071;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jzjsLtJTWVbyke5K19uxcbpg8sweyOiagkfvb9qFUQ=;
        b=siaHD0KWRz/1p5hVCP07Q9aGbFvDXA/8vFo1vT9PhkmQxnrVzVwgfFkBHdDRwc2lGH
         R/XyV1tUNAXBd8tc5oWH8RlvwfAU01zqRf4m/vckjS1clmHQuJRjgQ2WPlGCpHTOZvYa
         ixhZW1107nu8hFd9HwifCQjY/et7/fc2ZMmB8He1ChMuC9vFzaRiLsiLYkU3RYlKhKmN
         QFU+bbMIEBz4l16AbNWB6CEgdyFdQxcmLnAljdPmeBRhorA/foV8qCwS673Dk9/3QwmE
         OjQTSlaoQIP0hM15zqTqtQnfJfjgE9TP06Bjp4ZnuFhB/rx5nY8rvl63Bv0KVDahnRRo
         +DLg==
X-Forwarded-Encrypted: i=1; AKwUvBwa5ClpbHAPcB+7d6/Tw/XE1s9qBcL+L3nK2c0aMdbgNdBqM6ztaQT5eFpKDYoG/PosSPEgALw+v1UBSg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIBI9Wa2w6o6cSbkNrUYXGnVJojCp+0AYIg1N2GAMyxeQ+8dgcY
	IYIvdbcDA+PK1251m2F7fYM4tPW03+oHCIKuBr4dG/0CKSX34EjBuwHGqdr64xda4A==
X-Gm-Gg: AYBFou02YwN7pCIxCVErgduudBe0tTF3hqAhPRh3sEOGeqCEg6pgISD/EzKsitnSuoe
	m7BKyhdURrPLL3OWsqL8VLgPvqYb5b8NnDlKh8mQM39/YXE+MWDz6z0dTFf/kN9+2lafGvefUl0
	MSfEysmMkhHYQFGUcD7Op7y1XgheSrXeIAPxodv61sEuHtsWjEQJyprsQgpqzSqzlBbYBOLLtQV
	/Xz30+KLb+npxHIp3ZMcXPdnBrqxL7YgVubmqmOr05LHYAUMpYJcIeG1QzDAP7MAeMskH7fsavO
	ZgII2f5afS5CFH2gX8FHt2eqUaiMb6rQezbPrPm9Zp2JbMwMa9RfC+IqkXCsRhq64eOoyr/5Lu2
	EwVJgcT377iJz/RcbggBn3K8sSFLgkdvCzmsgxLxqk6W4Z5A1mUAx3yiflaKyK0yEtSDGHx9iM6
	2G1ejYLPQM87YZ5iP7QsG9kVvDaBj5LAEtimUI9mBmcDjhSenI9vTmVHNZrNmCvL2V4lXeIMEhC
	9XaJgYI+F0G3MrwLJ9s8vq0XXs5WlnnV9mb2f3r8O+CQ+YLUFqABkobnFf+3MATqiOzJ9Cfcfzq
	TSuaDBjGdSYLctmHng==
X-Received: by 2002:a17:903:1967:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2e9b332b4d8mr6656035ad.15.1792398269918;
        Mon, 19 Oct 2026 01:24:29 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc963f36asm8219762a91.0.2026.10.19.01.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:24:29 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:24:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
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
Message-ID: <atXTtaxz0z-U-XSJ@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <asZSQRSYBjbUaaH0@willie-the-truck>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZSQRSYBjbUaaH0@willie-the-truck>

On Wed, Oct 07, 2026 at 03:08:01PM +0100, Will Deacon wrote:
> On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> > queue's producer index to safely gate command submissions during device
> > suspension.
> > 
> > The flag embeds the suspend state directly into the existing global state
> > The flag is checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
> > which acts as a Point of Commitment, ensuring that no indices are
> > reserved or committed once the SMMU begins suspending.
> 
> I'm not familiar with the term "Point of Commitment". Is that something
> you came up with? Without a general definition, I think I'd prefer to
> avoid using it, especially as it sounds like something to do with the
> Arm memory system (where we already have architectural terms such as
> "Point of Coherency".
>  
> > This prevents a situation of "abandoned batches" where indices are
> > incremented but commands are never written, which would otherwise
> > lead to timeout during the drain poll.
> > 
> > Update queue_inc_prod_n() to preserve this flag during index
> > calculations, ensuring that any in-flight commands that successfully
> > passed the point of commitment can proceed to completion while the
> > flag remains set.
> > 
> > Suggested-by: Daniel Mentz <danielmentz@google.com>
> > Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 35 +++++++++++++++++++--
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  5 +++
> >  2 files changed, 38 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index a123810fac57..7f89e2306942 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -218,7 +218,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
> >  static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
> >  {
> >  	u32 prod = Q_POS(q, q->prod) + n;
> > -	return Q_OVF(q->prod) | Q_POS(q, prod);
> > +
> > +	return Q_OVF(q->prod) | Q_STOP(q->prod) | Q_POS(q, prod);
> >  }
> >  
> >  static void queue_poll_init(struct arm_smmu_device *smmu,
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
> > +
> >  		while (!queue_has_space(&llq, n + sync)) {
> >  			local_irq_restore(flags);
> > +
> > +			/* Avoid waiting for space if the SMMU is suspending */
> > +			if (Q_STOP(READ_ONCE(cmdq->q.llq.prod)))
> > +				return 0;
> > +
> >  			if (arm_smmu_cmdq_poll_until_not_full(smmu, cmdq, &llq))
> >  				dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
> 
> It's a bit grotty to have the extra READ_ONCE() here. Why not make
> arm_smmu_cmdq_poll_until_not_full() return if the stop bit is set?
> 

Sure, it already refreshes llq on every iteration, so I'll make it bail
out on Q_STOP(llq->prod) and have the caller loop on !Q_STOP(llq.prod) &&
!queue_has_space(), leaving a single STOP check right before the cmpxchg.

> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > index deefb17e31eb..794b258550dd 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > @@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
> >  #define CMDQ_ERR_CERROR_ATC_INV_IDX	3
> >  
> >  #define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
> > +#define CMDQ_PROD_STOP_FLAG		(1U << 30)
> 
> I'm unsure about this. Bit 30 of the cmdq prod register is RES0, so it's
> plausible that the architecture allocates that bit for something in future.
> For example, if the index field was extended, then I think that would
> cause problems for the driver.
> 
> Do we have to put the stop flag in the producer value, or can it just be
> a flag elsewhere in memory?
> 

Fair point, but the flag is SW-only, i.e. it's always stripped via
CMDQ_PROD_IDX_MASK before anything reaches the HW and only ever tested
via Q_STOP(). It's the same deal as CMDQ_PROD_OWNED_FLAG, which already
uses bit 31 (also RES0 in SMMU_CMDQ_PROD, IHI0070 section 6.3.27) as a
SW-only marker in llq.prod.

Keeping it in prod is what makes the check + slot reservation atomic in
the cmpxchg.. with a separate flag, a CPU could check it, then suspend 
sets it and samples the target, and the CPU would still reserve slots 
beyond that target.

Thanks,
Praan
