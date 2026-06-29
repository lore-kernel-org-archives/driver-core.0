Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF264071DB
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738839; cv=none; b=Cf5srAl8jtmSVMkVCao2Oi97LBA7mBA1jjMb+buC/9N17LHlKR3Pn4lu/aWb8smNVb7cLxGSf2l2cfg9uHVhk+cU02H6NWK0rC62M8FFRjn5YySx+j2zmKnh2hxxTG4jby/HPZtOV7yz4H0HEwljJ8+Fn9cUbQ7DImGR6OtJQbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738839; c=relaxed/simple;
	bh=BdIOTTbeI1nykp26J8rBagRrwJIgAy9enoDUh/m2NuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoKNY9fp9kbX+GVOtRQqerQNVq4KmGD3ak1W3NMfXfZQ5V1/M7UTY5Wbvu0ylIIoSaTzAg4jJI/U6E7sKSPy/KYbp8yrEYg4lKKfDqB6NixP9Md1aIRbtvgKYd9g9AaNDc4o0O90TUqQuldecWokgWJMPJj58HD199r9SFfSL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnN9+tS+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnN9+tS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782738838; x=1814274838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BdIOTTbeI1nykp26J8rBagRrwJIgAy9enoDUh/m2NuI=;
  b=fnN9+tS+NmkF03FX9VixqaqTjA0xz77dbjsdKQZvqW6jg865C3CEAu8E
   2x2sS1k1ZFtPxNxnxHcAVEFdZeDbg830jwtz+cT8o/qidJ9owB2Ne/Yw2
   9aG5AfN80Cg4Y3nu7B5CCXcu6M98TSsxHGJ+uO6LLcRhnEpkGJ/8TlJHk
   4yszes/Lnl/58uHo4vcur/cQKSPWYMBNQIrSNzSpW6KS9/f23Uw5E2qNA
   ixF+c/WE7D/DtsdmoboTUhrt2klfFKl+HhCDKuXHi4MblZyTGeA0IVkn1
   lxCYlvzRJZdDSQxO7I5CC+LS7MGkgyBICfvkHNlpZIW6p4jRU/cCnud6q
   g==;
X-CSE-ConnectionGUID: L1XUWDs8SC6/OiwLcJLGVQ==
X-CSE-MsgGUID: 8mbbGXcLSbyxDG15G7c8Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94007858"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94007858"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 06:13:58 -0700
X-CSE-ConnectionGUID: /q3m4QrASzinS657SBWuVg==
X-CSE-MsgGUID: OnNcX6AJTuCdH2WoveEH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250892970"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 06:13:54 -0700
Date: Mon, 29 Jun 2026 16:13:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Zijun Hu <zijun.hu@oss.qualcomm.com>,
	Alban Bedel <alban.bedel@lht.dlh.de>, driver-core@lists.linux.dev,
	devicetree@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/2] software node: Fix
 software_node_get_reference_args() with index -1
Message-ID: <akJvj3pxZwOAd97v@ashevche-desk.local>
References: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
 <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
 <85b2bac4-9882-4f35-81e4-1718a52aacc9@oss.qualcomm.com>
 <akIfHJd2gpLC1u5o@ashevche-desk.local>
 <bdb69b50-ef98-47f5-92c1-48e73fd2da72@icloud.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdb69b50-ef98-47f5-92c1-48e73fd2da72@icloud.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 29, 2026 at 08:33:24PM +0800, Zijun Hu wrote:
> On 6/29/26 15:30, Andy Shevchenko wrote:

...

> >> who will use UINT_MAX ?
> >>
> >> This function is a interface function.  the best fix should check
> >> input parameter @index and return -EINVAL if it is not expected?
> > And how do you know which index is allowed without doing that division?
> > Basically this patch does what you asked for: check input parameter for
> > the allowed range (which is dynamic, depending on the property length and
> > size of the reference structure.
> 
> Introduce a common macro to limit the max reference handle count and put it
> in include/linux/fwnode.h with the following macro.
> #define NR_FWNODE_REFERENCE_ARGS        16
> 
> OR introduce a macro for software node only.

The property can be still smaller that capacity. I agree that division is not
the best approach performance-wise, but in my eyes it makes less checks needed
to be done. Let's see what others think about this?

-- 
With Best Regards,
Andy Shevchenko


