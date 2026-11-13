Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580470;
	b=Pgo7McrV2UvlWUsYMh68/OrmksQ46Z8V3RA4BWkwq9soDflSYTZ/qB6jMdZsZBJDY/bt
	 fTvVrT90P8ODQNNGKxtYtqjb42cYDgKQZ6Y8GzuvqQe3000dZ5aE9nGOYugdTaJvy/qHl
	 6ly4IjECY1+td7KCNkCEpliHAwWp+AAoJEptF/OHNKsTaSLwj+iG22zqN/gJOKkOn17Tc
	 GIPhw8WojvoFcpmNPCgB6D82V69JdP3n77CESxwec+XEsCJ4RwsO68FykMEfRzPaUsC+S
	 GGCvXx4WlIYPPxmkbl78iXNaHrdSEyPpePxvcBQWw7F7bxs4AEfqUkZdskzpQDD6wIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580470;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=5bsn7yBOZAERKSYuQnBT1iy1H2Va7H9mDFZxFaipNn0=;
	b=BtcA8c4fuchyDAlNbbN47hssefU4R8ymtlGv/P/RkZWqB/iGzaZ8LqEc4fTI4R2kfVuB
	 ju8XLxBIkcCdl94h5WGpt3yaruV/oJy5jE5+xdEcTbqcRo5DCJ6WU02kCYmg8DKc7+wNp
	 8bCeLH8CAAvfNKpWZpCGbl9LMWIDo4DcQID7jNF8/kACSjnF/4hkcoUKtL8lnUF/3ROKY
	 /yt43s5GwiskJtoiV4WBUfuHPSE7WIO9cfBxPA0XjP+XkEmAtqmtHFLS8HHQQZswCBdJG
	 byYoF7ABqQ+B+fjidx/Jto6gCFTFHRnWRrRJN1T4hJR71bcqjQ7k2iTZOGjME+Jk73A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WNifackc;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B14606A331
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 14:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B14606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WNifackc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794580470; x=1826116470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KDw3DRwFoS77oqMJxSLZNcwsO6M0TNsEgOdg9UtOj3I=;
  b=WNifackcXm06/8RkL2z5Qsp3kB3EngC1/dX1E00nDwmK+yzMD917em9a
   EzoE2vqCPlt+5Xh7HAa4+n6gMOfzVHDxwNGvzlPrrzxbsaT5ry7xWz+ME
   aVt2cZ4OVa+nPWro8eu/nMUDlarBlmwAYiF9pHpVRSpLCYzpNtnIEi2DG
   BVG38z2P+SLJTHkB4Sd7d3M6aKbkCH6LQo4O797Na8wfw534iB/sl7GCv
   z3zZhU+V2rQceT5ujmWlmbwBX7VNcCSTlIcNMZn6THptCloA9E9CtgPAV
   ratTLXJ2pS/lB6zjAMSCjR7JZP/zaKG/TLBrExHPM8uyfoFPmTJTbrH7/
   w==;
X-CSE-ConnectionGUID: VwyLxN0GSOqYScOXFd6WWg==
X-CSE-MsgGUID: Rh6d/VyoQ5eUjkqgp1yE6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3287249"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3287249"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 06:34:22 -0800
X-CSE-ConnectionGUID: BxoGbnzZS3GmxTGOjfEv3A==
X-CSE-MsgGUID: BLSDbF5nS/6c6hVTZFqGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9276128"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 06:34:16 -0800
Date: Fri, 13 Nov 2026 16:34:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andreas Schwab <schwab@linux-m68k.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Joe Perches <joe@perches.com>, Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Len Brown <lenb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linusw@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/7] string: Add strprefix(), and deprecate
 str_has_prefix()
Message-ID: <avcf5V0B52MV4_PZ@ashevche-desk.local>
References: <cover.1794574496.git.alx@kernel.org>
 <f25bf43d7f18c99019a52b9ba9a1e46fa68174c7.1794574496.git.alx@kernel.org>
 <avcfuBAbNkBrk6uy@ashevche-desk.local>
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
In-Reply-To: <avcfuBAbNkBrk6uy@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 04:33:37PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 13, 2026 at 02:10:29PM +0100, Alejandro Colomar wrote:
> > As Bartosz reported, str_has_prefix() has a bug: it can't differentiate
> > between an empty prefix matching an empty string from a non-matching
> > prefix.  This is a fundamental design flaw in this API, and not
> > something that can be fixed.
> > 
> > As always, this is a consequence of choosing sizes instead of pointers.
> > Sizes are often the wrong choice.  In this specific case, pointers are
> > more capable of differentiating these cases, as NULL is a special
> > sentinel value that doesn't need to overload a valid value.
> > 
> > Let's implement strprefix(), a function that returns a pointer
> > right after the prefix if found, and a null pointer if not found.
> > 
> > We'll slowly migrate existing code from str_has_prefix() to strprefix().
> > 
> > Move the description from str_has_prefix(), and describe
> > str_has_prefix() by comparing it to strprefix().
> > 
> > Reported-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Link: https://lore.kernel.org/linux-hardening/20261104-fwnode-for-each-prop-v1-1-6e28fe1c72c4@oss.qualcomm.com/

> It's unreferred Link tag, spurious? Please, refer to it in the commit message
> to understand why it's here. Use Link: $URL [1] and use [1] in the text.

Ah, perhaps you wanted Closes tag instead?

-- 
With Best Regards,
Andy Shevchenko


