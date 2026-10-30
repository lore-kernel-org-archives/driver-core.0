Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354394;
	b=A92cjTCQSpUhE0CHadNJjrDaQnBIhybTZh18V7X/RV9ENRBaKPfhM8Mk9ZqGhYig96Dc
	 ffzkBgyuWw0E7gz4vcU2p52wgIgaiGun55SoUzK5RdTHUIKg9CeVRFKc6qxC3GGqkwmN8
	 GOUyuv0j5AgpElZE6yOUNVxQK4trpXldqTUBXqnRw8w7ej87/80xpGf7RZkBHHRMpnSRQ
	 0MDYcDne5hUVDyP/UsJ1cGu123YFXLn79dG5RlZdwhJGKnPvs59aAOa4SOEPCDXPzGw4b
	 v6KHE2j40e8Fkyvy80F+ORAiCzXN+vFmxNL8EBlestHnZFqv0uFCAYyZeTLivF5xUrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354394;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=yXMPGRPBcfckMgFC4bysmDdGptiT+3XkF28FfzngIW0=;
	b=wqkZkuy+PVUnygBV8wP2rCDFFumKZv9l2g19ZEU9OMgoiJqc3gSnX21yDCwo7NKW9uoH
	 dDRKruBfEdKc4EDuOPU8Og4lGRs5XOg6sPt8F8ROQnbagZuqri/9HLsBUx5M3n8C9T1kY
	 931QAGhym0KVBtUKZ6Q3t10i29WOAmm/gjW0N21reTemrT9N0ONab+MgqI6bsYz8VrTAA
	 Hiz7sa2NbKN4DeC76Grtq7NTfirL698BE3hZy65IlenxFRcMOXcnKnme9hkN3LUWmJFqn
	 Ru6fUKQsr/zEBx1brrN+zE+KnAJ8EgZdSebyApj3kLnEwozS/enxzwqK5lUfZx7TDWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iSz6lxwV;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB01F606A338
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 09:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB01F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iSz6lxwV
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793354386; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=yXMPGRPBcfckMgFC4bysmDdGptiT+3XkF28FfzngIW0=;
	b=iSz6lxwVe8spp+ofYs8Azo6Gjrdha62/u6JpqJG3DH4UyoUHNpctIOKOW6SJf6oWigVyAqvRFUY+MdkBtQCn4oAIY8FtGMkVQzukmXAEHnQLcg6JO9Fe24lx2AejElTP8za0A5uvZC2yl/ljBF1ahrsz8vVqPdGQLsH0Uzf4fw8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=peng_wang@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XDlw3AF_1793354384;
Received: from localhost(mailfrom:peng_wang@linux.alibaba.com fp:SMTPD_---0XDlw3AF_1793354384 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 30 Oct 2026 17:59:45 +0800
Date: Fri, 30 Oct 2026 17:59:43 +0800
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
Message-ID: <auRqj5y4bym8KGj8@U-3K7XLPQ6-0046.local>
Reply-To: Peng Wang <peng_wang@linux.alibaba.com>
References: <cover.1792242566.git.peng_wang@linux.alibaba.com>
 <58bc33cb018a2651e9cc3fc02baad7de4d543705.1792242566.git.peng_wang@linux.alibaba.com>
 <att2hiYaaHTIkzG9@localhost.localdomain>
 <atuMJiJEwbzGjiu4@MacBook-Pro.local>
 <auIbt5JAC2cHw5jr@localhost.localdomain>
 <auLqmMdd8RIdf6st@U-3K7XLPQ6-0046.local>
 <auNR5c6hXlb_FFkB@localhost.localdomain>
 <auNuLZiBZyHLFYUr@MacBook-Pro.local>
 <auN5Bku9w2VDZFFX@localhost.localdomain>
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
In-Reply-To: <auN5Bku9w2VDZFFX@localhost.localdomain>

On Thu, Oct 29, 2026 at 05:49:10PM +0100, Frederic Weisbecker wrote:
> Le Fri, Oct 30, 2026 at 12:02:53AM +0800, Peng Wang a éãrit :
> > > Ok in that case, do you know about the current work in progress
> > > to make nohz_full opt-able through cpusets? It implies taking the
> > > target CPUs offline shortly but the policy is to be setup before VM
> > > is launched, right?
> > 
> > Not always. Waiman mentioned the cpuset work earlier; it could
> > cover selecting the policy before a new VM starts.
> > 
> > Some customers express a preference for host tick suppression
> > through the management interface when changing workloads within
> > a running VM. The host operator decides whether to allow
> > suppression on the CPUs backing that VM.
> 
> I think people should know ahead if they will run latency critical workloads
> or common workloads in their VMs. Because those are completely different.
> 
> > 
> > We want to support revisiting that decision while keeping those
> > CPUs online and the VM running, with nohz_full membership
> > unchanged. Could such an operation fit into the cpuset work?
> 
> If that is really necessary then I guess we can have a file to control that
> in cpuset once the nohz_full interface is ready. Though I'm a bit skeptical due
> to the overhead of user <-> kernel transitions and housekeeping.

Hi Frederic,

Thanks for clarifying.

For some of our database workloads, we have observed a net
benefit from nohz_full despite the transition and housekeeping
overheads. We understand that those overheads remain when the
tick is kept running.

We'll follow the cpuset work and see whether this control
would fit.

Thanks,
Peng

> 
> Thanks.
> 
> > 
> > Thanks,
> > Peng
> > 
> > > 
> > > Thanks.
> > > 
> > > -- 
> > > Frederic Weisbecker
> > > SUSE Labs
> 
> -- 
> Frederic Weisbecker
> SUSE Labs
