Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586495;
	b=DYnDNWRSleEnsToA4UbaHokfL/asw2AeBkVH+Li4JIWx4ZZCiS8N47E2YI64Dk5p6Oy8
	 J03KKvSYG2XSyFhrxMKOBc9o1pNzBt96ZzbUNLuzORG23KR/p/tP6pmcLbDBiXy3aO4RA
	 luiIMxS1tJ9ioUE5UQrYYkkUxY35hO9jrtOY/EsEo3Qv8A7w1v3lViQkmh35jc8QqBicS
	 0Gk0hgbcPx6x8N4nsIpHpARAWkpZ1qCP3tbWZfJeKmNjs2tOYZkAIQoHrrlKiXCy0BSkP
	 zC8C6gL1BkaLTALFm8ctJlaRR+Cbzy+Wr7ksDUeIGJVs9n03IEx7kkWXmclUkSDaIUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586495;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=sf+6edYMzY6NnrlxJWJeYP4C5uZDtVBlONkpHHMFEZo=;
	b=AAgOZzJjF6WkpbPRoSlpGA30Q5Fige4wPPy8TqKYWo71ugavpe7stN/RxT0xXBuDSBYq
	 X8F0lWEqXQ9LwS8/NDAPnQYtW/rmClhMEf5v9KOOgnQhqDUyQYq7WVCoUMtWY1URQZOdP
	 pHjIn2Wv+ReF55gX5bsAQlPMY4O6bWsufCA9LtO1prjMPDYHHF9f5Md/pAFUpCOeoElYo
	 SAvR+y0bEJ9+6PVCk6wld+TgIMZyMn7kAQwLBrNagTXoc063t5jPi4XIluxrkkOjVsRa+
	 gMLxY8TtpgQJjPCUrUKM5BitCcrk6cQF2hJSes1olFPcgUvRfmXBP2+eVLhyEYMJwFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iNSeqRDW;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6875D606B2CA
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6875D606B2CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iNSeqRDW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794586496; x=1826122496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+zDWrisG46NzjviE4PtgI5vDp4QnTOm36Mo4GT1CJrU=;
  b=iNSeqRDWBxKWlicY8EekgRqulaV459H1NX8Oh9hKae79Ezht7bM9mRUt
   9wKEjDkLWsOJomzna4zXTrwsX2YV8sAqUIbprqn0z0Ky08I9XE7iSmhuT
   REKM2Tc6ArT1s16kI5Hf3ynb5FHKVMexmtundAfEcIuokj17MtOEcwPKW
   R8TRdRGzXwjc5nJd/LN1iu94rPpP9sMPreuIokiVkBoBwt/OE5AjlyTmn
   7Ykdja9fXw89saZVToIGsdVBF7qOA2yuGSXfadcZysYRouMeaAbBUw6O4
   +UB1SO2myBKvg23HQA8EcmzBd4B6olHn67DMubFNlM/IdjQBdOEPp/sKl
   w==;
X-CSE-ConnectionGUID: 51Sn/qhJR+mypN+j3AR2JQ==
X-CSE-MsgGUID: PD03cjlcQd6nLGtH/zAMwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3470488"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3470488"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:14:55 -0800
X-CSE-ConnectionGUID: KbbtHvXoSiei8QzDIkkMxQ==
X-CSE-MsgGUID: n2uxiT2dQlq/0961XDln/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8870703"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:14:49 -0800
Date: Fri, 13 Nov 2026 18:14:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 09/10] gpio: shared: removed unused field from struct
 gpio_shared_entry
Message-ID: <avc3d7a1rEfV_xtP@ashevche-desk.local>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
 <20261113-fwnode-for-each-prop-v2-9-4edc23d5cf50@oss.qualcomm.com>
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
In-Reply-To: <20261113-fwnode-for-each-prop-v2-9-4edc23d5cf50@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 04:47:09PM +0100, Bartosz Golaszewski wrote:
> The index field in struct gpio_shared_entry is an unused leftover.
> Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


