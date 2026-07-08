Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198D437F8B6
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518278; cv=none; b=qsPp/rDgWbUPHQCq00+TRAgFLwxgvelPiHviCpbZAdUNOgmmJLOljQ4Ku7r6VHSLxZwB186lVix+b4dCfwHzbxJguLbXRBOAMksUcwrIBRtLq8ZBHC4SJiUACp/NdHjxEHM5yMo+No8WmS7xhp2Bs1ovAlkVwNUlxUzvBE4+4Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518278; c=relaxed/simple;
	bh=BF6Vb9hnwvSdbolPZGWPh9gCFlsO3dx2jY2KJay9g4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpy/V6RJSGYyf/r9IrVhCsQqNM81SHIyEsmqLSjELoS3H8PHwFn7qXgdTObIvIgwW9yyunCFz+RYSMO+ZtdMwcR734ZheQmPlyb/G0t5ali53f3Shtc+rzDl38q2RQ9RhPrsE2F1ihLkuRgXZOWfmEaYryWnf+kV8zs30MnKboo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eanyDwb7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eanyDwb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783518277; x=1815054277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BF6Vb9hnwvSdbolPZGWPh9gCFlsO3dx2jY2KJay9g4I=;
  b=eanyDwb7KiF4gCcRbxSxJ7ijnKzDB5cYcwPA8VwGASdyz81WCoz/6Pdj
   q0MoTi1BPoKQXkKw0SNhTHTHce30EsMxBO0GFPMLVjD4i+1lH9JWh9Pq2
   i2+hx39kZ/UWixbg7tAfY+8BACfThPwWpBHmtUDTUZwP1QspgvPnQJuyL
   tXrAQJcDNbZB37S4eWP9KX4ld/fI8/op7JAaHpJGhtbQDTQ2EZ986FDOj
   20gPpov05qzjGNamNkDt5S245OMjJN21h41c5FVjdf3wuThhv+VSrUBw9
   CGbFIz/AzvpcmprXW4Q2UNyGdbjOvWcPe8vski1/FS+M0miGqLiIZYD/m
   g==;
X-CSE-ConnectionGUID: XFNfTETvTiGs4RL3i5OvMA==
X-CSE-MsgGUID: pIUfB/7mSu2C/RMCbxZDhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95336391"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95336391"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 06:44:21 -0700
X-CSE-ConnectionGUID: Gx8sd6jtTYa87WSIeMFO5A==
X-CSE-MsgGUID: DQCjphV1SfCz7AcSJLEtNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="249847324"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 06:44:16 -0700
Date: Wed, 8 Jul 2026 16:44:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 5/5] gpio: kunit: add test cases verifying swnode
 devlink support
Message-ID: <ak5ULrwZfvA4hdsP@ashevche-desk.local>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
 <20260706-swnode-fw-devlink-v2-5-f39b09d50112@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-swnode-fw-devlink-v2-5-f39b09d50112@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 06, 2026 at 02:54:12PM +0200, Bartosz Golaszewski wrote:
> The software node fw_devlink support already has its own kunit suite, but
> that verifies the fwnode links in isolation. Add GPIO tests that prove
> the ordering works in a real-life use-case: a GPIO consumer that
> references its provider via a software node.
> 
> The first suite registers the provider's software node, adds the consumer
> device first and checks that fw_devlink defers its probe until the
> provider has been added and bound. The second covers the fallback:
> with the provider's software node not yet registered no supplier link is
> created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
> and the consumer only binds once the provider shows up.
> 
> While at it: the existing gpio_unbind_with_consumers() test keeps the
> consumer bound while the provider goes away and then operates the orphaned
> descriptor. With software nodes now being covered by fw_devlink that would
> instead force-unbind the consumer along with the provider, so opt it out
> by setting FWNODE_FLAG_LINKS_ADDED.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


