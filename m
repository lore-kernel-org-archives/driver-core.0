Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787943F5BD7;
	Mon, 20 Jul 2026 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546023; cv=none; b=mIys1Giwoc7+SgWTTt3qQZxOwOmRGQ9FTmnIFkaPFNM9ypXH44tBAHD7IMZfI1WWGT/qvxWQHbyfzXZ65ACav1f6s4sC6Lce+DGCVF0BuKrIRR4SZeGtSvwpKmRHTHSxFSGt6mjO66Xpu1+3g/6GH90P+Pp+ievMTqcCbntsZ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546023; c=relaxed/simple;
	bh=UoOkOjXK/eq666QDSditd8bYofM36/qV2yt6H7rc+r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgD0tN40BWG0SKHx/zwTpe7QzVt+ltj9yVb0I54EB/ebj50+0n0wWr4K8j1WzfOXWylsqnKaSu4JLst8qUt8/8SP04AyN6Llt85yCJUkFH/IEQDbs5OrcpM0B/RY30ify2bpGiHnSX6ojpbI6hpo5clhyyA/uSqeiAquOe/o4nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1aGF/Ru; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1aGF/Ru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784546021; x=1816082021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UoOkOjXK/eq666QDSditd8bYofM36/qV2yt6H7rc+r4=;
  b=Z1aGF/RuKmOiTEOjB6pc7kRTsErnzN577ZYC1T8acutnfKD1mxrt92mw
   GeRgu0AUVzDzVqr6zKgcnFUXm//F8bafyKDXBUHUJccvJpBGCVbuHKUgn
   iaD7MHqLK+2LxbZdUpzUAIPhPhxqp8LFABbrvd3yOxHkMsL3YOyQF0+bH
   Acu+XZHpjaZaGSQQ6+ocayakI0L6zFkDxXuV2vyzVgPIdxDjcLIDPA4CJ
   6H3PZoKIHuNcRuUPoi75XxFXCTIzQzJEu65zqdNP1nAuGBpWQAuiHCjRZ
   +9SrTnBfEY9qgAYcaRgdllpr+v76gFvo55ZyIFXvafsw2Jr2QQ8yJvfoV
   g==;
X-CSE-ConnectionGUID: 4skNy4bERHyAcC8E+8Y22A==
X-CSE-MsgGUID: w9LAOhIMTjiI5kGlPEvnbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95483956"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="95483956"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:13:41 -0700
X-CSE-ConnectionGUID: R8CN/uMaT1KCL84PtYA1kw==
X-CSE-MsgGUID: Hf0ulx9rRrGCvZkJwZtRDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="251086217"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:13:38 -0700
Date: Mon, 20 Jul 2026 14:13:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	robh@kernel.org, saravanak@kernel.org,
	bartosz.golaszewski@oss.qualcomm.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 1/2] of: kobj: export of_node_ktype for use by modules
Message-ID: <al4C4ETj1KZOjOlv@ashevche-desk.local>
References: <20260720104730.1285552-1-xu.yang_2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720104730.1285552-1-xu.yang_2@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 20, 2026 at 06:47:29PM +0800, Xu Yang wrote:

> of_node_init() is a static inline that references of_node_ktype when
> CONFIG_OF_KOBJ=y. Any module that calls of_node_init() will therefore
> have an unresolved reference to of_node_ktype at load time, because
> the symbol is defined in drivers/of/kobj.c but was never exported.
> 
> This causes a modpost build error when CONFIG_OF_KOBJ=y and
> CONFIG_DRIVER_PE_KUNIT_TEST=m:
> 
>   ERROR: modpost: "of_node_ktype"
>   [drivers/base/test/property-entry-test.ko] undefined!
> 
> Add EXPORT_SYMBOL_GPL(of_node_ktype) so that GPL-licensed modules
> such as the KUnit property-entry test can call of_node_init() without
> hitting this linker error.

Use special one for KUnits: EXPORT_SYMBOL_IF_KUNIT().

-- 
With Best Regards,
Andy Shevchenko


