Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA2D20E334;
	Tue, 21 Jul 2026 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632706; cv=none; b=Klu6w5l0lh9z2dn6pXDgCa/N0N4uGv4ptWsPaM+bVIgeWgl/Wv5atwp8ULZPcLuefg6q/ULbwW1Cq7kaXqkVvEzTI1Q7/31upSBV94HG0y3SxmsLev/r1bKACNsdgtrcG8npcLvVGg1OQ/mWQP0wNSPv68FH5hnYrzYMGbYyOcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632706; c=relaxed/simple;
	bh=GqqMUXlNcrBAUOZxLFnrcDutk6U0N7ltLOyLmRiAQTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmTO0D8DvQaoPNOdkIAIW0pw1Y/NXMeHzTUQhIjCc4uaLsn9wUJuDFYa5iBc67Tl3LjpzCCvwaC84zzs2wnvrM69wXKmiTYPbalC0Ro/lH8hjlBY9/isPuUGwPJze5jqE+dJWCTPA/dsLx5hkEpIWCBTPUXHytGZlLZs+n8ojQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgrMMIcb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgrMMIcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784632705; x=1816168705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GqqMUXlNcrBAUOZxLFnrcDutk6U0N7ltLOyLmRiAQTQ=;
  b=OgrMMIcbeL9titJKGcvqD0Sz//HYzx7Ao+5p7Ep+lbCFZkZvVOyUPsuw
   C0bME9qx09knY3wUH+Y4DqiqtO8wI2Id6GcXZUwfqOctcsYRobR7yo4hB
   VctCMe3yLuQO1SYt78TvmGS1xkDDzXDOceGoD1o2KKdEaa54kXlTgjn/0
   mv7OKY56wpEE7+rc/dbHfbe6RkagHvVI+K87rhHVkuOGE0qwwwrpQHs25
   C6MWHRxSa6zAI1FmHK89LSilmOqA3oyHB7K+U8bzmEGr1Gw/410G4nyqc
   tgzbzNJ8Wj0gteV8GeUVBXJ6/kFef/IuSLwd982GE1j+GXXg99Mhy/c2A
   w==;
X-CSE-ConnectionGUID: vyqtOPC4RfuCygivB8ALrg==
X-CSE-MsgGUID: uO/UF743ToOHMnUfU8t9GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85172067"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="85172067"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 04:18:25 -0700
X-CSE-ConnectionGUID: 9Fi6F/ZhRvivX/jcwhUkTQ==
X-CSE-MsgGUID: fTAULmApS5W6WVPIHC9noA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="287772019"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 04:18:22 -0700
Date: Tue, 21 Jul 2026 14:18:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	robh@kernel.org, saravanak@kernel.org,
	bartosz.golaszewski@oss.qualcomm.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 1/2] of: kobj: export of_node_ktype for use by modules
Message-ID: <al9VfFqH_1-Rl4s4@ashevche-desk.local>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
 <20260721105448.2109894-2-xu.yang_2@oss.nxp.com>
 <al9VA_v8tcvS1hY1@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al9VA_v8tcvS1hY1@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 21, 2026 at 02:16:24PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 21, 2026 at 06:54:47PM +0800, Xu Yang wrote:
> 
> > of_node_init() is a static inline that references of_node_ktype when
> > CONFIG_OF_KOBJ=y. Any module that calls of_node_init() will therefore
> > have an unresolved reference to of_node_ktype at load time, because
> > the symbol is defined in drivers/of/kobj.c but was never exported.
> > 
> > This causes a modpost build error when CONFIG_OF_KOBJ=y and
> > CONFIG_DRIVER_PE_KUNIT_TEST=m:
> > 
> >   ERROR: modpost: "of_node_ktype"
> >   [drivers/base/test/property-entry-test.ko] undefined!
> > 
> > Add EXPORT_SYMBOL_IF_KUNIT(of_node_ktype) so that modules such as the
> > KUnit property-entry test can call of_node_init() without hitting this
> > linker error.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> >  #include <linux/of.h>
> >  #include <linux/slab.h>
> 
> + blank line.
> 
> > +#include <kunit/visibility.h>
> >  
> >  #include "of_private.h"

-- 
With Best Regards,
Andy Shevchenko


