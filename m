Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222623B3C0D
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718246; cv=none; b=TQSslCVFm1phv+3gEtYz1WFEqrwNlIzFaC3iWVb+R9itSMvfsimw/71KfTSuyBz70YWlVx6FjdvvkyH3GIRCG0e+ZOOOP1h11zUpe8hKnrZKiLtru7BMh2rb83LRpv/v+jo81JODH9Bq6I3sONkBB04+ScXClJ5bTn5eoT8ifAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718246; c=relaxed/simple;
	bh=6niIvsu0JkdZrV/2LrFiOXa6pCaKYbdMuqzt72NpmzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBDav3LcvTWN65rC3TPV1Je+kEyHM/SdIUvfARiGT+qQSNwN73XR3DRNT5n6e1zaQdbkdGzNmyorzuFEKfOBaekyGgJHfSWy8YTzgWtHtmgU7hvGaWysPXO4f/++FKYmqqHz535o4TjnuHQlE5jYb2+tRBHebpOHhmiSTk80b48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEPVWt5t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEPVWt5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782718243; x=1814254243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6niIvsu0JkdZrV/2LrFiOXa6pCaKYbdMuqzt72NpmzA=;
  b=DEPVWt5t7RsGefDFcypcJhVYw9ZRnPU2fHOstBRtJE/v4v9Qu5vhuiPW
   QVSWvtOAp40bvuMZkr4qAmxem3iiVSSX2oZWnVNLYpv8TDekiDE7b9DPe
   8Bvbxl0hS95+LyM8LiNnClyPkOCkPtqeFvlcYxZldR8gp0AZmswGiuWCn
   FG3Vmjy/LHGzoSKsiSX94MZI++f7tzbek1zFZLgqhol6mpJsm/hlE3zqO
   qqdoNRcv2YksaN+sU3OFEUl/XKaUUxLsmmGsGyi8FTMMlQ/WGjJemD1uR
   EuhhpX5B0xB7w8Qz1Z+Q4Bm4ua1KHGvVQEkvW1IzHJDKn9aMkU1xoGzKk
   A==;
X-CSE-ConnectionGUID: 8++Hi3WLQZWtp8r8VBq79A==
X-CSE-MsgGUID: Wyz50iokTN+wgxeTkMLkeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="93750654"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="93750654"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 00:30:42 -0700
X-CSE-ConnectionGUID: CE+3+MbXQFy2Plx38LHSkQ==
X-CSE-MsgGUID: 3NfcIMd2TICGldXr21Zgbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="245515617"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 00:30:39 -0700
Date: Mon, 29 Jun 2026 10:30:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Alban Bedel <alban.bedel@lht.dlh.de>, driver-core@lists.linux.dev,
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
Message-ID: <akIfHJd2gpLC1u5o@ashevche-desk.local>
References: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
 <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
 <85b2bac4-9882-4f35-81e4-1718a52aacc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85b2bac4-9882-4f35-81e4-1718a52aacc9@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jun 27, 2026 at 07:50:12AM +0800, Zijun Hu wrote:
> On 6/18/2026 11:20 PM, Alban Bedel wrote:
> > The bounds check for the index passed to
> > software_node_get_reference_args() was failing when passed UINT_MAX,
> > this in turn would lead to an out of bound access in the property
> > array. Fix the bound check to also cover the UINT_MAX case.
> > 
> > Fixes: 31e4e12e0e960 ("software node: Correct a OOB check in software_node_get_reference_args()")
> 
> i think the fix tag may not be right.
> 
> for original express before the fix tag: if (index * sizeof(*ref) > prop->length)
> 
> for UINT_MAX, multiplication overflow?

I agree that Fixes tag may be not the best chosen.

...

> > software_node_get_reference_args(const struct fwnode_handle *fwnode,

> >  	if (prop->is_inline)
> >  		return -EINVAL;
> >  
> > -	if ((index + 1) * sizeof(*ref) > prop->length)
> > +	if (index >= prop->length / sizeof(*ref))
> >  		return -ENOENT;
> >  
> 
> who will use UINT_MAX ?
> 
> This function is a interface function.  the best fix should check
> input parameter @index and return -EINVAL if it is not expected?

And how do you know which index is allowed without doing that division?
Basically this patch does what you asked for: check input parameter for
the allowed range (which is dynamic, depending on the property length and
size of the reference structure.


-- 
With Best Regards,
Andy Shevchenko


