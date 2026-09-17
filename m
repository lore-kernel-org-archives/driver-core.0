Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3802509F0D
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649498; cv=none; b=REjWtCi0WrAcftwcPx/npoetwp3nSPXyHI9l+6CpjnWiY01MPo7rFLJZrdwRPf4OIK0D1edBAMcPaE7zoJ/tNxoQd8CajB4c0Oi4qkLu1QEP/CwGhA4terpEMFDg294rZYOt4k2ajzS5N+qnNId8ayzypSe2OTpT9WF/UuumbsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649498; c=relaxed/simple;
	bh=EdyvNUGzZQfOCichJt6a2G8qG+Z+dq696yNIz94RDV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYvwTION9EuxX9s2uKk3rSPFW0SyYJkN9LshvOHu+a6iLPvg/xBRpN7oBhbxoCm9LmpfqNVdUetp28kwbEP9qS+oJOtI8aAqnM2a/FfKeT6Rb1vHS2MKvECdkgQzscRrUBOwiAM5QYOXeR1fJTQT9pn2JKRT1/blUKLfhsMo4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLyXObkv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLyXObkv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so4225445e9.1
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789649484; x=1790254284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SuwmjuHNbGK5+6CI3MWKqt2Q2NhbCap9Z5LDmt81Ho8=;
        b=FLyXObkvoakvI7F5+WFRzGH6k71rpfW2JFlszbbwj13HMB37f9aZVas+t5xAgD+adM
         V33DEehI7c7vGu4Xrle7vVQhx3evXqrgnCPqiExiYHYasKdDEyPDGp450iAGt+G0FcRk
         VKckNcZE1+16Knp7uRAXIVt8amNFViQFSViiMmZrdyTQdIQnmkwRZbw1fSERk3k9lswV
         +arW2Opc/8naEWHfXtPHjjaTaQ8U/IY3eyFsf45OMo/96HfdeaK1fz+vIDV05/UTaAyj
         Ihyi1TA0Cf0giG3BHla8z0AI1EQuTDEPAitefKHGwPRmRR9Y2rUFMFprDWg3dqURP2EB
         JoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649484; x=1790254284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SuwmjuHNbGK5+6CI3MWKqt2Q2NhbCap9Z5LDmt81Ho8=;
        b=He3VzwGH/KOQyQOY/mWEWxEw0TkW4zTP5nfLMxNdakoAMZDMa9I/eKi93nJ4ZjTqKa
         swc2DnUQ1fMnqZJ85vlGTbvCzx4y4/JWHTjGLoDE1hS9tnpVks73dUHy9HFXlgjGmXTn
         rRuEfYJBpg29F4Vhw7pm0u1YNa7s9Kwuc9otJE7rx37UUwk4rcRd+vg+Xo1IDMnmOe6v
         8pkn4aziMI1yJYkhV9aRpQSoE2rE2z/WAJGIiVqk6C/pBWwGTnsC3Dg1f2auwfezc+aw
         OH4s4FMxQBdKOc+INsod1lALjLpiGJkV8aTSwP5Vm+jbhnkgXYU3qmr4Q3YJP+Pw3uXR
         ksOg==
X-Forwarded-Encrypted: i=1; AKwUvBzhCoIsCwA5BKVFP6FXOWVB+rMZj9TXz9yzQg5PCntZzUA9zQ9u4nCC+0zOoOtCbEuCaBC2m0lPcTJDFw==@lists.linux.dev
X-Gm-Message-State: AFuF++neFbVjqv1z+1OQt6pIyziMoUGApKZmLSPwdSTC+WUX+qbd2mUA
	Q7ZhiT9QPRqUiIMge0bss7Ue94LdndnCn3zJHvXf8WbpwAhD7plSK++p
X-Gm-Gg: AYBFou21cbqRCrFut7hksKGL5EJ6a8pK4BFN2vxmMt4dCqpWhzXpRmcGB+EwXYr1Br5
	T67h6vv5xZTquDFrqjLnLKT3G48RiLge28909lxCs4Sj6e+KM1BRm6sGeC7DIpiLEzi3otPPX9h
	7KRY/c1s6q2OF4camAZTHOqccfO442Qs59PWHckEz1o9L8G9bfp7qPUEM22qX+Mkl0p6nFlTzef
	o1sLYY3j7Gmdvqmno415UpTGMQ8ls7wSoMEZj1Qjglv1Q6j+pdjPoxL7f1gHk+WLtpVS6B47Mxa
	y4PTaz2YQrQEHtkyRvitfVAo9HlP4zXxTCb9Usay/851/S8s4FtCFnpgS14fBsjWA33fd9jYr2N
	5MsjZouY4HyVN3lHaKztZ8NEHWSy1wz+p7oHB4XPK4Cg3Zyzb6YFfzTWMBDjPEEuYdQmKKP3cvo
	GGNoYaqJkEfOG77XobENyL52e+iVoeB0VwyWbMsCEcYqfc6GU3DDkwv8UjC090bpgmCR7kXoiNe
	YQnT15L
X-Received: by 2002:a05:600d:4442:10b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49fbd1e4f0amr32449375e9.13.1789649484234;
        Thu, 17 Sep 2026 05:51:24 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm86555015e9.3.2026.09.17.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:51:23 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 2/2] arch_topology: use the boost frequencies for capacity_freq_ref
Date: Thu, 17 Sep 2026 14:51:12 +0200
Message-ID: <20260917125112.2283-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917125112.2283-1-okerixx@gmail.com>
References: <20260917125112.2283-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

capacity_freq_ref is latched from policy->cpuinfo.max_freq by
init_cpu_capacity_callback() on CPUFREQ_CREATE_POLICY.
cpufreq_frequency_table_cpuinfo() excludes CPUFREQ_BOOST_FREQ entries
while boost is disabled, so on a system that boots with boost off the
reference is the non-boost maximum and stays there.

Once boost is enabled the CPU runs above its reference.  On arm64, where
the AMU drives frequency invariance, amu_scale_freq_tick() caps the scale
at SCHED_CAPACITY_SCALE, so the scheduler cannot tell a boosted CPU from
one at the sustained maximum, and arch_freq_get_on_cpu() cannot report
above the reference, so cpuinfo_avg_freq is pinned to it.

CPPC based systems do not have the problem: their reference comes from
highest_perf, and a disabled boost shows up as cpufreq pressure.  Do the
same for frequency table drivers and take the highest valid table entry,
boost entries included, as the reference.  With boost off
cpufreq_update_pressure() then reports the difference as pressure.

On a Snapdragon X2 Elite (Glymur) laptop with a 4032000 kHz sustained
and a 4723200 kHz boost OPP this moves the reference of the big cores
from 4032000 to 4723200 kHz.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/base/arch_topology.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..300f64ffea2f 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -386,6 +386,20 @@ static cpumask_var_t cpus_to_visit;
 static void parsing_done_workfn(struct work_struct *work);
 static DECLARE_WORK(parsing_done_work, parsing_done_workfn);
 
+static unsigned int topology_policy_max_freq(struct cpufreq_policy *policy)
+{
+	unsigned int max_freq = policy->cpuinfo.max_freq;
+	struct cpufreq_frequency_table *pos;
+
+	if (!policy->freq_table)
+		return max_freq;
+
+	cpufreq_for_each_valid_entry(pos, policy->freq_table)
+		max_freq = max(max_freq, pos->frequency);
+
+	return max_freq;
+}
+
 static int
 init_cpu_capacity_callback(struct notifier_block *nb,
 			   unsigned long val,
@@ -404,7 +418,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
 	for_each_cpu(cpu, policy->related_cpus) {
-		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
+		per_cpu(capacity_freq_ref, cpu) = topology_policy_max_freq(policy);
 		freq_inv_set_max_ratio(cpu,
 				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
 	}
-- 
2.55.0

