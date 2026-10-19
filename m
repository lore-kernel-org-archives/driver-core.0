Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035F490BFC
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398327; cv=none; b=Iun/FOeg0ZDbT217A1mUvh+Jx+jmVD3SesV+Nc5FMcKt5ngrFkTgxlRi6cpO5CxBfAquk2rszkb1K+ukefhGn4k9Kn2djHYMxpbIrDgcl3Ij/PjjS77iMHBmmItatzfyNgqAfH3Z7rPOjmSNm2jgDK+VvminoqFFjawGcx4bEfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398327; c=relaxed/simple;
	bh=7j1FjvxzuKjZZZjuEe5PbaUUzNqOVbHpCzh8Twzsigk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyYwXUBylYQGWy7HffXh8iG4NmYQEn2e1dEY9i44CXQl+X5ZZT0uj6c+DlS8c5gVfIjn1VqdZQHRG98EsQ5j0QNWlDI9TKoh9VhJ0s4wwGEXegnLHu485FSC5xndvHknadc5qlhv2V25UTcdBgJMZyq8Ia5H2QW0Thv1PZN02AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EFJI9NUy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EFJI9NUy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9f6a16afcso18235ad.1
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792398325; x=1793003125; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zdvEr7CMGHUXYm14SkrvOmvdQ1yeNQ3r2FisQDvIWDc=;
        b=EFJI9NUyogyZunHp0HFFL+fYZPDjSaO1hNg1gatpA3ZyCxalJ7Vx0rW7dqLg4KAQCd
         fnX6AaWg+7W6XEe740t6knDq1lt5cnF3dgkPG7uAn1g20bPyUIHhiCcLgxCQb+58loiu
         NQv9KE+WgpJWfsc0AlEbIILLmJsj6fqZWO07cV5XMDeqnKtAHQIqltoHy64/nSxUMSzt
         PJ/vdYZoXLFGqlqLbA6Juq3uS2ML88GEeodjRcA298cACB+sqb+ViEkjawDKmHTDoWL7
         nR55i1OGt+0UUL0cY4M4346iUgcAuIvZWXRhE3x2XEOf2Y7Ro1TBgxJCCUwhQKeDCZtj
         KTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398325; x=1793003125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdvEr7CMGHUXYm14SkrvOmvdQ1yeNQ3r2FisQDvIWDc=;
        b=TFhpq4rstdqCx2h9XcIn9VjcQ9dxrtlkUmBTrO4AaKIlv33VVlsKTzcOZ4q6fvZTMY
         x2/SfsKDC2PGQjSCP1EplOx20AqFmPXW9GUvFHDvpd7IRQjuud0jPlZqN6fmlIeV5g6j
         yGs1SdQKhtCjfT+dEdj19V/HSr0jIZatt6x+Vle2O0TCUIZUdxgazEixVBmMINbyUx4+
         U+8PoKhjVLtranWscwY0NWYlvktWjPWNnHWfssEs3dqOpuxIlMOL8biChzvft2nIJC9T
         UyO0tw2JtGrSaIDxsMjAr9ydF+6kUmqHHBsyVNLQZkAik1bqYK0b1I/TRK6nYQ97YeEg
         UBfg==
X-Forwarded-Encrypted: i=1; AKwUvBypaue4kP8IKxWkXc1AqGOaSna5R5mqvAkf1Zgs2d0McsgDiDt6Qp0LH5DaBuqmvGBN6htLhIMTK2x5XA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLNcYndJRyIbFxietdO7BKaZJOs3Iz48AePte/vSYGzaxIdbFET
	WZb0M4GJ3WoF3ovMKD8yvkmHamqWeRawaydPADwRATLxUWN7wNazOT5bMMq4wZQcOg==
X-Gm-Gg: AYBFou0HsjnCtKK5fCHnTnwK23vWJGIJ135MoMQhXIftH22+tXyw7mgZImt595MlyVU
	Fl50tBmPVc/4crey/3jShgFNPoiwJ+ElQQHmu/zgmHmcqhI1nmOgFbUFG7TCl7c/bw1e/ajdxQE
	SdYpi4eglgg7a+LdtZVeHuq1wFcWS8WbnAdiSMaGFrgM1e656LUA1DhiXP9Ahib3yoWX1xIg+E4
	sw1w3MwZvfN6BpQxVCNgvzfS+9xxUsjsibm3z2NMCFwosOZnvHpHJGvnlI/84XQ6CP9Tsd+oCRP
	LNb9GEIoA1NvzaaZw8QncdVRZxfh36IIpiR/LAmwFeEVXDtuYUA3qd5XdNkAxZNyJizujm7VSZq
	z3YU52jFwO6snU4yDcKUj2AA3LSLeqfDgbvnI8I4OF3bmdsfMJVYqa1cNCeyz3KJKvPGCaZi0D4
	sCIMolTFU9RHa+U5/Ab9hHMaq1UJiBe8GX6cXNPz6Gc26uZCbMRz18YosCgIN0Uc8Vi5UkjMFow
	Df27vaLNJXEdoMiH/T680t56GExGMAzgbWNYZw/XT1bmvvtKrRNtnmSdjr88y5+7h2/HAummN6l
	O62knKnk30IgVxININ4L7vg9928h5dUWTq8kBY0=
X-Received: by 2002:a17:902:d506:b0:2e9:492d:f1a0 with SMTP id d9443c01a7336-2e9b332b549mr6191375ad.16.1792398324879;
        Mon, 19 Oct 2026 01:25:24 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm19384883a91.12.2026.10.19.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:25:24 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:25:16 +0000
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
Message-ID: <atXT7FtKrA2e1f8Q@google.com>
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

Ack. I'll re-word this to avoid confusion.

Thanks,
Praan
