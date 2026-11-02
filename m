Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637581;
	b=sM/GkgzvMO8TUDRhPpNFwvnrQzKO/lbi8zoSfPgUB1qP3c3gCYq6CqkEYdwH9KqaFJV/
	 dgHXMbtnXaFkyFQvOKqQ95lA5NXxvRlDXPf+0tDsS37SNLdlc7MEQmNxcD6MxztBLsZUZ
	 cIZRlSFcZX+PpGH/x5/VCCDTbEoPoabJw3T2ZvDYhCvlS11sgBLqJdfKes2QU+yCbcxxZ
	 tlTy2fBC2aGeTLzh3tDEBSDuIa5jc3DToW2L8vcskVwFj/OHfe6bxvpu84h+3tF1TmMtS
	 Hy6YFEfOBdP6y/U2p1NcK3Y0Cj4DkAM4IObrmvyG/kZ+uND3qBPTPIUICTXVQ1GXLSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637581;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=2gusUduchRqEonlGBJHA8gtRcetBORHth6y/vTsWQmk=;
	b=1tMLvvK6TEUBYC8roYMAPYeRl4quxsOC0O/cWjLwO7U8ONWeVRuw7hGJnUeB8b/PEWAP
	 iMgXuXkgLpPV9jFe5HegmXz8+KLKibc9IEkS8f/ZVCCHkpU9Gon1JpB40LYa8gtKf9Djq
	 xkCoqmBb12nWLDrvP3pYwrML1djFSGZxk9xaykzUeOGmKU+sKjnzBlebxmipAGr7Od4+G
	 sJE88jVQBTzPj9eTcP5PTkNasoEneoJ8ie7SpLi6FwdU+DEmSMhB1wdJWJgfL8b16whZy
	 lhJV4r45uYskyMuqj+eV3VnHsfDdIIhKNse8mzprrxkNm2pXna/RZ0uzKCzVh/lrmpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="0s3/Q4F+";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hiNQYyDT;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2FC606B0F9
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 16:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE2FC606B0F9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0s3/Q4F+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hiNQYyDT
Date: Mon, 2 Nov 2026 17:39:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793637578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2gusUduchRqEonlGBJHA8gtRcetBORHth6y/vTsWQmk=;
	b=0s3/Q4F+bmgU8FT6zC8WHy3an8F4Zzml8l6oBU2Scq/CT750rvg0Ww/kxI0fPWWowHR9Ly
	RRGLVL8oWbDb2diSzCkBBLI9lrtsOx+9ciw+PuwUWTB2F8+DAAaYEU0O68jRrH97umQPIT
	7Vu616FBU5OXlb4RRf17B2w6av8b81kYVK3WE0P+pN5MGEhBUzH6npzhdFBLirmiTiunwB
	az+GjST3TgtOTvzxmzLqM42oTBSPN0ceRjdHtrGI8IYHeAdBxw//J1Tx1nD59p93bi06fu
	fAxrHaiCoC9trO44EcfH07f+/88DpoNIq5y4pR/HP8c/iYIw06/tAi4rIp/WjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793637578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2gusUduchRqEonlGBJHA8gtRcetBORHth6y/vTsWQmk=;
	b=hiNQYyDToDuZRNHlVtQt7Kiktw4q/8q0KHGxux+W9oQifa3h+sel7quIS30vyx0BdEHqf6
	Jj2SUVxm6OlcCQBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	"Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andi Kleen <ak@linux.intel.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH 1/6] irq_work: Re-raise pending irq_work after system
 resume
Message-ID: <20261102163937.KwllF-Pg@linutronix.de>
References: <20261102074039.26983-1-adrian.hunter@intel.com>
 <20261102074039.26983-2-adrian.hunter@intel.com>
 <20261102090604.GR1779021@noisy.programming.kicks-ass.net>
 <74511f6b-f5ff-498f-bf97-ebdc86c43d24@intel.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <74511f6b-f5ff-498f-bf97-ebdc86c43d24@intel.com>

On 2026-11-02 12:54:22 [+0200], Adrian Hunter wrote:
> 
> Yes CPUs remain online for suspend2idle, but currently the choice between
> suspend2idle and "deep" (S3) suspend is a user space choice,
> refer /sys/power/mem_sleep.  Many modern systems do not support S3
> anymore, but it has not gone away.
> 
> > 
> > Anyway, I'm torn; I would much rather make this trigger a WARN and have
> 
> AI now also identifies ftrace, BPF, GHES NMI, and #MC as possible causes,
> not just perf.  I haven't tried to confirm any of those.
> 
> And, belatedly, AI is now saying an irq_work raised before lapic_resume()
> might result in #GP if the APIC is left in xAPIC mode at resume.  Also
> not confirmed.

Could we flush this before similarly to what happens during CPU-hotplug.
The question is if this event can stay enqueued during suspend (and
handled on resume) or should be taken care before entering suspend.

Sebastian
