Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB5527FB05
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204091; cv=none; b=AIJ2V6k0JXXYLJ6g4QTNXaamzCghkppeoRcT0yF6/fjk8OM6Rpa0wSDiC1xfCAd+HRg9f4UK6x+HD3Swsj2HCG7u1GArFG07SHSOdbnTXtzjNuYYuci8nDLVKKyXJK3e1ovr6HwFtKjzNSPOyMnd1a2lqocmirI+yG14godatuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204091; c=relaxed/simple;
	bh=T54buALKRrnV/NkHhNnF9DYrF9mnjHeDsPLsjZLccVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFM7PhMtpFSCVJQUk7C+hL4PW1hF930nidbEyz8Y3sEcVuI3ksSBEh4vMfY/ey/x/pzmR6dLVdHc3D2RuOr6sYfe3OnbG9p/IJBn+nLr1rkT+arRAJ9RyHdF3dai8fI9fM4VGNX7PfVG9t4SRXMjNE1/z0i3japIT2xfysZohLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlA2OaOX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlA2OaOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781204090; x=1812740090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=T54buALKRrnV/NkHhNnF9DYrF9mnjHeDsPLsjZLccVc=;
  b=VlA2OaOXl8/MwZq6gAyMZw/DuJleSjVM0gv50SRSwDZIJWNLeDHJ8uHT
   MYVM44F6kiGDnb64SXZRa9PU48bgPSHlRcG3+HcacaWz0Fa5o7jp595qH
   OmzX9AiuWQ4rNJ+X+Zh7ODUw25JQcqG5KC7CJXDq1qUlBkavAo2d9iGbR
   dajvv87hB0P3VlAEIrwJY8ELn4H3RWerJONgwdyYJOww/0Z/HhYblbQnw
   cTe6CkVWYeV6HcCczfsmpJS4JZVwlyCW4DPrF3YedWf1RB5YtUTc66xkj
   THMZ/jltPLjObTeyT334mVELu+ezvQ9YEYFJ5Qbyx3uILKw3UjmjFdSAB
   w==;
X-CSE-ConnectionGUID: 8DHem9CTTH+Xjkrfrssw8A==
X-CSE-MsgGUID: wlx9fJ4TRM2uchLavNGVlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99606441"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="99606441"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:54:50 -0700
X-CSE-ConnectionGUID: 8c6VWJAfS46EAVViB8yt6A==
X-CSE-MsgGUID: zgLRcfSXSzCuoVc837orwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246654990"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:54:44 -0700
Date: Thu, 11 Jun 2026 21:54:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port
 device
Message-ID: <aisEccAOm3qoXjxd@ashevche-desk.local>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-6-wenst@chromium.org>
 <ailxrP-_9_NL8qnN@ashevche-desk.local>
 <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
 <aipz2zMFcdnZYTxS@ashevche-desk.local>
 <CAMRc=MdRN7YitmMX8PknbzLh+MdsWm+dDg0MLtCVYOorqNobTw@mail.gmail.com>
 <airY6IMz2KFz_z9j@kuha>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <airY6IMz2KFz_z9j@kuha>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 11, 2026 at 06:48:56PM +0300, Heikki Krogerus wrote:
> On Thu, Jun 11, 2026 at 11:35:13AM +0200, Bartosz Golaszewski wrote:
> > On Thu, Jun 11, 2026 at 10:37 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Jun 11, 2026 at 04:20:58AM -0400, Bartosz Golaszewski wrote:
> > > > On Wed, 10 Jun 2026 16:16:12 +0200, Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> said:
> > > > > On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
> > > > >> When a USB hub port is connected to a connector in a firmware node
> > > > >> graph, the port itself has a node in the graph.
> > > > >>
> > > > >> Associate the port's firmware node with the USB port's device,
> > > > >> usb_port::dev. This is used in later changes for the M.2 slot power
> > > > >> sequencing provider to match against the requesting port.
> > > > >
> > > > > Okay, would this affect ACPI-based systems? if so, how?
> > > > > Can you elaborate on that, please?
> > > >
> > > > Is it possible that there's an ACPI device node associated with the port like
> > > > on some DT systems? I don't think so and there should be no impact IMO but I
> > > > also don't know enough about ACPI.
> 
> There are device nodes for the USB ports in ACPI, and I think they get
> always assigned in drivers/usb/core/usb-acpi.c.
> 
> > > The API is agnostic. There is a possibility to have software nodes associated
> > > with the port. I think the best is to be sure that ACPI-aware people who are
> > > experts in USB will check this (Heikki?).
> 
> I can't say what's the impact from this patch - I'm not an expert with
> this side of USB. Is there a danger that we end up overwriting the
> ACPI node for the port, or something else?

Exactly this one is my worrying, but I haven't checked the actual flow.

> > Even if there is a software node - it shouldn't really matter. It will
> > just be assigned to the port device.

-- 
With Best Regards,
Andy Shevchenko


