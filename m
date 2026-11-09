Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245322;
	b=X2556MV0KI+4jec9JRTWohFEYcnodWjLKmOaUpOa6KezfCA5jZTQ/CUqBlrXJycWzVT8
	 F9knZuV6xHTZqfs1z3dgp+0wOYUwPpnW3GdyhoNa2RzYMTcx4Kb4014Pl7HnuvzZRX3oX
	 jmozEwRHOteKY7fwfl1ugUx0LD+KeJxPyfNZoBH8d+8K5+7qO8zIB/SPhHi4hq0x55wzE
	 DnK9m1cDY99BINyY7xpuQ/U3BXGZmAD1poJp6uxVev9MUnJRGOrZxRi0m7BVO17WSdFaP
	 hkJfhha57CgD2qUk9EkgqlFuXjJceyiaMmt7/YurQCfNtSLzS88HNQFQIhpjy1y/+RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245322;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=qRjzt/bH5jDngzJr4W8d1d/oZfLkUy/oU6+unqf5Pk4=;
	b=d0eALujngVibw+oz08MEayJgsy6rAD4R5S0ewFso20EyjBiNPAT6UmMgJagqN1MrDZEx
	 6eO8ChQH0EafezdeSQpj6OTduZBI+VdiPokonTrbwzWPE7xcEkb1ynXfBxr2mIaaehoXD
	 CKLckYw7cNuXJcCwaq4tAzJxXTgVDCMnrJeQ1bNK/R79SOKzzUOFug0qcjg3t1ReEfiX8
	 OxLsXAIlt0ocq0I1O3wYKbReuYhwcgW5lS9nnQBXUiwjZEoSCdA+KP8em5ENYInXqPsre
	 5B9RXqnIJK5doMJMObDqcJUpO+MVQmeuwi0nd51iY81I8mL74h3kUY6YriEzScoPo8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PjfNukQx;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADCA606A32A
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 17:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADCA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PjfNukQx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794245322; x=1825781322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ar1TVtAm+rvGquAEzkco4mRBe7I0DyfasS/JM+grgNc=;
  b=PjfNukQxbqA3dtIT/h64Gv6izhyVEfhLKz5J/Ei27qEpKK2pZAvOXFkj
   ww4tdn163l0DtTeOISBiLN7V22nQfl8juvb1ek5ONlbxXqUyaY9div7bJ
   V5I4V7KUDjqieU+480r67PGPsIChzxbl6bsOdUshye9VtfWpyhqtnZ1Fi
   Sr2HuJwHB5M52RE+Rb19+X3AckITUDAeOlu+fdZ1P8Gb6Q0SGCSwe/n1x
   dS1hkFBY9Ent+sHM68syZ546qLLMRZ/4xLgFdz0RaiiTih7O5mEUlpWpq
   HB0jUZeTUT5Mx2ij6/NbFvqzTdRSNvk9OBuTQjoPueUnZE+bE5+AY6RD5
   w==;
X-CSE-ConnectionGUID: mP+KG/vpTqiQb/CXCpZVuw==
X-CSE-MsgGUID: bAz4VYG2RviG/zr3MQZd1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2970922"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2970922"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:28:41 -0800
X-CSE-ConnectionGUID: VdCIUz+9TlyfdNc/xxFYmA==
X-CSE-MsgGUID: ucYIODM9ShSeTtbSAloFqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8069574"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:28:36 -0800
Date: Mon, 9 Nov 2026 19:28:33 +0200
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
	Linus Walleij <linusw@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
Message-ID: <avICwdxyi-W1Y3PD@ashevche-desk.local>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
 <auuhy40x1BMoW96-@ashevche-desk.local>
 <7sfr4ljlwbehal3or4dmy5jxbjz6ya2lf3dq3yptr54wym5tea@eqaexflmocih>
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
In-Reply-To: <7sfr4ljlwbehal3or4dmy5jxbjz6ya2lf3dq3yptr54wym5tea@eqaexflmocih>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 09, 2026 at 02:07:46PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 04, 2026 at 11:21:15PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 04, 2026 at 03:03:47PM +0100, Bartosz Golaszewski wrote:

...

> > > +	for_each_property_of_node(node, prop)
> > > +		count++;
> > 
> > Hmm... Don't we have a helper for that already?
> 
> I haven't found one. Though I'm thinking that maybe
> fwnode_property_get_names() with props == NULL could serve that purpose?
> Possibly wrapped in a static inline fwnode_property_count()? Would
> anyone use it though?

I haven't found any users for this. Most of the current ones of
for_each_property_of_node() are filtering by property name.

...

> > > +		names[i] = kstrdup(prop->name, GFP_KERNEL);
> > 
> > Can property be statically defined somewhere? We might want to also optimize
> > these duplications with const variant (here or elsewhere, for fwnode generic
> > path, I believe).
> 
> Please rephrase because I'm not quite following what you're saying.

Can prop->name come from something that is declared as

static const ... foo = {
	... .name = "bar";
};

?

-- 
With Best Regards,
Andy Shevchenko


