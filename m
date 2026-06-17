Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333123B7760
	for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 06:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679401; cv=none; b=FJIXH+g82nDIgH5WhDfOrFn5nH/kp700jL5FHhKZl83L7f29sEbTPRxs1GwRnle/5LkyaS1sf2UvlYfpW986qUF4UN4hcbYngMJydBHprpmQ62PoWmXiJiYogbS5cpVkhwP1hEorD6uePOkPuvyB5xox5unQjEzNGU/Y+BbT/Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679401; c=relaxed/simple;
	bh=mXiaAyXXpsh2yjJ1nzXDvjqz5zQZnx2MoSkKpQNDR0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8vIXAjjUk4rR3s/oS8GsUtMwurg4G1DDtECZugX9qgxpu7YBqHKRAf8B8RtQZXBPxmikIDkIYooyNwvdOPCPqeSZoe3JWcn4tQhcCsaRDSwczObf9G8/5BmwmM3/fds2x5NANA/BqNzkdxeLEH5SnIc2jeJ8bX+77z7rBY5qtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhTdiuzG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhTdiuzG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781679400; x=1813215400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mXiaAyXXpsh2yjJ1nzXDvjqz5zQZnx2MoSkKpQNDR0w=;
  b=UhTdiuzGxRF5rt8IECXoZFkr5BxwnONJaBw6T7v+eceI0BNqdzcTMcEl
   PwFaoUOcejkQuP1ALWbHzgl17HVnS2OmqjZkx89DmdB15nOJGlVbkFX7M
   GMeDUZcbfUUmtODXrPk+1bG8g6/KuuI413rhUx2WihP8Z1ErdSPYCz80U
   A1Uf87n4VChejCLRuEHrDDCjXkS362W7/kU7stwP5Cit9ZWZw9IMzLzB7
   y33JiSJaDJ7ANj9cDnSWRs8mZD15RtCeDF+ovuMliqp+7SwCqDFikcMSj
   uMjHJzD7lSyL28KXXP4PVDlkO3tTwk5jqYlfJ9Z3wn5DhIavgN1NOc/03
   Q==;
X-CSE-ConnectionGUID: Ia74QWyUQ2qC4hCHWKOfrg==
X-CSE-MsgGUID: rAl7ks+dS2WDE+4aWW+6Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93579034"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="93579034"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 23:56:39 -0700
X-CSE-ConnectionGUID: 6KD4w5xJRY+jU0s3W1FcXg==
X-CSE-MsgGUID: Cr/XWmgXTXSBQI1rEjXQug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="253097368"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.69])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 23:56:36 -0700
Date: Wed, 17 Jun 2026 09:56:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Francesco Lavra <flavra@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] regcache: Do not overwrite error code when finalizing
 cache after error
Message-ID: <ajJFIhi2HAuNk9ay@ashevche-desk.local>
References: <20260616114429.1852456-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616114429.1852456-1-flavra@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 16, 2026 at 01:44:29PM +0200, Francesco Lavra wrote:
> During regcache initialization, if an error occurs in the
> cache_ops->populate callback, and if cache operations include an exit
> callback, the error code from populate() is overwritten with the return
> value from exit(). This hides the error condition from the caller of
> regcache_init(), and can cause NULL pointer dereferences when the regcache
> is later accessed.

Ah, good catch!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


