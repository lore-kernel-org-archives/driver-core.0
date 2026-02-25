Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2083A1A33
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772047605; cv=none; b=q0KR2vSInB7rSbutVSO4vNEKEAZDM4FIa+q328myIOQ4pr8Ttw7B/p8eck5a6M9NFRm6SswVdNhBdmDddaHPEG4UFAKofwyViPDBC8x4AFFeYmaGDoYk1w/2jMNgOe7fky9wlCZOUboFSHJBhf/LdrFB8Pdy3W7A7ZYKMjbHQCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772047605; c=relaxed/simple;
	bh=ub7mL0+IiO2mWUovlUWmK2nAMWnT8ED4nvtmT1kY7Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWIvzUOZbAqYIX5VRGlSTD5NHZ9vBVzkhPXC7diR06IvkPbWhmZIxHXor4UESYftWKZAcTvmYjAQsZUujRr/51xowGxxllkZuH9nMQ0cd4EAMjPmSDsnpUn8JaUMlwrLlXyzWnGYx1rI/EkoJi/+cP7dXy6EqTpaDqbBO7M0qoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRwylElh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRwylElh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772047605; x=1803583605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ub7mL0+IiO2mWUovlUWmK2nAMWnT8ED4nvtmT1kY7Lo=;
  b=JRwylElhgFsCRBvo7iwQ+2WyuYrP8vcJGTslqE3CWsD1Mcnj8m8hJY1z
   z03JAypzb3e51t8SgJ491/x70VSBunT+LEW2zzdu4Y+2CaVjG7BlkcZeb
   /AkInvKopSF+q7nROLlzdEJy0CP9jq581A7lu8IIkHyFwE5NPOgPLaqLP
   f3fs1Il9Ft8mRgunrZziy15F05SXQqKLvfG8eRPH97m74C/qpyU/ygZ6t
   O3EYkMydSqnMZocSI07NG+b+6+PUDWX7BX2NITHRLZLsb7OEhKwaTqIaJ
   Yhnp+d/xK4iSTjQJughuA79KTiqs2t1w/yLWFtpfWJ5PRyqT+fGZbHd4e
   A==;
X-CSE-ConnectionGUID: r3kc+N0hQjuwN1SaI7LqeQ==
X-CSE-MsgGUID: FYV9xYdwTfeKOwIZ463fcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76703835"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="76703835"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 11:26:45 -0800
X-CSE-ConnectionGUID: QfjjD+XmRb+ItGtHWTX42Q==
X-CSE-MsgGUID: MaNszTomRCCnWWFCqXo/+Q==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.71])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 11:26:42 -0800
Date: Wed, 25 Feb 2026 21:26:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 5/5] regcache: Amend printf() specifiers when printing
 registers
Message-ID: <aZ9M8OcwNUGusWUe@smile.fi.intel.com>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
 <20260225161659.3811671-6-andriy.shevchenko@linux.intel.com>
 <a2e1dc8d-584c-4c72-8e9c-558a220ab5d4@sirena.org.uk>
 <aZ9McAzXLejc3Ttl@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ9McAzXLejc3Ttl@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 25, 2026 at 09:24:36PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 25, 2026 at 07:15:18PM +0000, Mark Brown wrote:
> > On Wed, Feb 25, 2026 at 05:15:59PM +0100, Andy Shevchenko wrote:

...

> > > -	dev_dbg(map->dev, "Writing %zu bytes for %d registers from 0x%x-0x%x\n",
> > > +	dev_dbg(map->dev, "Writing %zu bytes for %d registers from %#x-%#x\n",
> > >  		count * val_bytes, count, base, cur - map->reg_stride);
> > 
> > I'm really not convinced this is helping legibility.
> 
> You mean the only this hunk, or the entire patch?
> 
> If the former, I have no strong opinion, can drop it as 0x%x is (almost)
> an equivalent to %#x. For the %d --> %x I think it needs to be applied as

> it makes harder to debug and follow when some of the messages use register

Under 'it' I meant here the decimal printing versus hexadecimal.

> printed in decimal.

-- 
With Best Regards,
Andy Shevchenko


