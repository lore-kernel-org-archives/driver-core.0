Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CD6355055
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825055; cv=none; b=grTnsCRx3YAPq/oG3GIYgkEbegGV540OJJxJtQs/fY1088pXQXaaKgZRp78KjaJEjydJagpbMh0L8i6nZ5cqHe6NIn25hxlD05qKymHFtlC9jmcHCEw3bSvtNY66bRD7Wm3Q7XIBsNO+jAQxawM6RbmUG9V1wpRtpbI3uyJyO1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825055; c=relaxed/simple;
	bh=GZebvHnV6bKQuxD9ODAdxhQzyPBqkYUTroV1QQoz7pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alXJ39QNZrUf3oaz6fy52b3+7e9klofJU4ohprXJmjhzbrutgmXO9EVcPfbLQxIGuGy4K/R4j1f5i/EVlQC9HQIhcD610JYqmBHr4LeMKoOhGxre/J/InLjzNWg+EU0MCE4wwRNj2gFATiwVVMKzuyehRQ4a4ZS0Imf2jDaSX5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFx0kLni; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFx0kLni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773825054; x=1805361054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GZebvHnV6bKQuxD9ODAdxhQzyPBqkYUTroV1QQoz7pk=;
  b=VFx0kLniVjLHMPx8UJ2LtExSuNoelvFPFVHBKzbglm2JWiN/9m4AWozV
   /1jkxJPWOPrqiwPBb97xUKBACqcOcEZ3YPSsETMNY5cAytnA/WuYJ8F5H
   FboUsmPwJGnRtB6jRCa91CuZQxuO3Bmq2W4ZhjQcoWKtK76yMDQeEedKB
   v64OV/smzQync0TlPMICfxhhjGlTYLrGAq1AzccrZF7HJspmmvscvf4BP
   LLCjb7U0roSf0wwjYM3NzDqCf857mOooScpG1SPkZXeDY6bIITcCpVd4r
   8d7GHSP3eBdsHRbVi+2y/6lFHXMyZFlj2mn+1kjkIgylEPhYGG3i2UH2f
   Q==;
X-CSE-ConnectionGUID: K06PKeQrS1ep7l1Hmm2lWQ==
X-CSE-MsgGUID: 0CyIMQMjTrCxPoKYExmNfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74761057"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74761057"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:10:54 -0700
X-CSE-ConnectionGUID: NqXufR+ITkecUfHjPs8a+Q==
X-CSE-MsgGUID: ogVqzuMZT1WGHukMnkcuTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222541913"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.243])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:10:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 34D8A11F8A0;
	Wed, 18 Mar 2026 11:10:49 +0200 (EET)
Date: Wed, 18 Mar 2026 11:10:49 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 1/1] device property: Document how to check for the
 property presence
Message-ID: <abpsGfkitsXuWKb4@kekkonen.localdomain>
References: <20260317210828.2117631-1-andriy.shevchenko@linux.intel.com>
 <abnVTODs9fOqF9eV@kekkonen.localdomain>
 <abpcT5Yqfi5_SjKR@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abpcT5Yqfi5_SjKR@ashevche-desk.local>

Hi Andy,

On Wed, Mar 18, 2026 at 10:03:27AM +0200, Andy Shevchenko wrote:
> On Wed, Mar 18, 2026 at 12:27:24AM +0200, Sakari Ailus wrote:
> > On Tue, Mar 17, 2026 at 10:08:28PM +0100, Andy Shevchenko wrote:
> 
> ...
> 
> > > + * In order to check for the property presence, use device_property_present().
> > 
> > Do you really think we should add this clause for each of these functions?
> 
> Yes, as Guenter pointed out that this has to be documented clearly.
> 
> > I don't think it belongs here.
> 
> And? What should we do then (taking into account my below comments)?
> 
> > The error code list doesn't document what is returned if a property doesn't
> > exist (-EINVAL) and it'd be helpful to add this.
> 
> No, this change is exactly against this. Because using an error code that may
> cover not only that case is at bare minimum fragile and layering violation.
> APIs that require to know the implementation details are not good APIs.

I have to say I disagree with that, there's nothing wrong with checking
error codes if you need to.

Either way, I checked the original patch. If you really think you need to
check for property presence and use default in the case the property isn't
found and error out on other errors, add helper functions for the purpose
instead of open-coding it all.

> 
> > It would have been best to have a separate error code for this albeit
> > changing this now might not be that troublesome either: very, very few
> > callers depend on receiving such an error code but there are still many
> > callers.
> 
> I'm against this because we have already a dedicated API to check for property
> presence, why do we need to have another (confusing!) way of doing the same?
> 
> Having a dedicated code may help to debug, but shouldn't be used as a main
> feature in my opinion.

-- 
Regards,

Sakari Ailus
