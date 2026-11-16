Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817378;
	b=1+neVqtgFOX9+0M/lBT/tClNErOxLIo6IUE8dO4QT3Ag2Rhn9EvvHiCsXLeEUyBbFe27
	 jn06lpJi1MAdBb+qh+u8HoPUMB4ciYwcxmtxIo9+JFoDc3xCLlLc4FSOK+6u9TQuX+1Jb
	 beV0h9JbO+QofBHCw4sD+Faoubw3gXgB+Mu2iRr583HTWB+pv1nQOQtTtzORwgxPrkCJL
	 krBUrghpHf6F54hIM8jkQq9V4zxeVCG8pBw4OnnjvXeMBSBIdytQbFpyqCNJ1tzigugWn
	 /cZQ3opBD10a6Nc/4yt0cS8F8EYK0rwTlUTmIXjVupFsF72lnlVTtoTC4gOZqK44boQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817378;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=SA3wJMcSvgLciHKLiFhqcGeaGA7trH4v+qny7bHE/Vs=;
	b=WiPwuwLC3g2GF9Cg5Cs7er/K3zD3Ct9OiFhq8+yB5K9vp3cpkgIdmoebzf/ilPQRJLAM
	 cEpHVgtb6aZtXwQvq99BBdAiftYLRGQ8e4kaNOZ12ddL7BaMkPuMpwblPykFhq9ai9m3J
	 JnTrB9/Pnnf7nw5h8XRSFUpioYu+rsVny3As0c/UDkplOhNnEGlW5EGa5ywUbTB/f/E95
	 kmmKY4Tz1paaG6gBULQUxpupmwNAe3rTo1YySuynlm7Twi82SzbVz6Au31z7RxgsFJ6VT
	 RG77FZ/+LpI2TCK3YY9ZJs0utEMlXj7wFKnaIVGkF0yoPA7YwKdTGT/8oBC0taZeixQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KiKLIb91;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C4F606A323
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 08:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C4F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KiKLIb91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794817377; x=1826353377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O1L8h3NEx3yA1s8x4uzwJS9iETCqz0gdQxeq2seZUqM=;
  b=KiKLIb91/GhLgqxQ8ee/fq+6gMCRiCPrZvs/ojxCuiCnmCZwBN0v0pd3
   BWU6dnp1pYsVd5kabBT/jPdl5UWRd8ysN7Ux5nDy/VPo+RmY4aOYFD+pL
   V9NzfPaRhFv+GWk7gtSBvrAy/p3ID1WBBUS/mw+iSz1F6BCraUJJalm7w
   tvoINGuRU2r91UP0ujS4nTgrpXPpUay5vLvWdnlo9Arz6MrK8hGVGNdd5
   qYvztO7PDmNO4L9HaM+6XHO4iXvBm4THmab0wiyo4vZJmYt5hN5qAnL2d
   UsHyJTqhfK3OYwUDGbZtH/Ekv/bXF8BQfHaSgew5tky92DVZwpYBVoXl0
   g==;
X-CSE-ConnectionGUID: neWNX1FYRdW96ITcz7wMFg==
X-CSE-MsgGUID: 76xSbztJQhuzv9c9Npbm4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3419573"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3419573"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:22:41 -0800
X-CSE-ConnectionGUID: nUfQzrmMTG+XPASCMlSzIQ==
X-CSE-MsgGUID: 1hcpVIeoQzuVHhcH9Xt8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9679545"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:22:38 -0800
Date: Mon, 16 Nov 2026 10:22:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v1 2/4] regmap: Drop never used devm_regmap_*_free() APIs
Message-ID: <avq9TEa4l2xsHKFj@ashevche-desk.local>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
 <20261110093820.454682-3-andriy.shevchenko@linux.intel.com>
 <179442294226.513646.6459407661987242086.b4-review@b4>
 <avVjKPairv4zkB4o@ashevche-desk.local>
 <ec267c4b-2412-4da0-a46d-d9ca8810d093@sirena.org.uk>
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
In-Reply-To: <ec267c4b-2412-4da0-a46d-d9ca8810d093@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 05:52:43PM +0000, Mark Brown wrote:
> On Thu, Nov 12, 2026 at 08:56:40AM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 11, 2026 at 06:49:02PM +0000, Mark Brown wrote:
> 
> > > I tend to think that if we have allocation functions we should have
> > > matching release functions, this avoids cross tree annoyances and bugs
> > > due to people using inappropriate release functions which actually
> > > exist rather than adding the ones they should use.
> 
> > In general yes, but for devm_*() it makes not much sense as proven by dozens
> > of dropped "release/free" type of devm_*() calls in the past. Also as commit
> > message says for more than 10 years nobody used it even once. What does make
> > you think there eventually be at least a single user?
> 
> Some of those release/free of devm issues are people intentionally doing
> a free and using the wrong function to do so, the main use case is
> enumerating something and deciding that some of the functionality is not
> usable so freeing the state for that functionality so you're not wasting
> memory carrying it around unused.

No objection on this in general, but for the mentioned APIs in this patch it's
not the case. Nobody *ever* used them. Why do you think we should keep a dead
code?

As for the memory side, we can also have a documentation that may list the
commit IDs and APIs where they were being deleted, so if one is interested
to resurrect them it can be done easily, however the quick universal method
is `git log -G ... -- include/linux/`. Ex:

  git log -G devm_gpio_free -- include/linux/
  commit 2b038e786f8338a3bc22d791000753e0ec113e00
  Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Date:   Wed Jun 22 20:28:42 2022 +0300
  ...


(and using specific folder speeds that up a lot).

-- 
With Best Regards,
Andy Shevchenko


