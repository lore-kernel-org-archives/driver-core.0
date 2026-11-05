Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901260;
	b=SAOFnjCtmBt4JyrZQstYQgKaCN+81jIAfbs+45jVUR9Yf/AIkESygsnr31akTnYfQhgF
	 ccfY+r/iYqPJ0gZN3pGarsSRUEYhrcPYFkaHgui5HMqszrmzvGpWASLswqhUllsPS1NS6
	 IkinxKbSqrvICGDpzw61UIzrQ1rxbHm9Z0QX47eGGRGFGGNBf6yFjU8Iew40gLouYCa9D
	 taOlfdN4gTjPXpIik3EXy1sjZkOGMNuQJ24nBhOOWPLnf3qXt6LjVuedoIme73igf2PZA
	 2EIaLe0HwM6s40sxQ/2Z9vLafyMIDvinFtT3Mon3/nmhAonTdKtlDOMmjBDIBGrHuUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901260;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=IUS9uy1A757F7l9nAmXx+AvA2dFR9sGvwvphdz+BVvQ=;
	b=hahwj5o4zin/kajeN3S5eAg0OV4bxvzBDJHDd58Yf2d/00anXAwAh1rk3wh3p/bIqhu+
	 HQwbz6H4fjGccXoF8anqEpedET+37XbaPqAdVYcrkEZd8LTmvQgHjLpdafWtjoqQDKOo/
	 6+1l2g2owz9vFkeT+gJSPcM8/OM/aFJ7BvVawy+oM9udp1oT8/EF+kMq0/u9538shZ3De
	 VIVf03O2D+LSNNMbaih+FsUXPf/8Nq2gAVMZGMdVaz+a0Iw5jdWVHDrvb/lduIhkRa4NC
	 3UQfJYvUw10IbEu7Nfo9+99mFG5LHD14KcKpuLWwlQmPgWO3rUT8NsvkCcAMbExtCUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqGflQhA;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8823606A330
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 17:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8823606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqGflQhA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793901260; x=1825437260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WtBNB9JFBHsmj3js6YP38W4eYVV19WpWJBt1NYTfGIc=;
  b=EqGflQhAXlaN0kt/9A6Yc2ROo2EpFLfPEQd/3U3+uZXEKsuY/VqNTI9n
   4F6rhNk7gSVqqSkybPmls3ENjuSJ3WxZZYf9FnCvQeymo20jd9YFBLp1t
   t/nIy+1STFTNXlnfJHmrtvShlWjvBczIUQCGO0uMsxGenTomnZ2uIPXi2
   6gqHxs8IOvi14fpqteZdtr98jlVHNO0GJthZMqoBhzh3QbDyKaDdXq/bO
   y3jpd5auv9/XXPcly0Wd93yPwOhj/RH+rxGewProg5sSAvZMzbGPgZBmD
   Qo3PxoBZt0GlB9469ZWBXv2nuIikzP09HowsrDyMws0b2yKHFtFrjBjpr
   w==;
X-CSE-ConnectionGUID: 99Xc4vZ2QwW8XL2rliykKw==
X-CSE-MsgGUID: ANfgpHbLQJa9XyJwiLXZJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2603774"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2603774"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:54:20 -0800
X-CSE-ConnectionGUID: mnW3WlSUR0aEpQAfIuL3fg==
X-CSE-MsgGUID: ANMFLOeBTzeuxMI1sqsYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7404699"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:54:17 -0800
Date: Thu, 5 Nov 2026 19:54:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: broonie@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, peng.fan@nxp.com, rafael@kernel.org
Subject: Re: [PATCH v1 1/1] regmap: Add REG_FIELD_GENMASK() helper macro
Message-ID: <auzCxxkUB9p6WKNC@ashevche-desk.local>
References: <20261105103533.1426533-1-andriy.shevchenko@linux.intel.com>
 <SN1PR12MB2528E9E6548816E119881537A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN1PR12MB2528E9E6548816E119881537A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 09:39:45AM -0600, Victor Chernyakin wrote:
> > #define REG_FIELD_GENMASK(_reg_field)	GENMASK(_reg_field.msb, _reg_field.lsb)
> 
> Macro parameter should have parens around it:

In this case no, it shouldn't. It a shortcut which assumes that _reg_field is
not an expression.

> + #define REG_FIELD_GENMASK(_reg_field)	GENMASK((_reg_field).msb, (_reg_field).lsb)

This doesn't look good as it implies that _reg_field can be an expression that
will be evaluated twice.

> (In the patch you link to, I wrote it without parens at first too,
> then had to figure out why I was getting "too many arguments to macro"
> error messages)

This is strange.

I have compiled it with GCC-15 and clang-22 (in both cases sparse enabled),
no such a problem (It's also -Werror build). Can you elaborate?

> BTW, I've been thinking about making reg_field store the mask directly,
> by putting GENMASK(lsb, msb) in the REG_FIELD macro, but that's probably
> a more involved change.

But it's already there as you see in the regmap core. What you want is to make
it at the beginning. Not sure if it's feasible and needed change.

-- 
With Best Regards,
Andy Shevchenko


