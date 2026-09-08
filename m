Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46A472F8B
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856280; cv=none; b=lw4eejgyoEXcQ7LeG1Q3FTgctpXFW8fTrhyUtJmpSVH6WC+JcNX+MkGDNo3/xFpCKIDxNlhnrBO/w7l6NNtipY2i1pSK4ErtIKbJkUAJpNCkjvJPWvKGUYH9+PToRkZ74Jo/qM5On2Ihz7+966mST7U3Fh9Wp5fba8eh0ka9zyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856280; c=relaxed/simple;
	bh=K0Jqcu6iMw3kPQLw07nU3dgEc+RfrtZg3NeaZIDm+rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHDsBB0X5N40Bbvz5KOh0eb39PRmMEIU5SzKstkz0jHqpNkm9QyAlN4ExX2ayKkcEBtfFnV6etNuWpb653ySqoYI4221nOzxUXM3WBHJgNaFmIBuIyCTIOZ/uqEG/8a1z2B+p4ulRKQxusMsV7mhzdz0o8QXlxrypFjgo+bol5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2TGJ0Vw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bP8h7QX6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2TGJ0Vw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bP8h7QX6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M9ci1521747
	for <driver-core@lists.linux.dev>; Tue, 8 Sep 2026 08:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7bGYpclRSIBS3LW8im3saKqNsoRXecyOy64DApXOHY=; b=D2TGJ0VwOMellRoo
	d5+n/8ZrXOGMnv1E1S7PelFzj3l6FYwzxv44nFXExX/kK6Sbz0KkL5WWsImBf0Ab
	LBU4WMjyO8vnaDwmu4gYNrwJuv4Qb9Tuv32+clNeIw+ai+++4amrrsTpEnspA2pm
	+rEfX6bVDWZ7KGPt4xLVwmF3+mF5HtqzGYHuXflZQM14En3vECgovCY0L1b+LNOX
	JT+2aLqAqGVh2lSJ5+fbyruN783riokQOSQcwsWOf3Z1CaGTdVuRaKzKWzPAOaaO
	EEGx8kKQNgqrbyiJ0etNJrU/mo9R5WRaLDoTZgYQAN2A/bCIsaTOFe45AJi7MrId
	iX3dHw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077jsn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 08:31:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1147260a91.2
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856275; x=1789461075; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7bGYpclRSIBS3LW8im3saKqNsoRXecyOy64DApXOHY=;
        b=bP8h7QX6iIqdgod54PLBbveTODptbliWMf2fEdA4BdvkysCRJ6mDZPklt/8OcN6G66
         nfimWIK5+yOVX0dekWn620dBK1QQvqAcEwM9yJOrcAj7IFbPngtQd98APVONM4Kb5MbB
         A7XVvbRJKyE++VnR5v2wf0hl9NKA6qGd7tHMwEpLJ0MgW67f65SG9bRXUrDNXPSYo3CD
         noiywo70We8C2OWipWN5iQRvS5nQ+VtdRAtArRbxy27XaJgIYS63oIY+yUcDyn8BKUC3
         LXqc8n0lx25FtU+PFElmY956Q0evjLJzRJPr04yM0ZDnzUDMhWJouigGlLRA4MJcHDD1
         Khrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856275; x=1789461075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7bGYpclRSIBS3LW8im3saKqNsoRXecyOy64DApXOHY=;
        b=m/P1BYb6ZV5v+WQk9QU4MR96Aw8KGC/Cs/qBvpL3ilSu5Uw8Vu2qUI/tJ0awZuQGGs
         z3aFZgqD9InKAf0eMvQVcfuIG0c+IgFPmvI6CvGSQbbx4UJGblh3Scyb31sSrqXJGaD3
         5Qif2f8I899rB5V4ExrzqZRWGs8HV/flNU6g6u/B8qrBMhksgdJSlM4wFQWXsKtOGmZn
         x0mhODrJv6PXQnld0/yCerRRO0ELmpn2aPiomUFtuIPbp74lo/Wzh93kTSaplPVQ5Ba6
         lgRrxZ9wBwX+qc+XXStLU62up1vW7CX+iybzRlwcF4nmwj6D+zIwEV9uxYuMnk9ptIAb
         z1SA==
X-Forwarded-Encrypted: i=1; AKwUvBz1iM2amb5gyfYkywtwmmxxJo0xr0yDbXLt3y54F3UXLubBLeQ+t/oSexJInVoA629DuPnVnRAx+fNe1A==@lists.linux.dev
X-Gm-Message-State: AFuF++l4bbnhF3h6PIPz3SErkBIV60CzbpA5PqAaFn3s+B4swNjEFeGm
	6E8+W6aO3+LYluNnVwsKmniFBFgg+dXygzJV3qGYGwXl2pCBKXIJo3KdjIs1r6iYICBlKmbTILY
	yrbgXrTctJz+gK/IAja/hyrtN4IxyQ4Uw18W4QJAfuVAlbwcjOu8kukIndecyIhY6slpDLyFDwg
	==
X-Gm-Gg: AYBFou1XugPGmA3+kNzWNf59U79rZrEnecaeT2elf4mjfrkDuwNjSCYktaGIUU5zmR/
	435oQe/Ix4rVEhmwngo1zLJ6otOX1oZupuyLbtNSt8pgh///sAawxysCOLqXqRtI6NBTdBUTwbc
	Qi23767w/NuwmrVMbEmJOcoiqxzXtnj7WN7vuaw+zQZFc5hlHQaLYKyWTkljCAUG6r4TLp0b0SI
	3F1I7God8QhZWpJkaLkEA7VoWT+zMH2kiY960o2EYaVxQvxlfdTgwMW+ADpK2q348ajoNdEComP
	thoQa9F6lJS7HZ4e1tKiQTP+uHD1rHtL9ms7Y+K0LkqRmXSpXQxV7SpCH7kpY2cdxrqMP+xZEYV
	bQupm/rOmxZgTl/Kd5QUqfxJZQI28pPQNKi3ZwsJ7LW+JJ0qQ814HFfy63kWPSFWpKiU4rpNing
	O4Z31W5bXf/6lmKPs=
X-Received: by 2002:a17:90b:580e:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-39b25ee242bmr39317872a91.0.1788856274683;
        Tue, 08 Sep 2026 01:31:14 -0700 (PDT)
X-Received: by 2002:a17:90b:580e:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-39b25ee242bmr39317828a91.0.1788856274197;
        Tue, 08 Sep 2026 01:31:14 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm34458641eec.27.2026.09.08.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:31:13 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 14:00:28 +0530
Subject: [PATCH v2 1/2] arch_topology: seed capacity_freq_ref with
 boost-aware max freq
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
In-Reply-To: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788856266; l=3317;
 i=ananthu.cv@oss.qualcomm.com; s=20260903; h=from:subject:message-id;
 bh=K0Jqcu6iMw3kPQLw07nU3dgEc+RfrtZg3NeaZIDm+rs=;
 b=iPjJZVEcGt28pqL7LCCRww1bUy4MNe2vsZJkVHCywrOli4vGSOgaKJYiiGctaKkuYm7gHHIXr
 0fMqlN8duvKCN3/+krOMZidWCSYS9MOMkQdSRAIQw9ELK3pVdXloS2H
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=gutNfLSMVTRkB+MxVviMFq9I07C5qPe9xHY2J5XCMpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX3NlaNwV5Om5+
 eQkWMredVhV4KznmAow4Sg0OAs0weDKwvP2Kkz54536lTitr6yuj0dniJqTcps1pTkCj+umMeXO
 sE90Z3de6DHDfFVElAhNNNKDXhRYR+MUKIu+/p+FVqh4/0Rahb+/ST2WgrNAYXXwE/S2JkYh6IA
 diMGwoG+xhUUrmsOmb/fN3mgbpJqoK4SZ+PCBq5W3wSreBQYIv90qgeb9hsE8ZQpT9g1aheL+ml
 LbnF/f1iRoeZ7htMJpoRdFb186Xb59hjS6mR9WK+LP3rVS2CGL3I101iQI66DL+tettyQXlVTlP
 xFUs8wXRL8HS5Qgty1dpJOj+cv6GeiIN5XK8S3nA4HuWlIkuZRnONIPExseb33AfjVn/inCz7B3
 MMoNlQDOie4wgek0yCJp8x+3v2AMLT/Tvw6bw7HtTnhHPjXnIH0uZXQd6e5BK8W9vhYDLLj/NIS
 w8LRnKyH0EGidhh45sg==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fc7d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=36zNjiBI7bMVG0EHEW0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cPW6iZlFj_6ptoThkQ61JRhRk3pMNEIe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX8lvSSFUxRu/j
 mlqGOrlGG/b8+xqSRCriJRK5Y9nBv5pdulNMjqwtuYTCKbwa7LC9ULRGtV5ZUaw5AjRsazDmUyd
 4WIPqwdPlNnJGHVml0KpDy11O3xP60w=
X-Proofpoint-GUID: cPW6iZlFj_6ptoThkQ61JRhRk3pMNEIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

capacity_freq_ref, the per-CPU frequency-invariance reference used by
schedutil, is seeded from policy->cpuinfo.max_freq at policy creation.
If boost frequencies are filtered out of the frequency table because
boost isn't yet enabled at boot, max_freq only reflects the non-boost
ceiling, so capacity_freq_ref never learns about boost frequencies for
the policy's lifetime. Enabling boost later raises policy->max, but
capacity_freq_ref stays stale, leaving schedutil unable to scale
utilization or target a frequency above the non-boost maximum.

Track the highest frequency in the table regardless of boost state
(max_table_freq) and seed capacity_freq_ref with max(cpuinfo.max_freq,
max_table_freq), so the invariance reference is boost-aware from boot
regardless of whether boost is currently enabled. Runtime enforcement,
still handled by policy->max, is unaffected.

Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/base/arch_topology.c | 3 ++-
 drivers/cpufreq/freq_table.c | 6 ++++++
 include/linux/cpufreq.h      | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..da94f77441da 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
 	for_each_cpu(cpu, policy->related_cpus) {
-		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
+		per_cpu(capacity_freq_ref, cpu) = max(policy->cpuinfo.max_freq,
+						      policy->cpuinfo.max_table_freq);
 		freq_inv_set_max_ratio(cpu,
 				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
 	}
diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index ea994647abc8..4984142dc08a 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -33,11 +33,15 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 	struct cpufreq_frequency_table *pos, *table = policy->freq_table;
 	unsigned int min_freq = ~0;
 	unsigned int max_freq = 0;
+	unsigned int max_table_freq = 0;
 	unsigned int freq, i;
 
 	cpufreq_for_each_valid_entry_idx(pos, table, i) {
 		freq = pos->frequency;
 
+		if (freq > max_table_freq)
+			max_table_freq = freq;
+
 		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
 		    && (pos->flags & CPUFREQ_BOOST_FREQ))
 			continue;
@@ -57,6 +61,8 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 	if (policy->cpuinfo.max_freq < max_freq)
 		policy->cpuinfo.max_freq = max_freq;
 
+	policy->cpuinfo.max_table_freq = max_table_freq;
+
 	if (min_freq == ~0)
 		return -EINVAL;
 	else
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 35ce665edfd8..3f3b1380251a 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -45,6 +45,7 @@ enum cpufreq_table_sorting {
 struct cpufreq_cpuinfo {
 	unsigned int		max_freq;
 	unsigned int		min_freq;
+	unsigned int		max_table_freq; /* Highest valid frequency in the table */
 
 	/* in 10^(-9) s = nanoseconds */
 	unsigned int		transition_latency;

-- 
2.43.0

