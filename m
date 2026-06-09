Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73153CF1E9
	for <driver-core@lists.linux.dev>; Tue,  9 Jun 2026 06:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985086; cv=none; b=Ojdz7wXgdCW8+o1HeFfjARFiU3vfB6EoGZj5bR4ipl1ifor6j+3qIGOn+J/qLzwA/wg/0SfHCBx05gbJiFnD6OZ2MyRWU/KF2EeUipMvVWWJPk1g7oT4BJj78a6sAWI8CZgrVXUMgE1WWmbqsmnOIvPAWRW64eBiWYcbjWIjCWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985086; c=relaxed/simple;
	bh=731ExrIFuYhYyY+T6Moi5PvW6EPSmsOR52dcNI589PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvSxagDU4sLqm9tZ4tIUFsQsKS/uWcq0QLOrhGZwAN96RZzK8VyD7mzsol03czQZHwDsCl+rAC40uLsFhF3ac/tYezPuPJPd2FkjBLu9lCNVdQ3HIZ4IrXGFvXJVr8lrC1Ghlp0qOZqyC4OyO6IhsewBV2xEWeFWKtLMi4iYAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpipNPyb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpipNPyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780985086; x=1812521086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=731ExrIFuYhYyY+T6Moi5PvW6EPSmsOR52dcNI589PY=;
  b=YpipNPybovfzpuhF+htlfmxONPKX1rZAjo4yhUvnwPeUNmz49v6MRKAT
   vtSRq/iZ2aogEYb0taTF68R5wpr4vc78x74gLyqyQAeOL7qxfXiR5GXvx
   2G76omx+hda8U98XH+T6iMOsZJo2MGJFmKF8FBdWOKUZru1iUU5R/+IDS
   Kp2/szXcf2NPyJO10dJqLIIcikCbWP2ER+XLgEErbW6vn/OvYcyeuC+K8
   62IzqRScxZf9Sb7joUIFmDE41JQIoCUq/iqGng8l263lYH7XkspuwWa1I
   GmH0l/cKGeNhHT5ActA35pWsMxCxpCnnzAOHJcOn4GZg02NChg3FElI0E
   w==;
X-CSE-ConnectionGUID: vvGvpbFgTMKYDLJ/ch6kWA==
X-CSE-MsgGUID: ZWAXQw5lSt2Y+gsU8a+E+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81713990"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="81713990"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 23:04:46 -0700
X-CSE-ConnectionGUID: caMgAKDMQt+tzUDfqvaHlA==
X-CSE-MsgGUID: Y5uwqR98Ta6DRpf+0IDxZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="241587140"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.39])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 23:04:42 -0700
Date: Tue, 9 Jun 2026 09:04:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] software node: allow passing reference args to
 PROPERTY_ENTRY_REF()
Message-ID: <aies-OJokLx4IAHf@ashevche-desk.local>
References: <aiTo4dvKu8pyimHA@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiTo4dvKu8pyimHA@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jun 06, 2026 at 08:51:29PM -0700, Dmitry Torokhov wrote:
> When dynamically creating software nodes and properties for subsequent
> use with software_node_register() current implementation of
> PROPERTY_ENTRY_REF() is not suitable because it creates a temporary
> instance of struct software_node_ref_args on stack which will later
> disappear, and software_node_register() only does shallow copy of
> properties.
> 
> Fix this by allowing to pass address of reference arguments structure
> directly into PROPERTY_ENTRY_REF(), so that caller can manage lifetime
> of the object properly.

Now it looks nice and good, thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


