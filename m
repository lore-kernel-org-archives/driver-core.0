Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B483232B137
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593502; cv=none; b=ThFTwDK3pWp8TBhBc9zKIzdtjUNcIjJBstT3fyFVHDBhJNKfDUlAz/svD7I9FzEpnHPBL7njc5w6QNgDEZIs1I9eF3T/YEznaxW2JBP3VtB87u61eAPhaTF3Qc48mIZZlRUzzUcYArKBFVfFTWsvEl4xEETdsAvD3ZlOwgtK8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593502; c=relaxed/simple;
	bh=iLiK3CTSDdvUowUyU7p7EgFeHFgaWNMld+MOAz5fmpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgUEWUiixwFSYw4nrB1ZUQH6AUdgtQlUKeIYak7EWVlxs4ZI51ULfy7C2+ei/GxZaxUKktYsqWUavkkL4fjtOS31MOS6kPV5bqojTFCyYLwGOLowan05U+21oVGpkJ+aO7UQ/2Nhl20UmAYPt6PHcxI2dzjv9x2jxOrLxtBCJLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oK3GT2gk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oK3GT2gk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783593501; x=1815129501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iLiK3CTSDdvUowUyU7p7EgFeHFgaWNMld+MOAz5fmpk=;
  b=oK3GT2gkIpRJJjuVtzslVKmsKxyiFwWb2BlcR9oEhXYCXYaW1Gif0i9j
   JTw7qdk8F3GuEmPaV18ONNWZET4Ls2FeVkFTYZ/lQSSGuByCwilXOcEf6
   doYYxFXC2q1/PmcFpC55ssQpcM8+kC0xo/17YOtgn6ByNhNSESWcujniv
   D5H3/LojxlP/hV6iV4i+46Bs9wuN/L125Gvs2/BNP37JeVfvsFbEfGpi4
   BOw44G6ZdSHAs0KJdmVsD1w68jbJiIrZOejQl7gzbuekQQxCKmONMM2jZ
   B6ZQFZQO/Hr4tOzTiyGb6732SEvSR8RR/E6/Sr7aKRV+GFBR4ll/iZT+E
   g==;
X-CSE-ConnectionGUID: Vklsg5XBTx+/64DruTfI5g==
X-CSE-MsgGUID: hjGO/ARUQPmis6eP493jlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84149229"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84149229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:38:21 -0700
X-CSE-ConnectionGUID: 9eSEoKOvQvKdFLKV0C3kuA==
X-CSE-MsgGUID: NW8U+aFdQuuqkVYYdWQYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251896574"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:38:16 -0700
Date: Thu, 9 Jul 2026 13:38:14 +0300
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
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/14] usb: hub: Pass |struct usb_port*| to
 usb_port_is_power_on()
Message-ID: <ak96Fi4U3JJzbW3f@ashevche-desk.local>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709095726.704448-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 09, 2026 at 05:57:12PM +0800, Chen-Yu Tsai wrote:
> usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
> it to tell if the hub/port is SuperSpeed or not.
> 
> In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> state tracking field in |struct usb_port|. Either structure can be used
> to identify whether a port/hub is SuperSpeed or not, as the field in
> |struct usb_port| is inherited from the hub:
> 
>     port->is_superspeed = hub_is_superspeed(hub)
> 
> Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> |struct usb_port*| so a subsequent change can use it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


