Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DDA3AD535
	for <driver-core@lists.linux.dev>; Sun,  6 Sep 2026 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788712687; cv=none; b=MReAsqJTWn96YYxg5rWXMKyNvFQ970zO2/OMpn1e3HMIJUYrkFG6mdtrlvS5ALeeJATNmGJ8Rc2qpTi+GEdhEMGNrJ1Yo7PAdeug06BX9JReHCYgsw6KTVyIzF5hKDDlfe3LtuTlmKQOpuv2KsUlIoBhB+eJlH91dDejw3HGL9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788712687; c=relaxed/simple;
	bh=2A/bFpgouVbrudsY/DKa70GuRJvEHtXMkw6oxpmlIoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShJwWv53l6wmV/pQ1gBCCwkyW2hg0s5jAvUb09tOkhGqXbkN1SS4CD2Y6IZNtGy+Q/aYluxs2wcWB5/erK4JiFZZ/ZXfyHsD0ki04eKLIGjljhBstWnVOoBov5hQykvMxS+4/slNO4d9I2XpiM2gi2MIr+P3QBO3UPHWiVuPRLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAMH4GG/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAMH4GG/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so32762065e9.2
        for <driver-core@lists.linux.dev>; Sun, 06 Sep 2026 09:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788712684; x=1789317484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unH3oepzWSgpuS34FgHtBwo/OR2UjhvPi9YUi7nKPQc=;
        b=bAMH4GG/M1skIbkmtJPu+ilmRAXpjN7eclsXStJ+2FDagWh6fxR079IuM3U3R+pCF+
         N/8BdWXxagvzA/zwlMtbGOcfHhWdUIKkF6h31s/M0gF6JJUi6cCQcJ3ofQJ1IazANUb9
         xR8VXIU2/6m5j7XGP4ll089NdE3WJaqC2JXuLW9J556reQh1DUN+pisywAH1u5fLlFey
         hD3WqGtueAI9PYZ2SWTGJv0OOd0s+sxaPb7vXgU990Ozw+maO2I/o6BkZen9/7tGOm3k
         VmagoIadnvusb8DCwgi2xjvnWuX0p6DVMe4Iqg2t8AfSTHOVe1IltvY8XOco/HYV6izG
         W/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712684; x=1789317484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unH3oepzWSgpuS34FgHtBwo/OR2UjhvPi9YUi7nKPQc=;
        b=U193pEPdlMHRb+GeRDQpGdBHU6yWOqVcxi0l0or/c8+ZGYQy6wTxAybRzEkbGYW7YW
         7LFJhJq7hFaJ23+NS4vriLmKHXDhdypSU5HwGP0ir9POSMqztHCl6m6gFEmMn5+y1qnF
         Db+RoKWTi9SRRDOrvP7ilC4r4XyeWx7RuvSMAC89fyOsBsoaoVvRgVmGmb/YH/GzIiwN
         uNDV4ZmAg8XshjvfKWLWvuzEjJVG7vYRhfmUzUU5AbOsZKCbZ+c+dT87G4pGyLVhCqdX
         n9y9i3mSKBbj4IWTxd7WWH8KzXDUv3G0jWHAjwGJ23omPAUAiYURmcS1Fnk/ugs4ali6
         4gRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzj42e9Pb9tw0OtnE03cwTNoZ2bYh2jgSm9kstVHd7bspoBmowqd2Q9TbeUrpxmwXHVEAdZ7HFBokiMSw==@lists.linux.dev
X-Gm-Message-State: AFuF++n4vMderDFRCH8Beq/p4OgUCCfnC4TW0KQAd9N1awOEI0l/GsXO
	DftzzjCbtYKpqAJpLwKB7/JNF+LVoaHfMd7TguOrwuC5BFFonhHJ0WmP
X-Gm-Gg: AYBFou2v4lYQ9r4GhQvGgOyUt/dXGHTdtHeaq69m6LSdYt+P1f36/+5PDP+82z/JBtI
	3CaMu4yehS8SbyJ5mm7GwshoMUO4FmRaaxM+l2xQl8eCTkJBDVRgaMhCgvaSBU9LoIpCva4wXUY
	HQxvbMN7PVlNLsURpVo/+Rx72VZZiwkbmOjkFNM3JX+AIiIJ35s23pnFeyKHyFajfJmNG+sshCS
	ndckTUBnqum+ZcQ7sA8Xl2RErRHVRfVnQG3YUbUp6jCgJDppsxPfnOwgsgEzFT9uWFfSB/X4er9
	uOX8rVc5K+ly41jHkl4/0wgmBsKIqh76/2dDQ+UxALCnxkajtID1q5YjGVy5QRk7U345ddyhnu7
	azzUcsjOaam951yAcBTx308as4LUbQI7OVcZcXxovZqxhIMfN4gp6zOj5cX9ktzAfdtlYzDDEZr
	QylGC2w7e688r6P2HMkoEU3ZOrtf05zkJ3YmjY3Bi8AZqic2A68ZEjEEiAig4l9BfmXRO0cSJCl
	AA7Kl98gwZvQyzsUru2hqXB/Rw=
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr215148465e9.12.1788712683872;
        Sun, 06 Sep 2026 09:38:03 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm20907997f8f.36.2026.09.06.09.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:38:03 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH v1 2/2] cpufreq: update capacity_freq_ref when the boost state changes
Date: Sun,  6 Sep 2026 18:37:15 +0200
Message-ID: <44b381bd07c299a3551037e57fdd5fa9f272dc25.1788712186.git.okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788712186.git.okerixx@gmail.com>
References: <cover.1788712186.git.okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

capacity_freq_ref is latched from policy->cpuinfo.max_freq by
init_cpu_capacity_callback() on CPUFREQ_CREATE_POLICY, and never
updated afterwards.

cpufreq_frequency_table_cpuinfo() excludes CPUFREQ_BOOST_FREQ entries
while boost is disabled, so on a system that boots with boost off the
latched value is the non-boost maximum.  Enabling boost later raises
policy->cpuinfo.max_freq but leaves capacity_freq_ref behind.

Two things then go wrong on arm64, where the AMU drives frequency
invariance.  amu_scale_freq_tick() caps the computed scale at
SCHED_CAPACITY_SCALE, so a CPU running above capacity_freq_ref
saturates at 1024: the scheduler cannot tell a boosted CPU from one at
the sustained maximum, and utilisation is underestimated.  And
arch_freq_get_on_cpu(), which reverses that computation, cannot report
more than capacity_freq_ref, so cpuinfo_avg_freq is pinned to the
non-boost maximum.

On a Snapdragon X2 Elite (Glymur) laptop with a 4032000 kHz sustained
and a 4723200 kHz boost OPP, cpuinfo_avg_freq reads exactly 4032000
while the CPU runs at 4723200; a fixed workload completes in 1.72 s
rather than the 2.01 s that frequency would imply.

Factor the update out of init_cpu_capacity_callback() into
topology_update_freq_ref() and call it from policy_set_boost(), which
is the common path for the global boost knob, the per-policy one, and
the CPU online path.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      | 19 +++++++++++++------
 drivers/cpufreq/cpufreq.c         |  2 ++
 include/linux/arch_topology.h     |  1 +
 include/linux/cpufreq.h           |  7 +++++++
 7 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/topology.h b/arch/arm/include/asm/topology.h
index ad36b6570067..a776a79885ee 100644
--- a/arch/arm/include/asm/topology.h
+++ b/arch/arm/include/asm/topology.h
@@ -11,6 +11,7 @@
 #ifndef CONFIG_BL_SWITCHER
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_set_freq_scale topology_set_freq_scale
+#define arch_update_freq_ref topology_update_freq_ref
 #define arch_scale_freq_capacity topology_get_freq_scale
 #define arch_scale_freq_invariant topology_scale_freq_invariant
 #define arch_scale_freq_ref topology_get_freq_ref
diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index b9eaf4ad7085..a4b96a7ee4a5 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -22,6 +22,7 @@ void update_freq_counters_refs(void);
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick topology_scale_freq_tick
 #define arch_set_freq_scale topology_set_freq_scale
+#define arch_update_freq_ref topology_update_freq_ref
 #define arch_scale_freq_capacity topology_get_freq_scale
 #define arch_scale_freq_invariant topology_scale_freq_invariant
 #define arch_scale_freq_ref topology_get_freq_ref
diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
index fe1a8bf6902d..a363d72c174f 100644
--- a/arch/riscv/include/asm/topology.h
+++ b/arch/riscv/include/asm/topology.h
@@ -11,6 +11,7 @@
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick		topology_scale_freq_tick
 #define arch_set_freq_scale		topology_set_freq_scale
+#define arch_update_freq_ref		topology_update_freq_ref
 #define arch_scale_freq_capacity	topology_get_freq_scale
 #define arch_scale_freq_invariant	topology_scale_freq_invariant
 #define arch_scale_freq_ref		topology_get_freq_ref
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..79eb1681065d 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -317,6 +317,18 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
 	return !ret;
 }
 
+void topology_update_freq_ref(const struct cpumask *cpus, unsigned int max_freq)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		per_cpu(capacity_freq_ref, cpu) = max_freq;
+		freq_inv_set_max_ratio(cpu,
+				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
+	}
+}
+EXPORT_SYMBOL_GPL(topology_update_freq_ref);
+
 void __weak freq_inv_set_max_ratio(int cpu, u64 max_rate)
 {
 }
@@ -392,7 +404,6 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 			   void *data)
 {
 	struct cpufreq_policy *policy = data;
-	int cpu;
 
 	if (val != CPUFREQ_CREATE_POLICY)
 		return 0;
@@ -403,11 +414,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
-	for_each_cpu(cpu, policy->related_cpus) {
-		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
-		freq_inv_set_max_ratio(cpu,
-				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
-	}
+	topology_update_freq_ref(policy->related_cpus, policy->cpuinfo.max_freq);
 
 	if (cpumask_empty(cpus_to_visit)) {
 		if (raw_capacity) {
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0d0df986fa3d..289649baa061 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -594,6 +594,8 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
 		return ret;
 	}
 
+	arch_update_freq_ref(policy->related_cpus, policy->cpuinfo.max_freq);
+
 	return 0;
 }
 
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f96..4974f5e1a7fe 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -31,6 +31,7 @@ static inline unsigned long topology_get_freq_scale(int cpu)
 
 void topology_set_freq_scale(const struct cpumask *cpus, unsigned long cur_freq,
 			     unsigned long max_freq);
+void topology_update_freq_ref(const struct cpumask *cpus, unsigned int max_freq);
 bool topology_scale_freq_invariant(void);
 
 enum scale_freq_source {
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 35ce665edfd8..5b904e13eb21 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1235,6 +1235,13 @@ void arch_set_freq_scale(const struct cpumask *cpus,
 }
 #endif
 
+#ifndef arch_update_freq_ref
+static __always_inline
+void arch_update_freq_ref(const struct cpumask *cpus, unsigned int max_freq)
+{
+}
+#endif
+
 /* the following are really really optional */
 extern struct freq_attr cpufreq_freq_attr_scaling_available_freqs;
 extern struct freq_attr cpufreq_freq_attr_scaling_boost_freqs;
-- 
2.55.0

