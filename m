Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387066;
	b=IsRFsZAEpXGhPIpSvwLxXcVfwwH8MLtv2gUhf0PawASVJekTvgTgtukWkRKFnCMcCKJx
	 50fR5IGTT5qTVivhuftZUX4X9Ge2zvYCcWLykIAsohImbnXJlsbfRP39vgTbjTd9BwAtC
	 9XQD2UVRQjMWcT/wWc8B+ZokY9pbAkxoSCIPf+dilAxgnVJpd2JOBIsvaR3aBlhOaYydE
	 n1nz1n3aSmnO1m9W7CJImjofHHfkr+dixJMysXDcj5ABBMG3ucjmvKJtXI6rh3EIeTOCW
	 iT41GUPkzOWlhTFY9VB4974Hsy8uD3pof59xbiMQy8AnKPnTKP1Z4bEsk8xc/YIqdVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387066;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v3JRXipHaQsA2dpbPLLRBQxHUpuSS4w/ATARj/qhSxk=;
	b=JVopZRhw3nOzre2yU9jpnMK93CfI71GAJxVI+IU+o/9CtUNS3Yu82vSFoW7Zfojjz1JF
	 Urg/16B8gktb4pllx9JUsNBRSq6B3BFVEQooYvTPeJdjyu5s0gbOwnBfszfFH8khAHmJ4
	 JnX/jwzsHriCis7eT3WYIuq2Dd4jpld3KF6mWd5ULzMsqGxn7upj7nYPiRZ0usqaOs+4O
	 ZXOXC9nOuBQUGRvVXXl1YvVOJQKs9GumJRpncV7o7HCT5PfYr6Bshb4oSG79oBBJxsnrA
	 jMqJaSly+qywLqUGfCBuq0Ztx5XGm2j4OTYx/QnIsc0QDvbAzECaAZWaeVJlWhhbD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261C7606A32A
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 08:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 261C7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b14c80b210so768046a91.0
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 00:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387065; x=1794991865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3JRXipHaQsA2dpbPLLRBQxHUpuSS4w/ATARj/qhSxk=;
        b=qCosNcXSFJCHCWuN5hQ7rRgXz4QK6++g07u20b0S1JAgF6D3fe8RfvnWaaqbk1YGYM
         nPNWMP4bqq9ElNWT60BrwGb4290hU0UlgltMWsgv9eyYIqx3sNTzRa5X/eT8Mkmt4Fib
         UWqtXEzrNqSNbKqrBcYi+eyDlc5tbUCX7aj7SVLKG4doYdu5BfdKoPa+brtlMmopjHpJ
         SO2xwkS0Kt7MgOpGX+srneQu3NI1iL/r26Qz+80pctPAzmkbzIuCjfxTqk32zd243UfX
         jcWUB7pLJOx9b4f09HzP3p9t7UMuwXJMzAq8BersNGKbOfMbbgMOuHK1VCFrbbD0YZiD
         mEFQ==
X-Forwarded-Encrypted: i=1; AL+hErHBk1dC+lxkMyF4/zYx5P7fYnPzfkXuLUVXu6qIb4WH7/sd+uQUK2xhqJbw3IVzGJTeqTUazItlx+/kbQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+VsxgW+GsOneel+zS7xYbiOj0Pff4eMbw5d5TDwGiapEGZU8WZ
	Yv7FqmemEWBgBiYTOnq8zebkFIB3ZdmkKMAi9Gjl1ty/eGMM/NTLo6su
X-Gm-Gg: AYBFou3gOjc56Z1d4QRIyHI2Pz+cXuPfaVtHuBQPW812zJUy1RyMICaGNgeAiMlLdsK
	kWr0RtRISA2aj/6W6k/HxI9UAxKPu6ui9m5cBpY4/QrVJsZiKGPikUbmBXiOcFV5XgJSbR4jBIw
	ZiUrajVehbIv5XvgDu/EOqSSbMrdGmzFU8gaFrPVwWavR8qBhq8hq+jAVnh8W9dFoQuwnOaBtmd
	5nZeQBIrYEfCzegbqOGV2I90jbbymVNpSIebdFUglf2+xicsJoreCRAnLTS4cBC2d2xvkPSXZcY
	oFQmtN+l9yh7XEB3DXtWHh53RJeH8juGFzxp3E0s8JbF+d2nb2Rg0BaKOHiK4O5F6rcK/m8eh6a
	XYbiFh4kRILNBBJ3b+VnmLOPw6Gyp0oOfQoJiPJHPBVUw2gn3UcYOWPLiVGwPKU+JZYIFEp1U12
	eicWY/PbkxlAzXuc6WrXFqv+iVrH/SXpWhMt52nh93ggadLkoG0xyk92lBi8mtr6RImh6w8odSW
	vbMvRkPAvvb9+GgUo6aNtLVOs3wWGA+xOxCwzUOZUpD3Y7MXPZBXjfrZw0ezVRiKBDRgxvJUhUd
	kUHHUC9UeNLlwJG8VSg8+9p0cCta6xIMSVVFSptSYIY+v3+SPno=
X-Received: by 2002:a17:90b:4c4c:b0:3ab:be66:ddb6 with SMTP id 98e67ed59e1d1-3b182eec040mr1437917a91.20.1794387065472;
        Wed, 11 Nov 2026 00:51:05 -0800 (PST)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm2396406a91.4.2026.11.11.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:51:05 -0800 (PST)
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
Subject: [PATCH v6 2/3] cpufreq: cppc: Refactor autonomous perf bounds into helper
Date: Wed, 11 Nov 2026 16:50:21 +0800
Message-ID: <20261111085022.1229866-3-luoxueqin@kylinos.cn>
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
 drivers/cpufreq/cppc_cpufreq.c | 49 +++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 3bca30f5c0d5..7dab6e046b9f 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -868,6 +868,29 @@ static int cppc_cpufreq_set_boost(struct cpufreq_policy *policy, int state)
 	return 0;
 }
 
+/*
+ * Program the autonomous MIN/MAX_PERF bounds from the current policy
+ * limits, restoring the previous bounds if the write fails.
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
 /*
  * Boost being off is enforced through the boost_freq_req QoS request
  * (capping policy->max) rather than by hiding the hardware maximum in
@@ -961,6 +984,18 @@ static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
 
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
@@ -1008,20 +1043,8 @@ static ssize_t store_auto_select(struct cpufreq_policy *policy,
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
 			cppc_set_auto_sel(policy->cpu, old_auto_sel);
 			cpu_data->perf_ctrls.auto_sel = old_auto_sel;
 			return ret;
-- 
2.43.0

