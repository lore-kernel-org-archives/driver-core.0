Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636152;
	b=acYnuolGPb181tLeHfemLdYQ9IPG6hC+XxFpqbX5Wq4zcGuHgQ61jbV9wEmlZsR7TUIH
	 1kIrajfjX800nn6PQWfdMNEUJWvPIzcjf1ckxrk1WjdnePaSuMgNaYaDS7tBGR2zJ6TyT
	 8AnjIPtvedZtTv0C7vVMXZZNWCTmtDJEk1BGUP1a2BfBapj8nPnfpQJavUWaBq5okc2yX
	 GYA2rBTw24lG/hZ5sam1HvN9IxkL1aaeLzIca+BO8WqC2f+UPcCj8Cmce92EwHDz255Im
	 GjcNgBK2Bevpo2Rfg9DGLHxHImox8mbBRhrXzJOGXOI5GJL9f5VpenqrcUdW+FugorA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636152;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XmzZN/QhjlzcSaertRL7UUmB+mzbbmbqLS9Rd6E3UxI=;
	b=hWTmA2XP5cg1BeoKOYzFtievAAE2YBbvK6bTeJGOJq/TY9JPOzQGE0dvrTlGLTaZGG/H
	 Ce/yQTZSd0VDrYxDGZR31cO6n9aMiZOOP1gT5bAs19CyFy2WcxvZeQ1kSZYbaQACOgKK5
	 Qyr4x22AYM0KKRlwk6QVNOaN/tXgJSkGlBlD9X6X4JV/9ubbUT8lA5bQI22V1/YAFs8KF
	 6THTvWvX73SAY9VGhNqYDTtR8/CYTEF4l6NjgXkyvkqiHJydJNUi3Tda9W+eif7oKrK22
	 TFcjs8gHDLYKudqecd2rJ4LCvSNu/w2m24E/SU0yP+sbkWyXIU7GCqh44s3GcWx1/AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=daR8aUFy;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22764606A915
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 16:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22764606A915
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=daR8aUFy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793636151; x=1825172151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gkPgrxM1TwjKtf3tbno2m9G3lnciTVHEcOozD+OD7mQ=;
  b=daR8aUFyhcjTu4mDVnhIeCgLu77v+U0n7X7FWv0Nhhp9cagF3PSk934H
   r+3FMNoReTudxj3qhkP1YNZBJNElknZS2EpiCSBzDIhTXIq3o2AFS4ilp
   Q/63WL2niBOj18TOKAbJ4dho8gPRm2XVThSagI8ACstAe8e4Vcpxi33OJ
   Soo+b9EoE4eLPw7ilsa8bA98WW18TYaO0WrPvnSUNZai4sZcE7Fmst9qP
   4AHMkTtjtHcffeGun0iduLbRvtk1J1ROKg1NG2SUv4iQV8v6NY0fca19X
   ES48yjfdEiOxT9doajbC7YMk9l0eF9ojW5gUsKdAKfpTKPPy67uxEkOxi
   Q==;
X-CSE-ConnectionGUID: 2eTB/+yMTR2RqsiQfUhgfA==
X-CSE-MsgGUID: 9Tc9a8b+QpKMhGxnAgJFBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2245179"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2245179"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 08:15:45 -0800
X-CSE-ConnectionGUID: vS5QyT21QpqixrBKTRYX7g==
X-CSE-MsgGUID: tru8nSpATcafRTdDojd5mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6175887"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 08:15:44 -0800
Date: Mon, 2 Nov 2026 08:15:43 -0800
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
Message-ID: <aui3L0ppW-cBBo1W@tassilo>
References: <20261102074039.26983-1-adrian.hunter@intel.com>
 <20261102074039.26983-4-adrian.hunter@intel.com>
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
In-Reply-To: <20261102074039.26983-4-adrian.hunter@intel.com>

> +
> +/*
> + * Tracing must not continue into a kexec'ed kernel, which may reuse the
> + * trace buffer memory, so stop tracing on all CPUs and prevent it from
> + * being started again. Events are left in place, but record nothing more.
> + */
> +static void pt_syscore_shutdown(void *data)
> +{
> +	WRITE_ONCE(pt_shutdown, true);
> +	on_each_cpu(pt_shutdown_cpu, NULL, 1);

I don't think adding more and more broadcast NMIs to the panic path 
is a good idea. It's always a very big hammer and a risky operation
that risks breaking the actual dump. panic reallhy needs to be
simple and reliable, and this is the total opposite.

KVM already does one at least (which I never liked either). At a
minimum please find a way to consolidate those into a single
one (as in have a notifier chain that is called on the target CPU).

But better would be to not do this and find some other way.

How about just passing the PT region as reserved and maybe free
it later after the target kernel had a chance to reinitialize all CPUs?


-Andi
