Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F5C31618B
	for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112450; cv=none; b=ln0mUyGoKEnJSIkpEsZGxITsVrkbDl7bfqK5ZHlIOKsMK2j5q3wBJXnzgWHuINY8Oz7kw1RQi7BvOj3Jc+T0Go5P7DLF1+Gb0hGIuq7gBTOuHp5vjjna1REJ/uEhIi30cyLfU5JIZuX4L2WiRGlprfFF2LzeCoi1ziaGBQA3cx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112450; c=relaxed/simple;
	bh=ZbtxohpAd7XevRSzWb1jB00Cp4V3mlLP630+WR/lX/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpBmVC3uIxlLxwYdVNPURIc73iWWu1yCVFAhgKabG3lCowTWdSt63Pqb3vwWdUCFmHwwLleiys9FtwYtBFAJ+mJDl+JE0NakMKm07GOs89AAMRn9awVY6nFT5ARf3u1xoL3BKVKNDMJRDhB3kvjRq4QP7KKlK88fZYCUmDlNsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fq0rvifo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fq0rvifo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772112449; x=1803648449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZbtxohpAd7XevRSzWb1jB00Cp4V3mlLP630+WR/lX/0=;
  b=Fq0rvifoHDg5k3JQbwUugz++q/jocuUa7YqNnXxPp2hSIOGTnnXSf2vO
   njK/KbgMpfW4NcEaNBGeFhUI6A04ORMdtlVCb0d+jJaOLak9RceuKn59l
   RXr1aS9fsEtpBwQXoxYNtjl5HkYGE5nvg41qCBkMbTFpQdZuicYp6eTf/
   a/AFQt8QnVqPuHY0WRNeQDcZ+BhBPbMAfyVPfcfqe2PDKW+TY5JA7JKnt
   c2021jIMMI+ipXNne+cPO55ln+F1ZQUb4H8Dgrm1WA1kMWVmZaDpinO2V
   2JtkdjF8L9dmIIDPYPXYQx7YlxQZxoUjaqAOfoJWmqXCixMkqP4Bcymvc
   w==;
X-CSE-ConnectionGUID: 3IbxJEIgTPCYmOOqjee2+Q==
X-CSE-MsgGUID: npn9moh+SiOAWXU5kKL12A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73042333"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73042333"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:27:29 -0800
X-CSE-ConnectionGUID: 1eVSJ4QKSnKrdUHAl+zfEA==
X-CSE-MsgGUID: sif8wtyaQlC0+JPS4Qy+uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214546503"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.167])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:27:26 -0800
Date: Thu, 26 Feb 2026 15:27:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 3/5] regcache: Move HW readback after cache
 initialisation
Message-ID: <aaBKPIsYHnvRSGL0@smile.fi.intel.com>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
 <20260225161659.3811671-4-andriy.shevchenko@linux.intel.com>
 <ea6308f8-2a70-4b46-8052-b98d6f5ca5c9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea6308f8-2a70-4b46-8052-b98d6f5ca5c9@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 26, 2026 at 12:20:44PM +0000, Mark Brown wrote:
> On Wed, Feb 25, 2026 at 05:15:57PM +0100, Andy Shevchenko wrote:
> > Make sure that cache is initialised before calling any IO
> > using regmap, this makes sure that we won't access NULL or
> > invalid pointers in the cache which hasn't been initialised.
> 
> Either this (I suspect it's this) or the subsequent patch is introducing
> regressions in the ASoC tests on several of my systems in the form:
> 
> # ok 1 get_value.AT91SAMG20EK.13
> # # AT91SAMG20EK.13 Inpwm8731 1-001b: ASoC error (-5): at soc_component_read_no_lock() on wm8731.1-001b for register: [0x00000004]
> ut Mux
> 
>   https://lava.sirena.org.uk/scheduler/job/2498613#L1549
> 
> It's not absolutely everything but it's multiple systems (several with
> Wolfson devices, plus the Pine64 Plus which has an integrated Allwinner
> CODEC).  I didn't check beyond seeing the failures yet.

Thanks!

I also run kunit test cases and it seems like half-failing. I'm about to check
deeper what's the cause. (Obviously it works in my case on real HW, but...)

-- 
With Best Regards,
Andy Shevchenko


