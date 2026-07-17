Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078E73009E1;
	Fri, 17 Jul 2026 16:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306012; cv=none; b=lEitXcw9UsgTte7LviYdvxejxDnRLDZbHNjc4rmh2iqindW0LKwyaNuvoH4Xitq4TdNuDE5idWHpJNzGsbi75z5AZ1axsNLbFwqh/y4+7vdLFbOQi3drmzAw+KTIMZPaH5bOec0i5/TdbH24oQFwh/pYqs2GV+biEJIcfKaZr7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306012; c=relaxed/simple;
	bh=Io3ds/w/9KLyhjESEFhjl0UtnJORPqYNi1v3E3bM/gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kX3xbisy42T81cJqcYsRchPo2M8dkn+NFs4NXmWAjVKyb+WijLFyf1dbppu/xplMYcMIMGoJrymU6XKEoHJkfQg+29I2O6ovr6ctqflVRzCwGb+oqHKpWPUu3fPzXGEHmTF5q2Ge7MBJXEBSf/1mS/MSQaKKI9lF4FSzhSuDTA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWatbO3P; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWatbO3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784306010; x=1815842010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Io3ds/w/9KLyhjESEFhjl0UtnJORPqYNi1v3E3bM/gE=;
  b=VWatbO3PSx2vXGm2Bi5KNY1Cg/p5VNlbwNBq94vmT6MYaCdIi+vFxNSo
   g/SAgSrLKBHEixn4XvLQEXVevCaani0dSaqjPOrP3wMVjd99aWZknQayx
   RQgakrO8c3eBAOX1c/zqzZCYvTJM7zQvI+nmAMSeIceO3PKWubpky+yYC
   gH72UHNEoabBjzZChoYHMYAubd7EaUam4M2q9dVFK2Cu5FiueWKlsQKfA
   Tob1kbUCjXRc0UFoyJGQjSr1+ipVPLcowmHBHYlxn2hFyTCnf4pKcP14x
   Enn1VAkr77iYoTJEnek40suUaAM3o4MJA6VAUt5Qxf28C1rakrfJYzVK3
   g==;
X-CSE-ConnectionGUID: L/0Ku9bDRy6oRKkRPqmfNw==
X-CSE-MsgGUID: TdcOEsULTB+m0YdQsXJ/gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="87526471"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="87526471"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 09:33:29 -0700
X-CSE-ConnectionGUID: gcMJdWumR46RYX5syV2nfw==
X-CSE-MsgGUID: M+5JhkdVRT26c+iOX1C5cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="261104881"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.143])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 09:33:28 -0700
Date: Fri, 17 Jul 2026 19:33:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	driver-core@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 02/16] device property: Add
 fwnode_graph_get_next_port_endpoint()
Message-ID: <alpZVUEOidfGMpfD@ashevche-desk.local>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-3-wenst@chromium.org>
 <20260715090944.2B4441F000E9@smtp.kernel.org>
 <CAGXv+5Ffsrc9r6d_RrgL1mBW1Zmt1RxCrMCjaD7vuF3+EaeAqw@mail.gmail.com>
 <allHTc-bJrPwDA0b@ashevche-desk.local>
 <CAGXv+5HS3neb=8EW0FT2-tP-dhPFqQ+q8YRS8Gy_XBic4z4Mug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HS3neb=8EW0FT2-tP-dhPFqQ+q8YRS8Gy_XBic4z4Mug@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 17, 2026 at 07:05:56PM +0800, Chen-Yu Tsai wrote:
> On Fri, Jul 17, 2026 at 5:04 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Jul 16, 2026 at 04:52:27PM +0800, Chen-Yu Tsai wrote:
> > > On Wed, Jul 15, 2026 at 5:09 PM <sashiko-bot@kernel.org> wrote:

...

> > > > > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
> > > > > +                                                       struct fwnode_handle *prev)
> > > > > +{
> > > > > +     do {
> > > > > +             prev = fwnode_get_next_child_node(port, prev);
> > > >
> > > > [Severity: High]
> > > > This is a pre-existing issue, but iterating over endpoints using
> > > > fwnode_get_next_child_node() can cause an infinite loop and a use-after-free
> > > > if a device has secondary fwnodes attached.
> > > >
> > > > If a device port has both primary children and a secondary fwnode, the primary
> > > > ops finish and drop the reference to the last primary child, returning NULL.
> > > > Then, fwnode_get_next_child_node() incorrectly passes this same dropped child
> > > > pointer to the secondary ops:
> > > >
> > > > drivers/base/property.c:fwnode_get_next_child_node() {
> > > >         /* Try to find a child in primary fwnode */
> > > >         next = fwnode_call_ptr_op(fwnode, get_next_child_node, child);
> > > >         if (next)
> > > >                 return next;
> > > >
> > > >         /* When no more children in primary, continue with secondary */
> > > >         return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node, child);
> > > > }
> > > >
> > > > This can result in a double-put. Furthermore, when traversing secondary
> > > > children, the primary ops don't recognize the software node, treat it as NULL,
> > > > and return the first primary child again, creating an infinite loop.
> >
> > Yeah, it has to be implemented in a way how fwnode_graph_get_next_endpoint() is done.
> 
> If your patch series addresses the issue, I guess we can consider it
> covered? Sashiko labeled this a pre-existing.

I noticed that it addresses only main get_next case, but get_next_available is
still with the same issue. It's not that critical, we don't use much that API,
but still will be good to fix at some point.

> > > > [Severity: Medium]
> > > > Does this fail to unconditionally put the prev reference if the provided port
> > > > is invalid?
> > > >
> > > > If a caller passes a valid prev node but port is NULL or an error pointer,
> > > > fwnode_get_next_child_node() returns early without dropping prev:
> > > >
> > > > drivers/base/property.c:fwnode_get_next_child_node() {
> > > >         struct fwnode_handle *next;
> > > >
> > > >         if (IS_ERR_OR_NULL(fwnode))
> > > >                 return NULL;
> > > >     ...
> > > > }
> > > >
> > > > Could this lead to a reference count leak, violating the documented API
> > > > contract that prev is unconditionally put?
> > >
> > > This seems like what the other fwnode_get_next_*() functions are doing.
> > > I'd say this is a pre-existing issue as well.
> >
> > See this series (not yet applied, you even have chance to review it!):
> > 20260611203537.1786399-1-andriy.shevchenko@linux.intel.com
> 
> I believe that series addresses the first issue, not this one, even
> though it partially mitigates it.
> 
> The contract says "puts a reference to @prev unconditionally." What it
> doesn't say is that it requires @node to be valid, i.e. the function
> is a no-op if node == NULL.
> 
> "node != NULL" being an implicit requirement seems to be the norm for
> the fwnode_* and of_* APIs. It's not explicitly spelled out and Sashiko
> lacks the context for it.
> 
> I'm not sure this should be changed within this patch. It would end up
> as a mismatch between the various functions and possibly lead to more
> confusion.

How does node become invalid after that patch?

> > > > > +             if (fwnode_name_eq(prev, "endpoint"))
> > > >
> > > > [Severity: High]
> > > > Does hardcoding this string match break the fwnode graph abstraction for
> > > > non-DeviceTree platforms?
> > > >
> > > > By strictly matching the "endpoint" prefix, this bypasses the provider-specific
> > > > fwnode_operations, which could silently ignore valid ACPI and software node
> > > > endpoints that don't follow this exact naming scheme. Shouldn't this rely on
> > > > the backend-specific graph_get_next_endpoint operations instead?
> > >
> > > From drivers/acpi/property.c it seems that ACPI graphs follow the same
> > > structure. I don't have visibility into ACPI implementations though.
> >
> > Sashiko might be right. ACPI has device and data nodes, for device nodes the
> > name will be FourCC, so never longer than 4 characters. For data nodes, it
> > takes their names, which are arbitrary strings and seems should follow the given
> > schema. You need Sakari Ailus to review this patch.
> 
> OK. Will add Sakari in the next version.

Hmm... This is interesting. For any fwnode API changes you should add the
respective reviewers. Do you use tools or doing that manually? You should use
tools. I know that `b4` is capable of doing that, but I use a script [1] I
wrote a few years ago.

> > > We also have the following in include/linux/fwnode.h:
> > >
> > > #define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
> > > #define SWNODE_GRAPH_ENDPOINT_NAME_FMT          "endpoint@%u"
> > >
> > > So this should not be a problem.
> > >
> > > > > +                     break;
> > > > > +     } while (prev);
> > > > > +
> > > > > +     return prev;
> > > > > +}

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko


