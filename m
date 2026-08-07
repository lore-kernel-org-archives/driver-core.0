Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91AC448BA7
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 06:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083137; cv=none; b=EBkFpqwCBHTTAniSNweM2OK7VKfwU6ztnl1ruiyl5BhKipJjU5zavfJvbjZJaedQIFpMMkvyxi5pJJkWAJNSWeO6BqHAOjdvMIpP9GYFmV/C1qVAecLHZnA+NR4292S+iuBNT4Qzn7Mjvb4JjGHjz+bKF+kFPGnr+kpMTqFLZC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083137; c=relaxed/simple;
	bh=oetLtZV/iWveJIyrgkmKXIj79dzYiKvpZNDFjPJZPJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0VHCtmknVH07iOjEglopj8zV/Mv8Z7DVb3fn0F2It7teoMQz5b5mA9Chrs9AuPt+Bexdxoxvjn7VpIzMyN88bJnmb7R2jOJgISOIfKyrLxmC0+N/o2tUI4fHXSrfu47VxOSaZwLDIIhtf82bWLyqp+Npzd5p4opAeqo7YFtKQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38dbe53179bso1062189a91.0
        for <driver-core@lists.linux.dev>; Thu, 06 Aug 2026 23:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786083135; x=1786687935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmaMOn1E77zLCE2VFOMBiSvTaQ+1cOqxSJYgxhNCMNs=;
        b=Q0ZQquOrAkRB8dyQuULTSNDC6YsOJerONmfK9sBD3OImDLvLEXjgAjoiLFsg5t78OF
         bnRS33X7JFyfjzYWBxIKpHgGf54RpheQ4oiPbY5ovQwCYL6RQWTlYMsEGgcnuAnrzd3G
         eZrU5Pan8moygHM47bb3nXq6ambl0EGCp/yEB5TSe+9H/oWMEdf8InjAW6fzddN+k8Xr
         LHOuzcDWHyeHI+xbPiBx2sptfrV3unoqVLWnF//BEeiciiENl9t+okus4THKiFm28z8s
         BPHZXTKX/E09NqNgkDyM5IDB2O3rMJLkCH2RV/JsAD5/nWmyYF+csgWpFrKJOH39kUlI
         pFRA==
X-Forwarded-Encrypted: i=1; AHgh+Rqka4CSCP/EdYZIMNUZ53Uv1ZRVf/8reoI3hHOdkxXAvroDrxFMa06x0NVUU7+AzoBM8QV8vljGsr0h0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPIZnPmHPHK+/6yFZIRW1Wq1oSHfh0DCzQsZEOH6Yk6Zb8wU6e
	NZmGx0qt4lKskV4Ny6HALtwpl7LKtG6TSOUlkhNCvKUGbywztqcdN0ZW
X-Gm-Gg: AR+sD12FbvE9bV/D8SgiY9b1T2Q7glvLmXhG9GNefTj0jmVgBxXScIIPyWko/+6M4D2
	Y5M+IhyF7h//xSjXhKFqyuVYIUCAAiJJnNomg5Bu1XFREAFCyRoKjHthZHxK9LDyq2mhwV7jeTQ
	9ALZueiH3FQA5B64LwuO5iDgvON+ihFbnblHWE4UBNhwWkc+Q+pSdPOZiIbPVKByMYIZ31FJ0f/
	ATZERaqY7dBewwD3alIMYQVZ9H3x+qVJ7wl3WeJuxjnW8hlnhROym36wO8L7KcAGynitTz8LIgE
	z9kJtilM0zGGhVR65wU81acGAei/XqeulPtBYCzlfXvWstjoUSVJUQK4mWGdm41TcXIEsWDFtBY
	pbqH+fJWbj3XzoLZ3PF8+ojX6mFO0yIagtkOFcjWyWjmnInG5NnWZ9OqdVbnW9Avzv+DxJ4Z49U
	+M92qrENctG0s/TUKfs/OXKSzfgltsKMSMffhMcJ1QQrUW8A8LeCJ2MgwXUx9QTn2JJq/5r85ue
	sw7SC5PIQ==
X-Received: by 2002:a17:90b:3c84:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-3903c54ac31mr21765970a91.8.1786083135001;
        Thu, 06 Aug 2026 23:12:15 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dbe349sm3434375a91.4.2026.08.06.23.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:12:14 -0700 (PDT)
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
Subject: [PATCH v5 2/3] cpufreq: cppc: Refactor autonomous perf bounds into helper
Date: Fri,  7 Aug 2026 14:08:47 +0800
Message-ID: <20260807060848.832929-3-luoxueqin@kylinos.cn>
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
 drivers/cpufreq/cppc_cpufreq.c | 57 ++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 089f734f851b..09d7745a609f 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -868,6 +868,37 @@ static int cppc_cpufreq_set_boost(struct cpufreq_policy *policy, int state)
  * policy->max) rather than by hiding the hardware max in cpuinfo.
  * boost_freq_req itself is only created at policy init, not here.
  */
+
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
 static void cppc_cpufreq_sync_boost_limits(struct cpufreq_policy *policy,
 					   bool boost_supported)
 {
@@ -948,6 +979,18 @@ static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
 
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
@@ -994,20 +1037,8 @@ static ssize_t store_auto_select(struct cpufreq_policy *policy,
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

