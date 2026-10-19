Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB644854EB
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397901; cv=none; b=G/xkHn0n/oGN6R5D1lCdn5bH277n38JlKtAF94CKNwSduUIVRnDVDoTMxjLl1wjbhRm2yDnb/EFbr46EP58RNYP5oMQX+AdIOHAJETaDvWg0TqyZtsgKltS+CUUfLQCHULAvbJrj5nqcnhyPF6xhaGWLUpP/5dIoTjMpjcwS+eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397901; c=relaxed/simple;
	bh=zJbXzUjdtRbnDRMSD0ZFUF3Ql50Yc48q8DhOcPiIqao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rI94Ang5KN+b5kOL1vqy3Ug0DtflodEh0O6aNYx8tCkBKbMCbej2PPuD/ZO0M9QN2N/cOXmikFeWqspykoyJIwlv/C+PJfzWywTzNvWTYprXJV6nI//f0/Mjai2JTsmvhH3bcJqCuvxIOV836vheVTlB+eJ+r0OknBV1xgzNBf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=edlYLvyz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="edlYLvyz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9f6a16afcso17755ad.1
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792397898; x=1793002698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wjpKNxbRFa0QN2xvZXyNEaUJwKZqQxqRu5XGn6mWryk=;
        b=edlYLvyzt5NtgoM4YILG77WtkY2aw+ADU2TzSb1VL8z1FbYYD+LLmUuioArQ5J/htj
         eVSJXEVmBjh+4bUvDZMUBnfHwsDaoYO6xQwDcCqWgJK0brL5Zuc1i7O15s9QdwEr5Qgj
         CETRt5XMSNnIcqHDqPTYJtJb5Xg9au2sF7M2j8JfmLCrlNAs79ce8kRyvVZO0qPTNj39
         VwgOl+mbvDJbaJ4mCpZX4vTCV+V/hspBSUSm1XYOLKKEzLJXmHu0G1IunmctLc10gDZL
         /HFSyovPRDcqBMNxVbfkHr4cT81hcWpCOBhYoekhq2EDj0fIQYwo4MlQgodPPSn9boe5
         CElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397898; x=1793002698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjpKNxbRFa0QN2xvZXyNEaUJwKZqQxqRu5XGn6mWryk=;
        b=y1hMR0q9OnFR/a9xvQKzjIgDYUFdHYn+J1WUDx5UMZUuhhd6Qg67A0mHei1Czf72F+
         b++01k6C361ogomEXwuEbAodyez9siqGpVG4p0wtSS1iVWfSTI743A9CuVWywcrt5oa9
         edNHfjfDXdwh2SLBBrUAzcCBiEG0EoOCTHQBRfm4QWfwdO35zlbH6RMu8qUvjKVomoVp
         wZx5uw8Oo1Oh62hcHgToXKH2vVmy+2pAAiPwdcWVSu4QIlVcZbmNQnrW8QpEVu1JA6vu
         zulNxq1rsCt/cgL0E+H/SuELuSe2KyJqIxJUrppO/LxU0ixUcVIo8TsTDAs5+EhZX1yE
         3p4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwtHYrIfGWUZWz+DxSmzeqHZbvkkVkgcOHQSRCB03Wmv8aw+Nv68hRV3j30s/T+EvCuhHYGQAyjFrpjig==@lists.linux.dev
X-Gm-Message-State: AFq9FYKAy4xi2gXFtg8oBJ62EFwhdoQ5G9gqIzxd5gDqJ12UHnkyltNt
	2+lGsSNqZx0tFgOoW0OHYz6VYlP1OA+uQOrJUBwUOSFE0XKS3+OhVlNC7BXUWHiiuQ4HiQWvBnN
	nrNTDFsED
X-Gm-Gg: AYBFou1pZLJvbh7ktePv/cfHFxiizJRwYPZJ13WDuhvd2erP2XT7OfmGtWCxoYRLnNE
	0hFZTfNM02KdNpXMLt7YiuhMCirSif3vbTceQJqqI2hesudQ/xgXuYUQxtHrBcMUbG0uD6LhCal
	zJobAcGZlWvqWM2cQ1dFCR0uezJqz+tnAG99yHAPTEEO3gNoUUFw9J4vEmKVhbcOa4fEvjEiq2S
	p7N77TEIQuxbJqhF5CQZQH+OCcen8lvSs6R/yBB10qiWTTxFFtlf1d18ccOPEPuAMs9vI6j7TrB
	pNrZ5/5kUpr/92Hz3lBNKLHj6UBDOHPlOkvCalBif21VvgCY7wwSO2WdZv/R2OpqvU1MR4o2cE3
	q9gEGGse0STCI3ywlHxUxnDlk4FmqIWzcr6CYMJEb8gFCCSH4igVa4V9FQgGG0X0cPfuIKUMN60
	q6yek5OvyVx3zb3z0a5PB63Ebaigh3BmUfoM0AqEi+tCXAz/ZdYcNmWwUTD8esoKepT7OLxXeOd
	juXjQVowr0W4gx/X7oReoMSMCc4TbqTDEGgFA==
X-Received: by 2002:a17:903:1967:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2e9b332b4d8mr6634505ad.15.1792397897247;
        Mon, 19 Oct 2026 01:18:17 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017244sm3517077b3a.47.2026.10.19.01.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:18:16 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:18:08 +0000
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
Subject: Re: [PATCH v11 07/16] genirq/msi: Cache MSI message in
 irq_chip_write_msi_msg()
Message-ID: <atXSQFvKWo_xAw9l@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-8-praan@google.com>
 <875wz4eyqe.ffs@fw13>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875wz4eyqe.ffs@fw13>

On Wed, Oct 14, 2026 at 11:52:41PM +0200, Thomas Gleixner wrote:
> On Tue, Sep 29 2026 at 03:45, Pranjal Shrivastava wrote:
> > Currently, PCI MSI caches the composed MSI message into the MSI
> > descriptor inside __pci_write_msi_msg(), whereas platform MSI and other
> > device MSI domains do not cache the message in the core, forcing
> > individual drivers to manually copy the message into desc->msg if they
> > need to restore it across power transitions.
> >
> > Cache desc->msg in irq_chip_write_msi_msg() before invoking the chip
> > callback so all hierarchical MSI domains automatically record the
> > latest message. Document why the redundant assignment in
> > __pci_write_msi_msg() must remain for direct callers outside the
> > irq_chip hierarchy.
> >
> > Suggested-by: Thomas Gleixner <tglx@kernel.org>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >  drivers/pci/msi/msi.c | 6 ++++++
> >  kernel/irq/msi.c      | 9 +++++++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> > index 80a9db417dc8..f7bedc31d486 100644
> > --- a/drivers/pci/msi/msi.c
> > +++ b/drivers/pci/msi/msi.c
> > @@ -257,6 +257,12 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
> >  		pci_write_msg_msi(dev, entry, msg);
> >  	}
> >  
> > +	/*
> > +	 * Although irq_chip_write_msi_msg() already caches the message,
> > +	 * keep the assignment here for callers that invoke
> > +	 * __pci_write_msi_msg() or pci_write_msi_msg() directly outside
> > +	 * the irq_chip hierarchy.
> > +	 */
> >  	entry->msg = *msg;
> >  
> >  	if (entry->write_msi_msg)
> > diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> > index fb5f372215bf..df460a574d80 100644
> > --- a/kernel/irq/msi.c
> > +++ b/kernel/irq/msi.c
> > @@ -634,6 +634,15 @@ static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid
> >  static inline void irq_chip_write_msi_msg(struct irq_data *data,
> >  					  struct msi_msg *msg)
> >  {
> > +	struct msi_desc *desc = irq_data_get_msi_desc(data);
> > +
> > +	/*
> > +	 * PCI Multi-MSI shares a single descriptor across all vectors and
> > +	 * the device stores only the base message. Cache the message of the
> > +	 * first interrupt only, so that sub-vectors cannot overwrite it.
> > +	 */
> > +	if (desc->irq == data->irq)
> > +		desc->msg = *msg;
> >  	data->chip->irq_write_msi_msg(data, msg);
> >  }
> 
> Sashiko reported correctly:
> 
> > [Severity: Critical]
> > Does this code cause a NULL pointer dereference for domains without an
> > msi_desc object?
> 
> So this needs to be:
> 
> 	if (desc && desc->irq == data->irq)
> 		desc->msg = *msg;
> 
> Did not think about that, but that also means that this patch was not
> tested on any recent (less than 10 years old) Intel x86 platform or a
> x86 VM exposing HPET...
> 

Ack, I'll fix that, and yes, I've tested this on arm64 platforms only.
I'll pick up a recent Intel x86 platform as well, to test this.

> Thanks,
> 
>         tglx
> 
> 

Thanks,
Praan
