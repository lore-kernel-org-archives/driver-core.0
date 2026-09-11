Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1FB4AEBF4
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150287; cv=none; b=ewiQhlS+/86KoRvrj5RpYzdptPNTOBxfxzLvEZ0m/VoEqTsmD5cp6V6eIEX9CIc831gHrp8OlOYpMZ2vEqAsUP+V14WgUe+cC/WWe1aPZ7o2BmhFOimDk6JNVR5UfUM9YX5abKOKOrNJhAy7np3VGIrV3ciPM4ZmJTYvw78FPHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150287; c=relaxed/simple;
	bh=WoZsDwdqdocOe0hEZMkueDIWq0W/xjfajFErOApe9vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYmpP8wRLa/EaH9TKI2d8UEexohbeZLla0sVHUm+KGNsugLSrwDUcN9LElnU+iOr87cBaugKHnYDEEJO5nIDWBKgk31BP2hnvDPbuvIs8bXr4/czUMqH49GtM5cvCX4L8TbiZHlXveMJOrDv32p+FJXpFz2jBOL9eV6baEgIulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWK+moZP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWK+moZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789150281; x=1820686281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WoZsDwdqdocOe0hEZMkueDIWq0W/xjfajFErOApe9vM=;
  b=KWK+moZPpZkAdpU6hxMi2RYM+nFOswcW1ezNctvvc3YWkCidMGEhbwjM
   VAcrzyMVn7grpHE/+xXU4/VqJkOYUmDhDaJjfqB6yDTt7H3VfqyHfStaq
   NhmzlnfYIHDp2dq441cxS90Rb964ztstxiNT5suY7qCMiSZqdZYu6IOsP
   38uASZPcHp4Trx+5Xufby+opSS/E2wlbiTLEYqGu8AXt6uGuubBcLrbA3
   6wAWs/wkAAjlrtOumEvOs7AIdkT7FZQgqyg36Hanic0bjziDI7aJTWWVe
   6fBFrJ95+1Si6GqCeuSz59zEuD9LPtqLRgyKgZpqZILz/dYGJYSJODXpP
   Q==;
X-CSE-ConnectionGUID: 1H08/bGvR027mMmVVjFyGQ==
X-CSE-MsgGUID: rjD59PEjSimv2q3dgUecfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="101138470"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="101138470"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 11:11:16 -0700
X-CSE-ConnectionGUID: O8MlsPJvREC32sXwcZuCZw==
X-CSE-MsgGUID: YfVcjJjVS+qer7oLA1BT4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="296970260"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 11:11:12 -0700
Date: Fri, 11 Sep 2026 21:11:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pavol Sakac <sakacpav@amazon.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	nh-open-source@amazon.com
Subject: Re: [PATCH 2/3] driver core: Index class glue directories by parent
 kobject
Message-ID: <aqREPkLIxxd1wZH6@ashevche-desk.local>
References: <20260911-vfopt-s3-v1-0-66e3602f76f7@amazon.de>
 <20260911171639.68348-2-sakacpav@amazon.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911171639.68348-2-sakacpav@amazon.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 11, 2026 at 07:16:04PM +0200, Pavol Sakac wrote:
> get_device_parent() finds a parent's glue directory by walking the
> class's glue_dirs kset list under gdp_mutex, so one per parent, as
> vfio-dev needs per SR-IOV VF, is quadratic.
> 
> Index them by parent kobject in an rbtree embedded in the class's
> subsys_private, which dies with the kset list it indexes, so no
> per-entry class check is needed: two classes below one parent are told
> apart by tree selection. The key is a kobject because a parentless
> class device hangs off the shared "virtual" kobject, referenced by the
> glue dir while indexed. The rb_node lives in struct class_dir, adding
> no allocation and no failure mode.
> 
> gdp_mutex serializes the index, as it has glue dir lookup/create/remove
> since commit 77d3d7c1d561f
> ("driver-core: fix race condition in get_device_parent()") and
> commit e4a60d1390609
> ("sysfs: driver core: Fix glue dir race condition by gdp_mutex").

> A kernfs name lookup in the parent's directory needs no new state, but
> takes the kernfs root rwsem under gdp_mutex, behind the writes
> concurrent sysfs directory creation generates.
> 
> A KUnit suite covers the index: reuse of one parent's glue directory,
> two classes below one parent, the parentless "virtual" cases, reap and
> recreate, name collision, many parents, device_move(), and class
> teardown.

...

> +++ b/drivers/base/test/.kunitconfig
> @@ -1,2 +1,3 @@
>  CONFIG_KUNIT=y
>  CONFIG_DM_KUNIT_TEST=y
> +CONFIG_GLUE_DIR_KUNIT_TEST=y

Is this test case is so important that it must *always* run?

-- 
With Best Regards,
Andy Shevchenko


