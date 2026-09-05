Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A53A1CEA
	for <driver-core@lists.linux.dev>; Sat,  5 Sep 2026 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596392; cv=none; b=SOSYdCH93x8EsrZFPD8gWmAujQurp3swlMt+Tdm9uzOqgpfa+6osWawZtqATByFSoqFPtjiseP58byEWlRNwEoNuoYDMeaDdHk8PWBJ/J6f9/XY5JFHcSTWldmrDWK6W3w3y0gcYUtuEbJZWI8euo5Vz8nDZV+sk2y1rwLxzKcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596392; c=relaxed/simple;
	bh=LCxtwuf2XVjyavMFXpabUkNGnxhVmscqDbsgQpznjPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/42ubc/d2I2QgZgdLfQR8aGyTT8Du7nd17OInWXG2Wh4TypYu3cJlw5Bo6qkjxEb4fPspb7XoSuR/6WfULPNBSc1KBkcb6EHA/8fj9Hb66ZQoPtOTVUHWjyyADG4b9b30P3yV8DwAqasLuLuZp4icnMlJet+RFxo/bsgtgUJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TO3TcmmK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TO3TcmmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788596383; x=1820132383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LCxtwuf2XVjyavMFXpabUkNGnxhVmscqDbsgQpznjPQ=;
  b=TO3TcmmK6ZRRbLlxBZXAQYVSp0xxbf4pWbE9v5BU/mTrWgReWx9onz0a
   y/RKl/xD/j5RRjH7h045USMIHDcgfjK+/NzGvQa8SL0U5l5K6FwuarU5f
   5pqGJgf/wsB4IWTXdT9lvQUSfvndbu1/p3xlAPeUaw+9Ah2JfFErKsz2q
   NzK7uVIpCEdJ11GY3sjZOyuOtPxZ6HUf73p6L2ieqrAdqdLO9MP/5vDTR
   c2VHw2l6cBnrxUmtrcOm+8AKUVhh40N+80zGTgO3WblT6BTddah1IP9fB
   jFcO1y/z+8JBc5Q7jDgAQS/1ieVOuvligHN3CMFIaAzb7a1vaew0ROuVk
   A==;
X-CSE-ConnectionGUID: oo7w870qRpujiHLi+JGlEg==
X-CSE-MsgGUID: A8uGGdCcR5W5HDsQgwYHRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99682604"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="99682604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:19:39 -0700
X-CSE-ConnectionGUID: RZJD/lMbRdmRSuPG8lpbEA==
X-CSE-MsgGUID: cq+DJsyETMOKDJXUoiwqxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="295128198"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:19:34 -0700
Date: Sat, 5 Sep 2026 11:19:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Subject: Re: [PATCH v8 07/16] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <apvQlBEgHOW9MCxN@ashevche-desk.local>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-8-wenst@chromium.org>
 <2026090430-botanist-ungodly-0299@gregkh>
 <CAGb2v65MSxL+r+wqMjPKVSh9aS1gkn8og6oBinSXDdipnoOyCQ@mail.gmail.com>
 <2026090433-chair-tidings-5c99@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026090433-chair-tidings-5c99@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 04, 2026 at 07:52:37PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Sep 05, 2026 at 01:24:20AM +0800, Chen-Yu Tsai wrote:
> > On Sat, Sep 5, 2026 at 12:47 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> > > > |struct usb_port| and its matching container_of() macro should live in
> > > > its own port.h, matching the split we have for .c files.
> > >
> > > Why?
> > 
> > This was requested by Andy. And to me it sort of made sense.
> > 
> > > > Move them as described. Also move usb_port_is_power_on(), since in the
> > > > next change its |struct usb_hub *| parameter will be changed to
> > > > |struct usb_port *|, and becomes a non-static function that only
> > > > references |struct usb_port|.
> > >
> > > No, please don't do that unless you have a really good reason.
> > 
> > Which part? Move the code?
> 
> Please don't make a new .h file.
> 
> Moving the function might make sense on its own if you need it in a
> different file later on, but do a move only, and then change things if
> you really need to do that.

Isn't this file to break possible circular dependencies?

-- 
With Best Regards,
Andy Shevchenko


