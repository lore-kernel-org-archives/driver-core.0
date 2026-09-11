Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219B48EC98
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 13:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134535; cv=none; b=k4SbkfGgvJ3PsfcSs4ADDXSKWmhqAFQocW6Rko34HikUdjsEP/i9NOH6cMTAnIckflBAX1AvNgqyd+7fiwB6ArOi+JzqAF9KMib65Afz2HUr0LhDxoohWtazW3688tcN8/gCcwv7qovHnpi8BojhTsoEOEi35bSBOQIE6L5uJOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134535; c=relaxed/simple;
	bh=mYUY1X0u4jMAiaxT3A2tqJfINJC7WO9ByblU8W1JI7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GT0ru11/OEHLe6ITd4t51mTLyShcRl+pf2Vqzoeqc8hhwKwiQQSm6RyvRItmNeiI2H5cQb6mz4J4j4Sp3SLS4zf7QAwHniDJSXgcabSTeSf1a5mpfvRyctRgRmyAMx7ZmWzx+/XHOfu+z3FysAB5EAbNS02YrS8CfYJblg015Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMBPyuZy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMBPyuZy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d715f4a587so11454495ad.2
        for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 06:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789134529; x=1789739329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7hwUc1tIO7zM19os5B2JuOflqEWXi9bUCh3PtnCIVg=;
        b=SMBPyuZyJRdrvwh+XMzOb0gDsTSRNMWWrlmYhFUveMQ/13Ql1cSOs5rMt8Jg8WgzmJ
         16ollZXHBAcRDtyvi8FUGHKlgqbTjL10QykDjrXUsJgVa18X7goOaw6qyNqj/fEktfKT
         0g97s8/cRveB4v/dm7IQpConRPTxAJpo/OEt4AvQTUv1Fb+63J4207lL09J8ciQIxl5n
         DtXUGl6et6eHAxsmeiwbWodeUCNFwpWqR4/Ip3O559J/kg7Yy3X8wTTjLJ3P64rj9+tg
         dQELQXltkrlinhXYjgCA8+JlIvcIzQF7sXO9dsXPDG4MTpkGGCfv5/n/4KtK42EHi6LM
         ePyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134529; x=1789739329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7hwUc1tIO7zM19os5B2JuOflqEWXi9bUCh3PtnCIVg=;
        b=G0c2zAvR/18HSPf1+HtWjbHb67QE9vczi3pBedQ+2Yus8rmhWOhJ0fQ7bw9sqntLAk
         qcW2NEpUAatOo/eomK6ploPf7WUEBikbD4d1wVCDtwvytCVgxLNar3t4aeSoHCJ3686L
         +A9xcSqN2CW7HEFBflwC99yp75RuXTNPQQpbFOiPT1KTPer8SH7/YhhSxDuVBNrMhhav
         05xCRr5a1nGe4MQfTUCwC2llut8x5Wu0JNsf3qP2YRR3unrYEanH9yQ6mJtjoO4VtwMb
         pUfblvPWU8AEljPdtizX6h1J3PmCKzP+mBxzYiU0Z3LqvzCXjR0jqjCGikhLdNE1FHRA
         h1uA==
X-Forwarded-Encrypted: i=1; AKwUvBz9z2T9FtNwwLrgVKAhIguVMxWtcxRRHMYTe/4rE9zHNuSKZGKZ9aBU+Um/rRLoEnRNId7Ju6PvZjuNWw==@lists.linux.dev
X-Gm-Message-State: AFuF++md0j1GCNVYv7Ekf0Mul5c4VynesKyazcTQWhhRWmApVgri2Lca
	F87WEoWvDRJL+I0bt0JNTbD4wmmpnOST0ArGJ6cAilTFiyQ8PDEZoS96
X-Gm-Gg: AYBFou1oSym4M1l59PR1Nev8y2TwEzDmBhd0HY3DXMAU6ce2/pOMyQ9bJyoH8pOL5BU
	iYWzyq2H7UZmoKswdWa9T5IhGSK9qWKtz7Ud+Ydjkj5onsqxafHDa6sMrr+avEQ0/e/tFTtGUJP
	FZiP9eCbgONhG/j2C+jxRdd5TQsrhKpadJp4SQuZ2AxzdrIgmQgwR5wGySAkZAAV4aycl5Z/8c4
	7ZeD3+wbL2QIJqkIE8yRTSRYIFYhgxkWgVtxCX80mIa3P2wFLvW+rXzVmcdcLABkgVrs7w2hzg/
	7hwPKAEtWaEQ4AyqnnulGOoaDwUh4nsg0dRpGEU94V7vinjp68Zkf5jPm4CxM0hy4NOQDg0w5tt
	QpBDpxfKNDOCkqdoGptm+7hpI5eDioU11gBDlCG6JmUfYNakBPLNu13WqhRlhmKTz95pv/d4ia+
	RZ+OE+9qzzxlEzX/vTDylk0fasRZ1wriY/n4mbTXSsKOUJ7m2EyOZ8wFvMKYA514PrZhaWsSwm2
	J33guUeFABhqdFLuBfHxI0+jLCR
X-Received: by 2002:a17:903:19c8:b0:2d8:d4cc:5bb2 with SMTP id d9443c01a7336-2dd2a357792mr86930675ad.18.1789134528965;
        Fri, 11 Sep 2026 06:48:48 -0700 (PDT)
Received: from localhost ([200.151.1.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc56b1sm11650265ad.54.2026.09.11.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:48:48 -0700 (PDT)
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
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/cache: Refresh LLC capacity across CPU hotplug
Date: Fri, 11 Sep 2026 10:48:05 -0300
Message-ID: <20260911134825.420748-1-davichazbh@gmail.com>
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
---
The issue was identified by tracing the scheduler/cacheinfo teardown
ordering, then checking live llc_bytes values using the running kernel's
BTF layout and /proc/kcore.

Validation:
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

This host has only one LLC, so the live checks establish the accounting
correction, not an aggregation speedup. No controlled same-version
performance comparison or multi-LLC hardware result is claimed.

 drivers/base/cacheinfo.c       | 11 ++++++-----
 include/linux/sched/topology.h |  4 ++--
 kernel/sched/topology.c        | 27 ++++++++++++---------------
 3 files changed, 20 insertions(+), 22 deletions(-)

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
index 0248227d983a..a10eecc49d51 100644
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
@@ -996,32 +996,29 @@ void sched_cache_active_set(void)
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
-	 * ci->shared_cpu_map is built incrementally as CPUs come
-	 * online, so the first CPU in an LLC initially sees
-	 * hw_weight == 1 and computes an inflated llc_bytes in
-	 * get_effective_llc_bytes().  Re-evaluating every LLC
-	 * sibling on each online event corrects this once the full
-	 * shared_cpu_map is known.
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
