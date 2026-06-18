Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDAF402436
	for <driver-core@lists.linux.dev>; Thu, 18 Jun 2026 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781807766; cv=none; b=bWoDLlvoZLTiUetTJystrhznG+oDC4NqKTBfw/Zs7VSAHLqbn6ihXFfxqK1WQ524HDIK+ppVTzAzRMhjgqa26VaGPvyVUe5n3lXRUQJAN3qV6rVxYdT6nYdHn8QHKq1DKCAIDNXTmfDk2Rpm7eS1/FbxeXbBUoYOPCzlWDyLC/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781807766; c=relaxed/simple;
	bh=/ZXQ5xUghUSlKdDSofmazeKcwRYTexCixwTx0L+gnIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pP7enRGpq/6xEvpzgZsz7gLNIzBmcrRZLdQ2DFnQpqwKZj11jqVsxAnGZr0lxen1Wt97tY086c9hhw7I06oRtmXL4QU2KBeRlZTbFtvFyUITIHtm2y4zIw5wBW84bTKQUkwyqx+twEtR4ylvxrv45lAqiUNFSvMctcZhZWMZkMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UD8zqeRC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UD8zqeRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781807764; x=1813343764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ZXQ5xUghUSlKdDSofmazeKcwRYTexCixwTx0L+gnIs=;
  b=UD8zqeRCJ7TVmLYJbrTgl38yuvPUZUJfBury/kbICRYGc/bcbCi+OPia
   z+ouVCNzNQMNdoQQ54Vz+E6LzRv8q+AGjKpYiNHEl2/mJfU0e9HYQw6a+
   ej9K0buPNnUi9fEllcakYpxxgsQSl0d+qIERgn45QhUjcP1Fyb0eMlFRg
   op+CKuw0amRDB7jd9NzOcgSotL2BAUBnVUv9GGDb4Vu9ymEa0y3ntKqse
   cUkrJnYURJnfGBDSr17fnkFTMMN2rDNwOiV6vido9yhiu1HpCwug+jveb
   L9ptJEtVhmgr5cd7fEud70aGfwcMwIKl8pUk1QRXmXQ4O2rcdOnC8gvxG
   A==;
X-CSE-ConnectionGUID: zNv0irQYQw2BB8gEo9KzBg==
X-CSE-MsgGUID: xCA4+ajzS+2mHZie/AT9mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="100082245"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="100082245"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 11:36:03 -0700
X-CSE-ConnectionGUID: QxGr1YydQ1OvuT6J6RZPKw==
X-CSE-MsgGUID: YP3dEdDzQXi7hPf+v/eIdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="278621571"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 18 Jun 2026 11:36:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8B51B98; Thu, 18 Jun 2026 20:35:59 +0200 (CEST)
Date: Thu, 18 Jun 2026 20:35:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: driver-core@lists.linux.dev, devicetree@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/2] software node: Fix
 software_node_get_reference_args() with index -1
Message-ID: <ajQ6j5roSZ16Yb-M@black.igk.intel.com>
References: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
 <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 18, 2026 at 05:20:35PM +0200, Alban Bedel wrote:
> The bounds check for the index passed to
> software_node_get_reference_args() was failing when passed UINT_MAX,
> this in turn would lead to an out of bound access in the property
> array. Fix the bound check to also cover the UINT_MAX case.

...

> -	if ((index + 1) * sizeof(*ref) > prop->length)
> +	if (index >= prop->length / sizeof(*ref))

It trades multiplication for division (which might be not always
power-of-two).

>  		return -ENOENT;

-- 
With Best Regards,
Andy Shevchenko


