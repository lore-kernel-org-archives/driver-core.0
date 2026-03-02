Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA2F280035
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464166; cv=none; b=i1zIBomSUdySep5MOI2jVhY9Bek4R9Wr9Gd45KcNUVc6GsK6cfZYltp2y4XbRJ5z8s2UI4IfInHp1ENMVF3UnnTo54wFtvq4zUaTYXN9DHZtwK+D6+c1BZFQCuPgmVfvyUmRMWnZDqTR8X6aBKg/tAJcAqb+ZfVNIysrJigJ38k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464166; c=relaxed/simple;
	bh=UL3h6xwVbOb8wQTkfrNJHrlQDwvqJBlklayYiPUNgnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ighWQRlwpaWUXglx4mqKL7xis0nttq0Hm5w6YcKp+tmaE9bNdRha7hLJ+VdOTEgNxZVchpsM/8zRyCSM+dg3OZdA+xWFS1aYCwAyl7uw7kbFSuma8CXAunAglvPeZLVMm9WtBWylvGY5038HNjXOkrD0uIbX+Y4yidO202YYXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTr5SWOM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTr5SWOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772464165; x=1804000165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UL3h6xwVbOb8wQTkfrNJHrlQDwvqJBlklayYiPUNgnw=;
  b=hTr5SWOMvoGycIpFHE+TZ/bxkgF/yZrvSGhi9axd2Rq5VZXPjbY4h2po
   su2ZOu3tt04oyb9nV8jH6gMy+iHIPoHzFA0TsQw2gaLOuzsM56hBXKlvT
   d6F8vMSqpOdOC5x038BDEngjq2BPY88jimBY36tWcAcdRoW8/mW3v1npK
   n+fvHeXQPZ/NmDiMVRMCxQIOgTCWODVLYun/++YXPwkx6tOmFh9vNI3Y9
   iLlHsW8WvWc7JbYlvWbjMOKqUuytNDG5DYupUxeki2KIE9jRBKbrvNDwK
   vcMsPR4hDNL5TzrWC8um7MImxodW4PjsvjL+TtK8AfW7CTW89+dsnM6gd
   Q==;
X-CSE-ConnectionGUID: MJBcEc1VRr2wFcMAf47NXg==
X-CSE-MsgGUID: +6Fl9ER5SOGlYdAxIWJmlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73374377"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="73374377"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:09:25 -0800
X-CSE-ConnectionGUID: jj+gmaeIT/GXTmjvYRllog==
X-CSE-MsgGUID: Acr+AjS8S1eqvXFZKXWfdA==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.52])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:09:23 -0800
Date: Mon, 2 Mar 2026 17:09:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v4 1/3] regcache: Move HW readback after cache
 initialisation
Message-ID: <aaWoIPZWIzPv1t5d@ashevche-desk.local>
References: <20260302095847.2310066-1-andriy.shevchenko@linux.intel.com>
 <20260302095847.2310066-2-andriy.shevchenko@linux.intel.com>
 <90f16d38-b698-4a84-b4f7-49597f353dfa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f16d38-b698-4a84-b4f7-49597f353dfa@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 02, 2026 at 02:49:49PM +0000, Mark Brown wrote:
> On Mon, Mar 02, 2026 at 10:56:55AM +0100, Andy Shevchenko wrote:

...

> > +	/*
> > +	 * Some devices such as PMICs don't have cache defaults,
> > +	 * we cope with this by reading back the HW registers and
> > +	 * crafting the cache defaults by hand.
> > +	 */
> > +	ret = regcache_hw_init(map, count);
> > +	if (ret)
> > +		goto err_exit;
> > +
> 
> We need to delete the free of reg_defaults from regcache_hw_init() when
> it fails, the error handling for err_exit also frees that so we'd end up
> with a double free.  Which is awfully error prone and part of what
> you're trying to fix here :/

Ah, looking again at it I see your point.

Indeed, in the error path of regcache_hw_init() we free the reg_defaults,
but the same is also done at err_free label of regcache_init().

NULLifying it at regcache_hw_init() doesn't sound like a good idea as
you pointed out as error prone case. I will think more about it, thanks
for catching this (I dunno why I missed that one)!

-- 
With Best Regards,
Andy Shevchenko


