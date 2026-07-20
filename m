Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ED3339861;
	Mon, 20 Jul 2026 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546478; cv=none; b=C2CXt7hjRVx2gH2WeV3AqknPjY0bd7zL4aJ/dpD/WKMOh4odGFTKKggnZK8QObuR4bwQwk0WWXKGneyywpb2Z83WlL+gP9Fg5UpO28yQLFyc4IxC7URTZdH9sm6VnSqpppaQKpC7juduRvZui7k8NfvyrOcpYeN3wgWPOaapsjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546478; c=relaxed/simple;
	bh=WcB6a6KFi1jWqA+UIj7rFwFiD9K0hDGwKmJB+k8ny0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwqlZ8nvJQH9WyyIaJR5MWol4DA8n0gQSnNW67UgP6Tby7nPORIIgIdEy1NmYmhrbLiGxEcK8ZE9ttRw/x8yNLXbhRc4EM0nQL95YJG7S1zdwoOeDyv2tH9mB3Lv4QixIpf1istdhIwrihIlHG8ckgqokbeyy0dpKaM7qlbyNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3GabyI+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3GabyI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784546477; x=1816082477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WcB6a6KFi1jWqA+UIj7rFwFiD9K0hDGwKmJB+k8ny0M=;
  b=F3GabyI+0i+zp0E/kY+M3MpAPcl622eN31LpILWfcLrG8gv9JI1U3pED
   Sk7RcQwSAQUGuWQH/ruWtF9MM0kFKGHtl46wSja6FAiINYdkODKpkD9KB
   xnqtenU31i9Db0cj56vAtB/F0Se2rMIe1xEnMpej/9dGnuwaWMp3XF53U
   xtdeR2etDKtZDIRfSQPoFOfdqfaUA0Q73Ym04z/OJbNv+HEw6Rd5qLuin
   FATzGzduKz0h7Pe4fFBSFs/vddlQPz4UL5wYoMaenHLCxn3IKVdHrCOJA
   tC+tE3bMRpHhpwbA06niiesmtcm1vA/XWbQOwO5fUsbuSxTEULGr6nXMA
   A==;
X-CSE-ConnectionGUID: I+iJ7YIDQxO/2gZ9qJfDDQ==
X-CSE-MsgGUID: vsipfqkhRpOzifp1A+FXvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="84980843"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="84980843"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:21:16 -0700
X-CSE-ConnectionGUID: bBUuGO/lRIy7bErs+B1Akw==
X-CSE-MsgGUID: KCTQcCC9QaKRmHSmxJgqTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="255655805"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:21:13 -0700
Date: Mon, 20 Jul 2026 14:21:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	robh@kernel.org, saravanak@kernel.org,
	bartosz.golaszewski@oss.qualcomm.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/2] device property: add test cases for
 fwnode_for_each_child_node()
Message-ID: <al4Ep9smi8lmgCzF@ashevche-desk.local>
References: <20260720104730.1285552-1-xu.yang_2@oss.nxp.com>
 <20260720104730.1285552-2-xu.yang_2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720104730.1285552-2-xu.yang_2@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 20, 2026 at 06:47:30PM +0800, Xu Yang wrote:

> Add test cases for fwnode_for_each_child_node() API.

> Test command:
> $ ./tools/testing/kunit/kunit.py run property-entry


> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Nope, I haven't Signed-off it here, it's your new submission where you are
the author. I only made a few cosmetic changes, if you want to give a credit
you can mention that in the comment block (SoB+Co-developed-by here seems
like an overkill).

...

You have a series of two patches but I haven't seen the cover letter.
I use this script [1] that helps me not to forget this.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko


