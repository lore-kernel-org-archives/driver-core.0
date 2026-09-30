Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA384D4888
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799480; cv=none; b=Ixg4q+Tmb6wJCIkx1jez9CCx/v2+4/giw+9C2csrSzlIRWqKWATsG2vH+TotpaAX9TGbhwy57dkAdc84QEzGN3rXVge8apIz3J0qCpCKqHlKBu74RGfCNNx+KWN/Wt4TScb5Lu1x7JPhqulwqgk5O9KKOrbMiW7YcWH6+2ajGNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799480; c=relaxed/simple;
	bh=LuC1yxQciN15Y1owFlOie4N8M13gYNtvgRSiulcTHP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ad7LkDIaAv+Yi4I0NIgk/Ak7WLXcy6nGjkNeDhy+oacb+8UDq1BAZObSV66jC1rH6LoBndbKJ+he1SZiudV1EGamC8QfUYOMNeaKVpUEFrDLsPLMOKYuRPCHerO9Yk44ftp720qMKj7COrWHZdXeXGcSuzFZGipat4HjKSZMKSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AshgwPNl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AshgwPNl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e2e4ef20beso19505ad.0
        for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790799478; x=1791404278; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PHcKhVSnEwqoc+1KLjRnxGF2Mva/GHzPrgk/jJQDp10=;
        b=AshgwPNlW2MAZsRZUDYp55mki7aIBXIn1bpp5U47b/C926wBwyWT/4j/lguMH1ehmc
         EQegjnc8KELc5l24yOCOMvnprUdXbn2Gy9LmPlVXDdIdWx4vRldY9XtGaIkQ0r07C+WG
         ZxI5/++peNwMAKpeWpft9XfoIV8lPi2SuTurPvQCj3sRVSnrUDC8hWes3yFHTxm42h8/
         lVpCKInd1eztPxjB7KE893nDwxHBxsBVzXYBvPSgI1H/vPBwVXuKutZpdAj7N690cxr5
         U7JW58wTQbsfwPSZ6aLfDkH/QC3+30aoNhHURDtw+hlUznDGYCFZSozCFFsKYZvbZku/
         Rlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790799478; x=1791404278;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHcKhVSnEwqoc+1KLjRnxGF2Mva/GHzPrgk/jJQDp10=;
        b=TSkV864k+mMhyuzQStkGWCLQDJ5gslyRYOhUidjcN2mjLOKs2eahrmiqPn5eJTgK6T
         It5pGJzNjqscHVHF9a5heMv8InmsKXhWlJJubM42PWVS3dPH4iCnTk72oCmQNfDkAmn8
         MdNgfsq6vTRk1zWTfDyovN7/U1TtO3E+Lo2gB70AvPQyapgXnmTHs6MuVFvTJPLIFY5O
         2DPUdsjVGeo5SJTl7R4z6NStL2tIHzUBSPxMyOylKulFJ2FMSDE5UrQh+GSaQzvuF1+6
         DQdoG19RwoA4MkVKKJ4o6rCLKX6dLS2D7rKxi9CrD9ZL8HTEBY6SZcF1YlARciRSSxnC
         SaAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPn7BLrNOnuCcCSUGCitzkXNxEbA7wYv8C1dXxtzRk5EPHWUb1qd4L6GWmnAtzDLM5LHGAlaKFn4/msA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKHrgXpxQAd7RjEQkwEQkBuFC1fJ45hDp1nccDWb/rU2H/4/5Q8
	EnhEzCeibWl+AR3V7e+UNiFDXXx9MFKa3jtvpOl0sawfcUo6Jhjejl7dBRvdFvqOuw==
X-Gm-Gg: AYBFou3S0H7KNgJ8bmetwbl8s1U0xb31o/yz2hWg3q26CC3mQWx+VnPmIdfwvBxTuVr
	U6XGWouw1wIvam9+yXsBJfg3W4LBiYQZF5KUisH64ZptutUcIRjmPU4bcsy+7Bxp+Z4/PO7vZvv
	XaOsAThnE697DLxZ1fr+NdT6qSIHpPHbfuPalU+ps32d1Yjr7RmK9T/j6u4FYVy5RqxW4rz5CBf
	CtUnQcavCSVYubtCqt42u1OyLLhhCCCEjbuIiw8JK9paEgi0hckdAYfHWYYvdr1fmgA6Fcyx+VM
	bFzgyDrBssWkvrdISkn20XArNN/YVi06Cd5RPvkCdzQBIIcxn31xwC8sMA53qNpscKlZZlPpvhD
	k5MV6km4GUGVOeBYjHqpgGLHF+qWuZ2L6HbLvknSeSRIXFwwffQun/5GmxMf+8sTZVG6Vl1GMO3
	8jsClD8b4Iojny+EbTxUHZcLA2fgboE/YONOwFQvFyzSnl0eJjFLs9q7DWWLioCBi6A/5QbpLvg
	CmnWJFsHEgrDp8WVNrMbxI57ASRmY2p+YhUr87EOLyh89qv
X-Received: by 2002:a17:903:1a03:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2e301ae27ecmr1354315ad.1.1790799477609;
        Wed, 30 Sep 2026 13:17:57 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300af8560sm2018515ad.46.2026.09.30.13.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:17:57 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:17:50 +0000
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
Subject: Re: [PATCH v11 03/16] iommu/arm-smmu-v3: Add arm_smmu_drain_queue()
 helper
Message-ID: <ar1ubp2nHdRIXNEn@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-4-praan@google.com>
 <ar1T1ecOPXb6JSPc@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1T1ecOPXb6JSPc@nvidia.com>

On Wed, Sep 30, 2026 at 11:24:21AM -0700, Nicolin Chen wrote:
> On Tue, Sep 29, 2026 at 03:44:57AM +0000, Pranjal Shrivastava wrote:
> > +/**
> > + * arm_smmu_drain_queue - Drain an SMMU queue
> > + * @smmu: the SMMU device
> > + * @q: the queue to drain
> > + * @until_empty: target selection
> > + *
> > + * With @until_empty == true (for CMDQ), exit once the queue is observed empty:
> > + *
> > + *   cons0                cons                                prod
> > + *     |                   |                                   |
> > + *  ---+###################+=====================+=============+--->
> > + *                         |<--------- undrained==0? --------->|
> 
> Jason gave some remarks against this API:
> https://lore.kernel.org/linux-iommu/179018862538.3334538.17643821143626392419.b4-review@b4/
> 

I see!

> So, my PRI series would drop this patch. I suspect that it still
> has some value for the RPM/CMDQ case, compared to a busy-waiting
> alternative. Yet, it probably should be simplified for CMDQ case
> only.
> 
> In RPM case, the "prod" would be fixed/stable right? IOW, there
> should be no new commands added to the cmdq, so it only needs to
> wait for cons == prod?
> 

Yes, that's correct. By the time we drain, the STOP_FLAG is set and
we've waited for owner_prod to reach the target & cmdq->lock to drop..
so PROD is stable and only the HW moves CONS (same for the lvcmdqs).

I'll simplify this to just serve the CMDQ in v12, maybe just a sleeping
readl_relaxed_poll_timeout() on CONS until it matches PROD..? 
I'll think try to see if I could repurpose this too.

Thanks,
Praan
