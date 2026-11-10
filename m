Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308739;
	b=q007KPYGV2TlS+xAYiAXU+D98nuw5+f4z9YxvzULk3fz27Mp5YFm/vJKW36g4nb4Vv9Z
	 OleD7I2CtrD1BBjrVOhh3WpiKSWuqYB5xXq03A9m8SrY3iU58/609rXUswp1fxcGSRZ+5
	 c+LxahnNyhHx0SmnGD6bo+U04tvJYpsmiiJ0/4basKmY6XrpUaVkupv3umam+q+9gfwKT
	 42ZgupoINQaPpeDiSwL1ASqL6rw/i0OapQmVZKXuRUmJh7hnQRIFANVaJcbDsY3BlcA9R
	 MBYQBijLSD3dgatxWBOCHnl+ZqsceWAxZCvEEGfeKb/7e9xFxsBhKZ0OH3iJjFLYHUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308739;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=UWdoVUW7J+0l2zpPuyQUXGw8D+AQv3S+X0pPHKfyEKM=;
	b=hD1Fosd2t+7RIWBNbzdMMTXlt//AGCQcdpQBf8Obn3lYYNaq5d8uKt1GDtyADRG7cRc9
	 QizlCpuZbYf9srBwrgebJq9kSHJeJlIVaKKnOMeja9MOk6iodlswgWEkvlJtDhBtiK2R6
	 X9BHEcY0Pp7HtffbQ1QU0ARb9Dt9r0Lg2KoNBkJL1WHuzx8HzOKET8/ehlCfQhZvXjAoe
	 WYepMjJJSxLh+mgCtB/kg4QfNhAO1UdJCMt3FK/T0vuslY8Nrw3Y61sfKd0sYdz/sEqsr
	 I6PTuNfw8ZZwtvybEXxRJaMsLqaqJniUhSSY85lydohrqkhDtK24031uiOF3YFIqfmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N79xP+0l;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D2D606A325
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 11:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D2D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N79xP+0l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794308739; x=1825844739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W2I6IHQtrrQJgh/0T3Apf/w0vVtE694YmzdBIAGXOB4=;
  b=N79xP+0li6Bxpw2XxjlMSUM/LsPGvNGKvFGn8W6zSsbU42k94SEXDzI5
   HCSWkXv/8C2XdYEZ7Kd1eYyx0cfxE1+MPowDOwRbRYv/fZjIXFPSqRuAx
   M8MNI5z6Gn331w+3z2CL1r9tzOO8KRQhAcPKtg/mhmP0Q3youMa6UFy+S
   bJ+Bd0wXWjQ+6qs7l0WwnBXHTkmqPZjEhyq974j8dqgDG4peZgpPm8412
   vkjo6NNIP/n1YWDKMUr8xKS9E37Jh3MEsKbTxpMrfOsJsvcBobYx4iTel
   JTYcHfKzfQtvnSOA2coyFSdcJjr6l4BKDkD2VxscB5jzFbvb3uO8iiYGn
   Q==;
X-CSE-ConnectionGUID: dZQivXE6QBGw1Ha/YEK0FA==
X-CSE-MsgGUID: wi4d2AE5S5WrPxHKPiw7mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3050207"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3050207"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 03:05:38 -0800
X-CSE-ConnectionGUID: UdtjNb7IRG+hYwFvflIHXQ==
X-CSE-MsgGUID: EwpTM369SHSieH++CPnuEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8139190"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 03:05:35 -0800
Date: Tue, 10 Nov 2026 13:05:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, driver-core@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] swnode: ignore primary nodes in
 device_remove_software_node()
Message-ID: <avL6fMr4qn5UkBra@ashevche-desk.local>
References: <20261110085125.2535508-1-johan@kernel.org>
 <20261110085125.2535508-5-johan@kernel.org>
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
In-Reply-To: <20261110085125.2535508-5-johan@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 10, 2026 at 09:51:20AM +0100, Johan Hovold wrote:
> device_remove_software_node() should only be used to remove secondary
> firmware nodes added by device_add_software_node() but will currently
> drop a reference also if a device has a primary software node.
> 
> Bail out early if device_remove_software_node() is called for a device
> whose primary firmware node is a software node and fix up the two
> callers that currently work around this themselves.

...

> -static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
> +bool fwnode_is_primary(struct fwnode_handle *fwnode)
>  {
>  	return fwnode && !IS_ERR(fwnode->secondary);
>  }

> +EXPORT_SYMBOL_GPL(fwnode_is_primary);

Do we need this export? I was expecting that this API shouldn't be used in any
of the modules.

...

> +bool fwnode_is_primary(struct fwnode_handle *fwnode);
>  void set_primary_fwnode(struct device *dev, struct fwnode_handle *fwnode);
>  void set_secondary_fwnode(struct device *dev, struct fwnode_handle *fwnode);
>  void device_set_node(struct device *dev, struct fwnode_handle *fwnode);

Yeah, I was proposing to have include/device/fwnode.h for these APIs and
accompanying data types...

-- 
With Best Regards,
Andy Shevchenko


