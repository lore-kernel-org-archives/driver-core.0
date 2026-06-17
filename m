Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CE43B9943
	for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 07:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679615; cv=none; b=YRYiwSjHU7T9ofE02J+wm7xxM84Mx1Gy2F9R9W+7OU3cJCzI4fs/SA0XikZx3UKCEXFAuqzO0h+Sj2ICnwG27cIqYTkBGW86L8RkuQg/qGoiYG2oKSxtOunWL/iFln5SXfQA2CVdO14ZuRxJOMvZ5sx3wu8W+DhwEa/6llEZZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679615; c=relaxed/simple;
	bh=5n88lRi9lGp1R0/HUuiGKWl4tg0RHEv+4QdhuFAHPqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPOpKfw/w+7VreaN25g2ByLDPcG3ejhhFPAtv/J/aO/yvuJo3Mxvu9aT4qk3WQLhJ1j1/KqNrK6/Qt2O2orAJqZK5N1jNZoE8K5dnRp749x+aS9HHhOwCxqiylUbbn11Zkavm+zGBK10HZ4/LH3iYs+Dju2q+MCgr/szOxxiaRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bul23XOg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bul23XOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781679605; x=1813215605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5n88lRi9lGp1R0/HUuiGKWl4tg0RHEv+4QdhuFAHPqs=;
  b=bul23XOgnLoiZcc/GN8DGa/SdWPIXpNGB8n/NiFT6yTGDt/SJFRbxZP2
   wi7agsORXm630hTKFfbc3ydepikQxb+gxOpTiOPN525z8Vd5yRRIJeMjD
   w66nWt9RENkmmSpEOVyPqjwE2xlH6UaC+xa5wH10bmLZA9c8Q7vd+ZEmK
   kvRse7y7iG0e2H91ALShLkWNSBcA83WtLeBDOVSfZOcfDbHWi+REJStOO
   LXxrMJzQR070/AGO7zo7L33qLfwZirDgVrnM49KogNwdXeJKQMCnwn0F6
   8RLc73flXY8jK2iq5o5aw82gtCs6+OsvCBq7xeDajyjz9M3QZWBYkEo2j
   A==;
X-CSE-ConnectionGUID: JX2f48lHRAaI58YqC+DQ4w==
X-CSE-MsgGUID: LVhoGmP9QxG6aJM4pOBUsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82343526"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82343526"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 00:00:05 -0700
X-CSE-ConnectionGUID: 3xFokCI2QMmL3bdSXEBHwA==
X-CSE-MsgGUID: VKfT9KQjQ9uOlvFXS6WWpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="278185775"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.69])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 00:00:02 -0700
Date: Wed, 17 Jun 2026 10:00:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Francesco Lavra <flavra@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	stable@kernel.org
Subject: Re: [PATCH v2] regcache: Do not overwrite error code when finalizing
 cache after error
Message-ID: <ajJF8LfMKQVCRTMo@ashevche-desk.local>
References: <20260617062228.2151685-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617062228.2151685-1-flavra@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 17, 2026 at 08:22:28AM +0200, Francesco Lavra wrote:
> During regcache initialization, if an error occurs in the
> cache_ops->populate callback, and if cache operations include an exit
> callback, the error code from populate() is overwritten with the return
> value from exit(). This hides the error condition from the caller of
> regcache_init(), and can cause NULL pointer dereferences when the regcache
> is later accessed.

Too quick to send.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
as per v1.

-- 
With Best Regards,
Andy Shevchenko


