Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E336D448BAB
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083144; cv=none; b=b3JZL2ptDXrgJgPLgMhyTgqSHm0c0nkaVZ+GSRyc2X8aOfjtLPnsMYNDCMOAFsGO1MxGaEm8r+2M40qCnfv4Hh+8nYpD5J/b5BDY32lWdwChiHdf2UUzIB6jp+CUh4L0X9ghKsHrF542yS7SCzONs1XhIB+mYcsGldBu4I+xz6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083144; c=relaxed/simple;
	bh=mBdQuOd2+orI7EhARk3z3raKkDlXH+X/4B3FrZzB/fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKyRF2/NSAdfmpISXkAwDt60CClAGFgj9z2hy6ovDYSVIG5UxJkZq/cWCTdBWG0EJ6mvQYsGNIb/S0lZhnR0kRkGIBRF+5ddaS6Iwulo0MgeUFF69VrqFcYI3IbEEZ+c3WeIKpQ1HhAEHtr5Y1j2ThPfXUTD+fxLf5ztZVY51EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-38dc4f9462cso1045348a91.0
        for <driver-core@lists.linux.dev>; Thu, 06 Aug 2026 23:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786083142; x=1786687942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2XI3tymrAXIanNBdwarSxOFR4nQgsGCTq88+6vG+F8=;
        b=jHW+EnPb3n8lj6JrRvCkt8hTzeESJiMDBQS5NsenY+SF0+xfepkfV07XQ0aJbKIzoB
         jUweraM4JfHvj1DpBezdFIliireK9e7qxyh4st9j67JNfGO6qxFgkTl2aBoOcrlrdhPZ
         /mjnF2fqtrBQGURdBhQC461bC4opbK2IO5Bz5IEI41A+bNG9RUbR2t8HRTmzX/yx4S6B
         w+zAv4OxKyOizig4juQphX8e7hRWgZSf00OvJ+tzF8KbcTpkWhw5k8LvJs/MywjLJ3sf
         kvyXzXFY55sBPjslqxe9PvQodJMBoCCuRYfHAzO7kmEA/3aGlWJSyCFyHqVSTBRSeJuA
         B0dQ==
X-Forwarded-Encrypted: i=1; AHgh+Rok2+JNpwNPT5f6HfYr/rx1hpEff+in9wM2YaqU/EV9RUjEdkl0N4EEKVyujr6f2xb56KiKklg7dx+37g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2FfQCjIYQ4Pz5ZWIaZkZp56Akfhy6QipnSJ6/ZD/ERpVrnzrF
	PAaKxSy6FvEYdQGKNlVmNJMAc/WSM1JFT5IQnUm6ZWbBughKaKnmpcGS
X-Gm-Gg: AR+sD12pCfcjp/0K/g1lQWUu/BrMjfDWFoAlLG0jyaHg0c6BO0Fy4cZtc3AfUj4ZJ0H
	wcM9eseQ+EaEKFCbnqANW588T/N39MpItkKmLNEi+/WKKuZPdBhsfZlKgYoT+K3YxvLrF3CJLVH
	S29FDvPgLavzXzvQj0h1F7wF2L+jLLPcrP0wgUyMgdXVjoNT5RmP0QKKtG1yM/M89AYpnHrFh1m
	Njwmd4HWmn0iT4mZzeZcCJb5fUHgYW4n/5U2CFCu2EB1jZ8hqL3lBoeVmvjD0fimfyD1Cj6Oo3+
	5CcsdcrHi4PjJ7qnzj1LWM4TQoN8RWPfGYdc3wd1Sl6msuJvsb0Ods232yHgbgJ4kk0lqvWITAU
	/3QCGNzAq+lPPcM++FbU6dr1IFvl1R14PlX4Qlufjhh5JEDEHYblGujfUHiL/iFJ75Wk04FzX2S
	Rs3qfnO8Ym/GyiJnisbVigA1R1cSjr5I/Cg2k3UB8qrY5z7yn00VFIWReXpHew7r41Rtgs51VzE
	rJELHmSOg==
X-Received: by 2002:a17:90a:d010:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3903c58bdd2mr20324647a91.11.1786083142215;
        Thu, 06 Aug 2026 23:12:22 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dbe349sm3434375a91.4.2026.08.06.23.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:12:21 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Jie Zhan <zhanjie9@hisilicon.com>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH v5 3/3] arch_topology: Add topology_update_cpu_capacity() for runtime updates
Date: Fri,  7 Aug 2026 14:08:48 +0800
Message-ID: <20260807060848.832929-4-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807060848.832929-1-luoxueqin@kylinos.cn>
References: <20260807060848.832929-1-luoxueqin@kylinos.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the CPPC Highest Performance register changes at runtime
(e.g. via ACPI Notify(0x85)), the scheduler's view of CPU capacity
and the frequency invariance engine's reference values become stale,
as topology_init_cpu_capacity_cppc() is only called once during boot.

Keep raw_capacity allocated after CPPC init instead of freeing it,
and introduce topology_update_cpu_capacity() to update per-CPU
raw_capacity, capacity_freq_ref, and the normalized CPU capacity
scale at runtime. Provide a no-op stub when GENERIC_ARCH_TOPOLOGY
is disabled so cppc_cpufreq can link on those configs. Skip updates
when the value is unchanged and reject a zero capacity_scale to
avoid division by zero.

Call this from cppc_cpufreq_update_limits() for every CPU in the
policy so shared-policy Notify(0x85) targeting a non-policy CPU
still refreshes the correct topology capacity.

Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/base/arch_topology.c   | 76 ++++++++++++++++++++++++++++++++++
 drivers/cpufreq/cppc_cpufreq.c |  2 +
 include/linux/arch_topology.h  | 13 ++++++
 3 files changed, 91 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..27f2bfa9f326 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -229,6 +229,7 @@ static void update_topology_flags_workfn(struct work_struct *work)
 }
 
 static u32 *raw_capacity;
+static DEFINE_MUTEX(raw_capacity_lock);
 
 static int free_raw_capacity(void)
 {
@@ -372,13 +373,88 @@ static inline void topology_init_cpu_capacity_cppc(void)
 	schedule_work(&update_topology_flags_work);
 	pr_debug("cpu_capacity: cpu_capacity initialization done\n");
 
+	/*
+	 * Keep raw_capacity for runtime updates via
+	 * topology_update_cpu_capacity().
+	 */
+	return;
+
 exit:
 	free_raw_capacity();
 }
+
 void acpi_processor_init_invariance_cppc(void)
 {
 	topology_init_cpu_capacity_cppc();
 }
+
+/**
+ * topology_update_cpu_capacity - Update CPU capacity after highest_perf change
+ * @cpu: CPU whose highest performance changed
+ * @perf_caps: Updated CPPC performance capabilities for @cpu
+ *
+ * When the CPPC Highest Performance register changes at runtime
+ * (e.g. via Notify(0x85)), the scheduler's view of CPU capacity
+ * and the frequency invariance engine's reference values become
+ * stale. This function updates the per-CPU raw_capacity,
+ * capacity_freq_ref and freq_inv max ratio, then re-normalizes the
+ * CPU capacity scale for all possible CPUs and triggers a sched
+ * domain rebuild. If the value is unchanged, everything is skipped.
+ */
+void topology_update_cpu_capacity(unsigned int cpu,
+				  struct cppc_perf_caps *perf_caps)
+{
+	u32 highest_perf = perf_caps->highest_perf;
+	u64 capacity, capacity_scale = 0;
+	int c;
+
+	guard(mutex)(&raw_capacity_lock);
+
+	if (!raw_capacity || cpu >= num_possible_cpus())
+		return;
+
+	/*
+	 * Validate: highest_perf must be >= nominal_perf and >= lowest_perf,
+	 * consistent with the boot-time check in topology_init_cpu_capacity_cppc().
+	 */
+	if (highest_perf < perf_caps->lowest_perf) {
+		pr_warn("cpu_capacity: CPU%d invalid highest_perf=%u (nominal=%u, lowest=%u), skipping\n",
+			cpu, highest_perf, perf_caps->nominal_perf,
+			perf_caps->lowest_perf);
+		return;
+	}
+
+	if (raw_capacity[cpu] == highest_perf)
+		return;
+
+	pr_debug("cpu_capacity: CPU%d cpu_capacity=%u -> %u (raw)\n",
+		 cpu, raw_capacity[cpu], highest_perf);
+
+	raw_capacity[cpu] = highest_perf;
+	per_cpu(capacity_freq_ref, cpu) =
+		cppc_perf_to_khz(perf_caps, highest_perf);
+	freq_inv_set_max_ratio(cpu,
+			       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
+
+	/* Re-normalize all CPUs: capacity is relative. */
+	for_each_possible_cpu(c)
+		capacity_scale = max_t(u64, capacity_scale, raw_capacity[c]);
+
+	if (!capacity_scale)
+		return;
+
+	for_each_possible_cpu(c) {
+		capacity = raw_capacity[c];
+		capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
+				     capacity_scale);
+		topology_set_cpu_scale(c, capacity);
+		pr_debug("cpu_capacity: CPU%d cpu_capacity=%lu\n",
+			 c, topology_get_cpu_scale(c));
+	}
+
+	schedule_work(&update_topology_flags_work);
+}
+EXPORT_SYMBOL_GPL(topology_update_cpu_capacity);
 #endif
 
 #ifdef CONFIG_CPU_FREQ
diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 09d7745a609f..1480be537eaa 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -979,6 +979,8 @@ static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
 
 	refresh_frequency_limits(policy);
 
+	topology_update_cpu_capacity(policy->cpu, caps);
+
 	/*
 	 * Autonomous selection mode uses MIN/MAX performance as runtime
 	 * hardware control bounds. Re-program them when highest_perf
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f96..9415cb6a6c2b 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -11,6 +11,19 @@
 void topology_normalize_cpu_scale(void);
 int topology_update_cpu_topology(void);
 
+#ifdef CONFIG_ACPI_CPPC_LIB
+struct cppc_perf_caps;
+#ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
+void topology_update_cpu_capacity(unsigned int cpu,
+				  struct cppc_perf_caps *perf_caps);
+#else
+static inline void
+topology_update_cpu_capacity(unsigned int cpu, struct cppc_perf_caps *perf_caps)
+{
+}
+#endif
+#endif
+
 struct device_node;
 bool topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu);
 
-- 
2.43.0

