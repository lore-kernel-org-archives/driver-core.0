Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527398;
	b=YUHeBKXUu/SS84rjwf0rq4ekJ5mIJTAc2o5JfnQ0IhfLRP2mf14eZ24Aw3ofKR/o+I7m
	 CyJIKPStF9Jnu994U2weGfZ/tdPvvaHsG/nqETvKu7dsBA8lm2M2OPXnfltmVQm3PjeGe
	 V7LjObcSrI4klr8tLpldhsd3V4TbTAWdj82iB7brn21chpIc/7i0krJiVvxBPrR9t40j4
	 +I04Z6KG6I1SshjgVE9DtkPdO7fbuOkJzOkMFB0TFtAjk80qZihjkPU4k8EcRGBZC9Keo
	 M34FBY51o65I9+1jQDvRCrIg43iBZVBBKYUdsoiHYMscsKJGlED6NUwp+U40fHZEoLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=38dbhiLjfuYeyXify2hejI0unP3asaYqsevCVz0W1bQ=;
	b=DhFKLZV5OqeDsDiag6WfWQa8YnuPUuk1If7ueZ7oq/0qKCo75+imIRcydv08miM8VY2A
	 Dx6p0Lc7nMvRbMgjsSaF+rBVtVTTP6BZCBL6JZrvKLtbcYNjrupLRVQBUg3kXu3ATSTqP
	 MdOlGc86rWffxtBwQavmGQkLsC0Y2bBFIgtwAtLynHjuUm2uT7Fq3FQe9bcQrgpmithiN
	 TlTXEgg7Sz8wq+6OFq9eMGLfHistAS+Ov7HNfPjFUB75vvdGwID+B6ECfyUF32UUVcSnW
	 ieCTaLHnCCysiwbKG3lOeR2plYU30ELBUXQCAWu/J04aNnW509IiVm+BRhgO4q+IHUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=flQ41bEq;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D610606A31E
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 13:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D610606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=flQ41bEq
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-920fed989b2so44114036d6.2
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 05:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795527397; x=1796132197; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=38dbhiLjfuYeyXify2hejI0unP3asaYqsevCVz0W1bQ=;
        b=flQ41bEqZsTIoWP1xMRLarxDeOueftSsd0ZgKn/hEBrJO5/JIw2jMxaCDfhR2+sjTM
         M6RhOSD0yuZJkiCCyXCEPB3gDxXPuLKamoO0PDRxF7D+m6Hn2R46kK5+O+hDA/4GASJk
         28r/EE4hj5sydzYR8/FRs5dxe2LtuhClsixpUjNkK0scJLGbsK1rJ9MrKLiU+BFH9Ufn
         qafKjC1jvQ8YMPV24GD8oLp3gnUy6u5nAKNfi23pGwkRuQhEuR+kuCi7XK698R2LNbCT
         gKLJvp9smq2R/k4vUVR2QZDkOO5nGnIhuo/3vTvvP9okNyGC+7QpLAcccDmhu2p0n1sW
         sv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527397; x=1796132197;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=38dbhiLjfuYeyXify2hejI0unP3asaYqsevCVz0W1bQ=;
        b=Dyyy7FTVsu4DmA9OR8SFEhz/b0Z5OeukokWszJMNKiMUlg7MoLG2l5MnCnKPAJ+USQ
         wAdYUwyojvL5fFNBrEHsUZow16m58vqaxGCY+0vUj+KT2i/iL+fSeLx7uXTK0iIE1dgn
         wDbZ7lYfZzQnRjez7rouN5MEQdkUrAuy8upBpHYNxiX8ogA7hshUbzVs8EnVNNiESfkK
         orizqJQ2/rPdrAD175b51DP0JNlQGmUbKhnnBuiVGsnNzQTawhToThWC+qHbgDXqiTtf
         pi7+iKWC+Jpretws70pAeysSSP684kuiE9UCdg8HXOgZbQBv4Dr90HdHn+AKH9L9y7/B
         50OA==
X-Forwarded-Encrypted: i=1; AL+hErGgdL7ST/58BxXCWaJtYc+SXjvrp546c8zc1Okcqt9517DSG39OH9DAwEX+3hqhThgdBdXrxuXkclmMIw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+N25EdbqnEOrWO2vkSo7EE362Pmuv4hjiBpAmvRyLBRK7w1Mlh
	irw1JPqol6x8sCRzlEqPZzz6orCanCm5kzv6aXrOuh4ElukkP2L3JFyyO6KpBv5N0E4=
X-Gm-Gg: AZFdTZeAqeJuPMgnwkDDm8EHkSiLwdYr5940Rdmu+5Q9XIMPsQgFpLp4EOJs7YrdGjx
	w3AY+VibhLmXGcT9VZ32/hveo48Ic7SPW5c3cYU2bEpRsC38AIfr+i5qNEHH6Zz5/yQ7KNwwG5U
	nYZaQaM9RWnMzREAbZUE502rd+SI5hQ808xDzyCtGqMgLzOjE0E2GYC8mUtT22tW5mcbSKln9BY
	r8pBo+YL7NLm5qvG7UnSN6xFalvaYrnZZ6P5zg6a4XV0QOxovnguboqHgX1/OuDaYReo+9LTV7v
	lu/dFX/Cy76qZ3sfhU9OM/9YtwcGgrgp6FolPqJth1J2KIoOTKbnqAHBluenH8jLoXyUGuVnEgr
	HcBMKsL47KFTPtdzbjpBeAEGMqDXaQPM0rMUEjYgT4SEE2GrgQLhlVp4JR2zUyXS0v3io1ODmLJ
	JhI7s39dvQRKHoddozjYdnJ5QYaac/tvujpQzM0qFUoPxIvHh4zOTQsBiKTHtQxhLvN6BD1Ye27
	ME4Vw9yyWc34cyX2+GBRZzYv71Ab2dkzC7bccuSINpA/akQf/+YtN3sWr4vKrbqQB+CK8wOEeYK
	pGoOZ84=
X-Received: by 2002:a05:6214:4412:b0:921:435d:9242 with SMTP id 6a1803df08f44-921435d927fmr200448146d6.47.1795527396835;
        Tue, 24 Nov 2026 05:36:36 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm134683816d6.44.2026.11.24.05.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:36:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqhH-00000000PyR-2zMF;
	Tue, 24 Nov 2026 09:36:35 -0400
Date: Tue, 24 Nov 2026 09:36:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jianxiong Gao <jxgao@google.com>, linux-coco@lists.linux.dev,
	Dan Williams <djbw@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev,
	Zhichuang Sun <zhichuang@google.com>,
	Piranava Tamilselvan <piranavat@google.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Ackerley Tng <ackerleytng@google.com>
Subject: Re: [PATCH v1 10/10] PCI/TSM: Configure accepted device DMA during
 driver attachment
Message-ID: <20261124133635.GG9566@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-11-aneesh.kumar@kernel.org>
 <CAMGD6P0pNAnq9U80dnpgbz+hHbX1yH1bdmXjcie4oiq7KizU=A@mail.gmail.com>
 <yq5aeccabo46.fsf@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5aeccabo46.fsf@kernel.org>

On Tue, Nov 24, 2026 at 02:30:25PM +0530, Aneesh Kumar K.V wrote:
> Jianxiong Gao <jxgao@google.com> writes:
> 
> > On Mon, Nov 23, 2026 at 02:03:37PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> + /* driver_managed_dma is unsupported. */
> >> + if (to_pci_driver(pdev->dev.driver)->driver_managed_dma) {
> >> + ret = -EOPNOTSUPP;
> >> + goto out;
> >> + }
> >
> > Hi Aneesh,
> > A short clarification question on this check: once a guest TSM driver
> > implements dma_enable, pci_tsm_dma_prepare() will reject binding
> > vfio-pci (and other driver_managed_dma drivers like pci-stub) with
> > -EOPNOTSUPP on both locked and accepted TDIs.
> > Is rejecting driver_managed_dma just a scope limit for this series, or
> > the intended long-term policy?
> >
> 
> Wouldn't that require an IOMMU to be available inside the guest? The
> current implementation uses dma-direct, and I haven't yet looked into
> private memory access through a stage-1 IOMMU.

Touching driver_managed_dma shouldn't be part of this series.

iommu support for shared/private memory is its own thing that should
come with enabling guest vIOMMU.

> > If it's a scope limit, is the expected
> > direction for in-guest vfio-pci to enable private DMA when it claims DMA
> > ownership / attaches an IOMMU domain (via iommufd or vfio_iommu_type1),
> > rather than during pci_dma_configure()?
> > We run a userspace accelerator driver over vfio-pci inside a confidential
> > guest on an accepted TDI (similar in model to DPDK/SPDK), so knowing the
> > planned direction for driver_managed_dma — and whether any upstream work
> > is planned for in-guest vfio-pci support on TDIs — would really help us
> > plan.

Is this with vfio-noiommu?

It should eventually work, but there will be a variety of
complications along the way :\

Jason
