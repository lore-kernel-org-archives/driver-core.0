Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D23E4F96CB
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959673; cv=none; b=XQdJ5CqxtB8DpeOWTmB8vhx4x+AZvm5QaNFjDUUBqqgsG05ik72dwGkFDD9D48/+1zg01+2CY72EpHWQ8rIgWjT9KZNVfzNBE8Ew79Cfzkt3C+VS9qH2dHVXSwBuKj5BJ46HbeNF0/DBH2VTQazihtZgnpU4VoE5+YGi3h7BzFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959673; c=relaxed/simple;
	bh=GfLGRzNdrUQtKcYv331zMoj3Gl5JEVaaZYE2NszLXF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZlEhYpE5HKeE0SR7MVAzaDob4LyiVZc06WAqWPcv10heVo6d7bmRBscW1/G0dPYenZGltaLFFB1frSMNhhDrKO65M1vxSzFlovb575KtYfNiy/oWfG2fLJna4/41gTYhnezuKAWic4pVB7dL88JIVzJGjuM+IqIYFlVWBh3DBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VUXVExKJ; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VUXVExKJ"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04edb5so2117245c88.2
        for <driver-core@lists.linux.dev>; Fri, 02 Oct 2026 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790959670; x=1791564470; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8FgFfsrFu7NaKoGhtbGJNDz2Gwi+BLzqOzLKsff8ag=;
        b=VUXVExKJdzjwxxUASQbA0olS6bdDtGiHPSVI8fkGytb6GlUpDko+osshnn8BB3MITT
         W0QMjNGdx9E9FYaDTVje3/HS47Z3QA9S3uVrkXiBgjXGhVaUHaOuA0La/FeMR6a3Qlz2
         4ty1exHbP0rY0MeLeIn+OERCcNDwELIp8535HamLsU7RyA0i5eI/MZHqVyxw9n+R6Lr8
         YwpSwL8dfW0im7rnAjO/eb63GbxAWZZaaLeULGKLPY59umRWeNxXaAKBatmGIKckdzLh
         1TyhCE7+dYs6DT2YdqOfOx7jOar+gW63UPjfolRKpPya1oXIz1w0MEsQlyTtxl5ZnsYj
         i/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959670; x=1791564470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8FgFfsrFu7NaKoGhtbGJNDz2Gwi+BLzqOzLKsff8ag=;
        b=yurJCHRS0yLmUOpeD1u7L8uIH4Xp6M8QDm87kc6JlgCtB8874yRdwfqxnd3iykWVRp
         mB462EvCYLH9DoNNIqYL1TTcgB/rLqHmLABCIufJWVx8ulXKG+udnOATcE9jxYeoWusN
         DcM7I+pGGUsZHrAEL18rFCbZZ4sB/VOny0eDKz0rdek3sTIQzZKlKePcgF8h/CRIyJAg
         njK0Q0+UUpuLwLHnPytSHe34Ts6qTNnIAGS2v6StqFqjI6v+lpoWT2KHoMVAKXF8j/pJ
         WTqWLRZao+VLm6Qlk+knEZXKstrtw01ivhEvdoh4qF2ZT4f+HudV3wZQqcmX2iZsDDq1
         NfiA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ2YOkSSfLdolvXMM3KFQ+YnxT10qlPgHfm6CUzcAviwPKOe+YoKyRb8Ia66HNaxoxdIZXD4e69axA2Q==@lists.linux.dev
X-Gm-Message-State: AFuF++k7oyGh115irLO/QYiu11FyKDZECho7gzbKa+t0yzcKa8t9BGQp
	4K7+RtLEoBbkJiPvZR38KSBLeYk3NIey2OWrDh87g3khpb6B4nzFor8/7aOijJKU/SE=
X-Gm-Gg: AYBFou0aTvv60N2yZ99uMjVrLAb3BP662mGylwnsD7sYywZEZ0Nv96mDxj/6bKVLawx
	f9/aU+MF1nKXZv38JcMHcDXfsGIuWDPAjY7p0Y+LbgKvqA5ySJqUO3PgDDgpAUpy29xTQe2ZPbT
	MBU6ivyw41U42tk2m1F+9KOjPnkzIHlYC4+ieKEnpO0VWesNVXT67payULLzAkJsacVvrtxIKkv
	W3hJUX0n+6/kCv4ZV+xe7iXPlCWjd3zxvWYqcwuN3+c2eaesFNpySMU30j+wYmOrYq3Ei1cNuNJ
	f9Lqqu/gHstOmLW65VtJyr7YLXA+08L1RqkjPOQUUlx5jGp/Qm/opEN6fjFYs2QrRmh+/2m4Y3k
	64meuZ+g0aSp20Fi9LJPFjbhc4Vy0sqboQrm/DbtkGu9D3KkwJn/5cIwL48TgM/wH/ISssIQFmP
	PH8GdMyLDTK+r3Y+I2TFKqLTbkLADLlQIEr0Z0Suv9XLnh
X-Received: by 2002:a05:7022:5f1c:b0:146:852d:60b7 with SMTP id a92af1059eb24-1508932185fmr1788544c88.8.1790959670092;
        Fri, 02 Oct 2026 09:47:50 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fee0afsm8489793c88.5.2026.10.02.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:47:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xCgQG-000000008FP-19Pb;
	Fri, 02 Oct 2026 13:47:48 -0300
Date: Fri, 2 Oct 2026 13:47:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev,
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
Message-ID: <20261002164748.GD3481470@ziepe.ca>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
 <ar3yWUmi8E0k37Ml@google.com>
 <ar6gY9grmdMZcN/M@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar6gY9grmdMZcN/M@nvidia.com>

On Thu, Oct 01, 2026 at 11:03:15AM -0700, Nicolin Chen wrote:

> > So we can't issue ATC_INVs during suspend (the EP is already down), nor
> > during resume (the SMMU resumes *before* the EP is made active). The EP
> > can't use its ATC while suspended, and if it loses power/resets on the
> > way back to D0 (from D3cold, or D3hot with No_Soft_Reset=0), it comes 
> > back with an empty ATC.. same assumption the PCI reset path makes today
> > (pci_dev_reset_iommu_prepare()).
> 
> In that case, would the STOP flag be too late? It's only set in
> the middle of the SMMU suspend. So, an ATC command (via doamin
> invalidation) might be issued prior to the Point of Commitment,
> which will be timed out due to the unresponding EP?

How can you ever fix that?

How does power management really work, is it expected that the end
device is already quieted by its driver?

Could the first step in power management install a blocked STE? Then
we don't have to worry about ATC desync and that automatically stops
generating new ATC invalidations if we go and detact the domains too

Maybe I'm wondering if power management should involve the core code
so it detaches all the domains from the device, setups up blocking and
then the iommu itself could power ofF?

Jason
