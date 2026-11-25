Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614584;
	b=dnaf81ktKF/5ClQkdPvGDmn6GcVM/PYu/smDZ3LFjkrPgsi0FaJb+70OHeJNxORPJKm8
	 fb/YKn5oYb4K3J4YP2v6cLlyjpV4edydE1/6iD2oir/BYEh6M2dpVoB5zQW3C2AvH5g2a
	 owEwKxgtm4D/6E1OVfzZKf5R2cagPIuceP85fUDekdPCKrvvJslmnz+npn8chSNs+oIDP
	 NpH16ezVyYPbZn7IL4rpybDJnCDXEkH7ftDCO7ToiS0aVdsI3fbYKFA18Og0aqjJhxKra
	 vlXVOhI/t/2MjSegf66xTkSMJ6Lm40Ifsc8hTxqITAq0hQ5gjvtm71XO4uT+Jk0k2hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614584;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=yyHxxdReNfxVoXh4IqIaq80BMGasrVS/xxrq8pVvCe8=;
	b=zcjwE/KwbBvDzBYQKCQRBb29PXTaaq6FvTwzkZJvlNUeL+z/sQND1AOYazhorZr9E5jv
	 CC66t9MAQw8gYYrOTAZ+/DePI/VyuTG6C/f/yHV0u9lk+lZ/DfzdKQEbjCPEWFyhbiR30
	 Q0wLMUh5pT7/ye4rRYyJ5FGYnq7Qv43KmLY+Igzfj4epiD9DgKE/Rkg01E09M/V32N+q2
	 AbpMH4a8OL6mWVZQ45NlMddiIUc+BqWB+LhDh7FB0YtI8VQAov7KsxR/0cm0D5yCfFfC8
	 qmgUdVTyIEzmyeh2U9SJmIff2DL7xamHQiWAJ8WGytQBVKZz7eGK0G2HMeqDxZXmZTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DLzNdlhH;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55340606A321
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 13:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55340606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DLzNdlhH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795614585; x=1827150585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9VUNgHXhpfQAQ9DcK1y1cc9wnfI/kl+snFE3maIB6K8=;
  b=DLzNdlhHetNoRXudHUnQqlSeVCmURrTlGOqmflq23py8bQfOxOM+lpa5
   z46cjckeY8BD7RUR/tj6oHCK5NcW/giRtTzIWxog9wmaGnoHjDvR90kJ4
   z4wsF47lyW66DcosAE7jUKA1cRmH4Stptcpwu/tzBEhkilTmPSXRymKdy
   VRofCd0l3nYjUbxD4EGFWTfGgL76NkWo9ZaR0JoM0yMvkW+YA2/H5edDe
   I2aR8GK1CdxEty14IwDdrmQQN3Da2PNT3Uh1eyC4MUlP9dBpj0VUNdDxU
   0IIAmg4SSUnby+jXrAJB+nctYrnJZJqM1FCoScjJq2HgxChcau5mNf368
   w==;
X-CSE-ConnectionGUID: TlJn9MMBTqypfyKSY18gmQ==
X-CSE-MsgGUID: W9/01h7BS7eewGA74Xl8bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4382124"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4382124"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:49:44 -0800
X-CSE-ConnectionGUID: MVU5Y1eiTISAbn9qypmeVw==
X-CSE-MsgGUID: OS2hxzV6S9akpR3n3dC0TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13551619"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:49:40 -0800
Date: Wed, 25 Nov 2026 15:49:38 +0200
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
Subject: Re: [PATCH v2 2/3] regmap: mask values to val_bits on write
Message-ID: <awbncgC-qNTtr_ID@ashevche-desk.local>
References: <20261125-regmap-kunit-val-bits-v2-0-81db3b79cd3f@gmail.com>
 <20261125-regmap-kunit-val-bits-v2-2-81db3b79cd3f@gmail.com>
 <awbk6Ah554O_Nxg5@ashevche-desk.local>
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
In-Reply-To: <awbk6Ah554O_Nxg5@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 25, 2026 at 03:38:54PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 25, 2026 at 08:09:31AM +0000, Raffaele Tranfaglia via B4 Relay wrote:

...

> > +	/* Some users with their own register accessors don't set val_bits */
> > +	if (config->val_bits > 0 &&
> > +	    config->val_bits < BITS_PER_TYPE(map->format.val_mask))
> > +		map->format.val_mask = GENMASK(config->val_bits - 1, 0);
> > +	else
> > +		map->format.val_mask = UINT_MAX;
> 
> This is simply
> 
> 	map->format.val_mask = UINT_MAX >> config->val_bits;

Answering to myself, no.

> no? In other words, do we have cases IRL when val_bits > 32?

But this question stays for this check

	    config->val_bits < BITS_PER_TYPE(map->format.val_mask)

-- 
With Best Regards,
Andy Shevchenko


