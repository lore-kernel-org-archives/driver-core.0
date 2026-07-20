Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D925742F
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 06:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528534; cv=none; b=avYOIfTUIoEGS0dXjxcc6hWwWWHc2fI0/NuH3ffrMV/tcIh/eqPoGHXXouJdM/AV+ElOhc6yEUpcs9hqTB7COFWo4mEFV7ytFASdiC3k5xKCzD7nWKUjB1PqJiJApyjXH/wI0WUVrdE6Cv7ijKFocWxjkzUNXLzw7/Mcm0FAwuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528534; c=relaxed/simple;
	bh=lSyYjgkHL+sVHKvFIsJ/e/Cd16lYKU8QgIiS/jPQTZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8zjzaer1JS8SGQhN1DmN5KefasD24VBQtlMiJB/jdxkhiJqI7vojfBNJkmcTWHS69yOfQtSBbYoaaaxDZTWLueLb0UHAnx5N+5sImz6pLbdHHKc0JoP2hevHiUN00i2ReyOArkFbgb+YP056zXHvWGxX+2woo/KC8KxXxZGfls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVZGDDq2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVZGDDq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784528531; x=1816064531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lSyYjgkHL+sVHKvFIsJ/e/Cd16lYKU8QgIiS/jPQTZc=;
  b=EVZGDDq2GsaDxyMMr4PKc+p9sKWkMTE1QwF2lvQN/jOKPOud5Lc/xaKM
   MeN7lQUFDuU0Mccg3obhAZy+CsLKhk1VnLx2d4ElT3Zp3eO3Vraez6SB9
   GIXBZ7SBHAf0sfyLHfQlNtbtH1Vz3F8Pt8KaA8xCGxFtHs4Yd9yds26Yh
   zch8oKt+CIrPRY8GcPvfMFd2yWhMB2KcI6Jkq2XPB7vB2FTzElojDKqB3
   yLKcAuS+M5jhiC2uo1kMLXUgpLLYg4qIiEyDrscuRiZuxVrN5/coVsrQY
   4XokOczLffRHg4FO9UFEvc4FF/UHO5PbjblGozcz2n5GE9IQEorMrBRhi
   g==;
X-CSE-ConnectionGUID: VQbe9bzWS1aW7fx9SM68Tg==
X-CSE-MsgGUID: bV3iiz7gQqaxC0TTG7+KSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95752359"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="95752359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 23:22:08 -0700
X-CSE-ConnectionGUID: h042R2TKSo2khPjzcXZQnA==
X-CSE-MsgGUID: ih7BSkGhRHm354LI7P+PWQ==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 23:22:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A91D8121C02;
	Mon, 20 Jul 2026 09:22:08 +0300 (EEST)
Date: Mon, 20 Jul 2026 09:22:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-acpi@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH] device property: add missing kernel-doc for
 property_entry
Message-ID: <al2-kBQFnJ-svuw_@kekkonen.localdomain>
References: <20260719223640.2864890-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719223640.2864890-1-rdunlap@infradead.org>

On Sun, Jul 19, 2026 at 03:36:40PM -0700, Randy Dunlap wrote:
> Add kernel-doc for the missing fields in union value:
> 
> Warning: include/linux/property.h:406 struct member 'u8_data' not
>  described in 'property_entry'
> Warning: include/linux/property.h:406 struct member 'u16_data' not
>  described in 'property_entry'
> Warning: include/linux/property.h:406 struct member 'u32_data' not
>  described in 'property_entry'
> Warning: include/linux/property.h:406 struct member 'u64_data' not
>  described in 'property_entry'
> Warning: include/linux/property.h:406 struct member 'str' not described
>  in 'property_entry'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
