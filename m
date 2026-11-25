Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614144;
	b=UyM9s8ZcaCaumKvtlUhifRIPvLoAP+XlP5c9uw28ddz1nW0Y/gnJjbJqkLCc6jO8p9Wr
	 rPzFLBK5tFbPw30GoG4KU3/0q8+euol77lVBtP4WimVPXgRbHekvIn5UBhysfSfvpu0g5
	 dbJPIq9hPpQQbqvIbojsWuVa3LfxDBOrvosY0vWe0VxuIW1/ApmrFOInV8nFXpB3xSA9h
	 ev5P42sk6p08QERxmQP8jkqb3ERHrYUeBui4WVhjNDd31t35VSshHhG2Yt52F6TzKbJpr
	 eI+FAcmZWSxj7l96ThpJU1QNktsa9oy2lxAFMemwgNU3p0kROLnFRSqIeSrYcehmp0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614144;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=bxQYvAH/e5DxlDwkxmjaqlGGjz9PPPTHLzNLn17GAsA=;
	b=slub4+gvjkZypKKOosjVEVbVslbclr92plbwKMoN6QkuPa970i5kxrdgUnBYee+RUSoe
	 gSOqmC52HicCaeVtQgH0MJS0gvKnQ9iwJMvfnjExof8IQTDe0tWsr72GxgN44qDxVIzuO
	 Tj4FUZXwEYzveltZOvU+plW9aNBiN1c3Q0L7kIHlGFDyqJO5p5TrCqBrKLYdmypLDosI0
	 iSawqY4Ex9uxAH6ozFxYumvkSRjyrT7llLyspCLzXq9AHERd+UyI4SucZ+fAHo/LG1WEo
	 Is0KzVDeXdHPJ2Dv3bQNSUfyPL5fHSUI784dm35V7D12bDmCYjT8bzAOUmGpwIJRzPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jtwsDgt2;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3749606A31E
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 13:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3749606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jtwsDgt2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795614143; x=1827150143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9r4hh0svneP2IYiq6b1lmexfhmWdhH/gieJvJiUmn2k=;
  b=jtwsDgt2ZQBTWQEUHC23cpnv3vI6ez7Ok56DDF5bDwNMp+J5UN7u9PwN
   YWMSxUO9PpHzge1iwQAGWWMmoZ8rQQ3FKjzJVmnwq2iRtWiegjcP2GzyN
   sJjaxvU/nBk2cUS1fTX3xOcU7/FZ3898CT4+BooH8EBDe9kZLocKl4j5I
   i4EDqmTI8lmUJ/wb3MCpqtXGn8QlgRLyJHx95hgA5+rHP/KhyuQGp/lqi
   dwLohy+uIiLc7ZyfPpOoOb8coSoE1JJPB+TnWvffjvjAbOrxmDcDpmZcm
   9rVlui0T5x2dklKtHHpvQPI1jfax1GztfoH5G+pUlnTVoyrIQ8DZg8okw
   w==;
X-CSE-ConnectionGUID: Aptx0qQcQ8+S7EY6uOUpig==
X-CSE-MsgGUID: 5yy0XcMRTXaVnBXauUM9xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4498397"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4498397"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:42:22 -0800
X-CSE-ConnectionGUID: R/IB2n/gR5qDBxJyB8vfcw==
X-CSE-MsgGUID: DFQAHDsJSxCY/EUe8EqDAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12100207"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:42:18 -0800
Date: Wed, 25 Nov 2026 15:42:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: raffaele.tranfaglia@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-sound@vger.kernel.org, Neo Chang <YLCHANG2@nuvoton.com>
Subject: Re: [PATCH v2 3/3] regmap: kunit: add tests for values wider than
 val_bits
Message-ID: <awbluNv_9F9vjx5s@ashevche-desk.local>
References: <20261125-regmap-kunit-val-bits-v2-0-81db3b79cd3f@gmail.com>
 <20261125-regmap-kunit-val-bits-v2-3-81db3b79cd3f@gmail.com>
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
In-Reply-To: <20261125-regmap-kunit-val-bits-v2-3-81db3b79cd3f@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 25, 2026 at 08:09:32AM +0000, Raffaele Tranfaglia via B4 Relay wrote:
> 
> Add two test cases writing 0xffffff0f with regmap_write() to a regmap
> with val_bits = 16, and check that only the low 16 bits reach the bus
> and can be read back:
> 
> - write_wider_than_val_bits uses the RAM regmap, a bus that only
>   provides reg_write()/reg_read();
> - raw_write_wider_than_val_bits uses the raw RAM regmap, which goes
>   through the value formatters.

If I haven't given a tag earlier
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
as test cases are always warmly welcome!

-- 
With Best Regards,
Andy Shevchenko


