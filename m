Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87B40683B
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593594; cv=none; b=hHDQSjmucxHnukHPzUPn4hrOoJnSDnECuGkpgjRtjHoXUHXj8IzgoQRwWjDnLEo3CT3PSKZn4FRE2tgVaBnN40fYYzrxC+HGtN86qxLZBKPzUeMQZnRfan+oNdc6/NIfZ66FPDdnvZpk24B5cdFsx6hN6cCqyiKlPegAOAxQ9UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593594; c=relaxed/simple;
	bh=e2sU0s40xkGwnyMyr3Gohlub14CCeKxZuEHRaPaL50k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B48hHCu1z0nDzn27oJoYPsfvbclK6ICUPvEWGyk754NWsSX2KBVr9DgXUumEovfskZTa9iiXaU2jL2FwlxjJSNa72KaysVN5sLolEQOBSmwL4iqPNPboeTQW/j8YCfh7FPM1Yctdy7kGZd88bS71VzoyY+S7v+YE3Ao8xHpkGDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gonoslVa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gonoslVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783593592; x=1815129592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e2sU0s40xkGwnyMyr3Gohlub14CCeKxZuEHRaPaL50k=;
  b=gonoslVatCxe+Y1dLk5FHk1ngxJuISGjzckB627cHz024n08dBrnUWmS
   ukz5ap9iznQ05qaVOi3T0uZAPZd7sDm562qVUZKmKYmbIKi9Bq31TVefD
   r0W5m/a2JgCmVf63bVHxZvKvFIvTtNSeDppjIuLSEQjDUoyw7/dxeuVbQ
   KXYQWKM2JwAr3yWrZ+K0+l2gMiAxSwc+OPQImWVxiyjEyfEhJD75ipOeV
   M9YLnFPYNan29+IoRiqCZScDLQk7jNF8z+Vn4Jux8+CDo1G8imslU8GHA
   YORr93ZUqO4iNYjuPwwWTWeHLJzHpjO7NkUIQwM9+9K91vTchvWtYS4vb
   g==;
X-CSE-ConnectionGUID: 6s3TsB44TP28vyQLZHFJdA==
X-CSE-MsgGUID: Ff3EiV+7QsOXK1Z4YCvdFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88097652"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88097652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:39:51 -0700
X-CSE-ConnectionGUID: DE8TRutyRcquJ0DgXoxDVw==
X-CSE-MsgGUID: Dgg5Foy1TwGE9qWU1O2mMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292740125"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:39:47 -0700
Date: Thu, 9 Jul 2026 13:39:44 +0300
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
Subject: Re: [PATCH v4 08/14] usb: hub: Use usb_hub_set_port_power() to
 control port power everywhere
Message-ID: <ak96cA264qq_FS1r@ashevche-desk.local>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709095726.704448-9-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 09, 2026 at 05:57:13PM +0800, Chen-Yu Tsai wrote:
> There are still some instances in the USB hub driver where port power is
> directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.
> 
> Switch these instances over to usb_hub_set_port_power() so that only one
> unified function to do this exists. This makes adding external power
> control with the power sequencing API easier and consistently applied.

Makes sense even on its own.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


