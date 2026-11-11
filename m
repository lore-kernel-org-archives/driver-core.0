Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387056;
	b=4RTEGv0y+gwLhvVp1FakC3rULX1TotfVIT7T+yI6LZcpg+n7iuIBKQA1iA2MxNyjRMRm
	 tnT2UVag0dbrcUIraeOFf10rN3KRQd1elZ35ANdAKfZq3vq7iBOZbxGVIVAz7MZUZsKv8
	 S0BYz2xTwHVIzviszPv48Wo145bXP1VAPeNo/hRuS+ak0zhmF3P5RSBFwPDvoRKY4ZC7m
	 FF8UIB2TAFWPI09b3uDZVxCgNfZCn0XFckk/n0thNPLj2wDcKEiUxf6gyAfDodxUlvBQH
	 qtOvcVmSQ3Qo7ZRAXRltCs6QriomPyQuMFNW6SjNNhe/iH3tGJwQEbMbGlOb6Wk9TWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387056;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7IJMVKlqwUed8zydAYGUP2kRgknMc/eLRSJkUQNzdf0=;
	b=fzvQPSqfSC4Qf1RqudKlIhtNMt8YcHmKSLJ8RZVruGLAW/WehPAFwN9hEtlQhqg69u9m
	 SPFC0FkxZ5hoeMvDVdV4WCwi/DWM/INgHqgOx3eUVOkY6RXX2VUoRHXFJHCBtzS9nUiQ7
	 LrP7DwkktpDqlBrj6q0yWzfpP9zJNgbGAB0+yZXI9M1qOXCkeekyBReGd1+8kGfoed6mv
	 avmCrowQcGPxDQ/HRqQTjkAkjAgmX6BYTkHil76IyrR7UGkkwPLhzv/ZtvWL8zTEVSF+q
	 JNZkTdKpKaxKjVBlkA+EwQcs7M5GSyBSiyURt+1XwFArcSJ1kH9yxWkSnIpErrDi6qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2269B606A32A
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 08:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2269B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3adfd217146so1073543a91.1
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 00:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387054; x=1794991854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7IJMVKlqwUed8zydAYGUP2kRgknMc/eLRSJkUQNzdf0=;
        b=TvS9gVv+weFkOiE5KTN4gvEz/nGQvdb9orT+BNhA6ac/p29U5PiJeAsczoJFBZDr1i
         M4MIeG/tO/Sz9JWP7IeCHN1alUraxjTZTijvJ8Z+X8EqBspf4sa+2phKpHVnBbXF4TK+
         XG87iHg/E3Q9XbqiupVvm6Yab5dD3AWkay8IO/VjY9pCleZ9a0v/g1LN1pCWjqZQZ/Vw
         XqWZON93F4QX6CI66knkvEnnw/LljzvfqCWswj1StXNrfBWglBw6NCfOJqdhu1/8i7OZ
         y1fcDH5P91Orpmcak6931ILvm5wigL/LCNuY+2P2343SeNuDqgzvhlHsfycWNdEhsXxS
         1o8Q==
X-Forwarded-Encrypted: i=1; AL+hErHE/UG4HovI/9Ng7cxkvUvIecA8zLnhD734uYfv2viPrAP0hGuLgTxmbgnwBZxR5FI9w1dhWZuItq7VXg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9MvA2llqrQNZZ78XddQMtZmpL42+PZB0IBoooT6S1HImqlkY02
	hPv8WyH1o93I6Zg1CElHeOsqpdf3VH6kY/xo6Upg9ylMEWoIRJeUO/fD
X-Gm-Gg: AYBFou3CokyFuKKjVhY/NcdciV0FUzTqY/P/9/RWntnV3w/Ktj9xw3/lIVZSDMGC3AW
	Yb3e/0EieDZ229Pn+1RS+SJVzDL20OHlCRtbdtdBu8eQ6szL5nDmw2U3pSr0H/N0NdGbz3lHW6z
	Fz0+XeDaqdAkpzbSAIap2762Ng7cg5SicZ814V1HqSABubE4NTkhZeZreNAFZ7WRJHNnCi6JZfe
	sASrA2uw1xInko8iOmwkj3/RAT9jfdOgsL3ARF7ZMBn/PIBEf/iqDmwAbWpDXMgyyoa9i07vtbm
	eex0FfoQ6Wx2iL6vSVhMv+ns/REdJY9tyN4ZQWSBxCRDv1kxpTCDuiZPH0X7RsVkoP8RNGEoMwz
	0b2O5YqYT3jfFvJFUYtYxFPtQcPzhQZIFj68Vwi3Ojm2FwHRJeSkot2v1GTFlwpCROlTaSquZ0r
	d1HLMF5GZX+4BHxmGaZy0u5+z5SSvUD+bIxYi1pkuLZj+qw2n9tH7E/1fSZy9IGBDaSAt2OnV8P
	HDLRmIypFYTJFapQ2ciTQr3EzOiI+vVoilFeYJC0EhE19IHhm5Qcv9E1lsUJeQ4xwExFWkXhups
	DrBmCCClng0GH5eykamfpBFdDr9tKMN3C/ufyjer1Qe+z/wD4us=
X-Received: by 2002:a17:90a:dfcf:b0:3ac:9ed8:f319 with SMTP id 98e67ed59e1d1-3b182e1260cmr1820945a91.2.1794387054419;
        Wed, 11 Nov 2026 00:50:54 -0800 (PST)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm2396406a91.4.2026.11.11.00.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:50:54 -0800 (PST)
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
Subject: [PATCH v6 1/3] cpufreq: cppc: Add update_limits support for Highest Performance changes
Date: Wed, 11 Nov 2026 16:50:20 +0800
Message-ID: <20261111085022.1229866-2-luoxueqin@kylinos.cn>
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

ACPI CPPC specification requires OSPM to re-evaluate the Highest
Performance register when Notify(0x85) is received for a processor
device.

Implement cppc_cpufreq_update_limits() to refresh the cached
highest_perf capability through cppc_get_highest_perf() and update
policy->cpuinfo.max_freq from Highest Performance. Use
refresh_frequency_limits() so policy->max follows the standard
cpufreq_set_policy() path.

Cap runtime changes at the Highest Performance probed at policy
init: any value above it is ignored, as it would allow boost support
to appear after policy init, which the cpufreq core cannot handle
because the boost QoS request is only created at policy init. Within
that bound both decreases and increases are accepted, e.g. a
platform switching back to a performance mode restores the previous
value. A policy initialized without boost cannot gain it at runtime
without core support for creating the QoS request later. Values
that would drop Highest Performance below Nominal are ignored too:
they violate the CPPC invariant and handling them would require
special-casing throughout the driver.

cpuinfo.max_freq always tracks Highest Performance. When boost is
disabled but still supported, constrain policy->max by updating the
existing boost_freq_req (created in cpufreq_policy_init_qos) to
nominal, instead of hiding the hardware maximum in cpuinfo.

Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/cppc_cpufreq.c | 100 +++++++++++++++++++++++++++++++++
 include/acpi/cppc_acpi.h       |   1 +
 2 files changed, 101 insertions(+)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 957fa7775260..3bca30f5c0d5 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -639,6 +639,8 @@ static struct cppc_cpudata *cppc_cpufreq_get_cpu_data(unsigned int cpu)
 		goto free_mask;
 	}
 
+	cpu_data->init_highest_perf = cpu_data->perf_caps.highest_perf;
+
 	ret = cppc_get_perf(cpu, &cpu_data->perf_ctrls);
 	if (ret) {
 		pr_debug("Err reading CPU%d perf ctrls: ret:%d\n", cpu, ret);
@@ -866,6 +868,103 @@ static int cppc_cpufreq_set_boost(struct cpufreq_policy *policy, int state)
 	return 0;
 }
 
+/*
+ * Boost being off is enforced through the boost_freq_req QoS request
+ * (capping policy->max) rather than by hiding the hardware maximum in
+ * cpuinfo, so sysfs keeps reflecting Notify(0x85) updates.
+ */
+static void cppc_cpufreq_sync_boost_limits(struct cpufreq_policy *policy,
+					   bool boost_supported)
+{
+	struct cppc_cpudata *cpu_data = policy->driver_data;
+	struct cppc_perf_caps *caps = &cpu_data->perf_caps;
+	unsigned int highest_freq, nominal_freq, qos_freq;
+	int ret;
+
+	if (!boost_supported && policy->boost_enabled)
+		policy->boost_enabled = false;
+
+	policy->boost_supported = boost_supported;
+
+	highest_freq = cppc_perf_to_khz(caps, caps->highest_perf);
+	nominal_freq = cppc_perf_to_khz(caps, caps->nominal_perf);
+
+	policy->cpuinfo.max_freq = highest_freq;
+
+	if (boost_supported && !policy->boost_enabled)
+		qos_freq = nominal_freq;
+	else
+		qos_freq = highest_freq;
+
+	/* boost_freq_req only exists if boost was supported at policy init. */
+	if (freq_qos_request_active(&policy->boost_freq_req)) {
+		ret = freq_qos_update_request(&policy->boost_freq_req,
+					      qos_freq);
+		if (ret < 0)
+			pr_err("CPU%d: failed to sync boost QoS: %pe\n",
+			       policy->cpu, ERR_PTR(ret));
+	}
+}
+
+static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
+{
+	struct cppc_cpudata *cpu_data;
+	struct cppc_perf_caps *caps;
+	u64 prev_highest_perf;
+	u64 highest_perf;
+	int ret;
+
+	guard(cpufreq_policy_write)(policy);
+
+	if (policy_is_inactive(policy))
+		return;
+
+	cpu_data = policy->driver_data;
+	caps = &cpu_data->perf_caps;
+
+	prev_highest_perf = caps->highest_perf;
+
+	ret = cppc_get_highest_perf(policy->cpu, &highest_perf);
+	if (ret)
+		return;
+
+	if (highest_perf == prev_highest_perf)
+		return;
+
+	/*
+	 * Cap increases at the Highest Performance probed at policy
+	 * init: a value above it would let boost support appear on
+	 * policies that started without boost, which the core cannot
+	 * handle (the boost QoS request is created at init only).
+	 * Within that bound both directions are accepted, e.g. a
+	 * platform switching back to a performance mode.
+	 */
+	if (highest_perf > cpu_data->init_highest_perf)
+		return;
+
+	/* A value below Nominal violates the CPPC invariant; ignore it. */
+	if (highest_perf < caps->nominal_perf) {
+		pr_warn("CPU%d: ignoring highest_perf %llu below nominal %u\n",
+			policy->cpu, highest_perf, caps->nominal_perf);
+		return;
+	}
+
+	caps->highest_perf = highest_perf;
+
+	/*
+	 * Re-evaluate boost capability/status based on the updated Highest
+	 * Performance. Boost is supported when highest_perf exceeds
+	 * nominal_perf.
+	 */
+	cppc_cpufreq_sync_boost_limits(policy,
+				       highest_perf > caps->nominal_perf);
+
+	refresh_frequency_limits(policy);
+
+	pr_debug("CPU%d: highest_perf updated %llu -> %llu\n",
+		 policy->cpu, prev_highest_perf, highest_perf);
+}
+
 static ssize_t show_freqdomain_cpus(struct cpufreq_policy *policy, char *buf)
 {
 	struct cppc_cpudata *cpu_data = policy->driver_data;
@@ -1060,6 +1159,7 @@ static struct cpufreq_driver cppc_cpufreq_driver = {
 	.init = cppc_cpufreq_cpu_init,
 	.exit = cppc_cpufreq_cpu_exit,
 	.set_boost = cppc_cpufreq_set_boost,
+	.update_limits = cppc_cpufreq_update_limits,
 	.attr = cppc_cpufreq_attr,
 	.name = "cppc_cpufreq",
 };
diff --git a/include/acpi/cppc_acpi.h b/include/acpi/cppc_acpi.h
index 5bcdb0e553b9..df43f2f2e79e 100644
--- a/include/acpi/cppc_acpi.h
+++ b/include/acpi/cppc_acpi.h
@@ -163,6 +163,7 @@ struct cppc_cpudata {
 	struct cppc_perf_caps perf_caps;
 	struct cppc_perf_ctrls perf_ctrls;
 	struct cppc_perf_fb_ctrs perf_fb_ctrs;
+	u32 init_highest_perf;
 	unsigned int shared_type;
 	cpumask_var_t shared_cpu_map;
 };
-- 
2.43.0

