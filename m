Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889774;
	b=072a+/L1hznwIfxvkzxFe9kKPPms98O6q6dXYY/wBt9f+ED4v10v97pCnUCd/eMo9g7j
	 +wHO+DpWYSDVVYbqZB6yh1cIvIoCvUvmFUuja2vT0m5Wid1snIw1hrizfRIycuYkcDFkh
	 DbuANnoV2+tyvrHxcUNQyNuV1lGIzqDvVXIXwXPQefWd/1jB82w+ZwXASYWaEJpFauAf7
	 tYVu6H5LhLoSURGuVCkhbria3vW3WXbTZI5ctPcT47rWQz3R2Ssp84fgyO2D4SyoYh5GK
	 p4DDVIDURf3czy7QLL/8smVXfKja5bB8Ad7Xi6w5c49OSamTexz+jvihBc7IjJICV6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889774;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=c9Qf0MhLQySpDb0sxxGf8i7JyLqINcuxDoFglNVjBEk=;
	b=nKnyzo1GEVji7bisxS86HwHDetDtAo0P+HXAr4ps2if/32J3lBwM9bbrFJq8mKi6GxtS
	 8WcfBSKbhKFKFhb4wOsS2PykIMzDAyhJdtyojoAGhfI9ixTX5KvxHQeIY35LuRWCjmNSg
	 PN0boJu0zz7krjdfqeVELlF3tpZj2vQVytMvup5NA7FRhJlwCqGNTxnuovoyjzTbs1Afm
	 6tlRYY1noAcJrZ7SPGNxaGRzL/B98na+31Ns/XxYhxz+42OGssO7s61axbq1vfNQFnvc6
	 fvzTlEXvMnHZNiWS/YJIktdrfC+t0B14jlDBmLRjIT8kQVTBqX8JI3g+qJU40WZ4cMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TtNHb+cv;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9955606A332
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 14:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9955606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TtNHb+cv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793889772; x=1825425772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q1Pf8PUf4xOcPF8BGZqTYGEzo2UCfvkkF5uSVw81asg=;
  b=TtNHb+cvhkcf/bVYIY15eH9A49MHzcUPcV/CG/mzmgOwuRNiKipn3HPP
   PUl2UPivlxtiknv2RVaYaidHiu58t2fKZQzCrKNTkHstzXEUGjR5+gtZc
   +c5SXdp3FJN6GU49DrItOIdXjRxiUfqinpc1DlZVuY8PPuIRScDAk7TGa
   Zp56oAeLBa7HkB0WlGKL72y49PE7rf4Z11DhWtJX1QQLnjIm3j/7s5cOQ
   a7s4/kL0SHQIu5THeyY5t5+Wrw/EZI5Utxv/irZ9FKw/9V4swY9xUjRky
   jRx2EFVhSOzeTEpQuu76yjkJ23EQsJnIPzStihoCbGtlLPdk0yguuYu4i
   A==;
X-CSE-ConnectionGUID: EJ09EDnETc+kgfTUVEEhCQ==
X-CSE-MsgGUID: XqXZDYlOR4OJG4ab9eKCPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2698344"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2698344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:42:52 -0800
X-CSE-ConnectionGUID: XAthWtFQSBCLu97ShSJCOg==
X-CSE-MsgGUID: DhogsxNKSDyJ0JhxnZuhSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7198542"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:42:45 -0800
Date: Thu, 5 Nov 2026 16:42:43 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org,
	Andreas Schwab <schwab@linux-m68k.org>,
	Andy Shevchenko <andy@kernel.org>,
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
Subject: Re: [PATCH v2 0/2] Add strprefix() and fix a bug with it
Message-ID: <auyV47xUCr1EJ7A3@ashevche-desk.local>
References: <cover.1793876837.git.alx@kernel.org>
 <cover.1793882260.git.alx@kernel.org>
 <qwpovcqznx6eltou4inmj3v62qhh6ouvihqnze7bobnd7lmcbw@rcri4e623icb>
 <auyOkL1Vb1iKicS9@devuan>
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
In-Reply-To: <auyOkL1Vb1iKicS9@devuan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 03:16:45PM +0100, Alejandro Colomar wrote:
> > Date: 2026-11-05 15:01:22+0100
> > From: Bartosz Golaszewski <brgl@kernel.org>

[...]

> > I have no idea what causes it but I'm getting so many patches lately
> > that are subsequent iterations of a series sent with In-Reply-To: header
> > pointing to a previous thread.
> 
> I don't know what others do, but in my case it's a conscious manual
> action.  I use --in-reply-to in git-format-patch(1) to make all
> revisions of patch sets be descendants of the cover letter of v1.
> 
> We do this in the Linux man-pages, as it helps me keep track of all
> revisions of a patch set easily in mutt(1), without having to follow
> links or use more-complex tools like b4(1).

Exactly the same reason on my side to *not* put everything into a single
thread!

> > Don't do this. Each new iteration must be a separate thread. Please use
> > b4 to manage patch series.
> 
> I won't use b4(1); I like bare git-send-email(1) and git-format-patch(1).
> But yeah, I can send them as separate threads, if that's the preference
> here.

Yes, in Linux kernel majority of the maintainers (a bit of speculation,
I haven't counted, but it feels like this to me) do want separate threads.
IIO with a huge traffic is one of them, tty/serial IIRC also does because
it's how Greg's workflow is set up.

> Out of curiosity, what's the benefit of having separate threads?

^^^ See above.

> (Or the converse question: what's the main problem of using a single
>  thread?)

In mutt for tracking I often delete the old email threads when they are
considered closed to me (or archive, if you wish), I don't want a blast
from the past for this. It's like starting fresh on each Monday :-)

> They're morally a continuation of the previous threads, which is why it
> makes sense to me to have them as subthreads.

The email thread with big patch-series and discussions looks awful
in such a setup (my opinion).

-- 
With Best Regards,
Andy Shevchenko


