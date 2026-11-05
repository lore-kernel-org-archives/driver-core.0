Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902138;
	b=ucKEdir7t7kKgVk0md3IWS+1BIQ6u15Zc3yFtypU3AcRNgajXc/QlLcGj1Je93ODUwbA
	 ZlqpjMErAZllefJKjG+9UwnjuViMzOjObK6YUSRcfDXA9tk3iIDCJ7NQ3UX5dhniCEWRH
	 j9VvzsaPtGTiR6pSmxysvWkT/pzPjhMSG3dfZbYStaSKpKwDePLAjFSA6rbSeX477YKju
	 zZABXz7YdNQ5RgEJF92YpWAEyiNHGYbTJVfX8wxVmXvrnKGN96EDrMjdRAInXGUmHMUr6
	 3wuFahXSWAJvAqc5Vthh7MVnGI2hCjTEis7k1jZNYNWyKwCERGD34JM8UENVjsIIruw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902138;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=OmJWt9jy32DuAAccMJWm3nkUUMzFdTd0nlAd4UIVKyo=;
	b=LjbCBQ7AhGEQb0Z0OIomB8wMHQzUHxc2QVkhuEMbp3F6olfX8o/40PtfUwpeOLjPTkDl
	 oalq40/9onq/tWVOBD7H9n1ufA51bZr+3Qa1AksPaqukTNN+DfY2CgeQUhV0sv67NyobD
	 0Ln41mfHkI0x/0/FkANvDBBhoW3t+G87ouklQ0VcIFZVnpVZbSUp/Mvs85QSxR/GIOVpV
	 5GAq3snqF5uvoj6gEy0pIlrB2T8fZF2ym49naZLbhbI3/1TipeVxV32G6x7c1fAwFn410
	 ZkTP1QVTMJKmWxXm5rgMywRPfEJo3lUXSd9U4rVLv/2g5tDJAMpDEMGCzf11s24v3WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EZl+LRNT;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BC0606A326
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 18:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12BC0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EZl+LRNT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793902138; x=1825438138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R8mPcNA+R5yTmhfrNdwr9xg6yzKlFMkZyh0EGXU8Rds=;
  b=EZl+LRNTA0+QWjwbvx+FbC9kfuk9ncqViCSIyy6iO8XTtIjrVxG9jcyZ
   M2brjjZa34aYpnloxqCPW8mkus0YClOU2cwIoFeXHzytbrCl2ujC8L4Si
   UefG5/obWNfoopkXxEjAoOoaosEtCi7OEybGqmQnqT5fuPC1CFC7FW2Xo
   0ShvcrZOG1u5jwr1lANvZAE+CfYbW6+PMWlhsr6oaoTKY7MdnY6NHPMBr
   xvE77GUDTEdHT1ccUH6XkOnjBy56lOXDn8Mzvjv3NwnjzOE7yMv5d2JyA
   2Yc2/9NLBawgXPaTk8vjoVgemySj7C5aTjLZiUoev9bniTB9H1hf1Wp0C
   A==;
X-CSE-ConnectionGUID: 7YOeZtDjQUq6slBY4FFWiQ==
X-CSE-MsgGUID: qupBBHr7RuS4FFC3AF8j+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2741634"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2741634"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 10:08:57 -0800
X-CSE-ConnectionGUID: EgwaX09kSoe48x2Zn1fepA==
X-CSE-MsgGUID: Gd1RVswyQ9S/hX4a8iTtLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7401641"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 10:08:51 -0800
Date: Thu, 5 Nov 2026 20:08:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
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
	Saravana Kannan <saravanak@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate
 str_has_prefix()
Message-ID: <auzGMV1YbO9DodBq@ashevche-desk.local>
References: <cover.1793876837.git.alx@kernel.org>
 <9c81f6f62fd0e908e683c4c08b09a1f95bc2ec9c.1793876837.git.alx@kernel.org>
 <20261105111423.360f4ba8@gandalf.local.home>
 <auyuINXEJKc1KoG7@devuan>
 <20261105115019.2fe7c91b@gandalf.local.home>
 <auy0O467UqOzqYub@devuan>
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
In-Reply-To: <auy0O467UqOzqYub@devuan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 06:46:18PM +0100, Alejandro Colomar wrote:
> > Date: 2026-11-05 11:50:19-0500
> > From: Steven Rostedt <rostedt@goodmis.org>

[...]

> > Oops, typo, I meant trace_event_filter.c
> 
> Still not found.
> 
> 	alx@devuan:~/src/linux/linux/master$ find | grep trace_event_filter.c
> 	alx@devuan:~/src/linux/linux/master$ find | grep trace.event.filter
> 	alx@devuan:~/src/linux/linux/master$ 

Oh, you are an oldschool guy :-)

I can't believe people with Git index available are using `find`
and not `git ls-files`. `find` is too slow...

-- 
With Best Regards,
Andy Shevchenko


