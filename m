Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998368;
	b=SICiAwoI8h2+uIveuBSznXajqYobt/7s9UkGKmxvpS5E0tzTx8Q9QgpBcJ6LdL8T8S9i
	 ia8s6QuJPLufbQV3kUqJ1ykwggHbYRSPtM8y1Cid4RSrfEtRAQHrDkVJ3pz4u440JJwCi
	 +U+o3Pi/opG6k7DSNPNrLy1hq8iUffDrCjZqGTvuOdZWMIiHRQtmOds5Kz+wNSSZ+kcGG
	 ZCV7l8S4q/peeY29MVRjQpP1B4dRDuYF05OybhThF2M1p2Sj9M7aLmiX4uHzGtVJwoGhr
	 4SORSJifo6SeNF/S4JQ3/q1Ht3/5hRyjGRu4GAELdDRE7VJtt5fguTnhPKkbuCmLMNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998368;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=FbEQD5M3UYXQRXqyfi19N+b5UjzXEv/BtRZ0MIOvX3I=;
	b=BVjUSMXDs8aHjHqNkkVxgl3Mh6StV2s0ATBZmu0RHyafyv6xOFNCz+tftJ/OEOx/lQ8I
	 j8T5qetW+FNj1KfsfCUbGyp6oFIzFuLmZAnkWQS4l5FGTI9o3QPbkcvvyARImDhWmtDoP
	 dVbbeJMh15uZB25rDFytcTWLqAdethDhdtZ0J8vU1p4RhtFzLTMziJpFpYbCeNzry9tqi
	 oBjp8uRI4lak4Lg0x9U9uOBk0Fd7r1Y1d+Olp0K9HsAgj734Y+2yUyD970RfcDJSv4urQ
	 QYBI8Jsw1tS8vKnhPU0F5AZdce5s1Nc8hyXHw21sune391hxHh6UCq8jWbukQyG4K6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S5NsDiyp;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3C0606A325
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 10:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE3C0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S5NsDiyp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794998368; x=1826534368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C+KNOrCVujZhHnK6/CVLOwjEGKTtZH1w9yupF48hJqk=;
  b=S5NsDiypeCU1qoONsMFWT+3IVTheV6Jhlc+O8SjAV+zfq/OPSTkhq2hu
   J2Fxj6hi30DOBwHMz5ZDG0EqqogLzY3BaEUxJzyBtf6QFNXWEdap4Y9uX
   tmcPP9M9UTm1VvTgWxw56hR7DbVL3VrJ5fdWpFutHVXQlVW37zRiDeRzv
   FyLZ2IqYCpZ2y7oGeGwZlD9k/bohP2jGCp/x0YYgx1Sthhk5zD5IcW2qt
   OEvKB+IbrUxrS+xJy83L3Q5SRfZJ9pMx8MGklG//6fiNb8rWg+9cZ/QRU
   q+q48anh/atZedylxUxBpHs7Te8p/tEONIp2uFUm6ahJSUN1XhwkIKP5Z
   g==;
X-CSE-ConnectionGUID: 642ev2h2QJabCu9471r0Qg==
X-CSE-MsgGUID: HiJQUGhdRXGssBs4dhl/5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3792272"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3792272"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 02:39:27 -0800
X-CSE-ConnectionGUID: csp/N0A6QSWqU14XBSmI8w==
X-CSE-MsgGUID: Dvfkm19MT/S2NnHq9LbpZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10477321"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 02:39:24 -0800
Date: Wed, 18 Nov 2026 12:39:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] software node: ignore primary nodes in
 device_remove_software_node()
Message-ID: <av2AWRsjQfrmr5A3@ashevche-desk.local>
References: <20261117101336.980216-1-johan@kernel.org>
 <20261117101336.980216-5-johan@kernel.org>
 <avxeTnaEG_FnBhck@ashevche-desk.local>
 <av1xsrv8zNIEOtxg@hovoldconsulting.com>
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
In-Reply-To: <av1xsrv8zNIEOtxg@hovoldconsulting.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 18, 2026 at 10:36:50AM +0100, Johan Hovold wrote:
> On Tue, Nov 17, 2026 at 04:01:50PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 17, 2026 at 11:13:32AM +0100, Johan Hovold wrote:

...

> > > +++ b/drivers/i2c/i2c-core-base.c
> > 
> > >  void i2c_unregister_device(struct i2c_client *client)
> > >  {
> > >  	struct fwnode_handle *fwnode;
> > > -	bool fwnode_is_software_node;
> > >  
> > >  	if (IS_ERR_OR_NULL(client))
> > >  		return;
> > 
> > > -	fwnode_is_software_node = is_software_node(fwnode);
> > >  	device_remove_software_node(&client->dev);
> > >  	/*
> > > -	 * If the firmware node is a software node, its reference count
> > > -	 * was decremented by device_remove_software_node().
> > > +	 * Must be done after device_remove_software_node() which may have
> > > +	 * freed a secondary firmware node and cleared the fwnode pointer.
> > >  	 */
> > > -	if (!fwnode_is_software_node)
> > > -		fwnode_handle_put(fwnode);
> > > +	fwnode_handle_put(client->dev.fwnode);
> > 
> > We have fwnode getter, so better use it
> > 
> > 	fwnode_handle_put(dev_fwnode(&client->dev));
> 
> I used the fwnode pointer directly here on purpose since that is the
> pointer that gets cleared by device_remove_software_node() and which the
> comment refers to.
> 
> This hopefully also reduces the risk of anyone introducing a UAF by
> reusing the fwnode variable (or the compiler doing something silly since
> dev_fwnode() returns the dev->of_node->fwnode when CONFIG_OF is
> enabled).

This makes explicit use of the member outside of driver core. It adds
an unneeded burden on the possible changes in the future if we decide
to make the fwnode stuff being hidden in struct device (in a sense
of having say list head instead of that). I think we really need to
mark fwnode with __private there.

-- 
With Best Regards,
Andy Shevchenko


