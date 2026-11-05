Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869522;
	b=sPWb5KQaARg/izcl+suRo613FX8yb47Re00u5tIPDA/pl2jYKIEM2QCx9Fqu28Az1inx
	 LNfgXVI2MYsiV+g+N54sCoiKdZTu2JPIM8OiCDKyMXuyQrtmfur18HC1oCNHec5JLz3Ui
	 NOmNVTYKdxqBM/p0cAjyJ3Hdt5lLsS//FaoydABVr4w3T/lCjr5Uuy3+JBaIxwqanSTgs
	 oPJ2rTmvsfx92S+fhdF6+EHLBeEshGh7CIGPookOB9+xrmL6YlYSn0w0B586JMBpYZ7sI
	 UJSd17RZl9tihZrBVSJ0BqrOGZUBoqeDhI08e68ElOrjqOo9vG+vmpUOX6DbLc9B1xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869522;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tyXT3V1giPULzTli43gvYizMlTh6ps7zNGmY3FWZQOM=;
	b=Q9Jt1TxvgxvZBi5Ji5QtNMJ2V4B9o4poQKddvq7wRrjsTK3HlvKo/bVrL4rInsnUxUwR
	 Cid7gt5HfmLbDq8yEOTvW5YbbmRjvOstP5CbIJ98tUAo4s4TNn1L/+Qk3pLN2DAlRpdW5
	 GvJr4/D/06GOHtfylQa5EVPth2KnLGTGZ3SJ8fUdPjUVK8sal3oqg/mJ2N7vkRritx4bD
	 09C8f6Q8dix1m4GZOGR2zwOQk4zzu4+RxEszbbeJK1grfT2ZYCfop73KGlVhCsqEKhYrE
	 JHtic7fStavdfmMUCt1ZzQCCcnqL1xcpJ2SvD6RGUN2LfasCW3znBe/6dyhbnMzNWlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QCGHhhfg;
	arc=none smtp.remote-ip=95.215.58.65
Received: from mta1.migadu.com (out-65.mta1.migadu.com [95.215.58.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F9C606A31B
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 09:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F9C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QCGHhhfg
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=UGrLw7tJ8SzIUnajBIKmwWZs/FFny8I1ZQMJWZrsm+Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793869519; v=1; x=1794474319;
 b=QCGHhhfgELdBjH4k1DpMBSjAg98/Kz63jgGvpZhMfAtZ0Iv5AUuMquOQ1gsaT6CA8NjTq095
 ppjepvMiVh/7cg/PM0BKM4JacB8zED+28PzNBpiGf3f3g1+EnDa8Sx+MoWbfUEMit0Me/+fS1qe
 Z4Pa/zwEYqr9VueZshavJTZg=
X-Envelope-To: driver-core@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 8f2b4df41c8b103c;
	Thu, 05 Nov 2026 09:05:17 +0000
X-Mizu-Trace-ID: 8f2b4df41c8b103c
X-Migadu-Flow: FLOW_OUT
From: Fushuai Wang <fushuai.wang@linux.dev>
To: ynorov@nvidia.com
Cc: agordeev@linux.ibm.com,
	arighi@nvidia.com,
	borntraeger@linux.ibm.com,
	bsegall@google.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dietmar.eggemann@arm.com,
	driver-core@lists.linux.dev,
	gor@linux.ibm.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	johan@kernel.org,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux@rasmusvillemoes.dk,
	meted@linux.ibm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rafael@kernel.org,
	rdunlap@infradead.org,
	rostedt@goodmis.org,
	skhan@linuxfoundation.org,
	sshegde@linux.ibm.com,
	svens@linux.ibm.com,
	tglx@kernel.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	yury.norov@gmail.com
Subject: Re: [PATCH 3/6] sched: Restore preferred CPUs when hotplug removes the last one
Date: Thu,  5 Nov 2026 17:05:05 +0800
Message-Id: <20261105090505.93940-1-fushuai.wang@linux.dev>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261101192203.6979-4-ynorov@nvidia.com>
References: <20261101192203.6979-4-ynorov@nvidia.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 04b62c16fa8c..98f4f9434965 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8712,6 +8712,14 @@ int sched_cpu_deactivate(unsigned int cpu)
>  
>  	set_cpu_active(cpu, false);
>  
> +#ifdef CONFIG_PREFERRED_CPU
> +	if (cpumask_empty(cpu_preferred_mask)) {
> +		pr_notice("sched: last preferred CPU%u offlined; make all active CPUs preferred\n",
> +			  cpu);
> +		reset_preferred_cpumask();

Hi, Yury

If the CPU being offlined is the only preferred CPU, after
reset_preferred_cpumask(), the steal governor may still need
some time to tighten the mask again, and eventually only one
preferred CPU may remain. Would this introduce additional
task migration overhead?

Regards,
Fushuai.
> +	}
> +#endif
> +
>  	/*
>  	 * From this point forward, this CPU will refuse to run any task that
>  	 * is not: migrate_disable() or KTHREAD_IS_PER_CPU, and will actively
