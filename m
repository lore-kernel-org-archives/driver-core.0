Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781347;
	b=4tCQscNnqlYWP/113Yezn+lS2I7hM9XvqDNltQqBDLKIn/3NLjkrrdzW4FfKmuPWh0+1
	 I6ErMnW1QhC15yE011EuKNL7wulDM6NaEpXKtTWW6ctGEki6Im3xsOLcuttjUr6qoDeIA
	 NwqyxKqpSau8wpZn7YCbZEcW6zQ/7jehEnfSzQ6h0cTyJTdgV8ZnDEZ14gqeuk3iVmgr4
	 OrCnr96pyrEwWGGtWnlqMPYkmFZu+1jiV6J91BWXy7R6ksNye9CmIf9pq0Vt39oW6Q7HY
	 fSsDd76lRUVoL7MM675rCaRPuSMA+F5T1aGcRWKTsMexyz4Lzgx+hU8wVcBYE012juA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781347;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=/uMLBHxWohgE/F8ooDLhRcSeD3BAuoZ4IO/H8eSEi0E=;
	b=3oBLRbPf3s072ImyerskWUemjDixeTHy31gcoQtnZyugwO9m/k/kaIHKKtB42jeUw1ou
	 X4NnNonU8sVLwuIOYK8crHayN6c0fo8IRzsBEpxAGD2fI3oUAY6yywP03mgIp5iLD0cUN
	 Cqs2HXvlU6JD4cQao4tvGRASXPzuJlKUVLCa1p1C0XP29jS71dOzBLDP0GBfMbt2PxivZ
	 z/PW5FhAbE8EWMDaJoATmXyfnB/FmaZOt6Y7lgzLtwvaEZVDO/PxQstTlDzK4+QRx1VzK
	 0qIst81PFW4vSNxxP/s5kjiHNLMnR8ViSQcqTW33WHJSwZ9mbpmhqBhcsysb6g6PHvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HwPXWwA9;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA5C606A326
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 08:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA5C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HwPXWwA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793781347; x=1825317347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uKOSyayJx9+QMQNFXoH1UFqc1dN/TFUA+vdki/ypgVA=;
  b=HwPXWwA9+LOymz5BZBePlpRiloS62LdXLSqL/ZKdzCj6VScRtHWPIP/M
   W1e0H3KV4awq+cAiFIXIWnogcZj2KLRvndsv2xHiWKKsfjLrETNhv4D5C
   1eFb3uI2Jrq9IThPorWQ7e17Bk22BSKsxpvzI3HxlKKMQhbDig+cOgbzn
   hK5kAHTLSJFF0hx5oSCYMsB9Fd7uF0FHA4gGNcBZSiVixV/FkkZ2FY5P2
   xsvhlYGaXvTa99dh8Vn9U08D3TTajojoMY0suoe6soKlqJlG0WWsead86
   hYiuYRa6QkbbUkH596iLoquTpiIqCdqEhkYXME9Gm5H70i3si7NuuVGwa
   w==;
X-CSE-ConnectionGUID: vnadyf3XSIWOCpCfDAcGHg==
X-CSE-MsgGUID: t+ore4PRTzC68hl4kuQAFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2525260"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2525260"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:35:47 -0800
X-CSE-ConnectionGUID: Umcevaq5RXio3yCNslldBg==
X-CSE-MsgGUID: hNKdN2YWRw+PUKv+CqpZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7217576"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:35:43 -0800
Date: Wed, 4 Nov 2026 10:35:41 +0200
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
Message-ID: <auruXXGTDMU1wcwU@ashevche-desk.local>
References: <20261102-swnode-only-owner-release-v1-1-ee4c9022a629@oss.qualcomm.com>
 <aurU5Z1CNl87uMrU@bvivekan-mobl1>
 <aurqev-AgiGYo5DT@ashevche-desk.local>
 <aursSlF3yRXrBPjH@bvivekan-mobl1>
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
In-Reply-To: <aursSlF3yRXrBPjH@bvivekan-mobl1>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 01:56:50PM +0530, Vivekanandan, Balasubramani wrote:
> On 04.11.2026 10:19, Andy Shevchenko wrote:
> > On Wed, Nov 04, 2026 at 12:17:01PM +0530, Vivekanandan, Balasubramani wrote:
> > > On 02.11.2026 16:25, Bartosz Golaszewski wrote:

...

> > > > Reported-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > > Closes: https://lore.kernel.org/all/20261009164241.923756-2-balasubramani.vivekanandan@intel.com/
> > 
> > > > ---
> > > > This is my approach at addressing the bug reported by Vivekanandan
> > > > directly in driver core. Please test it if you can.
> > > > ---
> > 
> > > Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > 
> > Thanks, would it be possible to test this?
> 
> Tested it already. Kernel crash is fixed.

Thanks, but we expect a formal Tested-by tag. Reviewed-by is only about how
we read the code.

-- 
With Best Regards,
Andy Shevchenko


