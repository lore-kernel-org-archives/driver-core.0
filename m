Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6001C385500
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014088; cv=none; b=adgs4rbmOLkFKegJnBVkC1c1xxunoVzQKX40XXb2SCJPK88FYE4GC3E+9sBEwXFVkMJOztsDVfOtFi+CjqiBUnwi7hdIv2Q9IHy68vpGJqnIXnsVfLEDL0pJwZSho+ez667Neltngmf5DL+ngkcHXn9I+g/5SEofokftba3mmDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014088; c=relaxed/simple;
	bh=NhNADHZtrkaH6ZBxLSszfkkgrCDJiaNEMQSTgfzNx/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIMvCISGc/HeLMZBFOaHtIawtcWzxA6mBhvsPUCMH8P/peoW3LZvMcr+0rvFnajr1FaEWegyTilP9G7YPZtC0yqZ4M0kMxNDO+J3L0XuKnjCG9lwx0nK24EcTKFSa1oKzWO1hMgvSj/A78n5JMVs+tcHKmTlkuKZ7BLmI+t/W1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4WNWPw8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4WNWPw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772014087; x=1803550087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NhNADHZtrkaH6ZBxLSszfkkgrCDJiaNEMQSTgfzNx/A=;
  b=U4WNWPw8NTkZp59Nbv0iu/wptglgbXz6poZsSJFM3JmwCB7iem/UBC3r
   xhqtE6P2yQTYR/jUrQ/AzlkjTAtO4J/HtAzJdHhrcfznODIWUmztyUT+l
   IPTG9bHLeV6SXmLS71moO4W0sEiYWUbsGEA7sIJ0orE+ItIGjSChTYf/v
   /kEVBCBrmJ8BRZ34qUXEGRi26ik4hHBgPvibmZdCQhlPlt7zrxRra6rOM
   HMkVJxB8FrxIyCON8PV+W2kH2MjJzpvOb+jvk0bfbtZdECXCItOngVkOE
   r1j/IoHGHPPuv2mSqUD7RPEZ371w7qbn4IzQvNQn/gouHhT5UXMux3+id
   w==;
X-CSE-ConnectionGUID: kBKsJwVHQVy4M6Y51fEocA==
X-CSE-MsgGUID: aoi2vYO0TIuDaOItlP/ZAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83371584"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="83371584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 02:08:07 -0800
X-CSE-ConnectionGUID: Lpb7nOl7S3u3KJFmAU75hA==
X-CSE-MsgGUID: o1HJoIYgRfO6cGd9/qGKsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="253948929"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.223.10])
  by orviesa001.jf.intel.com with SMTP; 25 Feb 2026 02:08:01 -0800
Received: by kuha (sSMTP sendmail emulation); Wed, 25 Feb 2026 12:07:25 +0200
Date: Wed, 25 Feb 2026 12:07:25 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Daniel Scally <djrscally@gmail.com>, Len Brown <lenb@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpiolib: match secondary fwnode too in
 gpio_device_find_by_fwnode()
Message-ID: <aZ7J3aPURDNXK6ab@kuha>
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
 <20260223-device-match-secondary-fwnode-v2-2-966c00c9eeeb@oss.qualcomm.com>
 <aZyNErXB_acR3yYq@kekkonen.localdomain>
 <CAJZ5v0ibXKiUNf5Fvj=q=f9JbHT=w3j3h=33ri_awzEHm_dBng@mail.gmail.com>
 <aZzPqbXH79Q6GvEn@kekkonen.localdomain>
 <CAMRc=MeSbRySCe9wuEUifhOxzX2PydsjnttAJ_n=Nr1NdU6W5w@mail.gmail.com>
 <aZ1nsPX36Y5DuDpr@kekkonen.localdomain>
 <aZ1yyxshteYU2BAg@smile.fi.intel.com>
 <aZ6nIK2AbPBHUVfq@kekkonen.localdomain>
 <aZ7DC_46vxzU3_0J@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ7DC_46vxzU3_0J@smile.fi.intel.com>

Hi Sakari, Andy,

> > > What I don't know is USB Type-C and USB DWC3 code where it's much more
> > > complicated. And I'm not in a position to state that the change won't
> > > affect those.
> > 
> > Any idea who has the hardware in these cases? There aren't that many users
> > of this function out there and I think at some point we do need to fix
> > this.
> 
> Ask Heikki?

I can test any fixes or changes that you guys want to propose for
this, np.

Br,

-- 
heikki
