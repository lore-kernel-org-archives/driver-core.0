Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840815013B6
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566338; cv=none; b=dmfXi1S88zTDHJhv98tjBC67thXSmA+In72eGSQ3pF4eTZ9TLmNYgmgq2qvgImSJlOB8nuLFPZGVWP8/CfVhCW25TOunv2Ug0U/P/w3Mx5WYG7MrKjZU17+I6E8gSS410LBqYC4VD7Tv2Ejz/ULnYLcFJrEzYmP5xm75VGtsQqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566338; c=relaxed/simple;
	bh=cSvOuwzUhUCCpZOp3LACYO6bCBjLAM6v63no8jsFevQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeA32Qa3VdRigg0LkRw4rdRjVxjUbHMKO7SuvvwMwm2ncEPhuzsFbsAueSSLICJWI26Zx8WaLRtELu9XDjrwYYhasqdZ5KsK2np4Ix21xiIt2yctiZ9jCJc75BiE3H0eczHUuWj3r+4HQneahHCbh4bn/XOmcTREvXhdw/0vRE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mukji3O6; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mukji3O6"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so1619443e0c.1
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789566325; x=1790171125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ck3kqnGFwURHR7AM181gzyy+0qq9NWGY55jHx9dGdQI=;
        b=Mukji3O6Jxv+rr/cigZEsxPY9tMklV8Iowie0TzbKHg1g5EuwIXgwIsaKKk8bNZ9Is
         sGj8zy1u4tZEDvz65xebIA4ZV6dvEyg67UPXz7KjsAmHFzWqG8mRb/BbE8FnMSrTJ9vb
         D2WrNsR9679vLRxyno1pahXduJcjbtMIHlcNYVz2b5n1pB5k58mhMvG33rBAgL/VGy+F
         feAWPcK+aCJkkRGcTKuEZU3P/++HAyXrUObrnR501BWZCb+h4l+3ChlOdFJoDDSJaly6
         EIyF7BOrGuYOx9BUZsffIe48gnZ6oRu1dIKkp+D1EH8Zd+xCL8QzUSpo4lOGat4OntMe
         e9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789566325; x=1790171125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ck3kqnGFwURHR7AM181gzyy+0qq9NWGY55jHx9dGdQI=;
        b=IkFaWULjLYDO7AreKljKutTbLCVRg9ZjLbXFEEHk0/AHNczRqIXjov/m67snZFQhCn
         CQC77RkF5Ze4+AefQQrKLitEREqz8CtwcNeVjCtiC0adWiGPZ3odY+YeN/M+Ttxm0dtC
         nc7TNOwqGS0igSmA+qLXG10PpQcl7JJw8Y1s7OlsNk1EH0ApZ5XrnaY2OyjBErDfaOhI
         d5qLH+814FNe0lxKvtoyw4H0sEAZZzgWIBuQNm5WDRhyGyFMOQ5B1/otpG3HQD/r8WhM
         ySqBsR0ULCu9fUa3V+vTKe0ZscFFu3qLUZgaEi7ivVcKUBTw68xdFR5IsFjY58KRVhN9
         drPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmGEAS1Xj6wzikq+gjqPJnfZy2PThV72lUMBBvpkZ8VJFBQacQ5C1RVruuazHyAdZ4btDZ++67RzrP3w==@lists.linux.dev
X-Gm-Message-State: AFuF++mHE9hieWT/GKOAXGS1W8u6vOZ8C9Ni69450cFhvd1sNYmLZcNQ
	GQW6+okfZx6gPuQXITMOnKKLsq0rlw3z8YS1htxb/Aawe1jYiZ1OFsyl
X-Gm-Gg: AYBFou3qdJQ5mUq2JZ545GCPfDhNMQbs/dpjfPAYYhtwH/UhT0WQgIiIRKnILMnzxab
	PXV76CMVYYhmwTXY4dljvMrLCieakk498VaSe7yz21RZTjas/K3Chryr2VNQWGPC+hAqVGznaTk
	yY4XmKATNoB3jh5KX7lCc+hBfnyW+7rY0aGrUjc7XYbFIWU04BMIzIqrsh9cnCGxSVKjE+HV9Kf
	mcSFQ6SAODXctFz4MksHr0v3Gqvw/YfnxGK5Rn7O+q/oHfZYVVzELoWtQvwT3O1FLJy1BQyKp/u
	HaactgoxWrx9sYvK4qCiXBKVQ/WXT5F4XURpLxoGONg0BpMcofN8rhgN310R63lMjXDUnOAOWwu
	NT3XSiZcXiKzyqAX84f6wGoheBRnRIaZdMt95S9acdntd7QAkiA+CtiiMFFjqUGF923uA7pwpW9
	ojXzbYW14jfojh5hmUbTdNCHw1yycNDM3GTOBo3HFaIdXZZaVVr3QL3+aQnFpyvZejkCuQyixb+
	c8RuP/a7EtXPQc0tj0GW/BZqWfp7Q==
X-Received: by 2002:a05:6122:6202:b0:5c8:38b8:44a0 with SMTP id 71dfb90a1353d-5c98a4ff79bmr4643563e0c.8.1789566325042;
        Wed, 16 Sep 2026 06:45:25 -0700 (PDT)
Received: from localhost ([148.227.86.192])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c998aa36cfsm2729594e0c.12.2026.09.16.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:45:24 -0700 (PDT)
From: Davi Chaves Azevedo <davichazbh@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: Chen Yu <yu.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	chen.yu@linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] sched/cache: Refresh LLC capacity across CPU hotplug
Date: Wed, 16 Sep 2026 10:44:32 -0300
Message-ID: <20260916134432.11767-1-davichazbh@gmail.com>
In-Reply-To: <20260911134825.420748-1-davichazbh@gmail.com>
References: <20260911134825.420748-1-davichazbh@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scheduler scales LLC capacity by the fraction of cache-sharing CPUs
covered by a domain:

  llc_bytes = cache_size * span_weight / shared_weight

During CPU teardown, sched_cpu_deactivate() rebuilds scheduler domains
before cacheinfo_cpu_pre_down() removes the CPU from shared_cpu_map. The
new domains therefore use the old sharing weight. The later call to
sched_update_llc_bytes() looks up the departing CPU's sd_llc, which has
already been detached, and returns without correcting the surviving CPUs.

On a Ryzen 5 7535U with twelve logical CPUs sharing a 16 MiB LLC,
offlining one SMT sibling left the remaining CPUs with:

  llc_bytes = floor(16777216 * 11 / 12) = 15379114 bytes

The correct capacity is still 16777216 bytes. On systems with active
cache-aware scheduling, an underestimated capacity can cause
exceed_llc_capacity() to reject aggregation for a process whose footprint
would fit. Unchanged cpuset partitions sharing the physical cache can
also retain stale capacity when a CPU comes online in another partition.

Pass the cache-sharing mask already retained by cacheinfo to the
scheduler update. Refresh every surviving CPU using its own LLC domain
so that each partition receives the correct share. This also preserves
the correction needed as cache-sharing maps grow during boot.

Keep the existing CPU-hotplug and scheduler-domain synchronization. The
update remains on the hotplug path; no steady-state scheduling operation
or persistent allocation is added.

Fixes: 7030513a0877 ("sched/cache: Calculate the LLC size and store it in sched_domain")
Signed-off-by: Davi Chaves Azevedo <davichazbh@gmail.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
Changes in v3:
  - Add K Prateek Nayak's Reviewed-by and Tested-by tags,
    Tim Chen's Reviewed-by, and Chen Yu's Tested-by.
    No functional changes from v2.

Changes in v2:
  - Restore the original boot-time shared_cpu_map explanation, as Chen Yu
    suggested, alongside the CPU-offline and cpuset-partition rationale.
    No functional changes from v1.
  - Add Chen Yu's Reviewed-by tag and document his multi-LLC testing.

v1:
https://lore.kernel.org/r/20260911134825.420748-1-davichazbh@gmail.com
v2:
https://lore.kernel.org/r/20260911220229.1368887-1-davichazbh@gmail.com
Review:
https://lore.kernel.org/r/a3433e6a-0d1f-44a8-99bd-bc63d1a15913@intel.com

The issue was identified by tracing the scheduler/cacheinfo teardown
ordering, then checking live llc_bytes values using the running kernel's
BTF layout and /proc/kcore.

Local validation performed for v1 (no functional changes in v2 or v3):
  - Reproduced the stale value on 7.2.3-arch1-3 on the Ryzen system above.
    The patched kernel retained 16777216 bytes on every surviving CPU.
  - Ten SMT-thread and ten whole-core hotplug cycles passed on the patched
    kernel, including capacity checks after each removal and restoration.
    The existing limited CPU-hotplug selftest also passed.
  - Source-level state fixtures: five failures in eight scenarios before
    the fix, eight passes after it. These cover partition changes, unequal
    spans, sparse CPU IDs and boot-time map growth, but not concurrency.
  - Full x86-64 baseline and patched bzImage/modules builds passed with
    matched configs apart from LOCALVERSION. Focused ARM64, x86 without
    CONFIG_SCHED_CACHE, and x86 UP builds also passed.

Thanks to Chen Yu <yu.c.chen@intel.com> for the additional verification
and review. He reproduced the issue and confirmed that v1 restored the
expected sd->llc_bytes on:
  - AMD Ryzen 8945HX: two LLCs, eight cores per LLC.
  - Xeon: four LLCs per node.

Thanks to K Prateek Nayak <kprateek.nayak@amd.com> for reviewing and
testing, and to Tim Chen <tim.c.chen@linux.intel.com> for the review.

The local tests used a single-LLC host; Chen Yu reported the multi-LLC
results above. These checks validate LLC accounting.
Builds and hotplug tests were not rerun for this tag-only revision.

 drivers/base/cacheinfo.c       | 11 ++++++-----
 include/linux/sched/topology.h |  4 ++--
 kernel/sched/topology.c        | 22 +++++++++++++---------
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 9f9c72727a05..7a47a392568a 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -1040,9 +1040,10 @@ static int cacheinfo_cpu_online(unsigned int cpu)
 	rc = cache_add_dev(cpu);
 	if (rc)
 		goto err;
-	if (cpu_map_shared_cache(true, cpu, &cpu_map))
+	if (cpu_map_shared_cache(true, cpu, &cpu_map)) {
 		update_per_cpu_data_slice_size(true, cpu, cpu_map);
-	sched_update_llc_bytes(cpu);
+		sched_update_llc_bytes(cpu_map);
+	}
 	return 0;
 err:
 	free_cache_attributes(cpu);
@@ -1059,10 +1060,10 @@ static int cacheinfo_cpu_pre_down(unsigned int cpu)
 		cpu_cache_sysfs_exit(cpu);
 
 	free_cache_attributes(cpu);
-	if (nr_shared > 1)
+	if (nr_shared > 1) {
 		update_per_cpu_data_slice_size(false, cpu, cpu_map);
-
-	sched_update_llc_bytes(cpu);
+		sched_update_llc_bytes(cpu_map);
+	}
 
 	return 0;
 }
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index b5d9d7c2b8ad..f96812d71c51 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -281,9 +281,9 @@ static inline int task_node(const struct task_struct *p)
 }
 
 #ifdef CONFIG_SCHED_CACHE
-extern void sched_update_llc_bytes(unsigned int cpu);
+extern void sched_update_llc_bytes(const struct cpumask *cpus);
 #else
-static inline void sched_update_llc_bytes(unsigned int cpu) { }
+static inline void sched_update_llc_bytes(const struct cpumask *cpus) { }
 #endif
 
 #endif /* _LINUX_SCHED_TOPOLOGY_H */
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a..3dab0253976f 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -985,8 +985,8 @@ void sched_cache_active_set(void)
 }
 
 /*
- * Update the bottom sched_domain's llc_bytes for @cpu and all its
- * LLC siblings. Called from cacheinfo_cpu_online() or
+ * Update the bottom sched_domain's llc_bytes for @cpus sharing a physical
+ * LLC. Called from cacheinfo_cpu_online() or
  * cacheinfo_cpu_pre_down() with cpu hotplug lock held.
  *
  * Note: get_effective_llc_bytes() returns 0 on PowerPC.
@@ -996,17 +996,13 @@ void sched_cache_active_set(void)
  * and does not populates the per-CPU struct cpu_cacheinfo array
  * that get_cpu_cacheinfo_llc() reads.
  */
-void sched_update_llc_bytes(unsigned int cpu)
+void sched_update_llc_bytes(const struct cpumask *cpus)
 {
 	struct sched_domain *sd, *sdp;
 	unsigned int i;
 
 	sched_domains_mutex_lock();
 
-	sdp = rcu_dereference_sched_domain(per_cpu(sd_llc, cpu));
-	if (!sdp)
-		goto unlock;
-
 	/*
 	 * ci->shared_cpu_map is built incrementally as CPUs come
 	 * online, so the first CPU in an LLC initially sees
@@ -1014,14 +1010,22 @@ void sched_update_llc_bytes(unsigned int cpu)
 	 * get_effective_llc_bytes().  Re-evaluating every LLC
 	 * sibling on each online event corrects this once the full
 	 * shared_cpu_map is known.
+	 *
+	 * The departing CPU's domains have already been detached when
+	 * cacheinfo removes it. Use the surviving cache siblings instead.
+	 * They may belong to different cpuset partitions, so use each CPU's
+	 * own LLC domain to scale its share of the physical cache.
 	 */
-	for_each_cpu(i, sched_domain_span(sdp)) {
+	for_each_cpu(i, cpus) {
+		sdp = rcu_dereference_sched_domain(per_cpu(sd_llc, i));
+		if (!sdp)
+			continue;
+
 		sd = rcu_dereference_sched_domain(cpu_rq(i)->sd);
 		if (sd)
 			sd->llc_bytes = get_effective_llc_bytes(i, sdp);
 	}
 
-unlock:
 	sched_domains_mutex_unlock();
 }
 
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
