Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E31E3DA7D5
	for <driver-core@lists.linux.dev>; Tue, 31 Mar 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944135; cv=none; b=PPVcLj+j+m2YZ51wfd2DzoIbDx7t5jte0cA1kMuETv3T6r6ADCvJQJNquHuo2FgnlPAeXXn18ek9OWkT9n7ej8uDLZUePZt7ekYCgsoP5BgyiVh7jmoZDkVn7+5Q/jlw+lWD7vutdnOpsAc5uYHPkHzc0+zE6SXzwzAtYAGnxdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944135; c=relaxed/simple;
	bh=XtNYc2qP1eiUp5JnrJI9cDtMe9sjxEtm602IJHUnYLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5Vqyr8PAnsb72W6LvjQjtXbt6h0VCaq3/ZEuHUM1nEMz9NMTm4quJVvESivpgVwwK3vo0a+Sm5afdtUKevz1tTiijLN2Zp6l8fsgeG7LMcbwiwUEZ+aD+/FXKdLEs+EQj1x1DSKbo0XqroYEfPgUhJmHdWMEda2nPHuMRLCV3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gf1c7xXo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gf1c7xXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774944134; x=1806480134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XtNYc2qP1eiUp5JnrJI9cDtMe9sjxEtm602IJHUnYLY=;
  b=gf1c7xXoA0MJFFkQjgIEF0Bxa7crPdXGq8qs+ZH7gW5VyLipxVQM2lHx
   fWPSVWS4gM/bABzPT3HgqYMTElfGMlmmECDc1A4CdSNlZlb3EVKvuJLWY
   fHwfBA1G48yK7/41Qn122RkQL7VgSvz88gM2o5ivfRsUyRbQ3UZRPcIny
   M9kOi+44iSIBSfHOpD8+7yemg4NqlSU6TuKZtIhMPpil6S643Lnykpp/x
   /7khqy2+KjjJh26BwGTxzeQIIsgFz6YTG0ZVLSxqo1IJ3PYXcrwnv/IRG
   7s8EYpU0attuppx/QJzWjev+kZUevJjDSz/HgALThUEAhP4S+1yQ1ryuq
   g==;
X-CSE-ConnectionGUID: 50MNelL9RfqP5YbQ01xMcg==
X-CSE-MsgGUID: q/0c/9DEQP6ouhPT1VZZuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75120808"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75120808"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:02:14 -0700
X-CSE-ConnectionGUID: slSNnCSxRti51WU6Zahqxw==
X-CSE-MsgGUID: Dq1cBZR9RYaqYG+Ny/53zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226263143"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:02:09 -0700
Date: Tue, 31 Mar 2026 11:02:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2 3/4] software node: verify that property data is not
 on stack
Message-ID: <act_f13eyaBPrJ-w@ashevche-desk.local>
References: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
 <20260329-property-gpio-fix-v2-3-3cca5ba136d8@gmail.com>
 <acpRi0BOgT73pqpE@ashevche-desk.local>
 <acrvakIBxO76OAlU@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acrvakIBxO76OAlU@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 30, 2026 at 02:49:52PM -0700, Dmitry Torokhov wrote:
> On Mon, Mar 30, 2026 at 01:33:47PM +0300, Andy Shevchenko wrote:
> > On Sun, Mar 29, 2026 at 07:27:50PM -0700, Dmitry Torokhov wrote:

...

> > > +	for (prop = node->properties; prop && prop->name; prop++) {
> > > +		if (!prop->is_inline && object_is_on_stack(prop->pointer)) {
> > 
> > I read more about this... Any code that uses vmalloc() (or potentially may
> > switch to it from regular allocator with help of kvalloc() and similar) will
> > fail now. While it might be no issue right now, this may become a such. So
> > with this check in place you put a requirement that properties can only be
> > allocated from a kernel low memory heap and not vm.
> 
> Can you tell me more about this? As far as I can see it will actually
> have false negatives with CONFIG_VMAP_STACK, but should be OK not
> trigger with vmalloced memory... But I am genuinely interested to know
> more.

I dug into the history of this macro. It was added for the block and ide
subsystems to make sure that there is no buffer supplied that may not be DMAed.
As we know vmalloc():ed buffers may not be DMAed. In some commit messages
it was explicitly mentioned that this macro fails on vmalloc():ed memory.

Note, I haven't checked the actual behaviour by trying that on the HW.

-- 
With Best Regards,
Andy Shevchenko


