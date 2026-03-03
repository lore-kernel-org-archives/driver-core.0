Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5E3C3C05
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551795; cv=none; b=vCsRfaq6tETF6TgVYgQOgAwvoOnLQyyDPhOhyC60vE7uPiwrFPJtwq34THMAZVKLAKmdxkmXf2zrg9jEjY2heZz75y0kAu0ExegrdprnF3C64OPlLiGgoFjtrkC6cXjd+pbIv7oaqZApIHPUfWqe2yBNySjvh0lZfjmXKA8WY0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551795; c=relaxed/simple;
	bh=07r3yBhfvztjptDvVA5Rbqr3TCsrUGcV8ep93aLnM6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=md7jiWUtN09xFSiP5X/pbPfC8Ibe0Yk+ZYvLatEPzdxPdN9pb7nhkuar8VN0LCeVolfsyyI3UWpwLSUFoI4Az/EO5BUWnZXNuc7N/PnJMYAmHAmISwEsvOIAGFDo5PLue3TBZ29csylrrrrtwDVpQfWi2ZjiMLTlAJFK5WKnzJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRDjJHYL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRDjJHYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772551794; x=1804087794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=07r3yBhfvztjptDvVA5Rbqr3TCsrUGcV8ep93aLnM6A=;
  b=bRDjJHYLonUiSmXfSZs2lFoAKA2fagE9lVeE7rkYN6E/MaD+aAIsTPjS
   ohmgQ/e4vZBvFVAzXzzzO7jidSeRMK2Q3fhdszEr+wr4H8MxsVTjkAhi5
   HYIfEeMDDcwmgGofmFL2O/JEYczr4jG7xyvC3stsuuBKwLTf7Wtk0qBlW
   or0ZxTM90UkClQDprhGJFNRAL2X4Cx9rmArIiFtVQtQ9aSXodR4qmX6AQ
   PrhN/ziuUEBB35vI2btsHpS2fvoo4yXee3cccHuVdX59VksrL46vt1vay
   Q+hzWUnryzjMtRwZOK1gYZb7z0AG43Ptqo2B425k9sdpvV9o1SulIAmIm
   A==;
X-CSE-ConnectionGUID: YCgIrhZ0TbCwkDXier3aJA==
X-CSE-MsgGUID: YKN+EO3YR+SxL00nCtAocA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="61168189"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="61168189"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 07:29:53 -0800
X-CSE-ConnectionGUID: mPLR1ot5Sqay3oew3tJiYA==
X-CSE-MsgGUID: rQGwBZjqSCW6qm6UpzraOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="217983775"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.32])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 07:29:51 -0800
Date: Tue, 3 Mar 2026 17:29:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v5 2/2] regcache: Move HW readback after cache
 initialisation
Message-ID: <aab-baa1AwINiug9@ashevche-desk.local>
References: <20260303092820.2818138-1-andriy.shevchenko@linux.intel.com>
 <20260303092820.2818138-3-andriy.shevchenko@linux.intel.com>
 <b619232e-d7d6-493e-b033-86850429af6c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b619232e-d7d6-493e-b033-86850429af6c@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 03, 2026 at 01:03:11PM +0000, Mark Brown wrote:
> On Tue, Mar 03, 2026 at 10:26:25AM +0100, Andy Shevchenko wrote:

...

> > int regcache_init(struct regmap *map, const struct regmap_config *config)

> >  		ret = map->cache_ops->init(map);
> >  		map->unlock(map->lock_arg);
> >  		if (ret)
> > -			goto err_free;
> > +			return ret;
> >  	}
> 
> We might still need to free the copy we take of supplied reg_defaults,
> it's not just the hw_init case.

I see, so someone transfers an ownership to that allocation...
I'll check more, thanks!

-- 
With Best Regards,
Andy Shevchenko


