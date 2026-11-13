Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581073;
	b=VJU+SoJtj0SBtomZqkLIlBq+uLUfpqbSwdXOjhoYh5dUp1W+QZVsnNsDCpCEn1JYRXgC
	 0taEfTfBRK0SPGCUQkzQunPWzsfSJCFnoB2frCcKTHLRqMjSVkBDTKcqP2HI48H6dtXkV
	 j/IVonPKbnWGNnDJpwctth4tygYFd7TFVavBujKBrrDCmv2kbEdro6/Cc7ESDlZ+Zky4Q
	 8buNE/BhFDBpEQZs7KWuMGU6AaeuyjXp+RKtCPpeBwQwZ1Aje95HzHMdhZ8M2SSn8fspL
	 ldxAnv7SBMwxTfYhYFhrO4QMe4U1wScjkpvDS0ix4HCRBe6KcRnEyz3uGPlyNN79njQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581073;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=PCohGcK4MbH0+m0C2E2oEI2m0dBP6JKw67OWX2Ixdd0=;
	b=hpb6yJ8pKM5Hw1W66khTWib4zyjI6h+ux1Jr9byCWGXfb9KvtkGSxzNK+U5m3OTkONUj
	 GWDrSyC9LD66+vsVXnd1X/G12JbfLwY0ePEdLM2HtdfwInde/WMZl3HPJr1QKHQAhMuz2
	 OdX8KrR4XPZQxzbyvrL72+VNiB8l02fNQ/oybqKlfYVWDnsYXYY2P9UVYvtVlE6i8KPmT
	 n2FMzCV339s+elXv5W1NzGL+cKEqeKmeH4XvPaGbE4zZrBFmBpZzUI7G3PHlt6Quy25Ej
	 Fi6xF3M44MHGZAExSrelSkHccwBaFjMZtwEzhPfm5eahw0vL+Lc+WwHWHPfmVeBYgKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="QR/RmCXl";
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598ED606A323
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 14:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 598ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QR/RmCXl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794581074; x=1826117074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DyI5H6asWxx+tH3VejHSQI8D30gWxhl9i+ORCFAvja8=;
  b=QR/RmCXlP7YeiKs4cIIQlvZUq5MI+AsMQylxmqVHyTMWw7lKwXW1Em/i
   C8Za6TM3AWBodCXFoxBGHaSr08gZDp/2T1d33OsWoROoCgSzoPvIyAKgL
   CKrY8ijrn5JUUe8Z3GKLModbDij415qNKB25Fy89aNmCaeMlcfguqUR7h
   NYkRZ6mO+oCr5Kdd+CHSY9nDKc/X6Cb45xQTBkQvVYxQFzmyNBXJLeWr5
   mSg01d6+9adGLilgryjfjXeZ5B43nnxQ5S4uwQTqtkv4pi/ChTIU6We76
   s4RzzQE1maf4u0JUvpoxQhZK0K+cEVM8ZKkIG5WsXfTa1ZVN5prPz1YEZ
   g==;
X-CSE-ConnectionGUID: ww0CQbXeQrGcWSGVYoL0Ug==
X-CSE-MsgGUID: 4Ds/k+7+ThqQJGtXuKBENw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3288684"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3288684"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 06:44:18 -0800
X-CSE-ConnectionGUID: rwx0kEqrS7KcRwQIohl0qQ==
X-CSE-MsgGUID: TsUR/GvvQFKYNdvTuscMYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8831426"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 06:44:10 -0800
Date: Fri, 13 Nov 2026 16:44:08 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 7/7] string: Implement strstarts() with strprefix()
Message-ID: <avciONW-b_WXoetv@ashevche-desk.local>
References: <cover.1794574496.git.alx@kernel.org>
 <382a44f7c68672ecead2436d9f569ee23f383830.1794574496.git.alx@kernel.org>
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
In-Reply-To: <382a44f7c68672ecead2436d9f569ee23f383830.1794574496.git.alx@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 02:11:17PM +0100, Alejandro Colomar wrote:
> The compiler should be able to optimize out the unused pointer
> arithmetic done at the end, so performance-wise this shouldn't change
> anything.

If strprefix() is not inline how would it be done? Or I missed the point?

> This change de-duplicates the almost-identical implementations,
> and better shows the relationship between the two functions.

...

>  static inline bool strstarts(const char *str, const char *prefix)
>  {
> -	return strncmp(str, prefix, strlen(prefix)) == 0;
> +	return strprefix(str, prefix);
>  }

There is no sense to keep strstarts() at this point. Can it be simply
redefinition? However, after looking at the uses in the kernel, I prefer
to see the strprefix() be not implemented at all, just optimization against
strstarts()/strends() if required can be performed.

-- 
With Best Regards,
Andy Shevchenko


