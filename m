Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6066B353EE5
	for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607041; cv=none; b=eFrkQF0W/0sBreh05MdxaX5N8bEeoVpOMYs9a/yn7J9Xh0HvgSjOYrZTMl7TgGES301rmsPxOm/AWY4uofIk1ZnpbGe1y5Sk5W5b4AzuFkQR20FER00Ht6YGUhn4bjRuPNutDCBViVuixU3b6QT3S5IMVtHNQ0TfUoRAs2fectk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607041; c=relaxed/simple;
	bh=IDYHDopI3+3e/DN4UhXY1TbLHXHicduyojfH6SkpXYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2FTMan2nlyi+2+SXu+3LP0KQE4h6V4a9xSZrHv4ZO5myKpJWfZqMFjkEkTGDDw8fI9NGQhf61a4ug4mDHe12kPCGx/7Vj4scu9u2IHs2Cv0P8yPxaR3h1Jwxc4gmIJRaNAJgms7nMmHdVCpJocpM/2CFvDfKq9eITVDwnyNOfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqMiss83; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqMiss83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769607037; x=1801143037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IDYHDopI3+3e/DN4UhXY1TbLHXHicduyojfH6SkpXYk=;
  b=IqMiss8359GzGQ0gIYOV38y0JeD/K/omIsToiToTaXKUTYbCyOPp1oxp
   w360MptXNIsXvFmJFnEUq4CMZcI2pSTKj2Vgp2ciVMEbG8hqFpMGvDCW/
   KvRyjpTAAJcEfZ9jcWmHU5B0FnLVwH8QBSgRfQjwTDzJKouKzVqMcMUL7
   Q3x5c+Dg+U0XPkOc6xqr1Qi/ec7sFhLfkG479JXrzA1RL5OJawBv5NUpb
   wsW5hbKN/uyOYrp8Rdy6ml18kngEMy/fh1LgH+WLi2PvUokPQDmyeKlkl
   BtpUBiHFEiwspeBnhvT4QCL3AaIJRo3wTQCTjcpq4eGkjpHY0KSuUxVuu
   A==;
X-CSE-ConnectionGUID: d1Y2gNlETl+v17OGjkVcjg==
X-CSE-MsgGUID: na/nOTYsR/67Ukp3a9fzRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82184982"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="82184982"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:30:33 -0800
X-CSE-ConnectionGUID: pUF+UhNpQ7yTUx5Sc6mAxA==
X-CSE-MsgGUID: DknCndgcQMyzHynYUUCfRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208336215"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:30:31 -0800
Date: Wed, 28 Jan 2026 15:30:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Philipp Stanner <phasta@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v1 0/3] pinctrl: core: managed resource handling cleanup
Message-ID: <aXoPdC3AM0L8Ozkj@smile.fi.intel.com>
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 27, 2026 at 11:32:05AM +0100, Andy Shevchenko wrote:
> I have stumbled over low-level APIs used for managed API implementations.
> Here is a clean up along with a drop of some duplicate messages.

Thanks, Bart, for the prompt review!

Linus, if you want this to take via my Intel PR, please tell me, otherwise
I consider you take it via your tree directly. Whatever works for you!

-- 
With Best Regards,
Andy Shevchenko


