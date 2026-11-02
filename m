Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641560;
	b=2YZhpJ3gpWsQKhH/QOGmJIuORPc2Pkf5TnEKb9Y+6IbKjZX2slXi+W77hUDUNcM4Pvof
	 H0Ajz+dmIVcIn2Rrwhji6OzvFIAOsar/5L+F5zfH7YsuFKWQGskQzvb/YEp/dkzgx8Rvg
	 8E/LHCQCJGCne/iSak9sQp1fu0HqQ3Nh4UMwfSXGNomrI9yTtKyDvvfDkiHugXPZv2hH7
	 XqmcK03Sv3qAK68AMXkrLkUXdQ5Is4vkA5snIsOErm4PHqne0Q3PiYEYsXbf0VjXa3Df7
	 7G1ebUTnFME6NLYPNeBP1HFig9UgGTGCiqcQaxzS3xuxLAf1P/WDiI/E10ioA9zAOvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641560;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TyrupP9HlfXQmjG2GxRqzTa9XeQTSyEAkYuFINjOMic=;
	b=EX5tQF6J+O4+tWWhge8gC9NcsqJMWZbke935wk6IXrLG6NtPa9t4ImG7m+wJonIRT9Sz
	 24F1k02LJQE/ejpZdecduOJWvF3JV0a2mG3k5QW8WIqdtCGdDerggKQU5gNXl0BHMGjso
	 L27a40GhcjWdsUXN26iMq1arYK90TuKJ4X+xp0uLgly37J251e31h15ShcujzW7M+dVg1
	 spDmYfbnyytFshd2a67NNVe9J/3557iF9c69ZgZaNzhBucgIRNXuB1W3lQ029Y5TK7sAk
	 OoXPFC3U7Zl4lnXvwQnnB/59h3bycOF9ZayOhaVgnEohrkfO28bpw88nfR/yDC6m7yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WaQvC6z4;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD7A607465F
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 17:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BD7A607465F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WaQvC6z4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793641559; x=1825177559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uD19Fb5fdpt/7jRuUUbcNI5DvCbhjKMzTNkgHXyTE6c=;
  b=WaQvC6z4FauonGDwhpFAa1hfO98oRSCMclYVUkX4htL7IxtgJajQm+2y
   2i32r8TfFQoiDj59xav6Lk+oZaGdzJ+8h7rtns/40mWxIsHC4EGx/SEqc
   VqrpX4ghPhEdPw7CmJVOx9IekSdA+7JjyM14RgOj8yntLKrHbCwEgrjoO
   0xiBeOxW0KjWIf5bEehS/jIFYO98g0MyHn+pOGU24QMDOx2zDR4yGwF2l
   NG25G4kG8O4axtJ+bhgRkTA4b5QPl7+u693iV72A5mgfKRDk7dzFZgAVY
   +Mn3XJMZocn6AyA+77iQi8aZSfxKVCgVxQEqB1iCHE0WMA+BsMDtk+AcS
   w==;
X-CSE-ConnectionGUID: 8h5fSLjjROa2yhPJpfAJjg==
X-CSE-MsgGUID: 51BoBcUgTk6T2GRxbMPwLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2375576"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2375576"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 09:45:59 -0800
X-CSE-ConnectionGUID: hzN+wRsuQ6+Zf5DjyDJwTg==
X-CSE-MsgGUID: wfp7iaEFQUa/aOEfGKH1AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6570948"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 09:45:58 -0800
Date: Mon, 2 Nov 2026 09:45:56 -0800
From: Andi Kleen <ak@linux.intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	"Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 3/6] perf/x86/intel/pt: Stop tracing at syscore shutdown
Message-ID: <aujMVC0_8purXK5k@tassilo>
References: <20261102074039.26983-1-adrian.hunter@intel.com>
 <20261102074039.26983-4-adrian.hunter@intel.com>
 <aui3L0ppW-cBBo1W@tassilo>
 <a2108322-0c88-48e0-a10f-77ae2556bcae@intel.com>
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
In-Reply-To: <a2108322-0c88-48e0-a10f-77ae2556bcae@intel.com>

On Mon, Nov 02, 2026 at 06:27:30PM +0200, Adrian Hunter wrote:
> On 02/11/2026 18:15, Andi Kleen wrote:
> >> +
> >> +/*
> >> + * Tracing must not continue into a kexec'ed kernel, which may reuse the
> >> + * trace buffer memory, so stop tracing on all CPUs and prevent it from
> >> + * being started again. Events are left in place, but record nothing more.
> >> + */
> >> +static void pt_syscore_shutdown(void *data)
> >> +{
> >> +	WRITE_ONCE(pt_shutdown, true);
> >> +	on_each_cpu(pt_shutdown_cpu, NULL, 1);
> > 
> > I don't think adding more and more broadcast NMIs to the panic path 
> > is a good idea. It's always a very big hammer and a risky operation
> > that risks breaking the actual dump. panic reallhy needs to be
> > simple and reliable, and this is the total opposite.
> 
> Is pt_syscore_shutdown() called on a panic path?  I can't find a way.

It's called from kexec which can be called from panic.

> 
> > 
> > KVM already does one at least (which I never liked either). At a
> > minimum please find a way to consolidate those into a single
> > one (as in have a notifier chain that is called on the target CPU).
> > 
> > But better would be to not do this and find some other way.
> > 
> > How about just passing the PT region as reserved and maybe free
> > it later after the target kernel had a chance to reinitialize all CPUs?
> 
> Intel PT has cpu_emergency_stop_pt().

?
