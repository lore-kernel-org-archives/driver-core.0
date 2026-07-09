Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F613B14D0
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634933; cv=none; b=rHzaih8Y6NElvUr2I2vtESbjoZfYhPB9FQKHIEY5T5N+b5S4jKibpQk5y3ZBFNMnJOqhxSNicZtFdguWcbUhG9ASGZaAAzVmEeYO+SGoRLuq9QaQCRIp7U8cSP3DKNReX1Pw0dVVdrsgbO31/1ognr21zrlLJsb7qYGV5zQR4gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634933; c=relaxed/simple;
	bh=6RBF0jp09O3guB5Q86RDVYGXWp7JXTcPagL5/X5HeO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucA83JSM47m5nKXm7VCS8egKpApjX44H7RYJQA/65E1z8XYI0zU2oXxHykWapxLsKsHFoQRUpxEX8QTD/YUYg7QWtFRyeSaIwkjqCRXfi10G+6rVjj1HEUrPtSTArMvMqBcEdYeDahV5k+Ok2EpHQDxEt7/R122qwQgzVN991VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=rh6d+9UA; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="rh6d+9UA"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso11827986d6.1
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 15:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783634931; x=1784239731; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5hy/40qOWrDje+rO1HwX24k6GcjiBFx+d8whX1kHrQ=;
        b=rh6d+9UAioqtUzV/5d8kIjd5zdntdTBoOBf7HHbCVbVzPvR6nax5cmwirxlZsmfNxH
         LuuWaoujccgH4cz4aNEZy/Mr0uInfkapfZrkDosq3bXzj7myONNyJK/XqY8NfXjlZoGj
         HN8NgJhuzkmqMm/a6hshpXyyNRZ3H8jLtQ4qSi7K+YKZq9kurDWPVwkYF7MS3I+f5FgV
         rmcKZOeDS0jeX9GpyoVlJ2Ld2DqkjOrfaNhOgNd0bINqWEq4kzhCfDQbsNo/Xgz7W9s7
         9aw02ykG8sZPWJSBvBdypdKWQZ13Y4b2A6Qu7aZ1IxYGLThzKas3jU2a5obb2vT6NzRW
         pGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783634931; x=1784239731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5hy/40qOWrDje+rO1HwX24k6GcjiBFx+d8whX1kHrQ=;
        b=hTVqPVo93eNqDiVUc5z6lMxYZ783NiLgJxiOI5iZcPp96sZ8MaM58BlvcSjpVqjzXR
         ll9Q741n/OHYPMckIA4zVaK5JsUdxDC+LhmA3XC6s+R0c6J1RQhgnvAHB2wF99hvLNrO
         UImLrGHtsKSIChLZb5aDXcbBSy3pqtv8GxsLjhlS1IeeJsfWsfFbIUwQH0Ut/xHZRebr
         Y3+YnIHwnpZzgKAR8oB7KoFfe5ZMXLauZj0GUqsnX8a6xcCrfEfKmzKwJ958CumaiLYo
         Pgek8fgetvg74jelmaO79M1Tr/gkzcrHmZojdjc1hGzJBck/7fY+iZZuBrdVL9E1ONdG
         rqVA==
X-Forwarded-Encrypted: i=1; AHgh+RocSx9TUCeLyaCHnKddQO4iPGH1Qv2atDp34NMni3Emd6oA7wPOD1zh90rkR57kcADL6NuY0Q+64dK7Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzT3tu2q0ydd9exlPMwviSnFa39KOIWAiln4TXW2o6qC/8f1bdR
	7hgsPhZzxj9Ky0augngjfjqBTzI+eH5U6hz2DScDhBUkcEftXfAOMSLls6qM22XScZQ=
X-Gm-Gg: AfdE7cmp9cvwq9Yn+sSCgcAV1UpEjM8yId+mmGShTVEEJlPwNXszY/Fn6FqJR0vyKhS
	1IAJk22hWmCq6cWRb3ycng5Q8p2NbExI6Dq/Jojm1Eo6Sko6DO3VPPkZkIkb89ZMH30XwFK8FTz
	DAXjxZ0MMcYNeq8m/4QTTQy1JvJpA1Lai+p6gYQSfnw+C7zr2RGK1H5xqw7tt02yHeN6bWnLKsC
	zjO2345SXcD31LCrkijm2jv3Posz8gou+Q90/RXf+9TJNa/MH+XdpT/5XsWkvjqJ2+gR4XTcdIk
	LwH40QZfm/IrVuJzSZFfP0hl57l2e1Ppo2DRCzsb7C/Aeg0N9pZcvk60tql1jjJgtHDltNKgcFd
	nfop5I9LMem7OVAOsfYnpga0XWMmOIsFZM5+cW7hbNLgZS4iyUWwoyl66I4Jb4Gk8mhIIkZSG+v
	Hsm8GmUOqDTJ968C7aoruHmtvlAugbFL4w2zZ6SDk2kV3JuxBSpKL0MNnf7mtO51E1bl+h
X-Received: by 2002:a05:6214:1306:b0:8ef:1840:2bd8 with SMTP id 6a1803df08f44-9024204ca5cmr14984856d6.33.1783634930620;
        Thu, 09 Jul 2026 15:08:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87cacb8sm26797256d6.49.2026.07.09.15.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 15:08:49 -0700 (PDT)
Date: Thu, 9 Jul 2026 18:08:45 -0400
From: Gregory Price <gourry@gourry.net>
To: "Dan Williams (nvidia)" <djbw@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 07/10] dax: plumb hotplug online_type through dax
Message-ID: <alAb7Q_Ku5dVRKZ7@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-8-gourry@gourry.net>
 <6a5016bf71df4_3b7ee5100b3@djbw-dev.notmuch>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a5016bf71df4_3b7ee5100b3@djbw-dev.notmuch>

On Thu, Jul 09, 2026 at 02:46:39PM -0700, Dan Williams (nvidia) wrote:
> Gregory Price wrote:
> > There is no way for drivers leveraging dax_kmem to plumb through a
> > preferred auto-online policy - the system default policy is forced.
> > 
> > Add 'enum mmop' field to DAX device creation path to allow drivers
> > to specify an auto-online policy when using the kmem driver.
> > 
> > Capturing the system default would otherwise break the ABI, because
> > the system default can change - but we would be statically assigning
> > the value at device creation time.
> > 
> > To resolve this we add DAX_ONLINE_DEFAULT, which defaults devices to
> > the current behavior, while providing a clean way to override it.
> > 
> > No behavioural change for existing callers (still the system default).
> 
> So I know you have some future usage for this ability, but it is not
> present in this set. The only piece that *is* used is that the
> online-type from the new sysfs interface gets plumbed through to
> __add_memory_driver_managed().
> 

Correct.

I didn't want to cross three subsystems in one go, I do intend to follow
this up with at least a CXL build option to override the global hotplug
policy by plumbing it through to the existing cxl auto-probe process.

Some of the accelerator stuff is still a bit up in the air but the base
driver can still benefit from this as well.

> Are these touches:
> 
> >  drivers/dax/cxl.c         |  1 +
> >  drivers/dax/hmem/hmem.c   |  1 +
> >  drivers/dax/pmem.c        |  1 +
> 
> ...premature until the first user arrives that with the background story
> about how it knows to set the policy?
>

This was more a matter of having the DEFAULT set consistently across
the dax driver variant probe() functions to make the behavior explicit.
I didn't want an un-set value bug to creep in here somehow.

Happy to drop them if you think that's unneeded.

> If DAX_ONLINE_DEFAULT is a sentinel for "default" should
> DAX_KMEM_UNPLUGGED be a different sentinel than (-1)?
> 

They don't actually run into each other.  DAX_ONLINE_DEFAULT is
overwritten at probe time with the system default policy, so
`dax/state` can never perceive it (even if the values are the same).

But this is visually confusing i suppose, so I'll just swap it for -2.

> Feel free to add:
> 
> Reviewed-by: Dan Williams <djbw@kernel.org>
> 
> ...to this and the previous patches when that is fixed up.

Thank you!
