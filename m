Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E275A3D1CC3
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634286; cv=none; b=Y21XIAemdnH/rj0Qk2pDCjFGEtI70iQUgsuU02LA7rDW0HDxKZCBxLWGxguXNeQlt6Io2DUF8w9N9cJDkhrN3Fz9B0gKCzILIa6sRTYHPs4kPzpvPdh3nzXNVocBGeKlmc7Fs7yhPLhein4BAY/HjicWN1bC8duFSxlF1aEQQT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634286; c=relaxed/simple;
	bh=C6+QVbKbywsT2lvtAVnXRM7Y/Q3xo1OzIYQ065Ab/+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fstm18OvvMxBWtS3/GhQr4mA14DivCwUJarH2S7WNcs0d4AQ6MLnG7PKhcQ9nEda1NSeiHIWGjdvkRUGEGsq77Hk3OKq4IA+B1eUkQYI4njHwYJK65MZsqvi60wuf0QHdi3IpXWUgFsds3sSsXGHxrtw33towXfU0i1SH3PhCpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eZsTfoyW; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eZsTfoyW"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c29b46382so1368641cf.3
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 14:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783634284; x=1784239084; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIyfo2VEcxlnkeMECDcWCS4lIF+QfUGCzzimsolaQ9k=;
        b=eZsTfoyWvSlIw7RSej2bLoM89qq7YeC4lwxNDCEaXLK4lctTDInVORvQzRD7otQDK4
         IOzBoYzfY44oU4WAQhNOQu7NqeGES3DhxQyilcxu+W+WqaosQSFprg7Bt2m2YFOu7nRM
         I6rSuGvOLZsAceGW4pMupFlPJijPY486bG6CWUoDSJPwhgbH69wMeLxSmMKJg6LtfS+m
         foxXfk7puxlK2SNX3SUA6ma9+KRdNkdbkaTDzV6NIMVqKYWeb848Q1R+f6pTIDiGW3Bc
         AUke2yDNG2jrO4Gy0gLx7Tzubwn9h5dzReMiZ+RARtaPeRbfHaOV+9rFDqdcDmTdJdkt
         5zfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783634284; x=1784239084;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIyfo2VEcxlnkeMECDcWCS4lIF+QfUGCzzimsolaQ9k=;
        b=JZHcXhr4Jqrar4smvUsNCoSU24cdP4SQr1l5dCoIBa8CKaZl+E4bkAiylI4ZW2vXy9
         571XPTpqfgEBnvNLyZlNec6GOAHAxLczKDtgGAmYpG3MLinKcn63db0G7R2ySMBgR/X/
         pr0vWU1tPUBtvxOri/QVWkxEAvRYm6mpVSn1sRrDI4P4tyw7LhLnuQdUYF/Ro+Yb2RKc
         Bnm7ZJidBLtH8sNrlrytuH736cDx2wDvBkW8rcFyqD1fdYSU611BIqn1z1umyZVG3TWu
         95K2YBvZWQYuQy9GIZu9H0xjVkmxHbENLjLD+6BjtD478DnXFS44C0u+bPRSKKqG6cxD
         CMmw==
X-Forwarded-Encrypted: i=1; AHgh+RpOB6dQpDPGjhWDkcHpf7gBG6mIIDLaSAHpExv6hJph6kMCXtfyYHnctFE6M6F1SZEzJ3cmcXt1+qMapw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdX8yKEUHvuq+FPwjIe6U0d2qvI1CO6hzZGw2+KlfVdscFCjLn
	0eQFj+2aeMjFNKk+kVzM+Uf06XVpauTvtQ1IHxxpgIvXM19NC7GXyCJn+26SxsWTzCA=
X-Gm-Gg: AfdE7cl0Ruq44eytoB5aU4TQnBtlS3EWDd5kOHClSxMOQm9x1pIphwykhhKW2CVzwUu
	9+BL13COA/nPD+cO+NLMhIjeU8C2GKPDZoxXwmQExNHyv+dsAKcLE48UUIeBfnYGJ5IJBR1iTwH
	o9iXjCoRhaivTbKuxeH0wpHOmcOohGfRHYYRCDf0LuLBcrJDAB1yr0qbd0sS6OnQVAPYOOH0fAu
	tMzcF+EEbUC3MIy2N45rZ4PE4LoBrbG4SUQqoQiTjp11vMP/IaWOpT8rzlL1b8V7nX2eH9ZdGy4
	cXgJEAn3FkA7ipF4kve7DnnlR9Pu9ltwrsQAXmN5IyPkP/A6Bz7WGYo6Gobvd2g9C0K6P9kPrqv
	8yhMzvIpcE6sB0PbsMUGv0NSOl8HBN3oRcLYUHpvSpCqKE8Kx7R/9yKrWYRUALdIR+kbay9OcPv
	2Fz1u4Jfb8ZqfTB+mO996K6Y4406kiD3CuGRszMxyqbez97MHkQVKrLIKhTSkh6ZsUqkd3WlC85
	VQ5paE=
X-Received: by 2002:a05:622a:11d5:b0:516:dff5:68c4 with SMTP id d75a77b69052e-51c8b403cd3mr96830461cf.7.1783634283862;
        Thu, 09 Jul 2026 14:58:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf9a12csm3563591cf.27.2026.07.09.14.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 14:58:03 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:57:59 -0400
From: Gregory Price <gourry@gourry.net>
To: Dave Jiang <dave.jiang@intel.com>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 08/10] dax/kmem: extract hotplug/hotremove helper
 functions
Message-ID: <alAZZzO96_ZltrJV@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-9-gourry@gourry.net>
 <151783f1-c0e4-4c2b-a051-1e6e9c546cae@intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <151783f1-c0e4-4c2b-a051-1e6e9c546cae@intel.com>

On Thu, Jul 09, 2026 at 02:44:25PM -0700, Dave Jiang wrote:
> 
> > +		 * Set flags appropriate for System RAM.  Leave ..._BUSY clear
> > +		 * so that add_memory() can add a child resource.  Do not
> > +		 * inherit flags from the parent since it may set new flags
> > +		 * unknown to us that will break add_memory() below.
> 
> 'later' instead of 'below'? Comment reflects previous function flow that is no longer the case.
> 
> DJ
> 

ack. will pick it up on the respin

~Gregory
