Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258882;
	b=WT0rVV54MOGaBP9ZxAvsd2l139+Ur9aImKliCpJ+GZmeupwM938/GSF4vn9/3czdT4+F
	 +HsaTyIESaJhKhow9soGF4IHH+dt2MCe84YNsrGUFPKACgE7z24ffGsPDmg0kf64x3MnE
	 wSRYoHJW8pfRwYrYQEO1Kg6tcO7gEu3R8/Qm8BMWxqfuiIpxXzdghqFtcaE7WYkzm6dCv
	 58mBtmt9G9TK+NzEv/KhSTJMv1xqzfxgZ0LegcoOCxF8P4nCG4qCyzT0mJDa4LCpjooOA
	 T+NDrwibsG6E6NsKfzRvzX6Pc1xuPPtNPYaD4TVCe2//FFmvGqqexEt8bcKorEQecKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258882;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=LzxAxQBez/SvJRZ4viHcOWPNEClCEA7jRf28Z+6nb+A=;
	b=GeQtjtnRbFHr+Tlh32EqHhdHBcG0khLFIVhN2RwiQLnwxoaD03toDZnj6nyTH02PN75H
	 r27/582zo1LDdW4XYkY6ZfakuaPFzZBIXfeeH75fLn1j1d+M858WEunDt6xua3wLdAHjX
	 lIaaZRYGUwrtv2AJAzJY7JLDxCaSxs5VVv5ChWCo4gvFqCTcIPj4FeeWiwbj5sVUlTGzZ
	 VhgsT1z4Vq8Nf56pND91C0PYlgThzSSVM/em9O8XtNeSXVJPS4vIfd4p9gYpGZ8w1O/xb
	 TsisRnxM068OGtVO1ZVhynQUDQX/r6zE2b0HBNWIrW30nRlR/TZCwVuXf9Dk14C+PxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PzBM3Qa7;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99328606A31C;
	Mon,  9 Nov 2026 21:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99328606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PzBM3Qa7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794258882; x=1825794882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kmHmN0RR8dw/qpJ0KbXfrz1fGzXClYbh/LSN+8s2mS0=;
  b=PzBM3Qa7tX3HN+vTJ+oGcTvdt9wHrp5gcnq3wBajGZjx+dLRcIcYnOp0
   pHGM1rh1Gu8QUW4jiXm1gBsMkdYGukgzOyKmLwJutdSalWQ7qGGWst2yc
   01VA7j0dN9v7Li5O1J3PobHsaiqWk2xwSl4yCuvLzlcylClQ9VL8M1CSW
   Lcp84vQK54+ELRaFyZqp4v5K+zFsedZk0BOFG4bqJ1gblAykGf+/lkIDp
   3DTLqsuoxNA8KKSfVfMggyjT8SWgLHlwdC8PDYdwtYfGNWhdRZrhGJzTz
   apflEo88fMwu+MsuRwupUW8XsrkYAsjEXrIfyafleKtIrz/ePnGRsPslV
   g==;
X-CSE-ConnectionGUID: kVRPuDUfRsGtzioeun9w0w==
X-CSE-MsgGUID: xwog1uglQzqzN2/wlY2/Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3024645"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3024645"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:14:41 -0800
X-CSE-ConnectionGUID: xzmAUpCHQqOrNJwalQn7LQ==
X-CSE-MsgGUID: CoDzslKhTQqir/LTY6qg2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8128451"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:14:38 -0800
Date: Mon, 9 Nov 2026 23:14:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 4/4] software node: pin remote endpoint swnode
Message-ID: <avI3u_QLJ-UTLkYh@ashevche-desk.local>
References: <20261106-swnode-race-v1-v2-0-f8bc7b14d578@nxp.com>
 <20261106-swnode-race-v1-v2-4-f8bc7b14d578@nxp.com>
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
In-Reply-To: <20261106-swnode-race-v1-v2-4-f8bc7b14d578@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 06, 2026 at 12:38:38PM +0800, Peng Fan (OSS) wrote:
> 
> software_node_graph_get_remote_endpoint() looks up the referenced node
> with software_node_fwnode() and then takes a reference with
> software_node_get(). The borrowed pointer can be released in between.
> 
> Use software_node_to_swnode_get() directly and return the fwnode with
> the acquired reference retained.

...

> software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
>  {
>  	struct swnode *swnode = to_swnode(fwnode);
>  	const struct software_node_ref_args *ref;
> +	struct swnode *remote;
>  	const struct property_entry *prop;

Prevent reversed xmas tree order.

-- 
With Best Regards,
Andy Shevchenko


