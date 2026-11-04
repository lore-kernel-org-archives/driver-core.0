Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780353;
	b=enTXWHZ+N0oHybYo1wFjM88vVg9FoD46JWt9n+xx0AbE8QcoOnQzme6NwpiIiK+zc7nf
	 5MVaAD6g/OWa43ZseFcsaK0QDlz3kkfRykhUiVeC2jQaTYTX2pb3hlmbQOun/q2FrbzbH
	 KspV6hc3ZJUS6pZBgZuzqhdBTvwqa5NWOU42s2nbI5Ou73LwB712JDfSt4wE09lY0ErWb
	 VD3AmYI0PzmeNi0YHv068P4lh36XOUd+QiD6TcJI2PRkkzdc2zRaClRdb7LNZPlTZ7O5y
	 x3zwKUAUml8nSFW+vI2/7dzyq00tc1QyPJmDFEHjwTgYtPkukijsCJ4qBglmIenEYbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780353;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=NExaWPR6b3vPAjSZHLkW68uDa0LxPHZXSvtgMc9tD74=;
	b=BgTN7Bw/4szE8+pvXe9NlBalFZ1JxjQTjaiANV9otaV2DDn5HeY/mQSCzOs07xeYyuOw
	 WcMwur5Pu33fjGOMeT6d50Iej+x8W+h/WuJy8OrkSH+SaXZ+ohqZFeU7BCpEHFi/7kzJN
	 WTkKHASkwr3gv8hnN3vD1RU/1eNdknQjGae50H4jZskr7AaI+joTgQ2EnacTW1Pq4R1QN
	 M28VrQ16kW90shuSh4MU+f1DfNBaU5KGaKF3ZBsYu2/4v5QxjUOzsmVb9ZAV7HhzPi/Wp
	 YqKHe5hx7U6rv8XwHlY7AgYqY8twDKmsWDK0ENfJRLCKGN0lqpPmwlbJOPyqIddSSyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Dn/bW/1x";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BF1606A329
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 08:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7BF1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dn/bW/1x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793780353; x=1825316353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mHxyElwRd8tymKXxiCENQvH4gQgeaNqbXSZ6efWcyY8=;
  b=Dn/bW/1xLhA9QIAnRU/ettmxk0qR35K7jT4QdoLTEvD76EgL4yUOAgBS
   CBfy0eP/WZbZl5dgZ3zo1M93LIFFOMwGgMpDPfx+suh9CyYF3VAnSSaOs
   rWpGuyvDEsYJowipDCvZPfLwCwqJYBK/KwPUpfD+STj/dUp6EsCgdY3qY
   PrIefPClHdTDoH708MSj4Q2JrKMIWJglwqHyNr1h0rWvw+HMH7jzWloF9
   VCYFcH86vaKj8iirYUaf5o20xYlLexBvvmJdGwLEDUUOzlG+t4d+Tz6wP
   GhvylmnI9QX0SybUGWRRjxRkF6q307lhmmfvGZpQiPqTg1UxR3ixkJTat
   w==;
X-CSE-ConnectionGUID: h4t22Z5HSfiWxugQaBuGsA==
X-CSE-MsgGUID: i77Lfq0NTG+cHRlBa7O2QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2523849"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2523849"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:19:12 -0800
X-CSE-ConnectionGUID: KII69xHYTBGMFnWre/0tUA==
X-CSE-MsgGUID: BejNALFMQIGfKGxMIs0MHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7214274"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:19:09 -0800
Date: Wed, 4 Nov 2026 10:19:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] software node: only let the owner release a managed node
Message-ID: <aurqev-AgiGYo5DT@ashevche-desk.local>
References: <20261102-swnode-only-owner-release-v1-1-ee4c9022a629@oss.qualcomm.com>
 <aurU5Z1CNl87uMrU@bvivekan-mobl1>
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
In-Reply-To: <aurU5Z1CNl87uMrU@bvivekan-mobl1>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 12:17:01PM +0530, Vivekanandan, Balasubramani wrote:
> On 02.11.2026 16:25, Bartosz Golaszewski wrote:

...

> > Reported-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > Closes: https://lore.kernel.org/all/20261009164241.923756-2-balasubramani.vivekanandan@intel.com/

> > ---
> > This is my approach at addressing the bug reported by Vivekanandan
> > directly in driver core. Please test it if you can.
> > ---

> Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Thanks, would it be possible to test this?

-- 
With Best Regards,
Andy Shevchenko


