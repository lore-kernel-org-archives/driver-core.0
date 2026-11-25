Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616245;
	b=EZmOIYrgpvTPdqQfSlFJ43IYGCB690S2wVTnT1zbA87EzBd2+Nvo0hGhte2C4Hyh81Vx
	 u8EJdpCeU3G9uWSvfYLklf5qb6gPs6O7+ndNYKAPuyjapt1J2iTQs1YPQJS8QnNdDzByA
	 O4/zc0B1GsfZ0fGtfUow8psJ4A2KDeH9r8w+KEjOgQs6x9dMOyP+jO+wziioOf6N+v7D/
	 WnnOapJzD7nzE1txRBc7p8VPjnu1xBeLzyoOateCOv4xl8HqTAA6XYaJmcFarOu8c9GyZ
	 1Mx0nqDHpUzQssoNILio96RTV9B3Gb3hWkEAiNti8Tcl1zfobZ7859jLy3vr7rawD6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=82OlthbTcf764s1+nsFlIqp1XEt+X8IqMsOwsuhDROg=;
	b=gLMRyeYyrlGn0yx9Zo+xMZZGjjEY56jxwY0K9zkPnGclJ5aQrlcLwPhjwRzomhI+R6yg
	 LtQRgF3CCVDuCi5L2N0iHR3cUSy508h16aH/DrmPkGLxSrbIIJ0MLSlYXxVjaHI3bUc4U
	 d8O863i1Nx9RXF6baQg5HhTX0Ljn5D0OUsMM1xMo4hBMyhtsr/cL9OksBlyYoiHz4NxIv
	 mmy8lSXviPATsd7WcLWzEv4hy/gJkHRJZ2Wwe51Tli0gSwo0OUpkR7srwCkcT/G054c/3
	 40YV2A/DzoJL5Kos5jpVRM8fMqvqQYk5QhReLh37l4LHxr0747s8SELdUiTrOJf1+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=aWoAz+MR;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EE7606A326
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 14:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=aWoAz+MR
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc0ccc2fddso2172928137.1
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 06:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795616243; x=1796221043; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=82OlthbTcf764s1+nsFlIqp1XEt+X8IqMsOwsuhDROg=;
        b=aWoAz+MRKJ7ZzjVoomqnIi8F7xtWVif6B6xrm3ZiQN3LCsHrIzjNoksJDeqVFfgfZ0
         6ScroIcQtVKUDNtBAPGV3gBj1UTZMu23rMtu12tc/NKzM+VSVgiTAJHQz/giCI3WIIPW
         D3V5eEeiuCWiaqpKsWTt6RB7RwSlyGVaGakyOvMA5iAKnNz3viOiWz9xJ2v134dF/Dcw
         2ZGCZ8UJR/qejGtBWQuimnD+roaYurUturyOREBMHnebxmuHrypMEyhHLVlTe2fICpGc
         vbkIPICxUyAtihDBln18T9TX69g6GVFbyxkgqC+M9b26nATNNGftaQdMySjfeaQApBTR
         0rJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616243; x=1796221043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82OlthbTcf764s1+nsFlIqp1XEt+X8IqMsOwsuhDROg=;
        b=vphfm2UdmSp2Zqv9N+bikcojXa2aBgeTQXOGLoqlck7QL8lH5KhQjlEb5E0sfxz6BW
         nnvIiMoRjgUp0yX/z10xgjuPivtzR0GhDMoa4w7biCvJaejw9JH0nrS8J9K46AHJdn1m
         8ctYHN34gDLor2LGvxsY8/yZvhryXFkXFF4aQ6NexIT5ZeAlorQ1sKoMMAHCR6psBzoe
         nE9YJDPP1usw22ABDzdPngla3ov4VGvf+5xEjL6BOMr6ZWwjNLJJAr95F5cv4iKAqzeM
         xlPL0RGD65lkQcEMJO+WA93BsX6n17ncfqSNMf2qlYpYuQr10ThoNtjRjCMcG5OlBap9
         cdow==
X-Forwarded-Encrypted: i=1; AL+hErF48zCUTKsvHFYvW2Huzf4Zjo+I5vbzqes9PM6CHBbxRYyZudEsryA0GNd6dh4zFjF0vVq7jmvIPEhbjQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/9RrNCiMu8p6ayHSyrOp7EY9kjhiDWBZtm1s7N9xjH4vMl68k+
	7/YVx9N2XLD7UudFnHMhObDUUFfWlGC1DP+VWM/4826kV4ZHX4tEh0yE22q6LObIAXM=
X-Gm-Gg: AZFdTZd8NjUklIccgKhW/c6YH/JTxQHSI0P+TbZqMe85Mhnd7TDaxOIsvCSCPVkPJOJ
	Ib2lvWCINCZUKTioLK5ZQNKQ3sT9IhoLBleYrYyY5CWGFWyhrhvW4YqOvGKGtPc5J3Fa/J37mNP
	d1vGp0mflWAGnYlAxqBuchYyU8f/zwuf6G2Ks9oZ7k2q90rWEeQBPlTqCCPw2/Ru77j2ZNIm3rR
	SPpvz14+q3SCT2V5eZwEM6MH5GzKRXnL165JvJ0WUjKEtxVgsCgw5BZbsxbDo1woPUenS3XPa3Q
	36pZVx91v/WStmfe6C20mnTHCBV9BwPtTq+8gAvhugeDL5CAex2jmrtDC+VgIbTtCUnhUGO68WL
	xHFN1LitYwnO8TM113aglSLBUxa9VtY3Rz64C4wj8Bk1/tOGH3+DaeiPmCyLfi17vFfTWMAMX0l
	i4G9rNnD6twWrmUcF+J/0UrNzCmabxg6WzZkI1ccfn7O4zgApAYXVfmz6x5RDb0CMstp/Nl/Lc8
	datmAU6HWmtJiqvhImtP5t93Qy+FkKSFKml2GjCKOJ/He592BqV9DGg5m4x9xJ84wRwKWsmxYIL
	5xzIpw==
X-Received: by 2002:a05:6102:374c:b0:7c1:75c5:c4c with SMTP id ada2fe7eead31-7d739570939mr8150077137.25.1795616243315;
        Wed, 25 Nov 2026 06:17:23 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921645f50f3sm60805116d6.24.2026.11.25.06.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:17:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWDoI-00000001jMI-14hV;
	Wed, 25 Nov 2026 10:17:22 -0400
Date: Wed, 25 Nov 2026 10:17:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 02/10] coco: tsm: Register the TSM class before device
 drivers
Message-ID: <20261125141722.GB246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-3-aneesh.kumar@kernel.org>
 <20261123152903.GG179082@ziepe.ca>
 <9f92f7ed-5198-45aa-9cef-515ccbf98398@amd.com>
 <20261124170754.GB114530@ziepe.ca>
 <17ee3598-9cc3-45d8-b068-31fafa06268a@amd.com>
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
In-Reply-To: <17ee3598-9cc3-45d8-b068-31fafa06268a@amd.com>

On Wed, Nov 25, 2026 at 02:34:38PM +1100, Alexey Kardashevskiy wrote:
> On 25/11/26 04:07, Jason Gunthorpe wrote:
> > On Tue, Nov 24, 2026 at 11:40:16AM +1100, Alexey Kardashevskiy wrote:
> > > On 24/11/26 02:29, Jason Gunthorpe wrote:
> > > > On Mon, Nov 23, 2026 at 02:03:29PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > > > > Register the built-in TSM class with subsys_initcall() so it exists
> > > > > before a platform TSM driver probes, independently of object link order.
> > > > > CONFIG_TSM is boolean; remove the unused module exit path.
> > > > 
> > > > Why isn't it modular? This is going to force alot of stuff to be
> > > > non-modular.
> > > 
> > > The TSM core registers a class. The platform TSM drivers register
> > > TSM devices of that class. If a platform module loads before the TSM
> > > code - the class is not registered yet so it fails. We could either
> > > teach modprobe or have dependencies in the module or do this:
> > 
> > I understand that and Aneesh's patch is fine to solve that problem.
> > 
> > I'm asking why it isn't modular. They don't conflict, using
> > subsys_initcall works just fine as a module.
> 
> it "works" because it is module_init() in include/linux/module.h:
> 
> #ifndef MODULE
> #else /* MODULE */
> [...]
> #define subsys_initcall(fn)             module_init(fn)
> 
> and then the dependency problem again. Do I miss something?

What have you done to make that a "dependency problem"

The module loader chases the symbol graph and orders the module_init
calls based on a depth first ordering of the graph.

How do you get things out of order in that world?

Jason
