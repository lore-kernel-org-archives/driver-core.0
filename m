Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC316384237
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255347; cv=none; b=Z+DxJF6vlly01fMutuqlJ5SeVVcxW7rxBoflwBDmV6VWc3zdtGVZRfh795MenA0Q86T/WMcdr3HOPRFE41cz/ISKHTpf7FHevyo7Yxu9N8OWei87TxTVNOtuuynP/Qt+ObGeDRbc5pkji5lrxmVuHcz+iRSdQOq0XWgNh8mjIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255347; c=relaxed/simple;
	bh=bwb7jkLjaaKlWbdAB/OX1187xqrOeUjk7Vg8pnqZOK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iH03o31q0mxFJVeGSIG6zVW96WKTWAxrSXpIoLlmabAXkD4VxYrLfeiIjjt6o+GUVWJiGykMYNvf19qdcqW1sDJ3oGrk0neuGZ306kka/7OSgO8J1Uj9X4vXHZaYLLNxKHiXQtVT7DsTgmo2lfenyy7KUGuI5c5v2l5blytSCr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHc1UylF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHc1UylF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774255345; x=1805791345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwb7jkLjaaKlWbdAB/OX1187xqrOeUjk7Vg8pnqZOK8=;
  b=aHc1UylFevt5kBwINagWL8WkIXGzuLiMIpBg3WxQDikrYceK16kI1mA3
   XjHMBX/4/ygZ5sVnYTpXvyBQhcKsvef2ez6EYQFbFMPb0lbt+O7IyAEYF
   k6aPK2sfIa0t5KYmUEZ6/dNsjrWqEnlTb8Oyh4BykD9ooXBjaMCNY796r
   8zcUcIzHzLCpltMprvJ2lEdB8Zc8dZGwHYII35IX/YvAz0Zsj/LzjQla0
   pFa42PIiRbj/8Bq9v33RF+1RYOqi6k3w11TiXCoJaw6H2U2kyhKf8se/9
   UdzX2Y1msbXh4YebtBlKP1cLRUrdw/zJyvnMIFyfNG6vACP/S1C4by6Ag
   w==;
X-CSE-ConnectionGUID: LXmHpGd5RdKhiaZkpRz4Zw==
X-CSE-MsgGUID: bKlexF8QTaeSKcROlb1Rmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79106236"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="79106236"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:42:24 -0700
X-CSE-ConnectionGUID: qgWC4VA7Q1On5R6YgH73Hg==
X-CSE-MsgGUID: aShKC0ffRZWfLkD1UvsdRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="228885126"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.18])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:42:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2910211F94F;
	Mon, 23 Mar 2026 10:42:24 +0200 (EET)
Date: Mon, 23 Mar 2026 10:42:24 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/1] device property: Document how to check for the
 property presence
Message-ID: <acD88LdaXte7wrWz@kekkonen.localdomain>
References: <20260318142404.2526642-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318142404.2526642-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Wed, Mar 18, 2026 at 03:21:40PM +0100, Andy Shevchenko wrote:
> Currently it's unclear if one may or may not rely on the error codes
> returned from the property getters to check for the property presence.
> Clarify this by updating kernel-doc for fwnode_property_*() and
> device_property_*() where it's applicable.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/r/4b24f1f4-b395-467a-81b7-1334a2d48845@roeck-us.net
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for the update.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
