Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1320F33F8C3
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783647022; cv=none; b=iZRZ8UIemYx2dpHPanUUsdjLdr/9mJW6ua0DNK/7bzcY0g+DaB9+z5SnZPBe/fAf2Tghgk/nAhvnG+TlzWB5KKP0tzoMaWz10biFSUBBMpMjihcovlvdCJVdGIrAo/ixbti5ZJeTeNDnKNJT/RyyhUTCK2qoVSR3teeNPPEoOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783647022; c=relaxed/simple;
	bh=3rYTe8e2Wt412qzExNzuhcRev2Wp33ZA51eAifLPzps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jagF005FIYXMgr1WHyVOJNUtQ1Grt3d0sOixbQ35gEUM1gvBZrRGjh0ucJcowU6PmW2BX5H4FEMqDaS2U79KMT1AegUe3HvQwQmD7MsOw6lD0EKMxZ5BF58GvSdAuaREdpzL9i84YGV1zH/8gZ/cpcC5qTQR8Hk5DHAb6jGJHLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KNJuWVXI; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KNJuWVXI"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so3449656d6.3
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 18:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783647020; x=1784251820; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VaPhGtocKLbFXsyQXoR9g3DKOWhugqrS27IBZSVVhcw=;
        b=KNJuWVXISttBo9KiJyi51pBsRPkS/eZ+wEhArKYCtDSiyAydEA1NoDKLtemPQmgw4y
         pVveA/0zRrKIpM3pPLWKRVO4hvlviAPj3tFK10ze0LDh9nlBw/7ZZ4MeBT3TRAp0ayhY
         yeV2Ld3gV+RkZXA4Ixgu+ghxV++simCPg/oCLfzj2r544M3XkcTw34quZl9aVqUtiv3q
         Wkze7BI5K0FRZ2EUcwhVONW6m2pRNxj7iUO5CYDc7+8S7C6ssJCZ2EyRmHh67Q1/42zy
         MUeZy5hUxn1H44kh5WBtRhuY4BxguqkhSg89gdolSKY/rprmicAItY1NxmSUHdAcMggW
         NKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783647020; x=1784251820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaPhGtocKLbFXsyQXoR9g3DKOWhugqrS27IBZSVVhcw=;
        b=kGtfxivvrXnd1QiH1VCz8mwOGwZWvk9Y6qZy7sB7BTQhyg7MA0QVaCwbChj3pqcQUN
         lAcrjQwA8qJ6Mhd7PWOB7bPQoMRPeCbqsk9zIzx/t9OZkmwk5+IK4iu8mBYnYkJSJAid
         LQnjfDD59KpYWLilZC0KuhNCz1uEu+eFwK1qTl5QQWawGcd2XF1LG2AIWzxVrNIsTWA2
         yxwj5Bi7I7pygaOAqH7+ulNuZZrnoYjlhA5PlPx02aUho4XslAB6+QOByFIdzpJ0ewP3
         DYY852lUM5bHqoyg3NIl5xWmUF8k4jZLt9UKdHJLeniQMi+l5Q6ie7K92Y9HsgqgV1Gs
         kDOg==
X-Forwarded-Encrypted: i=1; AHgh+RoB+IYyTAgEPiWN+6kZsYZVlpUf/kL3/AqiBI+fnDobwM8McJCEH64RB/4xj9VeGnLZkAWBy+xEAwutbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDV1fuUpdEuLOg7+RiME3AtWIWfNt+DxiCNUw4JYXERJmhFwgW
	JOAnIhOQ3owcJIf/1o4lCVaGGb4qSPMzr3CNYivN40slxDjYRdOzp0JOTHRhKPJzrX4=
X-Gm-Gg: AfdE7cnWzk0L0uC8QhFaFuF5V0ZIM1HxDFb3f7OMF9EAZWLrLHOg9qwqvrOH3hZzKVD
	ppAdFa7ptv5VjOTOfXEE0YjHXd+VHfizM3mAr0El0gVKLhmzEe4dKn4KS6/BKxezfW7zcYz1nUc
	t2tHkR/BN6AE4dZ7gXEW0eRqardJtaE8C9UocXzLcbdJSGcoKNwuh2SmxuDHwzvezRHQ+Txn1aE
	XcYOQX9r8rA7psnK4yuqOUngxbHwowODm8g2bHOQ8KPAAuC6w9oCIgMjYShC73Xw25a+Ax8qEK4
	vjAGh5YT6Cd+KWe/7aungmfXif9SId2lvXSHityeptU89CTxiSue9fKq5Z82GC1XR6CYN4JS3LQ
	/aahIqXJ31kCue8KyqSvfZUCDLxrJ5kIXsl591THpmHaB9LpFhCvQT//HJsruqN7AWxvbU75POa
	irxLh3CCbp3mM+IRdaKYvC1E5yhMVv4hfCHiKqm0cptyzfqU1f8Cn8Virs06PKh2iOfbBE
X-Received: by 2002:ad4:5c8a:0:b0:8cc:2a92:48e4 with SMTP id 6a1803df08f44-8fec217b8bfmr110693186d6.32.1783647019857;
        Thu, 09 Jul 2026 18:30:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1e8aesm29789146d6.28.2026.07.09.18.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 18:30:19 -0700 (PDT)
Date: Thu, 9 Jul 2026 21:30:14 -0400
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
Message-ID: <alBLJoM86ujz5Fg1@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-8-gourry@gourry.net>
 <6a5016bf71df4_3b7ee5100b3@djbw-dev.notmuch>
 <alAb7Q_Ku5dVRKZ7@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alAb7Q_Ku5dVRKZ7@gourry-fedora-PF4VCD3F>

On Thu, Jul 09, 2026 at 06:08:45PM -0400, Gregory Price wrote:
> On Thu, Jul 09, 2026 at 02:46:39PM -0700, Dan Williams (nvidia) wrote:
> 
> This was more a matter of having the DEFAULT set consistently across
> the dax driver variant probe() functions to make the behavior explicit.
> I didn't want an un-set value bug to creep in here somehow.
> 
> Happy to drop them if you think that's unneeded.
> 

Ah

Not setting the value in each of those places is equivalent to setting
MMOP_OFFLINE (0), so better to just set DEFAULT regardless.

So unless you have strong feelings i will keep them as-is.

~Gregory
