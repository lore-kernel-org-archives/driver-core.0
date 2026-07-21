Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3C9374186;
	Tue, 21 Jul 2026 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632559; cv=none; b=O9M2gQgW546089qu4HW7eS0rGZicGDOedFiJltp8XJS3SgpoWo87C1VkKtBbkRaP4/cbHS8zzR+FNi4Z/0Lhrt0kyjVn2prEJ25KdFu6j8nTjVEjoyQ4LMSKvkNZucgO7bwdTJOqtfgb6Kxen00WDtnoY7ABp1S+Bw2/reA2xa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632559; c=relaxed/simple;
	bh=mDMdjmbsTHoxpPjSaD0xztlbfRfXObPl0Lg8XsjVXoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4l3qwBmJylFJpjym8XxbF4rLQszPxT8EjQI09YvZyqhjY78YgJhRd7twASXZ4YlBEdLL/QrJbUhBesMohgrtSLs0QNb1AG31H8m5cEIDRo09z/7WeV7Q2qJUuxEvWEngHsyYmAP/5GYAcaYzUiPA3gyQ4XEnrzDbeY7IKwA0G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9zs3/N6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9zs3/N6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784632558; x=1816168558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mDMdjmbsTHoxpPjSaD0xztlbfRfXObPl0Lg8XsjVXoM=;
  b=n9zs3/N6T2xb0X3xiZUfq1137z0bDyfk3srHfyBeI8pC0+2xtLXyjX0g
   WhSC48FOsD8tzpd7NpdRQ1lmBvHOAR1NrOUWjAxxLro8rJymFnKhfw5Wn
   USi0iSL5eKHbe1fzlKXFnwJrXG5L05Qr1+tZ8Z8JnQTpgoGRWA16/Vc0e
   M9qj6jFR0zc1450Qup+QuDZcwJv7hjiPGG5Yc472zhdw5hX5me3YpwwJp
   1v5yTHgjcQ9EEcltDrftCAafWIpDBb876zzDDI841+89SYcVQPfyaRwFi
   rinHwQtr3O736KCWxSsPfJS5W34MYMFYSxRdCxAME3G267xMqqXUjNPAa
   w==;
X-CSE-ConnectionGUID: yMbfswhPQr6v13su6gD/TA==
X-CSE-MsgGUID: jnt9Do9eRo+XhUFf/U4Qog==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="95824968"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="95824968"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 04:15:31 -0700
X-CSE-ConnectionGUID: lZUPYFCGQ7aQwgPbsM3Qgw==
X-CSE-MsgGUID: gCEiDRldQw+OPusZ6h91+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="255947233"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 04:15:26 -0700
Date: Tue, 21 Jul 2026 14:15:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	robh@kernel.org, saravanak@kernel.org,
	bartosz.golaszewski@oss.qualcomm.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 0/2] device property: add test cases for
 fwnode_for_each_child_node()
Message-ID: <al9UykqJCXLPbwJL@ashevche-desk.local>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 21, 2026 at 06:54:46PM +0800, Xu Yang wrote:

> This patchset will fix lkp reported issue when adding test cases for
> fwnode_for_each_child_node().
> 
>   ERROR: modpost: "of_node_ktype"
>     [drivers/base/test/property-entry-test.ko] undefined!

Why v6? Where is changelog?
No need to resend this time, reply with missing information added.

> Xu Yang (2):
>   of: kobj: export of_node_ktype for use by modules
>   device property: add test cases for fwnode_for_each_child_node()

-- 
With Best Regards,
Andy Shevchenko


