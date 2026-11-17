Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901836;
	b=3zm6NxOpth61nj7dZiFJFS1ukx7ctS63vpFNiSbCCdj8tKPwyw+NWUwAJ1ouiBjY7wyg
	 9l4aSXjzstUGSPo9/lSox6Uzk6zWtHDjHlXmepsPQxyqVQU1egRoZHGqIQWjaQvWc6ogQ
	 kbCKJ6pInpWuXh3D4ZL2ROVTHQFuxWjxLATgqNB8NnNDKkt0+KS4JPtZhaPAqin7tD5IC
	 xeaTAnDdiYyTbV96gGxLLnJiM8vCwoqs63HdaJRjhDEJ3Yn/UoOrDRcfqvagfTKeCLyQI
	 aKlk/MEYZClr8xG5OOZvz87oHAdC/wTr7Ctmb/xDKAD0UR6HN9Px4y/YKoYbmIhaM6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901836;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=8vgPP6Tx8J3tAl7vzRS2f9bzf7D4zQHjlRLap4jWt7g=;
	b=FUiSiboLcnPP+b1/p6qmyWGRpDJgjXI0c5oTdC3+u4gUHzdxuZbGW9rk6XUt8MbS+yCb
	 FVXrBzhQWfmNypeSvMSQVouLKUwSdgSodokBqfSlKy3kUX0TgKpghjrhK+skx9HNl6uln
	 TLtM/T+q2rQciq8w4FYdRB2L6imtCZSsSx6hXYJiXtdfFD5L7ROVcIPN8SRYXbR3eBEH2
	 qIGuDZSpXodOHatfjorzXrJ19YrBIR0HJycKM9RwBYavxU3168eoPIYzrVhdJJcR7WVLh
	 +nm4snKE3dvYlcndG0ALE+99LHInwlShku23F47MsvOISl3qfkLaG8T2yljwHYodZ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lGhj0LAW;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD9606A323
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 07:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4AD9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lGhj0LAW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794901836; x=1826437836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7tsumGXRfcakGcSfEArUg8RNIoKnnuupodfU8GGdp+M=;
  b=lGhj0LAWYQN5pXw3lN1+iBIe1kR9L+pkMO+qaLUpLP2NC2mxE19Tgc9Z
   0keSFOJucvPBLruP5NaXqNnyjikm0cDVi/894pzWqIZrt/6j13f5GD0lm
   yhYtvPPLkYOTdv7LMLa3PSt750IiwqtEFBUnKKZLUf7PH4mjOCfgchcEI
   4ZEB7xkYTe532ROa81fvFwYvXfYNLzXFllWLhiNAkynd62oxJIoZFw1ni
   BOE2vMCexRfgR3aa9lzCXE5vBhCm7WKmzgr2X/ZyiGX26mAxAs8lHU+lX
   lmCZ6b+YEK73d0TPJwkpH8IgWwmLWY85AVVTsFPCaVCf9ovH7meMTkchp
   g==;
X-CSE-ConnectionGUID: yLi4zgnOSTCY9RqulS0Ydw==
X-CSE-MsgGUID: m6avjUtdTuihPFuPDVe7aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3542644"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3542644"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 23:50:35 -0800
X-CSE-ConnectionGUID: SPVU5nc+QZS67WCpD35Wow==
X-CSE-MsgGUID: Jd/piBRPQmaHbo+f4M+jFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9774997"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 23:50:27 -0800
Date: Tue, 17 Nov 2026 09:50:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Leo Yan <leo.yan@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Al Grant <al.grant@arm.com>, "Johnny.Fan" <johnny.fan@cixtech.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 2/8] device property: Add software-node IRQ affinity masks
Message-ID: <avwHQXJxOir8XXxX@ashevche-desk.local>
References: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
 <20261116-acpi_arm_pmu_registration_hmp-v1-2-0371d4eca626@arm.com>
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
In-Reply-To: <20261116-acpi_arm_pmu_registration_hmp-v1-2-0371d4eca626@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 06:21:29PM +0000, Leo Yan wrote:
> Devices created from firmware tables may need CPU affinity information
> without a corresponding firmware node. Allow software nodes to supply
> this information through the common firmware node IRQ affinity API.
> 
> Add software_node_add_irq_affinity() to copy a CPU mask for an IRQ index,
> and implement the software node irq_get_affinity callback. Keep each mask
> until the node is released and reject replacement so borrowed masks remain
> valid for the node's lifetime.


This is definitely not a place where to put that. Are you stating that any
software node might find the IRQ affinity information useful? I don't think
so. With that in mind this approach looks like a layering violation.

...

And overall, the domain specific (IRQ, DMA, et cetera) topics feels a bit
misplaced when one can find that in the generic properties. We also have
that PHY thingy, which is complete alien to word 'generic'.

-- 
With Best Regards,
Andy Shevchenko


