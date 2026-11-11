Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387080;
	b=47NH+QWpcv73+hunCIKlRkLDdJ7woNXOIL/TbEqOu0/S/AEkxkWbBGeGjHnafGgPCWqI
	 vZOeOp5g96/e/RUbx7UhPyA8p3rOvGRHzmzl/Gx1p9ZdKZ5S/w6RC/f/zX2m7il5ELL5V
	 6yXYxOWpuGUFrxzXyrCVMaO8l0DJXk7sVVdfi+cMP64Cy2DUvHOefkNiSqdh6mWcprb5+
	 Wsro3idPLqpTerPiLoSPPRUeULKfBGpESrLNKMkl0GOSxGEvV7Z6W7HfwxyZw287r6e4t
	 9M6YSzzHPNL85ykKZUg5hNS8+ry2VM/OCp/7S6pVLzYqbqsdk0fW3d/4WFX8QY+4OcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387080;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4FR4MYwSIUv0E3HeQxkRuXJTHYwYwGW3jDUR0WOXudI=;
	b=hN/0psZIRLCDxTwE5TaxFfQ4FCsIxmQYTyw+ddWglX0KGWzqkPlx6MU/lJKnZC70bwcP
	 df05L2g0rFevf3FdFtCU+Nf1oTik/87C6xTtvXVnltKNQ1oeMqE9qgjXL9JFozk0WUTOE
	 3qso5D/H6o6EbziLpVpAEygIPBR9ILv9/mhZPiHCDg7/HXPjojG4+0uPCgRyGjTLoOmrv
	 R3mOXhikaT+wrBl1cjO19FZKUDh4WDnAnl/ryGUR0v4dXxCjduRae/RPurPCRdollWL2o
	 RnOyx57ReXq3F3E4swJGfG6LNAD8LPa0FtSr/anOkyc0Ey3j3c2HsyQXZf3yO7Ivw6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589F8606A321
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 08:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 589F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac749e0719so878951a91.0
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 00:51:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387079; x=1794991879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4FR4MYwSIUv0E3HeQxkRuXJTHYwYwGW3jDUR0WOXudI=;
        b=0MVjnVhE0poK/0CmzNuONigPcDxXem1nZYC3LdJhzNlh/Cq2lrnM6mQcBmLgm1ntTn
         PDXZCu8BTQiV7d+V1Ow3c8wfc5+O12k+DfDYb5QwJO+nNgoxTHpdovDT9OHkzYCiGaYQ
         un3d5Vw04SIZInF4EZgpPZOpwGIvFYBDYVR930qjPKV4uaKnlwyGgVo4PZbXMbvyc0go
         y2nmE214V+1PW6k8auutnIMvJzPFI7ngkZtznjiIlzWG5k3AqKNxlihGNy7gSg669kZk
         zp625mpOse+Pw3mmg9L3gHWtm++OFWm2d0RLLGJWX2KuEPxR4v3oa47vgusRIJgF5V70
         Rapg==
X-Forwarded-Encrypted: i=1; AL+hErE1xLz8QBR5/wnBCgAnQySehB4QA6WxQNlC40spxEOemtzDda6hBBmUyJ+lUb/nJ2VC2ymBd14zUtMzDQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+8GLgkFOaAPNkDv/GUGq3O0VW8MTyMIKUzaSCUg9pVOm+/yfpn
	YcvXELo+Lehc+erZHXBTQRqnHU26NrpIEuerB3NZx+lZ+iu8Pl3+klS4
X-Gm-Gg: AYBFou1yyrxEiLlhUG5UcKvM6RstW0u2wI4UpYvcvll01yxNwVF/El3w7BVww2zz96d
	Cvv5mHVE1WbRt4pdL6vOlChLPdN6yVc26+smzYeQjNXFHng0oz5LtcbQ7+p7iv0AcvBgI7WemFG
	s1mJb2TP+qePbghc+O4G2mfCLRLBmYnR2YuP5uQUM6XXWuPmQZSYkdFJbpbN3HLIzwlfyNzx6Pc
	EMhX3hZFYMLPJQhtABvy4q+zhpGGgQo0JcAPKDQvdRkQtbDfkm++FoC0wZjTGOV3UQvyc2Su1tn
	ygsCHcD++V2rBfNnr3lhXw+lQzbgBlX4vsQHbkEGGkbS26UlFFwrHbO+0unMY/iy1vWKd85rHKY
	bS7gxq6tp4/OxrrA8dKQgi0XPCZpSzcobpcNIgaYwlPiq0CWgINuK/Colq3lvIW/DuTlw2r6cF2
	YV7rXgXFY04XhCq3ff7e0OuzuBE1t/tgEnZi6v5GxLMwo+zrT1Wjo3bj+ecm2wCYtKznshTeKd+
	sTIQsGEPFTM6LDPbbqKk2xCW9d01nNDOalFI/4CYNEMRt8dr9hDj/04MHulVkz/SgeiUvmz+12q
	/47L2njMQ4YhOzF6bmWwDtCobb+PQV7I84FzQyPQmcUEqKqPKq0=
X-Received: by 2002:a17:90b:5107:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3b182e6a221mr1613865a91.16.1794387078688;
        Wed, 11 Nov 2026 00:51:18 -0800 (PST)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm2396406a91.4.2026.11.11.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:51:18 -0800 (PST)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	sudeep.holla@kernel.org
Cc: zhanjie9@hisilicon.com,
	christian.loehle@arm.com,
	zhenglifeng1@huawei.com,
	sumitg@nvidia.com,
	lenb@kernel.org,
	maciej.wieczor-retman@intel.com,
	pawel.chmielewski@intel.com,
	gregkh@linuxfoundation.org,
	dakr@kernel.org,
	johan@kernel.org,
	ionela.voinescu@arm.com,
	pierre.gondois@arm.com,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	driver-core@lists.linux.dev,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH v6 3/3] arch_topology: Add topology_update_cpu_capacity() for runtime updates
Date: Wed, 11 Nov 2026 16:50:22 +0800
Message-ID: <20261111085022.1229866-4-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111085022.1229866-1-luoxueqin@kylinos.cn>
References: <20261111085022.1229866-1-luoxueqin@kylinos.cn>
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

When the CPPC Highest Performance register changes at runtime
(e.g. via ACPI Notify(0x85)), the scheduler's view of CPU capacity
and the frequency invariance engine's reference values become stale,
as topology_init_cpu_capacity_cppc() is only called once during boot.

Keep raw_capacity allocated after CPPC init instead of freeing it,
and introduce topology_update_cpu_capacity() to update per-CPU
raw_capacity, capacity_freq_ref, and the normalized CPU capacity
scale at runtime. Skip updates when the value is unchanged and
reject a zero capacity_scale to avoid division by zero.

Call this from cppc_cpufreq_update_limits() for every CPU in the
policy so shared-policy Notify(0x85) targeting a non-policy CPU
still refreshes the correct topology capacity.

Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/base/arch_topology.c   | 77 ++++++++++++++++++++++++++++++++++
 drivers/cpufreq/cppc_cpufreq.c | 10 ++++-
 include/linux/arch_topology.h  | 13 ++++++
 3 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index e51fc9f5e976..f64f8e61f210 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -229,6 +229,7 @@ static void update_topology_flags_workfn(struct work_struct *work)
 }
 
 static u32 *raw_capacity;
+static DEFINE_MUTEX(raw_capacity_lock);
 
 static int free_raw_capacity(void)
 {
@@ -370,13 +371,89 @@ static inline void topology_init_cpu_capacity_cppc(void)
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
+	if (highest_perf < perf_caps->nominal_perf ||
+	    highest_perf < perf_caps->lowest_perf) {
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
index 7dab6e046b9f..a693ef611caa 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -935,7 +935,7 @@ static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
 	struct cppc_perf_caps *caps;
 	u64 prev_highest_perf;
 	u64 highest_perf;
-	int ret;
+	int cpu, ret;
 
 	guard(cpufreq_policy_write)(policy);
 
@@ -984,6 +984,14 @@ static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
 
 	refresh_frequency_limits(policy);
 
+	/*
+	 * All CPUs of the policy share perf_caps, and Notify(0x85) may
+	 * target any CPU of a shared policy, so refresh the topology
+	 * capacity for every CPU of the policy, including offline ones.
+	 */
+	for_each_cpu(cpu, policy->related_cpus)
+		topology_update_cpu_capacity(cpu, caps);
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

