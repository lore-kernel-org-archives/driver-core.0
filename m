Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879995;
	b=F4ktm3/q2uyWuH8sg4M3blJAe6QIx/pcR38jdkSZUoqGSP2cRRcvocAEkQb09I+lLaBY
	 QEGwO6PebFO6l3fQuACkDdZD5ymUPqNmS6RenqX8BZrqn5o95U6LGIXXGDGnF71m0+ASE
	 wAEZB0bf4dBlQaeqzI+e2AkfsCdGLpNma7p4bbPH2YgC3mbopuvnELmGySz7VaZypHF/a
	 eD/vgEdP+vTmG20+EsYA77SZKMZDx5g+kh94EhNyZ3Q4evPBo2yZw7pv0p28O6ja6IhD5
	 1V2B0aZb5aD3512eh9jz3RolhFoFvPcNGmpjSxtz1A+RFImKnYRU2+662BbM4ZVkgIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879995;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=55ziTKuLaUytKA90JjVsAjKL4og9cquzU6OFv/arPMc=;
	b=lavapMIck856+7eOPKrtpbouJvxBI8LskPbtildVQ2jyRlxeeV2msCkN/luiRM+qj0b6
	 ign4gSEDZ0UXbRSbJZthu8sgP8yugVXvnZQYaPwlEiH0wJJVX2gDgcpnkzs1UaN4b7kJv
	 IkgjwEsvnmqSveFVWoqZAJAbqZ4ZSjHtbk76GQs23QFJpON2Hpv55sl3GK5HeLABthKzN
	 3TFu/i3TIMvmVgaGfC0D3ihdOgTz/vCCtMx7Wop3r5yF+YaSOBlvRlCSGLF1HNOp/6eGd
	 1k6Y07RDQIUwBY+n6s4/a6TsLWiTWBu0M3svmNUpm2NZfiGJiTNwud4piS8b5YLgysA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YbDiy4rs;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524B5606A326
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 11:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 524B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YbDiy4rs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793879995; x=1825415995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8YvxtWgLQBW0AzQWnk0oKqSHDpGrA9Gbt/fWjyjghwg=;
  b=YbDiy4rsz2k1UcVf9ymx2c4OSv0Vi6DkJEIYUrrs4HuBWpyNoNIOZjKo
   a6KpXfZdddmUuoJIxE5Qzg1q5jxtX2ShLRI8bat416KKVIc6+4xXLry7y
   0IP3BztDIokCx+tpb40Z0sPtIIeATqcv4bsuS4eyfVfhPFaFwmQ9nr11k
   GM3dFsdnTzZ0MvFsCzuM+O5X/s4RDTtC+GCq+gnyrRlVWBVXHGPje+huw
   3fkIB+2qcQQmCAGjyfRYN8hIfYNAlYeYXxREKoUWkAyjXtiGpo5rqRKTQ
   0Dtf48DJ/qOyg692wDY0udpMuoTOR9JBRa1trgu9sXFDH5kIRemVVYMgo
   A==;
X-CSE-ConnectionGUID: ey5rYE1TTc6TUuLK1kHnsg==
X-CSE-MsgGUID: 4HM1SgiJS8mpuD9GJDYcNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2756515"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2756515"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:59:54 -0800
X-CSE-ConnectionGUID: 1uRZnbrxRheLw/xzWZLFaQ==
X-CSE-MsgGUID: xp2+bDVwRnS+waA63Sa6CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6867168"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:59:47 -0800
Date: Thu, 5 Nov 2026 13:59:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Joe Perches <joe@perches.com>, Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Len Brown <lenb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linusw@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Add strprefix() and fix a bug with it
Message-ID: <auxvsAZ4D-osszY1@ashevche-desk.local>
References: <cover.1793876837.git.alx@kernel.org>
 <CAHp75VdFH146fNhw1ysUbgCPbpv+K++kWvbyZxU=V7tDh0T88Q@mail.gmail.com>
 <auxn9fKsOKeIFIJa@devuan>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auxn9fKsOKeIFIJa@devuan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 12:38:47PM +0100, Alejandro Colomar wrote:
> > Date: 2026-11-05 13:24:18+0200
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>

...

> > > Testing
> > > ~~~~~~~
> > >
> > > I've built this patch set with 'allmodconfig'.  I've not run the
> > > resulting kernel, though.
> > 
> > No, all lib/ new code should be accompanied with new (Kunit) test
> > cases. Update the respective lib/tests/* for that or if not yet
> > converted to Kunit something in lib/*test*.c
> 
> Thanks!  Does this sound good to you?

Let's put it this way — it's a good start!

> BTW, I don't see any existing tests of str_has_prefix() --the API I'm
> replacing-- under lib/.
> 
> 	$ grep -rn str_has_prefix lib/

Can we use a common sense? lib/tests/ lists these:
printf_kunit.c
string_helpers_kunit.c
string_kunit.c

One of them (supposedly string_kunit.c) is what you are looking for.
If the test cases are not present, create them! It's as simple as that.

-- 
With Best Regards,
Andy Shevchenko


