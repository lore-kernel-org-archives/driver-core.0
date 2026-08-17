Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B52A3D7D70
	for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980225; cv=none; b=eR8STBP0o8JEJLei3t0LqERL0W9r4zUziHQRFbHLMp+N+X/vZh+ky4NkCjMQUnLF5UcCie4EElCWZK+mTUIKsXSkt09/Ukh4Bi2npOC5reVlCsRGR7KYPD611VRDqNQKbVJIWgehsP9+3HSeWRxhYAIF8wtkiGsorB5qeqNU2ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980225; c=relaxed/simple;
	bh=msl28pOI/fIME2wOC1gRmqujU8+8NPSO78hDxF33EKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYQxITwb5WBlrZ3pnNBFN2darTbHbcQrvkCwALizG227k9/U+AJ5KoD5a9wUWL6nhLcReRzN9BRKMXM/t16A0t//4elpqHD5Y2MKxsh8AghLZnZBOKq3UwjnJs0DE2edgtQxVJgyik5RBZfPpfAXDCWoIG7nqxfYY1U68NzfW+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTJFx4d9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTJFx4d9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786980224; x=1818516224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=msl28pOI/fIME2wOC1gRmqujU8+8NPSO78hDxF33EKM=;
  b=WTJFx4d94Xt5SocJ+XOvsPYbkIzIJqug7jmi9pS+sTNSlNTmi1JntZcI
   4Q80EEmXR8jy3tkpSHZERVpkNob17atpIPOI2KsEWuMwF2O/dtFcOfA5r
   W1KMnLo0GNTItMQlSShtHXltquP8Priuxc549j0xk18RB8XQSHC3ylE03
   y8XPecwqRt4EGNCRedUgPJsHavpQR4Ywd5+wgBNSpq2VRECjUncpXyEXm
   abQhqTsFnm9A8zi0j0oky/jS/CLDUZ35TGAnHteB94VPWp8jF5JSFyLYK
   j6Ib/u11jQ8xuk8he673hlRDGOVqCbsz7JdBZW9aC2yBnIZ3ocEXRtRPv
   Q==;
X-CSE-ConnectionGUID: UttYhsjhSROVaUeGv1D6Pg==
X-CSE-MsgGUID: T+2htZWIRku/5o4icC/XyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="74989005"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="74989005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 08:23:43 -0700
X-CSE-ConnectionGUID: wBEASFEzQSuiNDwVEiCcow==
X-CSE-MsgGUID: YZhT4dB2R96XbM/i3gQ2fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="264486862"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 08:23:42 -0700
Date: Mon, 17 Aug 2026 18:23:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drivers: base: test: Depend on OF instead of selecting it
Message-ID: <aoMnevcLHdUEZr9-@ashevche-desk.local>
References: <20260817-driver-pe-v1-1-7003ddb9e400@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-driver-pe-v1-1-7003ddb9e400@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 17, 2026 at 11:54:44AM +0000, Ricardo Ribalda wrote:
> Selecting OF instead of depending on it makes it impossible to
> disable OF when KUNIT_ALL_TESTS is selected.
> 
> The purpose of KUNIT_ALL_TESTS is to test everything with satisfied
> dependencies, not to force dependencies.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Shouldn't we also handle this in tools/testing/kunit/configs/all_tests.config?
(maybe in the future).

-- 
With Best Regards,
Andy Shevchenko


