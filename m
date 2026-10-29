Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256099;
	b=noX+YOIUV2PNA2f0cdQQ6eOXN/t8zlNGVgwjHvdOnwrkFdOCVM8hI+3I8EDTl4lIPLuI
	 ZxClDz7AR2UeMpm2tlQQgVtHA2WyxspBDFeP2b6EU0Iv5hi2Gjd3ZMTQaOEihBwlTmnYk
	 rfUwsGCCH1jMHPR5xJhM6n+IVOc+Ib6FAGDPFdzbNQKRcC1woLsLIuFqHWa+9FgSA9NlV
	 chXWMyQfyhljUzh3ctTi5xRbCfygD92dG47bBKuRoGMkyuQttaSduGajaqyWhDTWbRpJN
	 KO68jq3XKeSWnvu6ZfYyzWCd3kJ3WydQOW1TPRJcMXz8uRao+mcQsMWYw201j9CbGIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256099;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=1fRkcPPZf3GRXHO4ESzTpvDN2Bk0jNdrFWuzyySONUA=;
	b=RcqCk8l8aFKPMbPuZJnVutiPCvio8zy6JcTWb41YJ13t3gU3ytqOQD9B2yeLiAW6sb/l
	 vjVo2KVvHR343A2JblsYHSaOUWDYChVCxWkuc5z62+EMIbLMsk/5miZy4Lkq4/3nS+JPg
	 TXt4q9gBKkbTzOQrqV5UqJSlh/8X8IWq2eh8OQVoxMGdYF3f9rzS9gnHsj4eZYSf5AoIw
	 ob/Hr68koWTVkNLplFhkFlNy+8SSwXHjZx/tgHYGfaBonpQUxuDe06Wi1/HEsRV5/2T4S
	 XpJxKhHRQpiEkMaHnKhVVw2g4ER8Tbnrze2eAo3Da6XLN7ZqbLlyc4oQhAO4x0ic7jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fdrhF15f;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED385606A31C
	for <driver-core@lists.linux.dev>; Thu, 29 Oct 2026 06:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED385606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fdrhF15f
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793256093; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=1fRkcPPZf3GRXHO4ESzTpvDN2Bk0jNdrFWuzyySONUA=;
	b=fdrhF15f/1ewO/hJDdsiNqyASahN6YMalKrJ0sWJOspAQBy/yu9JTTZR36J5d6pFxZlx3dG5Mj8DG6fHu7ZlgxSRXRfI7og0dF2oMEZ7oujbhjqF8p2AVpIOCsGIgfJm45t/8JT/TwvzXWKY6wxKnnDAeuYo9erwUwu6s0vfZus=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=peng_wang@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XDibYLE_1793256091;
Received: from localhost(mailfrom:peng_wang@linux.alibaba.com fp:SMTPD_---0XDibYLE_1793256091 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 14:41:32 +0800
Date: Thu, 29 Oct 2026 14:41:28 +0800
From: Peng Wang <peng_wang@linux.alibaba.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
	He Rongguang <herongguang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] tick/nohz: Add a policy dependency for full
 dynticks
Message-ID: <auLqmMdd8RIdf6st@U-3K7XLPQ6-0046.local>
Reply-To: Peng Wang <peng_wang@linux.alibaba.com>
References: <cover.1792242566.git.peng_wang@linux.alibaba.com>
 <58bc33cb018a2651e9cc3fc02baad7de4d543705.1792242566.git.peng_wang@linux.alibaba.com>
 <att2hiYaaHTIkzG9@localhost.localdomain>
 <atuMJiJEwbzGjiu4@MacBook-Pro.local>
 <auIbt5JAC2cHw5jr@localhost.localdomain>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auIbt5JAC2cHw5jr@localhost.localdomain>

On Wed, Oct 28, 2026 at 04:58:47PM +0100, Frederic Weisbecker wrote:
> Le Sat, Oct 24, 2026 at 12:32:38AM +0800, Peng Wang a ¨¦crit :
> > On Fri, Oct 23, 2026 at 05:00:22PM +0200, Frederic Weisbecker wrote:
> > > Le Sat, Oct 17, 2026 at 09:13:41PM +0800, Peng Wang a éãrit :
> > > > Cloud hosts may pin vCPU threads one-to-one to host CPUs. At full
> > > > allocation this includes the housekeeping CPUs, which always retain
> > > > their non-idle tick. Operators want comparable performance for otherwise
> > > > equivalent vCPUs. Retaining the non-idle tick on nohz_full CPUs as well
> > > > avoids one placement-dependent difference in host tick interference.
> > > > With spare capacity, selected CPUs may stop the tick to reduce host
> > > > scheduler-tick interference with vCPUs.
> > > > 
> > > > Allocation changes as VMs are created or destroyed while other VMs
> > > > remain running. A vCPU thread may be the only runnable task in either
> > > > state, so existing tick dependencies do not express this policy.
> > > 
> > > I'm not sure I understand correctly what you are trying to solve.
> > > Are you saying that you want to keep the tick running when there
> > > is more than one vCPU per CPU? Because the scheduler already takes
> > > care of that.
> > 
> > Hi Frederic,
> > 
> > No. We pin vCPU threads one-to-one to host CPUs, without
> > oversubscription. By "full allocation" I meant that all allocatable
> > host CPUs are in use, including CPUs outside the nohz_full set.
> > 
> > For example, on an eight-CPU host booted with isolcpus=nohz,1-7,
> > CPU0 is outside the nohz_full set:
> > 
> > - With eight pinned vCPUs, CPU0 retains its non-idle tick while
> >   CPUs1-7 may stop theirs. Retaining the tick on CPUs1-7 too avoids
> >   this placement-dependent difference in tick interference between
> >   otherwise equivalent vCPUs.
> > 
> > - With seven or fewer pinned vCPUs, we can leave CPU0 without a
> >   vCPU and keep them on CPUs1-7. We can then allow tick suppression
> >   on CPUs1-7, subject to the existing dependencies. This gives
> >   these vCPUs a common tick policy while reducing host tick
> >   interference.
> > 
> > If the vCPU on CPU0 is released while the other seven remain
> > running, we allow CPUs1-7 to suppress their ticks. If a new vCPU
> > is later assigned to CPU0, we retain the ticks on CPUs1-7 again
> > to avoid the difference in tick interference.
> > 
> > Throughout these transitions, CPU1 can still have its original
> > pinned vCPU thread as its only runnable task. Its runnable task
> > count does not change merely because CPU0 gains or loses a vCPU,
> > so the scheduler's existing tick dependency cannot express this
> > allocation policy.
> 
> Ok now I understand what you want to do, I just don't understand why.
> Why it matters to turn off nohz_full on all CPUs when vCPUs run on housekeeping?
> 
> > > > Add a per-CPU POLICY dependency within the boot-time nohz_full set.
> > > > Permission defaults to enabled. The policy can be changed without
> > > > taking CPUs offline. Revoking permission uses the existing asynchronous
> > > > kick; granting it leaves all other dependencies effective. Preserve
> > > > POLICY across CPU hotplug and report it in tick_stop tracing.
> > > > 
> > > > Idle tick suppression, nohz_full membership, context tracking, RCU
> > > > offloading and housekeeping configuration are unchanged.
> > > 
> > > This still keeps the overhead of nohz_full even if the tick stays on, right?
> > > (RCU nocb, kernel <-> user overhead, etc...). Isn't it a problem for you?
> > 
> > Yes. Our setup uses only the nohz flag of isolcpus, without
> > additional housekeeping affinity tuning. Context tracking and
> > RCU callback offloading remain enabled when the tick is kept
> > running.
> > 
> > We have observed a performance benefit from this nohz_full setup
> > with our database workload running on pinned vCPUs.
> 

Hi Frederic,

> Do you mean that your database runs better when hosts CPUs are in nohz_full?

Yes. In our database tests, suppressing the host's non-idle
periodic tick improved performance, with the rest of the host
configuration unchanged.

> But how does this new interface help? Ie: why is it worse to have all CPUs in

The tick policy itself can therefore affect guest performance.
A large host runs VMs for many customers with different workloads.
Customers create and release VMs independently, so the same host
CPU can be reassigned to a different workload while other VMs
remain running.

We want to choose whether to retain the non-idle tick or allow its
suppression for the workload currently assigned to each CPU, and
revisit that choice when the CPU is reassigned. Per-CPU control
lets us do this without rebooting or taking CPUs offline.

> nohz_full except the housekeeping rather than shutting down nohz_full
> altogether?
> 
> Or to put it another way: why is it better to have either:
> 
> - all vCPUs on nohz_full host CPUs
> or
> - all vCPUs on ticking CPUs
> 
> And why does it hurt to have a single vCPU running on a ticking CPU.
>

If a VM's vCPUs span housekeeping and nohz_full CPUs, some may
benefit from tick suppression while others cannot. For workloads
sensitive to tick interference, this can cause performance
differences within the VM. A common tick policy is one deployment
option in that case.

In summary, the runtime control would let us:

1. Select or withdraw tick suppression as CPUs are assigned to
   different workloads.
2. Apply a common non-idle tick policy across a VM's vCPUs when
   preferred.

Thanks,
Peng
 
> Thanks.
> 
> -- 
> Frederic Weisbecker
> SUSE Labs
