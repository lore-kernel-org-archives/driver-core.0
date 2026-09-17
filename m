Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298B2501F5E
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649514; cv=none; b=IbdpHb8Y2AmF0e64tn49BRwlIaroRTF8JeXBrrzeQtWFFSAv8M1om+JOGr7+4y43YdVFK/m2hmNbu1/hzb8RFyVHdKkHpPRadIkxDRRBSXhNVk58GpztpxChrqEwNKQya6DSzrGg79EuXypEy15Ry4NgkViSGlABeS9X3FWJH3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649514; c=relaxed/simple;
	bh=9OmuWBvelp9lDciabV7GiixARHZSbiIlS541rWDiTO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRf5VOUmWduB2fHXzHT3k1f9IqqPGr5bGp1fnvFSjD6y1uRTCSodchhEXJredKZk74oeA2H2QodfMpON5iKTXJXyykL69A8B1rO/Jjxg2Zxq+RJ8Z/hx7L5tpUlMEme9uE3jpkBmfrkCt7jZ7GKlLy/bkCisyCF65dHqDTiw934=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMYLoBsp; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMYLoBsp"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso7570605e9.3
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789649483; x=1790254283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsBJ75Nos/JKeIDPM3xGBy+cj9I+X9kBPg+21akMtHI=;
        b=HMYLoBsp3sOXG9qIoYnaa8Ee7JcwaOuXbR8647/RTrPirz1XJ3YYWy5vqqzeVTx17a
         eiLIG6WxfzggMdaimWvp2nrTcqFvZp4HZsC+4tqvenE0zlW7v2+39XsChYbG83iCdcpQ
         msEkRuDJloX1cMMxqZtmhLg+5GBuQAmtm4yraDdqlvA4BDTHwSmrr6TFLaCLP8AaHwYb
         FstzoFYJ6xRKKMRvk6OShm62jKXo7BV2/2MB9m/67x5iVvHr9R422bAwI8M6Pm7Be7n1
         4VypS4o/V/EuMmfEfv8gIE/9WmyneSllWhTJAtV6Aiz2t8O+2Fhvte9VKS4mhWSd1Fjf
         e+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649483; x=1790254283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fsBJ75Nos/JKeIDPM3xGBy+cj9I+X9kBPg+21akMtHI=;
        b=nDVFLWpPRod5tfilIZa6X3WOode6kPnbz6kThyIcWr1L659S9WWwG5N0DpVR8zO9Fv
         RaR2cOPqgptwC9NQfoXSQe/Ckp2ZAHALjRQZ55gMjT+V8Br1MOoKXtflzCT1sjEy2tSW
         RuIjYbvakDKhjDPxf9tG2YjQbDSL7DQrLl6O7R+mBEzwSsIGDVFVdZ8c+ghS7aOGGyZ+
         HOsqnRvC5F2FfxlXthBTc5XESuFYU3am9rhgLTOWj9sv7FkI4cbEmo4wjqtoO/QAKkxf
         Cf72+lZ5/JPwmDTcg6jJOteemoIGpDDd2XepAIDa4EgPHFOCKzBMHZHJ5Ojb8U3QsfW9
         Rx9g==
X-Forwarded-Encrypted: i=1; AKwUvBwZJ3tutyl3CRyP2CusQ9ICFUFh0sM18ADhAyfH7Zf9pUShqDUepIEJZGya8SwZMnsH+iMu2Wbi61BLaw==@lists.linux.dev
X-Gm-Message-State: AFuF++m8Q4qCoYAgGAXbq2Ys0ct1RfUB4uZuFS3YFHotR3Mbx2S2+Nn8
	wyU6i2T8DjPgAoRbLIz82a/234JRJfat5xomgn4F82AFZkSla+5LzHnp
X-Gm-Gg: AYBFou219C4PzTdz7QvUJJSX2viWoewcmuYHx9d+A0bCpe0PxMhm2L3QPco4ozRFjpa
	IccB4EKUR0YndU2SgBt8Csk3xkGz53Ywa1xgp7AyFYykktaozVVPYQn+4rUSzbwm0Id+3VyGlSb
	NYmj//TpbUjm1xDZ9Tf4cjli3wElCEt/AKvwo+3sur8+pP0ZPpOd3aJ9bKZpCgU35fiEHtViTWr
	FyHxy3TypUCn7n2vyK5yFOiM0dUm8zwaLM7zYcIF1c9kby+7rzt0tqz4vjEjVHjFStfl/MmECZj
	gBcZFXnnrGMeWJs0hljpJ/ibwUyq/c1//i2a58V2PMxPKe6TRrTMfdfTfVlt91+SLXfjmgpLy0M
	d7iAYWAbNhlESC3ZtrkgHIENlSjbGAbcdaaiEjxNxyDrUd61O+UY2Uk0I+DcEU+vFCeF2flgXdy
	dB1Nxvst1gnO1g7HA9F+ASB1q/NnGWDFZ19pboWj7sznlSsf027s1ckLeIrB0066GYH7RDGsbr8
	dBegJxk
X-Received: by 2002:a05:600c:83c9:b0:49e:7caa:e7b2 with SMTP id 5b1f17b1804b1-49eb733800amr66060375e9.29.1789649483005;
        Thu, 17 Sep 2026 05:51:23 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm86555015e9.3.2026.09.17.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:51:22 -0700 (PDT)
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
Subject: [PATCH v4 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 17 Sep 2026 14:51:11 +0200
Message-ID: <20260917125112.2283-2-okerixx@gmail.com>
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

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Use cap_scale(), which the scheduler already has for exactly this
capacity scaling, so the multiply and the shift stay in 64 bits and
only the final value is narrowed by the return type. Move the macro
from the scheduler's private header to <linux/topology.h> so it can be
used outside kernel/sched.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm64/kernel/topology.c | 5 +----
 include/linux/topology.h     | 2 ++
 kernel/sched/sched.h         | 2 --
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..07b8c497c9e6 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -186,7 +186,6 @@ int arch_freq_get_on_cpu(int cpu)
 	struct amu_cntr_sample *amu_sample;
 	unsigned int start_cpu = cpu;
 	unsigned long last_update;
-	unsigned int freq = 0;
 	u64 scale;
 
 	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
@@ -245,9 +244,7 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
-	return freq;
+	return cap_scale(arch_scale_freq_ref(cpu), scale);
 }
 
 static void amu_fie_setup(const struct cpumask *cpus)
diff --git a/include/linux/topology.h b/include/linux/topology.h
index 709a2dcf4c73..0a4ee12a98d5 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -351,4 +351,6 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
 
 void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
 
+#define cap_scale(v, s)		((v)*(s) >> SCHED_CAPACITY_SHIFT)
+
 #endif /* _LINUX_TOPOLOGY_H */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c3ad70e58b8..45796fccdc84 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -236,8 +236,6 @@ static inline int task_has_dl_policy(struct task_struct *p)
 	return dl_policy(p->policy);
 }
 
-#define cap_scale(v, s)		((v)*(s) >> SCHED_CAPACITY_SHIFT)
-
 static inline void update_avg(u64 *avg, u64 sample)
 {
 	s64 diff = sample - *avg;
-- 
2.55.0

