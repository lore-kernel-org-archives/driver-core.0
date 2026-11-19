Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121438;
	b=HkbBPMLtuXs3otM81oIGHk9BkxG3onrPGCWp/CEaRdRJTuy5rIAVmTf5mpLRavM3s0Zf
	 izwAdwBxmeX84Q3mrUoa1CbxVA9+SIAQFVaEbQXJ+1ZTZpoY3Ndrrb0o8Ru0BLC+0IWD7
	 nAbFN5D/Stqk+CrR+Q+t61kYjQUxgarEVnShsxnv2M/YQztBdzN/dTtrt1WNOW1DmtZlq
	 S3Oue5LsLDL9YJsfe0k11N/cDnZpWHT1HnT+yqXBmUho4B6Ha1Em+LhhkDjtWhaDoxA+A
	 ig5CTDT4r5wBcCeR5iMLLfnSXX4FwhlqUyKb5Gk1XSFpJOHWhZgTppTAtc7UyRNG/qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121438;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=ycYVNqIJjcI1U8+T6x8QTPpspjAQajfY27bE74r/uVE=;
	b=Y2J9H9UXPszXERamLTuXx/1SrNuFYVwZH8QpBNVAl1PfmRoF4kqW8S4MWDLbde/cKDtC
	 KF3/+Wajjb5HuImxk7b4V82lKZ2GRSBFMZTY2ZUV+qEWgNBqyd3SU5/1WoLsUj3R7IVUK
	 adKNyVPPMkgiz37E2ML11detjEJ19H1a9whAu92IRtVoyvWTD7UcIKUliAiZ6+IB8I0Ic
	 TiJkQU/Mu8VdXr6YoS6Pd2BOCw+56JTVTuHYnWZTXl0JRVfJ15qngn/h1fbNd3GARkZRr
	 0mCYudm3L4ZedUvC1HJuF9kW8ujmfueXvg8jxHVKrdrFfmjvr1QxBNXp13ofXqu9Umw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CI2aBWr4;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F9C606A903
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 20:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F9C606A903
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CI2aBWr4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795121438; x=1826657438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EB4trBC5j2tDFjhzNSEIIW38w0NLc5Z19TLoWFO9ENE=;
  b=CI2aBWr4sZYvv8w0cxTk/to2M5kD+7X3jKAa9EqYpTVoxQQn/KlQPCa/
   nTQzGCGZWfl4T6Eh/Sy56brOPLBnm4MKrLfBjQqfDJeEHYSOBJ+YzNeA5
   q1GoDQfzMri6sB3cE4+ytRUFnDztjwfva4JToK9gIar2mR+ZI7tJ1oZJS
   6FjyFYdY8hj+0iwTqW/gb8PACxEcpxCLy0fIE8pJ9SmHfiN/0VURlQHK8
   TzU2Qr1JFU6FKVuM5m8xMs50GmT2iSAnIQtTkAGYtXIQma0zaOpOW6FHK
   dVubPLObgvpTDaW7ZiytJ+vVFVgxoXyYTEYxowU57Z8OBkuvjXBOZm/pp
   A==;
X-CSE-ConnectionGUID: a8Hy7qWkQeKcossQX0MCjA==
X-CSE-MsgGUID: jn8ApNrwTbOPQ/fFjBHGvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3884330"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3884330"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:50:37 -0800
X-CSE-ConnectionGUID: o6TCV4W7R3+7eR2sT8LXFA==
X-CSE-MsgGUID: jwbH+Da3QXiViTBAaJoGIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10524786"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:50:35 -0800
Date: Thu, 19 Nov 2026 22:50:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stuart Summers <stuart.summers@intel.com>
Cc: driver-core@lists.linux.dev, bartosz.golaszewski@oss.qualcomm.com,
	balasubramani.vivekanandan@intel.com,
	intel-xe@lists.freedesktop.org, heikki.krogerus@linux.intel.com,
	dakr@kernel.org
Subject: Re: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
Message-ID: <av9hGMZz0SZyxCQR@ashevche-desk.local>
References: <20261118223023.19653-3-stuart.summers@intel.com>
 <20261118223023.19653-4-stuart.summers@intel.com>
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
In-Reply-To: <20261118223023.19653-4-stuart.summers@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 18, 2026 at 10:30:23PM +0000, Stuart Summers wrote:
> Cover the pattern used by drm/xe + i2c-designware, where a software node
> assigned as a platform device's primary firmware node is handed to a
> second device via device_set_node(), and make sure removing that second
> device leaves the owner's node intact.
> 
> A potential fix for this issue in the drm/xe driver is being discussed
> in [1].
> 
> The signature in this case looks like this:

> Oops: general protection fault, probably for non-canonical address
> 0x6b6b6b6b6b6b6b73

This probably was a single line, make it so in the commit message despite its
length.

> RIP: platform_device_release+0x6f/0x80

...

Test cases are always warmly welcome!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


