Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B60A26C3BD
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772047478; cv=none; b=IlxT8HlIJp83HkXyRwk3r2aoaqb9+Mz1moIlgAmx/ljFmwPiuTXVycj8j8n0+pw7I0N9RD4Gd0B+tLBYfqaB70rqZ67K5xfK3CZjhCVc0LvWKMGru1NV/W3+jBJjMZzD7TDCQT6RYEwH0mLl7zTZbQh2vU5rUI9r/zhMV0xFu+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772047478; c=relaxed/simple;
	bh=5e3nQ394jT1s5ZI4k8N0VKdWMU3Hx+G+51Hsw08u8vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dg/kq1WOKz/WFpoSpMBi9zHJBhf3LNahhdquDPN8BEMMSaF8O0z260lXAUR2aF9PVb9XOY59uvRYD7Apb2PWYD+7RwX0QBN6deB+e9jHZ0+CtZwh+Maqt+tIgFbhG8mz6IR8jfGqlkr6O/M54fZSi7jpyckPV1p69agdiLGZ0Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kglRH2dc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kglRH2dc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772047477; x=1803583477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5e3nQ394jT1s5ZI4k8N0VKdWMU3Hx+G+51Hsw08u8vU=;
  b=kglRH2dcJVIjFVTvYo1d5Awrs4OmncYcrspnkfNn4JESaeuEF46pi6F2
   f+yjvsGQU113Z9t0zwTsPP8lnHXg/H4tKjOgW+BmPee9nGeK1GL8QE1vb
   cOEVn1C8f5FkK8JB6rJ1Ypt36+ssvPovBCU+iVPE+PBrcZtSMUDblkHy5
   o5Q9JpzZzQ/h4Ull5wJ3L/WaJB+TGWoxTnPWZBuyPLOL9qvkbmvhAj21c
   JTW9Suq5c3YQLeZ/7zfYVz9uzBjzhb2v9e8paPc0bnVRr5OgugesJkFGM
   F80bNdYN17YJl9V0pJPh04zHZnqXkvFH9/Y07XZKrlacmp2OzhIPdtY+c
   w==;
X-CSE-ConnectionGUID: heuCkk1oRZKUgojcchKS/g==
X-CSE-MsgGUID: dwNcREt4T+u2FdHeeuZd4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76703398"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="76703398"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 11:24:37 -0800
X-CSE-ConnectionGUID: a42milijTdyj8ApFfWYVIA==
X-CSE-MsgGUID: Ewfflg5oSy+WVk6kF/Eq3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="213417444"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.71])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 11:24:35 -0800
Date: Wed, 25 Feb 2026 21:24:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 5/5] regcache: Amend printf() specifiers when printing
 registers
Message-ID: <aZ9McAzXLejc3Ttl@smile.fi.intel.com>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
 <20260225161659.3811671-6-andriy.shevchenko@linux.intel.com>
 <a2e1dc8d-584c-4c72-8e9c-558a220ab5d4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2e1dc8d-584c-4c72-8e9c-558a220ab5d4@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 25, 2026 at 07:15:18PM +0000, Mark Brown wrote:
> On Wed, Feb 25, 2026 at 05:15:59PM +0100, Andy Shevchenko wrote:

...

> > -	dev_dbg(map->dev, "Writing %zu bytes for %d registers from 0x%x-0x%x\n",
> > +	dev_dbg(map->dev, "Writing %zu bytes for %d registers from %#x-%#x\n",
> >  		count * val_bytes, count, base, cur - map->reg_stride);
> 
> I'm really not convinced this is helping legibility.

You mean the only this hunk, or the entire patch?

If the former, I have no strong opinion, can drop it as 0x%x is (almost)
an equivalent to %#x. For the %d --> %x I think it needs to be applied as
it makes harder to debug and follow when some of the messages use register
printed in decimal.

-- 
With Best Regards,
Andy Shevchenko


