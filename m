Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934BE489894
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397187; cv=none; b=l1YsIu/I/QRZE0iSVC78aWuXRlWa16crBdfxETb66l3kCkEv+baKlxE90/qZSgvjsrYNO846Hnc94MJyNcdVpdjlcqjSvqZ6MBg447n1dzrT9Z4suBJtaLejUIbQHmarcM693hmpe2sK4xoswxyA8bhIVG+YDUA2ZSDrS4Wjpu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397187; c=relaxed/simple;
	bh=FY0qcanD1yswML7l/dRsnVFaY2lJmQx9u8YM3zGuotM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKojME+vQatOEIPHp+rEdhR8ohMMQSBv3BnEP/bGx/B/C75GOwrd/UgCwkaWY4EA2S4WGqTropGabjpMX24vBMavBa8pbyymA43TBU0Zjrojt6T6xtzedAToVCCkge3PZ70vYB9s5Z+8HVEAMJ634A+KOBfh+0k++W5vjf+MyS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kzj6wttH; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kzj6wttH"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-169be2dfbacso6603c88.0
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 01:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792397185; x=1793001985; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zKlllSkaDqzD1U/0lTr5RBP4KobTu9kcdCFVa+N+5rc=;
        b=Kzj6wttH5qH6Nci1FFqml0f5WcnKq2ir/loNv/BkV8S1krTIaCGHqmcMQYsP+nPG86
         t/EodI1fdHN7C2n9yjym53jEkLpn49i97mutEbBqgD/nRJaSLS96vGdBsCljh5r/6TlM
         Ve2sK8GckzBlhkSGKQj0LqpTJLnlH0qI4KjnH0cfjHo4ajhReMK8GcG12ynDw6qWE1X1
         vNOsA0j8veR6CpoM+HHit/ty+WdQ/BmjvawP+g9KowVFvEa/rOXzRyA/YQNnCT291RKt
         Ac88dXH5qPLEIHXlL6SVxPFafGBskSokQJQdrhx5Yry3N0WnsdwTljGp9POr/Vuel4aJ
         kD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397185; x=1793001985;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKlllSkaDqzD1U/0lTr5RBP4KobTu9kcdCFVa+N+5rc=;
        b=QcSsbiY64Qx/Cdr9wvxxPYsTmuLjHoJzVYyWgn5h6hsfjqbi52Hc6sxxayZ8ce28Gu
         5redy+NY2MecclfYEzMdFv1B044+077JzMprsHJmchi/cM/QS8h5QQFXbXAU0WCMsXK8
         +QgNwBqFwuj9HVFioUxP32vN+uONJs7dGRQa09qMxDbbPodQ5CLqNItnFlg5xzQ3Co5M
         eRSCsJQ6pNtkBKKaqQHm57pxNo3KCMvy04/8q4eiE43V4KXpD6x6rZ5H3+gVpQKIEpGk
         7AmlyfUAZnsgERiMY36h9nlSVToB7gtlW1w1xaig6PplakBQF0Miv3Pd+bBlh0d5huEU
         IlsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFATp8gfO8Fmq11N5Jsytq0SwvWrAK5upA+xTTng/n/erCbJnQF1KbGuJYICEbTdk4s5+RTUWZ6BQgWQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJzP6HVNWs2QF+ftRLSQ0mPExwH93InpOKBNE8M7vA3tkRF4Vej
	3MDI2/5jVVwQft/DDsAjFi0Lj3vwe1e5XceUilCbTEDwXWuC48fvw69CGkdahRH1rA==
X-Gm-Gg: AYBFou0yS4YxyMBtJutYN5+ejcO0/vyZXJEJ00sMAG6eTQydebPCmlW249MBnTvCUD4
	SYPvv0AO8m+ouNTVeGqKojn2OhxiZzEcxfUCcQEyqLJRMai2yEyic/Q2N1VXpEWqZSBr9doDqKx
	Onu9ebAW6nXhADqKtqSd5/o7CPsY7WHwpYyCP3so8p+mQ0sq9vs+xMp1YnZIBGMfYFweGAOqJdE
	wg6hk/F7jgXkCgdarPmEICEsEIuYmMCuBPKs0atPkwJ6PJiW3cyKCh0wu8z5VpQ7tJtrlDdMRHp
	9FOopR2jsfLLBdgG5T+AM0Cv5TWsHbfzQAPQMrrHF/7pjLFwN8IQJpxBHXutrdgGiXU3Apvb8Cn
	wkSQctIl2PunCTVWDBzI/0vLtf2YD5oaQTksT4mgF0llHFeAAxQ7QJC2CmauVchcLlWGn9PXOLh
	3up4GSh8iNpl8QSJhlKbEPoxFSj0ieSMMKblQ+0gVIZ5rUesLRhS/qBVZlvWbGm8hbviVgqmqli
	UN0wZ1QAFw5QkY7YnaZfMkgvkGBlVw4TIZ/2N3U0XDkg2Q=
X-Received: by 2002:a05:7023:d0c:b0:184:6afb:b26c with SMTP id a92af1059eb24-185b79b5548mr344812c88.18.1792397184354;
        Mon, 19 Oct 2026 01:06:24 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm28999611eec.26.2026.10.19.01.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:06:23 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:06:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
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
Message-ID: <atXPdbcX0XADEdh7@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
 <ar3yWUmi8E0k37Ml@google.com>
 <ar6gY9grmdMZcN/M@nvidia.com>
 <20261002164748.GD3481470@ziepe.ca>
 <asAeCz_rmpe5hbsh@google.com>
 <asUvUf4PZJ7JCLXp@nvidia.com>
 <20261017174912.GK14213@ziepe.ca>
 <atO7jTV+XNReShT+@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atO7jTV+XNReShT+@nvidia.com>

On Sat, Oct 17, 2026 at 11:16:45AM -0700, Nicolin Chen wrote:
> On Sat, Oct 17, 2026 at 02:49:12PM -0300, Jason Gunthorpe wrote:
> > On Tue, Oct 06, 2026 at 10:26:41AM -0700, Nicolin Chen wrote:
> > > > pci_dev_reset_iommu_prepare/done() pair (with slight refactoring) in EP's
> > > > suspend/resume?
> > > 
> > > That sounds right to me, though a different API for suspend/resume
> > > will be required. And call them in pci_pm_runtime_suspend/resume()
> > > maybe.
> > > 
> > > Jason, how do you think about this?
> > 
> > Maybe lets just start by refusing power management when ATS is on? For
> > PCIe devices too?
> > 
> > It isn't just ARM that has this issue, every iommu is busted if you
> > suspend the PCI device while an ATS domain is still active..
> 
> So, should we put that refuse guard in pci_pm_runtime_suspend()?
> 
> I am thinking about splitting the iommu and pci patches out of my
> smmmuv3_atc_timeout series. They could be get merged alone.
> 
> Then, we add a new API for pci_pm_runtime_suspend/resume() with a
> new BLOCKED_SUSPEND reason in the list:

The guard doesn't sound too bad, but what if we refactor the reset APIs
instead and use them from the PCI core to disable ATS + flush the ATC
right before the EP suspends, as discussed earlier? That'd fix it for
every IOMMU without taking PM away from anyone.

FWIW, AFAICT VT-d and AMD-Vi already enable ATS for ATS-capable devices
attached to the default DMA domain, so a blanket refusal might end up
disabling RPM for some internal devices (e.g. dGPUs / NVMe) that rely on
it today.

On the PCI side, I could roughly:

  - Base on Nicolin's split out iommu/pci patches (blocked reason list)
  - Add a suspend flavour of pci_dev_reset_iommu_prepare/done() with a
    BLOCKED_SUSPEND reason, i.e. RID/PASIDs parked on the blocking
    domain, group->domain retained (so dma_map/unmap keep working),
    ATS-capable devices only
  - Call prepare() in pci_pm_runtime_suspend() after the driver's
    callback but before D3, and done() in pci_pm_runtime_resume() after
    D0 + pci_restore_state() but before the driver's callback. Same for
    the system sleep (noirq) paths
  - Keep the guard only as a fallback, i.e. -EBUSY the suspend if
    prepare() fails

That flushes the ATC while the EP can still respond and stops any new
ATC_INVs to it. On the SMMU side, we'd then never see a suspended ATS
master with ATS still enabled, so a WARN_ON_ONCE() at suspend would do.

WDYT?

Thanks,
Praan
