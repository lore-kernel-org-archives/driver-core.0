Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4433BED19
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913287; cv=none; b=mobE9nlcLBiih5wopwTvGjFAjqUL97ME0aFvZdYRw1V04iEHZU2evz4nnK8F1TV4MwB8Jnvgln5TKGpvMtigasNuc/TxqEmGf6xjmUKOjTdfE9OWRSa0O8BhQgPLUR9EXxN1jyqRBEXj/9yHSAgNB8yEL53LI9PDj4XHPw+sgrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913287; c=relaxed/simple;
	bh=0/KOApqABNEV7wcH8Mg00s8dvOA0OiTANlcC3Ua4Fts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqP3OyRZ5L3quMC06kKbjgJTizCKWmbOosBKK8k3RxpXuox9+ZoX/iBcB5iC7gcLt0iPWJUMRTp4AmXJPopEvj7IdQLIgjvP61xA+ZQfdEPASMHgj0VTn3jOvjXafUtLNXkPRq3x8seMiV5olJGQnkFn/ckvtxfJWe3uX08bcaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8419ab3a297so1684461b3a.2
        for <driver-core@lists.linux.dev>; Mon, 08 Jun 2026 03:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913286; x=1781518086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OE6TqXmf2pbUoWDnLCFA2nmSGpG6upG2Z62wfNJ5Ups=;
        b=d6J9ubFzqX21oi18V/Q9BQqf61A5CWdR7jd2OuD6Wst9kfaxPBojlPj9vr+b9JUWEN
         BESxUxQkuv/pbApAsxFf0DyTUR6VFJU4vYnQPE71zqvDgl7h5RNwy+01aBwaWfhjzMWj
         dEwLat2XhqVtbAxUOsZBOfGJbFcgIRQUYrlHruFCwFkRZaMUIRCp2R+wKGmOo+qBEmUU
         hvtwsK5uJ49tWa7QnSVDI/79UiMrDObzDWW9QzErzJKVg5EQit0VDoYiCLoBfCEC/vi2
         fa8S/c7mPbptizTr0TeH8iCBj6MUDCQ8WArWtsNHJySD3MSLZmVeNaX6yDFfEvW4f4i+
         Ks0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/gi2wNcc8uzDecWyxF/9COOknNtSyASCKahoO0NUU4KYlXpZN2cpo5HsREuOjvo5j8nXnjuxQHQptdlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbzmZ+6CQA0udhRn2rRBdA/27vveppTpENYRIClmhXJEgQooF2
	cnWEeuDVDw8ZOGpT/iLrX+52xa41OhVHdthtalS9dz0QkGYA4UiInahW
X-Gm-Gg: Acq92OFCsW1oPIW2TWEtIalPRbrLx9SPt1pooKi3WXV9n4RCpEWRO9ODvx1AXzA/9JN
	UlrABon/pKaYpdYnDLkJHPHPI/1AmGPsTm9ZBs5oW709SpmfgpdQR2myvd5Em6ZvhtHgCNwEnUi
	MjeOHNKXe4lCNYl3NAUgBi9/AaE2yZzilrdPF3YFEIouzcQf4ltpj8S+86NKXNZHuYCVsibpZKy
	5TkcLGy0s1Q7lVXEGny6bzjcY0z3NmWn4onzuJmQ+Buis8cFUzxJVNukGj6lUZFuQYYwiOMjrj7
	K6tYMvoN+tNrVemE1jc9Pa526sbxAMUZ3ykypynmtZxrvWhTKGrxNnc05SWjNiySDWVsWwfSIpQ
	DJqw9BHUAItUTzxCGbGDN40Sv+yMAhEmWFKahYCRuzyxO3tKqnfGlL62OZZ7h7GGXBk37V0YbFp
	QAqVf/od/Kr/m4zmQyAlU/SQ4jCt9Amvj5nNlYKVjaCz/Xvp7NdkhKTUs=
X-Received: by 2002:a05:6a00:2d8c:b0:842:5da3:9b83 with SMTP id d2e1a72fcca58-842b0f8ffdemr15173216b3a.33.1780913285884;
        Mon, 08 Jun 2026 03:08:05 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282883647sm20431045b3a.36.2026.06.08.03.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:08:05 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: sudeep.holla@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	viresh.kumar@linaro.org,
	zhanjie9@hisilicon.com,
	zhenglifeng1@huawei.com,
	pierre.gondois@arm.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH v4 1/3] cpufreq: cppc: Add update_limits support for Highest Performance changes
Date: Mon,  8 Jun 2026 18:07:44 +0800
Message-ID: <20260608100746.372535-2-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608100746.372535-1-luoxueqin@kylinos.cn>
References: <20260608100746.372535-1-luoxueqin@kylinos.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI CPPC specification requires OSPM to re-evaluate the Highest
Performance register when Notify(0x85) is received for a processor
device.

Implement cppc_cpufreq_update_limits() to refresh the cached
highest_perf capability through cppc_get_highest_perf() and update
policy->cpuinfo.max_freq accordingly. Use refresh_frequency_limits()
to let the cpufreq core update policy->max via the standard
cpufreq_set_policy() path instead of setting it directly.

Re-evaluate policy->boost_supported when highest_perf changes, as
boost capability depends on highest_perf exceeding nominal_perf.

Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/cppc_cpufreq.c | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index bf5175f7551c..56f13086ccee 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -843,6 +843,44 @@ static int cppc_cpufreq_set_boost(struct cpufreq_policy *policy, int state)
 	return 0;
 }
 
+static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
+{
+	struct cppc_cpudata *cpu_data = policy->driver_data;
+	u64 prev_highest_perf;
+	u64 highest_perf;
+	int ret;
+
+	guard(cpufreq_policy_write)(policy);
+
+	prev_highest_perf = cpu_data->perf_caps.highest_perf;
+
+	ret = cppc_get_highest_perf(policy->cpu, &highest_perf);
+	if (ret)
+		return;
+
+	if (highest_perf == prev_highest_perf)
+		return;
+
+	cpu_data->perf_caps.highest_perf = highest_perf;
+
+	/*
+	 * Re-evaluate boost capability based on the updated Highest
+	 * Performance. Boost is supported when highest_perf exceeds
+	 * nominal_perf.
+	 */
+	policy->boost_supported = highest_perf >
+				  cpu_data->perf_caps.nominal_perf;
+
+	policy->cpuinfo.max_freq = cppc_perf_to_khz(&cpu_data->perf_caps,
+			policy->boost_enabled ?
+			highest_perf : cpu_data->perf_caps.nominal_perf);
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
@@ -1036,6 +1074,7 @@ static struct cpufreq_driver cppc_cpufreq_driver = {
 	.init = cppc_cpufreq_cpu_init,
 	.exit = cppc_cpufreq_cpu_exit,
 	.set_boost = cppc_cpufreq_set_boost,
+	.update_limits = cppc_cpufreq_update_limits,
 	.attr = cppc_cpufreq_attr,
 	.name = "cppc_cpufreq",
 };
-- 
2.43.0

