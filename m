Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777544;
	b=baErOF6foXmU6j+iyRjBK8iF/ANP1DTqQpsp6mBy6NoB4P+7gMSPfuoYdE4yELU6GipS
	 AatcCbsY60D8hSQUX61834G/OX50oSmU/12kOeqZW58pLvFhlu3EAzgEKniqNHadI8SMm
	 ZX8fjRibXp9P4s5i54YXpkPWBLJLFFg9gNSZtw7I13dkzAF9DZNQS8AAPJCUGffi4pho8
	 ojymFAqgl6QZj/H3wVyTFOY7OBg4lsYm2X/sHjkkdDkGaY6y13eqFhc1eGwrUBAjOvHB3
	 5JtWA5xtMqL1VfdB+swsVAIrVbF7T7fFtmqqzbEmRPm4eaUE1HHWGWcHyJy+ZiWPloA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777544;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FTuoz+Tu1ZqVAmMASax5Vg8xqu9+VRz2AqfqKkE/of8=;
	b=ItBXrw8+ouiELUADOK1TZsrtMo8xmsXF3hRtzdFj2fu1z00SVlOqpXVQkKr/oXhxvbV7
	 vvpQi4kguNrNpYJT09J3+bjlVcdwgRCBq4CBHdGztduTfRyNz24oTON1VM+QZtS42j5L8
	 QUiHGYZOrWCdvpgWJTruumFOX9+6LXREXg20BOOgpuyF+/Vf6PZFm5NTl+a2A0w1+lYd4
	 knhQW6g3bTL4Nfzkoeo1gTwfBpPvMbctMT3PAM6jzbGHpAw9ZuQSONvKk011GSH9zZYKt
	 ty+2QcWD9Vq+tGxHTWal6uIlyVwB8HOOQXzC5WYT3Q8HTAbJ61Jsap54QRqg0neCshQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XH3LXEsZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VAkr93B+;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D80A606A31B
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 07:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D80A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XH3LXEsZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VAkr93B+
Date: Wed, 4 Nov 2026 08:32:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793777542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FTuoz+Tu1ZqVAmMASax5Vg8xqu9+VRz2AqfqKkE/of8=;
	b=XH3LXEsZmyZjYlk3Ntq6SZFFLSphhKRezZCOR9FpoOpYqKxDRBAqPylJyxHoxidC/fat4d
	JM+AnI3UvD310wrBCL8hOKotKn8QjJsgAJrA4Tqs1GSmi6qcqfKMYx2fW7f+bsbor/oLfA
	Tb9WKo6i6aHUQSXOyqej6WkFiMYEfC/AvqB9K41Gea0XSHyTJQsqQiXY8ApoGuE2VvfPue
	pJenrF+P4Isat0Y1/FRNpwSpknoN8oGKMjk2C+cMqRqf6d/VzoVu4Rm9Iqh5xoa2f9ZXmh
	OcHlmOzs/Iktr46mlx+LmhWb+HeW2uG6GsNiofui7oMkZcmrorIJnLGblkR9/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793777542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FTuoz+Tu1ZqVAmMASax5Vg8xqu9+VRz2AqfqKkE/of8=;
	b=VAkr93B+pVAxcXeHVdFUneBrvYF2MbIFQ9wvH5xIKwwRBbzMqLFo2lozUkzIu8R+I8XHqK
	IfvDtLfCkuzJg5Bw==
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
Message-ID: <20261104073220.Hgq4chT1@linutronix.de>
References: <20261102074039.26983-1-adrian.hunter@intel.com>
 <20261102074039.26983-2-adrian.hunter@intel.com>
 <20261102090604.GR1779021@noisy.programming.kicks-ass.net>
 <74511f6b-f5ff-498f-bf97-ebdc86c43d24@intel.com>
 <20261102163937.KwllF-Pg@linutronix.de>
 <2d6105b4-bd75-41b5-a7b2-da91bda31350@intel.com>
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
In-Reply-To: <2d6105b4-bd75-41b5-a7b2-da91bda31350@intel.com>

On 2026-11-03 17:46:32 [+0200], Adrian Hunter wrote:
> On 02/11/2026 18:39, Sebastian Andrzej Siewior wrote:
> > On 2026-11-02 12:54:22 [+0200], Adrian Hunter wrote:
> >>
> >> Yes CPUs remain online for suspend2idle, but currently the choice between
> >> suspend2idle and "deep" (S3) suspend is a user space choice,
> >> refer /sys/power/mem_sleep.  Many modern systems do not support S3
> >> anymore, but it has not gone away.
> >>
> >>>
> >>> Anyway, I'm torn; I would much rather make this trigger a WARN and have
> >>
> >> AI now also identifies ftrace, BPF, GHES NMI, and #MC as possible causes,
> >> not just perf.  I haven't tried to confirm any of those.
> >>
> >> And, belatedly, AI is now saying an irq_work raised before lapic_resume()
> >> might result in #GP if the APIC is left in xAPIC mode at resume.  Also
> >> not confirmed.
> > 
> > Could we flush this before similarly to what happens during CPU-hotplug.
> > The question is if this event can stay enqueued during suspend (and
> > handled on resume) or should be taken care before entering suspend.
> 
> WRT "might result in #GP if the APIC is left in xAPIC mode at resume",
> the systems I have checked restore the APIC in x2APIC mode, so the
> issue is theoretical at this point, although I can get "unchecked MSR
> access error: WRMSR to 0x83f" if I deliberately add code to change
> x2APIC to xAPIC early in S3 wake (in x86_acpi_suspend_lowlevel()),
> and then do:
> 
>   perf record -e power:suspend_resume --filter 'action == "machine_suspend" && start == 0' --no-buffering -C 0 -o /tmp/x.data &
>   rtcwake -m mem -s 10
> 
> The error can be avoided with:

I meant flush it via irq_work_run_cpu() like in smpcfd_dead_cpu() (the
CPU-hotplug path) and not go via APIC. You should do it late once the
interrupts are disabled so no new irq-work can be enqueued.

Sebastian
