Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829863;
	b=gHTt44iIeeu2AmraRgohjOFjgyBK/vMJZpmerZRUayGl/x9aJQAnefk3Y2TFRvkGHTeV
	 AXIaHPGFyFnv2droRIt9rkWLIl2e3/05eN64jDZ7A3tAMANvrbklG0c5vDhj/nEmcbo8n
	 5RLUfRGPmoWZVRSZ+wqGsnKtWh4c2/YvAJVxJ0MmMCTQ2I1EW8W0YVmOfuG4lC/G0sNGv
	 M6lMML7pNZhMy/URA4jfAeqrbjwmW4skOCKuNt9FAxsNbd18e0bKYJaPSZGr/dNmwPioF
	 H8ipA6PwoZzWKwzAS5zE3+/UvdlCrLFJmt7ke3Hov209JF2rk99HTLvhaR872MLYH/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829863;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=RgPJWJ7OmqD+kimEp8BUCExoXCGpNreXf9NX1kncYss=;
	b=vCKsL/MJoPLTzNi2Ds/8YWZZjN103H+1i1ZTjBHMqNKi3x70ZlO8RySoUGVtHJjhbgxO
	 4rVOwKtRd3eLvTRPGHQQIZUz3fJdi03jqrREPOBkKkSmoXAGxjbh36jxFi7JY3e0gkW6E
	 9W1KojmJWVdAMYxhXvr8Jek04qxCezX+ZT9D1V+tPXOXz0hdU1J4vnDyUVh1peCBAbtK/
	 XnPIy5LmopdstuL1zXMWKWolxAUBYsOB5wjOCaj1yvs3IYuvMM/K15rcOqdu7efQ+o8tj
	 3q8XlMUcHbrmbP6HaU4TkniBhHaAFYwsAxTuFU1L79yNm5otozr1GrUc8XxP35Cp5OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iP8nxVAi;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E4C606A32C
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 22:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E4C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iP8nxVAi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793829863; x=1825365863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OxOYaS2Oz6AZ8fokIkOel2mY00Acmu1q8dpfCromaMI=;
  b=iP8nxVAiotFFC4Tjw/oLU9OD541ps0FK6dRoYwYu86I+e427rJp7slor
   VuxHV0HRcOxo//4KkieSu3E07yS6Pvt7NSZt52UlefcHNIbZc/CZ5236p
   Za9bhA/v0OmRD+jxW1Agm+pzxnBT9KZ3zpOGwHcPJJbjgxplPG0urgd4A
   7NcIL3fJHUsgqVjYWAfxkSFu2Nk9N9DmYNd//HeVPWRi67qBJ0b+iBjfR
   VrfYTaDeAaPe4RveLpVv/YShnnChIWS3/cTTDZwWELjmcK9++u/aWRAxr
   QHoZ2iFvCWmi2VghFSvLu6KyXkjjHdpBx3jKBVNg8OOnv0k7HsiOYAI+c
   g==;
X-CSE-ConnectionGUID: 9aNL66gBQH+3phsuh5Cq1Q==
X-CSE-MsgGUID: k4GYGfrpR/+7YPlKj3eQrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2597030"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2597030"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:04:23 -0800
X-CSE-ConnectionGUID: yMdhutKGQSqXQoSAsI1XWA==
X-CSE-MsgGUID: DKWeG9DsRS+V0LffPSd+kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7145125"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:04:20 -0800
Date: Thu, 5 Nov 2026 00:04:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stuart Summers <stuart.summers@intel.com>
Cc: driver-core@lists.linux.dev, bartosz.golaszewski@oss.qualcomm.com,
	balasubramani.vivekanandan@intel.com,
	intel-xe@lists.freedesktop.org, heikki.krogerus@linux.intel.com,
	dakr@kernel.org
Subject: Re: [PATCH] driver core: platform: tests: add a shared software node
 test case
Message-ID: <auur4ZlHSB97uiKH@ashevche-desk.local>
References: <20261104202419.30180-2-stuart.summers@intel.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261104202419.30180-2-stuart.summers@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 08:24:16PM +0000, Stuart Summers wrote:
> Cover the pattern used by drm/xe + i2c-designware, where a software node
> assigned as a platform device's primary firmware node is handed to a
> second device via device_set_node(), and make sure removing that second
> device leaves the owner's node intact.
> 
> A potential fix for this issue in the drm/xe driver is being discussed
> in [1].
> 
> The signature in this case looks like this:
> Oops: general protection fault, probably for non-canonical address
> 0x6b6b6b6b6b6b6b73
> RIP: platform_device_release+0x6f/0x80

> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: LLM
> 
> [1]: https://patchwork.freedesktop.org/series/175858/

This is wrongly formatter tag block, also URL can be made a Link tag.
On top, Assisted-by is obsolete.

At the result it's expected to be

  Link: https://patchwork.freedesktop.org/series/175858/ [1]
  Signed-off-by: Stuart Summers <stuart.summers@intel.com>

And last, but not least — thanks for the test cases! It's always appreciated.

-- 
With Best Regards,
Andy Shevchenko


