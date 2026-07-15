Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBD0275AEB
	for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107754; cv=none; b=BEfFZZK9Pmlmm2VGXSjdBxEulyYTTFy3E1JQYC6fsUknGU7ce2nwh1q5L4sV+Ikt91049kjlxif3rLmKcumdJVzwdQg1aX0wmyqXgQ97ujVSeIIH9cQ8kIPqCpH9Lfnxyj0BG1YV3FsOxCnCfyhDnuH/9FfOUATtTPNJ5bmIfUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107754; c=relaxed/simple;
	bh=/5aaAsVdQN0eiTG/66eGgXteBugptKLohzhJXhN02NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRhK6XEyier/cGorh2MIkMDQVuDamn4EohX7EaHXxDB0Vpw0AkT0WNFfebNe75miu9ara2Ujwz4joYIPhAGOcbyOq00xYxvdh9C/yRGRTzQ5zYmL+LnC6B3nMMNSppI77IPO7X/rOusQSqGsEs+LPO6ilqJDDNTG4Lfbk7jNSmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRbNMu8M; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRbNMu8M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784107751; x=1815643751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/5aaAsVdQN0eiTG/66eGgXteBugptKLohzhJXhN02NU=;
  b=CRbNMu8MLuQAJaO5Qbuu56DDzuGxvLsLdYU4lFELL6MtRKomF+nGrc3p
   x5/mAUbIQWdoEAcVD0e1ngfV+irN8bMe9B0mronc0TMXvfLRgpp83PUmi
   vF/gUTE2LMA6rqpRbSkolkdkFwEHIQUO5K5WUQCjtWb9vrpmuLCBy2frQ
   I0Cg8gKfHaFV7q/eSLVmC/3FE7riJVoI4zEbV3VFAyshkxBxnp4XrgBe+
   cjeTn2CYkKDzS0QP/NWLUbnFKvFn1WEoIUOhdoziILcfznu4Ct9LtGWmz
   jydulsHPtpXhgrOmuqxdtmA2na4BZ2daXUxyT3wMidYQgabJhGp7WT0U0
   g==;
X-CSE-ConnectionGUID: GYTFoTaFTqy7gSnW8aFzdg==
X-CSE-MsgGUID: pZq9bOjeTHO8XC7pVjTN/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84830133"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84830133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:29:10 -0700
X-CSE-ConnectionGUID: t3nl7JS5TxCiXiLKm/nhqQ==
X-CSE-MsgGUID: BfWSW46GSw+l5U7M4cVNLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="286203001"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:29:05 -0700
Date: Wed, 15 Jul 2026 12:29:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
Message-ID: <aldS3qTympJuVXYj@ashevche-desk.local>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715085348.3457359-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
> The power sequencing consumer API already does power on state tracking
> internally. Expose the state to consumers through pwrseq_power_is_on()
> so that they don't have to reimplement it locally.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +/**
> + * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
> + * @desc: Descriptor referencing the power sequencer.
> + *
> + * This returns the last requested state of the power sequencer.
> + *
> + * Returns:
> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
> + * negative error number on failure.

I would rephrase it a bit.

 * On success, 1 for on and 0 for off; negative error number on failure.
 * If desc is NULL (means optional) return 1.

And this rises a question: why 1? Shouldn't it be some "unknown" state?
(But since Bart Acked this, this doesn't prevent the patch to go, you
 got my tag above.)

> + */

-- 
With Best Regards,
Andy Shevchenko


