Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582465;
	b=3kiUaJbF2moE8mlU54v16tVYTOTFRgU3mGViNPjJGBte9XLRQbU0E49CfE8tK2Jq7P84
	 Qp6OaWzI1bOljt45QGfr93E6haIIIagFC/SA2aNymeHwiqqvoZbhUIym11YGb5qL4bX84
	 TznrEKUl47dJOXftMdrfA+tPoHTQmJLZaqggRZtndMe/mT7Ujxeld5MgDvd/6e34uJ4Q3
	 NFaBIELLTXz65VCqOvc1Y/MpFYSHsMgk02xO+cUCw/a0vSdJqeZHNYvcJ8/RsUnKPg9Oy
	 UTejbNOSYusYZ5ToSN5tjTAbOvHLe5tQFfOt9r6+/JwDR1R2xrJjeyBAGvEDcARSuwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582465;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=03m8EdAbJ/zO+l0cdep4kEIEormT+7Rtyw+UHpPUI1c=;
	b=pePlOqa/B+lttfn8IsuopwS8U7W0F1kxTnSt8RV8u3VMkb5SSowQkmWVXLTKJuVjE7fz
	 ObGVVrgtdRxO6x3LdXLPhvD3b9+0pQF1V/ykclAcn9SUs0ZIxGIKjloXWurha4aSmkujq
	 mqBU4oPI0vpkmfO92UGrgaP6ZvdIBqoV8Gh03JoDtcer5eJV7k5+jhxFq+M71IB/OiCrH
	 7t1LqrQnSqS66lP4QsWc+1aIb8JwWMvvdoVCalm0i8MYFbsePg+zAMhssHfmMvadANpyK
	 1FEFDo9ipbHKPBRVaRCcMm5C60TWZa97W3CxQ3bQY4zIeC/xQWNSLyGi6gR5kkjIkzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yb9rmeSW;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D8E606A327
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4D8E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yb9rmeSW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794582465; x=1826118465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=erSG/G2+WfX2Q8AjqmIx2mTDrQSka9NMFykf/cHBB8Y=;
  b=Yb9rmeSWChIG3aaS81ohWWk2By8X0iURq+UBnlm5HOmGafGytBAzTACG
   xGXhxijf+EBCWPc/U9yPZHEAcPufmO1R8TIbNfdfYjY51oZI5AP6d7cA2
   lpvjg7cmiuJFgU1+H2oRjiG+9O7nYCndI5qF9QN5N9jcGCzxAyO1JtLkQ
   JDsMHtiYHpJrvYhpHm5wTHNvDSXSmVbEYS9CXalmtPtyMuuM9kIv/QpL5
   4H3ZJ2+D+hNvsPR9Ckk00idznQxGcWv7Ir1uJ0rv96AShZW1cpc3cE5On
   nX+pITbx707QrXI8wDljlTixMx62aXIykYKH366JYSdSS0oNY6KnSYmYx
   w==;
X-CSE-ConnectionGUID: Sm03O9sNSC6TpTxxEIGc+w==
X-CSE-MsgGUID: YFAAVtjXQYeYBR3hVNvEUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3256307"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3256307"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 07:07:44 -0800
X-CSE-ConnectionGUID: LiWXPMtKReOdEIHNDC2Vmg==
X-CSE-MsgGUID: cUhmMB93SSC4PbzqOcRs+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="10841478"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 07:07:37 -0800
Date: Fri, 13 Nov 2026 17:07:35 +0200
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
Message-ID: <avcntwOjI2i4seyB@ashevche-desk.local>
References: <cover.1794574496.git.alx@kernel.org>
 <382a44f7c68672ecead2436d9f569ee23f383830.1794574496.git.alx@kernel.org>
 <avciONW-b_WXoetv@ashevche-desk.local>
 <avcj0YbmHRyhFW-Y@devuan>
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
In-Reply-To: <avcj0YbmHRyhFW-Y@devuan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 03:59:46PM +0100, Alejandro Colomar wrote:
> > On Fri, Nov 13, 2026 at 02:11:17PM +0100, Alejandro Colomar wrote:

...

> > >  static inline bool strstarts(const char *str, const char *prefix)
> > >  {
> > > -	return strncmp(str, prefix, strlen(prefix)) == 0;
> > > +	return strprefix(str, prefix);
> > >  }
> > 
> > There is no sense to keep strstarts() at this point.
> 
> I agree.  Actually, it seems my guess that strprefix() would be
> optimized out was wrong, because the kernel builds with
> -fno-delete-null-pointer-checks and other flags that prevent this
> optimization.
> 
> > Can it be simply redefinition?
> 
> I was thinking that we could just do a simple search and replace
> s/strstarts/strends/, prepending !! in some cases if needed.
> 
> By 'redefinition', do you mean making strstarts() return a pointer
> instead of a bool?  A problem with strstarts() is again the function
> name: it doesn't seem to naturally fit with a function that returns a
> pointer to the position.  It also doesn't clarify whether it searches
> for a string, or for a list of characters (like for example strspn(3)).

We have str_has_*() for that?

> I prefer replacing strstarts()/strends() with strprefix()/strsuffix().
> 
> But if you prefer changing strstarts() to return a pointer, I'm also
> okay-ish with it.  It's not a perfect name, but I can live with it.
> 
> > However, after looking at the uses in the kernel, I prefer
> > to see the strprefix() be not implemented at all, just optimization against
> > strstarts()/strends() if required can be performed.
> 
> I don't understand this last sentence.

It's basically repeats the idea of having only one pair out of two.

With this series will be

str_has_previx()
strstarts()
strends()
strprefix()
// potentially strsuffix()

To me seems too many for the similar task. I understand that trace user is
special one, but does it use strstarts()/strends()?

Despite on naming I think we just good to have only str_has*() and one of
strprefix()/strsuffix(), strstarts()/strends().

-- 
With Best Regards,
Andy Shevchenko


