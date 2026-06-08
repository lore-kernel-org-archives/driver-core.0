Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC053B7B99
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913294; cv=none; b=LdtPKryRVi8IdzGqa8ICCYvD3R0AcBCP5NnQ+eq1bqNgVepLd/7iREK5V4wXWBY9xnAVoTSu7+2MCkxUAYa+BXkvThQM9PlxPP6JxNYv38lo3YT4xiquumb6f6eiLkDgLfvxR8qkz49wv7M2AAsrGYQ/CksLqNrXAp/USVKv4Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913294; c=relaxed/simple;
	bh=knC1iLcmb2hGYfNTc5+XPgSkUcd7yVDNve5fuQsDrQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WfPIEF2V0e0q6lXk4lMUtWMugXdKuR/rvm5JzZzIzEkaxhI6/mjGn6NNFGnY4BxVWB0DHegLhCz4qIr5qSvW3g0LGmS3Ks62o916C4/VeqZOWfLpM6zvjyLmESZVe424T+i2Q3eKpLf9uLbQ4BZTxORPGM/P5S6As5HgHqk3a8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8422871b42dso2424035b3a.3
        for <driver-core@lists.linux.dev>; Mon, 08 Jun 2026 03:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913293; x=1781518093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i4An1q01rPObVQlERNHoxg891xhTY5PU7L2NrPuilBo=;
        b=f2xgYovNXk4176y6xWX6FOG8KgIAI62veBnaORdkm+v/MkFANxdv4Hfy3+U2cSqDIy
         BHtLzEA927F4fYOUQGEiinkaQrIfsc+USY2o7hAZ5cjeSc0VRCXig8vxwEyI0IlYE4aS
         c9Si8Vi6iIrZx11GnCcvsf9+jxKkJ6e0iz6ykpSAnx38m3oyVM/gg/mXxo89QBBuPWTZ
         na2J388/3TlPkeQUpImJsxs0bT86SiOfO/ho0W6SHzxj5eQ17NqIdV4YJtJnGnFskZ1X
         7rCuQMyP7A7yg5r5+YHEhNotb+OhuMO/As3+oYqma6b1laBJ3+K5bhpkJ159zc9RNUYH
         J1qw==
X-Forwarded-Encrypted: i=1; AFNElJ89tMUPXQjw/wzhgms/ajVCfk0hdBPvoF/5Y9rGSefcooC7e0t8mfiTMenWa2EL4t3QrG4a+Fj1jI9DwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGTfI6I5LevrLWGEsXIylKRY+v+q0kTn3g5SVm2Ifm09dQmmRL
	jCRMOMgO5oIZM7sRdsp6sMLSjgTtWhvZVd7bVyl8FRrzvPci3W+rXSWja8Y6QLbH
X-Gm-Gg: Acq92OF/JUnYLyqK0efEerUXrbUrdxPh7qHkp9NZqCUHwOrAtTC4sM7zBHUKBwFQ1FA
	QoDKB5GSFowO+6udFljXPh3RoAfqlGNgvvtaq0rpYKAS3YymM9o5CXWOmx17VSFPscs+Ak7o8kf
	3lAEYc8R5+tksiw14wzQ1t2RBOxNlTh2SKTOVR718AWax6ggdUKI/qOylx5bX83lBVV1aH3RjCi
	C8HsXbvv6uroPPNERfnJ7NinqfRs0nvxOSzn8A87i8MsUK/wkxET4EriSH6RSHBdzJP78u1tOc9
	SuzLHs/uRIWlfb4tU0cKgSgIv57A1MB3FH5OUzeC4ZpYCObqhy+lefS0hux/WgVsTDKZW5QIGlP
	5kRZ/lK/oavqWFc1RhvZcQGlSVSAFCA3OAwzpteaMtb6/FxFXUF3Vn0NySR2Q6CXDT8/er4+SKD
	GvuVWGIP4+2xoXlBxop+iPAAOHJrFc7YUPC92NYW4D6/L/IQcjyiArxBE=
X-Received: by 2002:a05:6a00:400a:b0:842:4387:34b7 with SMTP id d2e1a72fcca58-842b0c06b07mr14497614b3a.10.1780913292683;
        Mon, 08 Jun 2026 03:08:12 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282883647sm20431045b3a.36.2026.06.08.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:08:12 -0700 (PDT)
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
Subject: [PATCH v4 2/3] cpufreq: cppc: Refactor autonomous perf bounds into helper
Date: Mon,  8 Jun 2026 18:07:45 +0800
Message-ID: <20260608100746.372535-3-luoxueqin@kylinos.cn>
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

Extract the autonomous selection performance bounds programming from
store_auto_select() into a reusable cppc_cpufreq_set_autonomous_perf()
helper. The helper saves and restores MIN/MAX performance on failure,
keeping the rollback logic co-located with the programming sequence.

Reuse the helper in cppc_cpufreq_update_limits() so that when
Highest Performance changes at runtime, the autonomous MIN/MAX
envelope is re-programmed against the updated capability. Add a
pr_debug message on failure for diagnostics.

Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/cppc_cpufreq.c | 56 ++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 56f13086ccee..80a44a9a29fa 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -843,6 +843,36 @@ static int cppc_cpufreq_set_boost(struct cpufreq_policy *policy, int state)
 	return 0;
 }
 
+/**
+ * cppc_cpufreq_set_autonomous_perf - Configure performance bounds for
+ *                                     autonomous mode
+ * @policy: cpufreq policy structure
+ *
+ * When autonomous selection is enabled, program MIN_PERF and MAX_PERF
+ * from current policy limits so that the platform uses the correct
+ * performance bounds immediately.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int cppc_cpufreq_set_autonomous_perf(struct cpufreq_policy *policy)
+{
+	struct cppc_cpudata *cpu_data = policy->driver_data;
+	u32 old_min_perf = cpu_data->perf_ctrls.min_perf;
+	u32 old_max_perf = cpu_data->perf_ctrls.max_perf;
+	int ret;
+
+	cppc_cpufreq_update_perf_limits(cpu_data, policy);
+
+	ret = cppc_set_perf(policy->cpu, &cpu_data->perf_ctrls);
+	if (ret) {
+		cpu_data->perf_ctrls.min_perf = old_min_perf;
+		cpu_data->perf_ctrls.max_perf = old_max_perf;
+		return ret;
+	}
+
+	return 0;
+}
+
 static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
 {
 	struct cppc_cpudata *cpu_data = policy->driver_data;
@@ -877,6 +907,18 @@ static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
 
 	refresh_frequency_limits(policy);
 
+	/*
+	 * Autonomous selection mode uses MIN/MAX performance as runtime
+	 * hardware control bounds. Re-program them when highest_perf
+	 * changes so that the platform uses the updated bounds.
+	 */
+	if (cpu_data->perf_ctrls.auto_sel) {
+		ret = cppc_cpufreq_set_autonomous_perf(policy);
+		if (ret)
+			pr_debug("CPU%d: failed to update autonomous perf: %d\n",
+				 policy->cpu, ret);
+	}
+
 	pr_debug("CPU%d: highest_perf updated %llu -> %llu\n",
 		 policy->cpu, prev_highest_perf, highest_perf);
 }
@@ -923,20 +965,8 @@ static ssize_t store_auto_select(struct cpufreq_policy *policy,
 	cpu_data->perf_ctrls.auto_sel = val;
 
 	if (val) {
-		u32 old_min_perf = cpu_data->perf_ctrls.min_perf;
-		u32 old_max_perf = cpu_data->perf_ctrls.max_perf;
-
-		/*
-		 * When enabling autonomous selection, program MIN_PERF and
-		 * MAX_PERF from current policy limits so that the platform
-		 * uses the correct performance bounds immediately.
-		 */
-		cppc_cpufreq_update_perf_limits(cpu_data, policy);
-
-		ret = cppc_set_perf(policy->cpu, &cpu_data->perf_ctrls);
+		ret = cppc_cpufreq_set_autonomous_perf(policy);
 		if (ret) {
-			cpu_data->perf_ctrls.min_perf = old_min_perf;
-			cpu_data->perf_ctrls.max_perf = old_max_perf;
 			cppc_set_auto_sel(policy->cpu, false);
 			cpu_data->perf_ctrls.auto_sel = false;
 			return ret;
-- 
2.43.0

