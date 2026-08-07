Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105BB448BA7
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083130; cv=none; b=AIwmSSwLxqyNu9TcBltm9e1WlvNkuozukyq/Z4Z73uXUFS30Xho4+o9Yhk8P666ZdwCw5vt0ZGcrmnToRDGKB0Vwe7K1lYuJcx7UbXaxlq94DiwFTQNv2UybcByurMfqjmo3D7CY7HifFfSG2zy+DGl5dV+Oma2MV+U1RvnmDqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083130; c=relaxed/simple;
	bh=CBkY0c3xbjJo5xy0a0Ya0TPioAfVbM03GZcCRoqC/+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqQOGEbxjBcyxnL64TIcsN7LAYcIb6em/yGkmo7cWnGQl36KA3hqu3okRRYcfxm52U/Hlv8T6yqa9LXfk47kSyYUGQ99SFdkWpm3QCbr6+N2bPSUwxL5hNqgwHtFDtJRKMbqGeb5WshxX87HRaXbToHnaGdBoDFEQWZrLML/+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-381c69ad0d9so1469237a91.0
        for <driver-core@lists.linux.dev>; Thu, 06 Aug 2026 23:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786083128; x=1786687928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIKFf5IUphGedu29HI3S87K+WXZgW1+znZSL9A0NdHw=;
        b=fDgHonREd7r2qGFxYPydWZz+6h8ZbUcJXQ6W7aUYumj0U5PooqznPeecyiV8YArY2S
         jCgrs/5BfTyeF+Jd5CcFiMFfzUzB8ZkD33irH8t2GvsVtr6PjdjsCn6gVgzAi7W1AeIp
         NqGSg9iRfdCocM4TQnolod3H425Hc5ogrhjQgbBfGQHHSZDlEQVmU2N+T1XM7ai3o9W1
         Fa3bppqrL1UMKs9nbU5+BDdkttGPHgvcou6ZxlHjdOk1KfTGAgkNOnRDfSqtpPoenV6s
         h2PbVLhiMNFEMGFVovMRSll+jzEabsFnilQlLJ9tZz5+fnDXTuHgVnAMo3tTpkIxTDf2
         45Yw==
X-Forwarded-Encrypted: i=1; AHgh+RqLQ0REIXUge+VsSqc0B0VMEpyNaLNXhvMcDEdsozNutna9/tuoE24FLOVmf5pbRLhUw/sjIO7yG62GZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOMNxeZ1ddEaB7QoyDZ2TpBhtx8Y4LT6ndDTQEoeYIQ6SiKxZ2
	Gt9NZ4LxAkHHs6xgZARlypxUlvl4j2e8RvwRMG6v/PAheVorNmZsxbYS
X-Gm-Gg: AR+sD11A+/I6d6ilhgrqnoTFjIjUsLNWZB5AyEZ180lALtiPnFu9B3WNMR/3lrFhg+7
	mETUmRcPWiyFIQSNMiTYCyns2/xZpzhAFkFDEHtaF4iLkOnKxw+p8CPMz2OR+c3wwyw6e7MwvMS
	4oPgqdT/ooZLe6CQZVtrDpiKmorgm0LQfkZGF36Nmh08aXj3ldmKdIq2ojKnxvdnGns1s1txy3h
	zSOxYWRWt+z5tnL5Ob/tBuJ10wKnQ7LKkuuMVnlC5khuHgpyMIg9IR5Ug/UE5e6SjUI9xOB6zcY
	MxbmOuIeUivSSpgu06hYWAIx8XcsWWhUQWs3QBO32AhatABTHj0yCfn4+ccuMeE5DX+KyGryBPo
	WppDO8CfR2sAnsV+nz7K+ADRj2oDb6E3TsPB33bswLRG8LIYHOUZYU8LRk2aHcUQEfzUYejgKPa
	Wvbl7nnmvYSjTJfppK92yZv+pWCRMkcmNcE5Bw5PSTLstsWfvHJ12ic4QUVa/yuVmdbReYBYuwU
	iknXdU6Ag==
X-Received: by 2002:a17:90b:1d02:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3903c599356mr20672051a91.2.1786083128112;
        Thu, 06 Aug 2026 23:12:08 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dbe349sm3434375a91.4.2026.08.06.23.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:12:07 -0700 (PDT)
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
Subject: [PATCH v5 1/3] cpufreq: cppc: Add update_limits support for Highest Performance changes
Date: Fri,  7 Aug 2026 14:08:46 +0800
Message-ID: <20260807060848.832929-2-luoxueqin@kylinos.cn>
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

ACPI CPPC specification requires OSPM to re-evaluate the Highest
Performance register when Notify(0x85) is received for a processor
device.

Implement cppc_cpufreq_update_limits() to refresh the cached
highest_perf capability through cppc_get_highest_perf() and update
policy->cpuinfo.max_freq from Highest Performance. Use
refresh_frequency_limits() so policy->max follows the standard
cpufreq_set_policy() path.

cpuinfo.max_freq always tracks Highest Performance. When boost is
disabled but still supported, constrain policy->max by updating the
existing boost_freq_req (created in cpufreq_policy_init_qos) to
nominal, instead of hiding the hardware maximum in cpuinfo.

Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/cppc_cpufreq.c | 98 ++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 6fe0e972952a..089f734f851b 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -855,6 +855,103 @@ static int cppc_cpufreq_set_boost(struct cpufreq_policy *policy, int state)
 	return 0;
 }
 
+/**
+ * cppc_cpufreq_sync_boost_limits - Sync boost flag, cpuinfo max and boost QoS
+ * @policy: cpufreq policy
+ * @boost_supported: whether highest_perf currently exceeds nominal_perf
+ *
+ * Highest Performance can appear or disappear at runtime via Notify(0x85).
+ *
+ * cpuinfo.max_freq always tracks the hardware maximum derived from Highest
+ * Performance so that sysfs reflects Notify(0x85) updates. Boost being off
+ * is enforced by updating the existing boost_freq_req to nominal (capping
+ * policy->max) rather than by hiding the hardware max in cpuinfo.
+ * boost_freq_req itself is only created at policy init, not here.
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
+	/*
+	 * Report the current hardware maximum. If Highest dropped below
+	 * Nominal (unusual, but possible with test overrides), never
+	 * advertise more than Highest allows.
+	 */
+	policy->cpuinfo.max_freq = highest_freq;
+
+	if (boost_supported && !policy->boost_enabled)
+		qos_freq = min(nominal_freq, highest_freq);
+	else
+		qos_freq = highest_freq;
+
+	/*
+	 * boost_freq_req is created in cpufreq_policy_init_qos() when
+	 * boost_supported is true at policy init. Runtime Highest changes
+	 * only update that existing request; they do not add or remove it.
+	 */
+	if (freq_qos_request_active(&policy->boost_freq_req)) {
+		ret = freq_qos_update_request(&policy->boost_freq_req,
+					      qos_freq);
+		if (ret < 0)
+			pr_debug("CPU%d: failed to sync boost QoS: %d\n",
+				 policy->cpu, ret);
+	}
+
+	pr_debug("CPU%d: highest_perf=%u boost_en=%d cpuinfo_max=%u qos_max=%u\n",
+		 policy->cpu, caps->highest_perf, policy->boost_enabled,
+		 policy->cpuinfo.max_freq, qos_freq);
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
@@ -1048,6 +1145,7 @@ static struct cpufreq_driver cppc_cpufreq_driver = {
 	.init = cppc_cpufreq_cpu_init,
 	.exit = cppc_cpufreq_cpu_exit,
 	.set_boost = cppc_cpufreq_set_boost,
+	.update_limits = cppc_cpufreq_update_limits,
 	.attr = cppc_cpufreq_attr,
 	.name = "cppc_cpufreq",
 };
-- 
2.43.0

