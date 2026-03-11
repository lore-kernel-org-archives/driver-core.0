Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F6336A03F
	for <driver-core@lists.linux.dev>; Wed, 11 Mar 2026 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265912; cv=none; b=khN03VbL5QMy8HVlqFVcNOnzzj0jGVboHMQboSyfk3yIr9JedfEo0Lp8b11yRyoN5LuUM1WxZ76XbBtmyISObpKFkSrnlh8Bz6k7at50Ob4xPd5tqA1fEi1jCmT7ecDU/ZevPszOMSDekbxhpdq5K5Xef/Vk/JJRhihUFzczD/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265912; c=relaxed/simple;
	bh=ZQqs+HEOeWUb0Cw0+m2jd+kqOqB1vhyl0L72WLeeThw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPfSE+1EU5teGlLY0ojr2uXDi47kirOWW5pQFkVvXQ01NHthgRl92L2tVAZr4COG6b6Fg+W4QcjukiFwm71V2DMJJ7TXTjInMrBzzltHk58I1IfqBxCsPAjPuAWVrRTx2Tvz/APSjpQXu8d4/bndKZ+Fi3oHXUEROe7kzTyn36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nR+Z+7Si; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nR+Z+7Si"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773265910; x=1804801910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZQqs+HEOeWUb0Cw0+m2jd+kqOqB1vhyl0L72WLeeThw=;
  b=nR+Z+7SimJ2wYwsyU/3DTXghueW0rUfVXWNnhJcQRNmR9Y85uYKo2oSX
   2PslhPvbjdkSVDtRdKTrQb1IUxxXoPIT8/581vbcEna1wXwl0m3fRnIT1
   MbNi2a2xEOwwH/FuHX4OgBfNPbhgGM0PJMjIw1NXA7SIYHrPkWcJ8MJYE
   c2NNGOoQ9qVHDMmMA6uv/YQLHVQTxDZTVYEJyMvfPTCF2UwFEfkoUOViI
   j4vjAS2ZzB4LsUuqQSNv49uZktEqKsKzdvAguHplfifd69IKyeuEQqieI
   6RwlM9BKI+Sim6BS0vfAzM+f8jUOofLE/RO0WJDbZQQXOZaVirEFDTa6D
   Q==;
X-CSE-ConnectionGUID: udHkPczrRdmADaPy9F/nww==
X-CSE-MsgGUID: igbUvxbcTfGNYwHIUK6fRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77955231"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="77955231"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 14:51:49 -0700
X-CSE-ConnectionGUID: aR/vhJY9Q7ehb0YYp1xWGw==
X-CSE-MsgGUID: j4ria7X6Qkqw7ZAIcDZGiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="243628006"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.178])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 14:51:46 -0700
Date: Wed, 11 Mar 2026 23:51:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 1/1] regmap: Synchronize cache for the page selector
Message-ID: <abHj8CSDg25AjFMX@ashevche-desk.local>
References: <CGME20260302184802eucas1p2704b309b3953b523d816b51e9b49b196@eucas1p2.samsung.com>
 <20260302184753.2693803-1-andriy.shevchenko@linux.intel.com>
 <a9625fdd-62e8-4dc0-817c-9f8df505069f@samsung.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9625fdd-62e8-4dc0-817c-9f8df505069f@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 02, 2026 at 08:03:11PM +0100, Marek Szyprowski wrote:
> On 02.03.2026 19:43, Andy Shevchenko wrote:
> > If the selector register is represented in each page, its value
> > according to the debugfs is stale because it gets synchronized
> > only after the real page switch happens. Hence the regmap cache
> > initialisation from the HW inherits outdated data in the selector
> > register.
> >
> > Synchronize cache for the page selector just in time.
> >
> > Before (offset followed by hexdump, the first byte is selector):
> >
> >      // Real registers
> >      18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
> >      ...
> >      // Virtual (per port)
> >      40: 05 ff 00 00 e0 e0 00 00 00 00 00 1f
> >      50: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
> >      60: 01 ff 00 00 ff ff 00 00 00 00 00 00
> >      70: 02 ff 00 00 cf f3 00 00 00 00 00 0c
> >      80: 03 ff 00 00 00 00 00 00 00 00 00 ff
> >      90: 04 ff 00 00 ff 0f 00 00 f0 00 00 00
> >
> > After:
> >
> >      // Real registers
> >      18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
> >      ...
> >      // Virtual (per port)
> >      40: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
> >      50: 01 ff 00 00 e0 e0 00 00 00 00 00 1f
> >      60: 02 ff 00 00 ff ff 00 00 00 00 00 00
> >      70: 03 ff 00 00 cf f3 00 00 00 00 00 0c
> >      80: 04 ff 00 00 00 00 00 00 00 00 00 ff
> >      90: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
> >
> > Fixes: 6863ca622759 ("regmap: Add support for register indirect addressing.")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thank you!

Not sure if Dmitry will be able to test this, he didn't react to this message,
but at least the Marek's case is confirmed to working. Can we take this in?

Dmitry, would you be able to test this change?

-- 
With Best Regards,
Andy Shevchenko


