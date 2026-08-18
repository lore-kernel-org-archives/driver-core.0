Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B71525B08B
	for <driver-core@lists.linux.dev>; Tue, 18 Aug 2026 07:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787039322; cv=none; b=cVRflsN/5Xdi30frA9ExkNQmJls7Yq+TBfKVrogRx7TXewn7K5E6x7CDEDIpki7Kyn1pp6LHeNXuvrDWljNBIaigEL+2qyPJKCk5asbIKXkqe0BubwIFGaTokZ2ncN34CHydheGD+7X0FRpl/NKpApcfHMVEN3UR1C4JZcRSNOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787039322; c=relaxed/simple;
	bh=lNpM1FUAkwHHr4KU4DnJgDoG+TryyRfmHE2fyV2mtLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYq+Aexrw+OJ0YiXVLxM0AL/nfijpsVyjP+g/XkNVwksIRN4KhXoGLF1O6l5eOpx9nBA5KVAtYxyiMbFzH2y5RdH1AvSy7g8uX7dqCBbqZKTxCWbFgCTCQ2qMzA2KxmpGOIKV6t6ybvVmfjcvbiAPUNGrxvzhlVJCJ6weKjQpCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwHiFqVh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwHiFqVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787039321; x=1818575321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lNpM1FUAkwHHr4KU4DnJgDoG+TryyRfmHE2fyV2mtLQ=;
  b=DwHiFqVhmhNKVa/PwmTce4VQ8kSKirPwCj2EPAQHiX2D8sEi1SjQ6q3v
   c4rEBUFxSXmReOx8DmBHT15Rql/MDhgntR6w68IT3OZUWrZ5alqbt6ikK
   HoAtrcwNiMJ46vJJt5m2W2FIwb+CFBLJgIms6JcjNNGccDMvPmEA5+MeP
   55AUNNAY/uwZgD6dD7NuYep/retaDmZFWpuhC7pRMxWbxxkYQPCSNcOeJ
   QBmVsio1MzcNR125wD5bydczUrCYRgbamHEszMFsNO2XjhvBigimzT4ZX
   aliPHHoyYP3y+akHSCS8xZsT+2LrhQEFWAEh/jfTortDdnrGaeEtOpST9
   w==;
X-CSE-ConnectionGUID: bG5/22f3SF6CzFg+C/oDjw==
X-CSE-MsgGUID: CysSNjjFSE6RV7jq7Dzfjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98886815"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98886815"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:48:40 -0700
X-CSE-ConnectionGUID: U8HBBO6VSuOZkGT3bjOyHw==
X-CSE-MsgGUID: /rpXRdVEROaxsr0e5kpsyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="265760633"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:48:33 -0700
Date: Tue, 18 Aug 2026 10:48:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-acpi@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/4] driver core: handle managed links for
 class devices
Message-ID: <aoQOT1B7AeBdmYnL@ashevche-desk.local>
References: <20260818-submit-phy-package-fwdevlink-v1-v3-0-40a905ea16b6@gmail.com>
 <20260818-submit-phy-package-fwdevlink-v1-v3-4-40a905ea16b6@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-submit-phy-package-fwdevlink-v1-v3-4-40a905ea16b6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 18, 2026 at 12:59:00AM -0600, James Hilliard wrote:
> fw_devlink deliberately lets the nearest device pick up dependencies below
> class-backed firmware nodes because driverless class devices do not
> currently progress through managed device-link states. This can leave
> consumers of class suppliers dormant, while sync-state-only links from
> class consumers never reach the successful-probe cleanup.
> 
> Track class-only devices through equivalent registration and removal
> transitions. Mark them probing before device_add() publishes them, complete
> their incoming and outgoing links after class interfaces run, and enter the
> unbind and no-driver states during device_del(). Preserve firmware links
> below class-backed nodes so later-created descendants can acquire their own
> links.
> 
> Include class registration in wait_for_device_probe() so supplier unbind
> cannot race a class consumer that is still being published. Transition
> managed links which existed before device_add(), remove stale
> waiting_for_supplier attributes and do not revive a link whose supplier has
> already started unbinding.
> 
> During supplier teardown, wait for class registration to finish, but move
> an already registered class consumer directly to the unbinding link state
> because it has no driver to release. Keep consumer-autoremove links valid
> until class consumer removal without triggering driver-only cleanup
> warnings.
> 
> Factor the supplier-bound, consumer-bound and cleanup transitions shared
> with driver-backed devices. Activate late links involving an already
> functional class endpoint instead of trying to reprobe it, and let
> sync-state-only links retire without forcing consumer unbind. Ordinary
> supplier links cannot defer class registration, so they must not be the
> only mechanism on which a class consumer relies for functionality.
> 
> Class devices do not match drivers, so distinguish a genuinely unavailable
> supplier from a probing or registered class endpoint before relaxing
> inferred links. Preserve normal probe and runtime-PM ordering for those
> links. Also recognize class-backed nodes when refreshing dependencies after
> firmware-tree overlays.
> 
> Exclude the internal device-link class because device-link objects are
> registered while the device-links lock is held. Document the class-device
> state transitions and add KUnit coverage for supplier and consumer links,
> pre-existing links, inferred-link preservation, registration waiters and a
> concurrent supplier unbind.

This is enormous change, can it be split to several logically isolated patches?

-- 
With Best Regards,
Andy Shevchenko


