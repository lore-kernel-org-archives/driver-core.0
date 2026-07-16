Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151C73C4552;
	Thu, 16 Jul 2026 21:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235867; cv=none; b=Ep8VyN54EX0QDphy9DAHWOjE4chlNHTBwSPsaKlZ63UkmofxtTY5DPm2K8+JvGck+Vc0oe/UF+W6qd+G2TdHdMYqAZ5GGaY0PoEsWhQ8bAe67DYkkh5T1qKpg3hbxn6n9RnuMCqWJSvUpUSQoqX3Yw+aZcdspxzlgY3fW0Q6s0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235867; c=relaxed/simple;
	bh=MYVPQu9rslzLbV2oJxLwcePhwCmSCEN5FSUby+GAi8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tG8L52Ms2qFriCLDUCguNOM564uxcC0YK9ds9SZjTyw+1bvdn6SAZ5GKxFqfJ+MEbLAh5gsgvSez7Bt2UQgnPqCGdrWoedZm9mDUBq5CjmmPcsMcuAWAwzUQSzlMElaSzpmbq7YOOgalbQGplMhQ+2b719W+m6o+mbZIM6Besqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzEnoGvQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzEnoGvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784235860; x=1815771860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MYVPQu9rslzLbV2oJxLwcePhwCmSCEN5FSUby+GAi8I=;
  b=SzEnoGvQpZ4H24Set9YLaSWbwl09EtGkPZfEJlRLAoxjruwj9c3J8oOy
   24JJsT0Ren+G0W+gTU+fxoJ3MbrfJNyMeaxsUzCdVplxO76lE39VMl0so
   0Fh6h5NnYG3PmM8kO3IB8lS1J6WP11DgL8oLdmYCMMHDLh67NibFagJvm
   krqL0EfaXPUQazCCMO85eFhOXeHvqn8e1L/jrwZq3pioGGibc64GLri16
   fYJaUewBMUGq/5kreZnbKVwVqhz5gqYsKcwC4sm7XQZC0g+XoRm1YHNN3
   gmZSYaPeouENo39vrHeop/Fsu8Xd1uxyDowtySFQUsnujh+yAzb1Ostwn
   w==;
X-CSE-ConnectionGUID: lWDyCRORSiuR0R00H1mB2A==
X-CSE-MsgGUID: hwEEwIscRluqlZ6whd5mzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96421328"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="96421328"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 14:04:18 -0700
X-CSE-ConnectionGUID: oqOPp3yoTCmV9rQ0RVsdqQ==
X-CSE-MsgGUID: dnTR6M7uSTO5xhmYUde7eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="260189460"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 14:04:16 -0700
Date: Fri, 17 Jul 2026 00:04:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	driver-core@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 02/16] device property: Add
 fwnode_graph_get_next_port_endpoint()
Message-ID: <allHTc-bJrPwDA0b@ashevche-desk.local>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-3-wenst@chromium.org>
 <20260715090944.2B4441F000E9@smtp.kernel.org>
 <CAGXv+5Ffsrc9r6d_RrgL1mBW1Zmt1RxCrMCjaD7vuF3+EaeAqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Ffsrc9r6d_RrgL1mBW1Zmt1RxCrMCjaD7vuF3+EaeAqw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 16, 2026 at 04:52:27PM +0800, Chen-Yu Tsai wrote:
> On Wed, Jul 15, 2026 at 5:09 PM <sashiko-bot@kernel.org> wrote:

...

> > > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
> > > +                                                       struct fwnode_handle *prev)
> > > +{
> > > +     do {
> > > +             prev = fwnode_get_next_child_node(port, prev);
> >
> > [Severity: High]
> > This is a pre-existing issue, but iterating over endpoints using
> > fwnode_get_next_child_node() can cause an infinite loop and a use-after-free
> > if a device has secondary fwnodes attached.
> >
> > If a device port has both primary children and a secondary fwnode, the primary
> > ops finish and drop the reference to the last primary child, returning NULL.
> > Then, fwnode_get_next_child_node() incorrectly passes this same dropped child
> > pointer to the secondary ops:
> >
> > drivers/base/property.c:fwnode_get_next_child_node() {
> >         /* Try to find a child in primary fwnode */
> >         next = fwnode_call_ptr_op(fwnode, get_next_child_node, child);
> >         if (next)
> >                 return next;
> >
> >         /* When no more children in primary, continue with secondary */
> >         return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node, child);
> > }
> >
> > This can result in a double-put. Furthermore, when traversing secondary
> > children, the primary ops don't recognize the software node, treat it as NULL,
> > and return the first primary child again, creating an infinite loop.

Yeah, it has to be implemented in a way how fwnode_graph_get_next_endpoint() is done.

> > [Severity: Medium]
> > Does this fail to unconditionally put the prev reference if the provided port
> > is invalid?
> >
> > If a caller passes a valid prev node but port is NULL or an error pointer,
> > fwnode_get_next_child_node() returns early without dropping prev:
> >
> > drivers/base/property.c:fwnode_get_next_child_node() {
> >         struct fwnode_handle *next;
> >
> >         if (IS_ERR_OR_NULL(fwnode))
> >                 return NULL;
> >     ...
> > }
> >
> > Could this lead to a reference count leak, violating the documented API
> > contract that prev is unconditionally put?
> 
> This seems like what the other fwnode_get_next_*() functions are doing.
> I'd say this is a pre-existing issue as well.

See this series (not yet applied, you even have chance to review it!):
20260611203537.1786399-1-andriy.shevchenko@linux.intel.com

> > > +             if (fwnode_name_eq(prev, "endpoint"))
> >
> > [Severity: High]
> > Does hardcoding this string match break the fwnode graph abstraction for
> > non-DeviceTree platforms?
> >
> > By strictly matching the "endpoint" prefix, this bypasses the provider-specific
> > fwnode_operations, which could silently ignore valid ACPI and software node
> > endpoints that don't follow this exact naming scheme. Shouldn't this rely on
> > the backend-specific graph_get_next_endpoint operations instead?
> 
> From drivers/acpi/property.c it seems that ACPI graphs follow the same
> structure. I don't have visibility into ACPI implementations though.

Sashiko might be right. ACPI has device and data nodes, for device nodes the
name will be FourCC, so never longer than 4 characters. For data nodes, it
takes their names, which are arbitrary strings and seems should follow the given
schema. You need Sakari Ailus to review this patch.

> We also have the following in include/linux/fwnode.h:
> 
> #define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
> #define SWNODE_GRAPH_ENDPOINT_NAME_FMT          "endpoint@%u"
> 
> So this should not be a problem.
> 
> > > +                     break;
> > > +     } while (prev);
> > > +
> > > +     return prev;
> > > +}

-- 
With Best Regards,
Andy Shevchenko


