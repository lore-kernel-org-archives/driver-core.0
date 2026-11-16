Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822741;
	b=iR6OQY6J9rouRdDLgLzhA8amFmFRGRUOiOHoVWsiAIXASpOfztZj2B+CCEZV0bDWuAmj
	 WDZ0K0ZA+m3qc2ZUb6Cx2nziELGhDkBZ+LODdopuTDYTOjSDhR6pH+QD4O1paupqcDLe8
	 skuvzpCCCpHSuvsz5iWedhGTG5llIcb8FVhTAN5H54YD/sKDtMYo15q28zHWj+P6DAzj1
	 0LQ5jI2emmiQexlHRfV/vJIkH1uUPMrgya/4PagZLMRv1RAxCNDDQ40SV9x/Hb66y8wkr
	 Zkac0dJYy5FYkQirMjJaNWuYhAtE8pb3C3ceZGntQGpTgEPXTDPYHw0zm23pC10eTGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822741;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=my3HxYvSDU/yPH2PpyhhY24GsqtDovmZmnlnlFtVCJI=;
	b=wKry3cCaB0aJGBd28EGrWhrtTjcM0JFhSTEj5yUiNvg71M6ewHiII0pHgU43rLXTJp+U
	 dCBrY1Q12BrL4kE9eEDqCm3bsLL5Q0mo10NHtpcmiTjJp2bWAXYse8nhKw3DgMMJpSmb8
	 IHG6htlsDQ02B99GOH4rDvJ60RKx6YPkRO2hYTlajd96OYVukHAfKAkZsW6atqcL3IY4r
	 q19EnNkEHiqTc3PI7aoj/zOvbx0FG9MxAnSigJUsb6M0IwvF5TXRHwEHHpMMzBHyF8dEO
	 j7bq65t08Fauq0nXTgNLwHSlUZ4MtbYI1GIjGwCTuD/wMSVFusokBpqPxV7zj+6RFvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B3DsTelo;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03330606A33B
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 09:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03330606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B3DsTelo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794822741; x=1826358741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CKwXvtFiw2YfhixQweSZGyQfnQaxAi/mrgRb3VZGJu8=;
  b=B3DsTeloTtedE10LrRgGN/7W+5Ry1/1uGvh39+sqMExyqy9jd9WdsGWk
   azz/fHEAls59udq7r70iPLLfPb5Xqbvj2cq/N9ZzqaBFQrnB6cecCeiOc
   PK8v5IPmtUNP2sl62MQlnvCujC1TRrpGVgE3K9DLaVSofnSztVl4m3TMY
   hfmkULIEgyQ60t1b5XxYkMLGSJe1PNEESX5FY/Wrm1an2RxIwg4FSxhMR
   9DNFnCVy78+0E/hcI4MmUskcLScjME4QInjVEmN2O+8yg6JuEHx5vUswo
   bLsdpyycVldwOWaa5WnXU+vlbl5PrfQVzFldOlxmz3MYuX6VZaQA+VFd6
   w==;
X-CSE-ConnectionGUID: CuvqF5BfTd2CcEByfPA86Q==
X-CSE-MsgGUID: SA0tKhBXTUaI9/8idj7FKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3447592"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3447592"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:52:21 -0800
X-CSE-ConnectionGUID: c805QEd4TWqPznKBs9CPiA==
X-CSE-MsgGUID: /nrRhD/GTGO8oAqEdcrC8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="10037323"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:52:14 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A87F4121B5D;
	Mon, 16 Nov 2026 11:52:17 +0200 (EET)
Date: Mon, 16 Nov 2026 11:52:17 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andreas Schwab <schwab@linux-m68k.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Joe Perches <joe@perches.com>, Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Len Brown <lenb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linusw@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 04/19] device property: Fix fwnode_name_eq() for empty
 node names
Message-ID: <avrSUUM3HMgxTNpl@kekkonen.localdomain>
References: <cover.1794667407.git.alx@kernel.org>
 <7fc1321995f1aec9d7b92c6a89047cc9fb28c52a.1794667407.git.alx@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fc1321995f1aec9d7b92c6a89047cc9fb28c52a.1794667407.git.alx@kernel.org>

Hi Alejandro,

On Sat, Nov 14, 2026 at 04:22:16PM +0100, Alejandro Colomar wrote:
> str_has_prefix() returns the prefix length on match and 0 on mismatch,
> so the mistmatch case can't be told from "empty prefix matched an empty
> string".
> 
> For instance: the OF root node's name as returned by
> fwnode_get_name() is "" and will return 0 for any name matched against
> it and since len is 0 too, fwnode_name_eq() will return true.
> 
> Let's use strprefix() instead, which also makes this function simpler.
> 
> Fixes: a9c8c738066b7 ("device property: Add fwnode_name_eq()")
> Closes: https://lore.kernel.org/linux-hardening/20261104-fwnode-for-each-prop-v1-1-6e28fe1c72c4@oss.qualcomm.com/
> Reported-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
