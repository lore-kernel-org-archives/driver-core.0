Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C553CCFC6
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 13:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137678; cv=none; b=egbRrKe/IvBRINOqPRTTUJcic/SStu57PB+5PAa7hAO4Sbjbf2oBh6lB+F9BnQdfDgXkMmqBIN0RyycKP+mdVopj0ZzPaW4VOdo9wIrfEMr5ZA9Lnm2eweDBNBfKgedyoxLpRLc+lSzGuQT+2DA65fRXIO51UDzcosX3Dxxnssg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137678; c=relaxed/simple;
	bh=GRKjzT+ZDuM23HB0D2ydJq5Mdn2LGg+Wk5/aTsc+gcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UINMPUPGrmlJpNdbzRnHtlrfHHMTw4rIa1utUGvmoyuAiSpj4UU9e/kRTgPz1CkK4IoxjKm5cI7M2NOpiqs6307NMO7Rhdqt5s8cQuJB36WbwJbj4Skp+mt9bYFvByNk7nGTklBTtnk32Qd8KMJAuM4l1VcIP9x76E7N9CAY/Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPbouE5e; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPbouE5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775137676; x=1806673676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GRKjzT+ZDuM23HB0D2ydJq5Mdn2LGg+Wk5/aTsc+gcM=;
  b=MPbouE5eyRiF6k129hXNZdROXkLqt0AKinM8g0gyTedVXAAdaT4JR8JV
   0WF/uiUh6a5/9KpA6475hUmtpAO6iwJtxZcCnksseTCOJM5hJOV713vm7
   IFmfAcnKBuIWpBWiWolOqGmCIx7IOVjcUJeRfk5D3BRreEhB9wwpAYzhy
   gLagsiq9tuMd+CYQtfn4zP4SAm+qop2jlGw16nenEOSpRVm7ziRBWt2i/
   c6xFKmNpeRsh6hovmiMT8nhkGzlJZdKwLfulq3iDtSn2xi5+pgpRX45Ry
   vrN4z1MFYYVAJ1efA36T3+6Zu8riC+f0CveVWS8YiMCnuNuScqw/NEw8F
   w==;
X-CSE-ConnectionGUID: P9BLtcf5QGK59/UVBFZc8g==
X-CSE-MsgGUID: 0mYKbpWqRu6qdfm123UiKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93779320"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="93779320"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:47:55 -0700
X-CSE-ConnectionGUID: bkj4Upz4QEyqCYqU7DL7Og==
X-CSE-MsgGUID: kBEvkSL+TgmqbbxElzaL1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="223707397"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:47:51 -0700
Date: Thu, 2 Apr 2026 16:47:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 0/4] platform/x86: x86-android-tablets: use real
 firmware node references with intel drivers
Message-ID: <ac5zhZAyiwbUwzWo@ashevche-desk.local>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <ac5t5XozmzN9oq96@ashevche-desk.local>
 <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 02, 2026 at 03:35:24PM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 2, 2026 at 3:23 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > 3. Export the acpi_bus_type symbol. It's already available in the
> > > acpi_bus.h header but it's not available to loadable modules.
> >
> > Nowadays we don't do that but export the dev_is_acpi() or something similar if
> > it's not yet available and to_acpi_dev(). (Names are derived from the existing
> > pattern, they might be need to be adjusted, dunno.) See how PNP does that.
> > Note, I haven't read the patches yet, just a quick comment.
> 
> Maybe I should have said why I do it. It's to register a notifier call
> on ACPI bus events. Is there a better way to do this?

AFAIU there shouldn't be pure ACPI devices, they are companions to the real
ones. Can we simply attach to the normal device notifier and check if the
companion is what we are looking for? Also since it's specific to that driver
and you know what the platforms you are looking for, why can't we hook
something into drivers/acpi/x86/lpss.c?

-- 
With Best Regards,
Andy Shevchenko


