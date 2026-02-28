Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645061C1F02
	for <driver-core@lists.linux.dev>; Sat, 28 Feb 2026 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772286948; cv=none; b=AxQKizEPURVSwLPSn/1FnjFrVW8syyIHGFMM/UysoFqnpu/S0Ea5JUwDsPGTI9CDGGQHozxcMplta6WFoMedoUfdtrs7bBgsljjFRDsM6raWIyJ9I1A6aVxG2jQWJIxw5GLH+f/GasK4/hUXCxeNV1gcgr3FhDEYSjtLCFYlY4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772286948; c=relaxed/simple;
	bh=cSbB0gDTIs9/isci7DT5u4IDs5A8Pp/jsT55yFiD6M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvO9y35VboXGUfBpUoNUa25g5NMEfSYjYUgxMsHqUqX+iQ6LsWqfyEykqvUIeE5vXKC88BRz9yKf0hZYAOrbFGLIUpVX6lnUTJY6Nk2Lvzj4+4hL50rj3X8GyUdY+WbPY9TGRRfBOTT5HiOQVivCKNlh17pJp8RzTZt9HyH4ZGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhHTruzC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhHTruzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772286948; x=1803822948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cSbB0gDTIs9/isci7DT5u4IDs5A8Pp/jsT55yFiD6M0=;
  b=ZhHTruzCsmiokxOKjR07a67NVZVHmpHI2Hr1jbT7W0SR49U4p8aKaoba
   ig14sAWfgfa/M+jpw/3bTGlq7h9hE8YC6auIFElsjiG+Flqbt718HEV69
   X4fmhlo6LiQUldA4+zoez/yXJApwB17nGcryBzc0NGWNbwRdS2NvejQ7k
   xU8/PDsB1eNWn+ax0EHXkL+FL9shvOHum0bN/HZmskNtP1Qkscv7Q7gUL
   nlJkKSCinYKB+L0f9CNCJ/PzDmthsNc0N9N8mxQ/GVmEIREREc/bWU7s9
   +bcPmnyWK+N7De2SZ9zMwRqlOTBISOvDwoUB2bxnV2qrf44scjVFolVc8
   w==;
X-CSE-ConnectionGUID: whY9Ck9NTzicsHMJJ0OAPQ==
X-CSE-MsgGUID: o58lZwIGSw+XFBxPzUGPIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73058681"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="73058681"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 05:55:47 -0800
X-CSE-ConnectionGUID: 8MSbdd7xQyqmJPRZhD/Z6g==
X-CSE-MsgGUID: +CVqTfWXT02XnwBoZS/uDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="216311550"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.224])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 05:55:46 -0800
Date: Sat, 28 Feb 2026 15:55:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] regcache: Move HW readback after cache
 initialisation
Message-ID: <aaLz3g6iMIvij8AF@ashevche-desk.local>
References: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
 <20260226135918.381979-2-andriy.shevchenko@linux.intel.com>
 <0c5bdf5a-459b-4ef8-95cb-3d1c0ad867bb@sirena.org.uk>
 <aaEvH2dk9yTwaUc8@smile.fi.intel.com>
 <aaLo9QdbtR7u6y3c@sirena.co.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaLo9QdbtR7u6y3c@sirena.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Feb 28, 2026 at 01:09:09PM +0000, Mark Brown wrote:
> On Fri, Feb 27, 2026 at 07:43:59AM +0200, Andy Shevchenko wrote:
> 
> > Is it possible to allocate something, then count, then reallocate
> > in the existing caches and in the potential future ones?
> 
> > I think it's the patter that we first count the size of the allocation,
> > do the allocation, and only then fill up the allocated area with data.
> 
> > Otherwise we came back to the chicken-egg issue this patch tries to solve.
> 
> The main worry there would be transiently consuming huge amounts of
> memory if there's a very sparse regsiter map, though we'd also be
> burning lots of CPU time checking all those registers so perhaps it's
> not a real concern, and the whole thing is kind of an edge case anyway.
> Though now I look again we are careful to bypass the cache during the
> hw_init() so we should be safe anyway I think.

Yes, but amending check to be against 'count' needs to be done for clarity.
'count' represent the amount of cacheable registers, it is independent number
on how sparse the map is.

I will send a v4 shortly with the above amendment.

-- 
With Best Regards,
Andy Shevchenko


