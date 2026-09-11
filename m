Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFB24A4853
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150362; cv=none; b=QXLZRZGua7x26UEEQm8tpuBPTnGwUHIHy4MlCAHLZVfM9y4K4BZBHR04wkjvwaLBxQB5YnpvOf0zjZAwMhrqlJvFBf06jZeAV1YaXdhvd1weGrFrKoQLMhpnWwk8u4yBju5+BQ3/db4UFkc4kYFA7CycihOmw8r8Bh5oDhyOqXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150362; c=relaxed/simple;
	bh=acvjJbMVUCOebvdl1z/1rtpg3FOw/WrLZvEUGSjzGGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pi6I9s+YYXFZVDC3pMhWyAf8ixOpeDRZp8fhdxOKs3kGD8m/TqjLMh5b1vE6A2PuEnKFrDvj3j/dA5Q6mTqZeDEPbvwXEa8w1sEvVM6N43bqHLtVSyFjvpwrqx0MnZ077YY4COv4szsB7nR84xZd86ure7JTqB2aGopheV7QRgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIxRlhmc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIxRlhmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789150360; x=1820686360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=acvjJbMVUCOebvdl1z/1rtpg3FOw/WrLZvEUGSjzGGw=;
  b=oIxRlhmcwPpjhvDMsUUKhLnYa8r5CrnzgrNWoeJCXf3bHfZZbLu1S8V9
   AUgG/Upv4YP2JzYi/UoCTZxUHK9W2M8MBQ3dJO3zD66J7OTLZWfO5Gc3H
   koRHqFFCmhhdcdXWRjuhjzWMndmy8wRKQCYcofy41ZtgNzw5Ej8ejbIV8
   Zku7W3CzOkJBbXn+38VIlY/bpLgKUwSw2GpayjHKViIB56Xvrr0RQydQD
   LjpB08AxbSbD7+wiP8sw08iN7AbwdUWje+HYN8xdJAm5NaonUhBufzjfJ
   +ysQUdYozTSwV+eGtChaPIEOjiTTkU34eni9JbdSOWWS4ff5KFL4x2MRF
   w==;
X-CSE-ConnectionGUID: IkkTb87MScyo8xo6yxFf4g==
X-CSE-MsgGUID: 0tLP4xn8SCKe4hANBmtAfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="106988878"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="106988878"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 11:12:36 -0700
X-CSE-ConnectionGUID: m4dKVsCxRMq871LngzfC/Q==
X-CSE-MsgGUID: FjGBQZBCQ1etAksjsi8E7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="276143787"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.80])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 11:12:33 -0700
Date: Fri, 11 Sep 2026 21:12:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pavol Sakac <sakacpav@amazon.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	nh-open-source@amazon.com
Subject: Re: [PATCH 1/3] kernfs: activate nodes while linking them
Message-ID: <aqREj_l5fMCZwX4f@ashevche-desk.local>
References: <20260911-vfopt-s3-v1-0-66e3602f76f7@amazon.de>
 <20260911171639.68348-1-sakacpav@amazon.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911171639.68348-1-sakacpav@amazon.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 11, 2026 at 07:16:03PM +0200, Pavol Sakac wrote:
> kernfs_add_one() links a new node, releases kernfs_rwsem, and takes it
> again through kernfs_activate(). A new node has no descendants, so the
> second hold only activates that node.
> 
> Activate ordinary nodes before releasing the linking hold, removing a
> second write-side acquisition and the linked-but-inactive interval.
> KERNFS_ROOT_CREATE_DEACTIVATED roots retain explicit subtree activation.
> 
> Removing the unlock-to-lock pair also removes its publication ordering.
> The in-tree lockless ID lookups use CREATE_DEACTIVATED roots and retain
> kernfs_activate(); unsynchronized callers cannot rely on observing a
> node.

...

> +static void kernfs_activate_one(struct kernfs_node *kn);
> +

Can we avoid adding forward declarations like this? Or is there circular
dependencies? If not, add another patch that simply moves the existing code
upper, so this patch won't need a forward declaration.

-- 
With Best Regards,
Andy Shevchenko


