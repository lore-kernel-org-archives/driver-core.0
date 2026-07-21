Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D07D3822AA;
	Tue, 21 Jul 2026 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632659; cv=none; b=VjvN9qfzRhsfUrHqDkx4m47tmJ5GMuZqpUHiA7nD3mQqSuGZmH5UNF753jtAVF7g/yU2+NmIOFO0IrjC8eW+KyuSDz33q9OG3RCKonEYXvHHRqEo3d5JU9RQNJbzgU+voOixwDZysXNCm2//NRAT1ucZhsWkD8NGxonrRXFjh8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632659; c=relaxed/simple;
	bh=LeKC6SrlWc80El+r+c1eemI82dlkgdDafDs6DdGUzrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOmy4NJ90rW91/bay8W0QgeDmP+WNcwuEHDF7z2X5IUu0sF+4fVbmY87hctOgxrBxgoYjT+bF+A8qTObs4i6ccqvq+lc3FD5MDUB1Ftz5qFDewpAx6J/XOXuun6J6ZS3ialntRpJ43bYuyO4LS/YaoFfInqVJ3d9vvJyt1+j3A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/Dt3Qa0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/Dt3Qa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784632657; x=1816168657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LeKC6SrlWc80El+r+c1eemI82dlkgdDafDs6DdGUzrk=;
  b=P/Dt3Qa0MuwNcJJxGRG0j4/sF56QzB8dSiHJ4I56bUe9kBAzLXOHQhe1
   yeuC4/pQnLBh2gufgL1tPKG/96cFMaAbM05Msy4JoiGc7UkcYkBX5iQhJ
   8CKrHw/Gtzgv6OnrIkARLmAjjX7rzLgjjIGcdCrj5291sIDUBO9kis9Md
   Cdhg64imRtXKEbQE1Um7yuTvRO5FQbVSNZfQemG2VEstMsQkRJG7CoZaT
   qaKSTLfrrdLJiLaJ/LqqawWGqLAvuzlZGPJNVKuLXhlx+B7ZpYD3yRHFo
   J+vbpDYzTFiqQrnq59vFwXvOrOhnNa1iUEdxf6RV+ErrhJuKhfLbcP47v
   g==;
X-CSE-ConnectionGUID: 2EJin1dCSOGw1uZmFpLWoA==
X-CSE-MsgGUID: Vj8QkaRuQDanuoyFZmdNiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="72766307"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="72766307"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 04:17:36 -0700
X-CSE-ConnectionGUID: 4OJmcsUESIyYyVXPlgR8CA==
X-CSE-MsgGUID: V0KUo0NTRW61mkQQWosVPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="251410405"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 04:17:34 -0700
Date: Tue, 21 Jul 2026 14:17:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	robh@kernel.org, saravanak@kernel.org,
	bartosz.golaszewski@oss.qualcomm.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 2/2] device property: add test cases for
 fwnode_for_each_child_node()
Message-ID: <al9VS_cnmOSB9k7x@ashevche-desk.local>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
 <20260721105448.2109894-3-xu.yang_2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721105448.2109894-3-xu.yang_2@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 21, 2026 at 06:54:48PM +0800, Xu Yang wrote:

> Add test cases for fwnode_for_each_child_node() API.
> 
> Test command:
> $ ./tools/testing/kunit/kunit.py run property-entry

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


