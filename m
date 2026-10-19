Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FDC3DBD41
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397968; cv=none; b=LLfqmjmio4fnzNXAIxxfGmtptCCCZ91bmeSsUo5IWZHw507KM9ljtx926lnlifDapVTjY1ycsaOZiqk7PbQC20YuoosbygDHFxC4v7ycXCrkxrKtazFUIv5o5kB/+O+Cr7dDKYyYJhjOrLBSuh0paJwN4xrPnw4EGCKB5wnka2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397968; c=relaxed/simple;
	bh=4YdSqPMQ3AqrylMN6xPYkljWBceL/O9a6xta9YhYWKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEmePn5VwPVFMcNRlXljchPabh/hCeyDNX+nEH4lAgQrWXwfS0nP4tHISq3LNOw4oiJ145MKMr5Un/8RAvu46YdxCw7ktcgLvLof9RVH1xeSQw9ipqHYI9u94IY3bxtk+xEdKNc8+NE+ex2FekEkaxcQlgKdY6x4LR2qu+DPUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aK9WGkiP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aK9WGkiP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db33db4de9so68265ad.0
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792397967; x=1793002767; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJdZXHdbMv74njH384nYFNZ44vSOhnp4TPEILn84FiQ=;
        b=aK9WGkiPkp+BZBw9pzrEVOtZqbv30VWXDcbqJ8cnf1I0iUIXSVjO+rjxii8/RA1VKT
         Ei6zE1CJR+P2CVZPvBBMZ0nqEpDDZlCm2NOxh3z+xkedRFBp3nNNtVa/lt9Ah/z0/mjc
         dZydYzQ/zGDbXbqiYCmReBDnJnysVTlfNSrd+uvDrWJsuOrPRRHoV6YaiORxcAerHxwN
         T5CtWQZwb1WYDw6VJUrhJbm2Aqkeuz+qIlMfbh1rLp8vUtTIFrIwEwrBDdVbUvxDcR2L
         NEtraTeqNbA/hTGxcLYef8MD/Vm5obNrkFKuheh0TLn8HePdeCXQL+RCMT3X5mSu353U
         RxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397967; x=1793002767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJdZXHdbMv74njH384nYFNZ44vSOhnp4TPEILn84FiQ=;
        b=CBYqBSFvSxKUdajugYuj2YddePupy0U2o/mxqD076dFDqPKsTlYenBFppWjOxq28b9
         LjRZvzfR2wK0pv/qvNH4fBBJ4x9UbsA1i7BuuHuvVneh9QuU1v8AtRxj8CHQxk639nBp
         orTSn8MIfT+zYKe3284fW3YAS5MByyXQ/RQI2ubeI/BNLBr/CxkEZruqvMzpVBxP7vGj
         3ULnCdgCw0BGc25A8yWZBD/eeqZnVo3TNTSMX6IEZUm0ttIE4V5Ie/c6EIpF/GB/SAir
         O+f44a1sP/csDXgFj+gyP2G5VrSqa3FnXE1kz/uteDTdzQQQBvbB7/LekE6qykkja1Mn
         bdRA==
X-Forwarded-Encrypted: i=1; AKwUvByMU3ClzL/XOtmgn2d8D5056+/jabDQ6apaVueM8sF6BxmxRkQO8KwTbRHvCZnhAvSPPMwGup3S+kVCrA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIYrsXZeVRtqzErklXM8WGZ9CVgVDNKRRE1OKNpPaAWVYJgggS5
	GySJcfYCU2CA5g6d8twCsopRXp+YayImKQnD/48EuLbz3K6hcKJd1BtV8wuLVbIujQ==
X-Gm-Gg: AYBFou02Y6MTd6/c56QW/fmx5aTA9QWJfeGtLjrV6lw6Oyv7ZAXMqsPZVOv3DTx/EDr
	TlCOeBpamcn74ew04YwkY6J9Djxxr7s/IiQOX/xyzroMPlDtr6ZjDSTWs1sygpra4vOudkUn1Az
	miKI1JIlewUCxAKZMa27VXl5TlQZGyGT48mHscduUqWHZmMIjvnr63RK8sI0yFTmUaTI3XsOKhE
	B2peSwTp+nMGnLA9QoeDG5WgK9f9b4XBuAP8t1DQMwU4XYsyY8vdd6D9Om/arTh8/0zONHJ4N+5
	cuw4k0YcD/25qyAQUA4RV2GdqaMrY4vk+B0rBKo2PC8Eusb6HMKYQEwPV/g9zz+JMduOGYei/hj
	80VIqtjLHpvoDG1gZOE0DlZcm9CPRh7EAxAV0/faEXg8AGA8FAMHoe1FePbZ1GZB+AN71U8qdu+
	P1H6Yauk5Sh+kGiuxk820IoP/ibfQeFklRkmB0PJO66Y5O6bJI04IXORndGCtstSFe8bTiAsjJQ
	12eTnPyK0Q81lyFJVbmetpbDBr1//AsKfd5
X-Received: by 2002:a17:902:d2d0:b0:2e6:12af:5b04 with SMTP id d9443c01a7336-2e9ae497cc4mr6838265ad.0.1792397966463;
        Mon, 19 Oct 2026 01:19:26 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad48dc2f1bsm865449a91.4.2026.10.19.01.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:19:26 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:19:18 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v11 08/16] genirq/msi: Provide
 msi_device_domain_restore_msi_msgs()
Message-ID: <atXShi9ReURhBmdB@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-9-praan@google.com>
 <8733u8eygy.ffs@fw13>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8733u8eygy.ffs@fw13>

On Wed, Oct 14, 2026 at 11:58:21PM +0200, Thomas Gleixner wrote:
> On Tue, Sep 29 2026 at 03:45, Pranjal Shrivastava wrote:
> > +void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid)
> > +{
> > +	if (!dev->msi.data)
> > +		return;
> > +
> > +	guard(msi_descs_lock)(dev);
> > +	struct irq_domain *domain = msi_get_device_domain(dev, domid);
> > +
> > +	if (!domain || !irq_domain_is_msi_device(domain))
> > +		return;
> > +
> > +	struct xarray *xa = &dev->msi.data->__domains[domid].store;
> > +	struct msi_domain_info *info = domain->host_data;
> > +	struct msi_desc *msi_desc;
> > +	unsigned long idx;
> > +
> > +	xa_for_each_range(xa, idx, msi_desc, 0, info->hwsize - 1) {
> > +		/* Only handle MSI entries which have an interrupt associated */
> > +		if (!msi_desc_match(msi_desc, MSI_DESC_ASSOCIATED))
> > +			continue;
> > +
> > +		scoped_irqdesc_get_and_buslock(msi_desc->irq, 0) {
> > +			struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
> > +			struct msi_msg msg = msi_desc->msg;
> > +
> > +			if (data->chip)
> > +				irq_chip_write_msi_msg(data, &msg);
> > +		}
> > +	}
> 
> In this case sashiko is wrong:
> 
> > [Severity: Critical]
> > Will this result in a NULL pointer dereference in hierarchical IRQ domains?
> > 
> > Since irq_desc_get_irq_data() retrieves the top-level irq_data, data->chip
> > points to the top-level irq_chip. In hierarchical IRQ domains, the top-level
> > irq_chip typically does not implement the irq_write_msi_msg callback.
> > 
> > When this top-level irq_data is passed to irq_chip_write_msi_msg(), it will
> > dereference a NULL function pointer:
> 
> All MSI top level (device) domains implement the irq_write_msi_msg()
> callback. That's the whole point of the top level MSI domain as that's
> the one which has access to the device and the associated message store.
> 

Ack, I can try folding this into a comment to avoid sashiko reporting
this multiple time in the v12.

Thanks,
Praan
