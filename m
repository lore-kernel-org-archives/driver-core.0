Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99F5519928
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 20:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553368; cv=none; b=oe8KrIe9lBvijPNEvxNtLtltPN1/Sg7ENFXsQvThkEn5zsy2kZ+1CEqXqVbLFO2esc2vJSNv/BX3VVHX/3eE69umJamDCkebu0Kugt5Th0Ea2lYUWzBA9cmzeQi09bqzHICwrfyTFCfe65K+Fy4obz/M/3pFTcbhLUnTT+wiMI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553368; c=relaxed/simple;
	bh=bw2W1qZcmf7Blll3N+n4993Jy+r1dnnoyRkosVN9X3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgNuowcdyp+KmASiC7/ylVTnvfcgmDGBe+Sauveg4/v9fjrsXj+jhiBiefNrNrGLvz7AoeMg+KOs/mK+gP4meIn8hh5khiC5FqJFj3UJLsKs8maD3huAkzHdSh3kZm6DMXPV71J7Ve8A9S3XDFzZrBw7JvpJrGLpGnbdTJaUsUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z32zrD31; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z32zrD31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788553365; x=1820089365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bw2W1qZcmf7Blll3N+n4993Jy+r1dnnoyRkosVN9X3c=;
  b=Z32zrD31DVmdK6VQ5d2AQARVDvOAzQh3TQfcfQL8pDmLy5FZxY2JVodb
   25Duwnvv6Qi4FjdyZmb5utOSWiUywxGENveMJgLtxtxxfOy6KggBo74nM
   /QAEP2weXRBveaL2I+BlMpOx9cT25tpRTywdU65aE23/qSPM1dHgfT+US
   NSOim8eDcz0q3S3PlU5O/OIuYL60jwz995WM5BgV00Dl8iPYVD1qpfiV7
   h+cpa7DS/4+MfPf43MqLv4pRWZbZMd4Qlofb1NtiFHpaq9ARNbqzZO7tK
   0iVU29BpMddpMb3AW/WVTpkoiU+NhxnaZof6wMoOh0rp89iW4ILspkHRT
   A==;
X-CSE-ConnectionGUID: X6vfyAFbSZKWgs/kMs78NQ==
X-CSE-MsgGUID: zZWe9F3IS+imQ0XdO1YUiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88825210"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88825210"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:22:44 -0700
X-CSE-ConnectionGUID: WwKLNACWRFaeMh5EWjuZfA==
X-CSE-MsgGUID: 1blCz6W6S2mCem8ip/60xw==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.86])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:22:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CBA3511F7F4;
	Fri, 04 Sep 2026 23:22:37 +0300 (EEST)
Date: Fri, 4 Sep 2026 23:22:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 02/16] device property: Add
 fwnode_graph_get_next_port_endpoint()
Message-ID: <apsojRC47DnD-PZC@kekkonen.localdomain>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-3-wenst@chromium.org>

On Fri, Sep 04, 2026 at 04:41:41PM +0800, Chen-Yu Tsai wrote:
> Due to design constraints of the power sequencing API, the consumer
> must first be sure that the other side is actually a provider, or it
> will continually get -EPROBE_DEFER when requesting the power
> sequencing descriptor.
> 
> In the upcoming USB power sequencing integration, the USB hub driver
> first needs to check whether a graph connection exists, and whether
> the other side of the connection is a supported connector type. The
> USB port is tied to a "port" firmware node, and this new helper will
> be used to get the endpoint under the known "port" firmware node.
> 
> Sashiko points out that the |prev| reference put is not done if |port|
> is NULL. However it seems that the fwnode_*() and of_*() API design
> implicitly makes the functions no-ops if the passed in node is NULL.
> So this new addition follows the same pattern.

I'd put this last paragraph after the '---' line.

> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
