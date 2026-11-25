Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614139;
	b=Z92HAH/xI+PT73HaKPXtXJ73YfevMXgMRgCOYVHscKVMLfNwwJ0pOHqkMEh5RcctmQ73
	 yZz5xIgdORClDB8eeWlbbdvqtsm3oIJv2SXTtLnCRC3HDBhPDQpgtnUXv4S2F52krrNEj
	 F1/TyPsAuGFzNG+8mvlsntmACrusE42nwMTY4s3QmoQUM7pZjhfVJLqu+re06ejKTzzBq
	 X/JvJe5+Roto+FYX6Tgw7CuP5ErCgaEvFT9IBcT8ZUezsc1U/+0XLCcfttV7+5OJd+LGD
	 fVviPsKmkrr/REQVvObAUq84Wr9YlL84Do0FKo8MHv4VNgArkGOA4vieLhg0aC7G29w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RgRBi4Exuv8nq+VhlE2oQhamCxOtxwj2AD7UWFn0Grw=;
	b=I7vlvfvw+iYvhIprjjIbCN/jTKPuI7I2HcUGHZsvA25Z1aO8TTHKkM1nFViNsluPTnCq
	 SVc4ksdry+v8rOjUqoNScFgxmnHaQ+ilvsn8uB1IRqB4wwBpNy9blLFWOuz1Ip9ciRFz4
	 8+cBsJez0F9CbIcX/vEmoYkYl8LQWZUJZyx4alLO8Um/VprdaR/feL2Kq3HmHK+3yigqA
	 AYzXqg9jeKo4zK7SqTFHzvIN6Jx8N7TSesasHZIjcf8BTelygZOSkY2psUJXJRHmDooRv
	 iv39Tw5AWXquKvoTm0+k6ZFqlUQkzNmf+1CqRtCrKJI/ph9WKn367AZ6S43GB94M24Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ULv3ei0r;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD7606A31E
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 13:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3DD7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ULv3ei0r
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-150ef97e790so35157c88.1
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 05:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795614138; x=1796218938; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RgRBi4Exuv8nq+VhlE2oQhamCxOtxwj2AD7UWFn0Grw=;
        b=ULv3ei0rjjLg7PkmwKQXqEuWrqf5Bc85ayJvGpSoCtzPQDf+GfnBqk0OWUlhoj0Rx5
         hOvsfmWQpJCpRcY7eu185sZGpYEtfGbhyeKYunkWEjUEh8f+SqLLJ9CDvEihEyv6GfkI
         vNrVMpWZRIrMD6oPMSyz/RaWCzm+d3LcF38RjKBoBosr7/QmGbduvxfbLG0tM8SmNjEM
         Ui/grtjpZVlMKNVJEcjveWClFyNhbCwxDWPfLN9J1SLJaVAibup/sxgiTq11z/34j9a5
         +62td1NKYRLBIsgGSIBauo1w6Ge5GhTE7RA5wlAvk0aOuM86ljzcDLFhj7Dp+yuwgydY
         KTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614138; x=1796218938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgRBi4Exuv8nq+VhlE2oQhamCxOtxwj2AD7UWFn0Grw=;
        b=MgBTu49qLuUuwKFoQerCxouJKnLHn+bejD86SGKItjj6MWvhm9pCvXbhtBnYP9ZfPU
         G8oclmJsE7eggOApyrByucN2ArL/f5NT4JtA6SCrsjzlkOvvrykexm5NcuQWYShbd1XC
         MnodCHsdF9OmOZtUnLmzWI5lrQKDAHJYjkCzslFj722PaNDJGNJZYGMBNJMUaMul68b+
         zV4X03SSvbH5Zv7P9SfJAwlbK+yC30Visyazqb61yzx3A0gp+2sVK5Ou62Wm/NoDOBvv
         u+o4cIhCn/d+wFxVyoF34smCtO7iwAbomrHTbj3RH1t1VK3BZtDTVzHs/jM/YUnGcyLw
         fpJA==
X-Forwarded-Encrypted: i=1; AL+hErELcEFEsrZO/OVY6sn2kSAyg3al66QZUapIVwxe4HdOKSX4CoRaVuUWYLwJdupCpaVjed4FnUuW6Zq2Xg==@lists.linux.dev
X-Gm-Message-State: APuU4Z95JgTHdeFbyCnqFQX4CtJZl+25ZL4kl8olACxeePxVGYyXIw0I
	0Gbyfmq435W722JBNLYUWzfEFgzuIb5KSjlC1rJUx/D+WXfkcUaKypCNPkth3Cd8Tw==
X-Gm-Gg: AZFdTZcf+NdETNmjyWIZTqG/FacBb/bGQkO9F1IRAo9HWTxbXj4vOKB+8Du5O5jydSS
	JhrNVnrdY0r9kfXGO6oBG26xQGKBZjaUu2wo2B+jwTVfNWW+7S7gc0FyKc01qfubo2pc1lSS71X
	a5Dr4/zvUEtJURhx+RJzIQpHGUZ10cOvu9d4SNNb4sYSNGGvskj00puSJcxiwSPdoMSmj2OLR5y
	rgZwi3J9NPG3hdKqI20XQOCRJ6YIk8KrFLAWoxVLkaHOcUiFUstEXX8VsSk/osNDha9qP3K4Tjg
	DfBt2YlVHvuKcgu4SoOTDS0xr4mKF46CT2Qtfid5wVg4P7JqEmwaGobVCG8DMNTDlKuKcZEnJfd
	uNgK046PrEyAWiflj1Y8Eg+8RAjmM58KIj5mM/ZrN8Ap8ukpJxzqgi08TmR9+F/4HrnNS8LWcmy
	tcj6XiV/ZTHuSPQs5H+dnXMOts9EsdT2vM5+47cMZKkQl+/SnRhoXgiDinl0hpkK/lZ15tSajuf
	HTDEzBHTpggxRUjPCwdKAFOEkXixhfs/EZsgnv52bDAUAJNVq4rbvXskFK5xTccXBWDNOwf0oDQ
	19zB1sJZHJlfdgh3hhxMJ9coeYKI10p6TmIwJY2zQWIyn2Ze1mefmfNayTkR9zcEp+E=
X-Received: by 2002:a05:701a:cca2:20b0:1b3:c4ba:8e0b with SMTP id a92af1059eb24-1b56338d12dmr4008785c88.2.1795614137046;
        Wed, 25 Nov 2026 05:42:17 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm61787393eec.26.2026.11.25.05.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:42:16 -0800 (PST)
Date: Wed, 25 Nov 2026 13:42:08 +0000
From: Pranjal Shrivastava <praan@google.com>
To: John Garry <john.garry@arm.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
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
Message-ID: <awblsA9PMu4jwd3P@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <0fe0d909-a01b-4f4f-9faa-c533b8925f25@arm.com>
 <awRDwxkrZjouy9b9@google.com>
 <f0cc8236-d06a-4f2d-a9fd-e60977017979@arm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0cc8236-d06a-4f2d-a9fd-e60977017979@arm.com>

On Wed, Nov 25, 2026 at 09:37:02AM +0000, John Garry wrote:
> > 
> > > And it would be nice to not add extra logic in this loop. It is very timing
> > > sensitive, and adding extra checks can increase the chance that the cmpxchg
> > > fails (bad for performance).
> > > 
> > That's a fair concern. A couple of things here:
> > 
> >       - The check is on our local llq copy, which we've already loaded, so
> >         it's a bit test + a (not-taken) branch, with no extra memory access
> >         before the cmpxchg.
> > 
> >       - Per Will's suggestion, I'm making arm_smmu_cmdq_poll_until_not_full()
> >         bail out on the STOP flag, which lets me drop the check at the top of
> >         the loop and the extra READ_ONCE(), leaving a single unlikely() check
> >         right before the cmpxchg.
> > 
> > It does need to stay in the loop though, since the cmpxchg is the only
> > point where checking the flag and reserving the slots is atomic.. a
> > check any earlier (e.g. in arm_smmu_get_cmdq()) could race with the
> > suspend path setting it.
> 
> I just find it odd that we try to elide commands here (at the point of
> command submission). I would assume that any commands would not get this far
> - or even be submitted to the queue - if at the point of entering sleep.
> 

They never actually reach the queue: the check is right before we
reserve any slots, so nothing gets submitted.

As for why the check sits here and not further up, we did try that in
the earlier versions and have converged on the current design:

 - v1/v2 [1] elided at the call sites (TLBI/CFGI) using
   pm_runtime_get_if_active(). That raced with the RPM state bouncing,
   i.e. a caller could see the SMMU active and the suspend could kick in
   before it actually submitted (as Daniel pointed out).
 - v3 [2] tried to fix that with a new pm_runtime_get_if_not_suspended()
   API, and v4/v5 [3] replaced it with a driver-side biased counter
   (nr_cmdq_users). That worked, but it meant an extra atomic on a shared
   cache line in every command submission, which isn't great on high
   core count.
 - v6 [4] replaced the counter with the STOP flag in prod, and v7-v9
   [5] dropped the call-site checks entirely, leaving the CMDQ as the
   single place that decides.

The callers themselves legitimately run while the SMMU is suspended,
e.g. a client unmapping (or a deferred unmap) while it's off, and we
don't want to wake the SMMU up just to invalidate TLBs that'll be fully
invalidated on resume anyway. So these commands do get this far, and the
only point where "is the SMMU on?" can be answered atomically with "I'm
committing commands" is the slot reservation itself.. any earlier check
is racy against the suspend path.

[1] https://lore.kernel.org/all/20250418233409.3926715-1-praan@google.com/
[2] https://lore.kernel.org/all/20250616203149.2649118-1-praan@google.com/
[3] https://lore.kernel.org/all/20251117191433.3360130-1-praan@google.com/
[4] https://lore.kernel.org/all/20260414194702.1229094-1-praan@google.com/
[5] https://lore.kernel.org/all/20260527221407.1756491-1-praan@google.com/

Thanks,
Praan
