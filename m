Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9502DC76A
	for <driver-core@lists.linux.dev>; Thu, 25 Jun 2026 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395511; cv=none; b=qEEIl8zmjo4MDgjaWxTIG3KPQMT/JVpvKAenxC+JZsXMJZ63+CDvMxJGN0xF7KphyyGaj4RSM7goS0/SflNHom3HaIa51lUjsYlmyUgunENYZm4Tr8IVPlND2/v37yn5WRwHPWWuOBS/A8rMJzxUQeU+X3y7HxwY/jQNBcFqF5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395511; c=relaxed/simple;
	bh=hLIxkknUY1qEk33mNlGnfp7C3XVSiZnlZVJPB7bPOFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZANvDLoMD2+UUr7gH4khOHDgrNhgSp+9FW7/myR9B/90NAMEysACmCCd+Xwz2/QScv7aq6oYVemmEBByOHsvwuKgjA2Cz0WWmTOPnVKSXed4ri1Tf6zITw/FauvIJwxRYOz0UzcUCvI0KuIPWh4rGWOogY5febgR8HPI5SSLzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MFUYTj7l; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MFUYTj7l"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9157d3f2098so205197285a.3
        for <driver-core@lists.linux.dev>; Thu, 25 Jun 2026 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782395508; x=1783000308; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aKYJf6dgXdgamkqA4Gs/PyiillXu8yFih4YnbHcGiuM=;
        b=MFUYTj7liC8bZroNHkOTT7lWvzLv2g84KUdlbV1WuumXGxMzn2ITFaTnMwOQpnh5eg
         NTYooFsHxEStm+CWOvDppkDJXoECaZ2CczrPPXPX0rcR3Vita2H0XQv4meXy1hBDLM4u
         RsPMI1MzYE3GYRFn/Tmmfn7o9+W37AfmYJ59tEbhlwU2ceId57aTkAH+6Ercq9/JP2J8
         oPAunXWFYDi4AYRMx6PfcN+dY3FzH2hW9WY0YVR71cdmatmA5xUmmhe5EJbkVIpQ0wV8
         CW23JZMDe8NG4LYw6O88i0zmxOmVqRHWwV5A0/11S6lKlDH/rxKX89eQvHnIIxYOBgI8
         97Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782395508; x=1783000308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKYJf6dgXdgamkqA4Gs/PyiillXu8yFih4YnbHcGiuM=;
        b=lasxJe1PTY/Vw6KDO+GpPHVzPSTkPjbHqjXwvarmaGbv9V+SoaEOBnh3FadO4qLzBn
         6L63HyG8717bYf8VTu/pxhbjIpLgdOoSi4GzHVVwBqVVKsjo6C9WGswFxpHX2Fpj2axi
         bUBbOcr9TXFlyvDU+YgimGcDX3AU7d/u+JKpYxIRqYNjyzNfagwNt/jPlHxU5XKGBsHr
         2X6sDckDVl2SrakMuuTyNjqAQCkElimDW1z8YF5ImqFLBVcUmmoDpeqVHGnclDYljT7x
         0li5bvvAxgijU0x7FWuSF/CDMtzu+n4K1h4v9M4m1qGBg7bBN2xmReBkRat97k1S5Z7I
         2RuA==
X-Forwarded-Encrypted: i=1; AFNElJ8C9px4PM7sidSlL+kDEEJb5xBQdn/C7V695qMWIYDd0VSZc7JGKW/FhSI31/LWpRrO2pKgSNClCJNCww==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJP5QQwr7eZ57Y+rebxQaov6XTiHu8Vwnfs3TxtlcK0r51XlOj
	x0jbJn6D/hUWG2GGd4UtIC7wjSrcMZfeSl+w6Ynwla3zICFu0JfjanOuekHSm0pgTxQ=
X-Gm-Gg: AfdE7cl498a8MFjhdUNoQCGYSVIr67ccOMQuyWUQwEbLGuCcMLnK7l7zYkyw6Gj7rBX
	5wP8ICGO0un6C2eEhFBnlWlze+PrKOetHSOcSX/FskUyOcMdzB4calAil6m2Drg/ecs0HFtsKxw
	0lFbpytPvjUHbiMMhj/+rWWts5+53JG5G5wbVM3TtOVdcy8VKcNgmWThHQpiClQ4UarDKebOV2h
	2YMQLEbYQU9JGGHq54IPt5CNwPI339T3/Tg+lHBoet/e+FeqQHlHlqh34bhI796wyQva5E34j9n
	0kGQ/MEESwJ2K0Eb2wUZoqzQZuSO+Ol7F6gabnT0PjpEjK0oGJsPfc3tb/9GT0/AKaAnFMty6QS
	81MZKb+/01pH/xbq5mkbQB9pbaOlPEjYIGJPcsADVk8Gr3oECsnRLdYwVxqCwO1hB+5lLoJlRHd
	RYu5tkNmH2lCZUbsxz27AuJKacgV3K+/XT3KFYoK/SPl0n0YQJuuCnE5PJXezwEze3mBazN7kPH
	//kkdA=
X-Received: by 2002:a05:620a:2887:b0:91e:7a20:3cc9 with SMTP id af79cd13be357-9293d5b247dmr385793985a.52.1782395507830;
        Thu, 25 Jun 2026 06:51:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f5ff5e6sm180208286d6.12.2026.06.25.06.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:51:47 -0700 (PDT)
Date: Thu, 25 Jun 2026 09:51:42 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, osalvador@suse.de, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com, ira.weiny@intel.com,
	apopple@nvidia.com
Subject: Re: [PATCH v5 5/9] mm/memory_hotplug:
 offline_and_remove_memory_ranges()
Message-ID: <aj0ybgV7n0pqXF0b@gourry-fedora-PF4VCD3F>
References: <20260624145744.3532049-1-gourry@gourry.net>
 <20260624145744.3532049-6-gourry@gourry.net>
 <d48feca1-0203-43ff-bd66-6243291a51ba@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d48feca1-0203-43ff-bd66-6243291a51ba@kernel.org>

On Thu, Jun 25, 2026 at 09:22:01AM +0200, David Hildenbrand (Arm) wrote:
> On 6/24/26 16:57, Gregory Price wrote:
> >  extern int offline_and_remove_memory(u64 start, u64 size);
> > +int offline_and_remove_memory_ranges(const struct range *ranges, int nr_ranges);
> >  
> >  #else
> >  static inline void try_offline_node(int nid) {}
> > @@ -283,6 +284,12 @@ static inline int remove_memory(u64 start, u64 size)
> >  }
> >  
> >  static inline void __remove_memory(u64 start, u64 size) {}
> > +
> > +static inline int offline_and_remove_memory_ranges(const struct range *ranges,
> > +						   int nr_ranges)
> 
> Best to use "unsigned int" right from the start and use two tabs to indent.
> 

ack, ack.  need to reprogram my brain to two-indent style, i keep doing
this reflexively.

> > +int offline_and_remove_memory_ranges(const struct range *ranges, int nr_ranges)
> > +{
> > +	unsigned long mb_total = 0;
> >  	uint8_t *online_types, *tmp;
> > -	int rc;
> > +	int i, rc = 0;
> >  
> > -	if (!IS_ALIGNED(start, memory_block_size_bytes()) ||
> > -	    !IS_ALIGNED(size, memory_block_size_bytes()) || !size)
> > +	if (!ranges || nr_ranges <= 0)
> 
> With "unsigned int" this will be !nr_ranges.
> 
> Wondering whether we would WARN_ON_ONCE() here.
> 

Seems reasonable.  Do we normally WARN when callers send dumb arguments?
Seems like sending -EINVAL is sufficient?

> > -	online_types = kmalloc_array(mb_count, sizeof(*online_types),
> > +	online_types = kmalloc_array(mb_total, sizeof(*online_types),
> >  				     GFP_KERNEL);
> 
> Is "mb_total" really more expressive than "mb_count"?
> 

No, this was mostly my way ok keeping try of what was being moved around
while working it.  I will change it back.

> >  	/*
> > -	 * In case we succeeded to offline all memory, remove it.
> > -	 * This cannot fail as it cannot get onlined in the meantime.
> > +	 * Phase 2: Remove each range. This essentially cannot fail as we hold
> > +	 * the hotplug lock . WARN if that assumption is ever broken.
> >  	 */
> >  	if (!rc) {
> > -		rc = try_remove_memory(start, size);
> > -		if (rc)
> > -			pr_err("%s: Failed to remove memory: %d", __func__, rc);
> > +		for (i = 0; i < nr_ranges; i++) {
> > +			rc = try_remove_memory(ranges[i].start,
> > +					       range_len(&ranges[i]));
> > +			if (WARN_ON_ONCE(rc)) {
> > +				pr_err("%s: Failed to remove memory: %d",
> > +				       __func__, rc);
> > +				break;
> 
> Do we really want to break? I'd say, just warn and continue, and fake rc == 0.
> Something is seriously messed up already, and we partially removed memory. There
> is no clean rollback possible.
> 
> Similar to __remove_memory(), ignoring the error because it offlined it already.
> 

This seems reasonable, will change to warn and continue + return error.

Sashiko actually pointed out there there's a corner condition here with
offline rollback, so i needed to tweak this chunk anyway.

~Gregory
