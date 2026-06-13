Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F6036BCDA
	for <driver-core@lists.linux.dev>; Sat, 13 Jun 2026 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781355649; cv=none; b=lHMBlidlA4ji7vD4szKmTbd7JZVVOBkRSokN7JHwf1I+J4b4QGAOrZgRobEVtSdU+ozk7j6tDm1fOaoDGalwVYbISRBmPH8F1qi/unhVoLWA7uqil5b/7y0Lne60nsEdvI/1SehQawQmFmZjTDH35A7VSuDMpcNJL9hCiuVMJd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781355649; c=relaxed/simple;
	bh=uxJGwCAsMcpFZ/9RNw7yRRDOB6tqapy/6259X4loI4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCiSn2qVhajTFZLlbDGppIekhG8N5IR1VjFKASQu4xVSbh1cFCqV92zbyxTsmdWAJIFnKanJdpEcnAugkvkNjV4/6S2RfHm7DCZ4VUgAkFy8sdwlEXqX6buiG882sb4fQV4gCnmueUCS1V6xJLlp+z50Xv5TBpQ2rDyAFegYdPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkgKn3ah; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkgKn3ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781355648; x=1812891648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uxJGwCAsMcpFZ/9RNw7yRRDOB6tqapy/6259X4loI4s=;
  b=EkgKn3ahvmXVwlWZmoiW2J5B7+NTAQCdYTFA7t+ZUDHY0mndSWljcTnq
   KvkLgftzSW+CYW0oVXps9ZlKZ5k5mS5S7LNyvbzCqUDoGWBuxDzqWU25H
   9pHo/iIDahBRUvxhEXm7y9HQpvyiZ75MESakU/ZkXWWcJxQHSGIPTkGT8
   GfFx28PV94hIfM7CAxvb5ITHyzHXZWCnuFbG2EhLdKvy7X8E+N5FFQVvv
   BbMeKDh+pgKtgwTCHilQ+kdC/m/5EP75iHnmS4vm0gQIS6FiT9BbK5+JP
   u0rVNftah8NsS1If//s2yGwo8nLNnUgoG3qTjb4F6n/mP8fzxsSPMYGGc
   w==;
X-CSE-ConnectionGUID: KUjMRuUZQRqiGnKhIrEpwQ==
X-CSE-MsgGUID: dkEp6h7KTye5XF+U6lYH7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82014782"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="82014782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 06:00:48 -0700
X-CSE-ConnectionGUID: 9YFHfovRT2GI8xWhDYQGUA==
X-CSE-MsgGUID: xEQJQI/xSEusBaz11tHecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="246931274"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.184])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 06:00:43 -0700
Date: Sat, 13 Jun 2026 16:00:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 02/16] device property: Add
 fwnode_graph_get_next_port_endpoint()
Message-ID: <ai1UeO-BZQEEheml@ashevche-desk.local>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-3-wenst@chromium.org>
 <ailv8HpnrCH3Zb8C@ashevche-desk.local>
 <CAGXv+5EHHWfiWgqPpf-RMKoSQLc2cd9OA4Z36SNoL5C53kVh2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EHHWfiWgqPpf-RMKoSQLc2cd9OA4Z36SNoL5C53kVh2g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 12, 2026 at 04:20:18PM +0900, Chen-Yu Tsai wrote:
> On Wed, Jun 10, 2026 at 11:08 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Jun 10, 2026 at 04:40:36PM +0800, Chen-Yu Tsai wrote:

...

> > > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
> > > +                                                       struct fwnode_handle *prev)
> > > +{
> > > +     struct fwnode_handle *ep;
> >
> > Unused?
> >
> > > +     while (1) {
> >
> > This is usually harder to read and follow. It's like "pay much attention on
> > the code", but here no rocket science, no code to really pay attention to.
> >
> > > +             prev = fwnode_get_next_child_node(port, prev);
> > > +             if (!prev)
> > > +                     break;
> > > +
> > > +             if (WARN(!fwnode_name_eq(prev, "endpoint"),
> > > +                      "non endpoint node is used (%pfw)", prev))
> > > +                     continue;
> > > +
> > > +             break;
> > > +     }
> > > +
> > > +     return prev;
> > > +}
> >
> > So, this can be rewritten as
> >
> >         ep = prev;
> >         do {
> >                 ep = fwnode_get_next_child_node(port, ep);
> >                 if (fwnode_name_eq(ep, "endpoint"))
> >                         break;
> >
> >                 WARN_ON(ep, ...);
> >         } while (ep);
> >
> >         return ep;
> >
> > But also big question why? to WARN*(). There is no use in the entire
> > property.c.
> 
> Will drop. This function was lifted from drivers/of/property.c then
> adapted to the fwnode APIs, so it still has the structure of its
> origin. With the WARN() gone, rewriting it as do {} while() becomes:
> 
> do {
>         prev = fwnode_get_next_child_node(port, prev);
>         if (prev && fwnode_name_eq(prev, "endpoint"))

'prev &&' is not needed.

>                 break;
> } while (prev);
> 
> return prev;

-- 
With Best Regards,
Andy Shevchenko


