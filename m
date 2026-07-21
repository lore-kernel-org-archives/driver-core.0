Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86203911CA;
	Tue, 21 Jul 2026 11:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632587; cv=none; b=euS+BhVH8eliPeB+YMtBH94d+X026d/SnxuIcDUr6NGa7d3ShBIp0xIAEjLa+gbk3dKIReHre0rpQ83/I9xTvIaOYZgReC5qqE9gyOAp49Qg7eGXftXPB1WCimMmDnZ9Z97w7rTI9l31U0gfOcGB1dqGWIfQjERJV0UcOlL020U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632587; c=relaxed/simple;
	bh=/MsRRD60z6Y9BkMYAyVeHU+fDWcAMhMQ7+pCjkxj43o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaZplaRaXgkFIQatzGKRUXhW+jgL0iwYJvDzOTPeCiYkt4UMWWnP1R9XhkQtI9csBZHeaVhUaNjl7QJXeFNie8lzX1dX/azpbCaY5se7WemlnMNkq2YR6cg5iTdK3OMcKIo8nDeVZFWKbjghUMJicowNKLo10E0RTN+52aZJwLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvXkQbkS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvXkQbkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784632585; x=1816168585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/MsRRD60z6Y9BkMYAyVeHU+fDWcAMhMQ7+pCjkxj43o=;
  b=cvXkQbkS8ydDT9yEh45KMzL1C3V9RINe3eigHtg96Ymc4b/Nq6rG63ou
   qWeQ8h+3JtpvkZyWKjIcqr1ZoFJ5fBZMzCQrRLr2eW/TxuBz/fDwb9g3+
   aK+9ydHbeJlTqoYLSmVnKiwkaTK5DRqMIUN1q9dxoRmyd3G9/IbVSyX9N
   1iqnDrD7OCQ9yLzHe5KVOtIYyRv4gEEZiXoOvJ5LeJUACA9PIQ7T9n3CO
   DT38KjRzVIbvjraOE92JZby85fO85Ulf9gisQEH+KXt61vWnRogHxlea5
   2SjVwvk3leQLnUAKg0eSMS9tdCm/rKrnpMqG4RbV8qAW205DXKrXd10Pi
   w==;
X-CSE-ConnectionGUID: lVeYCpPMTlWOzS6SLd2TsQ==
X-CSE-MsgGUID: laVlnQCbSBW9Agjw3jGAJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85171950"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="85171950"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 04:16:24 -0700
X-CSE-ConnectionGUID: D5ZRjTXLQWCuBtlvzEYsOg==
X-CSE-MsgGUID: zUEcYFHqTH+GS5G39og7LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="253814729"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 04:16:21 -0700
Date: Tue, 21 Jul 2026 14:16:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	robh@kernel.org, saravanak@kernel.org,
	bartosz.golaszewski@oss.qualcomm.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 1/2] of: kobj: export of_node_ktype for use by modules
Message-ID: <al9VA_v8tcvS1hY1@ashevche-desk.local>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
 <20260721105448.2109894-2-xu.yang_2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721105448.2109894-2-xu.yang_2@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 21, 2026 at 06:54:47PM +0800, Xu Yang wrote:

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
> Add EXPORT_SYMBOL_IF_KUNIT(of_node_ktype) so that modules such as the
> KUnit property-entry test can call of_node_init() without hitting this
> linker error.

...

>  #include <linux/of.h>
>  #include <linux/slab.h>

+ blank line.

> +#include <kunit/visibility.h>
>  
>  #include "of_private.h"

-- 
With Best Regards,
Andy Shevchenko


