Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5EE333725
	for <driver-core@lists.linux.dev>; Fri, 27 Feb 2026 05:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772171045; cv=none; b=XMKGfRh9u2wsx8/YXpXCwGkaODuOpmyhBRUgBaRFMNl/rQkuVka0cn6Q9XAFsq0R9m8JpLigvr+DvrMkMpsPaRvlhK8VinZS4jauKJdqR547+XsItno/R1Rdw0QktazKfI4YUg3nE++NX2etPIIb7nlXPYxOv1grlcTZzxdAAGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772171045; c=relaxed/simple;
	bh=Urdf9IrYPZBmcHGZK6oZC6AvfEW8tNfV1PeNUDUyL3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9eD/6fPeAox4zOSpPEtus/L07PPIXBObUhsdrI8aIFqMdA1GrI53YixGOLi1Pgl8NYuj5g8BKwRwP8xMi/3Xkk2qqn6q9NsGHp3X/ctbFc3r7aTQOOhaud7BCHqY6+YY6xHdmrWSEY/kAXhztmsSTRTqc4XU42wSt5ZiAqOv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCgIMztx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCgIMztx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772171044; x=1803707044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Urdf9IrYPZBmcHGZK6oZC6AvfEW8tNfV1PeNUDUyL3Y=;
  b=oCgIMztxlRJ8ihObSRQUTFQ4iE7x7U4LCfDOs0ep9+FY+PEhgwm5ArNm
   qaB6UPWhTi1ZyPHiwHqbHO4mzSpLCdnQm1V2YBh28DdLF/GonOA7M90+w
   fBGWnvO2PYhy79lr6we6Kq9lPJaaJw2/3LPzcHhzujw3cyLHooCCXILSM
   AipBaOEwuVf+wTZdAeZvwwXGnNUeVcYnOKQ3ZhU0txLm8IZPqhxD9N2aP
   nZkKec+PbAFTBmGl2EuNsDHTx3llfgmlR6SUhp0J+pox7QHTh0cYhm1tv
   U7n47aa8KcsBS8Na2qSB6ADzXZlt3LDhjyJFvVqlTDwH9E8Zhw3kSVZY7
   g==;
X-CSE-ConnectionGUID: U3SHhRPtTASAc0QaXsQ3Nw==
X-CSE-MsgGUID: 1NvU4ytaTUO8pBauSoQs2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73121454"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73121454"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 21:44:04 -0800
X-CSE-ConnectionGUID: aIcOXHdASrWeWKCKSTCzTw==
X-CSE-MsgGUID: MLy3wzaPTlOdZ/adJ4t/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="213702182"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.65])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 21:44:02 -0800
Date: Fri, 27 Feb 2026 07:43:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] regcache: Move HW readback after cache
 initialisation
Message-ID: <aaEvH2dk9yTwaUc8@smile.fi.intel.com>
References: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
 <20260226135918.381979-2-andriy.shevchenko@linux.intel.com>
 <0c5bdf5a-459b-4ef8-95cb-3d1c0ad867bb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c5bdf5a-459b-4ef8-95cb-3d1c0ad867bb@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 26, 2026 at 10:14:55PM +0000, Mark Brown wrote:
> On Thu, Feb 26, 2026 at 02:57:09PM +0100, Andy Shevchenko wrote:
> > Make sure that cache is initialised before calling any IO
> > using regmap, this makes sure that we won't access NULL or
> > invalid pointers in the cache which hasn't been initialised.

...

> > @@ -202,14 +210,6 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
> >  		count = regcache_count_cacheable_registers(map);
> >  		if (map->cache_bypass)
> >  			return 0;
> 
> This is in the case where num_reg_defaults_raw != 0 (and we didn't have
> any explicit defaults!), it's the only place where count gets set...

Actually the check in the regmap_hw_init() should be done against count,
indeed.

> > +	/*
> > +	 * Some devices such as PMICs don't have cache defaults,
> > +	 * we cope with this by reading back the HW registers and
> > +	 * crafting the cache defaults by hand.
> > +	 */
> > +	ret = regcache_hw_init(map, count);
> > +	if (ret)
> > +		goto err_exit;
> 
> ...and we now pass count off to regcache_hw_init() which will attempt to
> allocate a zero length array and presumably faceplant if that happens.
> I don't *think* we should ever hit that case (at least not for a
> sensible regmap), but I'm having to think far too hard about the whole
> thing to convince myself it's safe.  I think we should keep the counting
> of registers to allocate and the decision to call regcache_hw_init()
> more joined up.

Is it possible to allocate something, then count, then reallocate
in the existing caches and in the potential future ones?

I think it's the patter that we first count the size of the allocation,
do the allocation, and only then fill up the allocated area with data.

Otherwise we came back to the chicken-egg issue this patch tries to solve.

-- 
With Best Regards,
Andy Shevchenko


