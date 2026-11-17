Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924339;
	b=M6fME7ahbA5rwL1dnpoqDZA9Z7EAjcHFBfFPEQdc71Y17Px3nkn1atpZBoToewj2RdFn
	 XdIdceHCdB1txS+o1ovqb7eivO+iwo6ZPxd6y1yX3AYgywvutU0eMibaya9HwgDxMrmUG
	 4nVBtvVXWG17bfScmdb38EtAgSFZo5yr6g+HL6WgsFd8T79LP8z+KWvLVZYB2hp1UCL+Q
	 Xjbutb8w6Sz4gBe0G+Ph0poED+WaODGOEv0k1sgMusNQf53M1qu/2mUgNnUaBXcBKl8o2
	 gH+5jBpvKhl+Ld+7wv0kMUrxqCIYm5SNLOtxB4FhF+x8mxpj9uYjMHzfujNuuyjg7rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924339;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=opbBm2/37AM3yBDA/DHq/MwYrj+L8S/uWQoh0WMObTY=;
	b=JXj2Tm4vj76OykRe0zGU6hRcNu3wlQ1GRJCM+ApgIzJno3tzeiymkwfeW/4TtbMQSDBh
	 hVewI4AkIRNiSFOkZytOJSDm8NzzHDkj8KdMC0IvCpFSRPv+rHzhyagZ6lZpNxjNMFn44
	 nba2ow28MGIBtya7XfMa+JCF3vCRnLpppSoOvu+K0c/pP6/2OcAyiksnpE2DNBbKllWqv
	 GzSu3hC9UaS+cO9vpz5LnlahLopx/5q8mMgPsHpE8Rr5rLIygsg0sORhwNyI6It0w3v1U
	 R+YUFjYR3xDOikqkmJtHqbkXu7Mg4NvMT4CH3gBvX4wEX8ZypHMAxAlir/I/4Qg/XaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hndgNWbt;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5E1606A32F
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 14:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A5E1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hndgNWbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794924340; x=1826460340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KydewmbmxKPgGxK4o8twYaPnxD8vMzg/Fay2DpUgCco=;
  b=hndgNWbteuAPdrmx7kIDVEb0XlyZjSR1OO+X/Wq8zMvkvAxgNk5Vy6sB
   CthEwPZmtiZ09AV2ziV7IH+ySGDNN+AsF5brc8hioOlq0xaYM6uOVJxyM
   AJwSD57kFqHH8JeMDcmdYtksWdycydDs1Hl3yhZpEIQ8/siMaavwaiLnr
   DpUAJoV2K+J9tCKMqz3kS7uBFuSKnSPmnh/a0KK/TcViCpIVJnmEkczck
   93LKA9JEaZ+XSnWansGCukftqD2gPv5VBeGakAoB1TBAB6qbYO0JnQJBk
   V7o7J1HhVs+szSvJILAunJBTM6/RTQFoVHIddaZhTGhtHt0fp8xyqDMek
   A==;
X-CSE-ConnectionGUID: TOwDxhZ3Rjui0P1Nk+e1jQ==
X-CSE-MsgGUID: 3DpUuRVMSzavmgeAe28PsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3585594"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3585594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 06:05:39 -0800
X-CSE-ConnectionGUID: 59adwGCITWOJl7oRD3c9fw==
X-CSE-MsgGUID: cvJudEFeRcGzkqULTvfljQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9705187"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 06:05:33 -0800
Date: Tue, 17 Nov 2026 16:05:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 10/10] gpio: shared: generalize most code to firmware
 nodes
Message-ID: <avxfK3z6bvWmiWoq@ashevche-desk.local>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
 <20261113-fwnode-for-each-prop-v2-10-4edc23d5cf50@oss.qualcomm.com>
 <avc4g9cbAOEElzRX@ashevche-desk.local>
 <riqrrdjxaygsphy2mxe5xbsrokjtw6kyrneiyzsh7kld4qnrwf@iaa73bchswrz>
 <avwrKmg3uyvP19pq@ashevche-desk.local>
 <ofjnhfxx32khew77khya2whrfg336qvfsxwq25gz2psckhducv@cnfhpk2uobg4>
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
In-Reply-To: <ofjnhfxx32khew77khya2whrfg336qvfsxwq25gz2psckhducv@cnfhpk2uobg4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 11:46:35AM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 17, 2026 at 12:23:38PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 17, 2026 at 10:50:38AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Nov 13, 2026 at 06:19:15PM +0200, Andy Shevchenko wrote:
> > > > On Fri, Nov 13, 2026 at 04:47:10PM +0100, Bartosz Golaszewski wrote:

...

> > > > > -static int gpio_shared_of_scan(void)
> > > > > +static __maybe_unused int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
> > > > >  {
> > > > > -	if (of_root)
> > > > > -		return gpio_shared_of_traverse(of_root);
> > > > > +	int ret;
> > > > > +
> > > > > +	if (gpio_shared_fwnode_ignore(curr))
> > > > > +		return 0;
> > > > > +
> > > > > +	ret = gpio_shared_fwnode_scan_properties(curr);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	fwnode_for_each_child_node_scoped(curr, child) {
> > > > > +		ret = gpio_shared_fwnode_traverse(child);
> > > > > +		if (ret)
> > > > > +			return ret;
> > > > > +	}
> > > > >  
> > > > >  	return 0;
> > > > >  }
> > > > > -#else
> > > > > +
> > > > >  static int gpio_shared_of_scan(void)
> > > > >  {
> > > > > +#if IS_ENABLED(CONFIG_OF)
> > > > > +	if (of_root)
> > > > > +		return gpio_shared_fwnode_traverse(of_fwnode_handle(of_root));
> > > > > +#endif
> > > > > +
> > > > >  	return 0;
> > > > >  }
> > > > > -#endif /* CONFIG_OF */
> > > > 
> > > > Hmm... What do you exactly get from the compiler without this uglyfication?
> > > 
> > > The alternative is an empty stub for gpio_shared_of_scan() and keeping
> > > CONFIG_OF around most of the code in that file. I think it looks better
> > > this way.
> > 
> > My question basically was what will go wrong if you drop that #if completely?
> 
> Kernel will not link with !CONFIG_OF as of_root is defined and exported in
> drivers/of/base.c.

Wouldn't

	if (IS_ENABLED(CONFIG_OF) && of_root)

be sufficient instead of ugly #if?

-- 
With Best Regards,
Andy Shevchenko


