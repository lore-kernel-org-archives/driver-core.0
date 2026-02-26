Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824B284B25
	for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 13:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113304; cv=none; b=qwc31VJxFBRNhhl4Rois3cr52zGA03hHilUIOZ328ED/Wcbpd4Qg1ad0J3lrF5knpH2Ml33I7ImLJ+Gn9YGB3yUOQd3H+EDtrT4XwBg8jP9Nb31RwLPgHA0wYc6r+eNCGrlI3Wmcw821Wmj1oLDg4CWuBKzlMlz/rmg6CSVNGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113304; c=relaxed/simple;
	bh=m7FsA3GpWl40T2XCj5FLjlr27oaxGzyPfqcaK+9j+eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZOVpl3Q4eI/lAzfTTfy0AHM1YAzVfOBQ8nPIKZuyyXfrzCIoediUmqDalVsB0ncUQrxCQxTx8KDQnVa0SRGl1m7xWzh3xjwvNIsFCJ/SIA5P3e95uKPumhoPkThp3HW6AgaOfiwRwNn80q8OkoIMGIgXAeumgXDp0aN6XwTCxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1i7ITPj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1i7ITPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772113302; x=1803649302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m7FsA3GpWl40T2XCj5FLjlr27oaxGzyPfqcaK+9j+eg=;
  b=M1i7ITPjqDi8l2MjzxtCvGZy+j4wE9wJBkJmyECeDMdiv981SSfHlOVW
   +Gb6t0XgK83XVGW5fHx8IuFxawurxKvKtcaZ01VaDsipldY3k+GaBwKta
   rAuoldsyOtI2AZhR6Zyzj/PnBq/8/5a6Q+CN7EWbC/khtZiKODuGe8ahW
   pLBxFKOJfhJP9sJ9YHSxHMCmwy00qaNLD8639AdTJxwr6dncUVkBaSmGl
   ZSMnAhukSfBd8lZBEuZW6Zk7mwkkfRO311RuOUlG4JO9qt9PtXrFXlkZm
   0L2KzK4d5yvLiy12Ko8uCKwhiKlI3H5Fmv9idJwyEwNrltqCx+X+8B/1I
   g==;
X-CSE-ConnectionGUID: 0IOvnNEsT96Lc5Ux/7b2Gw==
X-CSE-MsgGUID: YDnTiISrStqHXmoWZ4gOcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73217714"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73217714"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:41:42 -0800
X-CSE-ConnectionGUID: aq36DI/BSFaLbFy8L5zWkA==
X-CSE-MsgGUID: ZpbCky4wStShau9Ib9+fGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="216583309"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.167])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:41:40 -0800
Date: Thu, 26 Feb 2026 15:41:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 3/5] regcache: Move HW readback after cache
 initialisation
Message-ID: <aaBNkthHVhR1OL_Q@smile.fi.intel.com>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
 <20260225161659.3811671-4-andriy.shevchenko@linux.intel.com>
 <ea6308f8-2a70-4b46-8052-b98d6f5ca5c9@sirena.org.uk>
 <aaBKPIsYHnvRSGL0@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaBKPIsYHnvRSGL0@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 26, 2026 at 03:27:28PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 26, 2026 at 12:20:44PM +0000, Mark Brown wrote:
> > On Wed, Feb 25, 2026 at 05:15:57PM +0100, Andy Shevchenko wrote:
> > > Make sure that cache is initialised before calling any IO
> > > using regmap, this makes sure that we won't access NULL or
> > > invalid pointers in the cache which hasn't been initialised.
> > 
> > Either this (I suspect it's this) or the subsequent patch is introducing
> > regressions in the ASoC tests on several of my systems in the form:
> > 
> > # ok 1 get_value.AT91SAMG20EK.13
> > # # AT91SAMG20EK.13 Inpwm8731 1-001b: ASoC error (-5): at soc_component_read_no_lock() on wm8731.1-001b for register: [0x00000004]
> > ut Mux
> > 
> >   https://lava.sirena.org.uk/scheduler/job/2498613#L1549
> > 
> > It's not absolutely everything but it's multiple systems (several with
> > Wolfson devices, plus the Pine64 Plus which has an integrated Allwinner
> > CODEC).  I didn't check beyond seeing the failures yet.
> 
> Thanks!
> 
> I also run kunit test cases and it seems like half-failing. I'm about to check
> deeper what's the cause. (Obviously it works in my case on real HW, but...)

At least one small amendment fixed all kunit failures for me. I will send a new
version soon with also fixed patch 5.

-- 
With Best Regards,
Andy Shevchenko


