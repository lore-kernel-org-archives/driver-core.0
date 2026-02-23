Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7A0339870
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 17:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771869290; cv=none; b=G4wYM7t1nplBUV3qxDSa/JTA15LtA3s923z8MxdH4NNFLf9vzkCBb7XLsKD6NmQDleb9I3MOmVByIctJXiN9NxLYSG8K/m6GV3YAow0DS4y1/qwXw1OdwDtEuW9J+qnCa2IwNBrEJ+y/lgRPQlWMS1j4ANDwsSF5jLiAZoUZ3fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771869290; c=relaxed/simple;
	bh=QNk9mwxIRZgCXMrxrgyvewByldxU4cf5Y9MIHnvZKM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jm9/ArgfZ0BS3YRTHb9tdcRJ1TNQk+speZYonUoQ5fCHd5mz/jp4twKVlKllbZg/K2P7cfLOj7GE+d9gxdW+DfIwVxTV9OUzFEFUaozC03y9KSlkIPP2k7qR7FzJYkW6bBefaM/IJxtfBlWWjFe/fafHxJ2E05LUYvCeB8Ez5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8/1ZLLx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8/1ZLLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771869290; x=1803405290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QNk9mwxIRZgCXMrxrgyvewByldxU4cf5Y9MIHnvZKM8=;
  b=f8/1ZLLxC2MUNOzdPxD15AQxHCHIn0eaoDrhZUTR7pNV8Etall2p+AN6
   YXW6YtU/+pF5vHb/JX6HibdXUZ+/vatefhiWViPq1EPkOhUqUWj1qvyh0
   CTeEoh6/Lbmy+hxb3nIUAI7ZydHigaJDuFqvdXjb3ZAre+/idt+R4C8Jm
   Ce3bwqjf5AFMKYbkX75z4+xxb104vGuXQxnOZWKvhzq28VHPl3xjNN14o
   1e+2mjd6QD70Eo9QQMxkybgR1d0bT1LwwJ2xNyCU/TtehJX6rARjGriu6
   4N6L6fXJHM7eZEQlUVaV6ocHIphXuw0ZaG5pfD6wkF8FsXWCKd2tav19P
   A==;
X-CSE-ConnectionGUID: ZD4rBHQkT+eQo5ooDTcocw==
X-CSE-MsgGUID: Ln8p4NoJTia7fPqI3Y2eTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72575034"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72575034"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:54:49 -0800
X-CSE-ConnectionGUID: HVN+B97CTPKV+ku3TafSVw==
X-CSE-MsgGUID: sIQ5ThnORxicLsf7zTUfxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="215657998"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:54:45 -0800
Date: Mon, 23 Feb 2026 19:54:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] driver core: make fwnode_is_primary() public
Message-ID: <aZyUY3ZsmrwHw4X_@smile.fi.intel.com>
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
 <20260223-device-match-secondary-fwnode-v2-1-966c00c9eeeb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-device-match-secondary-fwnode-v2-1-966c00c9eeeb@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Feb 23, 2026 at 04:40:52PM +0100, Bartosz Golaszewski wrote:
> Export fwnode_is_primary() in fwnode.h for use in driver code.

...

> --- a/include/linux/fwnode.h
> +++ b/include/linux/fwnode.h
> @@ -230,4 +230,9 @@ void fwnode_links_purge(struct fwnode_handle *fwnode);
>  void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
>  bool fw_devlink_is_strict(void);
>  
> +static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
> +{
> +	return fwnode && !IS_ERR(fwnode->secondary);
> +}

This is inconsistent. Please, split out fwnode stuff from device.h to
device/fwnode.h and share it there.

This reminds me to look what I have locally in development...


(With your patch it will be in device.h and fwnode.h and in the latter
 it's even not properly grouped with other non-fwdevlink related stuff.)

-- 
With Best Regards,
Andy Shevchenko


